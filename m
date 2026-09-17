Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AE030C146
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789611383; cv=none; b=jyNbbMnY7qEkuHYsCztQOcy6j9iNBy0NUOFrZD6ZUM63/vmGjLaqAQobgx8NjYpLwEAj25BlFKHXcSwZyYhm9Rohi2dIMAxcHkZMIUP9JZbkFxYvsKDrYSs6B8L4fEnfGjwG6newgKN1zkKjsw1YExr9S/4cni6Bh4lq/lw9WkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789611383; c=relaxed/simple;
	bh=U62GKxnrzWV7bOfVeV753BgVKnBMlyNWvV1dOj6/KA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wqs1VV0Wp5sQNAexh/3dKEG4tdVTAm6nrh+gKUQtZAEX4EaZYthmOWUSL/xLHepTCVyOX6r2sdeYW9tRZqVFZDGYECb1dEzI4b/Sj0U4ICAQ/zUBmps7Q/P9ibO57U84gjvq6Rt0MZ3MisNfau1pI1Xz1hMAoB5fYqtzpRyrmfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YqAzLPCX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MyPGvs8S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YqAzLPCX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MyPGvs8S"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GMw4d62430454
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:16:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bIPAxboYnQUNn51b+q3bCVmCkPsPmFqRwgagiB0Ekk8=; b=YqAzLPCX11fXqch8
	cveQVI86vwEdjv12KRyDso5Q/hgkKSiG19u2NFIdnvs6BUx+LRk1ZXhku3K3sQTW
	yaGxFvy84pbGcb2VkDjZkt5fLQAABdmsD95qCBqrfJSgG8fXtC7rsDg6c0U9NRDT
	lwxJjhhjosf7deDVwFtjLlISem/KJU0ihUjtKpcoOkN2Z1eqUM1kxuYf2vHr4XLx
	LkwX6fFdcAL5t56rLc1EYpEZdVPiuokQ/d2HZEPKemwibdJQIsTXT9HRrzWFI1Ow
	oYUe5LfxdsKZ6+mbUNYXxQxf4wR0L95uWa78T3fikFcNvJmMadG6sgOCpG1hTdf3
	Jkcfqw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqthnueq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:16:20 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so1030605a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789611380; x=1790216180; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bIPAxboYnQUNn51b+q3bCVmCkPsPmFqRwgagiB0Ekk8=;
        b=MyPGvs8SNrlxYx8tMYLEKNamC1rZRi9Gr8CHNIcHxF1qJClV1an9ek8ub8FwPlMoix
         7PC2b2P6IZhPcpXdYuxXK1k/52W5+vX2LO3fWqd33WQI+JLf+xp4RGkpHlgxIMihg55S
         S4PVryXAD+UdBgx7Fnu5/y+wdeHQ3fJ3iV5PZQpTxiFkjWukMz1mknq4c2KE8wkrbegW
         s5DY26ko5zlkpm8lADgR8Afa1IcJnDhzpv5Afs2edmEaM855XVRvrDiAmCIV4bBL1V2p
         UpCS033bHXGxEhaSFKoo2MQVaBNj304AAIVcnhkMkDvAD8KEUgnyur6ErI/5Oqu4HJKr
         IlBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789611380; x=1790216180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bIPAxboYnQUNn51b+q3bCVmCkPsPmFqRwgagiB0Ekk8=;
        b=VwsdcHwtxpXWxZvTZJSqdACHA54IRc62ZN9W3VYDroAwTgPVzWjqVmMlEoZKg3G86T
         L508jg51eQg0r6cKldGG7csUkbkP+ywPWkwTy9XqOX3gN4e4pXAgZJx0bxr8C36wWH8n
         76bpa6g0tvH5l5cIl8qRFja+GRlH3XRO1L6WquJqdyt3AA7ZjqimldHXN3EP2TeebbtF
         io5KyE2hfjNJt5opvCB2BW6J5dTTogU8coui8bNmWrIFXvg1ohphjZiAo73Yto5pH7Ah
         0g7LOwWvt2ONju9a/rL65lMSRibTTtpfPUgpAnRYnIiGEbWVjrp8ag74LGJvHlmOV5mK
         nJNg==
X-Forwarded-Encrypted: i=1; AKwUvBxmz69pKDA1540ixvp/1BUeTULr1B4Ltb1Y/HjhLv4wghAL2854akSnm3eQLcO6RwDAUVGphx3f7R1dXJw=@vger.kernel.org
X-Gm-Message-State: AFuF++nWN1GaKRMNNxB4vUcRDEQTpgdL2C+9v4E7QdbAyhUOTNlVbLQI
	D4AqyD8HgbBzjORkg/3yUZ5OzvgsoTU26BVieWAt7N1jROMbZ1Lo6qNl8RHrLRAFKPFiY38h99D
	eX3NYjzZjP3YTz1Vw1KJhGlGZ0ytlXrEVXQZnb9HMbuOA/1jh97WNh/BZ2yXl65yN4hY=
X-Gm-Gg: AYBFou3QsNFEX9y9xreTLrXDuhKSf2crgTuTYvwYsLx7e4bzmilM5XZrQWN7aftTBAp
	HQiz8Ruy1WJlohGOtgr5ZuFgPn+Cbdt3Fpf8TjUu9CPwBtDBm7bkhA+l1h7WhVqpNepSnr+7hFW
	QbKnjYlzFMgHfLKZFgYj6iIEl+IB3W774G2ftVoFsC1nMTuvi6lnVtaJH967keLf98LyemACp92
	HoMJWRDNYGVbRqPGjPonOpKMPD4pusoyVgN40q8R4LFg2JcLZMilRXlaE9ewL0wYuhMTHHyif11
	YhbRZhOqcylyaF0mgfNKUrWzldG2U+Jm+EIGQs0Yw4UtiAC111a3pSI+UpHcjmJ78Lk7jwodGDw
	xCL+r4SeqXY0A+C+NxizjifWdav/WUsuRSSUL
X-Received: by 2002:a17:90b:582b:b0:39e:f1:b2de with SMTP id 98e67ed59e1d1-39e1e4c54fcmr11634264a91.20.1789611380267;
        Wed, 16 Sep 2026 19:16:20 -0700 (PDT)
X-Received: by 2002:a17:90b:582b:b0:39e:f1:b2de with SMTP id 98e67ed59e1d1-39e1e4c54fcmr11634221a91.20.1789611379870;
        Wed, 16 Sep 2026 19:16:19 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bfb19f8cesm14372881eec.2.2026.09.16.19.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 19:16:19 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 07:45:33 +0530
Subject: [PATCH v3 v3 2/5] ASoC: qcom: lpass-macro-common: Add missing v2.9
 version string
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-add_shikra_support-v3-2-fc0e79c341aa@oss.qualcomm.com>
References: <20260917-add_shikra_support-v3-0-fc0e79c341aa@oss.qualcomm.com>
In-Reply-To: <20260917-add_shikra_support-v3-0-fc0e79c341aa@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789611366; l=969;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=U62GKxnrzWV7bOfVeV753BgVKnBMlyNWvV1dOj6/KA4=;
 b=Ms3tkdjIKT3/MdE3Lw7K/oiJMZkgRTovwPKQI8ZaFuqeeEmDLSrX991WfUhD5PVLQt+WW2XL9
 tk6OCLWVUkeC4cd926ZtiQ1OUiXaWiomTWCfewUWWFFBLF2qpYbhdoN
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-ORIG-GUID: p09fiRZ5nPxZCUfL--nXJ6QnlkkMqfC8
X-Authority-Analysis: v=2.4 cv=IsKL47/g c=1 sm=1 tr=0 ts=6aab4d74 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=QNNIS7QUJBVbuyI2g7kA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDAyOSBTYWx0ZWRfXxxRqe3oFLU9z
 SWg/SgichD6whZ/ecBPDooyJ1NAXssy+eOa0FG2eUuEFYJZ0X8h9skty5/ep90b0yBb2owoqBGW
 HlKAhZ7cR+Boxq6FXTbXUExzYWo3AuAVk1+i9J+BC0fs4HBFpt8bGxsijnzbA2ojRCj16AtXLPJ
 fflckUrAu1DOX7uljVOPVfadDYFwNSNgZZd1iUTeW2c/hApiaDb34uYH9UpdGG0uhSAeNzHSskA
 WwbTf8sGSPc5IjXq/Rsu4TWMxVToZI+w0G//Q5WY2WYxeKY0ZO/ZaVDPC174UBvB0t8I/eeLgTX
 zcAYDJKladH53pkHbwuA/ynzxZeI/S2nPS9uazQVtzqFJGA/VWyIoAwz0we9fDTwm8F1ZaAPxc7
 P6ecd88ns7TQJWJxD+cyer3wVpR+7fR+s2pBVuP/4lG3olTc8DgAQ3zGdLTTOOojbzB+UFeXtvF
 fSta86ZgZLLMJZVLR9g==
X-Proofpoint-GUID: p09fiRZ5nPxZCUfL--nXJ6QnlkkMqfC8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDAyOSBTYWx0ZWRfX8IHjpzy3BiLf
 fnDZGxa9pAFe5oHEzMjk2kWt3vHsrTvpvZtj9d4+JC7NfofIpVeWhlpYZ5fMJmzh77/8OboJzxj
 s24Xg3OfplomwrmR19CovqOlbBIXsZ4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170029

LPASS_CODEC_VERSION_2_9 is detected by lpass-va-macro.c and consumed by
lpass-wsa-macro.c, but lpass_macro_get_codec_version_string() never
learned about it, so the probe log reports "LPASS Codec Version NA" on
those parts.

Add the missing case.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-macro-common.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index 10ad68201..573b2145e 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -68,6 +68,8 @@ static inline const char *lpass_macro_get_codec_version_string(int version)
 		return "v2.7";
 	case LPASS_CODEC_VERSION_2_8:
 		return "v2.8";
+	case LPASS_CODEC_VERSION_2_9:
+		return "v2.9";
 	default:
 		break;
 	}

-- 
2.34.1

