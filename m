Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F09379C38;
	Tue,  1 Sep 2026 04:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788238278; cv=none; b=R7fpzCR2V9VWXH6UolMR+D+lequMX9BZQJygY7kHM2CAgwfQz40QiAh2skPCfqGYm2gIsPFlVdYIwfAtqqtcnUDototDzx6ZGr0J2v8wTAz06CMM+sLu+2YWJVqPgwNZf1Sug1GkHg9Z9FUbMttg+f0LBNMIgkrEX6Wwmr+/wLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788238278; c=relaxed/simple;
	bh=YcaBQSV/0wTf/xEOyIRGPZrE8rl4U6BAM7cQ98JBFP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YxL3GcimJ2HfQ1SfDxd+VjBuJgguLBivbjnTttJcdM/Zw9iaze6Cz1lQ+FX1yOoOrqi+OCNbUGM0CW42DGlsGlw/jlV8GBQ2F2RePlVpd1kcK5VF9bNmHFO0MpQ5GPjUv4aiViXP5iJJwkZudh/14qgeBbc3zJdFJQuOB/2XMrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PVzVf3PD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PVzVf3PD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD9C91F00A3D;
	Tue,  1 Sep 2026 04:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788238277;
	bh=Ycfzk9fJ1cHKHsRgtgeKxNASyvzEVZPZabxJCmWkfkc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PVzVf3PDDCHbOAWe96xAJiBYy2Uy2O2H06KdYf1WQAUF4M3ZEAOxkls9p3lMgEngR
	 9rSKU2lWnJefLvy2Pe0GDDfpjSrn89kEgcqLdhB2YiDII4r0JNTTAIGnRM6Cz/ETWF
	 ckfn3GYrbVWxpZouvfFvo4sYWKjMxeY0sCH63VgI68xAQGuo8bOwR0UX4QPnimjid3
	 pIzNge5yuxTUPHNFt5pEq7sbNl1fpu0KKoNDuLz85k/YHOqOuBS38rSGqESMP1H2OZ
	 oGazcICnaHIw5Cskv2jX7fhB6azK+fpXmTqszONIUj30fZzV6B4tWYMzLOn6pY0Ty+
	 EKFtTf3Gjc9cg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Saravanan Sekar <sravanhome@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/3] regulator: mp886x: add MP8864 support
Date: Tue,  1 Sep 2026 12:31:23 +0800
Message-ID: <20260901043123.5401-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260901043123.5401-1-jszhang@kernel.org>
References: <20260901043123.5401-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MP8864 is a 4 A, 21 V synchronous step-down converter.  Its
register layout and voltage transition handling are compatible with the
MP8867, but its selectable switching frequencies are 600 kHz, 850 kHz,
1.1 MHz and 1.6 MHz.

Add the compatible and chip-specific switching-frequency table.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Assisted-by: Codex:gpt-5
---
 drivers/regulator/Kconfig  |  2 +-
 drivers/regulator/mp886x.c | 21 ++++++++++++++++++++-
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 89789ac7a786..c8940e2c7e04 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -864,7 +864,7 @@ config REGULATOR_MP8859
 	  module. The module will be named "mp8859".
 
 config REGULATOR_MP886X
-	tristate "MPS MP8869 regulator driver"
+	tristate "MPS MP8864/MP8867/MP8869 regulator driver"
 	depends on I2C && OF
 	select REGMAP_I2C
 	help
diff --git a/drivers/regulator/mp886x.c b/drivers/regulator/mp886x.c
index a10f3a20d413..14f60cdcbbd6 100644
--- a/drivers/regulator/mp886x.c
+++ b/drivers/regulator/mp886x.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 //
-// MP8867/MP8869 regulator driver
+// MP8864/MP8867/MP8869 regulator driver
 //
 // Copyright (C) 2020 Synaptics Incorporated
 //
@@ -229,6 +229,23 @@ static const struct regulator_ops mp8867_regulator_ops = {
 	.set_ramp_delay = regulator_set_ramp_delay_regmap,
 };
 
+static const struct mp886x_cfg_info mp8864_ci = {
+	.rops = &mp8867_regulator_ops,
+	.slew_rates = {
+		64000,
+		32000,
+		16000,
+		8000,
+		4000,
+		2000,
+		1000,
+		500,
+	},
+	.switch_freq = { 600000, 850000, 1100000, 1600000 },
+	.fs_reg = MP886X_SYSCNTLREG1,
+	.fs_shift = 1,
+};
+
 static const struct mp886x_cfg_info mp8867_ci = {
 	.rops = &mp8867_regulator_ops,
 	.slew_rates = {
@@ -341,6 +358,7 @@ static int mp886x_i2c_probe(struct i2c_client *client)
 }
 
 static const struct of_device_id mp886x_dt_ids[] = {
+	{ .compatible = "mps,mp8864", .data = &mp8864_ci },
 	{ .compatible = "mps,mp8867", .data = &mp8867_ci },
 	{ .compatible = "mps,mp8869", .data = &mp8869_ci },
 	{ }
@@ -348,6 +366,7 @@ static const struct of_device_id mp886x_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, mp886x_dt_ids);
 
 static const struct i2c_device_id mp886x_id[] = {
+	{ .name = "mp8864", .driver_data = (kernel_ulong_t)&mp8864_ci },
 	{ .name = "mp8867", .driver_data = (kernel_ulong_t)&mp8867_ci },
 	{ .name = "mp8869", .driver_data = (kernel_ulong_t)&mp8869_ci },
 	{ }
-- 
2.51.0

