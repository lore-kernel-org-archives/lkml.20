Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F76B70808
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787922962; cv=none; b=BuiLLNpWQVNdNRPEhpTaLInr6cWIxSzkliedI081AkPKZ7Um2YHWx88BTaUah2ysmZPKDjXtALG2wBzkCI8E8hSmP3u4yv0jYRo8mJqJnh8qdtCeHisziX8PXBw/k2+sCiYpmoKQVoEM/F819wyQjAhuXk7iO3WZS9HSFeTwVjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787922962; c=relaxed/simple;
	bh=2Zx9yqyTqxl13VnoZtyz8hCPm3+mqxaI2mjb2ljqRp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HQIgkBsFypv5O3ZaLC2jRXcUw9Cqzu7DcQPLC57Dqnd1Sk6+098NCCwFzXFphwaAUVd66tOAkv0CtxOYqbSysv7GGGyJEW+LyrZkPUcGZPdIVevRRAUn8W032rMsLSC8UyEDH3xZJskxGcACQrskYALAINBGu9YVOzy7JCOB1SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IoY+uzA7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AiRewxHD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IoY+uzA7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AiRewxHD"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7cg62744793
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RsZ2FbUqCmSgAmO6CyhSP/0Bna8nQCgtpggl6YJAR/k=; b=IoY+uzA7jwVCyC4X
	S/z2Ewqylvtn/n+wr25cFL5D7Kk1Cm6x2BsMWAGjMaVwhJtKR/Ukvc2nX38Eixfj
	1ufWUrdYysx9ghoC9JGaHhtx9nR57fj6i3az8V6RA7RDVIrpiaI492GMDxrFb2mp
	C9+c/QVH5P5N5EWckjR5hRTyOewIvWl207pPyIYGM7drsG+mg3yTnlP4M0LctF90
	4mEt2LJZxillyMpWM/5FOs7Rj8GrrOAsRi014WCMt6zgS5jcSQf3N8aMVVb+wyxD
	pFtQLMy7Bjij73eo23/bUUMtZaO+3ifcwSTC1Yp1WWEji2zqJBosRmm6DIEbydzT
	wGsU9g==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb3mxswrv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:15:59 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97cc5388db1so12006241.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787922959; x=1788527759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RsZ2FbUqCmSgAmO6CyhSP/0Bna8nQCgtpggl6YJAR/k=;
        b=AiRewxHDNjAvE9bdYQ9sjFo5exuz0w8IFtBBJOk9ZnFAPpkvh4k3jwi70dZKZuL406
         PzymRvcs/wfG+wk6GY4IGTf9dLFt7dBm63lEQ1e/AGklbxWX07BVuBH0T2/WB+1Vqicq
         l4I/8la+xkAk6AvhEliPobKfq2+cZZ3qIhYIhAFXyuXLhsKiz166oblJzVnc1jdJ4yut
         jBgx6xzkKn+gqbSV1lKi2J4+cmrcUQtC0lpl+r51810AsptqC4O/cJUld5ChaXkZIuyI
         5BJcxHTI+hQOGjS7/w9oisj+fW/XQdglx6jXgcOT60Am+wGW0UdM5SYO8Aix4XSPGR3o
         PoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787922959; x=1788527759;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RsZ2FbUqCmSgAmO6CyhSP/0Bna8nQCgtpggl6YJAR/k=;
        b=n++Fy6S7ut1ZoCEkH1aF4pRLCqzyjNxGQyZLI4ISUNu5f7EyDVsOnGhvWCOHUlds00
         QEcIsk61JzDco/umY5/vQ18Y3qEAMl6a1TXRHQ9ecC/T3HYnrUfiyK+xHlVC1/4PrAf+
         VVAYRWAsyZKoTSedCM4rYzBj51C+VsTwgk1iuSlTRUTriTFQ4kkEjP7b+gTTvJuv09mG
         kDoN7Xsegoa+4MP4JrBFkID0D8K1NVXg7ce3Mwl/DQqX8a4o0iAhxOY0FBw5AY9x08KO
         /f6eQ4TN0h5xWJBOCBMx8c9c+UaozoMB5XdpeFzLaru3rjvAbxfJbVqDhWYb6BrvZf0A
         cPYQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp69Baqbzikjvf1/UFWLitgy9AeplU8tRJ4dWXyKMIJrKmAAs7hKvKC9VQ15DyAvwjFIM9GsPIeq81X7uQ=@vger.kernel.org
X-Gm-Message-State: AFuF++khyPEhFrbfg8mQ1YzfrkAwV4oi8Pd9CWPPqzSUyFCx4fbtro57
	lSRDXhn2V4Ypg0DNn5AsmpQYvBee5CZgPRUo2fAmLzl9y5yAtcu5WaByytXcfa5QBHGrzNC5iL0
	0hdiBCkADwAA/5QlVVt7lPvZ4BaUQfEzLQ5+TNG/GXPYNKEI6aHl8ggufZ90HH6wi5DI=
X-Gm-Gg: AR+sD12kEp/KWrPjvofMNmU1avvCgr8tanMj9JkgipacCeSmdoW4BFmmpMKF+MQzMUf
	gWVGHammRqHfCq+m3ahzyDKt0NSV4W/DuatRmJxSAn8Bqg5R1OofyneXWOeh4VbScHtr+Lew5NL
	ROatqgNC4mg4X13OqOFdiOjJXnPtZY2EznzDCU3DGszDOGCBV3saj9mY8S4+G5Ml4EaJpJerW6G
	kCXNCeIKi40b4nA73aQ93PCFCm9FKPCx6mDTbeGuWCdeZmkyE3f5ZQJySY9LKdMCbEjEz+cqBiu
	gPS7nxGTmkwtNfFb1g+h1K7TViCPDFRRd23yeGjBgL/M3NreXFHiLaK5zpSXGJusffSrj/EtvdM
	gI4OoC7uMMaaEBWLd8HQrxIo=
X-Received: by 2002:a05:6122:6b0f:b0:5bd:9cbc:93c6 with SMTP id 71dfb90a1353d-5c68096658emr1088497e0c.0.1787922958948;
        Fri, 28 Aug 2026 06:15:58 -0700 (PDT)
X-Received: by 2002:a05:6122:6b0f:b0:5bd:9cbc:93c6 with SMTP id 71dfb90a1353d-5c68096658emr1088480e0c.0.1787922958564;
        Fri, 28 Aug 2026 06:15:58 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee09c5dsm79123566b.8.2026.08.28.06.15.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 06:15:57 -0700 (PDT)
Message-ID: <8538dbfb-ad89-419d-90b4-4e92c2cde3d9@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:15:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc8280xp-x13s: Add DP0/DP1 audio
 playback support
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260827-x13s-dpaudio-v1-0-da73414c6ab5@oldschoolsolutions.biz>
 <20260827-x13s-dpaudio-v1-2-da73414c6ab5@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-x13s-dpaudio-v1-2-da73414c6ab5@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDExNCBTYWx0ZWRfX3CpL+8g+kl1u
 4/oRLVaPxkmR1QhI7B0BC2zUz7mM1tZxFrbiEhe17j9MsUDQI7suJPHADgIITGPuG8S8iumsrZd
 pQ+zabjb+jziruhFYJuHJ6MMyPt6WJvzfF5dVBoB1g2J1u2zwkCWzTytgvR1BRurLZYZysu/bkj
 8PrBlb9xwedYCh3G4FuwNnDz1Vlj3wFaulxOXoOW4XdQCWerG6+adtFReKA05hyzgMt4jJM/bLk
 2SqnyN6NmNtW/f+iGK44vU7ho3qe4B1jaP50THSL9/hqNEjNyAPSQpFDQYkXWZH8cC3RzcEZA1E
 9CHqj5t0yDYLSraiby2dvMPs/+aQ+xMW3sr4aA4F8diSBPjNzlOLRRo8kw3AkzPku6+oOLGAKjQ
 xAjwOFzBOkXXFUoL1OSTW413MroENWclKJk8U2xoe9mW2ZE2OG4Xd7BzrT0J87eVmmCUYaL1QUw
 EzrBTQf9R3TpaCHq3vA==
X-Authority-Analysis: v=2.4 cv=MONQXsZl c=1 sm=1 tr=0 ts=6a918a0f cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=EAEWhcUvtLHaY9PztCYA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=1WsBpfsz9X-RYQiigVTh:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDExNCBTYWx0ZWRfX980SfZNeYM48
 hKlR3BqRLz6/DRJAD4R4zuwKRAHDwGnl5AnORUS2kKVmDVPP9EKdPZUX0cYMouk13hrK2J1h3mS
 o6bOwcNiralDcHrSm6R4XVsu5WtkmBA=
X-Proofpoint-ORIG-GUID: Nv63DiM0gGVXeg9YQufN3KRMIRx8oHzP
X-Proofpoint-GUID: Nv63DiM0gGVXeg9YQufN3KRMIRx8oHzP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280114

On 8/27/26 9:52 AM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The X13s sound card has no DAI links for the Type-C DisplayPort
> controllers, so those playback paths never show up. Add DP0 and DP1
> links using the existing mdss0_dp DAIs and DISPLAY_PORT_RX_{0,1}.
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
