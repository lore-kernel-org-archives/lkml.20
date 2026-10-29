Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793240638;
	b=iPxaHkDl9clNPRn85htzQYJaBJxubAv0+1ndIPYeQOuG9yJtrY/ZNti0cxxpA/ECcdpl
	 zWB5A/2AOTc7NnsSumbvtcQfEUyl9Rvi0oMvX2Gzic5kfmQc2y4TMBNCCk38o53FR5GDR
	 Bq13IXFi8jnXX6o/7/x95LqYsnswgHgBEYYdFrt4uo3tfPKNJ+tf3viu9doYTaYDyOW/C
	 oE72nf8wcK2iIsUIg56DfYt6UT26c4o7sEKGgMZbgocCV3rg8k98lxVEv56WTDkXqgB6X
	 DeUlWpaaAZWQe3DwC1jJK/w+TskQKOKUkIZ+RQyVpYkT52Foet9xW3Mc7jHGM3Eo8nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793240638;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3oGkMQScRX/tXnQ0sOZoQxWWvmtTrIsdcCnCFnpOWw4=;
	b=jW3jPSq5f3m/fQLS50JAumqDr41BT+D1T0viyfqP6F9rrQ0Y4t1MGLnmk/hLBboTvI6Y
	 pBccMP6i4mR7hCc9c669SO5PorAY9AF29BZpao4kYNa2Bo8Scw+cLQ795IKLCAPYMfzL6
	 vOj7uC76lH3MoSsI5oPl/lx0MF9TohOGlr1cCZYoIpo9rZBienFuLSVpT1O4MdxYOsuco
	 P+ivJm4LCw5Oc4mKr8QSmazsqZ5WEwLWZtmvaIymtXbjJwrb7Sdnh2eGD7TjRbOReoZsG
	 F5qOAwaJ33YcMl5Yq2+1m988KlieNRTzX8fIQI4eCZ6MIHG4rC8mBLG8V3CEbtnkdUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="pF29xO/e";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g9L1YRqc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6A9606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:23:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A6A9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pF29xO/e;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g9L1YRqc
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T1jfiH2842723
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3oGkMQScRX/tXnQ0sOZoQxWWvmtTrIsdcCn
	CFnpOWw4=; b=pF29xO/ed88eqibe1Q6JoJwYLr98Bqm7uJz7KkOflvyXwhT7i6p
	EXnDOikekI1AEGIAuab7AVB+4yX0Hof6mGo5hAF2SDcPhOUbpHteuxYTQKGnmgC0
	fUcP/flS00Ay1gWg4oy72q7ZvhU7uRtgNBTK+6bUvn8M5teFf2d4BY8Wf5/47mxf
	nVP5QtVr7rZ7TGVO9nTuuWu9F83pConA7FKbXxSJ/pbhRYA+uaoKj32NfdWZRq+M
	/8tz9ms2zCyQ3+hhZIopagfL1g/kA/eTYHNb8/gvaOL+G1ec571+zQpneQGe9NqM
	PbdqvmchHdnzFcvx/ClYEbRbGOjmEaIelug==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkfehkg3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:23:56 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso2958406eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793240635; x=1793845435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3oGkMQScRX/tXnQ0sOZoQxWWvmtTrIsdcCnCFnpOWw4=;
        b=g9L1YRqcaD/8gf7UZE8gmidcB1nu7ho52YxnPIUhC4CZ8LummyvwGP0YvOBslBC1AA
         vvjlrZI5wSQ7skeh2ReAiJhdBMMNj9F+LpmkqoCKUSDTRow53Yh8MCFMSqUVQBz9kftI
         i5bbYjszg71QPvkAhZR9UVBgv0X1VqMYRYPPQElEyk2rRTL4ZpTNmn+nWA602NBVrezM
         JPmlF+MVXxg6M/Z0MpwRSvWUAzdz8penrJFThDca0yMUpyS0PM6PjOjOjT3jj0S5f3Fi
         IhM+5DnzIbR1L8Dw+FaJCJbJG24HKrCFF84saqsU9j/6cx8Y7PDRGAfeXgQLcy71QyDC
         XQfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793240635; x=1793845435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3oGkMQScRX/tXnQ0sOZoQxWWvmtTrIsdcCnCFnpOWw4=;
        b=xde6Gy1SJ7Ct9MwF+Pvx9VjDyKNB3g3IZ/VIXf8bq6WJ4kQLCG66022yOVhvXXkObK
         LGXtLKZxxJmxm86TG1NYpU3gQ/nCkCNY5QGSv1yWHl1jsuAESvSFauzvr4nRkR0MeRpB
         E7Q3QEt1Aagz+91KvWMpVtN9R7SNzOBiOZMd5jrj+6qk02bS5elGdqVpsXwyApnL4DGm
         Ek2xjsL2pUA527T8bCdx2ZjclLDGv0zlV0VEAw7zJzZdQ+vcyUowdCmx/ig7F+H6fiTV
         z4XX5a7s/de13VV4TgE8bRRxaE+rEBt9AyyoN6slTSCpNCAOgBE75MJMBURaTkdupFmR
         XU6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzF+J1obKueDouK5JdMgnl3cUrQ+GTnDwvAmtounxQAhjnrLo+JXr7tVecv9q2q7d8tmvMwgY45ivS4uLs=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8IyP0guDirOX+Ea8n7Yayi+N5S/MZSEKex2/OCete46Qe0CtH
	MhvNALvV1GDuz4PRfB6LlvqsgftmtgfV4sVvnZy9LrtPTMPk2picHlyLAUuKKhujRw9qBFJkdlP
	3tPkecvPygEIe0CLTvkT6sKAJTqfiPWV9ffmOWKxTBP7ZkbzLKgGZ7y/LHzJicJa3dn8=
X-Gm-Gg: AYBFou2R1LQMs42RnfxKlm3IwY4d9id8z7CQTJuKbLot4NG1hiDBWjhzWTiBltQ1sGN
	YtaKmrw5tQBxGTyTh91zU/ZIMAp2r6ZzOfxmVK4u4xY0ffdtdS4jK7iRAADgNjJgBVV1JSS0EC6
	pg/xi4issaqo0D/oduic3qbo+rYyo5NO9rsx40NWENVh+JyWgTdXtOht13E+rVordObjOvaoSl6
	TC9qMd8lhPdW9Tk1yY0wTF6urdcKbdBRLRWZLJGZCjYd8RJazuyDca5HK7HZJICyLfVJklnn18e
	OrCrU1CzPNak0VouUOaezeEcmuE+UdGq3igIZFG3XGeyH/Cvakvcv6J6cPsIYyknOBm42/ABKiK
	chh4TbmB6lIbU6a1h2/cMz68e4yovBeLSrh8/rxWiFTVSh4xSzzBgiXKXmGBeXoz0dJH5z+Xhul
	JSeP421/sSuJJkj/eTZXPo09PzFffojLpn
X-Received: by 2002:a05:7301:29ab:b0:351:7ec1:a92c with SMTP id 5a478bee46e88-36a201b1d5fmr5702497eec.28.1793240634991;
        Wed, 28 Oct 2026 19:23:54 -0700 (PDT)
X-Received: by 2002:a05:7301:29ab:b0:351:7ec1:a92c with SMTP id 5a478bee46e88-36a201b1d5fmr5702459eec.28.1793240634343;
        Wed, 28 Oct 2026 19:23:54 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23951e00sm15112588eec.20.2026.10.28.19.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 19:23:53 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] ASoC: qcom: sc8280xp: Derive TDM channels from DT mask
Date: Thu, 29 Oct 2026 10:23:40 +0800
Message-ID: <20261029022340.591372-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAwOCBTYWx0ZWRfX2JuMZQvIyg7Y
 SCvs23PiHU821XecoV5aw0rRh8W+EuPKNrynwOPb+brm7O4lYL+qKibmpG2fLvHEyS33xYDYI/+
 FqjFmtwJX/EbjOuCVSneJaDMtl2/uDTHHUD6e1LGMpkyN/Fxx8Vfky3lJ7XfuAAptd3cElH3tz8
 rCp/E1HEpH5JythcbhMJX9KETbO4UjRkexk+XPy8EAxqba9uywGW8vbCasyJnlhuMPS2NPRoL3q
 JeS7C6BIqPoTZVnVa0+u84Y7UiUnNNEHGTyQ2ffU8gBTdDziuY/9cRHsR8rTEuw8Ve1WJVEX80b
 NzimsGDHi6whNF5okeW111NMkPujAPhkuy40icmL1lokubkE7ikFCFPM2dokqoysGL6ibJsAujL
 LxuKxyzYS31lpGLPBbxsVC/vaMtVfMKgapR8cSClZth1lqjPRx/T/MD24BaVpchEHz+DYjA2mHa
 rKXYIuX75GfqXy3cCJg==
X-Authority-Analysis: v=2.4 cv=A/T5rKWG c=1 sm=1 tr=0 ts=6ae2ae3c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=0mQFbbcutK90DCAcDowA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: NC7BocGov77lqSv3vMG99rS0hSVfno-j
X-Proofpoint-GUID: NC7BocGov77lqSv3vMG99rS0hSVfno-j
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAwOCBTYWx0ZWRfXyP8KoveAYf4t
 32pG9RUx257Vz+1Cq8O1fhfWeRHWCUM3Hu2h+IVbJW7z/O3Aq/1rMeQtEnTYBw4nGRC8oRB7rnW
 l/mnnZC9YTztOcCDL8MyTabsUyaZ7Kc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290008

Derive the backend channel count of TDM DAIs from the cpu DAI TDM
slot mask in the DT, using the same DAI ID ranges and tx/rx mask
selection as q6tdm_set_tdm_slot(), so the channel count always matches
the number of slots programmed into the DSP. Each board then gets the
channel count its dai-link describes, e.g. 4/4 on Nord RRD, 6/4 on
RIDE. Keep the default of two when the link has no TDM slot
description.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes for v2:
- Cover all TDM DAIs (PRIMARY..QUINARY and AIF_TDM ranges), matching
  q6tdm_set_tdm_slot(), instead of only AIF_TDM_RX_8/TX_8 (Rafi)
- Link to v1: https://lore.kernel.org/all/20261021025310.2072026-1-shengchao.guo@oss.qualcomm.com/

 sound/soc/qcom/sc8280xp.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 9aae6aadd43d..f5b147962afa 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -303,6 +303,22 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	channels->min = 2;
 	channels->max = 2;
 	switch (cpu_dai->id) {
+	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
+	case AIF_TDM_RX_0 ... AIF_TDM_TX_12: {
+		struct qcom_snd_tdm_slot_cfg cpu_cfg, codec_cfg;
+		unsigned int mask;
+
+		if (qcom_snd_get_dai_tdm_slots(rtd, &cpu_cfg, &codec_cfg))
+			break;
+
+		/* Same slot mask selection as q6tdm_set_tdm_slot() */
+		mask = (cpu_dai->id & 0x1) ? cpu_cfg.tx_mask : cpu_cfg.rx_mask;
+		if (mask) {
+			channels->min = hweight32(mask);
+			channels->max = channels->min;
+		}
+		break;
+	}
 	case TX_CODEC_DMA_TX_0:
 	case TX_CODEC_DMA_TX_1:
 	case TX_CODEC_DMA_TX_2:
-- 
2.43.0

