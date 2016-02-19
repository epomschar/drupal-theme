import gulp from 'gulp';

gulp.task('template', () => {
  return gulp.src('src/templates/**/*')
    .pipe(gulp.dest('build/templates'));
});
