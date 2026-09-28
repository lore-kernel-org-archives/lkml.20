Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A981449B450
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591568; cv=none; b=dxekLPimy52c+wK5CrV0RGMjo83uhcrmPSuloc5PiLW88OI/If4/iHMzW2+J3Zuq/3AJXfbvymORVpQjrDqr/qEcCum7Uh0JMEUWKc2rmvSvX8qWVQJTSLdIcZmT7WLubL+rySk/l/omJeM/37yl39CbHPprmdAMnbp/9a42m14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591568; c=relaxed/simple;
	bh=haHpWMuLVed+ECpPEATeoHHxBP8FYa2ph8LSe0Ui7tY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NbXrQD83AHCDrfllWU9N1byJXGbJb3Bp6Hw0U7Hlqg2ppsfYolETL+R3c9Xqy+Ryka0Q/0S1/rT7zQO+XPVGUIITehagpZLvaIoZlnGzHz2AOEwR3hSTmykejDjOxDHUiFk5hYMLiNQhYp0OUMXBnJ9jdyYHvMncERZntufAtzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hO1X6T50; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q77VZydR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hO1X6T50";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q77VZydR"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9M6r81445807
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	onvU8/HqVdUH829X5OG/bbv2OgnYoRqeGmQwXYvTC88=; b=hO1X6T50bx+c0CRM
	Ij65ugcy2hulJbf9E4vvWlek0DSX3CkOrCSDY4v1PcuZx+baD9qPmXJxw4g/+4MX
	Yvv5ZBd6W58yzlJ5HUsuGkUqpjOAD+YcsLFHkxZ727uWoyNn0Smd+kmeKpichnFp
	p2qQ3R0sdP8fWgZi5ini+o3J5J/V6pnkECDQ55wDvJ1l7/d9EofZtuDDmCAK7q7q
	9qm8/BbaArNSr4tn9JXNr9A+sA7SmFMDqpyb1yXWvA/x34K3qQeoIDkYDgfezuSz
	g0Vn9ZP+U4gxJ4PdPSjHyCnnYQF+AULbrhGo9q4ckz1pVE7qc2dDLZ+WAyspKcr+
	CNAmAg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynfkr91r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:32:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a470ead068so542620a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790591565; x=1791196365; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=onvU8/HqVdUH829X5OG/bbv2OgnYoRqeGmQwXYvTC88=;
        b=Q77VZydRFhDk82ug7PgamZDV2RLPNI9JiJjh3sbCWY62NhuYlt/LtUd9AdGgp+fvrk
         GABjkI0rO5rHV8YcWLRaoqJFKMrbNCt+XQHpdbu07opT/++tyQX4rXUNZJAs1L49OwzY
         FI29Y4J9QfGYEyzzYVAM3UJu0MiDav6yGZEpeJkSTJF1/zRDdyfPjmrh0TCZTkSsLXwQ
         pHa4PWjkqxOfrHL6I7ZnlxGE6uMi1kh8+KlwF1ZkFx95kpxq/ZQ9Uqo1sSiZIaq9JoJp
         3/hpQOxeESHH4zJiCkjjkZ9ZU0LBDtnpz9K0CSj+UHMeW9iZ9WDEQ5KH8TsXgD+UkUQM
         RoQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790591565; x=1791196365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=onvU8/HqVdUH829X5OG/bbv2OgnYoRqeGmQwXYvTC88=;
        b=U7AYO29IIyxTIjnwTheG9A+dOYNx/zgZYXHV1nXicU1/dci7YVDAGlEPySD+/XSBmk
         tCa+mB9g/wzgum/NTWguP2R8wh4i9rDqHoER+4Muo60cbBwUSeHokoWHIN1hIh3ZrQ/N
         XkMVqySnv8wQ45XYKfFB/vPeQmqpeELXrzkaZfe2fA4wrm6MBOmo9sp1nKaWghX8D/KQ
         VamwLmet1QOfS6dZNtaFEMTE789oTeVeoSknaw2kDh0AZQISwitItrOto0+Yb9ZupV4H
         C6e8y6Ebfyvd6DXdThihogIVYDbUEFggvdo0G+Sp/jax/K/Q6lttMJ20uKkvZtboykNV
         7TbA==
X-Forwarded-Encrypted: i=1; AKwUvBwT3IbewjLdlpV9v0ipYdWSBV6FPnYG0LZ5Y+wJdXYo8ouMpLw7RtPldnTJRK6rbxvnKG1nDM83Cp92fow=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAkhPm8DH+jPUzVt3fYdQs98lpyRsgb9LK1rrdNhnto+Vvg3jT
	IzfPq5EDmfFWB09GUEo6dt/MT2oWtJYfgDQxpEdQF++rDP+upM/kkT6j81QhMSwOOl6oBPSwvjv
	QIfE1XYQ+bzur/Kx8nnAG/89sgKgzBFZRXh6CG60QtoIO8l3twe8Pu6z9lpKppce2AoY=
X-Gm-Gg: AYBFou2zwL+h4l71ihPvVrEeCLjJgpWdJBGr4x8dKpI0FPOEaClQUIZ1GMuF5IVKA53
	vBsLRmNuCzA3cCYrcEgNtkxe/GFdLzGHZwfVn14Fs2XZz98Sl/mB8jrEHRnDol3QHrEn8BhpWYT
	q9k6xZ7FXHVEkRFpR5YEtWG77/6VQuL0dFc3OfG3oSHOQWq2fpGydlXWaPakXU+cRLIY2Gs+JX9
	F1KfsR0C2Qi+4qOOLEttqVDRMTkS8mtN5KA8jIetmYhHhS08UjuuJZ+KL/CzyJC9LHDV1T5mfIg
	T+PBDh6DB2tNtxKFYiKFH0op8hOJxbkjCNAZBVhvxq6MAxpctJ3CYGvpgO3VjAlszEn9Vm8UTYx
	dX3dL0SFJY6FRO3mlHsKM9cJF0Eg=
X-Received: by 2002:a17:90b:57c6:b0:3a0:22bd:6ef6 with SMTP id 98e67ed59e1d1-3a09853a6cdmr8365220a91.2.1790591564372;
        Mon, 28 Sep 2026 03:32:44 -0700 (PDT)
X-Received: by 2002:a17:90b:57c6:b0:3a0:22bd:6ef6 with SMTP id 98e67ed59e1d1-3a09853a6cdmr8365205a91.2.1790591563873;
        Mon, 28 Sep 2026 03:32:43 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efaeb3sm19885131a91.2.2026.09.28.03.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:32:43 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 16:02:20 +0530
Subject: [PATCH 2/5] ASoC: codecs: lpass-tx-macro: manage clocks in runtime
 PM
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-xo-sd-runtimepm-v1-final-v1-2-e3ebade3aeb7@oss.qualcomm.com>
References: <20260928-xo-sd-runtimepm-v1-final-v1-0-e3ebade3aeb7@oss.qualcomm.com>
In-Reply-To: <20260928-xo-sd-runtimepm-v1-final-v1-0-e3ebade3aeb7@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0MSBTYWx0ZWRfX7nDMVR2mGQ90
 60UYuZViQ7Vcbyar9yLGv6B3pB3VXeoiz3Ge08eT9s7lfS+MZtT3C2HH30ZHwcZ5tsc/OBa3GEX
 KbzMHPM85Nl/djm3LO6tNJyc4ZZ7Vz+P7PduhFZP85cFmtxduUPeUqHj6EByH7pd75m/xslqftU
 kugzhMp1N3ABLGRDydN1fr8KdoCveFQzaPZWaTEz/cbxfup5SR2PNUJ956tW+9xyt3Lk/buzcHc
 9KSJ5v9o5D2JKN0BQueQ14gDM3dFVTCr7gtq98QZQg+d8iMYUGjDvFaNU1bzkERvn3xjYw+wUqz
 VdkZZ9B1jW0YUn8EYXWyKNtdr03Pu3dQnl1SDWYXOhLLUEEwa3qZ8m18r91YBaK9WQcTsehmLYt
 NWW/Ig9HjNnOkGW8iihjWe0oU8LJ6Ua58oiXr4+15n7g65m4E0Utsz1fzeFoIG2J9seo1Q7PmeX
 4ZmT4nwEzGVF6wZFJWw==
X-Authority-Analysis: v=2.4 cv=e6aT2qp/ c=1 sm=1 tr=0 ts=6aba424d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=58a1pb9m0xdEzXGcqgsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: qNn_Wi00TyAOETBuy15XKY7W6NrObX-L
X-Proofpoint-ORIG-GUID: qNn_Wi00TyAOETBuy15XKY7W6NrObX-L
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0MSBTYWx0ZWRfXyLfVLkplgDDL
 JtqCIdoaYAjIRSe9mJ/uFPgCVx2Nh47Xx5pNTt7F/KkqUIpvyG+XI/KQGOUWfuVRLNtFyzdzwjR
 ecj+EqL5WSNGX5PyrIpF7O4jCPVpHSM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280041

Replace PM clock framework usage with explicit clock prepare/enable and
disable/unprepare operations from runtime PM callbacks. This keeps the TX
macro clock prepare state tied to the runtime PM active state, so idle
suspend can release parent clock votes.

Use DEFINE_RUNTIME_DEV_PM_OPS() so system suspend forces the same runtime
suspend path for an active device.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-tx-macro.c | 75 +++++++++++++++++++++++++++------------
 1 file changed, 52 insertions(+), 23 deletions(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 6deaaabe43af..c9601f84c35e 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -6,7 +6,6 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
-#include <linux/pm_clock.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <sound/soc.h>
@@ -289,6 +288,53 @@ struct tx_macro {
 };
 #define to_tx_macro(_hw) container_of(_hw, struct tx_macro, hw)
 
+static void tx_macro_disable_clocks(struct tx_macro *tx)
+{
+	clk_disable_unprepare(tx->fsgen);
+	clk_disable_unprepare(tx->npl);
+	clk_disable_unprepare(tx->mclk);
+	clk_disable_unprepare(tx->dcodec);
+	clk_disable_unprepare(tx->macro);
+}
+
+static int tx_macro_enable_clocks(struct tx_macro *tx)
+{
+	int ret;
+
+	ret = clk_prepare_enable(tx->macro);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(tx->dcodec);
+	if (ret)
+		goto err_dcodec;
+
+	ret = clk_prepare_enable(tx->mclk);
+	if (ret)
+		goto err_mclk;
+
+	ret = clk_prepare_enable(tx->npl);
+	if (ret)
+		goto err_npl;
+
+	ret = clk_prepare_enable(tx->fsgen);
+	if (ret)
+		goto err_fsgen;
+
+	return 0;
+
+err_fsgen:
+	clk_disable_unprepare(tx->npl);
+err_npl:
+	clk_disable_unprepare(tx->mclk);
+err_mclk:
+	clk_disable_unprepare(tx->dcodec);
+err_dcodec:
+	clk_disable_unprepare(tx->macro);
+
+	return ret;
+}
+
 static const DECLARE_TLV_DB_SCALE(digital_gain, -8400, 100, -8400);
 
 static struct reg_default tx_defaults[] = {
@@ -2328,14 +2374,6 @@ static int tx_macro_probe(struct platform_device *pdev)
 	if (ret)
 		goto err;
 
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
@@ -2346,7 +2384,6 @@ static int tx_macro_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err;
 
-
 	/* reset soundwire block */
 	if (tx->data->flags & LPASS_MACRO_FLAG_RESET_SWR)
 		regmap_update_bits(tx->regmap, CDC_TX_CLK_RST_CTRL_SWR_CONTROL,
@@ -2395,16 +2432,9 @@ static void tx_macro_remove(struct platform_device *pdev)
 static int tx_macro_runtime_suspend(struct device *dev)
 {
 	struct tx_macro *tx = dev_get_drvdata(dev);
-	int ret;
 
 	regcache_cache_only(tx->regmap, true);
-
-	ret = pm_clk_suspend(dev);
-	if (ret) {
-		regcache_cache_only(tx->regmap, false);
-		return ret;
-	}
-
+	tx_macro_disable_clocks(tx);
 	regcache_mark_dirty(tx->regmap);
 
 	return 0;
@@ -2415,7 +2445,7 @@ static int tx_macro_runtime_resume(struct device *dev)
 	struct tx_macro *tx = dev_get_drvdata(dev);
 	int ret;
 
-	ret = pm_clk_resume(dev);
+	ret = tx_macro_enable_clocks(tx);
 	if (ret) {
 		regcache_cache_only(tx->regmap, true);
 		regcache_mark_dirty(tx->regmap);
@@ -2427,16 +2457,15 @@ static int tx_macro_runtime_resume(struct device *dev)
 	if (ret) {
 		regcache_cache_only(tx->regmap, true);
 		regcache_mark_dirty(tx->regmap);
-		pm_clk_suspend(dev);
+		tx_macro_disable_clocks(tx);
 		return ret;
 	}
 
 	return 0;
 }
 
-static const struct dev_pm_ops tx_macro_pm_ops = {
-	RUNTIME_PM_OPS(tx_macro_runtime_suspend, tx_macro_runtime_resume, NULL)
-};
+static DEFINE_RUNTIME_DEV_PM_OPS(tx_macro_pm_ops, tx_macro_runtime_suspend,
+				 tx_macro_runtime_resume, NULL);
 
 static const struct tx_macro_data lpass_ver_9 = {
 	.flags			= LPASS_MACRO_FLAG_HAS_NPL_CLOCK |

-- 
2.34.1

