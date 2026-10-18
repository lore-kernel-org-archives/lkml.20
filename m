Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAD1347C6
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 02:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792289043; cv=none; b=ny/9qizVAI+A6o4yo+XbZY74Tquuo92vpyTsBGh6yPbA9R8+IVRAn2QhIV2zjG46C0gNCxYRQAx/5sD0PhayQHhscVY2kxcvUnKhCKi+W1Nq+fW2beGD/i24eisVghpHD6GcC3tgtqDBLw/67aHKBjXK8IT9lNYkA8Rrncu6LUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792289043; c=relaxed/simple;
	bh=k711JYjJ7+6BTD3xUFd6EggIC11D/1ItC0j0I71VNUU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RK7i8VpFJZ5Kzp/dRQX4JRHiokSn6AOVHM7Bujr5ZsYGkGRiOe/O5gfhq8KVBhkFF+LWy36jic1aMK385X4giWJ2miw7mZNs7qbuXlzv1SA6XMneSs+zdO3msfpxNNU1r6sACUfxI6Xql0IX8mYj3Vyww8q2Tl+mcnm8YvQXrMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O1DQP59x; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O1DQP59x"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93f1ca4132bso94403985a.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 19:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792289041; x=1792893841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wHi6g0wrwMF4gUfLle6SGkdX2pS0qJWckA2P3X8qxW0=;
        b=O1DQP59xSYUpzXUKB4dUT4G2oa3e3KvZiIxifCn2fkVaXgJ4vjW2xaYPnVd172cg0j
         QYkYcv7mBcpWewV3IoztPWKPdOIWOzUTLiL+WboY24wI746z9cpZJjKo1osNz+3scm7i
         ohndF+bphOyonH3st8PeTmdfvf3xvwpDv68WN6XUpxm5LXsAJmSo6OWJPrX78qEvgtBU
         oM94P5+F3FRRNxaAdxLFW3nxzHQGBtIAmuhLAlhmgq6mHtWtUuJGB5apHI4C5WXtjwPq
         Zu3B2fMGtzl9/33Nop+fHgKVIgbsqKTIes2xdjyb3Wm+FU12b2erqu3Xhr+byiqzH3zi
         qTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792289041; x=1792893841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wHi6g0wrwMF4gUfLle6SGkdX2pS0qJWckA2P3X8qxW0=;
        b=P2yCn2Ab0nF6r/qvik9OQvzH0e8Cw6/jVZqxXg2xx3tl0lA/ifAq5Q/s3E4qlCjdoy
         6jlviX0uONE7H/E2hy/oG5Dh/CmZCdxeZnYxhYXon2kc0selc/Iw1t/OSY76E7wB3D/2
         IGo9G1Qx2deqpnzkYmlUO4+n1tX4rZTxIMnBFrdntuDPVxeFMffx2SIr9A63NvuOLGVo
         drzsSumSewPUTsYHZsoy1mClapON7JSvYNYkSRlN/0oWtrpQAGGkPIgeO6xUK7QrtxOA
         5TiK4sQBWMYEB8mIqel8EMzo38QILjrp81hmpYgLTbw0f2q7xV7NoQ+FxRPilOWLRh5X
         hICQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+E/XKWf8tqw/eGoxj9dIpsvCeZd3GIjG/hPuFjwe9MycO5pOFiilKUoe6ZzaZrzjFm8pHmtzUTsS/Y5s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSHJpcIZ+m2fNQuRPIkpKAGLsP+EY/GC28QZ/IGgLzi46k4W0W
	rSZ/kgVvQY80ggATN8L5qGIssGoxg7p8CBWxH35to2HJeTRb6GyVTPcQ20E4los=
X-Gm-Gg: AYBFou0pdYI1x6RGBLzXjDESVtI/obX+kUo05q4VBUOVqlnudVC8HVe11b6fhtWXN3G
	tt59w65Ad18zDZhHNVV/SY4cI3nrjyY9U3AOppLj8hvyVvyaUbL8qTJqXhzeKflomCRtbsHJf7O
	DMQ1XPovDlyWaA0Ij9qKfJJ7EmMyBlKRJt7DA9t1/ig3y1gimTSWv/7oxsSDLVT6tVJm1SSTHrX
	Pu71FN9hIZCZe7Huwoqm3/pMY0lfR/GV8JNaJaMSOM5oFAuggOnHbPzEpo3zlFuVUwccg+fpTfD
	7FqJ9KtqGTS4lYq+FQALhQxistyHMC6S1cQVJDGxoz2PwEm0O/srvphLvJqxMjUMabc6jY1Q4lc
	YMahhkqwQ95igCwxZ6E+EFvLieIvpOnp6Pk4ol6RM1gqdX2nDg7bG6etMndVp/2uRL/DgLgIy3D
	bGhbnDuLrazUGo0afypSkLt8dfjMqZ1pIwCScw18WZr2/ENC6Ffapz1OT6tyyt+yfX3Xwy4q95C
	faimfTst2eY66JSL+CG4MhIPrVOxSIiiPqlwus6CD0r9j0ajSyg+ghjQF5SMVuqfsr2T4vKFdnP
	udgWywgMgF+5G1XwtPnjWy3dA2qZ
X-Received: by 2002:a05:620a:2552:b0:93f:953:9a1d with SMTP id af79cd13be357-93f29db4fc0mr716733685a.67.1792289041164;
        Sat, 17 Oct 2026 19:04:01 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1fb55fdcsm505611385a.39.2026.10.17.19.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 19:04:00 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2] power: supply: act8945a: Disable status work on removal
Date: Sat, 17 Oct 2026 22:03:57 -0400
Message-ID: <20261018020357.3845586-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clearing init_done does not synchronize with either status interrupt. A
handler can observe init_done set, be delayed, and schedule the status
work after cancel_work_sync() has returned. The work can then access the
power supply after its managed cleanup.

Use disable_work_sync() to reject subsequent queueing and drain any
existing execution. The charger allocation remains valid until both
managed IRQs have been released, so a late handler can safely attempt to
queue the disabled work.

Replace init_done with the work item's disable state. Initialize and
disable the work before act8945a_charger_config(), which registers the
LBO interrupt, and enable it only after probe initialization succeeds.
This keeps both status IRQs from queueing work before the power supply
is ready, including on probe failure.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: a09209acd6a8 ("power: supply: act8945a_charger: Add status change update support")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Remove init_done and all accesses to it, as requested by Sebastian
  Reichel.
- Initialize the work before either IRQ is requested and keep it disabled
  until probe initialization succeeds, preserving the probe-time gate.

Compile-tested with GCC 15, W=1 (x86_64), with OF, OF_IRQ and
GPIOLIB enabled. No runtime testing.

v1: https://lore.kernel.org/r/179211805459.3650807.8742309660995961596.G171@gmail.com/
Review: https://lore.kernel.org/r/atPtc_jKLo8RhAMU@venus/

 drivers/power/supply/act8945a_charger.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/power/supply/act8945a_charger.c b/drivers/power/supply/act8945a_charger.c
index 7e4b087..7d47052 100644
--- a/drivers/power/supply/act8945a_charger.c
+++ b/drivers/power/supply/act8945a_charger.c
@@ -14,6 +14,7 @@
 #include <linux/power_supply.h>
 #include <linux/regmap.h>
 #include <linux/gpio/consumer.h>
+#include <linux/workqueue.h>
 
 static const char *act8945a_charger_model = "ACT8945A";
 static const char *act8945a_charger_manufacturer = "Active-semi";
@@ -78,7 +79,6 @@ struct act8945a_charger {
 	struct regmap *regmap;
 	struct work_struct work;
 
-	bool init_done;
 	struct gpio_desc *lbo_gpio;
 	struct gpio_desc *chglev_gpio;
 };
@@ -444,8 +444,7 @@ static irqreturn_t act8945a_status_changed(int irq, void *dev_id)
 {
 	struct act8945a_charger *charger = dev_id;
 
-	if (charger->init_done)
-		schedule_work(&charger->work);
+	schedule_work(&charger->work);
 
 	return IRQ_HANDLED;
 }
@@ -587,6 +586,10 @@ static int act8945a_charger_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	/* Keep status IRQs from queueing work until probe has completed. */
+	INIT_WORK(&charger->work, act8945a_work);
+	disable_work(&charger->work);
+
 	ret = act8945a_charger_config(&pdev->dev, charger);
 	if (ret)
 		return ret;
@@ -625,13 +628,11 @@ static int act8945a_charger_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, charger);
 
-	INIT_WORK(&charger->work, act8945a_work);
-
 	ret = act8945a_enable_interrupt(charger);
 	if (ret)
 		return -EIO;
 
-	charger->init_done = true;
+	enable_work(&charger->work);
 
 	return 0;
 }
@@ -640,8 +641,7 @@ static void act8945a_charger_remove(struct platform_device *pdev)
 {
 	struct act8945a_charger *charger = platform_get_drvdata(pdev);
 
-	charger->init_done = false;
-	cancel_work_sync(&charger->work);
+	disable_work_sync(&charger->work);
 }
 
 static struct platform_driver act8945a_charger_driver = {

base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
-- 
2.53.0
