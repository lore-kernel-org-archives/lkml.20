Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D149F4A2608
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420284; cv=none; b=ZWxpNyhjRdNZ78tcTsvR6BK0TjAnWl5DQJ0Q3aKtLES7bho9IM+B1G04adL9OfTtlkIYpeSrjRH0ESGtIqWnhrjcXHou4ihjplsBsOQB8im9ySboPXUDNLkfakgm69eAx9T3EiJdVJomyPm8vAhiOhzmMEN0a0dngBqK3OHYMkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420284; c=relaxed/simple;
	bh=cB+fFscuIXMfLe/OVF0fbusXR/2htOwHCywwC00gyro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mALPRPB+Dtm0mF1GJtuTeah8tKoIqr2sYxek1sXSq+odb3YRpwjvxn8vlJraqARnOwiL9LXYeL6FHFmskGrnSrYAgwMWm6zeY9yCN3cwZjWxhU5rqApG/qr1my872axsGKxIXIgxHaPj31zM6Rd4YlhabU48u7GOrmVY3SyE7uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gHcXAgeV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gHcXAgeV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51DAF1F00893;
	Mon, 14 Sep 2026 21:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789420283;
	bh=uadjvHfGlhBu4sVq6tllQ+UPTpmDztODzyfXrEERPV8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gHcXAgeVw3h+m0UQmNIJLn4CO7SCrIcLyL+RS6TFya1C6mxRK8iHIupCxzru7P/dm
	 bA1vR0SyfFcQoaxws/8zgZapcxcdQ/huxM4BFYAI66bmLy8arZqeER1sUQ5BzCOz1M
	 WwwfOsgcwsVWelNor0eB45VPR+3Dii2s6EM+G7HFI01mWSnvt1bsJB2vZCk02/51lE
	 b0C1R0EVuPQ231xy3xSTS60yBehY7rU4T19rdmhkUpJCtiSYH021NRLQpcRbKQBKo5
	 Pd1N+F4cFcIbypzUNeKa42NQnUsEXoHOEUnRYX3QWwVbAvC+5iJ91dpdyFie1zx5Jk
	 5PSLoCDF/yOkw==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 23:11:16 +0200
Subject: [PATCH v4 03/10] regulator: ab8500: Handle AB8505 VINTCORE
 selector 7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ux500-dts-snowball-regulator-v4-3-dfc453a3031f@kernel.org>
References: <20260914-ux500-dts-snowball-regulator-v4-0-dfc453a3031f@kernel.org>
In-Reply-To: <20260914-ux500-dts-snowball-regulator-v4-0-dfc453a3031f@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Axel Lin <axel.lin@ingics.com>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

The AB8505 VINTCORE table exposes only selectors 0 through 6. The
hardware also accepts selector 7 and maps it to 1.35 V, just like
selector 6. Omitting it can make an OTP-programmed selector 7 appear
invalid to the regulator core.

Give AB8505 its own eight-entry selector table while leaving the
AB8500 table unchanged.

Reference: AB8505 User Manual, DM00046744 Rev 3, p. 223

Fixes: 547f384f33db ("regulator: ab8500: add support for ab8505")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/regulator/ab8500.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/ab8500.c b/drivers/regulator/ab8500.c
index 07d96f8ff944..5e24e6cdc773 100644
--- a/drivers/regulator/ab8500.c
+++ b/drivers/regulator/ab8500.c
@@ -266,6 +266,17 @@ static const unsigned int ldo_vintcore_voltages[] = {
 	1350000,
 };
 
+static const unsigned int ldo_vintcore_ab8505_voltages[] = {
+	1200000,
+	1225000,
+	1250000,
+	1275000,
+	1300000,
+	1325000,
+	1350000,
+	1350000,
+};
+
 static const unsigned int fixed_1200000_voltage[] = {
 	1200000,
 };
@@ -1095,8 +1106,8 @@ static struct ab8500_regulator_info
 			.type		= REGULATOR_VOLTAGE,
 			.id		= AB8505_LDO_INTCORE,
 			.owner		= THIS_MODULE,
-			.n_voltages	= ARRAY_SIZE(ldo_vintcore_voltages),
-			.volt_table	= ldo_vintcore_voltages,
+			.n_voltages	= ARRAY_SIZE(ldo_vintcore_ab8505_voltages),
+			.volt_table	= ldo_vintcore_ab8505_voltages,
 		},
 		.load_lp_uA		= 5000,
 		.update_bank		= 0x03,

-- 
2.55.0

