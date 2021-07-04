#include <math.h>
#include <string.h>
#include "opengl.h"

void process();

void carregaHeader(FILE *fp);

void carregaImagem(FILE *fp, int largura, int altura);

unsigned long getFileLength(FILE *f);

float mappingFormula(float rf);

float gammaCorrection(double rgb);

int validateRGB8(int rgb, float ia, float i);

void allVectorsToZero();

float getHighestValue(float a, float b);
float getLowestValue(float a, float b);

unsigned char header[11];
unsigned char showhist = 0;

RGBE *image;
RGB *image8;

int minLevel = 0;
int maxLevel = 255;
int WIDTH, HEIGHT;
int sizeX;
int sizeY;

float GAMMA = 1.2;
float exposure;
float histogram[HISTSIZE] = {0};
float adjusted[HISTSIZE] = {0};

float Rf, Gf, Bf;
float Rt, Gt, Bt;
float Rc, Gc, Bc;
int R8, G8, B8;

void process() {
    float expos = pow(2, exposure);
    RGBE *in = image;
    RGB *out = image8;
    for (int pos = 0; pos < (sizeY * sizeX); pos++) {
        unsigned char mantissa = in->e;
        unsigned char r = in->red, g = in->green, b = in->blue;
        float c = (float) pow(2.0, (double) (mantissa - 136));

        Rf = ((float) r * c) * expos;
        Gf = ((float) g * c) * expos;
        Bf = ((float) b * c) * expos;

        Rt = mappingFormula(Rf);
        Gt = mappingFormula(Gf);
        Bt = mappingFormula(Bf);

        Rc = gammaCorrection(Rt);
        Gc = gammaCorrection(Gt);
        Bc = gammaCorrection(Bt);

        R8 = (int) (Rc * 255.0);
        G8 = (int) (Gc * 255.0);
        B8 = (int) (Bc * 255.0);

        float I = (float) (0.299 * R8 + 0.587 * G8 + 0.114 * B8);
        histogram[(int) I] = histogram[(int) I] + 3.0;

        float iLeft = getHighestValue(0, I - minLevel);
        float iRight = (float) (maxLevel - minLevel);
        float Ia = getLowestValue(1, iLeft / iRight) * 255.0;
        adjusted[(int) Ia] = adjusted[(int) Ia] + 1.0;

        R8 = validateRGB8(R8, Ia, I);
        G8 = validateRGB8(G8, Ia, I);
        B8 = validateRGB8(B8, Ia, I);

        out->red = R8;
        out->green = G8;
        out->blue = B8;

        in++;
        out++;
    }

    allVectorsToZero();
    buildTex();
}

float getHighestValue(float a, float b) {
    if (a>b)
        return a;
    else
        return b;
}

float getLowestValue(float a, float b){
    if (a > b)
        return b;
    else
        return a;
}

void allVectorsToZero() {
    float h0 = histogram[0];
    float a0 = adjusted[0];

    for (int i = 1; i < HISTSIZE; i++)
        if (adjusted[i] > a0)
            a0 = adjusted[i];

    for (int i = 0; i < HISTSIZE; i++)
        adjusted[i] = adjusted[i] / a0;

    for (int i = 1; i < HISTSIZE; i++)
        if (histogram[i] > h0)
            h0 = histogram[i];

    for (int i = 0; i < HISTSIZE; i++)
        histogram[i] = histogram[i] / h0;
}

int validateRGB8(int rgb, float ia, float i) {
    int k = ((rgb * ia) / i);

    if (k > 255)
        k = 255;

    return k;
}

float gammaCorrection(double rgb) {
    rgb = pow((double) rgb, (1.0 / 2));
    return rgb;
}

float mappingFormula(float rgb) {
    rgb = ((rgb * (2.51 * rgb + 0.03)) / (rgb * (2.43 * rgb + 0.59) + 0.14)) * 0.6;

    if (rgb < 0.0)
        rgb = 0;

    else if (rgb > 1.0)
        rgb = 1;

    return rgb;
}

void carregaHeader(FILE *fp) {
    fread(header, 11, 1, fp);
    printf("ID: %c %c %c \n", header[0], header[1], header[2]);
    WIDTH = header[3] + (header[4] * pow(16, 2)) + (header[5] * pow(16, 1)) + (header[6] * pow(16, 0));
    HEIGHT = header[7] + (header[8] * pow(16, 2)) + (header[9] * pow(16, 1)) + (header[10] * pow(16, 0));
}

unsigned long getFileLength(FILE *f) {
    fseek(f, 0, SEEK_END);
    unsigned long fileLength = (unsigned long) ftell(f);
    fseek(f, SEEK_SET, 0);
    return fileLength / 4;
}

void carregaImagem(FILE *fp, int largura, int altura) {
    sizeX = largura;
    sizeY = altura;

    image = (RGBE *) malloc(sizeof(RGBE) * sizeX * sizeY);
    image8 = (RGB *) malloc(sizeof(RGB) * sizeX * sizeY);
    fread(image, sizeX * sizeY * sizeof(RGBE), 1, fp);
}

int main(int argc, char **argv) {
    /*if (argc == 1) {
        printf("hdrvis [image file.hdf]\n");
        exit(1);
    }*/
    init(argc, argv);
    FILE *arq = fopen("../memorial.hdf", "rb");
    carregaHeader(arq);

    printf("WIDTH: %i\n", WIDTH);
    printf("HEIGHT: %i\n", HEIGHT);

    carregaImagem(arq, WIDTH, HEIGHT);
    fclose(arq);

    exposure = 0.0f;
    process();
    glutMainLoop();
    return 0;
}
