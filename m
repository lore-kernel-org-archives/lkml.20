Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794769868;
	b=YflWgSsaCfhBO3EoptL7Wl+9tlHqPLizn+cvy00fWbLjoaFMv99PVtysKH6PJJkQawgE
	 mDrR3KAVVrRHaT7TXEvZk7g9EDlAo5waWDr8W1+CjzufoJfkzaKDCKJt9fX7GVAiZjuec
	 C8IEdwhPqXfGoiRtptrnz2HbxC3p7D/6tFaqFxhOBD+CRrCz1halUb58nhfjcVpN0D4YW
	 88GEsJQSWqXwQdsHF2Hpr4bfzcMneaAI6jMJhi3yaxJnPxQbV9tOs0TSsPPNB2OvnwEy1
	 mbfXA/L8Ha+MMgCqaXnMZYULerlOFbGLLMEUHi5Kk99nQP4XKMhGV8hz54L0BCV5g5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794769868;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=QLmSZ/NBp3N6h+9oI0F2QCgyrk6btOIBSOGmGKZdMUk=;
	b=ADSG0AI84ibuOK3KoqQvbwGDXm3SaFeza1FKisp8ZoGLxS+YX2mbaXUfOJArsJH68J83
	 6DiUliX1EwM7prtp0SuitcfIrhVL1Xopy0TBnKlZ45QgjX3NLUkrTeRrp5Eq79tDx2gik
	 LFxezqIG9mQhvmBjKC/fAQbQqhTcKQCmFTbuJbxi3g4IGxi6IwK/glLPZWECnSzAjG+P4
	 /qGgrFs2FWVfFJjpOlhzzRXTzgMHrz3fhSG4xdGBFIirlGqAFIaW11Imt0xI3Lv89h5sR
	 O2BivT3FiLH3its3wV9HIDxhhhmy9jBcod//Eke1sihr0F+N5l5UWDBBL5G6+/meykg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=RG6ErrJ5;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=GQ+sx78d;
	arc=none smtp.remote-ip=103.168.172.147
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10DA606A334
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:11:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A10DA606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=RG6ErrJ5;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=GQ+sx78d
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 87278EC0071
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:11:06 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 15 Nov 2026 14:11:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794769866;
	 x=1794856266; bh=QLmSZ/NBp3N6h+9oI0F2QCgyrk6btOIBSOGmGKZdMUk=; b=
	RG6ErrJ579YOV++ukRavwcyNYN1S1GC/mBeH/ZuZCcU3JAGakB6DzAIqElz76Xv1
	ib6RNodt075FoviRGLmg0QuVksDhNGYUsg4vq/gtqx8tDFBBj9hhix9OMezY63ZV
	4Cgn+PestR4xLLsLrSpJEgwfDVJDfy9paj1QtRMZSAS5G862ntv14qo8kcRxphcZ
	FY+NB2G2AVx5emUCSIB/XliZotl6oeHza87Kz7ACpXyt7BRGoc2LXE72GhuMgADF
	05yHdj/rylH6vMDgp0beuQN9P/4wV/Be6W5ys3ZxPCR2NbvqP5CjTDwfvhcbzgJb
	vxKzW1wrdzhdQR0Bim0zEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794769866; x=
	1794856266; bh=QLmSZ/NBp3N6h+9oI0F2QCgyrk6btOIBSOGmGKZdMUk=; b=G
	Q+sx78drr60qgqC4JO1xa1R/ecnCq3/Y4iOdtoQNzjyFAD779rnR2ixPb9pVaH9N
	6f06LyHq/ND4p0IReCYy7d7podXsuEWclNdjfUnRYDdmCJPsyKFOKltGaKO/vtOz
	cUe2XrgT9mpVyGV1CfVvGJJI3azF5Yfotdts2WFrgfRNgwexD975jOLq4e2T4o3A
	4Xzu3NZQPx+qIrWqvEiFE2/1uBFuCp81apWUBvjk+Amuw19kFd0vHbEJ2qjY6tDd
	KX62XNQ1IZXm0CGls5PiRMndTsmWNY71Hx5wTOcRi3RrsNqwnTr4yzEwJlkhA1Tt
	PB8ufMEttjfKnK5GEpAvg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794769866; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:IZdHwxalsNBEqpDo+gXZmE2xSBV1POV9/uWo6BEjaHMVte4
	DJmSaf1WMb+uoH4u98H5/uT9KB3Vs9IbEFe4WuChNMdE6ZWfzceNKB3C0LdZoKoa
	5U1eF57RWsGQK8fj3AKy6hp/+WHb5y9xTbpd3VY0jgWYWXzglzi+w7LtI18MTgdg
	uQ1YqH6TYRXNePV1EEfLgAwHBFybABU6/c4QR8jksD/Qbv2Ue6SzG+k8WDqjLK0d
	+a4faRSQOc8RqObsHsA+/qljsFP99hOpixbxf6BwPwwE4tGokvaqKrRp12idINvm
	Kv6cEb3lJZpkAa7vS0Btk63N6W9NjgjIsUAtfRA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:hPqFwMlvBqH/7hIXulBqDF+C0FKhGySeGD7zDJkS3X0=:N6h1vdIXjhRJZ3vjg22o1wupRJyHZUfutQeMAz5hTDM=;
X-ME-Sender: <xms:ygP6aodX2hwMSmjcAUAX9uYl8SP_Fa0w7VXW6SB2Gl9fmWNtm4TzfA>
    <xme:ygP6alKtPsWqR0i6PmiwZPlux54IaKj2BJ0wtdpf2kIzEA0J9rdoVBhn49nQXTYky
    KfbPqMqPADxRle9fb3voGpd7lPYK2YOfnMIQfrkXw4L9KGNsf_HDLML>
X-ME-Received: <xmr:ygP6aojuBz1qLp1Y1w8YdS59TxQCFMoqvE4htU_TBGS9oGfleAbiDl7V77wfgTSbRRhBxns_7A1ESFg0u8TNsk0HkyABFqc>
X-ME-Proxy-Cause: dmFkZTE3dz+IGFmByUhOePs0BnrbAsypzERZLdGwpx+lyTLlONScXIceJOyoOyNvs30n9t
    1bLlpuDPbvEThD43Z4wRJPhUCIZSLX57MdYaBSSVoyCEjJUtUR50OHFSOKEtODLLcaDish
    3tKC37idnlZZNvA9bjjVJTfmsJsO8QWxL/q8K4EyKBUCIxYOmTvWpingbIlbKdOQevPJZx
    Cii1MR72087BvEj2g+PnQs7T80DyKu+t32tmPgnCeOOT3QsIUUwSPwaMHjd7653acNeZjj
    d6uVRLEFE0DZ7RXYbHyTMas4gAxNInQJAswfMVDc9No+i3THLF9B8o6TxTpSq7YNzTPYNm
    HcMmpYDwA8/nMOEI7x7STvPO5chsDAXFHFIrPayTAQI/8tk9veZbRTJCzSVXPLGeUZrS7U
    5vdOAU5FMZc5N55hY+4nsXlzmWIbUtPNJb1JYbTlJhGsbGvmrugFZQSD32vNbRS6DNoKFw
    wCMP3X2wbXxCixtb9sRm7mBMW080uo4zKEwT8QsWueVVM/FH4TFVMq9Nm8u8WGkfA/sU3Q
    zc5dtIWxAUUFn2QnJAgYegiL+iuUmYgwuo7/cDm65iLYX1KgwDznPV2WyFgkIzS2mQsIQE
    Pdtb12Rr0O/ICrVKwA7OUQrYTIhP8YZ6OUlsOBkl6I86CHHKHpyjAAAS3LRw
X-ME-Proxy: <xmx:ygP6ajTE3PAeYeMvLkYOeYXlY1d6Z4pvsJqnIkwB3_67PrZqEu-zHw>
    <xmx:ygP6aiUeesnSNpduMJnwJ3EMggEwvxE4Trf0hUDfPRNWclpWNxljnQ>
    <xmx:ygP6avSB3-4Qh3Gp3G6O4MEN1SL70dH3pymTDbeTlWTh7nMKiD85Ng>
    <xmx:ygP6aklhkDCFUob6JoKq1VjDkiroUP1YE0EYAFTfbv4oj-IRqlyYUA>
    <xmx:ygP6aliHBoDXdaGpBEutdUfotA83FCKZNqViz98zJ_P3fssf_SytiGZo>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 15 Nov 2026 14:11:05 -0500 (EST)
From: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Date: Sun, 15 Nov 2026 20:10:05 +0100
Subject: [PATCH v2 1/3] media: uapi: videodev2: Add 20-bit Bayer formats
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
Message-Id: <20261115-v4l2-add-raw-pix-v2-1-f66dd83e5f85@ragnatech.se>
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
 bh=N6h1vdIXjhRJZ3vjg22o1wupRJyHZUfutQeMAz5hTDM=;
 b=owEBbQKS/ZANAwAKAQm0/3kE+U0kAcsmYgBq+gPE8rxjpZhVFSC4wCGKYZbSSgXITefk7F0Fh
 eNrws9wE1mJAjMEAAEKAB0WIQRwy9J0OLNPX3a0+3gJtP95BPlNJAUCavoDxAAKCRAJtP95BPlN
 JN2uD/9mAzBd2W431zexofayzLBviJoxWkA4G7NIesaD9LabonQKGIA4hj+oMeTV6Pk1TIdkMKO
 knF0M3fnmWX8OMvGQc/2eG3xVthkAcnZuCfjxII5qoqvUQuBucVjrgQgJ87AqHAGjeEOZs/YimK
 KLAwfw6MSjj/qCtZR318r0dZj3BbYwZj4iPJqHIJnkC+QF7mjqf6KNc0lhTQfq+cdD78k8YuBZI
 ptvUXlUjWNO0Aj39QKUYGwvlnXw3a5gZXToMOw8xvQyWL6/fsEGlShgDeQR2yYYm6nWuSgjk1yh
 LCpLc/1K2u/0povlW53sVAzU1dpkSKjb/CjMDmlu4nRO01YTXj0oxN6DOyETXpSi3AtYer8NB/Y
 i6Tlx9W2w3vkBj08ERb880Ugm3o/1rR8XyqK9gOk6cue+n6PiNW1hU0lbcFY/O01/3g5nhEEyAj
 exmDQKWKIQ8BVDjhRhGY1lt9SkY9Rdva0HxJ4pHm2mxxjUERzcMWXUAIsI/BHtbH+MTkeUzHfxT
 C6hvQhDh9X0kfFB97wWApw/2VfhRug5mJWpQCNknxhXRuTmbNVJA2oTWNPeMvTvj7oGzzdJUuoW
 ggmQFAjn51oHihK2QVniGh70QZo27fUKu3szIqXVMponkxGqetK5OSdr4gPpcIPVcIK9izHG5jM
 lYvFSOSc6wjtUJw==
X-Developer-Key: i=niklas.soderlund+renesas@ragnatech.se; a=openpgp;
 fpr=9976695FE98693307BF360A2F1591ABD9588DA5F

Add 20-bit Bayer formats and documentation.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Use same table format example as for other Bayer formats.
- Add format to v4l2_format_info()
---
 .../userspace-api/media/v4l/pixfmt-bayer.rst       |   1 +
 .../userspace-api/media/v4l/pixfmt-srggb20.rst     | 103 +++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-common.c              |   1 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |   4 +
 include/uapi/linux/videodev2.h                     |   4 +
 5 files changed, 113 insertions(+)

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
index 000000000000..915700a5af93
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb20.rst
@@ -0,0 +1,103 @@
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
+an example of a small V4L2_PIX_FMT_SBGGR20 image:
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
index 11ab684024c5..009721cd2527 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -402,6 +402,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_SGBRG16,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SGRBG16,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SRGGB16,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_SRGGB20,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 
 		/* Renesas Camera Data Receiver Unit formats, bayer order agnostic */
 		{ .format = V4L2_PIX_FMT_RAW_CRU10,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 6, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
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
2.56.1

