Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359D2526ABD
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904671; cv=none; b=P24I10claqS1JNq+qvaa7mMcpfQDf9LECsQMhjjK2DL+xfbuz6f7xsz1J4VzAhrCnGkPqPURemLNbHSWeyuNg18OpafYU8v6SkFjDWaK3UcavkLF3mvx8h53NdIht/k3KIfSVeQKsg79h0a7TMTza50QN/gSEkvNicGN2xhbWeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904671; c=relaxed/simple;
	bh=ITBx4rYenor8V3bCi69HrLntm9Z1RYopRRSMyj9+/Is=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=msBo+5an0jk8bOYrGMkXSnCpaFTCzbF43felxYYuyy1lQfAJBkFTYRSFDwgNGX6haYtEaggZ0i3vs6JiszWMyGUYzNBuMvPIRADwkEmjBihNGg27ElU/wf2eQ+XvbDerKLlP6vUyGosZjwEL9Z2nDqvM43zBleDcRwe1shUAIIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=gXr3COGS; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="gXr3COGS"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c4be28b82so3054715f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1791904665; x=1792509465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/1J5fefXkYhWAaHQTn5c4Nz8sqR+9ImdFpBU6lFkTI4=;
        b=gXr3COGS2Koqo4DXB/twDYFV6TJR2QRessWlBAZdms9V3id9CiLKUM4fp9fdnBe5c+
         35FjcBdbZJIjVuZW22F18BjHghLN/Wel5yb5UEqDUy4Oc/DgIvDuIxy57+uM1l0VXpj6
         n+RefCqfSOVnrmJp00fZsnOkggBY9JkVeDslq8H0N+9kqV8bmCX3lPdvM0bZ86qhGMZ/
         0NGNqsr4FyDpijqMeCnmGBV0YYRw6Kev5Y87aMhfkJrOVN25/zeneGQVq/lAXEJW2Zwk
         2WsgOyeP9Z2K19eRdeNweVqfcegMr9uhZ1XVFIrv5ohG5EFsPt1jgKGRy7ItvQFzfcno
         BSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904665; x=1792509465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/1J5fefXkYhWAaHQTn5c4Nz8sqR+9ImdFpBU6lFkTI4=;
        b=ktVZGhzwRd2UHBQVcH9Udm30bfbptzgBeoMF/mXRqdTtqW8APLA9dfj+dq1FaIIBnh
         H5+4siz4gut2yiodi5m1Cjd3VngGKQgirTap9A/H3C3ThZ8Tvgmo7tWsfWH4ofUnPc+i
         ZyLnakzjvRjss40lB2r7mV68qCYeLo83X+uJ2yyIelU3LSi9HctA14Ah9AYwDIj+ocyZ
         sQfch1sOklzjuKxtY20R8zRul1/lBBoSxkaMBlWIuV42Wxhnnev0YJLjl4wZvWafGp5U
         d3coBvPA7SaUSyMJPteNNGU0dgetfhJE8RZX0mEUMEagiTPr5fCVE1q8JQLTCSsmdgND
         2usw==
X-Forwarded-Encrypted: i=1; AKwUvBzPPANboMNC9/5tTa73F3hCteXvmmtTwukaSF1a7tn12TdYB2+m9sVT2AV3OavLR4Df4FKGj51rz/JnuJU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSJqD3BuDlAEHE+btvoAG2Oleuvw0Pofpk6z+8DPaz+CIroPjn
	Fr/TZsg1T3qLQ50pNbMpYixMJ5UYBWkkoKPp/h7Fk99ffXIaN3EHsfqUIPxBgdbCr5o=
X-Gm-Gg: AYBFou3sAvrEYwd3RtiHB2SRBjRWRI1HZNT8SZcAJhhNd//OnyIBk9a4/a7co7RLxhz
	1RqJkdhCY57JBTmWdHUdiejB/c2C0G3WkC9pfTwwxsn1djUI1b+pqiYi8gdtz92yd/D2R5JOMmF
	U2ogRjYLFjyMc5tiqGpZns/E9/sbeyDFlsE3bGX9j15OviiI6zD5On0kM6kUb8rIwq1/2w9+mRr
	lgTit4o1/ZNsbdJvCSOdaOXoZPLtZj6s1GL+wO8hTbq8Vs/9au3KPYTYGckkjH5X3v64I2wtkBg
	8QwO9Po+qx24xYPQ6WVE+dR71+0X0lsSK59DEpxp775biCff15bF/UE+0VM/Cx9U7phtn8V2tQZ
	+tfd57U6LURW5uOulkzMUdPxms98P4E2EITx5B/9hP82+1O4IxfClwH9Vn/nxciSbKs1NUT59Ib
	9/HWwwtUtgN86xeBjOt7Muo6bLJO4fbeWH+IvVZrMY+ztIZGtBSkJm0BebF9xCz5U1vZ8hh7gPA
	HDPZGsg19Eo5m8J5vkKrM7bygvYYwRJlk7E6ES5shQPy2U3nw==
X-Received: by 2002:a05:600c:8105:b0:4a1:775b:5eb2 with SMTP id 5b1f17b1804b1-4a18e48362emr250494715e9.13.1791904665309;
        Tue, 13 Oct 2026 08:17:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaabb8sm6529743f8f.15.2026.10.13.08.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:17:44 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 13 Oct 2026 16:17:04 +0100
Subject: [PATCH v2 05/13] media: sony-starvis2: Rework 2 lane support for
 higher link freqs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-media-starvis2-v2-5-3670722d250a@raspberrypi.com>
References: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
In-Reply-To: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
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
index f62a957ff1a8..66c77c5957e3 100644
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
@@ -631,7 +631,8 @@ struct starvis2_variant {
 	const struct cci_reg_sequence *common_regs;
 	unsigned int num_common_regs;
 	unsigned int vmax_default;
-	const u16 *hmax_min;
+	const u16 *hmax_min_link_freq;
+	u16 hmax_min_pixel_array;
 };
 
 const struct starvis2_variant imx678_variant_def = {
@@ -656,7 +657,8 @@ const struct starvis2_variant imx678_variant_def = {
 	.common_regs = imx678_common_regs,
 	.num_common_regs = ARRAY_SIZE(imx678_common_regs),
 	.vmax_default = 2250,
-	.hmax_min = imx678_min_hmax_4lane,
+	.hmax_min_link_freq = imx678_min_hmax_2lane,
+	.hmax_min_pixel_array = 550,
 };
 
 struct starvis2_model_info {
@@ -1189,11 +1191,8 @@ static const struct v4l2_subdev_internal_ops starvis2_internal_ops = {
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
@@ -1210,7 +1209,10 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
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

