Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716023;
	b=cVuMLj2z6WlSwt9WRxunxGqZNg3Y+eYsX35MB6mKvA0JpZE//kM2dS6X+XZqNmBuSIt3
	 l+8gpO6iV+uutpptbt/7sJUsDg8W1geOdkM7u4GYlZKpgVBEAB5/FmP13nVmyJM2+tnsF
	 BKz7X4iLih+Ap1OBbtKKG5N+TgYGQmubZsj6T3V7bk+pEP+DnNp9au+zvqkOag9j4hEb/
	 0WN5EvBkzLY6PecFDQ5KEJ4lxcgELyNQL4Ps/OBgii2Q/MxglF+/qsIwgCIRRfjE0FODV
	 ubG3u6m9tmwtqVqDYPzlsty1kSsx1Ab9ngaz9XuiZznvN0eehylIi7EmuxlkQt4fupA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716023;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=k2JrzHp1rbd2MCBFsTwp8W1QMSqZcHRrzRrX5RSgZWc=;
	b=n/YFlp4Qn+kN4+WEhgMJt8nbl4pKyk6KdZzwvmViGlZrPyktMhLZS+Nfo09ue9zxPGwN
	 OINWn7BIWk5h9KOWjyI6M6fHlhgxyifWboD0WNMuehR+3B5QtbWfCtXGmgt64NbjGERKB
	 DGUQJZStiyEFPCjLM92YfEEwL7qFuhzdabZElbrHBD0YP1QenBa6uxZcAPm5SNq0bd8/7
	 bws9jzEB9BBCaNlGWeQHK/GSJqo9Chy3lWvNA6yWTOR9DB8sSjrCUT7KE0t7NsdMRjOpr
	 d5SU0TvHvybrpmWNbMzBIxhNQRGGt/YHMIgmQ90osT+D+GMqdljy7gWeboqEy5zAHNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DBN5faFK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD286606A324;
	Tue,  3 Nov 2026 14:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DBN5faFK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A1781F000C1;
	Tue,  3 Nov 2026 14:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793716021;
	bh=k2JrzHp1rbd2MCBFsTwp8W1QMSqZcHRrzRrX5RSgZWc=;
	h=Date:From:To:Cc:Subject;
	b=DBN5faFKhcsFZ/LxSGgOh1X9C5BXu4RA6/U7aQ6ksg4zuvj82cdj5AZJtxWnmRokv
	 EWKowlPueuQK8nA5tVKflvXxEDC1EedZJHb50c+AAM+MpPLKX9GX/V9NuRDvYOFrXf
	 M7vFjGElpwie2ygKjApa9Yh6zj6zqCXlkJV6gogjXwFxvgKHMO9ZURLUMf7ZHbRKcH
	 2D7eqZKoO5vimq4OcJPEI0AVLNapC+rHrUkvChD/7BYiS5TbidmmaFfnTKkZQBHj/Y
	 PvMCN9vSK3OeR+3WT3XXEYSlerGh9isIDh/qeCrhSmYsmfRquAdoXY7JjOQsY59z59
	 x58G5rGu1Vvcg==
Date: Tue, 3 Nov 2026 14:26:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Roman Vivchar <rva333@protonmail.com>,
	Ryan Brue <ryanbrue.dev@gmail.com>
Subject: linux-next: manual merge of the nvmem tree with the iio tree
Message-ID: <aunvMDSLEcYVm2ja@sirena.org.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eWA+cYHEmGO8rOAR"
Content-Disposition: inline


--eWA+cYHEmGO8rOAR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the nvmem tree got a conflict in:

  MAINTAINERS

between commit:

  8f809aa846980 ("dt-bindings: iio: adc: mediatek,mt6359-auxadc: add mt6397=
 PMIC AUXADC")

=66rom the iio tree and commit:

  70a3d85e936cb ("nvmem: add mt6323 PMIC EFUSE driver")

=66rom the nvmem tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined MAINTAINERS
index 7e32f4ae86e6e,6ec0ed61260c7..0000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -113,7 -113,7 +113,7 @@@ F:	net/6lowpan
  M:	Johannes Berg <johannes@sipsolutions.net>
  L:	linux-wireless@vger.kernel.org
  S:	Maintained
 -W:	https://wireless.wiki.kernel.org/
 +W:	https://wireless.docs.kernel.org/en/latest/
  Q:	https://patchwork.kernel.org/project/linux-wireless/list/
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-ne=
xt.git
@@@ -262,14 -262,6 +262,14 @@@ L:	linux-gpio@vger.kernel.or
  S:	Maintained
  F:	drivers/gpio/gpio-pcie-idio-24.c
 =20
 +ACER ASPIRE 14 AI (A14-52M, A14-52MT) EC FAN DRIVER
 +M:	Ethan Jimmy <duhxu0@gmail.com>
 +L:	linux-hwmon@vger.kernel.org
 +L:	linux-input@vger.kernel.org
 +S:	Maintained
 +F:	Documentation/hwmon/acer-aspire14-ec.rst
 +F:	drivers/hwmon/acer-aspire14-ec.c
 +
  ACER ASPIRE ONE TEMPERATURE AND FAN DRIVER
  M:	Peter Kaestle <peter@piie.net>
  L:	platform-driver-x86@vger.kernel.org
@@@ -335,17 -327,6 +335,17 @@@ F:	drivers/acpi/acpica
  F:	include/acpi/
  F:	tools/power/acpi/
 =20
 +ACPI CPPC
 +M:	"Rafael J. Wysocki" <rafael@kernel.org>
 +M:	Christian Loehle <christian.loehle@arm.com>
 +L:	linux-acpi@vger.kernel.org
 +L:	linux-pm@vger.kernel.org
 +S:	Maintained
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm
 +F:	Documentation/admin-guide/acpi/cppc_sysfs.rst
 +F:	drivers/acpi/cppc_acpi.c
 +F:	include/acpi/cppc_acpi.h
 +
  ACPI FOR ARM64 (ACPI/arm64)
  M:	Lorenzo Pieralisi <lpieralisi@kernel.org>
  M:	Hanjun Guo <guohanjun@huawei.com>
@@@ -358,15 -339,6 +358,15 @@@ S:	Maintaine
  F:	drivers/acpi/arm64
  F:	include/linux/acpi_iort.h
 =20
 +ACPI FOR LOONGARCH (ACPI/LoongArch)
 +M:	Bibo Mao <maobibo@loongson.cn>
 +M:	Huacai Chen <chenhuacai@kernel.org>
 +L:	linux-acpi@vger.kernel.org
 +L:	loongarch@lists.linux.dev
 +S:	Maintained
 +F:	drivers/acpi/loongarch/
 +F:	include/linux/acpi_iovt.h
 +
  ACPI FOR RISC-V (ACPI/riscv)
  M:	Sunil V L <sunilvl@ventanamicro.com>
  L:	linux-acpi@vger.kernel.org
@@@ -668,7 -640,6 +668,7 @@@ F:	drivers/iio/accel/adxl355_spi.
 =20
  ADXL367 THREE-AXIS DIGITAL ACCELEROMETER DRIVER
  M:	Marcelo Schmitt <marcelo.schmitt@analog.com>
 +M:	Antoniu Miclaus <antoniu.miclaus@analog.com>
  L:	linux-iio@vger.kernel.org
  S:	Supported
  W:	https://ez.analog.com/linux-software-drivers
@@@ -796,14 -767,6 +796,14 @@@ F:	Documentation/devicetree/bindings/ph
  F:	drivers/phy/phy-airoha-pcie-regs.h
  F:	drivers/phy/phy-airoha-pcie.c
 =20
 +AIROHA SOUND DRIVER
 +M:	Christian Marangi <ansuelsmth@gmail.com>
 +L:	linux-sound@vger.kernel.org
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
 +F:	Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
 +F:	sound/soc/mediatek/an7581/*
 +
  AIROHA SPI SNFI DRIVER
  M:	Lorenzo Bianconi <lorenzo@kernel.org>
  M:	Ray Liu <ray.liu@airoha.com>
@@@ -1114,6 -1077,7 +1114,6 @@@ F:	include/linux/cdx/
 =20
  AMD CRYPTOGRAPHIC COPROCESSOR (CCP) DRIVER
  M:	Tom Lendacky <thomas.lendacky@amd.com>
 -M:	John Allen <john.allen@amd.com>
  L:	linux-crypto@vger.kernel.org
  S:	Supported
  F:	drivers/crypto/ccp/
@@@ -1217,8 -1181,8 +1217,8 @@@ F:	drivers/platform/x86/amd/hfi
 =20
  AMD IOMMU (AMD-VI)
  M:	Joerg Roedel (AMD) <joro@8bytes.org>
 +M:	Vasant Hegde <vasant.hegde@amd.com>
  R:	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
 -R:	Vasant Hegde <vasant.hegde@amd.com>
  L:	iommu@lists.linux.dev
  S:	Maintained
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
@@@ -1254,7 -1218,7 +1254,7 @@@ AMD KF
  M:	Felix Kuehling <Felix.Kuehling@amd.com>
  L:	amd-gfx@lists.freedesktop.org
  S:	Supported
 -T:	git https://gitlab.freedesktop.org/agd5f/linux.git
 +T:	git https://gitlab.freedesktop.org/drm/amdgpu/kernel.git
  F:	drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd*.[ch]
  F:	drivers/gpu/drm/amd/amdkfd/
  F:	drivers/gpu/drm/amd/include/cik_structs.h
@@@ -1358,7 -1322,6 +1358,7 @@@ AMD SENSOR FUSION HUB DRIVE
  M:	Basavaraj Natikar <basavaraj.natikar@amd.com>
  L:	linux-input@vger.kernel.org
  S:	Maintained
 +F:	Documentation/ABI/testing/sysfs-driver-amd-sfh
  F:	Documentation/hid/amd-sfh*
  F:	drivers/hid/amd-sfh-hid/
  F:	drivers/input/misc/amd_sfh_tabletmode.c
@@@ -1408,13 -1371,6 +1408,13 @@@ F:	Documentation/devicetree/bindings/pe
  F:	drivers/perf/amlogic/
  F:	include/soc/amlogic/
 =20
 +AMLOGIC DMA DRIVER
 +M:	Xianwei Zhao <xianwei.zhao@amlogic.com>
 +L:	linux-amlogic@lists.infradead.org
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/dma/amlogic,a9-dma.yaml
 +F:	drivers/dma/amlogic-dma.c
 +
  AMLOGIC ISP DRIVER
  M:	Keke Li <keke.li@amlogic.com>
  L:	linux-media@vger.kernel.org
@@@ -1498,13 -1454,6 +1498,13 @@@ S:	Maintaine
  F:	Documentation/devicetree/bindings/iio/light/ams,as73211.yaml
  F:	drivers/iio/light/as73211.c
 =20
 +AMS AS7343 DRIVER
 +M:	Chang Yu <marcus.yu.56@gmail.com>
 +L:	linux-iio@vger.kernel.org
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/iio/light/ams,as7343.yaml
 +F:	drivers/iio/light/as7343.c
 +
  AMT (Automatic Multicast Tunneling)
  M:	Taehee Yoo <ap420073@gmail.com>
  L:	netdev@vger.kernel.org
@@@ -1519,7 -1468,6 +1519,7 @@@ L:	linux-iio@vger.kernel.or
  S:	Supported
  W:	https://ez.analog.com/linux-software-drivers
  F:	Documentation/devicetree/bindings/iio/dac/adi,ad3530r.yaml
 +F:	Documentation/devicetree/bindings/iio/dac/adi,ad5710r.yaml
  F:	drivers/iio/dac/ad3530r.c
 =20
  ANALOG DEVICES INC AD3552R DRIVER
@@@ -1569,7 -1517,6 +1569,7 @@@ F:	drivers/iio/adc/ad4080.
 =20
  ANALOG DEVICES INC AD4130 DRIVER
  M:	Marcelo Schmitt <marcelo.schmitt@analog.com>
 +M:	Antoniu Miclaus <antoniu.miclaus@analog.com>
  L:	linux-iio@vger.kernel.org
  S:	Supported
  W:	https://ez.analog.com/linux-software-drivers
@@@ -1583,7 -1530,6 +1583,7 @@@ L:	linux-iio@vger.kernel.or
  S:	Supported
  W:	https://ez.analog.com/linux-software-drivers
  F:	Documentation/devicetree/bindings/iio/adc/adi,ad4134.yaml
 +F:	Documentation/iio/ad4134.rst
  F:	drivers/iio/adc/ad4134.c
 =20
  ANALOG DEVICES INC AD4170-4 DRIVER
@@@ -1625,14 -1571,6 +1625,14 @@@ W:	https://ez.analog.com/linux-software
  F:	Documentation/devicetree/bindings/iio/adc/adi,ad4851.yaml
  F:	drivers/iio/adc/ad4851.c
 =20
 +ANALOG DEVICES INC AD5529R DRIVER
 +M:	Janani Sunil <janani.sunil@analog.com>
 +L:	linux-iio@vger.kernel.org
 +S:	Supported
 +W:	https://ez.analog.com/linux-software-drivers
 +F:	Documentation/devicetree/bindings/iio/dac/adi,ad5529r.yaml
 +F:	drivers/iio/dac/ad5529r.c
 +
  ANALOG DEVICES INC AD5706R DRIVER
  M:	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
  L:	linux-iio@vger.kernel.org
@@@ -1684,7 -1622,6 +1684,7 @@@ F:	drivers/iio/dac/ad7293.
 =20
  ANALOG DEVICES INC AD74115 DRIVER
  M:	Marcelo Schmitt <marcelo.schmitt@analog.com>
 +M:	Antoniu Miclaus <antoniu.miclaus@analog.com>
  L:	linux-iio@vger.kernel.org
  S:	Supported
  W:	https://ez.analog.com/linux-software-drivers
@@@ -1693,7 -1630,6 +1693,7 @@@ F:	drivers/iio/addac/ad74115.
 =20
  ANALOG DEVICES INC AD74413R DRIVER
  M:	Marcelo Schmitt <marcelo.schmitt@analog.com>
 +M:	Antoniu Miclaus <antoniu.miclaus@analog.com>
  L:	linux-iio@vger.kernel.org
  S:	Supported
  W:	https://ez.analog.com/linux-software-drivers
@@@ -1721,15 -1657,6 +1721,15 @@@ F:	Documentation/devicetree/bindings/ii
  F:	drivers/iio/adc/ad7768-1.c
  F:	include/dt-bindings/iio/adc/adi,ad7768-1.h
 =20
 +ANALOG DEVICES INC AD7768 DRIVER
 +M:	Janani Sunil <janani.sunil@analog.com>
 +L:	linux-iio@vger.kernel.org
 +S:	Supported
 +W:	https://ez.analog.com/linux-software-drivers
 +F:	Documentation/devicetree/bindings/iio/adc/adi,ad7768.yaml
 +F:	Documentation/iio/ad7768.rst
 +F:	drivers/iio/adc/ad7768.c
 +
  ANALOG DEVICES INC AD7780 DRIVER
  M:	Michael Hennerich <Michael.Hennerich@analog.com>
  M:	Renato Lui Geh <renatogeh@gmail.com>
@@@ -1775,17 -1702,6 +1775,17 @@@ W:	https://ez.analog.com/linux-software
  F:	Documentation/devicetree/bindings/iio/dac/adi,ad9739a.yaml
  F:	drivers/iio/dac/ad9739a.c
 =20
 +ANALOG DEVICES INC AD9910 DRIVER
 +M:	Rodrigo Alencar <rodrigo.alencar@analog.com>
 +L:	linux-iio@vger.kernel.org
 +S:	Supported
 +W:	https://ez.analog.com/linux-software-drivers
 +F:	Documentation/ABI/testing/debugfs-iio-ad9910
 +F:	Documentation/ABI/testing/sysfs-bus-iio-frequency-ad9910
 +F:	Documentation/devicetree/bindings/iio/frequency/adi,ad9910.yaml
 +F:	Documentation/iio/ad9910.rst
 +F:	drivers/iio/frequency/ad9910.c
 +
  ANALOG DEVICES INC MAX22007 DRIVER
  M:	Janani Sunil <janani.sunil@analog.com>
  L:	linux-iio@vger.kernel.org
@@@ -2094,15 -2010,6 +2094,15 @@@ M:	Jiaxun Yang <jiaxun.yang@flygoat.com
  S:	Supported
  F:	drivers/rtc/rtc-goldfish.c
 =20
 +ANLOGIC DR1V90 CRU DRIVER
 +M:	Junhui Liu <junhui.liu@pigmoral.tech>
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/clock/anlogic,dr1v90-cru.yaml
 +F:	drivers/clk/anlogic/cru?dr1*
 +F:	drivers/reset/reset-dr1v90.c
 +F:	include/dt-bindings/clock/anlogic,dr1v90-cru.h
 +F:	include/dt-bindings/reset/anlogic,dr1v90-cru.h
 +
  AOA (Apple Onboard Audio) ALSA DRIVER
  M:	Johannes Berg <johannes@sipsolutions.net>
  L:	linuxppc-dev@lists.ozlabs.org
@@@ -2169,7 -2076,8 +2169,7 @@@ S:	Supporte
  F:	arch/arm64/boot/dts/apm/
 =20
  APPLIED MICRO (APM) X-GENE SOC EDAC
 -M:	Khuong Dinh <khuong@os.amperecomputing.com>
 -S:	Supported
 +S:	Orphan
  F:	Documentation/devicetree/bindings/edac/apm,xgene-edac.yaml
  F:	drivers/edac/xgene_edac.c
 =20
@@@ -2269,7 -2177,7 +2269,7 @@@ F:	drivers/net/arcnet
  F:	include/uapi/linux/if_arcnet.h
 =20
  ARCTIC FAN CONTROLLER DRIVER
 -M:	Aureo Serrano de Souza <aureo.serrano@arctic.de>
 +M:	ARCTIC (HK) <arctic.it.hk@arctic.de>
  L:	linux-hwmon@vger.kernel.org
  S:	Maintained
  F:	Documentation/hwmon/arctic_fan_controller.rst
@@@ -2425,7 -2333,6 +2425,7 @@@ ARM MALI TYR DRM DRIVE
  M:	Daniel Almeida <daniel.almeida@collabora.com>
  M:	Alice Ryhl <aliceryhl@google.com>
  L:	dri-devel@lists.freedesktop.org
 +L:	rust-for-linux@vger.kernel.org
  S:	Supported
  W:	https://rust-for-linux.com/tyr-gpu-driver
  W:	https://drm.pages.freedesktop.org/maintainer-tools/drm-rust.html
@@@ -2747,7 -2654,6 +2747,7 @@@ F:	Documentation/devicetree/bindings/pi
  F:	Documentation/devicetree/bindings/power/apple*
  F:	Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml
  F:	Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
 +F:	Documentation/devicetree/bindings/reset/apple,t8103-cio-reset.yaml
  F:	Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
  F:	Documentation/devicetree/bindings/soc/apple/apple,t6000-pmgr-misc.yaml
  F:	Documentation/devicetree/bindings/spi/apple,spi.yaml
@@@ -2778,7 -2684,6 +2778,7 @@@ F:	drivers/pinctrl/pinctrl-apple-gpio.
  F:	drivers/power/reset/macsmc-reboot.c
  F:	drivers/power/supply/macsmc-power.c
  F:	drivers/pwm/pwm-apple.c
 +F:	drivers/reset/reset-apple-cio.c
  F:	drivers/rtc/rtc-macsmc.c
  F:	drivers/soc/apple/*
  F:	drivers/spi/spi-apple.c
@@@ -3107,7 -3012,7 +3107,7 @@@ F:	arch/arm/boot/dts/ti/omap/omap3-igep
 =20
  ARM/INTEL IXP4XX ARM ARCHITECTURE
  M:	Linus Walleij <linusw@kernel.org>
 -M:	Imre Kaloz <kaloz@openwrt.org>
 +M:	Imre Kaloz <kaloz@kernel.org>
  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
  S:	Maintained
  F:	Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml
@@@ -3309,7 -3214,6 +3309,7 @@@ M:	UNGLinuxDriver@microchip.co
  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
  S:	Supported
  F:	arch/arm64/boot/dts/microchip/sparx*
 +F:	drivers/net/ethernet/microchip/fdma/
  F:	drivers/net/ethernet/microchip/vcap/
  F:	drivers/pinctrl/pinctrl-microchip-sgpio.c
  N:	sparx5
@@@ -3369,7 -3273,6 +3369,7 @@@ F:	Documentation/devicetree/bindings/ar
  F:	Documentation/devicetree/bindings/arm/ux500/
  F:	Documentation/devicetree/bindings/gpio/st,nomadik-gpio.yaml
  F:	Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
 +F:	Documentation/devicetree/bindings/power/stericsson,ux500-pm-domains.ya=
ml
  F:	arch/arm/boot/dts/st/ste-*
  F:	arch/arm/mach-nomadik/
  F:	arch/arm/mach-ux500/
@@@ -3529,7 -3432,6 +3529,7 @@@ F:	include/linux/soc/qcom
  ARM/QUALCOMM SUPPORT
  M:	Bjorn Andersson <andersson@kernel.org>
  M:	Konrad Dybcio <konradybcio@kernel.org>
 +R:	Abel Vesa <abelvesa@kernel.org>
  L:	linux-arm-msm@vger.kernel.org
  S:	Maintained
  C:	irc://irc.oftc.net/linux-msm
@@@ -3552,7 -3454,6 +3552,7 @@@ F:	drivers/watchdog/gunyah_wdt.
  F:	include/dt-bindings/arm/qcom,ids.h
  F:	include/dt-bindings/firmware/qcom,scm.h
  F:	include/dt-bindings/soc/qcom*
 +F:	include/dt-bindings/thermal/qcom,pas.h
  F:	include/linux/firmware/qcom
  F:	include/linux/soc/qcom/
  F:	include/soc/qcom/
@@@ -3725,6 -3626,7 +3725,6 @@@ F:	arch/arm/boot/dts/intel/socfpga
  F:	arch/arm/configs/socfpga_defconfig
  F:	arch/arm/mach-socfpga/
  F:	arch/arm64/boot/dts/altera/
 -F:	arch/arm64/boot/dts/intel/
 =20
  ARM/SOCFPGA CLOCK FRAMEWORK SUPPORT
  M:	Dinh Nguyen <dinguyen@kernel.org>
@@@ -3887,7 -3789,6 +3887,7 @@@ M:	Vignesh Raghavendra <vigneshr@ti.com
  M:	Tero Kristo <kristo@kernel.org>
  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
  S:	Supported
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
  F:	Documentation/devicetree/bindings/arm/ti/k3.yaml
  F:	Documentation/devicetree/bindings/hwinfo/ti,k3-socinfo.yaml
  F:	arch/arm64/boot/dts/ti/Makefile
@@@ -3905,7 -3806,7 +3905,7 @@@ F:	arch/arm/boot/dts/nspire
  ARM/TOSHIBA VISCONTI ARCHITECTURE
  M:	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 -S:	Supported
 +S:	Odd Fixes
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iwamatsu/linux-visco=
nti.git
  F:	Documentation/devicetree/bindings/arm/toshiba.yaml
  F:	Documentation/devicetree/bindings/clock/toshiba,tmpv770x-pipllct.yaml
@@@ -3999,15 -3900,8 +3999,15 @@@ L:	linux-arm-kernel@lists.infradead.or
  S:	Odd fixes
  F:	Documentation/arch/arm/zte/
  F:	Documentation/devicetree/bindings/arm/zte.yaml
 +F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
 +F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
 +F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
  F:	arch/arm/boot/dts/zte/
  F:	arch/arm/mach-zte/
 +F:	drivers/clk/zte/
 +F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
 +F:	include/dt-bindings/phy/zte,zx297520v3-topcrm.h
 +F:	include/dt-bindings/reset/zte,zx297520v3-reset.h
 =20
  ARM/ZYNQ ARCHITECTURE
  M:	Michal Simek <michal.simek@amd.com>
@@@ -4055,16 -3949,10 +4055,16 @@@ R:	Mark Rutland <mark.rutland@arm.com
  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
  S:	Maintained
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
 +F:	Documentation/ABI/testing/sysfs-firmware-cca
  F:	Documentation/arch/arm64/
  F:	arch/arm64/
 +F:	drivers/firmware/arm_rmm/
  F:	drivers/virt/coco/arm-cca-guest/
  F:	drivers/virt/coco/pkvm-guest/
 +F:	include/linux/arm-rmi-cmds.h
 +F:	include/linux/arm-rsi-cmds.h
 +F:	include/linux/arm-smccc-rmi.h
 +F:	include/linux/arm-smccc-rsi.h
  F:	tools/testing/selftests/arm64/
  X:	arch/arm64/boot/dts/
  X:	arch/arm64/configs/defconfig
@@@ -4207,14 -4095,6 +4207,14 @@@ S:	Maintaine
  F:	Documentation/devicetree/bindings/usb/aspeed,ast2600-udc.yaml
  F:	drivers/usb/gadget/udc/aspeed_udc.c
 =20
 +ASPEED USB3 PHY DRIVER
 +M:	Ryan Chen <ryan_chen@aspeedtech.com>
 +L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
 +L:	linux-phy@lists.infradead.org
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/phy/aspeed,ast2700-usb3-phy.yaml
 +F:	drivers/phy/aspeed/phy-aspeed-usb3.c
 +
  ASPEED VIDEO ENGINE DRIVER
  M:	Eddie James <eajames@linux.ibm.com>
  L:	linux-media@vger.kernel.org
@@@ -4380,13 -4260,13 +4380,13 @@@ M:	Nick Kossifidis <mickflemm@gmail.com
  M:	Luis Chamberlain <mcgrof@kernel.org>
  L:	linux-wireless@vger.kernel.org
  S:	Maintained
 -W:	https://wireless.wiki.kernel.org/en/users/Drivers/ath5k
 +W:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath5k.html
  F:	drivers/net/wireless/ath/ath5k/
 =20
  ATHEROS ATH6KL WIRELESS DRIVER
  L:	linux-wireless@vger.kernel.org
  S:	Orphan
 -W:	https://wireless.wiki.kernel.org/en/users/Drivers/ath6kl
 +W:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath6kl.html
  F:	drivers/net/wireless/ath/ath6kl/
 =20
  ATI_REMOTE2 DRIVER
@@@ -4466,13 -4346,6 +4466,13 @@@ F:	drivers/net/ieee802154/at86rf230.
  F:	drivers/net/ieee802154/atusb.c
  F:	drivers/net/ieee802154/atusb.h
 =20
 +AUDIENT EVO MIXER DRIVER
 +M:	Christian Ruppert <arc@gmx.li>
 +L:	linux-sound@vger.kernel.org
 +S:	Maintained
 +F:	sound/usb/mixer_evo.c
 +F:	sound/usb/mixer_evo.h
 +
  AUDIT SUBSYSTEM
  M:	Paul Moore <paul@paul-moore.com>
  M:	Eric Paris <eparis@redhat.com>
@@@ -4502,7 -4375,6 +4502,7 @@@ AUXILIARY BUS DRIVE
  M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  M:	"Rafael J. Wysocki" <rafael@kernel.org>
  M:	Danilo Krummrich <dakr@kernel.org>
 +M:	Johan Hovold <johan@kernel.org>
  R:	Dave Ertman <david.m.ertman@intel.com>
  R:	Ira Weiny <iweiny@kernel.org>
  R:	Leon Romanovsky <leon@kernel.org>
@@@ -4547,12 -4419,6 +4547,12 @@@ L:	linux-media@vger.kernel.or
  S:	Maintained
  F:	drivers/media/pci/hws/
 =20
 +AWINIC AW88399 HDA SIDE CODEC DRIVER
 +M:	Marco Giunta <marco_giunta@outlook.it>
 +L:	linux-sound@vger.kernel.org
 +S:	Maintained
 +F:	sound/hda/codecs/side-codecs/aw88399*
 +
  AWINIC AW99706 WLED BACKLIGHT DRIVER
  M:	Junjie Cao <junjie.cao@linux.dev>
  S:	Maintained
@@@ -4573,24 -4439,6 +4573,24 @@@ S:	Orpha
  F:	Documentation/devicetree/bindings/sound/axentia,*
  F:	sound/soc/atmel/tse850-pcm5142.c
 =20
 +AXIADO SARADC DRIVER
 +M:	Petar Stepanovic <pstepanovic@axiado.com>
 +M:	Akhila Kavi <akavi@axiado.com>
 +M:	Prasad Bolisetty <pbolisetty@axiado.com>
 +L:	linux-iio@vger.kernel.org
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/iio/adc/axiado,ax3000-saradc.yaml
 +F:	drivers/iio/adc/axiado_saradc.c
 +
 +AXIADO SGPIO DRIVER
 +M:	Petar Stepanovic <pstepanovic@axiado.com>
 +M:	SriNavmani A <srinavmani@axiado.com>
 +M:	Prasad Bolisetty <pbolisetty@axiado.com>
 +L:	linux-gpio@vger.kernel.org
 +S:	Supported
 +F:	Documentation/devicetree/bindings/gpio/axiado,ax3005-sgpio.yaml
 +F:	drivers/gpio/gpio-axiado-sgpio.c
 +
  AXIS ARTPEC ARM64 SoC SUPPORT
  M:	Jesper Nilsson <jesper.nilsson@axis.com>
  M:	Lars Persson <lars.persson@axis.com>
@@@ -4649,16 -4497,6 +4649,16 @@@ W:	https://ez.analog.com/linux-software
  F:	Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml
  F:	drivers/pwm/pwm-axi-pwmgen.c
 =20
 +AXIADO PWM FAN CONTROLLER DRIVER
 +M:	Petar Stepanovic <pstepanovic@axiado.com>
 +M:	Akhila Kavi <akavi@axiado.com>
 +M:	Prasad Bolisetty <pbolisetty@axiado.com>
 +L:	linux-hwmon@vger.kernel.org
 +S:	Supported
 +F:	Documentation/devicetree/bindings/hwmon/axiado,ax3000-pwm-fan.yaml
 +F:	Documentation/hwmon/axiado-pwm-fan.rst
 +F:	drivers/hwmon/axiado-pwm-fan.c
 +
  AXIADO SPI DB DRIVER
  M:	Vladimir Moravcevic <vmoravcevic@axiado.com>
  M:	Tzu-Hao Wei <twei@axiado.com>
@@@ -4670,21 -4508,11 +4670,21 @@@ F:	Documentation/devicetree/bindings/sp
  F:	drivers/spi/spi-axiado.c
  F:	drivers/spi/spi-axiado.h
 =20
 +AXIADO TSADC DRIVER
 +M:	Petar Stepanovic <pstepanovic@axiado.com>
 +M:	Akhila Kavi <akavi@axiado.com>
 +M:	Prasad Bolisetty <pbolisetty@axiado.com>
 +L:	linux-hwmon@vger.kernel.org
 +S:	Supported
 +F:	Documentation/devicetree/bindings/hwmon/axiado,ax3000-tsadc.yaml
 +F:	Documentation/hwmon/axiado-tsadc.rst
 +F:	drivers/hwmon/axiado-tsadc.c
 +
  AYANEO PLATFORM EC DRIVER
  M:	Antheas Kapenekakis <lkml@antheas.dev>
  L:	platform-driver-x86@vger.kernel.org
  S:	Maintained
 -F:	Documentation/ABI/testing/sysfs-platform-ayaneo
 +F:	Documentation/ABI/testing/sysfs-platform-ayaneo-ec
  F:	drivers/platform/x86/ayaneo-ec.c
 =20
  AZ6007 DVB DRIVER
@@@ -4707,14 -4535,14 +4707,14 @@@ B43 WIRELESS DRIVE
  L:	linux-wireless@vger.kernel.org
  L:	b43-dev@lists.infradead.org
  S:	Orphan
 -W:	https://wireless.wiki.kernel.org/en/users/Drivers/b43
 +W:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/b43.html
  F:	drivers/net/wireless/broadcom/b43/
 =20
  B43LEGACY WIRELESS DRIVER
  L:	linux-wireless@vger.kernel.org
  L:	b43-dev@lists.infradead.org
  S:	Orphan
 -W:	https://wireless.wiki.kernel.org/en/users/Drivers/b43
 +W:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/b43.html
  F:	drivers/net/wireless/broadcom/b43legacy/
 =20
  BACKLIGHT CLASS/SUBSYSTEM
@@@ -4799,11 -4627,17 +4799,11 @@@ S:	Odd Fixe
  F:	Documentation/block/bfq-iosched.rst
  F:	block/bfq-*
 =20
 -BFS FILE SYSTEM
 -M:	"Tigran A. Aivazian" <aivazian.tigran@gmail.com>
 -S:	Maintained
 -F:	Documentation/filesystems/bfs.rst
 -F:	fs/bfs/
 -F:	include/uapi/linux/bfs_fs.h
 -
  BITMAP API
  M:	Yury Norov <yury.norov@gmail.com>
  R:	Rasmus Villemoes <linux@rasmusvillemoes.dk>
  S:	Maintained
 +F:	include/linux/bitfield-fix-width.h
  F:	include/linux/bitfield.h
  F:	include/linux/bitmap-str.h
  F:	include/linux/bitmap.h
@@@ -4824,7 -4658,6 +4824,7 @@@ F:	lib/find_bit_benchmark.
  F:	lib/region_alloc_benchmark.c
  F:	lib/test_bitmap.c
  F:	lib/tests/cpumask_kunit.c
 +F:	tools/include/linux/bitfield-fix-width.h
  F:	tools/include/linux/bitfield.h
  F:	tools/include/linux/bitmap.h
  F:	tools/include/linux/bits.h
@@@ -4893,7 -4726,6 +4893,7 @@@ F:	include/uapi/linux/blk
  F:	include/uapi/linux/ioprio.h
  F:	kernel/trace/blktrace.c
  F:	lib/sbitmap.c
 +F:	lib/tests/sbitmap_kunit.c
 =20
  BLOCK LAYER DEVICE DRIVER API [RUST]
  M:	Andreas Hindborg <a.hindborg@kernel.org>
@@@ -5040,7 -4872,6 +5040,7 @@@ F:	arch/powerpc/net
  BPF JIT for RISC-V (32-bit)
  M:	Luke Nelson <luke.r.nels@gmail.com>
  M:	Xi Wang <xi.wang@gmail.com>
 +M:	Pu Lehui <pulehui@huawei.com>
  L:	bpf@vger.kernel.org
  S:	Maintained
  F:	arch/riscv/net/
@@@ -5048,7 -4879,7 +5048,7 @@@ X:	arch/riscv/net/bpf_jit_comp64.
 =20
  BPF JIT for RISC-V (64-bit)
  M:	Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>
 -R:	Pu Lehui <pulehui@huawei.com>
 +M:	Pu Lehui <pulehui@huawei.com>
  R:	Puranjay Mohan <puranjay@kernel.org>
  L:	bpf@vger.kernel.org
  S:	Maintained
@@@ -5105,6 -4936,8 +5105,6 @@@ BPF [CRYPTO
  M:	Vadim Fedorenko <vadim.fedorenko@linux.dev>
  L:	bpf@vger.kernel.org
  S:	Maintained
 -F:	crypto/bpf_crypto_skcipher.c
 -F:	include/linux/bpf_crypto.h
  F:	kernel/bpf/crypto.c
 =20
  BPF [DOCUMENTATION] (Related to Standardization)
@@@ -5149,6 -4982,7 +5149,6 @@@ F:	include/uapi/linux/filter.
  F:	kernel/bpf/
  F:	kernel/trace/bpf_trace.c
  F:	lib/buildid.c
 -F:	lib/test_bpf.c
  F:	net/bpf/
  F:	net/core/filter.c
  F:	net/sched/act_bpf.c
@@@ -5309,7 -5143,6 +5309,7 @@@ L:	netdev@vger.kernel.or
  L:	openwrt-devel@lists.openwrt.org (subscribers-only)
  S:	Supported
  F:	Documentation/devicetree/bindings/net/dsa/brcm,b53.yaml
 +F:	Documentation/networking/dsa/b53.rst
  F:	drivers/net/dsa/b53/*
  F:	drivers/net/dsa/bcm_sf2*
  F:	include/linux/dsa/brcm.h
@@@ -5333,18 -5166,6 +5333,18 @@@ N:	bcm271
  N:	bcm283*
  N:	raspberrypi
 =20
 +BROADCOM BCM2712 IOMMU DRIVER
 +M:	Daniel Drake <dan@reactivated.net>
 +M:	Florian Fainelli <florian.fainelli@broadcom.com>
 +M:	Jim Quinlan <james.quinlan@broadcom.com>
 +R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadco=
m.com>
 +L:	iommu@lists.linux.dev
 +L:	linux-rpi-kernel@lists.infradead.org (moderated for non-subscribers)
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/iommu/brcm,bcm2712-iommu*
 +F:	drivers/iommu/bcm2712-iommu*
 +F:	drivers/iommu/generic_pt/fmt/*bcm2712*
 +
  BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITECTURE
  M:	Florian Fainelli <florian.fainelli@broadcom.com>
  M:	Ray Jui <rjui@broadcom.com>
@@@ -5474,7 -5295,7 +5474,7 @@@ F:	Documentation/devicetree/bindings/us
  F:	drivers/usb/gadget/udc/bdc/
 =20
  BROADCOM BMIPS CPUFREQ DRIVER
 -M:	Markus Mayer <mmayer@broadcom.com>
 +M:	Markus Mayer <markus.mayer@broadcom.com>
  R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadco=
m.com>
  L:	linux-pm@vger.kernel.org
  S:	Maintained
@@@ -5506,9 -5327,9 +5506,9 @@@ F:	drivers/net/ethernet/broadcom/bnx2.
  F:	drivers/net/ethernet/broadcom/bnx2_*
 =20
  BROADCOM BNX2FC 10 GIGABIT FCOE DRIVER
 -M:	Saurav Kashyap <skashyap@marvell.com>
 -M:	Javed Hasan <jhasan@marvell.com>
 -M:	GR-QLogic-Storage-Upstream@marvell.com
 +M:	Nilesh Javali <njavali@marvell.com>
 +M:	Manish Rangankar <mrangankar@marvell.com>
 +M:	GR-ETH-Storage-Upstream@marvell.com
  L:	linux-scsi@vger.kernel.org
  S:	Supported
  F:	drivers/scsi/bnx2fc/
@@@ -5516,7 -5337,7 +5516,7 @@@
  BROADCOM BNX2I 1/10 GIGABIT iSCSI DRIVER
  M:	Nilesh Javali <njavali@marvell.com>
  M:	Manish Rangankar <mrangankar@marvell.com>
 -M:	GR-QLogic-Storage-Upstream@marvell.com
 +M:	GR-ETH-Storage-Upstream@marvell.com
  L:	linux-scsi@vger.kernel.org
  S:	Supported
  F:	drivers/scsi/bnx2i/
@@@ -5633,7 -5454,6 +5633,7 @@@ F:	include/linux/brcmphy.
  BROADCOM GENET ETHERNET DRIVER
  M:	Doug Berger <opendmb@gmail.com>
  M:	Florian Fainelli <florian.fainelli@broadcom.com>
 +M:	Nicolai Buchwitz <nb@tipi-net.de>
  R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadco=
m.com>
  L:	netdev@vger.kernel.org
  S:	Maintained
@@@ -5749,7 -5569,7 +5749,7 @@@ F:	drivers/spi/spi-brcmstb-qspi.
  F:	drivers/spi/spi-iproc-qspi.c
 =20
  BROADCOM STB AVS CPUFREQ DRIVER
 -M:	Markus Mayer <mmayer@broadcom.com>
 +M:	Markus Mayer <markus.mayer@broadcom.com>
  R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadco=
m.com>
  L:	linux-pm@vger.kernel.org
  S:	Maintained
@@@ -5757,7 -5577,7 +5757,7 @@@ F:	Documentation/devicetree/bindings/cp
  F:	drivers/cpufreq/brcmstb*
 =20
  BROADCOM STB AVS TMON DRIVER
 -M:	Markus Mayer <mmayer@broadcom.com>
 +M:	Markus Mayer <markus.mayer@broadcom.com>
  R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadco=
m.com>
  L:	linux-pm@vger.kernel.org
  S:	Maintained
@@@ -5765,7 -5585,7 +5765,7 @@@ F:	Documentation/devicetree/bindings/th
  F:	drivers/thermal/broadcom/brcmstb*
 =20
  BROADCOM STB DPFE DRIVER
 -M:	Markus Mayer <mmayer@broadcom.com>
 +M:	Markus Mayer <markus.mayer@broadcom.com>
  R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadco=
m.com>
  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
  S:	Maintained
@@@ -5801,7 -5621,7 +5801,7 @@@ F:	drivers/net/ethernet/broadcom/unimac
 =20
  BROADCOM TG3 GIGABIT ETHERNET DRIVER
  M:	Pavan Chebbi <pavan.chebbi@broadcom.com>
 -M:	Michael Chan <mchan@broadcom.com>
 +M:	Michael Chan <michael.chan@broadcom.com>
  L:	netdev@vger.kernel.org
  S:	Maintained
  F:	drivers/net/ethernet/broadcom/tg3.*
@@@ -5851,8 -5671,8 +5851,8 @@@ W:	http://bu3sch.de/btgpio.ph
  F:	drivers/gpio/gpio-bt8xx.c
 =20
  BTRFS FILE SYSTEM
 -M:	Chris Mason <clm@fb.com>
  M:	David Sterba <dsterba@suse.com>
 +R:	Chris Mason <mason@kernel.org>
  L:	linux-btrfs@vger.kernel.org
  S:	Maintained
  W:	https://btrfs.readthedocs.io
@@@ -6099,7 -5919,7 +6099,7 @@@ CARL9170 LINUX COMMUNITY WIRELESS DRIVE
  M:	Christian Lamparter <chunkeey@googlemail.com>
  L:	linux-wireless@vger.kernel.org
  S:	Maintained
 -W:	https://wireless.wiki.kernel.org/en/users/Drivers/carl9170
 +W:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/carl9170.h=
tml
  F:	drivers/net/wireless/ath/carl9170/
 =20
  CAVIUM I2C DRIVER
@@@ -6202,8 -6022,7 +6202,8 @@@ F:	drivers/power/supply/cw2015_battery.
  CEPH COMMON CODE (LIBCEPH)
  M:	Ilya Dryomov <idryomov@gmail.com>
  M:	Alex Markuze <amarkuze@redhat.com>
 -M:	Viacheslav Dubeyko <slava@dubeyko.com>
 +M:	Xiubo Li <xiubo.li@clyso.com>
 +R:	Viacheslav Dubeyko <slava@dubeyko.com>
  L:	ceph-devel@vger.kernel.org
  S:	Supported
  W:	http://ceph.com/
@@@ -6216,8 -6035,7 +6216,8 @@@ F:	net/ceph
  CEPH DISTRIBUTED FILE SYSTEM CLIENT (CEPH)
  M:	Ilya Dryomov <idryomov@gmail.com>
  M:	Alex Markuze <amarkuze@redhat.com>
 -M:	Viacheslav Dubeyko <slava@dubeyko.com>
 +M:	Xiubo Li <xiubo.li@clyso.com>
 +R:	Viacheslav Dubeyko <slava@dubeyko.com>
  L:	ceph-devel@vger.kernel.org
  S:	Supported
  W:	http://ceph.com/
@@@ -6682,7 -6500,7 +6682,7 @@@ M:	Jerome Brunet <jbrunet+clk@baylibre.
  L:	linux-clk@vger.kernel.org
  S:	Maintained
  Q:	http://patchwork.kernel.org/project/linux-clk/list/
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-ne=
xt
  F:	Documentation/devicetree/bindings/clock/
  F:	drivers/clk/
  F:	include/dt-bindings/clock/
@@@ -6749,7 -6567,6 +6749,7 @@@ M:	Vishal Verma <vishal.l.verma@intel.c
  M:	Dan Williams <djbw@kernel.org>
  R:	Ira Weiny <iweiny@kernel.org>
  R:	Li Ming <ming.li@zohomail.com>
 +R:	Richard Cheng <icheng@nvidia.com>
  L:	linux-cxl@vger.kernel.org
  S:	Maintained
  F:	Documentation/driver-api/cxl
@@@ -6786,7 -6603,6 +6786,7 @@@ S:	Supporte
  F:	fs/configfs/
  F:	include/linux/configfs.h
  F:	samples/configfs/
 +F:	tools/testing/selftests/filesystems/configfs/
 =20
  CONFIGFS [RUST]
  M:	Andreas Hindborg <a.hindborg@kernel.org>
@@@ -6879,21 -6695,26 +6879,21 @@@ T:	git https://gitlab.freedesktop.org/d
  F:	include/linux/cgroup_dmem.h
  F:	kernel/cgroup/dmem.c
 =20
 -CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)
 -M:	Johannes Weiner <hannes@cmpxchg.org>
 -M:	Michal Hocko <mhocko@kernel.org>
 -M:	Roman Gushchin <roman.gushchin@linux.dev>
 -M:	Shakeel Butt <shakeel.butt@linux.dev>
 -R:	Muchun Song <muchun.song@linux.dev>
 -L:	cgroups@vger.kernel.org
 -L:	linux-mm@kvack.org
 +COREBOOT CFR FIRMWARE ATTRIBUTES DRIVER
 +M:	Sean Rhodes <sean@starlabs.systems>
 +L:	chrome-platform@lists.linux.dev
  S:	Maintained
 -F:	include/linux/memcontrol.h
 -F:	include/linux/page_counter.h
 -F:	mm/memcontrol.c
 -F:	mm/memcontrol-v1.c
 -F:	mm/memcontrol-v1.h
 -F:	mm/page_counter.c
 -F:	samples/cgroup/*
 -F:	tools/testing/selftests/cgroup/memcg_protection.m
 -F:	tools/testing/selftests/cgroup/test_hugetlb_memcg.c
 -F:	tools/testing/selftests/cgroup/test_kmem.c
 -F:	tools/testing/selftests/cgroup/test_memcontrol.c
 +F:	drivers/firmware/coreboot/coreboot-cfr.c
 +
 +COREBOOT FIRMWARE DRIVERS
 +M:	Tzung-Bi Shih <tzungbi@kernel.org>
 +R:	Brian Norris <briannorris@chromium.org>
 +R:	Julius Werner <jwerner@chromium.org>
 +L:	chrome-platform@lists.linux.dev
 +S:	Maintained
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linu=
x.git
 +F:	drivers/firmware/coreboot/
 +F:	include/linux/coreboot.h
 =20
  CORETEMP HARDWARE MONITORING DRIVER
  L:	linux-hwmon@vger.kernel.org
@@@ -6942,7 -6763,7 +6942,7 @@@ M:	"Rafael J. Wysocki" <rafael@kernel.o
  M:	Viresh Kumar <viresh.kumar@linaro.org>
  R:	Jie Zhan <zhanjie9@hisilicon.com>
  R:	Lifeng Zheng <zhenglifeng1@huawei.com>
 -R:	Pierre Gondois <pierre.gondois@arm.com>
 +R:	Christian Loehle <christian.loehle@arm.com>
  R:	Sumit Gupta <sumitg@nvidia.com>
  L:	linux-pm@vger.kernel.org
  S:	Maintained
@@@ -7158,8 -6979,6 +7158,8 @@@ L:	linux-crypto@vger.kernel.or
  S:	Maintained
  T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git=
 libcrypto-next
  T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git=
 libcrypto-fixes
 +F:	Documentation/crypto/libcrypto*
 +F:	include/linux/siphash.h
  F:	lib/crypto/
  F:	scripts/crypto/
 =20
@@@ -7362,6 -7181,25 +7362,6 @@@ S:	Maintaine
  W:	https://docs.dasharo.com/
  F:	drivers/platform/x86/dasharo-acpi.c
 =20
 -DAMON
 -M:	SJ Park <sj@kernel.org>
 -L:	damon@lists.linux.dev
 -L:	linux-mm@kvack.org
 -S:	Maintained
 -W:	https://damonitor.github.io
 -P:	Documentation/mm/damon/maintainer-profile.rst
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 -T:	quilt git://git.kernel.org/pub/scm/linux/kernel/git/akpm/25-new
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/n=
ext
 -F:	Documentation/ABI/testing/sysfs-kernel-mm-damon
 -F:	Documentation/admin-guide/mm/damon/
 -F:	Documentation/mm/damon/
 -F:	include/linux/damon.h
 -F:	include/trace/events/damon.h
 -F:	mm/damon/
 -F:	samples/damon/
 -F:	tools/testing/selftests/damon/
 -
  DAVICOM FAST ETHERNET (DMFE) NETWORK DRIVER
  L:	netdev@vger.kernel.org
  S:	Orphan
@@@ -7562,9 -7400,10 +7562,9 @@@ F:	drivers/dma/dw-edma
  F:	include/linux/dma/edma.h
 =20
  DESIGNWARE USB2 DRD IP DRIVER
 -M:	Minas Harutyunyan <hminas@synopsys.com>
 +M:	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  L:	linux-usb@vger.kernel.org
  S:	Maintained
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git
  F:	drivers/usb/dwc2/
 =20
  DESIGNWARE USB3 DRD IP DRIVER
@@@ -7655,7 -7494,6 +7655,7 @@@ F:	rust/kernel/io.r
  F:	rust/kernel/io/
  F:	rust/kernel/irq.rs
  F:	rust/kernel/irq/
 +F:	rust/macros/io/
 =20
  DEVICE RESOURCE MANAGEMENT HELPERS
  M:	Hans de Goede <hansg@kernel.org>
@@@ -7719,12 -7557,11 +7719,12 @@@ F:	drivers/iio/chemical/sen0322.
 =20
  DH ELECTRONICS DHSOM SOM AND BOARD SUPPORT
  M:	Christoph Niedermaier <cniedermaier@dh-electronics.com>
 -M:	Marek Vasut <marex@denx.de>
 +M:	Marek Vasut <marex@nabladev.com>
  L:	kernel@dh-electronics.com
  S:	Maintained
  N:	dhcom
  N:	dhcor
 +N:	dhcos
  N:	dhsom
 =20
  DIALOG SEMICONDUCTOR DRIVERS
@@@ -7843,7 -7680,6 +7843,7 @@@ F:	fs/dlm
  DMA BUFFER SHARING FRAMEWORK
  M:	Sumit Semwal <sumit.semwal@linaro.org>
  M:	Christian K=C3=B6nig <christian.koenig@amd.com>
 +M:	Philipp Stanner <phasta@kernel.org>
  L:	linux-media@vger.kernel.org
  L:	dri-devel@lists.freedesktop.org
  L:	linaro-mm-sig@lists.linaro.org (moderated for non-subscribers)
@@@ -7857,8 -7693,6 +7857,8 @@@ F:	include/linux/dma-buf.
  F:	include/linux/dma-buf/
  F:	include/linux/dma-resv.h
  F:	rust/helpers/dma-resv.c
 +F:	rust/helpers/dma_fence.c
 +F:	rust/kernel/dma_buf/
  K:	\bdma_(?:buf|fence|resv)\b
 =20
  DMA GENERIC OFFLOAD ENGINE SUBSYSTEM
@@@ -7894,7 -7728,6 +7894,7 @@@ F:	include/linux/dma-direct.
  F:	include/linux/dma-map-ops.h
  F:	include/linux/dma-mapping.h
  F:	include/linux/swiotlb.h
 +F:	include/trace/events/dma.h
  F:	kernel/dma/
 =20
  DMA MAPPING & SCATTERLIST API [RUST]
@@@ -8086,7 -7919,6 +8086,7 @@@ S:	Supporte
  F:	Documentation/devicetree/bindings/dpll/dpll-device.yaml
  F:	Documentation/devicetree/bindings/dpll/dpll-pin.yaml
  F:	Documentation/driver-api/dpll.rst
 +F:	Documentation/netlink/specs/dpll.yaml
  F:	drivers/dpll/
  F:	include/linux/dpll.h
  F:	include/uapi/linux/dpll.h
@@@ -8124,7 -7956,6 +8124,7 @@@ DRIVER CORE, KOBJECTS, DEBUGFS AND SYSF
  M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  M:	"Rafael J. Wysocki" <rafael@kernel.org>
  M:	Danilo Krummrich <dakr@kernel.org>
 +M:	Johan Hovold <johan@kernel.org>
  L:	driver-core@lists.linux.dev
  S:	Supported
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-c=
ore.git
@@@ -8180,7 -8011,6 +8180,7 @@@ F:	include/uapi/drm/ivpu_accel.
 =20
  DRM ACCEL DRIVER FOR ROCKCHIP NPU
  M:	Tomeu Vizoso <tomeu@tomeuvizoso.net>
 +R:	Heiko Stuebner <heiko@sntech.de>
  L:	dri-devel@lists.freedesktop.org
  S:	Supported
  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
@@@ -8209,7 -8039,7 +8209,7 @@@ F:	drivers/gpu/drm/sun4i/sun8i
 =20
  DRM DRIVER FOR APPLE TOUCH BARS
  M:	Aun-Ali Zaidi <admin@kodeit.net>
 -M:	Aditya Garg <gargaditya08@proton.me>
 +M:	Aditya Garg <aditya.garg@linux.dev>
  L:	dri-devel@lists.freedesktop.org
  S:	Maintained
  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
@@@ -8338,6 -8168,7 +8338,6 @@@ F:	drivers/gpu/drm/tiny/hx8357d.
 =20
  DRM DRIVER FOR HYPERV SYNTHETIC VIDEO DEVICE
  M:	Dexuan Cui <decui@microsoft.com>
 -M:	Long Li <longli@microsoft.com>
  M:	Saurabh Sengar <ssengar@linux.microsoft.com>
  L:	linux-hyperv@vger.kernel.org
  L:	dri-devel@lists.freedesktop.org
@@@ -8509,13 -8340,6 +8509,13 @@@ T:	git https://gitlab.freedesktop.org/d
  F:	Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
  F:	drivers/gpu/drm/panel/panel-novatek-nt36523.c
 =20
 +DRM DRIVER FOR NOVATEK NT36532 PANELS
 +M:	Junjie Cao <junjie.cao@linux.dev>
 +S:	Maintained
 +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 +F:	Documentation/devicetree/bindings/display/panel/novatek,nt36532.yaml
 +F:	drivers/gpu/drm/panel/panel-novatek-nt36532.c
 +
  DRM DRIVER FOR NOVATEK NT36672A PANELS
  M:	Sumit Semwal <sumit.semwal@linaro.org>
  S:	Maintained
@@@ -8529,13 -8353,6 +8529,13 @@@ S:	Maintaine
  F:	Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
  F:	drivers/gpu/drm/panel/panel-novatek-nt37801.c
 =20
 +DRM DRIVER FOR NOVATEK NT51021 PANELS
 +M:	Ryan Brue <ryanbrue.dev@gmail.com>
 +M:	Nickolay Goppen <setotau@mainlining.org>
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml
 +F:	drivers/gpu/drm/panel/panel-novatek-nt51021.c
 +
  DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS
  M:	Lyude Paul <lyude@redhat.com>
  M:	Danilo Krummrich <dakr@kernel.org>
@@@ -8625,12 -8442,6 +8625,12 @@@ S:	Maintaine
  F:	Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
  F:	drivers/gpu/drm/panel/panel-raydium-rm67191.c
 =20
 +DRM DRIVER FOR RAYDIUM RM69220 PANELS
 +M:	Alexander Koskovich <akoskovich@pm.me>
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/display/panel/raydium,rm69220.yaml
 +F:	drivers/gpu/drm/panel/panel-raydium-rm69220.c
 +
  DRM DRIVER FOR SAMSUNG DB7430 PANELS
  M:	Linus Walleij <linusw@kernel.org>
  S:	Maintained
@@@ -8762,7 -8573,7 +8762,7 @@@ F:	Documentation/devicetree/bindings/di
  F:	drivers/gpu/drm/panel/panel-synaptics-r63353.c
 =20
  DRM DRIVER FOR SYNOPSYS DESIGNWARE DISPLAYPORT BRIDGE
 -M:	Andy Yan <andy.yan@rock-chips.com>
 +M:	Andy Yan <andyshrk@163.com>
  S:	Maintained
  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
  F:	Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
@@@ -8886,9 -8697,7 +8886,9 @@@ T:	git https://gitlab.freedesktop.org/d
  F:	drivers/gpu/drm/nova/
  F:	drivers/gpu/drm/tyr/
  F:	drivers/gpu/nova-core/
 +F:	rust/helpers/dma_fence.c
  F:	rust/helpers/gpu.c
 +F:	rust/kernel/dma_buf/
  F:	rust/kernel/drm/
  F:	rust/kernel/gpu.rs
  F:	rust/kernel/gpu/
@@@ -9117,7 -8926,7 +9117,7 @@@ F:	include/linux/platform_data/shmob_dr
  DRM DRIVERS FOR ROCKCHIP
  M:	Sandy Huang <hjc@rock-chips.com>
  M:	Heiko St=C3=BCbner <heiko@sntech.de>
 -M:	Andy Yan <andy.yan@rock-chips.com>
 +M:	Andy Yan <andyshrk@163.com>
  L:	dri-devel@lists.freedesktop.org
  L:	linux-rockchip@lists.infradead.org
  S:	Maintained
@@@ -9260,21 -9069,6 +9260,21 @@@ F:	include/drm/drm_gpuvm.
  F:	rust/helpers/drm_gpuvm.c
  F:	rust/kernel/drm/gpuvm/
 =20
 +DRM GPUSVM
 +M:	Matthew Brost <matthew.brost@intel.com>
 +R:	Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
 +R:	Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
 +R:	Honglei Huang <honghuan@amd.com>
 +L:	dri-devel@lists.freedesktop.org
 +S:	Supported
 +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 +F:	drivers/gpu/drm/drm_gpusvm.c
 +F:	drivers/gpu/drm/drm_pagemap.c
 +F:	drivers/gpu/drm/drm_pagemap_util.c
 +F:	include/drm/drm_gpusvm.h
 +F:	include/drm/drm_pagemap.h
 +F:	include/drm/drm_pagemap_util.h
 +
  DRM LOG
  M:	Jocelyn Falempe <jfalempe@redhat.com>
  M:	Javier Martinez Canillas <javierm@redhat.com>
@@@ -9302,12 -9096,9 +9302,12 @@@ S:	Supporte
  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
  F:	drivers/gpu/drm/drm_draw.c
  F:	drivers/gpu/drm/drm_draw_internal.h
 -F:	drivers/gpu/drm/drm_panic*.c
 -F:	drivers/gpu/drm/tests/drm_panic_test.c
 -F:	include/drm/drm_panic*
 +F:	drivers/gpu/drm/drm_panic.c
 +F:	drivers/gpu/drm/drm_panic_helper.c
 +F:	drivers/gpu/drm/drm_panic_internal.h
 +F:	drivers/gpu/drm/tests/drm_panic_helper_test.c
 +F:	include/drm/drm_panic.h
 +F:	include/drm/drm_panic_helper.h
 =20
  DRM PANIC QR CODE
  M:	Jocelyn Falempe <jfalempe@redhat.com>
@@@ -9316,7 -9107,7 +9316,7 @@@ L:	dri-devel@lists.freedesktop.or
  L:	rust-for-linux@vger.kernel.org
  S:	Supported
  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 -F:	drivers/gpu/drm/drm_panic_qr.rs
 +F:	drivers/gpu/drm/drm_panic_helper_qr.rs
 =20
  DRM PRIVACY-SCREEN CLASS
  M:	Hans de Goede <hansg@kernel.org>
@@@ -9326,25 -9117,11 +9326,25 @@@ T:	git https://gitlab.freedesktop.org/d
  F:	drivers/gpu/drm/drm_privacy_screen*
  F:	include/drm/drm_privacy_screen*
 =20
 +DRM RAS
 +M:	Riana Tauro <riana.tauro@intel.com>
 +M:	Rodrigo Vivi <rodrigo.vivi@intel.com>
 +R:	Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
 +R:	Raag Jadav <raag.jadav@intel.com>
 +L:	dri-devel@lists.freedesktop.org
 +S:	Supported
 +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 +F:	Documentation/netlink/specs/drm_ras.yaml
 +F:	Documentation/gpu/drm-ras.rst
 +F:	drivers/gpu/drm/drm_ras*
 +F:	include/drm/drm_ras*
 +
  DRM TTM SUBSYSTEM
 -M:	Christian Koenig <christian.koenig@amd.com>
 -M:	Huang Rui <ray.huang@amd.com>
 +M:	Natalie Vock <nat@pixelcluster.dev>
 +M:	Arun Pravin <arunpravin.paneerselvam@amd.com>
  R:	Matthew Auld <matthew.auld@intel.com>
  R:	Matthew Brost <matthew.brost@intel.com>
 +R:	Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
  L:	dri-devel@lists.freedesktop.org
  S:	Maintained
  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
@@@ -9547,7 -9324,6 +9547,7 @@@ F:	Documentation/devicetree/bindings/in
  F:	Documentation/devicetree/bindings/mips/econet.yaml
  F:	Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
  F:	arch/mips/boot/dts/econet/
 +F:	arch/mips/configs/econet_en751221_defconfig
  F:	arch/mips/econet/
  F:	drivers/clocksource/timer-econet-en751221.c
  F:	drivers/irqchip/irq-econet-en751221.c
@@@ -9611,8 -9387,9 +9611,8 @@@ S:	Maintaine
  F:	drivers/edac/octeon_edac*
 =20
  EDAC-CAVIUM THUNDERX
 -M:	Robert Richter <rric@kernel.org>
  L:	linux-edac@vger.kernel.org
 -S:	Odd Fixes
 +S:	Orphan
  F:	drivers/edac/thunderx_edac*
 =20
  EDAC-CORE
@@@ -9639,8 -9416,9 +9639,8 @@@ S:	Supporte
  F:	drivers/edac/dmc520_edac.c
 =20
  EDAC-E752X
 -M:	Mark Gross <markgross@kernel.org>
  L:	linux-edac@vger.kernel.org
 -S:	Maintained
 +S:	Orphan
  F:	drivers/edac/e752x_edac.c
 =20
  EDAC-E7XXX
@@@ -9672,11 -9450,6 +9672,11 @@@ L:	linux-edac@vger.kernel.or
  S:	Orphan
  F:	drivers/edac/i3000_edac.c
 =20
 +EDAC-I3200
 +L:	linux-edac@vger.kernel.org
 +S:	Orphan
 +F:	drivers/edac/i3200_edac.c
 +
  EDAC-I5000
  L:	linux-edac@vger.kernel.org
  S:	Maintained
@@@ -9701,8 -9474,9 +9701,8 @@@ S:	Maintaine
  F:	drivers/edac/i7core_edac.c
 =20
  EDAC-I82975X
 -M:	"Arvind R." <arvino55@gmail.com>
  L:	linux-edac@vger.kernel.org
 -S:	Maintained
 +S:	Orphan
  F:	drivers/edac/i82975x_edac.c
 =20
  EDAC-IE31200
@@@ -9713,20 -9487,15 +9713,20 @@@ F:	drivers/edac/ie31200_edac.
 =20
  EDAC-IGEN6
  M:	Tony Luck <tony.luck@intel.com>
 -R:	Qiuxu Zhuo <qiuxu.zhuo@intel.com>
 +R:	Qiuxu Zhuo <qzhuo@nvidia.com>
  L:	linux-edac@vger.kernel.org
  S:	Maintained
  F:	drivers/edac/igen6_edac.c
 =20
 -EDAC-MPC85XX
 -M:	Johannes Thumshirn <morbidrsa@gmail.com>
 +EDAC-INTEL-BFF-RESET
 +M:	Tony Luck <tony.luck@intel.com>
  L:	linux-edac@vger.kernel.org
  S:	Maintained
 +F:	drivers/edac/intel-bff.c
 +
 +EDAC-MPC85XX
 +L:	linux-edac@vger.kernel.org
 +S:	Orphan
  F:	drivers/edac/mpc85xx_edac.[ch]
 =20
  EDAC-NPCM
@@@ -9758,7 -9527,7 +9758,7 @@@ F:	drivers/edac/qcom_edac.
 =20
  EDAC-SBRIDGE
  M:	Tony Luck <tony.luck@intel.com>
 -R:	Qiuxu Zhuo <qiuxu.zhuo@intel.com>
 +R:	Qiuxu Zhuo <qzhuo@nvidia.com>
  L:	linux-edac@vger.kernel.org
  S:	Maintained
  F:	drivers/edac/sb_edac.c
@@@ -9775,11 -9544,6 +9775,11 @@@ L:	linux-edac@vger.kernel.or
  S:	Odd Fixes
  F:	drivers/edac/ti_edac.c
 =20
 +EDAC-X38
 +L:	linux-edac@vger.kernel.org
 +S:	Orphan
 +F:	drivers/edac/x38_edac.c
 +
  EDIROL UA-101/UA-1000 DRIVER
  M:	Clemens Ladisch <clemens@ladisch.de>
  L:	linux-sound@vger.kernel.org
@@@ -9919,14 -9683,14 +9919,14 @@@ EROFS FILE SYSTE
  M:	Gao Xiang <xiang@kernel.org>
  M:	Chao Yu <chao@kernel.org>
  R:	Yue Hu <zbestahu@gmail.com>
 -R:	Jeffle Xu <jefflexu@linux.alibaba.com>
 +R:	Jingbo Xu <jefflexu@163.com>
  R:	Sandeep Dhavale <dhavale@google.com>
  R:	Hongbo Li <hongbohbli@tencent.com>
  R:	Chunhai Guo <guochunhai@vivo.com>
  L:	linux-erofs@lists.ozlabs.org
  S:	Maintained
  W:	https://erofs.docs.kernel.org
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev
  F:	Documentation/ABI/testing/sysfs-fs-erofs
  F:	Documentation/filesystems/erofs.rst
  F:	fs/erofs/
@@@ -9937,14 -9701,6 +9937,14 @@@ M:	Jeff Layton <jlayton@kernel.org
  S:	Maintained
  F:	include/linux/errseq.h
  F:	lib/errseq.c
 +F:	lib/tests/errseq_kunit.c
 +
 +ES9039Q2M AUDIO CODEC DRIVER
 +M:	Karl Asseily <karl@asseily.com>
 +L:	linux-sound@vger.kernel.org
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/sound/esstech,es9039q2m.yaml
 +F:	sound/soc/codecs/es9039q2m.c
 =20
  ESD CAN NETWORK DRIVERS
  M:	Stefan M=C3=A4tje <stefan.maetje@esd.eu>
@@@ -10075,7 -9831,6 +10075,7 @@@ R:	Yuezhang Mo <yuezhang.mo@sony.com
  L:	exfat@lists.linux.dev
  S:	Maintained
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/exfat.git
 +F:	Documentation/filesystems/exfat.rst
  F:	fs/exfat/
 =20
  EXPRESSWIRE PROTOCOL LIBRARY
@@@ -10106,7 -9861,7 +10106,7 @@@ L:	linux-ext4@vger.kernel.or
  S:	Maintained
  W:	http://ext4.wiki.kernel.org
  Q:	http://patchwork.ozlabs.org/project/linux-ext4/list/
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
  F:	Documentation/filesystems/ext4/
  F:	fs/ext4/
  F:	include/trace/events/ext4.h
@@@ -10192,7 -9947,7 +10192,7 @@@ S:	Maintaine
  W:	https://f2fs.wiki.kernel.org/
  Q:	https://patchwork.kernel.org/project/f2fs/list/
  B:	https://bugzilla.kernel.org/enter_bug.cgi?product=3DFile%20System&comp=
onent=3Df2fs
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev
  F:	Documentation/ABI/testing/sysfs-fs-f2fs
  F:	Documentation/filesystems/f2fs.rst
  F:	fs/f2fs/
@@@ -10223,7 -9978,6 +10223,7 @@@ F:	net/core/failover.
  FANOTIFY
  M:	Jan Kara <jack@suse.cz>
  R:	Amir Goldstein <amir73il@gmail.com>
 +R:	Matt Bobrowski <matt@bobrowski.net>
  L:	linux-fsdevel@vger.kernel.org
  S:	Maintained
  F:	fs/notify/fanotify/
@@@ -10348,6 -10102,7 +10348,6 @@@ F:	tools/testing/selftests/mount_setatt
 =20
  FILESYSTEMS [IOMAP]
  M:	Christian Brauner <brauner@kernel.org>
 -R:	Darrick J. Wong <djwong@kernel.org>
  L:	linux-xfs@vger.kernel.org
  L:	linux-fsdevel@vger.kernel.org
  S:	Supported
@@@ -10429,14 -10184,6 +10429,14 @@@ F:	include/linux/firewire.
  F:	include/uapi/linux/firewire*.h
  F:	tools/firewire/
 =20
 +FIRMWARE ATTRIBUTES CLASS
 +M:	Hans de Goede <hansg@kernel.org>
 +M:	Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
 +L:	platform-driver-x86@vger.kernel.org
 +S:	Maintained
 +F:	drivers/firmware/firmware_attributes_class.c
 +F:	include/linux/firmware_attributes.h
 +
  FIRMWARE FRAMEWORK FOR ARMV8-A
  M:	Sudeep Holla <sudeep.holla@kernel.org>
  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
@@@ -10446,6 -10193,7 +10446,6 @@@ F:	include/linux/arm_ffa.
 =20
  FIRMWARE LOADER (request_firmware)
  M:	Luis Chamberlain <mcgrof@kernel.org>
 -M:	Russ Weight <russ.weight@linux.dev>
  M:	Danilo Krummrich <dakr@kernel.org>
  L:	driver-core@lists.linux.dev
  S:	Maintained
@@@ -10461,8 -10209,9 +10461,8 @@@ S:	Maintaine
  F:	drivers/nvmem/layouts/fixed-layout.c
 =20
  FLEXTIMER FTM-QUADDEC DRIVER
 -M:	Patrick Havelange <patrick.havelange@essensium.com>
  L:	linux-iio@vger.kernel.org
 -S:	Maintained
 +S:	Orphan
  F:	Documentation/devicetree/bindings/counter/fsl,ftm-quaddec.yaml
  F:	drivers/counter/ftm-quaddec.c
 =20
@@@ -10593,7 -10342,7 +10593,7 @@@ L:	linux-fbdev@vger.kernel.or
  L:	dri-devel@lists.freedesktop.org
  S:	Maintained
  Q:	http://patchwork.kernel.org/project/linux-fbdev/list/
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.g=
it
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.g=
it for-next
  F:	Documentation/fb/
  F:	drivers/video/
  F:	include/linux/fb.h
@@@ -10604,7 -10353,7 +10604,7 @@@ F:	include/video
  FREESCALE CAAM (Cryptographic Acceleration and Assurance Module) DRIVER
  M:	Horia Geant=C4=83 <horia.geanta@nxp.com>
  M:	Pankaj Gupta <pankaj.gupta@nxp.com>
 -M:	Gaurav Jain <gaurav.jain@nxp.com>
 +M:	Sahil Malhotra <sahil.malhotra@nxp.com>
  L:	linux-crypto@vger.kernel.org
  S:	Maintained
  F:	Documentation/devicetree/bindings/crypto/fsl,sec-v4.0*
@@@ -10719,14 -10468,6 +10719,14 @@@ F:	drivers/perf/fsl_imx8_ddr_perf.
  F:	drivers/perf/fsl_imx9_ddr_perf.c
  F:	tools/perf/pmu-events/arch/arm64/freescale/
 =20
 +FREESCALE IMX GPIO DRIVER
 +M:	Peng Fan <peng.fan@nxp.com>
 +L:	linux-gpio@vger.kernel.org
 +L:	imx@lists.linux.dev
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
 +F:	drivers/gpio/gpio-mxc.c
 +
  FREESCALE IMX I2C DRIVER
  M:	Oleksij Rempel <o.rempel@pengutronix.de>
  R:	Pengutronix Kernel Team <kernel@pengutronix.de>
@@@ -10920,8 -10661,7 +10920,8 @@@ M:	Jaegeuk Kim <jaegeuk@kernel.org
  L:	linux-fscrypt@vger.kernel.org
  S:	Supported
  Q:	https://patchwork.kernel.org/project/linux-fscrypt/list/
 -T:	git https://git.kernel.org/pub/scm/fs/fscrypt/linux.git
 +T:	git https://git.kernel.org/pub/scm/fs/fscrypt/linux.git for-next
 +T:	git https://git.kernel.org/pub/scm/fs/fscrypt/linux.git for-current
  F:	Documentation/filesystems/fscrypt.rst
  F:	fs/crypto/
  F:	include/linux/fscrypt.h
@@@ -10968,8 -10708,7 +10968,8 @@@ M:	Theodore Y. Ts'o <tytso@mit.edu
  L:	fsverity@lists.linux.dev
  S:	Supported
  Q:	https://patchwork.kernel.org/project/fsverity/list/
 -T:	git https://git.kernel.org/pub/scm/fs/fsverity/linux.git
 +T:	git https://git.kernel.org/pub/scm/fs/fsverity/linux.git for-next
 +T:	git https://git.kernel.org/pub/scm/fs/fsverity/linux.git for-current
  F:	Documentation/filesystems/fsverity.rst
  F:	fs/verity/
  F:	include/linux/fsverity.h
@@@ -11160,7 -10899,6 +11160,7 @@@ M:	Peter Oberparleiter <oberpar@linux.i
  S:	Maintained
  F:	Documentation/dev-tools/gcov.rst
  F:	kernel/gcov/
 +F:	scripts/Makefile.gcov
 =20
  GDB KERNEL DEBUGGING HELPER SCRIPTS
  M:	Jan Kiszka <jan.kiszka@siemens.com>
@@@ -11264,7 -11002,7 +11264,7 @@@ R:	Manivannan Sadhasivam <mani@kernel.o
  L:	linux-phy@lists.infradead.org
  S:	Supported
  Q:	https://patchwork.kernel.org/project/linux-phy/list/
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git ne=
xt
  F:	Documentation/devicetree/bindings/phy/
  F:	drivers/phy/
  F:	include/dt-bindings/phy/
@@@ -11326,8 -11064,8 +11326,8 @@@ M:	Vincenzo Frascino <vincenzo.frascino
  L:	linux-kernel@vger.kernel.org
  S:	Maintained
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/v=
dso
 -F:	include/asm-generic/vdso/vsyscall.h
  F:	include/linux/vdso_datastore.h
 +F:	include/linux/vdso_time.h
  F:	include/vdso/
  F:	kernel/time/namespace_vdso.c
  F:	kernel/time/vsyscall.c
@@@ -11401,6 -11139,16 +11401,6 @@@ S:	Maintaine
  F:	Documentation/networking/device_drivers/ethernet/google/gve.rst
  F:	drivers/net/ethernet/google
 =20
 -GOOGLE FIRMWARE DRIVERS
 -M:	Tzung-Bi Shih <tzungbi@kernel.org>
 -R:	Brian Norris <briannorris@chromium.org>
 -R:	Julius Werner <jwerner@chromium.org>
 -L:	chrome-platform@lists.linux.dev
 -S:	Maintained
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linu=
x.git
 -F:	drivers/firmware/google/
 -F:	include/linux/coreboot.h
 -
  GOOGLE TENSOR SoC SUPPORT
  M:	Peter Griffin <peter.griffin@linaro.org>
  R:	Andr=C3=A9 Draszik <andre.draszik@linaro.org>
@@@ -11415,7 -11163,6 +11415,7 @@@ F:	Documentation/devicetree/bindings/ph
  F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen=
=2Eyaml
  F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
  F:	arch/arm64/boot/dts/exynos/google/
 +F:	arch/arm64/boot/dts/google/
  F:	drivers/clk/samsung/clk-gs101.c
  F:	drivers/phy/phy-google-usb.c
  F:	drivers/soc/samsung/gs101-pmu.c
@@@ -11572,6 -11319,13 +11572,6 @@@ M:	Bryan O'Donoghue <pure.logic@nexus-s
  S:	Maintained
  F:	drivers/staging/greybus/loopback.c
 =20
 -GREYBUS PLATFORM DRIVERS
 -M:	Vaibhav Hiremath <hvaibhav.linux@gmail.com>
 -S:	Maintained
 -F:	drivers/staging/greybus/arche-apb-ctrl.c
 -F:	drivers/staging/greybus/arche-platform.c
 -F:	drivers/staging/greybus/arche_platform.h
 -
  GREYBUS SDIO/GPIO/SPI PROTOCOLS DRIVERS
  M:	Rui Miguel Silva <rmfrfs@gmail.com>
  S:	Maintained
@@@ -11668,9 -11422,7 +11668,9 @@@ M:	Harald Welte <laforge@gnumonks.org
  L:	osmocom-net-gprs@lists.osmocom.org
  S:	Maintained
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pablo/gtp.git
 +F:	Documentation/netlink/specs/gtp.yaml
  F:	drivers/net/gtp.c
 +F:	tools/testing/selftests/net/gtp.py
 =20
  GUID PARTITION TABLE (GPT)
  M:	Davidlohr Bueso <dave@stgolabs.net>
@@@ -11679,10 -11431,10 +11679,10 @@@ S:	Maintaine
  F:	block/partitions/efi.*
 =20
  HABANALABS PCI DRIVER
 -M:	Koby Elbaz <koby.elbaz@intel.com>
 -M:	Konstantin Sinyuk <konstantin.sinyuk@intel.com>
 +M:	Konstantin Sinyuk <ksinyuk@kernel.org>
 +M:	Koby Elbaz <elbaz.koby@gmail.com>
  L:	dri-devel@lists.freedesktop.org
 -S:	Supported
 +S:	Maintained
  C:	irc://irc.oftc.net/dri-devel
  T:	git https://github.com/HabanaAI/drivers.accel.habanalabs.kernel.git
  F:	Documentation/ABI/testing/debugfs-driver-habanalabs
@@@ -11888,12 -11640,6 +11888,12 @@@ L:	linux-input@vger.kernel.or
  S:	Supported
  F:	drivers/hid/hid-playstation.c
 =20
 +HID PULSAR DRIVER
 +M:	Nikolas Koesling <nikolas@koesling.info>
 +L:	linux-input@vger.kernel.org
 +S:	Maintained
 +F:	drivers/hid/hid-pulsar.c
 +
  HID SENSOR HUB DRIVERS
  M:	Jiri Kosina <jikos@kernel.org>
  M:	Jonathan Cameron <jic23@kernel.org>
@@@ -11985,13 -11731,6 +11985,13 @@@ W:	http://www.highpoint-tech.co
  F:	Documentation/scsi/hptiop.rst
  F:	drivers/scsi/hptiop.c
 =20
 +HIMAX HM1246 SENSOR DRIVER
 +M:	Matthias Fend <matthias.fend@emfend.at>
 +L:	linux-media@vger.kernel.org
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml
 +F:	drivers/media/i2c/hm1246.c
 +
  HIMAX HX83112B TOUCHSCREEN SUPPORT
  M:	Job Noorman <job@noorman.info>
  L:	linux-input@vger.kernel.org
@@@ -12131,14 -11870,14 +12131,14 @@@ M:	Chengchang Tang <tangchengchang@hu=
aw
  M:	Junxian Huang <huangjunxian6@hisilicon.com>
  L:	linux-rdma@vger.kernel.org
  S:	Maintained
 -F:	Documentation/devicetree/bindings/infiniband/hisilicon-hns-roce.txt
 +F:	Documentation/devicetree/bindings/infiniband/hisilicon,hns-roce-v1.yaml
  F:	drivers/infiniband/hw/hns/
 =20
  HISILICON SAS Controller
  M:	Xingui Yang <yangxingui@huawei.com>
  S:	Supported
  W:	http://www.hisilicon.com
 -F:	Documentation/devicetree/bindings/scsi/hisilicon-sas.txt
 +F:	Documentation/devicetree/bindings/scsi/hisilicon,hip05-sas-v1.yaml
  F:	drivers/scsi/hisi_sas/
 =20
  HISILICON SECURITY ENGINE V2 DRIVER (SEC2)
@@@ -12191,6 -11930,17 +12191,6 @@@ S:	Maintaine
  F:	Documentation/ABI/testing/debugfs-hisi-zip
  F:	drivers/crypto/hisilicon/zip/
 =20
 -HMM - Heterogeneous Memory Management
 -M:	Jason Gunthorpe <jgg@nvidia.com>
 -M:	Leon Romanovsky <leonro@nvidia.com>
 -L:	linux-mm@kvack.org
 -S:	Maintained
 -F:	Documentation/mm/hmm.rst
 -F:	include/linux/hmm*
 -F:	lib/test_hmm*
 -F:	mm/hmm*
 -F:	tools/testing/selftests/mm/*hmm*
 -
  HONEYWELL ABP2030PA PRESSURE SENSOR SERIES IIO DRIVER
  M:	Petre Rodan <petre.rodan@subdimension.ro>
  L:	linux-iio@vger.kernel.org
@@@ -12213,13 -11963,6 +12213,13 @@@ S:	Maintaine
  F:	Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.y=
aml
  F:	drivers/iio/pressure/mprls0025pa*
 =20
 +HONOR FMI-XX HARDWARE MONITOR DRIVER
 +M:	Nikita Dubrovskih <testname142@gmail.com>
 +L:	linux-hwmon@vger.kernel.org
 +S:	Maintained
 +F:	Documentation/hwmon/honor-fmi.rst
 +F:	drivers/hwmon/honor-fmi.c
 +
  HP BIOSCFG DRIVER
  M:	Jorge Lopez <jorge.lopez2@hp.com>
  L:	platform-driver-x86@vger.kernel.org
@@@ -12344,6 -12087,29 +12344,6 @@@ F:	drivers/power/supply/huawei-gaokun-b
  F:	drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
  F:	include/linux/platform_data/huawei-gaokun-ec.h
 =20
 -HUGETLB SUBSYSTEM
 -M:	Muchun Song <muchun.song@linux.dev>
 -M:	Oscar Salvador <osalvador@suse.de>
 -R:	David Hildenbrand <david@kernel.org>
 -L:	linux-mm@kvack.org
 -S:	Maintained
 -F:	Documentation/ABI/testing/sysfs-kernel-mm-hugepages
 -F:	Documentation/admin-guide/mm/hugetlbpage.rst
 -F:	Documentation/mm/hugetlbfs_reserv.rst
 -F:	Documentation/mm/vmemmap_dedup.rst
 -F:	fs/hugetlbfs/
 -F:	include/linux/hugetlb.h
 -F:	include/trace/events/hugetlbfs.h
 -F:	mm/hugetlb.c
 -F:	mm/hugetlb_cgroup.c
 -F:	mm/hugetlb_cma.c
 -F:	mm/hugetlb_cma.h
 -F:	mm/hugetlb_sysctl.c
 -F:	mm/hugetlb_sysfs.c
 -F:	mm/hugetlb_vmemmap.c
 -F:	mm/hugetlb_vmemmap.h
 -F:	tools/testing/selftests/cgroup/test_hugetlb_memcg.c
 -
  HVA ST MEDIA DRIVER
  M:	Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>
  L:	linux-media@vger.kernel.org
@@@ -12352,6 -12118,17 +12352,6 @@@ W:	https://linuxtv.or
  T:	git git://linuxtv.org/media.git
  F:	drivers/media/platform/st/sti/hva
 =20
 -HWPOISON MEMORY FAILURE HANDLING
 -M:	Miaohe Lin <linmiaohe@huawei.com>
 -R:	Naoya Horiguchi <nao.horiguchi@gmail.com>
 -L:	linux-mm@kvack.org
 -S:	Maintained
 -F:	include/linux/memory-failure.h
 -F:	include/trace/events/memory-failure.h
 -F:	mm/hwpoison-inject.c
 -F:	mm/memory-failure.c
 -F:	tools/testing/selftests/mm/memory-failure.c
 -
  HYCON HY46XX TOUCHSCREEN SUPPORT
  M:	Giulio Benetti <giulio.benetti@benettiengineering.com>
  L:	linux-input@vger.kernel.org
@@@ -12385,9 -12162,11 +12385,9 @@@ S:	Maintaine
  F:	drivers/media/i2c/hi847.c
 =20
  Hyper-V/Azure CORE AND DRIVERS
 -M:	"K. Y. Srinivasan" <kys@microsoft.com>
  M:	Haiyang Zhang <haiyangz@microsoft.com>
  M:	Wei Liu <wei.liu@kernel.org>
  M:	Dexuan Cui <decui@microsoft.com>
 -M:	Long Li <longli@microsoft.com>
  L:	linux-hyperv@vger.kernel.org
  S:	Supported
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git
@@@ -12445,7 -12224,7 +12445,7 @@@ F:	drivers/tty/hvc
 =20
  HUNG TASK DETECTOR
  M:	Andrew Morton <akpm@linux-foundation.org>
 -R:	Lance Yang <lance.yang@linux.dev>
 +M:	Lance Yang <lance.yang@linux.dev>
  R:	Masami Hiramatsu <mhiramat@kernel.org>
  R:	Petr Mladek <pmladek@suse.com>
  L:	linux-kernel@vger.kernel.org
@@@ -12680,7 -12459,6 +12680,7 @@@ F:	drivers/crypto/nx/Makefil
  F:	drivers/crypto/nx/nx-842*
  F:	include/linux/sw842.h
  F:	lib/842/
 +F:	lib/tests/842_decompress_kunit.c
 =20
  IBM Power in-Nest Crypto Acceleration
  M:	Breno Leit=C3=A3o <leitao@debian.org>
@@@ -12921,7 -12699,6 +12921,7 @@@ R:	Nuno S=C3=A1 <nuno.sa@analog.com
  R:	Andy Shevchenko <andy@kernel.org>
  L:	linux-iio@vger.kernel.org
  S:	Maintained
 +Q:	https://patchwork.kernel.org/project/linux-iio/list/
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git
  F:	Documentation/ABI/testing/configfs-iio*
  F:	Documentation/ABI/testing/sysfs-bus-iio*
@@@ -12934,13 -12711,6 +12934,13 @@@ F:	include/dt-bindings/iio
  F:	include/linux/iio/
  F:	tools/iio/
 =20
 +IIO CORE KUNIT TESTS
 +M:	Rodrigo Alencar <rodrigo.alencar@analog.com>
 +L:	linux-iio@vger.kernel.org
 +S:	Maintained
 +F:	drivers/iio/test/iio-test-channel-prefix.c
 +F:	drivers/iio/test/iio-test-format.c
 +
  IIO UNIT CONVERTER
  M:	Peter Rosin <peda@lysator.liu.se>
  L:	linux-iio@vger.kernel.org
@@@ -13114,7 -12884,7 +13114,7 @@@ S:	Maintaine
  F:	drivers/power/supply/ip5xxx_power.c
 =20
  INNOSILICON HDMI BRIDGE DRIVER
 -M:	Andy Yan <andy.yan@rock-chips.com>
 +M:	Andy Yan <andyshrk@163.com>
  L:	dri-devel@lists.freedesktop.org
  S:	Maintained
  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
@@@ -13243,8 -13013,9 +13243,8 @@@ S:	Maintaine
  F:	drivers/platform/x86/intel/atomisp2/led.c
 =20
  INTEL BIOS SAR INT1092 DRIVER
 -M:	Shravan Sudhakar <s.shravan@intel.com>
  L:	platform-driver-x86@vger.kernel.org
 -S:	Maintained
 +S:	Orphan
  F:	drivers/platform/x86/intel/int1092/
 =20
  INTEL BROXTON PMC DRIVER
@@@ -13262,8 -13033,6 +13262,8 @@@ F:	drivers/scsi/isci
 =20
  INTEL COMPUTER VISION SENSING (CVS) DRIVER
  M:	Miguel Vadillo <miguel.vadillo@intel.com>
 +M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 +R:	Antti Laakso <antti.laakso@linux.intel.com>
  L:	linux-media@vger.kernel.org
  S:	Maintained
  F:	drivers/media/i2c/cvs/
@@@ -13451,15 -13220,6 +13451,15 @@@ S:	Supporte
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
  F:	drivers/iommu/intel/
 =20
 +INTEL IPU BRIDGE
 +M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 +M:	Dan Scally <dan.scally@ideasonboard.com>
 +R:	Hans de Goede <hansg@kernel.org>
 +L:	linux-media@vger.kernel.org
 +S:	Maintained
 +F:	drivers/media/pci/intel/ipu-bridge.c
 +F:	include/media/ipu-bridge.h
 +
  INTEL IPU3 CSI-2 CIO2 DRIVER
  M:	Yong Zhi <yong.zhi@intel.com>
  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
@@@ -13481,10 -13241,6 +13481,10 @@@ F:	drivers/staging/media/ipu3
 =20
  INTEL IPU6 INPUT SYSTEM DRIVER
  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 +R:	Antti Laakso <antti.laakso@linux.intel.com>
 +R:	"Sapre, Sarang" <sarang.sapre@intel.com>
 +R:	Divyamani Tripathi <divyamani.tripathi@intel.com>
 +R:	Manik Bajpai <manik.bajpai@intel.com>
  L:	linux-media@vger.kernel.org
  S:	Maintained
  T:	git git://linuxtv.org/media.git
@@@ -13527,6 -13283,7 +13527,6 @@@ F:	drivers/crypto/intel/keembay/ocs-aes
 =20
  INTEL KEEM BAY OCS ECC CRYPTO DRIVER
  M:	Prabhjot Khurana <prabhjot.khurana@intel.com>
 -M:	Mark Gross <mgross@linux.intel.com>
  S:	Maintained
  F:	Documentation/devicetree/bindings/crypto/intel,keembay-ocs-ecc.yaml
  F:	drivers/crypto/intel/keembay/Kconfig
@@@ -13721,7 -13478,6 +13721,7 @@@ K:	\bSGX
  INTEL SKYLAKE INT3472 ACPI DEVICE DRIVER
  M:	Daniel Scally <dan.scally@ideasonboard.com>
  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 +L:	linux-media@vger.kernel.org
  S:	Maintained
  T:	git git://linuxtv.org/media.git
  F:	drivers/platform/x86/intel/int3472/
@@@ -13766,7 -13522,6 +13766,7 @@@ M:	Srinivas Pandruvada <srinivas.pandru
  L:	platform-driver-x86@vger.kernel.org
  S:	Maintained
  F:	Documentation/ABI/testing/debugfs-tpmi
 +F:	drivers/platform/x86/intel/tpmi_common.[ch]
  F:	drivers/platform/x86/intel/vsec_tpmi.c
  F:	include/linux/intel_tpmi.h
 =20
@@@ -13809,7 -13564,7 +13809,7 @@@ INTEL WIRELESS WIFI LINK (iwlwifi
  M:	Miri Korenblit <miriam.rachel.korenblit@intel.com>
  L:	linux-wireless@vger.kernel.org
  S:	Supported
 -W:	https://wireless.wiki.kernel.org/en/users/drivers/iwlwifi
 +W:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/iwlwifi.ht=
ml
  T:	git https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-ne=
xt.git/
  F:	drivers/net/wireless/intel/iwlwifi/
 =20
@@@ -14010,16 -13765,6 +14010,16 @@@ S:	Maintaine
  F:	io_uring/bpf-ops.*
  F:	io_uring/loop.*
 =20
 +IPC
 +M:	Andrew Morton <akpm@linux-foundation.org>
 +R:	Manfred Spraul <manfred@colorfullife.com>
 +R:	Davidlohr Bueso <dave@stgolabs.net>
 +L:	linux-kernel@vger.kernel.org
 +S:	Maintained
 +F:	ipc/
 +F:	tools/testing/selftests/ipc/
 +F:	tools/testing/selftests/mqueue/
 +
  IPMI SUBSYSTEM
  M:	Corey Minyard <corey@minyard.net>
  L:	openipmi-developer@lists.sourceforge.net (moderated for non-subscriber=
s)
@@@ -14199,14 -13944,6 +14199,14 @@@ T:	git https://gitlab.freedesktop.org/d
  F:	Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
  F:	drivers/gpu/drm/bridge/ite-it66121.c
 =20
 +ITE IT6625 HDMI to MIPI MEDIA DRIVER
 +M:	Hermes Wu <Hermes.Wu@ite.com.tw>
 +S:	Maintained
 +T:	git git://linuxtv.org/media.git
 +F:	Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml
 +F:	drivers/media/i2c/it6625.c
 +F:	include/uapi/linux/it6625.h
 +
  IVTV VIDEO4LINUX DRIVER
  M:	Andy Walls <awalls@md.metrocast.net>
  L:	linux-media@vger.kernel.org
@@@ -14298,6 -14035,23 +14298,6 @@@ S:	Maintaine
  F:	Documentation/hwmon/kb9002.rst
  F:	drivers/hwmon/kb9002.c
 =20
 -KASAN
 -M:	Andrey Ryabinin <ryabinin.a.a@gmail.com>
 -R:	Alexander Potapenko <glider@google.com>
 -R:	Andrey Konovalov <andreyknvl@gmail.com>
 -R:	Dmitry Vyukov <dvyukov@google.com>
 -R:	Vincenzo Frascino <vincenzo.frascino@arm.com>
 -L:	kasan-dev@googlegroups.com
 -S:	Maintained
 -B:	https://bugzilla.kernel.org/buglist.cgi?component=3DSanitizers&product=
=3DMemory%20Management
 -F:	Documentation/dev-tools/kasan.rst
 -F:	arch/*/include/asm/*kasan.h
 -F:	arch/*/mm/kasan_init*
 -F:	include/linux/kasan*.h
 -F:	lib/Kconfig.kasan
 -F:	mm/kasan/
 -F:	scripts/Makefile.kasan
 -
  KCONFIG
  M:	Nathan Chancellor <nathan@kernel.org>
  M:	Nicolas Schier <nsc@kernel.org>
@@@ -14308,7 -14062,6 +14308,7 @@@ Q:	https://patchwork.kernel.org/project
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git
  F:	Documentation/kbuild/kconfig*
  F:	scripts/Kconfig.include
 +F:	scripts/Kconfig.toolchain
  F:	scripts/kconfig/
 =20
  KCORE
@@@ -14390,7 -14143,6 +14390,7 @@@ F:	scripts/basic
  F:	scripts/clang-tools/
  F:	scripts/container
  F:	scripts/dummy-tools/
 +F:	scripts/gen_init*
  F:	scripts/include/
  F:	scripts/install.sh
  F:	scripts/mk*
@@@ -14414,7 -14166,6 +14414,7 @@@ F:	include/linux/ucopysize.
  F:	kernel/configs/hardening.config
  F:	kernel/kstack_erase.c
  F:	lib/tests/randstruct_kunit.c
 +F:	lib/tests/stackinit_kunit.c
  F:	lib/tests/usercopy_kunit.c
  F:	mm/usercopy.c
  F:	scripts/Makefile.kstack_erase
@@@ -14440,8 -14191,7 +14440,8 @@@ L:	linux-nfs@vger.kernel.or
  S:	Supported
  P:	Documentation/filesystems/nfs/nfsd-maintainer-entry-profile.rst
  B:	https://bugzilla.kernel.org
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git nfsd-t=
esting
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git nfsd-n=
ext
  F:	Documentation/filesystems/nfs/
  F:	fs/lockd/
  F:	fs/nfs_common/
@@@ -14458,7 -14208,6 +14458,7 @@@ F:	include/uapi/linux/nfsd
  F:	include/uapi/linux/sunrpc/
  F:	net/sunrpc/
  F:	tools/net/sunrpc/
 +F:	tools/testing/selftests/nfsd/
 =20
  KERNEL NFSD BLOCK and SCSI LAYOUT DRIVER
  R:	Christoph Hellwig <hch@lst.de>
@@@ -14491,6 -14240,8 +14491,6 @@@ F:	tools/testing/selftests
  KERNEL SMB3 SERVER (KSMBD)
  M:	Namjae Jeon <linkinjeon@kernel.org>
  M:	Namjae Jeon <linkinjeon@samba.org>
 -M:	Steve French <smfrench@gmail.com>
 -M:	Steve French <sfrench@samba.org>
  R:	Sergey Senozhatsky <senozhatsky@chromium.org>
  R:	Tom Talpey <tom@talpey.com>
  R:	ChenXiaoSong <chenxiaosong@chenxiaosong.com>
@@@ -14556,9 -14307,7 +14556,9 @@@ R:	Zenghui Yu <yuzenghui@huawei.com
  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
  L:	kvmarm@lists.linux.dev
  S:	Maintained
 +P:	Documentation/process/maintainer-kvm-arm64.rst
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git
 +F:	Documentation/process/maintainer-kvm-arm64.rst
  F:	Documentation/virt/kvm/arm/
  F:	Documentation/virt/kvm/devices/arm*
  F:	arch/arm64/include/asm/kvm*
@@@ -14606,8 -14355,6 +14606,8 @@@ F:	arch/powerpc/include/asm/kvm
  F:	arch/powerpc/include/uapi/asm/kvm*
  F:	arch/powerpc/kernel/kvm*
  F:	arch/powerpc/kvm/
 +F:	tools/testing/selftests/kvm/*/powerpc/
 +F:	tools/testing/selftests/kvm/powerpc/
 =20
  KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)
  M:	Anup Patel <anup@brainfault.org>
@@@ -14616,7 -14363,7 +14616,7 @@@ L:	kvm@vger.kernel.or
  L:	kvm-riscv@lists.infradead.org
  L:	linux-riscv@lists.infradead.org
  S:	Maintained
 -T:	git https://github.com/kvm-riscv/linux.git
 +T:	git https://github.com/kvm-riscv/linux.git riscv_kvm_next
  F:	arch/riscv/include/asm/kvm*
  F:	arch/riscv/include/uapi/asm/kvm*
  F:	arch/riscv/kvm/
@@@ -14632,7 -14379,6 +14632,7 @@@ L:	kvm@vger.kernel.or
  S:	Supported
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux.git
  F:	Documentation/virt/kvm/s390*
 +F:	arch/s390/include/arm64/*
  F:	arch/s390/include/asm/gmap_helpers.h
  F:	arch/s390/include/asm/kvm*
  F:	arch/s390/include/uapi/asm/kvm*
@@@ -14645,22 -14391,6 +14645,22 @@@ F:	tools/testing/selftests/drivers/s390
  F:	tools/testing/selftests/kvm/*/s390/
  F:	tools/testing/selftests/kvm/s390/
 =20
 +KERNEL VIRTUAL MACHINE for arm-on-s390 (KVM/s390)
 +R:	Steffen Eiden <seiden@linux.ibm.com>
 +R:	Andreas Grapentin <gra@linux.ibm.com>
 +R:	Marc Zyngier <maz@kernel.org>
 +L:	kvm@vger.kernel.org
 +L:	linux-s390@vger.kernel.org
 +S:	Supported
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux.git
 +F:	arch/s390/include/arm64/
 +F:	arch/s390/include/asm/aef.h
 +F:	arch/s390/include/asm/kvm_host_arm64*
 +F:	arch/s390/include/asm/sae*
 +F:	arch/s390/kernel/aef.c
 +F:	arch/s390/kvm/arm64/
 +F:	arch/s390/tools/*arm64*
 +
  KERNEL VIRTUAL MACHINE FOR X86 (KVM/x86)
  M:	Sean Christopherson <seanjc@google.com>
  M:	Paolo Bonzini <pbonzini@redhat.com>
@@@ -14689,7 -14419,6 +14689,7 @@@ S:	Supporte
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-c=
ore.git
  F:	fs/kernfs/
  F:	include/linux/kernfs.h
 +F:	tools/testing/selftests/filesystems/kernfs_test.c
 =20
  KEXEC
  M:	Andrew Morton <akpm@linux-foundation.org>
@@@ -14762,7 -14491,7 +14762,7 @@@ S:	Supporte
  F:	include/keys/trusted_dcp.h
  F:	security/keys/trusted-keys/trusted_dcp.c
 =20
 -KEYS-TRUSTED-PLPKS
 +KEYS-TRUSTED-PKWM
  M:	Srish Srinivasan <ssrish@linux.ibm.com>
  M:	Nayna Jain <nayna@linux.ibm.com>
  L:	linux-integrity@vger.kernel.org
@@@ -15057,7 -14786,6 +15057,7 @@@ F:	drivers/scsi/leapraid
  LED SUBSYSTEM
  M:	Lee Jones <lee@kernel.org>
  M:	Pavel Machek <pavel@kernel.org>
 +R:	Griffin Kroah-Hartman <griffin@kroah.com>
  L:	linux-leds@vger.kernel.org
  S:	Maintained
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git
@@@ -15084,7 -14812,6 +15084,7 @@@ F:	drivers/usb/misc/legousbtower.
  LENOVO drivers
  M:	Mark Pearson <mpearson-lenovo@squebb.ca>
  M:	Derek J. Clark <derekjohn.clark@gmail.com>
 +M:	Rong Zhang <i@rong.moe>
  L:	platform-driver-x86@vger.kernel.org
  S:	Maintained
  F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst
@@@ -15184,7 -14911,7 +15184,7 @@@ M:	Damien Le Moal <dlemoal@kernel.org
  M:	Niklas Cassel <cassel@kernel.org>
  L:	linux-ide@vger.kernel.org
  S:	Maintained
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/libata/linux.git
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/libata/linux.git for=
-next
  F:	Documentation/ABI/testing/sysfs-ata
  F:	Documentation/devicetree/bindings/ata/
  F:	drivers/ata/
@@@ -15300,8 -15027,6 +15300,8 @@@ M:	Madhavan Srinivasan <maddy@linux.ibm
  R:	Michael Ellerman <mpe@ellerman.id.au>
  R:	Nicholas Piggin <npiggin@gmail.com>
  R:	Christophe Leroy (CS GROUP) <chleroy@kernel.org>
 +R:	Ritesh Harjani (IBM) <ritesh.list@gmail.com>
 +R:	Shrikanth Hegde <sshegde@linux.ibm.com>
  L:	linuxppc-dev@lists.ozlabs.org
  S:	Supported
  W:	https://github.com/linuxppc/wiki/wiki
@@@ -15433,10 -15158,10 +15433,10 @@@ N:	lite
 =20
  LIVE PATCHING
  M:	Josh Poimboeuf <jpoimboe@kernel.org>
 -M:	Jiri Kosina <jikos@kernel.org>
  M:	Miroslav Benes <mbenes@suse.cz>
  M:	Petr Mladek <pmladek@suse.com>
 -R:	Joe Lawrence <joe.lawrence@redhat.com>
 +M:	Joe Lawrence <joe.lawrence@redhat.com>
 +M:	Song Liu <song@kernel.org>
  L:	live-patching@vger.kernel.org
  S:	Maintained
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/livepatching/livepat=
ching.git
@@@ -15562,7 -15287,6 +15562,7 @@@ F:	rust/helpers/mutex.
  F:	rust/helpers/spinlock.c
  F:	rust/kernel/sync/lock.rs
  F:	rust/kernel/sync/lock/
 +F:	rust/kernel/sync/lockdep.rs
  F:	rust/kernel/sync/locked_by.rs
  X:	kernel/locking/locktorture.c
 =20
@@@ -15803,14 -15527,6 +15803,14 @@@ W:	https://ez.analog.com/linux-software
  F:	Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml
  F:	drivers/iio/temperature/ltc2983.c
 =20
 +LTC3208 LED DRIVER
 +M:	Jan Carlo Roleda <jancarlo.roleda@analog.com>
 +L:	linux-leds@vger.kernel.org
 +S:	Maintained
 +W:	https://ez.analog.com/linux-software-drivers
 +F:	Documentation/devicetree/bindings/leds/adi,ltc3208.yaml
 +F:	drivers/leds/leds-ltc3208.c
 +
  LTC3220 LED DRIVER
  M:	Edelweise Escala <edelweise.escala@analog.com>
  L:	linux-leds@vger.kernel.org
@@@ -15853,7 -15569,7 +15853,7 @@@ F:	Documentation/devicetree/bindings/i2
  F:	drivers/i2c/muxes/i2c-mux-ltc4306.c
 =20
  LTP (Linux Test Project)
 -M:	Andrea Cervesato <andrea.cervesato@suse.com>
 +M:	Andrea Cervesato <andrea.cervesato@linux.dev>
  M:	Cyril Hrubis <chrubis@suse.cz>
  M:	Jan Stancek <jstancek@redhat.com>
  M:	Petr Vorel <pvorel@suse.cz>
@@@ -15951,7 -15667,7 +15951,7 @@@ MAC8021
  M:	Johannes Berg <johannes@sipsolutions.net>
  L:	linux-wireless@vger.kernel.org
  S:	Maintained
 -W:	https://wireless.wiki.kernel.org/
 +W:	https://wireless.docs.kernel.org/en/latest/
  Q:	https://patchwork.kernel.org/project/linux-wireless/list/
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-ne=
xt.git
@@@ -16276,15 -15992,6 +16276,15 @@@ F:	Documentation/devicetree/bindings/hw
  F:	Documentation/hwmon/max17616.rst
  F:	drivers/hwmon/pmbus/max17616.c
 =20
 +MAX20826 HARDWARE MONITOR CONTROLLER DRIVER
 +M:	Nuno S=C3=A1 <nuno.sa@analog.com>
 +L:	linux-hwmon@vger.kernel.org
 +S:	Supported
 +W:	https://ez.analog.com/linux-software-drivers
 +F:	Documentation/devicetree/bindings/hwmon/pmbus/adi,max20826.yaml
 +F:	Documentation/hwmon/max20826.rst
 +F:	drivers/hwmon/pmbus/max20826.c
 +
  MAX20830 HARDWARE MONITOR DRIVER
  M:	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
  L:	linux-hwmon@vger.kernel.org
@@@ -16347,18 -16054,21 +16347,18 @@@ M:	Niklas S=C3=B6derlund <niklas.sode=
rlund@
  L:	linux-media@vger.kernel.org
  S:	Maintained
  F:	Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
 -F:	drivers/staging/media/max96712/max96712.c
 =20
  MAX96714 GMSL2 DESERIALIZER DRIVER
  M:	Julien Massot <julien.massot@collabora.com>
  L:	linux-media@vger.kernel.org
  S:	Maintained
  F:	Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
 -F:	drivers/media/i2c/max96714.c
 =20
  MAX96717 GMSL2 SERIALIZER DRIVER
  M:	Julien Massot <julien.massot@collabora.com>
  L:	linux-media@vger.kernel.org
  S:	Maintained
  F:	Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
 -F:	drivers/media/i2c/max96717.c
 =20
  MAX9860 MONO AUDIO VOICE CODEC DRIVER
  M:	Peter Rosin <peda@lysator.liu.se>
@@@ -16374,13 -16084,6 +16374,13 @@@ S:	Maintaine
  F:	Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.yaml
  F:	drivers/iio/proximity/mb1232.c
 =20
 +MAXIM GMSL2/3 SERIALIZERS AND DESERIALIZERS
 +M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 +L:	linux-media@vger.kernel.org
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
 +F:	drivers/media/i2c/maxim-serdes/
 +
  MAXIM MAX11205 DRIVER
  M:	Ramona Bolboaca <ramona.bolboaca@analog.com>
  L:	linux-iio@vger.kernel.org
@@@ -16423,15 -16126,6 +16423,15 @@@ L:	linux-iio@vger.kernel.or
  S:	Supported
  F:	drivers/iio/temperature/max30208.c
 =20
 +MAXIM MAX40080 CURRENT SENSE AMPLIFIER DRIVER
 +M:	Ciprian Hegbeli <ciprian.hegbeli@analog.com>
 +M:	Stefan Popa <stefan.popa@analog.com>
 +L:	linux-iio@vger.kernel.org
 +S:	Supported
 +W:	https://ez.analog.com/linux-software-drivers
 +F:	Documentation/devicetree/bindings/iio/adc/adi,max40080.yaml
 +F:	drivers/iio/adc/max40080.c
 +
  MAXIM MAX7360 KEYPAD LED MFD DRIVER
  M:	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
  S:	Maintained
@@@ -16603,7 -16297,7 +16603,7 @@@ M:	Ariana Lazar <ariana.lazar@microchip
  L:	linux-iio@vger.kernel.org
  S:	Supported
  F:	Documentation/devicetree/bindings/iio/dac/microchip,mcp47feb02.yaml
 -F:	drivers/iio/dac/mcp47feb02.c
 +F:	drivers/iio/dac/mcp47feb02*
 =20
  MCP4821 DAC DRIVER
  M:	Anshul Dalal <anshulusr@gmail.com>
@@@ -16714,7 -16408,6 +16714,7 @@@ M:	Frank Li <Frank.Li@nxp.com
  M:	Martin Kepplinger-Novakovic <martink@posteo.de>
  R:	Rui Miguel Silva <rmfrfs@gmail.com>
  R:	Purism Kernel Team <kernel@puri.sm>
 +R:	Bryan O'Donoghue <bod@kernel.org>
  L:	imx@lists.linux.dev
  L:	linux-media@vger.kernel.org
  S:	Maintained
@@@ -16920,17 -16613,6 +16920,17 @@@ M:	Sean Wang <sean.wang@mediatek.com
  S:	Maintained
  F:	drivers/media/rc/mtk-cir.c
 =20
 +MEDIATEK CLOCK DRIVERS
 +M:	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
 +L:	linux-clk@vger.kernel.org
 +L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 +S:	Maintained
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git
 +F:	Documentation/devicetree/bindings/clock/mediatek,*
 +F:	drivers/clk/mediatek/
 +F:	include/dt-bindings/clock/mediatek,*.h
 +F:	include/dt-bindings/clock/mt*-clk.h
 +
  MEDIATEK DMA DRIVER
  M:	Sean Wang <sean.wang@mediatek.com>
  L:	dmaengine@vger.kernel.org
@@@ -17041,13 -16723,6 +17041,6 @@@ M:	Roman Vivchar <rva333@protonmail.com
  S:	Maintained
  F:	drivers/nvmem/mt6323-efuse.c
 =20
- MEDIATEK MT6397 PMIC AUXADC DRIVER
- M:	Ryan Brue <ryanbrue.dev@gmail.com>
- L:	linux-iio@vger.kernel.org
- S:	Maintained
- F:	drivers/iio/adc/mt6397-auxadc.c
- F:	include/dt-bindings/iio/adc/mediatek,mt6397-auxadc.h
-=20
  MEDIATEK MT6735 CLOCK & RESET DRIVERS
  M:	Yassine Oudjana <y.oudjana@protonmail.com>
  L:	linux-clk@vger.kernel.org
@@@ -17362,6 -17037,23 +17355,6 @@@ F:	arch/*/include/asm/sync_core.
  F:	include/uapi/linux/membarrier.h
  F:	kernel/sched/membarrier.c
 =20
 -MEMBLOCK AND MEMORY MANAGEMENT INITIALIZATION
 -M:	Mike Rapoport <rppt@kernel.org>
 -L:	linux-mm@kvack.org
 -S:	Maintained
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock.git fo=
r-next
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock.git fi=
xes
 -F:	Documentation/core-api/boot-time-mm.rst
 -F:	include/linux/kho/abi/memblock.h
 -F:	include/linux/memblock.h
 -F:	mm/arch_numa.c
 -F:	mm/memblock.c
 -F:	mm/memtest.c
 -F:	mm/mm_init.c
 -F:	mm/mm_init.h
 -F:	mm/rodata_test.c
 -F:	tools/testing/memblock/
 -
  MEMORY CONTROLLER DRIVERS
  M:	Krzysztof Kozlowski <krzk@kernel.org>
  L:	linux-kernel@vger.kernel.org
@@@ -17381,6 -17073,21 +17374,6 @@@ S:	Maintaine
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git
  F:	drivers/devfreq/tegra30-devfreq.c
 =20
 -MEMORY HOT(UN)PLUG
 -M:	David Hildenbrand <david@kernel.org>
 -M:	Oscar Salvador <osalvador@suse.de>
 -L:	linux-mm@kvack.org
 -L:	linux-cxl@vger.kernel.org
 -S:	Maintained
 -F:	Documentation/admin-guide/mm/memory-hotplug.rst
 -F:	Documentation/core-api/memory-hotplug.rst
 -F:	drivers/base/memory.c
 -F:	include/linux/memory_hotplug.h
 -F:	include/linux/memremap.h
 -F:	mm/memremap.c
 -F:	mm/memory_hotplug.c
 -F:	tools/testing/selftests/memory-hotplug/
 -
  MEMORY MANAGEMENT
  M:	Andrew Morton <akpm@linux-foundation.org>
  L:	linux-mm@kvack.org
@@@ -17404,15 -17111,18 +17397,15 @@@ F:	mm/alloc_tag.
  F:	tools/testing/selftests/alloc_tag/
 =20
  MEMORY MANAGEMENT - BALLOON
 -M:	Andrew Morton <akpm@linux-foundation.org>
  M:	David Hildenbrand <david@kernel.org>
  L:	linux-mm@kvack.org
  L:	virtualization@lists.linux.dev
  S:	Maintained
 -W:	http://www.linux-mm.org
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git for-next
  F:	include/linux/balloon.h
  F:	mm/balloon.c
 =20
  MEMORY MANAGEMENT - CORE
 -M:	Andrew Morton <akpm@linux-foundation.org>
  M:	David Hildenbrand <david@kernel.org>
  R:	Lorenzo Stoakes <ljs@kernel.org>
  R:	Liam R. Howlett <liam@infradead.org>
@@@ -17422,34 -17132,27 +17415,34 @@@ R:	Suren Baghdasaryan <surenb@google.=
co
  R:	Michal Hocko <mhocko@suse.com>
  L:	linux-mm@kvack.org
  S:	Maintained
 -W:	http://www.linux-mm.org
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git for-next
  F:	Documentation/admin-guide/sysctl/vm.rst
 +F:	Documentation/core-api/gfp_mask-from-fs-io.rst
 +F:	fs/proc/meminfo.c
 +F:	include/linux/cacheflush.h
  F:	include/linux/folio_batch.h
  F:	include/linux/gfp.h
  F:	include/linux/gfp_types.h
 +F:	include/linux/highmem-internal.h
  F:	include/linux/highmem.h
  F:	include/linux/leafops.h
  F:	include/linux/memory.h
  F:	include/linux/mm.h
  F:	include/linux/mm_*.h
 -F:	include/linux/mmzone.h
  F:	include/linux/mmdebug.h
  F:	include/linux/mmu_notifier.h
 +F:	include/linux/mmzone.h
  F:	include/linux/pagewalk.h
 +F:	include/linux/pfn.h
  F:	include/linux/pgalloc.h
  F:	include/linux/pgtable.h
  F:	include/linux/ptdump.h
 +F:	include/linux/sched/mm.h
 +F:	include/linux/vm_event_item.h
  F:	include/linux/vmpressure.h
  F:	include/linux/vmstat.h
 -F:	fs/proc/meminfo.c
 +F:	include/trace/events/mmflags.h
 +F:	include/trace/events/pagemap.h
  F:	kernel/fork.c
  F:	mm/Kconfig
  F:	mm/debug.c
@@@ -17465,31 -17168,14 +17458,31 @@@ F:	mm/mmzone.
  F:	mm/pagewalk.c
  F:	mm/pgtable-generic.c
  F:	mm/ptdump.c
 -F:	mm/sparse-vmemmap.c
 -F:	mm/sparse.c
 -F:	mm/sparse.h
  F:	mm/util.c
  F:	mm/vmpressure.c
  F:	mm/vmstat.c
 +F:	scripts/gdb/linux/mm.py
  N:	include\/linux\/page[-_][a-zA-Z]*
 =20
 +MEMORY MANAGEMENT - DAMON
 +M:	SJ Park <sj@kernel.org>
 +L:	damon@lists.linux.dev
 +L:	linux-mm@kvack.org
 +S:	Maintained
 +W:	https://damonitor.github.io
 +P:	Documentation/mm/damon/maintainer-profile.rst
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 +T:	quilt git://git.kernel.org/pub/scm/linux/kernel/git/akpm/25-new
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/n=
ext
 +F:	Documentation/ABI/testing/sysfs-kernel-mm-damon
 +F:	Documentation/admin-guide/mm/damon/
 +F:	Documentation/mm/damon/
 +F:	include/linux/damon.h
 +F:	include/trace/events/damon.h
 +F:	mm/damon/
 +F:	samples/damon/
 +F:	tools/testing/selftests/damon/
 +
  MEMORY MANAGEMENT - EXECMEM
  M:	Andrew Morton <akpm@linux-foundation.org>
  M:	Mike Rapoport <rppt@kernel.org>
@@@ -17499,94 -17185,30 +17492,94 @@@ F:	include/linux/execmem.
  F:	mm/execmem.c
 =20
  MEMORY MANAGEMENT - GUP (GET USER PAGES)
 -M:	Andrew Morton <akpm@linux-foundation.org>
  M:	David Hildenbrand <david@kernel.org>
  R:	Jason Gunthorpe <jgg@nvidia.com>
  R:	John Hubbard <jhubbard@nvidia.com>
  R:	Peter Xu <peterx@redhat.com>
  L:	linux-mm@kvack.org
  S:	Maintained
 -W:	http://www.linux-mm.org
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git for-next
 +F:	Documentation/core-api/pin_user_pages.rst
  F:	mm/gup.c
  F:	mm/gup_test.c
  F:	mm/gup_test.h
 +F:	tools/mm/gup_bench.c
 +F:	tools/testing/selftests/mm/gup.c
  F:	tools/testing/selftests/mm/gup_longterm.c
 -F:	tools/testing/selftests/mm/gup_test.c
 +
 +MEMORY MANAGEMENT - HMM (Heterogeneous Memory Management)
 +M:	Jason Gunthorpe <jgg@nvidia.com>
 +M:	Leon Romanovsky <leonro@nvidia.com>
 +L:	linux-mm@kvack.org
 +S:	Maintained
 +F:	Documentation/mm/hmm.rst
 +F:	include/linux/hmm*
 +F:	lib/test_hmm*
 +F:	mm/hmm*
 +F:	tools/testing/selftests/mm/*hmm*
 +
 +MEMORY MANAGEMENT - HUGETLB
 +M:	Muchun Song <muchun.song@linux.dev>
 +M:	Oscar Salvador <osalvador@suse.de>
 +R:	David Hildenbrand <david@kernel.org>
 +L:	linux-mm@kvack.org
 +S:	Maintained
 +F:	Documentation/ABI/testing/sysfs-kernel-mm-hugepages
 +F:	Documentation/admin-guide/cgroup-v1/hugetlb.rst
 +F:	Documentation/admin-guide/mm/hugetlbpage.rst
 +F:	Documentation/mm/hugetlbfs_reserv.rst
 +F:	Documentation/mm/vmemmap_dedup.rst
 +F:	fs/hugetlbfs/
 +F:	include/linux/hugetlb*
 +F:	include/linux/vmemmap-optimization.h
 +F:	include/trace/events/hugetlbfs.h
 +F:	mm/hugetlb.c
 +F:	mm/hugetlb_cgroup.c
 +F:	mm/hugetlb_cma.c
 +F:	mm/hugetlb_cma.h
 +F:	mm/hugetlb_internal.h
 +F:	mm/hugetlb_sysctl.c
 +F:	mm/hugetlb_sysfs.c
 +F:	mm/hugetlb_vmemmap.c
 +F:	mm/hugetlb_vmemmap.h
 +F:	tools/testing/selftests/cgroup/test_hugetlb_memcg.c
 +
 +MEMORY MANAGEMENT - HWPOISON MEMORY FAILURE HANDLING
 +M:	Miaohe Lin <linmiaohe@huawei.com>
 +R:	Naoya Horiguchi <nao.horiguchi@gmail.com>
 +L:	linux-mm@kvack.org
 +S:	Maintained
 +F:	Documentation/ABI/testing/sysfs-memory-page-offline
 +F:	include/linux/memory-failure.h
 +F:	include/trace/events/memory-failure.h
 +F:	mm/hwpoison-inject.c
 +F:	mm/memory-failure.c
 +F:	tools/testing/selftests/mm/memory-failure.c
 +
 +MEMORY MANAGEMENT - KASAN
 +M:	Andrey Ryabinin <ryabinin.a.a@gmail.com>
 +R:	Alexander Potapenko <glider@google.com>
 +R:	Andrey Konovalov <andreyknvl@gmail.com>
 +R:	Dmitry Vyukov <dvyukov@google.com>
 +R:	Vincenzo Frascino <vincenzo.frascino@arm.com>
 +L:	kasan-dev@googlegroups.com
 +S:	Maintained
 +B:	https://bugzilla.kernel.org/buglist.cgi?component=3DSanitizers&product=
=3DMemory%20Management
 +F:	Documentation/dev-tools/kasan.rst
 +F:	arch/*/include/asm/*kasan.h
 +F:	arch/*/mm/kasan_init*
 +F:	include/linux/kasan*.h
 +F:	lib/Kconfig.kasan
 +F:	mm/kasan/
 +F:	scripts/Makefile.kasan
 =20
  MEMORY MANAGEMENT - KSM (Kernel Samepage Merging)
 -M:	Andrew Morton <akpm@linux-foundation.org>
  M:	David Hildenbrand <david@kernel.org>
 -R:	Xu Xin <xu.xin16@zte.com.cn>
 +R:	Xu Xin <xu.xin@linux.dev>
  R:	Chengming Zhou <chengming.zhou@linux.dev>
  L:	linux-mm@kvack.org
  S:	Maintained
 -W:	http://www.linux-mm.org
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git for-next
  F:	Documentation/ABI/testing/sysfs-kernel-mm-ksm
  F:	Documentation/admin-guide/mm/ksm.rst
  F:	Documentation/mm/ksm.rst
@@@ -17595,144 -17217,30 +17588,144 @@@ F:	include/trace/events/ksm.
  F:	mm/ksm.c
  F:	mm/mm_slot.h
 =20
 -MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION
 -M:	Andrew Morton <akpm@linux-foundation.org>
 +MEMORY MANAGEMENT - MEMBLOCK AND INITIALIZATION
 +M:	Mike Rapoport <rppt@kernel.org>
 +L:	linux-mm@kvack.org
 +S:	Maintained
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/memblock.git for-=
next
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/memblock.git fixes
 +F:	Documentation/core-api/boot-time-mm.rst
 +F:	include/linux/kho/abi/memblock.h
 +F:	include/linux/memblock.h
 +F:	mm/arch_numa.c
 +F:	mm/memblock.c
 +F:	mm/memtest.c
 +F:	mm/mm_init.c
 +F:	mm/mm_init.h
 +F:	mm/rodata_test.c
 +F:	tools/testing/memblock/
 +
 +MEMORY MANAGEMENT - MEMORY HOT(UN)PLUG
  M:	David Hildenbrand <david@kernel.org>
 -R:	Zi Yan <ziy@nvidia.com>
 -R:	Matthew Brost <matthew.brost@intel.com>
 -R:	Joshua Hahn <joshua.hahnjy@gmail.com>
 -R:	Rakie Kim <rakie.kim@sk.com>
 -R:	Byungchul Park <byungchul@sk.com>
 -R:	Gregory Price <gourry@gourry.net>
 -R:	Ying Huang <ying.huang@linux.alibaba.com>
 -R:	Alistair Popple <apopple@nvidia.com>
 +M:	Oscar Salvador <osalvador@suse.de>
 +L:	linux-mm@kvack.org
 +L:	linux-cxl@vger.kernel.org
 +S:	Maintained
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git for-next
 +F:	Documentation/ABI/testing/sysfs-devices-memory
 +F:	Documentation/admin-guide/mm/memory-hotplug.rst
 +F:	Documentation/core-api/memory-hotplug.rst
 +F:	drivers/base/memory.c
 +F:	include/linux/memory_hotplug.h
 +F:	include/linux/memremap.h
 +F:	mm/memory_hotplug.c
 +F:	mm/memremap.c
 +F:	tools/testing/selftests/memory-hotplug/
 +
 +MEMORY MANAGEMENT - MEMORY MAP
 +M:	Muchun Song <muchun.song@linux.dev>
 +M:	Mike Rapoport <rppt@kernel.org>
 +M:	David Hildenbrand <david@kernel.org>
 +L:	linux-mm@kvack.org
 +S:	Maintained
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git for-next
 +F:	Documentation/mm/memory-model.rst
 +F:	arch/*/include/asm/sparsemem.h
 +F:	include/asm-generic/memory_model.h
 +F:	mm/sparse-vmemmap.c
 +F:	mm/sparse.c
 +F:	mm/sparse.h
 +K:	(?i:vmemmap)
 +
 +MEMORY MANAGEMENT - MEMORY MAPPING
 +M:	Andrew Morton <akpm@linux-foundation.org>
 +M:	Liam R. Howlett <liam@infradead.org>
 +M:	Lorenzo Stoakes <ljs@kernel.org>
 +R:	Vlastimil Babka <vbabka@kernel.org>
 +R:	Jann Horn <jannh@google.com>
 +R:	Pedro Falcato <pfalcato@suse.de>
  L:	linux-mm@kvack.org
  S:	Maintained
  W:	http://www.linux-mm.org
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 -F:	Documentation/ABI/testing/sysfs-kernel-mm-mempolicy
 -F:	Documentation/ABI/testing/sysfs-kernel-mm-mempolicy-weighted-interleave
 -F:	include/linux/mempolicy.h
 -F:	include/uapi/linux/mempolicy.h
 -F:	include/linux/migrate.h
 -F:	include/linux/migrate_mode.h
 -F:	mm/mempolicy.c
 -F:	mm/migrate.c
 -F:	mm/migrate_device.c
 +F:	Documentation/core-api/protection-keys.rst
 +F:	Documentation/filesystems/mmap_prepare.rst
 +F:	Documentation/userspace-api/mseal.rst
 +F:	fs/proc/task_mmu.c
 +F:	fs/proc/task_nommu.c
 +F:	include/linux/mman.h
 +F:	include/linux/pkeys.h
 +F:	include/trace/events/mmap.h
 +F:	include/uapi/linux/mman.h
 +F:	mm/char-mem.c
 +F:	mm/mincore.c
 +F:	mm/mlock.c
 +F:	mm/mmap.c
 +F:	mm/mprotect.c
 +F:	mm/mremap.c
 +F:	mm/mseal.c
 +F:	mm/msync.c
 +F:	mm/nommu.c
 +F:	mm/vma.c
 +F:	mm/vma.h
 +F:	mm/vma_exec.c
 +F:	mm/vma_init.c
 +F:	mm/vma_internal.h
 +F:	tools/testing/selftests/mm/merge.c
 +F:	tools/testing/vma/
 +
 +MEMORY MANAGEMENT - MEMORY MAPPING - LOCKING
 +M:	Andrew Morton <akpm@linux-foundation.org>
 +M:	Suren Baghdasaryan <surenb@google.com>
 +M:	Liam R. Howlett <liam@infradead.org>
 +M:	Lorenzo Stoakes <ljs@kernel.org>
 +R:	Vlastimil Babka <vbabka@kernel.org>
 +R:	Shakeel Butt <shakeel.butt@linux.dev>
 +L:	linux-mm@kvack.org
 +S:	Maintained
 +W:	http://www.linux-mm.org
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 +F:	Documentation/mm/process_addrs.rst
 +F:	include/linux/mmap_lock.h
 +F:	include/trace/events/mmap_lock.h
 +F:	mm/mmap_lock.c
 +
 +MEMORY MANAGEMENT - MEMORY MAPPING - MADVISE (MEMORY ADVICE)
 +M:	Andrew Morton <akpm@linux-foundation.org>
 +M:	Liam R. Howlett <liam@infradead.org>
 +M:	Lorenzo Stoakes <ljs@kernel.org>
 +M:	David Hildenbrand <david@kernel.org>
 +R:	Vlastimil Babka <vbabka@kernel.org>
 +R:	Jann Horn <jannh@google.com>
 +L:	linux-mm@kvack.org
 +S:	Maintained
 +W:	http://www.linux-mm.org
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 +F:	include/uapi/asm-generic/mman-common.h
 +F:	mm/madvise.c
 +
 +MEMORY MANAGEMENT - MEMORY RESOURCE CONTROLLER (MEMCG)
 +M:	Johannes Weiner <hannes@cmpxchg.org>
 +M:	Michal Hocko <mhocko@kernel.org>
 +M:	Roman Gushchin <roman.gushchin@linux.dev>
 +M:	Shakeel Butt <shakeel.butt@linux.dev>
 +R:	Muchun Song <muchun.song@linux.dev>
 +L:	cgroups@vger.kernel.org
 +L:	linux-mm@kvack.org
 +S:	Maintained
 +F:	Documentation/admin-guide/cgroup-v1/memory.rst
 +F:	include/linux/memcontrol.h
 +F:	include/linux/page_counter.h
 +F:	include/trace/events/memcg.h
 +F:	mm/memcontrol-v1.c
 +F:	mm/memcontrol-v1.h
 +F:	mm/memcontrol.c
 +F:	mm/page_counter.c
 +F:	samples/cgroup/*
 +F:	tools/testing/selftests/cgroup/memcg_protection.m
 +F:	tools/testing/selftests/cgroup/test_hugetlb_memcg.c
 +F:	tools/testing/selftests/cgroup/test_kmem.c
 +F:	tools/testing/selftests/cgroup/test_memcontrol.c
 =20
  MEMORY MANAGEMENT - MGLRU (MULTI-GEN LRU)
  M:	Andrew Morton <akpm@linux-foundation.org>
@@@ -17743,8 -17251,6 +17736,8 @@@ R:	Barry Song <baohua@kernel.org
  R:	Axel Rasmussen <axelrasmussen@google.com>
  R:	Yuanchu Xie <yuanchu@google.com>
  R:	Wei Xu <weixugc@google.com>
 +R:	Baoquan He <baoquan.he@linux.dev>
 +R:	Baolin Wang <baolin.wang@linux.alibaba.com>
  L:	linux-mm@kvack.org
  S:	Maintained
  W:	http://www.linux-mm.org
@@@ -17756,24 -17262,6 +17749,24 @@@ F:	include/linux/mmzone.
  F:	mm/vmscan.c
  F:	mm/workingset.c
 =20
 +MEMORY MANAGEMENT - MIGRATION
 +M:	David Hildenbrand <david@kernel.org>
 +R:	Zi Yan <ziy@nvidia.com>
 +R:	Matthew Brost <matthew.brost@intel.com>
 +R:	Joshua Hahn <joshua.hahnjy@gmail.com>
 +R:	Byungchul Park <byungchul@sk.com>
 +R:	Gregory Price <gourry@gourry.net>
 +R:	Ying Huang <ying.huang@linux.alibaba.com>
 +R:	Alistair Popple <apopple@nvidia.com>
 +L:	linux-mm@kvack.org
 +S:	Maintained
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git for-next
 +F:	include/linux/migrate.h
 +F:	include/linux/migrate_mode.h
 +F:	include/trace/events/migrate.h
 +F:	mm/migrate.c
 +F:	mm/migrate_device.c
 +
  MEMORY MANAGEMENT - MISC
  M:	Andrew Morton <akpm@linux-foundation.org>
  M:	David Hildenbrand <david@kernel.org>
@@@ -17789,25 -17277,18 +17782,25 @@@ W:	http://www.linux-mm.or
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
  F:	Documentation/ABI/testing/sysfs-kernel-mm
  F:	Documentation/ABI/testing/sysfs-kernel-mm-cma
 -F:	Documentation/ABI/testing/sysfs-kernel-mm-memory-tiers
  F:	Documentation/ABI/testing/sysfs-kernel-mm-numa
  F:	Documentation/admin-guide/mm/
 +F:	Documentation/core-api/memory-allocation.rst
 +F:	Documentation/core-api/mm-api.rst
  F:	Documentation/mm/
 -F:	drivers/char/mem.c
 +F:	fs/proc/page.c
 +F:	include/linux/backing-dev-defs.h
 +F:	include/linux/backing-dev.h
  F:	include/linux/cma.h
  F:	include/linux/dmapool.h
  F:	include/linux/ioremap.h
 -F:	include/linux/memory-tiers.h
 +F:	include/linux/kernel-page-flags.h
  F:	include/linux/page_idle.h
 +F:	include/trace/events/cma.h
 +F:	include/uapi/linux/kernel-page-flags.h
  F:	mm/backing-dev.c
 +F:	mm/char-mem.c
  F:	mm/cma.c
 +F:	mm/cma.h
  F:	mm/cma_debug.c
  F:	mm/cma_sysfs.c
  F:	mm/dmapool.c
@@@ -17816,30 -17297,11 +17809,30 @@@ F:	mm/early_ioremap.
  F:	mm/fadvise.c
  F:	mm/ioremap.c
  F:	mm/mapping_dirty_helpers.c
 -F:	mm/memory-tiers.c
  F:	mm/page_idle.c
  F:	mm/pgalloc-track.h
  F:	mm/process_vm_access.c
 +F:	tools/lib/mm/
 +F:	tools/mm/
  F:	tools/testing/selftests/mm/
 +X:	Documentation/ABI/testing/sysfs-kernel-mm-damon
 +X:	Documentation/admin-guide/mm/damon/
 +X:	Documentation/mm/damon/
 +
 +MEMORY MANAGEMENT - MMU GATHER AND TLB INVALIDATION
 +M:	Will Deacon <will@kernel.org>
 +M:	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
 +M:	Andrew Morton <akpm@linux-foundation.org>
 +M:	Nick Piggin <npiggin@gmail.com>
 +M:	Peter Zijlstra <peterz@infradead.org>
 +L:	linux-arch@vger.kernel.org
 +L:	linux-mm@kvack.org
 +S:	Maintained
 +F:	Documentation/core-api/cachetlb.rst
 +F:	arch/*/include/asm/tlb.h
 +F:	include/asm-generic/tlb.h
 +F:	include/trace/events/tlb.h
 +F:	mm/mmu_gather.c
 =20
  MEMORY MANAGEMENT - NUMA MEMBLOCKS AND NUMA EMULATION
  M:	Andrew Morton <akpm@linux-foundation.org>
@@@ -17847,32 -17309,11 +17840,32 @@@ M:	Mike Rapoport <rppt@kernel.org
  L:	linux-mm@kvack.org
  S:	Maintained
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock.git
 +F:	include/linux/numa.h
  F:	include/linux/numa_memblks.h
  F:	mm/numa.c
  F:	mm/numa_emulation.c
  F:	mm/numa_memblks.c
 =20
 +MEMORY MANAGEMENT - NUMA PLACEMENT
 +M:	David Hildenbrand <david@kernel.org>
 +M:	Gregory Price <gourry@gourry.net>
 +R:	Zi Yan <ziy@nvidia.com>
 +R:	Joshua Hahn <joshua.hahnjy@gmail.com>
 +R:	Rakie Kim <rakie.kim@sk.com>
 +R:	Ying Huang <ying.huang@linux.alibaba.com>
 +L:	linux-mm@kvack.org
 +S:	Maintained
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git for-next
 +F:	Documentation/ABI/testing/sysfs-kernel-mm-memory-tiers
 +F:	Documentation/ABI/testing/sysfs-kernel-mm-mempolicy
 +F:	Documentation/ABI/testing/sysfs-kernel-mm-mempolicy-weighted-interleave
 +F:	Documentation/admin-guide/numastat.rst
 +F:	include/linux/memory-tiers.h
 +F:	include/linux/mempolicy.h
 +F:	include/uapi/linux/mempolicy.h
 +F:	mm/memory-tiers.c
 +F:	mm/mempolicy.c
 +
  MEMORY MANAGEMENT - OOM KILLER
  M:	Michal Hocko <mhocko@suse.com>
  R:	David Rientjes <rientjes@google.com>
@@@ -17885,22 -17326,19 +17878,22 @@@ F:	include/uapi/linux/oom.
  F:	mm/oom_kill.c
 =20
  MEMORY MANAGEMENT - PAGE ALLOCATOR
 -M:	Andrew Morton <akpm@linux-foundation.org>
  M:	Vlastimil Babka <vbabka@kernel.org>
 +M:	Johannes Weiner <hannes@cmpxchg.org>
  R:	Suren Baghdasaryan <surenb@google.com>
  R:	Michal Hocko <mhocko@suse.com>
  R:	Brendan Jackman <brendan.jackman@linux.dev>
 -R:	Johannes Weiner <hannes@cmpxchg.org>
  R:	Zi Yan <ziy@nvidia.com>
  L:	linux-mm@kvack.org
  S:	Maintained
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/page_alloc.git pa=
ge_alloc/for-next
  F:	include/linux/compaction.h
  F:	include/linux/gfp.h
  F:	include/linux/page-isolation.h
  F:	include/linux/pageblock-flags.h
 +F:	include/trace/events/compaction.h
 +F:	include/trace/events/page_isolation.h
 +F:	include/trace/events/page_ref.h
  F:	mm/compaction.c
  F:	mm/debug_page_alloc.c
  F:	mm/debug_page_ref.c
@@@ -17917,51 -17355,6 +17910,51 @@@ F:	mm/page_reporting.
  F:	mm/show_mem.c
  F:	mm/shuffle.c
  F:	mm/shuffle.h
 +F:	scripts/gdb/linux/page_owner.py
 +F:	tools/mm/page_owner_filter.c
 +F:	tools/mm/page_owner_sort.c
 +
 +MEMORY MANAGEMENT - PAGE CACHE
 +M:	Matthew Wilcox (Oracle) <willy@infradead.org>
 +M:	Jan Kara <jack@suse.cz>
 +L:	linux-fsdevel@vger.kernel.org
 +L:	linux-mm@kvack.org
 +S:	Supported
 +T:	git git://git.infradead.org/users/willy/pagecache.git
 +F:	Documentation/filesystems/locking.rst
 +F:	Documentation/filesystems/vfs.rst
 +F:	include/linux/pagemap.h
 +F:	include/linux/writeback.h
 +F:	include/trace/events/filemap.h
 +F:	include/trace/events/readahead.h
 +F:	include/trace/events/writeback.h
 +F:	mm/filemap.c
 +F:	mm/page-writeback.c
 +F:	mm/readahead.c
 +F:	mm/truncate.c
 +
 +MEMORY MANAGEMENT - PAGE TABLE CHECK
 +M:	Pasha Tatashin <pasha.tatashin@soleen.com>
 +M:	Andrew Morton <akpm@linux-foundation.org>
 +L:	linux-mm@kvack.org
 +S:	Maintained
 +F:	Documentation/mm/page_table_check.rst
 +F:	include/linux/page_table_check.h
 +F:	mm/page_table_check.c
 +
 +MEMORY MANAGEMENT - PER-CPU MEMORY ALLOCATOR
 +M:	Dennis Zhou <dennis@kernel.org>
 +M:	Tejun Heo <tj@kernel.org>
 +M:	Christoph Lameter <cl@gentwo.org>
 +L:	linux-mm@kvack.org
 +S:	Maintained
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/dennis/percpu.git
 +F:	arch/*/include/asm/percpu.h
 +F:	include/linux/percpu*.h
 +F:	include/trace/events/percpu.h
 +F:	lib/percpu*.c
 +F:	mm/percpu*.c
 +F:	mm/percpu-internal.h
 =20
  MEMORY MANAGEMENT - RECLAIM
  M:	Andrew Morton <akpm@linux-foundation.org>
@@@ -17973,11 -17366,11 +17966,11 @@@ R:	Shakeel Butt <shakeel.butt@linux.d=
ev
  R:	Lorenzo Stoakes <ljs@kernel.org>
  L:	linux-mm@kvack.org
  S:	Maintained
 +F:	include/trace/events/vmscan.h
  F:	mm/vmscan.c
  F:	mm/workingset.c
 =20
  MEMORY MANAGEMENT - RMAP (REVERSE MAPPING)
 -M:	Andrew Morton <akpm@linux-foundation.org>
  M:	David Hildenbrand <david@kernel.org>
  M:	Lorenzo Stoakes <ljs@kernel.org>
  R:	Rik van Riel <riel@surriel.com>
@@@ -17988,7 -17381,6 +17981,7 @@@ R:	Jann Horn <jannh@google.com
  R:	Lance Yang <lance.yang@linux.dev>
  L:	linux-mm@kvack.org
  S:	Maintained
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git for-next
  F:	include/linux/rmap.h
  F:	mm/interval_tree.c
  F:	mm/page_vma_mapped.c
@@@ -18003,70 -17395,6 +17996,70 @@@ S:	Maintaine
  F:	include/linux/secretmem.h
  F:	mm/secretmem.c
 =20
 +MEMORY MANAGEMENT - SHARED MEMORY (SHMEM/TMPFS/MEMFD)
 +M:	Hugh Dickins <hughd@google.com>
 +M:	David Hildenbrand <david@kernel.org>
 +R:	Baolin Wang <baolin.wang@linux.alibaba.com>
 +L:	linux-mm@kvack.org
 +S:	Maintained
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git for-next
 +F:	Documentation/filesystems/tmpfs.rst
 +F:	Documentation/mm/shmfs.rst
 +F:	Documentation/userspace-api/mfd_noexec.rst
 +F:	include/linux/memfd.h
 +F:	include/linux/shmem_fs.h
 +F:	include/uapi/linux/memfd.h
 +F:	mm/memfd.c
 +F:	mm/shmem.c
 +F:	mm/shmem_quota.c
 +F:	tools/testing/selftests/memfd/
 +F:	tools/testing/selftests/tmpfs/
 +
 +MEMORY MANAGEMENT - SHRINKER
 +M:	Andrew Morton <akpm@linux-foundation.org>
 +M:	Dave Chinner <david@fromorbit.com>
 +R:	Qi Zheng <qi.zheng@linux.dev>
 +R:	Roman Gushchin <roman.gushchin@linux.dev>
 +R:	Muchun Song <muchun.song@linux.dev>
 +L:	linux-mm@kvack.org
 +S:	Maintained
 +F:	Documentation/admin-guide/mm/shrinker_debugfs.rst
 +F:	include/linux/list_lru.h
 +F:	include/linux/shrinker.h
 +F:	mm/list_lru.c
 +F:	mm/shrinker.c
 +F:	mm/shrinker_debug.c
 +F:	tools/cgroup/memcg_shrinker.py
 +
 +MEMORY MANAGEMENT - SLAB ALLOCATOR
 +M:	Vlastimil Babka <vbabka@kernel.org>
 +M:	Harry Yoo <harry@kernel.org>
 +R:	Hao Li <hao.li@linux.dev>
 +R:	Christoph Lameter <cl@gentwo.org>
 +R:	David Rientjes <rientjes@google.com>
 +R:	Roman Gushchin <roman.gushchin@linux.dev>
 +L:	linux-mm@kvack.org
 +S:	Maintained
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/slab.git slab/for=
-next
 +F:	Documentation/ABI/testing/sysfs-kernel-slab
 +F:	Documentation/admin-guide/mm/slab.rst
 +F:	Documentation/mm/slab.rst
 +F:	include/linux/mempool.h
 +F:	include/linux/slab.h
 +F:	include/trace/events/kmem.h
 +F:	lib/tests/slub_kunit.c
 +F:	mm/failslab.c
 +F:	mm/mempool.c
 +F:	mm/slab.h
 +F:	mm/slab_common.c
 +F:	mm/slub.c
 +F:	scripts/gdb/linux/slab.py
 +F:	tools/cgroup/memcg_slabinfo.py
 +F:	tools/include/linux/slab.h
 +F:	tools/lib/slab.c
 +F:	tools/mm/slabinfo-gnuplot.sh
 +F:	tools/mm/slabinfo.c
 +
  MEMORY MANAGEMENT - SWAP
  M:	Andrew Morton <akpm@linux-foundation.org>
  M:	Chris Li <chrisl@kernel.org>
@@@ -18086,13 -17414,15 +18079,13 @@@ F:	include/linux/swapfile.
  F:	include/linux/swapops.h
  F:	mm/page_io.c
  F:	mm/swap.h
 -F:	mm/swap_table.h
  F:	mm/swap_state.c
 +F:	mm/swap_table.h
  F:	mm/swapfile.c
 =20
  MEMORY MANAGEMENT - THP (TRANSPARENT HUGE PAGE)
 -M:	Andrew Morton <akpm@linux-foundation.org>
  M:	David Hildenbrand <david@kernel.org>
 -M:	Lorenzo Stoakes <ljs@kernel.org>
 -R:	Zi Yan <ziy@nvidia.com>
 +M:	Zi Yan <ziy@nvidia.com>
  R:	Baolin Wang <baolin.wang@linux.alibaba.com>
  R:	Liam R. Howlett <liam@infradead.org>
  R:	Nico Pache <nico.pache@linux.dev>
@@@ -18101,21 -17431,18 +18094,21 @@@ R:	Dev Jain <dev.jain@arm.com
  R:	Barry Song <baohua@kernel.org>
  R:	Lance Yang <lance.yang@linux.dev>
  R:	Usama Arif <usama.arif@linux.dev>
 +R:	Kiryl Shutsemau <kas@kernel.org>
  L:	linux-mm@kvack.org
  S:	Maintained
 -W:	http://www.linux-mm.org
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git for-next
  F:	Documentation/ABI/testing/sysfs-kernel-mm-transparent-hugepage
  F:	Documentation/admin-guide/mm/transhuge.rst
  F:	include/linux/huge_mm.h
  F:	include/linux/khugepaged.h
  F:	include/trace/events/huge_memory.h
 +F:	include/trace/events/thp.h
 +F:	mm/collapse.h
  F:	mm/huge_memory.c
  F:	mm/khugepaged.c
  F:	mm/mm_slot.h
 +F:	tools/mm/thpmaps
  F:	tools/testing/selftests/mm/khugepaged.c
  F:	tools/testing/selftests/mm/split_huge_page_test.c
  F:	tools/testing/selftests/mm/transhuge-stress.c
@@@ -18148,41 -17475,66 +18141,41 @@@ F:	rust/kernel/mm.r
  F:	rust/kernel/mm/
  F:	rust/kernel/page.rs
 =20
 -MEMORY MAPPING
 +MEMORY MANAGEMENT - VMALLOC
  M:	Andrew Morton <akpm@linux-foundation.org>
 -M:	Liam R. Howlett <liam@infradead.org>
 -M:	Lorenzo Stoakes <ljs@kernel.org>
 -R:	Vlastimil Babka <vbabka@kernel.org>
 -R:	Jann Horn <jannh@google.com>
 -R:	Pedro Falcato <pfalcato@suse.de>
 +M:	Uladzislau Rezki <urezki@gmail.com>
  L:	linux-mm@kvack.org
  S:	Maintained
  W:	http://www.linux-mm.org
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 -F:	drivers/char/mem.c
 -F:	include/trace/events/mmap.h
 -F:	fs/proc/task_mmu.c
 -F:	fs/proc/task_nommu.c
 -F:	mm/mincore.c
 -F:	mm/mlock.c
 -F:	mm/mmap.c
 -F:	mm/mprotect.c
 -F:	mm/mremap.c
 -F:	mm/mseal.c
 -F:	mm/msync.c
 -F:	mm/nommu.c
 -F:	mm/vma.c
 -F:	mm/vma.h
 -F:	mm/vma_exec.c
 -F:	mm/vma_init.c
 -F:	mm/vma_internal.h
 -F:	tools/testing/selftests/mm/merge.c
 -F:	tools/testing/vma/
 +F:	include/linux/vmalloc.h
 +F:	include/trace/events/vmalloc.h
 +F:	lib/test_vmalloc.c
 +F:	mm/vmalloc.c
 +F:	mm/vmalloc.h
 +F:	scripts/gdb/linux/vmalloc.py
 =20
 -MEMORY MAPPING - LOCKING
 -M:	Andrew Morton <akpm@linux-foundation.org>
 -M:	Suren Baghdasaryan <surenb@google.com>
 -M:	Liam R. Howlett <liam@infradead.org>
 -M:	Lorenzo Stoakes <ljs@kernel.org>
 -R:	Vlastimil Babka <vbabka@kernel.org>
 -R:	Shakeel Butt <shakeel.butt@linux.dev>
 +MEMORY MANAGEMENT - ZSMALLOC COMPRESSED SLAB MEMORY ALLOCATOR
 +M:	Minchan Kim <minchan@kernel.org>
 +M:	Sergey Senozhatsky <senozhatsky@chromium.org>
  L:	linux-mm@kvack.org
  S:	Maintained
 -W:	http://www.linux-mm.org
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 -F:	Documentation/mm/process_addrs.rst
 -F:	include/linux/mmap_lock.h
 -F:	include/trace/events/mmap_lock.h
 -F:	mm/mmap_lock.c
 +F:	Documentation/mm/zsmalloc.rst
 +F:	include/linux/zsmalloc.h
 +F:	mm/zpdesc.h
 +F:	mm/zsmalloc.c
 =20
 -MEMORY MAPPING - MADVISE (MEMORY ADVICE)
 -M:	Andrew Morton <akpm@linux-foundation.org>
 -M:	Liam R. Howlett <liam@infradead.org>
 -M:	Lorenzo Stoakes <ljs@kernel.org>
 -M:	David Hildenbrand <david@kernel.org>
 -R:	Vlastimil Babka <vbabka@kernel.org>
 -R:	Jann Horn <jannh@google.com>
 +MEMORY MANAGEMENT - ZSWAP COMPRESSED SWAP CACHING
 +M:	Johannes Weiner <hannes@cmpxchg.org>
 +M:	Yosry Ahmed <yosry@kernel.org>
 +M:	Nhat Pham <nphamcs@gmail.com>
 +R:	Chengming Zhou <chengming.zhou@linux.dev>
  L:	linux-mm@kvack.org
  S:	Maintained
 -W:	http://www.linux-mm.org
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 -F:	include/uapi/asm-generic/mman-common.h
 -F:	mm/madvise.c
 +F:	Documentation/admin-guide/mm/zswap.rst
 +F:	include/linux/zswap.h
 +F:	mm/zswap.c
 +F:	tools/testing/selftests/cgroup/test_zswap.c
 =20
  MEMORY TECHNOLOGY DEVICES (MTD)
  M:	Miquel Raynal <miquel.raynal@bootlin.com>
@@@ -18220,6 -17572,15 +18213,6 @@@ F:	Documentation/driver-api/men-chamele
  F:	drivers/mcb/
  F:	include/linux/mcb.h
 =20
 -MEN F21BMC (Board Management Controller)
 -M:	Andreas Werner <andreas.werner@men.de>
 -S:	Supported
 -F:	Documentation/hwmon/menf21bmc.rst
 -F:	drivers/hwmon/menf21bmc_hwmon.c
 -F:	drivers/leds/leds-menf21bmc.c
 -F:	drivers/mfd/menf21bmc.c
 -F:	drivers/watchdog/menf21bmc_wdt.c
 -
  MEN Z069 WATCHDOG DRIVER
  M:	Johannes Thumshirn <jth@kernel.org>
  L:	linux-watchdog@vger.kernel.org
@@@ -18284,7 -17645,6 +18277,7 @@@ L:	linux-arm-msm@vger.kernel.or
  S:	Maintained
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git
  F:	Documentation/ABI/stable/sysfs-bus-mhi
 +F:	Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
  F:	Documentation/mhi/
  F:	drivers/bus/mhi/
  F:	drivers/pci/endpoint/functions/pci-epf-mhi.c
@@@ -18343,7 -17703,7 +18336,7 @@@ F:	Documentation/devicetree/bindings/se
  F:	drivers/spi/spi-at91-usart.c
 =20
  MICROCHIP ATSHA204A DRIVER
 -M:	Thorsten Blum <thorsten.blum@linux.dev>
 +M:	Thorsten Blum <blum@kernel.org>
  L:	linux-crypto@vger.kernel.org
  S:	Maintained
  F:	drivers/crypto/atmel-sha204a.c
@@@ -18367,7 -17727,7 +18360,7 @@@ F:	Documentation/devicetree/bindings/me
  F:	drivers/media/platform/microchip/microchip-csi2dc.c
 =20
  MICROCHIP ECC DRIVER
 -M:	Thorsten Blum <thorsten.blum@linux.dev>
 +M:	Thorsten Blum <blum@kernel.org>
  L:	linux-crypto@vger.kernel.org
  S:	Maintained
  F:	drivers/crypto/atmel-ecc.c
@@@ -18421,7 -17781,6 +18414,7 @@@ F:	Documentation/devicetree/bindings/ne
  F:	drivers/net/dsa/microchip/*
  F:	include/linux/dsa/ksz_common.h
  F:	include/linux/platform_data/microchip-ksz.h
 +F:	net/dsa/tag_ks8995.c
  F:	net/dsa/tag_ksz.c
 =20
  MICROCHIP LAN743X ETHERNET DRIVER
@@@ -18503,7 -17862,7 +18496,7 @@@ F:	Documentation/devicetree/bindings/ii
  F:	drivers/iio/adc/mcp3911.c
 =20
  MICROCHIP MCP47A1 DAC DRIVER
 -M:	Joshua Crofts <joshua.crofts1@gmail.com>
 +M:	Joshua Crofts <crofts@kernel.org>
  S:	Maintained
  F:	Documentation/devicetree/bindings/iio/dac/microchip,mcp47a1.yaml
  F:	drivers/iio/dac/mcp47a1.c
@@@ -18637,9 -17996,10 +18630,9 @@@ F:	drivers/misc/atmel-ssc.
  F:	include/linux/atmel-ssc.h
 =20
  Microchip Timer Counter Block (TCB) Capture Driver
 -M:	Kamel Bouhara <kamel.bouhara@bootlin.com>
  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
  L:	linux-iio@vger.kernel.org
 -S:	Maintained
 +S:	Orphan
  F:	drivers/counter/microchip-tcb-capture.c
  F:	include/uapi/linux/counter/microchip-tcb-capture.h
 =20
@@@ -18696,7 -18056,7 +18689,7 @@@ F:	include/linux/cciss*.
  F:	include/uapi/linux/cciss*.h
 =20
  MICROSOFT MANA RDMA DRIVER
 -M:	Long Li <longli@microsoft.com>
 +M:	Wei Hu <weh@microsoft.com>
  M:	Konstantin Taranov <kotaranov@microsoft.com>
  L:	linux-rdma@vger.kernel.org
  L:	linux-hyperv@vger.kernel.org
@@@ -18827,13 -18187,6 +18820,13 @@@ F:	include/linux/min_heap.
  F:	lib/min_heap.c
  F:	lib/tests/min_heap_kunit.c
 =20
 +MINISFORUM UM780 XTX EC HARDWARE MONITOR DRIVER
 +M:	Sebasti=C3=A1n Peyrott <speyrott@gmail.com>
 +L:	linux-hwmon@vger.kernel.org
 +S:	Maintained
 +F:	Documentation/hwmon/minisforum-um780xtx.rst
 +F:	drivers/hwmon/minisforum-um780xtx.c
 +
  MIPI CCS, SMIA AND SMIA++ IMAGE SENSOR DRIVER
  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
  L:	linux-media@vger.kernel.org
@@@ -18956,6 -18309,20 +18949,6 @@@ S:	Maintaine
  F:	drivers/phy/marvell/phy-mmp3-usb.c
  F:	drivers/phy/marvell/phy-pxa-usb.c
 =20
 -MMU GATHER AND TLB INVALIDATION
 -M:	Will Deacon <will@kernel.org>
 -M:	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
 -M:	Andrew Morton <akpm@linux-foundation.org>
 -M:	Nick Piggin <npiggin@gmail.com>
 -M:	Peter Zijlstra <peterz@infradead.org>
 -L:	linux-arch@vger.kernel.org
 -L:	linux-mm@kvack.org
 -S:	Maintained
 -F:	arch/*/include/asm/tlb.h
 -F:	include/asm-generic/tlb.h
 -F:	include/trace/events/tlb.h
 -F:	mm/mmu_gather.c
 -
  MN88472 MEDIA DRIVER
  L:	linux-media@vger.kernel.org
  S:	Orphan
@@@ -19010,12 -18377,6 +19003,12 @@@ F:	scripts/module
  F:	tools/testing/selftests/kmod/
  F:	tools/testing/selftests/module/
 =20
 +MONOLITHIC POWER SYSTEM MPQ4210 REGULATOR DRIVER
 +M:	Tapio Reijonen <tapio.reijonen@vaisala.com>
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/regulator/mps,mpq4210.yaml
 +F:	drivers/regulator/mpq4210.c
 +
  MONOLITHIC POWER SYSTEM PMIC DRIVER
  M:	Saravanan Sekar <sravanhome@gmail.com>
  S:	Maintained
@@@ -19066,10 -18427,10 +19059,10 @@@ M:	David Yang <mmyangfl@gmail.com
  L:	netdev@vger.kernel.org
  S:	Maintained
  F:	Documentation/devicetree/bindings/net/dsa/motorcomm,yt921x.yaml
 -F:	drivers/net/dsa/yt921x.*
 +F:	drivers/net/dsa/motorcomm/
  F:	net/dsa/tag_yt921x.c
 =20
 -MOXA SMARTIO/INDUSTIO/INTELLIO SERIAL CARD
 +MOXA SMARTIO/INDUSTIO SERIAL CARD
  M:	Jiri Slaby <jirislaby@kernel.org>
  S:	Maintained
  F:	Documentation/driver-api/tty/moxa-smartio.rst
@@@ -19087,9 -18448,7 +19080,9 @@@ M:	James Morse <james.morse@arm.com
  M:	Ben Horgan <ben.horgan@arm.com>
  R:	Reinette Chatre <reinette.chatre@intel.com>
  R:	Fenghua Yu <fenghuay@nvidia.com>
 +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
  S:	Maintained
 +F:	Documentation/arch/arm64/mpam.rst
  F:	drivers/resctrl/mpam_*
  F:	drivers/resctrl/test_mpam_*
  F:	include/linux/arm_mpam.h
@@@ -19296,7 -18655,7 +19289,7 @@@ MULTIFUNCTION DEVICES (MFD
  M:	Lee Jones <lee@kernel.org>
  L:	mfd@lists.linux.dev
  S:	Maintained
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-=
next
  F:	Documentation/devicetree/bindings/mfd/
  F:	drivers/mfd/
  F:	include/dt-bindings/mfd/
@@@ -19450,19 -18809,8 +19443,19 @@@ F:	Documentation/devicetree/bindings/hw
  F:	Documentation/hwmon/nct7363.rst
  F:	drivers/hwmon/nct7363.c
 =20
 +NEBULA-MATRIX ETHERNET DRIVER (nebula-matrix)
 +M:	Illusion Wang <illusion.wang@nebula-matrix.com>
 +M:	Dimon Zhao <dimon.zhao@nebula-matrix.com>
 +M:	Alvin Wang <alvin.wang@nebula-matrix.com>
 +M:	Sam Chen <sam.chen@nebula-matrix.com>
 +L:	netdev@vger.kernel.org
 +S:	Maintained
 +F:	Documentation/networking/device_drivers/ethernet/nebula-matrix/
 +F:	drivers/net/ethernet/nebula-matrix/
 +
  NETCONSOLE
  M:	Breno Leitao <leitao@debian.org>
 +R:	Gustavo Luiz Duarte <gustavold@gmail.com>
  S:	Maintained
  F:	Documentation/networking/netconsole.rst
  F:	drivers/net/netconsole.c
@@@ -19543,7 -18891,7 +19536,7 @@@ F:	net/core/drop_monitor.
  NETWORKING DRIVERS
  M:	Andrew Lunn <andrew+netdev@lunn.ch>
  M:	"David S. Miller" <davem@davemloft.net>
 -M:	Eric Dumazet <edumazet@google.com>
 +M:	Eric Dumazet <edumazet@kernel.org>
  M:	Jakub Kicinski <kuba@kernel.org>
  M:	Paolo Abeni <pabeni@redhat.com>
  L:	netdev@vger.kernel.org
@@@ -19583,7 -18931,7 +19576,7 @@@ NETWORKING DRIVERS (WIRELESS
  M:	Johannes Berg <johannes@sipsolutions.net>
  L:	linux-wireless@vger.kernel.org
  S:	Maintained
 -W:	https://wireless.wiki.kernel.org/
 +W:	https://wireless.docs.kernel.org/en/latest/
  Q:	https://patchwork.kernel.org/project/linux-wireless/list/
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-ne=
xt.git
@@@ -19656,12 -19004,11 +19649,12 @@@ F:	Documentation/devicetree/bindings/=
ne
  F:	Documentation/networking/phy-port.rst
  F:	drivers/net/phy/phy_port.c
  F:	include/linux/phy_port.h
 +F:	net/ethtool/port.c
  K:	struct\s+phy_port|phy_port_
 =20
  NETWORKING [GENERAL]
  M:	"David S. Miller" <davem@davemloft.net>
 -M:	Eric Dumazet <edumazet@google.com>
 +M:	Eric Dumazet <edumazet@kernel.org>
  M:	Jakub Kicinski <kuba@kernel.org>
  M:	Paolo Abeni <pabeni@redhat.com>
  R:	Simon Horman <horms@kernel.org>
@@@ -19779,7 -19126,6 +19772,7 @@@ L:	netdev@vger.kernel.or
  S:	Maintained
  F:	Documentation/netlink/specs/rt-addr.yaml
  F:	Documentation/netlink/specs/rt-neigh.yaml
 +F:	Documentation/netlink/specs/rt-nexthop.yaml
  F:	Documentation/netlink/specs/rt-route.yaml
  F:	Documentation/netlink/specs/rt-rule.yaml
  F:	include/linux/inetdevice.h
@@@ -19888,7 -19234,7 +19881,7 @@@ F:	net/ipv6/seg6
  F:	tools/testing/selftests/net/srv6*
 =20
  NETWORKING [TCP]
 -M:	Eric Dumazet <edumazet@google.com>
 +M:	Eric Dumazet <edumazet@kernel.org>
  M:	Neal Cardwell <ncardwell@google.com>
  R:	Kuniyuki Iwashima <kuniyu@google.com>
  L:	netdev@vger.kernel.org
@@@ -19921,7 -19267,7 +19914,7 @@@ F:	net/tls
  F:	tools/testing/selftests/net/tls.c
 =20
  NETWORKING [SOCKETS]
 -M:	Eric Dumazet <edumazet@google.com>
 +M:	Eric Dumazet <edumazet@kernel.org>
  M:	Kuniyuki Iwashima <kuniyu@google.com>
  M:	Paolo Abeni <pabeni@redhat.com>
  M:	Willem de Bruijn <willemb@google.com>
@@@ -20029,7 -19375,6 +20022,7 @@@ F:	drivers/scsi/nsp32
 =20
  NINTENDO HID DRIVER
  M:	Daniel J. Ogorchock <djogorchock@gmail.com>
 +M:	Vicki Pfau <vi@endrift.com>
  L:	linux-input@vger.kernel.org
  S:	Maintained
  F:	drivers/hid/hid-nintendo*
@@@ -20102,13 -19447,6 +20095,13 @@@ T:	git git://git.kernel.org/pub/scm/lin
  F:	tools/include/nolibc/
  F:	tools/testing/selftests/nolibc/
 =20
 +NOVATEK NT72676 I2C CONTROLLER DRIVER
 +M:	Ben Huang <ben_huang@novatek.com.tw>
 +L:	linux-i2c@vger.kernel.org
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/i2c/novatek,nt72676-i2c.yaml
 +F:	drivers/i2c/busses/i2c-nt72676.c
 +
  NOVATEK NVT-TS I2C TOUCHSCREEN DRIVER
  M:	Hans de Goede <hansg@kernel.org>
  L:	linux-input@vger.kernel.org
@@@ -20160,7 -19498,6 +20153,7 @@@ S:	Maintaine
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git
  F:	Documentation/filesystems/ntfs.rst
  F:	fs/ntfs/
 +F:	include/uapi/linux/ntfs.h
 =20
  NTFS3 FILESYSTEM
  M:	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
@@@ -20170,7 -19507,6 +20163,7 @@@ W:	http://www.paragon-software.com
  T:	git https://github.com/Paragon-Software-Group/linux-ntfs3.git
  F:	Documentation/filesystems/ntfs3.rst
  F:	fs/ntfs3/
 +F:	include/trace/events/ntfs3.h
 =20
  NTSYNC SYNCHRONIZATION PRIMITIVE DRIVER
  M:	Elizabeth Figura <zfigura@codeweavers.com>
@@@ -20238,7 -19574,7 +20231,7 @@@ F:	include/linux/platform_data/x86/nvid
 =20
  NVM EXPRESS DRIVER
  M:	Keith Busch <kbusch@kernel.org>
 -M:	Jens Axboe <axboe@fb.com>
 +M:	Jens Axboe <axboe@kernel.dk>
  M:	Christoph Hellwig <hch@lst.de>
  M:	Sagi Grimberg <sagi@grimberg.me>
  L:	linux-nvme@lists.infradead.org
@@@ -20305,8 -19641,6 +20298,8 @@@ F:	include/linux/nvmem-consumer.
  F:	include/linux/nvmem-provider.h
 =20
  NXP BLUETOOTH WIRELESS DRIVERS
 +M:	Song Xue <song.xue_1@nxp.com>
 +M:	Alex Zhou <alex.zhou@nxp.com>
  M:	Amitkumar Karwar <amitkumar.karwar@nxp.com>
  M:	Neeraj Kale <neeraj.sanjaykale@nxp.com>
  S:	Maintained
@@@ -20396,14 -19730,6 +20389,14 @@@ S:	Maintaine
  F:	Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
  F:	drivers/media/platform/nxp/imx-jpeg
 =20
 +NXP i.MX 95 CSI PIXEL FORMATTER V4L2 DRIVER
 +M:	Guoniu Zhou <guoniu.zhou@nxp.com>
 +L:	imx@lists.linux.dev
 +L:	linux-media@vger.kernel.org
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
 +F:	drivers/media/platform/nxp/imx95-csi-formatter.c
 +
  NXP i.MX CLOCK DRIVERS
  M:	Abel Vesa <abelvesa@kernel.org>
  R:	Peng Fan <peng.fan@nxp.com>
@@@ -20442,15 -19768,6 +20435,15 @@@ L:	linux-wireless@vger.kernel.or
  S:	Maintained
  F:	drivers/net/wireless/nxp/
 =20
 +NXP P3H2X4X I3C-HUB DRIVER
 +M:	Vikash Bansal <vikash.bansal@nxp.com>
 +M:	Aman Kumar Pandey <aman.kumarpandey@nxp.com>
 +M:	Lakshay Piplani <lakshay.piplani@nxp.com>
 +L:	linux-kernel@vger.kernel.org
 +L:	linux-i3c@lists.infradead.org
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
 +
  NXP PF5300/PF5301/PF5302 PMIC REGULATOR DEVICE DRIVER
  M:	Woodrow Douglass <wdouglass@carnegierobotics.com>
  S:	Maintained
@@@ -20803,14 -20120,6 +20796,14 @@@ T:	git git://linuxtv.org/media_tree.gi
  F:	Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
  F:	drivers/media/i2c/og0ve1b.c
 =20
 +OMNIVISION OS02G10 SENSOR DRIVER
 +M:	Tarang Raval <tarang.raval@siliconsignals.io>
 +M:	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
 +L:	linux-media@vger.kernel.org
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
 +F:	drivers/media/i2c/os02g10.c
 +
  OMNIVISION OS05B10 SENSOR DRIVER
  M:	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
  M:	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
@@@ -20851,13 -20160,6 +20844,13 @@@ T:	git git://linuxtv.org/media.gi
  F:	Documentation/devicetree/bindings/media/i2c/ovti,ov02e10.yaml
  F:	drivers/media/i2c/ov02e10.c
 =20
 +OMNIVISION OV05C10 SENSOR DRIVER
 +M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 +R:	Antti Laakso <antti.laakso@linux.intel.com>
 +L:	linux-media@vger.kernel.org
 +S:	Maintained
 +F:	drivers/media/i2c/ov05c10.c
 +
  OMNIVISION OV08D10 SENSOR DRIVER
  M:	Jimmy Su <jimmy.su@intel.com>
  R:	Matthias Fend <matthias.fend@emfend.at>
@@@ -21132,7 -20434,7 +21125,7 @@@ S:	Maintaine
  F:	drivers/char/hw_random/optee-rng.c
 =20
  OP-TEE RTC DRIVER
 -M:	Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.com>
 +M:	Cl=C3=A9ment L=C3=A9ger <clement.leger@linux.dev>
  L:	linux-rtc@vger.kernel.org
  S:	Maintained
  F:	drivers/rtc/rtc-optee.c
@@@ -21181,22 -20483,11 +21174,22 @@@ F:	Documentation/devicetree
  F:	Documentation/process/maintainer-devicetree.rst
  F:	arch/*/boot/dts/
  F:	include/dt-bindings/
 +F:	scripts/dtc/dt-check-style
 +F:	scripts/dtc/dt-style-selftest/
 +
 +OPEN SENSOR FUSION
 +M:	Jinseob Kim <kimjinseob88@gmail.com>
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
 +F:	Documentation/iio/open-sensor-fusion.rst
 +F:	drivers/iio/sensorhubs/osf/
 +K:	opensensorfusion
 =20
  OPENCOMPUTE PTP CLOCK DRIVER
  M:	Vadim Fedorenko <vadim.fedorenko@linux.dev>
  L:	netdev@vger.kernel.org
  S:	Maintained
 +F:	Documentation/networking/devlink/ptp_ocp.rst
  F:	drivers/ptp/ptp_ocp.c
 =20
  OPENCORES I2C BUS DRIVER
@@@ -21225,7 -20516,6 +21218,7 @@@ F:	drivers/irqchip/irq-or1k-
 =20
  OPENVPN DATA CHANNEL OFFLOAD
  M:	Antonio Quartulli <antonio@openvpn.net>
 +R:	Ralf Lici <ralf@mandelbit.com>
  R:	Sabrina Dubroca <sd@queasysnail.net>
  L:	openvpn-devel@lists.sourceforge.net (subscribers-only)
  L:	netdev@vger.kernel.org
@@@ -21273,7 -20563,6 +21266,7 @@@ ORACLE CLUSTER FILESYSTEM 2 (OCFS2
  M:	Mark Fasheh <mark@fasheh.com>
  M:	Joel Becker <jlbec@evilplan.org>
  M:	Joseph Qi <joseph.qi@linux.alibaba.com>
 +R:	Heming Zhao <heming.zhao@suse.com>
  L:	ocfs2-devel@lists.linux.dev
  S:	Supported
  W:	http://ocfs2.wiki.kernel.org
@@@ -21314,7 -20603,7 +21307,7 @@@ P54 WIRELESS DRIVE
  M:	Christian Lamparter <chunkeey@googlemail.com>
  L:	linux-wireless@vger.kernel.org
  S:	Maintained
 -W:	https://wireless.wiki.kernel.org/en/users/Drivers/p54
 +W:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/p54.html
  F:	Documentation/devicetree/bindings/net/wireless/st,stlc4560.yaml
  F:	drivers/net/wireless/intersil/
 =20
@@@ -21344,6 -20633,25 +21337,6 @@@ F:	Documentation/core-api/padata.rs
  F:	include/linux/padata.h
  F:	kernel/padata.c
 =20
 -PAGE CACHE
 -M:	Matthew Wilcox (Oracle) <willy@infradead.org>
 -M:	Jan Kara <jack@suse.cz>
 -L:	linux-fsdevel@vger.kernel.org
 -L:	linux-mm@kvack.org
 -S:	Supported
 -T:	git git://git.infradead.org/users/willy/pagecache.git
 -F:	Documentation/filesystems/locking.rst
 -F:	Documentation/filesystems/vfs.rst
 -F:	include/linux/pagemap.h
 -F:	include/linux/writeback.h
 -F:	include/trace/events/filemap.h
 -F:	include/trace/events/readahead.h
 -F:	include/trace/events/writeback.h
 -F:	mm/filemap.c
 -F:	mm/page-writeback.c
 -F:	mm/readahead.c
 -F:	mm/truncate.c
 -
  PAGE POOL
  M:	Jesper Dangaard Brouer <hawk@kernel.org>
  M:	Ilias Apalodimas <ilias.apalodimas@linaro.org>
@@@ -21354,6 -20662,15 +21347,6 @@@ F:	include/net/page_pool
  F:	include/trace/events/page_pool.h
  F:	net/core/page_pool.c
 =20
 -PAGE TABLE CHECK
 -M:	Pasha Tatashin <pasha.tatashin@soleen.com>
 -M:	Andrew Morton <akpm@linux-foundation.org>
 -L:	linux-mm@kvack.org
 -S:	Maintained
 -F:	Documentation/mm/page_table_check.rst
 -F:	include/linux/page_table_check.h
 -F:	mm/page_table_check.c
 -
  PAGE STATE DEBUG SCRIPT
  M:	Ye Liu <liuye@kylinos.cn>
  S:	Maintained
@@@ -21642,6 -20959,7 +21635,6 @@@ M:	Yoshihiro Shimoda <yoshihiro.shimoda
  L:	linux-pci@vger.kernel.org
  L:	linux-renesas-soc@vger.kernel.org
  S:	Maintained
 -F:	Documentation/PCI/controller/rcar-pcie-firmware.rst
  F:	Documentation/devicetree/bindings/pci/*rcar*
  F:	drivers/pci/controller/*rcar*
  F:	drivers/pci/controller/dwc/*rcar*
@@@ -21733,21 -21051,6 +21726,21 @@@ L:	linux-pci@vger.kernel.or
  S:	Supported
  F:	Documentation/PCI/pci-error-recovery.rst
 =20
 +PCI LIVE UPDATE
 +M:	David Matlack <dmatlack@google.com>
 +R:	Pasha Tatashin <pasha.tatashin@soleen.com>
 +R:	Mike Rapoport <rppt@kernel.org>
 +R:	Pratyush Yadav <pratyush@kernel.org>
 +L:	kexec@lists.infradead.org
 +L:	linux-pci@vger.kernel.org
 +S:	Maintained
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git
 +F:	Documentation/PCI/liveupdate.rst
 +F:	drivers/pci/liveupdate.c
 +F:	drivers/pci/liveupdate.h
 +F:	include/linux/kho/abi/pci.h
 +F:	include/linux/pci_liveupdate.h
 +
  PCI MSI DRIVER FOR ALTERA MSI IP
  L:	linux-pci@vger.kernel.org
  S:	Orphan
@@@ -22047,6 -21350,19 +22040,6 @@@ S:	Maintaine
  F:	Documentation/networking/device_drivers/ethernet/pensando/ionic.rst
  F:	drivers/net/ethernet/pensando/
 =20
 -PER-CPU MEMORY ALLOCATOR
 -M:	Dennis Zhou <dennis@kernel.org>
 -M:	Tejun Heo <tj@kernel.org>
 -M:	Christoph Lameter <cl@gentwo.org>
 -L:	linux-mm@kvack.org
 -S:	Maintained
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/dennis/percpu.git
 -F:	arch/*/include/asm/percpu.h
 -F:	include/linux/percpu*.h
 -F:	lib/percpu*.c
 -F:	mm/percpu*.c
 -F:	mm/percpu-internal.h
 -
  PER-TASK DELAY ACCOUNTING
  M:	Balbir Singh <bsingharora@gmail.com>
  M:	Yang Yang <yang.yang29@zte.com.cn>
@@@ -22097,7 -21413,7 +22090,7 @@@ F:	tools/lib/perf
  F:	tools/perf/
 =20
  PERFORMANCE EVENTS TOOLING ARM64
 -R:	John Garry <john.g.garry@oracle.com>
 +R:	John Garry <john.garry@linux.dev>
  R:	Will Deacon <will@kernel.org>
  R:	James Clark <james.clark@linaro.org>
  R:	Mike Leach <mike.leach@arm.com>
@@@ -22248,15 -21564,6 +22241,15 @@@ F:	drivers/pinctrl/mediatek/pinctrl-rt2
  F:	drivers/pinctrl/mediatek/pinctrl-rt305x.c
  F:	drivers/pinctrl/mediatek/pinctrl-rt3883.c
 =20
 +PIN CONTROLLER - MEDIATEK MT6735
 +M:	Yassine Oudjana <y.oudjana@protonmail.com>
 +L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
 +F:	drivers/pinctrl/mediatek/pinctrl-mt6735.c
 +F:	drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h
 +F:	include/dt-bindings/pinctrl/mediatek,mt6735-pinfunc.h
 +
  PIN CONTROLLER - MICROCHIP AT91
  M:	Ludovic Desroches <ludovic.desroches@microchip.com>
  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
@@@ -22533,10 -21840,9 +22526,10 @@@ F:	scripts/Makefile.propelle
 =20
  PRINTK
  M:	Petr Mladek <pmladek@suse.com>
 +M:	John Ogness <john.ogness@linutronix.de>
  R:	Steven Rostedt <rostedt@goodmis.org>
 -R:	John Ogness <john.ogness@linutronix.de>
  R:	Sergey Senozhatsky <senozhatsky@chromium.org>
 +L:	printk@lists.linux.dev
  S:	Maintained
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git
  F:	Documentation/core-api/printk-basics.rst
@@@ -22545,7 -21851,6 +22538,7 @@@ F:	kernel/printk
 =20
  PRINTK INDEXING
  R:	Chris Down <chris@chrisdown.name>
 +L:	printk@lists.linux.dev
  S:	Maintained
  F:	Documentation/core-api/printk-index.rst
  F:	kernel/printk/index.c
@@@ -22824,15 -22129,6 +22817,15 @@@ F:	sound/soc/codecs/wcd93*.
  F:	sound/soc/codecs/wsa88*.*
  F:	sound/soc/qcom/
 =20
 +QCOM AUDIO INTERFACE (QAIF) DRIVER
 +M:	Harendra Gautam <harendra.gautam@oss.qualcomm.com>
 +M:	Srinivas Kandagatla <srini@kernel.org>
 +L:	linux-sound@vger.kernel.org
 +L:	linux-arm-msm@vger.kernel.org
 +S:	Supported
 +F:	Documentation/devicetree/bindings/sound/qcom,shikra-qaif-cpu.yaml
 +F:	sound/soc/qcom/qaif*
 +
  QCOM EMBEDDED USB DEBUGGER (EUD)
  M:	Souradeep Chowdhury <quic_schowdhu@quicinc.com>
  L:	linux-arm-msm@vger.kernel.org
@@@ -22861,9 -22157,9 +22854,9 @@@ S:	Maintaine
  F:	drivers/power/reset/qemu-virt-ctrl.c
 =20
  QLOGIC QL41xxx FCOE DRIVER
 -M:	Saurav Kashyap <skashyap@marvell.com>
 -M:	Javed Hasan <jhasan@marvell.com>
 -M:	GR-QLogic-Storage-Upstream@marvell.com
 +M:	Nilesh Javali <njavali@marvell.com>
 +M:	Manish Rangankar <mrangankar@marvell.com>
 +M:	GR-ETH-Storage-Upstream@marvell.com
  L:	linux-scsi@vger.kernel.org
  S:	Supported
  F:	drivers/scsi/qedf/
@@@ -22871,7 -22167,7 +22864,7 @@@
  QLOGIC QL41xxx ISCSI DRIVER
  M:	Nilesh Javali <njavali@marvell.com>
  M:	Manish Rangankar <mrangankar@marvell.com>
 -M:	GR-QLogic-Storage-Upstream@marvell.com
 +M:	GR-ETH-Storage-Upstream@marvell.com
  L:	linux-scsi@vger.kernel.org
  S:	Supported
  F:	drivers/scsi/qedi/
@@@ -22997,7 -22293,7 +22990,7 @@@ M:	Jeff Johnson <jjohnson@kernel.org
  L:	linux-wireless@vger.kernel.org
  L:	ath12k@lists.infradead.org
  S:	Supported
 -W:	https://wireless.wiki.kernel.org/en/users/Drivers/ath12k
 +W:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath12k.html
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git
  F:	drivers/net/wireless/ath/ath12k/
  N:	ath12k
@@@ -23007,7 -22303,7 +23000,7 @@@ M:	Jeff Johnson <jjohnson@kernel.org
  L:	linux-wireless@vger.kernel.org
  L:	ath10k@lists.infradead.org
  S:	Supported
 -W:	https://wireless.wiki.kernel.org/en/users/Drivers/ath10k
 +W:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath10k.html
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git
  F:	drivers/net/wireless/ath/ath10k/
  N:	ath10k
@@@ -23017,8 -22313,8 +23010,8 @@@ M:	Jeff Johnson <jjohnson@kernel.org
  L:	linux-wireless@vger.kernel.org
  L:	ath11k@lists.infradead.org
  S:	Supported
 -W:	https://wireless.wiki.kernel.org/en/users/Drivers/ath11k
 -B:	https://wireless.wiki.kernel.org/en/users/Drivers/ath11k/bugreport
 +W:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath11k.html
 +B:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath11k/bug=
report.html
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git
  F:	drivers/net/wireless/ath/ath11k/
  N:	ath11k
@@@ -23027,7 -22323,7 +23020,7 @@@ QUALCOMM ATHEROS ATH9K WIRELESS DRIVE
  M:	Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke.dk>
  L:	linux-wireless@vger.kernel.org
  S:	Maintained
 -W:	https://wireless.wiki.kernel.org/en/users/Drivers/ath9k
 +W:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath9k.html
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git
  F:	Documentation/devicetree/bindings/net/wireless/qca,ath9k.yaml
  F:	drivers/net/wireless/ath/ath9k/
@@@ -23076,7 -22372,6 +23069,7 @@@ F:	drivers/media/platform/qcom/camss
 =20
  QUALCOMM CLOCK DRIVERS
  M:	Bjorn Andersson <andersson@kernel.org>
 +R:	Abel Vesa <abelvesa@kernel.org>
  L:	linux-arm-msm@vger.kernel.org
  S:	Supported
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git
@@@ -23140,7 -22435,6 +23133,7 @@@ L:	netdev@vger.kernel.or
  L:	linux-arm-msm@vger.kernel.org
  S:	Maintained
  F:	Documentation/devicetree/bindings/net/qcom,ethqos.yaml
 +F:	Documentation/devicetree/bindings/net/qcom,sa8255p-ethqos.yaml
  F:	drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
 =20
  QUALCOMM FASTRPC DRIVER
@@@ -23194,15 -22488,6 +23187,15 @@@ S:	Maintaine
  F:	Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
  F:	drivers/i2c/busses/i2c-qcom-cci.c
 =20
 +QUALCOMM INLINE CRYPTO ENGINE DRIVER
 +M:	Abel Vesa <abelvesa@kernel.org>
 +L:	linux-arm-msm@vger.kernel.org
 +L:	linux-crypto@vger.kernel.org
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
 +F:	drivers/soc/qcom/ice.c
 +F:	include/soc/qcom/ice.h
 +
  QUALCOMM INTERCONNECT BWMON DRIVER
  M:	Krzysztof Kozlowski <krzk@kernel.org>
  L:	linux-arm-msm@vger.kernel.org
@@@ -23262,16 -22547,6 +23255,16 @@@ S:	Maintaine
  F:	Documentation/devicetree/bindings/media/qcom,*-iris.yaml
  F:	drivers/media/platform/qcom/iris/
 =20
 +QUALCOMM MIPI CSI2 PHY DRIVER
 +M:	Bryan O'Donoghue <bod@kernel.org>
 +L:	linux-phy@lists.infradead.org
 +L:	linux-media@vger.kernel.org
 +L:	linux-arm-msm@vger.kernel.org
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/phy/qcom,*-csi2-phy.yaml
 +F:	drivers/phy/qualcomm/phy-qcom-mipi-csi2*.c
 +F:	drivers/phy/qualcomm/phy-qcom-mipi-csi2*.h
 +
  QUALCOMM NAND CONTROLLER DRIVER
  M:	Manivannan Sadhasivam <mani@kernel.org>
  L:	linux-mtd@lists.infradead.org
@@@ -23315,13 -22590,6 +23308,13 @@@ F:	Documentation/devicetree/bindings/ne
  F:	Documentation/networking/device_drivers/ethernet/qualcomm/ppe/ppe.rst
  F:	drivers/net/ethernet/qualcomm/ppe/
 =20
 +QUALCOMM QMI (REMOTEPROC THERMAL MITIGATION) TMD
 +M:	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
 +L:	linux-arm-msm@vger.kernel.org
 +L:	linux-pm@vger.kernel.org
 +S:	Maintained
 +F:	drivers/soc/qcom/qmi_tmd.c
 +
  QUALCOMM QSEECOM DRIVER
  M:	Maximilian Luz <luzmaximilian@gmail.com>
  L:	linux-arm-msm@vger.kernel.org
@@@ -23338,7 -22606,6 +23331,7 @@@ QUALCOMM PINCTRL DRIVER
  M:	Bartosz Golaszewski <brgl@kernel.org>
  L:	linux-arm-msm@vger.kernel.org
  S:	Supported
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
  F:	Documentation/devicetree/bindings/pinctrl/qcom,*.yaml
  F:	drivers/pinctrl/qcom/
 =20
@@@ -23351,14 -22618,6 +23344,14 @@@ F:	Documentation/networking/device_driv
  F:	drivers/net/ethernet/qualcomm/rmnet/
  F:	include/linux/if_rmnet.h
 =20
 +QUALCOMM SPMI CONTROLLER (PMIC ARBITER) DRIVER
 +M:	Abel Vesa <abelvesa@kernel.org>
 +M:	David Collins <david.collins@oss.qualcomm.com>
 +L:	linux-arm-msm@vger.kernel.org
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/spmi/qcom,*spmi-pmic-arb*.yaml
 +F:	drivers/spmi/spmi-pmic-arb.c
 +
  QUALCOMM TEE (QCOMTEE) DRIVER
  M:	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
  L:	linux-arm-msm@vger.kernel.org
@@@ -23406,7 -22665,7 +23399,7 @@@ M:	Loic Poulain <loic.poulain@oss.qualc
  L:	wcn36xx@lists.infradead.org
  L:	linux-wireless@vger.kernel.org
  S:	Supported
 -W:	https://wireless.wiki.kernel.org/en/users/Drivers/wcn36xx
 +W:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/wcn36xx.ht=
ml
  F:	drivers/net/wireless/ath/wcn36xx/
 =20
  QUANTENNA QTNFMAC WIRELESS DRIVER
@@@ -23423,7 -22682,7 +23416,7 @@@ L:	amd-gfx@lists.freedesktop.or
  S:	Supported
  B:	https://gitlab.freedesktop.org/drm/amd/-/issues
  C:	irc://irc.oftc.net/radeon
 -T:	git https://gitlab.freedesktop.org/agd5f/linux.git
 +T:	git https://gitlab.freedesktop.org/drm/amdgpu/kernel.git
  F:	Documentation/gpu/amdgpu/
  F:	drivers/gpu/drm/amd/
  F:	drivers/gpu/drm/ci/xfails/amd*
@@@ -23757,12 -23016,6 +23750,12 @@@ S:	Maintaine
  F:	Documentation/devicetree/bindings/spi/realtek,rtl9301-snand.yaml
  F:	drivers/spi/spi-realtek-rtl-snand.c
 =20
 +REALTEK SPI-NOR
 +M:	Jyan Chou <jyanchou@realtek.com>
 +M:	Yu-Chun Lin <eleanor.lin@realtek.com>
 +S:	Supported
 +F:	drivers/spi/spi-rtk-nor.c
 +
  REALTEK SYSTIMER DRIVER
  M:	Hao-Wen Ting <haowen.ting@realtek.com>
  S:	Maintained
@@@ -24015,7 -23268,7 +24008,7 @@@ F:	Documentation/devicetree/bindings/rt
  F:	drivers/rtc/rtc-renesas-rtca3.c
 =20
  RENESAS RZ/N1 A5PSW SWITCH DRIVER
 -M:	Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.com>
 +M:	Cl=C3=A9ment L=C3=A9ger <clement.leger@linux.dev>
  L:	linux-renesas-soc@vger.kernel.org
  L:	netdev@vger.kernel.org
  S:	Maintained
@@@ -24048,13 -23301,6 +24041,13 @@@ S:	Maintaine
  F:	Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
  F:	drivers/rtc/rtc-rzn1.c
 =20
 +RENESAS RZ/N1 TIMERS DRIVER
 +M:	Herve Codina <herve.codina@bootlin.com>
 +L:	linux-renesas-soc@vger.kernel.org
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/timer/renesas,rzn1-timer.yaml
 +F:	drivers/clocksource/timer-rzn1.c
 +
  RENESAS RZ/N1 USBF CONTROLLER DRIVER
  M:	Herve Codina <herve.codina@bootlin.com>
  L:	linux-renesas-soc@vger.kernel.org
@@@ -24178,7 -23424,7 +24171,7 @@@ RFKIL
  M:	Johannes Berg <johannes@sipsolutions.net>
  L:	linux-wireless@vger.kernel.org
  S:	Maintained
 -W:	https://wireless.wiki.kernel.org/
 +W:	https://wireless.docs.kernel.org/en/latest/
  Q:	https://patchwork.kernel.org/project/linux-wireless/list/
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-ne=
xt.git
@@@ -24266,8 -23512,7 +24259,8 @@@ F:	drivers/iommu/riscv
 =20
  RISC-V MICROCHIP SUPPORT
  M:	Conor Dooley <conor.dooley@microchip.com>
 -M:	Daire McNamara <daire.mcnamara@microchip.com>
 +R:	Valentina Fernandez <valentina.fernandezalanis@microchip.com>
 +R:	Daire McNamara <daire.mcnamara@microchip.com>
  L:	linux-riscv@lists.infradead.org
  S:	Supported
  T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ (=
dts, soc, firmware)
@@@ -24347,17 -23592,8 +24340,17 @@@ F:	drivers/irqchip/irq-riscv-rpmi-sysms
  F:	drivers/mailbox/riscv-sbi-mpxy-mbox.c
  F:	include/linux/mailbox/riscv-rpmi-message.h
 =20
 +RISC-V RPMI DEVICE POWER DRIVER
 +M:	Joshua Yeong <joshua.yeong@starfivetech.com>
 +L:	linux-riscv@lists.infradead.org
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/power/riscv,rpmi-device-power.yaml
 +F:	Documentation/devicetree/bindings/power/riscv,rpmi-mpxy-device-power.y=
aml
 +F:	drivers/pmdomain/riscv/
 +
  RISC-V SPACEMIT SoC Support
  M:	Yixun Lan <dlan@kernel.org>
 +R:	Troy Mitchell <troy.mitchell@linux.spacemit.com>
  L:	linux-riscv@lists.infradead.org
  L:	spacemit@lists.linux.dev
  S:	Maintained
@@@ -24369,12 -23605,11 +24362,12 @@@ N:	spacemi
  K:	spacemit
 =20
  RISC-V TENSTORRENT SoC SUPPORT
 -M:	Drew Fustini <dfustini@oss.tenstorrent.com>
 +M:	Drew Fustini <fustini@kernel.org>
  M:	Joel Stanley <jms@oss.tenstorrent.com>
 +M:	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
  L:	linux-riscv@lists.infradead.org
  S:	Maintained
 -T:	git https://github.com/tenstorrent/linux.git
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tenstorrent/linux.git
  F:	Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm-rcpu=
=2Eyaml
  F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
  F:	arch/riscv/boot/dts/tenstorrent/
@@@ -24389,7 -23624,7 +24382,7 @@@ M:	Fu Wei <wefu@redhat.com
  L:	linux-riscv@lists.infradead.org
  S:	Maintained
  Q:	https://patchwork.kernel.org/project/riscv-thead/list/
 -T:	git https://github.com/pdp7/linux.git
 +T:	git https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git
  F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
  F:	Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
  F:	Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
@@@ -24514,15 -23749,6 +24507,15 @@@ S:	Maintaine
  F:	Documentation/devicetree/bindings/sound/rockchip,rk3576-sai.yaml
  F:	sound/soc/rockchip/rockchip_sai.*
 =20
 +ROCKCHIP XPCS DRIVER
 +M:	Coia Prant <coiaprant@gmail.com>
 +L:	netdev@vger.kernel.org
 +L:	linux-rockchip@lists.infradead.org
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
 +F:	drivers/net/pcs/pcs-xpcs-rk.c
 +F:	include/linux/pcs/pcs-xpcs-rk.h
 +
  ROCKER DRIVER
  M:	Jiri Pirko <jiri@resnulli.us>
  L:	netdev@vger.kernel.org
@@@ -24600,7 -23826,6 +24593,7 @@@ F:	drivers/clk/clk-bd718x7.
  F:	drivers/gpio/gpio-bd71815.c
  F:	drivers/gpio/gpio-bd71828.c
  F:	drivers/gpio/gpio-bd72720.c
 +F:	drivers/gpio/gpio-bd73800.c
  F:	drivers/mfd/rohm-bd71828.c
  F:	drivers/mfd/rohm-bd718x7.c
  F:	drivers/mfd/rohm-bd9576.c
@@@ -24620,7 -23845,6 +24613,7 @@@ F:	include/linux/mfd/rohm-bd71815.
  F:	include/linux/mfd/rohm-bd71828.h
  F:	include/linux/mfd/rohm-bd718x7.h
  F:	include/linux/mfd/rohm-bd72720.h
 +F:	include/linux/mfd/rohm-bd73800.h
  F:	include/linux/mfd/rohm-bd957x.h
  F:	include/linux/mfd/rohm-bd96801.h
  F:	include/linux/mfd/rohm-bd96802.h
@@@ -24754,7 -23978,6 +24747,7 @@@ K:	\b(?i:rust)\
 =20
  RUST [ALLOC]
  M:	Danilo Krummrich <dakr@kernel.org>
 +M:	Alice Ryhl <aliceryhl@google.com>
  R:	Lorenzo Stoakes <ljs@kernel.org>
  R:	Vlastimil Babka <vbabka@kernel.org>
  R:	Liam R. Howlett <liam@infradead.org>
@@@ -24772,15 -23995,6 +24765,15 @@@ L:	rust-for-linux@vger.kernel.or
  S:	Maintained
  F:	rust/kernel/bitfield.rs
 =20
 +RUST [BUG]
 +M:	FUJITA Tomonori <fujita.tomonori@gmail.com>
 +L:	rust-for-linux@vger.kernel.org
 +S:	Maintained
 +F:	rust/helpers/bug.c
 +F:	rust/kernel/bug.rs
 +F:	rust/kernel/generated_arch_reachable_asm.rs.S
 +F:	rust/kernel/generated_arch_warn_asm.rs.S
 +
  RUST [INTEROP]
  M:	Joel Fernandes <joelagnelf@nvidia.com>
  M:	Alexandre Courbot <acourbot@nvidia.com>
@@@ -25089,14 -24303,6 +25082,14 @@@ F:	drivers/clk/samsung/clk-acpm.
  F:	drivers/firmware/samsung/exynos-acpm*
  F:	include/linux/firmware/samsung/exynos-acpm-protocol.h
 =20
 +SAMSUNG EXYNOS ACPM THERMAL DRIVER
 +M:	Tudor Ambarus <tudor.ambarus@linaro.org>
 +L:	linux-kernel@vger.kernel.org
 +L:	linux-samsung-soc@vger.kernel.org
 +S:	Supported
 +F:	Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
 +F:	drivers/thermal/samsung/acpm-tmu.c
 +
  SAMSUNG EXYNOS MAILBOX DRIVER
  M:	Tudor Ambarus <tudor.ambarus@linaro.org>
  L:	linux-samsung-soc@vger.kernel.org
@@@ -25196,13 -24402,6 +25189,13 @@@ T:	git git://linuxtv.org/media_tree.gi
  F:	Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml
  F:	drivers/media/i2c/s5kjn1.c
 =20
 +SAMSUNG S5KJN5 CAMERA DRIVER
 +M:	Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
 +L:	linux-media@vger.kernel.org
 +S:	Supported
 +F:	Documentation/devicetree/bindings/media/i2c/samsung,s5kjn5.yaml
 +F:	drivers/media/i2c/s5kjn5.c
 +
  SAMSUNG S5P Security SubSystem (SSS) DRIVER
  M:	Krzysztof Kozlowski <krzk@kernel.org>
  M:	Vladimir Zapolskiy <vz@mleia.com>
@@@ -25282,11 -24481,6 +25275,11 @@@ R:	Marc Murphy <marc.murphy@sancloud.co
  S:	Supported
  F:	arch/arm/boot/dts/ti/omap/am335x-sancloud*
 =20
 +SB1250-DUART BROADCOM SOC SERIAL DRIVER
 +M:	"Maciej W. Rozycki" <macro@orcam.me.uk>
 +S:	Maintained
 +F:	drivers/tty/serial/sb1250-duart.c
 +
  SBOM
  M:	Luis Augenstein <luis.augenstein@tngtech.com>
  M:	Maximilian Huber <maximilian.huber@tngtech.com>
@@@ -25394,11 -24588,8 +25387,11 @@@ F:	include/uapi/scsi
  F:	include/ufs/
 =20
  SCSI TAPE DRIVER
 +M:	Laurence Oberman <loberman@redhat.com>
 +M:	John Meneghini <jmeneghi@redhat.com>
  L:	linux-scsi@vger.kernel.org
 -S:	Orphan
 +S:	Maintained
 +W:	https://github.com/johnmeneghini/tape_tests
  F:	Documentation/scsi/st.rst
  F:	drivers/scsi/st.*
  F:	drivers/scsi/st_*.h
@@@ -25503,13 -24694,6 +25496,13 @@@ L:	linux-mmc@vger.kernel.or
  S:	Maintained
  F:	drivers/mmc/host/sdhci-brcmstb*
 =20
 +SECURE DIGITAL HOST CONTROLLER INTERFACE (SDHCI) CADENCE DRIVER
 +M:	Tanmay Kathpalia <tanmay.kathpalia@altera.com>
 +L:	linux-mmc@vger.kernel.org
 +S:	Supported
 +F:	Documentation/devicetree/bindings/mmc/cdns,sd6hc.yaml
 +F:	drivers/mmc/host/sdhci-cadence*
 +
  SECURE DIGITAL HOST CONTROLLER INTERFACE (SDHCI) DRIVER
  M:	Adrian Hunter <adrian.hunter@intel.com>
  L:	linux-mmc@vger.kernel.org
@@@ -25567,9 -24751,7 +25560,9 @@@ M:	Sudeep Holla <sudeep.holla@kernel.or
  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
  S:	Maintained
  F:	drivers/firmware/smccc/
 +F:	include/linux/arm-smccc-bus.h
  F:	include/linux/arm-smccc.h
 +F:	include/linux/device-id/arm_smccc.h
 =20
  SECURITY CONTACT
  M:	Security Officers <security@kernel.org>
@@@ -25601,7 -24783,7 +25594,7 @@@ K:	\bsecurity_[a-z_0-9]\+\
  SELINUX SECURITY MODULE
  M:	Paul Moore <paul@paul-moore.com>
  M:	Stephen Smalley <stephen.smalley.work@gmail.com>
 -R:	Ondrej Mosnacek <omosnace@redhat.com>
 +R:	Ondrej Mosn=C3=A1=C4=8Dek <omosnacek@gmail.com>
  L:	selinux@vger.kernel.org
  S:	Supported
  W:	https://github.com/SELinuxProject
@@@ -25646,12 -24828,6 +25639,12 @@@ S:	Maintaine
  F:	Documentation/devicetree/bindings/iio/chemical/sensirion,scd4x.yaml
  F:	drivers/iio/chemical/scd4x.c
 =20
 +SENSIRION SDP31 DIFFERENTIAL PRESSURE SENSOR DRIVER
 +M:	Muhammad Abu Bakar <m.abubakar365@yahoo.com>
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/iio/pressure/sensirion,sdp31.yaml
 +F:	drivers/iio/pressure/sdp31.c
 +
  SENSIRION SDP500 DIFFERENTIAL PRESSURE SENSOR DRIVER
  M:	Petar Stoykov <petar.stoykov@prodrive-technologies.com>
  S:	Maintained
@@@ -25763,6 -24939,21 +25756,6 @@@ T:	git git://linuxtv.org/media.gi
  F:	drivers/media/i2c/rj54n1cb0c.c
  F:	include/media/i2c/rj54n1cb0c.h
 =20
 -SHRINKER
 -M:	Andrew Morton <akpm@linux-foundation.org>
 -M:	Dave Chinner <david@fromorbit.com>
 -R:	Qi Zheng <qi.zheng@linux.dev>
 -R:	Roman Gushchin <roman.gushchin@linux.dev>
 -R:	Muchun Song <muchun.song@linux.dev>
 -L:	linux-mm@kvack.org
 -S:	Maintained
 -F:	Documentation/admin-guide/mm/shrinker_debugfs.rst
 -F:	include/linux/list_lru.h
 -F:	include/linux/shrinker.h
 -F:	mm/list_lru.c
 -F:	mm/shrinker.c
 -F:	mm/shrinker_debug.c
 -
  SH_VOU V4L2 OUTPUT DRIVER
  L:	linux-media@vger.kernel.org
  S:	Orphan
@@@ -25930,6 -25121,13 +25923,6 @@@ F:	drivers/gpio/gpio-siox.
  F:	drivers/siox/*
  F:	include/trace/events/siox.h
 =20
 -SIPHASH PRF ROUTINES
 -M:	Jason A. Donenfeld <Jason@zx2c4.com>
 -S:	Maintained
 -F:	include/linux/siphash.h
 -F:	lib/siphash.c
 -F:	lib/tests/siphash_kunit.c
 -
  SIS 190 ETHERNET DRIVER
  M:	Francois Romieu <romieu@fr.zoreil.com>
  L:	netdev@vger.kernel.org
@@@ -25953,7 -25151,7 +25946,7 @@@ SIS I2C TOUCHSCREEN DRIVE
  M:	Mika Penttil=C3=A4 <mpenttil@redhat.com>
  L:	linux-input@vger.kernel.org
  S:	Maintained
 -F:	Documentation/devicetree/bindings/input/touchscreen/sis_i2c.txt
 +F:	Documentation/devicetree/bindings/input/touchscreen/sis,9200-ts.yaml
  F:	drivers/input/touchscreen/sis_i2c.c
 =20
  SIS USB2VGA DRIVER
@@@ -25983,6 -25181,34 +25976,6 @@@ S:	Maintaine
  F:	Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml
  F:	drivers/nvmem/layouts/sl28vpd.c
 =20
 -SLAB ALLOCATOR
 -M:	Vlastimil Babka <vbabka@kernel.org>
 -M:	Harry Yoo <harry@kernel.org>
 -M:	Andrew Morton <akpm@linux-foundation.org>
 -R:	Hao Li <hao.li@linux.dev>
 -R:	Christoph Lameter <cl@gentwo.org>
 -R:	David Rientjes <rientjes@google.com>
 -R:	Roman Gushchin <roman.gushchin@linux.dev>
 -L:	linux-mm@kvack.org
 -S:	Maintained
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git
 -F:	Documentation/admin-guide/mm/slab.rst
 -F:	Documentation/mm/slab.rst
 -F:	include/linux/mempool.h
 -F:	include/linux/slab.h
 -F:	lib/tests/slub_kunit.c
 -F:	mm/failslab.c
 -F:	mm/mempool.c
 -F:	mm/slab.h
 -F:	mm/slab_common.c
 -F:	mm/slub.c
 -F:	scripts/gdb/linux/slab.py
 -F:	tools/cgroup/memcg_slabinfo.py
 -F:	tools/include/linux/slab.h
 -F:	tools/lib/slab.c
 -F:	tools/mm/slabinfo-gnuplot.sh
 -F:	tools/mm/slabinfo.c
 -
  SLCAN CAN NETWORK DRIVER
  M:	Dario Binacchi <dario.binacchi@amarulasolutions.com>
  L:	linux-can@vger.kernel.org
@@@ -26015,9 -25241,10 +26008,9 @@@ F:	Documentation/admin-guide/LSM/Smack.
  F:	security/smack/
 =20
  SMBDIRECT (RDMA Stream Transport with Read/Write-Offload, MS-SMBD)
 -M:	Steve French <smfrench@gmail.com>
 -M:	Steve French <sfrench@samba.org>
  M:	Namjae Jeon <linkinjeon@kernel.org>
  M:	Namjae Jeon <linkinjeon@samba.org>
 +M:	Paulo Alcantara <pc@manguebit.org>
  R:	Stefan Metzmacher <metze@samba.org>
  R:	Tom Talpey <tom@talpey.com>
  L:	linux-cifs@vger.kernel.org
@@@ -26120,8 -25347,8 +26113,8 @@@ F:	Documentation/networking/timestampin
  F:	include/linux/net_tstamp.h
  F:	include/uapi/linux/net_tstamp.h
  F:	tools/testing/selftests/bpf/*/net_timestamping*
 +F:	tools/testing/selftests/drivers/net/so_txtime.*
  F:	tools/testing/selftests/net/*timestamp*
 -F:	tools/testing/selftests/net/so_txtime.c
 =20
  SOEKRIS NET48XX LED SUPPORT
  M:	Chris Boot <bootc@bootc.net>
@@@ -26188,7 -25415,7 +26181,7 @@@ F:	drivers/md/md
  F:	drivers/md/raid*
  F:	include/linux/raid/
  F:	include/uapi/linux/raid/
 -F:	lib/raid/raid6/
 +F:	lib/raid/
 =20
  SOLIDRUN CLEARFOG SUPPORT
  M:	Russell King <linux@armlinux.org.uk>
@@@ -26334,14 -25561,6 +26327,14 @@@ L:	linux-media@vger.kernel.or
  S:	Maintained
  F:	drivers/media/i2c/imx471.c
 =20
 +SONY IMX576 SENSOR DRIVER
 +M:	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
 +M:	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
 +L:	linux-media@vger.kernel.org
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml
 +F:	drivers/media/i2c/imx576.c
 +
  SONY IMX678 SENSOR DRIVER
  M:	Jai Luthra <jai.luthra@ideasonboard.com>
  L:	linux-media@vger.kernel.org
@@@ -26519,16 -25738,9 +26512,16 @@@ S:	Maintaine
  F:	Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
  F:	sound/soc/spacemit/k1_i2s.c
 =20
 +SPACEMIT RESET CONTROLLER DRIVER
 +M:	Guodong Xu <docular.xu@gmail.com>
 +L:	linux-riscv@lists.infradead.org
 +L:	spacemit@lists.linux.dev
 +S:	Maintained
 +F:	drivers/reset/spacemit/
 +F:	include/dt-bindings/reset/spacemit,k3-resets.h
 +
  SPANISH DOCUMENTATION
  M:	Carlos Bilbao <carlos.bilbao@kernel.org>
 -R:	Avadhut Naik <avadhut.naik@amd.com>
  S:	Maintained
  F:	Documentation/translations/sp_SP/
 =20
@@@ -26629,7 -25841,6 +26622,7 @@@ F:	tools/spi
 =20
  SPMI SUBSYSTEM
  M:	Stephen Boyd <sboyd@kernel.org>
 +M:	Abel Vesa <abelvesa@kernel.org>
  L:	linux-kernel@vger.kernel.org
  S:	Maintained
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git
@@@ -26997,22 -26208,6 +26990,22 @@@ S:	Supporte
  F:	Documentation/devicetree/bindings/interrupt-controller/starfive,jhb100=
-intc.yaml
  F:	drivers/irqchip/irq-starfive-jhb100-intc.c
 =20
 +STARFIVE JHB100 PINCTRL DRIVERS
 +M:	Changhuang Liang <changhuang.liang@starfivetech.com>
 +M:	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
 +L:	linux-gpio@vger.kernel.org
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/pinctrl/starfive,jhb1*.yaml
 +F:	drivers/pinctrl/starfive/pinctrl-starfive-jhb1*
 +
 +STARFIVE JHB100 PWM FAN DRIVER
 +M:	Changhuang Liang <changhuang.liang@starfivetech.com>
 +L:	linux-hwmon@vger.kernel.org
 +S:	Supported
 +F:	Documentation/devicetree/bindings/hwmon/starfive,jhb100-pwm-fan.yaml
 +F:	Documentation/hwmon/starfive-pwm-fan.rst
 +F:	drivers/hwmon/starfive-pwm-fan.c
 +
  STATIC BRANCH/CALL
  M:	Peter Zijlstra <peterz@infradead.org>
  M:	Josh Poimboeuf <jpoimboe@kernel.org>
@@@ -27033,15 -26228,6 +27026,15 @@@ F:	rust/helpers/jump_label.
  F:	rust/kernel/generated_arch_static_branch_asm.rs.S
  F:	rust/kernel/jump_label.rs
 =20
 +STEAL GOVERNOR DRIVER
 +M:	Shrikanth Hegde <sshegde@linux.ibm.com>
 +R:	Yury Norov <yury.norov@gmail.com>
 +L:	linux-kernel@vger.kernel.org
 +S:	Maintained
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/co=
re
 +F:	Documentation/driver-api/steal-governor.rst
 +F:	drivers/virt/steal_governor.c
 +
  STI AUDIO (ASoC) DRIVERS
  M:	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
  L:	linux-sound@vger.kernel.org
@@@ -27342,8 -26528,6 +27335,8 @@@ F:	drivers/net/ethernet/synopsys
  SYNOPSYS DESIGNWARE ETHERNET XPCS DRIVER
  L:	netdev@vger.kernel.org
  S:	Orphan
 +F:	Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml
 +F:	drivers/net/pcs/pcs-xpcs-plat.c
  F:	drivers/net/pcs/pcs-xpcs.c
  F:	drivers/net/pcs/pcs-xpcs.h
  F:	include/linux/pcs/pcs-xpcs.h
@@@ -27374,7 -26558,6 +27367,7 @@@ F:	include/linux/soc/amd/isp4_misc.
 =20
  SYNOPSYS DESIGNWARE MIPI CSI-2 RECEIVER DRIVER
  M:	Michael Riesch <michael.riesch@collabora.com>
 +R:	Bryan O'Donoghue <bod@kernel.org>
  L:	linux-media@vger.kernel.org
  S:	Maintained
  F:	Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
@@@ -27412,7 -26595,7 +27405,7 @@@ SYSTEM CONFIGURATION (SYSCON
  M:	Lee Jones <lee@kernel.org>
  M:	Arnd Bergmann <arnd@arndb.de>
  S:	Supported
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-=
next
  F:	drivers/mfd/syscon.c
 =20
  SYSTEM CONTROL & POWER/MANAGEMENT INTERFACE (SCPI/SCMI) Message Protocol =
drivers
@@@ -27432,7 -26615,6 +27425,7 @@@ F:	drivers/pmdomain/arm
  F:	drivers/powercap/arm_scmi_powercap.c
  F:	drivers/regulator/scmi-regulator.c
  F:	drivers/reset/reset-scmi.c
 +F:	include/linux/device-id/scmi.h
  F:	include/linux/sc[mp]i_protocol.h
  F:	include/trace/events/scmi.h
  F:	include/uapi/linux/virtio_scmi.h
@@@ -27584,13 -26766,6 +27577,13 @@@ W:	https://linuxtv.or
  T:	git git://linuxtv.org/media.git
  F:	drivers/media/i2c/tda9840*
 =20
 +TDK FS1412 AND FS1525 MICRO POL DRIVER
 +M:	Abdurrahman Hussain <abdurrahman@nexthop.ai>
 +L:	linux-hwmon@vger.kernel.org
 +S:	Maintained
 +F:	Documentation/hwmon/fs1412.rst
 +F:	drivers/hwmon/pmbus/fs1412.c
 +
  TEA5761 TUNER DRIVER
  M:	Mauro Carvalho Chehab <mchehab@kernel.org>
  L:	linux-media@vger.kernel.org
@@@ -27641,6 -26816,11 +27634,6 @@@ S:	Maintaine
  F:	Documentation/process/contribution-maturity-model.rst
  F:	Documentation/process/researcher-guidelines.rst
 =20
 -TECHNOLOGIC SYSTEMS TS-5500 PLATFORM SUPPORT
 -M:	"Savoir-faire Linux Inc." <kernel@savoirfairelinux.com>
 -S:	Maintained
 -F:	arch/x86/platform/ts5500/
 -
  TECHNOTREND USB IR RECEIVER
  M:	Sean Young <sean@mess.org>
  L:	linux-media@vger.kernel.org
@@@ -27756,11 -26936,9 +27749,11 @@@ M:	Luca Ceresoli <luca.ceresoli@bootlin
  L:	linux-media@vger.kernel.org
  L:	linux-tegra@vger.kernel.org
  S:	Maintained
 +F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
  F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.=
yaml
  F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
  F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
 +F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.ya=
ml
  F:	drivers/staging/media/tegra-video/
 =20
  TEGRA XUSB PADCTL DRIVER
@@@ -27781,7 -26959,8 +27774,7 @@@ S:	Maintaine
  F:	drivers/net/ethernet/tehuti/tn40*
 =20
  TELECOM CLOCK DRIVER FOR MCPL0010
 -M:	Mark Gross <markgross@kernel.org>
 -S:	Supported
 +S:	Orphan
  F:	drivers/char/tlclk.c
 =20
  TEMPO SEMICONDUCTOR DRIVERS
@@@ -27845,7 -27024,7 +27838,7 @@@ TEXAS INSTRUMENTS DMA DRIVER
  M:	Vignesh Raghavendra <vigneshr@ti.com>
  L:	dmaengine@vger.kernel.org
  S:	Maintained
 -F:	Documentation/devicetree/bindings/dma/ti-dma-crossbar.txt
 +F:	Documentation/devicetree/bindings/dma/ti,dra7-dma-crossbar.yaml
  F:	Documentation/devicetree/bindings/dma/ti-edma.txt
  F:	Documentation/devicetree/bindings/dma/ti/
  F:	drivers/dma/ti/
@@@ -28070,19 -27249,11 +28063,19 @@@ S:	Maintaine
  F:	Documentation/devicetree/bindings/iio/adc/ti,ads1119.yaml
  F:	drivers/iio/adc/ti-ads1119.c
 =20
 +TI ADS112C04 ADC DRIVER
 +M:	Kyle Hsieh <kylehsieh1995@gmail.com>
 +L:	linux-iio@vger.kernel.org
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml
 +F:	drivers/iio/adc/ti-ads112c04.c
 +
  TI ADS112C14 ADC DRIVER
  M:	David Lechner <dlechner@baylibre.com>
  L:	linux-iio@vger.kernel.org
  S:	Maintained
  F:	Documentation/devicetree/bindings/iio/adc/ti,ads112c14.yaml
 +F:	Documentation/iio/ads112c14.rst
  F:	drivers/iio/adc/ti-ads112c14.c
 =20
  TI ADS1018 ADC DRIVER
@@@ -28092,13 -27263,6 +28085,13 @@@ S:	Maintaine
  F:	Documentation/devicetree/bindings/iio/adc/ti,ads1018.yaml
  F:	drivers/iio/adc/ti-ads1018.c
 =20
 +TI ADS1262 ADC DRIVER
 +M:	Kurt Borja <kuurtb@gmail.com>
 +L:	linux-iio@vger.kernel.org
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/iio/adc/ti,ads1262.yaml
 +F:	drivers/iio/adc/ti-ads1262.c
 +
  TI ADS7924 ADC DRIVER
  M:	Hugo Villeneuve <hvilleneuve@dimonoff.com>
  L:	linux-iio@vger.kernel.org
@@@ -28357,8 -27521,8 +28350,8 @@@ F:	drivers/media/platform/ti/vpe
  TI WILINK WIRELESS DRIVERS
  L:	linux-wireless@vger.kernel.org
  S:	Orphan
 -W:	https://wireless.wiki.kernel.org/en/users/Drivers/wl12xx
 -W:	https://wireless.wiki.kernel.org/en/users/Drivers/wl1251
 +W:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/wl12xx.html
 +W:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/wl1251.html
  F:	drivers/net/wireless/ti/
 =20
  TIMEKEEPING, CLOCKSOURCE CORE, NTP, ALARMTIMER
@@@ -28422,6 -27586,17 +28415,6 @@@ S:	Maintaine
  F:	Documentation/hwmon/tmp513.rst
  F:	drivers/hwmon/tmp513.c
 =20
 -TMPFS (SHMEM FILESYSTEM)
 -M:	Hugh Dickins <hughd@google.com>
 -R:	Baolin Wang <baolin.wang@linux.alibaba.com>
 -L:	linux-mm@kvack.org
 -S:	Maintained
 -F:	include/linux/memfd.h
 -F:	include/linux/shmem_fs.h
 -F:	mm/memfd.c
 -F:	mm/shmem.c
 -F:	mm/shmem_quota.c
 -
  TOMOYO SECURITY MODULE
  M:	Kentaro Takeda <takedakn@nttdata.co.jp>
  M:	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
@@@ -28494,17 -27669,10 +28487,17 @@@ TOSHIBA TC358743 DRIVE
  M:	Hans Verkuil <hverkuil@kernel.org>
  L:	linux-media@vger.kernel.org
  S:	Maintained
 -F:	Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.txt
 +F:	Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.yaml
  F:	drivers/media/i2c/tc358743*
  F:	include/media/i2c/tc358743.h
 =20
 +TOSHIBA TC9564 PCI DRIVER
 +M:	Alex Elder <elder@kernel.org>
 +M:	Daniel Thompson <danielt@kernel.org>
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/misc/pci1179,0220.yaml
 +F:	drivers/misc/tc9564-pci.c
 +
  TOSHIBA WMI HOTKEYS DRIVER
  M:	Azael Avalos <coproscefalo@gmail.com>
  L:	platform-driver-x86@vger.kernel.org
@@@ -28615,22 -27783,6 +28608,22 @@@ F:	kernel/trace/trace_irqsoff.
  F:	kernel/trace/trace_osnoise.c
  F:	kernel/trace/trace_sched_wakeup.c
 =20
 +TRACING RING BUFFER
 +M:	Steven Rostedt <rostedt@goodmis.org>
 +M:	Vincent Donnefort <vdonnefort@google.com>
 +M:	Masami Hiramatsu <mhiramat@kernel.org>
 +L:	linux-kernel@vger.kernel.org
 +L:	linux-trace-kernel@vger.kernel.org
 +S:	Maintained
 +Q:	https://patchwork.kernel.org/project/linux-trace-kernel/list/
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
 +F:	Documentation/trace/ring-buffer*
 +F:	Documentation/trace/remotes.rst
 +F:	include/linux/ring-buffer*.h
 +F:	kernel/trace/*ring_buffer*.c
 +F:	kernel/trace/remote*.c
 +F:	tools/testing/selftests/ring-buffer/
 +
  TRADITIONAL CHINESE DOCUMENTATION
  M:	Chen-Yu Yeh <chenyou910331@gmail.com>
  M:	Weijie Yuan <wy@wyuan.org>
@@@ -28644,10 -27796,7 +28637,10 @@@ S:	Maintaine
  F:	Documentation/devicetree/bindings/trigger-source/*
 =20
  TRUSTED EXECUTION ENVIRONMENT SECURITY MANAGER (TSM)
 -M:	Dan Williams <djbw@kernel.org>
 +M:	Alexey Kardashevskiy <aik@amd.com>
 +M:	Aneesh Kumar K.V <aneesh.kumar@kernel.org>
 +M:	Jason Gunthorpe <jgg@nvidia.com>
 +R:	Lukas Wunner <lukas@wunner.de>
  L:	linux-coco@lists.linux.dev
  S:	Maintained
  F:	Documentation/ABI/testing/configfs-tsm-report
@@@ -28730,7 -27879,6 +28723,7 @@@ F:	tools/testing/selftests/turbostat
 =20
  TUXEDO DRIVERS
  M:	Werner Sembach <wse@tuxedocomputers.com>
 +M:	Aaron Erhardt <aer@tuxedocomputers.com>
  L:	platform-driver-x86@vger.kernel.org
  S:	Supported
  F:	drivers/platform/x86/tuxedo/
@@@ -28861,12 -28009,6 +28854,12 @@@ F:	Documentation/devicetree/bindings/cl
  F:	drivers/clk/ultrarisc/*
  F:	include/dt-bindings/clock/ultrarisc,dp1000-clk.h
 =20
 +ULTRARISC DP1000 DWMAC GLUE LAYER
 +M:	Jia Wang <wangjia@ultrarisc.com>
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/net/ultrarisc,dp1000-gmac.yaml
 +F:	drivers/net/ethernet/stmicro/stmmac/dwmac-ultrarisc.c
 +
  ULTRARISC DP1000 PINCTRL DRIVER
  M:	Jia Wang <wangjia@ultrarisc.com>
  L:	linux-gpio@vger.kernel.org
@@@ -28913,9 -28055,8 +28906,9 @@@ F:	lib/union_find.
 =20
  UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER
  R:	Alim Akhtar <alim.akhtar@samsung.com>
 -R:	Avri Altman <avri.altman@wdc.com>
  R:	Bart Van Assche <bvanassche@acm.org>
 +R:	Bean Huo <beanhuo@micron.com>
 +R:	Stanley Jhu <stanleyjhu@google.com>
  L:	linux-scsi@vger.kernel.org
  S:	Supported
  F:	Documentation/devicetree/bindings/ufs/
@@@ -28971,7 -28112,6 +28964,7 @@@ UNIWILL LAPTOP DRIVE
  M:	Armin Wolf <W_Armin@gmx.de>
  L:	platform-driver-x86@vger.kernel.org
  S:	Maintained
 +F:	Documentation/ABI/removed/sysfs-driver-uniwill-laptop
  F:	Documentation/ABI/testing/sysfs-driver-uniwill-laptop
  F:	Documentation/admin-guide/laptops/uniwill-laptop.rst
  F:	Documentation/wmi/devices/uniwill-laptop.rst
@@@ -29069,28 -28209,6 +29062,28 @@@ S:	Maintaine
  F:	Documentation/usb/ehci.rst
  F:	drivers/usb/host/ehci*
 =20
 +USB GADGET/PERIPHERAL SUBSYSTEM
 +M:	Neill Kapron <nkapron@google.com>
 +L:	linux-usb@vger.kernel.org
 +S:	Supported
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
 +F:	Documentation/ABI/testing/configfs-usb-gadget*
 +F:	Documentation/ABI/testing/sysfs-devices-platform-_UDC_-gadget
 +F:	Documentation/driver-api/usb/gadget.rst
 +F:	Documentation/usb/functionfs*
 +F:	Documentation/usb/gadget*
 +F:	Documentation/usb/mass-storage.rst
 +F:	drivers/usb/gadget/
 +F:	include/linux/usb/composite.h
 +F:	include/linux/usb/func_utils.h
 +F:	include/linux/usb/functionfs.h
 +F:	include/linux/usb/g_hid.h
 +F:	include/linux/usb/gadget*
 +F:	include/uapi/linux/usb/functionfs.h
 +F:	include/uapi/linux/usb/g_*.h
 +F:	include/uapi/linux/usb/gadgetfs.h
 +F:	tools/usb/ffs-*
 +
  USB HID/HIDBP DRIVERS (USB KEYBOARDS, MICE, REMOTE CONTROLS, ...)
  M:	Jiri Kosina <jikos@kernel.org>
  M:	Benjamin Tissoires <bentiss@kernel.org>
@@@ -29503,6 -28621,7 +29496,6 @@@ L:	iommu@lists.linux.de
  S:	Maintained
  F:	Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml
  F:	drivers/iommu/vsi-iommu.c
 -F:	include/linux/vsi-iommu.h
 =20
  VF610 NAND DRIVER
  M:	Stefan Agner <stefan@agner.ch>
@@@ -29613,7 -28732,6 +29606,7 @@@ VFIO SELFTEST
  M:	David Matlack <dmatlack@google.com>
  L:	kvm@vger.kernel.org
  S:	Maintained
 +F:	Documentation/driver-api/vfio-selftests.rst
  F:	tools/testing/selftests/vfio/
 =20
  VFIO VIRTIO PCI DRIVER
@@@ -29712,7 -28830,6 +29705,7 @@@ F:	virt/lib
  VIRTIO AND VHOST VSOCK DRIVER
  M:	Stefan Hajnoczi <stefanha@redhat.com>
  M:	Stefano Garzarella <sgarzare@redhat.com>
 +R:	Bobby Eshleman <bobbyeshleman@meta.com>
  L:	kvm@vger.kernel.org
  L:	virtualization@lists.linux.dev
  L:	netdev@vger.kernel.org
@@@ -29764,8 -28881,8 +29757,8 @@@ F:	include/uapi/linux/virtio_console.
  VIRTIO CORE
  M:	"Michael S. Tsirkin" <mst@redhat.com>
  M:	Jason Wang <jasowangio@gmail.com>
 +M:	Eugenio P=C3=A9rez <eperezma@redhat.com>
  R:	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
 -R:	Eugenio P=C3=A9rez <eperezma@redhat.com>
  L:	virtualization@lists.linux.dev
  S:	Maintained
  F:	Documentation/ABI/testing/sysfs-bus-vdpa
@@@ -29776,12 -28893,9 +29769,12 @@@ F:	drivers/block/virtio_blk.
  F:	drivers/crypto/virtio/
  F:	drivers/vdpa/
  F:	drivers/virtio/
 +F:	include/linux/device-id/virtio.h
  F:	include/linux/vdpa.h
  F:	include/linux/virtio*.h
  F:	include/linux/vringh.h
 +F:	include/uapi/linux/vdpa.h
 +F:	include/uapi/linux/vduse.h
  F:	include/uapi/linux/virtio_*.h
  F:	net/vmw_vsock/virtio*
  F:	tools/virtio/
@@@ -29845,7 -28959,7 +29838,7 @@@ F:	include/uapi/linux/virtio_gpu.
  VIRTIO HOST (VHOST)
  M:	"Michael S. Tsirkin" <mst@redhat.com>
  M:	Jason Wang <jasowangio@gmail.com>
 -R:	Eugenio P=C3=A9rez <eperezma@redhat.com>
 +M:	Eugenio P=C3=A9rez <eperezma@redhat.com>
  L:	kvm@vger.kernel.org
  L:	virtualization@lists.linux.dev
  L:	netdev@vger.kernel.org
@@@ -29855,7 -28969,6 +29848,7 @@@ F:	drivers/vhost
  F:	include/linux/sched/vhost_task.h
  F:	include/linux/vhost_iotlb.h
  F:	include/uapi/linux/vhost.h
 +F:	include/uapi/linux/vhost_types.h
  F:	kernel/vhost_task.c
 =20
  VIRTIO HOST (VHOST-SCSI)
@@@ -29901,8 -29014,8 +29894,8 @@@ F:	include/uapi/linux/virtio_mem.
  VIRTIO NET DRIVER
  M:	"Michael S. Tsirkin" <mst@redhat.com>
  M:	Jason Wang <jasowangio@gmail.com>
 +M:	Eugenio P=C3=A9rez <eperezma@redhat.com>
  R:	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
 -R:	Eugenio P=C3=A9rez <eperezma@redhat.com>
  L:	netdev@vger.kernel.org
  L:	virtualization@lists.linux.dev
  S:	Maintained
@@@ -29918,13 -29031,6 +29911,13 @@@ S:	Maintaine
  F:	drivers/nvdimm/nd_virtio.c
  F:	drivers/nvdimm/virtio_pmem.c
 =20
 +VIRTIO RNG DRIVER
 +M:	Laurent Vivier <lvivier@redhat.com>
 +L:	virtualization@lists.linux.dev
 +S:	Maintained
 +F:	drivers/char/hw_random/virtio-rng.c
 +F:	include/uapi/linux/virtio_rng.h
 +
  VIRTIO RTC DRIVER
  M:	Peter Hilber <peter.hilber@oss.qualcomm.com>
  L:	virtualization@lists.linux.dev
@@@ -29977,12 -29083,6 +29970,12 @@@ S:	Maintaine
  F:	drivers/input/serio/userio.c
  F:	include/uapi/linux/userio.h
 =20
 +VISHAY VCNL36829 PROXIMITY SENSOR DRIVER
 +M:	Liu Yufei <lyf98405@gmail.com>
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/iio/proximity/vishay,vcnl36829.yaml
 +F:	drivers/iio/proximity/vcnl36829.c
 +
  VISHAY VEML3235 AMBIENT LIGHT SENSOR DRIVER
  M:	Javier Carrasco <javier.carrasco.cruz@gmail.com>
  S:	Maintained
@@@ -29990,7 -29090,7 +29983,7 @@@ F:	Documentation/devicetree/bindings/ii
  F:	drivers/iio/light/veml3235.c
 =20
  VISHAY VEML3328 RGB IR LIGHT SENSOR DRIVER
 -M:	Joshua Crofts <joshua.crofts1@gmail.com>
 +M:	Joshua Crofts <crofts@kernel.org>
  S:	Maintained
  F:	drivers/iio/light/veml3328.c
 =20
@@@ -30000,12 -29100,6 +29993,12 @@@ S:	Maintaine
  F:	Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml
  F:	drivers/iio/light/veml6030.c
 =20
 +VISHAY VEML6031X00 AMBIENT LIGHT SENSOR DRIVER
 +M:	Javier Carrasco <javier.carrasco.cruz@gmail.com>
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/iio/light/vishay,veml6030.yaml
 +F:	drivers/iio/light/veml6031x00.c
 +
  VISHAY VEML6046X00 RGBIR COLOR SENSOR DRIVER
  M:	Andreas Klinger <ak@it-klinger.de>
  S:	Maintained
@@@ -30034,7 -29128,6 +30027,7 @@@ F:	drivers/media/test-drivers/vivid/
 =20
  VM SOCKETS (AF_VSOCK)
  M:	Stefano Garzarella <sgarzare@redhat.com>
 +R:	Bobby Eshleman <bobbyeshleman@meta.com>
  L:	virtualization@lists.linux.dev
  L:	netdev@vger.kernel.org
  S:	Maintained
@@@ -30047,6 -29140,25 +30040,6 @@@ F:	net/vmw_vsock
  F:	tools/testing/selftests/vsock/
  F:	tools/testing/vsock/
 =20
 -VMALLOC
 -M:	Andrew Morton <akpm@linux-foundation.org>
 -M:	Uladzislau Rezki <urezki@gmail.com>
 -L:	linux-mm@kvack.org
 -S:	Maintained
 -W:	http://www.linux-mm.org
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 -F:	include/linux/vmalloc.h
 -F:	mm/vmalloc.c
 -F:	mm/vmalloc.h
 -F:	lib/test_vmalloc.c
 -
 -VME SUBSYSTEM
 -L:	linux-kernel@vger.kernel.org
 -S:	Orphan
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git
 -F:	Documentation/driver-api/vme.rst
 -F:	drivers/staging/vme_user/
 -
  VMWARE BALLOON DRIVER
  M:	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>
  R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadco=
m.com>
@@@ -30161,7 -29273,6 +30154,7 @@@ M:	Steven Rostedt <rostedt@goodmis.org
  R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  R:	Rasmus Villemoes <linux@rasmusvillemoes.dk>
  R:	Sergey Senozhatsky <senozhatsky@chromium.org>
 +L:	printk@lists.linux.dev
  S:	Maintained
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git
  F:	Documentation/core-api/printk-formats.rst
@@@ -30190,6 -29301,11 +30183,6 @@@ L:	linux-hwmon@vger.kernel.or
  S:	Maintained
  F:	drivers/hwmon/vt8231.c
 =20
 -VUB300 USB to SDIO/SD/MMC bridge chip
 -L:	linux-mmc@vger.kernel.org
 -S:	Orphan
 -F:	drivers/mmc/host/vub300.c
 -
  W1 DALLAS'S 1-WIRE BUS
  M:	Krzysztof Kozlowski <krzk@kernel.org>
  S:	Maintained
@@@ -30246,7 -29362,7 +30239,7 @@@ M:	Guenter Roeck <linux@roeck-us.net
  L:	linux-watchdog@vger.kernel.org
  S:	Maintained
  W:	http://www.linux-watchdog.org/
 -T:	git git://www.linux-watchdog.org/linux-watchdog.git
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging=
=2Egit
  F:	Documentation/devicetree/bindings/watchdog/
  F:	Documentation/watchdog/
  F:	drivers/watchdog/
@@@ -30283,7 -29399,7 +30276,7 @@@ F:	drivers/hid/hid-wiimote
  WILOCITY WIL6210 WIRELESS DRIVER
  L:	linux-wireless@vger.kernel.org
  S:	Orphan
 -W:	https://wireless.wiki.kernel.org/en/users/Drivers/wil6210
 +W:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/wil6210.ht=
ml
  F:	drivers/net/wireless/ath/wil6210/
 =20
  WINBOND CIR DRIVER
@@@ -30322,13 -29438,6 +30315,13 @@@ M:	Miloslav Trmac <mitr@volny.cz
  S:	Maintained
  F:	drivers/input/misc/wistron_btns.c
 =20
 +WIZNET W5100 ETHERNET DRIVER
 +M:	Arthur Crepin Leblond <arthur@marmottus.net>
 +L:	netdev@vger.kernel.org
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/net/wiznet,w5100.yaml
 +F:	drivers/net/ethernet/wiznet/
 +
  WMI BINARY MOF DRIVER
  M:	Armin Wolf <W_Armin@gmx.de>
  R:	Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
@@@ -30336,7 -29445,7 +30329,7 @@@ L:	platform-driver-x86@vger.kernel.or
  S:	Maintained
  F:	Documentation/ABI/stable/sysfs-platform-wmi-bmof
  F:	Documentation/wmi/devices/wmi-bmof.rst
 -F:	drivers/platform/x86/wmi-bmof.c
 +F:	drivers/platform/wmi/bmof.c
 =20
  WOLFSON MICROELECTRONICS DRIVERS
  L:	patches@opensource.cirrus.com
@@@ -30400,14 -29509,6 +30393,14 @@@ F:	drivers/net/wwan
  F:	include/linux/wwan.h
  F:	include/uapi/linux/wwan.h
 =20
 +X-POWERS AC200 DRIVERS
 +M:	Jernej Skrabec <jernej.skrabec@gmail.com>
 +M:	James Hilliard <james.hilliard1@gmail.com>
 +L:	linux-sunxi@lists.linux.dev
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
 +F:	drivers/mfd/ac200.c
 +
  X-POWERS AXP288 PMIC DRIVERS
  M:	Hans de Goede <hansg@kernel.org>
  S:	Maintained
@@@ -30461,15 -29562,6 +30454,15 @@@ W:	https://x86-cpuid.or
  F:	arch/x86/include/asm/cpuid/leaf_types.h
  F:	tools/arch/x86/kcpuid/
 =20
 +X86 ENERGY PERF POLICY UTILITY
 +M:	Len Brown <lenb@kernel.org>
 +L:	linux-pm@vger.kernel.org
 +S:	Supported
 +Q:	https://patchwork.kernel.org/project/linux-pm/list/
 +B:	https://bugzilla.kernel.org
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/lenb/linux.git x86_e=
nergy_perf_policy
 +F:	tools/power/x86/x86_energy_perf_policy/
 +
  X86 ENTRY CODE
  M:	Andy Lutomirski <luto@kernel.org>
  L:	linux-kernel@vger.kernel.org
@@@ -30595,18 -29687,6 +30588,18 @@@ C:	https://rust-for-linux.zulipchat.co
  T:	git https://github.com/Rust-for-Linux/linux.git xarray-next
  F:	rust/kernel/xarray.rs
 =20
 +XARRAY [RUST]
 +M:	Daniel Gomez <da.gomez@kernel.org>
 +M:	Matthew Wilcox <willy@infradead.org>
 +R:	Andreas Hindborg <a.hindborg@kernel.org>
 +L:	rust-for-linux@vger.kernel.org
 +S:	Supported
 +W:	https://rust-for-linux.com
 +B:	https://github.com/Rust-for-Linux/linux/issues
 +C:	https://rust-for-linux.zulipchat.com
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/da.gomez/linux.git r=
xarray-next
 +F:	rust/kernel/rxarray.rs
 +
  XBOX DVD IR REMOTE
  M:	Benjamin Valentin <benpicco@googlemail.com>
  S:	Maintained
@@@ -30838,16 -29918,6 +30831,16 @@@ F:	Documentation/misc-devices/xilinx_sd
  F:	drivers/misc/xilinx_sdfec.c
  F:	include/uapi/misc/xilinx_sdfec.h
 =20
 +XILINX SMMU CSR IRQ DRIVER
 +M:	Anirudha Sarangi <anirudha.sarangi@amd.com>
 +M:	Tushar Nimkar <tushar.nimkar@amd.com>
 +L:	git@amd.com
 +L:	linux-arm-kernel@lists.infradead.org
 +L:	linux-kernel@vger.kernel.org
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/interrupt-controller/xlnx,versal-net=
-smmu-csr.yaml
 +F:	drivers/irqchip/irq-xilinx-smmu-csr.c
 +
  XILINX TRNG DRIVER
  M:	Mounika Botcha <mounika.botcha@amd.com>
  M:	Harsh Jain <h.jain@amd.com>
@@@ -30872,14 -29942,12 +30865,14 @@@ F:	include/uapi/linux/xilinx-v4l2-con=
tr
  XILINX VERSAL EDAC DRIVER
  M:	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
  M:	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
 +R:	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
  S:	Maintained
  F:	Documentation/devicetree/bindings/memory-controllers/xlnx,versal-ddrmc=
-edac.yaml
  F:	drivers/edac/versal_edac.c
 =20
  XILINX VERSALNET EDAC DRIVER
  M:	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
 +R:	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
  S:	Maintained
  F:	Documentation/devicetree/bindings/memory-controllers/xlnx,versal-net-d=
drmc5.yaml
  F:	drivers/edac/versalnet_edac.c
@@@ -30925,7 -29993,6 +30918,7 @@@ F:	include/dt-bindings/dma/xlnx-zynqmp-
  XILINX ZYNQMP OCM EDAC DRIVER
  M:	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
  M:	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
 +R:	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
  S:	Maintained
  F:	Documentation/devicetree/bindings/memory-controllers/xlnx,zynqmp-ocmc-=
1.0.yaml
  F:	drivers/edac/zynqmp_edac.c
@@@ -31081,6 -30148,16 +31074,6 @@@ M:	"Maciej W. Rozycki" <macro@orcam.me.
  S:	Maintained
  F:	drivers/tty/serial/zs.*
 =20
 -ZSMALLOC COMPRESSED SLAB MEMORY ALLOCATOR
 -M:	Minchan Kim <minchan@kernel.org>
 -M:	Sergey Senozhatsky <senozhatsky@chromium.org>
 -L:	linux-mm@kvack.org
 -S:	Maintained
 -F:	Documentation/mm/zsmalloc.rst
 -F:	include/linux/zsmalloc.h
 -F:	mm/zpdesc.h
 -F:	mm/zsmalloc.c
 -
  ZSTD
  M:	Nick Terrell <terrelln@fb.com>
  M:	David Sterba <dsterba@suse.com>
@@@ -31094,14 -30171,23 +31087,14 @@@ F:	lib/zstd
  N:	zstd
  K:	zstd
 =20
 -ZSWAP COMPRESSED SWAP CACHING
 -M:	Johannes Weiner <hannes@cmpxchg.org>
 -M:	Yosry Ahmed <yosry@kernel.org>
 -M:	Nhat Pham <nphamcs@gmail.com>
 -R:	Chengming Zhou <chengming.zhou@linux.dev>
 -L:	linux-mm@kvack.org
 -S:	Maintained
 -F:	Documentation/admin-guide/mm/zswap.rst
 -F:	include/linux/zswap.h
 -F:	mm/zswap.c
 -F:	tools/testing/selftests/cgroup/test_zswap.c
 -
  SENARYTECH AUDIO CODEC DRIVER
  M:	bo liu <bo.liu@senarytech.com>
 +M:	qianghua.wang <qianghua.wang@senarytech.com>
  S:	Maintained
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
  F:	sound/hda/codecs/senarytech.c
 +F:	sound/soc/codecs/sn624x*
 +F:	sound/soc/sdw_utils/soc_sdw_senary*
 =20
  ZTE DINGHAI ETHERNET DRIVER
  M:	Junyang Han <han.junyang@zte.com.cn>

--eWA+cYHEmGO8rOAR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrp7y8ACgkQJNaLcl1U
h9DCJAf+OO1GL4ANFJE20WCOuZM3RHAMUVM90uGlgv2fa9gXnapPrXHEf5wpB2vP
1U8f5B+T63GgCj46SqF0iNoS2m4bcpoM05t93NmXDNW5AtH7LFER6FkKCYjDHQO0
NVLyhfwnPRNjw/NrN7BxBkTgUqBGX7bA84Y4VTZ0s0aA3AkNEuDpEPXZ57R5WoKy
JAIzHULCsAeDaweX43mY7pTJDJsBQ57aM8PNsB+VGmgYTiRKG6J91JhQXA8uZVHp
+2bxLQUKvW8OreRJDRaFsChskIl37+A/Yg3rj97bSflXCHlrrZX9CCapJo/cEUK0
ogtfLiYa+QTvNY+hu9G9o2vmL/oObg==
=lnj6
-----END PGP SIGNATURE-----

--eWA+cYHEmGO8rOAR--
