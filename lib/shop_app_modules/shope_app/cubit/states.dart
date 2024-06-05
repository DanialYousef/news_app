abstract class  ShopeAppLoginStates{

}
class ShopeAppInitialState extends ShopeAppLoginStates{}
class ShopeAppLoadingStates extends ShopeAppLoginStates{}
class ShopeAppSuccessState extends ShopeAppLoginStates{}
class ShopeAppErorrState extends ShopeAppLoginStates{
   final String error;
   ShopeAppErorrState(this.error);
}