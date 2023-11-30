
import { TodoItemData } from '../viewmodel/TodoItemData';
export class DataModel{
  private tasks:Array<TodoItemData> = [];

  getData():Array<TodoItemData>{
    this.tasks = [
      new TodoItemData("吃饭"),
      new TodoItemData("睡觉"),
      new TodoItemData("打豆豆"),
    ];
    return this.tasks;
  }
}