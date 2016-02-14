import gulp from 'gulp';
import babel from 'gulp-babel';
import rename from 'gulp-rename';


gulp.task('javascript', () => {
	return gulp.src('src/libraries/**/*.js', { base: './' })
		.pipe(babel())
    .pipe(rename({dirname: ''}))
		.pipe(gulp.dest('build/js'));
});
