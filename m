Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811670;
	b=hjYQmwamIKL+mUyKcBzcI7eazJ7nHNe4tBvJwN87vP4eSg/TdvvB0sfFZfDN4ijTuwds
	 aB4J5+slGqJbUvcn9hcCRn6TuOicGWEaD361cg+ApCRAcpy1rB/SviUNOmLIu+OEnJOh0
	 cQewJCjH3XcujLweoYYEMdlSXJDIpuE7oeivJolCVOmYpotlv6IRT2DP8/tTVE58rw7T2
	 7zeXtfETz9C+FdOGNW7rTqxypBHa6eLc1cfY7jpEuonx7PnUdmvPZmeRtrUDh7QRPkNyR
	 I3lgaMHueNtbBWLBfirC4kWNjdS0G+t4cbbzZ5SxQWIC/QCH7wWq9AFX/sEyssqdVMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811670;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=E0JpqBTyuFuUjjlLGgdMuXGWVUX9cmhegUpVsBsRcwI=;
	b=VeQE5nscog+ohiLvhayEq/4gR45qDq5tBE+ljgziA6psY8GdOthMA5DwloxPhtL00J82
	 7NzyMv4uQ/r1bGo/EkGCPxv2sY7Yf2qcVRq7ZRHUlg78ioWbN1mm3E+7FACih5ft0emxe
	 HMsOiluDG75NeM4FbOEFJ45ZHIJFNhfgtA9Otmti12sazCoB/0PD4xjMNRONC1i4HS+M9
	 ADyASTxK3YK3896BkQhuJE7zpPi5XzB2bC3B49MLb50EptcnVXgwg1CkstPLyvHWdAAMG
	 X9pq1iNAQN9kcOsRRQlL48wcBcW8/EzOXdp7KtJgta4gcKI7acsVC+sFh63v4sUmaew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0ytaeDvz;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9585606A326;
	Wed,  4 Nov 2026 17:01:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9585606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0ytaeDvz
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7F0654E41401;
	Wed,  4 Nov 2026 17:01:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5367160770;
	Wed,  4 Nov 2026 17:01:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BB7EA10329258;
	Wed,  4 Nov 2026 18:01:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793811663; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=E0JpqBTyuFuUjjlLGgdMuXGWVUX9cmhegUpVsBsRcwI=;
	b=0ytaeDvzK8DKJu9T4pfl0gAP0IxWH3tqh1yH5gcKy4m2YVl/58spLrB2TvQxDeNvTRQO+9
	O2AXjOpqyU9lBKhPsqQbuNDH5Aokn8YUkORkeiLescJJZe53RJiCr6Cl1JXpku33n8LsXo
	LOQ6+lI7Nsc1KL9ZchXfXFvbHCUzMWkYHWfeFLk7u+7pWKq5FQBlZu3XLPuW39a0lInxmu
	prmLUVudPO9oXuDETAavlmybKet/2q5erZKE9rrypS/cgs9PGWTvzd2J6WyrME3zPqoFCM
	NAvOWoAzEy/d6XvU5phvNS1U+xJd7t1WQo+Ag5gdN4PhIUXmUa3JNVcjthk+mg==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Wed, 04 Nov 2026 18:00:34 +0100
Subject: [PATCH v4 2/3] regulator: core: Support regulators where the
 voltage selector spans two registers
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
Message-Id: <20261104-paul-lm51772-v4-2-494eab808581@bootlin.com>
References: <20261104-paul-lm51772-v4-0-494eab808581@bootlin.com>
In-Reply-To: <20261104-paul-lm51772-v4-0-494eab808581@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Louvel <paul.louvel@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793811647; l=5893;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=FRF3yHg8enKGO1PLV0LU2TkQD+/oaUiMsP883bdhhlI=;
 b=uzDF5mgrVrOXWP1LGF3JaXOsIjHdwY/i5AvTu+qNmn6T/5gYtPnTih+xk01H1CxBSu519vgCH
 /DMIeYHKdLFDUifM8yH1iyNt93gRgPuLa1QRWzu5n0YV6EIEE+s7QkJ
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
 drivers/regulator/core.c         |  8 +++++
 drivers/regulator/helpers.c      | 67 ++++++++++++++++++++++++++++++++++------
 include/linux/regulator/driver.h |  2 ++
 3 files changed, 67 insertions(+), 10 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 14422cfe80e2..31f3d1ac42d0 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -6060,6 +6060,14 @@ regulator_register(struct device *dev,
 		goto rinse;
 	}
 
+	if (regulator_desc->vsel_reg_oversize) {
+		if (regmap_get_val_bytes(cfg->regmap) != 1 ||
+		    regulator_desc->vsel_reg == regulator_desc->vsel_range_reg) {
+			ret = -EINVAL;
+			goto rinse;
+		}
+	}
+
 	rdev = kzalloc_obj(struct regulator_dev);
 	if (rdev == NULL) {
 		ret = -ENOMEM;
diff --git a/drivers/regulator/helpers.c b/drivers/regulator/helpers.c
index 0def82eb8b46..26bfedbddd7d 100644
--- a/drivers/regulator/helpers.c
+++ b/drivers/regulator/helpers.c
@@ -118,6 +118,32 @@ static int regulator_range_selector_to_index(struct regulator_dev *rdev,
 	return -EINVAL;
 }
 
+static int get_voltage_sel_reg(struct regulator_dev *rdev, unsigned int *sel)
+{
+	unsigned int val;
+	__le16 buf;
+	int ret;
+
+	if (rdev->desc->vsel_reg_oversize) {
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
@@ -140,7 +166,7 @@ int regulator_get_voltage_sel_pickable_regmap(struct regulator_dev *rdev)
 	if (!r)
 		return -EINVAL;
 
-	ret = regmap_read(rdev->regmap, rdev->desc->vsel_reg, &val);
+	ret = get_voltage_sel_reg(rdev, &val);
 	if (ret != 0)
 		return ret;
 
@@ -148,9 +174,6 @@ int regulator_get_voltage_sel_pickable_regmap(struct regulator_dev *rdev)
 	if (ret != 0)
 		return ret;
 
-	val &= rdev->desc->vsel_mask;
-	val >>= ffs(rdev->desc->vsel_mask) - 1;
-
 	range = regulator_range_selector_to_index(rdev, r_val);
 	if (range < 0)
 		return -EINVAL;
@@ -161,6 +184,26 @@ int regulator_get_voltage_sel_pickable_regmap(struct regulator_dev *rdev)
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
@@ -173,6 +216,9 @@ static int write_separate_vsel_and_range(struct regulator_dev *rdev,
 	if (ret)
 		return ret;
 
+	if (rdev->desc->vsel_reg_oversize)
+		return set_oversize_voltage_sel(rdev, sel);
+
 	/*
 	 * Some PMICs treat the vsel_reg same as apply-bit. Force it to be
 	 * written if the range changed, even if the old selector was same as
@@ -257,13 +303,10 @@ int regulator_get_voltage_sel_regmap(struct regulator_dev *rdev)
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
@@ -284,8 +327,12 @@ int regulator_set_voltage_sel_regmap(struct regulator_dev *rdev, unsigned sel)
 
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

