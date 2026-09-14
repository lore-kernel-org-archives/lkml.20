Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1D73E51D3
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371971; cv=none; b=Nj8shJ0tVOi9l3PVWr+M2u/O3YwxDD2Suy0yHf/RQI+m0PuIxPXLWBoWG3sdILULFYHfhTT8STS6jmVf6++S0F4PwAW5d9taYLam+QllRaFSr06g9T9UCrMDwmsm4Ezx5npnV1kXfvVVnmOyHLHTETY2OIrT5xNiZ77xszKugYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371971; c=relaxed/simple;
	bh=5L7BeYhXO/6uJ84EQV5MJCSYczZ7+SYHAwWJcZPwu9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W3EJlaGaHoBRShwJi1fe9h76z3uTwxG4T4aK7y23nE2bLsmH+sQfSiPT9nviHbzDHnXEKcRxyPh7SOw0o5tUbnfaAcqX7AAM60haUSMNm03BnV08REg+OpfjQRrmaeMXFwonpgxrTg627b4eQJqOTZsCvOxKIOoscG2moQTCAd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o0Uvry2R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o0Uvry2R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 928D61F000FF;
	Mon, 14 Sep 2026 07:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789371969;
	bh=W7I499jooT1wgVBKh3MKxZ2T8LqsKbR+3xzF5b+GSow=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=o0Uvry2R/cF8chYJ3SCd5f0d0RMSOxkaZ1wWUGPqZ6hzmpX7x2WH90eof50OawtK6
	 xqEJjznor17hEFf6oIaGwoqIG+zAa+qbIj4JIlL8VoyvwEiyvplGgUwyvcLeCM4vWU
	 CDxji9iF9DKheYlabfMQ8MQ8O39hjbJIzzXVe9X63JIWCHcWIk4aYIezV+gosjMIQi
	 he+Ik+9kijSJSucyd2GPNV9Ugra2os1H/of6KndMq5hdSJnQB3759CznmNsKaif8yr
	 R3vBCapOxpCnzehSZD9bj3pVCrBFQKb00EVqElqaigVdOqjMsVxOfWHJdTaKmY7ogu
	 dRPHKqixf5kfQ==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 09:46:03 +0200
Subject: [PATCH v3 04/10] regulator: ab8500: Treat cut 1.0 VAUX3 as fixed
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ux500-dts-snowball-regulator-v3-4-7f92a365628e@kernel.org>
References: <20260914-ux500-dts-snowball-regulator-v3-0-7f92a365628e@kernel.org>
In-Reply-To: <20260914-ux500-dts-snowball-regulator-v3-0-7f92a365628e@kernel.org>
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

