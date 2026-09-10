Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F8540DFC6
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033664; cv=none; b=EbvpkwOjQQI71tA0y3yk3uF4jC67M4Li6yYWFt/SidD7HWfXNUKVj+QZQPl6YEMtVF+0fPRWtSW5XMFerK6jbjXxq8SiOuvFMmaDtBgqBDdH4J1ezCiwQEKdMtxPgiCRYJ1WWz+MtRITEwzdTYdytLLRFPHGYS1oS+txBvDtWe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033664; c=relaxed/simple;
	bh=CknKnz74q4bRiFyxc8sXJoITUsjw5HdEk2nqPZiJmHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ByVSBxY51Vwd/tKbvkdQuInvnBUduIybAiYx4MAAMY7vuw3YJJoeRhB5XloP4WX0Ah+Qczo7lIcFqltiFbgOuy8z8AxDzXeWjsjlIt1PNUu37mGaHA9Aoi4qh4V5jxOueO2zO7th+TD0sG3DW0PybVYo9DaZGdsxC55YdyR3oEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A12ec9a+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bCub9Wg0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A12ec9a+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bCub9Wg0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8psgh475067
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eEdAEiQv6vSs63yjnvBVIDQdhylWFrpFN5ivbO8rGI4=; b=A12ec9a+EQMbX7AD
	EBnvBEforq3fu6GBypj0rrxINMhdQ9qyAksbCqKhz8CYzt6aLtsBFyuvlMdgG5LU
	F2MyYcMOJWCqYygq/6hwVwAp7jFNXsEGk2qw+Ba3wTL3f77AjFetsM5szs8DGL/i
	fiCmTx/wxvSTt9jbVHlygfHadJRw/eKOhTsbMNKOszKTroTj00rHVTGcmo4C5cLw
	UiP8beZ0IdOHRVLwBJqzcs4QQqTlVI4HtPJ9n12cPKjVt0f7B8hHt7dNRsLqAFTy
	MUjFxtP882bIrsZwmVvkMNwjWocoBF4D8ytjWZodLr25qGFXd3uL1pHDUS6n5GWY
	eAeHPQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcygu7e1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:47:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39533bb224cso4618327a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789033661; x=1789638461; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eEdAEiQv6vSs63yjnvBVIDQdhylWFrpFN5ivbO8rGI4=;
        b=bCub9Wg0Czet580w607suMRDfwWpQM6NNTYEkp3E6ORTA5DFcjZniFw9C2Zhq6e5YM
         uX5oEKYDCEumqFsbL0BKOUM/m032neR7CwpXaOOOKQuThGk84Xc4RBnn9FtMFM2u0UMc
         x22etaUN+hdLdG79q8mrDl+mOMHxT0F0JZMXJFo6LP2wtZXoBpIdKArw2HYZi/9IQfR1
         C2cQcBSyewO4yC3rm68g6G23fxDiQIAKIbinKky5nWkRsvGZhuTGuIKfPgSguvPEvHS9
         jso7mVZV0y6lG1qCh00pu5cfc1tEPMuN0BwnCFv8cGonrMwGNC9omoiE90X1hi99IPUA
         bs/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789033661; x=1789638461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eEdAEiQv6vSs63yjnvBVIDQdhylWFrpFN5ivbO8rGI4=;
        b=guyQw2RCWon3yP5o8kqqdT+YbfXnKy3KT/boPIYB9frBuFEYwb/kH1uGavaqtnXv6o
         Q8Eh1RZU1UwfIp+dxbKSfYMmmMZMHxzAoYuAfLpEhcZqy8OFK2KUAK0yoV+78CzldKwH
         vseUOKIyVgtUNz3FKXJAEC1EPEWudhdSepVMgMHotrvw14VFlptpsTBCNzezX5XITuNQ
         wQRP/KVVNZCGArQ9ZSTw+36ZxVoTT5LN3ZSJImdOA9DZOUFm9B9hy1qOVFNqztIjlxYV
         vla+cXm0iFMdS4JkPETfl0jjbQT5BioTdc4jmSYz1phuUioJ8L/hlMY9gzwh1MomV8f7
         CDkw==
X-Forwarded-Encrypted: i=1; AKwUvBxbD0nUz9ObXH99UGd3II1jZNo9FksPfZUS/MEzK57i1nBv3touuvDNtzPLlawAdEZi03D4rtRKpel+4GI=@vger.kernel.org
X-Gm-Message-State: AFuF++nWAo3MeT/p3ZPwxuVLSF7H6aKJsQQgXbzitW4SxC6CmYtZB1k3
	ILjoreAgyBISsrq111VHcaxBAzH8o5AQ3DrI0Eu09iHHzCW4ZV6B7kdWecCWNLQuEWQcUHa2ydN
	UgddSUxJkQjZ1Ec17ZGP/2h78+Ng8sdGrc1Pf8TdVqvWOy1BVpNtGt3xolze9OhFRuec=
X-Gm-Gg: AYBFou2/DVGibERqI5hnlW/8sI3Oo9XLd4JAsoblL7KDcZpfetXbNS0h1g1iH27YUxe
	uvrgIZNzkTwfqMpIAFjAhwSXc/6qxK4ZGmdUmhlHnbM97VVLJJ+BYvR04HtGmeMhWkYtsKzmsI8
	8zl+TwK73+OXbx88R8AeRdK8azYbxi2oSb/NCF/s/gSLW/LU1O+l+GZ1Z9/LH6eIEvSKgjNqAVo
	L/RtKaA3s1I7qPfUiAFzk4z5cQgdpF/dU0TXCF/3N6LD7X8f/xTTk65IDHc/5Jlzlqr5gbVUuhp
	0FSfXrWmCjhtLmMAiOBDh3HQBvHkXK1zYZKFBJWCKqhvvrSc0hWRr6q7R4R78ogqoakAc1g02RU
	6PSh+fTluLiPVUeiHrEYQeM6jpdGNr9sFbtRd
X-Received: by 2002:a17:90b:39a7:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-39b26125efemr56400787a91.10.1789033660209;
        Thu, 10 Sep 2026 02:47:40 -0700 (PDT)
X-Received: by 2002:a17:90b:39a7:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-39b26125efemr56400640a91.10.1789033659066;
        Thu, 10 Sep 2026 02:47:39 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33987ccf483sm11941129eec.20.2026.09.10.02.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:47:38 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 15:16:55 +0530
Subject: [PATCH v2 4/6] ASoC: qcom: lpass-rx-macro: Add shikra compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-add_shikra_support-v2-4-fdd2129c696c@oss.qualcomm.com>
References: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
In-Reply-To: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789033635; l=3248;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=CknKnz74q4bRiFyxc8sXJoITUsjw5HdEk2nqPZiJmHQ=;
 b=CIW7jtdZM2JDRhHR/x8m/goq12JxEEMYgcRgjNX8FVpL+Ne9Vaz4ggnnn3dZgMwWlBMm+qSFk
 aJl2q5OkwTqAWV2dLHubMs3UlnVfcmXy9VG/ZPJM9OHGggzy0+6aY7c
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDExMSBTYWx0ZWRfXy/faq6/psiJN
 sm4F7zZRpIubQeLJzunY51q/PmT1uF57fz5yY5Aro5ZOuUbiSyOUdKFZP549mn5X1YW8TGtqohA
 7Y6b352xS1RYnTdVyvWnn3vaW0eTmlWGbRQlOfExNENauqY4jaWoSCXPlY7G0A4+FRcQW/oMoMu
 1aPCx9wDJm43qK0DegOceRPPAhITCJhMhsUAE8SsouKzKPqZykwmnfid5xsBgfy9N+Kzdho/VnA
 ruxh39zcICWgaTsTBVPyoYV3gj9lmKWrDseagnY+RPAJtBTcJXVp/JSZbBEY/5EHN+ogH7xYIPK
 IGht81exQYIeIrWuOv7k+/iUMTM6evLsQWGuY5XdssdquPNLLhKaaENsGo+R1MTlyo1Dor9sKPP
 1NynDSiDB9DDxJeYrpBo3dcLwfMdt+SlXMLvKCP/hq9WXj0BvrWb6lmCR/fyyoJhYipACEhuZuj
 +d8Gg5NHhvQQXZk02eA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDExMSBTYWx0ZWRfX11UNj1SHTnFf
 lOUj2WFDYFg18RT5AI8fNalhZDs/aP62E5dStY1rfQg052LHbA9WB35TZXjgy9gOVaffXenetTu
 9T/B/NGdUOhUXelo0e1du+UppV4FJ5c=
X-Proofpoint-ORIG-GUID: JYBlsf8ELOXCLJujecMjuGxXzv4tpCAU
X-Authority-Analysis: v=2.4 cv=VONIDNPX c=1 sm=1 tr=0 ts=6aa27cbd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=5VtZfVHG4jz0BuCMUKYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: JYBlsf8ELOXCLJujecMjuGxXzv4tpCAU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100111

Add shikra RX macro compatible data and hook it into the existing
LPASS codec v4.1 flow.

The RX macro register layout of LPASS codec v4.1 matches the v2.5+
layout, so reuse the existing v2.5 register access helpers, controls
and widgets for it.

v4.1 additionally requires the FS counter to be bypassed before it is
enabled during MCLK enable. This is a property of the codec version and
not of the board, so key it off the version detected by the VA macro
rather than off match data.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-rx-macro.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 2e74ec1a5..83372123c 100644
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
@@ -1613,6 +1614,7 @@ static bool rx_is_rw_register(struct device *dev, unsigned int reg)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_4_1:
 		return rx_2_5_is_rw_register(dev, reg);
 	default:
 		break;
@@ -2045,6 +2047,16 @@ static int rx_macro_mclk_enable(struct rx_macro *rx, bool mclk_enable)
 					   CDC_RX_CLK_MCLK2_ENABLE);
 			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
 					   CDC_RX_FS_MCLK_CNT_CLR_MASK, 0x00);
+
+			/*
+			 * From LPASS codec v4.1 onwards the FS counter has to be
+			 * bypassed before it is enabled, otherwise the fsgen
+			 * output does not come up.
+			 */
+			if (rx->codec_version >= LPASS_CODEC_VERSION_4_1)
+				regmap_set_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
+						CDC_RX_FS_CNT_BYPASS);
+
 			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
 					   CDC_RX_FS_MCLK_CNT_EN_MASK,
 					   CDC_RX_FS_MCLK_CNT_ENABLE);
@@ -3652,6 +3664,7 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_4_1:
 		controls = rx_macro_2_5_snd_controls;
 		num_controls = ARRAY_SIZE(rx_macro_2_5_snd_controls);
 		widgets = rx_macro_2_5_dapm_widgets;
@@ -3837,6 +3850,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_4_1:
 		rx->rxn_reg_stride = 0xc0;
 		rx->rxn_reg_stride2 = 0x0;
 		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_5_defaults);
@@ -3949,6 +3963,9 @@ static const struct of_device_id rx_macro_dt_match[] = {
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

