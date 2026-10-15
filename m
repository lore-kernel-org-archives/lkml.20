Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618E14BA1C4
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048573; cv=none; b=N3SSoJ4wdKfBRIshVzwFtl8XWStxTZvP+xg6rG8PgJvaxt6IFhW/w8pGbS2QrKHnuS1eBwcAE4KL99NSKYaqS0IbQ4gSy9afzzvv4joEynaUObgDXvcT/28149weglE6Tnrko8Pnbi5zntt/QYno4fRq7+aJ8SdHyVUYpRNUjdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048573; c=relaxed/simple;
	bh=5hP/z2g9RhZQhceP4kiG7MEcWPAl+UFiAdLd/YUGRc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=glcQqM6WzHH88AwmHpjvmaMkU4zpQgKY0MIX2qZiUfLAKUFQDxH7SobhVhigFPu90o6sRZOQ2wlUhcQk90ANyf6Bm0GZNHRMH2S/5z8J86oYlu/robcmRtf1Aq5YOiJHznihneasrRLEAy5J+WuuLijASXWz1lrZYyuiTPAuHFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tp8DrBzy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f92HAXpW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tp8DrBzy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f92HAXpW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F5xXV1500409
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:15:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VrpTM3AO67M1UpQn3y7wQiJtLw3mP+ElEJv/0iNL3eY=; b=Tp8DrBzyH98g+lpe
	tEXFGwa7+CB5rTxZj/fG/lKxrANcouNKIv/38xRqFcSKSRfVXMp0ATkb/RhaSpi9
	ZkU8VzeduxY1cxBH9UUx0uox1T1VX5ffZicOznUxi4uMmKe8h27ro5fzXvRw3Qaa
	4dLdtzsuV8kxRym2vvoJNYRjvnQfL9SMIwPCwl/ROFjkj8bs/948KjUqhsbu6gxO
	38zohW36N6xpgbjLk/dWsTGoMiOv54RrZaz0y4RmhK2PwSxznubhq72zwjA2IWZX
	kmDQuqw187Xe2Ko5TbIoMHOctGCKqCDKFmnrkweZTggZ9fo8v9iSpxIhFaSxK46C
	eqssRQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haagf3r24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:15:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a47617a0b3so4835300a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792048556; x=1792653356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VrpTM3AO67M1UpQn3y7wQiJtLw3mP+ElEJv/0iNL3eY=;
        b=f92HAXpWpXmTu65+pSNFb3qJ6tCT+pXMbSmmrBMPX4du318wbFKtFXne8EvNeC0Uny
         Xy35UrYhxjyKq/MbnDoIIwoclE0GVD0m9+e1DBVkGIIOVlLEo5rvHOxjm1bGkD/mNrgM
         LDpoLoJM3AZNO6LO4KR3j7VusZxYXIzhUAn4eCrEN7FdlGzDgn50BBswHIWf4kRjOynk
         pCsy6SAtZu4Bip64M9UfP3/zzpDhASAwptDs/BTU/n9CTd1qluRDZog3a0PgWRYKLuMn
         yQ8bGA4mB9GXxMCVa3kHfY2cz1qmUep6QkVUK8rCTKgU4XiUIxbGNxGCc5UpRTjdi4Qb
         a3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792048556; x=1792653356;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VrpTM3AO67M1UpQn3y7wQiJtLw3mP+ElEJv/0iNL3eY=;
        b=s/zd7KvMBLnO2YcEFdgL1h3xguDBV1DHus/AmRSJwLJnaBem5XyOCWCXTr9sp7S8Gw
         tjHb0VZvztQc/adXOsHa1lDqxhIxs3G+Sgmq6x9H6MzNXyPipsDJdR/ySJfYKudPPSdr
         j1guRy/ARgXPPSgmy29ScM8sA3bbkpyCn2io/NV0yoZ4+pwaQPezv295glvu+G1HLF2O
         j6+oPHoUyOmYQCkJYq8LqVgm+43bDTcCQt3tAiJgEKrYj350nyPZRGS3WCjglo84EAtg
         eK4zgF1bo/yCqLEG56soT1+BDaOyl2qYIwye9t0P5XJTNyAjxkCLXPkgpmkjwf6jpkXO
         HZQQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2hCRM/2UMX6+d02ExQubXYIUPITRZkx+Vu2zANLVosj+bVtmAtxZ475Ny5pJKkflFHtcWDLsgaXPQe7Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9o6Z5tRmymJiWm0ukhIkew9EVTn8UsmdARukB7M/o0B9UgUPA
	Az45lqs0iuXrluRbgxXartOfUNuHlI5BbwYWzsFBGC6BAv1VWGKLucFdX59cSOWpcdw6PR0i3nt
	q3yg3V/6HpmXl/JhsAZvRrZXYAvJewN0VJsIdrx2SI4jccqBmtq17GTwDHyxyYFVcz38=
X-Gm-Gg: AYBFou3FegLJPN9oXNFMGMCpPWm3FpuqXEmdTFqdIhsFtOislLbcnhrd82fx4dxyyni
	UeTwBFSJ0B3ebEgGcqkCJmgd/PAE/p0tMcyoMfMXREaLc9chDqLRi76ZJCQteLS94I2XtaS3XsF
	XcZvi9mMYCbOYj7uJfdc1k6wap2/ZGgkbketBYclk8IZQWUEthrrz/VlPXH+jJbDKUwl26v0Eyx
	nuxggJoO2liTazpi3gnvFjH0qoKeIt8VbLnbI0tE08lnOmNe2UsEZemkP3qK/whMyx1i2fTTMir
	ef3Ll7OTuhkseMNfC66jcI1IikIujPMp71/39mmc7g12DFMAvPNNVv3zyhuqWIPToCnJ3GGoNHa
	u6ruZ1lfBGdVvyss9xtGyWg8nxt8=
X-Received: by 2002:a17:90a:da85:b0:3ac:1c76:61c3 with SMTP id 98e67ed59e1d1-3ac1c767e3fmr8191858a91.27.1792048555691;
        Thu, 15 Oct 2026 00:15:55 -0700 (PDT)
X-Received: by 2002:a17:90a:da85:b0:3ac:1c76:61c3 with SMTP id 98e67ed59e1d1-3ac1c767e3fmr8191833a91.27.1792048555149;
        Thu, 15 Oct 2026 00:15:55 -0700 (PDT)
Received: from [10.217.216.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac92a43d98sm1617534a91.0.2026.10.15.00.15.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 00:15:54 -0700 (PDT)
Message-ID: <f25e31fc-4767-4c1b-9c34-2b2f78444967@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:45:48 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: clock: qcom: Add bindings for PDM GP_MN
 clock divider
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-1-1522662b6c53@oss.qualcomm.com>
 <bc3cdd77-9e67-4e72-9144-af854076b74c@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <bc3cdd77-9e67-4e72-9144-af854076b74c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX8WDsw/XSTnTj
 RxfKcF1TsPViu/Qz7sBEigMttzLCEfe/JFDmmuzHQ3S1y/6OyyHKfqsFG0Xrnoh2ka5FqZP3YVx
 fgg14fXw8S+Xy/K0t1HfXhEKjRt+i4Prt+g0QfwEQDcUbIjN5ch/fD0U96QvyArpbqgadK3Yb70
 CGwsthmmJHqWJ070Dks9Aomcys/kH1QYOXGXzH2gn79gt/7mpZhTqWhMMCr50MXLhT0W2cU1jXS
 6usmK8WUS7f8syZI862eM7GMh2MogrJ0wx1bxpvogGnkRxXrWCA6S0lRIAbUL2gI1JgITrNWSFq
 76mFIUi+DHkM2RWL32yOnKzwsLlf2B14b2moVUi23pK9QL0CB/j5KmkHQff+Vg/Fi4+M6HmLQOY
 ucuQsP+mzDCb9hxGtDI7mBSjYHIIJxpov2intn0U8lJbYYUuI9WuJ+519O8Vy0qWZC4AhFheoc6
 BtuuTvf8ADJrc1QEf1g==
X-Proofpoint-GUID: RdRoVv6joHI1Y8v3FBRzBP7cUi4sUtTE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX7QJT8kcftJ5w
 f7OBu0AJ8/oRkkxsGn/fQS3hE9eqzubZD21Ifnkw/LV7qClqFjHejMldj5vE8sIFgrZJ0U5P0ZE
 /bjz2VIFOWOzVUFO7jjCttszbZRV+0s=
X-Proofpoint-ORIG-GUID: RdRoVv6joHI1Y8v3FBRzBP7cUi4sUtTE
X-Authority-Analysis: v=2.4 cv=V/noQuni c=1 sm=1 tr=0 ts=6ad07dac cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=GSbrFnjROjb0KAz-EnMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150028



On 6/9/2026 6:54 PM, Konrad Dybcio wrote:
> On 6/2/26 5:21 PM, Taniya Das wrote:
>> Add device tree bindings for the Qualcomm Peripheral Web's PDM GP_MN
>> clock divider. The hardware generates a fractional output frequency
>> from a fixed input clock (typically TCXO4) using the relation
>> Fout = Fin * (M / N), with duty cycle controlled by a separate D
>> register. The clock output is routed over a gpio controlled pin.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
>> +    gp_mn: clock-controller@88d3000 {
>> +        compatible = "qcom,clk-gp-mnd";
> 
> The compatible must be SoC-specific, looking at the table, we could
> use these example socs for the versions of this block:
> 
> 8960 (v1.0.0)
> 8974 (v1.1.1)
> 8994 (v2.1.0)
> 8996 (v2.2.0)
> 

Apologies for the late response.
The GP_MND block does not have any functional differences across the
supported SoCs. To reflect this, the DT binding will use a SoC-specific
compatible followed by a generic fallback compatible that represents the
common GP_MND implementation.

compatible = "qcom,sc7280-gp-mnd",
             "qcom,gp-mnd";

>> +        reg = <0x88d3000 0xc>;
> 
> Let's map the entire 0x4000 that this block spans
> 

This region support 2 or 3 different blocks of HW and they have
different functionalities and for which I am going to add the driver
support. What I can do is map 0x88d3000 size - 0x1000. Please let me
know your comments.


-- 
Thanks,
Taniya Das

