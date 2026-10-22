Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690474;
	b=wC+a1h7JWCeTgvpCCJeXTy0G8YSLs5VabI5UyLGRlRF26L1B5n1aYmrlX0mTEFJIg0qr
	 CrXbmhUS2o8hotySN/U+Rr+GR4FbGAu8UQ5055PxFXsJGB9jYyGMETxVF8tYHvZuU4hTT
	 FTyKLeivcgdSd3zsxVJ+NmUXjWKEQlvO0n++arYVS1jY8nlH2BRlePRfWgMRmZixCitN1
	 13+BgMxO0Th6P0Od2t8x9HzFHldAg6NW6gaVqUSNOPyT5vjwjDlN5Mv/kRqvlvqLH2eSJ
	 Idw+E3o4RjcWiBJZk/4Ll5MmVuqFHWWz5NOR8JsWGNBRpNn7vpGKf39hVqt0txJvPiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=feAclFqGqANXGk5ANej1oUGx0E55rEkA+ZUZcmvKBcM=;
	b=e1ePI1NXvBQ2+zvA6nBn3wE3Lbw3JeOuQ7wfu17cB9zpxCdu8VZulHKG3Uxtb0q6Eyy/
	 jt759riLR4htt3viKFN+6ekuoHNLIjAxUps7S9R9/2fSYJONcY0tINR3ptgnAmvmuB/6R
	 mKId5Ul1s/U0LXMzSB+B+zNqwslSlqPyVbun1wyduwNUGibrNhyTgYjgNQ/r99jw1/Gfv
	 GBKT6IhiGq75yvAcHBq4i9CCJwlRSru6I7xw05573xfWPwidai+RJ6z42TdTImmApi7EH
	 Kz4Gbe+7pNbJVLgqDrzFF0Y/0eBeX6tOOmjkkn83UWQDWKeJReP5/cRv2Pa7a/SGyug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=YKkR28ja;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198A8606A332
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 198A8606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=YKkR28ja
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso49660f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792690473; x=1793295273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=feAclFqGqANXGk5ANej1oUGx0E55rEkA+ZUZcmvKBcM=;
        b=YKkR28jaiLkadTQQSBEuU1h3lBa64XtFdB1ZbrGHfOEYJLG2wVb0hTKwFcM5seUfyz
         M0u4+5avHFZ8iAJWMD5bmnUoj/vhZWqDH7xJAAFRVN5rXhjg41Uceh6sBUhCEVoRVUBi
         cdiwgiRyWWCgxIFR+YqhVvfckfMQ/ovJo0WT1gfJTvZclf8OsSaJsTTotx27EPvN9/C9
         LdTM9afpk5EJjJjfhgb2EhHfOy/cqCIOPm1f6yo/oukX9zNUVZqWDL1ABHZyq1U/0NiT
         ItlzVpN6SOtLcT1zaj8MCgRMpOXZqCAVxlwmrFHl266Bqe51X6XvAq3NgnLQ1GorSvPa
         KnWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690473; x=1793295273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=feAclFqGqANXGk5ANej1oUGx0E55rEkA+ZUZcmvKBcM=;
        b=UunfqluBaypzgT/BgMFbuNLG32PGm7lj2SI2THsP5EBz+Zr9N2DjdXoNGJCuUt5tBu
         m8X3VZZ3l3HjIh7jHHE13X8yyAlbH6OcgszgVYEjjinOqfkaieMuTDLQqX6lata1WDQ+
         GKdpHpENzAXdHrtTOxtKpO7+ASVtMCq9GGzDeRS+0G66FnjQK1yyo/yc6KvcbvpHrQeE
         Ag28aJbG+JywazBi/7AvVl7luBtnr8RhlB3gaF2O8NWJqy/suUHZ47CgQ0vgsWPyHQ4i
         4nifhvAWcuS2AOYD/8fy2W5AXMJ22d2z1HXXJnB99HN5sbS7/FXgi9MWw35H+KVZB8xI
         pGeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwn++TGctK9cSXjPaedt/lPdFYF5xy2GPGVTSfcywQxldUom9z0KDL+/rz8sGSd9g2IHrgybtT6oaqQf8E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDjva1YPdNZxvreyeAWYU+WlLw3I18XB7PXfbjwZK9gK421xoX
	hOczl2r8TBABD0BpkJT5UwgvvYBJzwkDrILPbOrL8zvKA915AffTTkfbyP0PaOiznQ4=
X-Gm-Gg: AYBFou2JAb8W77m2kJq9GtecbwUOUvrHfgfE4sY7qhTfmOfJA74nGYJHoKaj1ea4gZV
	D7Y0aucoeSvcLgI6jo679D2JpG6yba+om6X0DSMM7AeC8YctVesYUUgVGMG3VR6ip/r7/GGyob5
	nP5YQhK1cuW/InWz8WiB6uQGMMfNxg/ei5B06gMpRn3j7KTrAoU9D8EkMbdgeEAo9RENgftt7a0
	9oVy2dXUOwr+1HpIzARDIysUe2ud2kLLU5GQufwGDm8b4dBRoQ9poV+T7ROzEOTUjHO+wzy9KDl
	mSJiezc0c5idmjqDCOiN8vUW9Oq2SidgLnCC62dR2rN0ScXHgrOgmohlbbm2uVuhqpBe4Zfsihx
	EVZhN8KvQI9f0ye8qAHLH55qVuBiFIZtWVi49IcuRafwdL3S6A9fb98XFrwiMvUxXPOUz0rKuT5
	s2Yf0S3uomXUo3OMLPO33HQjVK5rEP+hmNnYsxAy/PfUtJmDZeZvICrt07XB8BwTbuCkD+njTqI
	J476ORL+cttBn5sJA5ym5wosTxzyryMRRts2RZCP7TlDEyZ0HnY55MbEqE6ALvZPEf3poS4ThJW
	Rv6i/gKZ2Ftf1U80zF+CmL7zNGF+YDbOwK50LNRfbKjBhD/mza3L
X-Received: by 2002:a05:6000:4213:b0:488:8931:b1b2 with SMTP id ffacd0b85a97d-48e264bd584mr14628357f8f.28.1792690472691;
        Thu, 22 Oct 2026 10:34:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm13572410f8f.22.2026.10.22.10.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:34:31 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 22 Oct 2026 18:33:58 +0100
Subject: [PATCH v6 05/18] media: sony-starvis2: Rework 2 lane support for
 higher link freqs
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-media-starvis2-v6-5-374343f55fd3@raspberrypi.com>
References: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
In-Reply-To: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

With some Starvis 2 sensors, the link frequency on 2 lanes is sufficient
to achieve a lower line time than the 4 lane value divided by 2, as
the 4 lane value hits the minimum that the pixel array can handle.
That can't easily be handled with the way the values are currently stored.

Storing the 2 lane hmax alongside the pixel array's minimum allows the
4 lane support to divide the value by 2, and then clip to the pixel
array value as a minimum.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index b54e1c68afa0..5dcd760c1a27 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -176,15 +176,15 @@ static const u64 link_freqs[] = {
 	[STARVIS2_LINK_FREQ_1188MHZ] = 1188000000,
 };
 
-static const u16 imx678_min_hmax_4lane[] = {
-	[STARVIS2_LINK_FREQ_297MHZ] = 1584,
-	[STARVIS2_LINK_FREQ_360MHZ] = 1320,
-	[STARVIS2_LINK_FREQ_445MHZ] = 1100,
-	[STARVIS2_LINK_FREQ_594MHZ] =  792,
-	[STARVIS2_LINK_FREQ_720MHZ] =  660,
-	[STARVIS2_LINK_FREQ_891MHZ] =  550,
-	[STARVIS2_LINK_FREQ_1039MHZ] = 550,
-	[STARVIS2_LINK_FREQ_1188MHZ] = 550,
+static const u16 imx678_min_hmax_2lane[] = {
+	[STARVIS2_LINK_FREQ_297MHZ]  = 3168,
+	[STARVIS2_LINK_FREQ_360MHZ]  = 2640,
+	[STARVIS2_LINK_FREQ_445MHZ]  = 2200,
+	[STARVIS2_LINK_FREQ_594MHZ]  = 1584,
+	[STARVIS2_LINK_FREQ_720MHZ]  = 1320,
+	[STARVIS2_LINK_FREQ_891MHZ]  = 1100,
+	[STARVIS2_LINK_FREQ_1039MHZ] = 1100,
+	[STARVIS2_LINK_FREQ_1188MHZ] = 1100,
 };
 
 struct starvis2_inck_cfg {
@@ -632,7 +632,8 @@ struct starvis2_variant {
 	const struct cci_reg_sequence *common_regs;
 	unsigned int num_common_regs;
 	unsigned int vmax_default;
-	const u16 *hmax_min;
+	const u16 *hmax_min_link_freq;
+	u16 hmax_min_pixel_array;
 };
 
 static const struct starvis2_variant imx678_variant_def = {
@@ -658,7 +659,8 @@ static const struct starvis2_variant imx678_variant_def = {
 	.common_regs = imx678_common_regs,
 	.num_common_regs = ARRAY_SIZE(imx678_common_regs),
 	.vmax_default = 2250,
-	.hmax_min = imx678_min_hmax_4lane,
+	.hmax_min_link_freq = imx678_min_hmax_2lane,
+	.hmax_min_pixel_array = 550,
 };
 
 struct starvis2_model_info {
@@ -1207,11 +1209,8 @@ static const struct v4l2_subdev_internal_ops starvis2_internal_ops = {
 static int starvis2_init_controls(struct starvis2 *starvis2)
 {
 	struct v4l2_ctrl_handler *ctrl_hdlr;
-	const u32 hmax_4lane =
-		starvis2->variant->hmax_min[__fls(starvis2->link_freq_bitmap)];
-	const u32 lane_scale =
-			starvis2->lane_mode == STARVIS2_LANEMODE_2L ? 2 : 1;
 	struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);
+	const struct starvis2_variant *variant = starvis2->variant;
 	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl *link_freq;
 	s32 hblank, max_hblank, vblank, max_vblank;
@@ -1228,7 +1227,10 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 		return ret;
 
 	starvis2->vmax = starvis2->variant->vmax_default;
-	hmax = hmax_4lane * lane_scale;
+
+	hmax = variant->hmax_min_link_freq[__fls(starvis2->link_freq_bitmap)];
+	if (starvis2->lane_mode == STARVIS2_LANEMODE_4L)
+		hmax = max(hmax >> 1, variant->hmax_min_pixel_array);
 
 	/* PIXEL_RATE is fixed and read-only */
 	v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops, V4L2_CID_PIXEL_RATE,

-- 
2.34.1

