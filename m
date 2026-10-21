Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578531;
	b=w+QdG/ji9Zo3gYxWbwbm+ySQJlIwA9hBw9Fn8arnSkGwruNqnwGsOqrwAobhzzkW2KCz
	 rmovH5l2MN39PNI9y1vtNjqRC82MXKkZplMMffNfQ/z6PF4ihib7l+4q851Eq8BB1Taoi
	 jjFOMnW6YbhqhB6OrZQF1wZ+kJ5GmhxnTMwnNLmX6QP8Xo20b3HhhgBejObuhgOfT/8Jc
	 ny1xyFF7T0pRzUy8amx8uPTzrP9PJy/BdCknKK9DH1ih1Bn9j5MlPU1w95qG8eIHI1U6E
	 x/tys+ro4ICjZQ53Z490i9tSoaBKXqTp0nOiWMaQ4LBG5/62s808moeuav9JoI/uV9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578531;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=ZSoGy5dps/KoaCHgigqDazauW/W03FE98bBK2jNSbQs=;
	b=UnmajUfehx7w2O/N7wTkcDIODXHfduX0UVgl3xQdekpFKzRnMLL+a3FzKN3LUbkGB6q9
	 RdygGH3nD8DM3R6gjz+8Uyb8/zs/RiZCtIfUh4mM7JsYU+LjE/DYKYzesDiA4U5JvIrYS
	 aXSZLcbI5fpQrS95QwKnqQxAYmXJWVDOdwulbZi08NHqf4Ekr8nH66vaPveP6BQOO8teg
	 LxFvwLEngjClNQbnQVWmIQc5NOeMvNvlcODxSs/5RVipsW6cEoe0yD+EmOYXayrWA9kO0
	 wyLmUherYbgSTX5DNAKWX7rv9yacHamfJVtYMDNi8su7iblkB+dchzvVdFPfraM87pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Ja1d5n5Z;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CBB606A320
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1CBB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Ja1d5n5Z
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5DE2AC5CD77;
	Wed, 21 Oct 2026 10:29:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 795C9606E3;
	Wed, 21 Oct 2026 10:28:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5E79710328E5A;
	Wed, 21 Oct 2026 12:28:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792578528; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZSoGy5dps/KoaCHgigqDazauW/W03FE98bBK2jNSbQs=;
	b=Ja1d5n5ZH1fw0gmykyXHZpRlyHa/uHrc7FIhLJlYZn/xHos6xS8NbwEr/e7jOmBEDW5UAI
	kYS6sStgtqHeaA+cTzwDpZM64SsjRA1l2ePXhsBXcVjOo7cNhQITOksNAm7p1yk3k+U3b7
	pSirurQhQcJZPvgPf72IuWmhMjlVGfUxP5NlEgYLvBbb+le+I29H3J/vLy9I8KfLqJVig3
	Q8lykAoOoqlXyd30yg42E00xQKlFDd5cyCrY/pftxIqIYzDxP93sGnBy2+gIPNcZy2vHuw
	WWpjF1b0gEmXf7QqXzTKNgEaZjVwcIO+x0PDzyXdbdOu1lHwXQQeDl+2k2dvZQ==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Wed, 21 Oct 2026 12:27:45 +0200
Subject: [PATCH 4/5] regulator: Support regulators where the voltage
 selector spans two registers
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
Message-Id: <20261021-paul-lm51772-v1-4-25f0ffbffa8d@bootlin.com>
References: <20261021-paul-lm51772-v1-0-25f0ffbffa8d@bootlin.com>
In-Reply-To: <20261021-paul-lm51772-v1-0-25f0ffbffa8d@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Louvel <paul.louvel@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792578518; l=5750;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=s7S5OsGAC/cwtcNgaVWb1CyRtznqn16Pg64Avs+pleI=;
 b=MyjakuQpDImtq0Vzj56yzE75OTnG0OUaWqFifiovDcOqbqGgDUHU52h09DimQNOC9KSlQk1IY
 ZBrCftSPbwlBoJpeUIn/UrE5AcgtlX+aGKdPNaT9yEZCPwoLuo4DTZr
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

Some devices uses 8-bit registers to store the voltage selector across
two registers: one for the least significant bits and one for the most
significant bits.

Introduce vsel_reg_oversize to support voltage selectors that span two
registers. Write the selector in bulk across both registers using
little-endian encoding.

Assume that future hardware will require at most one additional register
to store the voltage selector, and that only a device with 8-bit
register will require such flag.

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 drivers/regulator/helpers.c      | 71 ++++++++++++++++++++++++++++++++--------
 include/linux/regulator/driver.h |  2 ++
 2 files changed, 60 insertions(+), 13 deletions(-)

diff --git a/drivers/regulator/helpers.c b/drivers/regulator/helpers.c
index 0def82eb8b46..1221128dde98 100644
--- a/drivers/regulator/helpers.c
+++ b/drivers/regulator/helpers.c
@@ -118,6 +118,37 @@ static int regulator_range_selector_to_index(struct regulator_dev *rdev,
 	return -EINVAL;
 }
 
+static int get_voltage_sel_reg(struct regulator_dev *rdev, unsigned int *sel)
+{
+	int ret, val_bytes;
+	unsigned int val;
+	__le16 buf;
+
+	if (rdev->desc->vsel_reg_oversize) {
+		val_bytes = regmap_get_val_bytes(rdev->regmap);
+
+		if (val_bytes != 1)
+			return -EINVAL;
+
+		ret = regmap_bulk_read(rdev->regmap, rdev->desc->vsel_reg, &buf, 2);
+		if (ret != 0)
+			return ret;
+
+		val = le16_to_cpu(buf);
+	} else {
+		ret = regmap_read(rdev->regmap, rdev->desc->vsel_reg, &val);
+		if (ret != 0)
+			return ret;
+	}
+
+	val &= rdev->desc->vsel_mask;
+	val >>= ffs(rdev->desc->vsel_mask) - 1;
+
+	*sel = val;
+
+	return 0;
+}
+
 /**
  * regulator_get_voltage_sel_pickable_regmap - pickable range get_voltage_sel
  *
@@ -140,7 +171,7 @@ int regulator_get_voltage_sel_pickable_regmap(struct regulator_dev *rdev)
 	if (!r)
 		return -EINVAL;
 
-	ret = regmap_read(rdev->regmap, rdev->desc->vsel_reg, &val);
+	ret = get_voltage_sel_reg(rdev, &val);
 	if (ret != 0)
 		return ret;
 
@@ -148,9 +179,6 @@ int regulator_get_voltage_sel_pickable_regmap(struct regulator_dev *rdev)
 	if (ret != 0)
 		return ret;
 
-	val &= rdev->desc->vsel_mask;
-	val >>= ffs(rdev->desc->vsel_mask) - 1;
-
 	range = regulator_range_selector_to_index(rdev, r_val);
 	if (range < 0)
 		return -EINVAL;
@@ -161,6 +189,19 @@ int regulator_get_voltage_sel_pickable_regmap(struct regulator_dev *rdev)
 }
 EXPORT_SYMBOL_GPL(regulator_get_voltage_sel_pickable_regmap);
 
+static int set_oversize_voltage_sel(struct regulator_dev *rdev, unsigned int sel)
+{
+	int val_bytes = regmap_get_val_bytes(rdev->regmap);
+	__le16 val;
+
+	if (val_bytes != 1)
+		return -EINVAL;
+
+	val = cpu_to_le16(sel);
+
+	return regmap_bulk_write(rdev->regmap, rdev->desc->vsel_reg, &val, 2);
+}
+
 static int write_separate_vsel_and_range(struct regulator_dev *rdev,
 					 unsigned int sel, unsigned int range)
 {
@@ -173,15 +214,17 @@ static int write_separate_vsel_and_range(struct regulator_dev *rdev,
 	if (ret)
 		return ret;
 
+	if (rdev->desc->vsel_reg_oversize)
+		return set_oversize_voltage_sel(rdev, sel);
+
 	/*
 	 * Some PMICs treat the vsel_reg same as apply-bit. Force it to be
 	 * written if the range changed, even if the old selector was same as
 	 * the new one
 	 */
 	if (rdev->desc->range_applied_by_vsel && range_updated)
-		return regmap_write_bits(rdev->regmap,
-					rdev->desc->vsel_reg,
-					rdev->desc->vsel_mask, sel);
+		return regmap_write_bits(rdev->regmap, rdev->desc->vsel_reg,
+					 rdev->desc->vsel_mask, sel);
 
 	return regmap_update_bits(rdev->regmap, rdev->desc->vsel_reg,
 				  rdev->desc->vsel_mask, sel);
@@ -257,17 +300,15 @@ int regulator_get_voltage_sel_regmap(struct regulator_dev *rdev)
 	unsigned int val;
 	int ret;
 
-	ret = regmap_read(rdev->regmap, rdev->desc->vsel_reg, &val);
+	ret = get_voltage_sel_reg(rdev, &val);
 	if (ret != 0)
 		return ret;
 
-	val &= rdev->desc->vsel_mask;
-	val >>= ffs(rdev->desc->vsel_mask) - 1;
-
 	return val;
 }
 EXPORT_SYMBOL_GPL(regulator_get_voltage_sel_regmap);
 
+
 /**
  * regulator_set_voltage_sel_regmap - standard set_voltage_sel for regmap users
  *
@@ -284,8 +325,12 @@ int regulator_set_voltage_sel_regmap(struct regulator_dev *rdev, unsigned sel)
 
 	sel <<= ffs(rdev->desc->vsel_mask) - 1;
 
-	ret = regmap_update_bits(rdev->regmap, rdev->desc->vsel_reg,
-				  rdev->desc->vsel_mask, sel);
+	if (rdev->desc->vsel_reg_oversize)
+		ret = set_oversize_voltage_sel(rdev, sel);
+	else
+		ret = regmap_update_bits(rdev->regmap, rdev->desc->vsel_reg,
+					 rdev->desc->vsel_mask, sel);
+
 	if (ret)
 		return ret;
 
diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
index 55cc519103ed..8a0f3aebdade 100644
--- a/include/linux/regulator/driver.h
+++ b/include/linux/regulator/driver.h
@@ -312,6 +312,7 @@ enum regulator_type {
  * @range_applied_by_vsel: A flag to indicate that changes to vsel_range_reg
  *			   are only effective after vsel_reg is written
  * @vsel_reg: Register for selector when using ``regulator_map_*_voltage_*``
+ * @vsel_reg_oversize: Indicates that the vsel_reg spans on two registers
  * @vsel_mask: Mask for register bitfield used for selector
  * @vsel_step: Specify the resolution of selector stepping when setting
  *	       voltage. If 0, then no stepping is done (requested selector is
@@ -405,6 +406,7 @@ struct regulator_desc {
 	unsigned int vsel_range_mask;
 	bool range_applied_by_vsel;
 	unsigned int vsel_reg;
+	bool vsel_reg_oversize;
 	unsigned int vsel_mask;
 	unsigned int vsel_step;
 	unsigned int csel_reg;

-- 
2.56.0

