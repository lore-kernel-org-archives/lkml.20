Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCE14A2636
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420287; cv=none; b=GXinYl9WgIRareiw8zwGeKSl0eAgxK/fiTFAOdEdlsycowsLczpOyqg99r8jDLA8CQ0zJijmq75a4LlXVuQRr1QUcrweRyAyjXSaoCpDEyO70MGREU8JRp4f5DrDe/riJM+VynpWQrmBiVnLh5iblFOFcg9XPEVLDOfd5hIsvVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420287; c=relaxed/simple;
	bh=5L7BeYhXO/6uJ84EQV5MJCSYczZ7+SYHAwWJcZPwu9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YcgziFnxzUHpX7uo2Te+SCU6hVe4PkvFqXIb+qTcIEb0S0v9vUUlrY0swqHoexssBQ13Ms0NnWL+7U45z6FLKOvlZl3JRa4KQJVgsNRaOYTTPGYujZyP0sunWZs8Odiql1CXLfmpXmzzCLTQhGDXP2cBko+CIWV3C7nPJI8AkE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lrSb/4BS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lrSb/4BS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02F301F000FF;
	Mon, 14 Sep 2026 21:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789420285;
	bh=W7I499jooT1wgVBKh3MKxZ2T8LqsKbR+3xzF5b+GSow=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lrSb/4BSoZ4dNUp3utygWXXefgXhY3fNnf2E20hmriN9cQ/C1do4RF8JxkP7UpfUG
	 ES9iDzSXnllNr0dcn8+LZnLT7iFMA+D4hz66kyzLux4InLjqfTKoMbOmdfAwo7SULr
	 5BMzthv5EKZafK0Cps4FcD8P7oxo0KRs1aDQtKvsfMDJQueO4cPt33M1j9On0c95uR
	 Fa5tdkZLWY5IzxmOG4ySTQO66aORzpUQsnv0eFYv8v1kULFjOx2YlHGOmN8iQeIdTf
	 ifUlV3Ktl7tHYKqO+SBR+Hhf8iHQT4ps0Bc5L4LQ5YVV2COU4KbKmo5igdnFaDnIRO
	 1L0q++O7O1heQ==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 23:11:17 +0200
Subject: [PATCH v4 04/10] regulator: ab8500: Treat cut 1.0 VAUX3 as fixed
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ux500-dts-snowball-regulator-v4-4-dfc453a3031f@kernel.org>
References: <20260914-ux500-dts-snowball-regulator-v4-0-dfc453a3031f@kernel.org>
In-Reply-To: <20260914-ux500-dts-snowball-regulator-v4-0-dfc453a3031f@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Axel Lin <axel.lin@ingics.com>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

The early-cut workaround currently gives AB8500 cut 1.0 the 16
programmable VAUX3 settings introduced with cut 1.1. On cut 1.0 the
selector is not programmable and VAUX3 is fixed at 1.2 V.

Register VAUX3 as a fixed-voltage regulator on cut 1.0 and retain the
16-value workaround only for cut 1.1.

Reference: AB8500 User Manual, UM0836 Rev 3, p. 240

Fixes: 2b75151a1041 ("regulators: Added ab8500 v2 support")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/regulator/ab8500.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/ab8500.c b/drivers/regulator/ab8500.c
index 5e24e6cdc773..42cb8dfdc7c9 100644
--- a/drivers/regulator/ab8500.c
+++ b/drivers/regulator/ab8500.c
@@ -1783,9 +1783,14 @@ static int ab8500_regulator_register(struct platform_device *pdev,
 	config.driver_data = info;
 	config.of_node = np;
 
-	/* fix for hardware before ab8500v2.0 */
-	if (is_ab8500_1p1_or_earlier(ab8500)) {
-		if (info->desc.id == AB8500_LDO_AUX3) {
+	/* Handle the different VAUX3 implementations in early AB8500 cuts. */
+	if (info->desc.id == AB8500_LDO_AUX3) {
+		if (is_ab8500_1p0_or_earlier(ab8500)) {
+			info->desc.ops = &ab8500_regulator_mode_ops;
+			info->desc.n_voltages = 1;
+			info->desc.volt_table = fixed_1200000_voltage;
+			info->voltage_mask = 0;
+		} else if (is_ab8500_1p1_or_earlier(ab8500)) {
 			info->desc.n_voltages =
 				ARRAY_SIZE(ldo_vauxn_voltages);
 			info->desc.volt_table = ldo_vauxn_voltages;

-- 
2.55.0

