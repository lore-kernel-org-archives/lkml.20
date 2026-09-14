Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486803E95B2
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371969; cv=none; b=r1CLwszzdBY83FVqdHnB0Nm9YykdCSrg1qJyUPlF2LeIcvsPSA7tM22wupJwKwyfOdX/ohgag8TKUYLITCPYN0fLI5I78QK7XFg6HeixPlqwVsThXq1uCmw2iw6UxbNmnvJ13+tM/U+ZWh3x9h/L/gGCKSJdmp8qlDAqXDzJEuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371969; c=relaxed/simple;
	bh=cB+fFscuIXMfLe/OVF0fbusXR/2htOwHCywwC00gyro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cHfnWZPQe3jReuGBTLmkxMl6rMNbQQbjGTQn3404YEvPK+ogEIFcohvQ5i11DcvY8w3SNzPHAyfHXcNMnZVvlW8LpaFIvrBLic8wkwAx4ChGrvLIWlSAj9V+S2R2sd86kLeE2B69MgBc17PcO0BL3QTQZQIrh1yC6WrY9FjN46o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JxoK2+fa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JxoK2+fa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D911F00893;
	Mon, 14 Sep 2026 07:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789371968;
	bh=uadjvHfGlhBu4sVq6tllQ+UPTpmDztODzyfXrEERPV8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JxoK2+fasVkUdZzSD0cNvjk/bQT5L9hxsnn8fjFsnkJxn9jrkpk+205KB/i+NnIDN
	 oz58TJ+o0QeXgVa/IIEfGs40ssveEQzJz/CkLIUfjLrqtKoZk5RRzsvwTJdf6jnCIp
	 yKQwFWzSF+QuxxrxCuKHgahi20H8nHbtQORemrry7m9dTr7/U0v3jlsMK2sVc57EDQ
	 1IYMkGd03XoJQOxCFl+mQUuG6VWKDSulZTAX0lYmvNIhziV8DmZETCnPESH2Xuc0XX
	 65yF9g1G0ZYmb+wMYa19kn7P5woWscW5BmXL97DW06l7Kr6fS3iMli5gmJGF2QMKvm
	 BHuINNRAQm+NA==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 09:46:02 +0200
Subject: [PATCH v3 03/10] regulator: ab8500: Handle AB8505 VINTCORE
 selector 7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ux500-dts-snowball-regulator-v3-3-7f92a365628e@kernel.org>
References: <20260914-ux500-dts-snowball-regulator-v3-0-7f92a365628e@kernel.org>
In-Reply-To: <20260914-ux500-dts-snowball-regulator-v3-0-7f92a365628e@kernel.org>
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

