Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482824;
	b=UKgypzVCSZPrL260G7NsSR4/uJH8+C6yISudkrA085SPpVUadxg+JC6aYwviwdXTOAPh
	 zAk5/p/xTgAw3cKq6snAKN2GZa3jVf/OcHZJxaViGfqkOxhf5ibHLx2OxVfmBCdS52s65
	 Z6xBcKLVi7Tl/Q4coFJNZ+w6gqnxqSHiityAIWWiL6yGzGctNNGxDlXuK8wGXFAYrEXtC
	 MQtg51UWdcitiIYBS1VuUQYdMAt1y4nAn92KQbAOE2JogMu4ct9iYO+G92keE9YFcbjA7
	 bekNqm1Sn3/SrCcSRwUe0p91Rq4p8MP5Mg7JxwTuLVog/sv7HYFCa4Tg2f0ELg5L1yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482824;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=wPoARDbP77plNa9wKA33jBrkgBFk1d1ilZ6nv4pbO5c=;
	b=z2oz7yzwmoMVP0dCAml5PyemQJVxVTkSUmkCs0kBYZmy2gHTi8Xk7OkGSKmH5EbGIehW
	 GupSKAHh7H5/QMwQpK6zoBjwr1Fl/L7TvrszB6aN315zmRXXka65X6QvpeTxXWuaKtmp6
	 rm7mANdKnkQfeHvOlsyRuW42Hi1hh+ucL4Fm7pdsKiX472maqR/TrVv+QKtNqXyceRpUR
	 ic1kth2npa75HVFiFhfW4DuXZ82JkgqKaF1Z8fT4q5VUtL20Vp3sn48XKN/xwJ4oUhCPX
	 UrpvXrfj/norotsDCjMRz73OHILZVNX8Iz0oyR83Gh4sJuXRrqQYd8/BPOeYDBk7i+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=H0KFnDOs;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9CA606A8B3;
	Thu, 12 Nov 2026 11:27:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F9CA606A8B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=H0KFnDOs
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:cdf:7464:6c04:36e4:ee87])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D7717E9C;
	Thu, 12 Nov 2026 12:24:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794482679;
	bh=qXGE+lHjfIKi6L8Q0RC6CpYpy+XKd4ufo1upEPlf0jk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=H0KFnDOsgwMKpgDEa4+GL3PauEmu1hYyBUBZab2SQWp0Nw3Lqc2pGJO+jgIBYk7uL
	 AtQC960rgGzXe7JLUXPDhkBPGVoG/FWvjb9tWc7jjrPXK3wL9hqHb3hNMkCYQkkHxX
	 9C8XjjWQmbi7GlW7ok1Q+N7pSdlGu7cHwQ4e16Gk=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 12 Nov 2026 16:56:31 +0530
Subject: [PATCH v6 3/5] media: platform: broadcom: Move unicam driver to
 subdir
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-b4-vchiq-isp-v6-3-711b48378367@ideasonboard.com>
References: <20261112-b4-vchiq-isp-v6-0-711b48378367@ideasonboard.com>
In-Reply-To: <20261112-b4-vchiq-isp-v6-0-711b48378367@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4911;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=qXGE+lHjfIKi6L8Q0RC6CpYpy+XKd4ufo1upEPlf0jk=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBq9aJqYruTkqAy9NBASe7FS+c8LxaTF2pIUyxw2
 px8x1h9yYOJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCavWiagAKCRBD3pH5JJpx
 RbaEEACkeY7uiLVx1w2pW+ZjTmehYvslizMlv5KVktygq20lu4TaezeyPC7cSdGUpQ6t2hUCZAP
 pK+l38KqH2jo/EaZH4O6tM5BEM67scxx5YdO5LP294qhJ/lEUVJySo+RV59ybru3nM6e3xrFkEB
 jCQaiLHb/D7Jkf6AgRsz0Zjkwwtghw3Wam6EYPGqU7CKQRRlUgifdetWjeVVMMzXJDOJKXIkkSx
 d3e8kBC6u1VqoDRDazmStmP1TrcPWCxWHigM0xry97jGGdI6f1gjrVkFv1tPbtda/hcmfhveqqs
 4o0eFYF70cDTJjwhTKW7gN2gPKMXYNU42mQOz0PMU9oWu3RPisdYPvYlmJK274a1Qe88/3d8QVm
 mLTJhV/TiJDxsPFd2ffO//wVjved88tSmx9e1J7RLBXPQvjrMgPpmkWEbxWGk+HwKhL7Os5WRQj
 nE7c3iGJztiwRdpdQlFJF2UXvJPkO1EKXj8D7Voob9QvHs/3R6M7sgPIAT9ibGgl83OwBfPa47k
 QMYsz6JpoCe27r1YJ8zUBvWz5f+MyS3v+3WpGyfJMOjFabwf5yHQ7+q3bQn56qUMnG9cXJgIBFd
 5rcnqf2ElVkBkyCmuzqZOq8uU0CxlIWnRfW+3Q5D/fA/wnsCgythMirur5vsEDFDS7f/ehyGzKY
 cN88w97hn37FOkg==
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
 MAINTAINERS                                            |  2 +-
 drivers/media/platform/broadcom/Kconfig                | 17 ++---------------
 drivers/media/platform/broadcom/Makefile               |  2 +-
 drivers/media/platform/broadcom/bcm2835-unicam/Kconfig | 18 ++++++++++++++++++
 .../media/platform/broadcom/bcm2835-unicam/Makefile    |  3 +++
 .../{ => bcm2835-unicam}/bcm2835-unicam-regs.h         |  0
 .../broadcom/{ => bcm2835-unicam}/bcm2835-unicam.c     |  0
 7 files changed, 25 insertions(+), 17 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 94740f66baa4..1393e8ce9065 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5344,7 +5344,7 @@ M:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
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
2.56.0

