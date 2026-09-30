Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F2C484889
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764445; cv=none; b=SLkC9NwuRkPJl3DV6RcAZnyfxtRN/7RqquiT2e2QoOEBa0yNeBq0MTS4lbH1cJIGFjPVtBztmzi/A1ydIX5J1wmGBItiS+oc3sF/Obuw5T3rN67qMcA8A0363sNBMQRKoQ13rjYxLOTYdBBOkRhZA4fMZBFBc6u9kb1Cn11cb9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764445; c=relaxed/simple;
	bh=B5M7ExAdSYXfY9Ds6hbircikXslMTP7HxDS17duaV3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F1tcz3vs6tp00nJXG5cF8dBp49RZbJU+9342nQRl7lt0cFQjhGUwA9w48tB+hpeVorFs9GLTqgt1sBE4deW/zkL6ZETSjuwkPDIsexQHuUKomE+MXGexq4/+kElp/bI0mknuc0Uj4GEFCUNjNWDLdHOjYWGvP3lCeYsHAV5ib30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcuLfzas; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DDJvBFU7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcuLfzas";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DDJvBFU7"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U97kRk4151586
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mna7ZMPQZMnphcYmegEctv72t1rRymVguBHz0zldzK8=; b=mcuLfzasxShQJgwb
	mMbKqSxFaxJ79aQakGIq9OtLRDQi6rPc6aLJ2alM2KjKJayGEjR3hcE7TadMmAUp
	ZBsE7OQ13BrqwC7nCT4cN7SaPS1szAs/jTaq99+p8EKaM8Dv/O+7uAa/CKJl8SuR
	D7bVPAp+cD/oUvG+e1/hDfOB2oBCJuJeB6UuhPZHdcq/vS7qK8kPTOOtnKn9+yA/
	y0sTaugqJX2ccet6gdX4OhEGQUKzCtYmDA2Ul75joLl10Y3zBoa15Q2yxLVLwOAm
	qqqePi2Edm1AyDfvrsBpDWsoX8HNbTzO8fVQXLxc7Y1vh+0e4AIyJ07YNzUWBxiO
	n3sSVg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0yh80bev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:34:02 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-915e9e1a5f1so5310516d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790764442; x=1791369242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mna7ZMPQZMnphcYmegEctv72t1rRymVguBHz0zldzK8=;
        b=DDJvBFU7IX9+poGrYkO3rPzkXlhgqdtTjVsRyLpoUMDqGSSfK0uhQ9IWCE+5NLyRK6
         QysDosrttDZxi7+X+kILwc7BHnJKpjRiA67S8F710Zwv76KrYORUNL1mPbZqzuGeBl2J
         I4cPHH6MqrW7nw04lCP8bL3d+VffhPx/envs7GajmWbD/ru1bSRBBKrjmL/+MHlI9bJX
         xoMVpcemXrRfoLdl5kdaCQWVB/NqaEQY0e8QZN/S9lryK99ZuzaiFmS6r82yj5M3fzpo
         Uh5Klwt0URkp4ueiOkp64E8/k3DGZglWHddydd76nBFYT94NThfszADCxjvDqFN5qi+b
         W4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790764442; x=1791369242;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mna7ZMPQZMnphcYmegEctv72t1rRymVguBHz0zldzK8=;
        b=pGLsZAWw7al+hf2QmPsqsnTO69PreCJwWy/Qlvab6Nk3Y+pyO1tO/S+2etGw+BoZiE
         c27Fkv1JQMhQYddBOt/MAlNWCneTfucRyszwzc2HuTpMVOCi8RnhMOAHrKFyi3nHeJET
         NoMYM0TVeh0GvWLD0tqxAxxpcDxQAnCVj2VySByvnkGZKTiL4pI2Km7cAd1yF+Lb/okd
         uLkOiwEqli3jb5SOz7Fu0KQ46o2j7TBmCKWwFW9DyIYxnUt+JW1d1U3CEOFylrIi+Nr0
         gteEWdVnnWDP4pJyWwSK/Xik4kygSa0yCoV3xVJgcDzqqowm0VHQV2TLu1K/tyCzF65J
         4NZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmhLjfE83ayYc6IBuaPpe32TE8o6T03XsfsZcGnYL1SV4fYhnks92iB1zAUVURQ7SYati6cRcZxY7WZbA=@vger.kernel.org
X-Gm-Message-State: AFuF++mMLrqMt96wQKDWAXLI0if+NTGkrQZjT5vafXjhrn18bHPNUkvM
	Xg99w5KkOzIwpEdXqxSfTS7yEBexol6SaCmNC+jBoWoxyfdDvCq/HU28ioXNeRh7IU0nDLdcrnt
	pFOZRr49RSa6vWr+BfXfOLq6naASwQX0Yl1ZMmhIcKQursiSIbFSS4AXrGYTBLiFG8gA=
X-Gm-Gg: AYBFou3gdnIjuXdNPYknMMELf7T3Rk3gV62XbsuJLjvwxAJvr5XUncQQERzHro2k4IG
	6eEGk8rNGARht6kWdGPd6N9k384hlHI4lSPpV4FQfbk0wQOZ3W03F4gBu59QM4Zhx49Ty4H9IJY
	I2s4glaevbePdXg6NcYfYXE8t2rKpiitxTnGEp3h9uyPIe+M00FnIymBg/3wd3sjU5qgL05azzr
	tQ6GE4ieDak/TESRJEZu2F0cdpUNcBonLRKUhj+dnyhSxy2O44d5kZiwGIIlcOc5krrADxI2T5p
	haYxI4NnHbSOLs+6bfR9avmzTPMQLjzA4+srj9g28E7xqhhuQlNOF4ChGUU1SdHCukNz/FIegJk
	5iuAfv5jeormzSSzdXOSQsg==
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ca9418c15mr132548685a.0.1790764441801;
        Wed, 30 Sep 2026 03:34:01 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ca9418c15mr132543985a.0.1790764441219;
        Wed, 30 Sep 2026 03:34:01 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22f42da8sm44604666b.19.2026.09.30.03.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 03:34:00 -0700 (PDT)
Message-ID: <4f56045a-a2d0-4c3f-8e69-9ef8d933be8c@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 12:33:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/13] media: iris: Migrate iommus to iris sub nodes
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0MSBTYWx0ZWRfXycUBqoZAWAnH
 hZ8zK2Ioj5Q4rqYeUKKWFGJlQn8SHsFQafqBWSkB5xwYrqAIYkP+mMh7iUyuQ1CfNg6qhfEbnVd
 hAyS9nqQV+WXGlo1r22mUX75aK40X0UZcUhud8RUubng1sAggpNJ++SPWxPLddlvyOG3rfH2xVE
 XZIKgyKp3wtmh7LJpvbiKCcNi2cRvkcW5GXn8sD/qf/nfEOkma0zbhUHGa8DWjmeGKbNG4gRSYz
 bJdVs1k18wzGr+fG0vTytoOD3D8EpwZI5NvcLx8By1GfmjLHgGzEhXmhCq/xtbD/V50AY02wgCa
 unNsKgzQXup11D4DfIwQg8LjfFPjg22zvwfIFmSivVtDLFfMsijcyGHnM4AIJhCf14WggKUQ4mA
 Ftij00UOTYZFJQvQfmmYKwpFpOht+oroDHDvZuOJhqsFgztVXxMzJuemcchJqGrO34D31WLQzvQ
 4Sn63UZiNWzUn+5xvIQ==
X-Proofpoint-ORIG-GUID: maZkpONoPlLSm9eTxkfcoH6EarQU83XC
X-Authority-Analysis: v=2.4 cv=NedzRGD4 c=1 sm=1 tr=0 ts=6abce59a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=ekhMd59VzrWsTOqxRA4A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: maZkpONoPlLSm9eTxkfcoH6EarQU83XC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0MSBTYWx0ZWRfXyTagTrcSMs6I
 5h2LOteAqa9vGUOAzXQ2dRmG/gXyMdZRQi6dJjNmcud1nFU4lGUJl81kE8lmcdmLhuuHYoWNTqS
 20t9L3GGG4Pj7vXAlzUhzglU5/blkRY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300041

On 9/26/26 8:33 AM, Vikash Garodia wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does 
> not restricts specific streams with specific addressable range. The 
> non-pixel stream is restricted to use 0-600MB of IOVA space, while the 
> pixel stream can address the full range:
>     +-----------------------------------------------------------+
>     | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>     | 0x25800000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
>     | pixel stream addressable range (0 - 3.5 GB)               |
>     | 0x00000000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+

Please address all venus/iris-enabled platforms once this lands

Konrad
