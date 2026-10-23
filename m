Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768258;
	b=10Rf6e9EHuAmNSb72cjjureSRSikfA/HT2OxxfrD1Ov9tMGmNm4ijnSqfGAIsNo9uPTI
	 iSf1CNo92Z1EUgHhm3nLHmAPLc7AfgqOxtYv1Z6RWdC9Aph5YqESXM7OCfGOnp4QzcUW2
	 ndCRxSlWPzDLREc8td3d8RGBerw5w3a5bKW94Gs9u1mzJKDApoo0TtbTSLf2ii0QUjBBN
	 l01OcQpT2QWVd8LK6zfva6J2j60YLuIPmscYwo3/8iHOX4d+YzbbPb1u1j99UBq6dfK9I
	 7B1ufHrMrk+PHw8LQffYcdwhZsITBRKIvtKt847/K5reOS8gSL68CA6Nx2Uw42Wf3Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768258;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=yIj0P9esJtpMHcCiqZj9a8cEI8P3bW/BUeScj+G/V6Y=;
	b=UPepVk+aI2dQ+9cHznpwlivVJgWtwhTzKVsKFT1k4sozW0/cUulPuLa/YtIAwDr51pof
	 i1jcP5eScM0ooH0QT1TYVxwawulepeU28XGl3m3L4XIVYq0gtCJty+be/cBQ/3KKkpCYL
	 Zo4k8S3C3R/shbW0V+DC1pNZPjImLX+Hu04KFkKq8CrNhrmuEZpdLd/ok13IFjrZShG9k
	 Baa7a3BcpVG9WIAcUcAN5yhThzlx60asb16reBWVD20uLYrB9P8RVTGLfX09+dvivJnKy
	 ndWdelhtZDrKtEj8Gu2mL7QXZ6n/WqcBLZuFrXVNd0jwAsMQaniDDBQSq1uy2xNBpWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Aq2LvWm1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FF1606A329;
	Fri, 23 Oct 2026 15:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Aq2LvWm1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C5A1F01181;
	Fri, 23 Oct 2026 15:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792768256;
	bh=yIj0P9esJtpMHcCiqZj9a8cEI8P3bW/BUeScj+G/V6Y=;
	h=Date:From:To:Cc:Subject;
	b=Aq2LvWm1Ah2c6ioYpe3xgNNwurfo59+v5cHbfROwY0DyylASyPtO+mu4GjcVJGKNW
	 uUCCd82zxLE8Jaiq8CIeV6155pfIkEBtv4OctaLPHsPnw3xskSeQbthR2Uq4rDYLyV
	 ZBmL8Z8E4yItL07fbB3Tat1e36Mtx4qE5CrFUyzeK7ok7HMR9wU0kXFBzmLmo19mRr
	 Ddj07HdCJHHvYrSVzB3D/PxZmzDeXEDZ9tWvnu4dz0C63WDy0Ef0AUn6lm4CU45T6h
	 vXctRCO4ANrdpFY5T0vCMkFMIKhH8I/GizeObc2ETM6/EMzK/qFK/QY2Bd+GctoZ5G
	 sX/kraCaJR5vg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id ADDB51AC5994; Fri, 23 Oct 2026 16:10:53 +0100 (BST)
Date: Fri, 23 Oct 2026 16:10:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the hmm tree with the origin tree
Message-ID: <att4_ahsvKhi4PXD@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="96++dKwjPkuXJw34"
Content-Disposition: inline


--96++dKwjPkuXJw34
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the hmm tree got a conflict in:

  MAINTAINERS

between commit:

  47193113641e5 ("coco/tsm: Update maintainership")

=66rom the origin tree and commit:

  c5277e5b71e39 ("coco/tsm: Update maintainership")

=66rom the hmm tree.

Alexey is in the origin version and not the hmm version for some
reason, the changelog looks the same for both...

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined MAINTAINERS
index e382ba1c76421,835a8a4edb8b1..0000000000000
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
@@@ -327,17 -327,6 +327,17 @@@ F:	drivers/acpi/acpica
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
@@@ -350,15 -339,6 +350,15 @@@ S:	Maintaine
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
@@@ -660,7 -640,6 +660,7 @@@ F:	drivers/iio/accel/adxl355_spi.
 =20
  ADXL367 THREE-AXIS DIGITAL ACCELEROMETER DRIVER
  M:	Marcelo Schmitt <marcelo.schmitt@analog.com>
 +M:	Antoniu Miclaus <antoniu.miclaus@analog.com>
  L:	linux-iio@vger.kernel.org
  S:	Supported
  W:	https://ez.analog.com/linux-software-drivers
@@@ -788,14 -767,6 +788,14 @@@ F:	Documentation/devicetree/bindings/ph
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
@@@ -1106,6 -1077,7 +1106,6 @@@ F:	include/linux/cdx/
 =20
  AMD CRYPTOGRAPHIC COPROCESSOR (CCP) DRIVER
  M:	Tom Lendacky <thomas.lendacky@amd.com>
 -M:	John Allen <john.allen@amd.com>
  L:	linux-crypto@vger.kernel.org
  S:	Supported
  F:	drivers/crypto/ccp/
@@@ -1209,8 -1181,8 +1209,8 @@@ F:	drivers/platform/x86/amd/hfi
 =20
  AMD IOMMU (AMD-VI)
  M:	Joerg Roedel (AMD) <joro@8bytes.org>
 +M:	Vasant Hegde <vasant.hegde@amd.com>
  R:	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
 -R:	Vasant Hegde <vasant.hegde@amd.com>
  L:	iommu@lists.linux.dev
  S:	Maintained
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
@@@ -1246,7 -1218,7 +1246,7 @@@ AMD KF
  M:	Felix Kuehling <Felix.Kuehling@amd.com>
  L:	amd-gfx@lists.freedesktop.org
  S:	Supported
 -T:	git https://gitlab.freedesktop.org/agd5f/linux.git
 +T:	git https://gitlab.freedesktop.org/drm/amdgpu/kernel.git
  F:	drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd*.[ch]
  F:	drivers/gpu/drm/amd/amdkfd/
  F:	drivers/gpu/drm/amd/include/cik_structs.h
@@@ -1350,7 -1322,6 +1350,7 @@@ AMD SENSOR FUSION HUB DRIVE
  M:	Basavaraj Natikar <basavaraj.natikar@amd.com>
  L:	linux-input@vger.kernel.org
  S:	Maintained
 +F:	Documentation/ABI/testing/sysfs-driver-amd-sfh
  F:	Documentation/hid/amd-sfh*
  F:	drivers/hid/amd-sfh-hid/
  F:	drivers/input/misc/amd_sfh_tabletmode.c
@@@ -1400,13 -1371,6 +1400,13 @@@ F:	Documentation/devicetree/bindings/pe
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
@@@ -1504,7 -1468,6 +1504,7 @@@ L:	linux-iio@vger.kernel.or
  S:	Supported
  W:	https://ez.analog.com/linux-software-drivers
  F:	Documentation/devicetree/bindings/iio/dac/adi,ad3530r.yaml
 +F:	Documentation/devicetree/bindings/iio/dac/adi,ad5710r.yaml
  F:	drivers/iio/dac/ad3530r.c
 =20
  ANALOG DEVICES INC AD3552R DRIVER
@@@ -1554,7 -1517,6 +1554,7 @@@ F:	drivers/iio/adc/ad4080.
 =20
  ANALOG DEVICES INC AD4130 DRIVER
  M:	Marcelo Schmitt <marcelo.schmitt@analog.com>
 +M:	Antoniu Miclaus <antoniu.miclaus@analog.com>
  L:	linux-iio@vger.kernel.org
  S:	Supported
  W:	https://ez.analog.com/linux-software-drivers
@@@ -1609,14 -1571,6 +1609,14 @@@ W:	https://ez.analog.com/linux-software
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
@@@ -1668,7 -1622,6 +1668,7 @@@ F:	drivers/iio/dac/ad7293.
 =20
  ANALOG DEVICES INC AD74115 DRIVER
  M:	Marcelo Schmitt <marcelo.schmitt@analog.com>
 +M:	Antoniu Miclaus <antoniu.miclaus@analog.com>
  L:	linux-iio@vger.kernel.org
  S:	Supported
  W:	https://ez.analog.com/linux-software-drivers
@@@ -1677,7 -1630,6 +1677,7 @@@ F:	drivers/iio/addac/ad74115.
 =20
  ANALOG DEVICES INC AD74413R DRIVER
  M:	Marcelo Schmitt <marcelo.schmitt@analog.com>
 +M:	Antoniu Miclaus <antoniu.miclaus@analog.com>
  L:	linux-iio@vger.kernel.org
  S:	Supported
  W:	https://ez.analog.com/linux-software-drivers
@@@ -1705,15 -1657,6 +1705,15 @@@ F:	Documentation/devicetree/bindings/ii
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
@@@ -1759,17 -1702,6 +1759,17 @@@ W:	https://ez.analog.com/linux-software
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
@@@ -2078,15 -2010,6 +2078,15 @@@ M:	Jiaxun Yang <jiaxun.yang@flygoat.com
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
@@@ -2153,7 -2076,8 +2153,7 @@@ S:	Supporte
  F:	arch/arm64/boot/dts/apm/
 =20
  APPLIED MICRO (APM) X-GENE SOC EDAC
 -M:	Khuong Dinh <khuong@os.amperecomputing.com>
 -S:	Supported
 +S:	Orphan
  F:	Documentation/devicetree/bindings/edac/apm,xgene-edac.yaml
  F:	drivers/edac/xgene_edac.c
 =20
@@@ -2253,7 -2177,7 +2253,7 @@@ F:	drivers/net/arcnet
  F:	include/uapi/linux/if_arcnet.h
 =20
  ARCTIC FAN CONTROLLER DRIVER
 -M:	Aureo Serrano de Souza <aureo.serrano@arctic.de>
 +M:	ARCTIC (HK) <arctic.it.hk@arctic.de>
  L:	linux-hwmon@vger.kernel.org
  S:	Maintained
  F:	Documentation/hwmon/arctic_fan_controller.rst
@@@ -2409,7 -2333,6 +2409,7 @@@ ARM MALI TYR DRM DRIVE
  M:	Daniel Almeida <daniel.almeida@collabora.com>
  M:	Alice Ryhl <aliceryhl@google.com>
  L:	dri-devel@lists.freedesktop.org
 +L:	rust-for-linux@vger.kernel.org
  S:	Supported
  W:	https://rust-for-linux.com/tyr-gpu-driver
  W:	https://drm.pages.freedesktop.org/maintainer-tools/drm-rust.html
@@@ -3089,7 -3012,7 +3089,7 @@@ F:	arch/arm/boot/dts/ti/omap/omap3-igep
 =20
  ARM/INTEL IXP4XX ARM ARCHITECTURE
  M:	Linus Walleij <linusw@kernel.org>
 -M:	Imre Kaloz <kaloz@openwrt.org>
 +M:	Imre Kaloz <kaloz@kernel.org>
  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
  S:	Maintained
  F:	Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml
@@@ -3291,7 -3214,6 +3291,7 @@@ M:	UNGLinuxDriver@microchip.co
  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
  S:	Supported
  F:	arch/arm64/boot/dts/microchip/sparx*
 +F:	drivers/net/ethernet/microchip/fdma/
  F:	drivers/net/ethernet/microchip/vcap/
  F:	drivers/pinctrl/pinctrl-microchip-sgpio.c
  N:	sparx5
@@@ -3351,7 -3273,6 +3351,7 @@@ F:	Documentation/devicetree/bindings/ar
  F:	Documentation/devicetree/bindings/arm/ux500/
  F:	Documentation/devicetree/bindings/gpio/st,nomadik-gpio.yaml
  F:	Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
 +F:	Documentation/devicetree/bindings/power/stericsson,ux500-pm-domains.ya=
ml
  F:	arch/arm/boot/dts/st/ste-*
  F:	arch/arm/mach-nomadik/
  F:	arch/arm/mach-ux500/
@@@ -3511,7 -3432,6 +3511,7 @@@ F:	include/linux/soc/qcom
  ARM/QUALCOMM SUPPORT
  M:	Bjorn Andersson <andersson@kernel.org>
  M:	Konrad Dybcio <konradybcio@kernel.org>
 +R:	Abel Vesa <abelvesa@kernel.org>
  L:	linux-arm-msm@vger.kernel.org
  S:	Maintained
  C:	irc://irc.oftc.net/linux-msm
@@@ -3534,7 -3454,6 +3534,7 @@@ F:	drivers/watchdog/gunyah_wdt.
  F:	include/dt-bindings/arm/qcom,ids.h
  F:	include/dt-bindings/firmware/qcom,scm.h
  F:	include/dt-bindings/soc/qcom*
 +F:	include/dt-bindings/thermal/qcom,pas.h
  F:	include/linux/firmware/qcom
  F:	include/linux/soc/qcom/
  F:	include/soc/qcom/
@@@ -3707,6 -3626,7 +3707,6 @@@ F:	arch/arm/boot/dts/intel/socfpga
  F:	arch/arm/configs/socfpga_defconfig
  F:	arch/arm/mach-socfpga/
  F:	arch/arm64/boot/dts/altera/
 -F:	arch/arm64/boot/dts/intel/
 =20
  ARM/SOCFPGA CLOCK FRAMEWORK SUPPORT
  M:	Dinh Nguyen <dinguyen@kernel.org>
@@@ -3869,7 -3789,6 +3869,7 @@@ M:	Vignesh Raghavendra <vigneshr@ti.com
  M:	Tero Kristo <kristo@kernel.org>
  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
  S:	Supported
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
  F:	Documentation/devicetree/bindings/arm/ti/k3.yaml
  F:	Documentation/devicetree/bindings/hwinfo/ti,k3-socinfo.yaml
  F:	arch/arm64/boot/dts/ti/Makefile
@@@ -3887,7 -3806,7 +3887,7 @@@ F:	arch/arm/boot/dts/nspire
  ARM/TOSHIBA VISCONTI ARCHITECTURE
  M:	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 -S:	Supported
 +S:	Odd Fixes
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iwamatsu/linux-visco=
nti.git
  F:	Documentation/devicetree/bindings/arm/toshiba.yaml
  F:	Documentation/devicetree/bindings/clock/toshiba,tmpv770x-pipllct.yaml
@@@ -3981,15 -3900,8 +3981,15 @@@ L:	linux-arm-kernel@lists.infradead.or
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
@@@ -4037,16 -3949,10 +4037,16 @@@ R:	Mark Rutland <mark.rutland@arm.com
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
@@@ -4189,14 -4095,6 +4189,14 @@@ S:	Maintaine
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
@@@ -4362,13 -4260,13 +4362,13 @@@ M:	Nick Kossifidis <mickflemm@gmail.com
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
@@@ -4448,13 -4346,6 +4448,13 @@@ F:	drivers/net/ieee802154/at86rf230.
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
@@@ -4528,12 -4419,6 +4528,12 @@@ L:	linux-media@vger.kernel.or
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
@@@ -4554,24 -4439,6 +4554,24 @@@ S:	Orpha
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
@@@ -4630,16 -4497,6 +4630,16 @@@ W:	https://ez.analog.com/linux-software
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
@@@ -4651,16 -4508,6 +4651,16 @@@ F:	Documentation/devicetree/bindings/sp
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
@@@ -4688,14 -4535,14 +4688,14 @@@ B43 WIRELESS DRIVE
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
@@@ -4780,11 -4627,17 +4780,11 @@@ S:	Odd Fixe
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
@@@ -4805,7 -4658,6 +4805,7 @@@ F:	lib/find_bit_benchmark.
  F:	lib/region_alloc_benchmark.c
  F:	lib/test_bitmap.c
  F:	lib/tests/cpumask_kunit.c
 +F:	tools/include/linux/bitfield-fix-width.h
  F:	tools/include/linux/bitfield.h
  F:	tools/include/linux/bitmap.h
  F:	tools/include/linux/bits.h
@@@ -5020,7 -4872,6 +5020,7 @@@ F:	arch/powerpc/net
  BPF JIT for RISC-V (32-bit)
  M:	Luke Nelson <luke.r.nels@gmail.com>
  M:	Xi Wang <xi.wang@gmail.com>
 +M:	Pu Lehui <pulehui@huawei.com>
  L:	bpf@vger.kernel.org
  S:	Maintained
  F:	arch/riscv/net/
@@@ -5028,7 -4879,7 +5028,7 @@@ X:	arch/riscv/net/bpf_jit_comp64.
 =20
  BPF JIT for RISC-V (64-bit)
  M:	Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>
 -R:	Pu Lehui <pulehui@huawei.com>
 +M:	Pu Lehui <pulehui@huawei.com>
  R:	Puranjay Mohan <puranjay@kernel.org>
  L:	bpf@vger.kernel.org
  S:	Maintained
@@@ -5085,6 -4936,8 +5085,6 @@@ BPF [CRYPTO
  M:	Vadim Fedorenko <vadim.fedorenko@linux.dev>
  L:	bpf@vger.kernel.org
  S:	Maintained
 -F:	crypto/bpf_crypto_skcipher.c
 -F:	include/linux/bpf_crypto.h
  F:	kernel/bpf/crypto.c
 =20
  BPF [DOCUMENTATION] (Related to Standardization)
@@@ -5129,6 -4982,7 +5129,6 @@@ F:	include/uapi/linux/filter.
  F:	kernel/bpf/
  F:	kernel/trace/bpf_trace.c
  F:	lib/buildid.c
 -F:	lib/test_bpf.c
  F:	net/bpf/
  F:	net/core/filter.c
  F:	net/sched/act_bpf.c
@@@ -5289,7 -5143,6 +5289,7 @@@ L:	netdev@vger.kernel.or
  L:	openwrt-devel@lists.openwrt.org (subscribers-only)
  S:	Supported
  F:	Documentation/devicetree/bindings/net/dsa/brcm,b53.yaml
 +F:	Documentation/networking/dsa/b53.rst
  F:	drivers/net/dsa/b53/*
  F:	drivers/net/dsa/bcm_sf2*
  F:	include/linux/dsa/brcm.h
@@@ -5313,18 -5166,6 +5313,18 @@@ N:	bcm271
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
@@@ -5454,7 -5295,7 +5454,7 @@@ F:	Documentation/devicetree/bindings/us
  F:	drivers/usb/gadget/udc/bdc/
 =20
  BROADCOM BMIPS CPUFREQ DRIVER
 -M:	Markus Mayer <mmayer@broadcom.com>
 +M:	Markus Mayer <markus.mayer@broadcom.com>
  R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadco=
m.com>
  L:	linux-pm@vger.kernel.org
  S:	Maintained
@@@ -5729,7 -5570,7 +5729,7 @@@ F:	drivers/spi/spi-brcmstb-qspi.
  F:	drivers/spi/spi-iproc-qspi.c
 =20
  BROADCOM STB AVS CPUFREQ DRIVER
 -M:	Markus Mayer <mmayer@broadcom.com>
 +M:	Markus Mayer <markus.mayer@broadcom.com>
  R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadco=
m.com>
  L:	linux-pm@vger.kernel.org
  S:	Maintained
@@@ -5737,7 -5578,7 +5737,7 @@@ F:	Documentation/devicetree/bindings/cp
  F:	drivers/cpufreq/brcmstb*
 =20
  BROADCOM STB AVS TMON DRIVER
 -M:	Markus Mayer <mmayer@broadcom.com>
 +M:	Markus Mayer <markus.mayer@broadcom.com>
  R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadco=
m.com>
  L:	linux-pm@vger.kernel.org
  S:	Maintained
@@@ -5745,7 -5586,7 +5745,7 @@@ F:	Documentation/devicetree/bindings/th
  F:	drivers/thermal/broadcom/brcmstb*
 =20
  BROADCOM STB DPFE DRIVER
 -M:	Markus Mayer <mmayer@broadcom.com>
 +M:	Markus Mayer <markus.mayer@broadcom.com>
  R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadco=
m.com>
  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
  S:	Maintained
@@@ -5781,7 -5622,7 +5781,7 @@@ F:	drivers/net/ethernet/broadcom/unimac
 =20
  BROADCOM TG3 GIGABIT ETHERNET DRIVER
  M:	Pavan Chebbi <pavan.chebbi@broadcom.com>
 -M:	Michael Chan <mchan@broadcom.com>
 +M:	Michael Chan <michael.chan@broadcom.com>
  L:	netdev@vger.kernel.org
  S:	Maintained
  F:	drivers/net/ethernet/broadcom/tg3.*
@@@ -6079,7 -5920,7 +6079,7 @@@ CARL9170 LINUX COMMUNITY WIRELESS DRIVE
  M:	Christian Lamparter <chunkeey@googlemail.com>
  L:	linux-wireless@vger.kernel.org
  S:	Maintained
 -W:	https://wireless.wiki.kernel.org/en/users/Drivers/carl9170
 +W:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/carl9170.h=
tml
  F:	drivers/net/wireless/ath/carl9170/
 =20
  CAVIUM I2C DRIVER
@@@ -6660,7 -6501,7 +6660,7 @@@ M:	Jerome Brunet <jbrunet+clk@baylibre.
  L:	linux-clk@vger.kernel.org
  S:	Maintained
  Q:	http://patchwork.kernel.org/project/linux-clk/list/
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-ne=
xt
  F:	Documentation/devicetree/bindings/clock/
  F:	drivers/clk/
  F:	include/dt-bindings/clock/
@@@ -6763,7 -6604,6 +6763,7 @@@ S:	Supporte
  F:	fs/configfs/
  F:	include/linux/configfs.h
  F:	samples/configfs/
 +F:	tools/testing/selftests/filesystems/configfs/
 =20
  CONFIGFS [RUST]
  M:	Andreas Hindborg <a.hindborg@kernel.org>
@@@ -6877,22 -6717,6 +6877,22 @@@ F:	tools/testing/selftests/cgroup/test_
  F:	tools/testing/selftests/cgroup/test_kmem.c
  F:	tools/testing/selftests/cgroup/test_memcontrol.c
 =20
 +COREBOOT CFR FIRMWARE ATTRIBUTES DRIVER
 +M:	Sean Rhodes <sean@starlabs.systems>
 +L:	chrome-platform@lists.linux.dev
 +S:	Maintained
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
 +
  CORETEMP HARDWARE MONITORING DRIVER
  L:	linux-hwmon@vger.kernel.org
  S:	Orphan
@@@ -6940,7 -6764,7 +6940,7 @@@ M:	"Rafael J. Wysocki" <rafael@kernel.o
  M:	Viresh Kumar <viresh.kumar@linaro.org>
  R:	Jie Zhan <zhanjie9@hisilicon.com>
  R:	Lifeng Zheng <zhenglifeng1@huawei.com>
 -R:	Pierre Gondois <pierre.gondois@arm.com>
 +R:	Christian Loehle <christian.loehle@arm.com>
  R:	Sumit Gupta <sumitg@nvidia.com>
  L:	linux-pm@vger.kernel.org
  S:	Maintained
@@@ -7156,8 -6980,6 +7156,8 @@@ L:	linux-crypto@vger.kernel.or
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
@@@ -7673,7 -7495,6 +7673,7 @@@ F:	rust/kernel/io.r
  F:	rust/kernel/io/
  F:	rust/kernel/irq.rs
  F:	rust/kernel/irq/
 +F:	rust/macros/io/
 =20
  DEVICE RESOURCE MANAGEMENT HELPERS
  M:	Hans de Goede <hansg@kernel.org>
@@@ -7737,12 -7558,11 +7737,12 @@@ F:	drivers/iio/chemical/sen0322.
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
@@@ -7861,7 -7681,6 +7861,7 @@@ F:	fs/dlm
  DMA BUFFER SHARING FRAMEWORK
  M:	Sumit Semwal <sumit.semwal@linaro.org>
  M:	Christian K=C3=B6nig <christian.koenig@amd.com>
 +M:	Philipp Stanner <phasta@kernel.org>
  L:	linux-media@vger.kernel.org
  L:	dri-devel@lists.freedesktop.org
  L:	linaro-mm-sig@lists.linaro.org (moderated for non-subscribers)
@@@ -7875,8 -7694,6 +7875,8 @@@ F:	include/linux/dma-buf.
  F:	include/linux/dma-buf/
  F:	include/linux/dma-resv.h
  F:	rust/helpers/dma-resv.c
 +F:	rust/helpers/dma_fence.c
 +F:	rust/kernel/dma_buf/
  K:	\bdma_(?:buf|fence|resv)\b
 =20
  DMA GENERIC OFFLOAD ENGINE SUBSYSTEM
@@@ -7912,7 -7729,6 +7912,7 @@@ F:	include/linux/dma-direct.
  F:	include/linux/dma-map-ops.h
  F:	include/linux/dma-mapping.h
  F:	include/linux/swiotlb.h
 +F:	include/trace/events/dma.h
  F:	kernel/dma/
 =20
  DMA MAPPING & SCATTERLIST API [RUST]
@@@ -8104,7 -7920,6 +8104,7 @@@ S:	Supporte
  F:	Documentation/devicetree/bindings/dpll/dpll-device.yaml
  F:	Documentation/devicetree/bindings/dpll/dpll-pin.yaml
  F:	Documentation/driver-api/dpll.rst
 +F:	Documentation/netlink/specs/dpll.yaml
  F:	drivers/dpll/
  F:	include/linux/dpll.h
  F:	include/uapi/linux/dpll.h
@@@ -8142,7 -7957,6 +8142,7 @@@ DRIVER CORE, KOBJECTS, DEBUGFS AND SYSF
  M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  M:	"Rafael J. Wysocki" <rafael@kernel.org>
  M:	Danilo Krummrich <dakr@kernel.org>
 +M:	Johan Hovold <johan@kernel.org>
  L:	driver-core@lists.linux.dev
  S:	Supported
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-c=
ore.git
@@@ -8198,7 -8012,6 +8198,7 @@@ F:	include/uapi/drm/ivpu_accel.
 =20
  DRM ACCEL DRIVER FOR ROCKCHIP NPU
  M:	Tomeu Vizoso <tomeu@tomeuvizoso.net>
 +R:	Heiko Stuebner <heiko@sntech.de>
  L:	dri-devel@lists.freedesktop.org
  S:	Supported
  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
@@@ -8356,6 -8169,7 +8356,6 @@@ F:	drivers/gpu/drm/tiny/hx8357d.
 =20
  DRM DRIVER FOR HYPERV SYNTHETIC VIDEO DEVICE
  M:	Dexuan Cui <decui@microsoft.com>
 -M:	Long Li <longli@microsoft.com>
  M:	Saurabh Sengar <ssengar@linux.microsoft.com>
  L:	linux-hyperv@vger.kernel.org
  L:	dri-devel@lists.freedesktop.org
@@@ -8527,13 -8341,6 +8527,13 @@@ T:	git https://gitlab.freedesktop.org/d
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
@@@ -8547,13 -8354,6 +8547,13 @@@ S:	Maintaine
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
@@@ -8643,12 -8443,6 +8643,12 @@@ S:	Maintaine
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
@@@ -8780,7 -8574,7 +8780,7 @@@ F:	Documentation/devicetree/bindings/di
  F:	drivers/gpu/drm/panel/panel-synaptics-r63353.c
 =20
  DRM DRIVER FOR SYNOPSYS DESIGNWARE DISPLAYPORT BRIDGE
 -M:	Andy Yan <andy.yan@rock-chips.com>
 +M:	Andy Yan <andyshrk@163.com>
  S:	Maintained
  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
  F:	Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
@@@ -8904,9 -8698,7 +8904,9 @@@ T:	git https://gitlab.freedesktop.org/d
  F:	drivers/gpu/drm/nova/
  F:	drivers/gpu/drm/tyr/
  F:	drivers/gpu/nova-core/
 +F:	rust/helpers/dma_fence.c
  F:	rust/helpers/gpu.c
 +F:	rust/kernel/dma_buf/
  F:	rust/kernel/drm/
  F:	rust/kernel/gpu.rs
  F:	rust/kernel/gpu/
@@@ -9135,7 -8927,7 +9135,7 @@@ F:	include/linux/platform_data/shmob_dr
  DRM DRIVERS FOR ROCKCHIP
  M:	Sandy Huang <hjc@rock-chips.com>
  M:	Heiko St=C3=BCbner <heiko@sntech.de>
 -M:	Andy Yan <andy.yan@rock-chips.com>
 +M:	Andy Yan <andyshrk@163.com>
  L:	dri-devel@lists.freedesktop.org
  L:	linux-rockchip@lists.infradead.org
  S:	Maintained
@@@ -9278,21 -9070,6 +9278,21 @@@ F:	include/drm/drm_gpuvm.
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
@@@ -9320,12 -9097,9 +9320,12 @@@ S:	Supporte
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
@@@ -9334,7 -9108,7 +9334,7 @@@ L:	dri-devel@lists.freedesktop.or
  L:	rust-for-linux@vger.kernel.org
  S:	Supported
  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 -F:	drivers/gpu/drm/drm_panic_qr.rs
 +F:	drivers/gpu/drm/drm_panic_helper_qr.rs
 =20
  DRM PRIVACY-SCREEN CLASS
  M:	Hans de Goede <hansg@kernel.org>
@@@ -9344,25 -9118,11 +9344,25 @@@ T:	git https://gitlab.freedesktop.org/d
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
@@@ -9690,11 -9450,6 +9690,11 @@@ L:	linux-edac@vger.kernel.or
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
@@@ -9719,8 -9474,9 +9719,8 @@@ S:	Maintaine
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
@@@ -9731,17 -9487,11 +9731,17 @@@ F:	drivers/edac/ie31200_edac.
 =20
  EDAC-IGEN6
  M:	Tony Luck <tony.luck@intel.com>
 -R:	Qiuxu Zhuo <qiuxu.zhuo@intel.com>
 +R:	Qiuxu Zhuo <qzhuo@nvidia.com>
  L:	linux-edac@vger.kernel.org
  S:	Maintained
  F:	drivers/edac/igen6_edac.c
 =20
 +EDAC-INTEL-BFF-RESET
 +M:	Tony Luck <tony.luck@intel.com>
 +L:	linux-edac@vger.kernel.org
 +S:	Maintained
 +F:	drivers/edac/intel-bff.c
 +
  EDAC-MPC85XX
  L:	linux-edac@vger.kernel.org
  S:	Orphan
@@@ -9776,7 -9526,7 +9776,7 @@@ F:	drivers/edac/qcom_edac.
 =20
  EDAC-SBRIDGE
  M:	Tony Luck <tony.luck@intel.com>
 -R:	Qiuxu Zhuo <qiuxu.zhuo@intel.com>
 +R:	Qiuxu Zhuo <qzhuo@nvidia.com>
  L:	linux-edac@vger.kernel.org
  S:	Maintained
  F:	drivers/edac/sb_edac.c
@@@ -9793,11 -9543,6 +9793,11 @@@ L:	linux-edac@vger.kernel.or
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
@@@ -9937,14 -9682,14 +9937,14 @@@ EROFS FILE SYSTE
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
@@@ -9955,14 -9700,6 +9955,14 @@@ M:	Jeff Layton <jlayton@kernel.org
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
@@@ -10093,7 -9830,6 +10093,7 @@@ R:	Yuezhang Mo <yuezhang.mo@sony.com
  L:	exfat@lists.linux.dev
  S:	Maintained
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/exfat.git
 +F:	Documentation/filesystems/exfat.rst
  F:	fs/exfat/
 =20
  EXPRESSWIRE PROTOCOL LIBRARY
@@@ -10124,7 -9860,7 +10124,7 @@@ L:	linux-ext4@vger.kernel.or
  S:	Maintained
  W:	http://ext4.wiki.kernel.org
  Q:	http://patchwork.ozlabs.org/project/linux-ext4/list/
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
  F:	Documentation/filesystems/ext4/
  F:	fs/ext4/
  F:	include/trace/events/ext4.h
@@@ -10210,7 -9946,7 +10210,7 @@@ S:	Maintaine
  W:	https://f2fs.wiki.kernel.org/
  Q:	https://patchwork.kernel.org/project/f2fs/list/
  B:	https://bugzilla.kernel.org/enter_bug.cgi?product=3DFile%20System&comp=
onent=3Df2fs
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev
  F:	Documentation/ABI/testing/sysfs-fs-f2fs
  F:	Documentation/filesystems/f2fs.rst
  F:	fs/f2fs/
@@@ -10241,7 -9977,6 +10241,7 @@@ F:	net/core/failover.
  FANOTIFY
  M:	Jan Kara <jack@suse.cz>
  R:	Amir Goldstein <amir73il@gmail.com>
 +R:	Matt Bobrowski <matt@bobrowski.net>
  L:	linux-fsdevel@vger.kernel.org
  S:	Maintained
  F:	fs/notify/fanotify/
@@@ -10366,6 -10101,7 +10366,6 @@@ F:	tools/testing/selftests/mount_setatt
 =20
  FILESYSTEMS [IOMAP]
  M:	Christian Brauner <brauner@kernel.org>
 -R:	Darrick J. Wong <djwong@kernel.org>
  L:	linux-xfs@vger.kernel.org
  L:	linux-fsdevel@vger.kernel.org
  S:	Supported
@@@ -10447,14 -10183,6 +10447,14 @@@ F:	include/linux/firewire.
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
@@@ -10479,8 -10207,9 +10479,8 @@@ S:	Maintaine
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
@@@ -10611,7 -10340,7 +10611,7 @@@ L:	linux-fbdev@vger.kernel.or
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
@@@ -10622,7 -10351,7 +10622,7 @@@ F:	include/video
  FREESCALE CAAM (Cryptographic Acceleration and Assurance Module) DRIVER
  M:	Horia Geant=C4=83 <horia.geanta@nxp.com>
  M:	Pankaj Gupta <pankaj.gupta@nxp.com>
 -M:	Gaurav Jain <gaurav.jain@nxp.com>
 +M:	Sahil Malhotra <sahil.malhotra@nxp.com>
  L:	linux-crypto@vger.kernel.org
  S:	Maintained
  F:	Documentation/devicetree/bindings/crypto/fsl,sec-v4.0*
@@@ -10930,8 -10659,7 +10930,8 @@@ M:	Jaegeuk Kim <jaegeuk@kernel.org
  L:	linux-fscrypt@vger.kernel.org
  S:	Supported
  Q:	https://patchwork.kernel.org/project/linux-fscrypt/list/
 -T:	git https://git.kernel.org/pub/scm/fs/fscrypt/linux.git
 +T:	git https://git.kernel.org/pub/scm/fs/fscrypt/linux.git for-next
 +T:	git https://git.kernel.org/pub/scm/fs/fscrypt/linux.git for-current
  F:	Documentation/filesystems/fscrypt.rst
  F:	fs/crypto/
  F:	include/linux/fscrypt.h
@@@ -10978,8 -10706,7 +10978,8 @@@ M:	Theodore Y. Ts'o <tytso@mit.edu
  L:	fsverity@lists.linux.dev
  S:	Supported
  Q:	https://patchwork.kernel.org/project/fsverity/list/
 -T:	git https://git.kernel.org/pub/scm/fs/fsverity/linux.git
 +T:	git https://git.kernel.org/pub/scm/fs/fsverity/linux.git for-next
 +T:	git https://git.kernel.org/pub/scm/fs/fsverity/linux.git for-current
  F:	Documentation/filesystems/fsverity.rst
  F:	fs/verity/
  F:	include/linux/fsverity.h
@@@ -11170,7 -10897,6 +11170,7 @@@ M:	Peter Oberparleiter <oberpar@linux.i
  S:	Maintained
  F:	Documentation/dev-tools/gcov.rst
  F:	kernel/gcov/
 +F:	scripts/Makefile.gcov
 =20
  GDB KERNEL DEBUGGING HELPER SCRIPTS
  M:	Jan Kiszka <jan.kiszka@siemens.com>
@@@ -11274,7 -11000,7 +11274,7 @@@ R:	Manivannan Sadhasivam <mani@kernel.o
  L:	linux-phy@lists.infradead.org
  S:	Supported
  Q:	https://patchwork.kernel.org/project/linux-phy/list/
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git ne=
xt
  F:	Documentation/devicetree/bindings/phy/
  F:	drivers/phy/
  F:	include/dt-bindings/phy/
@@@ -11336,8 -11062,8 +11336,8 @@@ M:	Vincenzo Frascino <vincenzo.frascino
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
@@@ -11411,6 -11137,16 +11411,6 @@@ S:	Maintaine
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
@@@ -11425,7 -11161,6 +11425,7 @@@ F:	Documentation/devicetree/bindings/ph
  F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen=
=2Eyaml
  F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
  F:	arch/arm64/boot/dts/exynos/google/
 +F:	arch/arm64/boot/dts/google/
  F:	drivers/clk/samsung/clk-gs101.c
  F:	drivers/phy/phy-google-usb.c
  F:	drivers/soc/samsung/gs101-pmu.c
@@@ -11582,6 -11317,13 +11582,6 @@@ M:	Bryan O'Donoghue <pure.logic@nexus-s
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
@@@ -11678,9 -11420,7 +11678,9 @@@ M:	Harald Welte <laforge@gnumonks.org
  L:	osmocom-net-gprs@lists.osmocom.org
  S:	Maintained
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pablo/gtp.git
 +F:	Documentation/netlink/specs/gtp.yaml
  F:	drivers/net/gtp.c
 +F:	tools/testing/selftests/net/gtp.py
 =20
  GUID PARTITION TABLE (GPT)
  M:	Davidlohr Bueso <dave@stgolabs.net>
@@@ -11689,10 -11429,10 +11689,10 @@@ S:	Maintaine
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
@@@ -11898,12 -11638,6 +11898,12 @@@ L:	linux-input@vger.kernel.or
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
@@@ -11995,13 -11729,6 +11995,13 @@@ W:	http://www.highpoint-tech.co
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
@@@ -12141,14 -11868,14 +12141,14 @@@ M:	Chengchang Tang <tangchengchang@hu=
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
@@@ -12234,13 -11961,6 +12234,13 @@@ S:	Maintaine
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
@@@ -12376,8 -12096,7 +12376,8 @@@ F:	Documentation/admin-guide/mm/hugetlb
  F:	Documentation/mm/hugetlbfs_reserv.rst
  F:	Documentation/mm/vmemmap_dedup.rst
  F:	fs/hugetlbfs/
 -F:	include/linux/hugetlb.h
 +F:	include/linux/hugetlb*
 +F:	include/linux/vmemmap-optimization.h
  F:	include/trace/events/hugetlbfs.h
  F:	mm/hugetlb.c
  F:	mm/hugetlb_cgroup.c
@@@ -12441,9 -12160,11 +12441,9 @@@ S:	Maintaine
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
@@@ -12736,7 -12457,6 +12736,7 @@@ F:	drivers/crypto/nx/Makefil
  F:	drivers/crypto/nx/nx-842*
  F:	include/linux/sw842.h
  F:	lib/842/
 +F:	lib/tests/842_decompress_kunit.c
 =20
  IBM Power in-Nest Crypto Acceleration
  M:	Breno Leit=C3=A3o <leitao@debian.org>
@@@ -12977,7 -12697,6 +12977,7 @@@ R:	Nuno S=C3=A1 <nuno.sa@analog.com
  R:	Andy Shevchenko <andy@kernel.org>
  L:	linux-iio@vger.kernel.org
  S:	Maintained
 +Q:	https://patchwork.kernel.org/project/linux-iio/list/
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git
  F:	Documentation/ABI/testing/configfs-iio*
  F:	Documentation/ABI/testing/sysfs-bus-iio*
@@@ -12990,13 -12709,6 +12990,13 @@@ F:	include/dt-bindings/iio
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
@@@ -13170,7 -12882,7 +13170,7 @@@ S:	Maintaine
  F:	drivers/power/supply/ip5xxx_power.c
 =20
  INNOSILICON HDMI BRIDGE DRIVER
 -M:	Andy Yan <andy.yan@rock-chips.com>
 +M:	Andy Yan <andyshrk@163.com>
  L:	dri-devel@lists.freedesktop.org
  S:	Maintained
  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
@@@ -13299,8 -13011,9 +13299,8 @@@ S:	Maintaine
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
@@@ -13318,8 -13031,6 +13318,8 @@@ F:	drivers/scsi/isci
 =20
  INTEL COMPUTER VISION SENSING (CVS) DRIVER
  M:	Miguel Vadillo <miguel.vadillo@intel.com>
 +M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 +R:	Antti Laakso <antti.laakso@linux.intel.com>
  L:	linux-media@vger.kernel.org
  S:	Maintained
  F:	drivers/media/i2c/cvs/
@@@ -13507,15 -13218,6 +13507,15 @@@ S:	Supporte
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
@@@ -13537,10 -13239,6 +13537,10 @@@ F:	drivers/staging/media/ipu3
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
@@@ -13777,7 -13475,6 +13777,7 @@@ K:	\bSGX
  INTEL SKYLAKE INT3472 ACPI DEVICE DRIVER
  M:	Daniel Scally <dan.scally@ideasonboard.com>
  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 +L:	linux-media@vger.kernel.org
  S:	Maintained
  T:	git git://linuxtv.org/media.git
  F:	drivers/platform/x86/intel/int3472/
@@@ -13822,7 -13519,6 +13822,7 @@@ M:	Srinivas Pandruvada <srinivas.pandru
  L:	platform-driver-x86@vger.kernel.org
  S:	Maintained
  F:	Documentation/ABI/testing/debugfs-tpmi
 +F:	drivers/platform/x86/intel/tpmi_common.[ch]
  F:	drivers/platform/x86/intel/vsec_tpmi.c
  F:	include/linux/intel_tpmi.h
 =20
@@@ -13865,7 -13561,7 +13865,7 @@@ INTEL WIRELESS WIFI LINK (iwlwifi
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
@@@ -14245,14 -13941,6 +14245,14 @@@ T:	git https://gitlab.freedesktop.org/d
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
@@@ -14371,7 -14059,6 +14371,7 @@@ Q:	https://patchwork.kernel.org/project
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git
  F:	Documentation/kbuild/kconfig*
  F:	scripts/Kconfig.include
 +F:	scripts/Kconfig.toolchain
  F:	scripts/kconfig/
 =20
  KCORE
@@@ -14453,7 -14140,6 +14453,7 @@@ F:	scripts/basic
  F:	scripts/clang-tools/
  F:	scripts/container
  F:	scripts/dummy-tools/
 +F:	scripts/gen_init*
  F:	scripts/include/
  F:	scripts/install.sh
  F:	scripts/mk*
@@@ -14477,7 -14163,6 +14477,7 @@@ F:	include/linux/ucopysize.
  F:	kernel/configs/hardening.config
  F:	kernel/kstack_erase.c
  F:	lib/tests/randstruct_kunit.c
 +F:	lib/tests/stackinit_kunit.c
  F:	lib/tests/usercopy_kunit.c
  F:	mm/usercopy.c
  F:	scripts/Makefile.kstack_erase
@@@ -14503,8 -14188,7 +14503,8 @@@ L:	linux-nfs@vger.kernel.or
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
@@@ -14521,7 -14205,6 +14521,7 @@@ F:	include/uapi/linux/nfsd
  F:	include/uapi/linux/sunrpc/
  F:	net/sunrpc/
  F:	tools/net/sunrpc/
 +F:	tools/testing/selftests/nfsd/
 =20
  KERNEL NFSD BLOCK and SCSI LAYOUT DRIVER
  R:	Christoph Hellwig <hch@lst.de>
@@@ -14667,8 -14350,6 +14667,8 @@@ F:	arch/powerpc/include/asm/kvm
  F:	arch/powerpc/include/uapi/asm/kvm*
  F:	arch/powerpc/kernel/kvm*
  F:	arch/powerpc/kvm/
 +F:	tools/testing/selftests/kvm/*/powerpc/
 +F:	tools/testing/selftests/kvm/powerpc/
 =20
  KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)
  M:	Anup Patel <anup@brainfault.org>
@@@ -14677,7 -14358,7 +14677,7 @@@ L:	kvm@vger.kernel.or
  L:	kvm-riscv@lists.infradead.org
  L:	linux-riscv@lists.infradead.org
  S:	Maintained
 -T:	git https://github.com/kvm-riscv/linux.git
 +T:	git https://github.com/kvm-riscv/linux.git riscv_kvm_next
  F:	arch/riscv/include/asm/kvm*
  F:	arch/riscv/include/uapi/asm/kvm*
  F:	arch/riscv/kvm/
@@@ -14693,7 -14374,6 +14693,7 @@@ L:	kvm@vger.kernel.or
  S:	Supported
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux.git
  F:	Documentation/virt/kvm/s390*
 +F:	arch/s390/include/arm64/*
  F:	arch/s390/include/asm/gmap_helpers.h
  F:	arch/s390/include/asm/kvm*
  F:	arch/s390/include/uapi/asm/kvm*
@@@ -14706,22 -14386,6 +14706,22 @@@ F:	tools/testing/selftests/drivers/s390
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
@@@ -14750,7 -14414,6 +14750,7 @@@ S:	Supporte
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-c=
ore.git
  F:	fs/kernfs/
  F:	include/linux/kernfs.h
 +F:	tools/testing/selftests/filesystems/kernfs_test.c
 =20
  KEXEC
  M:	Andrew Morton <akpm@linux-foundation.org>
@@@ -14823,7 -14486,7 +14823,7 @@@ S:	Supporte
  F:	include/keys/trusted_dcp.h
  F:	security/keys/trusted-keys/trusted_dcp.c
 =20
 -KEYS-TRUSTED-PLPKS
 +KEYS-TRUSTED-PKWM
  M:	Srish Srinivasan <ssrish@linux.ibm.com>
  M:	Nayna Jain <nayna@linux.ibm.com>
  L:	linux-integrity@vger.kernel.org
@@@ -15118,7 -14781,6 +15118,7 @@@ F:	drivers/scsi/leapraid
  LED SUBSYSTEM
  M:	Lee Jones <lee@kernel.org>
  M:	Pavel Machek <pavel@kernel.org>
 +R:	Griffin Kroah-Hartman <griffin@kroah.com>
  L:	linux-leds@vger.kernel.org
  S:	Maintained
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git
@@@ -15493,10 -15155,10 +15493,10 @@@ N:	lite
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
@@@ -15622,7 -15284,6 +15622,7 @@@ F:	rust/helpers/mutex.
  F:	rust/helpers/spinlock.c
  F:	rust/kernel/sync/lock.rs
  F:	rust/kernel/sync/lock/
 +F:	rust/kernel/sync/lockdep.rs
  F:	rust/kernel/sync/locked_by.rs
  X:	kernel/locking/locktorture.c
 =20
@@@ -15863,14 -15524,6 +15863,14 @@@ W:	https://ez.analog.com/linux-software
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
@@@ -16011,7 -15664,7 +16011,7 @@@ MAC8021
  M:	Johannes Berg <johannes@sipsolutions.net>
  L:	linux-wireless@vger.kernel.org
  S:	Maintained
 -W:	https://wireless.wiki.kernel.org/
 +W:	https://wireless.docs.kernel.org/en/latest/
  Q:	https://patchwork.kernel.org/project/linux-wireless/list/
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-ne=
xt.git
@@@ -16336,15 -15989,6 +16336,15 @@@ F:	Documentation/devicetree/bindings/hw
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
@@@ -16407,18 -16051,21 +16407,18 @@@ M:	Niklas S=C3=B6derlund <niklas.sode=
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
@@@ -16434,13 -16081,6 +16434,13 @@@ S:	Maintaine
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
@@@ -16483,15 -16123,6 +16483,15 @@@ L:	linux-iio@vger.kernel.or
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
@@@ -16663,7 -16294,7 +16663,7 @@@ M:	Ariana Lazar <ariana.lazar@microchip
  L:	linux-iio@vger.kernel.org
  S:	Supported
  F:	Documentation/devicetree/bindings/iio/dac/microchip,mcp47feb02.yaml
 -F:	drivers/iio/dac/mcp47feb02.c
 +F:	drivers/iio/dac/mcp47feb02*
 =20
  MCP4821 DAC DRIVER
  M:	Anshul Dalal <anshulusr@gmail.com>
@@@ -16774,7 -16405,6 +16774,7 @@@ M:	Frank Li <Frank.Li@nxp.com
  M:	Martin Kepplinger-Novakovic <martink@posteo.de>
  R:	Rui Miguel Silva <rmfrfs@gmail.com>
  R:	Purism Kernel Team <kernel@puri.sm>
 +R:	Bryan O'Donoghue <bod@kernel.org>
  L:	imx@lists.linux.dev
  L:	linux-media@vger.kernel.org
  S:	Maintained
@@@ -16980,17 -16610,6 +16980,17 @@@ M:	Sean Wang <sean.wang@mediatek.com
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
@@@ -17096,11 -16715,6 +17096,11 @@@ S:	Maintaine
  F:	drivers/iio/adc/mt6323-auxadc.c
  F:	include/dt-bindings/iio/adc/mediatek,mt6323-auxadc.h
 =20
 +MEDIATEK MT6323 PMIC NVMEM DRIVER
 +M:	Roman Vivchar <rva333@protonmail.com>
 +S:	Maintained
 +F:	drivers/nvmem/mt6323-efuse.c
 +
  MEDIATEK MT6735 CLOCK & RESET DRIVERS
  M:	Yassine Oudjana <y.oudjana@protonmail.com>
  L:	linux-clk@vger.kernel.org
@@@ -17546,6 -17160,9 +17546,6 @@@ F:	mm/mmzone.
  F:	mm/pagewalk.c
  F:	mm/pgtable-generic.c
  F:	mm/ptdump.c
 -F:	mm/sparse-vmemmap.c
 -F:	mm/sparse.c
 -F:	mm/sparse.h
  F:	mm/util.c
  F:	mm/vmpressure.c
  F:	mm/vmstat.c
@@@ -17572,9 -17189,8 +17572,9 @@@ T:	git git://git.kernel.org/pub/scm/lin
  F:	mm/gup.c
  F:	mm/gup_test.c
  F:	mm/gup_test.h
 +F:	tools/mm/gup_bench.c
 +F:	tools/testing/selftests/mm/gup.c
  F:	tools/testing/selftests/mm/gup_longterm.c
 -F:	tools/testing/selftests/mm/gup_test.c
 =20
  MEMORY MANAGEMENT - KSM (Kernel Samepage Merging)
  M:	Andrew Morton <akpm@linux-foundation.org>
@@@ -17593,20 -17209,30 +17593,20 @@@ F:	include/trace/events/ksm.
  F:	mm/ksm.c
  F:	mm/mm_slot.h
 =20
 -MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION
 -M:	Andrew Morton <akpm@linux-foundation.org>
 +MEMORY MANAGEMENT - MEMORY MAP
 +M:	Muchun Song <muchun.song@linux.dev>
 +M:	Mike Rapoport <rppt@kernel.org>
  M:	David Hildenbrand <david@kernel.org>
 -R:	Zi Yan <ziy@nvidia.com>
 -R:	Matthew Brost <matthew.brost@intel.com>
 -R:	Joshua Hahn <joshua.hahnjy@gmail.com>
 -R:	Rakie Kim <rakie.kim@sk.com>
 -R:	Byungchul Park <byungchul@sk.com>
 -R:	Gregory Price <gourry@gourry.net>
 -R:	Ying Huang <ying.huang@linux.alibaba.com>
 -R:	Alistair Popple <apopple@nvidia.com>
  L:	linux-mm@kvack.org
  S:	Maintained
 -W:	http://www.linux-mm.org
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 -F:	Documentation/ABI/testing/sysfs-kernel-mm-mempolicy
 -F:	Documentation/ABI/testing/sysfs-kernel-mm-mempolicy-weighted-interleave
 -F:	include/linux/mempolicy.h
 -F:	include/uapi/linux/mempolicy.h
 -F:	include/linux/migrate.h
 -F:	include/linux/migrate_mode.h
 -F:	mm/mempolicy.c
 -F:	mm/migrate.c
 -F:	mm/migrate_device.c
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git memmap
 +F:	Documentation/mm/memory-model.rst
 +F:	arch/*/include/asm/sparsemem.h
 +F:	include/asm-generic/memory_model.h
 +F:	mm/sparse-vmemmap.c
 +F:	mm/sparse.c
 +F:	mm/sparse.h
 +K:	(?i:vmemmap)
 =20
  MEMORY MANAGEMENT - MGLRU (MULTI-GEN LRU)
  M:	Andrew Morton <akpm@linux-foundation.org>
@@@ -17630,25 -17256,6 +17630,25 @@@ F:	include/linux/mmzone.
  F:	mm/vmscan.c
  F:	mm/workingset.c
 =20
 +MEMORY MANAGEMENT - MIGRATION
 +M:	Andrew Morton <akpm@linux-foundation.org>
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
 +W:	http://www.linux-mm.org
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 +F:	include/linux/migrate.h
 +F:	include/linux/migrate_mode.h
 +F:	mm/migrate.c
 +F:	mm/migrate_device.c
 +
  MEMORY MANAGEMENT - MISC
  M:	Andrew Morton <akpm@linux-foundation.org>
  M:	David Hildenbrand <david@kernel.org>
@@@ -17664,17 -17271,15 +17664,17 @@@ W:	http://www.linux-mm.or
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
 +X:	Documentation/admin-guide/mm/damon/
 +X:	Documentation/mm/damon/
 +F:	mm/char-mem.c
  F:	include/linux/cma.h
  F:	include/linux/dmapool.h
  F:	include/linux/ioremap.h
 -F:	include/linux/memory-tiers.h
  F:	include/linux/page_idle.h
  F:	mm/backing-dev.c
  F:	mm/cma.c
@@@ -17686,10 -17291,10 +17686,10 @@@ F:	mm/early_ioremap.
  F:	mm/fadvise.c
  F:	mm/ioremap.c
  F:	mm/mapping_dirty_helpers.c
 -F:	mm/memory-tiers.c
  F:	mm/page_idle.c
  F:	mm/pgalloc-track.h
  F:	mm/process_vm_access.c
 +F:	tools/lib/mm/
  F:	tools/testing/selftests/mm/
 =20
  MEMORY MANAGEMENT - NUMA MEMBLOCKS AND NUMA EMULATION
@@@ -17703,27 -17308,6 +17703,27 @@@ F:	mm/numa.
  F:	mm/numa_emulation.c
  F:	mm/numa_memblks.c
 =20
 +MEMORY MANAGEMENT - NUMA PLACEMENT
 +M:	Andrew Morton <akpm@linux-foundation.org>
 +M:	David Hildenbrand <david@kernel.org>
 +M:	Gregory Price <gourry@gourry.net>
 +R:	Zi Yan <ziy@nvidia.com>
 +R:	Joshua Hahn <joshua.hahnjy@gmail.com>
 +R:	Rakie Kim <rakie.kim@sk.com>
 +R:	Ying Huang <ying.huang@linux.alibaba.com>
 +L:	linux-mm@kvack.org
 +S:	Maintained
 +W:	http://www.linux-mm.org
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 +F:	Documentation/ABI/testing/sysfs-kernel-mm-memory-tiers
 +F:	Documentation/ABI/testing/sysfs-kernel-mm-mempolicy
 +F:	Documentation/ABI/testing/sysfs-kernel-mm-mempolicy-weighted-interleave
 +F:	include/linux/memory-tiers.h
 +F:	include/linux/mempolicy.h
 +F:	include/uapi/linux/mempolicy.h
 +F:	mm/memory-tiers.c
 +F:	mm/mempolicy.c
 +
  MEMORY MANAGEMENT - OOM KILLER
  M:	Michal Hocko <mhocko@suse.com>
  R:	David Rientjes <rientjes@google.com>
@@@ -17850,7 -17434,6 +17850,7 @@@ F:	Documentation/admin-guide/mm/transhu
  F:	include/linux/huge_mm.h
  F:	include/linux/khugepaged.h
  F:	include/trace/events/huge_memory.h
 +F:	mm/collapse.h
  F:	mm/huge_memory.c
  F:	mm/khugepaged.c
  F:	mm/mm_slot.h
@@@ -17897,7 -17480,7 +17897,7 @@@ L:	linux-mm@kvack.or
  S:	Maintained
  W:	http://www.linux-mm.org
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 -F:	drivers/char/mem.c
 +F:	mm/char-mem.c
  F:	include/trace/events/mmap.h
  F:	fs/proc/task_mmu.c
  F:	fs/proc/task_nommu.c
@@@ -18056,7 -17639,6 +18056,7 @@@ L:	linux-arm-msm@vger.kernel.or
  S:	Maintained
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git
  F:	Documentation/ABI/stable/sysfs-bus-mhi
 +F:	Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
  F:	Documentation/mhi/
  F:	drivers/bus/mhi/
  F:	drivers/pci/endpoint/functions/pci-epf-mhi.c
@@@ -18193,7 -17775,6 +18193,7 @@@ F:	Documentation/devicetree/bindings/ne
  F:	drivers/net/dsa/microchip/*
  F:	include/linux/dsa/ksz_common.h
  F:	include/linux/platform_data/microchip-ksz.h
 +F:	net/dsa/tag_ks8995.c
  F:	net/dsa/tag_ksz.c
 =20
  MICROCHIP LAN743X ETHERNET DRIVER
@@@ -18409,9 -17990,10 +18409,9 @@@ F:	drivers/misc/atmel-ssc.
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
@@@ -18468,7 -18050,7 +18468,7 @@@ F:	include/linux/cciss*.
  F:	include/uapi/linux/cciss*.h
 =20
  MICROSOFT MANA RDMA DRIVER
 -M:	Long Li <longli@microsoft.com>
 +M:	Wei Hu <weh@microsoft.com>
  M:	Konstantin Taranov <kotaranov@microsoft.com>
  L:	linux-rdma@vger.kernel.org
  L:	linux-hyperv@vger.kernel.org
@@@ -18599,13 -18181,6 +18599,13 @@@ F:	include/linux/min_heap.
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
@@@ -18796,12 -18371,6 +18796,12 @@@ F:	scripts/module
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
@@@ -18852,10 -18421,10 +18852,10 @@@ M:	David Yang <mmyangfl@gmail.com
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
@@@ -18873,9 -18442,7 +18873,9 @@@ M:	James Morse <james.morse@arm.com
  M:	Ben Horgan <ben.horgan@arm.com>
  R:	Reinette Chatre <reinette.chatre@intel.com>
  R:	Fenghua Yu <fenghuay@nvidia.com>
 +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
  S:	Maintained
 +F:	Documentation/arch/arm64/mpam.rst
  F:	drivers/resctrl/mpam_*
  F:	drivers/resctrl/test_mpam_*
  F:	include/linux/arm_mpam.h
@@@ -19082,7 -18649,7 +19082,7 @@@ MULTIFUNCTION DEVICES (MFD
  M:	Lee Jones <lee@kernel.org>
  L:	mfd@lists.linux.dev
  S:	Maintained
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-=
next
  F:	Documentation/devicetree/bindings/mfd/
  F:	drivers/mfd/
  F:	include/dt-bindings/mfd/
@@@ -19236,19 -18803,8 +19236,19 @@@ F:	Documentation/devicetree/bindings/hw
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
@@@ -19329,7 -18885,7 +19329,7 @@@ F:	net/core/drop_monitor.
  NETWORKING DRIVERS
  M:	Andrew Lunn <andrew+netdev@lunn.ch>
  M:	"David S. Miller" <davem@davemloft.net>
 -M:	Eric Dumazet <edumazet@google.com>
 +M:	Eric Dumazet <edumazet@kernel.org>
  M:	Jakub Kicinski <kuba@kernel.org>
  M:	Paolo Abeni <pabeni@redhat.com>
  L:	netdev@vger.kernel.org
@@@ -19369,7 -18925,7 +19369,7 @@@ NETWORKING DRIVERS (WIRELESS
  M:	Johannes Berg <johannes@sipsolutions.net>
  L:	linux-wireless@vger.kernel.org
  S:	Maintained
 -W:	https://wireless.wiki.kernel.org/
 +W:	https://wireless.docs.kernel.org/en/latest/
  Q:	https://patchwork.kernel.org/project/linux-wireless/list/
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-ne=
xt.git
@@@ -19442,12 -18998,11 +19442,12 @@@ F:	Documentation/devicetree/bindings/=
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
@@@ -19565,7 -19120,6 +19565,7 @@@ L:	netdev@vger.kernel.or
  S:	Maintained
  F:	Documentation/netlink/specs/rt-addr.yaml
  F:	Documentation/netlink/specs/rt-neigh.yaml
 +F:	Documentation/netlink/specs/rt-nexthop.yaml
  F:	Documentation/netlink/specs/rt-route.yaml
  F:	Documentation/netlink/specs/rt-rule.yaml
  F:	include/linux/inetdevice.h
@@@ -19674,7 -19228,7 +19674,7 @@@ F:	net/ipv6/seg6
  F:	tools/testing/selftests/net/srv6*
 =20
  NETWORKING [TCP]
 -M:	Eric Dumazet <edumazet@google.com>
 +M:	Eric Dumazet <edumazet@kernel.org>
  M:	Neal Cardwell <ncardwell@google.com>
  R:	Kuniyuki Iwashima <kuniyu@google.com>
  L:	netdev@vger.kernel.org
@@@ -19707,7 -19261,7 +19707,7 @@@ F:	net/tls
  F:	tools/testing/selftests/net/tls.c
 =20
  NETWORKING [SOCKETS]
 -M:	Eric Dumazet <edumazet@google.com>
 +M:	Eric Dumazet <edumazet@kernel.org>
  M:	Kuniyuki Iwashima <kuniyu@google.com>
  M:	Paolo Abeni <pabeni@redhat.com>
  M:	Willem de Bruijn <willemb@google.com>
@@@ -19815,7 -19369,6 +19815,7 @@@ F:	drivers/scsi/nsp32
 =20
  NINTENDO HID DRIVER
  M:	Daniel J. Ogorchock <djogorchock@gmail.com>
 +M:	Vicki Pfau <vi@endrift.com>
  L:	linux-input@vger.kernel.org
  S:	Maintained
  F:	drivers/hid/hid-nintendo*
@@@ -19888,13 -19441,6 +19888,13 @@@ T:	git git://git.kernel.org/pub/scm/lin
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
@@@ -19946,7 -19492,6 +19946,7 @@@ S:	Maintaine
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git
  F:	Documentation/filesystems/ntfs.rst
  F:	fs/ntfs/
 +F:	include/uapi/linux/ntfs.h
 =20
  NTFS3 FILESYSTEM
  M:	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
@@@ -19956,7 -19501,6 +19956,7 @@@ W:	http://www.paragon-software.com
  T:	git https://github.com/Paragon-Software-Group/linux-ntfs3.git
  F:	Documentation/filesystems/ntfs3.rst
  F:	fs/ntfs3/
 +F:	include/trace/events/ntfs3.h
 =20
  NTSYNC SYNCHRONIZATION PRIMITIVE DRIVER
  M:	Elizabeth Figura <zfigura@codeweavers.com>
@@@ -20091,8 -19635,6 +20091,8 @@@ F:	include/linux/nvmem-consumer.
  F:	include/linux/nvmem-provider.h
 =20
  NXP BLUETOOTH WIRELESS DRIVERS
 +M:	Song Xue <song.xue_1@nxp.com>
 +M:	Alex Zhou <alex.zhou@nxp.com>
  M:	Amitkumar Karwar <amitkumar.karwar@nxp.com>
  M:	Neeraj Kale <neeraj.sanjaykale@nxp.com>
  S:	Maintained
@@@ -20182,14 -19724,6 +20182,14 @@@ S:	Maintaine
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
@@@ -20228,15 -19762,6 +20228,15 @@@ L:	linux-wireless@vger.kernel.or
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
@@@ -20589,14 -20114,6 +20589,14 @@@ T:	git git://linuxtv.org/media_tree.gi
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
@@@ -20637,13 -20154,6 +20637,13 @@@ T:	git git://linuxtv.org/media.gi
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
@@@ -20967,14 -20477,11 +20967,14 @@@ F:	Documentation/devicetree
  F:	Documentation/process/maintainer-devicetree.rst
  F:	arch/*/boot/dts/
  F:	include/dt-bindings/
 +F:	scripts/dtc/dt-check-style
 +F:	scripts/dtc/dt-style-selftest/
 =20
  OPENCOMPUTE PTP CLOCK DRIVER
  M:	Vadim Fedorenko <vadim.fedorenko@linux.dev>
  L:	netdev@vger.kernel.org
  S:	Maintained
 +F:	Documentation/networking/devlink/ptp_ocp.rst
  F:	drivers/ptp/ptp_ocp.c
 =20
  OPENCORES I2C BUS DRIVER
@@@ -21003,7 -20510,6 +21003,7 @@@ F:	drivers/irqchip/irq-or1k-
 =20
  OPENVPN DATA CHANNEL OFFLOAD
  M:	Antonio Quartulli <antonio@openvpn.net>
 +R:	Ralf Lici <ralf@mandelbit.com>
  R:	Sabrina Dubroca <sd@queasysnail.net>
  L:	openvpn-devel@lists.sourceforge.net (subscribers-only)
  L:	netdev@vger.kernel.org
@@@ -21051,7 -20557,6 +21051,7 @@@ ORACLE CLUSTER FILESYSTEM 2 (OCFS2
  M:	Mark Fasheh <mark@fasheh.com>
  M:	Joel Becker <jlbec@evilplan.org>
  M:	Joseph Qi <joseph.qi@linux.alibaba.com>
 +R:	Heming Zhao <heming.zhao@suse.com>
  L:	ocfs2-devel@lists.linux.dev
  S:	Supported
  W:	http://ocfs2.wiki.kernel.org
@@@ -21092,7 -20597,7 +21092,7 @@@ P54 WIRELESS DRIVE
  M:	Christian Lamparter <chunkeey@googlemail.com>
  L:	linux-wireless@vger.kernel.org
  S:	Maintained
 -W:	https://wireless.wiki.kernel.org/en/users/Drivers/p54
 +W:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/p54.html
  F:	Documentation/devicetree/bindings/net/wireless/st,stlc4560.yaml
  F:	drivers/net/wireless/intersil/
 =20
@@@ -21448,6 -20953,7 +21448,6 @@@ M:	Yoshihiro Shimoda <yoshihiro.shimoda
  L:	linux-pci@vger.kernel.org
  L:	linux-renesas-soc@vger.kernel.org
  S:	Maintained
 -F:	Documentation/PCI/controller/rcar-pcie-firmware.rst
  F:	Documentation/devicetree/bindings/pci/*rcar*
  F:	drivers/pci/controller/*rcar*
  F:	drivers/pci/controller/dwc/*rcar*
@@@ -21539,21 -21045,6 +21539,21 @@@ L:	linux-pci@vger.kernel.or
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
@@@ -21916,7 -21407,7 +21916,7 @@@ F:	tools/lib/perf
  F:	tools/perf/
 =20
  PERFORMANCE EVENTS TOOLING ARM64
 -R:	John Garry <john.g.garry@oracle.com>
 +R:	John Garry <john.garry@linux.dev>
  R:	Will Deacon <will@kernel.org>
  R:	James Clark <james.clark@linaro.org>
  R:	Mike Leach <mike.leach@arm.com>
@@@ -22067,15 -21558,6 +22067,15 @@@ F:	drivers/pinctrl/mediatek/pinctrl-rt2
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
@@@ -22352,8 -21834,8 +22352,8 @@@ F:	scripts/Makefile.propelle
 =20
  PRINTK
  M:	Petr Mladek <pmladek@suse.com>
 +M:	John Ogness <john.ogness@linutronix.de>
  R:	Steven Rostedt <rostedt@goodmis.org>
 -R:	John Ogness <john.ogness@linutronix.de>
  R:	Sergey Senozhatsky <senozhatsky@chromium.org>
  S:	Maintained
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git
@@@ -22641,15 -22123,6 +22641,15 @@@ F:	sound/soc/codecs/wcd93*.
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
@@@ -22814,7 -22287,7 +22814,7 @@@ M:	Jeff Johnson <jjohnson@kernel.org
  L:	linux-wireless@vger.kernel.org
  L:	ath12k@lists.infradead.org
  S:	Supported
 -W:	https://wireless.wiki.kernel.org/en/users/Drivers/ath12k
 +W:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath12k.html
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git
  F:	drivers/net/wireless/ath/ath12k/
  N:	ath12k
@@@ -22824,7 -22297,7 +22824,7 @@@ M:	Jeff Johnson <jjohnson@kernel.org
  L:	linux-wireless@vger.kernel.org
  L:	ath10k@lists.infradead.org
  S:	Supported
 -W:	https://wireless.wiki.kernel.org/en/users/Drivers/ath10k
 +W:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath10k.html
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git
  F:	drivers/net/wireless/ath/ath10k/
  N:	ath10k
@@@ -22834,8 -22307,8 +22834,8 @@@ M:	Jeff Johnson <jjohnson@kernel.org
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
@@@ -22844,7 -22317,7 +22844,7 @@@ QUALCOMM ATHEROS ATH9K WIRELESS DRIVE
  M:	Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke.dk>
  L:	linux-wireless@vger.kernel.org
  S:	Maintained
 -W:	https://wireless.wiki.kernel.org/en/users/Drivers/ath9k
 +W:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath9k.html
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git
  F:	Documentation/devicetree/bindings/net/wireless/qca,ath9k.yaml
  F:	drivers/net/wireless/ath/ath9k/
@@@ -22893,7 -22366,6 +22893,7 @@@ F:	drivers/media/platform/qcom/camss
 =20
  QUALCOMM CLOCK DRIVERS
  M:	Bjorn Andersson <andersson@kernel.org>
 +R:	Abel Vesa <abelvesa@kernel.org>
  L:	linux-arm-msm@vger.kernel.org
  S:	Supported
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git
@@@ -22957,7 -22429,6 +22957,7 @@@ L:	netdev@vger.kernel.or
  L:	linux-arm-msm@vger.kernel.org
  S:	Maintained
  F:	Documentation/devicetree/bindings/net/qcom,ethqos.yaml
 +F:	Documentation/devicetree/bindings/net/qcom,sa8255p-ethqos.yaml
  F:	drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
 =20
  QUALCOMM FASTRPC DRIVER
@@@ -23011,15 -22482,6 +23011,15 @@@ S:	Maintaine
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
@@@ -23079,16 -22541,6 +23079,16 @@@ S:	Maintaine
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
@@@ -23132,13 -22584,6 +23132,13 @@@ F:	Documentation/devicetree/bindings/ne
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
@@@ -23155,7 -22600,6 +23155,7 @@@ QUALCOMM PINCTRL DRIVER
  M:	Bartosz Golaszewski <brgl@kernel.org>
  L:	linux-arm-msm@vger.kernel.org
  S:	Supported
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
  F:	Documentation/devicetree/bindings/pinctrl/qcom,*.yaml
  F:	drivers/pinctrl/qcom/
 =20
@@@ -23168,14 -22612,6 +23168,14 @@@ F:	Documentation/networking/device_driv
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
@@@ -23223,7 -22659,7 +23223,7 @@@ M:	Loic Poulain <loic.poulain@oss.qualc
  L:	wcn36xx@lists.infradead.org
  L:	linux-wireless@vger.kernel.org
  S:	Supported
 -W:	https://wireless.wiki.kernel.org/en/users/Drivers/wcn36xx
 +W:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/wcn36xx.ht=
ml
  F:	drivers/net/wireless/ath/wcn36xx/
 =20
  QUANTENNA QTNFMAC WIRELESS DRIVER
@@@ -23240,7 -22676,7 +23240,7 @@@ L:	amd-gfx@lists.freedesktop.or
  S:	Supported
  B:	https://gitlab.freedesktop.org/drm/amd/-/issues
  C:	irc://irc.oftc.net/radeon
 -T:	git https://gitlab.freedesktop.org/agd5f/linux.git
 +T:	git https://gitlab.freedesktop.org/drm/amdgpu/kernel.git
  F:	Documentation/gpu/amdgpu/
  F:	drivers/gpu/drm/amd/
  F:	drivers/gpu/drm/ci/xfails/amd*
@@@ -23574,12 -23010,6 +23574,12 @@@ S:	Maintaine
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
@@@ -23865,13 -23295,6 +23865,13 @@@ S:	Maintaine
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
@@@ -23995,7 -23418,7 +23995,7 @@@ RFKIL
  M:	Johannes Berg <johannes@sipsolutions.net>
  L:	linux-wireless@vger.kernel.org
  S:	Maintained
 -W:	https://wireless.wiki.kernel.org/
 +W:	https://wireless.docs.kernel.org/en/latest/
  Q:	https://patchwork.kernel.org/project/linux-wireless/list/
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-ne=
xt.git
@@@ -24083,8 -23506,7 +24083,8 @@@ F:	drivers/iommu/riscv
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
@@@ -24164,17 -23586,8 +24164,17 @@@ F:	drivers/irqchip/irq-riscv-rpmi-sysms
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
@@@ -24186,12 -23599,11 +24186,12 @@@ N:	spacemi
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
@@@ -24206,7 -23618,7 +24206,7 @@@ M:	Fu Wei <wefu@redhat.com
  L:	linux-riscv@lists.infradead.org
  S:	Maintained
  Q:	https://patchwork.kernel.org/project/riscv-thead/list/
 -T:	git https://github.com/pdp7/linux.git
 +T:	git https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git
  F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
  F:	Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
  F:	Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
@@@ -24331,15 -23743,6 +24331,15 @@@ S:	Maintaine
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
@@@ -24417,7 -23820,6 +24417,7 @@@ F:	drivers/clk/clk-bd718x7.
  F:	drivers/gpio/gpio-bd71815.c
  F:	drivers/gpio/gpio-bd71828.c
  F:	drivers/gpio/gpio-bd72720.c
 +F:	drivers/gpio/gpio-bd73800.c
  F:	drivers/mfd/rohm-bd71828.c
  F:	drivers/mfd/rohm-bd718x7.c
  F:	drivers/mfd/rohm-bd9576.c
@@@ -24437,7 -23839,6 +24437,7 @@@ F:	include/linux/mfd/rohm-bd71815.
  F:	include/linux/mfd/rohm-bd71828.h
  F:	include/linux/mfd/rohm-bd718x7.h
  F:	include/linux/mfd/rohm-bd72720.h
 +F:	include/linux/mfd/rohm-bd73800.h
  F:	include/linux/mfd/rohm-bd957x.h
  F:	include/linux/mfd/rohm-bd96801.h
  F:	include/linux/mfd/rohm-bd96802.h
@@@ -24571,7 -23972,6 +24571,7 @@@ K:	\b(?i:rust)\
 =20
  RUST [ALLOC]
  M:	Danilo Krummrich <dakr@kernel.org>
 +M:	Alice Ryhl <aliceryhl@google.com>
  R:	Lorenzo Stoakes <ljs@kernel.org>
  R:	Vlastimil Babka <vbabka@kernel.org>
  R:	Liam R. Howlett <liam@infradead.org>
@@@ -24589,15 -23989,6 +24589,15 @@@ L:	rust-for-linux@vger.kernel.or
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
@@@ -24906,14 -24297,6 +24906,14 @@@ F:	drivers/clk/samsung/clk-acpm.
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
@@@ -25013,13 -24396,6 +25013,13 @@@ T:	git git://linuxtv.org/media_tree.gi
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
@@@ -25099,11 -24475,6 +25099,11 @@@ R:	Marc Murphy <marc.murphy@sancloud.co
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
@@@ -25317,13 -24688,6 +25317,13 @@@ L:	linux-mmc@vger.kernel.or
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
@@@ -25381,9 -24745,7 +25381,9 @@@ M:	Sudeep Holla <sudeep.holla@kernel.or
  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
  S:	Maintained
  F:	drivers/firmware/smccc/
 +F:	include/linux/arm-smccc-bus.h
  F:	include/linux/arm-smccc.h
 +F:	include/linux/device-id/arm_smccc.h
 =20
  SECURITY CONTACT
  M:	Security Officers <security@kernel.org>
@@@ -25753,6 -25115,13 +25753,6 @@@ F:	drivers/gpio/gpio-siox.
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
@@@ -25776,7 -25145,7 +25776,7 @@@ SIS I2C TOUCHSCREEN DRIVE
  M:	Mika Penttil=C3=A4 <mpenttil@redhat.com>
  L:	linux-input@vger.kernel.org
  S:	Maintained
 -F:	Documentation/devicetree/bindings/input/touchscreen/sis_i2c.txt
 +F:	Documentation/devicetree/bindings/input/touchscreen/sis,9200-ts.yaml
  F:	drivers/input/touchscreen/sis_i2c.c
 =20
  SIS USB2VGA DRIVER
@@@ -25816,7 -25185,7 +25816,7 @@@ R:	David Rientjes <rientjes@google.com
  R:	Roman Gushchin <roman.gushchin@linux.dev>
  L:	linux-mm@kvack.org
  S:	Maintained
 -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/slab.git
  F:	Documentation/admin-guide/mm/slab.rst
  F:	Documentation/mm/slab.rst
  F:	include/linux/mempool.h
@@@ -26185,14 -25554,6 +26185,14 @@@ L:	linux-media@vger.kernel.or
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
@@@ -26370,14 -25731,6 +26370,14 @@@ S:	Maintaine
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
  R:	Avadhut Naik <avadhut.naik@amd.com>
@@@ -26481,7 -25834,6 +26481,7 @@@ F:	tools/spi
 =20
  SPMI SUBSYSTEM
  M:	Stephen Boyd <sboyd@kernel.org>
 +M:	Abel Vesa <abelvesa@kernel.org>
  L:	linux-kernel@vger.kernel.org
  S:	Maintained
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git
@@@ -26849,14 -26201,6 +26849,14 @@@ S:	Supporte
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
  STATIC BRANCH/CALL
  M:	Peter Zijlstra <peterz@infradead.org>
  M:	Josh Poimboeuf <jpoimboe@kernel.org>
@@@ -26877,15 -26221,6 +26877,15 @@@ F:	rust/helpers/jump_label.
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
@@@ -27216,7 -26551,6 +27216,7 @@@ F:	include/linux/soc/amd/isp4_misc.
 =20
  SYNOPSYS DESIGNWARE MIPI CSI-2 RECEIVER DRIVER
  M:	Michael Riesch <michael.riesch@collabora.com>
 +R:	Bryan O'Donoghue <bod@kernel.org>
  L:	linux-media@vger.kernel.org
  S:	Maintained
  F:	Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
@@@ -27254,7 -26588,7 +27254,7 @@@ SYSTEM CONFIGURATION (SYSCON
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
@@@ -27274,7 -26608,6 +27274,7 @@@ F:	drivers/pmdomain/arm
  F:	drivers/powercap/arm_scmi_powercap.c
  F:	drivers/regulator/scmi-regulator.c
  F:	drivers/reset/reset-scmi.c
 +F:	include/linux/device-id/scmi.h
  F:	include/linux/sc[mp]i_protocol.h
  F:	include/trace/events/scmi.h
  F:	include/uapi/linux/virtio_scmi.h
@@@ -27476,6 -26809,11 +27476,6 @@@ S:	Maintaine
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
@@@ -27591,11 -26929,9 +27591,11 @@@ M:	Luca Ceresoli <luca.ceresoli@bootlin
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
@@@ -27680,7 -27016,7 +27680,7 @@@ TEXAS INSTRUMENTS DMA DRIVER
  M:	Vignesh Raghavendra <vigneshr@ti.com>
  L:	dmaengine@vger.kernel.org
  S:	Maintained
 -F:	Documentation/devicetree/bindings/dma/ti-dma-crossbar.txt
 +F:	Documentation/devicetree/bindings/dma/ti,dra7-dma-crossbar.yaml
  F:	Documentation/devicetree/bindings/dma/ti-edma.txt
  F:	Documentation/devicetree/bindings/dma/ti/
  F:	drivers/dma/ti/
@@@ -27905,13 -27241,6 +27905,13 @@@ S:	Maintaine
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
@@@ -28184,8 -27513,8 +28184,8 @@@ F:	drivers/media/platform/ti/vpe
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
@@@ -28332,17 -27661,10 +28332,17 @@@ TOSHIBA TC358743 DRIVE
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
@@@ -28453,22 -27775,6 +28453,22 @@@ F:	kernel/trace/trace_irqsoff.
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
@@@ -28482,7 -27788,6 +28482,7 @@@ S:	Maintaine
  F:	Documentation/devicetree/bindings/trigger-source/*
 =20
  TRUSTED EXECUTION ENVIRONMENT SECURITY MANAGER (TSM)
 +M:	Alexey Kardashevskiy <aik@amd.com>
  M:	Aneesh Kumar K.V <aneesh.kumar@kernel.org>
  M:	Jason Gunthorpe <jgg@nvidia.com>
  R:	Lukas Wunner <lukas@wunner.de>
@@@ -28568,7 -27873,6 +28568,7 @@@ F:	tools/testing/selftests/turbostat
 =20
  TUXEDO DRIVERS
  M:	Werner Sembach <wse@tuxedocomputers.com>
 +M:	Aaron Erhardt <aer@tuxedocomputers.com>
  L:	platform-driver-x86@vger.kernel.org
  S:	Supported
  F:	drivers/platform/x86/tuxedo/
@@@ -28699,12 -28003,6 +28699,12 @@@ F:	Documentation/devicetree/bindings/cl
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
@@@ -28751,9 -28049,8 +28751,9 @@@ F:	lib/union_find.
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
@@@ -28809,7 -28106,6 +28809,7 @@@ UNIWILL LAPTOP DRIVE
  M:	Armin Wolf <W_Armin@gmx.de>
  L:	platform-driver-x86@vger.kernel.org
  S:	Maintained
 +F:	Documentation/ABI/removed/sysfs-driver-uniwill-laptop
  F:	Documentation/ABI/testing/sysfs-driver-uniwill-laptop
  F:	Documentation/admin-guide/laptops/uniwill-laptop.rst
  F:	Documentation/wmi/devices/uniwill-laptop.rst
@@@ -28907,28 -28203,6 +28907,28 @@@ S:	Maintaine
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
@@@ -29451,7 -28725,6 +29451,7 @@@ VFIO SELFTEST
  M:	David Matlack <dmatlack@google.com>
  L:	kvm@vger.kernel.org
  S:	Maintained
 +F:	Documentation/driver-api/vfio-selftests.rst
  F:	tools/testing/selftests/vfio/
 =20
  VFIO VIRTIO PCI DRIVER
@@@ -29550,7 -28823,6 +29550,7 @@@ F:	virt/lib
  VIRTIO AND VHOST VSOCK DRIVER
  M:	Stefan Hajnoczi <stefanha@redhat.com>
  M:	Stefano Garzarella <sgarzare@redhat.com>
 +R:	Bobby Eshleman <bobbyeshleman@meta.com>
  L:	kvm@vger.kernel.org
  L:	virtualization@lists.linux.dev
  L:	netdev@vger.kernel.org
@@@ -29828,12 -29100,6 +29828,12 @@@ S:	Maintaine
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
@@@ -29862,7 -29128,6 +29862,7 @@@ F:	drivers/media/test-drivers/vivid/
 =20
  VM SOCKETS (AF_VSOCK)
  M:	Stefano Garzarella <sgarzare@redhat.com>
 +R:	Bobby Eshleman <bobbyeshleman@meta.com>
  L:	virtualization@lists.linux.dev
  L:	netdev@vger.kernel.org
  S:	Maintained
@@@ -30036,6 -29301,11 +30036,6 @@@ L:	linux-hwmon@vger.kernel.or
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
@@@ -30129,7 -29399,7 +30129,7 @@@ F:	drivers/hid/hid-wiimote
  WILOCITY WIL6210 WIRELESS DRIVER
  L:	linux-wireless@vger.kernel.org
  S:	Orphan
 -W:	https://wireless.wiki.kernel.org/en/users/Drivers/wil6210
 +W:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/wil6210.ht=
ml
  F:	drivers/net/wireless/ath/wil6210/
 =20
  WINBOND CIR DRIVER
@@@ -30168,13 -29438,6 +30168,13 @@@ M:	Miloslav Trmac <mitr@volny.cz
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
@@@ -30182,7 -29445,7 +30182,7 @@@ L:	platform-driver-x86@vger.kernel.or
  S:	Maintained
  F:	Documentation/ABI/stable/sysfs-platform-wmi-bmof
  F:	Documentation/wmi/devices/wmi-bmof.rst
 -F:	drivers/platform/x86/wmi-bmof.c
 +F:	drivers/platform/wmi/bmof.c
 =20
  WOLFSON MICROELECTRONICS DRIVERS
  L:	patches@opensource.cirrus.com
@@@ -30246,14 -29509,6 +30246,14 @@@ F:	drivers/net/wwan
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
@@@ -30663,16 -29918,6 +30663,16 @@@ F:	Documentation/misc-devices/xilinx_sd
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
@@@ -30943,12 -30188,9 +30943,12 @@@ F:	tools/testing/selftests/cgroup/test_
 =20
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

--96++dKwjPkuXJw34
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatt4/QAKCRAv73Ows9A4
ic8BAPwNC42xSPK2lJmoaIxSj55m+N3du5tm5j4wtcSr3Ox4iAD/aPwVsi3qNlSe
iaRy9yMeSXtY4fpYGdbZvN/bbsRXxwE=
=14Hg
-----END PGP SIGNATURE-----

--96++dKwjPkuXJw34--
