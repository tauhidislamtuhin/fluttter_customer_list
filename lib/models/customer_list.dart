class CustomerListResponse {
  int? success;
  bool? error;
  List<Customer>? customerList;
  PageInfo? pageInfo;

  CustomerListResponse({
    this.success,
    this.error,
    this.customerList,
    this.pageInfo,
  });

  factory CustomerListResponse.fromJson(Map<String, dynamic> json) {
    return CustomerListResponse(
      success: json['Success'],
      error: json['error'],
      customerList: json['CustomerList'] != null
          ? List<Customer>.from(
        json['CustomerList'].map((x) => Customer.fromJson(x)),
      )
          : [],
      pageInfo: json['PageInfo'] != null
          ? PageInfo.fromJson(json['PageInfo'])
          : null,
    );
  }



  Map<String, dynamic> toJson() {
    return {
      'Success': success,
      'error': error,
      'CustomerList': customerList?.map((x) => x.toJson()).toList(),
      'PageInfo': pageInfo?.toJson(),
    };
  }
}

class Customer {
  int? id;
  String? name;
  String? email;
  String? primaryAddress;
  String? secoundaryAddress;
  String? notes;
  String? phone;
  String? custType;
  String? parentCustomer;
  String? imagePath;
  double? totalDue;
  String? lastSalesDate;
  String? lastInvoiceNo;
  String? lastSoldProduct;
  double? totalSalesValue;
  double? totalSalesReturnValue;
  double? totalAmountBack;
  double? totalCollection;
  String? lastTransactionDate;
  String? clinetCompanyName;

  Customer({
    this.id,
    this.name,
    this.email,
    this.primaryAddress,
    this.secoundaryAddress,
    this.notes,
    this.phone,
    this.custType,
    this.parentCustomer,
    this.imagePath,
    this.totalDue,
    this.lastSalesDate,
    this.lastInvoiceNo,
    this.lastSoldProduct,
    this.totalSalesValue,
    this.totalSalesReturnValue,
    this.totalAmountBack,
    this.totalCollection,
    this.lastTransactionDate,
    this.clinetCompanyName,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['Id'],
      name: json['Name'],
      email: json['Email'],
      primaryAddress: json['PrimaryAddress'],
      secoundaryAddress: json['SecoundaryAddress'],
      notes: json['Notes'],
      phone: json['Phone'],
      custType: json['CustType'],
      parentCustomer: json['ParentCustomer'],
      imagePath: json['ImagePath'],
      totalDue: (json['TotalDue'] as num?)?.toDouble(),
      lastSalesDate: json['LastSalesDate'],
      lastInvoiceNo: json['LastInvoiceNo'],
      lastSoldProduct: json['LastSoldProduct'],
      totalSalesValue: (json['TotalSalesValue'] as num?)?.toDouble(),
      totalSalesReturnValue: (json['TotalSalesReturnValue'] as num?)?.toDouble(),
      totalAmountBack: (json['TotalAmountBack'] as num?)?.toDouble(),
      totalCollection: (json['TotalCollection'] as num?)?.toDouble(),
      lastTransactionDate: json['LastTransactionDate'],
      clinetCompanyName: json['ClinetCompanyName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'Email': email,
      'PrimaryAddress': primaryAddress,
      'SecoundaryAddress': secoundaryAddress,
      'Notes': notes,
      'Phone': phone,
      'CustType': custType,
      'ParentCustomer': parentCustomer,
      'ImagePath': imagePath,
      'TotalDue': totalDue,
      'LastSalesDate': lastSalesDate,
      'LastInvoiceNo': lastInvoiceNo,
      'LastSoldProduct': lastSoldProduct,
      'TotalSalesValue': totalSalesValue,
      'TotalSalesReturnValue': totalSalesReturnValue,
      'TotalAmountBack': totalAmountBack,
      'TotalCollection': totalCollection,
      'LastTransactionDate': lastTransactionDate,
      'ClinetCompanyName': clinetCompanyName,
    };
  }
}

class PageInfo {
  int? pageNo;
  int? pageSize;
  int? pageCount;
  int? totalRecordCount;

  PageInfo({
    this.pageNo,
    this.pageSize,
    this.pageCount,
    this.totalRecordCount,
  });

  factory PageInfo.fromJson(Map<String, dynamic> json) {
    return PageInfo(
      pageNo: json['PageNo'],
      pageSize: json['PageSize'],
      pageCount: json['PageCount'],
      totalRecordCount: json['TotalRecordCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'PageNo': pageNo,
      'PageSize': pageSize,
      'PageCount': pageCount,
      'TotalRecordCount': totalRecordCount,
    };
  }
}
