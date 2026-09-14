Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BD54A2E2E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420290; cv=none; b=GONmF8jamvVGluwoIqoMMgphl5v44mQFD6SQtIV/9rJy/6n0TAk44MaDztLugwWQWMCqGgi0Kz4jSZjPcqKVSCoMLw+X/3o7KHrZ6scQZW+OtzFTxDz+uP1ozlkiNtTxkTuJh1MDbBMdxQMcm2AjD5TMJn1O2l1gVXpy49bSci8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420290; c=relaxed/simple;
	bh=Dv/QiirNXaEGGNxNMEdOvs71nxTnxu7bZFGiiKUplfk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FskymA917JOEUA0Df1gytdQWlHJjBoe69YUy7jw00TTdhBpJva/9nalvd/k8qY1en23NJ7WDy0pPDkS4IWB+Lwf7upSnGvHrpvzR5mWb08B+s1pz6euUkTTh094/eRUPsh4YB7XIeMpLc6GSGMZNMTrNc/67mUTYvBHGSl8suEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IG7Yg2Xz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IG7Yg2Xz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA9D1F00898;
	Mon, 14 Sep 2026 21:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789420288;
	bh=bMZt0GB7fomwJcSjpqK2GXhF/LZOwUajUGEkniPFZLE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=IG7Yg2XzjKo3y/u+JLvX2KMK87d9mct2h9R0zOEdI97TvUliD4MupSWyYGowgDOJW
	 i5mlKKNC1lf+WA9t4xSJa53DotPGmXND99PvL+JvQsyI44eFAET24hSxdQDAYI/lgK
	 FgPq5fOS4ZJ9b3ASdEeBAj2xJzsWY4gGugYuy8AXHeL4qqVMsa36fJdS/UKZa0ZdVm
	 b0G0+NRq8CUIWpM3qr5nlbxitWpv6izryZTNm2E0+5zN4uVc50IqyFTVC/48M3P3fC
	 LafBHQhoJfZNgtu+SOVpyrG0uKzrNNskbJD3o6yycBPDB3xA9yvdAkiA7DCvGdj9nm
	 l4eHgMYPEaS1A==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 23:11:19 +0200
Subject: [PATCH v4 06/10] regulator: ab8500: Propagate mode enable read
 errors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ux500-dts-snowball-regulator-v4-6-dfc453a3031f@kernel.org>
References: <20260914-ux500-dts-snowball-regulator-v4-0-dfc453a3031f@kernel.org>
In-Reply-To: <20260914-ux500-dts-snowball-regulator-v4-0-dfc453a3031f@kernel.org>
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

