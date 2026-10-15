Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A643352ED2F
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792073631; cv=none; b=Ny9TeD4q69fYNZ5q2Tf0TIH4lzcdcYhTO1b74GCXhj1qqDJnwgsrKS/M4SudCexlGSnFysGQ5gMx2S7mqJUloILghYS+HmTA0tBNLeeUivQXhZqoKntDtgkL7Is0C2ot9nR9PilGSINzXjGsJz+WrN1lrGNI5bjhQh2ol/a3ngI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792073631; c=relaxed/simple;
	bh=slcEAdPSYH5NEOq71VTER+2lMxCdLDrKoRGVSQOSvsk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QP1mC1fV7CUHlyAJ52wg2ENVNah8SKkI7FnHv4dAz4farHMgUGuHu0WInu2PUOizNaUP2FIKHc58Jy+ss1x6x7LvMLB/GNo1GxphmbwW+QLG0BT7A2WaRsdllqggIsIzZtpzOMiEe7sntQWTCzqiS6A4eLTptSoAReBvN2luliM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O3/MacF6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h7illE9y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O3/MacF6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h7illE9y"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jTYU2809317
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YdRc6SMv2KUp5wyy0ZVr1R
	mtVcQydEq5NVgRZUUgts8=; b=O3/MacF6AKl+lBRSHEMt7BaGOn4OZqtiAfki5P
	x4FuRpluYtNipb2zRMyGMm5PEQ5JVfqUMl8lvQZPswjbZk1XX9zfxUDp5vL7+N0/
	YE4TkoC7D9xq/Y6NRLwEmycoNMKhUPlbl19Ve61cfwwlYMx6zWVk4hARU8gu80cv
	t1+Kbf4z0c6E4b7lIKcKBF13S/iCEPZEH9O5WQuGx8jS5nnYS3nl+7jTZWFOPhFR
	z2HTRK4peBc4hfsfh/sgSp/lvgSa7oy6P6ColO3ZiGnAD7pq/23mZaUvJJEmMXgY
	9XLMKpff1ghjpISk2uyUW97qnW93bu6L1V70ycoavWxcUkqQ==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54tyvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:13:49 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-45e83fd0663so1732834fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792073629; x=1792678429; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YdRc6SMv2KUp5wyy0ZVr1RmtVcQydEq5NVgRZUUgts8=;
        b=h7illE9yjmbNj2FdaJNff8bZNk5Ur1f/4kpr/OpXy5G/Bm75IJ0Oj3t1vNwALlzOdP
         /Pp3w4VNwVK3VsKS2YzT//ZPM+6n/kTomORGxtElkpdam1KAjobmYbO6XnR8mF8Bj5Md
         H02322xdYqzvqQTxv3Xzg0LcVNi1AeK3JuFOE4Pkp5i/9Ly9eiMQVAk5M2505vhiFmyv
         dvgNszoXMdXuIpAvQRILa84J/3bTzbR/BzJ8ws2ySbNnU83VR7F8Kg1f+L0pZMWtbpzy
         RpR/MRtKPw/+nbNUeayO835wRU+z5bxC6KD7ZFHV6nHvE65rgv9ARcqLi4zav24ZZeDO
         NLLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792073629; x=1792678429;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YdRc6SMv2KUp5wyy0ZVr1RmtVcQydEq5NVgRZUUgts8=;
        b=e+UxL5J+1AC5117+k4ciAyYJwUNJ6CzxZCt6SCRo+1+g6dtPfyGVe8kEWKoD9b0NJa
         d6FKuLCSzanY/3EY2Z0huur6/67cuckT93JtrV3oh0v1LEf8JtvBy5vlIsZcqqWZRTIY
         uEIVslxTGMoox/VkLFl1Vd6JXfKOpireE0H5mEaBTZ/Km1/LpwVDyK4ooURRo5wa12cn
         zWZSzJ9aWzBGRqIcDuKw4Vb8HB/gpybUQ83HHB5Qwx6IEhQyfUOES5dvUEok9I0HBR5J
         TM+wwTX9ibizSQQgl6blZJMGVuPQCYYcaoinQvlizgF8fMDaEdAWyMzdIENfdDmBCF5F
         SMEA==
X-Forwarded-Encrypted: i=1; AKwUvBwqeohcHvPnSbjSU07NKqL8rutAfoEw1+YCZWJ81o6NW+eaDL0BfBYm9k/9n0I3nkdRUnUEOP5f9o779AE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK97NhG2ZcLqbZ8wFT8Ygb51GK6tnvAGkl/3iI8Ljur3HVOmC/E
	S3GxUWCi6zKAXcjt+ninPKwiH6cvvIlfgLnDI+C3Ec7nUCj1ammJnCrlqyh7igaBfy8JILlCt/e
	0D7ZGSs2hSw/kBxXzkNHbQE8mGLhmXAQj1FSZSZa6MJ4LdXq6ojAkOD5AtfdAMP2Yh2Y=
X-Gm-Gg: AYBFou250JRlRu7C+cv9VkQ85htn7anQDxiozGu4KEnHaGYnAIwEmfb0921qmXbKx+m
	Milx8psxwVubm0VUwpxZjvRaOyWnMXOAUIOSKJ7oTEHAWhT1PhoYlbH6ZKkITI4GGcNTcmEiT/u
	6KNOIEFoBytVLxrTi6Amc8hokN0GVR6Z5Bhsw4cSrsRFQS//UulnplqzvyKifP+7rE90EoxLgJt
	PLElG+4QkXPd0DH5NQLkmzNK4qgCse39FTjI+3XSs0gkvxQZLcLvoeFMMRBkDNMM/2PvjWh4P/h
	lxYq76iQY19jbzuF1RWkqhJXXlboo507sOsqwUbfGDmDlp8CSInSo/G85yh9a8yG/oobgPZxUKi
	ZXEVfmWppVurgcbfWWlKSrM5K1HqnNBWJLW4=
X-Received: by 2002:a05:6820:2d07:b0:6dd:cd13:43bd with SMTP id 006d021491bc7-6ef11932b44mr14345906eaf.63.1792073628782;
        Thu, 15 Oct 2026 07:13:48 -0700 (PDT)
X-Received: by 2002:a05:6820:2d07:b0:6dd:cd13:43bd with SMTP id 006d021491bc7-6ef11932b44mr14345873eaf.63.1792073628233;
        Thu, 15 Oct 2026 07:13:48 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6f47500ae30sm11366719eaf.1.2026.10.15.07.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:13:47 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH 0/4] ASoC: codecs: pm4125: Enable MBHC jack detection
Date: Thu, 15 Oct 2026 19:43:08 +0530
Message-Id: <20261015-pm4125_mbhc_support-v1-0-8bc1212db6f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHXf0GoC/yWMQQqDQAwAvyI5d8EEt4d+pRRpYqwpqMtGRRD/3
 m17nIGZA1yzqcOtOiDrZm7zVAAvFcjwnF4arCsMVNMVa4whjQ1SbEcepPU1pTkvoaGeWaQjjgi
 lTFl723/XO2wIj7/zld8qy3cH5/kBlWjL0nsAAAA=
X-Change-ID: 20261015-pm4125_mbhc_support-42fbbccd2b51
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792073622; l=1737;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=slcEAdPSYH5NEOq71VTER+2lMxCdLDrKoRGVSQOSvsk=;
 b=YmfyX28+y/bo1vnogzsbfIUZdSAR8lvzK/k7HpV4WFemBgNn/xFSar7G2ozqw6MajUPfJr+Xh
 C9mUA63lYHvDsEGBA6ye6CJytxBJ4/2AQQ3Bu/Wpx8hJUKoaFI9MiK8
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad0df9d cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=MiEwT-E21dmQKCuRkyIA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NiBTYWx0ZWRfXxFFQ500GkD8B
 qImM0dAuNYq2EmFylLRZ8U7bguLGtI4+OcFDyXLs7wvXzf0GdhzyGvzNFtd9EEYpExTnv5jlAby
 ZOB0fahn9ltqaWB+9FJZ0EVVgkx6ZLnPVoFToZCV/MXxbBSlnpGaEloVH+WDkv2uD9DwQoEQMaa
 4wKXTUG+GQPNOvTiKjTsyRigB13TNdqtD57ldY9hYjOyIrBphI/I3y1Ih00SFEgcztmPrJUuQkA
 WyTsyiao/hWnJaRQjw5hlG3KAQj+DiGx78X4uaaQGsRTx+PSYY9fnMsYk/pM8QIVLXH6iMW01Oz
 CtElSkp5b2OEQc23upDL5eJ+XHmtWL/X8fl/rF836LzniVmGGLDhWLdtlN1D7i1Kc9qtnCr6mR9
 HldkJ5k6tXswYusv8g7O18Cj2OQxrsYLpi6PD2Ev/oU/gEZbi+xHr16KvLtB1bXiXTSOaheake0
 F6D2qWHbJkTpcQyfqbg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NiBTYWx0ZWRfX9Xk2oxzZA/Z2
 AuabRNeGGZRjXR8jzF78TCLzmqkSTY4Ln16QHCxVMP02rRlpMf08ootjzaZae5lJPQiyIJBJ2eD
 8kJafhNkpQmpvD1ur/jsizzTNDKxf8c=
X-Proofpoint-GUID: 4FVrIVM-zVuuMBBKRZCW3B_WRW34_VIR
X-Proofpoint-ORIG-GUID: 4FVrIVM-zVuuMBBKRZCW3B_WRW34_VIR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150056

The pm4125 codec registers with the WCD MBHC framework, but it only
provides the electrical bias and button threshold callbacks and leaves the
rest of struct wcd_mbhc_cb empty. The framework can fall back to driving
some of the shared register fields itself, but it has no fallback for the
ones that control hardware it cannot describe generically, so ADC based
plug type detection runs without the MBHC RCO clock, without a micbias
ramp and without the headset ground detection comparator, and never gets a
usable ADC reading. On top of that, the one threshold path that does exist
programs the register wrongly, and a reference counting bug in the micbias
code turns a jack insertion during playback into silence.

This series fixes those issues and fills in the missing callbacks so a
3.5mm jack can be detected, together with the binding needed to describe
one.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

---
Mohammad Rafi Shaik (4):
      ASoC: dt-bindings: qcom,pm4125-codec: Add the MBHC jack properties
      ASoC: codecs: pm4125: Fix MBHC button threshold programming
      ASoC: codecs: pm4125: Keep the micbias reference count balanced
      ASoC: codecs: pm4125: Add the MBHC callbacks needed for jack detection

 .../bindings/sound/qcom,pm4125-codec.yaml          |  18 ++
 sound/soc/codecs/pm4125.c                          | 206 ++++++++++++++++++++-
 sound/soc/codecs/pm4125.h                          |  13 ++
 3 files changed, 233 insertions(+), 4 deletions(-)
---
base-commit: 686b3eff603871bd500434e00ff15394a0c782bc
change-id: 20261015-pm4125_mbhc_support-42fbbccd2b51

Best regards,
--  
Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

