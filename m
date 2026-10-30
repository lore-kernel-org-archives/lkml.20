Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793371518;
	b=H4y7+6QIosAPxz1IyaHW1xq4rvS8cVu84Gs4sbSd+DZDZiE3rk0ic+l8zjxgSOYR25jv
	 +8xqYphE0jfPx3CH86OhzJ4LJ5fN6LZh2jM/eL0ZObRMNS9hjiu1CFF4UeCiRboDGNLBX
	 PJMzD6XWPGYE5tdRp4+7nGn3gQHGYgCBJvV5ilkEn8d0+bnLW6eFXAx/9V/9+aMu2HiX0
	 Qd0b1YVgg2P/3h18SEjngcu7IOOAvsvy7HrZKEc4HAIQ4d2ouJBUc3/QnmqyJ7jh2Pxx0
	 bsYbhdSPTseJ/Ty8QyY6eks7yl8qomPDq/o6clul3F3X2nl0SCvK5h1V4KpuxvcCP5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793371518;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=+yoKdouCrd5jVAwfdWhplQhgtCfQb1PR8MjroevTOms=;
	b=qUT0/l5lcrpcdAg7gYUDWJmSFR3rC7/DgSUzt7N017AFuHMX2Omx6rrO7c34EAQ5XVyy
	 58Wa+B10MYVjlf5KhHpzZ2/bZpBt9u3+ZLoTXa54orH6SgW8OgI1lfVt7epdBgqKZ0lGH
	 TPGLeAhzCE+R/E4Vs9n2RnMZnRTaGjsdFBXAOAOA5EIq3HfCkPqLZ03ReIffPTdP0e9aW
	 fC5kJos3dhkcKVu0eS5hmzKhn8a6DDAi90dztFyi/xcThzPwpakiV8hC3Cc17XSiGnLRG
	 CRmeEg4cWLiYP2pi3hxkq+MKR67J/fpRuiwedGbzuojlA4ZBuZyV/2Y1zm3KE/OsmZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="B/Zjxp32";
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A319E606A325;
	Fri, 30 Oct 2026 14:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A319E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=B/Zjxp32
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5693B4E413A1;
	Fri, 30 Oct 2026 14:45:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2284A603C2;
	Fri, 30 Oct 2026 14:45:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 97BBA103290DC;
	Fri, 30 Oct 2026 15:45:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793371510; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+yoKdouCrd5jVAwfdWhplQhgtCfQb1PR8MjroevTOms=;
	b=B/Zjxp32R55aN6WoiK/iovT1NYYyE/MpkK0rAuZlcsZWp51geAsJz58mPOwXjva8IcIdFg
	amg1zhsIMPVquAYO+6uyuFYmgdSn2+gWJykY3L0TQrm+HlDCoxR6+3fT9B5vsDZlAPWXum
	g0Ldf6t/3JJli1cXSRETpp+aYY1d2v7HOV2v5ZR0FzOQ8VPc4axriMA/JquUtFQj4v8ASn
	m0aNeHnS9/++Y/kjQn9o1r16a2XRWEDkn/ig+O104pSbolkJhjQQDrf6NBRtA1q+uMykeg
	19pzAJJm9kRCqSwMPgZjy8K30ajDF9kztE2omzsdNWVZA/UtB/+ftQbEqjGihA==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Fri, 30 Oct 2026 15:44:45 +0100
Subject: [PATCH v3 2/3] regulator: Support regulators where the voltage
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
Message-Id: <20261030-paul-lm51772-v3-2-0de62c22f342@bootlin.com>
References: <20261030-paul-lm51772-v3-0-0de62c22f342@bootlin.com>
In-Reply-To: <20261030-paul-lm51772-v3-0-0de62c22f342@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Louvel <paul.louvel@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793371496; l=6586;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=h9ganQLZkIz8s2+z96dcJeCDzA1lTe1BnL18lVGSgzs=;
 b=HrjYddWkdduq6cbVTT3aNPw7oxnUEE8RO4HKr0ZQbIjrq8mZox8H25NxasfxmP7hP3jcGMd+o
 woPh/TXEqO9B9BEjwUbyQiqU1SS5y0tgGwTKoKH6V94/u8UvTtoLUMr
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
 drivers/regulator/helpers.c      | 87 +++++++++++++++++++++++++++++++++-------
 include/linux/regulator/driver.h |  2 +
 2 files changed, 74 insertions(+), 15 deletions(-)

diff --git a/drivers/regulator/helpers.c b/drivers/regulator/helpers.c
index 0def82eb8b46..d4b53803ae12 100644
--- a/drivers/regulator/helpers.c
+++ b/drivers/regulator/helpers.c
@@ -118,6 +118,35 @@ static int regulator_range_selector_to_index(struct regulator_dev *rdev,
 	return -EINVAL;
 }
 
+static int get_voltage_sel_reg(struct regulator_dev *rdev, unsigned int *sel)
+{
+	unsigned int val;
+	__le16 buf;
+	int ret;
+
+	if (rdev->desc->vsel_reg_oversize) {
+		if (regmap_get_val_bytes(rdev->regmap) != 1)
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
@@ -140,7 +169,7 @@ int regulator_get_voltage_sel_pickable_regmap(struct regulator_dev *rdev)
 	if (!r)
 		return -EINVAL;
 
-	ret = regmap_read(rdev->regmap, rdev->desc->vsel_reg, &val);
+	ret = get_voltage_sel_reg(rdev, &val);
 	if (ret != 0)
 		return ret;
 
@@ -148,9 +177,6 @@ int regulator_get_voltage_sel_pickable_regmap(struct regulator_dev *rdev)
 	if (ret != 0)
 		return ret;
 
-	val &= rdev->desc->vsel_mask;
-	val >>= ffs(rdev->desc->vsel_mask) - 1;
-
 	range = regulator_range_selector_to_index(rdev, r_val);
 	if (range < 0)
 		return -EINVAL;
@@ -161,6 +187,29 @@ int regulator_get_voltage_sel_pickable_regmap(struct regulator_dev *rdev)
 }
 EXPORT_SYMBOL_GPL(regulator_get_voltage_sel_pickable_regmap);
 
+static int set_oversize_voltage_sel(struct regulator_dev *rdev,
+				    unsigned int sel)
+{
+	unsigned int mask = rdev->desc->vsel_mask;
+	__le16 buf;
+	u16 val;
+	int ret;
+
+	if (regmap_get_val_bytes(rdev->regmap) != 1)
+		return -EINVAL;
+
+	ret = regmap_bulk_read(rdev->regmap, rdev->desc->vsel_reg, &buf, 2);
+	if (ret)
+		return ret;
+
+	val = le16_to_cpu(buf);
+	val = (val & ~mask) | (sel & mask);
+
+	buf = cpu_to_le16(val);
+
+	return regmap_bulk_write(rdev->regmap, rdev->desc->vsel_reg, &buf, 2);
+}
+
 static int write_separate_vsel_and_range(struct regulator_dev *rdev,
 					 unsigned int sel, unsigned int range)
 {
@@ -173,15 +222,17 @@ static int write_separate_vsel_and_range(struct regulator_dev *rdev,
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
@@ -225,12 +276,16 @@ int regulator_set_voltage_sel_pickable_regmap(struct regulator_dev *rdev,
 	range = rdev->desc->linear_range_selectors_bitfield[i];
 	range <<= ffs(rdev->desc->vsel_range_mask) - 1;
 
-	if (rdev->desc->vsel_reg == rdev->desc->vsel_range_reg)
+	if (rdev->desc->vsel_reg == rdev->desc->vsel_range_reg) {
+		if (rdev->desc->vsel_reg_oversize)
+			return -EINVAL;
+
 		ret = regmap_update_bits(rdev->regmap, rdev->desc->vsel_reg,
 					 rdev->desc->vsel_range_mask |
 					 rdev->desc->vsel_mask, sel | range);
-	else
+	} else {
 		ret = write_separate_vsel_and_range(rdev, sel, range);
+	}
 
 	if (ret)
 		return ret;
@@ -257,17 +312,15 @@ int regulator_get_voltage_sel_regmap(struct regulator_dev *rdev)
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
@@ -284,8 +337,12 @@ int regulator_set_voltage_sel_regmap(struct regulator_dev *rdev, unsigned sel)
 
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

