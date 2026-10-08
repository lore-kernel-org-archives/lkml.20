Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F33457E7B
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791457641; cv=none; b=nfv/dQfv0oDffxGibBI1iBfRhCA2gFekJZ0T4/FvbfnTMWA9ReDqvqpTaCobRrLeFBSnzFqtnRf5GAY4gDu5uCaGnME5pmZEHw0VMf+P2OHpC7+8JRQxrPkrY3z8VctKFJDgRPM8mJJouUYLSPuUkaV7W0ZpQgswoDIbC7+nPzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791457641; c=relaxed/simple;
	bh=nOdZ4dJi4CLhoIaxTZa04AzcpHb/EaKg/lezdA5JK/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p8SSxutMjzvM0a6c26StjXWuGUTcPe0FJJZxJ+vGrYNADhtGNif+kgC1KtgUl5syb6m+nEs+szFfyRM/doGksxp4RDMLkQJLF/jaeiBUPq4ROC1hMGKcosyq19Oxl8cSXs9IYkjvSxrPdgd+rzUK06Suh0rTipJKdrYgc5AU9XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bGqgFtQV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BPYFSzq7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bGqgFtQV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BPYFSzq7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698AbWAW1614166
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 11:07:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c3OozHMDKL9LuB/ECNG3iM90iusYb3/LluZS0Rot1V8=; b=bGqgFtQVwskzzt3b
	8GSPqx/ZkNx8makqR+9WLg73mtyajo1QGU8cRi9XKbZPgWGcK04UhFgiyX30lOFa
	BB9viCzpvAK6xp8kBSa0C10EdvwDeLTPqtv9f9ds5h2KiZyOCfsSZHl2oYuefxOe
	l6DWsRnXaOzj+dT8LM7vJa7a7tOnhXHvH42pt2ILyhEoj0J67o0D2DxPeqhOfNG6
	XjXHMvaIWwC7TeQ4Zh0mCKFg9pm49n66pK+nfL+6SzcAAWC+gxXzyp/VMT5gPOfY
	M5b1pEouiJol5itq28G8DzFImXaElWVEQ0/kH8MNZAcxI3XjI1LyIlYXACRCbyRG
	xNuwcQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3ajrs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 11:07:15 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-88d2d26a8d5so630226b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 04:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791457635; x=1792062435; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c3OozHMDKL9LuB/ECNG3iM90iusYb3/LluZS0Rot1V8=;
        b=BPYFSzq7kJkwtuE27Y29ObD4piyaB4rfPL2B9wdwuFJvZOnhyTxtzW9mSs8RD+iviS
         JzvIGs2VbkGQwbyoW9zUhI0FlU6gqpjQ3GEcrhijEVkdJeRFCiQs7yN8XfYhdkbeoZgH
         d12H132rjbr9H7268ZeC2rjB1PVi0SMwu1c0/8051GCXfKW3I8dTOzlGP13vhnEMeDlX
         GxkOhpoGebyoBZoF/WJZXPkis+x92t2gyFlfqNWhQdqWxqjcyWhjqob8T+XO8Q1ugcBT
         6sGhkgOVk48LAWg9Bs8LkZgQ8CwDdTgzhQbPrISagsvzhP2ZqpnChF/E/bEQkwfbzQnb
         IW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791457635; x=1792062435;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c3OozHMDKL9LuB/ECNG3iM90iusYb3/LluZS0Rot1V8=;
        b=KJDvAW5E4KhgXR0e9kipbvkeAnlmHjqcErjY2ExelztKd3iP9ygqfIFl72mI4QYz6g
         yrZn9Cuk4NksTglDlo65M4YafWR8LyNjDGdlrQwO991IhQi4qei0Zxm5tDHIplKg7rob
         IVoleUC+rBV3SAv58QIv8vSnAYIw4ZrrKG2cb80J2XJFcJPv5jcP1wHynmSUV+ohf+2q
         W2Ul3+kZVq0H12iB6TvnIWMKTcZuHQOE2AgGb9GbPGxtyVRZRSpVki/7Evy3cX05cDTF
         QoiRBqo9KWS9pgrh0GKFxiLAA5wHPjmNV7gKNytLyylRyQhI4hRqD6JDaqA/uR+LhXND
         f6Aw==
X-Forwarded-Encrypted: i=1; AKwUvBzEz2EY5T+Cn1zaKsKOnT+y2LYknlHjjqMa9S3Eh8uXeJa0/rw/MFfgxSMb8Jk4/ihUy8tzSpBd1fvFycA=@vger.kernel.org
X-Gm-Message-State: AFuF++lcivSNuY6q7ykCAFp34z0R854uf90x1/td8rFactAJ+CpQkyT7
	rhpQXuHjoRuXHQqt5CX7XHu7uR3LBvWvfKq9Cl6oPnnd/2Q6LVPFhJBHmSZxLwStQW8t6aXDy3K
	77jngU5X/siA62tJ93cEizpvoAk5zUYC+m1Gb95Cvw9IyjooYRdr7JHYgrNZbDxP9GjI=
X-Gm-Gg: AYBFou2iN7YPFG45Jz+5+7ZFFowWaZx/YEadLfyWVT8PSZQskLZSih10aaL5SbUSOVy
	nmb98qD9UhJp4pa9GEwqSxWYwtIG77p7RuFXV8PmFpRDZHiQwmk/Cc7hS8A1XouLtUxv/wYYEBa
	ty+SA5brjEbF3pzBaet+bzkNK6ISfI0hxe8pbaQEhmwYZ7THmuXp6IBe8J/O1wm3qGoBlSRDsld
	wk+HR/nYP23goyzzyZRFi9yFMnuV5rH3vfW7KN1rD9vB6O/GAVgJvtmTvlOV04H6g6nJInFEG5N
	5m0XhfGrNR2zTd4/+zMkXemFUfa6bdKPNyudblLefAhi8T1xPSfiAi56XVmnjjlWfHJno94h70J
	PK4PN08fgvVe2IhL7ckwbMxNDmaXYWVz4v9pG
X-Received: by 2002:a05:6a00:194f:b0:878:3705:571d with SMTP id d2e1a72fcca58-8930d4f60bamr1260977b3a.41.1791457634690;
        Thu, 08 Oct 2026 04:07:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:194f:b0:878:3705:571d with SMTP id d2e1a72fcca58-8930d4f60bamr1260950b3a.41.1791457634143;
        Thu, 08 Oct 2026 04:07:14 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-892b560a21fsm1408917b3a.0.2026.10.08.04.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 04:07:13 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 16:36:42 +0530
Subject: [PATCH v2 2/5] ASoC: codec: pcm1681: Add optional SCK clock and
 runtime PM support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261008-nord-asoc-driver-support-v2-v2-2-0b6f7e94060d@oss.qualcomm.com>
References: <20261008-nord-asoc-driver-support-v2-v2-0-0b6f7e94060d@oss.qualcomm.com>
In-Reply-To: <20261008-nord-asoc-driver-support-v2-v2-0-0b6f7e94060d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791457615; l=7870;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=nOdZ4dJi4CLhoIaxTZa04AzcpHb/EaKg/lezdA5JK/I=;
 b=LBgNjpDLTyFDpIrwchKCTmDRLMJ6hQa01TIQgtIEoWul2a/QKjd/k/53GwxyvKQpetI1ZtEMQ
 OIU2JW6bVgRDUKiNe+XrziqaIbjUB9PTA9BG/Ye/9l1zH3kbSAaD1wW
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: 9Vf_X84U6sYlDQXfP4zLGB7IaUnnVGfK
X-Authority-Analysis: v=2.4 cv=QOz91QLL c=1 sm=1 tr=0 ts=6ac77963 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=4Eonb4LKoOtaKfZtrqEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NCBTYWx0ZWRfX6DvDpa6cJiGj
 1I1h/4XK4UzqikISTIzAiW3CFtLVdEnTUTnwk1SJNcuDhx5rtCYomCQdPNCGCy8NNGxPy+gg8eN
 sG9UBvLsa6WhPj/VH+kTU+UrDopICi4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NCBTYWx0ZWRfX0IrGTgmR4rix
 CphXMT84UFqOTdV/hlnpGW6aCq9rqzkytZ/vKhoYCjHae3udlvzMCUU+9iRk0T/l/JC9Ia5TkOk
 H6LlIkZX+LGQW00DtM/z9eoeRE31R+JCVzYoQLU3kf028Af8nGUMqDrdZ2+bkYrp4g57na5UMKc
 YjIqaOYGUadQ50qI/xnrviGToTblilSMXTXgfoPdnCwncdS9da6zmT9BjnwxYWweYMh9Gxpiiqb
 YuUIQnNXTCLyZCCcvWj/+aPn9RfRGfJoEtWPKFxKmXJG0Ge00eslfyxWZmjD4JaTNpNbJ+3vX6+
 XAL+3Qv6P602ZKI3wg3NxYjctNUip+9lReOq9iEC0fKYqE8a3i/PwsPcC4LTUW4OGK3vORaEfFC
 B4AEdgmDB26VWtx3Hl3w4bol1icEdKHjqxQ+mnjyqbA0NAQlvLEd100690xoWYCSvMWvl9eOAcG
 VRMN6vdTiMzlHWtlMzg==
X-Proofpoint-ORIG-GUID: 9Vf_X84U6sYlDQXfP4zLGB7IaUnnVGfK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080044

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

