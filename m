Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFCB4A1DFB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052612; cv=none; b=fb0vscjlA5BpeJoySaLvsNQ781MuIK/TMVbvBPtYXXZywTxfo034Ie5+93esOu/UU9lEfhVZTt+Z5wNxpA4zNbqtk3h5kqVrMk/5GPCPZrctrRBZxW2xXirjG06VCs7RKk+zNbVyuIooCINOs/+dLJWdFz+XAeDBTsS8UbwJ2hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052612; c=relaxed/simple;
	bh=fa/y86gJb3ZXbdqQ9LLgPTjgpebbvibPtDfTyIpyeRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YgTlJEoHHGVPQkaa1ydi1+5U/09wcRy41ITZanltApr/f3jeKOrli+CbWwdcYoBJMKzn3OQaRsDrRTKl9yKookNokKjW1lnjE/cbPOBZ4jBfU7EOAMwAl6rSoLlUP04alzwVVL/IFrjLrqR+q+5sp9trb0Co5GwLrcnDdqXo0aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UnIdsC2I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yl1NYCvL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UnIdsC2I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yl1NYCvL"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7eIH216172
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ayp3X5o9X1g8Aw5BprGj/ZIiS1HUy6J7YJG+0gF2KyM=; b=UnIdsC2IuGeC9kAJ
	JIuaj8rteAfoZ0MIO5uEVBDVJn4mD/EDQBnegLS+ewJJNwYFYek7DMS1M9ZSbTgp
	zWiO1iPt3UiQB4hR9BpMRbOSV/D4B/mR51MGzCHWPjrLoZk08hlGh+I6rSHEnwvB
	A0MaqpB9eK+5vpNhppFU1eOBEj6OOQ5sQl3YKXK1wBd3Ct9S6ZQkY7RWGMg41zxp
	hhvELklPWaqxs/Ye09ja7m6BVNnOW24VCSnu6cljObMYeP9c8T3m5XYLOfpkSnFI
	QtUYKTG0syF6pPQcXVQBzpmwoZb5XeFv0oNTrm6zze54C6oDO23nkwnvD60yKS/m
	IlRwhQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrdn9u0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:03:29 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8688139460bso1620303b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789052595; x=1789657395; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ayp3X5o9X1g8Aw5BprGj/ZIiS1HUy6J7YJG+0gF2KyM=;
        b=Yl1NYCvLrL6FliwlzA+RtyQDu4u2TMSU/qrQvXnmJo3DYQo9LNw01zOg3wp1yOFCy3
         XG0wZgEGP6REq+HHmQD6AjUM/wZPGF2jFSFXbSGvhsVzTvL1cyYdYqwSWfuuFoVXbaNm
         3WJ+8FagGL/jcLMvvJ0E1EMRLzsJU5MY88mGs90X1nbCGnYp9J1byL5FzE0MwimazyGE
         Lvdkk0ooX2j0ErBhkL5zS/0MGkpx9SLef3WQ+FPevbtuM6o9B9F5FE8BUsspNIBq5iKD
         RwI0TChXXDWrf6k2HwhxPnOBkxT/CtkmMBnohmt97XMptdrozAo07JPCEDu/4gL3INxC
         mDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052595; x=1789657395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ayp3X5o9X1g8Aw5BprGj/ZIiS1HUy6J7YJG+0gF2KyM=;
        b=WwMcf1pMDt1Z78hnTzKdYfJKsC4QRJgCEXVIdj+ICzfAntWOLfS91q0eArhAlOAHKk
         zXZ/uBHA4S5fqcwCnfNaznf+G16Q3adqGu4utDo7ymxVTGgxsDY64tg1gWLYXexc/gJI
         L8pUQp2U8uJftvutNhs2q+FgR72A40frQCyFvWfp9fEC6i4/OluppsWDsMwwwEhbDT8H
         yJkRDghth35oEbUrpvaYsZHbjdWC3r75t6jkzsgLU/WonI09Lt/UNPgSRxlgp2R1R89r
         66bnTPpiyTYmyAUx9zmDvqt1v9L6QST8hewq/q5hGyRLfZKyUB5AEYUoKg6jlLtb3sUY
         P59w==
X-Forwarded-Encrypted: i=1; AKwUvByyqeP3EX31jAMwzIC8OxklwoEUApnulqRok82En/R8rkg23AMFqOSmAF6NdqX+SXiZLTTOMTZ/w7wNwpo=@vger.kernel.org
X-Gm-Message-State: AFuF++ngi29eGMa/SWX0DbwxhiK8Hpw2F80VlmeOqvBm2MsuL++P48US
	pMfw7DUv4AFdvidxoaWbz4C+0hjI9k5y+TAzDNVuNWuDdBzgOqWq5NcO/0pmB8BFg4DNaI2qQXx
	s/PzYTXV/w4kITB+JLyOg6nMxLLl3Lu1Uh8BMD85/UVfyQP7VjhWQoTeEGNmuYLeBtQUTmpWNN1
	o=
X-Gm-Gg: AYBFou08rXutkmX3LZCTaipI19rOgbcN83Uq+DjukzFc+UgM2TwFaBZNffAPWtNd8RC
	5aIqjda5gckSodaaWGlM4YFGw4rJSh1AC79nncYDVnPCCmOK9lUdEs9c91l8XYBf+w82Ljw5eYr
	wT4Hk0AvoHg8UpRW/nifF32wYZHCsut187+2zLZm/Xy+BCBlvTBm6hwXeYU6XpMkorfe9KpeOcw
	KtlZyuGh+lcU5NB9V6sY/ktW3tR59m6BRzhN5rp6lS5vDb3hRSFcPtySuhXRdRlaLTl8JvxnKdI
	5GfLt8vknmxUywrpbMB/LEniN8dt7rX/++pVLPTsUHJ+ATwrNiqMVo5aJs5PYoTPUIHANhbwVoj
	s6TJTR2ndLsxeOAvsvD4B77JV5HDE
X-Received: by 2002:a05:6a00:f88:b0:847:8449:2bb6 with SMTP id d2e1a72fcca58-86168e87b0cmr60320340b3a.4.1789052594069;
        Thu, 10 Sep 2026 08:03:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:f88:b0:847:8449:2bb6 with SMTP id d2e1a72fcca58-86168e87b0cmr60320019b3a.4.1789052592419;
        Thu, 10 Sep 2026 08:03:12 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8687b479848sm2357060b3a.38.2026.09.10.08.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:03:12 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 20:32:39 +0530
Subject: [PATCH v2 2/5] ASoC: qcom: sc8280xp: Extend hw_params for QAIF
 backends
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-shikra-machine-v2-v2-2-9bf6bad589d8@oss.qualcomm.com>
References: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
In-Reply-To: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfX9Ok5srjSNtzg
 JDc+mp/bZ8eB7hV49Eze8AIMb1IP3ED02piWdXO7FENCZl73ope4DxdQvLoTMrBDw+H5QKYGQwa
 zFP2KT6yhZH5m3tWLmBlaQAUQ6UY8PijNSj66Q5HpQ/1BRYY2bWYVtHRRXIM7ixWpM9HDs81r1b
 OP9y0jJQWWCEeiwH2BXb3U/kBhndMNmDm/PXCdra/8F+qipEnwjh09YgLCGyZXEmPjMljfxhkAB
 MKBThqk6hmdCTWJYiTRP6o7c47VeQJluRhE7+MbwrtEIkvr24EyezI9kuUhQWJPYKS0P4lh0Mfj
 f71+E+gsGsCLG5xbj9oAqwLY26+v2ZruMDS6YDrxsf9PpLMSFJqQqmHdUP0/zMnnF9XaOpuRZBr
 JHCjsVTzTVqOCnBhDjo5gyGdUVHfvdL6RE+tQjceT7OIA+aqr9cB0nz0lXTahItxmvDQtwThSTo
 a0X91krGhPUMKEWqljw==
X-Proofpoint-GUID: SPgn9xgp4VYdwR0vtWPWUXE5wFUJlGGv
X-Proofpoint-ORIG-GUID: SPgn9xgp4VYdwR0vtWPWUXE5wFUJlGGv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfXzt84TgcyHf7w
 HUlMmNDlaHpFa8Hsne78ObMI0kTLK3lRdICSK+UzV5vMuuheTg0tRuTg2N/68N7LdbLIF3GrgnE
 DrM+7scH3zvYGrMV1x5M6Vf6zcPavM8=
X-Authority-Analysis: v=2.4 cv=eOmGH3p1 c=1 sm=1 tr=0 ts=6aa2c6c1 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Y6OeQYGgH-sQqnr-fK4A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100181

Prepare the sc8280xp machine driver for Shikra EVK variants that use
Audio-IF (QAIF) based backends:

- Add a `cpu_dai_fmt` field in qcom_snd_soc_common so that boards can
  override the default SND_SOC_DAIFMT_BP_FP for MI2S and TDM paths.

- Handle the QAIF MI2S (AIF_MI2S_RX_0 ... AIF_MI2S_TX_12) and QAIF TDM
  (AIF_TDM_RX_0 ... AIF_TDM_TX_12) DAI ID ranges in
  sc8280xp_snd_hw_params() so that format and clock setup applies to
  QAIF backends.

- Add VA_CODEC_DMA_TX_1 to qcom_snd_is_sdw_dai() and
  sc8280xp_be_hw_params_fixup() so that the VA codec DMA path is
  recognised as a SoundWire DAI.

- Widen the sc8280xp_add_be_ops() link filter to also cover links
  with codecs (num_codecs > 0), since QAIF FE+BE links are not
  marked with no_pcm = 1.

No functional change for existing platforms.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 30 +++++++++++++++++++++++-------
 sound/soc/qcom/sdw.c      |  1 +
 2 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 4d48e1012cd4..452296a9e67d 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -67,6 +67,7 @@ struct qcom_snd_soc_common {
 	const struct snd_kcontrol_new *controls;
 	int num_controls;
 	unsigned int codec_dai_fmt;
+	unsigned int cpu_dai_fmt;
 	bool codec_sysclk_set;
 	bool mi2s_mclk_enable;
 	bool mi2s_bclk_enable;
@@ -126,9 +127,15 @@ static int sc8280xp_tdm_hw_params(struct snd_pcm_substream *substream,
 	if (!cpu_cfg.slots)
 		return 0;
 
-	ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
-	if (ret && ret != -ENOTSUPP)
-		return ret;
+	if (data->priv->cpu_dai_fmt) {
+		ret = snd_soc_dai_set_fmt(cpu_dai, data->priv->cpu_dai_fmt);
+		if (ret && ret != -ENOTSUPP)
+			return ret;
+	} else {
+		ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
+		if (ret && ret != -ENOTSUPP)
+			return ret;
+	}
 
 	if (data->priv->codec_dai_fmt) {
 		for_each_rtd_codec_dais(rtd, i, codec_dai) {
@@ -234,6 +241,7 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	case TX_CODEC_DMA_TX_1:
 	case TX_CODEC_DMA_TX_2:
 	case TX_CODEC_DMA_TX_3:
+	case VA_CODEC_DMA_TX_1:
 		channels->min = 1;
 		break;
 	default:
@@ -260,9 +268,16 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 	case SENARY_MI2S_RX ... SENARY_MI2S_TX:
 	case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
-		ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
-		if (ret && ret != -ENOTSUPP)
-			return ret;
+	case AIF_MI2S_RX_0 ... AIF_MI2S_TX_12:
+		if (data->priv->cpu_dai_fmt) {
+			ret = snd_soc_dai_set_fmt(cpu_dai, data->priv->cpu_dai_fmt);
+			if (ret && ret != -ENOTSUPP)
+				return ret;
+		} else {
+			ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
+			if (ret && ret != -ENOTSUPP)
+				return ret;
+		}
 
 		if (data->priv->codec_dai_fmt) {
 			ret = snd_soc_dai_set_fmt(codec_dai,
@@ -296,6 +311,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 		}
 		break;
 	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
+	case AIF_TDM_RX_0 ... AIF_TDM_TX_12:
 		return sc8280xp_tdm_hw_params(substream, params);
 	default:
 		break;
@@ -382,7 +398,7 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *card)
 	int i;
 
 	for_each_card_prelinks(card, i, link) {
-		if (link->no_pcm == 1) {
+		if (link->no_pcm == 1 || link->num_codecs > 0) {
 			link->init = sc8280xp_snd_init;
 			link->be_hw_params_fixup = sc8280xp_be_hw_params_fixup;
 			link->ops = &sc8280xp_be_ops;
diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index 6576b47a4c8c..e19adb7c750b 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -30,6 +30,7 @@ static bool qcom_snd_is_sdw_dai(int id)
 	case TX_CODEC_DMA_TX_5:
 	case RX_CODEC_DMA_RX_6:
 	case RX_CODEC_DMA_RX_7:
+	case VA_CODEC_DMA_TX_1:
 	case SLIMBUS_0_RX...SLIMBUS_6_TX:
 		return true;
 	default:

-- 
2.34.1

