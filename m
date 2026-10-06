Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC2822425B;
	Tue,  6 Oct 2026 07:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791270467; cv=none; b=uf50V144Slm51IDz3siLUHF8mmnRxXM64epfYKnhyR8vVi+flDC+MUq7URr0iqVNPe7WH9aTjFvEdixcfms2VUi903m5ZxM2TQ6QD74s/kx3m+e6s71D/zOuLBgRcpPQiKMuzGYbHLMzs+1I/vXJhXoAMYdmyyo+5dmb9o4b53I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791270467; c=relaxed/simple;
	bh=ugPxsXxlqSoUb2UPk1WTXfS5WkJkq0CTNogdiu/FaWM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l6E+waU29mySwl4dg7CZd6ctvpGA0UcacKX9xUoiM/eWrFHeyJS5gUnFchjubuHC46kneLkGpn2ouE8NlQQXhIUaxKTPqSoqUdB0eSxsbY+PtouVu7QB43Ropu5nbGp2foXp1PRsGL/P15TXMgR4a/GTQ8yLpb9fkI57yJ3wHm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZJ1ANXKc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZJ1ANXKc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966gVGe1045425;
	Tue, 6 Oct 2026 07:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9iQ5hBQeHES
	1C37RgKGMzvkoH4ztQ+3iSPYrqKFL5HQ=; b=ZJ1ANXKcGLwanLL8MRqOKsR1u3t
	RsZqe9ICSetQ5BCAMVNuHKWM5qLbyI3LKscFLf9AHTOEskegk/rz6YAzaZaP0nti
	vNZYHy/zPRpelTDsLFWp2EpynPVG5v51RViDtiSfzOFDhjeAXB8hzC8dwuEa6Z/2
	YxtmSleWIXyVX4nPXBMU6TSDV0CR3S1kgyG5fHmGUnGhqeM07GtQoQkN/H2rTXVy
	b8T1GEJzKGK85OXfM5fzsqpNzRCciJWAp6hczzbmloMf5/7RMGwP1xOnU8HShR/w
	kJcDObly0JmdBd6aS8UtcK6gucOs4EOS0+xb98GjnBPkfM+uQ7LynyclL6Q==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4uy4g2uj-13
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 06 Oct 2026 07:07:32 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6965bLtW411417;
	Tue, 6 Oct 2026 05:37:21 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6965bLkj411393
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 06 Oct 2026 05:37:21 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id F12F0563; Tue,  6 Oct 2026 11:07:19 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v1 1/3] ASoC: codecs: wsa885x: Reset registers on teardown for B2B playback
Date: Tue,  6 Oct 2026 11:07:15 +0530
Message-Id: <20261006053717.3455143-2-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006053717.3455143-1-prasad.kumpatla@oss.qualcomm.com>
References: <20261006053717.3455143-1-prasad.kumpatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAyOCBTYWx0ZWRfXxeJ5dUNjGgsC
 CAkysNLaJfWxQpgdWPTRzb0YsTVw+OAUQTPk6Cpa0yWnbAu3Vu3GcMn3PDR1E6PsD/gZVcNoPGb
 etin4gYTUpBVLpO8sUfzmPJzLVyP/Ro2HskPaXUbsBgfoWxtZcpnfKJ4qHoIe+I8Q2CzT+vQiar
 1zp+O2f5+l0CBp1/xUUpDDAjSH1dolLSJDOwtwhHNJ/Oil1B+IIO5gD+7yWwqbbMp8IOhFdM3ks
 Vonlf8Z9kJN/WqUNlMp8hChPL5fAxeHgDTUA6GvY93N137CW6wnGELrc2c0DGuXxyLQS8zWXN76
 dVsQJud9L2XL7PUrrn262wwtu5g98fbdCRSsJ8/Qe4EHdpR26HQEPSqyIwWjDBEn1yLLQt91r7T
 zTdF/SvmnBYt5WHgDqSFE/EEdxpcm+IgQVCkLzpHu+qGN2VuaZocHjG31CUw8siwy0FsGXNcXXX
 AGJBEBlruxejrJxRgYw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAyOCBTYWx0ZWRfXzZv5BaXab3Lf
 8xUFa9L6F1vbCLxpvuE7guBE35PMUzndN25WLkgMf1ymXido8stougGNsRmUIQptG/oJd10LuM3
 i1/KYZzVHx4Tl7oWBoHTTVOv32uI04o=
X-Authority-Analysis: v=2.4 cv=F97C5ahN c=1 sm=1 tr=0 ts=6ac49e34 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=oS-zlhplfZi1ja0if7gA:9
X-Proofpoint-ORIG-GUID: C3rcRbYDGpVuy0ot-ELvpCUxYSMbxtC-
X-Proofpoint-GUID: C3rcRbYDGpVuy0ot-ELvpCUxYSMbxtC-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060028

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

