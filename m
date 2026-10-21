Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792552359;
	b=tPJHUAsVbPbTaIIENsKzE5xPyYHdaF6/r4lT9gJazT5XDVAR0JweTmD94jQFy6NpPpX4
	 cxy7zhY45GehD79zVlAtoEUMYf0d0hf6KWcufAc/fBewOSd5hFSebuxHeGl75hBdMu6wI
	 N8hcI9ehiXna0EKV3dCnENGR2Rho8YynF9/oLKEAl792wLPBD17TQFPqfRl3lUtlGVcMD
	 43i+uv53lvTdiv5a4YR+jKTQUpit6a6a9NCCXjEmPxgobAD7uIUK9mvsqTV3IOgn0SKzz
	 dOLVDnxTXPBMeGyWySWKjplfbG3pvFP/XboahbXCjGJsGZXGHM+D2qexFCQZdyhxNGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792552359;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MfRkPM22ZaiSo4hToB8MNzjEQGDixsa8Pt0dtjpR+tE=;
	b=Hhb9BSVHbssK+uAcPccSDDdPu8QJFOyDddVRJZVGfjxgh3KwiucK+k+YGj1q4Z357QAV
	 bPdzPQsVq+COimXTNCEbVo0gbmH0pAivFUOaaLGXl5odT5JqP27RCKIdYs4Ykj4RSKz4q
	 qH2f6iJBbZdh13hOM3+12h0+J40YSedJTK4M/kFfJWDkRoDnVTQ3Mm0nJ2KlHKqnYWu3b
	 rpKiwrPGTppXzWVjPtLwAUJDgE7AmBHzRy+x6HdUQNebd9Y5SIHQmsVfN9HkHppMTR9Tv
	 MBs95RxmsYawXhuPtG6Glyst/EtsF/5L0b9p+u1oUUYypV3YH0f1q8ikeAKZajRCG9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="TW/c3KC2";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kcRlWfwk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54682606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54682606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TW/c3KC2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kcRlWfwk
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2EwAX3469315
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MfRkPM22ZaiSo4hToB8MNzjEQGDixsa8Pt0
	dtjpR+tE=; b=TW/c3KC2RXH+WX8/W8l6bonpOlRiIOTiIeM7mZdbTYw82wG+osM
	NdY8A4jMC5DqCrN6ZR9NgDZFyCLKllr4b4u4qs4cD1gW9MDgsFNiungu4EuvJe1w
	yqnVJdYYzjJHOri/Xsqq//dGlfA6aeBx0aLSergksdcHZ9mt3BChahMNGOFmoj2l
	no9vhTEXKyNRVNmNIfWuG4hXDzo5QtmoAgWKs1dj3D0bRD0Z7q7n9pCKl6lvKtaY
	jOnh8uv/8eqZsABuisLVIq8nmIMHHciQj23B7EkjF4OUr1c+Vvis/WLIfSKgFcS3
	K8oxWvSI3Rk6twyakkCZtzTrXgDlE6N0Opg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h2b9w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:12:38 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-154e9d2d94fso685010c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792552358; x=1793157158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MfRkPM22ZaiSo4hToB8MNzjEQGDixsa8Pt0dtjpR+tE=;
        b=kcRlWfwkRAvsCeiNTLIdRIElZBNcg+DbzmW62dUkSwnaUJA27lhrltUO998ZOWvgay
         CV8xg4zvu9c0SKHsy+SsA3kdQw3ty1LPpeGyelgPq+xvDCH9DpgS+XnKfMrXzIgN4K2L
         do9kBEjujwi3HU25pFC+Q/VsGskkqieRdQTopwtDxYmtDJXv7arTqx08aSBkUgu7zzf1
         xH+ubV7ST3T5aGU76bUi2q1Y57ul4t5ShLdnH4lV6Agl3WWhIiVqWhFxuf8jD/bEq+0J
         qsuQqO5ahTDB/h8TRhSC87xTSZOngtuT3mXo0cJUht3m6HoOEPy+TrhfphXz2tdopLEb
         gDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792552358; x=1793157158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MfRkPM22ZaiSo4hToB8MNzjEQGDixsa8Pt0dtjpR+tE=;
        b=c+8wHCacbytqr7S57yj/GHfl7Lj1uK74JoSg3Va5ILy3h/3E6+GRXPht7l6JSUApWk
         1qd3k/ft1JOSLFy1p51JbxrrVSU9jSXVAGSRwcMQL5o4PAl0Wo9uYbsQjIWCVwpe6v0g
         RnIXv00RF0LgJf8zpUMQ4v70Hx2/DO7tOvcMEXYfTCt8emJU+5QST2bXU+ZUQp6w7CUX
         TMFxxsPWVIwOFGALLXM19/p4jTXi84KSQ3FTOBjnmbTONFTaKGjBISJGdxwWtj1wDKuD
         BR5QES0Ae3MRje4cj+gsMs9/vUWUL06krm4/RXWDFjLeYxBtyesUKJxtTJC1swXgxSo5
         +hOA==
X-Forwarded-Encrypted: i=1; AKwUvBzYbFeWFy9l15ZHAO/m0jRwSr/rWGO+rjD5RP23UqmkjzZIJClO3Vp42WV5plz2jgkhBwk7WOLTue84AzU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjfMzrPtOImDurO2yK7AHppPoIbdpG38I0EZ6zQjp4n/btDTtf
	19SWZ3yjPMyhyaDwKlVisqcOXQlmDStigFYsvMKaLmS+zcL11lC6w+Y3EaDsPa4VG84JjjFabau
	gLEo5WHaJcrntFgY/mTHaW2TMI1WaoPUSUeKjrm0maYzdTnSruOcf6TPoOuKWdaf889E=
X-Gm-Gg: AYBFou3nyiX4TC8vGWSRmO6Dwz2YAJyBf2kyfr+ycnfQPUv5EFlfAfy9cYV/dGreehH
	9W0w7QVjjvrPUZ388wKW7ZRFzwMdq06GcvIRcRG6GW1rvpAdTXr2mWt0G9J+DZhtig25mJk9I5r
	305IC0tdne3t8OZhcpcy6msS66eAcyb+bYhiuo5mT5r0S76i1yTp/KI9Tcd3d5UWWHRYfWXUN7l
	s/+8cnMSYE6Ewv04emb1Gi5z6pBOe/4yRpptHh3qXBtfRGipG3eUNjBTO//dj7PZJevNcxZ7fcc
	1hfJ+QvnWxhpl/bEZ2TDNsgQGLRsfGY6Dy97F9R7QLW7YQf2iEQCvTO+vtl6XRJ/WmJzA/hYXpn
	ybgJZzfC5nLqBIiIWFdPvARwJRUPqplaqAaFmJTvA9CvS2PazRemBUzOCFrs=
X-Received: by 2002:a05:7022:698c:b0:17b:fed6:7449 with SMTP id a92af1059eb24-190a7c21166mr1390120c88.47.1792552357381;
        Tue, 20 Oct 2026 20:12:37 -0700 (PDT)
X-Received: by 2002:a05:7022:698c:b0:17b:fed6:7449 with SMTP id a92af1059eb24-190a7c21166mr1390070c88.47.1792552356642;
        Tue, 20 Oct 2026 20:12:36 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a180adasm2517518c88.8.2026.10.20.20.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 20:12:36 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Shenghao Ding <shenghao-ding@ti.com>,
        Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
        Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] ASoC: codec: pcm1681: Acquire sck when bound to a card
Date: Wed, 21 Oct 2026 11:12:28 +0800
Message-ID: <20261021031228.2074402-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-GUID: 9jfcWNrXDcrjM_nrImwFHodgjzybQ19X
X-Proofpoint-ORIG-GUID: 9jfcWNrXDcrjM_nrImwFHodgjzybQ19X
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad82da6 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=7YZ_7jEC5wYdKgbzYxcA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX4V2ScrHiHsZz
 QX7A9XumphJ0NB5UstRkclGTL7w0wssU9Kvj0cz9/gR/CKjd7OoMEejc01UPbSeTsH6pdvKABcm
 Jr7kDSmZ9ls3pVAMPV2C3/LE0wT8wS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX+/XtEl++jJ+N
 tIsghdko3i35G8zcXY3Bwad5ySb/zLQpYR0dP+LM2LinHBpAku//jYWKmR+1ErWTr6GMfrRwL3t
 B116S5jIuF/0uwUsw97gtoCIf8S3m4VrX9dmJjKM2Xgau3DWtBJRqO199+RO49VXoFUvbKaZNeV
 Yramc1Z8PhMTZeaqILZa9ofI31aUZmqVTHM/B4RP8cDmxWkCP620PgjC7WriPZ2D4AkEb4hst1l
 miPZfRXyLvj6xsKxNYetsRQaEQ30hyKPvc5DpimrLYYAg8aDBHN5aW4LnJ+9n5i1F4rZYFc88Xe
 FKZVRFjZTEF5hJ8K4wB9MEqOc0jpjis+6+5xN7MTOmzCL04nHWEKJWdk2FwUlSYyF6M+2lBJZ4f
 M5REfWI73+3ppGezFUQuhS6ulCUvxSIXqyrPwjIM1Uv2JS9Vrv3GKqlOe1dgTirylQoXLz3il45
 U8ipFcgN/vOaEo8DCjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210012

The sck clock is taken once at i2c probe and held for the lifetime of
the device. On Qualcomm boards it is an LPASS clock exported by the
q6prm clock controller, which lives on the DSP and is unregistered and
registered anew whenever the ADSP is stopped and restarted. fw_devlink
cannot tie pcm1681 to that provider, since the provider node only gets
a device once the DSP is up, so it falls back to the remoteproc device,
which stays bound across a DSP restart. pcm1681 is therefore never
unbound and keeps a clk handle to the dead provider.

After an ADSP restart the first runtime resume fails with:

  pcm1681 0-004c: Failed to enable sck: -6

and there is no playback through the DAC. Even with a fresh handle the
DAC stays silent: the new provider registers its clocks at their
default rate (19.2 MHz), while assigned-clock-rates (12.288 MHz) was
only applied by the i2c core at probe time.

The sound card, however, is torn down and re-created on a DSP restart.
Move sck handling into the component probe/remove callbacks: get the
clock, re-apply the assigned clock rates and enable it each time the
component is bound, and release it on removal. The i2c probe now only
sets up supplies and the regmap, keeping the cache in cache-only mode
until the clock is running, and the cache is synced once sck is up.
Runtime PM is enabled and disabled together with the clock.

Fixes: 8987e9a24f45 ("ASoC: codec: pcm1681: Add optional SCK clock and runtime PM support")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 sound/soc/codecs/pcm1681.c | 122 ++++++++++++++++++++++++++-----------
 1 file changed, 88 insertions(+), 34 deletions(-)

diff --git a/sound/soc/codecs/pcm1681.c b/sound/soc/codecs/pcm1681.c
index 6002da3a5666..2cc34561aa83 100644
--- a/sound/soc/codecs/pcm1681.c
+++ b/sound/soc/codecs/pcm1681.c
@@ -13,6 +13,7 @@
 #include <linux/regmap.h>
 #include <linux/of.h>
 #include <linux/clk.h>
+#include <linux/clk/clk-conf.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <sound/pcm.h>
@@ -321,7 +322,87 @@ static const struct regmap_config pcm1681_regmap = {
 	.cache_type		= REGCACHE_MAPLE,
 };
 
+/*
+ * sck may come from a DSP-hosted clock controller that is torn down and
+ * re-registered when the DSP restarts, which also rebinds the card. A clk
+ * handle kept across that would point at the dead provider, so only hold
+ * sck while the component is bound to a card.
+ */
+static int pcm1681_component_probe(struct snd_soc_component *component)
+{
+	struct pcm1681_private *priv = snd_soc_component_get_drvdata(component);
+	struct device *dev = component->dev;
+	int ret;
+
+	priv->sck = clk_get_optional(dev, "sck");
+	if (IS_ERR(priv->sck)) {
+		ret = PTR_ERR(priv->sck);
+		priv->sck = NULL;
+		return dev_err_probe(dev, ret, "Failed to get sck\n");
+	}
+
+	/*
+	 * A re-registered provider comes back at its default rate, and the
+	 * driver core applied assigned-clock-rates only once, at i2c probe.
+	 */
+	ret = of_clk_set_defaults(dev->of_node, false);
+	if (ret) {
+		dev_err(dev, "Failed to set assigned clock rates: %d\n", ret);
+		goto err_put;
+	}
+
+	ret = clk_prepare_enable(priv->sck);
+	if (ret) {
+		dev_err(dev, "Failed to enable sck: %d\n", ret);
+		goto err_put;
+	}
+
+	pcm1681_sck_settle(priv);
+
+	/* The DAC lost its state if sck went away while unbound */
+	regcache_cache_only(priv->regmap, false);
+	regcache_mark_dirty(priv->regmap);
+	ret = regcache_sync(priv->regmap);
+	if (ret) {
+		dev_err(dev, "Failed to sync regcache: %d\n", ret);
+		goto err_disable;
+	}
+
+	/* The clock is on, so hand the now-active device over to runtime PM */
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	pm_runtime_idle(dev);
+
+	return 0;
+
+err_disable:
+	clk_disable_unprepare(priv->sck);
+err_put:
+	clk_put(priv->sck);
+	priv->sck = NULL;
+	return ret;
+}
+
+static void pcm1681_component_remove(struct snd_soc_component *component)
+{
+	struct pcm1681_private *priv = snd_soc_component_get_drvdata(component);
+	struct device *dev = component->dev;
+
+	pm_runtime_disable(dev);
+	/* Runtime PM may already have gated the clock */
+	if (!pm_runtime_status_suspended(dev)) {
+		regcache_cache_only(priv->regmap, true);
+		clk_disable_unprepare(priv->sck);
+	}
+	pm_runtime_set_suspended(dev);
+
+	clk_put(priv->sck);
+	priv->sck = NULL;
+}
+
 static const struct snd_soc_component_driver soc_component_dev_pcm1681 = {
+	.probe			= pcm1681_component_probe,
+	.remove			= pcm1681_component_remove,
 	.controls		= pcm1681_controls,
 	.num_controls		= ARRAY_SIZE(pcm1681_controls),
 	.dapm_widgets		= pcm1681_dapm_widgets,
@@ -359,11 +440,6 @@ static int pcm1681_i2c_probe(struct i2c_client *client)
 		return dev_err_probe(dev, ret,
 				     "Failed to enable supplies\n");
 
-	priv->sck = devm_clk_get_optional(dev, "sck");
-	if (IS_ERR(priv->sck))
-		return dev_err_probe(dev, PTR_ERR(priv->sck),
-				     "Failed to get sck\n");
-
 	priv->regmap = devm_regmap_init_i2c(client, &pcm1681_regmap);
 	if (IS_ERR(priv->regmap)) {
 		ret = PTR_ERR(priv->regmap);
@@ -371,53 +447,31 @@ static int pcm1681_i2c_probe(struct i2c_client *client)
 		return ret;
 	}
 
+	/* No sck until the component is bound, serve access from the cache */
+	regcache_cache_only(priv->regmap, true);
+
 	/* Must be set before runtime PM is enabled, the callbacks use it */
 	i2c_set_clientdata(client, priv);
 
-	ret = clk_prepare_enable(priv->sck);
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to enable sck\n");
-
-	pcm1681_sck_settle(priv);
-
-	/* The clock is on, so hand the now-active device over to runtime PM */
+	/* Runtime PM is enabled from component probe, once sck is running */
 	pm_runtime_set_autosuspend_delay(dev, 100);
 	pm_runtime_use_autosuspend(dev);
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
-	pm_runtime_idle(dev);
 
 	ret = devm_snd_soc_register_component(dev,
 					      &soc_component_dev_pcm1681,
 					      &pcm1681_dai, 1);
 	if (ret) {
 		dev_err(dev, "Failed to register component: %d\n", ret);
-		goto err_pm;
+		pm_runtime_dont_use_autosuspend(dev);
+		return ret;
 	}
 
 	return 0;
-
-err_pm:
-	pm_runtime_dont_use_autosuspend(dev);
-	pm_runtime_disable(dev);
-	if (!pm_runtime_status_suspended(dev))
-		clk_disable_unprepare(priv->sck);
-	pm_runtime_set_suspended(dev);
-
-	return ret;
 }
 
 static void pcm1681_i2c_remove(struct i2c_client *client)
 {
-	struct pcm1681_private *priv = i2c_get_clientdata(client);
-	struct device *dev = &client->dev;
-
-	pm_runtime_dont_use_autosuspend(dev);
-	pm_runtime_disable(dev);
-	/* Runtime PM may already have gated the clock */
-	if (!pm_runtime_status_suspended(dev))
-		clk_disable_unprepare(priv->sck);
-	pm_runtime_set_suspended(dev);
+	pm_runtime_dont_use_autosuspend(&client->dev);
 }
 
 static int pcm1681_runtime_suspend(struct device *dev)
-- 
2.43.0

