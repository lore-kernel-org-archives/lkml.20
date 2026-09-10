Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A80F481AB5;
	Thu, 10 Sep 2026 17:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789061003; cv=none; b=Q3GQkiK7boHPWZHbhbCSCuVSDX4rciffz1GGdeCVwk9kQGGCzegm0d7N4KRxWY6NorYlrkjwRlLlcndSeDUNoJJ49ogAQVT1VVsqLecGh1nC5FotNhBnkwjkoK8ADNmQUBgOYzHUXsZ3kP9jhufqAhoY7q+BBBFokbXJ/4oI8oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789061003; c=relaxed/simple;
	bh=scWCWA88o4VX0VPoZMQAskbn76QyI8hdpUUJeVKaoaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YCpLwppj0cez0EpU5wJMBLLbMTLZTiFiq0BiEqS0g40LLkPi/JlIy7PfciB3alwEU0/QO32j9UXPgmUtl/tfJYzN58wVRzrBKiLwcS2QQ2wBKI+8AIiJqSNyhik9dEyPnkSSxZsVll1kWmiom6FAEjqXgLqqWUTTFTvqJGeDLzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=tDaFPe/r; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QcN+sF75; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="tDaFPe/r";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QcN+sF75"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 78A3D1400167;
	Thu, 10 Sep 2026 13:23:07 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 10 Sep 2026 13:23:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789060987;
	 x=1789147387; bh=3/zSufBdyTduYuvt0Hxt1E3AhkNI1loNGCTR3q+m4sk=; b=
	tDaFPe/rQ2/FVaAJc5XiJIXIi+FJcKv0H8FuGJKo6C2/fFJryOUi2F8NZCqPpCDd
	hTltLOkBMj510iz7aoGuxR/6JEDm0lHPOdSS9MmnY+/sgCux0+HvDwOa28/jMOdU
	qiQEN8YbI/9r7mYwnKphe4T7cG0o7+XlpQBh5AOCqGGKkHKLwwlXFOitCnKTkGrg
	fnVnCK7CEKPe/bnzzOBnMGVMTElbwFaLZ/5+8/Exof7jX4Eqqp9rBKTQg7eIMQ6q
	S194gOTWD83hH3PxMYNcaGHE1by5kkhMiPoWzI8xUR44XCSXdwYSkhYn4gOq012W
	RrDFcAiyw6vrcWNv1psD7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789060987; x=
	1789147387; bh=3/zSufBdyTduYuvt0Hxt1E3AhkNI1loNGCTR3q+m4sk=; b=Q
	cN+sF75NbCqc5qVIdVNIayNU2qQrl170svHpWbQ9DeSljz2YOsHGzfMXenQ2LEsT
	fhjwSu3leZ5rh3shjqY/BgxesLHnBipTBYrnK3jWq8HjIWP1qLZ5QfxX3nZtMFvq
	w6YABbqMl+KfegUkcz56BQ6G4q35F4d6KCjCs7uZD5YCLnrW/UbTWQoDdUtepYYI
	QR72Wz6u7/UZoRgrYAkvLZC7C367WftM/f4vdbjCibnyUStouyCFMnf2odyfi7rk
	LZEV4bKzO49A1yRn5N1JR7w6Tk3zvb1gm42MWu4Kl264EzW8Aa+xZS//Q3pAhQax
	fZ0clD+jwjnm4MZV21aGA==
X-ME-Sender: <xms:e-eiarF4VFfZT6nzip3587FkssQ3dj-pq10fDc57bDUfs1ylXz6zCg>
    <xme:e-eiahTDjthFPdtHKRlKc8yOBF4ynST7nwbxC4sLPVbTQh3KO-If2y_xgtmCWH-j6
    20Qck_O1iisR3MPq8vxZqZTWjQpH6I_KQg2snr_SxbIgK2lzF4YVqk>
X-ME-Received: <xmr:e-eiaotPtvzG_yGOaFiEjDcrfnPUwhOVLftS_LNuHB261LbMPzb9Jh8sPfBdEq11k9Y0K-Uwg5xjkYgO6VdFrYlaIxxARBg>
X-ME-Proxy-Cause: dmFkZTG2QFDA+iNuUNX1o895p6n98o1glLl3I4m4xmfaPDS///3K7Hfx7PIQfjbm4wu4FD
    +59nbbGCGt2km6RO2OM7c3d0dxWIOqJKI7GExpk5XKY3zJZp8LeXn2FaJKTPBEHPCiydKf
    vMUUULPeFjj1RaMxfLz2tKH/FP1YmY/gIBfGI4Lz/2VpcYNOkVkpZlFbjy5/qShnUDdP9l
    MUTITZ1ix9fu02vXiK4U4vR2/8ELa6BJUL/pnyYkXdjq7ISRf6xI1Gzfi62UDI2o9OXS3a
    5SrBw5Wa66GG6zbHTnFqe3GwfXct/TASh4sDMmcr8kQWAykEd75qN4t/RkMkN8CgZDABJx
    zMeVcP0ScM2Ha9uuZgTNquoe9m/rJx8Qg3A31Z860Y+ry75IZTrSXdKQF/2XxJrkN68fsY
    Csaoc848daIgudhQmfCsyWHgGI4DhUDV3GYNCGG8f/zrd5OzvxFpPKdyNNYo6mQfIASqAj
    Bo/y+g6Ha8IFyUUtwCso5+vmDsWF7Rwf75YdHSEB2dCLR5apqO/+U4l+UGfNgnCUmeoNLw
    gdQHY20tDvI2yhhy3pISg7tSdAW2n5oNRrlszIJqHSd+zGfez5NS1NAmvxbFmaGKva4jxt
    8rEIKecHAwTwjlItB5b/1K96SFujXFl4AHBMuT/FmvcEpR87Jz9RiV+wUong
X-ME-Proxy: <xmx:e-eiapIBrDrCnpTWETfKpChteqQq5BLsqKQZyDFbnHS7IaOMjI13Ag>
    <xmx:e-eiatkxAdxz3x3BOO7V8mOqkbValDAWa1K7RyDRUBJpfuGdLnemyg>
    <xmx:e-eiaiKfRMVpXCe0wKZwE_d5b4k9GeRbi0Wgx8Ka5zwRD1YD81Vggw>
    <xmx:e-eiaq4c_jp0fUjpVWyCwQJ2WVIwu9fds9ieKX3grHc6stDFIeM2Zg>
    <xmx:e-eiagRbLnzDcGhNfceizDwYBGM6USsOd44EhwRhanxyTb8DahE5SQke>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Sep 2026 13:23:06 -0400 (EDT)
From: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Date: Thu, 10 Sep 2026 19:22:31 +0200
Subject: [PATCH 1/3] media: uapi: videodev2: Add 20-bit Bayer formats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260910-v4l2-add-raw-pix-v1-1-80a8e855b41b@ragnatech.se>
References: <20260910-v4l2-add-raw-pix-v1-0-80a8e855b41b@ragnatech.se>
In-Reply-To: <20260910-v4l2-add-raw-pix-v1-0-80a8e855b41b@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5405; i=niklas.soderlund+renesas@ragnatech.se;
 h=from:subject:message-id;
 bh=scWCWA88o4VX0VPoZMQAskbn76QyI8hdpUUJeVKaoaI=;
 b=owEBbQKS/ZANAwAKAQm0/3kE+U0kAcsmYgBqoud2KYWOtN/4ThUapLV/IyG/COzk5a35REFYm
 4rM40dyzMSJAjMEAAEKAB0WIQRwy9J0OLNPX3a0+3gJtP95BPlNJAUCaqLndgAKCRAJtP95BPlN
 JOyDD/9cnft3MYQFYUj9zlqvj8xLhNCL5AmiaP487cYElKwGBz5XG9i3+l/WyK6qpyNVXCC2BQ8
 Sn7ju+GvEnJ/cMv4MIfzgLuSsZxHkk4SWUJyxEYG+7cueSTf46RF59U3L/gCWK83znTVPUCC7Fj
 FbDlwmrxT2Qt2/Q2oQGjW9K5TiFs+gUrbNTLGmRoUqQPP6Jw+VgvXADdjMjqYUkiowTzVnb3SCC
 3k/uWrLgkGh8QM7xPstPVqja/+Y7uHTT9SbmmZKwZiBHRNEhcRE6+stM+L0qCJLAEk9bf/njct+
 nyR9eTXvj5ZI9n7yGPe/x2ccOlp/TkvQtRc8X4BNetHBEZ3yHRVNqPnEGKUDQtUJOR54L+6D+3m
 a+qEyhnZfYj2bAFY4glFoLhZsfwofJfMFRc0t1l+lFAFkEAQmQhEvikcWWEhJOtKMhwLDp5Cyzo
 ndiu0i0AUJ99tUlcK2ifcf9UdU500KojpL/FVPkLlh4lJ1a++AvJ3TfPsiNdsn9MLaew4g0pFhp
 o1pw6iWxDZ3GpxdTGxArevnKotcyORgUXDf5ZSwKpR3oXhJ3rwmxDvlfR4FN479FcBPdEIIJ9Ux
 V+Sa0zU2G+z9v/jv0P48ilhg+dTtJcxFebayCD5l9IW5aFPifqkRK5/PTv4kn/WNGSHqYnsOvbV
 fFN8qgxgqKGSaDg==
X-Developer-Key: i=niklas.soderlund+renesas@ragnatech.se; a=openpgp;
 fpr=9976695FE98693307BF360A2F1591ABD9588DA5F

Add 20-bit Bayer formats and documentation.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../userspace-api/media/v4l/pixfmt-bayer.rst       |   1 +
 .../userspace-api/media/v4l/pixfmt-srggb20.rst     | 102 +++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c               |   4 +
 include/uapi/linux/videodev2.h                     |   4 +
 4 files changed, 111 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
index 8b4e413177f5..b93e66d6a27e 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
@@ -33,3 +33,4 @@ orders. See also `the Wikipedia article on Bayer filter
     pixfmt-srggb14
     pixfmt-srggb14p
     pixfmt-srggb16
+    pixfmt-srggb20
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggb20.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb20.rst
new file mode 100644
index 000000000000..cf911e93aa8d
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb20.rst
@@ -0,0 +1,102 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
+
+.. _V4L2-PIX-FMT-SRGGB20:
+.. _v4l2-pix-fmt-sbggr20:
+.. _v4l2-pix-fmt-sgbrg20:
+.. _v4l2-pix-fmt-sgrbg20:
+
+***************************************************************************************************************************
+V4L2_PIX_FMT_SBGGR20 ('BG20'), V4L2_PIX_FMT_SGBRG20 ('GB20'), V4L2_PIX_FMT_SGRBG20 ('GR20'), V4L2_PIX_FMT_SRGGB20 ('RG20'),
+***************************************************************************************************************************
+
+
+====================
+20-bit Bayer formats
+====================
+
+
+Description
+===========
+
+These four pixel formats are raw sRGB / Bayer formats with 20 bits per
+sample. Each sample is stored in a 32-bit word. Each n-pixel row contains
+n/2 green samples and n/2 blue or red samples, with alternating red and blue
+rows. Bytes are stored in memory in little endian order. They are
+conventionally described as GRGR... BGBG..., RGRG... GBGB..., etc. Below is
+an example of one sample.
+
+.. cssclass: longtable
+
+.. flat-table:: 20-bit Bayer Formats
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
+      - *
+      - *
+      - *
+      - *
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
index 17ba1ae70735..14cb94591ea8 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1434,6 +1434,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_SGBRG16:	descr = "16-bit Bayer GBGB/RGRG"; break;
 	case V4L2_PIX_FMT_SGRBG16:	descr = "16-bit Bayer GRGR/BGBG"; break;
 	case V4L2_PIX_FMT_SRGGB16:	descr = "16-bit Bayer RGRG/GBGB"; break;
+	case V4L2_PIX_FMT_SBGGR20:	descr = "20-bit Bayer BGBG/GRGR"; break;
+	case V4L2_PIX_FMT_SGBRG20:	descr = "20-bit Bayer GBGB/RGRG"; break;
+	case V4L2_PIX_FMT_SGRBG20:	descr = "20-bit Bayer GRGR/BGBG"; break;
+	case V4L2_PIX_FMT_SRGGB20:	descr = "20-bit Bayer RGRG/GBGB"; break;
 	case V4L2_PIX_FMT_RAW_CRU20:	descr = "14-bit Raw CRU Packed"; break;
 	case V4L2_PIX_FMT_SN9C20X_I420:	descr = "GSPCA SN9C20X I420"; break;
 	case V4L2_PIX_FMT_SPCA501:	descr = "GSPCA SPCA501"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 5373dba640fa..85a32dee4e21 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -744,6 +744,10 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_SGBRG16 v4l2_fourcc('G', 'B', '1', '6') /* 16  GBGB.. RGRG.. */
 #define V4L2_PIX_FMT_SGRBG16 v4l2_fourcc('G', 'R', '1', '6') /* 16  GRGR.. BGBG.. */
 #define V4L2_PIX_FMT_SRGGB16 v4l2_fourcc('R', 'G', '1', '6') /* 16  RGRG.. GBGB.. */
+#define V4L2_PIX_FMT_SBGGR20 v4l2_fourcc('B', 'G', '2', '0') /* 20  BGBG.. GRGR.. */
+#define V4L2_PIX_FMT_SGBRG20 v4l2_fourcc('G', 'B', '2', '0') /* 20  GBGB.. RGRG.. */
+#define V4L2_PIX_FMT_SGRBG20 v4l2_fourcc('G', 'R', '2', '0') /* 20  GRGR.. BGBG.. */
+#define V4L2_PIX_FMT_SRGGB20 v4l2_fourcc('R', 'G', '2', '0') /* 20  RGRG.. GBGB.. */
 
 /* HSV formats */
 #define V4L2_PIX_FMT_HSV24 v4l2_fourcc('H', 'S', 'V', '3')

-- 
2.55.0

