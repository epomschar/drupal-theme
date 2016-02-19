import gulp from 'gulp';
import livereload from 'gulp-livereload';

gulp.task('watch', () => {
  livereload.listen();

  gulp.watch('src/libraries/**/*.js', ['javascript']);
  gulp.watch('src/**/*.scss', ['sass']);
  gulp.watch('src/templates/*', ['template']);
  gulp.watch('src/*.yml', ['yml']);

  gulp.watch('build/**/*', (files) => {
    livereload.changed(files);
  });
});
