Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A854649D585
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591577; cv=none; b=raiCXrXDybrdWSzjW42r6AYKSIpUC2b3TWi0rz6cZiCrnNllWynYV70lyKniqyGXOiB7+Bm3blbGiovW0VX95f5+9uj+UunsMBabWch+5Xhxm8UjPNDYzGioGt9q/6Pe9lCe7cQ0SZ4xA+G8od+V2HhSM35Ms7irqYbAjCLOnWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591577; c=relaxed/simple;
	bh=kPn6Dg0bdnYkwCA+6ezajILIS03WVEUaTY+v05K4hXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uRzR7eTUbiZ4IjQ091l5VHBfWC15+/8NMJ86gg4OFrwpwQEbXvtLzz/Ua0TdxpswhnymDLwe9FjQRr6luO2JajWaXqZvEbUkVvbARtsf2JaDbOUEJ1jQGVWfa6uMxDIALTOdmzie8OqAudkSzYYwgxMhGDLtbpbDDi5F6slJYec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NQxAnjX5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gpGvgBro; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NQxAnjX5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gpGvgBro"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9MEDs954452
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	btJXwtvrlKSFwnalBRzKZ+u43uNhdzBt0gD3LXAU9eg=; b=NQxAnjX54lWAg1vc
	UXBDSXM0R64YdEj66BuefrKeSD5GW4xWk11zf3gDdLxqccDUtIMjsOVuldvE+tGt
	sS8cyTWoUnqkcQTXp+cf2Xi6YRXZFx1BFNAph1UCiSampV0E/8lPKiMA3HegG9+h
	v6dYUvK9fNyXSRoVA15wJC7Zc94ghotpKJWlx2/5bqhycyOn61aAXL469TvF/wHy
	5aa5xT1hI6gMLjSqluw8KJTcaWqcBZPxbGi/oRHQnaWYggNwiYnnxrKNWLMmFumx
	CS9YmxK+ESZxNKiqEJO/fbB3BAMwJqrUf3PG1HU1bXfwIzIydhKTL+5wuWxcBxbY
	U3/qdw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynbc0a40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:32:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so3261740a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790591571; x=1791196371; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=btJXwtvrlKSFwnalBRzKZ+u43uNhdzBt0gD3LXAU9eg=;
        b=gpGvgBroigtWciRS2XcsPv7mSgn3FdAFMnXpUotpWdJZOr4RhG7vPKP1RF3STPzOt2
         gpUiaddwG1Cpnj9SFhZHMKF3jYOIamUOSD/4kwdhh7d8UAAiMli8l0U5jjK4apGKdfRv
         dR8eYprXQB/XJ6FpUm7eF2DtuX1gzM/BDd76l9HvdMRwn/3wwi0Zej6n63/LJTaYKPp9
         PRYBV6rZde11fXDBmTpXvh/Vn0PAFyIs5Qx/eQWg8Auq3XBbEBVHyfPnxvIcr0D0Cz/F
         GVr6Ct14uHeO0Mry8mPzX7Fy7sc2/BhTJqntQLRSUvSnd7mmKcPK7c3UKzY6f1yIByIz
         fS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790591571; x=1791196371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btJXwtvrlKSFwnalBRzKZ+u43uNhdzBt0gD3LXAU9eg=;
        b=DhBZsofmU2GGO20gnGUQoe+D1fLYiByClJVlDFow3IOn+25I3QJ9ku8htbYgDU1YL+
         2r++k5uH4ilfPE4AywNe1yMQMAHQ0lRdV8245A+eIB0sfVE1Zgrk4Ud5K/5BXZkhL0LL
         p07/pE0E8PeN23+01Yl+N2QSMwPBRZIHWUEWYqDgpsCeiK41h2QaHsOTVW4tyFsRRvbM
         Rttxan1r4nz21WfNP3yewIgWOiaT/ZPn225rAqapBf5SDiGqDtJ9hVZ0KlXIB1HaATQo
         BjAPRSO7k/53ateiKdSLaBGjlqGc+tB9W/xNhyHBa6QBfEZwRYwPH7+1x1rUbKcAjMha
         9HvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzzQTJKKptFR88oaGLLEqnVBk6Xaz/WKG4/6Cbg2LdO6FL0NOn8Xw0a8XseRcyR0s0QCGAk9NHp3DFI58=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgT079q3AfUn4bJxg9ebkCNPK81MmI5wdcPzGISKsMAA4p/nIE
	N17TftYD+MUxv27Sr/09tzFnGQm3ZIA4ikXt39CezHt/JwhU2h+Sa9C+Bay1tKawE/9XuX0ecZj
	CNLGx/j+V5gAvbxovXzrtuFGBDKySjxxTld6HLHyRwD+5KDIEjy0kzlESVYnYQ0mk8rA=
X-Gm-Gg: AYBFou35fo99S4SWc4j2drwWdDr5DYNGgRZlCwFpmfjJQkbUaltwaWSzc2d1Y51S560
	KoXbP0Tk9wxgc6J2OcMNnHfrIKDoT0asqDjEioz3w1FiZ0/0Fl6a0dyTKcfm4S/k6RXxnghlDFG
	lEYWKKb0WwFv2a7j+FX0FQgj6hFfXlqWCVLC/piy8MuJ9HjedzYzICIPOtoYjzcrsQxUe5iD9LS
	lx2po1CiCVxYmdJ+04YkwW5XUMsB/igIwFlIO/3/uac6dH7EnRv/YWKr882ntGbx5ft0jJxO/+P
	zrWr+OZy0YXXZdTTHGOBBflxicaDoB5igmXw9NpJaKegKyq3ra1jcEHgWvS200n/784GEt+xH4c
	FmWLhmytmffVBpDTSkISCYJd6KIE=
X-Received: by 2002:a17:90b:264d:b0:3a0:3673:dbc0 with SMTP id 98e67ed59e1d1-3a0bb6325cemr7282999a91.49.1790591570969;
        Mon, 28 Sep 2026 03:32:50 -0700 (PDT)
X-Received: by 2002:a17:90b:264d:b0:3a0:3673:dbc0 with SMTP id 98e67ed59e1d1-3a0bb6325cemr7282990a91.49.1790591570467;
        Mon, 28 Sep 2026 03:32:50 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efaeb3sm19885131a91.2.2026.09.28.03.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:32:50 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 16:02:22 +0530
Subject: [PATCH 4/5] ASoC: codecs: lpass-wsa-macro: manage clocks in
 runtime PM
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-xo-sd-runtimepm-v1-final-v1-4-e3ebade3aeb7@oss.qualcomm.com>
References: <20260928-xo-sd-runtimepm-v1-final-v1-0-e3ebade3aeb7@oss.qualcomm.com>
In-Reply-To: <20260928-xo-sd-runtimepm-v1-final-v1-0-e3ebade3aeb7@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=Sq4Fe/O0 c=1 sm=1 tr=0 ts=6aba4254 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=0aw6pvlUo1gSDbX1wFsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: XjXTMz8iH18Q6IHXUFaL7SIdwn7fovhq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0MSBTYWx0ZWRfXynhWEiduIXoB
 txm87uVD2/cgHf51X8hCHodQDszwFSlA/++xeKHd8319LZnSAQAzMjucktKUCpTJkOzRX9HNqEj
 wv1sNc1zpUab1MHD1FXNX2VNAhRrD4N65rOrLAV1iM1GURQQrSye4YKUBp4IFuEjrsyFDh4uzg7
 OtK44c9xRtaxZRsStlg3ERDLcA13D8M0pdWmLZ41/vmasHtQxIrcsjZtk0rgf9vNGDI/GwWjfl3
 QVI60Rqdj528hA80YneU9V5zg7K0SXa0kUA53G03yPgKKrg/HNF+i7zFAC533Lkmbxf3TiQUucn
 BT+HeJ3dJ2VTddaEA44ts/t3wfLi+ib9Cp4RIDPvY+ki4SvEY2U/a2z9DjACWBRVQS/d/hZCLVz
 2AlGnf5To8ms7fZ+hlOPOyXkQwkDybC2giC/LQzZNLyGXJAjxi0BIW51AM7RwrsdaKS5oHcQA4N
 1TLKi1YCIPSwNWRY65Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0MSBTYWx0ZWRfX6/WSCZaN9izo
 ji9pBrllT+h9i6g7eOzCD/lJ/umzQRT7UzKdWgOdX47k5LjGExqQiJIwS21fTdc1N6nUz/+u8YD
 JeHwuuETXIE2h+yXTRTeKfW5Q7jy2DA=
X-Proofpoint-ORIG-GUID: XjXTMz8iH18Q6IHXUFaL7SIdwn7fovhq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280041

Replace PM clock framework usage with explicit clock prepare/enable and
disable/unprepare operations from runtime PM callbacks. This keeps the WSA
macro clock prepare state tied to the runtime PM active state, so idle
suspend can release parent clock votes.

Use DEFINE_RUNTIME_DEV_PM_OPS() so system suspend forces the same runtime
suspend path for an active device.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-wsa-macro.c | 80 +++++++++++++++++++++++++-------------
 1 file changed, 53 insertions(+), 27 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 4242366601a5..bc0ff467c822 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -12,7 +12,6 @@
 #include <linux/clk-provider.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
-#include <linux/pm_clock.h>
 #include <linux/pm_runtime.h>
 #include <linux/of_platform.h>
 #include <sound/tlv.h>
@@ -424,6 +423,53 @@ struct wsa_macro {
 };
 #define to_wsa_macro(_hw) container_of(_hw, struct wsa_macro, hw)
 
+static void wsa_macro_disable_clocks(struct wsa_macro *wsa)
+{
+	clk_disable_unprepare(wsa->fsgen);
+	clk_disable_unprepare(wsa->npl);
+	clk_disable_unprepare(wsa->mclk);
+	clk_disable_unprepare(wsa->dcodec);
+	clk_disable_unprepare(wsa->macro);
+}
+
+static int wsa_macro_enable_clocks(struct wsa_macro *wsa)
+{
+	int ret;
+
+	ret = clk_prepare_enable(wsa->macro);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(wsa->dcodec);
+	if (ret)
+		goto err_dcodec;
+
+	ret = clk_prepare_enable(wsa->mclk);
+	if (ret)
+		goto err_mclk;
+
+	ret = clk_prepare_enable(wsa->npl);
+	if (ret)
+		goto err_npl;
+
+	ret = clk_prepare_enable(wsa->fsgen);
+	if (ret)
+		goto err_fsgen;
+
+	return 0;
+
+err_fsgen:
+	clk_disable_unprepare(wsa->npl);
+err_npl:
+	clk_disable_unprepare(wsa->mclk);
+err_mclk:
+	clk_disable_unprepare(wsa->dcodec);
+err_dcodec:
+	clk_disable_unprepare(wsa->macro);
+
+	return ret;
+}
+
 static const struct wsa_reg_layout wsa_codec_v2_1 = {
 	.rx_intx_1_mix_inp0_sel_mask		= GENMASK(2, 0),
 	.rx_intx_1_mix_inp1_sel_mask		= GENMASK(5, 3),
@@ -2791,14 +2837,6 @@ static int wsa_macro_probe(struct platform_device *pdev)
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
@@ -2844,16 +2882,9 @@ static int wsa_macro_probe(struct platform_device *pdev)
 static int wsa_macro_runtime_suspend(struct device *dev)
 {
 	struct wsa_macro *wsa = dev_get_drvdata(dev);
-	int ret;
 
 	regcache_cache_only(wsa->regmap, true);
-
-	ret = pm_clk_suspend(dev);
-	if (ret) {
-		regcache_cache_only(wsa->regmap, false);
-		return ret;
-	}
-
+	wsa_macro_disable_clocks(wsa);
 	regcache_mark_dirty(wsa->regmap);
 
 	return 0;
@@ -2862,9 +2893,9 @@ static int wsa_macro_runtime_suspend(struct device *dev)
 static int wsa_macro_runtime_resume(struct device *dev)
 {
 	struct wsa_macro *wsa = dev_get_drvdata(dev);
-	int ret, sret;
+	int ret;
 
-	ret = pm_clk_resume(dev);
+	ret = wsa_macro_enable_clocks(wsa);
 	if (ret) {
 		regcache_cache_only(wsa->regmap, true);
 		regcache_mark_dirty(wsa->regmap);
@@ -2876,20 +2907,15 @@ static int wsa_macro_runtime_resume(struct device *dev)
 	if (ret) {
 		regcache_cache_only(wsa->regmap, true);
 		regcache_mark_dirty(wsa->regmap);
-		sret = pm_clk_suspend(dev);
-		if (sret)
-			dev_err(dev,
-				"failed to suspend clocks after regcache sync failure: %d\n",
-				sret);
+		wsa_macro_disable_clocks(wsa);
 		return ret;
 	}
 
 	return 0;
 }
 
-static const struct dev_pm_ops wsa_macro_pm_ops = {
-	RUNTIME_PM_OPS(wsa_macro_runtime_suspend, wsa_macro_runtime_resume, NULL)
-};
+static DEFINE_RUNTIME_DEV_PM_OPS(wsa_macro_pm_ops, wsa_macro_runtime_suspend,
+				 wsa_macro_runtime_resume, NULL);
 
 static const struct of_device_id wsa_macro_dt_match[] = {
 	{

-- 
2.34.1

