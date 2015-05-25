'use strict';
var gulp = require('gulp');
var $ = require('gulp-load-plugins')();

var config = {
    sassPath: 'app/sass',
    cssPath: 'dist/css',
    coffeePath: 'app/coffee',
    jsPath: 'dist/js'
};

gulp.task('sass', ['clean:css'], function() {
    return gulp.src(config.sassPath+'/**/*.scss')
        .pipe($.sourcemaps.init())
        .pipe($.sass({
            outputStyle: 'nested',
            precision: 10,
            includePaths: ['.'],
            onError: console.error.bind(console, 'Sass error:')
        }))
       .pipe($.postcss([
            require('autoprefixer-core')({browsers: ['last 1 version']})
        ]))
        .pipe($.sourcemaps.write())
        .pipe(gulp.dest(config.cssPath));
});

gulp.task('coffee', ['clean:js'], function() {
    return gulp.src(config.coffeePath+'/**/*.coffee')
        .pipe($.sourcemaps.init())
        .pipe($.coffee())
        .pipe($.sourcemaps.write())
        .pipe(gulp.dest(config.jsPath));
});

gulp.task('clean', require('del').bind(null, ['.tmp']));

gulp.task('clean:css', require('del').bind(null, [
    config.cssPath+'/**.*'
]));

gulp.task('clean:js', require('del').bind(null, [
    config.jsPath+'/**.*'
]));

gulp.task('watch', ['sass', 'coffee'], function () {
    gulp.watch(config.sassPath+'/**/*.scss', ['sass']);
    gulp.watch(config.coffeePath+'/**/*.coffee', ['coffee']);
});

gulp.task('default', ['watch'], function() {
});
