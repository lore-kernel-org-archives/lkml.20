Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8AF40E8C5
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787748781; cv=none; b=DqLE+27s8JIdkLMah16KC4MOecWu/PFFMXKbaCLFG9J5aZANY8DIPaF6toa5UUm9h0RgzVYRI51Z4WGER/biKeMvsQlViD7TKRqDMxuvDQkWBVjDI8RnKMgcjkn7Piv1E8T2HW5OSXsSXW5yh5QqrjSw6VjFEKjtUT38ZIeeBd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787748781; c=relaxed/simple;
	bh=WKvODjXitmfFPfAG/gy9D4hMRVexb8bj4k8N5J0scWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sQ4FWm1jHJ5ZmjsfbGxNOCW620lw6k+GI3W4SHpyu7n08EWEHIhNYpyB6QklRUunZdP20SfBlasqKljR8725Dn4KsSf2MAOjKQVJerQYyWG7CjA9HDTyogQM2sHot59UnWW7UY+ZHAitnqrVDaVGy/45JfHP/1AJGeTGj6JnP4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MDUIZzOL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AQ/3cOCM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MDUIZzOL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AQ/3cOCM"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCCKEd374952
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:52:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FNQy4Y4QWEwkxWzbv8l3UovuMLGmgUb0gTLe2xWCdfs=; b=MDUIZzOLG/xaNMuS
	Qs3/6xV2NLRxJQYybM8+X8E8uG+xngf36QVohX5IIJAfC2+MVRzUSOa1AqKX5TqW
	p3G3jqPK6t3wutGJZEN7M07qqnQ2U9+yxRRLiQfCu+YCu/fgDfPTTOivfMC/BVK8
	2M9vobhrBPLluIFI09N77/dzT07uENqfbQ6DOSuhi1K+Gqv8XKf3R6Grt1Hxi75Y
	HxVBGy5pa/AAPZI2um+/zXpCdGkGsy9oSZBAmXkzpDRr5LjPYDwaZN1uFX6NHQVZ
	ATESggMM0bo30mrsylr4BGxT/llqUl/KJrtRm/eLA6iC4HrSx3tUM8x4LW4lP+Xa
	OcnG+w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9smx9va8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:52:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f5ac7416eso1542618a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 05:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787748779; x=1788353579; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNQy4Y4QWEwkxWzbv8l3UovuMLGmgUb0gTLe2xWCdfs=;
        b=AQ/3cOCMS6huLonu+BgV4+iayDWe/NUPxFMuJE6qNjEtEaQxsIXFk3YCUYe/08Ho/H
         2ngyBNLk62I/VvLS9kaorzARicRgmrMit0rC1XzNqy8bNm/SVw4fX8A09n0fBC84Klbt
         jDWpOE8TSYHtB76XgKiKFlpjM3H9llyTGhk5CepcRWdlC0mpL8HWnTlI1ZNH7SHjqklQ
         b6yLHBeU5/t6dGWvzQ6k8wUcI7zUAyPkpRKNDn6Bra7lijYm47rraVsb4fFB6s9xK1vB
         BS9QWG5V+HAN+l23wSkvTgot+4GTn6lRIh8MPzipFtX89Pnv0VVk8NmlhDMSKD2FIuox
         jmcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787748779; x=1788353579;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FNQy4Y4QWEwkxWzbv8l3UovuMLGmgUb0gTLe2xWCdfs=;
        b=CI/vjVDwLiyf5UOfP7cEO+9dEBr2vzjpo3MhHKp9erNzlTSftHnUlHpqM61HkhdIap
         H6NxW1JI+O+cBKc8QPFRe5LOaCHzMiP7wc1gq231pdH8WjjcbGEOruv3QWtmptlPV7g/
         h6Be1k4BTYJDhgHQcu/thQFFsIgei/OUjO3UJ4oX9XxCiJhdYZX8Rq3hJmjH7RlE4IIS
         uAGOskIuLyTJ9jAAqb+z4FsV4Tw1kk/TYWbi+JgbhuJJ2mBcLeoC6q3IZSW4N/867Eiy
         yVK9XZfCoJ9nm/9hNInlmqAnZKtCfQygjJQ3zi0iviv+Mn9cjW6xt3hW1O6itq8PTx6r
         ItFg==
X-Forwarded-Encrypted: i=1; AHgh+Rq9IiWgOtKf2JYRqSgArc+vcPL084M7+W8M+nNoME9+LVUAVpyKu3k72C4wbkaNciSH7vCX/DvyR4U3luQ=@vger.kernel.org
X-Gm-Message-State: AFuF++k7vNonpboLSIG0JWOesMYzSEpYZWOw4obngVWZ8ytDLpqJzSzY
	JWrtaQfx22OfByyiCllgvtpFw/Lpvdc5zyQ1A630Q7xxZq2KZ97Xz3RNBmfnDt7CDe0UBeYYWak
	1MuLlMlrZTu450Gq6uYneUfl1McQM87dAA33JLbXnwv0hO+nT451cRrQjBWiKQJt//0s=
X-Gm-Gg: AR+sD12vy4pwZV2briYpCqWVCqBDA4K8xe7I7RLWoOjROasAs2keNgvnLaSQ8Q6Sxef
	7PbhM1q/9zaptQXjXXgIlJAC8BpbM89sXeicyVrtriS46qpNrbFXU7558wnoN34aOgmHzjeUBtq
	fP5n96bFtq6oYjdBwUJEjkjg4y95n1vqtOiBq+D3799N4DVLApRpWrEvKEKVAzcYHHpBWCgXNVo
	3dIFpBtTamTHXeRDtt6VScmYQmcVIqdiDS2O4RVT4aG1wb2DThucpEv9EvmVU1YWPJ2Z1C3/fpF
	IEu6JBu2fgetwKgKJ+7PS1wr4FupCba2pTvmw+coIav+btBusp+tc1mNjXne+4voIV1t951B6lO
	Yn9QiByWaoE68xhilmK34VilNtoKNInn3
X-Received: by 2002:a17:90b:3f46:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-3966d3d8a07mr14427504a91.10.1787748778825;
        Wed, 26 Aug 2026 05:52:58 -0700 (PDT)
X-Received: by 2002:a17:90b:3f46:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-3966d3d8a07mr14427403a91.10.1787748778378;
        Wed, 26 Aug 2026 05:52:58 -0700 (PDT)
Received: from [10.218.4.101] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3966875e5c3sm4076282a91.7.2026.08.26.05.52.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 05:52:54 -0700 (PDT)
Message-ID: <41af9695-44f2-48cb-b5f2-8e779f7366cc@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 18:22:43 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] i2c: qcom-target: Add driver for Qualcomm I2C
 target controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260813-i2c-qcom-slave-v3-0-1d3742e2ad47@oss.qualcomm.com>
 <20260813-i2c-qcom-slave-v3-2-1d3742e2ad47@oss.qualcomm.com>
 <9c8e4e57-135b-4f24-97b5-dde9c0418efd@oss.qualcomm.com>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <9c8e4e57-135b-4f24-97b5-dde9c0418efd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=O/oJeh9W c=1 sm=1 tr=0 ts=6a8ee1ab cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=jJ7N_Ga9sRvXCTnihBAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: eUdMfNNfqd3rpEuB9Kpi0-GfxqLXQwb3
X-Proofpoint-ORIG-GUID: eUdMfNNfqd3rpEuB9Kpi0-GfxqLXQwb3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEwNiBTYWx0ZWRfX3V0uQIAMUukA
 p7I1UD8KfvDqsbTk4LF28AiS1X/3WYSpFM/aq09pUCJgmw3avHU6CQxlBT7/wxyhppkCNRb55YN
 /hLOcZA5ia/DFhg34cLQ9LzXfXLDbIUYOEtssGJ/ASVe7jdPgJJCVeBLBbB2f3LlnQxyu9YTF2A
 wyyB+qdesPWqZDEUuBDYQFq4GvQ22Y3NXZ7uvOLU/SFUtKKhZ0KJoWpIFLNSCmYumqw3GjYUoA0
 idyU623jL4GYYrsYYAkmS70YMsxZj7QslV1zqCuuyIIh1RiWGzyKBjyHQTucYXbvcnQq2RRpLGN
 T0by7urEsiJ1z91Hl6KOQX7A8aelLFz9+RXUTzPiA0RB4hdW2zf4+apEn8dRRquwznXaNlpqD9K
 x4XkYUMt9XSLrv4QHdXsT5XNpRrz4fyXVfcqZNYs57o1ZpNgoVsYSwt1/7v7XN/7liNw44U5aIL
 oq7q7snmRTT0bxQXa4w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEwNiBTYWx0ZWRfXyEKzx9wkvWr3
 nazWIknzpdiaoPz/Oaoi/0b/uIUG3yFfO71e61eaY31pj+L059hub4JslNi9fQskL0+stcj91hN
 wuiBmPs5bsE1wZY/S+Xhddv5eHMExq4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260106



On 8/25/2026 3:11 PM, Konrad Dybcio wrote:
> On 8/13/26 5:52 PM, Viken Dadhaniya wrote:
>> QDU1000 and related Qualcomm SoCs include a dedicated I2C target
>> controller that operates exclusively in target mode. The existing
>> Qualcomm I2C controller drivers (GENI, QUP) are master-only and cannot
>> serve systems where the SoC must respond as an I2C target on the bus.
> 
> [...]
> 
>> +	ret = clk_prepare_enable(target->xo_clk);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to enable XO clock\n");
>> +
>> +	ret = clk_prepare_enable(target->ahb_clk);
>> +	if (ret) {
>> +		clk_disable_unprepare(target->xo_clk);
>> +		return dev_err_probe(dev, ret, "failed to enable AHB clock\n");
>> +	}
> 
> Does this need an OPP table? Presumably we need a power vote for each bus
> frequency

The xo and ahb are simple gate clocks with no rate states —
xo runs at a fixed 19.2 MHz and the ahb rate is fabric-managed.
Since this is a target-only controller the master drives bus speed,
so there is nothing for us to scale. OPP is not needed here

> 
> Konrad

