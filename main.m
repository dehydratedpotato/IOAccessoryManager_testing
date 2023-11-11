/* Testing out the IOAccessory Mananger
 *
 * code by dehydratedpotato, 2023
 */

#import <Foundation/Foundation.h>

/* Import external symbols for IOAccessoryManager. See `libIOAccessoryManager.tbd` for all the symbols.
 * These are just the ones I got working... Want to dig into the kernel and figure out IOConnectCalls and stuff.
 */
extern io_service_t IOAccessoryManagerGetServiceWithPrimaryPort(int64_t);

extern long IOAccessoryManagerGetPrimaryPort(io_service_t); // return the same primary port used to create the io_service_t

extern long IOAccessoryManagerGetAccessoryID(io_service_t);

extern long IOAccessoryManagerGetActivePowerMode(io_service_t);

extern long IOAccessoryManagerGetBatteryPackMode(io_service_t);

extern long IOAccessoryManagerGetDigitalID(io_service_t);

//extern long IOAccessoryManagerGetFreePinMask(io_service_t);

extern long IOAccessoryManagerGetPowerMode(io_service_t);

extern long IOAccessoryManagerGetSleepPowerCurrentLimit(io_service_t);

// extern long IOAccessoryManagerGetLdcmParams(io_service_t); // LDCM = Low Data Charging Mode???

// extern long IOAccessoryManagerGetPowerDuringSleep(io_service_t);

extern long IOAccessoryManagerGetType(io_service_t);

int main(int argc, const char * argv[]) {
    uint64_t i = 1;
    
    while (true) {
        io_service_t service = IOAccessoryManagerGetServiceWithPrimaryPort(i);
        
        if (service == 0) return 0;
        
        printf("Primary Port 0x%llx:\n", i); // Primary Port = IOAccessoryManagerGetPrimaryPort(service);

        printf("   Accessory ID = 0x%lx\n", IOAccessoryManagerGetAccessoryID(service));
        printf("   Active Power Mode = 0x%lx\n", IOAccessoryManagerGetActivePowerMode(service));
        printf("   Battery Pack Mode = 0x%lx\n", IOAccessoryManagerGetBatteryPackMode(service));
        printf("   Digital ID = 0x%lx\n", IOAccessoryManagerGetDigitalID(service));
//        printf("   Free Pin Mask = 0x%lx\n", IOAccessoryManagerGetFreePinMask(service));
//        printf("   LDCM Params = 0x%lx\n", IOAccessoryManagerGetLdcmParams(service));
//        printf("   Power During Sleep = 0x%lx\n", IOAccessoryManagerGetPowerDuringSleep(service));
        printf("   Power Mode = 0x%lx\n", IOAccessoryManagerGetPowerMode(service));
        printf("   Sleep Power Current Limit = 0x%lx\n", IOAccessoryManagerGetSleepPowerCurrentLimit(service));
        printf("   Manager Type = 0x%lx\n", IOAccessoryManagerGetType(service));
        printf("\n");
        
        // Primary port IDs start at 1, consecutive IDs start from 0x102
        if (i != 1) {
            i++;
        } else {
            i = (i << 8) + 2;
        }
    }
    
    return 0;
}
