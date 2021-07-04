#ifndef MYOPENGL_H
#define MYOPENGL_H

#ifdef __APPLE__
#include <GLUT/glut.h>

#else
#include <GL/glut.h>
#endif

#include <stdio.h>
#include <stdlib.h>

#define HISTSIZE 256

typedef struct {
    unsigned char red;
    unsigned char green;
    unsigned char blue;
} RGB;

typedef struct {
    unsigned char red;
    unsigned char green;
    unsigned char blue;
    unsigned char e;
} RGBE;

void init(int argc, char **argv);

void display();

void drawHist(float hist[]);

void keyboard(unsigned char key, int x, int y);

void mouse(int button, int state, int x, int y);

void arrow_keys(int key, int x, int y);

void reshape(int w, int h);

void buildTex();

#endif // MYOPENGL_H
