Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794769870;
	b=4XGR397nrOPHVJTtSva/Ne9yw6xyjDfwxe4vFpExeZNv/pGpkMviW1w4T7gg2AtT2UIe
	 6fVMDpZ/LPOtkSZn3vXivM+djgRa9/RpjZZwQNOkAqbD1uksns9RHJHhE0rlcl+KDuMmk
	 h2EOon9vwUGjHAgWpxiuPR85DgOC6knhfX1Bgh5oLzhwW+mzk15NABa3GR4FOiJGgs29Y
	 XAYiOI/5nZaDhRKCiKM6pWrXayg/BlnxNt6pH88M95B+YGkdD7nVTUm+C1lLzUE3ruAfF
	 7aJuGRziqT9B/jRRzp8z+vJWUJlXIKrwHCJmLBAaZ+7qja9PHH40cNSSZwTuOKy73ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794769870;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=fCLKdeQ2PyYfAON4538X6iQYHQ+oydwKp5GZDAWzg2o=;
	b=ezUXgSsrz15YfLCzjLnGe3Sxuk6K5r/8kquYPpyJq0yfEJ2leOoGV/SFFLY1xV//OzrP
	 E7aErTkCj09gsATV1G7fSJHjLZ/9XtXzV5ZWcPqbDi56w0rBYrUA+waXzUwrlliMoBYbm
	 k6+oK6bHcWOljk3UdA0dp6o9Q3R1kiDkbTFIDjr0UuXcyC6nRIREsuBb/U19MvAko9zI4
	 hZoY5J+TKQ+ixEBSZConp72w9CLdu/VHow6t9CFYDGhRLntO9Al8yciT0smO7zYg2o3Z7
	 5hrzId3ZCFVz1HJCWrr5GZ3xD7rGpyT5ir8wR+MuLS9HO95LEWWLP43yKhmHlJ/mywQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=H27A9QMk;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=WtG7usJd;
	arc=none smtp.remote-ip=103.168.172.157
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998B2606A33F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 998B2606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=H27A9QMk;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=WtG7usJd
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C4195140003D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:11:08 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Sun, 15 Nov 2026 14:11:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794769868;
	 x=1794856268; bh=fCLKdeQ2PyYfAON4538X6iQYHQ+oydwKp5GZDAWzg2o=; b=
	H27A9QMkTfSdd+0scmfG+i/jmsP7rL8FOA+GcgdmG1nQKr4nckih7IgYRTgNaoRD
	XeX7P+ZngTW/UkTsYnERlOZr5T0bE0ZhmqHTggckq4HEYIWmiUjD8AOqyaFrhinN
	Q3zm+ZINtUdbn4yxDoOzzIwdrN/oJaN1ibiTCzgUbgAZLItA/zi2rRBlD+4sOug0
	zITD1cip/30HjQ3fyg7Fv+hJQTtKeVE6jUZxSx0jX8wd7Ks2Lcve5ugzpOQBEQUC
	zWb5jjf5yHY5LA+q7QO4UxVfo9tlFL/oaGO0Dab8fO2ZbEn2djGceGNXxMn83ANZ
	NG8/iNxLLXJqKMwPHrenNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794769868; x=
	1794856268; bh=fCLKdeQ2PyYfAON4538X6iQYHQ+oydwKp5GZDAWzg2o=; b=W
	tG7usJdRZz5tV+uEv59XMWkxOe1cisujoSM4bwddcVRYi/8nM++lBxOVt2gdR4hI
	/LWKlFvye706k5vWpGVjQqp6Qtg/09BFBmtO6gc72Fj8+xIthZQoGVZ53h7P7309
	h3d8GUs28kRib4Z76g9rG3rtf+GbB3Z1nuNYWadE1RvGmZU15KJ8DphiCLysje3K
	qqGI1TGEM739EOSVJb6W4s8SdT01nWnGHrbWhpW0BjLFf03m6GVagBNXqwTeey/6
	YTZoUjUWFWhnvQSTodrZIFpgibRV82a00of5NvllJ3R4RQl14G4QiEh+nT1Zx6QM
	ANcOncoI+SscjYErSTFHQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794769868; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:FWNMeRIiU+gtCOzq7BTesOTWYybD15Ql8wgNH2ciZKP9K6J
	Z5cmlWZZcxD563KKzkKVw7YffLIatBwHz/ifp6ndeeQtN04B5yPPgfDHttr7ssYN
	NQJy1MUzaAxSperQsLyeA66KYAzf000ZAhxMj9b8itygwElZXxCjofyoMJ3do8M8
	izp6TUn3gNo8oFwo09FyS84fP3SqprDYq6wEmotLy2sI5LBZ+htoE2Ab0Ph26WxH
	jmqk96rCJC2SjuTYDBto2RRx8sCCfkovxzHC6wmdS8VpGdIn4BQWj6d7hfs/hv8d
	oIRpi0APIOWhCavHyMIlVBCEljj+JadzE9UIL0A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:ox5OkxWZwgOtqQK2jDCU6elqSvtLOGgCr0L9HCWkzHU=:V5SdEr6+XYfQCM3ImncJF2LX8mSLhSOoF8TyTFLnn2w=;
X-ME-Sender: <xms:zAP6ahlfe5OJpCYFnNeXUebk1uztOOuRrtK8jDLxzF06dHBXIoofqg>
    <xme:zAP6anwSNIsMwHuxaljR_H9HU5H1-4w3jJNVIg7n3-cW-aCqxzThzSAwAPpIDLlm4
    Gqzm7u_aTEG0HN08bUDCyg3EdsPMPYkkO8BKpB9iUfcwWpaWQS6x7a2>
X-ME-Received: <xmr:zAP6amq9H643sa2aATB8c6JMv9pa7g7TyOqdukDCHIvaHdk1nSG7Z_agsKqohecimSvXpUgpoUxnHH68LfV6O1STyv-CCy0>
X-ME-Proxy-Cause: dmFkZTE3dz+IGFmByUhOePs0BnrbAsypzERZLdGwpx+lyTLlONScXIceJOyoOyNvs30n9t
    1bLlpuDPbvEThD43Z4wRJPhUCIZSLX57MdYaBSSVoyCEjJUtUR50OHFSOKEtODLLcaDish
    3tKC37idnlZZNvA9bjjVJTfmsJsO8QWxL/q8K4EyKBUCIxYOmTvWpingbIlbKdOQevPJZx
    Cii1MR72087BvEj2g+PnQs7T80DyKu+t32tmPgnCeOOT3QsIUUwSPwaMHjd7653acNeZjj
    d6uVRLEFE0DZ7RXYbHyTMas4gAxNInQJAswfMVDc9No+i3THLF9B8o6TxTpSq7YNzTPYof
    OtUSAlIFlPy8aNY8NWfvUg1BNUgefy6oghm5YwuDF+bE1btNSImczI/4fCwgh+r/u06AsI
    XZYxNOKUTTO4RJ2tjIbE8cbzbjCEK16yAjqyJ2Btk2sU8NQHLE7acJxr+t+HL/Dx6rYmH3
    CsVdlM4p6Vcg7GyjCR1QxOr2wUfFJuoLq5bVNBKr3zmJVj/AEzkSIxDo6s2TVi7Ek7591I
    Es+VmszMosopGrwZkscqsfxlAN6/syNW+uok21e47IeJGwYAANBjnyj+n/3bPoIz9wKcjv
    uk9jRyKhSWWwgAaxkYGWDBfnFTZ+osRbTtvEYXiD7/CeVhGI8Al70MjN47pQ
X-ME-Proxy: <xmx:zAP6am7mNjD3blpUh6tMpOkmdrGQJeVdqOIGcPiOPqCYK_Y4fcYJmw>
    <xmx:zAP6atfMEpffidJtNReDDBm23MMqAyoEk7p1IqFH9uMYqQNAWIUN9w>
    <xmx:zAP6ar7P7Q33GHmpHZwxGcvBLiSML_ZBHgExl8TMQ52IhyrnB9tIlw>
    <xmx:zAP6akv8wiV_Okv98Z6N_YHpgPzX3YpkdOL6pq-nKXd0O21hJVp1Og>
    <xmx:zAP6asrbasFHPOWq9lqJ4kWnhA0arEV8rh-9IPnEjQYaVQ99cBsKaJMU>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 15 Nov 2026 14:11:08 -0500 (EST)
From: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Date: Sun, 15 Nov 2026 20:10:06 +0100
Subject: [PATCH v2 2/3] media: uapi: videodev2: Add 24-bit Bayer formats
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261115-v4l2-add-raw-pix-v2-2-f66dd83e5f85@ragnatech.se>
References: <20261115-v4l2-add-raw-pix-v2-0-f66dd83e5f85@ragnatech.se>
In-Reply-To: <20261115-v4l2-add-raw-pix-v2-0-f66dd83e5f85@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7385;
 i=niklas.soderlund+renesas@ragnatech.se; h=from:subject:message-id;
 bh=V5SdEr6+XYfQCM3ImncJF2LX8mSLhSOoF8TyTFLnn2w=;
 b=owEBbQKS/ZANAwAKAQm0/3kE+U0kAcsmYgBq+gPERJ/omL+jB/8fflQr1THgrG3qTGTZo3IQn
 vUV65PWOUWJAjMEAAEKAB0WIQRwy9J0OLNPX3a0+3gJtP95BPlNJAUCavoDxAAKCRAJtP95BPlN
 JIbBD/44gQHdfcAf/cEf9q2d8vNALgIzZF7t5nBIgpBLJTxxpDtv2GR1syyN3duzVMPHQN09RRQ
 r5ZOkFenk0TMfAkPjv3217mpV8zQRnJ7VbSOIbMpB/V7e7Fg7vaiFi7z8RQ0GCZGiYppkYtvPiN
 TqffjiGCbuLAElLnoMZ0kZBF0fi+CODa4Vtl/JzUf3bwbjDZCsbg1p+yDo8x9PtJDvMOt6Cog1V
 BqTwNNc6iwKoQenGYEoqjiB8ugmLG1vQ97dHohuIf+cfnVJInx0HIN9U0uEjX+svGsJO6jBZ00e
 EtFoJ+YLqUpRkrULahRBnoT+XwwDKCsak6+7YuK404q+XLSoMbRqzeyLOWNUJg9YAfCRrYGbYf+
 zt5Z6hF3Bm3U1+AK54yRj1XUO2V6H8uLV+IifhbSd6sZU8OH190RBV/QA4VFczC9yk03zhJFjhT
 gHPcEf6ZeW/h5t/cyLW5mFNmYOLQ4ahexklSyzIZIVKHC5WovMDigJh0h8lzAqTZ8JXm+lSqba7
 n259sKKJ9+VS1r9LGeXv57XeyHRrMMKtmpGWOcDLJrnyUqqGJCec8TgW7ZscXJ3LQSaISMc2bjc
 5BKso7eqqZyX26+o2NfEKnLP/A9UrE090xcM/4DV1QmajVWJhCU5q/rudI2C3x4g77bU4EbmU1g
 vFuP99cuDIGcjRQ==
X-Developer-Key: i=niklas.soderlund+renesas@ragnatech.se; a=openpgp;
 fpr=9976695FE98693307BF360A2F1591ABD9588DA5F

Add 24-bit Bayer formats and documentation.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Use same table format example as for other Bayer formats.
- Add format to v4l2_format_info()
---
 .../userspace-api/media/v4l/pixfmt-bayer.rst       |   1 +
 .../userspace-api/media/v4l/pixfmt-srggb24.rst     | 103 +++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-common.c              |   1 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |   4 +
 include/uapi/linux/videodev2.h                     |   4 +
 5 files changed, 113 insertions(+)

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
index 000000000000..7f397dd4a8aa
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb24.rst
@@ -0,0 +1,103 @@
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
+an example of a small V4L2_PIX_FMT_SBGGR24 image:
+
+**Byte Order.**
+Each cell is one byte.
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - start + 0:
+      - B\ :sub:`00`
+      - B\ :sub:`00`
+      - B\ :sub:`00`
+      - B\ :sub:`00`
+      - G\ :sub:`01`
+      - G\ :sub:`01`
+      - G\ :sub:`01`
+      - G\ :sub:`01`
+      - B\ :sub:`02`
+      - B\ :sub:`02`
+      - B\ :sub:`02`
+      - B\ :sub:`02`
+      - G\ :sub:`03`
+      - G\ :sub:`03`
+      - G\ :sub:`03`
+      - G\ :sub:`03`
+    * - start + 16:
+      - G\ :sub:`10`
+      - G\ :sub:`10`
+      - G\ :sub:`10`
+      - G\ :sub:`10`
+      - R\ :sub:`11`
+      - R\ :sub:`11`
+      - R\ :sub:`11`
+      - R\ :sub:`11`
+      - G\ :sub:`12`
+      - G\ :sub:`12`
+      - G\ :sub:`12`
+      - G\ :sub:`12`
+      - R\ :sub:`13`
+      - R\ :sub:`13`
+      - R\ :sub:`13`
+      - R\ :sub:`13`
+    * - start + 32:
+      - B\ :sub:`20`
+      - B\ :sub:`20`
+      - B\ :sub:`20`
+      - B\ :sub:`20`
+      - G\ :sub:`21`
+      - G\ :sub:`21`
+      - G\ :sub:`21`
+      - G\ :sub:`21`
+      - B\ :sub:`22`
+      - B\ :sub:`22`
+      - B\ :sub:`22`
+      - B\ :sub:`22`
+      - G\ :sub:`23`
+      - G\ :sub:`23`
+      - G\ :sub:`23`
+      - G\ :sub:`23`
+    * - start + 48:
+      - G\ :sub:`30`
+      - G\ :sub:`30`
+      - G\ :sub:`30`
+      - G\ :sub:`30`
+      - R\ :sub:`31`
+      - R\ :sub:`31`
+      - R\ :sub:`31`
+      - R\ :sub:`31`
+      - G\ :sub:`32`
+      - G\ :sub:`32`
+      - G\ :sub:`32`
+      - G\ :sub:`32`
+      - R\ :sub:`33`
+      - R\ :sub:`33`
+      - R\ :sub:`33`
+      - R\ :sub:`33`
diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 009721cd2527..e6a37b3ec3d7 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -403,6 +403,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_SGRBG16,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SRGGB16,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SRGGB20,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_SRGGB24,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 
 		/* Renesas Camera Data Receiver Unit formats, bayer order agnostic */
 		{ .format = V4L2_PIX_FMT_RAW_CRU10,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 6, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
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
2.56.1

