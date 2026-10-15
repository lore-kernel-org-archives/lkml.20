Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39508518136
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792067285; cv=none; b=gqLzht2tXFuCK1cSbNrjunNEYuKYiITx74xC4xFORiOchzn2rj6AfZsCjr9LpuOpOGLfxEupXk3kmrutiIs/R6SF1LGzRjWVAE35t7LBkaysYsfFLVLP6EikcxXaqkYTORmz0SbOtMdXGcXU7P+j971entGLtSO9JqdtndCgz3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792067285; c=relaxed/simple;
	bh=vran+OpfJM2PZIrnH54mmVpNHHTv4PfUqJT7y9SsR8c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aIJdBJTr0od1MW4xucZBO5mhs+1hur9KfOEfMgF88wu1dZHMnhOTLm0SxQPssfpYnT1f0772298HI3MmWi3aKUb4hZXhUTycwywifj95jnjtPSqGSsF45ljHVFuH/z/Cc4FlQq+4pmRlxuVJEUwJTK9frZ1DNNXzyCIoyC/UGJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TGh3iqJE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kwa2iARv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TGh3iqJE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kwa2iARv"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jT0R2809323
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:28:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=H86NpSzFpRGKvjCwaNyeNi/MQuD7SkAcaC0
	WhWl0CdQ=; b=TGh3iqJE7cELOXn3ZNoA6LyOV9S9Np9XSr0Gw+u9ecq7EQxiv5Y
	q4RCRd7V7P4dR9+zOrEtJ4z75+v1ZiRvKR+THq5pBI1i5Afzx3xa3hh2UDtjGs7N
	KbRekCKV916o0EzHvzZHskX+1iwjGOL3oJVoK2rOja13BR+mGVBMz2g5sdhjQhI8
	VkRjEt6Jjd+QcXktQ0hlIW5WZBVTE5hEDHiZMCPlGVnuZL+9zJnNBcDLsTyxeWpE
	xiNaVHcCW8Qa3yQ6uf42B758cLvkWjO1fBilspbYOBv1ke1X2utAOvUvxDfrpGpr
	qLEdv28d2TfB+29SW8CEmdUTSd5Y/3sB7uw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54thsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:28:01 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so4914018a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792067281; x=1792672081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H86NpSzFpRGKvjCwaNyeNi/MQuD7SkAcaC0WhWl0CdQ=;
        b=kwa2iARvFggKWEv/e03sWJVNnmGkSKrljsSvuXlkgvXbzEHoMPAB7zawES3m4r26KZ
         5/GztdbFqc2X4CKdxZf/dsYPxZeuPSLiOFHWe5S9/O2vlnT6rtMTleLWsSTJCas/dmE8
         JPr//O0D01HOImdbdnJyRib976XffMAheVZxAjUP5AwVPaQjc2huLBiumlpQpNvbZSY5
         fRl8dppkTuFcetMslx73DDD15u3zA50jUk4e6GBc0QTJ5LDm/B9SsKn9/pRO/bUonvRQ
         +JD3EbpndCBMk1FQHT0wJh9ai7Wy07j50cuy/+LzArzK+4l0wKRNWLhOdGbiNHxM3az/
         VZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792067281; x=1792672081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H86NpSzFpRGKvjCwaNyeNi/MQuD7SkAcaC0WhWl0CdQ=;
        b=DflnFMmWUHFiAmwJOw9gIvpYR/KUReEqgbyYSVhtFYZyaMHAmmkxKFCzS9vFeHELFy
         iP4wpLThuFMv7ETYuPBZ6ZP6X/t9wRLpxlNf03T4ejkyi2RNJ1aGcpfQ9X0X0Gv+uDCM
         rex99eHFjRt+J5pS6aYBKhPtwKHQsNhrJGM2hJP0B9Tq3fqd140tEAZIrr6Cbh2UA9L2
         S17tm79b3lVrmVNWky0BLOY3lY43MeqpANMudDJ9RWvapEI5ZrtZ7KoZBy7YkC00NiaZ
         z+wfy1T7hPt7Nyz6PMkLuNXoNnq0Xjj0L37T94gWXAuILVbZbrC6i/8cJtzk7nLL7lfx
         SNCg==
X-Forwarded-Encrypted: i=1; AKwUvBy5bDE2u/cM7JuaJY95ep4vPCCIIgFA7QD72UN+VB1BrrHP5hJPAflgQWuyrxqGy5ncdwvU3U0dTheBuoE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgQcvFWKfuSnR7D0ZLaQcCOBzNV3McENBRwy9E4lz/CLm5zrLS
	wRbupZeN1fWvx4uPRGvh6T1Zo1YxmvFbtyGksX8fZjUbVD2TTRrrepDUHrgxIJRGbHm85XdgEsZ
	jXiBWNVV/lV+J6+NebarJjRSBzScC/XVpI056QiGaqmKGebJF/3dVdQDDy7pjl2lGtrA=
X-Gm-Gg: AYBFou0I7OOu/osK8jyCRlolHk624C3NQ9yVYhhW/ooMQjKOBLTG6zFoEOMZWEggD3X
	707hzomwsFAm5oMn7AvPZwf2V4feDtH99n42K13f8UrSZyKgt5aq1Rd0X9OygrbEls5fwWnIXgP
	9wdmgK9VfVlPAAwD67dBPP7Et1l34E/5FNBnSgbDSO2UDLrYVAdfaGIWbo/lrPI4+WZXCiTIDkV
	7EfNT4wGnPRhrRvMGRI7EYQAfSzjvOHiCkfQPVVyKrYjNYmOwiiZ0ZEVg39YY/qiPWM714s1NeV
	lhlgZuoU/0Cw9QJCZo6JsSs0eK+vY5wNdNXQxLGfoKcnybQQqO9Cq+2ZPdf7mGlla/Lqhb4E2OQ
	6xBUmreoyCGyMTFRCVxvK6YDSRjIB9aDkfL0hbFjWJLbMY5UAr7yZbm4NBto=
X-Received: by 2002:a17:90b:1806:b0:3ac:9a03:20bc with SMTP id 98e67ed59e1d1-3ac9a03275cmr2169481a91.47.1792067280849;
        Thu, 15 Oct 2026 05:28:00 -0700 (PDT)
X-Received: by 2002:a17:90b:1806:b0:3ac:9a03:20bc with SMTP id 98e67ed59e1d1-3ac9a03275cmr2169452a91.47.1792067280289;
        Thu, 15 Oct 2026 05:28:00 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd635c937adsm1202315a12.19.2026.10.15.05.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:27:59 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] gpio: shared-proxy: Fix race between concurrent first users
Date: Thu, 15 Oct 2026 20:27:40 +0800
Message-ID: <20261015122740.971792-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad0c6d1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=Sp4Y3lbv4_CS8mIV0RQA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0OSBTYWx0ZWRfX2/YD7+0F4yRQ
 nI3aGtP6wpf8uOUOtq7P1Xwee9Uug4DMNve+2gXMFVe0GsFe9BddOc2uuCmdLx2gkN8T9VAuumN
 vbLSEcCbOs++PzorkMKbpkP8XCdA+Rp59HiZDSnEzdORITxsaqK+aY76AtkGPtbzj0h2GZDG/LS
 +sscHWevCdgpRY6R3t3WKCcuXEsa012S51Ee3xWk8oXwBWpguZHknsIqDVDN3xAp1aUG+6J3Hyi
 geR5nUN6sKsHJwCifgFUbvdkX1g8sELrqYODRDT2eVUYps8r1bDp1tVzE80XAY1a+IAHr2YYPSq
 ltSPbIkKuiXPpBz9w+MqCTfUWbkZempr0/3/efOgRhD1Y6XCY+MBW6gctIhCz69e5uwbaNXI56P
 emulxBUJsNpTjLBKj8q+I1v4TE+NlLOKroOAFEdvkXVoSdSubKgZOxBW0oH1MRkcALKVhRbknNI
 2ZRg0Bri3SCU9XM35Dw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0OSBTYWx0ZWRfX79Ledv7QxH0k
 DhTXJgIF/Hq0UHYfiDGtpiAYPlU3q+tNtI1EQCmvKXFPNI7S8FYoB3CphhOxkw3CxR9HT9vAlVm
 YEKAYNfdziuHKqaKlyjQD8a6r0zhjk0=
X-Proofpoint-GUID: d1MyKIPDPqeuVrfkrBQ-PY-7ojBYxnsW
X-Proofpoint-ORIG-GUID: d1MyKIPDPqeuVrfkrBQ-PY-7ojBYxnsW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150049

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
 drivers/gpio/gpio-shared-proxy.c | 72 ++++++++++++++++++++++++++++----
 drivers/gpio/gpiolib-shared.h    |  1 +
 2 files changed, 65 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
index bc69b8729d19..0d9ef98a4229 100644
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

