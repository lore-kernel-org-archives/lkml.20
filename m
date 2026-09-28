Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8C544E65F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591573; cv=none; b=UXLtpGQ7nqqmFS6zHWimYcYrZj7xzN/SE9/5/82C9rYuWI8V3Y/x5r61IS9b8gLTy6cG1hGmbxaZC0Z0a3a7HRHkhJEgQU+xjGsNOA+DqKFF5wE7PQIr3mS529F6r1xWMgipjQ3U+52t3k4vG/pBbBAWm0/w0QLa+spjKjNNq98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591573; c=relaxed/simple;
	bh=Hfc+Ic5irS9iaZIKSNjHWar2++17x/7bV9KkH4O2CuQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hYIBAe66uhscp6SPgDHIZeWcsQKgRkvELZ1mSWCO2fzaE8jiyUYMbhZLPSNRBl82A6sU5wszYjBAReCiLQP9NbfHBRGn3VS6vp8be1RPq3jp2qY0dlg2VPGzuZPKbvWpKgn9yZrZHs9jh21IxYV5xdtadUhBDLmeFNeWQQVnVN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QiYHPiKz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IUEwR2f8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QiYHPiKz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IUEwR2f8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9MHjK806179
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:32:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X+F01bJuybZTwFO2WBoKTou/uN0G2y5zUMWWErME7OY=; b=QiYHPiKzYf4gCtuE
	77NLqtfujyld+NASZs5Uf9oy94MIQNmL51CSmLxjtfCMCxjG98IP2Fl+RT1nkfGt
	byE3p/tjEwoCB8xewkpiEeLibQbadjWz+fX1T86XNIdbZL9LJFUavVWSB84zg52T
	GvcDHG/jHIpWCDI43V7hZpG5TtM1FYN5yFEx9XoL38ZeAZOZTEC+pxtIC4X9IqlK
	E2NfCD8yGMgsbnNxAA8YyoyxshCSFAXH6wpUBH3YF6jHZFma1LZDK6t12+5Qqc4h
	BaeNZt9Kz1gbpKLCIF05WPCDSP6tQKR4BNteKgk8AvpZsBS/5I0MfKGaj3lTgB6f
	jSpTyA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyk5mrvay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:32:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso3093860a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790591568; x=1791196368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X+F01bJuybZTwFO2WBoKTou/uN0G2y5zUMWWErME7OY=;
        b=IUEwR2f8zm0H0hh68eruXBk0rFhuumlxW7GfKgNGtv45tnNq3/iPMARN22pkF30TA/
         QP83x/cN5tO3tGEui0MrvkFXh/mKNnPpOI/Eewt/L11hirbwl3b+A83CvLhmrcAh96Ts
         lpip/T0nTZwslDp+xXzP1XOyDyopqsGQNx+Vn9WpSwWA1feFf+QFEzB205h1hGX2fBXa
         yItey5RIRpfgRMJH4MCCx9m5epcusDekDAH8PWcVeIxMT6A/j7inN1nPEoJTTugSN7BZ
         srYH1i5PFyqL+grxo8XSHaVIEucwk2zqVqhZFkjeFf45gl44p0tN3GtYTbG06ss0aieD
         oq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790591568; x=1791196368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X+F01bJuybZTwFO2WBoKTou/uN0G2y5zUMWWErME7OY=;
        b=lZuR5U8UVL7l8q76fFiu9CcIa/nFYcrQ0trk2Bk5dJvnESXyyYcaZw/oPNyx3XdZu7
         97hswFsEPVepMoPAumtdPADB2nrhp/AILXO5kmqeJKyR5HFIoSkm/B2qz7RGbYFkdfQh
         JU+xEIQ1ErW7pn+ypbVB80TBPF1IVi3N5Rx27egsy2xANzK5iVdBjmrDSR4xLlHwZQq2
         RWgpHgokn1g4U3sQI1lyU7kc4o4DQiF/R6yghcmIN/iK599zM6x8fr0CbPfz6VquG2bV
         n0mjbvgrmmKvEGAwqW6X/wwKTAWWOybRz2w22TYjuSraWDkVWTsbMHRGT6chfVrZ/jgq
         DMUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqBYlwa/jj8QUDlhoGmIqr53eghH+xFZezrU+ljIlCqOwjxS/5cYcikJEvylvclqGa3tpOJuyaOJLWELo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJA4hpMWikVEmqXu1qGfChPYT2oSQ8VcDxaWQl2oQc+xlpheLG4
	ZHx9LTPLZHZkHrkyZ3MfPxH7Vbe4/9EYUXda3EaRnVO5Or/MirLvWMVuRRlDqyLzU5nX1ZquYzL
	2Cg9+zQNwnug9x3N4AJrZCZwntJVoqr/Epx5Ka5Hes+a2M7VwbVhEtPcvlqpZVD0kzyw=
X-Gm-Gg: AYBFou3U8F1e5qQBcpgIX28G1kZYn2QbgEYeslJ45j8rju3JYi+9ioTGVxHNvbkIxhR
	Dftbsrn7f5fxWrMAJXe0b9X/azIYBHL1Q+39HW6WqHtOSvg/D3AJ1+bnCU0HvpXD8EB32k0bFJQ
	DFc9o3M3x20GnaPVsjni3v4ubEfVrgoixGbsHZmprQBMvSySY4YCu4OusAbUDMqySQJBEBAf6hk
	emyQ9zOTRtL8WGlxg0GaXwMklkzhYSywJGIlFswADUDzdY2dk2ApgSAEWttVTBu+gmkg83Tp+25
	RJxMQNlbdR48jTc1MOJ+pd6ZullmDcGTR3acbZNyFJpGQ/5a385iPqh0NmKsUMVRjXDqd2GaMpN
	5E9aFkfvLIpCqLpcZftMnMsKksIk=
X-Received: by 2002:a17:90b:540b:b0:3a0:4384:adf6 with SMTP id 98e67ed59e1d1-3a09855cfa2mr9547054a91.0.1790591567674;
        Mon, 28 Sep 2026 03:32:47 -0700 (PDT)
X-Received: by 2002:a17:90b:540b:b0:3a0:4384:adf6 with SMTP id 98e67ed59e1d1-3a09855cfa2mr9547033a91.0.1790591567134;
        Mon, 28 Sep 2026 03:32:47 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efaeb3sm19885131a91.2.2026.09.28.03.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:32:46 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 16:02:21 +0530
Subject: [PATCH 3/5] ASoC: codecs: lpass-va-macro: manage clocks in runtime
 PM
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-xo-sd-runtimepm-v1-final-v1-3-e3ebade3aeb7@oss.qualcomm.com>
References: <20260928-xo-sd-runtimepm-v1-final-v1-0-e3ebade3aeb7@oss.qualcomm.com>
In-Reply-To: <20260928-xo-sd-runtimepm-v1-final-v1-0-e3ebade3aeb7@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-ORIG-GUID: 7T5J7T3u617kKXQlnOYtujZLVxTLul4N
X-Proofpoint-GUID: 7T5J7T3u617kKXQlnOYtujZLVxTLul4N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0MSBTYWx0ZWRfX9GFfpTZ7YC2+
 6w9sXi8dxM020Cyaze71WdiJ+aoP5SlAY62UV6vmZtFu2taZS1wLbZgJ5Cl2vWtkDCXsEUOC7R8
 IxO81LONqGMWM2xPT2Lvm26ruaahUXDLz+PGhPe7tYmPHFjppv1Ib9YkZqvTbCGhTornELCuHb1
 B+wVatfVZmY9OJtgojjs6Q+NbqwCVu8tK7avJ5DiIWs50fuLzTnlaeipOAZYJOgVknfUUuC3wou
 cMmSTHR08sXDuK9MAOaUt2suHUFa5UP4/Gr3TajG47APHlr8/D3VJhrcb/zB+GKUeaffm0SSHQn
 qXzVeurxBzyLU+VtKZRRGRrMoaZ/tY/Cdjpb1BJXBCFUDhDSRaXc89p2R6T14HZ34mdgh2QNFa2
 3yZDVhI/l8Z1JvT3j7oTiuVBcKPYjMfQSjCf0Ci6244sxLch1a9YGHn1vdYatXU3E6XzcBgbVBl
 +C5PRDmc+ZAPUMwfquQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0MSBTYWx0ZWRfX9tI7SB9BP0pi
 B3WLWjm1w+VS90Qv5JXypuYGVpCgLAwIS17YaohLsBemGjI8Ebg08jPwhGcYEhNsU+SF6dfAT68
 A5xj4Y9908BIRV32SO53JiyyNJU0/1k=
X-Authority-Analysis: v=2.4 cv=asYnmiZV c=1 sm=1 tr=0 ts=6aba4250 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=e4XGr0MdzGbF6maxRbQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280041

Replace PM clock framework usage with explicit clock prepare/enable and
disable/unprepare operations from runtime PM callbacks. This keeps the VA
macro clock prepare state tied to the runtime PM active state, so idle
suspend can release parent clock votes.

Use DEFINE_RUNTIME_DEV_PM_OPS() so system suspend forces the same runtime
suspend path for an active device.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-va-macro.c | 74 ++++++++++++++++++++++++---------------
 1 file changed, 46 insertions(+), 28 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 03d6434a4a12..1197ca7210e6 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -10,7 +10,6 @@
 #include <linux/of_clk.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
-#include <linux/pm_clock.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
@@ -260,6 +259,46 @@ static const struct va_macro_data sm8550_va_data = {
 	.has_npl_clk = false,
 };
 
+static void va_macro_disable_clocks(struct va_macro *va)
+{
+	clk_disable_unprepare(va->npl);
+	clk_disable_unprepare(va->mclk);
+	clk_disable_unprepare(va->dcodec);
+	clk_disable_unprepare(va->macro);
+}
+
+static int va_macro_enable_clocks(struct va_macro *va)
+{
+	int ret;
+
+	ret = clk_prepare_enable(va->macro);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(va->dcodec);
+	if (ret)
+		goto err_dcodec;
+
+	ret = clk_prepare_enable(va->mclk);
+	if (ret)
+		goto err_mclk;
+
+	ret = clk_prepare_enable(va->npl);
+	if (ret)
+		goto err_npl;
+
+	return 0;
+
+err_npl:
+	clk_disable_unprepare(va->mclk);
+err_mclk:
+	clk_disable_unprepare(va->dcodec);
+err_dcodec:
+	clk_disable_unprepare(va->macro);
+
+	return ret;
+}
+
 static bool va_is_volatile_register(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
@@ -1621,14 +1660,6 @@ static int va_macro_probe(struct platform_device *pdev)
 			goto err;
 	}
 
-	ret = devm_pm_clk_create(dev);
-	if (ret)
-		goto err;
-
-	ret = of_pm_clk_add_clks(dev);
-	if (ret < 0)
-		goto err;
-
 	pm_runtime_set_autosuspend_delay(dev, 100);
 	pm_runtime_use_autosuspend(dev);
 	ret = devm_pm_runtime_enable(dev);
@@ -1719,16 +1750,9 @@ static void va_macro_remove(struct platform_device *pdev)
 static int va_macro_runtime_suspend(struct device *dev)
 {
 	struct va_macro *va = dev_get_drvdata(dev);
-	int ret;
 
 	regcache_cache_only(va->regmap, true);
-
-	ret = pm_clk_suspend(dev);
-	if (ret) {
-		regcache_cache_only(va->regmap, false);
-		return ret;
-	}
-
+	va_macro_disable_clocks(va);
 	regcache_mark_dirty(va->regmap);
 
 	return 0;
@@ -1737,9 +1761,9 @@ static int va_macro_runtime_suspend(struct device *dev)
 static int va_macro_runtime_resume(struct device *dev)
 {
 	struct va_macro *va = dev_get_drvdata(dev);
-	int ret, sret;
+	int ret;
 
-	ret = pm_clk_resume(dev);
+	ret = va_macro_enable_clocks(va);
 	if (ret) {
 		regcache_cache_only(va->regmap, true);
 		regcache_mark_dirty(va->regmap);
@@ -1752,21 +1776,15 @@ static int va_macro_runtime_resume(struct device *dev)
 	if (ret) {
 		regcache_cache_only(va->regmap, true);
 		regcache_mark_dirty(va->regmap);
-		sret = pm_clk_suspend(dev);
-		if (sret)
-			dev_err(va->dev,
-				"failed to suspend clocks after regcache sync failure: %d\n",
-				sret);
+		va_macro_disable_clocks(va);
 		return ret;
 	}
 
 	return 0;
 }
 
-
-static const struct dev_pm_ops va_macro_pm_ops = {
-	RUNTIME_PM_OPS(va_macro_runtime_suspend, va_macro_runtime_resume, NULL)
-};
+static DEFINE_RUNTIME_DEV_PM_OPS(va_macro_pm_ops, va_macro_runtime_suspend,
+				 va_macro_runtime_resume, NULL);
 
 static const struct of_device_id va_macro_dt_match[] = {
 	{ .compatible = "qcom,sc7280-lpass-va-macro", .data = &sc7280_va_data },

-- 
2.34.1

