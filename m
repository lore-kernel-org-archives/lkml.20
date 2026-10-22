Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792653280;
	b=ED3ubKej4TJ+92R9yR3WE3vNwYu/+3U0JPh8VuBRgWi/tU0p6BH7CaIwLzGSLlDv8Xew
	 dTmHHvhELphQdQvP18RjKbJsuL4ahisFCaAal1MUjGwtg5vEtUEAL7CI5LCYzF25OFAu0
	 9yc9eZIvLzY/i7dSkBZyz5rcr0+GBGMjmDNQEXeTnbhkBiTPBb+PCt/2aPfzQPTXECQzs
	 EoYiFFgnz2dGdk20t+HTPsv/LjT43CwviTckjPsd/lUR1K1B2m5pQlMFTV5wpnDqGyC0U
	 TfT9qKERUgHgTtf+U6xWmowgGffHrTARB0pjoGIV/IFmoisAIyY2sgjcz/y1dwuqzmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792653280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=t8ltOwjxA6KeKnGObAuyhyG+hzNLbLDdGdsDrm0q03I=;
	b=bdDnfMl3oFUOMwSIJBINBEfYcWgF9A4YgYMalTbRZBGLSducS96ygc7A3Gez16N43amb
	 67KzFmF1Hzl9AXYTBokoGK2Alg9aatmNsfwlTJQybbLJ+CPQBG3vpD1V0ulPyKZe0fNkF
	 3ei7d8amJcvDnABgI56fIV5WT5DLqBTEnd571lebnFAIOMLIhkHyHfnaHk67uW7RJfdA2
	 qjsokLJ9/vHXvDWxadPykk5qoBUKymLUtSXe4NGZUHnBIPAcVJ+z8HTN0b6p1gd7ud88P
	 QFjnnI03B9tVP7OKfi38AfTE+/BU6LzMK/CwpUtFhD19FkGyNT+DOHs7S4CFGgYArSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CfGCSdab;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84D4606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E84D4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CfGCSdab
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-181516de561so247382c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792653279; x=1793258079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t8ltOwjxA6KeKnGObAuyhyG+hzNLbLDdGdsDrm0q03I=;
        b=CfGCSdab2SO2BZvAkr8SlDMq+axi7u/ywHZv15FNsOpdUqbJSQQFIzb6Tn6UrvewUd
         rz4MziqbMsrTh1X6wZx8j/7+//73PcjF/+gMRaGxDo7V8pwDJ9+qUGvtlZQ6Py7wOrp2
         Mh7GYYO7o8wk7HWI38hcCKn5vAY4Miu7HhBzf1/d3XwVdYxaDe9O0pIWE738ZabjktQF
         yTmAINEJeOO/1H+LvfTVsUNkBOu9MltCB7XTTSvzZimNurGpwYl5m4MSDCtexlJtMBcY
         5Cip6/qeuAiuvTgK97HF6bjIsBfhoafSw5RAOeKIg4KCSnaTjQL0OPQNKHr5NE1TxKO5
         Rifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792653279; x=1793258079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t8ltOwjxA6KeKnGObAuyhyG+hzNLbLDdGdsDrm0q03I=;
        b=b3mpBrV7vm9cO8MTCmplwQMB6yUwv9K7h8uGuvT5BWCe78f/R6QkzUMVoi8xUrkUee
         k23dOlrlwEpOMbEwK9yugurHGfxwkNdlbgcBimaTgwOC61AXhqeZmvL3sa58h8d3ik6l
         ONvycC0GtB7bvfznWobPrOPWkm311AgdeiZ1dgowdoRtLxo0g2eG88TyTVVsddij8Sp6
         HA/2iV8UQ4pr07Ot+oz2q4oHPyLyakXoI9cQKsXUEyNc1O+FtURRnjzPnpG4BDIe1ztI
         29ojgQotB9EZyt3+TGieWLWNotvAtn019QotUFd1tgaqw+wyzLR1/zjUZ+wBDs/UqLnl
         aodQ==
X-Forwarded-Encrypted: i=1; AKwUvBySqFf4gK/cc1Yb7VtnRuAVC5yJDk3aPJJd/tiG1whJvT13PqNjzUB4Q8tVR9fsFhDX/Q8twh2W3tUx/VA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLusf8+fs+Sl5A6s6GE8wjATNGO1WpEVvcl/SDo4MYm75TvGCgB
	Dzbfw0zbIh3gLdpvD493dDKA354bCJV4IHkmLwxmmam38URoEfDvtf4BmsRB7uxCv2M=
X-Gm-Gg: AYBFou1B2sJVbXynyAFex6xEIbyfJf48Pd8ZwoyjH6jueJWYRdwqmkavzwgegUUWsQA
	GAsPQKXklU/SoAP+rjMbeestlai+DHL7ZF5/FM2PzV/KgsSOCZhG8hK6ZmJ3a+9FxMoNby3T0EY
	cF3CsyGLuxPmvoPATcdYW832cp7kj5XHNYi9YaputQJb2q0bOzNV9m1EmE7+Zj0R0AtWSYvjl/l
	X0J78rZ2XWfoUFttGv5YH7foM0TkofLMmas/wJG7Cq9KwRjYOIKnSg9jiP2JF9QJdJD6CqqkbYj
	VxGtDErHVVjjewmHJP/rOL4+yHoHrCSQkfTaPKNFvIEmTOABdKCc4yt5WdqT4cSK0hB04VdAFx2
	10pOnom6WSoXxI1poXRrQ0PRvn00m4T4YlZRIJQ15Bi92IvlsABQ6LTKFHZ6Bl7iR6gpGlIc62U
	XcBc+2EF11dUuktBP87KeOYSgE3NtMVLzS1ajtmi0H1Jy3rQY7MrBmQlvlw94Lp+9YD5KFCqAsj
	NPbRzl606SajZKDnbdE5n+nyw6r/A229w1pF5TV5gvCdQxS13tQ+g==
X-Received: by 2002:a05:701b:42d3:10b0:15b:1959:15e0 with SMTP id a92af1059eb24-192f2d2203dmr2161433c88.4.1792653279017;
        Thu, 22 Oct 2026 00:14:39 -0700 (PDT)
Received: from fedora-x1e ([210.89.35.119])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bd6b7ccsm11112321c88.13.2026.10.22.00.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:14:38 -0700 (PDT)
From: Saikiran <bjsaikiran@gmail.com>
To: loic.poulain@oss.qualcomm.com
Cc: rfoss@kernel.org,
	andi.shyti@kernel.org,
	sakari.ailus@linux.intel.com,
	hansg@kernel.org,
	bod@kernel.org,
	mchehab@kernel.org,
	vladimir.zapolskiy@linaro.org,
	jishnu.prakash@oss.qualcomm.com,
	birk.skyum@pm.me,
	linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v1 1/2] i2c: qcom-cci: Select pinctrl states during runtime PM
Date: Thu, 22 Oct 2026 12:44:17 +0530
Message-ID: <20261022071418.26895-2-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022071418.26895-1-bjsaikiran@gmail.com>
References: <20261022071418.26895-1-bjsaikiran@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CCI runtime PM callbacks only gate the controller clocks, leaving the
bus pins in their default state while the controller is suspended. On the
Lenovo Yoga Slim 7x, this can back-power the camera sensor through SDA and
SCL after its supplies have been disabled, contributing to brownouts on
subsequent power cycles.

Select the sleep pinctrl state before disabling the clocks so that the
configured pull-downs can take effect. Restore the default state before
enabling the clocks on resume, and return to the sleep state if enabling
the clocks fails.

Tested-on: Lenovo Yoga Slim 7x (Snapdragon X Elite)
Signed-off-by: Saikiran <bjsaikiran@gmail.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 873e901a23d7..fba5f664eeaa 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/pm_runtime.h>
 
 #define CCI_HW_VERSION				0x0
@@ -474,6 +475,11 @@ static void cci_disable_clocks(struct cci *cci)
 static int __maybe_unused cci_suspend_runtime(struct device *dev)
 {
 	struct cci *cci = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pinctrl_pm_select_sleep_state(dev);
+	if (ret)
+		return ret;
 
 	cci_disable_clocks(cci);
 	return 0;
@@ -484,10 +490,16 @@ static int __maybe_unused cci_resume_runtime(struct device *dev)
 	struct cci *cci = dev_get_drvdata(dev);
 	int ret;
 
-	ret = cci_enable_clocks(cci);
+	ret = pinctrl_pm_select_default_state(dev);
 	if (ret)
 		return ret;
 
+	ret = cci_enable_clocks(cci);
+	if (ret) {
+		pinctrl_pm_select_sleep_state(dev);
+		return ret;
+	}
+
 	cci_init(cci);
 	return 0;
 }
-- 
2.56.0

