
import { CommonConstants } from '../common/constants/CommonConstants';
import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
@Extend(TextInput)
function inputStyle(){
.placeholderColor($r('app.color.placeholder_color'))
  .height($r('app.float.login_input_height'))
  .padding({left:CommonConstants.INPUT_PADDING_LEFT})
  .margin({top:$r('app.float.input_margin_top')})
  .width('100%')
}
@Extend(Line)
function lineStype(){
 .width('100%')
  .height($r('app.float.line_height'))
  .backgroundColor($r('app.color.line_color'))
}
@Extend(Text)
function blueTextStyle(){
  .fontColor($r('app.color.login_blue_text_color'))
  .fontSize($r('app.float.small_text_size'))
  .fontWeight(FontWeight.Medium)
}

@Entry
@Component
struct Index {
   private account :string;
  private password: string;
  @State isShowProcess: boolean = false;
  private timeOutId:number = -1;

  login():void{
    if (this.account === '' || this.password === ''){
      promptAction.showToast({
        message: $r('app.string.input_empty_tips')
      })
    }else{
      this.isShowProcess = true;
      if (this.timeOutId === -1) {
        this.timeOutId = setTimeout(()=>{
          this.timeOutId = -1;
          this.isShowProcess = false;
          router.pushUrl({url:'pages/MainPage'});
        },CommonConstants.LOGIN_DELAY_TIME)
      }
    }
  }

  @Builder
  imageButton(src:Resource){
   Button({type:ButtonType.Circle,stateEffect:true}){
     Image(src)
   }.height($r('app.float.other_login_image_size'))
    .width($r('app.float.other_login_image_size'))
    .backgroundColor($r('app.color.background'))
}


  build() {
    Column() {
      Image($r('app.media.logo'))
        .height($r('app.float.logo_image_size'))
        .width($r('app.float.logo_image_size'))
        .margin({top:$r('app.float.logo_margin_top'),bottom:$r('app.float.logo_margin_bottom')})
      Text('登录界面')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.title_text_color'))
      Text('登录账号以使用更多服务')
        .fontSize(13)
        .fontColor(Color.Grey)
        .margin({bottom:'30vp',top:'5vp'})
      TextInput({ placeholder: '账号' })
        .maxLength(13)
        .inputStyle()
        .onChange((value:string)=>{
          this.account = value;
        })
      Line().lineStype()
      TextInput({ placeholder: '密码' })
        .maxLength(11)
        .type(InputType.Password)
        .inputStyle()
        .onChange((value:string)=>{
          this.password = value;
        })
      Line().lineStype()
      Row(){
        Text('短信验证码登录').blueTextStyle()
        Text('忘记密码').blueTextStyle()
      }.justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .margin({top:'8vp'})

      Button('登录', { type: ButtonType.Capsule })
        .onClick(() => {
          this.login()
        })
        .width('90%')
        .fontSize($r('app.float.normal_text_size'))
        .height($r('app.float.login_button_height'))
        .margin({top:'20vp',bottom:'10vp'})
      Text('注册账号')
        .fontColor($r('app.color.login_blue_text_color'))
        .fontSize($r('app.float.normal_text_size'))
        .fontWeight(FontWeight.Medium)

      if(this.isShowProcess){
        LoadingProgress()
          .color($r('app.color.other_login_text_color'))
          .width($r('app.float.login_progress_size'))
          .height($r('app.float.login_progress_size'))
          .margin({top:$r('app.float.login_progress_margin_top')})
      }

      Blank()
      Text('其他登录方式')
        .fontSize($r('app.float.little_text_size'))
        .fontColor($r('app.color.other_login_text_color'))
        .fontWeight(FontWeight.Medium)
        .margin({top: $r('app.float.other_login_margin_top') ,bottom:$r('app.float.other_login_margin_bottom')})
      Row({space:CommonConstants.LOGIN_METHOD_SPACE}){
        this.imageButton($r('app.media.login_method1'))
        this.imageButton( $r('app.media.login_method2'))
        this.imageButton( $r('app.media.login_method3'))
      }

    }
    .backgroundColor($r('app.color.background'))
    .height('100%')
    .width('100%')
    .padding({
      left:12,
      right:12,
      bottom:$r('app.float.login_page_padding_bottom')
    })

  }
}