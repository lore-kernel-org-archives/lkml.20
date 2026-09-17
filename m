Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F5942E400;
	Thu, 17 Sep 2026 08:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633597; cv=none; b=FWbSkgkLU4anS91CYQdXHYOxboG9DbRtHA3Nqh2dsktJpDz1ATTz9CRY1D6xmbhke9T+5+ZrwNg8Pnli38AXDXZxt99jE8x3RlFKYSJkT+GKmPIejfpwmKUen4d2RWIBXTacoA+mTzK4IypH7D/Szed32dmM2JCOqsFJnRJvmWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633597; c=relaxed/simple;
	bh=Xphohe89z0TLV/9BLB5FyAHdcroVAJrXQ51HiX2RHDU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JokvfV6hT5TOdG4TzIUN3HIbfLPS6cLvAnyyTW1kxiyJjSSh2SVMLP7Oay5F38flKE/5pM8LDgJM/XLXoG9s5l8Mp1oL5TES40LlPoXeivzwaJY3EFC6v2m8kPj2eRBGG8+6iac0Anl5h2mfWrKlGDv/U711x5+v7B4RDyLHyLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rSOg4Bro; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rSOg4Bro"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:85de:a3c9:9357:b164:bf0b])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2E0C1283;
	Thu, 17 Sep 2026 10:24:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789633443;
	bh=Xphohe89z0TLV/9BLB5FyAHdcroVAJrXQ51HiX2RHDU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rSOg4BroygBgxAl7P2vTrqSr98Tr/7TmE+6wcWMIZEhbEcmQxYQJJogNt2sZHJixd
	 CKPz2ZkKMSuHlaPO22PKZ275GfP7Sr+SJ/LjYTW6oyhBli5bwcrwf4G3HIJNsoK+gg
	 2wiZFPg8LWpAAZSWw0QaPuKJXQfC/lgPx+1xRXv4=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 17 Sep 2026 13:53:14 +0530
Subject: [PATCH v5 08/10] media: platform: broadcom: Move unicam driver to
 subdir
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-b4-vchiq-isp-v5-8-2d8870add2c0@ideasonboard.com>
References: <20260917-b4-vchiq-isp-v5-0-2d8870add2c0@ideasonboard.com>
In-Reply-To: <20260917-b4-vchiq-isp-v5-0-2d8870add2c0@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Paul Elder <paul.elder@ideasonboard.com>, Hans Verkuil <hans@jjverkuil.nl>, 
 Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5004;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=Xphohe89z0TLV/9BLB5FyAHdcroVAJrXQ51HiX2RHDU=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqq6PV1HtzBG0ew43VacKWIghz06ZOi+Cb0b3KZ
 IS1eIyYaHOJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaquj1QAKCRBD3pH5JJpx
 RbYNEACMnYMhBNiJ4TM3z11jCqTbzEgwYDKftx6F/fZqIgMSC/L2yyTIrBSbZoF6uQIn1iwF4e4
 8gFUbwY7yP/gLAYY3U5WMm+GxIn5LPbNOvKTTngyCNelTq6X58iwk+aCchnqB2FpSvCLBjjVL1Q
 cRqoIVoUI5SgpoibRbZxaMU6i3GBHOzejJxm0JkQxVkpJmnDfa8aJTkS6Wm8A9KeUZ/ngQlCG4R
 xV1Brs+KYnXy8mxfuMbaXgpCjO1TQCEQh9EzFq46ebDlb+D8UWy480ANRrtTSF327pUBgHwpXT4
 wVnBUeLG3XLsjxbpidYXaGFEj4lxySQP8Xq130tA0i5cp4Aby4pxZQ3GLEuv4J3PS4iAeyIkYSV
 wSl17UKChn4MPneH4hiKaFXxRPhQlkZmEWxaeNAeYlX4Wcx2UBrieLtXZ9bAAYeTZCNROxFJf78
 gOpbJxv/8G6U3/IqHgGUbFxXoyI2UbaAagWYzH5Fjdf0DTaycMjNn/sAU90XsjUoUeQhYsf3f4A
 9osU74OW6owwJH2bi1e3Rc6GvNPbNX13Ip4LNiBNV1gzrHy8AG9PROqYn0zy2jI4XpI6M6xociB
 z9PywuJKWgNSRJoJWTZkd9vREp5O8etRVtVL/6pLq5ZgJYOe7F2s1/0ATw+4J/j10nFtVMrzGFg
 82G82iLvAfltRrg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The BCM283x/BCM2711x SoCs capture camera frames using CSI-2, and
optionally process the raw frames using a VC4 firmware-based ISP block.

As the ISP driver will be added subsequently, move the files related to
the unicam driver to a separate subdirectory to ease distinction between
the two drivers' files.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
Tested-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v4:
- Drop old paragraph in Kconfig that got copied from previous revision
---
 MAINTAINERS                                            |  2 +-
 drivers/media/platform/broadcom/Kconfig                | 17 ++---------------
 drivers/media/platform/broadcom/Makefile               |  2 +-
 drivers/media/platform/broadcom/bcm2835-unicam/Kconfig | 18 ++++++++++++++++++
 .../media/platform/broadcom/bcm2835-unicam/Makefile    |  3 +++
 .../{ => bcm2835-unicam}/bcm2835-unicam-regs.h         |  0
 .../broadcom/{ => bcm2835-unicam}/bcm2835-unicam.c     |  0
 7 files changed, 25 insertions(+), 17 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0ac9a9d7b215..68ef4b2f9db6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5185,7 +5185,7 @@ M:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
-F:	drivers/media/platform/broadcom/bcm2835-unicam*
+F:	drivers/media/platform/broadcom/bcm2835-unicam/*
 
 BROADCOM BCM47XX MIPS ARCHITECTURE
 M:	Hauke Mehrtens <hauke@hauke-m.de>
diff --git a/drivers/media/platform/broadcom/Kconfig b/drivers/media/platform/broadcom/Kconfig
index 93ba565d9a02..cab44885182c 100644
--- a/drivers/media/platform/broadcom/Kconfig
+++ b/drivers/media/platform/broadcom/Kconfig
@@ -1,18 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
-config VIDEO_BCM2835_UNICAM
-	tristate "Broadcom BCM283x/BCM271x Unicam video capture driver"
-	depends on ARCH_BCM2835 || COMPILE_TEST
-	depends on COMMON_CLK && PM
-	depends on VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select V4L2_FWNODE
-	select VIDEO_V4L2_SUBDEV_API
-	select VIDEOBUF2_DMA_CONTIG
-	help
-	  Say Y here to enable support for the BCM283x/BCM271x CSI-2 receiver.
-	  This is a V4L2 driver that controls the CSI-2 receiver directly,
-	  independently from the VC4 firmware.
+comment "Broadcom BCM283x/BCM271x media platform drivers"
 
-	  To compile this driver as a module, choose M here. The module will be
-	  called bcm2835-unicam.
+source "drivers/media/platform/broadcom/bcm2835-unicam/Kconfig"
diff --git a/drivers/media/platform/broadcom/Makefile b/drivers/media/platform/broadcom/Makefile
index 03d2045aba2e..33a89bdb0029 100644
--- a/drivers/media/platform/broadcom/Makefile
+++ b/drivers/media/platform/broadcom/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-$(CONFIG_VIDEO_BCM2835_UNICAM) += bcm2835-unicam.o
+obj-y += bcm2835-unicam/
diff --git a/drivers/media/platform/broadcom/bcm2835-unicam/Kconfig b/drivers/media/platform/broadcom/bcm2835-unicam/Kconfig
new file mode 100644
index 000000000000..93ba565d9a02
--- /dev/null
+++ b/drivers/media/platform/broadcom/bcm2835-unicam/Kconfig
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config VIDEO_BCM2835_UNICAM
+	tristate "Broadcom BCM283x/BCM271x Unicam video capture driver"
+	depends on ARCH_BCM2835 || COMPILE_TEST
+	depends on COMMON_CLK && PM
+	depends on VIDEO_DEV
+	select MEDIA_CONTROLLER
+	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
+	select VIDEOBUF2_DMA_CONTIG
+	help
+	  Say Y here to enable support for the BCM283x/BCM271x CSI-2 receiver.
+	  This is a V4L2 driver that controls the CSI-2 receiver directly,
+	  independently from the VC4 firmware.
+
+	  To compile this driver as a module, choose M here. The module will be
+	  called bcm2835-unicam.
diff --git a/drivers/media/platform/broadcom/bcm2835-unicam/Makefile b/drivers/media/platform/broadcom/bcm2835-unicam/Makefile
new file mode 100644
index 000000000000..03d2045aba2e
--- /dev/null
+++ b/drivers/media/platform/broadcom/bcm2835-unicam/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_VIDEO_BCM2835_UNICAM) += bcm2835-unicam.o
diff --git a/drivers/media/platform/broadcom/bcm2835-unicam-regs.h b/drivers/media/platform/broadcom/bcm2835-unicam/bcm2835-unicam-regs.h
similarity index 100%
rename from drivers/media/platform/broadcom/bcm2835-unicam-regs.h
rename to drivers/media/platform/broadcom/bcm2835-unicam/bcm2835-unicam-regs.h
diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam/bcm2835-unicam.c
similarity index 100%
rename from drivers/media/platform/broadcom/bcm2835-unicam.c
rename to drivers/media/platform/broadcom/bcm2835-unicam/bcm2835-unicam.c

-- 
2.55.0

