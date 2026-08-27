Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647AC449EA9
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834698; cv=none; b=fmmhGnLlaYgDtnkoPAohal8IflBbGq+troX5RG2MWAusKbDRvVOumLIke0aNmXadS5TzvFRSpAZR/PefjDUbBbefYF25MG5sQf05HW4Ufw1s4yn5GEaL+x42+JDGBxUmis6aMbarvZkeWDZWbtOz0WLoL1Dt7yixpIfWMgn5GR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834698; c=relaxed/simple;
	bh=V/G6M69bjWsONFtxKsIL2HBnJawSobgPSoJmG5BnrLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dp4sy5G43EKLdyMPqWdphd7D43sQ8gEXZkaSjTV7wwmAyWVdtBMu8GpWE0IcIDm0mvrHb4fCyBkw37Apy+tFY2fiPPDix8Ch/347ObkEMghtfrN2XoH4YSi1jD44woUjHBmMaMvoFSsFNViYFNLNvBYABsNdTA4KghXTRSZHim4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DUfuQGLX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DUfuQGLX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 958B11F00A3A;
	Thu, 27 Aug 2026 12:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787834669;
	bh=U/x2//1xiJI0WjzxhVYRiwChAKo7XHur9VzmyCwFa/I=;
	h=Date:From:To:Cc:Subject;
	b=DUfuQGLXJ0iuWoTYkXTI9K7Pg6gAbO/Ve1M1nSmem23FNFdmcX5Z5gJS6OvGroqWD
	 RwSlgczAdF2bhWw+qAJCQaFGdHUmf+EEbHuTVvhJ5QkWj97wcNnXNurNBNP/03JNHn
	 ddYWJNjLeLvsOxSRbYmjSXxXJuZW2Z7Meayj7d6kKSml+HNzUuDirOtkPoLXVP6Ldz
	 0kh8CSAsg4DxjgAftnWcQhRhfY3D0EhadyfeDRJmnFLmV3umkT8jDVTO1UYC+8sxs9
	 sqJkJ8PqqHqRahTv9PvLn37KvIRj5MKxI6J28VQq9wEpQP+Lz3xilJ2RylwcWyknqC
	 RmdZx3lOeal8Q==
Date: Thu, 27 Aug 2026 13:44:25 +0100
From: Lee Jones <lee@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] MFD for v7.3
Message-ID: <20260827124425.GE770273@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Good afternoon Linus,

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/mfd-next-7.3

for you to fetch changes up to 9d0e4b1ae5b045a2c92b0b9a1c3b268191c219d9:

  mfd: cs42l43: Fix regmap defaults ordering (2026-08-12 12:27:15 +0100)

----------------------------------------------------------------
MFD for v7.3

- New Support & Features
  - MediaTek MT6397: Add mt6323 AUXADC support.
  - MediaTek MT6397: Add mt6323 EFUSE support.
  - Spreadtrum SC27xx: Add SC2730 regulator cell.

- Improvements & Fixes
  - Apple SMC: Fix key count endianness annotation.
  - Azoteq IQS62x: Reject zero-length firmware records.
  - ChromeOS EC: Introduce cros_ec_read_features helper and read features during
    probe to catch transfer errors.
  - Cirrus Logic CS42L43: Fix regmap defaults ordering.
  - Cirrus Logic CS42L43: Remove redundant NULL checks on SoundWire.
  - Congatec Board Controller: Fix teardown ordering in cgbc_remove().
  - HP iPAQ Micro: Fix out-of-bounds stack read in ipaq_micro_str.
  - Marvell 88PM886: Initialize the battery page.
  - QNAP MCU: Keep the reply buffer alive past a command timeout.
  - RAVE SP: Validate received frame payload lengths.
  - Silicon Labs Si476x: Drop duplicate NULL checks.
  - Silicon Labs Si476x: Modernize GPIO handling.
  - Silicon Motion SM501: Fix potential memory leaks during remove.
  - UCB1x00: Convert Assabet gpio-keys to use software nodes and register software
    node for GPIO controller.
  - Viperboard: Fix native fields type in structures as little-endian.
  - Viperboard: Remove redundant NULL check before kfree().
  - X-Powers AXP20x: Preserve other control bits when powering off.

- Cleanups & Refactoring
  - Core: Drop unused assignment of spi_device_id driver data.
  - Core: Initialize spi_device_id arrays using member names.
  - Core: Unify style of spi_device_id arrays.
  - Maintainers: Add Intel LPSS section to follow the changes.
  - Maintainers: Add a mailing list entry to MFD.
  - Cirrus Logic CS42L43: Format sdw_device_id table.
  - Cirrus Logic CS42L43: Use new SoundWire enumeration helper.
  - ROHM PMIC: Factor out power button registration and convert gpio-keys to use
    software nodes.
  - ST-Ericsson DB8500: Fold dbx500 header into db8500.

- Device Tree Binding Updates
  - Core: Add techvision vendor prefix.
  - Marvell 88PM886: Allow vbus regulator.
  - MediaTek MT8195 SCP: Add support for MT8189 SoC.
  - Qualcomm SPMI PMIC: Document PMG1110.
  - Qualcomm SPMI PMIC: Document haptics device.
  - Qualcomm TCSR: Add compatible for Hawi and Maili SoCs.
  - Qualcomm TCSR: Add compatible for Shikra.
  - Qualcomm TCSR: Document the IPQ9650 TCSR block.
  - STMicroelectronics STMPE: Fix typo st,stmpe601 (should be st,stmpe610).
  - Syscon: Add ESWIN EIC7700 compatible.
  - Syscon: Allow syscon compatible for Loongson-2K0300 chip id.
  - Syscon: Disallow simple-bus with syscon.
  - Syscon: Drop custom select for older dtschema.
  - TI OMAP USBHS TLL: Convert to DT schema.

----------------------------------------------------------------
Abdun Nihaal (1):
      mfd: sm501: Fix potential memory leaks during remove

Ali Ahmet Memis (1):
      mfd: qnap-mcu: keep the reply buffer alive past a command timeout

Andrei Kuchynski (2):
      platform/chrome: cros_ec_proto: Introduce cros_ec_read_features helper
      mfd: cros_ec: Read EC features during probe to catch transfer error

Andy Shevchenko (2):
      MAINTAINERS: Add Intel LPSS section to follow the changes
      mfd: si476x-i2c: Get rid of duplicate NULL checks

Binbin Zhou (1):
      dt-bindings: mfd: syscon: Allow syscon compatible for Loongson-2K0300 chip id

Charles Keepax (4):
      mfd: cs42l43: Use new SoundWire enumeration helper
      mfd: cs42l43: Remove redundant NULL checks on SoundWire
      mfd: cs42l43: Tidy up formatting on sdw_device_id table
      mfd: cs42l43: Fix regmap defaults ordering

Dmitry Torokhov (6):
      mfd: rohm-bd71828: Use software nodes for gpio-keys
      mfd: rohm-bd718x7: Use software nodes for gpio-keys
      mfd: ipaq-micro: Fix out-of-bounds stack read in ipaq_micro_str
      mfd: ucb1x00: Register software node for GPIO controller
      mfd: ucb1x00: Convert Assabet gpio-keys to use software nodes
      mfd: rohm: Factor out power button registration

Duje Mihanović (2):
      dt-bindings: mfd: 88pm886: Allow vbus regulator
      mfd: 88pm886: Initialize the battery page

Eduard Bostina (1):
      dt-bindings: mfd: Convert OMAP USB TLL to DT schema

Fenglin Wu (2):
      dt-bindings: mfd: qcom,spmi-pmic: Document PMG1110
      dt-bindings: mfd: qcom,spmi-pmic: Document haptics device

Frank Li (1):
      dt-bindings: mfd: st,stmpe: Fix typo st,stmpe601 (should be st,stmpe610)

Kathiravan Thirumoorthy (1):
      dt-bindings: mfd: qcom,tcsr: Document the IPQ9650 TCSR block

Komal Bajaj (1):
      dt-bindings: mfd: qcom,tcsr: Add compatible for Shikra

Krzysztof Kozlowski (2):
      dt-bindings: mfd: syscon: Disallow simple-bus with syscon
      dt-bindings: mfd: syscon: Drop custom select for older dtschema

Lee Jones (2):
      Merge branches 'ib-mfd-legacy-gpio-7.3' and 'ib-mfd-platform-chrome-7.3' into ibs-for-mfd-merged
      MAINTAINERS: Add a mailing list entry to MFD

Linus Walleij (2):
      mfd: si476x: Modernize GPIO handling
      mfd: db8500-prcmu: Fold dbx500 header into db8500

Louis-Alexis Eyraud (1):
      dt-bindings: mfd: mediatek,mt8195-scpsys: Add support for MT8189 SoC

Mikhail Lukianchikov (1):
      mfd: viperboard: Fix native fields type in structures as little-endian

Mohammad Shahid (1):
      mfd: viperboard: Remove redundant NULL check before kfree()

Mukesh Ojha (1):
      dt-bindings: mfd: qcom,tcsr: Add compatible for Hawi and Maili SoCs

Oleg Proshkin (1):
      mfd: axp20x: Preserve other control bits when powering off

Otto Pflüger (1):
      mfd: sprd-sc27xx: Add SC2730 regulator cell

Pengpeng Hou (2):
      mfd: rave-sp: validate received frame payload lengths
      mfd: iqs62x: Reject zero-length firmware records

Pinkesh Vaghela (1):
      dt-bindings: mfd: syscon: Add ESWIN EIC7700 compatible

Roman Vivchar (2):
      mfd: mt6397-core: Add mt6323 EFUSE support
      mfd: mt6397-core: Add mt6323 AUXADC support

Samuel Holland (1):
      dt-bindings: vendor-prefixes: Add techvision

Sven Peter (1):
      mfd: macsmc: Fix key count endianness annotation

Thomas Richard (1):
      mfd: cgbc: Fix teardown ordering in cgbc_remove()

Uwe Kleine-König (The Capable Hub) (3):
      mfd: Drop unused assignment of spi_device_id driver data
      mfd: Initialize spi_device_id arrays using member names
      mfd: Unify style of spi_device_id arrays

 Documentation/devicetree/bindings/Makefile         |   2 +-
 .../bindings/mfd/marvell,88pm886-a1.yaml           |   2 +-
 .../bindings/mfd/mediatek,mt8195-scpsys.yaml       |   1 +
 .../devicetree/bindings/mfd/omap-usb-tll.txt       |  27 -
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |   5 +
 .../devicetree/bindings/mfd/qcom,tcsr.yaml         |   4 +
 .../devicetree/bindings/mfd/st,stmpe.yaml          |   2 +-
 .../devicetree/bindings/mfd/syscon-common.yaml     |  34 ++
 Documentation/devicetree/bindings/mfd/syscon.yaml  | 118 +----
 .../devicetree/bindings/mfd/ti,usbhs-tll.yaml      |  53 ++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |  14 +
 arch/arm/mach-ux500/cpu-db8500.c                   |   6 +-
 drivers/clk/ux500/clk-prcmu.c                      |  20 +-
 drivers/clk/ux500/u8500_of_clk.c                   |   2 +-
 drivers/cpuidle/cpuidle-ux500.c                    |   6 +-
 drivers/mfd/88pm886.c                              |  21 +-
 drivers/mfd/Kconfig                                |   7 +-
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/ab8500-core.c                          |   2 +-
 drivers/mfd/altera-a10sr.c                         |   2 +-
 drivers/mfd/arizona-spi.c                          |  12 +-
 drivers/mfd/axp20x.c                               |   2 +-
 drivers/mfd/cgbc-core.c                            |   4 +-
 drivers/mfd/cros_ec_dev.c                          |  18 +-
 drivers/mfd/cs40l50-spi.c                          |   4 +-
 drivers/mfd/cs42l43-i2c.c                          |   2 -
 drivers/mfd/cs42l43-sdw.c                          |  13 +-
 drivers/mfd/cs42l43.c                              |  30 +-
 drivers/mfd/da9052-spi.c                           |  12 +-
 drivers/mfd/db8500-prcmu.c                         |   6 +-
 drivers/mfd/intel-m10-bmc-spi.c                    |   6 +-
 drivers/mfd/ipaq-micro.c                           |   2 +-
 drivers/mfd/iqs62x.c                               |   2 +-
 drivers/mfd/macsmc.c                               |   8 +-
 drivers/mfd/madera-spi.c                           |  18 +-
 drivers/mfd/motorola-cpcap.c                       |   6 +-
 drivers/mfd/mt6397-core.c                          |   6 +
 drivers/mfd/ocelot-spi.c                           |   2 +-
 drivers/mfd/qnap-mcu.c                             |  13 +-
 drivers/mfd/rave-sp.c                              |  64 ++-
 drivers/mfd/rk8xx-spi.c                            |   2 +-
 drivers/mfd/rohm-bd71828.c                         |  49 +-
 drivers/mfd/rohm-bd718x7.c                         |  45 +-
 drivers/mfd/rohm-pwrbutton.c                       | 112 ++++
 drivers/mfd/rohm-pwrbutton.h                       |  12 +
 drivers/mfd/rsmu_spi.c                             |  12 +-
 drivers/mfd/si476x-cmd.c                           |   1 -
 drivers/mfd/si476x-i2c.c                           |  47 +-
 drivers/mfd/sm501.c                                |   2 +
 drivers/mfd/sprd-sc27xx-spi.c                      |   3 +-
 drivers/mfd/stmpe-spi.c                            |  12 +-
 drivers/mfd/tps65912-spi.c                         |   2 +-
 drivers/mfd/ucb1x00-assabet.c                      | 120 ++++-
 drivers/mfd/ucb1x00-core.c                         |  16 +-
 drivers/mfd/viperboard.c                           |   3 +-
 drivers/mfd/wm831x-spi.c                           |  16 +-
 drivers/platform/chrome/cros_ec_proto.c            |  30 +-
 drivers/regulator/db8500-prcmu.c                   |  12 +-
 drivers/thermal/db8500_thermal.c                   |  10 +-
 drivers/watchdog/db8500_wdt.c                      |  22 +-
 include/linux/mfd/88pm886.h                        |   5 +
 include/linux/mfd/cs42l43.h                        |   2 -
 include/linux/mfd/db8500-prcmu.h                   | 252 ++++++++-
 include/linux/mfd/dbx500-prcmu.h                   | 575 ---------------------
 include/linux/mfd/si476x-core.h                    |   5 +-
 include/linux/mfd/si476x-platform.h                |   2 -
 include/linux/mfd/ucb1x00.h                        |   3 +
 include/linux/mfd/viperboard.h                     |  10 +-
 include/linux/platform_data/cros_ec_proto.h        |   2 +
 sound/soc/ux500/ux500_msp_dai.c                    |   2 +-
 71 files changed, 910 insertions(+), 1037 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/omap-usb-tll.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/ti,usbhs-tll.yaml
 create mode 100644 drivers/mfd/rohm-pwrbutton.c
 create mode 100644 drivers/mfd/rohm-pwrbutton.h
 delete mode 100644 include/linux/mfd/dbx500-prcmu.h
 
-- 
Lee Jones
