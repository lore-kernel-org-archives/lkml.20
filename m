Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A473F4DD6
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371974; cv=none; b=czc+HFja0RHlPTU20SBwh6rc4AWF1lvsjpRPjpjevXlfWPLNF2H0dBQDVN6qjxi3oENqqIaukNZMPOXR69aJ6CarLJIGo/r/Yp1TpkugWfrUdpXn7PkB1MxftN04bgsgxEf8T9wVoEh7Se8hlqthdAIZS44lz5yOASM+TDLSKCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371974; c=relaxed/simple;
	bh=Dv/QiirNXaEGGNxNMEdOvs71nxTnxu7bZFGiiKUplfk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vCQgIDK5TQx/QziaKAaSXcRdu/rquibrOmaEdBho3/dE82W25IRuBUwOfZ2orjF8JFcIhpCWwa+MYgwgISV+98UOAD9s7sNjiMR2wWRd9lYzX4mx3zG3UCF0aSLoIRYnl2602elF9fzPuu3ufCXDQhfszd/WGVLAk3lPFanaxrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dcfy7cpD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dcfy7cpD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD7451F000FF;
	Mon, 14 Sep 2026 07:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789371973;
	bh=bMZt0GB7fomwJcSjpqK2GXhF/LZOwUajUGEkniPFZLE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dcfy7cpDgeCDXHHMQu/QiW2ZZgaAR4e29sYuHgFrVBADiD4uaz/2fAngVJiq2Y3qi
	 rQB+CGdWKTlRXoZxcbq6DLvrs+DI4I7zJZ5+t4GBCphmlHhtrSvMJz3CGD7LIvNkXw
	 AvtO9Ab6KVL6lbBpcLaqkwp1MFBGyIBc+0yQnWEOzZIcr6xH8jg6XGmEv6GJJwNdEh
	 FIfgKha1Dz6m9kW0MYgL0G4fSbRV3aTJX0xJQw7EMjwPe+fXQaPEL1Og8FGGtvNOgb
	 RzpSUDNR3p6YGijbgvP8X+H2bV0dOCFIm30g7t7xTmkW1wxzabV58RsxV3ZGmfSTUE
	 6VXy/xr4GpCdw==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 09:46:05 +0200
Subject: [PATCH v3 06/10] regulator: ab8500: Propagate mode enable read
 errors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ux500-dts-snowball-regulator-v3-6-7f92a365628e@kernel.org>
References: <20260914-ux500-dts-snowball-regulator-v3-0-7f92a365628e@kernel.org>
In-Reply-To: <20260914-ux500-dts-snowball-regulator-v3-0-7f92a365628e@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Axel Lin <axel.lin@ingics.com>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

For regulators whose enable and mode share a state field, set_mode()
first reads that field so changing the requested mode does not enable a
disabled rail. A register read error is currently treated as true and
the driver proceeds to write the new mode, potentially enabling a rail
whose state is unknown.

Return the read error without changing the register or cached mode.

References: AB8500 User Manual, UM0836 Rev 3, p. 227;
AB8505 User Manual, DM00046744 Rev 3, p. 237

Fixes: 438e695b87e0 ("regulator: ab8500: Get rid of is_enabled from struct ab8500_regulator_info")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/regulator/ab8500.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/ab8500.c b/drivers/regulator/ab8500.c
index 05c6b9c7af0c..e4c3502c8dbc 100644
--- a/drivers/regulator/ab8500.c
+++ b/drivers/regulator/ab8500.c
@@ -433,7 +433,7 @@ static unsigned int ab8500_regulator_get_optimum_mode(
 static int ab8500_regulator_set_mode(struct regulator_dev *rdev,
 				     unsigned int mode)
 {
-	int ret = 0;
+	int enabled, ret = 0;
 	u8 bank, reg, mask, val;
 	bool lp_mode_req = false;
 	struct ab8500_regulator_info *info = rdev_get_drvdata(rdev);
@@ -490,7 +490,17 @@ static int ab8500_regulator_set_mode(struct regulator_dev *rdev,
 		goto out_unlock;
 	}
 
-	if (info->mode_mask || ab8500_regulator_is_enabled(rdev)) {
+	if (info->mode_mask) {
+		enabled = 1;
+	} else {
+		enabled = ab8500_regulator_is_enabled(rdev);
+		if (enabled < 0) {
+			ret = enabled;
+			goto out_unlock;
+		}
+	}
+
+	if (enabled) {
 		ret = abx500_mask_and_set_register_interruptible(info->dev,
 			bank, reg, mask, val);
 		if (ret < 0) {

-- 
2.55.0

