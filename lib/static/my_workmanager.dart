enum MyWorkmanager {
  oneOff("task-identifier", "task-identifier"),
  periodic("com.dicoding.notificationApp", "com.dicoding.notificationApp");

  final String uniqueName;
  final String taskName;

  const MyWorkmanager(this.uniqueName, this.taskName);
}
