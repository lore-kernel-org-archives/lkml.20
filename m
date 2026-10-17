Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AF63C1D59
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792211800; cv=none; b=Yyn3stYralbv4HIngTZUwBSwCfLYLSAyt6sYFwFC279sh1Hp4zh3WQEZYIVsBfy+cEzIg9O5t8tq798nt/c3L2cHp6HnT4yvIJAHH6ydrXfzgzID+4pq3crgF+2xzFg31HzQ5NwbT/Lfgiy60wXJ5yfjD7Wr23n0O7/ZDYEPIyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792211800; c=relaxed/simple;
	bh=T05qU3QP38O2C/gkrcm6SRVlPYdACpGqdMD1WnF8jI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lk0/9+O95OdWTOZJPrs0bdgvCs92FuqVbvsS/zP2N/aO7sggbKy6XHKnJVB8jc2hfAedYOxfuyMGAkpCeE3sO9ukbpDmKTSgOImqvbQkz0N5Cv3KTo4R6VOfqc2Wrt+0QuRr3WgzstzEnNOeo8dejtIJT+7mTXwXh/iTL5OKGuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O+Fa2E54; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H+pRFb1b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O+Fa2E54";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H+pRFb1b"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H310GT942865
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:36:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ApuLXzOKhLv
	eYlVUddCl2eITtzV0C5lAoBiRTgJqkhY=; b=O+Fa2E54y5xOUlqS72RXOq6R7x5
	9uVTSXGVvj++suz5ZwLv510fnwOgxc6jx25xhDr6F2cWzV/x2WtdShzr0v1xtKuz
	amJLLJnrNbXufAj7Abcugd70G9RMrPMxbF3bhFWCgfuvF8GUvvGNMVivA+db+W6w
	PGQ8ADNhcEGQtxRu1JMAHZTlfPAppCWS2mN+a/egXzzYwucIvlVmPjmpqz2xrwd+
	7umj/CQVDS4s26UKJft5VlTuUFlHw+m+sNdnZZcClIzvNzdnGmigUcyH4NdNkFt6
	yDiqUBAG6T06G4iwHMbDQLX3kBL6WOnT8R23vbXx5cehCSHUi4y0r+St1Dg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbyys087q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:36:37 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-154e9d2d94fso1635399c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792211797; x=1792816597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ApuLXzOKhLveYlVUddCl2eITtzV0C5lAoBiRTgJqkhY=;
        b=H+pRFb1bJbczApsq57d3ANNf/bsc7pQfk3BsvYtm95/ay77Ipq9t/Ez9QRF2DKiMMc
         uc6o8I9eF1BEDAMIC3q+c5vHDqJfyxSXUqKfOi8yH/WypLv6v3IsG6ud7jNkbK4L0y7u
         HwmgGHmThnD4FDo2l91IxAdC1sk+FYWeL5Z52VuRucKGp2RFkl1i9RzXGXS0tAXbYzzK
         NoBdjFJ0Pn77hd7w98aSrAA4tpZMaz8L8uZUsNxZdRPHbUT50YiO6UDwYK5CCUWZ+Vry
         2qXvYBB/UmNwik+ThX/9i2uo9J8SgXvHUZrg7Qf6GrPuxvMZoC5DbbjGxZjA4HdMll8c
         eYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792211797; x=1792816597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ApuLXzOKhLveYlVUddCl2eITtzV0C5lAoBiRTgJqkhY=;
        b=N/8a3o4MSH9XAvARWNZ/yag3TSRW0N1Nus/OaAQIm0xIBIZdXHSF7E5eto5z17Cejm
         TzFGLSRSk1k1vZ2l0lxEfo6iD3CSyeusxTwmbaQ2r51+FSc3RdWqGsLRyybNxeq4N6xN
         7Pf7LaA5LswK2iL3l4H6UkKY9Oe4+rUquCG9h4vIN2KvrA7//3ueRoDbf6pjF2aONB0i
         GyHCEwGezIlK6JI8GxCuaWXwbWfttUxOKKbsg/CVmoC+4wsgQU7Q6V8I1TOWVrKHXCS0
         FrjUlqaiabm6bYGS4Vpu0jLvvcUeVyqzJ+MT1jByfVWOER1Gs/85E3/TOGAazc/ifaK9
         jqCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzp1XREfpHAxsUFy+aBCfcmoz5HOyfRC4V1OOZOxPjx7incdO7k/UJoS+tHfXRisXqmTSJQGAn8qXnuqHE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJP12mh6x7DGg8yaaIwWAPgXIh+zvvE8d/XfyvDgHrackoWr7nq
	5X3+L0Jaco/CKOk80Lej9tHeou3xwHGDyEwoCW9whaDoEwf9hZTGfP8UJNaPm3nZAqQCO7ktPZZ
	CoXKYPr2FefaZB/KSdTKnBuT+Qku4B7CFbbsbHZn+Tzfi7eAWl2gFqC0HUwnaRxpdsuk=
X-Gm-Gg: AYBFou1XhAiZXdkRl6jr28bxhBxP0A2iLpz898liuHunNdfi3u0S0hZj6j6/SbH9m+N
	FTj6sUiqPg5tBV6VHko1poLk9gVx8mpLHzR7/y6JqB1fhon8NUn+Xy3WrqJ1stDxSHuBUD0Z2iN
	vUHhxT/j6L2mmt3KJWMHfgKzPw2/ljkngCeyb34Kb0FhekaV7vLHuLPjsxTfFVfelBP2iSMuRef
	l/3X7kIPJHgtfK0H0LFsFK3TneIxnnysGP4yHtoGCjTQ/PQMeSRrciMUvuhfBmtHieHH8j5uL1X
	9RvfF2DRSDZyNCizvpvScq1yxYpOaca694qksJvnnyTZ/YuHmyOqS+rsQoZKTWPboB5QsD1eyAQ
	q41CUjRW5YHCOFWMxRmzE4aTHj+CM5ndIbGZdrOkh88uEO1BK+EzC2nSvyEE=
X-Received: by 2002:a05:701b:458e:10b0:151:5d01:9316 with SMTP id a92af1059eb24-18512f1d08bmr2587105c88.23.1792211796663;
        Fri, 16 Oct 2026 21:36:36 -0700 (PDT)
X-Received: by 2002:a05:701b:458e:10b0:151:5d01:9316 with SMTP id a92af1059eb24-18512f1d08bmr2587074c88.23.1792211795982;
        Fri, 16 Oct 2026 21:36:35 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm9771425c88.5.2026.10.16.21.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:36:35 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v4 1/4] gpio: shared-proxy: Fix race between concurrent first users
Date: Sat, 17 Oct 2026 12:36:02 +0800
Message-ID: <20261017043605.1503563-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017043605.1503563-1-shengchao.guo@oss.qualcomm.com>
References: <20261017043605.1503563-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxOCBTYWx0ZWRfXzHmpJ0gQqZvW
 ewjm42ltCWvwJ41dwEunS+x45a9t1baeKnYJmaULiNDFrVV1+T+WQKqnHnRRXYmeM4y8LVyg4rH
 JKP5R/V1dpmR6ipceFTfaaegEJhaZE4R8Hxq3/PvfUzj3RcXzKyocN+5jQlxCbdOjtlJkyiR+/b
 0B/ZcjBBoBL/76+ul0cFKOpOmstwxIgr47/JLWyzRsDNanj/0kPfgb5XBC/BYQYWl3sehlGa9xG
 beY5UDcH4xvpeIAyYN6u805yWUbQwldcIOv3DIGFpNKb7xvdNykwKMG8Li0wV7Pb0PHkk9yZa5r
 /O26dhJF/32KsPR+1A6Xz1NSL7aQJYG+PsEVlOFI6FaCfTKO0tzE8IYc5RnVwHF9E/Qj1w3a+N1
 G7RcA6CXhmeRbUJrR3WLQ6AVtIGF7ekV9ACjvrgSLIEkOq+mcDkITy5eWtKWzDz1ogUZjfTawWI
 YWOBPHWkMHRJiV9CD4A==
X-Authority-Analysis: v=2.4 cv=W4WtxhWk c=1 sm=1 tr=0 ts=6ad2fb55 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Sp4Y3lbv4_CS8mIV0RQA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: sKKwarH7yNThQTCWGeI4pOqZIXLSwxJE
X-Proofpoint-GUID: sKKwarH7yNThQTCWGeI4pOqZIXLSwxJE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxOCBTYWx0ZWRfX71LjIAo8qH6q
 42FxbR1OgjCGnmHqtXy4Ws9HoV13GBXmlIGc0bobcDMWd8MpaT2RukxqLVudJdZgDM9Pj0SxwNN
 /clOxkIMOrXYCEK/6vn9Nw5SwFNaIP8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170018

The proxy lets a consumer set the line direction and reset the
default value and vote tally only when usecnt == 1, i.e. when it is
the sole requester. But request() and direction_output() take the
descriptor mutex separately. When two consumers probe concurrently,
both request the line before either configures it, both see
usecnt == 2, both fall into the shared path, read back the still
unconfigured direction (input) and fail with -EPERM.

On Nord RRD the two DAC supplies are reg-fixed-voltage regulators
sharing tlmm GPIO 41. They probe asynchronously and intermittently
both fail, leaving the codecs without supplies:

  reg-fixed-voltage regulator-3p3-dac: setup of GPIO (default) failed: -1
  reg-fixed-voltage regulator-5p0-dac: setup of GPIO (default) failed: -1

Requesting the line is not evidence that a consumer has claimed it.
Instead, count proxies that have actually configured the line (set its
direction or voted for a value) in a new cfgcnt, with a per-proxy
configured flag, and allow (re)initialization only while no other
proxy has done so. A consumer obtained with GPIOD_ASIS that votes via
gpiod_set_value() without ever setting the direction counts as
configured, so a later user can never reset def_val/votecnt behind its
vote. The count is dropped when the proxy frees the line.

Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/gpio/gpio-shared-proxy.c | 74 ++++++++++++++++++++++++++++----
 drivers/gpio/gpiolib-shared.h    |  1 +
 2 files changed, 66 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
index bc69b8729d19..0d1d724a6a37 100644
--- a/drivers/gpio/gpio-shared-proxy.c
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -21,9 +21,33 @@ struct gpio_shared_proxy_data {
 	struct gpio_chip gc;
 	struct gpio_shared_desc *shared_desc;
 	struct device *dev;
+	bool configured;
 	bool voted_change;
 };
 
+/*
+ * A proxy may (re)initialize the line - set its direction and reset the
+ * default value and the vote tally - only while no other proxy has set the
+ * direction or voted for a value. Requesting the line is not enough: consumers
+ * may request concurrently, so counting requests lets every one of them
+ * conclude that it is not first.
+ */
+static bool gpio_shared_proxy_may_init(struct gpio_shared_proxy_data *proxy)
+{
+	unsigned int cfgcnt = proxy->shared_desc->cfgcnt;
+
+	return !cfgcnt || (cfgcnt == 1 && proxy->configured);
+}
+
+static void gpio_shared_proxy_mark_configured(struct gpio_shared_proxy_data *proxy)
+{
+	if (proxy->configured)
+		return;
+
+	proxy->configured = true;
+	proxy->shared_desc->cfgcnt++;
+}
+
 static int
 gpio_shared_proxy_set_unlocked(struct gpio_shared_proxy_data *proxy, int value)
 {
@@ -117,6 +141,11 @@ static void gpio_shared_proxy_free(struct gpio_chip *gc, unsigned int offset)
 
 	proxy->shared_desc->usecnt--;
 
+	if (proxy->configured) {
+		proxy->configured = false;
+		shared_desc->cfgcnt--;
+	}
+
 	dev_dbg(proxy->dev, "Shared GPIO freed, number of users: %u\n",
 		proxy->shared_desc->usecnt);
 }
@@ -131,7 +160,7 @@ static int gpio_shared_proxy_set_config(struct gpio_chip *gc,
 
 	guard(mutex)(&shared_desc->mutex);
 
-	if (shared_desc->usecnt > 1) {
+	if (!gpio_shared_proxy_may_init(proxy)) {
 		if (shared_desc->cfg != cfg) {
 			dev_dbg(proxy->dev,
 				"Shared GPIO's configuration already set, accepting changes but users may conflict!!\n");
@@ -155,15 +184,21 @@ static int gpio_shared_proxy_direction_input(struct gpio_chip *gc,
 	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
 	struct gpio_shared_desc *shared_desc = proxy->shared_desc;
 	struct gpio_desc *desc = shared_desc->desc;
-	int dir;
+	int ret, dir;
 
 	guard(mutex)(&shared_desc->mutex);
 
-	if (shared_desc->usecnt == 1) {
+	if (gpio_shared_proxy_may_init(proxy)) {
 		dev_dbg(proxy->dev,
-			"Only one user of this shared GPIO, allowing to set direction to input\n");
+			"No other user configured this shared GPIO, allowing to set direction to input\n");
 
-		return gpiod_direction_input(desc);
+		ret = gpiod_direction_input(desc);
+		if (ret)
+			return ret;
+
+		gpio_shared_proxy_mark_configured(proxy);
+
+		return 0;
 	}
 
 	dir = gpiod_get_direction(desc);
@@ -176,6 +211,8 @@ static int gpio_shared_proxy_direction_input(struct gpio_chip *gc,
 		return -EPERM;
 	}
 
+	gpio_shared_proxy_mark_configured(proxy);
+
 	return 0;
 }
 
@@ -189,18 +226,20 @@ static int gpio_shared_proxy_direction_output(struct gpio_chip *gc,
 
 	guard(mutex)(&shared_desc->mutex);
 
-	if (shared_desc->usecnt == 1) {
+	if (gpio_shared_proxy_may_init(proxy)) {
 		dev_dbg(proxy->dev,
-			"Only one user of this shared GPIO, allowing to set direction to output with value '%s'\n",
+			"No other user configured this shared GPIO, allowing to set direction to output with value '%s'\n",
 			str_high_low(value));
 
 		ret = gpiod_direction_output(desc, value);
 		if (ret)
 			return ret;
 
+		/* Only this proxy can have voted, so the tally is ours to reset */
 		shared_desc->def_val = value;
 		shared_desc->votecnt = 0;
 		proxy->voted_change = false;
+		gpio_shared_proxy_mark_configured(proxy);
 
 		return 0;
 	}
@@ -215,7 +254,13 @@ static int gpio_shared_proxy_direction_output(struct gpio_chip *gc,
 		return -EPERM;
 	}
 
-	return gpio_shared_proxy_set_unlocked(proxy, value);
+	ret = gpio_shared_proxy_set_unlocked(proxy, value);
+	if (ret)
+		return ret;
+
+	gpio_shared_proxy_mark_configured(proxy);
+
+	return 0;
 }
 
 static int gpio_shared_proxy_get_cansleep(struct gpio_chip *gc,
@@ -230,10 +275,21 @@ static int gpio_shared_proxy_set_cansleep(struct gpio_chip *gc,
 					  unsigned int offset, int value)
 {
 	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
+	int ret;
 
 	guard(mutex)(&proxy->shared_desc->mutex);
 
-	return gpio_shared_proxy_set_unlocked(proxy, value);
+	/*
+	 * A GPIOD_ASIS consumer may vote without ever setting the direction;
+	 * count it as configured so a later user can't reset its vote.
+	 */
+	ret = gpio_shared_proxy_set_unlocked(proxy, value);
+	if (ret)
+		return ret;
+
+	gpio_shared_proxy_mark_configured(proxy);
+
+	return 0;
 }
 
 static int gpio_shared_proxy_get_direction(struct gpio_chip *gc,
diff --git a/drivers/gpio/gpiolib-shared.h b/drivers/gpio/gpiolib-shared.h
index 618756f6c6aa..ae10506b7029 100644
--- a/drivers/gpio/gpiolib-shared.h
+++ b/drivers/gpio/gpiolib-shared.h
@@ -41,6 +41,7 @@ struct gpio_shared_desc {
 	struct gpio_desc *desc;
 	unsigned long cfg;
 	unsigned int usecnt;
+	unsigned int cfgcnt;
 	unsigned int votecnt;
 	int def_val;
 	struct mutex mutex; /* serializes all proxy operations on this descriptor */
-- 
2.43.0

