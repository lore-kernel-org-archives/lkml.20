Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779A14DD3DA
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969251; cv=none; b=VVrTNLeDD729Mpy1sBAtMAj1gDf/RDMJu9TnIAKER+KSj7I/3dD0otURQqNYjD7YXoiAoD2eMMAcoE6Kl2ZDs43JIBv8hFvsyh2T9IeEF6LRrjsopD2LR5/TbUhFMosNq+chsjUUg96mz4Np3ucfdPBhwo76OraJld8aKr2w6wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969251; c=relaxed/simple;
	bh=sdJImY2kBB9tU0sh1ZYyAOZP5VPS8woIDnVxrZx+Xnk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V+ovfjkpMtTsFzqOiEre1ITO/jvqcVVDFjGwcbFC9ZDOENVeK9AnfXcg6+sRKzLsVVrcyfT4QnjkmfaVstOjhMBLvJXlq5vMSZpyJoFyen5Y6mJeTubx4i+SgRUHU/N1BWXm0r3vVH91vufCq3uLnRvP3VREz2d+8BzP2GzsybA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NqnocRkz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EHTOCm6P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NqnocRkz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EHTOCm6P"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E8i39O3000877
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:14:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mQKQ2gf6Bggo1WTX6z8XfoFXBZQFh0q9Ms7wN3xZT7o=; b=NqnocRkzF6tPLLGF
	W59HMC6/BdSL+gKlm2gZvyz1L2XuBIC0jpT8k8Dnk7cRKoNQtgstxM7kC5RC6r3e
	LKVPGWckG89qtn46KY9KCHiW+BEgRR7w/zvPrRxcwRYBkIYHyb9vJbfm8UgAu/eP
	e0S6jxLelvukSA5FYtsXPuhWsykBrwG9TPt9ynDLbsLFhtZaNSAJP1rWOE5Jq4pb
	WG3Cq7wuTuE8sisKq4rOWRP6+Nmq5JgemsnfhGwbC8Jrk4CgFTA9jrPGFcFGMCSL
	SYvxqhcY+DqAzE2i/0jr+JFt720kcCpmcq1D3FAUEfVgLGQ+AVNeXZHcg9hsM8Ha
	IDJKvg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sbeu6fa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:14:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e61a48d5b7so40721015ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791969245; x=1792574045; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mQKQ2gf6Bggo1WTX6z8XfoFXBZQFh0q9Ms7wN3xZT7o=;
        b=EHTOCm6P3w+/u5GjO2Pze/Fs3aGTQV94ryrt/RPV/kw4ys1UE15+qJ+8p1x3tk74QJ
         QE/uxg+QLkbXgF0DK39qIUfYpIVHT+POHo/6u2Z4O9lQD4JqI457vmwO+97Z/qmUaiaV
         saHEvP6LEE9sXw9Qai92tk0WTm/nvZtoW6D5L3hyEcolmISAgtXbKQ/lALTfhxHNpPGz
         oa+kY387d8ZW0F7Mh5yf2ZPxOedcU83bU0EHerRCk29NVUWTi8NFkElRyAC3AvR/q7Wh
         fED73xvuA1K1ZcPG1QZPEwmQlneXnvJ+9E8wxg3xpkLht1nkVz3GdjtJt6qWhLWbM+kC
         se1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969245; x=1792574045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mQKQ2gf6Bggo1WTX6z8XfoFXBZQFh0q9Ms7wN3xZT7o=;
        b=gjPPp4ogUf8AAkqQ/D30T0hvHZVtNtWQdHzabVMDyilkTqDtF42oJn+xxHg5vLnrGo
         Iri3Yt8rZqTnGpAkYvdN0FNt4PkJlVHZCKeC6DInPw77RmQN41YIcpv6Y7TLL95rOLn6
         ScYxsz0+szyJ6rJJ/s4uZ7VcMqdPEYjdlGlYf9xRXvOK6yr17hsRrvQtymcxnTkt5aEL
         Qas/mjvHxcieUomqSmt33DldsoGvpuUX1KfC7yZniqTUZ7zKzBkXfv6g6Oacw8+hh1ip
         JTVH+Il0NcUl+sNux3/OiH4qERRY0rm2GZvlK4fwVGGi+fSs5mUbLgg8LY3I3//Z/n1Y
         SR7w==
X-Forwarded-Encrypted: i=1; AKwUvByBRNVaH/rR374IJBC0yC9Myf1qpCDGctvnr4/wBhdFy4ANatty5MPByzxurlwANI1IMfAKx6RLXv4pJJU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhzhAr80mZ7kn5mwMhIwTmADKxdUUkw9WxVCFUhLPxAY2BbtNy
	JCtyrxnklBd5/Nlr4uMMvPU4l26JVYzodV7tPaxx8hPtqAzX2UKn2N53dpdJwFfFjIAV03cT6es
	tja9YbbiDMS0jTEBDG9+zuHpWcUThd/A9vRCbPxvHkZ0+o6V2f5jnJlP1XndU/BHMeTY=
X-Gm-Gg: AYBFou2yt6TN+vaG6V8Q3IEXFX4cNTcjMOAnAh1uBgkF7hBefsu5ohE8uqPRfN4F631
	/cByE33xFm7pJW4jbyIpif5NSqK3Q2yRDbRCjGGVGpJG0pMLSu7uZy6uSwTt+dLVHvY8KaTj5Sj
	Uc2Xa+9IOZpqtJiERtM/7eIuEz5HYlJ8EemXwQcDq/+ile5/gf3vzp5nrJpoHZzkNRh4Kp2zi+R
	Jn9ISFT2rBcNr3JmyG/z9aB8oY82c01inCMyjrTPUsDbE7kC9BRtXikDiYpmNOtA9MXe318/+PI
	GeFbR9lKfJo/iCA8ulIIa3s35OsEwXt8LpU8YsZvOViEgczxeu2PXFYa06Cx2hbTPm7Z8tXQAEH
	t5k5djvG834HduPyZNE38U6nFLkcQy6OnkGI=
X-Received: by 2002:a17:902:e543:b0:2df:98a1:d0a7 with SMTP id d9443c01a7336-2e84053c728mr108027035ad.33.1791969245435;
        Wed, 14 Oct 2026 02:14:05 -0700 (PDT)
X-Received: by 2002:a17:902:e543:b0:2df:98a1:d0a7 with SMTP id d9443c01a7336-2e84053c728mr108026515ad.33.1791969244345;
        Wed, 14 Oct 2026 02:14:04 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b16b3sm67088595ad.30.2026.10.14.02.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:14:04 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:42:49 +0530
Subject: [PATCH v5 3/9] ASoC: qcom: lpass-rx-macro: Add shikra compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-add_shikra_support_v5-v5-3-fb9f0667e613@oss.qualcomm.com>
References: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
In-Reply-To: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791969222; l=4239;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=sdJImY2kBB9tU0sh1ZYyAOZP5VPS8woIDnVxrZx+Xnk=;
 b=Cd3qJHylMANBN1TC7npnDFTfzEetFQ+VyNIfBZC5MIiZmpTMkKc7EmGhPugTT17cGH0TDPjj1
 S2MOsiwtvggC8SXmedGTXj4uGb2tQjfueu9uWQ11N89DtQ/VMhi8v6V
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-ORIG-GUID: KmNHmLwaOfsJOPR9Fk2hGv1jN3ucOXxh
X-Proofpoint-GUID: KmNHmLwaOfsJOPR9Fk2hGv1jN3ucOXxh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX5NVA/C6Z9Z/s
 62cYVHVP6FDRl0QdFqQy86k8U0szt/ajrxY51PArhxhoagPr7PaLmh/Fk8YzcEKg/DeFnC6AnYQ
 XoIUxzCfKAdFfaHtLodH6dNn8pohaQeVZ4z36W3VHPG5l6BVNup7sG7RIYWD29e5N1yAK6TbWS+
 WTpGo2Xe3GWlFRrVMj75KBK/YOjTrUyaodYz3z4mWSboAg1BTo+/IP6uZ8bLdj6eqU8oyPmNwJo
 wVUIeN+/BUOLSEQ6Eux6pV2RznJ2iPdUTTZSmPa0O4BB6ChRRqZCOSiM8VN+yYtwhBocjpaDE2+
 bJghZ/hR6U3HwJj/HPx6TzGzGR3rH2EMYjDaD0liVXeAftkG3mduFuEBY6XQ5GBwPtSsk7KqjVB
 dE5joDOfEWZptoY7XjRZVSLiUVnxH9m86TpEbj9AVpxJ+/WKzpliwWC56E0VtCDyZmde/JWbQME
 jLx3L6luRdjgppdHw3Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX2VbEBCHNFsng
 RV5/6sSIEbtPiY/nPK03Al8lk0c+lryMBOSAufXjEtq2k/MEyUKzj5XCX4jzHc6t/yBcj4M8kaa
 WSqd7DXr+A/G9/HfyJ613BHcAig8Aow=
X-Authority-Analysis: v=2.4 cv=U7AHnuru c=1 sm=1 tr=0 ts=6acf47de cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=o21owqKzMMMBH8jYOm0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140036

Add shikra RX macro compatible data and hook it into the LPASS codec
v4.1 flow.

The RX macro register layout of LPASS codec v4.1 matches the v2.5+
layout, so reuse the existing v2.5 register access helpers, controls
and widgets for it.

v4.1 additionally requires the FS counter to be bypassed before it is
enabled during MCLK enable. This is a property of the codec version and
not of the board, so key it off the version detected by the VA macro
rather than off match data.

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
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

