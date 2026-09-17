Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE24439320;
	Thu, 17 Sep 2026 08:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633559; cv=none; b=Si9IUU3LlcCUjd0SteVHrS/xD6+NQ09+D6s0I2oucJEdZag5P83gqFt+RiQu96onCoP1C34xv1uAmoYlZN0F+4MLdNiRWvKaNc1h1E+2zYqwxOFQ6TOWI4Wzm7OEnoOxbwGPAXwb/QV+3GN7JVIXm8qSIOsQ4sL01Yde1dFCnLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633559; c=relaxed/simple;
	bh=iCNntByuagri6GX/0cHOmsW0p43nmuVacSBdZuqEa5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o5hQvklfs5Wh8/rEJObSlLJZowY1VjTErpHcSlZLvp+qC3cXDYnsSjJ6U08IFBGd7Eb/UnSiQPs2hnUwFbZVQEiSSO8cLmcR5UqkB/bUYwf1sjhzLq7gTgd3zeqbHoIl0ZAJDhT331zjpadL7ZXyb/NgEFFUwaS3rGy9MineuCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oDboan0O; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oDboan0O"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:85de:a3c9:9357:b164:bf0b])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 531B7512;
	Thu, 17 Sep 2026 10:23:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789633426;
	bh=iCNntByuagri6GX/0cHOmsW0p43nmuVacSBdZuqEa5U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oDboan0OC4tSQgCGuM81al37SgpIT7sCr8IZbnqd3zjXN4OfO0BkIoOGOFPMh09NJ
	 qAaj4oTvhW40hF8VXHwuHwhN7pOsW4TN7B+namWI8GxOdcqH02fdcuVL5le4dM/mHT
	 afSdHIv4Zb70mkqRUMV2+oOFkiwx8UbzRVpi1Zn8=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 17 Sep 2026 13:53:11 +0530
Subject: [PATCH v5 05/10] platform/raspberrypi: vchiq-mmal: Support bayer
 and gray formats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-b4-vchiq-isp-v5-5-2d8870add2c0@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4390;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=iCNntByuagri6GX/0cHOmsW0p43nmuVacSBdZuqEa5U=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqq6PSiKPsgKBoEnB5Kuu6EQJrstlV+N49xdl35
 HMIBEFnUraJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaquj0gAKCRBD3pH5JJpx
 RX1RD/9xow8H1N1ydkl4q19Y2No8lgRYsWq+m1WMlIBGjzP3y9/F5AGcbKDBLdjfAc46A22c/tc
 zBKiXy4lvGaBjPqF3tjjNmjBQrLGl91jfKUUNodybD75b5lDz0l1WyeB8Cmmsg1T5SH4AI968o1
 w6fQSpfMgKC3XQTVVhGg9kdzObKxPVv9YSZDCjZoL5xgkQucxG0v1/wDK/c5XDkAw3R783FT6Dc
 k91wtFRiJN1HIiXJwIMy0u1pcbsRnMT9GWtPva8ebBIa14yi+hn1HaSjMRTFUyhdLS/jS3R8+2C
 yBT1nrX/fX2a6jz+uAaqXqr89o2S9wEszRpHQwabX15HU6Szg3QnMshg1WtTNfr1rln6XOZL1ru
 WTc9c93RSIWrZ1gO+sCoNQfcemu6gcY48PqUEtjDAdkjyuN74+VUKTytcdNtfcKJ2mm8r6IlbfV
 1gGBNA/Zt3w2aRnbsdZ04CFI7M5CZuZmpB90rCMTmQXP4yBUHr2i3pfDWqUcpN/2NZDufiZ4dX5
 wnLzn6lWJajWMFfjtTgkAG+G30BjQ4yIupLWBmNXR5qE3j+HIlGMZfP4vTMsCTzx+4Oco46GLd0
 zoF6mU+naf4VIp9UxUHv33ivN2ReH2ocwZ+3tdv9hTGyXmH7+b7xvTo4BK7Cto8VlyqAXHJ+UK5
 Hu9F8sxLryxlTSQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Raw camera sensors often send data as packed or unpacked bayer and gray
formats, which needs to be processed by the ISP.

Add macros to support bayer and gray format FOURCCs in the MMAL layer.

Tested-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v4:
- Drop comment about FourCC values being copied from V4L2
---
 include/linux/raspberrypi/mmal-encodings.h | 63 ++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/include/linux/raspberrypi/mmal-encodings.h b/include/linux/raspberrypi/mmal-encodings.h
index eadf2e981408..fd9cd840cb7b 100644
--- a/include/linux/raspberrypi/mmal-encodings.h
+++ b/include/linux/raspberrypi/mmal-encodings.h
@@ -69,6 +69,69 @@
  */
 #define MMAL_ENCODING_OPAQUE           MMAL_FOURCC('O', 'P', 'Q', 'V')
 
+/**
+ * Bayer formats
+ */
+/* 8 bit per pixel Bayer formats. */
+#define MMAL_ENCODING_BAYER_SBGGR8     MMAL_FOURCC('B', 'A', '8', '1')
+#define MMAL_ENCODING_BAYER_SGBRG8     MMAL_FOURCC('G', 'B', 'R', 'G')
+#define MMAL_ENCODING_BAYER_SGRBG8     MMAL_FOURCC('G', 'R', 'B', 'G')
+#define MMAL_ENCODING_BAYER_SRGGB8     MMAL_FOURCC('R', 'G', 'G', 'B')
+
+/* 10 bit per pixel packed Bayer formats. */
+#define MMAL_ENCODING_BAYER_SBGGR10P   MMAL_FOURCC('p', 'B', 'A', 'A')
+#define MMAL_ENCODING_BAYER_SGRBG10P   MMAL_FOURCC('p', 'g', 'A', 'A')
+#define MMAL_ENCODING_BAYER_SGBRG10P   MMAL_FOURCC('p', 'G', 'A', 'A')
+#define MMAL_ENCODING_BAYER_SRGGB10P   MMAL_FOURCC('p', 'R', 'A', 'A')
+
+/* 12 bit per pixel packed Bayer formats. */
+#define MMAL_ENCODING_BAYER_SBGGR12P   MMAL_FOURCC('p', 'B', '1', '2')
+#define MMAL_ENCODING_BAYER_SGRBG12P   MMAL_FOURCC('p', 'g', '1', '2')
+#define MMAL_ENCODING_BAYER_SGBRG12P   MMAL_FOURCC('p', 'G', '1', '2')
+#define MMAL_ENCODING_BAYER_SRGGB12P   MMAL_FOURCC('p', 'R', '1', '2')
+
+/* 14 bit per pixel packed Bayer formats. */
+#define MMAL_ENCODING_BAYER_SBGGR14P   MMAL_FOURCC('p', 'B', 'E', 'E')
+#define MMAL_ENCODING_BAYER_SGBRG14P   MMAL_FOURCC('p', 'G', 'E', 'E')
+#define MMAL_ENCODING_BAYER_SGRBG14P   MMAL_FOURCC('p', 'g', 'E', 'E')
+#define MMAL_ENCODING_BAYER_SRGGB14P   MMAL_FOURCC('p', 'R', 'E', 'E')
+
+/* 16 bit per pixel Bayer formats. */
+#define MMAL_ENCODING_BAYER_SBGGR16    MMAL_FOURCC('B', 'G', '1', '6')
+#define MMAL_ENCODING_BAYER_SGBRG16    MMAL_FOURCC('G', 'B', '1', '6')
+#define MMAL_ENCODING_BAYER_SGRBG16    MMAL_FOURCC('G', 'R', '1', '6')
+#define MMAL_ENCODING_BAYER_SRGGB16    MMAL_FOURCC('R', 'G', '1', '6')
+
+/* 10 bit per pixel unpacked (16bit) Bayer formats. */
+#define MMAL_ENCODING_BAYER_SBGGR10    MMAL_FOURCC('B', 'G', '1', '0')
+#define MMAL_ENCODING_BAYER_SGRBG10    MMAL_FOURCC('B', 'A', '1', '0')
+#define MMAL_ENCODING_BAYER_SGBRG10    MMAL_FOURCC('G', 'B', '1', '0')
+#define MMAL_ENCODING_BAYER_SRGGB10    MMAL_FOURCC('R', 'G', '1', '0')
+
+/* 12 bit per pixel unpacked (16bit) Bayer formats */
+#define MMAL_ENCODING_BAYER_SBGGR12    MMAL_FOURCC('B', 'G', '1', '2')
+#define MMAL_ENCODING_BAYER_SGRBG12    MMAL_FOURCC('B', 'A', '1', '2')
+#define MMAL_ENCODING_BAYER_SGBRG12    MMAL_FOURCC('G', 'B', '1', '2')
+#define MMAL_ENCODING_BAYER_SRGGB12    MMAL_FOURCC('R', 'G', '1', '2')
+
+/* 14 bit per pixel unpacked (16bit) Bayer formats */
+#define MMAL_ENCODING_BAYER_SBGGR14    MMAL_FOURCC('B', 'G', '1', '4')
+#define MMAL_ENCODING_BAYER_SGBRG14    MMAL_FOURCC('G', 'B', '1', '4')
+#define MMAL_ENCODING_BAYER_SGRBG14    MMAL_FOURCC('G', 'R', '1', '4')
+#define MMAL_ENCODING_BAYER_SRGGB14    MMAL_FOURCC('R', 'G', '1', '4')
+
+/* MIPI packed monochrome images */
+#define MMAL_ENCODING_GREY    MMAL_FOURCC('G', 'R', 'E', 'Y')
+#define MMAL_ENCODING_Y10P    MMAL_FOURCC('Y', '1', '0', 'P')
+#define MMAL_ENCODING_Y12P    MMAL_FOURCC('Y', '1', '2', 'P')
+#define MMAL_ENCODING_Y14P    MMAL_FOURCC('Y', '1', '4', 'P')
+#define MMAL_ENCODING_Y16     MMAL_FOURCC('Y', '1', '6', ' ')
+
+/* Unpacked monochrome formats (16bit per sample, but only N LSBs used) */
+#define MMAL_ENCODING_Y10     MMAL_FOURCC('Y', '1', '0', ' ')
+#define MMAL_ENCODING_Y12     MMAL_FOURCC('Y', '1', '2', ' ')
+#define MMAL_ENCODING_Y14     MMAL_FOURCC('Y', '1', '4', ' ')
+
 /** An EGL image handle
  */
 #define MMAL_ENCODING_EGL_IMAGE        MMAL_FOURCC('E', 'G', 'L', 'I')

-- 
2.55.0

