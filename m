Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F382C361977;
	Thu, 10 Sep 2026 17:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789061010; cv=none; b=R5EYuvIqcvKNjZi+BCTLTm17J5jT7SOe87ZY17RsGxKHpShtGpmY812HpP0IAXQze/4xDy7dBbKyyRbZil93beDneQSk+OogxlTk/8lHZLcoEVq+KfmEJl/31hJL5eS+z9WpT13Vf6eAi293kFao/alualwOs1BwEUga87Co+18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789061010; c=relaxed/simple;
	bh=zGIoYJxTD+hIwMAPyHiKO4yosOXVoi5ei9gPparQwk8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=formgM14h+nw1Ny0JLwk8HN7BX737GlR1kXF///UZmjGM3CYxe3oxpOEqviI1y4SprcIgxP6gIaMxEdQFe15gnLOMa5vefknsDmqgGMQVvQ1smDzrxrcyLarAiJz5IPEk++jYv6CVgzwX7C9kVsPXOoVvAyFMHAK45SLLL9mScM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=SBeJkH4D; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JBZ/yv3p; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="SBeJkH4D";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JBZ/yv3p"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 164F314000DB;
	Thu, 10 Sep 2026 13:23:10 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Thu, 10 Sep 2026 13:23:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789060990;
	 x=1789147390; bh=4fRgGcK+E/Zt77mkBDKqWwotZSmfgo4V9w7KCVvSSdM=; b=
	SBeJkH4D/sDPOPu8y0Y2EKbE0ifIammkuuNGeeuryvaPgHntkxLvM6lpNevPAA1f
	vtsgPaHHbuMb2mkBik93cDW2bJglQKt0LhoG/esgXytdX9b5fcIoB9aFgJpLa1H4
	A8LPfg4VxpPqNyiPcaRWNChwf9aTTSYvp9eAuUsGNQhM3QCuVMmkkBEcecl/346M
	FOkTtrF0tVSke2+n/cFr11IZOma1BMsYhaiCxvF12ILsGG9aK0fZPxjWa/mylpWt
	PeyVcLwxTT0IKS710LjFDIS24e2ljl/TpV9i2B6UyG2IVIXaV69GT52qVLh4vt1L
	I50LAyjqr2koar1+QbSnEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789060990; x=
	1789147390; bh=4fRgGcK+E/Zt77mkBDKqWwotZSmfgo4V9w7KCVvSSdM=; b=J
	BZ/yv3pRO4m04rZFWkDF6AioD2+Jo03DJBUJv906Hd91AVQos7xXAZi35luS/gmE
	ZRbjojjdbGZ18gRsw5uzM/n7bdBbx0Q5UKhrl7/uXs7/Ak/ewVGbbrxcCecFdw6J
	7O57JOYpge/dpif0FxA8vS0GXvyFlYXaN+i1O5F7G1OsPbgL+QMjBEF8hkZ7MgzD
	qPp/XXB9KypivFfgpo2WgFQweE0ezdq2KPq+gBRmkSXmUnNScYZY73hcSEIayD2n
	SjZWN2WYYeAHHWg9BHv7WKOx5Irv1nB9Zl5gqy/nNA6l1kl7aClwnzkAYsKu3YWH
	AUL83jOzN97Yc/adlELKA==
X-ME-Sender: <xms:feeiavxk-NqyCotEOY-8zw9i-V_gbzMyTkq_9BbrtreIV5SVB67oZA>
    <xme:feeiagPByQpnzxRFWVmRCEMROyUpIUTzEkuNXcT6Rcz5S6Q_KXsRYQofaGLRRzTaa
    e0J5TRPeUfdfriEm7Mv3p0K92klgffglzWYo2WP4XguWqYUYnYkyzYc>
X-ME-Received: <xmr:feeiak4oTbqL5bZvanJUHm3Rb3bf7CoCvHrF-E5PTUo3zvnISMNhKt0wQM4Kt5rnDShYeuEdTRMBmTiXyw4SzBdxrZn8UmA>
X-ME-Proxy-Cause: dmFkZTG2QFDA+iNuUNX1o895p6n98o1glLl3I4m4xmfaPDS///3K7Hfx7PIQfjbm4wu4FD
    +59nbbGCGt2km6RO2OM7c3d0dxWIOqJKI7GExpk5XKY3zJZp8LeXn2FaJKTPBEHPCiydKf
    vMUUULPeFjj1RaMxfLz2tKH/FP1YmY/gIBfGI4Lz/2VpcYNOkVkpZlFbjy5/qShnUDdP9l
    MUTITZ1ix9fu02vXiK4U4vR2/8ELa6BJUL/pnyYkXdjq7ISRf6xI1Gzfi62UDI2o9OXS3a
    5SrBw5Wa66GG6zbHTnFqe3GwfXct/TASh4sDMmcr8kQWAykEd75qN4t/RkMkN8CgZDABsi
    CSzJRSx+9ihb/cvMA6HdlV/oOlCFNfkjzwC66Yu8Q+k4vEQWeI/FO68UbezWPpF9BLNKQd
    G1vYFCILyTqyzIL3MvFpiYH8uuR0cMPKNYufDIxdd/QvKf2aqACKd2BK3NMqyNXchvEr7n
    Pxo+JO8eNEFIMcEGw8BFuzxtDHw7efBsVbt/jZXPU0pnt3uFMbmBzUoIbZg96qF/LDRc8r
    YZrl4qyFkvKowBRCkwxZrPGVYIcAHgirXsVYSdFVKTXAB61FFT8heIRHevQEk9PTfSMN6J
    r/BKxNdc700y1LzqAbC5q8S53pmGsgQHTfIeFJkKAnzN/GQMfU2TBf9OzH6g
X-ME-Proxy: <xmx:feeiapl-aWjggiM_tn-iwvr-1LDdakacOsr_GWCoVj9fsKoRR_3HEQ>
    <xmx:feeiatS3d-hsWF0G6qb1jvbSOOtXCiqwOpUoBSaRNLWlBycN0hiq9g>
    <xmx:feeiagEtf70sLiTicMy42Ky0OSeXo4E2HThoIZmdXmYrmGHquZTNxg>
    <xmx:feeiaqHe9rKZcdT0XtkejvCiNLQqsJoFFOG1ojXZIjrMjK0uYo1k-g>
    <xmx:fueiaiNakWfucnj99e6pLEbHPp68eUEzC3CRfUNy1wYdGrxIUICoywp7>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Sep 2026 13:23:09 -0400 (EDT)
From: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Date: Thu, 10 Sep 2026 19:22:32 +0200
Subject: [PATCH 2/3] media: uapi: videodev2: Add 24-bit Bayer formats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260910-v4l2-add-raw-pix-v1-2-80a8e855b41b@ragnatech.se>
References: <20260910-v4l2-add-raw-pix-v1-0-80a8e855b41b@ragnatech.se>
In-Reply-To: <20260910-v4l2-add-raw-pix-v1-0-80a8e855b41b@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5449; i=niklas.soderlund+renesas@ragnatech.se;
 h=from:subject:message-id;
 bh=zGIoYJxTD+hIwMAPyHiKO4yosOXVoi5ei9gPparQwk8=;
 b=owEBbQKS/ZANAwAKAQm0/3kE+U0kAcsmYgBqoud2P5GTdRwcZ2lZGSE/MpffFRTnGO5c9fLmd
 +IlBIuP9NCJAjMEAAEKAB0WIQRwy9J0OLNPX3a0+3gJtP95BPlNJAUCaqLndgAKCRAJtP95BPlN
 JJbND/0aGvA8+POpNruuS4CLvq9uU9kR4uueDvHxlVnF77HfApVWSygbLBNIVRNEaq/rOACYMdm
 +RdA0epJlYMjCVJ3uw3dUen+5BIgTVQfY17Qimuq7lvVkqxcbN53g1zkKlD6li+o0E6KwbZslOy
 cVJNAfvKChYmQKaU2KDdTBy6fN/D2AHyizNwU5spV2sePl6oAAoPpndpAb2h0Y/WmdrOqCwqidN
 0sGO4fCJdweB7uJCmdBjlC9Lrgm9uD5oqiUmzjOQm/kb76FVXp9RStclu9cZMYqLm9VTrQj3LBo
 PRRt4mkPVhAiUN4L/PvkbNgsVypumABQCBlCNQWRpzSytW1k8FB0R00pKrGE5B62Sgax4ScmPoe
 Su1OQXtaMuM2dmCfN/VimfidjUTHeADZ5zetwJrYmUvM+RTRAkHD6RAPDW5iacuR4zSZVdDlXrL
 YUtKPSVvOSXXzZZFesSDg70IZ8lzwBRVuYQwDdFPWvgngeL+MPAAgP81HIMPDXe3D3xas4bpgwt
 ndBVsNBFCZ+/FCg1w7koY2ROJcIsfq9/Cfi7J1odwVwK6Dph0/BPhnUxvEdcXECJxTdo1P+48xv
 mKOIen96q1sAiYxkiNgOKO6cHY/dZzgGuGF44wdwpC5eqDj+nvyw+LX5+c9QNtkKxmjAEW7AwcB
 W1Z1Rif/f6/CUNA==
X-Developer-Key: i=niklas.soderlund+renesas@ragnatech.se; a=openpgp;
 fpr=9976695FE98693307BF360A2F1591ABD9588DA5F

Add 24-bit Bayer formats and documentation.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../userspace-api/media/v4l/pixfmt-bayer.rst       |   1 +
 .../userspace-api/media/v4l/pixfmt-srggb24.rst     | 102 +++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c               |   4 +
 include/uapi/linux/videodev2.h                     |   4 +
 4 files changed, 111 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
index b93e66d6a27e..9d76def66648 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
@@ -34,3 +34,4 @@ orders. See also `the Wikipedia article on Bayer filter
     pixfmt-srggb14p
     pixfmt-srggb16
     pixfmt-srggb20
+    pixfmt-srggb24
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggb24.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb24.rst
new file mode 100644
index 000000000000..e08a00882d81
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb24.rst
@@ -0,0 +1,102 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
+
+.. _V4L2-PIX-FMT-SRGGB24:
+.. _v4l2-pix-fmt-sbggr24:
+.. _v4l2-pix-fmt-sgbrg24:
+.. _v4l2-pix-fmt-sgrbg24:
+
+***************************************************************************************************************************
+V4L2_PIX_FMT_SBGGR24 ('BG24'), V4L2_PIX_FMT_SGBRG24 ('GB24'), V4L2_PIX_FMT_SGRBG24 ('GR24'), V4L2_PIX_FMT_SRGGB24 ('RG24'),
+***************************************************************************************************************************
+
+
+====================
+24-bit Bayer formats
+====================
+
+
+Description
+===========
+
+These four pixel formats are raw sRGB / Bayer formats with 24 bits per
+sample. Each sample is stored in a 32-bit word. Each n-pixel row contains
+n/2 green samples and n/2 blue or red samples, with alternating red and blue
+rows. Bytes are stored in memory in little endian order. They are
+conventionally described as GRGR... BGBG..., RGRG... GBGB..., etc. Below is
+an example of one sample.
+
+.. cssclass: longtable
+
+.. flat-table:: 24-bit Bayer Formats
+    :header-rows:  2
+    :stub-columns: 0
+
+    * -
+      - :cspan:`31` Sample organization
+    * - Bit
+      - 31
+      - 30
+      - 29
+      - 28
+      - 27
+      - 26
+      - 25
+      - 24
+      - 23
+      - 22
+      - 21
+      - 20
+      - 19
+      - 18
+      - 17
+      - 16
+      - 15
+      - 14
+      - 13
+      - 12
+      - 11
+      - 10
+      - 9
+      - 8
+      - 7
+      - 6
+      - 5
+      - 4
+      - 3
+      - 2
+      - 1
+      - 0
+    * -
+      - *
+      - *
+      - *
+      - *
+      - *
+      - *
+      - *
+      - *
+      - P\ :sub:`23`
+      - P\ :sub:`22`
+      - P\ :sub:`21`
+      - P\ :sub:`20`
+      - P\ :sub:`19`
+      - P\ :sub:`18`
+      - P\ :sub:`17`
+      - P\ :sub:`16`
+      - P\ :sub:`15`
+      - P\ :sub:`14`
+      - P\ :sub:`13`
+      - P\ :sub:`12`
+      - P\ :sub:`11`
+      - P\ :sub:`10`
+      - P\ :sub:`9`
+      - P\ :sub:`8`
+      - P\ :sub:`7`
+      - P\ :sub:`6`
+      - P\ :sub:`5`
+      - P\ :sub:`4`
+      - P\ :sub:`3`
+      - P\ :sub:`2`
+      - P\ :sub:`1`
+      - P\ :sub:`0`
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 14cb94591ea8..cf2831cbdbc8 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1438,6 +1438,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_SGBRG20:	descr = "20-bit Bayer GBGB/RGRG"; break;
 	case V4L2_PIX_FMT_SGRBG20:	descr = "20-bit Bayer GRGR/BGBG"; break;
 	case V4L2_PIX_FMT_SRGGB20:	descr = "20-bit Bayer RGRG/GBGB"; break;
+	case V4L2_PIX_FMT_SBGGR24:	descr = "24-bit Bayer BGBG/GRGR"; break;
+	case V4L2_PIX_FMT_SGBRG24:	descr = "24-bit Bayer GBGB/RGRG"; break;
+	case V4L2_PIX_FMT_SGRBG24:	descr = "24-bit Bayer GRGR/BGBG"; break;
+	case V4L2_PIX_FMT_SRGGB24:	descr = "24-bit Bayer RGRG/GBGB"; break;
 	case V4L2_PIX_FMT_RAW_CRU20:	descr = "14-bit Raw CRU Packed"; break;
 	case V4L2_PIX_FMT_SN9C20X_I420:	descr = "GSPCA SN9C20X I420"; break;
 	case V4L2_PIX_FMT_SPCA501:	descr = "GSPCA SPCA501"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 85a32dee4e21..027c7c7a352c 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -748,6 +748,10 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_SGBRG20 v4l2_fourcc('G', 'B', '2', '0') /* 20  GBGB.. RGRG.. */
 #define V4L2_PIX_FMT_SGRBG20 v4l2_fourcc('G', 'R', '2', '0') /* 20  GRGR.. BGBG.. */
 #define V4L2_PIX_FMT_SRGGB20 v4l2_fourcc('R', 'G', '2', '0') /* 20  RGRG.. GBGB.. */
+#define V4L2_PIX_FMT_SBGGR24 v4l2_fourcc('B', 'G', '2', '4') /* 24  BGBG.. GRGR.. */
+#define V4L2_PIX_FMT_SGBRG24 v4l2_fourcc('G', 'B', '2', '4') /* 24  GBGB.. RGRG.. */
+#define V4L2_PIX_FMT_SGRBG24 v4l2_fourcc('G', 'R', '2', '4') /* 24  GRGR.. BGBG.. */
+#define V4L2_PIX_FMT_SRGGB24 v4l2_fourcc('R', 'G', '2', '4') /* 24  RGRG.. GBGB.. */
 
 /* HSV formats */
 #define V4L2_PIX_FMT_HSV24 v4l2_fourcc('H', 'S', 'V', '3')

-- 
2.55.0

