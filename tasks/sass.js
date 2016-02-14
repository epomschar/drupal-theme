import gulp from 'gulp';
import sass from 'gulp-sass';
import rename from 'gulp-rename';

gulp.task('sass', () => {
  return gulp.src('./src/**/*.scss')
    .pipe(sass({
      includePaths: './src/styles',
    }).on('error', sass.logError))
    .pipe(rename({dirname: ''}))
    .pipe(gulp.dest('./build/css'));
});
