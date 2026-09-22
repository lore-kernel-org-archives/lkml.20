Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C234CA788
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070218; cv=none; b=NWt4iGjvVpLkgVME4j1AYezddocoJDv2bwT/huDkEyqXv+ctyG2CknCFv8ss1GQJ+1oO3rsYrVYP/LKLEyDi76cODedKUeESbD6HTXwOLfLpYKRjrSmVhoYP2cdU6JUAdumaPXvJe6AZPLS9ldIvBk+zoFyNy1n0Q73BiJHl57Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070218; c=relaxed/simple;
	bh=qsXF0dZevHujgAyvXlegqZLisSzLQyqTMPlbdzLNVYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V9qz2xmMxJ2tFdboEDOViIXtnetIjSDl1jTAg7ixKM88BxGe4HPcqqwiBy/0kw0Kst4Zjqslz+ZCF8CzXag7TPJ06vx8N+VJbejn0FVgIJaBVg1j6hKr7osxjxdYe7jH9s0+CjnHiKMXw+nCd9Td9olHmCJzcuZiJb4C01wov8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zrc85VFs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QtHMWSYC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zrc85VFs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QtHMWSYC"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M9RgOp1842268
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:43:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PvocsrhWNLG1yaA2HOWYe7Wi2Okb8cBKIWEG12oOcXI=; b=Zrc85VFsLtFIoXpp
	eTY5zKDj83+zaZ8qxoMxvG8mEPKPF4k39TSrzC9rJxhM9CX2His/9YK19G5g1cK8
	ctXkkpfjC4YM7rdvfcewNx5bFOxLrrypqurWxtgsFHOjCZ43Bz2ZoVDp8BjKN4/C
	TdFeGoItl6X1aKjb15h6e6pHJSu6+JjleScGG338fmZ1Kv9+JOWpUKiVaiP3kjof
	GMhBBKU3X20Ev7xfruaf5YMeQMSMT856XqLXTZyIpOnovyEe/Z5BVCV2GHLnniMp
	Q3YQDEvhqAIRg9gsKw4aaNxtErvc5M+T9alk1MTacVP2voce8FtQK3CjpsumUTdx
	T2m5kQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guj1119yn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:43:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so5577873a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790070213; x=1790675013; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PvocsrhWNLG1yaA2HOWYe7Wi2Okb8cBKIWEG12oOcXI=;
        b=QtHMWSYCgD7NSitqz6/U/QsTVSK9difYt4MWFeGBJs0TL5fp5hxNsLauBc29sK/mgj
         RW0EZF8RNaUOj1mW9KMwwEKtUTv/Z6bblz6T8PYN1MkwXFPjprdGW/aBbch8EnLjbYpy
         UzdEH/VN3O6pmkr5f1X75nENEDl2r8mSoWBk+0V51Cn/tbheOT8zVLArF6bH/7Y1X344
         Y1E9uST/q5csb+wyQ+ihCeEu7jeQODj1TRdRDB0P1F6v6j3hTM6YQqU3AAE+ab3g2v17
         J2pvQeUvyK6mthtHL2HA9GQ4D2O+7SfMLkHuGMtfedOalPmSsMqVQbqa9XQDAtKWu8k4
         ot8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790070213; x=1790675013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PvocsrhWNLG1yaA2HOWYe7Wi2Okb8cBKIWEG12oOcXI=;
        b=pwmgY391/YXq5ThSeFhmD6dTNocvvmOu6RvyNKN4+gnby08Q0egFPHhPm+BgWCgRO7
         wHJYP44Tv+9nIbq5aDUVoHAzlChHoNzzKXHDhLpkvSBCPXanF530KdDMmlt3fZR/rYBp
         ijcHy04NIMTtAn9lAMUSQ0OOPY8/t3xlAL9lBl/LsV2BzDAWC3auXp19SXIk8E3YIMmd
         1wl+6Ej69/bgzR+V5bNtfb0jxmRLRV3n2I9v4p6Qf0YuYaT3IVx6mglWLFZg/q7ry5D7
         FjtAxmJZ+XSb6LePuwiXPLDulaakmU404+h7orFCdQ2O93dBQEkGSnnJVaB3IHIomVvZ
         4w/A==
X-Forwarded-Encrypted: i=1; AKwUvBz5rGCG5xVCDVd2GJrZ/vLGrLeTGdUPxUGl8K0MxAfbP6ksj0c411+mJGe7IGG3u2EsVp5n44O1kbJrBMY=@vger.kernel.org
X-Gm-Message-State: AFuF++naNjEVi9/CfXUoHINBEV8TCoNFqYltEaFyBznTO+Ww9+0C9Qgf
	FBnytj6KBU9FVppfeO19pk//DhWS1vbz1TKFvKCqQdJ/SmhYpbHhpKocM9oOKrt40emrtEsDwO+
	JxMqkeu/J9cr1EfNYMcl86mtDRgDkf8RmM0592vk85krPTFAuzeTgMKdAo7+ApRTj/Xk=
X-Gm-Gg: AYBFou1lZ2lXxVpJ8p06ufPPPwqkCFZibermmrlZG7iE4m1f2xGHhzXdXi+5eN4Qi8c
	yuSHOK51NCpbg7osvWCgmWvmQyp/lu0HTBkSxX09rKEBUFD1t9pusfQE9svc8XleYQkQwt5D5vI
	fWNY/emeVYAzytZS1zrYOiGoEned97dGIHlT8PjoCFGWNVhnLRTBKwO3ZICli0mJfUJZsnF8YNQ
	7fgd4uY2qQ0ty9eiUSYlgBM005l81fl9u0P+AWdAczccLhtaM9jZ5zZgtBopFF2zVbFHDW+CoJ5
	PkVLWKC2mMk2Cwn5YREkvx5gCUutHkJxan3ghC0As836vMBO9AtWmHkpjc6yPKI5mbczdfcnicy
	CIQc/+ho5lX8YG4t8B6OGQ11y5O3ryHe8smI=
X-Received: by 2002:a05:6a20:6a08:b0:3dd:a196:30a0 with SMTP id adf61e73a8af0-3ddec857475mr693835637.80.1790070212609;
        Tue, 22 Sep 2026 02:43:32 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a08:b0:3dd:a196:30a0 with SMTP id adf61e73a8af0-3ddec857475mr693801637.80.1790070212131;
        Tue, 22 Sep 2026 02:43:32 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f2a44cc8sm3776183c88.13.2026.09.22.02.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 02:43:31 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 15:12:32 +0530
Subject: [PATCH v4 3/8] ASoC: qcom: lpass-rx-macro: Add shikra compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-add_shikra_support-v1-3-6c6cb6444caf@oss.qualcomm.com>
References: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
In-Reply-To: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790070192; l=4188;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=qsXF0dZevHujgAyvXlegqZLisSzLQyqTMPlbdzLNVYA=;
 b=CR2OZjP/DnyqjCZK9W4iOwqxNRHhzEYUe6J8f8YmsLpULfFI1vvL1z3TRy2KqgHGayJk7F5Dr
 rpUQv3YHC9eDVB8zKRZEIwLYNdFNHI+DVPlvfsc2nvv/cbg11IRBEr0
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: 9IWesH4Ws5S6atWLuKSS-CVxBg8jYhQX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEzOSBTYWx0ZWRfX7PYlUiGuVoIG
 JzmswyS/YpV+sLJP6awaT1zlPPVHc9XYvP2jSP2zrQBtywF1rI2/sT7xotHDOH2uKTi0q/T3hB1
 AwCvQyKXV+NukRZ/DgZXCoS/Zlio24k=
X-Proofpoint-ORIG-GUID: 9IWesH4Ws5S6atWLuKSS-CVxBg8jYhQX
X-Authority-Analysis: v=2.4 cv=atQnmiZV c=1 sm=1 tr=0 ts=6ab24dc5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=o21owqKzMMMBH8jYOm0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEzOSBTYWx0ZWRfX3c5uVf7wTIpO
 NgAXYqJfXl1mpyvjb0V4rvs6Rdc6U0I6uNgQEZ7wrDfZVpa8W7hv1H56GM4PIzHyuo3Z175MuUn
 bEKvK+vAIvdtEHdTh7XyQDsQqkC6XMkM8rWywuXF0+eviInimVt9oB3Lw1DfhhHVj4rRH9QCkbX
 cPFkxQQnPlOljC9LfHbjIseTHEtYp3vUQb/bhpTrP9DAATgUO7KI7l5UnkcmTinFDi6iHl/6cD3
 7bxU7eJECGzPIZaveeqNSRRUMReWTXk0x+jB+8QVji6mFGwxc4JeDTFNEJDppBCnSxNhPFy4PVb
 hEoerpU8EjSwVkgUb/KXrnqvNmrp8fZMQm3UKLz/n5aA/rOsEq3yPgmkL20FgRvNEMT/P/104ef
 A5Nv1c7A7SbfeZADKs5OYBEWiqz2nSsPBn1l3+DIYUYzGYeWel26TKy1lfDtVOkBGozXhRRdNBK
 fJy4522Ct9WnO5DNfRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220139

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
index 573b2145e1c4..b52665b11e35 100644
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
index c41eb8de6160..93ceee878b78 100644
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

