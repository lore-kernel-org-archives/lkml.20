Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835378;
	b=xTx5QVBkHbPzMSH5DQ6nvgfraFCB5KQ/ltqbjdlWL/+Ff9i/rjKeMQOCg8G4gNe3YEiU
	 NucylEqoA7g6U3q8pJalSqut23PsEzRIIJJzq2+y4kiRpsLdXKSDbF/iyJjjR48KFXA8K
	 SiS1pAY7mhJWW42C89hvYp/I28QT4JLggteosBxaMyrPg6fk8K43f3P/o/FJOU3oy1zoY
	 3e4Sl3kZ44DR+CZ/HXuD2u2+47ioduo+u1zTJ/svmqlRxqh7ROfRgcoUWvDdZ+0/GBR3n
	 NaHEANpIWiweqVLg7NWusXsB+Nxq4SLie3by4xwrAh5Zoa10Yfyh/FVzF0947SXzMgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=zY8oc0zkzWVZwbZsD+nSdvisfPqYBIIvPsAUgsGOjgA=;
	b=caoQL7v8K67yfZMHy7mDzSs5U7hLIEb5p+M0R0JMpeut8k4ui9+wSnlIYCkcMUTh6Vxf
	 MHd0IgLBAUpm/LgQ6igiVxrWgO8WjILsFImhGoAp331TxvP6fpt3MC/exq9orm3fOi64N
	 0Bo7DN5PQp2mG/6j7RxDXUwQsZxp7s/jMiHLaP4K0h8dwmtoHWP+83D85UCgw0AGLlF4U
	 nGOWA6RSFOvCa8K0u3ilWJBY2rXoMRt/b3I5qsupnpWjkCWQCoFw9OGvfy+zE9Nshg6RO
	 k+ZVGsgCsW30HwL2Jg/okYIppk6lvxKVTgNtSQLkqrE8DAMNFC24vlUSkYZLruhKoRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jP4x33gQ;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8064606A333
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8064606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jP4x33gQ
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1708748f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794835375; x=1795440175; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zY8oc0zkzWVZwbZsD+nSdvisfPqYBIIvPsAUgsGOjgA=;
        b=jP4x33gQg+/V2uuXZHMNcPUw3OkPCrAEbA/9JMtR13TTtKUvaBDOxuM9jNzC96t7oU
         dqmDw0s8WFICH0LV+y4WxuUw50nSmuT9MmRcT17qXNG+c8Ur0WIB07fI12u6dEQL+jTE
         s9IQsAF5YFvPIV3/0BZQ8QM/OiQGUS6JGEVw+NjmD6sDC1AGmcRMFWVeG11Q05yZkP6o
         QVbKZGKenyVWTd1rMMUKvpcJhF/2Td6sK8Ot841JOgMxR9zKFqVETMakOUqCgsbwR9f1
         r1yoUjxpPV2zbZOikiEmeVwRdf9ho5YR++dDwPg4rimaW3Ai0CxX/H2cbUaZLAEAIQlx
         +wEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835375; x=1795440175;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zY8oc0zkzWVZwbZsD+nSdvisfPqYBIIvPsAUgsGOjgA=;
        b=kttQdmoREU8K2uQtTG1A4Bjdr//yfk/3+kvJTq79D3QKJinApKMsafVlY5aEaFRIE9
         E5RTbJEcJGIPNv3dflPl5EesZvrCNfL1PiclTG4o3KHdh85+KMMLHtxtG2S9KiQ0Zf9S
         jP6oxX1wuTxzIgfRd0h6Cr36QgrYzZe5/zXiUIDWMaiwYthCPh9Tz5kuuIcw72jWCnnb
         pzHm17ZWrP61rubdtiiOIHlkTMiZcb2BRASMzmctGSPc5t5Tn58wRT0Vs5RimaUwWGtz
         OO9iLvsiGkphd7HaQVlou4ndB39hibz6Gtznr5ENWc0eLRIYvgw7QDo2O6jbf2MI7V/j
         IRLA==
X-Forwarded-Encrypted: i=1; AL+hErE36ESJGBWYPENi8ygTrs70W+sISowS5HTauyNAVn0ainGhsnV8ruHZvBUk7ViUZ+7nw9o5+4Xu05Bjbog=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mYerfIi6EUC3VfrIfVi0EeBk9NKsI4EqQKJx80wA+Em24pHS+
	VSq3mbWgzcQqKiY9Jxkce6fXY15NAme2u7WVrSrfpoOpvr4v0c3y4ohHGoQXfXT6
X-Gm-Gg: AZFdTZcCG2Zg3sw8D9weM3lFlNJBb2LMzFNvVfIVaaQQIcyGUJCyZxsDyeQpbDi0DNt
	lsNr8xdhzTtw/NelJ0XqODX5yYN9L482eL57EAfb0NYEpmfwzuLNjnCLi6T+y0tyILsFRwcsKFH
	0h+0bDP8OAPa5pT/6F9Qxfa28AemYmjfSIzRjI8GZ+buaTK4HHr1rvlQuXFv5q6OG5du2OMLMoq
	BNAGt0aPg24pNUPeJYPxN3NILtjuIuhTh5hkpRadT43RoLlywYfsXstLoUr/3hWlo0ma/lr0khM
	xkR6DeQKk+umeX69kqTlCXDU2l7z+Kj5cxfa/gmBrwbt9ThsUyDf2582qTBB/F9MdTiXKyJ2EIx
	NTiCe3nwII8YIKy01Vibduf6DxkPfXd5qejdaV+VNEpJrB/sJFUy2+vYCmEKHsOy7cWFNQankyR
	qH6NK7B4Tk4Eprn/DCUHsMl01Ee8VlRFTXYwkzxAi4bAIIOV7rhnGkAM9DlHCJ40aCLPEJJTr9u
	tQfBXYRnKElZqycnIHxk3qn6e4luzNd/kYbpuAV05YRrqCwQIf5AkaYEXSa5JK1MJMh0uUl9Ig1
	pUOXm3qGwU3oBDxHKu+gFd+X78dr0djS9bOlgwdGX9pMKv8y7TcdUvY=
X-Received: by 2002:a05:6000:178e:b0:490:ae2:b841 with SMTP id ffacd0b85a97d-49c73a05d9amr22680354f8f.30.1794835374880;
        Mon, 16 Nov 2026 05:22:54 -0800 (PST)
Received: from ingenieria31.oficinasStQ.local ([79.117.0.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c81a63b1csm21374694f8f.4.2026.11.16.05.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:22:54 -0800 (PST)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pwm: tiecap: Implement .get_state() and keep a running PWM
Date: Mon, 16 Nov 2026 15:22:51 +0100
Message-Id: <20261116142251.1296742-1-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
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
Content-Transfer-Encoding: 8bit

The driver has no .get_state(), so a PWM left running by the bootloader,
for instance for a backlight, is seen as disabled and the consumer may
turn it off before enabling it again, which makes the screen flicker.

Read the state from the hardware. While the PWM runs, .apply() writes
the shadow registers, loaded at the end of the period, so read those to
stay consistent with it, and copy the active values into them at probe
in case the bootloader didn't set them.

A running PWM also holds the runtime PM reference ecap_pwm_enable()
takes, so take it at probe. Switch to devm_pm_runtime_enable() so the
remove callback can go.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
Tested on an AM335x board with and without CONFIG_PWM_DEBUG, with the PWM
left running by the bootloader and from a cold start, changing the
brightness and turning the backlight off and on.

On AM335x the PWMSS needs ti,no-reset-on-init in its ti-sysc node,
otherwise the module is reset before this driver probes and there is
nothing left to read back.

 drivers/pwm/pwm-tiecap.c | 71 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 62 insertions(+), 9 deletions(-)

diff --git a/drivers/pwm/pwm-tiecap.c b/drivers/pwm/pwm-tiecap.c
index 3751737ead43..9a490b8d60ec 100644
--- a/drivers/pwm/pwm-tiecap.c
+++ b/drivers/pwm/pwm-tiecap.c
@@ -28,6 +28,7 @@
 #define ECCTL2_APWM_MODE	BIT(9)
 #define ECCTL2_SYNC_SEL_DISA	(BIT(7) | BIT(6))
 #define ECCTL2_TSCTR_FREERUN	BIT(4)
+#define ECCTL2_RUNNING		(ECCTL2_APWM_MODE | ECCTL2_TSCTR_FREERUN)
 
 struct ecap_context {
 	u32 cap3;
@@ -206,8 +207,42 @@ static int ecap_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	return 0;
 }
 
+static int ecap_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+			      struct pwm_state *state)
+{
+	struct ecap_pwm_chip *pc = to_ecap_pwm_chip(chip);
+	u32 period_cycles, duty_cycles;
+	u16 value;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(pwmchip_parent(chip));
+	if (ret)
+		return ret;
+
+	value = readw(pc->mmio_base + ECCTL2);
+	state->enabled = (value & ECCTL2_RUNNING) == ECCTL2_RUNNING;
+	/*
+	 * While running, .apply() writes the shadow registers, loaded at the
+	 * end of the period.
+	 */
+	period_cycles = readl(pc->mmio_base + (state->enabled ? CAP3 : CAP1));
+	duty_cycles = readl(pc->mmio_base + (state->enabled ? CAP4 : CAP2));
+
+	pm_runtime_put_sync(pwmchip_parent(chip));
+
+	state->polarity = value & ECCTL2_APWM_POL_LOW ? PWM_POLARITY_INVERSED :
+							PWM_POLARITY_NORMAL;
+	state->period = DIV_ROUND_UP_ULL((u64)period_cycles * NSEC_PER_SEC,
+					 pc->clk_rate);
+	state->duty_cycle = DIV_ROUND_UP_ULL((u64)duty_cycles * NSEC_PER_SEC,
+					     pc->clk_rate);
+
+	return 0;
+}
+
 static const struct pwm_ops ecap_pwm_ops = {
 	.apply = ecap_pwm_apply,
+	.get_state = ecap_pwm_get_state,
 };
 
 static const struct of_device_id ecap_of_match[] = {
@@ -223,6 +258,7 @@ static int ecap_pwm_probe(struct platform_device *pdev)
 	struct ecap_pwm_chip *pc;
 	struct pwm_chip *chip;
 	struct clk *clk;
+	bool running;
 	int ret;
 
 	chip = devm_pwmchip_alloc(&pdev->dev, 1, sizeof(*pc));
@@ -255,23 +291,41 @@ static int ecap_pwm_probe(struct platform_device *pdev)
 	if (IS_ERR(pc->mmio_base))
 		return PTR_ERR(pc->mmio_base);
 
+	platform_set_drvdata(pdev, chip);
+
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret)
+		return ret;
+
+	/*
+	 * A PWM left running by the bootloader holds the reference
+	 * ecap_pwm_enable() takes.
+	 */
+	running = (readw(pc->mmio_base + ECCTL2) & ECCTL2_RUNNING) ==
+		  ECCTL2_RUNNING;
+	if (running) {
+		/* The bootloader may have left the shadow registers unset */
+		writel(readl(pc->mmio_base + CAP1), pc->mmio_base + CAP3);
+		writel(readl(pc->mmio_base + CAP2), pc->mmio_base + CAP4);
+	} else {
+		pm_runtime_put_sync(&pdev->dev);
+	}
+
 	ret = devm_pwmchip_add(&pdev->dev, chip);
 	if (ret < 0) {
+		if (running)
+			pm_runtime_put_sync(&pdev->dev);
 		dev_err(&pdev->dev, "pwmchip_add() failed: %d\n", ret);
 		return ret;
 	}
 
-	platform_set_drvdata(pdev, chip);
-	pm_runtime_enable(&pdev->dev);
-
 	return 0;
 }
 
-static void ecap_pwm_remove(struct platform_device *pdev)
-{
-	pm_runtime_disable(&pdev->dev);
-}
-
 static void ecap_pwm_save_context(struct pwm_chip *chip)
 {
 	struct ecap_pwm_chip *pc = to_ecap_pwm_chip(chip);
@@ -328,7 +382,6 @@ static struct platform_driver ecap_pwm_driver = {
 		.pm = pm_ptr(&ecap_pwm_pm_ops),
 	},
 	.probe = ecap_pwm_probe,
-	.remove = ecap_pwm_remove,
 };
 module_platform_driver(ecap_pwm_driver);
 

base-commit: 3f9bd3ccc80af2684cfc0901757f85a78358cbab
-- 
2.39.5

