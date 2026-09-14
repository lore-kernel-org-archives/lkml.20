Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400144A2A69
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420288; cv=none; b=V06IJklqccVyXHp7hef0dDEMwS4zF+51awIVFZvcJ5ySaFZF00+l+Pzd7vWS5oKcqs995nqOnhVP/YwJSDTyKHJVbhlq6NbwwxKZpZWHgBdVyR3T1LjJ+K8YKq26xjKj51GTZTiY7vYKjUQwj5ToCJntYYJX90tCMso9K4DTAJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420288; c=relaxed/simple;
	bh=sm7o6cCzp8flppDMwW5Z+rofLj0ey1Q6EInHqIwTGW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hkOwQgM+q1lXoV8Rpq2HeKCToOnX/4SaLBCbDm/cdbHcai1ivhDkn+izD5GOpEmNs3R4SHtaS20H2smL8XtJrgqH/zcoGXiExfSjRjECBHAsEec21IYA1IBroYzzdEbJyA7XFQFaKP/Ez+E0JrsPSe+9p0aQph/nM9ParTI2FAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fruSOOU5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fruSOOU5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8FE91F00893;
	Mon, 14 Sep 2026 21:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789420286;
	bh=cYxLvSFl/YWS+JRovkLaSv4pMP7UxSGmiLqc9zYTVx0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fruSOOU5y50wTvkWq9Q+iLKfDDZaZMRyyoHMwft+bUygyz2OBly5SIY9tslwOtxXw
	 iAjRLHvleImwCNRC/OIjlTHmbuPoq59dtAYhvh1AzNCpW6wHnR928s4Y5U1mywoxr0
	 wyBiorEIiRX9k++gbm25wWv2uTGSH/y8BmTk8LwLJc0Qz2NvGw32P78Z1IuKFh/3Wt
	 ma3NRwmfOMv6JxixjsLf+cZ1uqiGUi3lNT9+YgWhhSygkZZ/QcEUywhAky4RbN9je0
	 aMpaavCNApYJQoZ8C7ML5HdcoXtz602DYQL5XUiKreMLod35sjIlDRhZwVLv6qmh+T
	 mlq9GNEyMlXbg==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 23:11:18 +0200
Subject: [PATCH v4 05/10] regulator: ab8500: Test dedicated enable bits
 only
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ux500-dts-snowball-regulator-v4-5-dfc453a3031f@kernel.org>
References: <20260914-ux500-dts-snowball-regulator-v4-0-dfc453a3031f@kernel.org>
In-Reply-To: <20260914-ux500-dts-snowball-regulator-v4-0-dfc453a3031f@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Axel Lin <axel.lin@ingics.com>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

Some regulator control registers have independent enable and low-power
bits. is_enabled() currently tests their combined update mask, so an
off regulator with its low-power bit set is incorrectly reported as
enabled.

Add an optional enable mask and use it for VINTCORE, AB8500 TVOUT,
AB8505 ADC, and AB8505 VAUX5/6. Regulators whose two-bit field encodes
the complete operating state continue to test the full update mask.

References: AB8500 User Manual, UM0836 Rev 3, p. 214;
AB8505 User Manual, DM00046744 Rev 3, pp. 171-172 and 223

Fixes: 65e03ed2d0cd ("regulators: Fixed errors in ab8500 register mapping")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/regulator/ab8500.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/ab8500.c b/drivers/regulator/ab8500.c
index 42cb8dfdc7c9..05c6b9c7af0c 100644
--- a/drivers/regulator/ab8500.c
+++ b/drivers/regulator/ab8500.c
@@ -162,6 +162,7 @@ struct ab8500_shared_mode {
  * @update_bank: bank to control on/off
  * @update_reg: register to control on/off
  * @update_mask: mask to enable/disable and set mode of regulator
+ * @enable_mask: optional mask for an enable bit separate from the mode bit
  * @update_val: bits holding the regulator current mode
  * @update_val_idle: bits to enable the regulator in idle (low power) mode
  * @update_val_normal: bits to enable the regulator in normal (high power) mode
@@ -183,6 +184,7 @@ struct ab8500_regulator_info {
 	u8 update_bank;
 	u8 update_reg;
 	u8 update_mask;
+	u8 enable_mask;
 	u8 update_val;
 	u8 update_val_idle;
 	u8 update_val_normal;
@@ -377,6 +379,7 @@ static int ab8500_regulator_is_enabled(struct regulator_dev *rdev)
 {
 	int ret;
 	struct ab8500_regulator_info *info = rdev_get_drvdata(rdev);
+	u8 enable_mask;
 	u8 regval;
 
 	if (info == NULL) {
@@ -392,13 +395,15 @@ static int ab8500_regulator_is_enabled(struct regulator_dev *rdev)
 		return ret;
 	}
 
+	enable_mask = info->enable_mask ? info->enable_mask : info->update_mask;
+
 	dev_vdbg(rdev_get_dev(rdev),
 		"%s-is_enabled (bank, reg, mask, value): 0x%x, 0x%x, 0x%x,"
 		" 0x%x\n",
 		info->desc.name, info->update_bank, info->update_reg,
-		info->update_mask, regval);
+		enable_mask, regval);
 
-	if (regval & info->update_mask)
+	if (regval & enable_mask)
 		return 1;
 	else
 		return 0;
@@ -833,6 +838,7 @@ static struct ab8500_regulator_info
 		.update_bank		= 0x03,
 		.update_reg		= 0x80,
 		.update_mask		= 0x44,
+		.enable_mask		= 0x04,
 		.update_val		= 0x44,
 		.update_val_idle	= 0x44,
 		.update_val_normal	= 0x04,
@@ -861,6 +867,7 @@ static struct ab8500_regulator_info
 		.update_bank		= 0x03,
 		.update_reg		= 0x80,
 		.update_mask		= 0x82,
+		.enable_mask		= 0x02,
 		.update_val		= 0x02,
 		.update_val_idle	= 0x82,
 		.update_val_normal	= 0x02,
@@ -1070,6 +1077,7 @@ static struct ab8500_regulator_info
 		.update_bank		= 0x01,
 		.update_reg		= 0x55,
 		.update_mask		= 0x18,
+		.enable_mask		= 0x10,
 		.update_val		= 0x10,
 		.update_val_idle	= 0x18,
 		.update_val_normal	= 0x10,
@@ -1092,6 +1100,7 @@ static struct ab8500_regulator_info
 		.update_bank		= 0x01,
 		.update_reg		= 0x56,
 		.update_mask		= 0x18,
+		.enable_mask		= 0x10,
 		.update_val		= 0x10,
 		.update_val_idle	= 0x18,
 		.update_val_normal	= 0x10,
@@ -1113,6 +1122,7 @@ static struct ab8500_regulator_info
 		.update_bank		= 0x03,
 		.update_reg		= 0x80,
 		.update_mask		= 0x44,
+		.enable_mask		= 0x04,
 		.update_val		= 0x04,
 		.update_val_idle	= 0x44,
 		.update_val_normal	= 0x04,
@@ -1141,6 +1151,7 @@ static struct ab8500_regulator_info
 		.update_bank		= 0x03,
 		.update_reg		= 0x80,
 		.update_mask		= 0x82,
+		.enable_mask		= 0x02,
 		.update_val		= 0x02,
 		.update_val_idle	= 0x82,
 		.update_val_normal	= 0x02,

-- 
2.55.0

