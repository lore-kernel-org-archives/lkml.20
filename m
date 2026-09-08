Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A7F5A0AC7;
	Tue,  8 Sep 2026 20:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788897843; cv=none; b=q6ONbEfV04RXg5rgMrE5C8BrZIK5YxHINr9SQShQpI0X38eNw96vMgy/UFKrLZUaolQzY7DmAWAIzywBnUX7qYhrfKQscSeLXebWPP+sM2XdhEwsaWsBv7NkIz7Nl3l4aeNqHy+Vfjqvew2hpGAW/wKYiChuJUA2zu6Ux4MPlEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788897843; c=relaxed/simple;
	bh=RsUlJYwWFlP5U9tK84uZrWwg2NDoHWMzHM5MSaPU55w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uP9nOrIl08Bxjm1ymOs1JLYfYliJnIztQscXeKB29gZkLx5e7JAN39QvvMTpi+IMGmcIiQ1JcllrrkvHvURcaQzLvoRV5cua9BIOZMCDMrSKNDFH2+WeEgTiFn+YjGLNlqRbod0qYqUZq4SZyApF2gQd117yz51UdsTfJo4vqG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=bZPhE4YV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=U0gt1o3A; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="bZPhE4YV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="U0gt1o3A"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 8ADA6EC018B;
	Tue,  8 Sep 2026 16:04:00 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 08 Sep 2026 16:04:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1788897840;
	 x=1788984240; bh=2kBu3nFdLF3MRGC0+FJLN1Vlgey4ZQb97RX+jAz6mOU=; b=
	bZPhE4YVhrRzkdYQvscO9oKamtH3Bzm93XJHPg9AmloCHYsO9spefkydLGHgNHDa
	qvHuZj37sVs8p/Js0YHc0vX9lI3IQFkvoV+DSQ12MWOg2ezcwx7w/nxY7fJSX4Z8
	Ffl1ylkSQpty8AShtzaIjBpgenlvwarEKLPR/ZCag3LhENLv79G1R+cdlGFW3nPR
	aZbhtUMav9jgfRT0OrcKj3Rr29JfCchCpV84/XqUlQJ0Hu94VgVnRcu5WOFmHTnd
	Ffb+bSQ/C4yYQpMpeK/LuV7vnIGPGPfcz1ugHLcIls43kbCeDzuqJvQONOQcA6dO
	zDebP1WsuFwSOEeq2KeWKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788897840; x=
	1788984240; bh=2kBu3nFdLF3MRGC0+FJLN1Vlgey4ZQb97RX+jAz6mOU=; b=U
	0gt1o3ARKj2M71Z4ctxFK/SijX79tmh+J9LSzkTJZY84eW/+iDMpwlk3aKpJzwWB
	SO7A5x3J6x2pGjG96Gk9ewPw2CiKfc7IOAEA3wzqUo8QxNCLVEZjRWe+t8eULZ3L
	oRJyKTFivXlgrt1vowZtuRqSVxnNusM8egEvXk93rra6gdCmkkAfdxGEpkbhOkXP
	dh42EvaJVN0uu2xmIK9PhP4noCePE1a57MOeXzugEwyujsvl7b6XIcMUhE29p1sG
	xhl/NUIgWvFMCEQ/ImqV4OTMSUcPH3lzwPbU+uTUNMzMd4z+tF1hH+V8hU/6gC2t
	sw8+0790TzDRo72aZ5fAA==
X-ME-Sender: <xms:MGqgauksf4g68ueOA38gvmaCsdIefCAPnLqHT49l8h2OwNMicmJfuw>
    <xme:MGqgajy9hCtl4mn35WAZgTqOc-2A-WnZsRQBZk3TmYbLVI7YvDiFlZtCamd32ccq4
    C2IO3JCwESVEMARDkg8ouOqjpSJu5W08lqfu3-vk-tR2RIi_WiX0ziwgw>
X-ME-Received: <xmr:MGqgau-7STxBlTny0je2g98mbA0qb5f41egefBhZZJQ4gXbhrAEiVn9JW5EBBD0SSc6iWG8ThSOWkpB33RSwx2VkDupk9Tw>
X-ME-Proxy-Cause: dmFkZTFeb+qfPqEN3EcOjLVxF/oMzCb56XlusmUHwfq0iXuMpc9T35y0bLb9PdnKRmtR8e
    B67ZTl9Z0NTUqkhGlkQHsCDPFAPmzI55sttnrNwgEfMAYxtrs+dsq79yp099ZaLhfcozo8
    /ZGp3EMdWm0ePHwBqlIyLlvBNVjgzPgFtDse7nfIQ46HwAoicm740Ch1b3FVSzOCDfn5bc
    pgsllGQEbhd0TvHzg/VR5p+Gx9RQ8nZeEgkyiM7vdCg0fZ0TaoN8RisYyXxfA03mOeQpjG
    ZBNXD4zQmzK8V09DhBQV/MHuY1fgeWGk97B6Wdnt9BAKM+4rggn3g1R2124nKHVhzqGraN
    uj1nAdwkItVG7FY1T8POqH54oMs9B+/29EhXTUWLtxm5azF8sMD29XXtbIOfejQXGQ/b+g
    DYbcC761nIT2eG4M920DxE8z1lRpEHcOZf5WTz9q9E/7KxrFuDSX3Dz1vMKCup9B511Vdn
    NkWuX5Id9L0SsgaexmvMXQRtc96YSFOBTyXLCmwajNkxnCXAJIpVmGjpsNuXEx10rmnRlw
    2UxIcyPtFhGztQyO9P3wN7wibVTleLnoRvIphbvppbckQ/I4AHPHzv6Aa5w7hfuZ+5nNv6
    Z/TU6WRSrU/GKTKl7eRd8mK3CXVfkS+GxfaH/lUhNrRGzbPFTB7cTwL7/b5Q
X-ME-Proxy: <xmx:MGqganIZVbVi576maTpVa0UslPLdV3yeGLwwbR0oN-gdPT3uCRLaww>
    <xmx:MGqgakexHd9aN930BN1X2SLjeZysE4BHTDxEPBPDmgzdwLHuG_zjNQ>
    <xmx:MGqgam8U1BLNAqQ-QTutnpqKz74A2LRzUR07f8649voSikAduFtdqg>
    <xmx:MGqgahqMLDaoq5yOthCLoBv1FbOx7OjLyoe2AlN9xk85J7ZFagEhXw>
    <xmx:MGqgakVfPr5uSB2y-eUUG7n6LBW4DgFqbdOyuW1zpG-TCclJtKAYA5ed>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Sep 2026 16:03:59 -0400 (EDT)
From: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Date: Tue, 08 Sep 2026 22:02:57 +0200
Subject: [PATCH 2/3] media: uapi: Add 24-bit bayer media bus formats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260908-v4l2-add-raw-mbus-v1-2-6973bffa5b80@ragnatech.se>
References: <20260908-v4l2-add-raw-mbus-v1-0-6973bffa5b80@ragnatech.se>
In-Reply-To: <20260908-v4l2-add-raw-mbus-v1-0-6973bffa5b80@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4587; i=niklas.soderlund+renesas@ragnatech.se;
 h=from:subject:message-id;
 bh=RsUlJYwWFlP5U9tK84uZrWwg2NDoHWMzHM5MSaPU55w=;
 b=kA0DAAoBCbT/eQT5TSQByyZiAGqgaiigafCsK7yJ9yYAuKOQeTzuSaHXG9Tjc3lpZXsNmqejK
 4kCMwQAAQoAHRYhBHDL0nQ4s09fdrT7eAm0/3kE+U0kBQJqoGooAAoJEAm0/3kE+U0kwjcP/2YF
 gtvl7MN4PrPpCQpwVIjbVYv5qrsai6ARpVI6vfjXRHd1oeZT1Q4hNwWkNlgqLwATy8Pta6NnDO2
 frspK79kz7bSo/aelm4yp+kyzql3+/qkk+kYE41Na+bpu82Da2dl0JnVfZpdparDmj7z5JRVpKQ
 rClHgSM7749ycMO7Er/9ezfj9uixCyg1SFsWAvJE9+4e+5aOc177sDybRkZTCt6prnBpx4vuKlu
 JOXy82j92jzezD9nLp5h/RpVb7vf4JlIsp7hSv2+gm1oRYO90AI1uSWzzTjytf1pCSSgPbP8vXR
 4zt5Thup9aZBVT3F+e2WvZhxRDVyDdUwlqOLKbj8wzMsOF7ui4y89BMoXmUybqnuNVLW5NtJlwr
 WhI86fLoCPAyFKpkggt+uaAte1wECxAPAGv1cZ1ElPeH8nGEvWfwkdyQYRB9ggUlQv5MaOeoT/3
 cvFNThhH2O0jWt7ljHEZoGt4yn86R1T4P2C+a2XPINMCcsOg7p0xHJebFsScQ3w5goU+4IVpCgn
 KWWv5g48sfGTQuw4R8bfLxSE7ULIkzQLI+ib5jyhlF/TT4HA8roaRBVbQZX0ZLucI0VHy8mxxL+
 4COFtELxb7nRyMpMH3mT19a2qD+jlwK8716buZ2Q1RhbudY7PzCaGCkHjGSf/02iDetVuKNsQ5z
 AKmsX
X-Developer-Key: i=niklas.soderlund+renesas@ragnatech.se; a=openpgp;
 fpr=9976695FE98693307BF360A2F1591ABD9588DA5F

Prepare for adding Renesas R-Car Gen5 video capture drivers which will
support 24-bit bayer formats.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../userspace-api/media/v4l/subdev-formats.rst     | 132 +++++++++++++++++++++
 include/uapi/linux/media-bus-format.h              |   6 +-
 2 files changed, 137 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index 892562ab48de..39396931e726 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -4178,6 +4178,138 @@ organization is given as an example for the first pixel only.
       - r\ :sub:`2`
       - r\ :sub:`1`
       - r\ :sub:`0`
+    * .. _MEDIA-BUS-FMT-SBGGR24-1X24:
+
+      - MEDIA_BUS_FMT_SBGGR24_1X24
+      - 0x3025
+      -
+      -
+      -
+      -
+      -
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
+    * .. _MEDIA-BUS-FMT-SGBRG24-1X24:
+
+      - MEDIA_BUS_FMT_SGBRG24_1X24
+      - 0x3026
+      -
+      -
+      -
+      -
+      -
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
+    * .. _MEDIA-BUS-FMT-SGRBG24-1X24:
+
+      - MEDIA_BUS_FMT_SGRBG24_1X24
+      - 0x3027
+      -
+      -
+      -
+      -
+      -
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
+    * .. _MEDIA-BUS-FMT-SRGGB24-1X24:
+
+      - MEDIA_BUS_FMT_SRGGB24_1X24
+      - 0x3028
+      -
+      -
+      -
+      -
+      -
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
index 6005f033e62c..892b8c0a945e 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -124,7 +124,7 @@
 #define MEDIA_BUS_FMT_YUV16_1X48		0x202a
 #define MEDIA_BUS_FMT_UYYVYY16_0_5X48		0x202b
 
-/* Bayer - next is	0x3025 */
+/* Bayer - next is	0x3029 */
 #define MEDIA_BUS_FMT_SBGGR8_1X8		0x3001
 #define MEDIA_BUS_FMT_SGBRG8_1X8		0x3013
 #define MEDIA_BUS_FMT_SGRBG8_1X8		0x3002
@@ -161,6 +161,10 @@
 #define MEDIA_BUS_FMT_SGBRG20_1X20		0x3022
 #define MEDIA_BUS_FMT_SGRBG20_1X20		0x3023
 #define MEDIA_BUS_FMT_SRGGB20_1X20		0x3024
+#define MEDIA_BUS_FMT_SBGGR24_1X24		0x3025
+#define MEDIA_BUS_FMT_SGBRG24_1X24		0x3026
+#define MEDIA_BUS_FMT_SGRBG24_1X24		0x3027
+#define MEDIA_BUS_FMT_SRGGB24_1X24		0x3028
 
 /* JPEG compressed formats - next is	0x4002 */
 #define MEDIA_BUS_FMT_JPEG_1X8			0x4001

-- 
2.55.0

