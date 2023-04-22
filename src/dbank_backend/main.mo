import Debug "mo:base/Debug";
// import Float "mo:base/Float";
// import Int "mo:base/Int";
// import Text "mo:base/Text";
import Time "mo:base/Time";
import Float "mo:base/Float";
import Int "mo:base/Int";

actor DBank {
  // ORTHOGONAL PERSISTANCE VARIABLE (By add STABLE keyword)
  // DECLARATION && ASSIGNMENT (VARIABLE)
  stable var currentAmount : Float = 100;
  // ASSIGMENT OPERATOR
  // currentAmount := 100;

  stable var startTime = Time.now();
  // Debug.print(debug_show (startTime));

  // DECLARATION && ASSIGNMENT (CONSTANT)
  let user : Text = "You";
  Debug.print(user);

  // public func Deposit(amount : Float) : async () {
  //   currentAmount += amount;
  //   // Debug.print(debug_show (currentAmount));

  // };
  public func WithDraw(amount : Float) {
    var temp : Float = currentAmount - amount;
    if (temp > 0) { currentAmount -= amount } else {
      Debug.print("Insufficent Funds");
    };
    // Debug.print(debug_show (currentAmount));
  };

  public func Compound() : async () {
    let currentTime = Time.now();
    let timeDifferenceNS = currentTime - startTime;
    let timeDifferenceS = timeDifferenceNS / 1000000000;
    currentAmount := currentAmount * (1.01 ** Float.fromInt(timeDifferenceS));
    startTime := currentTime;
  };

  // To RETURN the value FASTER
  public query func CheckBalance() : async (Float) {

    return currentAmount;
  };

  // To UPDATE && RETURN
  public func Deposit(amount : Float) : async (Float) {
    currentAmount += amount;
    return currentAmount;
  };

};
