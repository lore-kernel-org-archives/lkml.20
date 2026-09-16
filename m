Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340BD52BE3D;
	Wed, 16 Sep 2026 14:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569346; cv=none; b=hHVIy3kUVub+xAKXD6q85WdOOhrP/V0gOO4W1y16jNEUX/P5BBmxRG+WvMIVo8xsm8uV52yn5fWKD7mcqg0epKwWKPrppfujJkCNkcN7EReTFu+i4ldT03QGCg8dhTivHzUtzYUAls9kyfSwUc4aiHfOfMJHNfkKClVP/TBYwe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569346; c=relaxed/simple;
	bh=Xphohe89z0TLV/9BLB5FyAHdcroVAJrXQ51HiX2RHDU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W89olxvucUXjFamywIedmIv+iw4/uzizDKSI2Ivli9gQcRLnUjuIzMYFD8L2dq/gtt3tcjeTnlnOYrdYGJ5mniMiooXUEd8RXMWaZz3n4UdyHMuo/0KVXQr+vQ5l1xnfTPwgoBoHG0FHp0JpSfYldOFZyL0Vaa6dx+0++19IwS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SASV+5Cr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SASV+5Cr"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:85de:a3c9:9357:b164:bf0b])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1486EC42;
	Wed, 16 Sep 2026 16:34:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789569242;
	bh=Xphohe89z0TLV/9BLB5FyAHdcroVAJrXQ51HiX2RHDU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SASV+5CrvkIF9rg5JKJ+cPxPOlQ4dodcvFl3MtbVn+BIXTx1CVUxkzS1/6AG83/Tf
	 w4hEeAhxJtPV0x9Z3j8TDCTYz3ttP2fgpAiT0BLEfEpXEggWfslD83LWUxW6Gl+8NV
	 +M3yAGtBjSktCDFe+uGXh1PvopNtNECw4XGL4vHA=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 16 Sep 2026 20:03:05 +0530
Subject: [PATCH v4 08/10] media: platform: broadcom: Move unicam driver to
 subdir
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-b4-vchiq-isp-v4-8-f668c2017b74@ideasonboard.com>
References: <20260916-b4-vchiq-isp-v4-0-f668c2017b74@ideasonboard.com>
In-Reply-To: <20260916-b4-vchiq-isp-v4-0-f668c2017b74@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqqqkNwPBqlbty23UoF4YfS2+UG7CHUYDyGdShd
 6Gzabr4OvSJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaqqpDQAKCRBD3pH5JJpx
 RROnD/4vX7pbew2dB/F8NKexnr7NTFM5tztd2Iw0cRVdgVOq97Msp1oNqpWBjziMTO/gGQulQVj
 14/DeJEegRycml6ezvrIMOSetaHhrE21NrFKPSRUyOKEw3PWC71qVvFW/13dA0P8gOhCgHa7ZtR
 suKgAJvCNBVaZ3cbv8KAxcGo9YdNUaGTSNgdMYsrLa3Jj2uGw5ahX+9N1rW4PPQi9uZeZvn3gm8
 jrJYkiezlKXVQ+GRENxBUAAgBl1nFC2H2A8W67pQe8wVO3w5PLx7D+mDNT0wJkFX5Rh0gxIyH6y
 8+9UCM8uRaBTUz1A6cFfvsLKg9QDLKGKanh0l2WR6qEtTJN2qXmtcTGYKvHTXZoGwHXpAMwBjU2
 s1tb7/V36E4b4bW18T6qk7EYeoZpJtVWth5DyUc8YCJhkc6T0M4epLUBIg3Wy5hyi4uHBPK7TtN
 m0EGeKx4iTn0ZZIngVKvIth7c1/DgAMWvHg1fbVLT+WY4KNx13OrDv5KOBI5/eVqymqunHmEwmt
 61kPbxlqhPpkgnLKapUiPUMkAxiX+CG4miLA4yJeYKLePBe3u008pCFSydrXr9xkY5KavllaMUE
 EbSQHiZ5PG/M7cMK2u5bVvyjA2Ox2CfTwrpvwlMz2xCXfqWLCtdbpcNc0Yws+Mltg6tGly2CIy4
 ZyDfBl7/v0XrJqw==
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

