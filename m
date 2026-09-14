Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0256F40B0E8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371981; cv=none; b=Myq4LohNxUk0QIP3+puFRYvcf/kXZU5C/WjGIMmk1UTakyT0rdPrDINzri9bXwDXQMEDyvrabTU4RMK0wOVKmqABLwL63DdW8CJ9KrN8ybSme+ZfU7g596N5QMOZ6VQWIM9rrqUwkZh+e4sZkrLMm9LNm23RRCKPM1yjpdwZkvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371981; c=relaxed/simple;
	bh=R3jxbGkgGfOX4rp8Evxp0ZbJMbQnQCwHgRqRn6sEKTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SUtQR9vBso3aaMprW2LwLjkCWu1bbxk0GuPFqtdq5plqDhAzl6krse+z0VL94+kvUDrpWe+ARjtEIS0o3kx2SMQwJqqmioHTIy/EPwgNGdG/ogEjf6W8pd2BORebIvoUvXYTqIT54RbCdtq9cachxoFgJc9p6Lzgdoh+cOECmCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QzpOKgoq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QzpOKgoq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA85A1F000FF;
	Mon, 14 Sep 2026 07:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789371979;
	bh=YmJceeDBdhPEgVm3BODfgB8lKWRTXnpjxh7sCmUtsWM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QzpOKgoqQFQVJlXp5IwKsjhNTuUmd1kOIVJsQGFjGd0i/8+AiCiGFovTWY5oyaKsW
	 OAhsQNtz5M+vmJbPbH0mrM2Mf1uQyetF++x9HDhOuY+VH7GWOlMo8PdXilm2xKUWS6
	 uPiluwxir1Ig6mUkSzdx3C1KVfrzQFvMWv/OiaPNt7cAbcq15ZFKKOcXKdW1bMN+rR
	 7ePRAzzttZLnkm2CoI4GaiphoXoiRVsRdGGmdt8KzYTYvkgVjaQoPu9QdjWY3YDRLl
	 Ls2Iigar8zcurr4c+OS8sT4Csp3nwOpcoMrnVc4dCFz7iMUUGCSk/9rKFLwdIVqq9E
	 NkikGs52K4uHA==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 09:46:09 +0200
Subject: [PATCH v3 10/10] regulator: ab8500: Use scoped guard for shared
 mode mutex
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ux500-dts-snowball-regulator-v3-10-7f92a365628e@kernel.org>
References: <20260914-ux500-dts-snowball-regulator-v3-0-7f92a365628e@kernel.org>
In-Reply-To: <20260914-ux500-dts-snowball-regulator-v3-0-7f92a365628e@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Axel Lin <axel.lin@ingics.com>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

Use a scoped mutex guard in ab8500_regulator_set_mode().

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/regulator/ab8500.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/regulator/ab8500.c b/drivers/regulator/ab8500.c
index 57ef3d4610e6..3c1962ad85d4 100644
--- a/drivers/regulator/ab8500.c
+++ b/drivers/regulator/ab8500.c
@@ -20,6 +20,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/err.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/mfd/abx500.h>
 #include <linux/mfd/abx500/ab8500.h>
@@ -542,6 +543,8 @@ static int ab8500_regulator_set_mode(struct regulator_dev *rdev,
 		return -EINVAL;
 	}
 
+	guard(mutex)(&shared_mode_mutex);
+
 	if (info->mode_mask) {
 		bank = info->mode_bank;
 		reg = info->mode_reg;
@@ -552,9 +555,6 @@ static int ab8500_regulator_set_mode(struct regulator_dev *rdev,
 		mask = info->update_mask;
 	}
 
-	if (info->shared_mode)
-		mutex_lock(&shared_mode_mutex);
-
 	switch (mode) {
 	case REGULATOR_MODE_NORMAL:
 		if (info->shared_mode)
@@ -573,7 +573,7 @@ static int ab8500_regulator_set_mode(struct regulator_dev *rdev,
 			if (!shared_regulator->shared_mode->lp_mode_req) {
 				/* Other regulator prevent LP mode */
 				info->shared_mode->lp_mode_req = true;
-				goto out_unlock;
+				return 0;
 			}
 
 			lp_mode_req = true;
@@ -585,18 +585,15 @@ static int ab8500_regulator_set_mode(struct regulator_dev *rdev,
 			val = info->update_val_idle;
 		break;
 	default:
-		ret = -EINVAL;
-		goto out_unlock;
+		return -EINVAL;
 	}
 
 	if (info->mode_mask) {
 		enabled = 1;
 	} else {
 		enabled = ab8500_regulator_is_enabled(rdev);
-		if (enabled < 0) {
-			ret = enabled;
-			goto out_unlock;
-		}
+		if (enabled < 0)
+			return enabled;
 	}
 
 	if (enabled) {
@@ -605,7 +602,7 @@ static int ab8500_regulator_set_mode(struct regulator_dev *rdev,
 		if (ret < 0) {
 			dev_err(rdev_get_dev(rdev),
 				"couldn't set regulator mode\n");
-			goto out_unlock;
+			return ret;
 		}
 
 		dev_vdbg(rdev_get_dev(rdev),
@@ -621,10 +618,6 @@ static int ab8500_regulator_set_mode(struct regulator_dev *rdev,
 	if (info->shared_mode)
 		info->shared_mode->lp_mode_req = lp_mode_req;
 
-out_unlock:
-	if (info->shared_mode)
-		mutex_unlock(&shared_mode_mutex);
-
 	return ret;
 }
 

-- 
2.55.0

