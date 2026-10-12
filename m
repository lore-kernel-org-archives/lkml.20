Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE9F449B3F
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791794493; cv=none; b=r56PDfchlxMlp7vg+CZO1Ok8g0/Hg6QSvjKXtucuWqZc5U8SmMsnG3FgHmdCEKR5T+n9sMocenoruipcX6a6Erj9bwo+gZl7JezKvRC/019ZKeE4BghHc99BvR4sn6I7ZWuK3cj9niAwhVxjVdnEz2IfsJAGyj2KOV2X0U+0jJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791794493; c=relaxed/simple;
	bh=vdcdDO5nlV4vLF43dgt89lpuCvAKX1DgVOfEI4o5kws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P29ZeSHM2dImPKni2v92NFcFWEZytQqZP8JUfreJCyo/tX1EWkoqDKaEgGQ8i4eBQoxb77rg3JhbbsJJ9/VIoimlG9Zx04ieO1Fobm4/bOIWCQIQoMJzgzWveUT3F6s+PmaEctUO5lOfBaatEB4oMaaUHs9P20e9LovmbXtxk9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nQw2AwyX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hE25VxFc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nQw2AwyX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hE25VxFc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8chUO955204
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TfifKJ8I33eiXdf/klxs3GNNDvTmM8v6aZs6OA4HHNE=; b=nQw2AwyXi2To4/SM
	3h/eyfQ11FkCJcorbwJDfu1jgwgRpRJzRARwoWWK3bXEUOSVMPJc5CuADnhRLuLM
	tM4UHZrMFeUP1aYCcp4jmrNNCIMWxSGDbWj9nge9kiwPBIV3QUoydpbtBVbqxC59
	OZE7Tenhn1cNQ83btS53p3k0w8LiH5Q9hhUugykOpM8hpg4+3qmOIMxUg39FNW/5
	vpq3ga1qhtORFJ5OdaBthubl/sv+RY561v0/HqbsWZi0CpZEEG9EFSfjHKr/i5lD
	faXoXFe/cQGwx8IZVxP4bnzNiNuiVYN7/noKTZduHdkToBdVJ3KTL2y/KSBLs1jy
	LT0DOQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8v7kr0cx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:41:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so297990a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791794491; x=1792399291; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TfifKJ8I33eiXdf/klxs3GNNDvTmM8v6aZs6OA4HHNE=;
        b=hE25VxFczUnEbFbfHtn3rNrYJEKx6Gib+xGHKXa0U3BxNNyL7HzP+aKn7fMQyYLzfc
         hc/v672ZI6N3cqrCFk1RgmPyniDCX6Ssyt9quutvjISs4AsxgD8/5Ru9pPp9qXUo0ZlA
         CZA8X/hH/6imlIJO/yxGzbZoq9G+n8noXmi/C0O8JRvsa9iuXauEKhXggkwKKRx+FYgW
         bVvSeFuzqMXG8qRqC/Z+Ic4rqFLTbv8P/MxME/qPh9Jo9nxPNLKz/OtOglkPicu1IbwC
         iDpvdiotvG5Ocixkfo3omCE/RkvBfLTqZZA2SNbDpsh4q8R3tCsrTBO5uNfFM2FXTPya
         qzSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791794491; x=1792399291;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TfifKJ8I33eiXdf/klxs3GNNDvTmM8v6aZs6OA4HHNE=;
        b=y7y596srmEiw7zAXXqXCxW5e9ud1m0lCI/HfHMXsNG5ZMuBIQjTKL0/Qr1G2HJz24b
         8iVITUyUs6Pfa+tF9Dv6VqF/+pimhRIdzYWN4ktk0c/DrDxJPxDnvDa7FrfiNuFmIGkO
         ynRhQZzIEtmhEHOCvD/xlSVPpS8KHW06Umaf381HxeSAdZy4vgAEd7qwYbMjuJtbV0kq
         +l5MbV/za0bwmRpVzGDaYqtwGpyUulxDI9xw8KRElpwWw55+4/cVm2uH0WMRvs0ts6hQ
         xtB/Ezt5JcmC4K8oVs9cDpVIAwHJlf8RhslHx7TN9HLqWFFFD+XLwzruOtvHHPj6wlA8
         T+3w==
X-Forwarded-Encrypted: i=1; AKwUvBz9NCV0beRTQeSHEUzujDfhX69I/V/d5FXHf0glslblVTZ/h274EHZlDSd18EvSj28N0urHT1aGp8LimtM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdy2J8XvEUKKfGqJFdHT+BHV383QrVss8r3O/bWJKkrf8Id2ge
	//zGtzl0ONyw/oIrgS1jH294spN8L4IS/c7B/ZKtIohPjCzKvoTWmOW0/Q4CNpdB3nlmZD2K0NU
	2otzbccu6Gekd2b1SXRHJZ02/2Qz9VYZAYCD5n/DcwQQbPKRo0M+ahxjZITl1DUOd8pc=
X-Gm-Gg: AYBFou0MulY/6w+Qj4OUGPE1qepSy7ADgCQ+3fUUUH49TIrg99vxBFhl+vRfdoK16Fw
	5FhiZrFZQFlEt4sRE2TG47a65VEXO7QDqUgIvx9EhH9N0PB0BxQ59kMcYWtNCUeX90iuWgoowA1
	uz4CiU9LlEbbS7cQQonBTbWNyqGq63u5/8xrO7tL7OVFxC0Y+sYe2HaQXZ+2KheHxPTi1txBhs7
	UHd8eEoICN3Q0VsPLEU3wADVJkfU6oaljZuOYFfcIKbyVBx4yo38cn9ehPjIyA12AdndkdoYHg/
	7A0TIcLivjWE3VEmtzGVNAg9D00CDoNWeYVV/99ULr6SH1guPtieuKxujM7C8BzMIJjZqGtDHjA
	//2RUovrsIVcXrQH0a8ESvGXEgtnTsRoQ2IYF8tFI0/G1PPrBtiXXOV6B3ESFHLHf0ryScg==
X-Received: by 2002:a17:90b:164b:b0:3a7:a6bc:9d58 with SMTP id 98e67ed59e1d1-3ab3af76821mr6800464a91.54.1791794490563;
        Mon, 12 Oct 2026 01:41:30 -0700 (PDT)
X-Received: by 2002:a17:90b:164b:b0:3a7:a6bc:9d58 with SMTP id 98e67ed59e1d1-3ab3af76821mr6800431a91.54.1791794490086;
        Mon, 12 Oct 2026 01:41:30 -0700 (PDT)
Received: from [10.133.33.27] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab39238608sm16102673a91.17.2026.10.12.01.41.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 01:41:29 -0700 (PDT)
Message-ID: <d61fe4a4-7101-472f-9202-404de9899ec4@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 16:41:21 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add INT2 GDSC to Kaanapali DPU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang
 <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com>
 <20260915-msm_gdsc2-v2-3-9157237b8382@oss.qualcomm.com>
 <epga5fcyf2d3esucs5ulht4s7ixwpwlb35iygz63aqeefruc2m@mwmmkaw2z5r2>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <epga5fcyf2d3esucs5ulht4s7ixwpwlb35iygz63aqeefruc2m@mwmmkaw2z5r2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzNCBTYWx0ZWRfX42fZyPL+1rZP
 RnVxid23Fe5WpQzrl/gzfI8fdIgTtSuLWCPd/ZAiXGRZhung2gwbKqPbJ1An5xcTD4e9GwSnJnC
 cOBSxNCPC+70yUclCK1tAOqdVnGZlV5+UCMe1W5Nw+uNOC1fnEoCd0EuzEZSGdocHZEep3V6MLS
 gpNPU1HsG9vhKZBcVorxpT3tpP0jb4RC7eXkSMM/xuWaxHt5LK+dWniiOeZMoSVZs36c9Z1TUnW
 PFaMCblwgxW248nCu/3MkYyeHxS+Vg7NuryyvQ6pbNreS4PKguXZlhG2bodanwhUB/q6PP8xyQl
 KCTVq2n7mS+SY4LwNWs55FxrZH79FttcmFgyH8rq47Y5NS9+Vkh94RIcjLPAPL1rRuCnJTVkMJX
 zHW3+aZO8aV3V8/G8CgNbm5/koJlm7xkDoudtiMnGB/J+bFf8kpb2wK8dmx6CX1cCUTCPJSvlid
 fyNCrxC5osfgApuYqxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzNCBTYWx0ZWRfXzXVtcaTRtKaK
 ZY73LAQ+cn7C0Rug2ygXi3DQqIr0Uv7he4sjl0Q4eQgaA2cQG0j5pIJckeKDp8/9uXSM9radBsM
 kzp3+wQH+TO+GtSyeM3SbZ185m7bbBM=
X-Authority-Analysis: v=2.4 cv=VOtIDNPX c=1 sm=1 tr=0 ts=6acc9d3b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=qfM8fCPi6zIbc8DzE_UA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: KWq06eqeu_XoB91rs72qNV6J632adbkV
X-Proofpoint-ORIG-GUID: KWq06eqeu_XoB91rs72qNV6J632adbkV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120034



On 10/5/2026 9:06 AM, Dmitry Baryshkov wrote:
> On Tue, Sep 15, 2026 at 05:27:50PM +0800, Yongxing Mou wrote:
>> The INT2 GDSC on Kaanapali (SM8850) powers a subset of the DPU
>> source pipes (VIG2/VIG3/DMA5). Add it as a second power domain of
>> the display-controller (DPU) node, alongside the existing MMCX
>> performance-state power domain.
>>
>> The MDSS node's CORE_GDSC is unaffected, since it continues to power
>> the rest of the MDSS hardware on its own.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> index ace19b8b12d7..b3e3cd1d311c 100644
>> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> @@ -3619,7 +3619,9 @@ mdss_mdp: display-controller@9801000 {
>>   
>>   				operating-points-v2 = <&mdp_opp_table>;
>>   
>> -				power-domains = <&rpmhpd RPMHPD_MMCX>;
>> +				power-domains = <&rpmhpd RPMHPD_MMCX>,
> 
> Should it continue to be RPMHPD_MMCX or should it become
> DISP_CC_MDSS_CORE_GDSC?
> 
It should remain RPMHPD_MMCX, as this power domain is used by the DPU 
OPP table for performance-state voting.

DISP_CC_MDSS_CORE_GDSC remains attached to the parent MDSS device 
because it supplies hardware shared across the MDSS subsystem. Since the 
DPU is a child of MDSS, it inherits access to this power domain through 
the parent-child runtime PM hierarchy.

Only INT2 is attached directly to the DPU, as it exclusively powers a 
subset of the DPU source pipes.

>> +						<&dispcc DISP_CC_MDSS_CORE_INT2_GDSC>;
>> +				power-domain-names = "mmcx", "int2";
>>   
>>   				ports {
>>   					#address-cells = <1>;
>>
>> -- 
>> 2.43.0
>>
> 

