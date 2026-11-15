Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794769872;
	b=2q36WbsuVdWFWP/OA/nqwOA53HpfvZyCbt5eVFX75hfJ9VoPBxC91StzM6CGvczdmR/j
	 98Cx3XK9c46wDOhVokWet334JhW5TBNPazNW/Po7SuaqfMWSxNssEFFBDn/voeonr8hCp
	 8d1e4+snFk6Qf0wtC5i4wNR/KWx27YCFrLq2hZI4zqW9TbCp+XRGJFSk+QhjVhuHWhZIZ
	 FiDZeVJGEx+UDwa5gMTOoYdU4K1TvDaOU5NbQLjhofNd0jqtSzOx3XOUwcInMrphKnXoZ
	 RZX86ddCRaVNevBsqplv8f0nC0EwRCpvQxTIqz9+uhpl4TijFAHwFj/fyzlAbF133Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794769872;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=5GP+PbvAFVygSAU+MQtL0z8V4aG/dqls/7JH5deqeOk=;
	b=sBzsz+wNHmNnTnydBl6wjSTzXq0SqxIwKpqpFpNk0r3pQQI+202QI+J+1vTODp+uneRq
	 bGNVPzuPYUjjnXPOgdE4+anHtZf7JCe57WEeXx3zwT5xoHEJCMffc2rbnxmKJ+9zetWBL
	 iaEZC5OezeW1ViDBl/NvHKFnITd1zCzzrPoeO0IgPuEdrMnjm+oqZwjntItn5563WqK+g
	 Phm23q27jnQkSkoHoQSYSyDdh31ULfMluExqcFnkDmiDlYCpl2y3qCURZ4ofOaUc7/TKJ
	 5f+u7AiMXc/tRPQ33p4GmLuOox5h4JGsiKhUKvCigTAqNmTj3enrOMqD/v6fUvsN7DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=T2A43G9D;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ecmJreG9;
	arc=none smtp.remote-ip=103.168.172.147
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD77606A334
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAD77606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=T2A43G9D;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ecmJreG9
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id F18E2EC0071
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:11:10 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sun, 15 Nov 2026 14:11:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794769870;
	 x=1794856270; bh=5GP+PbvAFVygSAU+MQtL0z8V4aG/dqls/7JH5deqeOk=; b=
	T2A43G9DeK5Cko+dcfZvOMqlGS0yGepocMDC5h5rHmV0CkpMAlXDnQCcs5eLzhHm
	/x8bEvpPYpdt5Ja44eZidZkU2pn3QVCvyQgNpppykPvSe7TSHPaOu+w23kvqZGhV
	26MAjjlxrO3Dv7DS9YzPr9s6iKp8mmKgxUCr6aW5+bSlhZ9dx4Mua38DKm+5pOhR
	hZtrezSl0pr3WsMrNYTbkLNY3MN28XPkYNP4u5g+AvcDSZZQU4znzE5a3lj68eA6
	NELv1Ov89BmzFzBasR43J9ych0wyQ08oPP4SoU/qT1GFFVEdWgi5XKA4pVcoehHr
	EAfse1Io18H2qwvsTsPh1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794769870; x=
	1794856270; bh=5GP+PbvAFVygSAU+MQtL0z8V4aG/dqls/7JH5deqeOk=; b=e
	cmJreG99MgaoUuviWdQAQ9JfnwaSdQjdX5CGLjvRyrx1VCclegF6LvkHjtjAsqVF
	TT8qM7f11lQipslRLainFSejHtsMsW12PUKEKYT/ktD0se/XLpgVaTc3Ua7qjqRi
	kYyeWIt12hXsLiunpZd7rL32Jc8Eg0EGQLJ5fJpQ6KdcfFmdenHs2WF102uV69ha
	Ac9iQKWtAUVbT8Yy4GTdm3/Aaxkm1/3rgWBp5fq+wkUeJGCH91QJ7wG3nYfFxk94
	O+fUdIrh4fQnp4FkPjwZ+NBbF4/a5EiwmKS6BlsiNb69XgPsBCmUX+ZTveW4bguL
	DySBm/4m6ooKxn1ltUqFA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794769870; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:Pgh2MJdPy2KkVsrrqI2PQXszjEXVeUMHO1ZGuiIjnu8PVO4
	J6wDrqrL78zh7CAUEfNkZjsmGFIbYWqmrw85SBcmtKHs7F09rh2vQhxPW7dJYvLE
	FCxMktr8r35T5XFfTf4U8k6B2MmhV4ItKNBSLehtFDSW3+PUMbw+IAA2Ec4KTqOw
	OznVT02mveqLLrjId/GKxQUKvGZ8d0siEyH4447Q+3UPbTSHcLfs4Ef5tTm3Ji59
	531AQA5UUZLaoMTwPDtzlA8Y7AqklCVuoKfLAwfn40JrothP3lIg7ifxOAyjVF5c
	2CsQxFXx2QWbNjOCss+5mKkv05HgMdYUMo7KUtw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:VlLbl8gRgpQnopaAeZBi1C99XwZ+IroUVgfIawO0nTQ=:AhlxX2Qt62LWbeYweWRRPbqE6uCvhyNS3iDjyjdwetk=;
X-ME-Sender: <xms:zgP6ajA-PpNgpyEVbnjuJZYyV2U_NlGnlwS54rxZzvcboN02doUapg>
    <xme:zgP6ake5zyD4ApC2oTFmxgu6EatbORCETr_5wFuOzxSPaTfVnn8WGQmh5nmC2Y8eC
    kEvgC1sg8r_KlBkvmJ4_t_3twZ3g-S-QXx-Li_GvEHjOxcVGaHteNNMng>
X-ME-Received: <xmr:zgP6atkjZAbzvzc_6Dw-2sk7FrDawlEDX4d32IZYJkoEpdrcC48y3kpwth-JRTOEgtIev9SAYc99VPpZp2HVrw4Wxyv0nC8>
X-ME-Proxy-Cause: dmFkZTE3dz+IGFmByUhOePs0BnrbAsypzERZLdGwpx+lyTLlONScXIceJOyoOyNvs30n9t
    1bLlpuDPbvEThD43Z4wRJPhUCIZSLX57MdYaBSSVoyCEjJUtUR50OHFSOKEtODLLcaDish
    3tKC37idnlZZNvA9bjjVJTfmsJsO8QWxL/q8K4EyKBUCIxYOmTvWpingbIlbKdOQevPJZx
    Cii1MR72087BvEj2g+PnQs7T80DyKu+t32tmPgnCeOOT3QsIUUwSPwaMHjd7653acNeZjj
    d6uVRLEFE0DZ7RXYbHyTMas4gAxNInQJAswfMVDc9No+i3THLF9B8o6TxTpSq7YNzTPYje
    RMgkBG1xjA08NZQ6PuZSttbcsSZ5IgmSOahWWyggPelxFMBUlVUa8215WGw6jcWa3KtjyG
    8DUZ86DzGbOLWi9xYJCtQ35Ui9rln1M1yLQI0CAFid1CgtBzuugna+6z32+DF1AfX+jN+w
    GZps1Zjb7Uv0wKk0u/94vfZiwQ5ZA/kn5NSCsb6M2GWngRhLAR5BcXequvgGXxrMhfaLz9
    qhI8EJG91vNUXgXYh7F/wQFB5I5kzfUZv+UthRE4EQa+hsXLVjSQL11K+PEITvwGBOypDT
    dkB0RcfJq5sGHMLhwKUR6rOYAdJxZsq3r0LPjn3FPA3gFF9yZB0OaPPbKPdw
X-ME-Proxy: <xmx:zgP6arE9sukytRBJaIOX5vx0bUr42unaBTaw1_4fszEMQ5sB-apTEw>
    <xmx:zgP6al4mwezLDXSFp-7gUR6vTy1ysJV-hXE5mFGhyYTFxTrjaoBI7Q>
    <xmx:zgP6ajk4DcjreuxDO3b7BMSIekmfnNVCU96hZHlTG6q35JpriaAlkA>
    <xmx:zgP6aqr6ZJgxpe57fg6p8pFR4MvDrdb00CC_VYcJBbd8hzbmFlG-BA>
    <xmx:zgP6anGGzSZfOkGL-nOjiO7GMhjvf8KpE2ttzpWTpXCrH49gh1_28qkR>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 15 Nov 2026 14:11:10 -0500 (EST)
From: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Date: Sun, 15 Nov 2026 20:10:07 +0100
Subject: [PATCH v2 3/3] media: uapi: videodev2: Add 28-bit Bayer formats
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
Message-Id: <20261115-v4l2-add-raw-pix-v2-3-f66dd83e5f85@ragnatech.se>
References: <20261115-v4l2-add-raw-pix-v2-0-f66dd83e5f85@ragnatech.se>
In-Reply-To: <20261115-v4l2-add-raw-pix-v2-0-f66dd83e5f85@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7384;
 i=niklas.soderlund+renesas@ragnatech.se; h=from:subject:message-id;
 bh=AhlxX2Qt62LWbeYweWRRPbqE6uCvhyNS3iDjyjdwetk=;
 b=owEBbQKS/ZANAwAKAQm0/3kE+U0kAcsmYgBq+gPE8+n3clIfZBgpU8qpgves17VVj/L++Gw+3
 7KXl4K/TJiJAjMEAAEKAB0WIQRwy9J0OLNPX3a0+3gJtP95BPlNJAUCavoDxAAKCRAJtP95BPlN
 JIHcD/oCmgPEKjt2qwY5aL0timOH51EBEvaLY7d/k4mBXz7L6ZdJlTicBin+e4GVdpXCvPkiREU
 ih/onUUluQ7R6XasOGSBC+Nh2nBufdFmKpUj3/E+2OWn7SpGbGf+DEW9m7nRIFnDwCIBgV4iO52
 IhoOkPAzpWqlEsznbR5hpKWBhR/Rlatxu0U58S24Usj5Iq59FPk1mjtzQAyaXaxY5mV4wrUbYit
 85R06SW4ToIBasqaZ88ZX6yjrhFPt6ugfPyGFRrigUgx7xVk6ci+fUVq/NfwG8SGxJ+7t2SeZhQ
 aIyMh2VfmqMMTSAruBlw2SLignS52H7L8dzHbWxCBsg89kqWrqM5wc5uCLr7MlBLCc7una8nQgd
 qPaTnKooHm+X54C02f2TIELytN53LDHfqtwLLoL6ZYtNTYc+I74C4ZO3CVVFq+xHiVR8c9nyUX6
 CTFxhoJjz4f+w9CykP+Qgkv/b874OU4j4NF2gPOZhWQuc1DHJIUwMwDpOyno93ERpTka27rOHay
 jxdYLviuLmMYUi8g/S4xybkzD5VfbCJISNNCvxtSoDoPRNjSL3Ms+pwuxrtJZID/HP6+giYueZU
 sgcHxwWt3KmoNoXQiXfPxVGIVDPIHj1KIz6v/Cs/+G1t0d94B5fj4i1iXVuPEUtxauXusitxt7u
 TrHVrCa+O1mU2Ww==
X-Developer-Key: i=niklas.soderlund+renesas@ragnatech.se; a=openpgp;
 fpr=9976695FE98693307BF360A2F1591ABD9588DA5F

Add 28-bit Bayer formats and documentation.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Use same table format example as for other Bayer formats.
- Add format to v4l2_format_info()
---
 .../userspace-api/media/v4l/pixfmt-bayer.rst       |   1 +
 .../userspace-api/media/v4l/pixfmt-srggb28.rst     | 103 +++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-common.c              |   1 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |   4 +
 include/uapi/linux/videodev2.h                     |   4 +
 5 files changed, 113 insertions(+)

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
index 000000000000..6eb53dce8b2a
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb28.rst
@@ -0,0 +1,103 @@
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
+an example of a small V4L2_PIX_FMT_SBGGR28 image:
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
index e6a37b3ec3d7..3ba2dc477322 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -404,6 +404,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_SRGGB16,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SRGGB20,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SRGGB24,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_SRGGB28,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 
 		/* Renesas Camera Data Receiver Unit formats, bayer order agnostic */
 		{ .format = V4L2_PIX_FMT_RAW_CRU10,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 6, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
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
2.56.1

