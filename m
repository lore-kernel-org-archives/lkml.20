Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6044A3F0F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420295; cv=none; b=q97SGCmR2sff0U+Tc68XMbUXF7336us0C34mWDvEfCA9UO5hqqu9s5rOBiCiTjo+Lf1zsijX/3MkuGKEh9hGhyki2E6DJIMB8TB0sfJAFxt2LIEERyX6yPQ3ZckjIE8aJoT2TJebuB4qPms74bizUyQWU+3/qLwgbaApzRdvSeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420295; c=relaxed/simple;
	bh=LX0llP1A1K4iHrbaACvouwpeVCE2A7XMNxPAFptGvLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HxKkzsORezeOmYHHDZDbdu6VK5GeyeBylhHyv/+RxfPuAugWjU4QM4akYOfmdXsOF2wysbgcYTSj2Z/u51jyt9+uXU4Z8peMoCudRrwEm3S5XMc2OInBCMtx4dhWuvelUi8J6o/kbNdE0wC5y22/gvR5uI7DMGfbF9PQYYJkTWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VYw5LosG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VYw5LosG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F3061F000FF;
	Mon, 14 Sep 2026 21:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789420293;
	bh=CVvTaQDL0TSG4NiP8jhQlXn2CGJG/xY1HLs49Tsli4M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VYw5LosGAX1bcecLAUVBDsDd+ivacXg0N+hVq3X7ZuSRwll3PpAOiq3Kzwnqo4Ti1
	 g1d+nb3wdn2hGm574EhKlMCoX9R9rFWhIkUbR5ysX7SEhywC+3FbBJMmqJTYmooR2a
	 IHyVszjWvh8THdSXb871geWn/3qfBaAqbq0hB9xzdNnEp/9CH1QR8w13EVJUyHdqEf
	 4trOrlauB4K9Ko7EjMSzScJByzJkiOW4sv1rszauncEBsW4LgB/+wAHAIUoS7BETh+
	 oJ9Mg5YYRPe1qy7NOyGkAcOLGQjfSVe0hGbUjgqlp44hl1ls6OXtoHM2MJfKwDxOPy
	 hcnsPWokWOSMQ==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 23:11:22 +0200
Subject: [PATCH v4 09/10] regulator: ab8500: Report buck OTP and DT state
 mismatches
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ux500-dts-snowball-regulator-v4-9-dfc453a3031f@kernel.org>
References: <20260914-ux500-dts-snowball-regulator-v4-0-dfc453a3031f@kernel.org>
In-Reply-To: <20260914-ux500-dts-snowball-regulator-v4-0-dfc453a3031f@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Axel Lin <axel.lin@ingics.com>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

The switchable buck enable fields are initialized from OTP and may
not match the boot-on and always-on constraints in the device tree.

Read the enable field during regulator initialization, before the
core applies the constraints. Compare it with the enabled state
requested by regulator-boot-on or regulator-always-on and report any
mismatch with dev_info(), including the regulator name, hardware state
and both DT flags. Leave the constraints and normal enable handling
unchanged, and skip the comparison when no DT node is present.

This samples the OTP-initialized register rather than OTP storage;
firmware may have changed the state before Linux probes the device.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/regulator/ab8500.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/regulator/ab8500.c b/drivers/regulator/ab8500.c
index 130febf2680a..f9487395e290 100644
--- a/drivers/regulator/ab8500.c
+++ b/drivers/regulator/ab8500.c
@@ -456,6 +456,34 @@ static int ab8500_regulator_is_enabled(struct regulator_dev *rdev)
 		return 0;
 }
 
+static int ab8500_buck_init(struct regulator_dev *rdev,
+			    struct regulator_config *config)
+{
+	const struct regulation_constraints *constraints = rdev->constraints;
+	struct ab8500_regulator_info *info = config->driver_data;
+	bool enabled_in_dt = constraints->boot_on || constraints->always_on;
+	int enabled;
+
+	if (!config->of_node)
+		return 0;
+
+	/*
+	 * The enable field is initialized from OTP, but firmware may have
+	 * changed it before probe. Compare before applying DT constraints.
+	 */
+	enabled = ab8500_regulator_is_enabled(rdev);
+	if (enabled < 0)
+		return enabled;
+
+	if (enabled != enabled_in_dt)
+		dev_info(config->dev,
+			 "%s: OTP-initialized state is %s, DT boot-on=%u, always-on=%u\n",
+			 info->desc.name, enabled ? "enabled" : "disabled",
+			 constraints->boot_on, constraints->always_on);
+
+	return 0;
+}
+
 static unsigned int ab8500_regulator_get_optimum_mode(
 		struct regulator_dev *rdev, int input_uV,
 		int output_uV, int load_uA)
@@ -1127,6 +1155,7 @@ static struct ab8500_regulator_info
 		.desc = {
 			.name		= "BUCK-SMPS1",
 			.ops		= &ab8500_buck_ops,
+			.init_cb	= ab8500_buck_init,
 			.type		= REGULATOR_VOLTAGE,
 			.id		= AB8500_BUCK_SMPS1,
 			.owner		= THIS_MODULE,
@@ -1152,6 +1181,7 @@ static struct ab8500_regulator_info
 		.desc = {
 			.name		= "BUCK-SMPS2",
 			.ops		= &ab8500_buck_ops,
+			.init_cb	= ab8500_buck_init,
 			.type		= REGULATOR_VOLTAGE,
 			.id		= AB8500_BUCK_SMPS2,
 			.owner		= THIS_MODULE,
@@ -1177,6 +1207,7 @@ static struct ab8500_regulator_info
 		.desc = {
 			.name		= "BUCK-SMPS3",
 			.ops		= &ab8500_buck_ops,
+			.init_cb	= ab8500_buck_init,
 			.type		= REGULATOR_VOLTAGE,
 			.id		= AB8500_BUCK_SMPS3,
 			.owner		= THIS_MODULE,
@@ -1556,6 +1587,7 @@ static struct ab8500_regulator_info
 		.desc = {
 			.name		= "BUCK-SMPSA",
 			.ops		= &ab8500_buck_ops,
+			.init_cb	= ab8500_buck_init,
 			.type		= REGULATOR_VOLTAGE,
 			.id		= AB8505_BUCK_SMPSA,
 			.owner		= THIS_MODULE,
@@ -1581,6 +1613,7 @@ static struct ab8500_regulator_info
 		.desc = {
 			.name		= "BUCK-SMPSB",
 			.ops		= &ab8500_buck_ops,
+			.init_cb	= ab8500_buck_init,
 			.type		= REGULATOR_VOLTAGE,
 			.id		= AB8505_BUCK_SMPSB,
 			.owner		= THIS_MODULE,
@@ -1606,6 +1639,7 @@ static struct ab8500_regulator_info
 		.desc = {
 			.name		= "BUCK-SAFE",
 			.ops		= &ab8500_buck_ops,
+			.init_cb	= ab8500_buck_init,
 			.type		= REGULATOR_VOLTAGE,
 			.id		= AB8505_BUCK_SAFE,
 			.owner		= THIS_MODULE,

-- 
2.55.0

