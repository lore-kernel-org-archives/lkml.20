Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2938D4C9E1C;
	Fri,  9 Oct 2026 11:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791544669; cv=none; b=IL34c3HGchg0c+6hQEvfII3zlNuXz0MDLqGItHDFop6WYFp8XMQ7NGeRLXEQEaOo+m7gD/vhksWHnrnKmc2gFgj7UXJw4K8/HC5MO11gE4Qsgc4aAHg3H77WohPujufQDB2qdYqbnsOJugx/pTKlr7hxBrUCCMyOTEmlZIiNCdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791544669; c=relaxed/simple;
	bh=ugPxsXxlqSoUb2UPk1WTXfS5WkJkq0CTNogdiu/FaWM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=stNsyeI1za3YZLG8eBjQAqRUHExLZANm3buajjQk2v4UG5cTBEnxjKW6INB7LYOZWiK3UVKhE5q5YgkOhtvvRpSNe5zdNJ6i82pqLqokzeSy2VJCm3he5gRT086t8tHvlWTFLblVwapGjYZ85kHWLCI/w0dtxbR9DHtrDbZtWo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Is/4ai92; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Is/4ai92"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KNIL1223224;
	Fri, 9 Oct 2026 11:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9iQ5hBQeHES
	1C37RgKGMzvkoH4ztQ+3iSPYrqKFL5HQ=; b=Is/4ai921TfuGrXMsEG1+YbVfdB
	l2f9OI3E2Hp6p3fG7NM52Eo3ybVob8WRbCqI9Gqux9mMXzS70fCvs0p0fiR0yz3Q
	4549uJ8XIYdFtrYSlkt/1xcRW8v6u8J90c+x5KwPb0bT0X4LkOwEc8Fp1O1fFfQC
	UIakgpjK6sdocy/47bTkN2laIPhGkJgp+HCCBC/FFP6WQyWmb9Zi4Kzosa6XDSfb
	04kw6e6ohtWt7vWX4hPRSlwNWSyWJZrXWNHUbX3mY7eD+Vysdz1y0aw/u1mEh4J7
	bLo8uYLBFgXgz0gISyhbpWzHax7eKkNNCqRtOxv5KPVqBjsDr9JBKiTP/zQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxkb72e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 09 Oct 2026 11:17:26 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 699BHN181842463;
	Fri, 9 Oct 2026 11:17:23 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 699BHNQQ1842445
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 09 Oct 2026 11:17:23 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 2ADD8634; Fri,  9 Oct 2026 16:47:22 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v2 1/2] ASoC: codecs: wsa885x: Reset registers on teardown for B2B playback
Date: Fri,  9 Oct 2026 16:47:18 +0530
Message-Id: <20261009111719.2609060-2-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261009111719.2609060-1-prasad.kumpatla@oss.qualcomm.com>
References: <20261009111719.2609060-1-prasad.kumpatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: x_HxaS5THXpDWqWsxfvkfwFDuHrNY0iu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0NCBTYWx0ZWRfX+Y7Jl1SOuFov
 MuwQ8ReXzUo29+lYAP1VcK21k5OuoWV7PxbNjKLEcOlF+mYNvbheuJdYYCV1QQRSUwi6LBeY0/A
 Qzap1Ebggv9zIPj0bceAXMJB4ZgykeU=
X-Authority-Analysis: v=2.4 cv=Cs0q4X4D c=1 sm=1 tr=0 ts=6ac8cd46 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=oS-zlhplfZi1ja0if7gA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0NCBTYWx0ZWRfXzmFORunNNiT8
 VsQdhdbFKPCt0tzAd+g1LqdzjtLsnpXP0iHwAuBZkLLmaGE8/hRUT6ovL0m75Ygjk0/12R5rsAT
 rtrj1U9P81+RLgAMflMRrGilhsSFoGrOE0ZqfNqpSMiuf4QOcO32Orlic3a91tvsWvD9O75zzfI
 ptYY65UJxub9TUXdYah0lbvMHldeCa1tDNQ1s5P51ZUWnWwr6Y1sQ5Y6NB1YKw6uIcCqDpf2aMu
 CXUHcDYY3C6oUu02Oe+/QJ1/67dvn8ePqq991NX96KWsd3IfgNyrspn/bYEuXvehDug0iioSm4h
 wq7SeC/Nd7aSeJ8SLXnJVQYD4o4Ygg+vE+97GV/cNnHZF0hVf1eSqVeS1VpzlXMyzBt5Ib5zVKD
 1q6npq4pwoLsOZVnsCL8/Hiw0DjNqge9lr1Tr9Vw+0+m1YPzWlDVIxHFFxhrefCsdyY39DDpeau
 MO/Z9yi6WDhn/swR6ig==
X-Proofpoint-ORIG-GUID: x_HxaS5THXpDWqWsxfvkfwFDuHrNY0iu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090044

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

