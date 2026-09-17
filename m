Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EC335B636
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789611388; cv=none; b=bAUOKsUpYyqhLhY1ONk0arTPIB5jpCwpW3tdUYznyc3GoTmBqZ1EEq9duYUYCvvwyPR23WN+R/fYNPlMwIE8o3Y6a1fhsniQX1tWIrZHogBak5A0U43XEDJroTEu7Rp6nwWHadYUZCT4y/rq79ok8jB21I9BF8ESg2nrc012SyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789611388; c=relaxed/simple;
	bh=8C+D+unSEaRGl8AxrVeK0iFZsXPZ9fBEhD2PWma7i9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DiQFgAJ+hofVWqh7q+eKABAPaphWj2ajzWSN/ezvZ70tq5vpddRqxNUAYBEP0lptTOtSHJHZHx0dh4+CGX1BYTV6clh4HoJMsBJGxMBb1Bp1Sna5ymF1zDibyzbo6yG8MgkFFKnq0EGRuXVlj+93w4/4YvtGka3HPNvGbDl+xpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jJx2GgIC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ORoZc/Q5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJx2GgIC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ORoZc/Q5"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GHP7SB3238097
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:16:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R5InIH9SA9XIaAcbkWSnsbw/NAVph5smayjy91m/6Qg=; b=jJx2GgICayNbhav0
	mCa9kn5knQ/A8+Xoj9HhC9EzgPAF4wxx6boWCgC2FhJWi2JSXyk/r0bq6nW1yM2F
	JsUgLkKM87MwUZGkHXulkXYzTrpaO8AyDAIfL+OJgytJFeCBGs/p5Ew6TQ66y4kI
	pEnLwKVnH7e/MzDpS0thCGLhKAtAKyfNKpDPE1DbIBbUBnt9MeVmIwlNZ9N4J9nN
	VkT7eTHhys9LWFOVJxHQozof050uWjz+eXp8jzwjT5CJ+zjswK7udXNSyrITPJEM
	lRBPuy1TlHLIMHWj39AEYri4nykAxt+NGYXp1Pba3/4thnGneKJWlji/mGIzLhgJ
	MDMBAQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqyga1ss9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:16:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so1030747a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789611385; x=1790216185; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R5InIH9SA9XIaAcbkWSnsbw/NAVph5smayjy91m/6Qg=;
        b=ORoZc/Q5NTyCWEXOuc8IUaKTK0lUm76BMH/90V/JbCQ0oDCcT3VAdA92+N2jLhU82o
         UB0qR7JN/q1CJ1UoxVpC3FkAcO8MazJyoa9bFd9HO6RyHkon6Ouc9Wk2UHnIOSje8Dom
         0ZYNgCkwb20lqV0VojFl3d1srvRfrNoTyMhYwGkYciblnTfeS7G1rLrOEdWgQ6opEXPk
         jx/qBd2pQT1eWXvwrIrmX0/O83XHXzkvBOoMFguFGINEf23W0wZ7lEZbvXAyTk5b08rk
         DrFQ3+sr0lowv2LE8rblVjmeq2ltsQTdv/otuLJYBarTgfWOrqq9Wdmf6Wf/Jyivu5ZI
         n1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789611385; x=1790216185;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R5InIH9SA9XIaAcbkWSnsbw/NAVph5smayjy91m/6Qg=;
        b=TPdFz5f28libnXxsCQfcY48MNlg2gxsvCD33YwptnE9vMhCOvth49nLxf/cTHOtdwA
         F21OdsZ5g5U146TENXvV/XlZz8ettRnm5bw9PTHbJqsHJU+pwcMamtw+UqvMOnPNFGeu
         pll/YoT58gK/plV/O7qW8GuJEx6PTsKdA0ZVQ7TqZYoCaUnCy7EhweqtWV2uxF64sUJU
         u8qYFcG8itaYM7RiTUrkh4pZYPdY/0tAr8DpNubQ8RfmdDZvAht96eB9N0riXR7FhRHA
         bDGZbqfXgte307tc+i4NE01VjkDrUlYLc8yzpYuYrJLRrVUqXRlyJ/rxf+VDcseF6quq
         kz+w==
X-Forwarded-Encrypted: i=1; AKwUvBy3rwiHgZuOh7Wl8B5I01jsG2qE1pbVoinE/ayU6g0h0Xrrt0BVuIgiumLk5kGJv3fjFSh5fGSFTNDjFxk=@vger.kernel.org
X-Gm-Message-State: AFuF++lDVFqbFT4HX3/X926N7AF4q09FXyl4oEENQ7nyhoLZFagGOxFJ
	yoUGtvVZIrJi08+47V/1yPwrXJmW4WGPrWfS70oA47Io2IQ3h67MUqS0QdMHGdVGaf9B0oAdfW5
	5XIZfSAelH4gLtSLik9WSPNR/1YTCHUoDm6mZsXGSVWGT4xZuDm1BC8MXxXKC5iqKkOw=
X-Gm-Gg: AYBFou01RaeHCpTT5MXbRulUQTB/cnQllDAnQg+zX9/2jmR+hjJk3Is2oQVfzHkvm1J
	MPUNTbsLtqFV55XBDf/HlbVofR6dxmdoUndVaXXoJRJezWYN1/kHtcN2n8u4ymjH8cyzyhOLbcS
	d9pexTqOtB3Lp5lJc/hfxIoH1el+HX64jvLiWPJQwQBRC47f6l9/x4Mo5BBi8UraSW+gdYw4onh
	lVhatJRzidroypvFuWNfHGB9eKQuzz/8gkBJjCk5VlYz6U8NTAkTUQL9LyYN456nav6F9uxb7oH
	Om31ZKRG/G9fHu6Fesz75nra0KYxKluhEsiOd6uNvkwRBwPHYMo5lX+wGsg0Vch9b20YN3r+x8N
	cvmpM/3P+uAy5dFmv+N4gi0VlT3euM+8ya2KC
X-Received: by 2002:a17:90b:380f:b0:395:7fff:a08f with SMTP id 98e67ed59e1d1-39e1df8d6b4mr10771249a91.0.1789611384840;
        Wed, 16 Sep 2026 19:16:24 -0700 (PDT)
X-Received: by 2002:a17:90b:380f:b0:395:7fff:a08f with SMTP id 98e67ed59e1d1-39e1df8d6b4mr10771187a91.0.1789611384299;
        Wed, 16 Sep 2026 19:16:24 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bfb19f8cesm14372881eec.2.2026.09.16.19.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 19:16:23 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 07:45:34 +0530
Subject: [PATCH v3 v3 3/5] ASoC: qcom: lpass-rx-macro: Add shikra
 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-add_shikra_support-v3-3-fc0e79c341aa@oss.qualcomm.com>
References: <20260917-add_shikra_support-v3-0-fc0e79c341aa@oss.qualcomm.com>
In-Reply-To: <20260917-add_shikra_support-v3-0-fc0e79c341aa@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789611366; l=4176;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=8C+D+unSEaRGl8AxrVeK0iFZsXPZ9fBEhD2PWma7i9w=;
 b=X9qkND0FMohlTB4T/7cCV3ZWxVLAuWzfnqtMWywSDzViKEmkD8nXRiOMuj+kJSpQ6zDmTlG1+
 lCawrUbHHmwBcmrxP6/yWZVu2MKwyIUXOEVoo3NIi0Cbysps4hORgli
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-ORIG-GUID: j9nlrhgWVh-e3mtyVuMG5ZBu2OtrVREE
X-Proofpoint-GUID: j9nlrhgWVh-e3mtyVuMG5ZBu2OtrVREE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDAyOSBTYWx0ZWRfXwoMQ7uhhWubd
 5UV7eccNznr4UVINMbSKESAaKXvA/JSp4Fk0i18qTnyuyDKRYNcZVkpgKD/rWubvlzdnXCYw27x
 W5Nc8+kCRqZVtBEdsDuYrag4MhvbSsM=
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6aab4d79 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=o21owqKzMMMBH8jYOm0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDAyOSBTYWx0ZWRfXxG0o0Hl9ExDO
 rvDwwO2EvIy0Ae7Xgr8rD2uitJdtssPdygj37UHSIY01x+z4iWPR57yO7r81yDhJWImFjKVkakn
 7EG3Fe45ONGaAhHY1E7lfUq3gUjmh4c2yGKCur7EywfnyX9jrVdNmbtGgeat8uRsJKiQobFlBRP
 LBq/nhEhPi6GCYluHFHnFhEzaUWjf57qDediKsOyupyLtmMQDQqSTqmO1h+tlKx8cV7kqM5B6/y
 Hd1XNG/D6iTNZgrsFPy0MsNiDBQAFLpfR017x2m+OJhE6DoiVaO5IanNCurGIlt6JL3keDGvwMa
 k+xA1NeGcQxsqKci3WUaZU0/UzU2Jlz2+UDfamgqfUwJocEdGFjrrUvGyRqbAi3IKLhMf4gxPVc
 TOfsxTytXqo+DP1J8m/gOIoC7Oa1rX9CJOe74CEaWMEdHJgCVMz7cHo7ulN378Li2bsGLqN1phd
 x6vfYSGFohuu/FujhEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170029

Add shikra RX macro compatible data and hook it into the LPASS codec
v4.1 flow.

The RX macro register layout of LPASS codec v4.1 matches the v2.5+
layout, so reuse the existing v2.5 register access helpers, controls
and widgets for it.

v4.1 additionally requires the FS counter to be bypassed before it is
enabled during MCLK enable. This is a property of the codec version and
not of the board, so key it off the version detected by the VA macro
rather than off match data.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-macro-common.h |  3 +++
 sound/soc/codecs/lpass-rx-macro.c     | 14 ++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index 573b2145e..b52665b11 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -30,6 +30,7 @@ enum lpass_codec_version {
 	LPASS_CODEC_VERSION_2_7,
 	LPASS_CODEC_VERSION_2_8,
 	LPASS_CODEC_VERSION_2_9,
+	LPASS_CODEC_VERSION_4_1,
 };
 
 struct lpass_macro {
@@ -70,6 +71,8 @@ static inline const char *lpass_macro_get_codec_version_string(int version)
 		return "v2.8";
 	case LPASS_CODEC_VERSION_2_9:
 		return "v2.9";
+	case LPASS_CODEC_VERSION_4_1:
+		return "v4.1";
 	default:
 		break;
 	}
diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index c41eb8de6..93ceee878 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -60,6 +60,7 @@
 #define CDC_RX_FS_MCLK_CNT_ENABLE	BIT(0)
 #define CDC_RX_FS_MCLK_CNT_CLR_MASK	BIT(1)
 #define CDC_RX_FS_MCLK_CNT_CLR		BIT(1)
+#define CDC_RX_FS_CNT_BYPASS		BIT(7)
 #define CDC_RX_CLK_RST_CTRL_SWR_CONTROL	(0x0108)
 #define CDC_RX_SWR_CLK_EN_MASK		BIT(0)
 #define CDC_RX_SWR_RESET_MASK		BIT(1)
@@ -652,6 +653,7 @@ struct rx_macro {
 	bool is_ear_mode_on;
 	bool hph_pwr_mode;
 	bool hph_hd2_mode;
+	bool fs_cnt_bypass;
 	struct snd_soc_component *component;
 	unsigned long active_ch_mask[RX_MACRO_MAX_DAIS];
 	unsigned long active_ch_cnt[RX_MACRO_MAX_DAIS];
@@ -1613,6 +1615,7 @@ static bool rx_is_rw_register(struct device *dev, unsigned int reg)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_4_1:
 		return rx_2_5_is_rw_register(dev, reg);
 	default:
 		break;
@@ -2045,6 +2048,11 @@ static int rx_macro_mclk_enable(struct rx_macro *rx, bool mclk_enable)
 					   CDC_RX_CLK_MCLK2_ENABLE);
 			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
 					   CDC_RX_FS_MCLK_CNT_CLR_MASK, 0x00);
+
+			if (rx->fs_cnt_bypass)
+				regmap_set_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
+						CDC_RX_FS_CNT_BYPASS);
+
 			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
 					   CDC_RX_FS_MCLK_CNT_EN_MASK,
 					   CDC_RX_FS_MCLK_CNT_ENABLE);
@@ -3652,6 +3660,7 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_4_1:
 		controls = rx_macro_2_5_snd_controls;
 		num_controls = ARRAY_SIZE(rx_macro_2_5_snd_controls);
 		widgets = rx_macro_2_5_dapm_widgets;
@@ -3837,8 +3846,10 @@ static int rx_macro_probe(struct platform_device *pdev)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_4_1:
 		rx->rxn_reg_stride = 0xc0;
 		rx->rxn_reg_stride2 = 0x0;
+		rx->fs_cnt_bypass = (rx->codec_version == LPASS_CODEC_VERSION_4_1);
 		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_5_defaults);
 		reg_defaults = kmalloc_objs(struct reg_default, def_count);
 		if (!reg_defaults)
@@ -3951,6 +3962,9 @@ static const struct of_device_id rx_macro_dt_match[] = {
 	}, {
 		.compatible = "qcom,sc8280xp-lpass-rx-macro",
 		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+	}, {
+		.compatible = "qcom,shikra-lpass-rx-macro",
+		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
 	},
 	{ }
 };

-- 
2.34.1

