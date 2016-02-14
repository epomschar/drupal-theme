import gulp from 'gulp';
import replace from 'gulp-replace';

gulp.task('yml', () => {
  return gulp.src('./src/*.yml')
    .pipe(replace(/[^\s]+\/([^\/]+\.js)/g, 'js/$1'))
    .pipe(replace(/[^\s]+\/([^\/]+\.css)/g, 'css/$1'))
    .pipe(gulp.dest('./build'));
});
