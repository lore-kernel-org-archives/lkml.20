Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2111503BF4
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057770; cv=none; b=UGAukVqhlWh6UP5A2Qhan4Rq7hhEqaHz7cbOi+d8/DTokQMrplE6258+A642YAoNafnhhiu854JD10hgrAr4DWlLjueKSu0DFAf3rIB70vouU+ICVxF6W4PAiNyj60yvRejNflI81dYp//f1X8TSLKdEahoE3Jxrc9XxgIG5LY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057770; c=relaxed/simple;
	bh=JZ4b2LSRgy7nYsnBVTZH8WkbjNk3IiWD2Z0138WrPwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dhBXrbNaRwOPz3yOUCuGQy/4BQwwgZedJJeUtKgLtvJ9URFO29bauWpyqnjYyEaVBXque34khc9vpDKWWVlHuR0c4pQQMTjByDtecMtuxDN5P0NtM8VTGClsmXSiqo7rImGnlkQ55g5ZyrVMlj4KFDVsUxUzZBX1WEE604VyR1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IP2ThrFM; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IP2ThrFM"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2B5E84E41249;
	Thu, 15 Oct 2026 09:49:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EF0B760360;
	Thu, 15 Oct 2026 09:49:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 564CB103289BC;
	Thu, 15 Oct 2026 11:49:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792057763; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wgNUQE8S9jeVHcc9MHb2BBRTX8cl+6pe5pGaSKO55Us=;
	b=IP2ThrFM3AlIuC1jM613rCQ6h3eme3QuL0r3H/nfVWewUfYtdXt5/sMtv4ZQJMTYJaJJY9
	6V3k/ak/lQ/yx5+vWa/whS+MOPHwPZdxQQFnuo9UTxOkh6a8WdUb788KP7bmeAgz7zbJ9R
	3i1TU9MNPJVatsE1AHybWj7O0t1/OzUHvZmSa9x818XPVeni0vvqUfzrzQ/O0A8SehKUKF
	sOznssBu08vz9A5htBC4Qqr+yrQXr2+0otFysaHWmnrJg7Bht43tAx3RNia720M9PEZ81C
	triXvEpDNhc8WM+NWyJs6OvwdN3YUPshS6FGtmFMLQo4nxXcB44P8Xr1beABPw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 15 Oct 2026 11:48:46 +0200
Subject: [PATCH 1/3] drm/bridge: ite-it66121: improve reading IDs and log
 on errors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-drm-ite-it66121-log-probe-errors-v1-1-7fd6994e0be0@bootlin.com>
References: <20261015-drm-ite-it66121-log-probe-errors-v1-0-7fd6994e0be0@bootlin.com>
In-Reply-To: <20261015-drm-ite-it66121-log-probe-errors-v1-0-7fd6994e0be0@bootlin.com>
To: Phong LE <ple@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Julien Chauveau <chauveau.julien@gmail.com>
Cc: Paul Cercueil <paul.cercueil@bootlin.com>, Nishanth Menon <nm@ti.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

it66121_probe() calls regmap_read() four times to read the vendor and
device ID registers, without error checking. This leads to silently
continuing using invalid ID values when any of the reads fail (which has
happened and is being fixed [0]).

Adding error checking on all 4 regmap_read()s would be annoying, so switch
to regmap_bulk_read().

In turn a bulk read requires a differen data structure, so take that as an
opportunity to make the vendor/device ID computation more explicit.

[0] https://lore.kernel.org/r/20261015-drm-ite-it66121-fix-reset-v1-1-473038e06abc@bootlin.com

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 692a85e1e2e8..9b43456c67a1 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -1580,7 +1580,16 @@ static const struct it66121_chip_info it66xx_chip_info[] = {
 
 static int it66121_probe(struct i2c_client *client)
 {
-	u32 revision_id, vendor_ids[2] = { 0 }, device_ids[2] = { 0 };
+	union {
+		__u8 byte[4];
+		struct {
+			__u16 vendor;
+			__u16 device;
+		};
+	} chip_id_regs;
+	BUILD_BUG_ON(sizeof(chip_id_regs) != 4);
+	u16 vendor_id, device_id;
+	u32 revision_id;
 	struct device_node *ep;
 	int ret, i;
 	struct it66121_ctx *ctx;
@@ -1644,19 +1653,22 @@ static int it66121_probe(struct i2c_client *client)
 	if (IS_ERR(ctx->regmap))
 		return PTR_ERR(ctx->regmap);
 
-	regmap_read(ctx->regmap, IT66121_VENDOR_ID0_REG, &vendor_ids[0]);
-	regmap_read(ctx->regmap, IT66121_VENDOR_ID1_REG, &vendor_ids[1]);
-	regmap_read(ctx->regmap, IT66121_DEVICE_ID0_REG, &device_ids[0]);
-	regmap_read(ctx->regmap, IT66121_DEVICE_ID1_REG, &device_ids[1]);
+	ret = regmap_bulk_read(ctx->regmap, IT66121_VENDOR_ID0_REG,
+			       &chip_id_regs, sizeof(chip_id_regs));
+	if (ret)
+		return dev_err_probe(dev, ret, "Error reading device IDs\n");
 
 	/* Revision is shared with DEVICE_ID1 */
-	revision_id = FIELD_GET(IT66121_REVISION_MASK, device_ids[1]);
-	device_ids[1] &= IT66121_DEVICE_ID1_MASK;
+	revision_id = FIELD_GET(IT66121_REVISION_MASK, chip_id_regs.byte[3]);
+	chip_id_regs.byte[3] &= IT66121_DEVICE_ID1_MASK;
+
+	vendor_id = le16_to_cpu(chip_id_regs.vendor);
+	device_id = le16_to_cpu(chip_id_regs.device);
 
 	for (i = 0; i < ARRAY_SIZE(it66xx_chip_info); i++) {
 		chip_info = &it66xx_chip_info[i];
-		if ((vendor_ids[1] << 8 | vendor_ids[0]) == chip_info->vid &&
-		    (device_ids[1] << 8 | device_ids[0]) == chip_info->pid) {
+		if (vendor_id == chip_info->vid &&
+		    device_id == chip_info->pid) {
 			ctx->id = chip_info->id;
 			break;
 		}

-- 
2.56.0

