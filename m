Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648DB55C1D6;
	Thu, 10 Sep 2026 17:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789061015; cv=none; b=P1m3CKT/K+iAbZgZ01A6oVldbhLhE30GiNKAaz1Cw8yfLRZTqaqdQylfdI9qkd9OqnDVuC1wuJnclvUaU2J4DC6KVqcGv9WylqIhzmim3cWP6sVTVvOJvM7wZ8CEdtusCvKEya/nzCWT8szOewaMASWMtwYqGkLNyeBoO+ssM9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789061015; c=relaxed/simple;
	bh=fxiAQCIsYDMUyYmhH9obs209Z2ARDy73ns0QUGRFSLk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F8PvqE1WOJYth3TcunUxGGVxY3apCRkMPQRD4YXJLqp9AygXpGHsZ4OO4uNs+BrR7hlXOYfovlxz9tYkmKejZ17PB/msuipufkgP8iClxi/NbVFdm45u8NfgvdqnXFomU+c4QDHFXBScAqE54UwFnU6R134qUpUrIrXsHiDTipc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Ep17TMBb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=tyY53jTT; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Ep17TMBb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="tyY53jTT"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 0385AEC00FA;
	Thu, 10 Sep 2026 13:23:12 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 10 Sep 2026 13:23:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789060992;
	 x=1789147392; bh=jHvREpjLuYAQmto3iNwLtYGbTZdr/rv2wMh54g/r0Jg=; b=
	Ep17TMBbfHKFpRUu52b19HjgFNHfKNx0V/fV3YxfJRQIkfPisfx+cUAtjhOzT+AC
	T2poz46WaZfKJU59PJI63fn0Y8tIMblBCQdwWg6Bn967fOmNAV0IRNWAhDxWZ17t
	j9MVkUxPKRzFIGJwOPk192xAwReoqiDOpuiHwxqovXEFagacVmUb+tjDMva4FSe0
	Z40B7c5vqcBTQIIMlk1FqoJoh8foSitAs2rvs7gZwV2T7hp8HNFKKc2pT3aezvpP
	uaaaRu8VFjmQRwFTjrV3XDt9onf4HmPp9owtXEd/eXMNxX1htFwybglPL40ieziD
	feYuo4yEOkURCCHXQZBv9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789060992; x=
	1789147392; bh=jHvREpjLuYAQmto3iNwLtYGbTZdr/rv2wMh54g/r0Jg=; b=t
	yY53jTT3Uzu/PyZugkxPvnNGghDDAtxW5TwfQv6dAGZQjqUEkV0bfsCw4HZM0Zn4
	023ue0ir9t6QmYG9E1CcYxYu0f6ckpwi5Nbfp5txTJkwuVKQ2nRMUk0Js2MieppI
	rzMh+Sjy4rQuArJ6acue+kMvKuwjqDPzKP/3bPj83KwTRcz9+pR8fr0AORRVnfWH
	57xFxU0zyvQmEzmW5xUEJQ5Dje3yzdiSEpYkRaAT8M0sYmoDfWOE6o8RrRG5FdR5
	P+ueNs22VXOgYfjhsVBy1+d602grcKiRsYx+X2lJmOQtF8ZMaijg4ph7xH0FInvH
	tHSbAaxPcKp0kt0U8NwBw==
X-ME-Sender: <xms:f-eiaq-P_NMlNkCYIlIb2HqVs9EtEUJvzECzwSCntWRXYREBXYtaTg>
    <xme:f-eiajrB8GY2NCDuVw8SSqZ571M-uI_UaFGiy0X4ApzV5GfyQPkfN5gPNZ6Nr_o--
    oJoL7Pd6xZTMRRq27tErCVPqNDMyM-wj7qVr8GpowU7rzdFwvrMFOR1>
X-ME-Received: <xmr:f-eiarmpzeW4XdZJwK-nW-Xav0Kwzzi_jiaH4l58QLoo6MrZ2T1ugHd0tDpxx0q_YOAw6mAVgsv8ctfkRI4zceDJu6FQUC8>
X-ME-Proxy-Cause: dmFkZTG2QFDA+iNuUNX1o895p6n98o1glLl3I4m4xmfaPDS///3K7Hfx7PIQfjbm4wu4FD
    +59nbbGCGt2km6RO2OM7c3d0dxWIOqJKI7GExpk5XKY3zJZp8LeXn2FaJKTPBEHPCiydKf
    vMUUULPeFjj1RaMxfLz2tKH/FP1YmY/gIBfGI4Lz/2VpcYNOkVkpZlFbjy5/qShnUDdP9l
    MUTITZ1ix9fu02vXiK4U4vR2/8ELa6BJUL/pnyYkXdjq7ISRf6xI1Gzfi62UDI2o9OXS3a
    5SrBw5Wa66GG6zbHTnFqe3GwfXct/TASh4sDMmcr8kQWAykEd75qN4t/RkMkN8CgZDABPE
    cOGz5LLQK/GyKliAGPtJRnkTsCAJZB10uK6T40RTpKKOzwX05nT8hCryBJQos/JiDERuZr
    uqgMBPXwucwc/fA+vGrL7D73e5I1qFjn3bns3D0SIl1IvNEGlba00Al/l7y+S2qpYferYn
    ntSpnRGm/NitPEkp6mM/t6X5zfKn5kGVClrYXuUmAPX9eBEKhIZP/5xFk4jVPmrpwyDMF9
    hhR9MKJQ1y48BKCF/I6KVZ4KGO3lsMc6nzK+A+/F9zNPMQjKZ7mqZ7g9/lzBY1OQTxLS1G
    HMsy37cJqDkwQJFRor9fjLqDoHLnobYGG6SBqq+CIQ6jLI2JfVCYQMXVvlRw
X-ME-Proxy: <xmx:f-eiaii7CnvcWbSs_CZsOTHNLQ53fRdZaiduRoZoUXJ1Lwh-AxZ33Q>
    <xmx:f-eiarf6WokimMnQDC_nLKNLlUMB8NUTBlFXWT1BAgyvZGOYIkhdYQ>
    <xmx:f-eiaqiZnu_3mUCXeG0bpA66B9PHci7jtKe3b9TFFwK3bN6J2b1izQ>
    <xmx:f-eiarwr6kH7Ve2M820ses-WBH8BUim02fcyhBtZG_7HerNyp9VpVQ>
    <xmx:gOeiagp-NjNmMU-lvSu9iB1qSafq9m_ksKesB6weDQu886A21obmZkAf>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Sep 2026 13:23:11 -0400 (EDT)
From: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Date: Thu, 10 Sep 2026 19:22:33 +0200
Subject: [PATCH 3/3] media: uapi: videodev2: Add 28-bit Bayer formats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260910-v4l2-add-raw-pix-v1-3-80a8e855b41b@ragnatech.se>
References: <20260910-v4l2-add-raw-pix-v1-0-80a8e855b41b@ragnatech.se>
In-Reply-To: <20260910-v4l2-add-raw-pix-v1-0-80a8e855b41b@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5492; i=niklas.soderlund+renesas@ragnatech.se;
 h=from:subject:message-id;
 bh=fxiAQCIsYDMUyYmhH9obs209Z2ARDy73ns0QUGRFSLk=;
 b=owEBbQKS/ZANAwAKAQm0/3kE+U0kAcsmYgBqoud2LBAA0rgeCXEbWlb72wWuvWZOkSDEnjx+T
 6Ugdt/KpE6JAjMEAAEKAB0WIQRwy9J0OLNPX3a0+3gJtP95BPlNJAUCaqLndgAKCRAJtP95BPlN
 JHabD/9IujeB/WZa74O2yBoPmgwpuV9yZN0a6vku6Yp871bUK2uAIWqGHEsa2FXufB5TuQtLwUg
 hSeG2OSDykqxwihsn9HbYTRsaRp04F1T1y8aVPeJWXHzlNJbBt/+iQ3eOuBOsXgaGVlbUTBWxK4
 C53/23ho9+V+JhqnxuTuYsyfj7gTTxG3CYB9+sNW3exrDlpgGuh39VcuQ0VdjUZdP2/uFh95kdU
 lYon+p3+4fSNT3tTunLq+gsQD91Jnu/+AbMWIahRRE0EmCvYfuxuxIgZCxXQU0HZh2CxRJqMN43
 W+DtwCN9O5ikzutQZDgnz0Yy2/edFKCSl6LU/vx3f0aU5uB/i3+vQCW8eRsVAgqLSicOezRXVxC
 MvTj6llhotbVEsXRPGeJPRQagkS0Zhmr42FbmXtrsAbGDbDnps/0tanGbJmpf+t2RPjNJD83spb
 VwMea3Hv/AMC/7pcGcuyyM0Gl3bQECiw9y6WVVTbnsF+T1Te9JdNMxbW2avr2uRVTqjU+YPbWh5
 T9bYZGqu5hqFhkIBjocl6FQcx9Hn12+W9Q2hB9zWjEeFNPJW+dN9sjnvPA10BV8L6JP0PGKjUjy
 X9DUFOjE0i2YAwGc3WylFn76Nnsb0OrYnp0bGHgSJUWk+5tdmYtCF4fuaxAGsOhB5tc3DxVDOBn
 t9IUK5uGuAuijrg==
X-Developer-Key: i=niklas.soderlund+renesas@ragnatech.se; a=openpgp;
 fpr=9976695FE98693307BF360A2F1591ABD9588DA5F

Add 28-bit Bayer formats and documentation.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../userspace-api/media/v4l/pixfmt-bayer.rst       |   1 +
 .../userspace-api/media/v4l/pixfmt-srggb28.rst     | 102 +++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c               |   4 +
 include/uapi/linux/videodev2.h                     |   4 +
 4 files changed, 111 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
index 9d76def66648..ca915889199e 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
@@ -35,3 +35,4 @@ orders. See also `the Wikipedia article on Bayer filter
     pixfmt-srggb16
     pixfmt-srggb20
     pixfmt-srggb24
+    pixfmt-srggb28
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggb28.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb28.rst
new file mode 100644
index 000000000000..34133d430436
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb28.rst
@@ -0,0 +1,102 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
+
+.. _V4L2-PIX-FMT-SRGGB28:
+.. _v4l2-pix-fmt-sbggr28:
+.. _v4l2-pix-fmt-sgbrg28:
+.. _v4l2-pix-fmt-sgrbg28:
+
+***************************************************************************************************************************
+V4L2_PIX_FMT_SBGGR28 ('BG28'), V4L2_PIX_FMT_SGBRG28 ('GB28'), V4L2_PIX_FMT_SGRBG28 ('GR28'), V4L2_PIX_FMT_SRGGB28 ('RG28'),
+***************************************************************************************************************************
+
+
+====================
+28-bit Bayer formats
+====================
+
+
+Description
+===========
+
+These four pixel formats are raw sRGB / Bayer formats with 28 bits per
+sample. Each sample is stored in a 32-bit word. Each n-pixel row contains
+n/2 green samples and n/2 blue or red samples, with alternating red and blue
+rows. Bytes are stored in memory in little endian order. They are
+conventionally described as GRGR... BGBG..., RGRG... GBGB..., etc. Below is
+an example of one sample.
+
+.. cssclass: longtable
+
+.. flat-table:: 28-bit Bayer Formats
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
+      - P\ :sub:`27`
+      - P\ :sub:`26`
+      - P\ :sub:`25`
+      - P\ :sub:`24`
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
index cf2831cbdbc8..e14542ad3228 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1442,6 +1442,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_SGBRG24:	descr = "24-bit Bayer GBGB/RGRG"; break;
 	case V4L2_PIX_FMT_SGRBG24:	descr = "24-bit Bayer GRGR/BGBG"; break;
 	case V4L2_PIX_FMT_SRGGB24:	descr = "24-bit Bayer RGRG/GBGB"; break;
+	case V4L2_PIX_FMT_SBGGR28:	descr = "28-bit Bayer BGBG/GRGR"; break;
+	case V4L2_PIX_FMT_SGBRG28:	descr = "28-bit Bayer GBGB/RGRG"; break;
+	case V4L2_PIX_FMT_SGRBG28:	descr = "28-bit Bayer GRGR/BGBG"; break;
+	case V4L2_PIX_FMT_SRGGB28:	descr = "28-bit Bayer RGRG/GBGB"; break;
 	case V4L2_PIX_FMT_RAW_CRU20:	descr = "14-bit Raw CRU Packed"; break;
 	case V4L2_PIX_FMT_SN9C20X_I420:	descr = "GSPCA SN9C20X I420"; break;
 	case V4L2_PIX_FMT_SPCA501:	descr = "GSPCA SPCA501"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 027c7c7a352c..0611ba1e5fd9 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -752,6 +752,10 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_SGBRG24 v4l2_fourcc('G', 'B', '2', '4') /* 24  GBGB.. RGRG.. */
 #define V4L2_PIX_FMT_SGRBG24 v4l2_fourcc('G', 'R', '2', '4') /* 24  GRGR.. BGBG.. */
 #define V4L2_PIX_FMT_SRGGB24 v4l2_fourcc('R', 'G', '2', '4') /* 24  RGRG.. GBGB.. */
+#define V4L2_PIX_FMT_SBGGR28 v4l2_fourcc('B', 'G', '2', '8') /* 28  BGBG.. GRGR.. */
+#define V4L2_PIX_FMT_SGBRG28 v4l2_fourcc('G', 'B', '2', '8') /* 28  GBGB.. RGRG.. */
+#define V4L2_PIX_FMT_SGRBG28 v4l2_fourcc('G', 'R', '2', '8') /* 28  GRGR.. BGBG.. */
+#define V4L2_PIX_FMT_SRGGB28 v4l2_fourcc('R', 'G', '2', '8') /* 28  RGRG.. GBGB.. */
 
 /* HSV formats */
 #define V4L2_PIX_FMT_HSV24 v4l2_fourcc('H', 'S', 'V', '3')

-- 
2.55.0

