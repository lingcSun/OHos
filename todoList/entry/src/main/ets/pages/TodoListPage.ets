import CommonConstants from '../common/constants/CommonConstant';
import { DataModel } from '../model/DataModel';
import TodoItem from '../view/TodoItem';
import { TodoItemData } from '../viewmodel/TodoItemData';
let dataModel : DataModel = new DataModel();
@Entry
@Component
struct TodoListPage {
  @State message: string = 'Hello World'
  private tasks: Array<TodoItemData>  = [];

  aboutToAppear(){
    this.tasks = dataModel.getData();
  }

  build() {
      Column() {
        Text($r('app.string.page_title'))
          .fontSize($r('app.float.title_font_size'))
          .lineHeight($r('app.float.title_font_height'))
          .fontWeight(FontWeight.Bold)
          .width(CommonConstants.TITLE_WIDTH)
          .margin({
            top:$r('app.float.title_margin_top'),
            bottom:$r('app.float.title_margin_bottom')
          })
          .textAlign(TextAlign.Start)

        ForEach(this.tasks,(item:TodoItemData)=>{
          TodoItem({content:item.content})
        },(item:TodoItemData)=>JSON.stringify(item.content))
      }.width('100%')
    }
}