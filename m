Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AAB41B8CD
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 11:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791027541; cv=none; b=eyP0A5N+DWQ9XZcOX3EllT51zvh93sonFXuWEnWR60WLKlf3VqIrcXdjpua4iyIsM8G0xMgKbk1ZvuKjNnl7f15UgxO31ajz45657HNHRD/feDNjmYAA7kpQusp6hVL5ein2Z09/LAkhwrbb9pgocKMN4gCfqy8WuNqsjfce+xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791027541; c=relaxed/simple;
	bh=vWssrW3PmtTNushxXe/++u+6ApljzBnqzeveYNuloUs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iyhh5Se4Gg2X6sl+T5oyShQPnCmFi5SQBsES8WRDTkC8c3n8xZ4W+xx0V77vlmY9Yl+i1FnhmwOMxZKGYZbVcI4seYQor7gzImbXCJ0kNSO5kFoK08b3D9WpwAWC9Ra8C+XXdsbnJDcYLPNCp5TT5f2wmnZUhA0SSeNQML5/IFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=O4Ct2NMD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="O4Ct2NMD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 688D41F0089B;
	Sat,  3 Oct 2026 11:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791027539;
	bh=4OnqpOYKzoZAgj5sdp3fqry1nbLm3FaSO/SUAOcLwBg=;
	h=Date:From:To:Cc:Subject;
	b=O4Ct2NMDN+oj1WZKk77O7KMkMEF7dSUYAan5z43/XYEQUiksHzg5dV83RhLD/OLl8
	 9mQ8LqRtgRh9Dl70zMHJi1j1MbpoRZBoApBE42TiT1cbsB5uomFAENbCxpRwCg8oR4
	 xbkf+HHUrWnt4r7cMFfoN5sFBwCEnuYpybfURKVA=
Date: Sat, 3 Oct 2026 13:38:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] Char/Misc/IIO driver driver updates for 7.3-rc6 - try 2
Message-ID: <asDpUM4XCyJOh0-U@kroah.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

This time with the proper message.
----------------------

The following changes since commit df2908090cda368b01ff43709f51890076c56157:

  Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git tags/char-misc-7.3-rc6

for you to fetch changes up to 8e242ada093af7d2ee82037f09c287fbc6f1e3f5:

  Merge tag 'iio-fixes-late-7.3' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/jic23/iio into char-misc-linus (2026-10-01 14:57:00 +0200)

----------------------------------------------------------------
Char/Misc/IIO fixes for 7.3-rc6

Here is a set of char/misc/iio and other small driver subsystem fixes
for 7.3-rc6 that resolve a number of reported issues.  Included in here
are:
  - lots of small iio driver fixes for reported problems.
  - interconnect driver revert to resolve a regression
  - nitro_enclaves driver fix for a use-after-free
  - binder driver fixes for reported problems (in both the rust and C
    versions)

All of these have been in linux-next with no reported issues

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Alice Ryhl (2):
      rust_binder: cancel deferred work items in thread exit
      rust_binder: reschedule node refcount update on thread exit

Antoniu Miclaus (3):
      iio: adc: ade9000: request interrupts after powering the device
      iio: adc: ade9000: fix overlapping scan_index for current and voltage channels
      iio: adc: ade9000: handle Phase C dip events in IRQ1 handler

Arka Mondal (3):
      iio: imu: adis16480: fix unprotected debugfs reads
      iio: imu: adis16400: fix unprotected debugfs reads
      iio: gyro: adis16136: fix unprotected debugfs reads

Carlos Llamas (1):
      rust_binderfs: add transaction_report feature entry

Cong Nguyen (2):
      iio: adc: max1363: sign-extend bipolar differential channel reads
      iio: proximity: pulsedlight: fix iio_device left registered on PM setup failure

Donggeun Yoo (1):
      iio: proximity: vl53l0x-i2c: claim direct mode for raw reads

Fabrice Gasnier (2):
      iio: adc: stm32-adc: fix check on internal channel availability
      iio: adc: stm32-adc: fix possible division by zero in processed channel

Fan Wu (4):
      iio: light: gp2ap020a00f: drain irq_work after free_irq
      iio: adc: xilinx-xadc: free IRQ before cancelling the unmask worker on unbind
      iio: trigger: cancel reenable_work before freeing trigger
      iio: adc: ad_sigma_delta: fix use-after-free on unbind

Felix Gu (2):
      iio: adc: sun4i-gpadc-iio: drop underflowing pm_runtime_put() calls
      iio: adc: sun4i-gpadc-iio: clean up on thermal zone registration failure

Geert Uytterhoeven (1):
      iio: frequency: adf4377: Fully initialize clk_init_data and clk_parent_data

Greg Kroah-Hartman (3):
      Merge tag 'iio-fixes-for-7.3a' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/jic23/iio into char-misc-linus
      Merge tag 'icc-7.3-rc5' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/djakov/icc into char-misc-linus
      Merge tag 'iio-fixes-late-7.3' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/jic23/iio into char-misc-linus

Hui Su (1):
      iio: pressure: bmp280: fix out-of-bounds access in sampling frequency lookup

Janani Sunil (1):
      iio: adc: adi-axi-adc: Initialize state mutex

Jean-Baptiste Maneyrol (1):
      iio: inv_sensors: fix estimated value larger than interrupt timestamp

Jiale Yao (1):
      iio: accel: kxcjk-1013: reject duplicate event disable

Jinseob Kim (1):
      iio: buffer: serialize buffer teardown with mode claims

Jonathan Cameron (1):
      iio: buffer: Ensure bounce buffer used for unaligned case is zeroed.

Laxman Acharya Padhya (1):
      iio: proximity: aw96103: validate firmware data length

Linmao Li (3):
      iio: imu: inv_icm42607: propagate runtime suspend errors
      iio: imu: inv_icm42607: restore runtime PM on system resume errors
      iio: adc: ade9000: fix NULL pointer dereference in clkout registration

Marc Zyngier (1):
      Revert "interconnect: qcom: x1e80100: enable QoS configuration"

Marcelo Schmitt (1):
      iio: adc: ad7173: Fix digital filter configuration

Marco Chen (1):
      iio: health: max30102: fix NULL dereference in interrupt handler

Matti Vaittinen (10):
      iio: adc: rohm-bd79124: Fix rising alarm
      iio: adc: rohm-bd79124: Fix channel initialization
      iio: adc: rohm-bd79124: Fix GPIO mask check
      iio: adc: rohm-bd79124: Catch regmap errors at measurement start/stop
      iio: dac: rohm-bd79703: Do not allow writing SCALE
      iio: pressure: rohm-bm1390: Return error when read fails
      iio: light: rohm-bu27034: Fix error return
      iio: accel: kionix-kx022a: Fix array boundary check
      iio: light: rohm-bu27034: Fix infinite delay on error
      iio: accel: kionix-kx022a: Prevent memory leak and fix state

Michael Hennerich (1):
      iio: buffer-dmaengine: fix sg entry iteration when building dma_vecs

Peiyang He (1):
      binderfs: fix UAF write in binder_add_device

Pengpeng Hou (2):
      iio: adc: aspeed: propagate reset deassert errors
      iio: cdc: ad7150: fix OF matching and publish module aliases

Runyu Xiao (1):
      iio: admv1013: initialize callback mutex before registering notifier

Salah Triki (5):
      iio: accel: sca3000: fix frequency divider condition check
      iio: frequency: admv1013: fix wrong channel field used in admv1013_read_raw()
      iio: proximity: vcnl3020: fix ISR bitmask check in IRQ handler
      iio: proximity: isl29501: Fix return type of isl29501_register_write
      iio: adc: ad4030: fix invalid oversampling_ratio validation

Slavin Liu (1):
      iio: adc: pac1934: check ACPI label duplication

Tomer Pomeranc (2):
      binder: fix leaked fd fixups on TF_UPDATE_TXN supersede
      binder: fix is_failure flag for superseded transaction cleanup

Tuna Kılıç (1):
      iio: dac: mcp47a1: Allow full-scale output

Vladislav Leonov (2):
      dt-bindings: iio: adc: rockchip-saradc: Group single-entries into an enum list
      dt-bindings: iio: adc: rockchip-saradc: Fix RV1106 compatible

Vladyslav Ivashchenko (1):
      iio: adc: axp288: Add TS bias override for Haier HV103H

Yuxiao Wang (1):
      nitro_enclaves: fix use-after-free on SLOT_ALLOC failure

Zhang Jie (1):
      iio: proximity: sx9324: Correct proximity channel resolution

 .../bindings/iio/adc/rockchip-saradc.yaml          |  18 +-
 drivers/android/binder.c                           |   3 +-
 drivers/android/binder/node.rs                     |  20 +-
 drivers/android/binder/node/wrapper.rs             |  34 +-
 drivers/android/binder/rust_binderfs.c             |   8 +
 drivers/android/binder/thread.rs                   |   8 +-
 drivers/android/binderfs.c                         |   3 +-
 drivers/iio/accel/kionix-kx022a.c                  |  30 +-
 drivers/iio/accel/kxcjk-1013.c                     |   2 +-
 drivers/iio/accel/sca3000.c                        |   2 +-
 drivers/iio/adc/ad4030.c                           |  11 +-
 drivers/iio/adc/ad7173.c                           |   4 +-
 drivers/iio/adc/ad_sigma_delta.c                   |  31 +-
 drivers/iio/adc/ade9000.c                          |  36 +-
 drivers/iio/adc/adi-axi-adc.c                      |   4 +
 drivers/iio/adc/aspeed_adc.c                       |   4 +-
 drivers/iio/adc/axp288_adc.c                       |   8 +
 drivers/iio/adc/max1363.c                          |   8 +
 drivers/iio/adc/pac1934.c                          |   4 +
 drivers/iio/adc/rohm-bd79124.c                     |  20 +-
 drivers/iio/adc/stm32-adc.c                        |  47 +-
 drivers/iio/adc/sun4i-gpadc-iio.c                  |  10 +-
 drivers/iio/adc/xilinx-xadc-core.c                 |   9 +-
 drivers/iio/buffer/industrialio-buffer-dmaengine.c |  16 +-
 drivers/iio/cdc/ad7150.c                           |   8 +-
 .../iio/common/inv_sensors/inv_sensors_timestamp.c |  11 +-
 drivers/iio/dac/mcp47a1.c                          |   4 +-
 drivers/iio/dac/rohm-bd79703.c                     |   3 +
 drivers/iio/frequency/adf4377.c                    |   4 +-
 drivers/iio/frequency/admv1013.c                   |   9 +-
 drivers/iio/gyro/adis16136.c                       |   2 +-
 drivers/iio/health/max30102.c                      |  12 +-
 drivers/iio/imu/adis16400.c                        |   2 +-
 drivers/iio/imu/adis16480.c                        |   4 +-
 drivers/iio/imu/inv_icm42607/inv_icm42607_core.c   |  38 +-
 drivers/iio/industrialio-buffer.c                  |   7 +-
 drivers/iio/industrialio-trigger.c                 |   2 +
 drivers/iio/light/gp2ap020a00f.c                   |   2 +
 drivers/iio/light/rohm-bu27034.c                   |  62 +--
 drivers/iio/pressure/bmp280-core.c                 |   2 +-
 drivers/iio/pressure/rohm-bm1390.c                 |   2 +-
 drivers/iio/proximity/aw96103.c                    |  30 +-
 drivers/iio/proximity/isl29501.c                   |   2 +-
 drivers/iio/proximity/pulsedlight-lidar-lite-v2.c  |   4 +-
 drivers/iio/proximity/sx9324.c                     |   2 +-
 drivers/iio/proximity/vcnl3020.c                   |  24 +-
 drivers/iio/proximity/vl53l0x-i2c.c                |   3 +
 drivers/interconnect/qcom/x1e80100.c               | 485 ---------------------
 drivers/virt/nitro_enclaves/ne_misc_dev.c          |   1 +
 49 files changed, 407 insertions(+), 658 deletions(-)
