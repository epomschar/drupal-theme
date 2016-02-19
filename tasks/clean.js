import gulp from 'gulp';
import del from 'del';

gulp.task('clean', () => {
  return del.sync([
    'tmp',
    'build/**/*',
    '!build/.gitkeep',
  ], { force: true });
});
