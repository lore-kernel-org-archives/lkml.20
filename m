Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1423551FCDF;
	Wed, 16 Sep 2026 14:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569334; cv=none; b=qUN9yTFIJulCDlCEIWTqYSBKeitceyiOaoXSJIwkIdMTeMZHugr3Z2C+R32FdVFkmeA30yatNgaHkA4bo1hv3kHEmTXppc0qOetd+Z+WM72X0HSRBeEkLxwD4VJUAInjlOnFgqhpeZlwyQ8NK5udUjsnELztdQjF/nPsxX67nfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569334; c=relaxed/simple;
	bh=iCNntByuagri6GX/0cHOmsW0p43nmuVacSBdZuqEa5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uSqJD+ZEpYU4ke2tXnozfoAVpi25VkVi0O5G3lHoVoC4hf2QdJdRJeYGtQrahN7r7Ix78PvI1JZuNFOz7tKVktgmhI4LkFd0hAC3cjKz54AXuO4AuBM6W+QQjYGVsr1bUNGkPJVctyFB3EcMg3KoUBf1Ep/G/AzFwaOsx6Bje98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AaD95zpC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AaD95zpC"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:85de:a3c9:9357:b164:bf0b])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 80AA9C42;
	Wed, 16 Sep 2026 16:33:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789569225;
	bh=iCNntByuagri6GX/0cHOmsW0p43nmuVacSBdZuqEa5U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AaD95zpCA7JqphxXvFn1Z8hcaC2VYDyGvvtFXAOFmv5zfKP8fz341yqs8d+I+upzM
	 qbE8F1PgRdfM6FbmjqgGf8kYTwurku77/ReAP4C/gRt9Qm/YKGIYwMGFWitmuFo3CK
	 VBlowqD1lJ9RvwMwa1/FQVJLuS7kM3mGxNa3mSNI=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 16 Sep 2026 20:03:02 +0530
Subject: [PATCH v4 05/10] platform/raspberrypi: vchiq-mmal: Support bayer
 and gray formats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-b4-vchiq-isp-v4-5-f668c2017b74@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4390;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=iCNntByuagri6GX/0cHOmsW0p43nmuVacSBdZuqEa5U=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqqqkKqVMsKpIl+BUu4WJMnEGR3YgWLNg1WJby2
 U0Bgaxbf7OJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaqqpCgAKCRBD3pH5JJpx
 RRRxEADMitT8GMDyJdET/NF5LtegEltL/hpczmWuzcX2PImtu+GLMi8+XpAhZ5toDhGZjZ00eJp
 B12b23i3WD3WWutesbIZBzeiXSAxO7KBntCyyOgz6tBTXPcjzC/J5HaMtoSCcKhQ6O1D05JoyB0
 gfGQDQBX9q164rftgNHQInHDeJQulNdKihaf8IDdh1OdvHjfJS96P2lOSkDbhw+xP8TAcodZ6oq
 LCRanEiSZTxcJ2eeQ4NSL5z8C3hlqMwBzJ6QRZpwo8m4P0NaI0H9e/mT6d7zqNSl5V347jb5hF/
 j1QmJhVxQN8ca7YyUPLNzGK72IodK2/T0AyREd74qLGglcLhQTSMXcbunU5gpk5QLZlVHKUQEcb
 BsQeWytukIKfR/A9309/AAfS7dshNuwXFizoj7Kd4p9RCUa3DHV1hkJeRPEmdlrl5Y75zincshd
 kYhmDpSH3GuDqBkW0JMSptnSwrugLchB6HbXljwAuWA5FrLjkE5MaclGgMyb4vlq6ADf8pJheFd
 9RnoobMPuZ9tEguJ/t9obFgsv8dJ3kVC8XVzQMAe3yeRGqn8RMoS3MD9ldnzqxxS3KvOjamIL4B
 9yFSwEOIgNCItVUIxJZJGKGy2IeQ8k/bFp1IAxr2h60IvUVGReSB63+N4tmALFIxHmRlXzkvdcC
 9PrbvAsrfvccQUw==
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

