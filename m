Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503590;
	b=ndxPO8AoN7BKCvesNchP4MPj52fGJV2GPVLYno6ihZRqC9Lp8EhJ3cm52urh/n0BzgL4
	 C2tVgr6ckl05eU6jKOa45USqbA5diXx+yA5vcm50WFi8POZPqJSuSIL2ZTEI4iyh6ZKg3
	 AF4GkqAp8sQI40Gfx5L6Hd1ppzSWuxaoXkzjvE6vQJLiSG3jx3V2aZbdNsal+l0R9Bmap
	 cUUxL3/LzmHydgHARS4iyjR4hOFpe/5J8/nfE6/96Qu94WhyJs2hbqtOjb3aizVKDBUMy
	 x5LuchzvG2Xk/uMJvBF2Aa4OjWJRydb8W2tK8aEN0zYNQLYh5cAEeGPn2Vptm7Nj1Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=fPd42FbzcDsqeOTm9tqOXQCc0xvhBAIaWnzJDNk+m04=;
	b=ahqJZP0tGD94jXFxlvea+zJXOv6rHoRbSwrz10+g1FNMNz+KUhLOOLkwYPaTfB8z5jeL
	 fQg0U2VnxkvjUAfVmGJFbS13ycctVH+18kDK0c10DvzQGo25KWf+hQw0Wdxxsl7UZc3Xa
	 PNoOjoZPoAxyLMdqTp4fGbjGcWLiNsIjVVqBWe07wVqOiXWp4B4O4iQtqS2w2v1/xi3Bp
	 svnulvDyxjXKUMi4Pml1DiRcY0PPYO5rTClRCKZk5ezooyyJ2t7dO8itB85xJGvjeDW+j
	 Xn7dk9tDdRd5wk72/6iotJpo8/J8CnzWt0JNX6JL8iNaSq5pqSL6n489lGfXRtMzHKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KZ4om2Kq;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047CC606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 047CC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KZ4om2Kq
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48b0584ad71so2379565f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792503587; x=1793108387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fPd42FbzcDsqeOTm9tqOXQCc0xvhBAIaWnzJDNk+m04=;
        b=KZ4om2KqUEcys5s+O1UNEsqVtMNuidnoZ57SSnawdxluVd+x2YjhinVg1mEPAbb3z9
         aNHh0E6CgKnHFCZd+IFPLtCQW8yYlNplMFRU0nUljjCoNfdtz7gVbTunuRnLlVCDfOL3
         ihObkjgmhYeDVUC/QwtP6WRh3hI2q1dKtqrqyPkU+YhRJff5gMnHEOl5rqNOoxLmxwM4
         QM6BIes8RVNIZlx29eG2kOKGdSAjBFicRGyX7oaT0zZ/Yc/uUpDeCuD57B3XrpOx1ma2
         OK59qA1cDHERUs3gcDZXVzqVFo86bAJ1R6063xxG0+709V8GICHobK1UY6sFnHUsWCd9
         di7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792503587; x=1793108387;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fPd42FbzcDsqeOTm9tqOXQCc0xvhBAIaWnzJDNk+m04=;
        b=Y0aZ3EnkZ9cpFCS9zc9pmKfRXMP5DUASoxOfqtNGKPadFg5T7RZgItveNjQf1HQo5x
         adZlw8Cy6RaeUP+bfzTOZb5B9pTlEISagnAteDUqDtkTVZO1HpqirRAITo2fWOTfs4xH
         KOAyXQt14R1aBAGMFXvSlCMn7NCD/AARNrZwjiV2hzHkM3Ik5ycK7xZqjVi/75oCTBYF
         cK60UIym21gVL04ilWUIMNENZRsNY2T+zex9CFWonb9AFkjppXygkHeFgdO1EUQ61VoW
         qHNteph7/4K/JG1K3WXUKMglojQZWWWGnU8W08Tu0dVrb05uZcspPuiBPnmMgh66h1us
         4ClQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKWIhqtgbAhnvMqDl6G6zSuSGfxTU9fSvQMcJ/rkLooVIy33W89BVoAGCRJCOQo2UXc9OFjEbXbIv3u7c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIV3l+IPfxkCNm5mrvrv07plX6Xuf7QyQIQGFUj1TpwKJoso8tJ
	9GTrV6iwmkAbcl6qZRQMlp5M6Tkg/lJFf2VImul/jyuDfRhFheYINKhFRLE6Y6v4y84=
X-Gm-Gg: AYBFou2C2XjmCfXVU5pFWA6xEGd/Yl0sN//UwIFheOtJHFqqonypFcQvvr1gdhpK0rK
	CbnYvxrgODEvnQyEfH3wj/DcKyRpVtM+Z0nJvY8bJ4RjJ6in39FEiDh3rHFW+Gp/v0Snw1R+yXN
	YUjL+ktCI/TLeWWZ8xr8dLwNBI2I63GXFdS3HWOdP5xIgE0WDfBOhUgnGOAulYlxaWYmr6O6kjP
	L6cCCuXqckgt4bw4HQjAFN0O0V8auFoxqn17Slu/EIHNBf/SpfWDI0ABGEHQy86ODo6dyAUXDCu
	3Djs/c0ERaaRcn7dg/Kb3SFGWilcaf4LvQir8jsejo/5+grbDJ8dP7j68IcJQSbSHq4nqIhYlyO
	ypi/kit3UnfYhTaxITFOF9EDL60hMiH+C1g2tEwmtawvKtar6KxxnZZ3t4zCUt5BN7hx/SWLMom
	OBmMP1LwTvTy+hWwtgNQvo9iOsxFUBy+lHtLaUPWYCuuer7XIq6DlfW5bEudxCJocWJN0jYtZ6I
	BVoqN9x3LTjwHnyTGTfThlm3TfDGFX2GChsv5w87ccUgtV4up56nXoQzcBphQ==
X-Received: by 2002:a05:600c:1da1:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4a1d76011ffmr256944035e9.19.1792503587131;
        Tue, 20 Oct 2026 06:39:47 -0700 (PDT)
Received: from localhost (p200300f65f19a90471524a26f3674b82.dip0.t-ipconnect.de. [2003:f6:5f19:a904:7152:4a26:f367:4b82])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a1f2d1e8ebsm67893825e9.3.2026.10.20.06.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:39:46 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-pwm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2] pwm: tegra: Fix value discarding for duty and period
Date: Tue, 20 Oct 2026 15:39:38 +0200
Message-ID: <20261020133938.191013-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4083; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=Nl+6vIshBZCO9BQQb0mvw8kKOz2qIzEe0X9VABTydcI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq128b/6o0ibcltl0JTKFBP5dpatRSfF5DuSu2e nlALrT35E2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCatdvGwAKCRCPgPtYfRL+ TqrxB/97DCHlDuHmJc11BAGDIY4S/WFvSLiOG4Hf9XRrOoNk3Pf+AU0KoZOlDiMCBvBK//xp0Ki v2POIzD4KuP3gqbPb3PiD2FFMigDlyWqNxoL+IYZfYDQWWzoioUnzE3dTDUT7HaUHkrU+nKuCPZ gQvd+HBhBf6aPRJTHPq8ecWBAXkbSTswfhoo2jBWE4yLNFeQ7lotFM18IVxhNVCnhbHyF5sXZ6s x+DCbHvE3nOLkrsbmlSdkROBnhMJq6Pr+vM8vY+hHMPmE0uK61Abh2nvUsbNquZC76qOxrsdlvk xKVN0WNkJmiYwwE+54ax1msMbXfc45sp5tAL+5pshHWYLcoi
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

tegra_pwm_config() is called with u64 values passed for duty_ns and
period_ns in tegra_pwm_apply(). Make these parameters u64 instead of int
to not lose the upper bits for bigger values. If such a discard happens
the values that are written to hardware become wrong, or (if the
discarded period value becomes 0) a division by zero happens.

Adapt the math functions accordingly to not let the now potentially
bigger values result in overflows. While touching these, also limit the
scope of the required_clk_rate variable.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/bug/linux-5c5b97d6-4da6-4d06-9dc7-957419dcd832
Fixes: fd3ddd4355c0 ("pwm: tegra: Implement .apply() callback")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

Compared to (implicit) v1
(https://lore.kernel.org/linux-pwm/20261015085336.4181137-2-u.kleine-koenig@baylibre.com):
this adds more adaptions to handle the bigger variable types, as found
by both Sashiko and Mikko. I didn't think a lot about the
required_clk_rate calculations, but I guess the saturating math I
implemented should be fine.

Best regards
Uwe

 drivers/pwm/pwm-tegra.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/pwm/pwm-tegra.c b/drivers/pwm/pwm-tegra.c
index 5cdbe120ba2d..6d468a673ded 100644
--- a/drivers/pwm/pwm-tegra.c
+++ b/drivers/pwm/pwm-tegra.c
@@ -138,22 +138,23 @@ static inline void tegra_pwm_writel(struct pwm_device *pwm, unsigned int offset,
 }
 
 static int tegra_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
-			    int duty_ns, int period_ns)
+			    u64 duty_ns, u64 period_ns)
 {
 	struct tegra_pwm_chip *pc = to_tegra_pwm_chip(chip);
-	unsigned long long c = duty_ns;
-	unsigned long rate, required_clk_rate;
+	u64 c, rate;
 	u32 val = 0;
 	int err;
 
 	/*
 	 * Convert from duty_ns / period_ns to a fixed number of duty ticks
-	 * per TEGRA_PWM_DEPTH cycles and make sure to round to the
-	 * nearest integer during division.
+	 * per TEGRA_PWM_DEPTH cycles.
 	 */
-	c *= TEGRA_PWM_DEPTH;
-	c = DIV_ROUND_CLOSEST_ULL(c, period_ns);
+	c = mul_u64_u64_div_u64(duty_ns, TEGRA_PWM_DEPTH, period_ns);
 
+	/*
+	 * The cast here is fine as c ≤ TEGRA_PWM_DEPTH given that we have
+	 * duty_ns ≤ period_ns above.
+	 */
 	val = (u32)c << TEGRA_PWM_DUTY_SHIFT;
 
 	/*
@@ -176,6 +177,7 @@ static int tegra_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	 * dynamically (e.g. Tegra186 or Tegra194).
 	 */
 	if (pc->soc->num_channels == 1) {
+		u64 required_clk_rate;
 		/*
 		 * Rate is multiplied with TEGRA_PWM_DEPTH so that it matches
 		 * with the maximum possible rate that the controller can
@@ -187,10 +189,18 @@ static int tegra_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 		 * source clock rate as required_clk_rate, PWM controller will
 		 * be able to configure the requested period.
 		 */
-		required_clk_rate = DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC * TEGRA_PWM_DEPTH,
-						     period_ns);
+		required_clk_rate = mul_u64_u64_div_u64_roundup(NSEC_PER_SEC, TEGRA_PWM_DEPTH,
+								period_ns);
 
-		if (required_clk_rate > clk_round_rate(pc->clk, required_clk_rate))
+		/*
+		 * clk_round_rate() and dev_pm_opp_set_rate() both take an unsigned
+		 * long as frequency parameter, so cap required_clk_rate
+		 * accordingly.
+		 */
+		if (required_clk_rate > ULONG_MAX)
+			required_clk_rate = ULONG_MAX;
+
+		if (required_clk_rate > clk_round_rate(pc->clk, required_clk_rate)) {
 			/*
 			 * required_clk_rate is a lower bound for the input
 			 * rate; for lower rates there is no value for PWM_SCALE
@@ -201,6 +211,10 @@ static int tegra_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 			 */
 			required_clk_rate *= 2;
 
+			if (required_clk_rate > ULONG_MAX)
+				required_clk_rate = ULONG_MAX;
+		}
+
 		err = dev_pm_opp_set_rate(pwmchip_parent(chip), required_clk_rate);
 		if (err < 0)
 			return -EINVAL;
-- 
2.56.0.rc1

