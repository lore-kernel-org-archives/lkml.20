Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B71B3E49FC;
	Wed, 23 Sep 2026 08:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790153216; cv=none; b=cAVowZ6exxo4DhwBxPpbndEgfs69YvxCpkbfIXXuyteyTN8dKrgQR8zavu6gKIqDvMS/Ou8PM0Ck5djCoh8QaNk4gcb6BQmLVCFJFTJo7J91Yn/a6e6UYYSRZdhcB9Fq0MvuLs+U7xt11P18mIXM7j0QzUHAE6xglyNc0SD+bUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790153216; c=relaxed/simple;
	bh=ugPxsXxlqSoUb2UPk1WTXfS5WkJkq0CTNogdiu/FaWM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L1BpBlq4DGaEM6acfA/kJI7nK5PQnjfhE/GUXXgCW5HIIsbE+ipFZ1ISdiKmj0lkq4Ra0FEpXDR3MvAzYZt3wV9el5g6x9twQ9IJMwEimlK1b4mKUjPUE/gFZ2v5qJbC1A1MFWHq30KRhgZXg+y7yUYgUxfy1jQL0RYthT1VjjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IdMcaZeb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IdMcaZeb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JgSL3332921;
	Wed, 23 Sep 2026 08:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9iQ5hBQeHES
	1C37RgKGMzvkoH4ztQ+3iSPYrqKFL5HQ=; b=IdMcaZebUJMqEd9Wday+80LhAqX
	VXNWp8vB0OmFGYajIqoR80FUoL/yyERt1tuwuphqjJPduy75pU3kR+uwviGQ8+SN
	4rYbS5rB1KKAnPyDdM3Jr4d7roNq+x6as5wXvfQj1WkEsuQW/RvEko7I90zYiTMh
	uI+sDitjR1U6Impqcw4ZeuFsAkPIIfLFpDkDaWDzbL44Wvq/kbAD4gaBSCMxXyeB
	e/EvuzbbB5f74gFJVTUNrTKFxlyCN0JIoA791fYCZE0DXZzWI9IKwpaRHqGt1ZfZ
	ORZj1JSjO3OgALGMZVy174hQblu82xZuR4HDZ1xoKxUmCAxx9KB2Ka/qtqg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux7xueeb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 08:46:39 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8kajg1728445;
	Wed, 23 Sep 2026 08:46:36 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 68N8kZUv1728418
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 08:46:36 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 22D2F5DA; Wed, 23 Sep 2026 14:16:35 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v1 1/8] ASoC: codecs: wsa885x: Reset registers on teardown for B2B playback
Date: Wed, 23 Sep 2026 14:16:20 +0530
Message-Id: <20260923084627.748920-2-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923084627.748920-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260923084627.748920-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: leXs2CCZNKqaxvjjIl6Mol_4SdVghGSH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfXzj1z+Do3EVKa
 a9L3w1Ddmj113mcF/3hsZC2D/GfXvEaRWVdhGAolwV2ikIez/BqIstyyOQYvtUoHJrgKsoK62mk
 WzIKvFKm2iNIhkcTUcj53qlxG8N6bLt67IWH0mi+9OsNtapeGP+bAiNa02nx2DA2e5hf3Iadj0f
 v4dKENuHrTCSoJQE/SEQU8Ob+0/M5v1PeieInByaVnWDDYo/Ipu2p5ACOtsQWTON9S3ENXy69Wj
 Wegk80Qr9g9BxNNLI/j5RN14evVG1wUJCKwTrrNEmTSyAvWdt9hLHQtaUWodYedQcCgKEWynwP7
 M2zkTTdjqA47Q9UiJGvdUw9dWRWakyFf1A79lwo7EU+nmDVqYZX9HyTsI0AcPNqF8isy4Wi2ijW
 KzjGdqRWuL4q8l89dmJ8UEBavkS+vxk5pOsjI86ifbwQi4DQZNhcx1Qz49alnpZ9jDOblScmWlD
 1GhuV59myOPz4auo8Qg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfXz1arrVfcCGuz
 vD589U28+7u8cKSg1EmnwU6Vf68PQvCIKkMq7kUjle7d/kAglUfukAGiHLUK4Ox+++7SarWxuvU
 wjWi4YH0e39BLA85IMWedOG1foWkrqI=
X-Authority-Analysis: v=2.4 cv=QsDLTlyd c=1 sm=1 tr=0 ts=6ab391ef cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=oS-zlhplfZi1ja0if7gA:9
X-Proofpoint-ORIG-GUID: leXs2CCZNKqaxvjjIl6Mol_4SdVghGSH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230034

During back-to-back speaker playback the PA sometimes fails to enable
because a few I2S/TDM and clock source registers retain their previous
state and are not reprogrammed on the next stream.

Reset the relevant I2S/TDM, clock source and bandgap override registers
in hw_free() so the codec is torn down cleanly and the speaker amplifier
comes up reliably on back-to-back use cases. Move the bandgap override
reset out of set_sysclk() into the teardown path where it belongs.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 sound/soc/codecs/wsa885x.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wsa885x.c b/sound/soc/codecs/wsa885x.c
index 1faa8541a872..5ffbf9e89fd9 100644
--- a/sound/soc/codecs/wsa885x.c
+++ b/sound/soc/codecs/wsa885x.c
@@ -896,7 +896,6 @@ static int wsa885x_codec_set_sysclk(struct snd_soc_dai *dai, int clk_id,
 
 	regmap_write(wsa885x->regmap, WSA885X_DIG_CTRL0_SYS_CLK_SEL, 0x00);
 	regmap_write(wsa885x->regmap, WSA885X_DIG_CTRL0_POWER_FSM_CTL1, 0x01);
-	regmap_write(wsa885x->regmap, WSA885X_ANA_TOP_BG_TVP_OVRD_CTL, 0x00);
 
 	return 0;
 }
@@ -1006,6 +1005,16 @@ static int wsa885x_codec_hw_free(struct snd_pcm_substream *substream,
 				 struct snd_soc_dai *dai)
 {
 	static const struct reg_sequence regs[] = {
+		{ WSA885X_DIG_CTRL1_I2S_RESET_CTL, 0x00 },
+		{ WSA885X_DIG_CTRL1_I2S_CFG0_TDM_TX, 0x00 },
+		{ WSA885X_DIG_CTRL1_I2S_CFG1_TDM_TX, 0x00 },
+		{ WSA885X_DIG_CTRL1_I2S_TDM_CTL1, 0x05 },
+		{ WSA885X_DIG_CTRL1_I2S_TDM_CTL0, 0x00 },
+		{ WSA885X_DIG_CTRL1_I2S_TDM_CH_TX, 0x00 },
+		{ WSA885X_DIG_CTRL1_I2S_CTL0, 0x06 },
+		{ WSA885X_DIG_CTRL1_I2S_TDM_CH_RX, 0x08 },
+		{ WSA885X_DIG_CTRL0_CLK_SOURCE_ENABLE, 0x00 },
+		{ WSA885X_ANA_TOP_BG_TVP_OVRD_CTL, 0x00 },
 		{ WSA885X_DIG_CTRL0_PA_FSM_CTL, 0x00 },
 	};
 	struct wsa885x_priv *wsa885x;
-- 
2.34.1

