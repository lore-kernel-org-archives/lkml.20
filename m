Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAACE47ACEB
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791457646; cv=none; b=ef4wPHbyh3z7FAqNQ0FtnjRFbb+HFN5VsafGv99e990ibBMdB0GdC0cyEWlIcvksQPd47m3OskBQ/VREUc0PWMyyZMOTTxWLjZ5fQUABpZKEw5PVmz8wKb4D6OhzyFrdbw2eI0+bKNcQqQktDajkAOXn+xlqVVODkqjNyIsh3VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791457646; c=relaxed/simple;
	bh=ZwUqGQcfk6A8AMkbVhhLt/3nAUTH/gARFozvZNrREck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bLRf4OIQKM4PuG0ktZElBeKwsMxDz3bAb5FzW/jevrScz957iGLdZxQ0o2ZdRqshtOglH0aCfNUSWA/X5D16ZsYbHKS/12j5elVAmD2qoy63MnE/Moll3L+DtECg8Hk3wU8bVz9xs3PoOJE6JnDpsuzCfI79wUvT5dkb5IpQFp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L39oroOV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gMsBU0+f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L39oroOV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gMsBU0+f"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698Ac0Ic2021649
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 11:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ovAtjVylzCtvs0ocdhdGM61fkRLi9pS9EMibasV4DE4=; b=L39oroOV3fiiXpLt
	oJrqarwUlMfh14BYmWiruPvD6MU0kz9SV7uJozWJP2m9L+kNnLQhbHVQ+c8766sI
	lNR8fiYhzHqFDw9RMDG4BZc6VADlIRfPlHHJcbJq/41myFDaQF+zUtPpmuyQSb5s
	mzK/zoqZumQlv3gyjlP49RddLk0EE7nFCh3kluZeVgjj7eQSTkhZTQsAD+tQuieC
	lslBV8H2g/S3/4hFjf4AgBWAzHqjgzwEMg3y48yY2alIpJjHeunIAQsHyj2vpfIF
	LKiMUcKDSc/uVk4Y08FismhGqEcgy9Mf0+1aSlabA4OD9lwBILUsQCssamguh+4a
	TuZfjw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe52m5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 11:07:21 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-88cd731cf24so3779098b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 04:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791457641; x=1792062441; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ovAtjVylzCtvs0ocdhdGM61fkRLi9pS9EMibasV4DE4=;
        b=gMsBU0+fjGPOXXjV5yy94S4U1mpx/mD2FmPHRNYi6R2guAEPbUVuTn9VLQPIv8SEyX
         cif5QdYnrTDoXOnwqXyaJVPk9gqhiKSGcVhcZYUZeEI/s5GsVEGeJ+OJWCwsj2o34F/I
         FWngY02oPkxo7HAX0eKAVsJ38Q1S9yD8QRoPWU60eZwqZtY/bo9Pt3fFCZcCx9exdeSS
         Nlo7zONe8JpcsgiCCPMIloFxGXu9bl1/Ld9oVKI1cLyyENJv+v/ego424lCT3YvtvKFF
         rP9mHIBI0JI5tas6ZMolfpZVT4QptUsJITUy6eGADg5I3+jmtV6je+cr5Bc8FKdsJypk
         CRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791457641; x=1792062441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ovAtjVylzCtvs0ocdhdGM61fkRLi9pS9EMibasV4DE4=;
        b=Uw/opT3GWCPi2vpZKT+4KDe1AikRKAwCtRhh9tE2+JvsE7ThiThm9CYzaO+eNVlDn0
         cKvZN3K4ZZwEkmo5D5jcLQIlqQw1uzFk0z9vKH8LMLzbde8o93cgcHKW/YuSkLIC52MX
         Mf15L2hgijeWU97+rXBBTZon5+ovCN7xVieAEmv2H7Tb8fKl4diRIS/gOyGwoak8TJJF
         HLevd9vhj/d5+YYWU1wVeU2Y33k6QoxX+nMl3A4MYmYYstoAnm3Z7XLurYSfIOWuMF6G
         qIsS2gCCna5fqHbvrPXT9l+oIi0AT8OdFkKYRSoKHnzoha7kkSm3F1phZuwHUZADWb8o
         YDNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzeyjP1lfoIm+Z8yX5lRBi67LJxAPh/lHEKtRHkI7MNNchs+4SicpulUkcrWg1EOEdP1z4P/21fkVNEFvE=@vger.kernel.org
X-Gm-Message-State: AFuF++nZpzRZ0+yVs/c4XlHFAIRp5K5wp1Rs0s20iSHuT511WmBvsifj
	rhnX1AFbFvimVSTO/B0eL9/WbaOvwG9IYWkHnjulMM6xFmMRHYkz71tRG4dw2ieGU3r79ztsLbD
	3Yd5LwujsinDx9q273zhTkOTJeFdV1rYJN+bUybdqF/KP8ygDov2bKhkULoNUkeVJ0UQ=
X-Gm-Gg: AYBFou0f5OOft087413U7U+43TkAOKunesAgmb9jg7TNfFwiQVocO5kjh0MRDEvAXK/
	eliOwIH6KVY9pf5Enzjmxeo3uY64LyHisSnd3kVbEVnMlG8pTY2rGH4N0yQcLkhTurj36HR/P7s
	eJpv/3Msw96KIPPWoMqGIIXYC9JJlhqKIbR+dmCvRhu+VzhZnZc/B4ET4GjLjuS6BnaRM9y6VaT
	ikpIJZi/VhP06hZik/9wSiCq6m5XBYmu6oSR6Jm8hFy3Z9JV4mXxkkDuJHfyJ1BFA2jy06Axw4C
	DmctDP3hzXkRhbeZEy+fwvLpQDOBuvczqoeJxi3qOttDDbmUuL2qLOL1fXzJTE14WfTnsOX5A/v
	zRYjce9DsoMnehJDdx6nWEMXpg0V+xeFb7zcV
X-Received: by 2002:a05:6a00:9517:b0:873:5267:dfd0 with SMTP id d2e1a72fcca58-891aeae219fmr3870045b3a.5.1791457640905;
        Thu, 08 Oct 2026 04:07:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:9517:b0:873:5267:dfd0 with SMTP id d2e1a72fcca58-891aeae219fmr3870018b3a.5.1791457640446;
        Thu, 08 Oct 2026 04:07:20 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-892b560a21fsm1408917b3a.0.2026.10.08.04.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 04:07:20 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 16:36:43 +0530
Subject: [PATCH v2 3/5] ASoC: codec: pcm1681: Add TDM support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261008-nord-asoc-driver-support-v2-v2-3-0b6f7e94060d@oss.qualcomm.com>
References: <20261008-nord-asoc-driver-support-v2-v2-0-0b6f7e94060d@oss.qualcomm.com>
In-Reply-To: <20261008-nord-asoc-driver-support-v2-v2-0-0b6f7e94060d@oss.qualcomm.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791457615; l=2096;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=ZwUqGQcfk6A8AMkbVhhLt/3nAUTH/gARFozvZNrREck=;
 b=pVluH5t7fOJysKzFV/BfZMMiCjgvQoXJfeudEri1OwaUMjhw9SnEmGHhDX5VSLOIl5v+wKNSp
 3Yd5szAGEP+BnXGZRoHoB8i/aG0xohGHLMojaXw6fWS64AphQNh7Glt
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-ORIG-GUID: mabD44AA80ghkJHlkiTe5LJk4mMB45dP
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac77969 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=4Rug7fo5hNcZ0wX2R6IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NCBTYWx0ZWRfX6oxazU87UA5f
 t2M/oanPR1LoOUX+3TLTMmaAskuXB/QoWqY5rrL657+4UQPUTQ61aenJP7/u4FJt7LkY3d3i6se
 oxNoLb2vRUI8QHsidqj72kmUKlhtka0=
X-Proofpoint-GUID: mabD44AA80ghkJHlkiTe5LJk4mMB45dP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NCBTYWx0ZWRfXzdqDSVaP7xb6
 SfP1o1BVnJCY0PlJ6jsVdLYeOBr3WePbPVsJG/i5EWGD6rPrv7DQ2De2X6QhIyiTjh3y/NzQS6S
 sWn6s4mCd9wN7GzC+zFtTwsl6vRvrxTBlKBs+psww87n8Bff0e1scI1iWyAErgrSe9be3cu+6id
 Y2YN0BBqPEREAKJ5TAsptAW4LC+SXwAxVjj39QbnoqAGM6PLZlc8D1wV+/e2dDVN571E55qbAtP
 nGy4fuUmEtmUR/8eY0mWG7JTc6Co856KL67CBZLs0hLtBhs+mclCKMNAH1FRLFBHbUlWWr5vVaM
 tm+rDSZ+t2gwyPj+qNCZtNQ3Ddr7cs0clW4EpfiOHp1iUa90DHxX5Pn8oAwaliV8QiDcMLDpikH
 8wKNd+5AfgEAIOLRgbdfFtt0E5vQr/VTkVzu90bjrrM1YjIAPeZ3Vi11PxmZ8f2f70XPxC7P48G
 7wFxJJRO7Lg275dDutA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080044

The PCM1681 selects the audio interface format using FMT[3:0] in the
format register. The driver currently supports only I2S, left-justified,
and right-justified formats, preventing a machine driver from selecting
TDM mode.
 
Add support for SND_SOC_DAIFMT_DSP_A and program the PCM1681 I2S TDM
format when it is selected. Also advertise DSP_A in the selectable DAI
formats.
 
While adding TDM support, correct the reset default for the format
register from 0x06 to 0x05. The current default does not match the
hardware reset value. Although this has no effect while regmap caching
is disabled, it could cause the TDM format write to be skipped if
regmap caching is enabled in the future.
 
The existing I2S, left-justified, and right-justified formats remain
unchanged.

Assisted-by: LLM
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/pcm1681.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/pcm1681.c b/sound/soc/codecs/pcm1681.c
index a1ccf1edf..3675b2236 100644
--- a/sound/soc/codecs/pcm1681.c
+++ b/sound/soc/codecs/pcm1681.c
@@ -53,7 +53,7 @@ static const struct reg_default pcm1681_reg_defaults[] = {
 	{ 0x06,	0xff },
 	{ 0x07,	0x00 },
 	{ 0x08,	0x00 },
-	{ 0x09,	0x06 },
+	{ 0x09,	0x05 },
 	{ 0x0A,	0x00 },
 	{ 0x0B,	0xff },
 	{ 0x0C,	0x0f },
@@ -217,6 +217,9 @@ static int pcm1681_hw_params(struct snd_pcm_substream *substream,
 	case SND_SOC_DAIFMT_LEFT_J:
 		val = 0x05;
 		break;
+	case SND_SOC_DAIFMT_DSP_A:
+		val = 0x06;
+		break;
 	default:
 		dev_err(component->dev, "Invalid DAI format\n");
 		return -EINVAL;
@@ -232,7 +235,8 @@ static int pcm1681_hw_params(struct snd_pcm_substream *substream,
 static const u64 pcm1681_selectable_formats =
 	SND_SOC_POSSIBLE_DAIFMT_I2S	|
 	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
-	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J |
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
 
 static const struct snd_soc_dai_ops pcm1681_dai_ops = {
 	.set_fmt	= pcm1681_set_dai_fmt,

-- 
2.34.1

