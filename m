Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891A7435EEA
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789725543; cv=none; b=SPwZzWBEv67icH5/1guLgSbaD+wRe7438icz6ZSFLuEeHY5ClJEn/YrcESxtPPbTbnFkRqp4LPhoyyZgCK9da1diRa7Y0Y7JRY92l0S8NM3ZrzYIlAMU12jqV5U7x3y7rRgrQQy57BLw00Or+y8Wumlf6ggXeqfI4+0KypkFhYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789725543; c=relaxed/simple;
	bh=n0HXg7tXmsbGXZGGamFcz9YHIqQEGL8QRvKLk1jFEB4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=M6WQ8VH9bOVdC3jnBp/XHKwK5oEcn+cNcatCIHBxYgTGTT+ZD60KgBUMLzmqDlcrrD9ZLshUoOy4RV/7OxHP9H5R8UACFsYTUVWQRsrTkO+SbBCrEjx97XjB6wuGY0WNSi03otujfjiFs70ZV4v/rZ8OJCgwkIs0lIEOeP62Qs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJVbkk0u; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJVbkk0u"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398cb5615deso628723a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789725542; x=1790330342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uiB0cahIV1Yxwv3/Yp5e9hUqE3ZJJdbygUJdBb1agB8=;
        b=KJVbkk0uZHd7P6lZhHKT3mrc0S7s8f1HXTqtAt0Qvh8mHtmOtWykgoLD8vnJCVaE+L
         NBQSAtTleY6sJFSmcj+MV7jmZ9bWJqTt5Uj+9E3lyaiftUuwZmxvgqTs0VyqG9VKW2/R
         5wdKAitp9FKiE0eT0z3pGuf3bCO5WyMUcvVcvENV5sK0mpY3X0dWWIRWF9N2qJBwf4F+
         leG/HIUyPximkVesf0xB+Apfqcpfi2osLOWpTyABn1ej40G9dcgYZsBcHxT8Gc+kRcmr
         oZGL0QLWlXNhgbW64MuuiMcPc8rRfxOS+9jB91iiEw06X5owOuHshEcfFDOwgPPdUUoY
         oVqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725542; x=1790330342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uiB0cahIV1Yxwv3/Yp5e9hUqE3ZJJdbygUJdBb1agB8=;
        b=Wj1Hd5zMwnC1DQ5GXDtDtEZs5uoc2/MN7ImV2u689SKa9m0XvkhmSeScRa13w7ycI2
         iTnjEhERV3Ri5NqXeyqLbR0g4DL6j9uPzoob7lv2JPC9YXbehtwnFoNGxMSxwzggQqnM
         /WFa9MbOsJZvWS2AfICmPkFLVoEdmG8ApLQQyGe3s5qSCTzHRuuP9xIKVumeescJfnY7
         TRj2v6BL0DxXmcwXtS6DcxTg/1h4mEg4jMBSkoXXna9hmrQblAgDX8+TsGBwd9DLDSzT
         +Q6pKlobUfbyIWcrIZTaGuoBLu1Q3A9q6Q1Ty/JcTtasfTlEbyc95ueuRdwaX4g7f6Z+
         WoNA==
X-Forwarded-Encrypted: i=1; AKwUvBzQJSTmpMaFboLeSADkKCV8zoLop4LDCP6UMqIfFe8924IxKkIX5JnjQOZmIKptiIwpP0LP0mvkeMs+hZg=@vger.kernel.org
X-Gm-Message-State: AFuF++m0Z01vdxhjWnUDpVvJgcFdEAesQlrLoQEteEjtpRJHWzdbxhQ0
	YvHnUU31ms6UTKux5QN7EuhuODfQf+LNNYd5XrcKFkC3MoGgfOQeVsEa
X-Gm-Gg: AYBFou1OYKtjjvc9/fJ/oTjhiM0oVcf4wTcU6S7cMf58BzL1+Xyq4vXN8oI91gicmjJ
	xbRGSf9gL0ZqRZaOzbnMkZG+pY4R/p5c9a2I5bESKtosBGKPYK1gZ55akEcanEKjKtrvu2OT+eo
	orrX8jkQx04V5fNe2sUKANOXhMRho9SgNrS4ipUwwIvuCKZRDcSNe9RTvuoeaLWA4AjToipyATK
	Nu0qVpbaE+dessdbtREUlS5yEhxG6BE8aF2YxNDcyrwGLq5LVOCKD18JQnrLPjP5TnGh3zAbW9e
	l1L4Bz2/kYrapmXk7zKovxF8zsRSRVL1wO84SzQ0oxr3T/LU2N2zhtkvwnsNMO2LVFj2tXZS1qN
	tTOAx1TVmC38ZSxXjfnjmHSfv37eKkG2jztDLyTOJRa1AU0BzN2mjCuySXdJCf74m/RtLGFpVAP
	lu5ACg/PMnyv4E2+Gz/lm145lrNjcUi92Mwmkr7UOFjLTgJg/x35JnM869gUTv76CMxDPMhsyy1
	HjpT/cC8cZm2en2
X-Received: by 2002:a17:90b:2ecb:b0:39e:4c81:6c9a with SMTP id 98e67ed59e1d1-39e54fafb06mr5161757a91.32.1789725541791;
        Fri, 18 Sep 2026 02:59:01 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e59abb3dbsm2567700a91.11.2026.09.18.02.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:59:01 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Valentin Caron <valentin.caron@foss.st.com>,
	Linus Walleij <linusw@kernel.org>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	linux-rtc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] rtc: stm32: fix clock leak on pinctrl probe failure
Date: Fri, 18 Sep 2026 16:58:53 +0700
Message-Id: <20260918095853.1348694-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A failing devm_pinctrl_register_and_init() or pinctrl_enable() in
stm32_rtc_probe() returns directly instead of going through err:,
leaking rtc_ck/pclk -- and since -EPROBE_DEFER is routine here, each
deferred retry leaks another.

Route both through err:, and move the pinctrl setup earlier (right
after stm32_rtc_init(), before the RTC device/IRQ are registered) so
disabling the clocks there doesn't race a still-live IRQ.

Fixes: 16ad2bc09efb ("rtc: stm32: add pinctrl and pinmux interfaces")
Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/r/20260914135401.373D91F000FF@smtp.kernel.org
Assisted-by: LLM
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
Changes in v2:
- Sashiko found that routing the pinctrl failures through err: (as v1
  did) disables the clocks while the still-registered RTC device and
  alarm IRQ are live. Moved the pinctrl setup earlier instead of just
  moving where the leak was plugged.

 drivers/rtc/rtc-stm32.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index d4ebf3eb54aa..457f66663ba5 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -1137,6 +1137,20 @@ static int stm32_rtc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err;
 
+	stm32_rtc_clean_outs(rtc);
+
+	ret = devm_pinctrl_register_and_init(&pdev->dev, &stm32_rtc_pdesc, rtc, &pctl);
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret, "pinctrl register failed");
+		goto err;
+	}
+
+	ret = pinctrl_enable(pctl);
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret, "pinctrl enable failed");
+		goto err;
+	}
+
 	rtc->irq_alarm = platform_get_irq(pdev, 0);
 	if (rtc->irq_alarm <= 0) {
 		ret = rtc->irq_alarm;
@@ -1172,16 +1186,6 @@ static int stm32_rtc_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	stm32_rtc_clean_outs(rtc);
-
-	ret = devm_pinctrl_register_and_init(&pdev->dev, &stm32_rtc_pdesc, rtc, &pctl);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "pinctrl register failed");
-
-	ret = pinctrl_enable(pctl);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "pinctrl enable failed");
-
 	/*
 	 * If INITS flag is reset (calendar year field set to 0x00), calendar
 	 * must be initialized
-- 
2.25.1

