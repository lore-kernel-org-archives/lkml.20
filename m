Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F18549B21A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591565; cv=none; b=drOEGcqpVrRS3oxRBZ0ZqnYINIQXAVw/6yG4inf5ibLAzVVq5WZ1p4J7qIhWjgPak6omIUEZMZAbVu68osPM+CkRUJrufXYNhn8d9utRoVhNItp7d8sZQOLghCnlANH3Qz3mWpc1RNP7gISFGjjHWZN0GIbEfaEKx1VZtlX5dIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591565; c=relaxed/simple;
	bh=uQCY430sr+tLzl8Kj+Kx95MA+8DZUQ/avvNyxW8VYqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=crQal2CPUmQC7bNBkd9kYUI3X54WQplHpqtGGa8AA3/JZ9ayWwHWIO3Qu/oWSw8OGsBuw3iehafqvXylz86BvcXVhVPBlloFMswDrp/PDu097vpBswuqMgLDh3JzhoEvCFOgbfq1qrEfEVWH+ZMfEc0GKDEgjc7rEidiQy/nMCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f9ZalQe5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AUeml6hi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f9ZalQe5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AUeml6hi"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9MHQL1212677
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:32:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IxXInWQ12PwBUIuesNS7873bVZYMXa+rPQWVXGdwPhc=; b=f9ZalQe5daULOehu
	D6hsgWYy+G5zkgrlJKJ6vPmoib9PiwfjaP4PgXJsR/OZLgINS2vzUX9TxZGUhc7q
	tAH+9yw+cUy08AUWDaH6dIlgqNggrgRenptayK5I56JsPjquMPGSCKvkpVDoaPkV
	QjPgBdhOSdkgfGMYXYVWSNKIc3vpjM8zq6//taAn1dsg7CoNLcLkYhYPhNmwDzOb
	KAcFSziI0w6MyZ1scdA0wcT4I7ovc0QvkexPklASTW0DzQr14bX4OeDBZ1Ru5mUy
	hN5Qd3QP3nKh7u+ID6Ab0o03LDe3bbz1HE0PF6SeNCH0nANVSNy3ZMKEqFCrk2AO
	+jJCtA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjkxh0ht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:32:42 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dbf293831so4482205a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790591561; x=1791196361; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IxXInWQ12PwBUIuesNS7873bVZYMXa+rPQWVXGdwPhc=;
        b=AUeml6hiIXPrB38Rq+aXmX4NFk0KGVtqh0aKmY3QWWNhInexX+suW+kx2jPvgZYuge
         Sl0mMefOENBTuTEJzCrhyHkoKCBSQeib6hFTk/+tLyt0P1K6Uzg18OD1FPK7oJNLs9cN
         u+N5bz7J6KGHusILgapMIECx7I7r8Lt3pqyYbn5O3Q5KmA01r5FImmeAsitG14PNj9jF
         bqcXsLJMCbVJn0AXzgD7pDcM5tw1P9zcSoJVBmxWyMzaa+3ybMWoDssuxc7X1+jUdlfg
         ICV1Lc1bo4R7kMFBLDh7gM72kDiIHh1uUKNxIoRYmZYON5hQk9I2eh8ZSq+6kvQKr1sk
         jnVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790591561; x=1791196361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IxXInWQ12PwBUIuesNS7873bVZYMXa+rPQWVXGdwPhc=;
        b=DX7J9im666bijN03BnZBJjdyJDYheSmGi/kCEHIg3Gk98DMQoAEmumE/cUyK7QBdF0
         LQiatnboND20E4yjnxRp2RIDaedFmZcgulzLPoQma1oQNxvs/Ho3nTFuHfyijYCiB3aM
         mYqTviP7+cgQre7RgzZWKNblpKUbNwAGzZ8Fx3+ol1YGN5lPqB12sKtOh8NMy4w44GFA
         tIxVSHmyhhsfMNYqCkUlHcWeuQV9A8S3dMrrNxsyF4ixwNHW2PHHuBz5zgAbqQg0e27e
         zZvcnNCnuNiTSe/jmEedE/OFS9znRUfnaotoL8ia81iN+GpqK+arXx6BnRG/NsdmwDH8
         rH+w==
X-Forwarded-Encrypted: i=1; AKwUvByYXM+bS0kL2STjANFokZ1OfjqQ6Y2X2gdyiJqvBMDv0WsIzqEBuR0Xvwya5QkfCZbRWtPrN7OBmJzs3aM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbsjKS4s16p7rmKrzhVd9NXfuQGjKB/czSrH66tal6jfGzHaus
	43R8deXLDutigTUP5puAdHZP3XjPNZYEqKgUfStrzFN7/h7tzBoOzHd3OUdpw4zvThXXU55eDCU
	vpVBHLrMID7BMW12c2fJzNz8mcYyK47wzvoVW39LN7L4ZIaaWbO3evxS/+eGp0k4pZQY=
X-Gm-Gg: AYBFou2hemv3J+E5Rks7CCspd4yf0Lt7k8YwyaXH7xbHEkVbErEjMV2EWHLxoWzCfL7
	a0BTdxIyY7dQj1CJ1PvLE8dhJowLSicArAhbtgVf9Fq9gyA7RGBpzY4t6AmfVPHfk53O3vGbSUq
	0+t2xVK/t0MUd6ksHfutEqtZxhDhAe6CdUznvOpBcadU9WRPsiWWtRGD4TcEBXWI7Zsa/BIf3uD
	df0rTQxDHHpddU127pVIWfOq6B5JY8YIOB6lpahKz/OaGq6kJqQIN66iBNUvRmIwBOcT+pImTEs
	INxsOT9JjUnE1mCAVhoxD7ZHWxl3VSUOcKfqryLjVoJXJdsuWPocZe+SzrJt74iFwl5nBAph/rq
	XHMHC0NhjDIVyMcp5QUI2UHy6/X8=
X-Received: by 2002:a17:90b:4fca:b0:3a0:910e:84aa with SMTP id 98e67ed59e1d1-3a098d45437mr10335181a91.12.1790591561108;
        Mon, 28 Sep 2026 03:32:41 -0700 (PDT)
X-Received: by 2002:a17:90b:4fca:b0:3a0:910e:84aa with SMTP id 98e67ed59e1d1-3a098d45437mr10335152a91.12.1790591560643;
        Mon, 28 Sep 2026 03:32:40 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efaeb3sm19885131a91.2.2026.09.28.03.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:32:40 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 16:02:19 +0530
Subject: [PATCH 1/5] ASoC: codecs: lpass-rx-macro: manage clocks in runtime
 PM
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-xo-sd-runtimepm-v1-final-v1-1-e3ebade3aeb7@oss.qualcomm.com>
References: <20260928-xo-sd-runtimepm-v1-final-v1-0-e3ebade3aeb7@oss.qualcomm.com>
In-Reply-To: <20260928-xo-sd-runtimepm-v1-final-v1-0-e3ebade3aeb7@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-GUID: ZOsc6l6Inn0k8QZY1ECVPHU1Nw3_DU3V
X-Proofpoint-ORIG-GUID: ZOsc6l6Inn0k8QZY1ECVPHU1Nw3_DU3V
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0MSBTYWx0ZWRfXx07aLgP2sQ+K
 vzt89rEzzOQlLzYxgCjeOuMRYrQbKNEcHYdvRNBNVFWG97j+KwZPEUNml9o2ikQLpkJfxFY1wwQ
 zwOmXXNzGKT5pGNjkPncNQ9fIU7uh1M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0MSBTYWx0ZWRfX/lppKg1tX6rl
 QX70WHRhEh57Z0fj4EFANZnFFCiFiyrcBPT0P9hc1+giB80NN5rgnAHw9TVZ+f+13VW4J413Oa5
 f9ip88xAIcK63DlASU2f81Klp8j3oPIV1RBZ6gsdGQa7VFos7ynormEr3+AY7plvhhZpZnDaixk
 1BGFZJA71PX9PA9WebeEbPmv5IjilV5b7zFAQsDCi2l3Nut4OxVvH0UHZ61yEC4BLplgu6AqVXL
 UePeqTuMzvFLMSe+WJ51Qupk2rerR9PjXBgE53BzVHC0inMAcW9xkdbu1r5MkXTzJ441g1QBn5L
 ADwQurxX7boBXRSNPl2vDeYVOVcnFz1xQAYwYvttp0RDJ5uPivK6SDTUsd77fcwt7AJYwQpwnet
 hGi7AAM6C9P40FYBUnV2MilZHBBslgYPOaFZ6wsmTiHGAzQHFNpyKwWNBtcktKTPndpJm6i4l2S
 4gF/c7lH5DP4ol/FHvQ==
X-Authority-Analysis: v=2.4 cv=QZfzLcbv c=1 sm=1 tr=0 ts=6aba424a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=vRKl4pPlyU-_FhB86j4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280041

Replace PM clock framework usage with explicit clock prepare/enable and
disable/unprepare operations from runtime PM callbacks. This keeps the RX
macro clock prepare state tied to the runtime PM active state, so idle
suspend can release parent clock votes.

Use DEFINE_RUNTIME_DEV_PM_OPS() so system suspend forces the same runtime
suspend path for an active device.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-rx-macro.c | 74 +++++++++++++++++++++++++++------------
 1 file changed, 52 insertions(+), 22 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index c41eb8de6160..3cfaf4fe0ab2 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -6,7 +6,6 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
-#include <linux/pm_clock.h>
 #include <linux/pm_runtime.h>
 #include <linux/clk.h>
 #include <sound/soc.h>
@@ -670,6 +669,53 @@ struct rx_macro {
 };
 #define to_rx_macro(_hw) container_of(_hw, struct rx_macro, hw)
 
+static void rx_macro_disable_clocks(struct rx_macro *rx)
+{
+	clk_disable_unprepare(rx->fsgen);
+	clk_disable_unprepare(rx->npl);
+	clk_disable_unprepare(rx->mclk);
+	clk_disable_unprepare(rx->dcodec);
+	clk_disable_unprepare(rx->macro);
+}
+
+static int rx_macro_enable_clocks(struct rx_macro *rx)
+{
+	int ret;
+
+	ret = clk_prepare_enable(rx->macro);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(rx->dcodec);
+	if (ret)
+		goto err_dcodec;
+
+	ret = clk_prepare_enable(rx->mclk);
+	if (ret)
+		goto err_mclk;
+
+	ret = clk_prepare_enable(rx->npl);
+	if (ret)
+		goto err_npl;
+
+	ret = clk_prepare_enable(rx->fsgen);
+	if (ret)
+		goto err_fsgen;
+
+	return 0;
+
+err_fsgen:
+	clk_disable_unprepare(rx->npl);
+err_npl:
+	clk_disable_unprepare(rx->mclk);
+err_mclk:
+	clk_disable_unprepare(rx->dcodec);
+err_dcodec:
+	clk_disable_unprepare(rx->macro);
+
+	return ret;
+}
+
 struct wcd_iir_filter_ctl {
 	unsigned int iir_idx;
 	unsigned int band_idx;
@@ -3880,14 +3926,6 @@ static int rx_macro_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_pm_clk_create(dev);
-	if (ret)
-		return ret;
-
-	ret = of_pm_clk_add_clks(dev);
-	if (ret < 0)
-		return ret;
-
 	pm_runtime_set_autosuspend_delay(dev, 100);
 	pm_runtime_use_autosuspend(dev);
 	ret = devm_pm_runtime_enable(dev);
@@ -3959,16 +3997,9 @@ MODULE_DEVICE_TABLE(of, rx_macro_dt_match);
 static int rx_macro_runtime_suspend(struct device *dev)
 {
 	struct rx_macro *rx = dev_get_drvdata(dev);
-	int ret;
 
 	regcache_cache_only(rx->regmap, true);
-
-	ret = pm_clk_suspend(dev);
-	if (ret) {
-		regcache_cache_only(rx->regmap, false);
-		return ret;
-	}
-
+	rx_macro_disable_clocks(rx);
 	regcache_mark_dirty(rx->regmap);
 
 	return 0;
@@ -3979,7 +4010,7 @@ static int rx_macro_runtime_resume(struct device *dev)
 	struct rx_macro *rx = dev_get_drvdata(dev);
 	int ret;
 
-	ret = pm_clk_resume(dev);
+	ret = rx_macro_enable_clocks(rx);
 	if (ret) {
 		regcache_cache_only(rx->regmap, true);
 		regcache_mark_dirty(rx->regmap);
@@ -3991,16 +4022,15 @@ static int rx_macro_runtime_resume(struct device *dev)
 	if (ret) {
 		regcache_cache_only(rx->regmap, true);
 		regcache_mark_dirty(rx->regmap);
-		pm_clk_suspend(dev);
+		rx_macro_disable_clocks(rx);
 		return ret;
 	}
 
 	return 0;
 }
 
-static const struct dev_pm_ops rx_macro_pm_ops = {
-	RUNTIME_PM_OPS(rx_macro_runtime_suspend, rx_macro_runtime_resume, NULL)
-};
+static DEFINE_RUNTIME_DEV_PM_OPS(rx_macro_pm_ops, rx_macro_runtime_suspend,
+				 rx_macro_runtime_resume, NULL);
 
 static struct platform_driver rx_macro_driver = {
 	.driver = {

-- 
2.34.1

