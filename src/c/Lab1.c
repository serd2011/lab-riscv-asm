#include <limits.h>
#include <stdio.h>

#define N 6
#define M 6

int maxRow(int nrows, int ncols, int matrix[nrows][ncols]);

int main() {
    int matrix[M][N];

    for (int i = 0; i < M; i++) {
        for (int j = 0; j < N; j++) {
            scanf("%d", &matrix[i][j]);
        }
    }

    int result = maxRow(M, N, matrix);

    printf("\n");
    for (int j = 0; j < N; j++) {
        printf("%d ", matrix[result][j]);
    }
    printf("\n");

    return 0;
}

int maxRow(int nrows, int ncols, int matrix[nrows][ncols]) {
    int maxI = 0, maxSum = INT_MIN;
    for (int i = 0; i < nrows; i++) {
        int sum = 0;
        for (int j = 0; j < ncols; j++) {
            sum += matrix[i][j];
        }
        if (sum > maxSum) {
            maxI = i;
            maxSum = sum;
        }
    }
    return maxI;
}
