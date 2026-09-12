Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1536350D7D
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 22:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789251583; cv=none; b=bw99TudVneax+WkYYclWjFOrapGOW4zCKUPvRxBEb3E/7ryWSizYHO5J+W/bK0jMCzLOmegsdYAr/1Gto05iBY0ojij0SONgW6vYK51UXbsAbz+RwrxDfYom96IjeB2HBNaJnXq5plf0JlqU9JaMt0eHyG98dW8tltihrACgqN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789251583; c=relaxed/simple;
	bh=0uT0VgkWN10sGGCdjOU9H1z6SM5oHkGT3yRKAlBYR2U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CpVU5R4/0LRweAchh1vuspCGe7mVnDmaLB8ihLFI7Sd/OsJreo0TqdHbaK9v1dWWsFa/eYgA4wTq93IU6qjd4m0KbVqRbM1Bc738WcOtPNyB68Nnov7lMJyrNA4+Kzeg/d5fNCb7XPbwGnXKbJRXU9YeDdc0ze6n8jINgCh6qfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JCj6Endl; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JCj6Endl"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso3145040a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789251581; x=1789856381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q6Xs676NlWL1Mj/zcxdmFLfPMSO9k6Bt3Fs8MUumDew=;
        b=JCj6Endlerp/AN0HgyS+TQCA7fl16pSqhA8QLKv6hYr9NoSVy7AOd39BifbHpLmdm/
         o9+RP2weU8IxHpFW4yx2ArUtRdM74mfQcguog+pCTH4Mw0K+/rXtk/mVWvKsljQfYcLU
         +vQ7/N6o73XOMRQz7VIMNWjZ/tCYNb5QwfAOs49Nogv2INvsqFhSxEfazW9UvlbLcLEo
         nxNf2XURKk4U66gpv+/zfXhVom0RA9ddsY+ROLu7bmFxRQVf8hMOosDHl9k/qPtqGOFB
         /nZwR6a9xu5Mt7isGQQW2WiHo1OPxhuBhT5waUqTUW3j8Jp/KG6dtaA/a+oJc7izXMGU
         1ScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789251581; x=1789856381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q6Xs676NlWL1Mj/zcxdmFLfPMSO9k6Bt3Fs8MUumDew=;
        b=XUwR5KgU75b1P3cKstv/KGuWXxYbVtsF0MuGdDzB4J0uMnvYvV5Uw5Stvr7rtDl6jg
         5DV9G0cBzUzsBmnbL3Tq1/+QJOtgWv9tEO7QkiwqWn2myVnabE9L4FAOdSNqBHqHaAUZ
         CA4/Zgt736Ap4zVKn5kC2K7TF/mKmhlTHiXY7UcTGpF/RASt4sr9Depk1SVWAexWE8t3
         Zh1c27Kf5Y4zokWNMsM2lC6wS4zv29PT0iUEYbHUbBAm3k1qIfU8xmHLfddQc6RzfGJY
         R92U00eEqBWZUGLA7eGFXMZ0fX7SvqBHmtruCLJ5mo8ZDq+7ygTJB67v1uafSrwuCbx3
         f4rw==
X-Forwarded-Encrypted: i=1; AKwUvBzuHN5gWZyhEtTFUpafucdtza+3DMr3MZMG4x9AWedZxj4xbQXIVivJHMoWQNPMtrc5ZG4etxsQizt483c=@vger.kernel.org
X-Gm-Message-State: AFuF++nRZDKOE69o0OVP135GkvvwNPKO5lr6IMXUhS78QNJQVRiHzThb
	ulT6B/YAGLFsXAYmj/K6RvIm0Rp8yiH9sAJvEo1mNW/yuGBy8ko04lyL
X-Gm-Gg: AYBFou3g9j7Jsf+Wpadh557OFGypx3cjiWQyo+LQph2RapSDKCamiVaq1zBqlmFAKMV
	wevRxY9gYxqHUNqWwu2GXrv5AGJOE/YUDzlBq7Ejx4JUONLKrVudgalJsVh3+V1+Oi71cR6VF4e
	J148QwzgsjE3QTIynhO9qNz/kUzEtAFeGPEew0vKCsM1Cq0Z0+mSzFsuTf4LTNCY9XwWnvrPUQM
	DbbAMrnnS1l19izCxpswxcNNOZS4kdvVQ0qrGbG8relyB9/VSIY1dBceVz2bCEOiC6zKmnmicph
	7Xntle9CpoAydLbbAT7/RlrjJaM/6UQEyscj3D6WnaQMhdPGeHOW6QJxFlgZdT14Cirdq9i9QgW
	fPGKinbr59zlk1EuXBUhqTdKHxzfJ/9IhHer3z+0RA4v8hbOnbAu+MTna09dL7+7Q3lxpSCKp7Y
	jsXex0AeAcbOGQoPCH8dXvzs5BdxRv09qT53e+M/Q95mU+5hi2JFw+aTNpWo++E4Jl7gtss10Eu
	mgPJf7RzNcGgka7flPaOsfC6Bu+7eNK+bjcJ3i71947NZRgeHIdnvnkGBcYs9C3/i9l6XPJMuMv
	j//hWNBzOJMDdjyKCEoW04jL2gpdo2DSXZQLm/ySdKY8DKc7
X-Received: by 2002:a17:90b:4b0e:b0:398:9be5:b41d with SMTP id 98e67ed59e1d1-39d9c368348mr17660307a91.24.1789251581216;
        Sat, 12 Sep 2026 15:19:41 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602e7sm13437631a91.5.2026.09.12.15.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 15:19:39 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] gpio: mvebu: keep resume masks within the irqchip cache
Date: Sat, 12 Sep 2026 15:19:37 -0700
Message-ID: <20260912221937.71403-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mvebu_gpio_resume() writes the edge/level mask registers saved at
suspend time straight back to hardware, bypassing the irqchip's
mask_cache_priv.  genirq skips mask_irq() for a line it already
considers masked, so restoring a bit in hardware that genirq thinks
is still masked leaves that line unmasked behind genirq's back.  An
asserted level line then has nobody to ack it, and the moment
interrupts are re-enabled the chained handler storms, hanging resume.

AND the restored mask values with the matching irqchip mask cache so
only lines genirq currently considers unmasked are unmasked again.
Read the caches under gc->lock to keep them consistent with the
mask/unmask handlers.

Tested on Helios4 5 suspend cycles woken by magic packet, no hang;
mvebu_gpio_resume() returns in 6 usecs.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-mvebu.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index c57758019e92..988f2cf24f59 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -1049,6 +1049,9 @@ static int mvebu_gpio_suspend(struct platform_device *pdev, pm_message_t state)
 static int mvebu_gpio_resume(struct platform_device *pdev)
 {
 	struct mvebu_gpio_chip *mvchip = platform_get_drvdata(pdev);
+	struct irq_chip_generic *gc = NULL;
+	u32 edge_cache = ~0U, level_cache = ~0U;
+	unsigned long flags = 0;
 	int i;
 
 	regmap_write(mvchip->regs, GPIO_OUT_OFF + mvchip->offset,
@@ -1060,38 +1063,53 @@ static int mvebu_gpio_resume(struct platform_device *pdev)
 	regmap_write(mvchip->regs, GPIO_IN_POL_OFF + mvchip->offset,
 		     mvchip->in_pol_reg);
 
+	/*
+	 * genirq skips mask_irq() for a line it already considers masked, so
+	 * unmasking one behind its back leaves an asserted level line that
+	 * nobody masks. Restore only bits the irqchip cache still has set.
+	 */
+	if (mvchip->domain) {
+		gc = irq_get_domain_generic_chip(mvchip->domain, 0);
+		raw_spin_lock_irqsave(&gc->lock, flags);
+		level_cache = gc->chip_types[0].mask_cache_priv;
+		edge_cache = gc->chip_types[1].mask_cache_priv;
+	}
+
 	switch (mvchip->soc_variant) {
 	case MVEBU_GPIO_SOC_VARIANT_ORION:
 	case MVEBU_GPIO_SOC_VARIANT_A8K:
 		regmap_write(mvchip->regs, GPIO_EDGE_MASK_OFF + mvchip->offset,
-			     mvchip->edge_mask_regs[0]);
+			     mvchip->edge_mask_regs[0] & edge_cache);
 		regmap_write(mvchip->regs, GPIO_LEVEL_MASK_OFF + mvchip->offset,
-			     mvchip->level_mask_regs[0]);
+			     mvchip->level_mask_regs[0] & level_cache);
 		break;
 	case MVEBU_GPIO_SOC_VARIANT_MV78200:
 		for (i = 0; i < 2; i++) {
 			regmap_write(mvchip->regs,
 				     GPIO_EDGE_MASK_MV78200_OFF(i),
-				     mvchip->edge_mask_regs[i]);
+				     mvchip->edge_mask_regs[i] & edge_cache);
 			regmap_write(mvchip->regs,
 				     GPIO_LEVEL_MASK_MV78200_OFF(i),
-				     mvchip->level_mask_regs[i]);
+				     mvchip->level_mask_regs[i] & level_cache);
 		}
 		break;
 	case MVEBU_GPIO_SOC_VARIANT_ARMADAXP:
 		for (i = 0; i < 4; i++) {
 			regmap_write(mvchip->regs,
 				     GPIO_EDGE_MASK_ARMADAXP_OFF(i),
-				     mvchip->edge_mask_regs[i]);
+				     mvchip->edge_mask_regs[i] & edge_cache);
 			regmap_write(mvchip->regs,
 				     GPIO_LEVEL_MASK_ARMADAXP_OFF(i),
-				     mvchip->level_mask_regs[i]);
+				     mvchip->level_mask_regs[i] & level_cache);
 		}
 		break;
 	default:
 		BUG();
 	}
 
+	if (gc)
+		raw_spin_unlock_irqrestore(&gc->lock, flags);
+
 	if (IS_REACHABLE(CONFIG_PWM) && mvchip->mvpwm)
 		mvebu_pwm_resume(mvchip);
 
-- 
2.55.0

