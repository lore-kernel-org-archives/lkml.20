Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2284A3D5B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420297; cv=none; b=uffvkItJ5c0l6d65mP1vv000P/M6zRZRHcbekCaAHRMTrNUstM7pe+PPaIlPf1s6lhQ1QpKmsyBYhBJaxYmWIlrSlw89oPYY5JZPiB/o4CghhBGPQVBCcx5gpGcA2ZUu1lc9efT4XMnUDQ68U5gP2Ju8Egv2Pgptl9e4Rh2pPEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420297; c=relaxed/simple;
	bh=Nr35i1iVvmyxQQM1m36ZNQ0OJQRiTZJLyRxlridfurU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qqc21rLq+ZY4MN37uU8CGns5kBq3hFpyluyxxvjdimREWdp2gc99Rq/wlIfGwnAk+jDwkJORT9WXdhPfmXdGGJSX45grj3N/hg8kcgT22r0MdIDfvrH/5CmoAjdn4lLcHMr314P91IK4a5c7nqQNLqAiHIUbp0dTqmKQzLQPz4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hR3TeRWX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hR3TeRWX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40F571F00898;
	Mon, 14 Sep 2026 21:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789420295;
	bh=A0QFITDkPY+ZSHHWURCIX3S2QtkeZuMcOu6OCqkVsHM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hR3TeRWXVKZEq/ZQT+hj6BWLWoVB5wZbNtjRiJc1K/aC2Ae7Aqeb4PD8REqK/+SrH
	 cjHJwa3+mpkCXkYZuusPxbmkIut8DCuv0K+mjsbXkl9jIXRvfT4/kU4FHaY8WmB1kF
	 pGzN+MUwfsJHEz+i70BXLXMhf7y9+56b8U9e2suiyctNDcSgz2jqW8fYKq0laQtiNI
	 aHwdFO0OrWzprqGpgPYdNpUGSS9ry8u2kltKHK9u0HRM7JoMNqJanXw+Sou/lIOZ0b
	 EHD7FW7s05C35H4nZLnAlbiyM89O/APfFhDz176Yz/Cc+IzRueGWqESFUeH8d0Rv2d
	 3PCwD/8ssm6lQ==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 23:11:23 +0200
Subject: [PATCH v4 10/10] regulator: ab8500: Use scoped guard for shared
 mode mutex
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ux500-dts-snowball-regulator-v4-10-dfc453a3031f@kernel.org>
References: <20260914-ux500-dts-snowball-regulator-v4-0-dfc453a3031f@kernel.org>
In-Reply-To: <20260914-ux500-dts-snowball-regulator-v4-0-dfc453a3031f@kernel.org>
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
index f9487395e290..0ad2be98a049 100644
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
@@ -518,6 +519,8 @@ static int ab8500_regulator_set_mode(struct regulator_dev *rdev,
 		return -EINVAL;
 	}
 
+	guard(mutex)(&shared_mode_mutex);
+
 	if (info->mode_mask) {
 		bank = info->mode_bank;
 		reg = info->mode_reg;
@@ -528,9 +531,6 @@ static int ab8500_regulator_set_mode(struct regulator_dev *rdev,
 		mask = info->update_mask;
 	}
 
-	if (info->shared_mode)
-		mutex_lock(&shared_mode_mutex);
-
 	switch (mode) {
 	case REGULATOR_MODE_NORMAL:
 		if (info->shared_mode)
@@ -549,7 +549,7 @@ static int ab8500_regulator_set_mode(struct regulator_dev *rdev,
 			if (!shared_regulator->shared_mode->lp_mode_req) {
 				/* Other regulator prevent LP mode */
 				info->shared_mode->lp_mode_req = true;
-				goto out_unlock;
+				return 0;
 			}
 
 			lp_mode_req = true;
@@ -561,18 +561,15 @@ static int ab8500_regulator_set_mode(struct regulator_dev *rdev,
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
@@ -581,7 +578,7 @@ static int ab8500_regulator_set_mode(struct regulator_dev *rdev,
 		if (ret < 0) {
 			dev_err(rdev_get_dev(rdev),
 				"couldn't set regulator mode\n");
-			goto out_unlock;
+			return ret;
 		}
 
 		dev_vdbg(rdev_get_dev(rdev),
@@ -597,10 +594,6 @@ static int ab8500_regulator_set_mode(struct regulator_dev *rdev,
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

