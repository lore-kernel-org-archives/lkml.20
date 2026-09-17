Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F75433AD;
	Thu, 17 Sep 2026 15:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789660624; cv=none; b=bRHizJ01JrGVayJ1Pz9w5efGNF78sPyD6EM6QAw2MaiPICFWejbCGruAxV+jP0Mn70me6KHmeTC0Gv8csM+B6JcRZfVdVkEN0JSiiAvbvNWS3CRmaatkBvIPdDw90R8ePZvSbI/aBh2c7rcYyUHXSL/zQneVinuMp0pKktt+X/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789660624; c=relaxed/simple;
	bh=/eEvWIGvI3aKrQ4e1fj77fUtnMYfN2KrI7neR/7GoCY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U1DkRS43NQ4l8AxIG8SAlOife/RUUxQOGgHQ08uZxxbQvu1igXS/WEAM1RHMHiloUiwSvkXivKrUbrBIOLBhLmmYUa62aHPtNcbB+kpH/iAzfWzWOlR3C4rUJGKMC1+Mq0LUblJTmqlM6QUZrUv/I92UBHMUtu8qBUwW8HaaoC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g8qX6gmb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g8qX6gmb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 346F31F000FF;
	Thu, 17 Sep 2026 15:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789660623;
	bh=f0ZOP0Yw/WONd2MaPzjS3OZNsmbzgPVfLO/uHIlT6Ts=;
	h=From:To:Cc:Subject:Date;
	b=g8qX6gmbZQpEq5eT71AJ5gbmxXa19dxWffSxyX9o9TjpZ8w0Tfk3p3RCh2re0xVt6
	 kbouqQWxgZ45GwgVGaAuyeNdp3iIriXOra7LnafrrhwEvagSrnSZP6e7s980O5vtYo
	 jYzzQT4nh09Js8TvECdCRI4nNX4EisYM3H6FzFCrqIt2CfukNNkrbUjiSPIpfhwl8p
	 nAzm2Z+DSAT/fW2G/MAshmAHNGN/C/3NKU5G/lC3zT1hknaTOK+M7p+V5Ipd8Qs7wg
	 /6gFHEGHhr/nraKAeAtIdKPgFNWmMh9T5+SgP5IgbX1gNem3i0yJOTBiMKS70kJgP8
	 PwqgYADb7bPvw==
From: Arnd Bergmann <arnd@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linusw@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] usb: gadget: pxa25x: prevent ixp4xx + pxa25x combination
Date: Thu, 17 Sep 2026 17:56:27 +0200
Message-ID: <20260917155657.2200191-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The USB gadget driver is one of the holdouts of Arm single-platform
support that conflicts with a multiplatform kernel. Trying to
build this for both Intel PXA and IXP fails with:

drivers/usb/gadget/udc/pxa25x_udc.c:144:9: error: 'UDCCS_IO_ROF' redefined [-Werror]
  144 | #define UDCCS_IO_ROF    (1 << 2)        /* Receive overflow */
      |         ^~~~~~~~~~~~
drivers/usb/gadget/udc/pxa25x_udc.c:141:9: note: this is the location of the previous definition
  141 | #define UDCCS_IO_ROF    (1 << 3)        /* Receive overflow */
      |         ^~~~~~~~~~~~
drivers/usb/gadget/udc/pxa25x_udc.c:232:2: error: #error "Can't configure both IXP and PXA"
  232 | #error "Can't configure both IXP and PXA"

Until recently this was not a problem, as ixp4xx was only big-endian
and pxa is only little-endian, so these could never be in the same
kernel image.

As this has changed recently, an allmodconfig kernel for ARMv5 runs
into the above failure. I don't think this is an important scenario
in practice, especially as pxa25x support is already rather broken,
so prevent this configuration using a Kconfig dependency, and
rework the driver to allow a combined ixp4xx/pxa3xx kernel that
only uses this driver on ixp.

Cc: Linus Walleij <linusw@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/usb/gadget/udc/Kconfig      | 1 +
 drivers/usb/gadget/udc/pxa25x_udc.c | 8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
index 7ddbc2606686..5142f70b6f3a 100644
--- a/drivers/usb/gadget/udc/Kconfig
+++ b/drivers/usb/gadget/udc/Kconfig
@@ -126,6 +126,7 @@ config USB_OMAP
 config USB_PXA25X
 	tristate "PXA 25x or IXP 4xx"
 	depends on (ARCH_PXA && PXA25x) || ARCH_IXP4XX
+	depends on !(PXA25x && ARCH_IXP4XX)
 	depends on HAS_IOMEM
 	help
 	   Intel's PXA 25x series XScale ARM-5TE processors include
diff --git a/drivers/usb/gadget/udc/pxa25x_udc.c b/drivers/usb/gadget/udc/pxa25x_udc.c
index 594d67193763..7e158ca73fa1 100644
--- a/drivers/usb/gadget/udc/pxa25x_udc.c
+++ b/drivers/usb/gadget/udc/pxa25x_udc.c
@@ -140,7 +140,7 @@
 #ifdef CONFIG_ARCH_IXP4XX /* FIXME: is this right?, datasheed says '2' */
 #define UDCCS_IO_ROF	(1 << 3)	/* Receive overflow */
 #endif
-#ifdef CONFIG_ARCH_PXA
+#ifdef CONFIG_PXA25x
 #define UDCCS_IO_ROF	(1 << 2)	/* Receive overflow */
 #endif
 #define UDCCS_IO_DME	(1 << 3)	/* DMA enable */
@@ -228,7 +228,7 @@ static const char ep0name [] = "ep0";
 #ifdef CONFIG_ARCH_IXP4XX
 
 /* cpu-specific register addresses are compiled in to this code */
-#ifdef CONFIG_ARCH_PXA
+#ifdef CONFIG_PXA25x
 #error "Can't configure both IXP and PXA"
 #endif
 
@@ -2230,7 +2230,7 @@ static struct pxa25x_udc memory = {
 
 #define CP15R0_VENDOR_MASK	0xffffe000
 
-#if	defined(CONFIG_ARCH_PXA)
+#if	defined(CONFIG_PXA25x)
 #define CP15R0_XSCALE_VALUE	0x69052000	/* intel/arm/xscale */
 
 #elif	defined(CONFIG_ARCH_IXP4XX)
@@ -2282,7 +2282,7 @@ static int pxa25x_udc_probe(struct platform_device *pdev)
 
 	/* trigger chiprev-specific logic */
 	switch (chiprev & CP15R0_PRODREV_MASK) {
-#if	defined(CONFIG_ARCH_PXA)
+#if	defined(CONFIG_PXA25x)
 	case PXA255_A0:
 		dev->has_cfr = 1;
 		break;
-- 
2.53.0

