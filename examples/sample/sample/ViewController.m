//
//  ViewController.m
//  sample
//
//  Created by Adnan Kamili on 30/06/21.
//

#import "ViewController.h"
#import <LexActivator/LexActivator.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *licenseKeyTextField;
@property (weak, nonatomic) IBOutlet UIButton *activateButton;
@property (weak, nonatomic) IBOutlet UILabel *licenseStatusLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    int status;
    status = SetProductData("PASTE_PRODUCT_DATA");
    if(status != LA_OK)
    {
        self.licenseStatusLabel.text = [NSString stringWithFormat:@"%d",status];
        return;
    }
    status = SetProductId("PASTE_PRODUCT_ID", LA_USER);
    if(status != LA_OK)
    {
        self.licenseStatusLabel.text = [NSString stringWithFormat:@"%d",status];
        return;
    }
    status = IsLicenseGenuine();
    self.licenseStatusLabel.text = [NSString stringWithFormat:@"License Status: %d",status];
}
- (IBAction)onActivateClick:(id)sender {
    int status;
    const char *licenseKey = [self.licenseKeyTextField.text UTF8String];
    status = SetLicenseKey(licenseKey);
    if(status != LA_OK)
    {
        self.licenseStatusLabel.text = [NSString stringWithFormat:@"%d",status];
        return;
    }
    status = ActivateLicense();
    self.licenseStatusLabel.text = [NSString stringWithFormat:@"License Status: %d",status];
}


@end
