Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968420;
	b=LH9n+3voyAJYx+SkILgjC3gn6BSCtIUnfLfwNW/AUz5np0m5cLhBElGMcWzhp/UXNeYU
	 tmZ2wUIbnmYAvfpSLLFK00F+RRmI94tZCucNY2aQoeewl0728BBjA2e/ypRbNx7EgZzFi
	 SnIzVjAG3pjK0Y8UPrI6MPDX7c4JkgCvEQt//qPWRVhdacIjxtGx1UmSwcf9Ni43alC2I
	 zqtMsHsr8thHPT6QKHIUhJB79OcGSoN/oa/UWhxtQsZ61B5zc7/VZ2cWhWyBHTG2xhNPT
	 eg9LMu3BtUdVzmDkp7rG0GWqpF/s5DZ+HbuXbmTWOJ8ELsTRlk5DMlggig9+E2s0pfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968420;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4LaEEtGDRHaYSzzcnu0Ovwe1ImYVcK94EXOG387Sefo=;
	b=CwC8nzc0cGm5z8pTA5P8LgNF1L3TUgeNATWVtxh6+4l1PbO6+xC8al6fTpR6M5qqz9id
	 70DwzN3ak8x6xKZuk5J67+TessMLex3JVSkSxTikCnSZjukFQa5LK4tIWWO9P9z8E0A7r
	 eLAEStVyKTDE93lzM7fgScwCZKbYaXGQLOPBL82nSwcfHPNMe5Idz0f0uUyv3xdASkdQC
	 snrOWtM9qicBtdyZNX27tTufXTV41pBcNPPueY8AlnrmPaaggb++HmkoR+z3Rad7QYNJB
	 tS1DshIkrQM/qq5wo7cay8nUp+j1PPF7LUndxG2LC09Q4ULwwGJotneM8/tWwpccJCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TfjAq5So;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YLJeojli;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F193606A334
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F193606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TfjAq5So;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YLJeojli
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APLqG527324
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 12:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4LaEEtGDRHaYSzzcnu0Ovwe1ImYVcK94EXOG387Sefo=; b=TfjAq5SoLyf2ZMg7
	iuctBYaJFGXit5hQIIsrMFAuI8hrK5t7UigvP0QzrKhvysiuLtpQ8xV+IHv7BTxW
	NkmXcyTMxdrBjU3dH7G1dt3gcyNbcov6jHeWYqXk5USO+0YkSzTsFksq8nsbdld7
	12Bhol25jpnwHArhKAcWQWQFT0gM1CjU+W1C5IxL77BvfWic9dr5eAC9mST2LOp2
	/f5cWRh0WPl6A1P1z6W+ZQv1uC+mzdYyUz7cCZEjC3uPXlQ4G0vBu+6CzjyImQxC
	SilburAoDzY8gMxBi23aMGatNvyY9z/Bs8hkbbxbQ713YIwH7JEc3FhqWgoGQGxW
	7qhMMA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9ts6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:33:39 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36de26cb4b3so749505eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 04:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793968419; x=1794573219; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4LaEEtGDRHaYSzzcnu0Ovwe1ImYVcK94EXOG387Sefo=;
        b=YLJeojliIoKwM/v1ey8cnCoFFpm2Skpr/RHxdkRY3wmNJ6fmty6sUpHp3erz1VsGkA
         FW+4LyI7Qs29Eyw4+XI7lzsIT/X8Z+0mSROwK3MdBTjzBqxMgIysKDDnTaqEeUkfdrYl
         Jm4KBAiH8AJYizVgvGSYnP+0LvbHmgHmB1eiOJg0zpYOqlA37bccL+ceEdJ6+nbT1uKt
         SZvflluCmKFfjuBMaS4mhIa418XFWxik90GDOY4i3LO2EkJflIP7EzSdE6WfQFeb7SYn
         XbVlGo6+ekBhuU8O5iWkda2w+hfAguVKA/UhxohVILRmKRbkwh+EXV/HnRvUlkfNPJkn
         /OnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793968419; x=1794573219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4LaEEtGDRHaYSzzcnu0Ovwe1ImYVcK94EXOG387Sefo=;
        b=m8X99hJM4/mKT9iff++WxRfVFu3Zq/ag6GzMIjxbRRb+Ra0VwasFiIZAjHXbdwLTdV
         SBU5pofjVgrtd0ZLme39PJtOOfUbHOG2THITRi/6lTR1J5Iovx5wLvQOxJPcL24wcgXr
         s0Yvl8Mq0dcoRYC33jan4dEz8HL8VSpVNOU0tM3dKFakbiwH5LHGvr4whzxK/9VlKfCq
         LFyhhY7q1dZsAdm88wM8B8V8KX1YiCn/DyaO3+0CN4JZVA4xEaEatqSJPsyUCInu7Yl0
         rDiax9q9zeLtynyS4Ev9dA6ghQPd6qE/wMh/eFOAZY9gdC0V+cu1Cs4ZjmXTnTsqKhZc
         2YYA==
X-Forwarded-Encrypted: i=1; AL+hErGEAjU35w+RsVwArgzxDCK98XRaEPbYfD2SCC250yjRqE7lSlLV/LCk84i4EkfvexcUP7kb1fPswIZVvx0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fm2LWbEQ1UAofx/CA//xxcLIcwX/aLrforNv9KxxLftTD3NO9
	TJ8AyuD/xyD1Zc6M5mNXS/G5dj8HKFbuAFkC7HYmSJP2JLrGRnnmldtl5Iiot2oukapLlhmRfwe
	syEKqm4WGvCYl12gp+Zz85vdxbOdFcFlrVG8v5xnANv49BrJxUCNeoDyeY/MlmLru4oA=
X-Gm-Gg: AYBFou2t0a6hH0eDOQKBhOvrr2CaDXfN8a6TfUFoS9khGh5gNYoD3PYaFLI0xllp9wH
	+EdUWk/2MFBYcK7CpbUQcpIO5UbRZcnY/2K+cdHPvaNLUdcWTq2a+bOA9dxfhJ7fePBgtJUNO1s
	+ptyZYNE4pmzMIdkKOmNLzQKRGlHX1PaiJDf+2ki3yB6pktKvN+66VJ9QGM7cTwDiRWQs6exkO3
	JcVyAZpg5iQYYmlxLnLJihABmUMVz5tNxZ5SHGFTAoQNOoQUrGEhD6BUbf9zwDGv1OT0GQ9HBFS
	L5v51O53pCVPhnphp+O7cauAGm6mME/1UApOEIxVo3l7+0N8mHIzIBwCt+wcJMTTCJh33amuOR0
	bCdLvETl6nLnoSzpr4+vfN4U5hA+hF6DqkR8k00iniWzi13aSjXQ6pzirm0UrZXfDDwT8exd6FN
	pEG698/NHL
X-Received: by 2002:a05:7301:a2d:b0:369:f182:8e99 with SMTP id 5a478bee46e88-36f780cdc63mr3078398eec.35.1793968418607;
        Fri, 06 Nov 2026 04:33:38 -0800 (PST)
X-Received: by 2002:a05:7301:a2d:b0:369:f182:8e99 with SMTP id 5a478bee46e88-36f780cdc63mr3078335eec.35.1793968417804;
        Fri, 06 Nov 2026 04:33:37 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b8aacsm6514804eec.23.2026.11.06.04.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:33:36 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 18:03:02 +0530
Subject: [PATCH v6 v6 3/9] ASoC: qcom: lpass-rx-macro: Add shikra
 compatible
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-add_shikra_support-v6-3-2cda302237cc@oss.qualcomm.com>
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
In-Reply-To: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793968394; l=4251;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=f38ysNY7nGtb5msueYg8TScI4A9s9J5UTjiHIk16+yc=;
 b=1ZPUNXmyShlTKV2aff4z+PrFlMRVT2DHgfOyjqK8XOlPI1LqhBSFyXjFu0V9EXCA3Lbf0XcMn
 gQkJnNf7BezCP7PPJDo8jNKgfuHTPT6KT/YWv5se/CGDcMSYoSRoDbp
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfX5TEX/+VofGM2
 rCUKntN46lNW5mDhXea55OTrtJ6tnYl4M6zGJEKgXW3xfrgyXv9Za15mkwYrZdr4Mx/8uWBT/xH
 k20U3Uxk9ExFgDofN69cXfjHATrsxCM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfX1aR5Rmf40XmG
 slBruiWyd7+a2cyI6MSP6S7iHvLiwMo6seFO1EiC8CPRkIFOg4LhwtZ1kSH8Y+JYDhGJcoJZ3hX
 yk2HXGYvxUqCszfr2hLTLj32GELnBbhBqEJCg9/1wQqlUWvQQWR6v4qd8lRTd2+WPaVLTiSJHkz
 XEFTXABx8NnNX0gZAiT1KOBJ4CJaQT1F3ukHw1jrXxj1NB+pP/xjB5wMmDTTCRcGtFLhL8C87oh
 o29Pt8dO+XOBTjnLA5jWvlvBG2Z9OFGxBRFRSbVcF1yWAgH2+E5kbvqZbKMomIx2MoNdifbSy/P
 +VwsCjvDC5TziyLTlTHZzm7CtcKcJT4LJMhlmtNaL+Lckoqj6T+nUV157WL94cRic3Ml91EKVpp
 PHXEz73cn+vtd6t2HuScBAOTfZ3y6yYCNtWVhO4gkdH1rYKEwUaACSZgVy6Fotu5YoCiS6TJe3X
 JUc0uA1gw5yn+JHq+ug==
X-Proofpoint-ORIG-GUID: WUV7aPwkWhNNdy97MolbCQcdnwdLlxnF
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aedc923 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=o21owqKzMMMBH8jYOm0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: WUV7aPwkWhNNdy97MolbCQcdnwdLlxnF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060049

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
index c59c746fb638..5fe06ce6b960 100644
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

