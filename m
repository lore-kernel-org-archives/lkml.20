Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015118;
	b=RFt19MFAgrKFTUBQ+moJ8c1cXfE+uKKYApMby8yKgWuq9itkWkFb5ba6bVdUb1Uj4rYE
	 i74EK2JIGsIYfE8/WJt06Wukb+OCDkztc4MfKPHj4z0GoQIDA0k2975LUb6ee5Rw50VyF
	 PyUAKbuAs+pWwgQXUitma+jkbGC+D77jEogbthM7Jrpv1Xwkj8FHLUqlGRPIHxhcV5SER
	 86VHcXVr9i5Y5R/5g09Ycd7ZyUFcbnwEUOhnfUjq7VHbJV6oL9GIBGBQMTh5jwLEwQ3Aj
	 BymFQ0khYrEpAM3RdG/n2ouSWPPOXGhbH7+PDj0ZCCedbxxrGNIevHDUbOm9xldYoKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015118;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nau56Bwlcvp87BKhvIgVtDmkGKpud4DF/A6PTwprpXQ=;
	b=E1P7U2ZhDjhESEm1CDPnzGmutBXDiO2iME3jlwuj19hEGmaxTaoPCkUG7DWAfiG1JUod
	 aeLEe3mPR4dl5SsBe9JpxKYopMuvSPEgFJOAgmIdoU768mIcSqyxPb/Cgwk7+68RKnEVy
	 8wDeXDhLz12ypb+wbvQIfcAan5KrZTraUyD/3WFNtHhF6JppU/gLwBhYQczEFts/z9ksb
	 QPZsG31kceGlLieh8I19TW0vVCePMxC8qEjxvLuWyAqysNc7nUp+vUCnMeWXHwqNnhjua
	 dwl5pz0Kg2rKvylu3fcGihHod8bxSXDQR77Bv4D2br/vE+JwvrCabTT0cLliuRAfgJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UJzksRHG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W8QmASv8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50860606A332
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:45:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50860606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UJzksRHG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W8QmASv8
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtJu43085733
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:45:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nau56Bwlcvp87BKhvIgVtDmkGKpud4DF/A6PTwprpXQ=; b=UJzksRHGl6NY9G+v
	URmNM5BrAMaivYBmNHNrUGNHDJr/Zhpo/nI8pnS5X/Ba1sdTWQZftUmB31MtL/lN
	49BVZ+M5UyAYYKjf48WbO0nouWJQYVaNU5hBTYEMhnbM9z/Ed9DcjwwLSsa4hXmS
	09/NNFVhO7JPiAkZW2V08V3FBYXhKYu5TWwmtSJbJByZ+kioieJOYo+IUUxJZI0G
	e6CX9v9GBiMHP/PMr71bSrQqNNg55T1DyZwTMwHyMrUtGKFMBbc6boiXfW0hhb8O
	N1uua5V4ukWvaJI1JtAMGGCtXFEcLY9sdzPP9RGAEsQgqfbg09Q+OdRfOi+rsDOw
	4ap89g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmw3p67g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:45:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ada8bc8575so4526644a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793015117; x=1793619917; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nau56Bwlcvp87BKhvIgVtDmkGKpud4DF/A6PTwprpXQ=;
        b=W8QmASv8/nIat6830N356sKMRo/dvufMJnSffYuBFHSaprmHLDifgYb7AfHF6cmlEJ
         cJq7lhtsc7YDna16dnXBJg+J4dEHLyn4k6V53f+e6JX2RsD/Mr9oIPXplw2w/A+ITPTY
         B8xUSYMVloA8Rt8ZOXPkQxj90SkyBxwY5GwNY5/MSoXt1zH+NACtJJhKqmW7w4TP8U6f
         uw8lzMiMFrvyisDonXtHy5MwB/T9+sM5K5/uk4UOoAUgoqh2NmwV5dvVoyCI0ZH1LUJD
         5T3foB0lR6N9imqPXR9cH16MsEmGU8+dmiTmuQybsRVbOfU3AI6YyH21w1wZSgM+9p6A
         XUOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793015117; x=1793619917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nau56Bwlcvp87BKhvIgVtDmkGKpud4DF/A6PTwprpXQ=;
        b=P+lRysQWEOMBtyRSXdh7OHAMaX2wrViuCnPyaZxU0Uvz+Kwq3yBuCGKuI4cCx3urS2
         PZbIsTDB+e1hW+MQsK3EorghpzpzapsQEaQVd9IepuVwUBeQ/Cz6afwAX8PDN2tJQXaQ
         EmXJxOp2P5BtycaUa5bkI2Tmn4HQx/v1qFoZ9DkI/v/a8Q1GQEHgcdnItjWor9V1Zdcr
         gRb/RYB2URDGZAHusBpqmUasd/ewa3SY6ugC16K00h+Enp1CNueyDJ+f5fpdGLfABy5m
         AIGbSULnUZsKei8MGctZn/uK0OVNwqUCzKTzxfHhV1Li/lRe48xaM0/cMxTZmXI9q3z4
         LeWg==
X-Forwarded-Encrypted: i=1; AKwUvBwQCjyzYohIwFlfV/oF2mr8Tn7BBqizqXYytoJfI8X4wlwloldlmW0EcvR3GVj+EZUUZeVzCUpS+BK8xLI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXoJmLPXPQ9BqIqsSIBPkoknu5p35ET1WJnyqZyDA1GJrnOwCW
	SljXTtCFl/+/7KlV+dCBkGqkhzO7QFb06SwQNgHYInNxGlnpSxsp/NRJQ4BGvFACOD0RQZd4vPI
	4HwNOVRWqpQAMWUc3ejNWAUf2GFSlopnwOhroe2Vft8RYJfSzeDqwWYaRka6Lp/3dckbM1zpp88
	o=
X-Gm-Gg: AYBFou1BrSD5Cof/SMZboeT1Tr5og7zEGnrysgLrrQLs6FooyDZ8eIc6wNvSrBeJFYf
	ltJtwBQgvwNET6y6YV49Ih4B9kUZy56hjhjX98SCmSlT924hdoIthCK9MoPdypvf1r8nCaeqLH+
	6/mlyijBQsUdmwZuPqoDLMKt58wuBjW1m6grQOoUH6njy7NWKd1fDqehf/oCZ51WrsPLeo/QJw2
	Gigb6CIwqA+toweyYuws3V5aPXS4XWxDnxSBsKC1S7AmjyWfIjf7OCxB/7MKcnGKoTI6vGECb3m
	vNmPAy9AZ6T2oDm8j6DFJokhRTSGO3WkKWEmqHMpjNRwRTcq+gAqzaM+JoOz9tJaj96XDgM2IF6
	TpsbXuIsvnSuGjed3bRLtsaknfpj2V+7kki0=
X-Received: by 2002:a17:90b:52:b0:3ac:c23f:cf51 with SMTP id 98e67ed59e1d1-3adeae77a59mr5872039a91.49.1793015116656;
        Mon, 26 Oct 2026 04:45:16 -0700 (PDT)
X-Received: by 2002:a17:90b:52:b0:3ac:c23f:cf51 with SMTP id 98e67ed59e1d1-3adeae77a59mr5872010a91.49.1793015116248;
        Mon, 26 Oct 2026 04:45:16 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebbb1a13sm7909588a91.2.2026.10.26.04.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:45:15 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 17:14:35 +0530
Subject: [PATCH v4 v4 7/7] arm64: defconfig: Enable Qualcomm PM4125 and
 WSA885X drivers
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-shikra_audio_dts-v4-v4-7-cfebe0809467@oss.qualcomm.com>
References: <20261026-shikra_audio_dts-v4-v4-0-cfebe0809467@oss.qualcomm.com>
In-Reply-To: <20261026-shikra_audio_dts-v4-v4-0-cfebe0809467@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793015085; l=1168;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=nqBPRLNLSFYAEVxGi8/hLOLK/FfEgToPKt2RuBr7j1Y=;
 b=JtWPV30Kq7PmGOnW271CMvvGjpyCitOMLbtO9aPeEI8GOgYHypOnVKpsXNtDV7INB1Ne3el0w
 oQf86+0WcpMDKxWv4DvZms3H6/qgwaF0tTrbiP4zo4Cm0B92V1zt2r2
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: 7PrOKRPWwBrJ4_VEuxPreWbsZD_ZkEgU
X-Proofpoint-ORIG-GUID: 7PrOKRPWwBrJ4_VEuxPreWbsZD_ZkEgU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NiBTYWx0ZWRfXxRG7XV7dkwRO
 r+kSs6uNh2COer8+13muWif65WVsLhMmCVezLw/VZm1YX53mp71w900bgMB2pgUdGj1fIV9+TC/
 Aq3dHvLxWOC7ZOT/34UB5ctHg5WuCRk=
X-Authority-Analysis: v=2.4 cv=HqHjiETS c=1 sm=1 tr=0 ts=6adf3d4d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Y4Inp1xfyx_JXr0qu3kA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NiBTYWx0ZWRfX55qIJF/w8Q0y
 GfOsBPgS5t3sY7LHeGi7JVBGhcDFtIjyQQXjLFjoouT2sKF5aco/1PIEl2NdCq8+JNJMNBdp0rd
 wYFCZ/LtcNDxB+zBQektbKnzVcInB+WdpWEUyPYwopZshbCKfHJJd5LCStIbNg4v+rIjrJwYdJv
 5cPS+j7nitEgHbp9XpMSTCS4q9sYp60MXUZV4iSrI9vhpw+njRT9DS5rsAqMo7OpC9cupthGmQD
 VOL5Jjs+5l9JsenxvOvTYF/kF4NUYqfYX8HUMG2IhfdSFpzRWO8gV9X2/cFVjuWCb5/Chc7L0Gr
 nKPtZeh3LlRyivHXIpldkkIeRWmjJeBuoKrUSmtZmYeQKLuWN/hXWbflwJkVWx+eBN+cUxt4E3u
 o4k8MXyHl4mSVgjyAA1YFMa3M04hZuhYXceb8A4/ruJYroAqpr0I1b0jSXt/8QrBnH3gn9fycdq
 JDqInBP9bT29SMJeNHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260046

Qualcomm Shikra CQM and CQS EVK boards use the PM4125 audio codec for
headphone playback and capture, and the WSA8855 amplifier for speaker
playback. Enable both drivers as modules in arm64_defconfig so that
audio functionality is available on these boards with the default arm64
configuration.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21..bfc3ec713ecd 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1175,6 +1175,7 @@ CONFIG_SND_SOC_GTM601=m
 CONFIG_SND_SOC_MAX98090=m
 CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
 CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
+CONFIG_SND_SOC_PM4125_SDW=m
 CONFIG_SND_SOC_RK3308=m
 CONFIG_SND_SOC_RK817=m
 CONFIG_SND_SOC_RT5640=m
@@ -1197,6 +1198,7 @@ CONFIG_SND_SOC_WM8978=m
 CONFIG_SND_SOC_WSA881X=m
 CONFIG_SND_SOC_WSA883X=m
 CONFIG_SND_SOC_WSA884X=m
+CONFIG_SND_SOC_WSA885X=m
 CONFIG_SND_SOC_NAU8822=m
 CONFIG_SND_SOC_LPASS_WSA_MACRO=m
 CONFIG_SND_SOC_LPASS_VA_MACRO=m

-- 
2.34.1

