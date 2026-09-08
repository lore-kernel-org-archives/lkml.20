Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F2759B67B;
	Tue,  8 Sep 2026 20:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788897845; cv=none; b=Fgv/3ws4Nfd8GJnjDh/xnrw1CiaLPIvNOLeSU2CxUiidCREFcdto+oY6uBj85FYlJE5uvPmbLk2DVt6u6rexz+8VeV355upNtHyP2BXrStYICpWI9iu64jnNEv6VMBj8FCqUJ8mKKAraitK9n6QuoSnIWyO4TGCtpQsyXdGmC20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788897845; c=relaxed/simple;
	bh=Y0/p3c/h9xc8oDCcf/kaNVXhdfBCw7r8tQT6KRFC3z0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Aw4QLJzUuZRBIebQw66y+PfoiCPMczd1YQ13EbvWsFPdlcYYRDdGKGyLoHcego268CnLzZVsnp4hluk1Vz1FTrVWzhpRJy5z4+MQZytaU9n1mDCOeF2opn51Jpmy3Ar8cTmB8G9Km+W9jTYc0suVO46TTfHBdcfGQCF4E3OZ2Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=LC6YGx+u; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jjqEiQjL; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="LC6YGx+u";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jjqEiQjL"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 96C16EC0189;
	Tue,  8 Sep 2026 16:04:02 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 08 Sep 2026 16:04:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1788897842;
	 x=1788984242; bh=bKqAsETGPKHQO0TMVcWL0Qa3rhdMo+I7Af5SSq//8MU=; b=
	LC6YGx+u50QSYuK6q5w+drBWdtRKwjJOKbBpQcgAWWjbU3d9YAlyRwfoxCR03YZA
	7Lvhp4AqO+sO1MqSu8AIN5GeIh9dKBY36HC3d5Fk69ebWBP/EqFy/GUelSkn4nET
	0pvksRE/p6SXPWS7LDNH61mHFnz/7OvF7xNMFFMUjxisvvKFYBfKDlJicd2nnHXz
	vxYysobgB9ZGZL8FWJoP0YGpj9YmKeNlc292foRYTBJxcCWm11tjNBSfRAAj2plR
	7Xk/vgBcZ9GIaUs48JdR6wJwSvI+6JZU0a4R2h3MvVen96Yzi29JXLjic9hzAo01
	jx3FZOOqDa5RpMaJBFrdoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788897842; x=
	1788984242; bh=bKqAsETGPKHQO0TMVcWL0Qa3rhdMo+I7Af5SSq//8MU=; b=j
	jqEiQjLx1MMJ2Gm5sMpxGN468i/tv+WEM6fPSsetMoQ+Yj2aRGdOAN2tnBQHHGLn
	Wq7q7tAe2qY+i45g5vlsV7Yeo+sPJdV94/+9+AB5MGWV0txOCWx48AmHbzOGNE4b
	s6gY6y6mg05xz4xQ8ywUktTYlld81k11OjOdep3qIcdK/mIrH0E52emqqZ+F6Gq6
	gvmp8vvlzOBRSr7qlEWABr8ODINK999JiZfSpNTtoOvssF9hsmhBwrEU1cqdDqnw
	BIOuDC63ZQfm3GNj+eXn/bLqLdtmpoaB9e5GCg9pPQpYzA/FtHX2n9dDpaoZ1f09
	l9zGbraknyJ5CsvF+6jWQ==
X-ME-Sender: <xms:MmqgavO_Ogwu7XJVEtDnPy5WycUg2KsTN3OWstkfa95pVAMxh40Uzw>
    <xme:Mmqgai5meK-RpEc0646vC3cKU6Wf41yxH5Qft3a4vFj08uYg_PsX_L_kWYwg8m8Wk
    _TIyGzND6M7zaHpX_cFWtP_DDMp--bEZWcIZDz31zkFKYt6Wt84xh9R>
X-ME-Received: <xmr:Mmqgap0dsk4Bk-vZhX3lkAG4iwwrUtkkXV4jzNDmYLvMp0wSPpo_CzUyOmlH7Onfe0qpd4MO5l0hzi-get6LRIVHD1d3Wzk>
X-ME-Proxy-Cause: dmFkZTEBy2eHQpvq/s+2ql84fEWy7qMHtdaZUb0eeNJD/nFyuYHB54yg4RsApO4enuVktZ
    TqqSz+ukLKAq1qmf6DggrLSv1nAK5QSrN+Oc/CfYtr8VlDddE10kpIOgDcGHpl/IyHPrnh
    QzY/8XxVrY+ZGNJTuVLtxiEgy05jgKYHF6odblr2EYYLjhKP42YNOLBXDp2ZJ93DG3Wem5
    5EerpegaXRdJg2/nvh7Nblh2ohytpyrI9a9oses6Ic1lQX4FgOvbyB7ekql/h95a2SjPJx
    XqhafUIU8fRCY+Z2OhRhE2dVAObFYYR3vPs2xlkrhzQApu22Dv+K4PYr9vjodUzSArIcRo
    uz5sm2hDNox4I5MoeAujxaNSSQ81v9rM6h7tYLqwWls2XqCANUi+X/iHtCxPnZUX2+V2F8
    Qv4lT5k8GTMM05B1zXvNpQT8GrhncU7/laTwHt0t8ToEyhJj2JnN0pA7CLiP7RHIvlS6wl
    NC7ZLORXwmmmWZBAKWYKhbQdUlKuYWvSMB99wCxrmwKi4BNC2BwH5cf38Ydn1XRrQC/DNE
    8iFOY3EWq3KlZirG7bXVZFBwQfm3+jzR1aKZwdk+UFi1AmLIt3x3QxUN0K/t4Md+dRybir
    VC8kDvb6Lh/fe0AyHkoq8r2PL5qad2P70aSQlQyRGH3JfSyH9tgILoROdplg
X-ME-Proxy: <xmx:MmqgajzrnvKHGKbWqD4Exmk_-2JTnDc58ocr6l3KGRknNPDCk_n3KQ>
    <xmx:MmqgajtrFUHpiq6JTNDb-UnYDtudGU88fCChD9WIRKttat5mrUBabw>
    <xmx:MmqgatwZx9zMKtzvqNX0SWZjcNinCaYdG2o7PhD-fgnoj6JVurGSRg>
    <xmx:MmqgauB5R-fEypKhmYRwu12qXU0szUF5t1G9cEOVwSSZvtYH1icJtw>
    <xmx:Mmqgaj4d1js8_p-i01BfBgmSuw8QVdjzlB-moCZnnPBj81K6KUcGDMBr>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Sep 2026 16:04:02 -0400 (EDT)
From: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Date: Tue, 08 Sep 2026 22:02:58 +0200
Subject: [PATCH 3/3] media: uapi: Add 28-bit bayer media bus formats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260908-v4l2-add-raw-mbus-v1-3-6973bffa5b80@ragnatech.se>
References: <20260908-v4l2-add-raw-mbus-v1-0-6973bffa5b80@ragnatech.se>
In-Reply-To: <20260908-v4l2-add-raw-mbus-v1-0-6973bffa5b80@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4795; i=niklas.soderlund+renesas@ragnatech.se;
 h=from:subject:message-id;
 bh=Y0/p3c/h9xc8oDCcf/kaNVXhdfBCw7r8tQT6KRFC3z0=;
 b=owEBbQKS/ZANAwAKAQm0/3kE+U0kAcsmYgBqoGooiLK/1ocpkjmx4KeMQ41OvCQgdAZvKT1WA
 WpoJuco2p6JAjMEAAEKAB0WIQRwy9J0OLNPX3a0+3gJtP95BPlNJAUCaqBqKAAKCRAJtP95BPlN
 JKOCD/49RezVoCWhd8+zoVseda5g+OYABC4o7EF2u3bHGSHSsDn5F3VK/7sAWa8FkjM+DWZK7fV
 GjKgcbi9Mr93iLqdhxUND5f7WPoIcOUNfFMkJLVPUApkfW/sQIUk3ZLAn4Nqefw+RY51jB+49v5
 2oDB8+KU51OXKne3a80zKnSWllfLm1ZToOAXZ5iwTXx+paO1fmR2wpBH3qRnkB7Gq2HjLEYJnki
 SxszMvmAET9FZm5aIKr+ICZtkHqwTbn8z2fUuTM3Od7d1UVrt/v6xzAwGIRK0Ih1l8Ru6bhBxYj
 LWjVVVt3TvGjf8GVZFbSral9gqxRPpBviERfL6VyqubWi0B0/F2sCUSXstcPhOsvqoKTZ1n40/P
 yp1w/yP5LevbOw67wVwFgqDlz6yYQ+ZhUswVbVpHw4YEBkdoap1Ulef4+BG03MhVhTyy0VwN57v
 P2VSSeGckGzAIV535pULdo2ELQJgoY8LgA+YZWcv2Ukv/2DlnX/JYrv9JC3JCCDjNQvMIGnOv1p
 WHmp9E3EirRDOJapQ4EADObE1YniYl3iXaedS7iBYzdzkiLvQevzizL5/8N7qgZGGcN4c05j1fI
 4hjqy2X94A5Ie7OOt8YLsvkF3rlbzhhPF86YGKtr2TU5MQ2KQh+NANGOk1DA4fYRUUmCDC3i45B
 97dExZF1PH16LHA==
X-Developer-Key: i=niklas.soderlund+renesas@ragnatech.se; a=openpgp;
 fpr=9976695FE98693307BF360A2F1591ABD9588DA5F

Prepare for adding Renesas R-Car Gen5 video capture drivers which will
support 28-bit bayer formats.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../userspace-api/media/v4l/subdev-formats.rst     | 132 +++++++++++++++++++++
 include/uapi/linux/media-bus-format.h              |   6 +-
 2 files changed, 137 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index 39396931e726..d4f35f6236db 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -4310,6 +4310,138 @@ organization is given as an example for the first pixel only.
       - r\ :sub:`2`
       - r\ :sub:`1`
       - r\ :sub:`0`
+    * .. _MEDIA-BUS-FMT-SBGGR28-1X28:
+
+      - MEDIA_BUS_FMT_SBGGR28_1X28
+      - 0x3029
+      -
+      - b\ :sub:`27`
+      - b\ :sub:`26`
+      - b\ :sub:`25`
+      - b\ :sub:`24`
+      - b\ :sub:`23`
+      - b\ :sub:`22`
+      - b\ :sub:`21`
+      - b\ :sub:`20`
+      - b\ :sub:`19`
+      - b\ :sub:`18`
+      - b\ :sub:`17`
+      - b\ :sub:`16`
+      - b\ :sub:`15`
+      - b\ :sub:`14`
+      - b\ :sub:`13`
+      - b\ :sub:`12`
+      - b\ :sub:`11`
+      - b\ :sub:`10`
+      - b\ :sub:`9`
+      - b\ :sub:`8`
+      - b\ :sub:`7`
+      - b\ :sub:`6`
+      - b\ :sub:`5`
+      - b\ :sub:`4`
+      - b\ :sub:`3`
+      - b\ :sub:`2`
+      - b\ :sub:`1`
+      - b\ :sub:`0`
+    * .. _MEDIA-BUS-FMT-SGBRG28-1X28:
+
+      - MEDIA_BUS_FMT_SGBRG28_1X28
+      - 0x302a
+      -
+      - g\ :sub:`27`
+      - g\ :sub:`26`
+      - g\ :sub:`25`
+      - g\ :sub:`24`
+      - g\ :sub:`23`
+      - g\ :sub:`22`
+      - g\ :sub:`21`
+      - g\ :sub:`20`
+      - g\ :sub:`19`
+      - g\ :sub:`18`
+      - g\ :sub:`17`
+      - g\ :sub:`16`
+      - g\ :sub:`15`
+      - g\ :sub:`14`
+      - g\ :sub:`13`
+      - g\ :sub:`12`
+      - g\ :sub:`11`
+      - g\ :sub:`10`
+      - g\ :sub:`9`
+      - g\ :sub:`8`
+      - g\ :sub:`7`
+      - g\ :sub:`6`
+      - g\ :sub:`5`
+      - g\ :sub:`4`
+      - g\ :sub:`3`
+      - g\ :sub:`2`
+      - g\ :sub:`1`
+      - g\ :sub:`0`
+    * .. _MEDIA-BUS-FMT-SGRBG28-1X28:
+
+      - MEDIA_BUS_FMT_SGRBG28_1X28
+      - 0x302b
+      -
+      - g\ :sub:`27`
+      - g\ :sub:`26`
+      - g\ :sub:`25`
+      - g\ :sub:`24`
+      - g\ :sub:`23`
+      - g\ :sub:`22`
+      - g\ :sub:`21`
+      - g\ :sub:`20`
+      - g\ :sub:`19`
+      - g\ :sub:`18`
+      - g\ :sub:`17`
+      - g\ :sub:`16`
+      - g\ :sub:`15`
+      - g\ :sub:`14`
+      - g\ :sub:`13`
+      - g\ :sub:`12`
+      - g\ :sub:`11`
+      - g\ :sub:`10`
+      - g\ :sub:`9`
+      - g\ :sub:`8`
+      - g\ :sub:`7`
+      - g\ :sub:`6`
+      - g\ :sub:`5`
+      - g\ :sub:`4`
+      - g\ :sub:`3`
+      - g\ :sub:`2`
+      - g\ :sub:`1`
+      - g\ :sub:`0`
+    * .. _MEDIA-BUS-FMT-SRGGB28-1X28:
+
+      - MEDIA_BUS_FMT_SRGGB28_1X28
+      - 0x302c
+      -
+      - r\ :sub:`27`
+      - r\ :sub:`26`
+      - r\ :sub:`25`
+      - r\ :sub:`24`
+      - r\ :sub:`23`
+      - r\ :sub:`22`
+      - r\ :sub:`21`
+      - r\ :sub:`20`
+      - r\ :sub:`19`
+      - r\ :sub:`18`
+      - r\ :sub:`17`
+      - r\ :sub:`16`
+      - r\ :sub:`15`
+      - r\ :sub:`14`
+      - r\ :sub:`13`
+      - r\ :sub:`12`
+      - r\ :sub:`11`
+      - r\ :sub:`10`
+      - r\ :sub:`9`
+      - r\ :sub:`8`
+      - r\ :sub:`7`
+      - r\ :sub:`6`
+      - r\ :sub:`5`
+      - r\ :sub:`4`
+      - r\ :sub:`3`
+      - r\ :sub:`2`
+      - r\ :sub:`1`
+      - r\ :sub:`0`
 
 .. raw:: latex
 
diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index 892b8c0a945e..2b8438d936ad 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -124,7 +124,7 @@
 #define MEDIA_BUS_FMT_YUV16_1X48		0x202a
 #define MEDIA_BUS_FMT_UYYVYY16_0_5X48		0x202b
 
-/* Bayer - next is	0x3029 */
+/* Bayer - next is	0x302d */
 #define MEDIA_BUS_FMT_SBGGR8_1X8		0x3001
 #define MEDIA_BUS_FMT_SGBRG8_1X8		0x3013
 #define MEDIA_BUS_FMT_SGRBG8_1X8		0x3002
@@ -165,6 +165,10 @@
 #define MEDIA_BUS_FMT_SGBRG24_1X24		0x3026
 #define MEDIA_BUS_FMT_SGRBG24_1X24		0x3027
 #define MEDIA_BUS_FMT_SRGGB24_1X24		0x3028
+#define MEDIA_BUS_FMT_SBGGR28_1X28		0x3029
+#define MEDIA_BUS_FMT_SGBRG28_1X28		0x302a
+#define MEDIA_BUS_FMT_SGRBG28_1X28		0x302b
+#define MEDIA_BUS_FMT_SRGGB28_1X28		0x302c
 
 /* JPEG compressed formats - next is	0x4002 */
 #define MEDIA_BUS_FMT_JPEG_1X8			0x4001

-- 
2.55.0

