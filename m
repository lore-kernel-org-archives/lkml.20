Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0314DDB4C
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791551609; cv=none; b=ErvFH3hglDFjUFQD0Xp1u3ubn+XoMZliD+k4a7e7peBcQPtOH0dbbBNUQT+6qRkXF9Is/cDk+JG90A6sHsCNJd8AFNlIgsPIJN0uic3fgnkKvdG0SlTZPUOozxCGV8pNycZWhbIkJLqTjCydr2/qFjR4/XWNrhpIvSHOdihq4yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791551609; c=relaxed/simple;
	bh=nOdZ4dJi4CLhoIaxTZa04AzcpHb/EaKg/lezdA5JK/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iMrYPkV/pUTpSv2C53L6xi4dCLSzRsArMscfj/Yh5WLdlieFUs/tiYBEJeN+k2eHNOsvOXyQSd7t2MbztDMTn1/aylPXbP3psouAljUaVwt8v7Gq4bEnwch2pIpNxMwsHM/kPlIPZWHGWHU9D149BSP0y0J2zaOcqVxKZFL/3pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GYqKdFNA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MeQpHO92; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GYqKdFNA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MeQpHO92"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KOgA3977832
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 13:13:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c3OozHMDKL9LuB/ECNG3iM90iusYb3/LluZS0Rot1V8=; b=GYqKdFNA1hPHi5Ne
	AJ1xZy4Lgooj6UAjMbcvVaPh1+nqsghXxm5WTDzjdY+n+o/TcozKRY/FqP+dBJFA
	0swNTZL+h1szolwRccPOcWfpVo2NbeBaRK+m/Hgh62LjHT1fY+2Ya4/MIZi0ZOCA
	pu42Nb4upV+xrxfaBxTzwYfNAhsbOY6BMwaS5uoc6Bai04DQ+ISG4nLQVYmpkpuq
	FlYHHu0Qa8PbWy/ke4VRFshIO0E9BWj8RNssczujSon4I0EIhB9nqc0vqxuVWCm2
	9Mj81Y9ackzhXwBmuohVGiYet+UqWp+KUQWsKnKwGNUINn3OKk40VgJsfpP3vpFm
	1iBxxw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ev5byhb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 13:13:26 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-88a10162189so8889006b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791551606; x=1792156406; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c3OozHMDKL9LuB/ECNG3iM90iusYb3/LluZS0Rot1V8=;
        b=MeQpHO92iFLHSnJTA3TgvYtbgLhK3Q6bHdCFWaDfkETuUJL9cNHaEOrlYmhsWd4azO
         i+1tYO7D66SaClejU4PhourFpIcRGIAkdyss7JEhxO1Wev5ayFQbBWz3SBHYkCKTsDnP
         +uIeA5qUAe5w/C8hO0+/GjwXWU37hKS0XV9dN9l4lQtilhLkMgcVT18NMP4TWkXFPMxf
         mO3HzZToV+CzOfwRWfU9WaZXGAYFVyKmzIk2i0+02ktRbczrn76QRllWPtKakLnGM8jv
         9ZYCbYcafh56lM8usnIxTKWnI3jZWysMgqLuZpmAgAPXeW6GvAgXk5mtC5+62SjI7wBh
         1gyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791551606; x=1792156406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c3OozHMDKL9LuB/ECNG3iM90iusYb3/LluZS0Rot1V8=;
        b=qcsCH8Snb43OWzw99FPLvYn2Yuqg1KTq1jQ+YhhiuMgxMZxS1NBx1ivxB4Xzv8wCSZ
         aVrcL2W9nWKQYjHNXj0Fns67ZDFBIygpzOSlhXw/O63HOrk4fd1/uwC8yzBp+QDcrmq2
         wz9FZmGsIwGq12ByGreL2Wyl8fUEFpaC6Bjxz3XBCYDYhywpXtsRe+PVFW1wNQgLy7Jj
         IlzzpgZy9Yp+FFjE/lIXmPQ3MX7iMuBM13nSB5u/YEFO2VKX8yrd3JgUQaJZ9N76d2Tl
         Rk13uD+ffOP79X3RItFgClg/Mw1UKwh+p0b0hRAuM3qdyyS71WP70ivs272vwnlNsRpw
         LchA==
X-Forwarded-Encrypted: i=1; AKwUvBy8ewnjdz+FPtLfjHRp+q96ocrHOXnogJoU8pk1+zBLjdyI7ttDp+JK9cMSVHR7uC2iZtT8KaRVplMBLII=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBWAsTYVEHYYId548+BN10Bt5Q/dHvEqYPh5tJD2oAQrbkNM4g
	Hjra3JpqO+4CK5EhNeLLvPKS8RonMsDAJMRDpq1UQZw7xcdqDzxOIYMfa6bbd/+uYD2/XvG96aF
	42U66vhHAQeOBp/5EtL8gl0pnpWeUtA3/sFAGZMbOkPFPolXeTTgLNbwZVBPLUOZKQzs=
X-Gm-Gg: AYBFou01CEJYK9eULVCVkeM2UOThvwTy764uBvGGHmrfUfkrcIeX9FiWkIL07NA3joJ
	3+4F6taAzY35xTZoznWZp1Yk6PLQ15zHjGNhGmoLHrEEz4afGO3CTavcNt27Z8dLDFMlJHWe52L
	1eIPgrJK/dQb6VKE0JFusZvDsi6flYHhuBEo4BLjvOZmg2izkBV7WKGG9kcyfIyKDrYpZFhnsov
	w4IU8ytEzPffEEp+KKH+irjwtkvb0ICoBeLUE/ss6pHbL7aWUZXNlVugbCEP5i6K4pANBSSnFDY
	/mt4yPkZYdPWrRDY0OOjtdDzGEPJFgZt86i/MYcs1bhgpr+Q/ueqZrWPFHNFXjhTMM4RCgZCW7h
	1sDdjWncf6v3eJsNzwjX5ufRO5UN5Uj3UszfJ
X-Received: by 2002:a05:6a00:4c9a:b0:882:be9:b779 with SMTP id d2e1a72fcca58-897c85aa47emr1623650b3a.57.1791551605596;
        Fri, 09 Oct 2026 06:13:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c9a:b0:882:be9:b779 with SMTP id d2e1a72fcca58-897c85aa47emr1623607b3a.57.1791551605027;
        Fri, 09 Oct 2026 06:13:25 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c4b8ec86sm939053b3a.61.2026.10.09.06.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:13:22 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 18:42:48 +0530
Subject: [PATCH v3 2/7] ASoC: codec: pcm1681: Add optional SCK clock and
 runtime PM support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261009-nord-asoc-driver-support-v3-v3-2-0c1897f21ccf@oss.qualcomm.com>
References: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
In-Reply-To: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791551582; l=7870;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=nOdZ4dJi4CLhoIaxTZa04AzcpHb/EaKg/lezdA5JK/I=;
 b=njuWqfiz2ozyEy+tL5Oa98VOOrZ6Wc2MUGR1IAALaOG9vEpnUKSukYdq2FWAjv+7rS/qH6C3N
 EqYIVsnqaryC68tw/AByIKKrfxgbgr+HuHs/xVzUi1P8oIUBYuHWdqe
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfX3LlHownmN9pe
 kS5Lq7vFmQTj2xYbd0dwClGeCPRENVj/WMA/bYPjPizmSzVDuzlpwiZhXfBW2TG89cqAHbql8kp
 PfZluJVZntx+i/nL5UQwF3rFeYLD+NU=
X-Authority-Analysis: v=2.4 cv=MMT1C8Zl c=1 sm=1 tr=0 ts=6ac8e876 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=4Eonb4LKoOtaKfZtrqEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 1JQAlzxe_-0_vdhnfhpMD-eRcxMze-a5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfX6PPCwlo2HFx+
 9Do03RBIjSLmNfUd+ZEXUR6xDH/1CBLum/C8injcVp7LydfYGWTlS6VvXx0FGoRF65Gf6Im+Uyb
 YI+RqeGYn2KZJkI3+cT1MiQhpXi0y7ZN6cbimnDXsXjwDsQbh/HwoQjRUnLj4eysuiUmCQxsPJi
 WH6K1Uxudjh4L3Wm/yX2aBX3hoqXyoDVbrPhkWhHRExPUjuB6ACB2IslVa3DmeG1U6XUSApth8M
 dM1Qfy+4/iug1M/RydiW1kx/1+qb29jTU25Ur21UNriU/I64+/FJwq8XyLSCw+/5zWVT3bp36up
 t0qDjU6N+YUgUJu+jiB99cW6QSi37S6octwe2tqDaOu1c8FqUa75z8hyXsji/QnKfmSx1xijIHE
 E0lhMAaPzx4QiEsLRPUWSNduwoCAfhBTq5G04NMYJYiqAVUrbDYJC0sv8TEPo+/o9KseX3X+OR3
 dFS914jieHRD0qvsIYA==
X-Proofpoint-ORIG-GUID: 1JQAlzxe_-0_vdhnfhpMD-eRcxMze-a5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090052

The PCM1681 requires its SCK system clock to be running before register
access. On platforms where SCK is provided by a gateable clock, register
access may fail when the clock is disabled.
 
Add support for an optional "sck" clock and enable it before accessing the
device. After enabling SCK, wait for the required 65536 system clock cycles
to allow the device to complete its internal reset sequence.
 
Use runtime PM to manage SCK instead of keeping it enabled for the lifetime
of the device. Disable the clock during runtime suspend and restore it on
runtime resume. Use autosuspend to avoid unnecessary clock toggling between
closely spaced accesses.
 
Since the device register state may be lost when SCK is disabled, enable
the regmap cache. Switch regmap to cache-only mode and mark the cache
dirty on runtime suspend, then synchronize the cached register state after
SCK is restored on runtime resume. Mark the zero-detect status register
volatile since it is updated by hardware.
 
Drop idle_bias_on so that the component can reach SND_SOC_BIAS_OFF and
runtime suspend can gate SCK.

Assisted-by: LLM
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/pcm1681.c | 137 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 131 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/pcm1681.c b/sound/soc/codecs/pcm1681.c
index 60fdbe5c4..a1ccf1edf 100644
--- a/sound/soc/codecs/pcm1681.c
+++ b/sound/soc/codecs/pcm1681.c
@@ -12,6 +12,8 @@
 #include <linux/i2c.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
+#include <linux/clk.h>
+#include <linux/pm_runtime.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -36,6 +38,12 @@
 #define PCM1681_DEEMPH_CONTROL	0x0a	/* De-emphasis control */
 #define PCM1681_ZERO_DETECT_STATUS	0x0e	/* Zero detect status reg */
 
+/*
+ * The DAC requires 65536 system clock cycles after the clock is supplied to
+ * complete its internal reset sequence before it is ready to be used.
+ */
+#define PCM1681_SCK_SETTLE_CYCLES	65536
+
 static const struct reg_default pcm1681_reg_defaults[] = {
 	{ 0x01,	0xff },
 	{ 0x02,	0xff },
@@ -67,6 +75,12 @@ static bool pcm1681_writeable_reg(struct device *dev, unsigned int reg)
 		(reg != PCM1681_ZERO_DETECT_STATUS);
 }
 
+static bool pcm1681_volatile_reg(struct device *dev, unsigned int reg)
+{
+	/* Status is updated by the hardware and must never be cached */
+	return reg == PCM1681_ZERO_DETECT_STATUS;
+}
+
 struct pcm1681_private {
 	struct regmap *regmap;
 	unsigned int format;
@@ -74,8 +88,24 @@ struct pcm1681_private {
 	unsigned int deemph;
 	/* Current rate for deemphasis control */
 	unsigned int rate;
+	struct clk *sck;
 };
 
+/* Wait for the DAC to come out of its internal reset after sck is enabled */
+static void pcm1681_sck_settle(struct pcm1681_private *priv)
+{
+	unsigned long rate = clk_get_rate(priv->sck);
+
+	/*
+	 * sck is optional, so there may be no clock to wait on, and its rate
+	 * is not always discoverable. Only wait when the cycle count can be
+	 * converted into a delay.
+	 */
+	if (rate)
+		fsleep(DIV_ROUND_UP_ULL(PCM1681_SCK_SETTLE_CYCLES *
+					(u64)USEC_PER_SEC, rate));
+}
+
 static const int pcm1681_deemph[] = { 44100, 48000, 32000 };
 
 static int pcm1681_set_deemph(struct snd_soc_component *component)
@@ -282,6 +312,8 @@ static const struct regmap_config pcm1681_regmap = {
 	.num_reg_defaults	= ARRAY_SIZE(pcm1681_reg_defaults),
 	.writeable_reg		= pcm1681_writeable_reg,
 	.readable_reg		= pcm1681_accessible_reg,
+	.volatile_reg		= pcm1681_volatile_reg,
+	.cache_type		= REGCACHE_MAPLE,
 };
 
 static const struct snd_soc_component_driver soc_component_dev_pcm1681 = {
@@ -291,7 +323,6 @@ static const struct snd_soc_component_driver soc_component_dev_pcm1681 = {
 	.num_dapm_widgets	= ARRAY_SIZE(pcm1681_dapm_widgets),
 	.dapm_routes		= pcm1681_dapm_routes,
 	.num_dapm_routes	= ARRAY_SIZE(pcm1681_dapm_routes),
-	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
 };
@@ -304,34 +335,128 @@ MODULE_DEVICE_TABLE(i2c, pcm1681_i2c_id);
 
 static int pcm1681_i2c_probe(struct i2c_client *client)
 {
+	struct device *dev = &client->dev;
 	int ret;
 	struct pcm1681_private *priv;
 
-	priv = devm_kzalloc(&client->dev, sizeof(*priv), GFP_KERNEL);
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
+	priv->sck = devm_clk_get_optional(dev, "sck");
+	if (IS_ERR(priv->sck))
+		return dev_err_probe(dev, PTR_ERR(priv->sck),
+				     "Failed to get sck\n");
+
 	priv->regmap = devm_regmap_init_i2c(client, &pcm1681_regmap);
 	if (IS_ERR(priv->regmap)) {
 		ret = PTR_ERR(priv->regmap);
-		dev_err(&client->dev, "Failed to create regmap: %d\n", ret);
+		dev_err(dev, "Failed to create regmap: %d\n", ret);
 		return ret;
 	}
 
+	/* Must be set before runtime PM is enabled, the callbacks use it */
 	i2c_set_clientdata(client, priv);
 
-	return devm_snd_soc_register_component(&client->dev,
-		&soc_component_dev_pcm1681,
-		&pcm1681_dai, 1);
+	ret = clk_prepare_enable(priv->sck);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable sck\n");
+
+	pcm1681_sck_settle(priv);
+
+	/* The clock is on, so hand the now-active device over to runtime PM */
+	pm_runtime_set_autosuspend_delay(dev, 100);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	pm_runtime_idle(dev);
+
+	ret = devm_snd_soc_register_component(dev,
+					      &soc_component_dev_pcm1681,
+					      &pcm1681_dai, 1);
+	if (ret) {
+		dev_err(dev, "Failed to register component: %d\n", ret);
+		goto err_pm;
+	}
+
+	return 0;
+
+err_pm:
+	pm_runtime_dont_use_autosuspend(dev);
+	pm_runtime_disable(dev);
+	if (!pm_runtime_status_suspended(dev))
+		clk_disable_unprepare(priv->sck);
+	pm_runtime_set_suspended(dev);
+
+	return ret;
 }
 
+static void pcm1681_i2c_remove(struct i2c_client *client)
+{
+	struct pcm1681_private *priv = i2c_get_clientdata(client);
+	struct device *dev = &client->dev;
+
+	pm_runtime_dont_use_autosuspend(dev);
+	pm_runtime_disable(dev);
+	/* Runtime PM may already have gated the clock */
+	if (!pm_runtime_status_suspended(dev))
+		clk_disable_unprepare(priv->sck);
+	pm_runtime_set_suspended(dev);
+}
+
+static int pcm1681_runtime_suspend(struct device *dev)
+{
+	struct pcm1681_private *priv = dev_get_drvdata(dev);
+
+	/*
+	 * Registers lose their contents once the clock is gated, so serve
+	 * further access from the cache and replay it on resume.
+	 */
+	regcache_cache_only(priv->regmap, true);
+	regcache_mark_dirty(priv->regmap);
+
+	clk_disable_unprepare(priv->sck);
+
+	return 0;
+}
+
+static int pcm1681_runtime_resume(struct device *dev)
+{
+	struct pcm1681_private *priv = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(priv->sck);
+	if (ret) {
+		dev_err(dev, "Failed to enable sck: %d\n", ret);
+		return ret;
+	}
+
+	pcm1681_sck_settle(priv);
+
+	regcache_cache_only(priv->regmap, false);
+	ret = regcache_sync(priv->regmap);
+	if (ret) {
+		dev_err(dev, "Failed to sync regcache: %d\n", ret);
+		regcache_cache_only(priv->regmap, true);
+		clk_disable_unprepare(priv->sck);
+		return ret;
+	}
+
+	return 0;
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(pcm1681_pm_ops, pcm1681_runtime_suspend,
+				 pcm1681_runtime_resume, NULL);
+
 static struct i2c_driver pcm1681_i2c_driver = {
 	.driver = {
 		.name	= "pcm1681",
 		.of_match_table = of_match_ptr(pcm1681_dt_ids),
+		.pm	= pm_ptr(&pcm1681_pm_ops),
 	},
 	.id_table	= pcm1681_i2c_id,
 	.probe		= pcm1681_i2c_probe,
+	.remove		= pcm1681_i2c_remove,
 };
 
 module_i2c_driver(pcm1681_i2c_driver);

-- 
2.34.1

