Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7393FE347
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371979; cv=none; b=Kmnq9v0DuQ1NCMlnev0OJCA3unD8wialcn0RN1YWdooQD1DzCSZAwEloJc2tev63M5x7qsobX5qNZIn/tiL9RG8bAoGOKC6Wu+ApV9dQzJ0vnw8BcWyQiWSGCtqIgq3B6waQrDlymp8YEItH9mUoMPRseN03ICgeqWkGpOCTvDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371979; c=relaxed/simple;
	bh=XY7mOhZqq9LWXUt88AII2yu7FLuLutizkwgrhvSheuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=soLYFFifyYBtxS3GYYUO68ckRhaWJl2fQk8p3SL7cOxywC1Ek96K49H0/31u2F2cJpfSc4fcauTDMU7+Re5xM/CIrNUiVQ5Nva696yzDDrHOeQr79a9gKl4khHx7ksUxNme4svToxDXsO/GWadG7GZgSB1fFIXI25u2Anf0U0AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZUoVKTbt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZUoVKTbt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ADC51F00893;
	Mon, 14 Sep 2026 07:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789371978;
	bh=HW64KVa5kWJeO60DzhKz9juuefGy7uyjxpyhr0h7unk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZUoVKTbtkkjmab7Wrf7HciKjTtpF6KZF//yjujrhqWNCsIQV3qBQmZg221WIazEsY
	 +NWTxNMHL85N6TN3Fcs3wZymg0wTblHTr0eBJR53g6cdzCZ+u6uNEdPRUWqRX+qru4
	 WOP/khZLbsLcPADVVWn9/YUIA0b084g7wVZeLw/m64MFuF+fO4u82eXcrj3GrVzzBt
	 PTSDwfVhZ+bOJQ3z2M05txpyPelKULbV4qUgIe7/N7DhY30rHFzoMA8Ni1GbezFgbm
	 kiTJlbI5lC7TWZ6vXZ14P1VbKTJg7S9gGLn6cy/w+DvdAg5x4KuNPyIQJq2kT0mPNr
	 tt+dz+MtG9y3g==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 09:46:08 +0200
Subject: [PATCH v3 09/10] regulator: ab8500: Preserve OTP-enabled buck
 regulators
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ux500-dts-snowball-regulator-v3-9-7f92a365628e@kernel.org>
References: <20260914-ux500-dts-snowball-regulator-v3-0-7f92a365628e@kernel.org>
In-Reply-To: <20260914-ux500-dts-snowball-regulator-v3-0-7f92a365628e@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Axel Lin <axel.lin@ingics.com>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

The SMPS enable fields are initialized from OTP and may leave a rail
enabled for discrete consumers which cannot be described in the device
tree. Such a rail currently looks unused to the regulator core and is
disabled when constraints are completed.

Read the enable field while registering each switchable buck
regulator. If it is nonzero, mark the regulator boot-on and always-on
dynamically so the unused-regulator sweep leaves it alone. Keep the
enable operation idempotent so applying the always-on constraint
preserves an OTP-selected hardware-control or low-power mode instead of
forcing high-power mode. Synchronize the cached mode with the preserved
field so an OTP-selected low-power state is also reported correctly.

Regulators which are disabled by OTP retain normal switchable
behavior.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/regulator/ab8500.c | 76 ++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 67 insertions(+), 9 deletions(-)

diff --git a/drivers/regulator/ab8500.c b/drivers/regulator/ab8500.c
index 130febf2680a..57ef3d4610e6 100644
--- a/drivers/regulator/ab8500.c
+++ b/drivers/regulator/ab8500.c
@@ -422,11 +422,10 @@ static int ab8500_regulator_disable(struct regulator_dev *rdev)
 	return ret;
 }
 
-static int ab8500_regulator_is_enabled(struct regulator_dev *rdev)
+static int ab8500_regulator_get_enable_value(struct regulator_dev *rdev)
 {
 	int ret;
 	struct ab8500_regulator_info *info = rdev_get_drvdata(rdev);
-	u8 enable_mask;
 	u8 regval;
 
 	if (info == NULL) {
@@ -442,18 +441,71 @@ static int ab8500_regulator_is_enabled(struct regulator_dev *rdev)
 		return ret;
 	}
 
-	enable_mask = info->enable_mask ? info->enable_mask : info->update_mask;
-
 	dev_vdbg(rdev_get_dev(rdev),
 		"%s-is_enabled (bank, reg, mask, value): 0x%x, 0x%x, 0x%x,"
 		" 0x%x\n",
 		info->desc.name, info->update_bank, info->update_reg,
-		enable_mask, regval);
+		info->update_mask, regval);
+
+	return regval & info->update_mask;
+}
+
+static int ab8500_regulator_is_enabled(struct regulator_dev *rdev)
+{
+	struct ab8500_regulator_info *info = rdev_get_drvdata(rdev);
+	u8 enable_mask;
+	int ret;
+
+	ret = ab8500_regulator_get_enable_value(rdev);
+	if (ret < 0)
+		return ret;
+
+	enable_mask = info->enable_mask ? info->enable_mask : info->update_mask;
+
+	return !!(ret & enable_mask);
+}
 
-	if (regval & enable_mask)
-		return 1;
+static int ab8500_buck_enable(struct regulator_dev *rdev)
+{
+	int ret;
+
+	/* Keep an OTP-selected hardware or low-power mode intact. */
+	ret = ab8500_regulator_is_enabled(rdev);
+	if (ret)
+		return ret < 0 ? ret : 0;
+
+	return ab8500_regulator_enable(rdev);
+}
+
+static int ab8500_buck_init(struct regulator_dev *rdev,
+			    struct regulator_config *config)
+{
+	struct ab8500_regulator_info *info = config->driver_data;
+	int ret;
+
+	ret = ab8500_regulator_get_enable_value(rdev);
+	if (ret <= 0)
+		return ret;
+
+	/* Report forced LP accurately; HP and hardware control are normal mode. */
+	if (ret == info->update_val_idle)
+		info->update_val = info->update_val_idle;
 	else
-		return 0;
+		info->update_val = info->update_val_normal;
+
+	/*
+	 * The SMPS enable state is selected by OTP.  An enabled rail may
+	 * supply discrete board components which are not represented as
+	 * regulator consumers, so keep it out of the unused-regulator sweep.
+	 */
+	rdev->constraints->boot_on = true;
+	rdev->constraints->always_on = true;
+	rdev->constraints->valid_ops_mask &= ~REGULATOR_CHANGE_STATUS;
+
+	dev_dbg(config->dev, "%s: preserving OTP-enabled state\n",
+		info->desc.name);
+
+	return 0;
 }
 
 static unsigned int ab8500_regulator_get_optimum_mode(
@@ -861,7 +913,7 @@ static const struct regulator_ops ab8500_regulator_linear_range_volt_ops = {
 };
 
 static const struct regulator_ops ab8500_buck_ops = {
-	.enable			= ab8500_regulator_enable,
+	.enable			= ab8500_buck_enable,
 	.disable		= ab8500_regulator_disable,
 	.is_enabled		= ab8500_regulator_is_enabled,
 	.get_optimum_mode	= ab8500_regulator_get_optimum_mode,
@@ -1127,6 +1179,7 @@ static struct ab8500_regulator_info
 		.desc = {
 			.name		= "BUCK-SMPS1",
 			.ops		= &ab8500_buck_ops,
+			.init_cb	= ab8500_buck_init,
 			.type		= REGULATOR_VOLTAGE,
 			.id		= AB8500_BUCK_SMPS1,
 			.owner		= THIS_MODULE,
@@ -1152,6 +1205,7 @@ static struct ab8500_regulator_info
 		.desc = {
 			.name		= "BUCK-SMPS2",
 			.ops		= &ab8500_buck_ops,
+			.init_cb	= ab8500_buck_init,
 			.type		= REGULATOR_VOLTAGE,
 			.id		= AB8500_BUCK_SMPS2,
 			.owner		= THIS_MODULE,
@@ -1177,6 +1231,7 @@ static struct ab8500_regulator_info
 		.desc = {
 			.name		= "BUCK-SMPS3",
 			.ops		= &ab8500_buck_ops,
+			.init_cb	= ab8500_buck_init,
 			.type		= REGULATOR_VOLTAGE,
 			.id		= AB8500_BUCK_SMPS3,
 			.owner		= THIS_MODULE,
@@ -1556,6 +1611,7 @@ static struct ab8500_regulator_info
 		.desc = {
 			.name		= "BUCK-SMPSA",
 			.ops		= &ab8500_buck_ops,
+			.init_cb	= ab8500_buck_init,
 			.type		= REGULATOR_VOLTAGE,
 			.id		= AB8505_BUCK_SMPSA,
 			.owner		= THIS_MODULE,
@@ -1581,6 +1637,7 @@ static struct ab8500_regulator_info
 		.desc = {
 			.name		= "BUCK-SMPSB",
 			.ops		= &ab8500_buck_ops,
+			.init_cb	= ab8500_buck_init,
 			.type		= REGULATOR_VOLTAGE,
 			.id		= AB8505_BUCK_SMPSB,
 			.owner		= THIS_MODULE,
@@ -1606,6 +1663,7 @@ static struct ab8500_regulator_info
 		.desc = {
 			.name		= "BUCK-SAFE",
 			.ops		= &ab8500_buck_ops,
+			.init_cb	= ab8500_buck_init,
 			.type		= REGULATOR_VOLTAGE,
 			.id		= AB8505_BUCK_SAFE,
 			.owner		= THIS_MODULE,

-- 
2.55.0

