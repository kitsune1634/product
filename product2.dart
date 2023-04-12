void main() {
  Category sweaters = Category("Свитеры");
  Category trousers = Category("Брюки");
  Category homewear = Category("Домашняя одежда");
  Category hats = Category("Головные уборы");
  Category outerwear = Category("Верхняя одежда");

  sweaters.addProduct(Product("Свитер белый", 520, 5));
  sweaters.addProduct(Product("Кардиган", 1500, 4));
  sweaters.displayCategory();

  trousers.addProduct(Product("Джоггер", 1000, 1));
  trousers.addProduct(Product("Джинсы", 2000, 3));
  trousers.displayCategory();

  homewear.addProduct(Product("Пижама", 500, 8));
  homewear.addProduct(Product("Халат", 800, 10));
  homewear.displayCategory();

  hats.addProduct(Product("Шапка", 200, 2));
  hats.addProduct(Product("Шляпа", 350, 6));
  hats.displayCategory();

  outerwear.addProduct(Product("Куртка", 2000, 7));
  outerwear.addProduct(Product("Пальто", 3200, 11));
  outerwear.displayCategory();

  print("");
  try {
    User kitsune = User("kitsune", 123456);
    kitsune.basket.addProduct(sweaters.listProduct[0]);
    kitsune.basket.addProduct(trousers.listProduct[1]);
    kitsune.displayUser();

    User user = User("User", 12343);
    user.basket.addProduct(sweaters.listProduct[1]);
    user.basket.addProduct(trousers.listProduct[0]);
    user.displayUser();
    user.basket.deleteProduct(trousers.listProduct[0]);
    user.basket.addProduct(outerwear.listProduct[1]);
    user.displayUser();

    User dasha = User("dasha",  454678);
    dasha.basket.addProduct(homewear.listProduct[1]);
    dasha.basket.addProduct(trousers.listProduct[1]);
    dasha.displayUser();
    dasha.basket.deleteProduct(trousers.listProduct[1]);
    dasha.basket.addProduct(hats.listProduct[0]);
    dasha.displayUser();

  } catch (e) {
    print("Ошибка $e");
  }
}

class Product {
  String name = " ";
  int price = 1;
  int rating = 1;

  Product(String n, int p, int r) {
    name = n;
    price = p;
    rating = r;
  }

  void displayProduct() {
    print("Название: $name Цена: $price Рейтинг: $rating");
  }
}

class Category {
  String nameCategory = "";
  List<Product> listProduct = [];

  Category(name) : nameCategory = name {}

  void addProduct(Product product) {
    listProduct.add(product);
  }

  void deleteItem(Product product) {
    listProduct.remove(product);
  }

  void displayCategory() {
    print("$nameCategory: ");
    listProduct.forEach((element) {
      element.displayProduct();
    });
  }
}

class Basket {
  List<Product> listBasket = [];

  void addProduct(Product product) {
    listBasket.add(product);
  }

  void deleteProduct(Product product) {
    listBasket.remove(product);
  }
}

class User {
  String login = " ";
  int password = 1;
  Basket basket = Basket();

  User(this.login, this.password);

  void displayUser() {
    print("Пользовaтель: $login Корзина:");
    basket.listBasket.forEach((element) {
      element.displayProduct();
    });
  }
}