Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677195;
	b=NCTAf5UoaQ8MZAA3L/Wjnvlqi0dKiu4Ud/ZF/5boz3+WdGE5QiYXhJEJxhg22f2xWpnz
	 WV9FSlPahkUF4yvp+0sXzanubs2qA//tC/t5U58OSi4Xmsydv4ha1CsK+bebScRXa3OSF
	 BBVmgXDR5FZYqeimHOWT4+NI8PFUmGTXKBQi9/7SV8jPKDQZrV0s/Qm118AoGEKjN5fT5
	 jVJdbNTeaalZ17RJkQXhbiehex4mIuJuwcF+VHW3XBvZ66mY3R5FaS9o8UYw2cgOuxD9w
	 JT+msM8O1N2I0XykGuOCr5UeNFODsKh9iz5rQFCAPab//wwQKVW3KCUi0k38u0SeXXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677195;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=rXM/6Jys/GWL3BNRN3AKTyQ8mGp0WEcSirMV5xUNlSY=;
	b=ZcTcSKazT3ducaBOjqWMmqHact1CrAyzYu1yA3KpNK5RFCMEATtkDtRMmKhj5sj9Mi6j
	 Cq8F6zsErFxrAiufw7/1R5cTP6mXb5VR6W4Uz7M4FXZyOFnddvnQFHOzP44mrn/q9Bry9
	 pyxHnxD6vr7yxIk5IXfaEdRrKPFst10oVmZ0p57iPW20N4UX+EeqUj99CkF6oKS4uWuyz
	 Fke+RYbWR4qcIjCT5ad4sscN7bPvFCbbSjpgc0HgCpScJe/FerS4pvI9K1/FIqJUtL83g
	 lVyXx1MBvifaXLxkWzCMa2sjGnFTM5uPOXXZOYulXhHl5GGgLJ5OV0TMGbRR7c7CEnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=MF3jn9Wx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3234C606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=MF3jn9Wx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E13FA1F000C3;
	Thu, 22 Oct 2026 13:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792677194;
	bh=rXM/6Jys/GWL3BNRN3AKTyQ8mGp0WEcSirMV5xUNlSY=;
	h=Date:From:To:Cc:Subject;
	b=MF3jn9WxgfJ86BzrG9Z4XQGeQLJ8OxJEvx3RwY1QyaGtGynWVsNEJECbHatCWQfjc
	 I4sWVxMX9zaPVNFyUyIjUnY3LR1zzOYj5XdFfVow2ZivNxduT6MDrlY4vKy/VLlAYd
	 5mXuVXs2VZSTg73DOmCRaAWqlA7pGGMqHYoMwwg8=
Date: Thu, 22 Oct 2026 15:51:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] Char/Misc/IIO driver driver updates for 7.4-rc1
Message-ID: <atoUxtzD4KuaE363@kroah.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit a90ee4305c4a5df72c11b31dacfdc76e00fcf78a:

  Linux 7.3-rc6 (2026-10-04 13:45:25 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git tags/char-misc-7.4-rc1

for you to fetch changes up to 985955d8e6b2b15cfd65b7ac6893e3a5a90c5870:

  rust_binder: wake epoll on self-work queued to poll thread (2026-10-18 10:22:54 +0200)

----------------------------------------------------------------
Char/Misc/IIO/others driver changes for 7.4-rc1

Here is the big set of char/misc/android/iio and other small driver
subsystem patches for 7.4-rc1.  Loads of stuff in here, larger than
normal.  Highlights include:
  - removal of the C binder code, the rust version is stable and will be
    used going forward in a few billion devices.  Great job by those
    developers.
  - loads and loads of IIO driver updates and feature additions
  - speakup driver fixes and updates
  - mhi driver updates
  - mei driver updates
  - xillybus driver fixes
  - comedi driver fixes
  - lots of coresight driver updates
  - Interconnect driver updates
  - nvmem driver updates and fixes
  - slimbus driver updates and fixes
  - spmi driver updates and fixes
  - lots of tiny misc and char driver fixes based on people scanning for
    things.

All of these have been in linux-next for a while with no reported
issues, other than a merge conflict with one of the rust tree files,
which should be simple to resolve.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Abdelnasser Hussein (4):
      staging: iio: adc: ad7816: Sort headers alphabetically
      staging: iio: adc: ad7816: Serialize SPI operations
      staging: iio: adc: ad7816: Fix DMA safety issues in SPI transfers
      staging: iio: adc: ad7816: Protect sysfs attributes with mutex

Abel Vesa (2):
      MAINTAINERS: Add Qualcomm SPMI controller entry
      MAINTAINERS: Add Abel as SPMI co-maintainer

Adi Nata (4):
      iio: humidity: hts221: report available values via read_avail()
      iio: humidity: hts221: Allow unknown whoami for DT fallback
      iio: humidity: hts221: use dev_err_probe() in probe paths
      iio: humidity: hts221: fix division by zero in calibration parsing

Adrian Ng Ho Yin (6):
      firmware: stratix10-svc: add PSCI secondary CPU offline on warm reboot for agilex and stratix10
      firmware: stratix10-svc: warn on unmatched free in stratix10_svc_free_memory
      firmware: stratix10-svc: add Agilex5 SMMU DMA coherent support
      firmware: stratix10-svc: populate kaddr1 from config status response
      firmware: stratix10-svc: remove RSU exclusion from no-support path
      firmware: stratix10-svc: Reduce polling interval for command status

Ajith P V (1):
      accessibility: speakup: refactor deprecated strcpy

Alex Elder (3):
      dt-bindings: misc: introduce pci1179,0220.yaml
      misc: tc9564: introduce base PCI driver
      misc: Kconfig: tc9564: fix and simplify dependencies

Alexander Usyskin (5):
      mei: make polling wait interruptible
      mei: csc: add option for polling and enable it
      mei: me: avoid hw access in polling when not active
      mei: me: reduce active polling timeout to 20 ms
      mei: csc: add pci error handling

Alexandra Lu (1):
      bus: mhi: host: pci_generic: Fix runtime PM imbalance for no_m3 devices

Alexandre Courbot (1):
      binder: use irrefutable let patterns

Alexey Charkov (1):
      nvmem: rockchip-otp: Serialize reads

Alice Ryhl (10):
      rust_binder: add TF_DEFER_COMPLETE flag for avoiding userspace roundtrip
      rust_binder: never return 0 from next_debug_id
      rust_binder: track caller location in BinderError
      rust_binder: add transaction_log and failed_transaction_log
      rust: miscdevice: add registration data to MiscDevice
      rust: error: implement ZeroableOption for Error
      rust_binder: store Option<Error> in TransactionInfo
      rust_binder: consolidate transaction failure prints
      rust_binder: avoid overflow in get_node_debug_info()
      rust_binder: wake epoll on self-work queued to poll thread

Amiitesh TSP (1):
      docs: fix typos in drivers/staging/iio

Andrei Stancovici (3):
      iio: adc: ltc2497: add LTC2499 internal temperature channel
      iio: adc: ltc2497: add 2x conversion speed mode
      dt-bindings: iio: adc: lltc,ltc2497: generalise the title

Andy Shevchenko (8):
      iio: light: Unshadow error codes in ->store()
      iio: imu: inv_mpu6050: Unshadow error codes in ->store()
      iio: chemical: sps30: Unshadow error codes in ->store()
      iio: adc: pac1934: Unshadow error codes in ->store()
      iio: magnetometer: ak8975: switch to using managed resources
      iio: magnetometer: ak8975: unify messages with help of dev_err_probe()
      iio: magnetometer: ak8975: use temporary variable for struct device
      iio: magnetometer: ak8975: make use of the macros from bits.h

AngeloGioacchino Del Regno (13):
      spmi: mtk-pmif: Add workaround for FSM lockup/error in read operation
      spmi: Fix potential use-after-free by grabbing of_node reference
      spmi: Remove redundant dev_name() print in spmi_device_add()
      spmi: Print error status with %pe format
      spmi: Remove unneeded goto in spmi_device_add() error path
      spmi: Implement spmi_subdevice_alloc_and_add() and devm variant
      spmi: Add helper to get a parent SPMI device
      nvmem: qcom-spmi-sdam: Migrate to devm_spmi_subdevice_alloc_and_add()
      power: reset: qcom-pon: Migrate to devm_spmi_subdevice_alloc_and_add()
      phy: qualcomm: eusb2-repeater: Migrate to devm_spmi_subdevice_alloc_and_add()
      misc: qcom-coincell: Migrate to devm_spmi_subdevice_alloc_and_add()
      iio: adc: qcom-spmi-iadc: Migrate to devm_spmi_subdevice_alloc_and_add()
      iio: adc: qcom-spmi-iadc: Remove regmap R/W wrapper functions

Antoniu Miclaus (13):
      iio: adc: ade9000: introduce chip_info structure
      dt-bindings: iio: adc: adi,ade9000: add adi,ade9078 compatible
      iio: adc: ade9000: add support for ADE9078
      docs: iio: ade9000: document ADE9078 support
      iio: adc: ad4080: allow debugfs register access to both channels
      dt-bindings: iio: update unreachable maintainer entries
      dt-bindings: iio: accel: adi,adxl367: add interrupt-names
      iio: accel: adxl367: use regmap_assign_bits()
      iio: accel: adxl367: add support for INT2 interrupt pin
      iio: accel: adxl367: resolve interrupt mapping before device setup
      dt-bindings: iio: adc: ad4080: add AD4885 support
      iio: adc: ad4080: add support for AD4885
      iio: adc: ad4080: enable address ascension for chip identification

Ariana Lazar (12):
      iio: dac: mcp47feb02: initialize dac_data field in channel data struct at probe
      iio: dac: mcp47feb02: Fix gain field initialization for active channels
      iio: dac: mcp47feb02: Return len when disabling EEPROM store
      iio: dac: mcp47feb02: Increase EEPROM Programming Write Cycle Time
      iio: dac: mcp47feb02: use field_get() instead of custom dynamic macros
      iio: dac: mcp47feb02: correct typo from a comment
      iio: dac: mcp47feb02: use field_prep() instead of custom dynamic macros
      iio: dac: mcp47feb02: Avoid unjustified probe error on missing label
      iio: dac: mcp47feb02: protect EEPROM store sequence with mutex
      iio: dac: mcp47feb02: refactor MCP47FEB02 I2C driver into two modules
      dt-bindings: iio: dac: add support for MCP48FEB02 SPI
      iio: dac: add support for Microchip MCP48FEB02

Arka Mondal (3):
      iio: dac: ad5758: Fix alignment for DMA safety
      iio: dac: ad5758: Reject out-of-range raw values
      iio: dac: ad5758: Fix the offset calculation

Bartosz Golaszewski (3):
      nvmem: remove duplicated reference counting
      nvmem: protect nvmem_device::ops with SRCU
      slimbus: qcom-ngd-ctrl: use platform_device_set_fwnode()

Biju Das (3):
      dt-bindings: iio: adc: renesas,rzg2l-adc: Document RZ/G3L ADC for TSU
      iio: adc: rzg2l_adc: Rename num_channels to max_channels
      iio: adc: rzg2l_adc: Add RZ/G3L ADC support for TSU

Bill Wendling (4):
      iio: gts-helper: add __counted_by_ptr to struct iio_gts
      iio: adc: qcom-adc5-gen3: Annotate struct adc5_device_data with __counted_by_ptr
      iio: add __counted_by_ptr attribute to channels in struct iio_dev
      comedi: comedi_bond: Refactor strlcat() to seq_buf in do_dev_config()

Breno Rodrigues Alves (1):
      interconnect: mediatek: fix Makefile typo for mt8196

Carlos Casadiego (1):
      iio: accel: kx022a: fix typo in comment

Carlos Llamas (2):
      binder: rm -f binder.c
      rust_binderfs: add transaction_report feature entry

Chang Yu (1):
      iio: light: ltr390: Remove stale TODOs

Cheick Traore (1):
      iio: adc: stm32: fix minimum sampling time values

Christophe JAILLET (1):
      interconnect: qcom: Constify struct qcom_icc_qosbox

Cosmin Tanislav (7):
      iio: adc: rzt2h: remove unused struct rzt2h_adc::max_channels
      iio: adc: rzt2h: store IRQ in private state
      iio: adc: rzt2h: store the physical address in private state
      iio: adc: rzt2h: claim direct mode on single reads
      iio: adc: rzt2h: implement DMA buffer support
      iio: adc: rzt2h: expose sampling frequency
      dt-bindings: iio: adc: renesas,r9a09g077-adc: document DMA support

Danish Khateeb (4):
      pps: generators: fix use-after-free when closing a removed device
      pps: generators: don't use the driver's info after unregister
      pps: generators: stop the generator on unregister
      pps: generators: wake up PPS_GEN_FETCHEVENT readers on unregister

David Lechner (TI) (10):
      iio: adc: ti-ads112c14: add DRDY interrupt support
      iio: adc: ti-ads112c14: create data read helper functions
      iio: adc: ti-ads112c14: add continuous mode support
      iio: adc: ti-ads112c14: add burnout current support
      iio: ABI: add sysfs attribute for _burnoutraw
      iio: adc: ti-ads112c14: support external clock
      iio: adc: ti-ads112c14: add filter support
      iio: ABI: add sinc4+sinc1+pf1 filter_type
      iio: adc: ti-ads112c14: add settlingtime attribute
      iio: ABI: add settlingtime attributes

Donggeun Yoo (1):
      iio: light: vcnl4000: use sysfs_emit() for near_level

Eli Billauer (7):
      char: xillybus: Improve control of execution flow with mutexes
      char: xillybus: Remove duplicate error path code
      char: xillybus: Avoid possible bandwidth inefficiency
      char: xillybus: Use unsigned arithmetic for jiffies differences
      char: xillybus: Integer arithmetic improvements
      char: xillybus: Add defensive sanity checks
      char: xillybus: Ignore and report unsolicited interrupts

Eliav Farber (3):
      notifier: add device-managed registration APIs
      iio: light: iqs621-als: use devm_blocking_notifier_chain_register()
      iio: position: iqs624: use devm_blocking_notifier_chain_register()

Esben Haabendal (7):
      dt-bindings: iio: light: ltr501: Sort compatible enum array
      dt-bindings: iio: light: ltr501: Add missing ltr303 compatible
      dt-bindings: iio: light: ltr501: Add ltr329 compatible
      iio: light: ltr501: Power down chip if request irq fails
      iio: light: ltr501: Add ltr329 driver support
      iio: light: ltr501: Fix sorting order of device arrays
      dt-bindings: iio: light: ltr501: Make proximity-near-level conditional

Fabio Cesari (1):
      iio: light: isl29028: fix runtime PM reference leak on error paths

Fenglin Wu (1):
      spmi: pmic-arb: return 0 in spmi_pmic_arb_register_buses() on success

Flaviu Nistor (2):
      dt-bindings: iio: adc: ti,ads1015: Add label property
      iio: adc: ti-ads1015: Add support for label

Frank Li (1):
      iio: use dmaengine_get_dma_device() instead of chan->device->dev

Gabriel Rondon (5):
      iio: accel: kionix-kx022a: use scan struct for one-shot and trigger reads
      iio: accel: kionix-kx022a: use iio_push_to_buffers_with_ts()
      iio: gyro: adxrs290: use iio_push_to_buffers_with_ts()
      iio: gyro: bmg160: use iio_push_to_buffers_with_ts()
      iio: gyro: itg3200: use iio_push_to_buffers_with_ts()

Geert Uytterhoeven (3):
      iio: adc: meson-saradc: Make sure clk_init_data is fully initialized
      iio: frequency: adf4350: Make sure clk_init_data is fully initialized
      peci: controller: aspeed: Make sure clk_init_data is fully initialized

Georgi Djakov (5):
      Merge branch 'icc-defaults' into icc-next
      Merge branch 'icc-kuno' into icc-next
      Merge branch 'icc-milos' into icc-next
      Merge branch 'icc-rpm' into icc-next
      Merge branch 'icc-misc' into icc-next

Giorgi Tchankvetadze (1):
      iio: light: veml3328: reshape scale array for readability

Greg Kroah-Hartman (11):
      binder: Fix up Kconfig dependancy due to removal of .c code
      Merge 7.3-rc5 into char-misc-next
      Merge tag 'iio-for-7.4a' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/jic23/iio into char-misc-next
      Merge tag 'peci-next-7.4-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/iwi/linux into char-misc-next
      Merge 7.3-rc6 into char-misc-next
      Merge tag 'fpga-for-7.4-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/fpga/linux-fpga into char-misc-next
      Merge tag 'socfpga_firmware_updates_for_v7.4' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux into char-misc-next
      Merge tag 'mhi-for-v7.4' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/mani/mhi into char-misc-next
      Merge tag 'icc-7.4-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/djakov/icc into char-misc-next
      Merge tag 'coresight-next-v7.4' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/coresight/linux into char-misc-next
      Merge tag 'spmi-for-next' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi into char-misc-next

Guangshuo Li (4):
      iio: accel: kxcjk-1013: Disable autosuspend on remove
      iio: accel: mma9551: disable autosuspend on remove
      iio: accel: mma9553: disable autosuspend on remove
      iio: adc: at91-sama5d2: disable autosuspend on remove

Hardeep Sharma (2):
      dt-bindings: interconnect: Add Qualcomm Kuno NoC
      interconnect: qcom: Add Kuno interconnect provider driver

Heiko Schocher (1):
      fpga: xilinx-selectmap: control CSI_B and RDWR_B during configuration

Hemanth Selam (7):
      iio: fix typos in comments
      interconnect: fix typo "commited" in comments
      fpga: fix typo in s10_ops_write() comment
      bus: mhi: host: Fix typo "intented" in comment
      greybus: fix typo "registerd" in comment
      slimbus: fix typos in comments
      misc: fix typos in comments

Jakub Szczudlo (3):
      dt-bindings: iio: adc: ti,ads1100: add support for ADS1110
      iio: adc: ti-ads1100: Fix incorrect reading when datarate changed in single mode
      iio: adc: ti-ads1100: Add ti-ads1110 support to ti-ads1100 driver

James Clark (1):
      coresight: trbe: Hide enable_sink sysfs file

Janani Sunil (20):
      spi: dt-bindings: Add spi-device-addr peripheral property
      dt-bindings: iio: dac: Add AD5529R
      iio: dac: Add AD5529R DAC driver support
      iio: adc: adi-axi-adc: Initialize state mutex
      dt-bindings: iio: adc: Add AD7768
      iio: backend: Add support for CRC
      iio: adc: adi-axi-adc: Add support for CRC
      iio: adc: Add AD7768 and AD7768-4 core support
      iio: adc: ad7768: Validate master clock rate
      iio: adc: ad7768: Add power mode helper
      iio: adc: ad7768: Derive output data rates
      iio: adc: ad7768: Configure channel sampling profiles
      iio: adc: ad7768: Add sampling frequency controls
      iio: adc: ad7768: Add per-channel filter controls
      iio: adc: ad7768: Wait for digital filters to settle
      iio: adc: ad7768: Add calibration controls
      iio: adc: ad7768: Add per-channel conversion delay
      iio: adc: ad7768: Add VCM regulator support
      iio: adc: ad7768: Register GPIO auxiliary device
      Documentation: iio: Add AD7768 Documentation

Janne Grunau (1):
      nvmem: core: Fix OOB read for bit offsets of more than one byte

Jasper Wise (1):
      misc: nsm: mark device ready before registering the hwrng and misc device

Javier Carrasco (7):
      iio: gts-helper: fix error headers
      iio: rename stale IIO_DEV_ACQUIRE_ERR reference to IIO_DEV_ACQUIRE_FAILED
      dt-bindings: iio: light: veml6030: add veml6031x00 ALS series
      iio: light: add support for veml6031x00 ALS series
      iio: light: veml6031x00: add support for triggered buffers
      iio: light: veml6031x00: add support for events and trigger
      iio: light: veml6031x00: Enable internal calibration

Jean-Baptiste Maneyrol (6):
      iio: imu: inv_icm42600: sleep before enabling FIFO data
      iio: imu: inv_icm42600: use 2 sensors fixed packet size of 16 bytes
      iio: imu: inv_icm42600: simplify watermark computation by using GCD
      iio: imu: inv_icm42600: do not read FIFO count for watermark it
      iio: imu: inv_icm42600: fix odr change not caught in certain cases
      iio: imu: inv_icm42600: force accel odr change when switching power mode

Jiale Yao (21):
      iio: amplifiers: ad8366: reject devices without match data
      iio: dac: ad5755: validate SPI match data
      iio: dac: mcp4821: reject devices without match data
      iio: frequency: adf4377: reject devices without match data
      iio: imu: adis16400: validate SPI match data
      iio: potentiometer: x9250: reject devices without match data
      iio: pressure: bmp280: validate SPI match data
      iio: adc: ad7192: reject devices without match data
      iio: adc: ad7606: reject devices without match data
      iio: adc: ad7768-1: reject devices without match data
      iio: adc: max11205: reject devices without match data
      iio: adc: mcp3911: reject devices without match data
      iio: adc: ti-adc128s052: validate SPI match data
      iio: adc: ti-ads1018: reject devices without match data
      iio: adc: ti-ads131m02: reject devices without match data
      iio: adc: ti-ads7950: validate SPI match data
      iio: accel: adxl313: reject devices without match data
      iio: accel: adxl372: reject devices without match data
      iio: accel: adxl380: reject devices without match data
      iio: accel: sca3000: reject devices without match data
      misc: ad525x_dpot: drop redundant drvdata check

Jianping Li (2):
      misc: fastrpc: Reduce console noise from expected DSP info, reserved memory and session messages
      misc: fastrpc: Allocate entire reserved memory for Audio PD in probe

Jingyi Wang (1):
      dt-bindings: nvmem: qfprom: Add compatible for Qualcomm Maili

Jonathan Cameron (2):
      Merge tag 'devm_notifier_chain_register-for-7.4' into togreg
      Merge tag 'v7.3-rc4' into togreg

Jorijn van der Graaf (8):
      iio: imu: inv_icm42600: sort device id tables numerically
      iio: imu: inv_icm42600: log whoami mismatch instead of failing probe
      dt-bindings: iio: imu: icm42600: add icm42630
      iio: light: stk3310: lower-case the i2c device ID names
      dt-bindings: iio: light: stk33xx: document the Sensortek STK36C61
      iio: light: stk3310: move the data registers into the channel address
      iio: light: stk3310: add per-chip match data
      iio: light: stk3310: support the Sensortek STK36C61

Joshua Crofts (14):
      MAINTAINERS: add patchwork link to iio entry
      iio: temperature: iqs620at-temp: make headers conform to IWYU
      iio: temperature: ltc2983: reorder headers
      iio: temperature: ltc2983: make headers conform to IWYU
      iio: temperature: mlx90632: make headers conform to IWYU
      iio: temperature: mlx90635: make headers conform to IWYU
      iio: temperature: tmp117: sort headers alphabetically
      iio: temperature: tmp117: make headers conform to IWYU
      iio: temperature: tsys01: reorder headers
      iio: temperature: tsys01: make headers conform to IWYU
      iio: temperature: tsys02d: reorder headers
      iio: temperature: tsys02d: make headers conform to IWYU
      iio: adc: max14001: add missing MODULE_DEVICE_TABLE macro
      iio: magnetometer: ak8975: add scan mask index enum

Joshua Mulloy (1):
      misc: tifm: don't clear dev->driver in tifm_device_remove()

Judith Mendez (2):
      dt-bindings: nvmem: uniphier-efuse: Add ti,am62p-efuse compatible
      nvmem: uniphier-efuse: Enable for K3 SoCs

Juergen Gross (1):
      drivers/misc: Stop using 32-bit MSR interfaces

Julia Lawall (1):
      altera: drop unneeded semicolon

Karl Mehltretter (3):
      docs: iio: Correct ADXL380 filter descriptions
      interconnect: Add kernel-doc for devm_of_icc_get(), icc_enable() and icc_disable()
      fpga: Fix of_fpga_mgr_get() reference in fpga_mgr_lock() docs

Kees Cook (3):
      iio: adc: ad7173: Remove const from chan_arr allocation type
      iio: imu: st_lsm6dsx: Allocate ext_channels with ARRAY_SIZE()
      nvmem: core: Add const to pattrs allocation type

Kim Seer Paller (6):
      iio: ABI: Add DAC current powerdown attributes and 15kohm_to_gnd mode
      dt-bindings: iio: dac: add adi,ad5710r.yaml
      iio: dac: ad3530r: parameterize DAC resolution
      iio: dac: ad3530r: add support for AD5710R/AD5711R
      dt-bindings: iio: dac: ad3530r: add AD3536R
      iio: dac: ad3530r: add support for AD3536R

Konrad Dybcio (7):
      interconnect: qcom: Move bcm_div() to common code
      interconnect: qcom: icc-rpm: Don't skip small votes
      interconnect: qcom: icc-rpm: Handle icc_link_create() failures
      interconnect: qcom: icc-rpm: Program SMD RPM auxiliary QoS ports
      interconnect: qcom: msm8996: Configure auxiliary Venus QoS port
      interconnect: qcom: msm8976: Configure auxiliary GPU QoS port
      interconnect: qcom: use 64-bit SMD RPM bus votes

Krishna Chaitanya Chundru (1):
      bus: mhi: host: pci_generic: Add DUN channel configuration

Krzysztof Kozlowski (4):
      interconnect: qcom: Make important drivers default
      interconnect: qcom: Add missing depends to Hawi, Maili, Nord and Shikra
      dt-bindings: iio: Use consistent indentation in the example
      coresight: tnoc: Constify amba_id table

Kyle Hsieh (2):
      dt-bindings: iio: adc: ti,ads112c04: Add binding for ADS112C04
      iio: adc: ti-ads112c04: Add support for TI ADS112C04

Lad Prabhakar (1):
      dt-bindings: iio: adc: renesas,r9a09g077-adc: Drop unwired interrupts

Leo Cheng (2):
      nvmem: layouts: sl28vpd: fix device_node reference leak in error path
      nvmem: layouts: onie-tlv: fix device_node reference leak in error path

Li Youhong (1):
      misc: ibmvmc: free IRQ when enabling interrupts fails

Linkai Gong (2):
      misc: enclosure: fix UAF on device_register() failure
      char: scx200_gpio: check cdev_add() return value

Liviu Stan (1):
      dt-bindings: iio: temperature: adi,ltc2983: Add ADT7604 datasheet link

Loic Poulain (1):
      nvmem: layouts: Support fixed-layout as the nvmem device node itself

Luca Weiss (1):
      dt-bindings: interconnect: OSM L3: Document Milos OSM L3 compatible

Marcelo Schmitt (2):
      iio: Fix typo in vendor name
      iio: adc: ad4134: Drop import to empty name space

Marco Chen (1):
      iio: accel: bma400: remove completed tasks from TODO list

Matti Vaittinen (2):
      iio: pressure: rohm-bm1390: Fix AVE_NUM initialization
      iio: accel: kionix-kx022a: Fix IPOL macro name

Mike Rapoport (Microsoft) (4):
      char: xilinx_hwicap: replace page allocator calls with k[mz]alloc()
      char: xillybus: replace __get_free_pages() with kmalloc()
      misc: ibmvmc: replace get_zeroed_page() with kzalloc()
      platform: goldfish: pipe: replace __get_free_page() with kmalloc()

Mohamad Raizudeen (1):
      staging: iio: frequency: ad9832/ad9834: add comment explaining do_div usage

Mohammad Shahid (9):
      iio: adc: bcm_iproc_adc: Remove redundant probe error messages
      iio: adc: bcm_iproc_adc: Introduce local device pointer
      iio: adc: bcm_iproc_adc: Convert probe error handling to dev_err_probe()
      iio: adc: bcm_iproc_adc: sort headers alphabetically
      iio: adc: bcm_iproc_adc: fix include dependencies
      iio: adc: bcm_iproc_adc: use devm-managed clock
      iio: adc: bcm_iproc_adc: use devm-managed ADC cleanup
      iio: adc: bcm_iproc_adc: use devm-managed mutex initialization
      iio: adc: bcm_iproc_adc: use devm-managed IIO device registration

Mukesh Ojha (1):
      misc: fastrpc: Use devm_of_reserved_mem_device_init()

Myeonghun Pak (1):
      interconnect: exynos: Remove the PM QoS request on unbind

Nazim Amirul (2):
      fpga: altera-cvp: Add helper to disable CvP mode
      fpga: altera-cvp: Retry teardown and reset CVP state on failure

Neil Armstrong (1):
      interconnect: qcom: implement get_bw with rpmh_read

Nicolás Antinori (3):
      dt-bindings: trivial-devices: add Aosong AM2315 and AM2320 chips
      iio: humidity: am2315: add support for am2320
      rust_binder: simplify Result<()> uses

Nuno Sá (1):
      iio: buffer-dmaengine: drop dead max_size computation

Pan Chuang (1):
      slimbus: qcom-ngd-ctrl: Remove redundant dev_err_probe()

Pei Xiao (1):
      comedi: dt2811: fix shift-out-of-bounds in IRQ check

Peng Fan (2):
      iio: chemical: ens160: use regmap_assign_bits() for conditional set/clear
      misc: ad525x_dpot: use assign_bit() where applicable

Pengpeng Hou (1):
      iio: accel: bma220: publish the SPI driver ACPI alias

Petar Stepanovic (2):
      dt-bindings: iio: adc: add Axiado AX3000/AX3005 SARADC
      iio: adc: add Axiado SARADC driver

Peter Hunt (1):
      bus: mhi: host: pci_generic: Add IP_CTRL channel for Sierra EM919x/EM929x

Peter Robinson (1):
      misc: issei: Fix issei architecture deps

Rafael Passos (1):
      rust_binder: speed up get_node_debug_info using lower_bound iter

Randy Dunlap (1):
      docs: iio: backend: use literal block for commands

Raviteja Laggyshetty (1):
      interconnect: qcom: Enable Shikra interconnect driver by default for ARCH_QCOM

Rishab Madhugiri (1):
      iio: core: Replace BUG() with WARN_ON_ONCE() and error return

Rob Herring (Arm) (1):
      dt-bindings: iio: Add dedicated CM32181 schema

Rodrigo Alencar (17):
      iio: ABI: add attributes for altcurrent channels
      iio: ABI: raw, scale and offset for frequency/phase channels
      iio: ABI: add parent entry for iio channels
      iio: add IIO_FREQUENCY channel type
      iio: core: support 64-bit register through debugfs
      iio: core: create local __iio_chan_prefix_emit() for reuse
      iio: test: add kunit tests for channel prefix naming generation
      iio: core: add hierarchical channel relationships
      dt-bindings: iio: frequency: add ad9910
      iio: frequency: ad9910: initial driver implementation
      iio: frequency: ad9910: add basic parallel port support
      iio: frequency: ad9910: add digital ramp generator support
      iio: frequency: ad9910: add RAM mode support
      iio: frequency: ad9910: add output shift keying support
      iio: frequency: ad9910: show channel priority in debugfs
      iio: ABI: add docs for ad9910 sysfs and debugfs entries
      docs: iio: add documentation for ad9910 driver

Rodrigo Gobbi (2):
      dt-bindings: iio: proximity: move LIDAR-Lite v2 out of trivial-devices
      dt-bindings: iio: proximity: document LIDAR-Lite v3 fallback compatible

Roman Vivchar (3):
      dt-bindings: iio: adc: mediatek,mt2701-auxadc: add mt6572
      dt-bindings: mfd: mediatek: mt6397: add mt6323 PMIC EFUSE
      nvmem: add mt6323 PMIC EFUSE driver

Rosen Penev (1):
      interconnect: qcom: fix endian annotations of BCM aux data

Runyu Xiao (3):
      peci: aspeed: Initialize state before requesting IRQ
      peci: npcm: Initialize state before requesting IRQ
      mei: vsc-tp: initialize IRQ state before requesting interrupt

Ruoyu Wang (1):
      misc: nsm: fix CBOR short-length decoding

Rupesh Majhi (7):
      iio: pressure: dps310: fix CFG_REG bit definitions
      iio: pressure: dps310: use a local device pointer in probe
      iio: pressure: dps310: use get_unaligned_be24() for the 24-bit results
      iio: pressure: dps310: take the lock once per raw read
      iio: pressure: dps310: add triggered buffer support
      iio: core: add an accessor for scan_timestamp
      iio: pressure: dps310: check the lock markings with context analysis

Sagar Taunk (4):
      rust_binder: add transaction buffer tracepoints
      rust_binder: allocation: call trace_transaction_failed_buffer_release()
      rust_binder: thread: wire up `transaction_buffer` `alloc/release` tracepoints
      rust_binder: add call site for `trace_transaction_update_buffer_release()`

Salah Triki (4):
      iio: humidity: ens210: Extend I2C functionality check
      iio: temperature: tmp117: fix calibbias cache update on I2C write failure
      iio: proximity: aw96103: Fix early return in IRQ handler loop
      iio: imu: adis16400: Check return value of spi_setup()

Samuel Thibault (2):
      speakup: Fix NULL pointer dereference on VT switch + selection
      speakup: Drop now-unused serialio operations

Sanjay Chitroda (4):
      iio: accel: mma8452: convert to bulk regulator usage
      iio: accel: mma8452: use local struct device
      iio: accel: mma8452: Use IIO cleanup helpers
      iio: accel: mma8452: use guard() to release mutexes

Sasha Levin (1):
      tools: hv: remove unused rte_smp_mb()

Sebastian Andrzej Siewior (1):
      bus: mhi: host: Use %p for pointer formatting

Sergey Gordeychik (1):
      rust_binder: use KVVec for files_to_translate

Shawn Guo (1):
      interconnect: qcom: Skip get_bw on QoS programming providers

Shehryar Ahmad (7):
      iio: accel: adis16201: fix channel order for buffer mode
      iio: accel: adis16201: add SPI device ID table
      iio: accel: adis16201: add OF device ID table
      iio: accel: adis16201: prepare driver to support additional parts
      iio: accel: adis16201: add ADIS16203 support
      staging: iio: accel: remove adis16203, merged into mainline adis16201 driver
      dt-bindings: iio: accel: adi,adis16201: add adis16203 compatible

Shengzhuo Wei (2):
      iio: accel: adxl380: reject out-of-range FIFO entry count
      iio: accel: adxl367: reject out-of-range FIFO entry count

Stefan Popa (2):
      dt-bindings: iio: adc: add adi,max40080
      iio: adc: add MAX40080 current-sense amplifier driver

Steve Meek (1):
      bus: mhi: host: pci_generic: Add Quectel RM500Q-AE support

Sumit Kumar (3):
      bus: mhi: host: clients: Add loopback driver with sysfs interface
      bus: mhi: ep: Add mhi_ep_queue_buf() API for raw buffer queuing
      bus: mhi: ep: clients: Add loopback driver for data path testing

Surendra Singh Chouhan (1):
      iio: light: apds9999: register standby action after enabling device

Thorsten Blum (1):
      accessibility: speakup: Use isdigit() in handle_goto()

Triet Hoang (2):
      iio: cros_ec: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
      drivers: misc: Convert to DEFINE_SIMPLE_DEV_PM_OPS()

Tsz Shan Chan (1):
      iio: light: apds9306: fix default sampling frequency definition

Tze Yee Ng (1):
      firmware: stratix10-svc: Add for SDM mailbox doorbell interrupt

Uwe Kleine-König (The Capable Hub) (1):
      fpga: dfl: Drop #include for <linux/mod_devicetable.h>

Viken Dadhaniya (1):
      slimbus: qcom-ngd-ctrl: Implement disable_stream callback

Vladislav Leonov (1):
      iio: adc: rockchip_saradc: Add support for RV1106

Wentao Guan (1):
      mei: vsc: Fix packet CRC computed over pointer size

Wentao Liang (1):
      spmi: mtk-pmif: Fix clock reference leak in mtk_spmi_bus_probe()

Xuewen Wang (1):
      misc: genwqe: free DDCB wait queues

Yang Zi (1):
      comedi: addi_apci_3xxx: fix subdevice count underallocation

Yeoreum Yun (14):
      coresight: etm4x: Prohibit TRCSEQSTR modifications while tracing enabled
      coresight: etm4x: prohibit modifying cntr_val while session is enabled
      coresight: etm3x: Prohibit modifying cntr_val while session is enabled
      coresight: etm4x: fix inconsistencies with sysfs configuration
      coresight: etm3x: fix inconsistencies with sysfs configuration
      coresight: etm3x: remove redundant cpu online check on etm_enable_sysfs()
      coresight: etm4x: introduce struct etm4_caps
      coresight: etm4x: exclude ss_status from drvdata->config
      coresight: etm4x: remove s_ex_level from config
      coresight: etm4x: rename local config as curr_config referring drvdata->curr_config
      coresight: etm4x: rename drvdata->config to sysfs_config
      coresight: etm3x: introduce struct etm_caps
      coresight: etm3x: rename local config as curr_config referring drvdata->curr_config
      coresight: etm3x: rename drvdata->config to sysfs_config

Yifei Gao (1):
      misc: fastrpc: fix double-free in fastrpc_map_attach() error path

Yogesh Gaur (6):
      comedi: comedi_parport: validate the IRQ supplied by userspace
      comedi: ni_atmio16d: validate the IRQ supplied by userspace
      comedi: dt2814: validate the IRQ supplied by userspace
      comedi: dmm32at: validate the IRQ supplied by userspace
      comedi: pcmmio: validate the IRQ supplied by userspace
      comedi: pcmuio: validate the IRQs supplied by userspace

Yuho Choi (1):
      bus: mhi: ep: Use IRQF_NO_AUTOEN flag in request_irq()

Zongmin Zhou (1):
      slimbus: messaging: fix leaked PM vote on tid allocation failure

bui duc phuc (1):
      iio: adc: sophgo-saradc: Handle errors from optional IRQ lookup

 Documentation/ABI/testing/debugfs-iio-ad9910       |   23 +
 Documentation/ABI/testing/debugfs-iio-backend      |   16 +-
 Documentation/ABI/testing/sysfs-bus-iio            |  115 +
 Documentation/ABI/testing/sysfs-bus-iio-adc        |    9 +
 .../ABI/testing/sysfs-bus-iio-frequency-ad9910     |   31 +
 .../ABI/testing/sysfs-bus-mhi-devices-loopback     |   49 +
 .../bindings/iio/accel/adi,adis16201.yaml          |    6 +-
 .../devicetree/bindings/iio/accel/adi,adxl367.yaml |   13 +-
 .../devicetree/bindings/iio/adc/adi,ad4080.yaml    |   38 +-
 .../devicetree/bindings/iio/adc/adi,ad4130.yaml    |    3 +-
 .../devicetree/bindings/iio/adc/adi,ad4851.yaml    |    8 +-
 .../devicetree/bindings/iio/adc/adi,ad7173.yaml    |    2 +-
 .../devicetree/bindings/iio/adc/adi,ad7768-1.yaml  |    6 +-
 .../devicetree/bindings/iio/adc/adi,ad7768.yaml    |  270 +
 .../devicetree/bindings/iio/adc/adi,ad7779.yaml    |   30 +-
 .../devicetree/bindings/iio/adc/adi,ade9000.yaml   |   58 +-
 .../devicetree/bindings/iio/adc/adi,max40080.yaml  |   65 +
 .../bindings/iio/adc/axiado,ax3000-saradc.yaml     |   63 +
 .../devicetree/bindings/iio/adc/lltc,ltc2497.yaml  |    2 +-
 .../bindings/iio/adc/maxim,max34408.yaml           |   28 +-
 .../bindings/iio/adc/mediatek,mt2701-auxadc.yaml   |    1 +
 .../bindings/iio/adc/nxp,lpc1850-adc.yaml          |    2 +-
 .../bindings/iio/adc/renesas,r9a09g077-adc.yaml    |   22 +-
 .../bindings/iio/adc/renesas,rzg2l-adc.yaml        |   17 +-
 .../devicetree/bindings/iio/adc/ti,ads1015.yaml    |    6 +
 .../devicetree/bindings/iio/adc/ti,ads1100.yaml    |   10 +-
 .../devicetree/bindings/iio/adc/ti,ads112c04.yaml  |  149 +
 .../devicetree/bindings/iio/adc/ti,ads1298.yaml    |   18 +-
 .../devicetree/bindings/iio/addac/adi,ad74115.yaml |    3 +-
 .../bindings/iio/addac/adi,ad74413r.yaml           |    3 +-
 .../devicetree/bindings/iio/dac/adi,ad3530r.yaml   |   15 +-
 .../devicetree/bindings/iio/dac/adi,ad5529r.yaml   |  254 +
 .../devicetree/bindings/iio/dac/adi,ad5710r.yaml   |  145 +
 .../bindings/iio/dac/microchip,mcp47feb02.yaml     |  219 +-
 .../bindings/iio/frequency/adi,ad9910.yaml         |  209 +
 .../bindings/iio/imu/invensense,icm42600.yaml      |   24 +-
 .../devicetree/bindings/iio/light/adux1020.yaml    |    8 +-
 .../bindings/iio/light/amstaos,tsl2591.yaml        |    2 +-
 .../bindings/iio/light/capella,cm32181.yaml        |   44 +
 .../devicetree/bindings/iio/light/isl29018.yaml    |    6 +-
 .../bindings/iio/light/liteon,ltr501.yaml          |   32 +-
 .../devicetree/bindings/iio/light/noa1305.yaml     |    4 +-
 .../devicetree/bindings/iio/light/stk33xx.yaml     |   19 +-
 .../devicetree/bindings/iio/light/tsl2583.yaml     |    4 +-
 .../devicetree/bindings/iio/light/tsl2772.yaml     |   14 +-
 .../bindings/iio/light/vishay,veml6030.yaml        |   21 +-
 .../bindings/iio/pressure/infineon,dps310.yaml     |   10 +-
 .../iio/proximity/pulsedlight,lidar-lite-v2.yaml   |   71 +
 .../bindings/iio/proximity/vishay,vcnl3020.yaml    |    6 +-
 .../bindings/iio/temperature/adi,ltc2983.yaml      |    1 +
 .../bindings/interconnect/qcom,kuno-rpmh.yaml      |  118 +
 .../bindings/interconnect/qcom,osm-l3.yaml         |    1 +
 .../devicetree/bindings/mfd/mediatek,mt6397.yaml   |   21 +
 .../devicetree/bindings/misc/pci1179,0220.yaml     |  146 +
 .../devicetree/bindings/nvmem/qcom,qfprom.yaml     |    1 +
 .../bindings/nvmem/socionext,uniphier-efuse.yaml   |    6 +-
 .../bindings/spi/spi-peripheral-props.yaml         |    7 +
 .../devicetree/bindings/trivial-devices.yaml       |    6 +-
 Documentation/iio/ad7768.rst                       |  275 +
 Documentation/iio/ad9910.rst                       |  792 +++
 Documentation/iio/ade9000.rst                      |   26 +-
 Documentation/iio/adis16475.rst                    |    2 +-
 Documentation/iio/adis16480.rst                    |    2 +-
 Documentation/iio/adis16550.rst                    |    2 +-
 Documentation/iio/adxl313.rst                      |    2 +-
 Documentation/iio/adxl345.rst                      |    2 +-
 Documentation/iio/adxl380.rst                      |   10 +-
 Documentation/iio/index.rst                        |    2 +
 MAINTAINERS                                        |   96 +-
 drivers/accessibility/speakup/main.c               |    2 +-
 drivers/accessibility/speakup/selection.c          |    6 +
 drivers/accessibility/speakup/serialio.c           |  193 +-
 drivers/accessibility/speakup/serialio.h           |   17 -
 drivers/accessibility/speakup/speakup_acntpc.c     |    1 -
 drivers/accessibility/speakup/speakup_decpc.c      |    1 -
 drivers/accessibility/speakup/speakup_dtlk.c       |    1 -
 drivers/accessibility/speakup/speakup_keypc.c      |    1 -
 drivers/accessibility/speakup/spk_priv.h           |    6 -
 drivers/accessibility/speakup/varhandlers.c        |    5 +-
 drivers/android/Kconfig                            |   41 +-
 drivers/android/Makefile                           |    3 -
 drivers/android/binder.c                           | 7187 --------------------
 drivers/android/binder/Makefile                    |    4 +-
 drivers/android/binder/allocation.rs               |   17 +-
 drivers/android/binder/context.rs                  |    8 +-
 drivers/android/binder/defs.rs                     |    3 +-
 drivers/android/binder/error.rs                    |   43 +-
 drivers/android/binder/freeze.rs                   |   17 +-
 drivers/android/binder/node.rs                     |   10 +-
 drivers/android/binder/node/wrapper.rs             |    8 +-
 drivers/android/binder/page_range.rs               |    6 +-
 drivers/android/binder/process.rs                  |   45 +-
 drivers/android/binder/range_alloc/array.rs        |    2 +-
 drivers/android/binder/range_alloc/mod.rs          |    2 +-
 drivers/android/binder/range_alloc/tree.rs         |    2 +-
 drivers/android/binder/rust_binder_events.h        |   42 +
 drivers/android/binder/rust_binder_internal.h      |    1 +
 drivers/android/binder/rust_binder_main.rs         |   45 +-
 drivers/android/binder/rust_binderfs.c             |   21 +-
 drivers/android/binder/thread.rs                   |  176 +-
 drivers/android/binder/trace.rs                    |   37 +
 drivers/android/binder/transaction.rs              |  228 +-
 drivers/android/binder_alloc.c                     | 1409 ----
 drivers/android/binder_alloc.h                     |  189 -
 drivers/android/binder_internal.h                  |  597 --
 drivers/android/binder_netlink.c                   |   32 -
 drivers/android/binder_netlink.h                   |   21 -
 drivers/android/binder_trace.h                     |  448 --
 drivers/android/binderfs.c                         |  785 ---
 drivers/android/dbitmap.h                          |  169 -
 drivers/android/tests/.kunitconfig                 |    7 -
 drivers/android/tests/Makefile                     |    6 -
 drivers/android/tests/binder_alloc_kunit.c         |  572 --
 drivers/bus/mhi/ep/Kconfig                         |    2 +
 drivers/bus/mhi/ep/Makefile                        |    1 +
 drivers/bus/mhi/ep/clients/Kconfig                 |   16 +
 drivers/bus/mhi/ep/clients/Makefile                |    2 +
 drivers/bus/mhi/ep/clients/loopback.c              |  126 +
 drivers/bus/mhi/ep/main.c                          |   32 +-
 drivers/bus/mhi/host/Kconfig                       |    1 +
 drivers/bus/mhi/host/Makefile                      |    1 +
 drivers/bus/mhi/host/clients/Kconfig               |   17 +
 drivers/bus/mhi/host/clients/Makefile              |    2 +
 drivers/bus/mhi/host/clients/loopback.c            |  312 +
 drivers/bus/mhi/host/debugfs.c                     |    4 +-
 drivers/bus/mhi/host/pci_generic.c                 |   22 +-
 drivers/char/scx200_gpio.c                         |    8 +-
 drivers/char/xilinx_hwicap/xilinx_hwicap.c         |   18 +-
 drivers/char/xillybus/xillybus.h                   |    3 +
 drivers/char/xillybus/xillybus_class.c             |   18 +-
 drivers/char/xillybus/xillybus_class.h             |    3 +
 drivers/char/xillybus/xillybus_core.c              |   98 +-
 drivers/char/xillybus/xillybus_of.c                |    3 +
 drivers/char/xillybus/xillyusb.c                   |   95 +-
 drivers/comedi/drivers/addi_apci_3xxx.c            |    2 +-
 drivers/comedi/drivers/comedi_bond.c               |   16 +-
 drivers/comedi/drivers/comedi_parport.c            |    3 +-
 drivers/comedi/drivers/dmm32at.c                   |    3 +-
 drivers/comedi/drivers/dt2811.c                    |    2 +-
 drivers/comedi/drivers/dt2814.c                    |    3 +-
 drivers/comedi/drivers/ni_atmio16d.c               |    4 +-
 drivers/comedi/drivers/pcmmio.c                    |    3 +-
 drivers/comedi/drivers/pcmuio.c                    |    5 +-
 drivers/firmware/stratix10-svc.c                   |  598 +-
 drivers/fpga/altera-cvp.c                          |   43 +-
 drivers/fpga/dfl.h                                 |    1 -
 drivers/fpga/fpga-mgr.c                            |    2 +-
 drivers/fpga/stratix10-soc.c                       |    2 +-
 drivers/fpga/xilinx-selectmap.c                    |   39 +-
 drivers/greybus/greybus_trace.h                    |    2 +-
 drivers/hwtracing/coresight/coresight-config.c     |   18 +-
 drivers/hwtracing/coresight/coresight-config.h     |   22 +
 drivers/hwtracing/coresight/coresight-core.c       |    1 +
 drivers/hwtracing/coresight/coresight-etm.h        |   48 +-
 drivers/hwtracing/coresight/coresight-etm3x-core.c |  196 +-
 .../hwtracing/coresight/coresight-etm3x-sysfs.c    |  461 +-
 drivers/hwtracing/coresight/coresight-etm4x-cfg.c  |   14 +-
 drivers/hwtracing/coresight/coresight-etm4x-core.c |  561 +-
 .../hwtracing/coresight/coresight-etm4x-sysfs.c    |  961 +--
 drivers/hwtracing/coresight/coresight-etm4x.h      |  199 +-
 drivers/hwtracing/coresight/coresight-sysfs.c      |   15 +-
 drivers/hwtracing/coresight/coresight-tnoc.c       |    2 +-
 drivers/hwtracing/coresight/coresight-trbe.c       |    7 +
 drivers/iio/accel/Kconfig                          |    7 +-
 drivers/iio/accel/adis16201.c                      |  133 +-
 drivers/iio/accel/adxl313_spi.c                    |    2 +
 drivers/iio/accel/adxl367.c                        |   59 +-
 drivers/iio/accel/adxl372_spi.c                    |    2 +
 drivers/iio/accel/adxl380.c                        |    7 +
 drivers/iio/accel/adxl380_spi.c                    |    2 +
 drivers/iio/accel/bma220_spi.c                     |    3 +-
 drivers/iio/accel/bma400_core.c                    |    2 -
 drivers/iio/accel/kionix-kx022a.c                  |   22 +-
 drivers/iio/accel/kionix-kx022a.h                  |    2 +-
 drivers/iio/accel/kxcjk-1013.c                     |    1 +
 drivers/iio/accel/mma8452.c                        |  145 +-
 drivers/iio/accel/mma9551.c                        |    1 +
 drivers/iio/accel/mma9553.c                        |    1 +
 drivers/iio/accel/sca3000.c                        |    2 +
 drivers/iio/adc/Kconfig                            |   86 +-
 drivers/iio/adc/Makefile                           |    4 +
 drivers/iio/adc/ad4080.c                           |   34 +-
 drivers/iio/adc/ad4134.c                           |    1 -
 drivers/iio/adc/ad7173.c                           |    3 +-
 drivers/iio/adc/ad7192.c                           |    3 +
 drivers/iio/adc/ad7606_spi.c                       |    6 +-
 drivers/iio/adc/ad7768-1.c                         |    3 +
 drivers/iio/adc/ad7768.c                           | 1921 ++++++
 drivers/iio/adc/ade9000.c                          |  180 +-
 drivers/iio/adc/adi-axi-adc.c                      |   21 +
 drivers/iio/adc/at91-sama5d2_adc.c                 |   10 +-
 drivers/iio/adc/axiado_saradc.c                    |  277 +
 drivers/iio/adc/bcm_iproc_adc.c                    |  101 +-
 drivers/iio/adc/ltc2497-core.c                     |  297 +-
 drivers/iio/adc/ltc2497.c                          |   42 +
 drivers/iio/adc/ltc2497.h                          |   31 +-
 drivers/iio/adc/max11205.c                         |    2 +
 drivers/iio/adc/max14001.c                         |    1 +
 drivers/iio/adc/max40080.c                         |  574 ++
 drivers/iio/adc/mcp3911.c                          |    2 +
 drivers/iio/adc/meson_saradc.c                     |    2 +-
 drivers/iio/adc/nxp-sar-adc.c                      |    2 +-
 drivers/iio/adc/pac1934.c                          |    9 +-
 drivers/iio/adc/qcom-spmi-iadc.c                   |  116 +-
 drivers/iio/adc/rockchip_saradc.c                  |   16 +
 drivers/iio/adc/rzg2l_adc.c                        |   29 +-
 drivers/iio/adc/rzt2h_adc.c                        |  499 +-
 drivers/iio/adc/sophgo-cv1800b-adc.c               |    2 +
 drivers/iio/adc/stm32-adc.c                        |   14 +-
 drivers/iio/adc/stm32-dfsdm-adc.c                  |    4 +-
 drivers/iio/adc/ti-adc128s052.c                    |    8 +-
 drivers/iio/adc/ti-ads1015.c                       |   30 +
 drivers/iio/adc/ti-ads1018.c                       |    6 +-
 drivers/iio/adc/ti-ads1100.c                       |  188 +-
 drivers/iio/adc/ti-ads112c04.c                     |  524 ++
 drivers/iio/adc/ti-ads112c14.c                     | 1274 +++-
 drivers/iio/adc/ti-ads131m02.c                     |    2 +
 drivers/iio/adc/ti-ads7950.c                       |    4 +-
 drivers/iio/adc/ti_am335x_adc.c                    |    4 +-
 drivers/iio/amplifiers/ad8366.c                    |    2 +
 drivers/iio/buffer/industrialio-buffer-dmaengine.c |    8 +-
 drivers/iio/chemical/ens160_core.c                 |    7 +-
 drivers/iio/chemical/sps30.c                       |   11 +-
 .../iio/common/cros_ec_sensors/cros_ec_sensors.c   |    2 +-
 .../common/cros_ec_sensors/cros_ec_sensors_core.c  |    5 +-
 drivers/iio/dac/Kconfig                            |   50 +-
 drivers/iio/dac/Makefile                           |    5 +-
 drivers/iio/dac/ad3530r.c                          |  321 +-
 drivers/iio/dac/ad3552r.c                          |    2 +-
 drivers/iio/dac/ad5529r.c                          |  546 ++
 drivers/iio/dac/ad5755.c                           |    3 +
 drivers/iio/dac/ad5758.c                           |    8 +-
 drivers/iio/dac/ad8460.c                           |    2 +-
 .../iio/dac/{mcp47feb02.c => mcp47feb02-core.c}    |  393 +-
 drivers/iio/dac/mcp47feb02-i2c.c                   |  145 +
 drivers/iio/dac/mcp47feb02-spi.c                   |  145 +
 drivers/iio/dac/mcp47feb02.h                       |   41 +
 drivers/iio/dac/mcp4821.c                          |    7 +-
 drivers/iio/dummy/iio_simple_dummy.c               |    2 +-
 drivers/iio/frequency/Kconfig                      |   21 +
 drivers/iio/frequency/Makefile                     |    1 +
 drivers/iio/frequency/ad9910.c                     | 2347 +++++++
 drivers/iio/frequency/adf4350.c                    |    2 +-
 drivers/iio/frequency/adf4377.c                    |    3 +
 drivers/iio/gyro/adxrs290.c                        |    4 +-
 drivers/iio/gyro/bmg160_core.c                     |    4 +-
 drivers/iio/gyro/itg3200_buffer.c                  |    3 +-
 drivers/iio/humidity/Kconfig                       |    8 +-
 drivers/iio/humidity/am2315.c                      |   34 +-
 drivers/iio/humidity/ens210.c                      |    4 +-
 drivers/iio/humidity/hts221_core.c                 |  168 +-
 drivers/iio/humidity/hts221_i2c.c                  |   11 +-
 drivers/iio/humidity/hts221_spi.c                  |   11 +-
 drivers/iio/iio_core.h                             |    7 +
 drivers/iio/imu/adis16400.c                        |    8 +-
 drivers/iio/imu/inv_icm42600/inv_icm42600.h        |    5 +-
 drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c  |   33 +-
 drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.c |  114 +-
 drivers/iio/imu/inv_icm42600/inv_icm42600_core.c   |   26 +-
 drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c   |   24 +-
 drivers/iio/imu/inv_icm42600/inv_icm42600_i2c.c    |   16 +-
 drivers/iio/imu/inv_icm42600/inv_icm42600_spi.c    |   16 +-
 drivers/iio/imu/inv_mpu6050/inv_mpu_core.c         |    6 +-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c       |    4 +-
 drivers/iio/industrialio-backend.c                 |   33 +
 drivers/iio/industrialio-core.c                    |  255 +-
 drivers/iio/industrialio-gts-helper.c              |    2 +-
 drivers/iio/light/Kconfig                          |   14 +
 drivers/iio/light/Makefile                         |    1 +
 drivers/iio/light/apds9306.c                       |    2 +-
 drivers/iio/light/apds9999.c                       |   12 +-
 drivers/iio/light/cros_ec_light_prox.c             |    2 +-
 drivers/iio/light/iqs621-als.c                     |   24 +-
 drivers/iio/light/isl29018.c                       |    7 +-
 drivers/iio/light/isl29028.c                       |   33 +-
 drivers/iio/light/lm3533-als.c                     |   11 +-
 drivers/iio/light/ltr390.c                         |    6 -
 drivers/iio/light/ltr501.c                         |  113 +-
 drivers/iio/light/stk3310.c                        |  203 +-
 drivers/iio/light/tsl2583.c                        |   15 +-
 drivers/iio/light/tsl2772.c                        |   16 +-
 drivers/iio/light/vcnl4000.c                       |    3 +-
 drivers/iio/light/veml3328.c                       |   53 +-
 drivers/iio/light/veml6031x00.c                    | 1387 ++++
 drivers/iio/magnetometer/ak8975.c                  |  234 +-
 drivers/iio/position/iqs624-pos.c                  |   24 +-
 drivers/iio/potentiometer/x9250.c                  |    7 +-
 drivers/iio/pressure/Kconfig                       |    2 +
 drivers/iio/pressure/Makefile                      |    2 +
 drivers/iio/pressure/bmp280-spi.c                  |    2 +
 drivers/iio/pressure/cros_ec_baro.c                |    2 +-
 drivers/iio/pressure/dps310.c                      |  313 +-
 drivers/iio/pressure/rohm-bm1390.c                 |    6 +-
 drivers/iio/proximity/aw96103.c                    |    2 +-
 drivers/iio/temperature/iqs620at-temp.c            |    9 +-
 drivers/iio/temperature/ltc2983.c                  |   19 +-
 drivers/iio/temperature/mlx90632.c                 |   10 +-
 drivers/iio/temperature/mlx90635.c                 |   11 +-
 drivers/iio/temperature/tmp117.c                   |   18 +-
 drivers/iio/temperature/tsys01.c                   |   17 +-
 drivers/iio/temperature/tsys02d.c                  |   12 +-
 drivers/iio/test/Kconfig                           |   13 +
 drivers/iio/test/Makefile                          |    1 +
 drivers/iio/test/iio-test-channel-prefix.c         |  307 +
 drivers/iio/test/iio-test-rescale.c                |    4 +-
 drivers/interconnect/core.c                        |   32 +
 drivers/interconnect/mediatek/Makefile             |    2 +-
 drivers/interconnect/qcom/Kconfig                  |   57 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/bcm-voter.c              |   59 +-
 drivers/interconnect/qcom/bcm-voter.h              |    1 +
 drivers/interconnect/qcom/eliza.c                  |   18 +-
 drivers/interconnect/qcom/icc-common.h             |    9 +
 drivers/interconnect/qcom/icc-rpm.c                |  105 +-
 drivers/interconnect/qcom/icc-rpm.h                |    6 +-
 drivers/interconnect/qcom/icc-rpmh.c               |   71 +-
 drivers/interconnect/qcom/kuno.c                   |  988 +++
 drivers/interconnect/qcom/milos.c                  |   66 +-
 drivers/interconnect/qcom/msm8976.c                |    3 +-
 drivers/interconnect/qcom/msm8996.c                |    1 +
 drivers/interconnect/qcom/sm6350.c                 |   56 +-
 drivers/interconnect/qcom/sm8650.c                 |   70 +-
 drivers/interconnect/qcom/smd-rpm.c                |    8 +-
 drivers/interconnect/samsung/exynos.c              |    1 +
 drivers/misc/Kconfig                               |   15 +
 drivers/misc/Makefile                              |    1 +
 drivers/misc/ad525x_dpot.c                         |    9 +-
 drivers/misc/altera-stapl/altera-jtag.c            |    4 +-
 drivers/misc/cardreader/alcor_pci.c                |    6 +-
 drivers/misc/cb710/core.c                          |    8 +-
 drivers/misc/cs5535-mfgpt.c                        |   33 +-
 drivers/misc/enclosure.c                           |    3 +-
 drivers/misc/fastrpc.c                             |  200 +-
 drivers/misc/gehc-achc.c                           |    2 +-
 drivers/misc/genwqe/card_base.c                    |    8 +-
 drivers/misc/genwqe/card_ddcb.c                    |    7 +-
 drivers/misc/genwqe/card_utils.c                   |    2 +-
 drivers/misc/ibmvmc.c                              |    7 +-
 drivers/misc/isl29003.c                            |   10 +-
 drivers/misc/issei/Kconfig                         |    1 +
 drivers/misc/lis3lv02d/lis3lv02d_spi.c             |    6 +-
 drivers/misc/mei/gsc-me.c                          |    2 +-
 drivers/misc/mei/hw-me.c                           |   99 +-
 drivers/misc/mei/init.c                            |   33 +-
 drivers/misc/mei/mei_dev.h                         |    1 +
 drivers/misc/mei/pci-csc.c                         |  141 +-
 drivers/misc/mei/vsc-tp.c                          |   19 +-
 drivers/misc/nsm.c                                 |    7 +-
 drivers/misc/pch_phub.c                            |    8 +-
 drivers/misc/phantom.c                             |    8 +-
 drivers/misc/qcom-coincell.c                       |   45 +-
 drivers/misc/tc9564-pci.c                          |   84 +
 drivers/misc/tifm_7xx1.c                           |    8 +-
 drivers/misc/tifm_core.c                           |    1 -
 drivers/misc/tsl2550.c                             |   13 +-
 drivers/misc/vmw_vmci/vmci_datagram.c              |    2 +-
 drivers/misc/vmw_vmci/vmci_queue_pair.c            |    2 +-
 drivers/nvmem/Kconfig                              |   15 +-
 drivers/nvmem/Makefile                             |    2 +
 drivers/nvmem/core.c                               |  128 +-
 drivers/nvmem/internals.h                          |    5 +-
 drivers/nvmem/layouts.c                            |   13 +-
 drivers/nvmem/layouts/onie-tlv.c                   |    1 +
 drivers/nvmem/layouts/sl28vpd.c                    |    1 +
 drivers/nvmem/mt6323-efuse.c                       |   83 +
 drivers/nvmem/qcom-spmi-sdam.c                     |   41 +-
 drivers/nvmem/rockchip-otp.c                       |   15 +-
 drivers/pci/quirks.c                               |    1 +
 drivers/peci/controller/peci-aspeed.c              |    8 +-
 drivers/peci/controller/peci-npcm.c                |    6 +-
 drivers/phy/qualcomm/Kconfig                       |    2 +
 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c     |   52 +-
 drivers/platform/goldfish/goldfish_pipe.c          |   22 +-
 drivers/power/reset/qcom-pon.c                     |   31 +-
 drivers/pps/generators/pps_gen.c                   |  111 +-
 drivers/slimbus/messaging.c                        |    2 +-
 drivers/slimbus/qcom-ngd-ctrl.c                    |   82 +-
 drivers/slimbus/slimbus.h                          |   14 +-
 drivers/spmi/spmi-devres.c                         |   24 +
 drivers/spmi/spmi-mtk-pmif.c                       |   42 +-
 drivers/spmi/spmi-pmic-arb.c                       |    2 +-
 drivers/spmi/spmi.c                                |  121 +-
 .../iio/Documentation/sysfs-bus-iio-adc-ad7280a    |    2 +-
 drivers/staging/iio/Kconfig                        |    1 -
 drivers/staging/iio/Makefile                       |    1 -
 drivers/staging/iio/accel/Kconfig                  |   19 -
 drivers/staging/iio/accel/Makefile                 |    6 -
 drivers/staging/iio/accel/adis16203.c              |  315 -
 drivers/staging/iio/adc/ad7816.c                   |   33 +-
 drivers/staging/iio/frequency/ad9832.c             |    6 +
 drivers/staging/iio/frequency/ad9834.c             |    6 +
 include/dt-bindings/interconnect/qcom,kuno.h       |   89 +
 include/linux/coresight.h                          |    4 +
 include/linux/firmware/intel/stratix10-smc.h       |   44 +
 include/linux/iio/adc/qcom-adc5-gen3-common.h      |    2 +-
 include/linux/iio/backend.h                        |    6 +
 include/linux/iio/iio-gts-helper.h                 |   11 +-
 include/linux/iio/iio-opaque.h                     |    2 +-
 include/linux/iio/iio.h                            |   25 +-
 include/linux/mhi.h                                |    2 +-
 include/linux/mhi_ep.h                             |   16 +
 include/linux/notifier.h                           |    7 +
 include/linux/pps_gen_kernel.h                     |    4 +-
 include/linux/slimbus.h                            |    2 +-
 include/linux/spmi.h                               |   17 +
 include/uapi/linux/android/binder.h                |    1 +
 include/uapi/linux/iio/types.h                     |    1 +
 kernel/notifier.c                                  |  105 +
 rust/kernel/error.rs                               |    5 +
 rust/kernel/miscdevice.rs                          |  100 +-
 samples/rust/rust_misc_device.rs                   |   29 +-
 tools/hv/vmbus_bufring.c                           |    6 -
 tools/iio/iio_event_monitor.c                      |    2 +
 .../selftests/filesystems/binderfs/binderfs_test.c |    2 +-
 .../testing/selftests/filesystems/binderfs/config  |    3 +-
 415 files changed, 22537 insertions(+), 16150 deletions(-)
 create mode 100644 Documentation/ABI/testing/debugfs-iio-ad9910
 create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-adc
 create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-frequency-ad9910
 create mode 100644 Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
 create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7768.yaml
 create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,max40080.yaml
 create mode 100644 Documentation/devicetree/bindings/iio/adc/axiado,ax3000-saradc.yaml
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml
 create mode 100644 Documentation/devicetree/bindings/iio/dac/adi,ad5529r.yaml
 create mode 100644 Documentation/devicetree/bindings/iio/dac/adi,ad5710r.yaml
 create mode 100644 Documentation/devicetree/bindings/iio/frequency/adi,ad9910.yaml
 create mode 100644 Documentation/devicetree/bindings/iio/light/capella,cm32181.yaml
 create mode 100644 Documentation/devicetree/bindings/iio/proximity/pulsedlight,lidar-lite-v2.yaml
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,kuno-rpmh.yaml
 create mode 100644 Documentation/devicetree/bindings/misc/pci1179,0220.yaml
 create mode 100644 Documentation/iio/ad7768.rst
 create mode 100644 Documentation/iio/ad9910.rst
 delete mode 100644 drivers/android/binder.c
 delete mode 100644 drivers/android/binder_alloc.c
 delete mode 100644 drivers/android/binder_alloc.h
 delete mode 100644 drivers/android/binder_internal.h
 delete mode 100644 drivers/android/binder_netlink.c
 delete mode 100644 drivers/android/binder_netlink.h
 delete mode 100644 drivers/android/binder_trace.h
 delete mode 100644 drivers/android/binderfs.c
 delete mode 100644 drivers/android/dbitmap.h
 delete mode 100644 drivers/android/tests/.kunitconfig
 delete mode 100644 drivers/android/tests/Makefile
 delete mode 100644 drivers/android/tests/binder_alloc_kunit.c
 create mode 100644 drivers/bus/mhi/ep/clients/Kconfig
 create mode 100644 drivers/bus/mhi/ep/clients/Makefile
 create mode 100644 drivers/bus/mhi/ep/clients/loopback.c
 create mode 100644 drivers/bus/mhi/host/clients/Kconfig
 create mode 100644 drivers/bus/mhi/host/clients/Makefile
 create mode 100644 drivers/bus/mhi/host/clients/loopback.c
 create mode 100644 drivers/iio/adc/ad7768.c
 create mode 100644 drivers/iio/adc/axiado_saradc.c
 create mode 100644 drivers/iio/adc/max40080.c
 create mode 100644 drivers/iio/adc/ti-ads112c04.c
 create mode 100644 drivers/iio/dac/ad5529r.c
 rename drivers/iio/dac/{mcp47feb02.c => mcp47feb02-core.c} (69%)
 create mode 100644 drivers/iio/dac/mcp47feb02-i2c.c
 create mode 100644 drivers/iio/dac/mcp47feb02-spi.c
 create mode 100644 drivers/iio/dac/mcp47feb02.h
 create mode 100644 drivers/iio/frequency/ad9910.c
 create mode 100644 drivers/iio/light/veml6031x00.c
 create mode 100644 drivers/iio/test/iio-test-channel-prefix.c
 create mode 100644 drivers/interconnect/qcom/kuno.c
 create mode 100644 drivers/misc/tc9564-pci.c
 create mode 100644 drivers/nvmem/mt6323-efuse.c
 delete mode 100644 drivers/staging/iio/accel/Kconfig
 delete mode 100644 drivers/staging/iio/accel/Makefile
 delete mode 100644 drivers/staging/iio/accel/adis16203.c
 create mode 100644 include/dt-bindings/interconnect/qcom,kuno.h
