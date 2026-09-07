Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C61453A4B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788775706; cv=none; b=h1hB43Z3ccaxyiJidqPcY8l12PFfiaHWTwIThD1bXWwTT4+1WrZYIEj3yyTXsS4Q1ssinBFXgd6aaYMBZwHXBnOpcKTQnUE+Wn9NjWRplWo+UVvJW7475si4G/Dp43FQGYalHAY5VupeM2RWkSfIpbRjz3s1cOw6fU9D561Ns70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788775706; c=relaxed/simple;
	bh=gIpSneSaqWvfdVAtDTtKctxeaHXl3KYuy7TPtmNyI5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IP8Qh7RlWzhqzguQ8qnIRhEmKQzTMwk5LjImXpAro6nstsOsUZ5q9mG10KOMGX+yBabgVLLZvFYi1ggoWTgC/VYDPfkP3pR4T/+MvctJvqBS8LarnIiMJqMiVI/UE64DpaDCj6EJ4BBUECaIQphXqyb8PwOFEOdQCn4Olp726IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gfj1aLBY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jp7HrTRT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gfj1aLBY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jp7HrTRT"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bURi3713184
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 10:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nBEkaDsIfBrFkWSuIwGLw/UVkzMUI4RXlx+msSm6rck=; b=gfj1aLBYZV1l6VTO
	cOqpYaOh9ldZlSkzSyFkXaO8CjjmipcP8j3aHVl3/hzJwRcjGSpt5qm2YMKrXvsS
	2maPqbAiYNfCX1IAoDvVSHs5ySSBPduLvXGEs0ExPw7XlIV3pTF3ARSdCBHUHA5d
	36sjj/I5b6NwkzI7LBIvmJgEUzUTTEKPRhfunJjTEgzd/NgDC794roD9Y90z6gky
	s6MGUJEeM9cA3DCp1wfj7+NWa/qAJUbRNvKfEOe8GEOyfF2sC2sNWo6Wx4AYyIQ4
	EzpNxQtEJXkGecCnlWooOniMFjwZVoDF2XQvNZtBF9SvU4iAnJzGEuQXBleE74lN
	ZyKKtw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj1g9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 10:08:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso5592885a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788775703; x=1789380503; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nBEkaDsIfBrFkWSuIwGLw/UVkzMUI4RXlx+msSm6rck=;
        b=Jp7HrTRTpKFPOBWX9QJFAF9OYUjqQtCdOw7L8UXfBbPInTjECvE/nezidHj4wyK5S5
         2oJu+UWDXo14i9Z3dPnycHImWg3nphKbF2ezJ+D4bHDDiJmaqEwgqdsfriGo+HHFSGAt
         kAAerZ5+UCWwS0+Hb8FHqIprQTtiJp9+0he3EG/DNcs2cs/h3KKlWTMJLMzyPiyxvayb
         CfJ/6USyWa0a2pILM+cwYPfWLeDMLiYp9UMd3qk39Ij1T+xlucHgtZvT4uT+tU73NYXt
         hLXdSAjPpwQVtvJX9OOAgsuN8/hKV1fRcGT8h+3GkGwfLg3f47m7zl/4BAmwJZuDTDhK
         TvyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788775703; x=1789380503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nBEkaDsIfBrFkWSuIwGLw/UVkzMUI4RXlx+msSm6rck=;
        b=jM/NLT0AvHNwbCmXa+QT/Xt2fcN6JgMOV90kUMYIvNTSNlcZizejbSBFjHcPPjZisC
         yVBnJL4CNg8LY249QQVFv+zyhK8cIcPOjTSU99oDJoHSJGcRKJcuLEOIAEzztBsiFGgS
         B/h6VGZYpnTs0Ughy2Ine/e0DCAHKkUDegKjQvrE69+Yge2NdsvMSCUP1kqpYkyLj9tK
         VqAK/vm5A72qT+ufatMlIWB3fOu6Y+6Wf/PL4flKMrK/LEy2OqjPzy3W9NlAa3fTsiEy
         tvxXk7fTk5fWqg258xzAFfAU58qd3L9Fc1TqRgnasvxAy3TQl/viLOi37N1lpkWX/odS
         emUw==
X-Forwarded-Encrypted: i=1; AKwUvBwf2INU/RZrJmVpsn4OswBN8J2JvsGOpyOEgjRySzeBXBnEwjfQs0G8jT7qD1qAIuXzwQKm5OsZ2bG4Cuw=@vger.kernel.org
X-Gm-Message-State: AFuF++k2eFnbOs3YatihpIZYrW2BiX5z1Lppf3RDKnNS6JytLRdBgQ/z
	C5/hkkIu1Qy2ZDvMOFqGshLuSSqV479edPFsk2YruFChQwCfMwVIiNKhUK/0JWb3RpcIvRRLvyM
	N0ct3koECIq/zxTH9pcShnRok3x3f24fankslj/xW5CdhlLulGhYAK2ghn51dVkPD71Y=
X-Gm-Gg: AYBFou1GZsvG2fV4Gs6joa9dK6orbr0ToZMzpi3R1P7tNjgm8xoVIvogQYBGGHtyIB1
	EazdgFO3CIt2JeiIrhqEgtn75aOQCCX5CCD4M4hFEpAm2gpJli4D34MOeDBEVYlonJCKJHbAPs0
	IXid/H7F8fcqmZbXBtEsOdZzyohWQ9jatYIoo3T+Ci7ffJnVYQEPutNaC9B15tVe2fRG/E3NfPb
	dWSAzAsXsAJTs3hcPvf1rMSEvvepcT7xFSIuqou7BdRrWFs7EOG6toqT8K2zGRgbe17fV8ODOeQ
	baTHAzl7afenFCp54e4rvds4Ut0avhOAAjSNMTRbthKFzZ5g9ld9NSgORiwv2FLp5QbRz8I9Z+2
	1lvkyJNl2pO1vXqTNUOnljX0OatxxvwY=
X-Received: by 2002:a17:90b:2ccd:b0:398:9c00:29f0 with SMTP id 98e67ed59e1d1-39b2628fc25mr35715168a91.24.1788775703091;
        Mon, 07 Sep 2026 03:08:23 -0700 (PDT)
X-Received: by 2002:a17:90b:2ccd:b0:398:9c00:29f0 with SMTP id 98e67ed59e1d1-39b2628fc25mr35715103a91.24.1788775702667;
        Mon, 07 Sep 2026 03:08:22 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa37dbdsm22891332eec.11.2026.09.07.03.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:08:22 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 15:37:49 +0530
Subject: [PATCH 6/6] arm64: defconfig: Enable OV08X40 camera sensor driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-glymur_camss_dts-v1-6-6c2ced5ea5f9@oss.qualcomm.com>
References: <20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com>
In-Reply-To: <20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788775671; l=680;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=gIpSneSaqWvfdVAtDTtKctxeaHXl3KYuy7TPtmNyI5Q=;
 b=2ec/UXHnnDDHBsM2OPfWog78Omca4aHesaynUpX9rCXbiGLtUvYwQ3W3H8CjWfg+3wbatlaoA
 h8j6Lqz+BqgDgJDEC4OQciDX23PWor4ZmYIy18FtM3s/4a1mk6kUkXv
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExMCBTYWx0ZWRfX7aVOa2pU6huD
 OZFNWLBISUHQd+R51B+L0yst2gONvHbMO9Dzc/PN+Y5o51DChX9K/RoULoms4xbQIPaNavbZX2c
 c48Cd487DLK+kElvs0S1uvrdHOGvMQNGdGRLtFF29UxMoOrbMi4aaeskHRC4x/UGMIUhSKlWxCS
 krrho3aze/NbjuqJxxdCxvo0movZccvqrkn4xwtfyTJxzzoiJ2t2htUrvHlRcdKd3H78TOsDJZv
 17Xok5c9Zhg299vnV5gI+b6NbmXHdsujoCiXO8ATIRxaEmUbyUC9D/oPlQVpVSZ/zMnIYgzszb+
 0APeh8p9c1J3Jx4tF710fmloYKb6LN572Nc2z6UId5dMECWjqdOjMGciXsCWBvuU1bLuXQnVQTZ
 eZFowuAo2gWaWCG4UVBO0hm92xY/Pw9Qaak4tn+pg6T/j+UEjCCEEWbbky9kpxXmavEEQVqETAS
 EUs7J7bOC6cLCqSgi3g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExMCBTYWx0ZWRfX8MoAaa2RmRfH
 9gj/SAXYBL/B4LC+wM5XIE7zPh9LFDBHngHwdCEcfxnq65rifKkKGtsB/OW/CRw1lt6LfHmj/gA
 3isA7C/euGwifoE0CUXJlWsyL/gOW3w=
X-Proofpoint-ORIG-GUID: oYuiMXRT1Y-YudkQuQQqYYvM2vfOUCNj
X-Proofpoint-GUID: oYuiMXRT1Y-YudkQuQQqYYvM2vfOUCNj
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9e8d17 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=WSFeanDOTqpEkpu4Xu4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070110

OV08X40 is used as the RGB camera sensor on Glymur CRD.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 87a6c50bdd14b6851cae81daa32cb3b4e35f66ae..ac2697ffb94ac8b75415c6477fd06eedf5d1dbef 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -955,6 +955,7 @@ CONFIG_VIDEO_TI_J721E_CSI2RX=m
 CONFIG_VIDEO_HANTRO=m
 CONFIG_VIDEO_IMX219=m
 CONFIG_VIDEO_IMX412=m
+CONFIG_VIDEO_OV08X40=m
 CONFIG_VIDEO_OV5640=m
 CONFIG_VIDEO_OV5645=m
 CONFIG_VIDEO_S5KJN1=m

-- 
2.34.1

