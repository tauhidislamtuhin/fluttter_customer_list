import 'package:flutter/material.dart';
import '../../models/customer_list.dart';
import '../../widgets/custom_details_row.dart';
import '../../widgets/custom_header.dart';

class CustomerDetails extends StatelessWidget {
  final Customer customer;

  const CustomerDetails({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          customer.name ?? 'Customer Details',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue.shade700,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blueAccent, width: 2),
                  ),
                  //Profile Picture
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey.shade200,
                    backgroundImage: customer.imagePath != null
                        ? NetworkImage(
                            "https://www.pqstec.com/InvoiceApps/${customer.imagePath}")
                        : const AssetImage("assets/images/profile2.png")
                            as ImageProvider,
                  ),
                ),
                //Basic Info
                const CustomHeader(title: "Basic Info"),
                CustomDetailsRow(title: "Name", value: customer.name),
                CustomDetailsRow(title: "Email", value: customer.email),
                CustomDetailsRow(title: "Phone", value: customer.phone),
                CustomDetailsRow(title: "Customer Type", value: customer.custType),
                const SizedBox(height: 16),

                //Address Info
                const CustomHeader(title: "Address Info"),
                CustomDetailsRow(title: "Primary Address", value: customer.primaryAddress),
                CustomDetailsRow(title: "Secondary Address", value: customer.secoundaryAddress),
                const SizedBox(height: 16),

                //Sales Info
                const CustomHeader(title: "Sales Info"),
                CustomDetailsRow(title: "Total Due", value: '৳ ${customer.totalDue?.toStringAsFixed(2) ?? '0.00'}'),
                CustomDetailsRow(title: "Last Sales Date", value: customer.lastSalesDate),
                CustomDetailsRow(title: "Last Invoice No", value: customer.lastInvoiceNo),
                CustomDetailsRow(title: "Last Sold Product",value: customer.lastSoldProduct),
                const SizedBox(height: 16),

                //Transaction Info
                const CustomHeader(title: "Transaction Info"),
                CustomDetailsRow(title: "Total Sales",value: '${customer.totalSalesValue ?? 0}'),
                CustomDetailsRow(title: "Total Return", value: '${customer.totalSalesReturnValue ?? 0}'),
                CustomDetailsRow(title: "Amount Back", value: '${customer.totalAmountBack ?? 0}'),
                CustomDetailsRow(title: "Total Collection", value: '${customer.totalCollection ?? 0}'),
                CustomDetailsRow(title: "Last Transaction Date", value: customer.lastTransactionDate),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
