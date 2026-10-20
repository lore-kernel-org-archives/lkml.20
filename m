Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481971;
	b=s/mAiBgftEVkDtgTFLMN31RM0MOiNAH52jDsNNKDrOeTrEs5Z5Me7lVt+UHYaYhEUuMh
	 /i0AdfZj3KwF6IplPytJQpwigYsnRfmpx2L/Fy72gZ7y7djwrwIEtPW0Q/P0Qlr3T3gwQ
	 +wImhSFy1BsgHYsHxL6zMl+Urdaq8O9kVeuvWyG2rKEF7jq87VMsudlJ/8v2M4bVxjOEX
	 K1youXPeimMLZyFifbziK4Qvztzo/YvSacJZgnsSd7FKWVzq1vi02peC+vkOAgIySPZKb
	 19APw8HXF+kVRcTUfBE4urYE0C8YuZZrkRqLetylwkHF6p+NnJv9YY2esQuh3Wrx1dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481971;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ilWLIrnHPQIkq8Nqks0gzeKHylePZhRJIyxsg1r+je8=;
	b=awIPD1JZLi0xmJpM5GxeSqMDQ1APm/ANrtpyQ2pzU7nhD68fGBMdcw4yZAf2jRsG1nJn
	 5bmv5fImx6vA8USbtyuKTc9waanXCf7jTS/dO4zc/W9O3nmsE2UqMmiP6dHOMiZH2Gjpg
	 pTDycIdIkjOPTXq8Wnum6URpa3Wz8olBmJ+Bxq3AecshqfnmL8+W2BouHQuM78hI3M6wJ
	 i4X86YK5GHLRhBNUnoILTCnL3uNKH5YSGZZNz7C7fTyY+++MoeBz2u1+WZGUWuoznOlFC
	 b1sZemQA79+LRPxKaVh352/epmY+ACGul5k+BWg1ZecuOk59e1ZmpLZqwZvwAMQMl4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CG7+TFoB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gO3ueHds;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26784606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:39:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26784606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CG7+TFoB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gO3ueHds
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0t74Z1211011
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:39:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ilWLIrnHPQI
	kq8Nqks0gzeKHylePZhRJIyxsg1r+je8=; b=CG7+TFoB9NDdACM7U59ZGSYOThr
	NbCVcej71CkIT7xY6hEFtxo1+MvQjEFYmtqC6OR9S1N+eQ44j7MyNQ6dLae0leVq
	68RMe9vJhaq/KQNyfxyS2SmCsT1+Gqp1XrEDZnL9nA1bNpamg82gglaFNe4WTGum
	WfIIK43Kg6qXHGCV8nuUDpugFeYyJ633VYU83m0eL99ZteNniPGiTbvlt4qD/RJb
	YyWaH/NDXm0fA9uP1U3bPPBplRStYnqOI+Sl82M6XWbo9OmFwyTpgpUE5Hn+e96k
	69HzH/UUkqTZk8KkvQXTXcNG3rwrxr+Xkf350dP2AESz/5YdEJ6x6P1MlaQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p1e45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:39:30 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91b8306ba68so72705846d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792481969; x=1793086769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ilWLIrnHPQIkq8Nqks0gzeKHylePZhRJIyxsg1r+je8=;
        b=gO3ueHdsm9KJgixH+jiuUgdmEDHDzHXMoBOk/5RLdAWi09Uq50c4WdDEInWnjDxGS4
         HqJPUcR2ysytqxDPdvE19UJ/LlDBN5XM4tRcFhcycZ9YsEYoMGi48g5Zsa/GZxWHxJbb
         yiYlhJJS/ebx+NY2RzlMia/ZDdBo5UdkOhTYstPpk2wvv4f4HH3UVFvQ/7HJ/yH6pcFL
         7vodOfMBk4r9LBUZnE5a6OrJwLr2SJ1IqiA2YtYJKN1AIk4WlVLq0Ph5KABq/4Et6Y2n
         nrpT0HZTCN7eeBwEyOHwhJr5rbZIONXOBHNpQ8CQHnINMiMIVqnD2CazBsRtZLGLXYHi
         2xWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481969; x=1793086769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ilWLIrnHPQIkq8Nqks0gzeKHylePZhRJIyxsg1r+je8=;
        b=gmJZb82ovvR2Xkjl6hBxiWcK4cHDMYltJ1CGWXSWO6ZW62jl3Zohn0Meymg7NXRQ0W
         bfB8msfck6Q6sGQrlBssN83aQkOGhZ1S3zmAew8pm/YIF1dKUy+W71YtUNqmD6uireYa
         OT7VE/qNRgWNB6GLm2pCLXQwtAza35P4SXyjJyVqltKlJHu9IWUcAkgbqe4LsA2ZTseY
         jJfWZrMN/hAfjzApmzWXIn/3SrOPYm/JvRo9IGlr0zgB7L+MIhyd+SEjiAfgpO+PRDOs
         aZPBooZllNBDZy34FLNBpALbLqygcy0Lxa2VgtxM1FZOiyk9O6X5JHg9hD1hctE8BPSl
         aVwA==
X-Forwarded-Encrypted: i=1; AKwUvBwopRXngr8AcKasvPYAOKzK2Ov5VEnzn7fteO9fYLBX2IApWHDgq7C+CFREm38NjzeQBNt+fJ7qtlQXfFk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8lSMACZmx9uqqOdymDsTrVGvooTyn8KTuAmeQADwnpvH5Pnov
	HC5eg7NM76qYReQRD7q7QWcB84Y/amszDZhtx+5C6rjkXTK8ADlT0YL7ghEpZy9YQP9B61HdgLr
	aWMBhXkjkU9bOG5iYxvtO/N99xDrUuu0xHLMEZgSABBWa3Odb4V2VSdbtVLOnozGotRQ=
X-Gm-Gg: AYBFou2mpZwBPtl9GUHo7Uvor4igMCi34teDTQuXuYg2FJ9DRu+DnBq7RDYGl4PkFGn
	1pftApOZ8+rXCvEUu0c+f6dOnivyZjon7sMVErzMAiDNQCauzZTu11J85WIgStAIVEDXjiKDRJF
	eRpnxbpZdydzdS8+On6/E7qCqD4eN6VFDGTDds8XNaMpy1O7FiE7106BlWj8/ckT1D0bCFDB2hx
	30JXjsVHYr+O8no/PROzCx5DwmF5BMnrzrCU2DSy9HIXZ/NOZynjuX8YC5EUO05IWGmURkOONkU
	edCr1CCJ2FN6Exi2uKOLrC0GVd2aucs8U9yrBwQ0S9rNQ0ahfbE2BFpP19leAucVD8+luFJcs6s
	38Ulieq8Uj1J6
X-Received: by 2002:a05:620a:7106:b0:93e:722b:1f79 with SMTP id af79cd13be357-93f29d75a16mr1687353985a.53.1792481964547;
        Tue, 20 Oct 2026 00:39:24 -0700 (PDT)
X-Received: by 2002:a05:620a:7106:b0:93e:722b:1f79 with SMTP id af79cd13be357-93f29d75a16mr1687326985a.53.1792481957979;
        Tue, 20 Oct 2026 00:39:17 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8208e0sm4566271f8f.36.2026.10.20.00.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:39:17 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Sanyog Kale <sanyog.r.kale@intel.com>, Takashi Iwai <tiwai@suse.com>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 6/6] ASoC: SDCA: class_function: mark PDM data-port terminals
Date: Tue, 20 Oct 2026 08:38:56 +0100
Message-ID: <20261020073856.1177749-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020073856.1177749-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261020073856.1177749-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: MaDcMemCU-bQC-CQz8V3Da4UbQLL2-8Y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX4npW3cMfmMIu
 Ftx6ug1PhfPd3aUN/B8H9fFNy168YJc1srlkCvI+d1DpfDhSKLgetNa5m4AXCJ5Asf4+rdfiS7P
 aUCk2dYWrvLpSI7LFpDzieSCU1DVYVM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfXxoS2KrilKC3S
 xxMpfsVcC+J0wPxinI/a0N5bOtY6W4NwyYuPqqj04Dw0mQr6H7La7WHqHgKOzsoZsQq9+mQheNl
 1qZPl8y7sA5hHb36AhsX5MslbcDqtmWCqZaqLt1gKWmI//TgFs4RON8gom5bFRcmyr+37pWRTRT
 M5jRVwyx61oVaHKfa7J65ePOH3lzXVSP3B3aaMw6C7TTcfFNi7EN3iBkRsOEsrXKG2lbk24ZWBB
 KGgzrqskiqpjWZbaq7hpYeKPcPmzHxH1NdMMJKbbDtnpo1ye3YIWVMIVfZHFgrQrEN91vRXa5Ct
 VrlqMNQMMUZA5YzBcd5imTknVZQ9JmmVDupqFBP4myHaxQloSVt/0q5UNoUdl+xCQVGEkQoVbJf
 rlBMb9lYypweAkOgfHTtn4PouAdMgJYVw8f/8cL8o8HVdZ2saevad93ev7Qs8RWeyX7fj3L8hzR
 6Ur4aeltrgE/lbQOk7g==
X-Proofpoint-GUID: MaDcMemCU-bQC-CQz8V3Da4UbQLL2-8Y
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad71ab2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=0o_WhHQcJ6e7tPDH-2wA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200030

snd_sdw_params_to_config() leaves sconfig.type at SDW_STREAM_PCM,
which is wrong when the DAI is routed to a PDM data-port terminal.

Set sconfig.type to SDW_STREAM_PDM for PDM terminals so the SoundWire
core sees the right type and does not enforce bps match against the
PCM-container-width value stamped by the helper.

Assisted-by: LLM
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/sdca/sdca_class_function.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 13b70f0f0dbf..41f6f0eb8563 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -142,6 +142,9 @@ static int class_function_sdw_add_peripheral(struct snd_pcm_substream *substream
 
 	snd_sdw_params_to_config(substream, params, &sconfig, &pconfig);
 
+	if (sdca_asoc_dai_is_pdm(drv->function, dai))
+		sconfig.type = SDW_STREAM_PDM;
+
 	/*
 	 * FIXME: As also noted in sdca_asoc_get_port(), currently only
 	 * a single unshared port is supported for each DAI.
-- 
2.53.0

