Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190923;
	b=0jGT8ukdLEyyN8b8YhF7ecp6Z+fiGtDAOqCXayma58wNJTkBMQeZrT/ZjjdTFGNT/miL
	 ZmbwbXEWnT0IznHHTgvB3wfaSZOkQ2DrNI54szWIYTP+KQOuEoRRgINhoKcNK3yT2C9Sx
	 6Nj3fFktHM+CD+0s5yJ5bShp4en0mEu9ku87+U+qFtq1sX/guTbJ3zEid7hFSe9qUoGS+
	 UpliEAelRY4/ChnBJ7LjvE6ze4YKHBf3UnOowQYn+YBi+vZg1CPr/njIh6UkGp8Zb7a22
	 Xf0/fsFhjvPQlV+OGCIXfn7PFAZloCW0NpfeuFXchXNJKAu/nkB+WO5Xi29HLkJcc6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190923;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=slFFczqOpjhrvLnkcpdd8nCGnHw5b/P+7bIMt84rEyg=;
	b=AMTVXsf18yzlS3Xx5/V7bkN2JcJhxuIoJmFp+Ep5FZE08mCB7pGWqJB7k+5LYTugpwcS
	 t4SP0TQvwDSsxeJZlk0cVvGVtV2p2EekkmmZOWb1PM4dlbi27Y1YYCUpBULAVym0X1JyK
	 jJCBOWRu/FBJwid4tpRP4c+2xifDRX+6pAwizl6cw/Mrou2ZK0LLU4mUbTN3bidfvCnq8
	 WWtOTV/QASh6zfLHn9zw/8h7McBSCtbs/kyCFmAFjKJIwMTd9HVLVuCKmX0+qJgL1JPwf
	 V6mH8I4rRcn4RAk8Y1Eu82tkOZV65NdvI9kec/NWRXRw+/3vRtYSeMVwZQ5M0PSM9LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BPfQFMX9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ivK4zsVw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D01606A321
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95D01606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BPfQFMX9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ivK4zsVw
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeDQd1539095
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:35:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=slFFczqOpjh
	rvLnkcpdd8nCGnHw5b/P+7bIMt84rEyg=; b=BPfQFMX9t++yS6Lcit3zbvYdbTG
	h8AXXu7UY2TyT2FKO1IYAloE7HGdp0u8+yctyY6SCAU5h1emC+7TrfUTY90zsKTp
	zHEL5dLYgko+FNrFc1tuyiBB+AieJQgRGlBTqLRz7af4lelLCKRyINqQbLS+Spla
	lS4iAXUEPFmtP1yd8oq6pVAi2UcVStXtbQIbIfC/CVmbrJeJ+sr+gPxiaznUUAvC
	R+8b9oH3FgJnua72qPYdR1sQ8XjKWeEP0FX5hI7lJvFOew5ascRW127DfHzB3jV/
	yUG4xwYHu2qt/6g1BUJ21I371lN6IK80cP+r9xU958C6hdlCVqA/mETIhfA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7rw0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:35:21 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a1e2485fdso2186913eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793190920; x=1793795720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=slFFczqOpjhrvLnkcpdd8nCGnHw5b/P+7bIMt84rEyg=;
        b=ivK4zsVwoDhW/G+EQww/jHbHRDE3/6d6Owt9pencPL+BPTutvbIY2oFVsNTb2Fz+0Z
         dXRJzZ311SdwyFBWyci+p0ZQ6CzF+d7A9DPaf6DcSz92kGTLQEjO4AK7tGUD88ezsOVk
         PA3qIwomCFVctfIq86OpBcq1ZKKigaK45yGzN2l6mH3xaJLd5kVmHeuqGqmwkbv+Icrn
         6neF0YZZj9duQD3DCA7D6Wylc/knGJqJT7lyaJITop96rq6JICCawhdFqgu9MeVtfsjy
         /zmkFNdAfkjDquLYL78a7VBx/xQFbrbxOGjvEsER7lX/ZPI73JWfVGjDchwn53k6WKWd
         mPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793190920; x=1793795720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=slFFczqOpjhrvLnkcpdd8nCGnHw5b/P+7bIMt84rEyg=;
        b=XECnaKMzvGEw4jL9tMOxSRk0dS1YdxYR5vxy4/dstOtfeA2CnzMDxatQeesUKiSsyI
         cU1oG785EUWfzmTngAbZv7F2zD+GiyKLemKd14uqG6u5Y7PzoBX7U2pK0vdcN81xE3UE
         ko86vnTdUmbPsjvm3pfmF8tEuwdQMjjNBgnwR+ZIytTBpCJtpVGTgtjQ7R6wDCytBwKF
         6k5HkWX1XYqqoM998msatUgiR8kXh7uY34E5luzw5FB4rBW5rTxHSIXBdJ05PaSPg9/J
         xKB7381BX8Q7DT7kgs9k7EBRiAGrDlqkuvyDLnqRGfQHZfOcGiqXSErYlLBS6VTBKFvg
         nA5g==
X-Forwarded-Encrypted: i=1; AKwUvBxDB4ORNZqEPTPBj3u5sTxOKCU+fQJrc20Av4EFBPmcDSnxgzzC/x5O7n7Na4k4drramNkcnZ3Tmb8geJs=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7Z9ywckqwd7YMjTCzKhhl5W9fff2IYM944F6OsMPdyOAM01My
	Xw0UE+zshccAadfAMf/y8n2m7ALnJiinYjXbJZ3fpyA6xEP+jnqzI4hQLJ/ATuglEU6P52FAwyR
	P27M5cLL0BS5Dx4ro6NSkb9q2yMaqFTEzIsUPqxFxQXWvDsh+Qc0ZWndjKsMS730vmuo=
X-Gm-Gg: AYBFou29yl7y3MK7siX3f1NhL8Du2xmSfa2w2t8jGFjCJcuekpb7y8Y7d032wjSMzcG
	MLd6yAsQhee8fDGGrHRMunaFWMm8UHVOU/jowFaCP51MOx5K7ziAkDtEMHxMsa+q1cfkYyWNoat
	d0QkldfAn6ir63emeeagP36e8gUEeKSRzALRyZSqjYpIwxoTv2j6Wx74vC/bMJc3uojfgOYsWUj
	b5uM449FGFQpkH5iF23lMXv//9znOsNDcuIs2zma+Hhh1ahqeoJ3+Mp4rakDAc5EODWvuUmGPja
	c9GYh3vgaYqOPchtBYyqWGHyEyczfbkVMSENlAhKUCVNjXdMgq+W9iaKi5qpbyX3znIOP1M3nS8
	IXtDXpEvawXSaFR7Ya3KxpIlWlen7TOq2Zm9NGAxid/jpLRdXEe9H/3aLFQsC5dguXCV7FSL0mE
	I99zJOXC9rDjBkC8kn2YuxVz/uo8lRTqRG
X-Received: by 2002:a05:7300:f3c1:b0:369:f9c4:1fda with SMTP id 5a478bee46e88-36a203e2a45mr3377367eec.27.1793190920276;
        Wed, 28 Oct 2026 05:35:20 -0700 (PDT)
X-Received: by 2002:a05:7300:f3c1:b0:369:f9c4:1fda with SMTP id 5a478bee46e88-36a203e2a45mr3377316eec.27.1793190919487;
        Wed, 28 Oct 2026 05:35:19 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239644efsm10015881eec.23.2026.10.28.05.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:35:19 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 1/4] gpio: shared-proxy: Fix race between concurrent first users
Date: Wed, 28 Oct 2026 20:34:45 +0800
Message-ID: <20261028123448.510401-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028123448.510401-1-shengchao.guo@oss.qualcomm.com>
References: <20261028123448.510401-1-shengchao.guo@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae1ec09 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Sp4Y3lbv4_CS8mIV0RQA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: h8kV_fC0_FMMDw7iddz62-cX_UleopT_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX2IJJznpsbhGf
 yDeWAy7QblwaZSJTJ9EWXFCeX/Sn/6q1gLWavFBsAg4Dt+5FLDd/AE1HHVfC/dJvWEF6a63gsIB
 41fKJV1dtbMZVAvKyN0p9mn9qSOFtrI=
X-Proofpoint-ORIG-GUID: h8kV_fC0_FMMDw7iddz62-cX_UleopT_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfXw5oKd9JDBPj6
 zzVfIeGMA0FCy8fBwwqr4xGYCQc2qsDlztU7ZWH1w3InYvMO0xZalrsocIa4tOcJBfY/krphpHt
 D2XR3QwqHhl/Oio0f0fOoxVGgfB+juWOCMETjMS5qi1R308AK2KZt8sSL7JmZvWdngMw9iOVVD4
 61wLsD7oH200ds0NV0cmgwtLUlNjW/Hddey5PBLz5mCaEQCpW6nEO/SHQGW397xok6F0MOtML5h
 00sggtjv8nQccYfrciJv3naby4SjdLa0+fFwIWw20Mm2o8kxsG2EK1ep+b3JvvebKFOd94vE9p3
 aM4BnYdV0f1qlgFWXusaOnP95S/IjVEu64BD/w9NrBjOohLFCDY7QzcgoJoqpHPbg+3vYV5Eky8
 0ACDHI/Z7pdsJ7lEDa4+mMgEr6YoM/3VOCNg6MFiLlSHSIm6RphzZhgF/FN04idV1xD0Z1sWtED
 KyZezUN75juLEGyYBNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280050

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
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/gpio/gpio-shared-proxy.c | 78 ++++++++++++++++++++++++++++----
 drivers/gpio/gpiolib-shared.h    |  1 +
 2 files changed, 70 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
index bc69b8729d19..2e9ccd8a8d83 100644
--- a/drivers/gpio/gpio-shared-proxy.c
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -21,9 +21,37 @@ struct gpio_shared_proxy_data {
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
+	lockdep_assert_held(&proxy->shared_desc->mutex);
+
+	return !cfgcnt || (cfgcnt == 1 && proxy->configured);
+}
+
+static void gpio_shared_proxy_mark_configured(struct gpio_shared_proxy_data *proxy)
+{
+	lockdep_assert_held(&proxy->shared_desc->mutex);
+
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
@@ -117,6 +145,11 @@ static void gpio_shared_proxy_free(struct gpio_chip *gc, unsigned int offset)
 
 	proxy->shared_desc->usecnt--;
 
+	if (proxy->configured) {
+		proxy->configured = false;
+		shared_desc->cfgcnt--;
+	}
+
 	dev_dbg(proxy->dev, "Shared GPIO freed, number of users: %u\n",
 		proxy->shared_desc->usecnt);
 }
@@ -131,7 +164,7 @@ static int gpio_shared_proxy_set_config(struct gpio_chip *gc,
 
 	guard(mutex)(&shared_desc->mutex);
 
-	if (shared_desc->usecnt > 1) {
+	if (!gpio_shared_proxy_may_init(proxy)) {
 		if (shared_desc->cfg != cfg) {
 			dev_dbg(proxy->dev,
 				"Shared GPIO's configuration already set, accepting changes but users may conflict!!\n");
@@ -155,15 +188,21 @@ static int gpio_shared_proxy_direction_input(struct gpio_chip *gc,
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
@@ -176,6 +215,8 @@ static int gpio_shared_proxy_direction_input(struct gpio_chip *gc,
 		return -EPERM;
 	}
 
+	gpio_shared_proxy_mark_configured(proxy);
+
 	return 0;
 }
 
@@ -189,18 +230,20 @@ static int gpio_shared_proxy_direction_output(struct gpio_chip *gc,
 
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
@@ -215,7 +258,13 @@ static int gpio_shared_proxy_direction_output(struct gpio_chip *gc,
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
@@ -230,10 +279,21 @@ static int gpio_shared_proxy_set_cansleep(struct gpio_chip *gc,
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

