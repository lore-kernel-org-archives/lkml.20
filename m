Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3F84BD366
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004699; cv=none; b=eubIkYirzyYylmiBWRlpO9TqUCyg7QhK4/9M/+zYRFHXLT1OYGiiQ1QhtrhAu72HzX/2zbycu0bw5eMRTRdjLoE7E6OW5Z6TSkhRBaMBGWVLzCwfr+Lwujm+dtXLm5R8/vRUS31UVQPRjv5mFNQfUmmXBnN3pcYz1j0ZeoPslZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004699; c=relaxed/simple;
	bh=lMxXbWh9gcYq1Rca1IdpzxHKsuHkIoF7ppljfHLIC0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U4pj/uukS1CevEdSzdd2UrjDyRHHbF5LmVkITGw07qSzegduYyb0vYpKQ4Oka/WeD1y9FCDM342Bdfuhuwm/nfEApZjm9v8rqkhSAlvWdfJuG8bPE72lw0WsIeNW5FB9rI9g0VLsodLfDfPyCTjcmyKSpCQTnSn5ezCZJfWoB9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NUjkNsur; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NUjkNsur"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48586861639so7111f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790004696; x=1790609496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t6CuawVxIWhEs6YC068dOAO7JxwWhj6Ln8+UX+AQKf0=;
        b=NUjkNsuruD4Z1Lpplx/2irZIQotrrnIURWeaHrJCNjarjyPqvmjEo/kiIthe+EUokz
         s3GunG0Nj5j5i3Zgbu77QXkZUqf/O0v8xb5q8cjvj9tXyyT50AeyM/fX/w1PgHR8l6IS
         sxzQRA+pL9MYTBFWbn/E3r3vhyQJdn9YSaqPX+2QaiJwUDfgrn9aGS0jUig1UdeaqELj
         2iwev2K+GGNmTNylZypdgmC+sjD5WQBKNjf7O+25N0sayOYBz1O6rae6BvqLFXxttMwX
         RsmqPhmXZjvOFfCJsyeO1zfGJ+DIXnADrnSIW6aFVO255H/ytE8y+fnE9AypCTX7UbLb
         SGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004696; x=1790609496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t6CuawVxIWhEs6YC068dOAO7JxwWhj6Ln8+UX+AQKf0=;
        b=LMvqs00v3FD0K6RsUEBiww9DVEIH32k93W/rvb02o9RZab/d0aYxGB46WKAku0vYWQ
         TtvttRqRDP5sBthavKDSnpnSPuURwvQCngWT4DY6VG1Fbr3TIBsaBT3aft3FskBLEKoA
         ezc37vBaOP5ndbx+z9I1LiKQOL3CxDNs8/gB8NPBC4pigEBolW89EdUj2XkeHhg6zF1x
         GtMDJ3uC6BdVkz8upVc5GzTG5uUgt29RQM6kdJ4+fU/ZVNyhU9QJuylYLbu4yrK5fQXY
         mns+xsClaTrvp90tfuojFRFQdKCBHq/cx8sim+yBenFoPTjPdEHYa52GgZaYQjSM7ppu
         S5+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxd5WpB973DhXJMCiEO4vG5C3B5RG1ixGznqbSl9jJLRw8Wa+jwigHsNbf7gvhSTW12bghZrE6R534k1Hw=@vger.kernel.org
X-Gm-Message-State: AFuF++m6HKW6RcGAdlKlqrLYbPqlpLJ+hfzMWC3pOhsqmbMBrqcz3gsn
	koT5lycw0pBbkP3k7XNHGJBBjbBvLFwW7fdGZW+b8rDxp5CrasB8RBP1
X-Gm-Gg: AYBFou3kKeWFpAG7jJJQdZIHkj7jXvlmZEh3xnM8/s6hc++dnR4SS2JSx3iZpUMFgbI
	34Kb0/h5a36Cj9vetNUsA/jmHR9C9L/DDGZUUXZ7zcI08DlVuDYzmSfFwfp5YvjC+Xejk9z6a+S
	7a06CikKwPtPFN6jFhsxY/PNMD8/jOP67jhh7FCyP3vCuEJAkZryVCCoH0uKgVdLrtBa0jMcD/Q
	l1CLwoJdI0oxm7Hxz2nIQmsO/ywtECj7UY5t+6YofrxeTiTBEPWUHKVIHv6dFLnJwyDXf3oGLTp
	mYft5S/fEUHD83lR4k7XWKjNapD97Cpb0svvnCx4rmVag9obfyZIWvbr8avWHdpH38eFfLSuouK
	aAAowgf3RbhfrfWRl0gt2l4tD0SOi416S7i6XY36p0FXl0/ofwbjAQ1Wd5Rx+/TumshnUX4XPE4
	Y/oHa8lwiYg+VPb32BHa3xi6XUdP6SsZ0PwuWUZEMmUQALOFPa7xeRJ+hZBtalROvIhgUBkjpC2
	ObAlwHsKRZr1T0tLppkd2/Rg1OiuqHph362180SNfrrV+M4tqyWEdNYnA==
X-Received: by 2002:a05:6000:2f83:b0:487:fb2:1a0f with SMTP id ffacd0b85a97d-48860f7ec9bmr21822f8f.6.1790004695614;
        Mon, 21 Sep 2026 08:31:35 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724562aebsm25313835f8f.14.2026.09.21.08.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:31:35 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Mon, 21 Sep 2026 17:30:00 +0200
Subject: [PATCH v2 4/5] media: rockchip: rkcif: add support for rk3576
 vicap mipi capture
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-vicap-rk3576-v2-4-0a4582e20c72@gmail.com>
References: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
In-Reply-To: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790004687; l=8452;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=lMxXbWh9gcYq1Rca1IdpzxHKsuHkIoF7ppljfHLIC0Y=;
 b=uMI84BK2y4kV3gSqKg2dSq1XehFV36psClHlnyAtlUyBK1MQg1r5+4FFHzVj8Os+6OuL27QV3
 29RLUz2gtu8BidgcVolA3Vt/KDpL9ZSjfGc7/UKGmWD11PVWIOJSTC/
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

The RK3576 Video Capture (VICAP) unit features a Digital Video Port
(DVP) and five MIPI CSI-2 capture interfaces. Compared to the RK3588
variant, the MIPI register blocks are laid out differently (there is
no block at offset 0x200), the ID_CTRL0 bit layout has changed, and
the VC/DT filter has moved from ID_CTRL0 to ID_CTRL1. The capture
size, which the other variants configure in ID_CTRL1, lives in the
ID_SET_SIZE register.

On the RK3576 the pixel clock of each MIPI port enters the VICAP
through a dedicated CRU gate (CLK_VICAP_I0CLK to CLK_VICAP_I4CLK),
so the variant claims these five clocks in addition to aclk, hclk
and dclk.

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 140 +++++++++++++++++++++
 .../platform/rockchip/rkcif/rkcif-capture-mipi.h   |   1 +
 .../media/platform/rockchip/rkcif/rkcif-common.h   |   2 +-
 drivers/media/platform/rockchip/rkcif/rkcif-dev.c  |  21 ++++
 4 files changed, 163 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
index 432f47a1fc23..53e62d059764 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
@@ -30,6 +30,14 @@
 #define RK3568_MIPI_CTRL0_CROP_EN     BIT(5)
 #define RK3568_MIPI_CTRL0_WRDDR(type) ((type) << 1)
 
+#define RK3576_MIPI_CTRL0_HIGH_ALIGN  BIT(11)
+#define RK3576_MIPI_CTRL0_WRDDR(type) ((type) << 8)
+#define RK3576_MIPI_CTRL0_PARSE(type) ((type) << 4)
+#define RK3576_MIPI_CTRL0_DMA_EN      BIT(3)
+#define RK3576_MIPI_CTRL0_CROP_EN     BIT(1)
+
+#define RK3576_MIPI_CTRL1_DT(dt)      ((dt) << 2)
+
 #define RK3588_MIPI_CTRL0_DMA_EN      BIT(28)
 #define RK3588_MIPI_CTRL0_HIGH_ALIGN  BIT(27)
 #define RK3588_MIPI_CTRL0_WRDDR(type) ((type) << 5)
@@ -490,6 +498,138 @@ const struct rkcif_mipi_match_data rkcif_rk3568_vicap_mipi_match_data = {
 	},
 };
 
+static u32
+rkcif_rk3576_mipi_ctrl0(struct rkcif_stream *stream,
+			const struct rkcif_output_fmt *active_out_fmt)
+{
+	u32 ctrl0 = RKCIF_MIPI_CTRL0_CAP_EN | RK3576_MIPI_CTRL0_DMA_EN |
+		    RK3576_MIPI_CTRL0_CROP_EN;
+
+	switch (active_out_fmt->mipi.type) {
+	case RKCIF_MIPI_TYPE_RAW8:
+		break;
+	case RKCIF_MIPI_TYPE_RAW10:
+		ctrl0 |= RK3576_MIPI_CTRL0_PARSE(0x1);
+		if (!active_out_fmt->mipi.compact)
+			ctrl0 |= RK3576_MIPI_CTRL0_WRDDR(0x1);
+		break;
+	case RKCIF_MIPI_TYPE_RAW12:
+		ctrl0 |= RK3576_MIPI_CTRL0_PARSE(0x2);
+		if (!active_out_fmt->mipi.compact)
+			ctrl0 |= RK3576_MIPI_CTRL0_WRDDR(0x1);
+		break;
+	case RKCIF_MIPI_TYPE_RGB888:
+		ctrl0 |= RK3576_MIPI_CTRL0_PARSE(0x7);
+		break;
+	case RKCIF_MIPI_TYPE_YUV422SP:
+		ctrl0 |= RK3576_MIPI_CTRL0_WRDDR(0x4);
+		break;
+	case RKCIF_MIPI_TYPE_YUV420SP:
+		ctrl0 |= RK3576_MIPI_CTRL0_WRDDR(0x5);
+		break;
+	case RKCIF_MIPI_TYPE_YUV400:
+		ctrl0 |= RK3576_MIPI_CTRL0_WRDDR(0x3);
+		break;
+	default:
+		break;
+	}
+
+	return ctrl0;
+}
+
+static u32
+rkcif_rk3576_mipi_ctrl1(struct rkcif_stream *stream,
+			const struct rkcif_output_fmt *active_out_fmt)
+{
+	return RK3576_MIPI_CTRL1_DT(active_out_fmt->mipi.dt);
+}
+
+const struct rkcif_mipi_match_data rkcif_rk3576_vicap_mipi_match_data = {
+	.mipi_num = 5,
+	.mipi_ctrl0 = rkcif_rk3576_mipi_ctrl0,
+	.mipi_ctrl1 = rkcif_rk3576_mipi_ctrl1,
+	.regs = {
+		[RKCIF_MIPI_CTRL] = 0x20,
+		[RKCIF_MIPI_INTEN] = 0x74,
+		[RKCIF_MIPI_INTSTAT] = 0x78,
+	},
+	.regs_id = {
+		[RKCIF_ID0] = {
+			[RKCIF_MIPI_CTRL0] = 0x00,
+			[RKCIF_MIPI_CTRL1] = 0x04,
+			[RKCIF_MIPI_FRAME0_ADDR_Y] = 0x24,
+			[RKCIF_MIPI_FRAME0_ADDR_UV] = 0x2c,
+			[RKCIF_MIPI_FRAME0_VLW_Y] = 0x34,
+			[RKCIF_MIPI_FRAME0_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
+			[RKCIF_MIPI_FRAME1_ADDR_Y] = 0x28,
+			[RKCIF_MIPI_FRAME1_ADDR_UV] = 0x30,
+			[RKCIF_MIPI_FRAME1_VLW_Y] = RKCIF_REGISTER_NOTSUPPORTED,
+			[RKCIF_MIPI_FRAME1_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
+			[RKCIF_MIPI_CROP_START] = 0x90,
+			[RKCIF_MIPI_SET_SIZE] = 0xa0,
+		},
+		[RKCIF_ID1] = {
+			[RKCIF_MIPI_CTRL0] = 0x08,
+			[RKCIF_MIPI_CTRL1] = 0x0c,
+			[RKCIF_MIPI_FRAME0_ADDR_Y] = 0x38,
+			[RKCIF_MIPI_FRAME0_ADDR_UV] = 0x40,
+			[RKCIF_MIPI_FRAME0_VLW_Y] = 0x48,
+			[RKCIF_MIPI_FRAME0_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
+			[RKCIF_MIPI_FRAME1_ADDR_Y] = 0x3c,
+			[RKCIF_MIPI_FRAME1_ADDR_UV] = 0x44,
+			[RKCIF_MIPI_FRAME1_VLW_Y] = RKCIF_REGISTER_NOTSUPPORTED,
+			[RKCIF_MIPI_FRAME1_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
+			[RKCIF_MIPI_CROP_START] = 0x94,
+			[RKCIF_MIPI_SET_SIZE] = 0xa4,
+		},
+		[RKCIF_ID2] = {
+			[RKCIF_MIPI_CTRL0] = 0x10,
+			[RKCIF_MIPI_CTRL1] = 0x14,
+			[RKCIF_MIPI_FRAME0_ADDR_Y] = 0x4c,
+			[RKCIF_MIPI_FRAME0_ADDR_UV] = 0x54,
+			[RKCIF_MIPI_FRAME0_VLW_Y] = 0x5c,
+			[RKCIF_MIPI_FRAME0_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
+			[RKCIF_MIPI_FRAME1_ADDR_Y] = 0x50,
+			[RKCIF_MIPI_FRAME1_ADDR_UV] = 0x58,
+			[RKCIF_MIPI_FRAME1_VLW_Y] = RKCIF_REGISTER_NOTSUPPORTED,
+			[RKCIF_MIPI_FRAME1_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
+			[RKCIF_MIPI_CROP_START] = 0x98,
+			[RKCIF_MIPI_SET_SIZE] = 0xa8,
+		},
+		[RKCIF_ID3] = {
+			[RKCIF_MIPI_CTRL0] = 0x18,
+			[RKCIF_MIPI_CTRL1] = 0x1c,
+			[RKCIF_MIPI_FRAME0_ADDR_Y] = 0x60,
+			[RKCIF_MIPI_FRAME0_ADDR_UV] = 0x68,
+			[RKCIF_MIPI_FRAME0_VLW_Y] = 0x70,
+			[RKCIF_MIPI_FRAME0_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
+			[RKCIF_MIPI_FRAME1_ADDR_Y] = 0x64,
+			[RKCIF_MIPI_FRAME1_ADDR_UV] = 0x6c,
+			[RKCIF_MIPI_FRAME1_VLW_Y] = RKCIF_REGISTER_NOTSUPPORTED,
+			[RKCIF_MIPI_FRAME1_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
+			[RKCIF_MIPI_CROP_START] = 0x9c,
+			[RKCIF_MIPI_SET_SIZE] = 0xac,
+		},
+	},
+	.blocks = {
+		{
+			.offset = 0x100,
+		},
+		{
+			.offset = 0x300,
+		},
+		{
+			.offset = 0x400,
+		},
+		{
+			.offset = 0x500,
+		},
+		{
+			.offset = 0x600,
+		},
+	},
+};
+
 static u32
 rkcif_rk3588_mipi_ctrl0(struct rkcif_stream *stream,
 			const struct rkcif_output_fmt *active_out_fmt)
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h
index 7edaca44f653..4e17cbc04b76 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h
@@ -13,6 +13,7 @@
 #include "rkcif-common.h"
 
 extern const struct rkcif_mipi_match_data rkcif_rk3568_vicap_mipi_match_data;
+extern const struct rkcif_mipi_match_data rkcif_rk3576_vicap_mipi_match_data;
 extern const struct rkcif_mipi_match_data rkcif_rk3588_vicap_mipi_match_data;
 
 int rkcif_mipi_register(struct rkcif_device *rkcif);
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-common.h b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
index f83c8099b78e..08a213438d34 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-common.h
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
@@ -27,7 +27,7 @@
 #include "rkcif-regs.h"
 
 #define RKCIF_DRIVER_NAME "rockchip-cif"
-#define RKCIF_CLK_MAX	  5
+#define RKCIF_CLK_MAX	  8
 
 enum rkcif_format_type {
 	RKCIF_FMT_TYPE_INVALID,
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
index be3a174b9aab..2a5758776b3e 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
@@ -53,6 +53,23 @@ static const struct rkcif_match_data rk3568_vicap_match_data = {
 	.mipi = &rkcif_rk3568_vicap_mipi_match_data,
 };
 
+static const char *const rk3576_vicap_clks[] = {
+	"aclk",
+	"hclk",
+	"dclk",
+	"iclk",
+	"iclk1",
+	"iclk2",
+	"iclk3",
+	"iclk4",
+};
+
+static const struct rkcif_match_data rk3576_vicap_match_data = {
+	.clks = rk3576_vicap_clks,
+	.clks_num = ARRAY_SIZE(rk3576_vicap_clks),
+	.mipi = &rkcif_rk3576_vicap_mipi_match_data,
+};
+
 static const char *const rk3588_vicap_clks[] = {
 	"aclk",
 	"hclk",
@@ -76,6 +93,10 @@ static const struct of_device_id rkcif_plat_of_match[] = {
 		.compatible = "rockchip,rk3568-vicap",
 		.data = &rk3568_vicap_match_data,
 	},
+	{
+		.compatible = "rockchip,rk3576-vicap",
+		.data = &rk3576_vicap_match_data,
+	},
 	{
 		.compatible = "rockchip,rk3588-vicap",
 		.data = &rk3588_vicap_match_data,

-- 
2.43.0

