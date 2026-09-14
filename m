Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFC73F4859
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371976; cv=none; b=ioj3+sGPahvRPw+53P/tKw2Gw7bHDREaOWfiJMevQiOpqFzfw9j2r+2CP+WLFfwAUj/0+l8pTHmGKYUJ0zHrG1ePBkI76WKjAv3ZNT6P3yzWlpCpfhyTCsTtmE2aemmUxJe94Cfidk7FBBsUctZiovEbF+Ub7sW6Lj0SPaVq1Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371976; c=relaxed/simple;
	bh=o2g5BJsdLmgKohvdPEwdQASKwo6XZOlBHx9JkteNmOM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JVSV6WnsjXwaoZ7N7PJDpuYFb8AQxMNkjAGtSN4AKYNzrixhJdShj1CURS2SB/9a3qVRtNUCSNYxntgyn68y1R80jcN51pWR6H5F39MJRF2A1u16HNuYuI0Z0kyq3UyaymVHNfvP+o71yYfYtfh7IF2Jn6Zr3l8W69MSwFyhrL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XVu+S3zH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XVu+S3zH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88B241F00898;
	Mon, 14 Sep 2026 07:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789371974;
	bh=XgsPq9RhCd3/kciawcNEGIUOwsxaXN47MCNNBD2JLps=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XVu+S3zH69dhsk5mEq0h7vPyasVe6Fx0QcGOnJYFvtB3ng0W28ZV/iaNE+onKEafd
	 m+TvZ92bDhojXe69or3SIuXOtTMrrJIkqNaIqwZYEZ4sdtqeVAbb2K53AdFNRARmah
	 Z3eYvyM2Q9wr5q9+wsYqHNVTdgXhBQ0a7vOjokMImKfbYFLfmXqetqlOd8FNNzyJeO
	 8QnFs0OUUcMuyv+wGwkR+3HepGwQFbjDqHj7uDY/xdEG0H2NT+U1+adhfSS4XtcrBq
	 gLIAS2btcH4BRFgRtNtqAKlLWAfqs7fBJ8vTDh3Ia16DbEdlwDU4oTcdsItzmechly
	 S0lqwfcqMJ9AA==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 09:46:06 +0200
Subject: [PATCH v3 07/10] regulator: ab8500: Use linear ranges for LDO
 voltages
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ux500-dts-snowball-regulator-v3-7-7f92a365628e@kernel.org>
References: <20260914-ux500-dts-snowball-regulator-v3-0-7f92a365628e@kernel.org>
In-Reply-To: <20260914-ux500-dts-snowball-regulator-v3-0-7f92a365628e@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Axel Lin <axel.lin@ingics.com>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

VINTCORE uses consecutive selectors with uniform 25 mV steps, with
AB8505 duplicating the highest voltage at selector 7. AB8505 VAUDIO
likewise has uniform 100 mV steps followed by a duplicate selector for
its highest voltage.

Describe these selector encodings with linear ranges and the matching
regulator helpers instead of enumerated voltage tables. Keep tables for
the irregular and non-monotonic VAUX and VANA selectors.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/regulator/ab8500.c | 74 +++++++++++++++++++++++-----------------------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/drivers/regulator/ab8500.c b/drivers/regulator/ab8500.c
index e4c3502c8dbc..d1540099104c 100644
--- a/drivers/regulator/ab8500.c
+++ b/drivers/regulator/ab8500.c
@@ -258,25 +258,13 @@ static const unsigned int ldo_vaux56_voltages[] = {
 	2790000,
 };
 
-static const unsigned int ldo_vintcore_voltages[] = {
-	1200000,
-	1225000,
-	1250000,
-	1275000,
-	1300000,
-	1325000,
-	1350000,
+static const struct linear_range ldo_vintcore_ranges[] = {
+	REGULATOR_LINEAR_RANGE(1200000, 0, 6, 25000),
 };
 
-static const unsigned int ldo_vintcore_ab8505_voltages[] = {
-	1200000,
-	1225000,
-	1250000,
-	1275000,
-	1300000,
-	1325000,
-	1350000,
-	1350000,
+static const struct linear_range ldo_vintcore_ab8505_ranges[] = {
+	REGULATOR_LINEAR_RANGE(1200000, 0, 6, 25000),
+	REGULATOR_LINEAR_RANGE(1350000, 7, 7, 0),
 };
 
 static const unsigned int fixed_1200000_voltage[] = {
@@ -306,15 +294,10 @@ static const unsigned int ldo_vana_voltages[] = {
 	1225000,
 };
 
-static const unsigned int ldo_vaudio_voltages[] = {
-	2000000,
-	2100000,
-	2200000,
-	2300000,
-	2400000,
-	2500000,
-	2600000,
-	2600000,	/* Duplicated in Vaudio and IsoUicc Control register. */
+static const struct linear_range ldo_vaudio_ranges[] = {
+	REGULATOR_LINEAR_RANGE(2000000, 0, 6, 100000),
+	/* Duplicated in Vaudio and IsoUicc Control register. */
+	REGULATOR_LINEAR_RANGE(2600000, 7, 7, 0),
 };
 
 static DEFINE_MUTEX(shared_mode_mutex);
@@ -720,13 +703,27 @@ static const struct regulator_ops ab8500_regulator_volt_mode_expand_ops = {
 	.list_voltage		= regulator_list_voltage_table,
 };
 
-static const struct regulator_ops ab8500_regulator_volt_ops = {
+static const struct regulator_ops ab8500_regulator_linear_range_volt_mode_ops = {
+	.enable			= ab8500_regulator_enable,
+	.disable		= ab8500_regulator_disable,
+	.is_enabled		= ab8500_regulator_is_enabled,
+	.get_optimum_mode	= ab8500_regulator_get_optimum_mode,
+	.set_mode		= ab8500_regulator_set_mode,
+	.get_mode		= ab8500_regulator_get_mode,
+	.get_voltage_sel	= ab8500_regulator_get_voltage_sel,
+	.set_voltage_sel	= ab8500_regulator_set_voltage_sel,
+	.list_voltage		= regulator_list_voltage_linear_range,
+	.map_voltage		= regulator_map_voltage_linear_range,
+};
+
+static const struct regulator_ops ab8500_regulator_linear_range_volt_ops = {
 	.enable		= ab8500_regulator_enable,
 	.disable	= ab8500_regulator_disable,
 	.is_enabled	= ab8500_regulator_is_enabled,
 	.get_voltage_sel = ab8500_regulator_get_voltage_sel,
 	.set_voltage_sel = ab8500_regulator_set_voltage_sel,
-	.list_voltage	= regulator_list_voltage_table,
+	.list_voltage	= regulator_list_voltage_linear_range,
+	.map_voltage	= regulator_map_voltage_linear_range,
 };
 
 static const struct regulator_ops ab8500_regulator_mode_ops = {
@@ -836,12 +833,13 @@ static struct ab8500_regulator_info
 	[AB8500_LDO_INTCORE] = {
 		.desc = {
 			.name		= "LDO-INTCORE",
-			.ops		= &ab8500_regulator_volt_mode_ops,
+			.ops		= &ab8500_regulator_linear_range_volt_mode_ops,
 			.type		= REGULATOR_VOLTAGE,
 			.id		= AB8500_LDO_INTCORE,
 			.owner		= THIS_MODULE,
-			.n_voltages	= ARRAY_SIZE(ldo_vintcore_voltages),
-			.volt_table	= ldo_vintcore_voltages,
+			.n_voltages	= 7,
+			.linear_ranges	= ldo_vintcore_ranges,
+			.n_linear_ranges = ARRAY_SIZE(ldo_vintcore_ranges),
 			.enable_time	= 750,
 		},
 		.load_lp_uA		= 5000,
@@ -1121,12 +1119,13 @@ static struct ab8500_regulator_info
 	[AB8505_LDO_INTCORE] = {
 		.desc = {
 			.name		= "LDO-INTCORE",
-			.ops		= &ab8500_regulator_volt_mode_ops,
+			.ops		= &ab8500_regulator_linear_range_volt_mode_ops,
 			.type		= REGULATOR_VOLTAGE,
 			.id		= AB8505_LDO_INTCORE,
 			.owner		= THIS_MODULE,
-			.n_voltages	= ARRAY_SIZE(ldo_vintcore_ab8505_voltages),
-			.volt_table	= ldo_vintcore_ab8505_voltages,
+			.n_voltages	= 8,
+			.linear_ranges	= ldo_vintcore_ab8505_ranges,
+			.n_linear_ranges = ARRAY_SIZE(ldo_vintcore_ab8505_ranges),
 		},
 		.load_lp_uA		= 5000,
 		.update_bank		= 0x03,
@@ -1169,12 +1168,13 @@ static struct ab8500_regulator_info
 	[AB8505_LDO_AUDIO] = {
 		.desc = {
 			.name		= "LDO-AUDIO",
-			.ops		= &ab8500_regulator_volt_ops,
+			.ops		= &ab8500_regulator_linear_range_volt_ops,
 			.type		= REGULATOR_VOLTAGE,
 			.id		= AB8505_LDO_AUDIO,
 			.owner		= THIS_MODULE,
-			.n_voltages	= ARRAY_SIZE(ldo_vaudio_voltages),
-			.volt_table	= ldo_vaudio_voltages,
+			.n_voltages	= 8,
+			.linear_ranges	= ldo_vaudio_ranges,
+			.n_linear_ranges = ARRAY_SIZE(ldo_vaudio_ranges),
 		},
 		.update_bank		= 0x03,
 		.update_reg		= 0x83,

-- 
2.55.0

