import gulp from 'gulp';

gulp.task('build', ['clean', 'javascript', 'sass', 'yml', 'template']);
