Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826433;
	b=VWtOiyk8aZE/rhQ0tptYOyP4ONFzzpPwV/D/jKGx8sqcgg36rqVDmq9YFYWXpbrSXC0B
	 jacB/YjgktlFKf/s6E1e/io9xeYCGs23ZIV5XVQBM50aKKPRkGvPrwlE9xUEBAUPGr2w+
	 Qn+CIYGl6cWWM6ldaJG2mXYryfG5qtqlC9SXjtVAYur949KgLHUCFulkj8O3AVMoDGpVC
	 I+NLxg4FTPn+KOxZBWesUEwDcMVYvoiwRJ6P97IUie1WE3Rv164gz52uWnKsBszovBNj9
	 rTKtT5uGfa8FZ1Z2uSJ3SfkpmJG3QiYVL1+Em68Soox+k6oOaOBsO+oKklo3sWgEdhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826433;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=vBNR8bDshyZd5vk8kXA9kZW2VuGJtpi/EHhmpPoM9QM=;
	b=2aBF8AGIbRPHG3EaMhbC8Ffk8Zp2jecAWrMf7EjVq4yO2ihwlhBUh+gFJCiElDVqP6pI
	 Fmg614E+7lmI0dK5jHTOhxJ+Rfvx61BsuUB8M0Lr8IFZP41ePNGKrovF2+MiNNYwjmipN
	 UmCEpka9Jh3gC6S4JpeB1j52TXVxqERhdhS+BrYeHUUuKxDiCAyTHggljWxHAwATRtRyy
	 XjRq5HxjPci2wCgpFaQ/pewTXnbaxyWA/a5VQAC6JN5P7bO+okTDu0/TgIyE+CvAlS8mH
	 nAJMpgtUYDT5dkFteRWtpz71PjnJeYX1o+Qul3FGxnmEO2TjDSEBJJM+pUQNH8/EFEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=mM1sfcbP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50350606A885
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=mM1sfcbP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 655551F000C7;
	Mon, 16 Nov 2026 10:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794826433;
	bh=vBNR8bDshyZd5vk8kXA9kZW2VuGJtpi/EHhmpPoM9QM=;
	h=Date:From:To:Cc:Subject;
	b=mM1sfcbPD3o0VfH4YPGHeFbXbwBMlXBNdMGNdzHwLxBo5RI5owfTq6r3vAnFftHMp
	 6CVpmPSX3TW2yzmgwAR9vTnxgpgP8qQNwqh73EklCPCPbMSwY2Cjcob1ps5T/dm+Bf
	 Nsg8c7U5TWRVD5Q5G2hjAKsq4d3Jq55wRolak1o0=
Date: Mon, 16 Nov 2026 11:53:48 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] Char/Misc/IIO driver fixes for 7.4-rc4
Message-ID: <avrgvJDaBJit5pfa@kroah.com>
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

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git tags/char-misc-7.4-rc4

for you to fetch changes up to 4dbe5ea929ac5a5b8dc21787d0e79fc55a0ea9ac:

  Merge tag 'iio-fixes-for-7.4a' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/jic23/iio into char-misc-linus (2026-11-11 09:04:02 -0500)

----------------------------------------------------------------
Char/Misc/IIO driver fixes for 7.4-rc4

Here are a bunch of char, misc, and iio driver fixes for reported
problems for 7.4-rc4.  Included in here are:
  - usual collection of lots of IIO driver fixes for issues
  - binder driver fix
  - iio, w1, and comedi driver fixes found and fixed by Josef
  - comedi driver fix for a reported problem
  - other misc driver fixes

All of these have been in linux-next for a while with no reported
issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Alexander Sarmanow (1):
      iio: light: vcnl4035: Fix reversed ALS mode bit

Alexis Bouzigues (2):
      iio: accel: adxl345: select IIO_BUFFER and IIO_KFIFO_BUF
      iio: accel: adxl313: add missing buffer selections in Kconfig

Alice Ryhl (1):
      rust_binder: push BR_TRANSACTION_COMPLETE before BR_FAILED_REPLY

Andrea Amer (1):
      iio: afe: rescale: expose offset if rescaler or source has one

Antonio Vázquez Blanco (1):
      mei: me: add ice lake point LP iTouch DID

Arka Mondal (2):
      dt-bindings: iio: dac: adi,ad5758: Fix the 4 mA to 20 mA current range
      iio: dac: ad5758: Fix the 4 mA to 20 mA current range

Arnav Kapoor (8):
      iio: imu: inv_mpu6050: fix magnetometer scale of Y and Z axes
      iio: imu: inv_mpu6050: fix swapped accel and gyro startup times
      iio: common: scmi_sensors: fix truncating 64-bit divisions
      iio: common: cros_ec_sensors: use sensor_scale union member for CALIBSCALE
      iio: proximity: sx9324: fix out-of-bounds read of scan period table
      iio: adc: mcp3564: reject devices without match data
      iio: proximity: sx9360: fix sampling frequency write and available range
      iio: proximity: sx9500: ignore event config writes that don't change state

Baek Kyu, Kim (1):
      iio: dac: mcp4725: Update the cached DAC value only on success

Billy Tsai (2):
      dt-bindings: iio: adc: Add syscon property for multi-SCU SoCs
      iio: adc: aspeed: Use syscon phandle for trimming data when available

Changyul Lee (1):
      iio: trigger: free the trigger ID after device_del()

Christopher Hoover (2):
      iio: temperature: hid-sensor-temperature: Use per-instance callbacks
      iio: humidity: hid-sensor-humidity: Use per-instance callbacks

Daniel Schaefer (1):
      iio: light: hid-sensor-als: Don't read past the end of short fields

David Carlier (1):
      iio: dac: mcp47feb02: reject out-of-range raw values

Greg Kroah-Hartman (1):
      Merge tag 'iio-fixes-for-7.4a' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/jic23/iio into char-misc-linus

Guangshuo Li (2):
      iio: accel: kxsd9: Fix potential use-after-free on removal
      misc: bcm-vk: fix DMA allocation memory leak

Ian Abbott (1):
      comedi: comedi_bond: Fix leak of opened device references

Jan Remes (1):
      iio: light: tsl2591: don't divide by zero

Jean-Baptiste Maneyrol (3):
      iio: inv_sensors: prevent timestamps going back in time in transitions
      iio: inv_sensors: do not compute period estimation when updating odr
      iio: imu: inv_icm42600: fix parsing of all FIFO frames for odr change

Jiale Yao (3):
      iio: gyro: bmg160: reject duplicate event disable
      iio: imu: kmx61: reject duplicate event disable
      misc: ibmvmc: initialize HMC state before device registration

Josef Bacik (22):
      iio: sx9310: use the data of the I2C table
      iio: addac: ad74413r: fix the values of set_multiple
      iio: adc: ad7923: add the AD7927 to the SPI ID table
      iio: adc: check the result of ad_sd_init()
      iio: accel: adxl380: don't stay in standby on -EINVAL
      comedi: fix endless recursion in comedi_event()
      comedi: addi_apci_1500: fix clearing of the gate enable
      comedi: ni_660x: don't poll without a DMA channel
      comedi: ni_tio: Fix overflow of the clock period
      comedi: vmk80xx: report failed transfers of the K8061
      misc: vmw_vmci: wait for callbacks in event unsubscribe
      w1: use the bus mutex for the "rw" file
      w1: remove the master's files before taking its locks
      w1: ds2482: set the strong pull-up with its byte
      w1: ds28e04: use the bus mutex to talk on the bus
      w1: ds2805: use the bus mutex to talk on the bus
      w1: netlink: drop the slave after the bus is unlocked
      w1: don't hold list_mutex while a slave is torn down
      w1: w1_therm: lock the list of slaves for the bulk read
      w1: w1_therm: leave the slaves of other families alone
      mei: lb: read the MTU once
      iio: hid-sensors: fix a division by zero

Karl Mehltretter (1):
      iio: trigger: Return an error when the trigger has no free irq

Loic Poulain (1):
      iio: adc: qcom-spmi-adc5-gen3: Reuse IIO device ID for ADC_TM aux device

Maximilian Czirr (1):
      iio: hid-sensor: Fix scale for magnetic north heading

Myeonghun Pak (1):
      iio: proximity: hx9023s: Allocate trigger before requesting IRQ

Nikhil Gautam (1):
      iio: atlas-ezo: Fix humidity channel read support

Salah Triki (1):
      iio: temperature: mlx90614: Fix dual channel probe condition check

Shashank Mohan Jain (2):
      iio: magnetometer: mmc35240: leave cache-only mode before the cache sync
      iio: magnetometer: mmc5633: leave cache-only mode before the cache sync

Srinivas Pandruvada (1):
      iio: hid-sensors: fix fractional part for unit exponents -7 and -8

Vidhu Sarwal (1):
      iio: humidity: am2315: fix negative temperature decoding

Viral Patel (1):
      iio: magnetometer: tlv493d: fix magnetic field scale

Yu-Hsiang Tseng (1):
      iio: acpi: Accept comma separated values in ROTM strings

 .../bindings/iio/adc/aspeed,ast2600-adc.yaml       | 17 ++++
 .../devicetree/bindings/iio/dac/adi,ad5758.yaml    |  4 +-
 drivers/android/binder/error.rs                    |  1 -
 drivers/android/binder/thread.rs                   | 31 +++----
 drivers/comedi/comedi_fops.c                       |  2 +-
 drivers/comedi/drivers/addi_apci_1500.c            |  2 +-
 drivers/comedi/drivers/comedi_bond.c               | 24 ++++--
 drivers/comedi/drivers/ni_660x.c                   |  3 +-
 drivers/comedi/drivers/ni_tio.c                    |  2 +-
 drivers/comedi/drivers/vmk80xx.c                   | 25 +++---
 drivers/iio/accel/Kconfig                          |  4 +
 drivers/iio/accel/adxl380.c                        | 11 ++-
 drivers/iio/accel/kxsd9.c                          |  2 +-
 drivers/iio/adc/ad7780.c                           |  4 +-
 drivers/iio/adc/ad7791.c                           |  4 +-
 drivers/iio/adc/ad7793.c                           |  4 +-
 drivers/iio/adc/ad7923.c                           |  1 +
 drivers/iio/adc/aspeed_adc.c                       | 25 ++++--
 drivers/iio/adc/max11205.c                         |  4 +-
 drivers/iio/adc/mcp3564.c                          |  3 +
 drivers/iio/adc/qcom-spmi-adc5-gen3.c              |  5 +-
 drivers/iio/addac/ad74413r.c                       |  2 +-
 drivers/iio/afe/iio-rescale.c                      |  3 +-
 drivers/iio/chemical/atlas-ezo-sensor.c            |  3 -
 .../iio/common/cros_ec_sensors/cros_ec_sensors.c   |  5 +-
 .../iio/common/hid-sensors/hid-sensor-attributes.c | 14 +++-
 .../iio/common/inv_sensors/inv_sensors_timestamp.c | 24 ++++--
 drivers/iio/common/scmi_sensors/scmi_iio.c         | 27 +++---
 drivers/iio/dac/ad5758.c                           |  4 +-
 drivers/iio/dac/mcp4725.c                          |  2 +
 drivers/iio/dac/mcp47feb02-core.c                  |  3 +
 drivers/iio/gyro/bmg160_core.c                     |  2 +-
 drivers/iio/humidity/am2315.c                      | 12 ++-
 drivers/iio/humidity/hid-sensor-humidity.c         | 14 ++--
 drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.c | 24 +++---
 drivers/iio/imu/inv_mpu6050/inv_mpu_core.c         | 97 +++++++++++++++++-----
 drivers/iio/imu/kmx61.c                            |  2 +-
 drivers/iio/industrialio-acpi.c                    |  9 ++
 drivers/iio/industrialio-trigger.c                 |  4 +-
 drivers/iio/light/hid-sensor-als.c                 | 16 +++-
 drivers/iio/light/tsl2591.c                        | 32 ++++---
 drivers/iio/light/vcnl4035.c                       |  4 +-
 drivers/iio/magnetometer/mmc35240.c                |  3 +-
 drivers/iio/magnetometer/mmc5633.c                 |  3 +-
 drivers/iio/magnetometer/tlv493d.c                 |  6 +-
 drivers/iio/proximity/hx9023s.c                    | 16 ++--
 drivers/iio/proximity/sx9310.c                     |  2 +-
 drivers/iio/proximity/sx9324.c                     | 13 ++-
 drivers/iio/proximity/sx9360.c                     | 29 +++++--
 drivers/iio/proximity/sx9500.c                     |  6 ++
 drivers/iio/temperature/hid-sensor-temperature.c   | 14 ++--
 drivers/iio/temperature/mlx90614.c                 |  2 +-
 drivers/misc/bcm-vk/bcm_vk_sg.c                    | 43 ++++++++--
 drivers/misc/ibmvmc.c                              | 16 ++--
 drivers/misc/mei/hw-me-regs.h                      |  1 +
 drivers/misc/mei/mei_lb.c                          | 12 ++-
 drivers/misc/mei/pci-me.c                          |  1 +
 drivers/misc/vmw_vmci/vmci_event.c                 |  7 +-
 drivers/w1/masters/ds2482.c                        | 36 ++++----
 drivers/w1/slaves/w1_ds2805.c                      |  8 +-
 drivers/w1/slaves/w1_ds28e04.c                     | 18 ++--
 drivers/w1/slaves/w1_therm.c                       | 45 ++++++----
 drivers/w1/w1.c                                    | 21 +++--
 drivers/w1/w1_int.c                                |  8 +-
 drivers/w1/w1_netlink.c                            |  8 +-
 include/linux/iio/common/inv_sensors_timestamp.h   |  3 +-
 66 files changed, 549 insertions(+), 253 deletions(-)
