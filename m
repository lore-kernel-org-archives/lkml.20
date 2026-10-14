Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AF925CC57
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791940419; cv=none; b=NW60SI2yL3MbsljHd5Dl2tzo0mmLAXfP1xg1rVFKhu0akzYykZOGlwvFOUWIVe5W7H7Lv4YhkSnNtEMOBXhL2ybksZfWCgWMY1h7vuXeo/w7S7CjBD6J94+C7pb+mUpc0Aky+Ql/2Pq+dw/VlUmAMAC2JBXMj6E9EglPon8VpIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791940419; c=relaxed/simple;
	bh=K1vpP8QuA8zQYdPUJk8kWTlFgWY1vvsRgG+hQYS2whU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TwEwB/L72IVGKYR7WxOGH9nQ0RGBulaRWPpqao5sZ74MVbEPzh7DdwwSnqEGbamLu3TR4VEhCJYuiuGhuZD88Q+0gUFE4dU/4zWvk/ANN528iuQJTa0r5mNGONRF/2LEriPhqA289Kc4CzvX1iEPkbtdmoWaE8LSk2Csz+qj9yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JA/Uq/8/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MxfVg9rh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JA/Uq/8/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MxfVg9rh"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DHNONH2333155
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:13:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KN3ePCWW2QO6TlI+zRqgTvBAo+xanlhwC6Wc8W2bO00=; b=JA/Uq/8/yfQ1r62v
	tHvDVB+Ng3rQIKEiqUP9hpRnqvkJHADPkfK8evNW8oncajLSh/zANc6FcSYOOHHW
	CdgBk+T4fz8t4T8fDxTb9byvY2fIgmyw4axygnlvVj9NxE2IRKGEHJHy45RNoLU6
	hjUhwe0MQl5T+7QviCt1u1Wqnrnoq26d3iZr0mveHOPYkHNMhtN8bQuOgpXsGqtV
	O19SE78uE9siGghVOUDEoRlRIi/HLnPc7FchjPB/wCMzotim+cPd9TmSICZ6JpCC
	M5thgr4owQV29EQA+Wi6ahTQEKQ/1EPNZ9pX3X7LBHgN0KSTlU9P3TZdCcBKVMc/
	Bk1PYg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s0hhngf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:13:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab67ff8ec3so333309a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791940414; x=1792545214; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KN3ePCWW2QO6TlI+zRqgTvBAo+xanlhwC6Wc8W2bO00=;
        b=MxfVg9rhk5e98bNKbiWjNXU394o0tom4fc8ZYS0R8qeU0mtTgJtkTiAWcSxitqZxWl
         X7NJ0ucgW93ibLWtUB3nf8R5bxeFoXQ6D39piTxPlAoI4B5N0wtLCVPuJuRxSd4m42Cy
         ivM7zhqFnkmrmQQLiI6k332BNMtTrMDKLENeg3V/0T5NW+eT5yIBLp5K0nR5BI4IuXy0
         qg/mK05asUsB5KSjrTDv9sr0xrpaVhxH9+AlgBgh9j+4F+kPzH2AGWiXxLP7uV41whV7
         /4cnjVEqzgHdIPEus2bvsIs+X6vpeBQ2V2/KaF3jhGERHycHkby8VFgpJJx7fIqs0/XN
         clgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791940414; x=1792545214;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KN3ePCWW2QO6TlI+zRqgTvBAo+xanlhwC6Wc8W2bO00=;
        b=ltbCCij9VL98vz1D5pMmiz/w5TEJ+2ETqX18TjC2NuKalAdh7/EHnnDVIukSsXF9n4
         H3C7uw28LDDL9n75Oqrsgzt/uD4O1zUkPlBy4AphLoKJn9zQFl2C5fWBOT3ADQ5hGbwQ
         JbMGE0CdH7931ZNlHNQvlIn3BQAAop2TpdxXPEQFRcepsP8lwmasfWpnNOcN1yYVqYeF
         sFE09qxUzstva2cOEOlDeKAFGA4DbrKut7DFZ28zbMXwY/+VQYImF4Ok5du4pCv+ZSEO
         LDYK71FvS3MdBNfVXHimaFCaOL7F16CuesblVhX/6F5AUuX6O1mJgdYi6kBcKhT8jMWG
         cglA==
X-Forwarded-Encrypted: i=1; AKwUvByzi/jgP5HrnKp8Cu8VsQW6LoRZqHLamLKo9scUaMlYGsFJ3IFF5Rk035jr5f8hhIFvLcBKp5XfkTpqovA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZEg4dx/4+suzukzsaW63eyJUkyxhy78DQH59nr02z2s09w8oE
	S9dwgHFHZ/jrAjKtN29vy9r/FNXkfIDWXUex4KECpEwM6VXb/H1kVvciiMmISmQaQ2MKVnXzLos
	vS5ql6HpKqpcHZpU2+JruehJCjeqtt0Oo7wN09RCCK9aWrNTMlQs+WVx9aoONTXeViO4=
X-Gm-Gg: AYBFou088E6WuPhh21OukvDfvUiDTWAcpaaFs5Pdypyz7zi5FlcznGP68sHzQc8oWyq
	qWFnBVWVgJicI5ahsbPBFkfZhQt26j/6Bkg+c3+tjwMVbf8UZ5IlY26kVcVNGkTWSE1soAIJsLk
	rFKF5t8nHexTcTP1Tv4vUPXTS9pskh9guTN2UR5nh8IXZ4LCdQ8th2akTDCmyw285pom9wki+ge
	xEWBp3hGAaKI4Gy76hDkwn/A9uwft8pd0okrEfQf0YRWoAP4GGMBczW54OfO/WJv25wuNlls+Eq
	JHOp0fGXKQmj8vJSalTYlfe3JpJVgZ53CCF3YreO1f/jCaDB0xMjW8h3FwiJraio8m8MC+o2DIC
	8jS9ZbKYrwD2qi7pMFr9FTaWVDfGWweJHSB3PlneHiCfqh3fOYvYsO2aCrood6pc=
X-Received: by 2002:a17:90b:17c2:b0:3a4:b3ac:904c with SMTP id 98e67ed59e1d1-3ac5c873a51mr1327908a91.51.1791940414184;
        Tue, 13 Oct 2026 18:13:34 -0700 (PDT)
X-Received: by 2002:a17:90b:17c2:b0:3a4:b3ac:904c with SMTP id 98e67ed59e1d1-3ac5c873a51mr1327897a91.51.1791940413711;
        Tue, 13 Oct 2026 18:13:33 -0700 (PDT)
Received: from [10.133.33.80] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac600a0619sm2153127a91.7.2026.10.13.18.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 18:13:33 -0700 (PDT)
Message-ID: <68acff8e-2696-4ff9-9bfa-3b23e2b15fd1@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 09:13:28 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: qcom: hamoa: Add CoreSight nodes for APSS
 debug block
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-0-c2a8c3225a2e@oss.qualcomm.com>
 <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-1-c2a8c3225a2e@oss.qualcomm.com>
 <7fccb993-8605-4eb6-afd5-94edef1d487d@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <7fccb993-8605-4eb6-afd5-94edef1d487d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GL+dgeNK c=1 sm=1 tr=0 ts=6aced73f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=i2zWceGxLG-rlMTYNyUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: UcKdBEKOcxDvDn69aaCZotLKDFU6H6JX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAwNCBTYWx0ZWRfX2EBBHy+99gV/
 VEsgwHh38R2WWayNHtyTvuClWkCLwmkAC32Hny46BuP8HCzTI12h1hfKK7Cyupeouf0BJUW+weA
 6fNh82gzF8u4M1c8c0ASaKxCUhd8JH4=
X-Proofpoint-GUID: UcKdBEKOcxDvDn69aaCZotLKDFU6H6JX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAwNCBTYWx0ZWRfXwLktkT8d2BMm
 04WmgSDelqR4+NGzkirNH3PM7sIY4GbsG9TBfhsKinlJvWEHVXzOYH9t7wO0QXU6pEy1/S7UqxC
 PbkYVQcEcspIAVjlZvgV+kCZ/h34heD3gctrEK3CxqQy+6NkvS+KY2Ao8ATMsvFWMtmCe/YwQf8
 MlkitqdcOwXVX+X0qHRXyIFWItPFc8pieeoyi2zltyUXRr/lWWXBcXk6Lk0TpL56/6FgHjwd580
 SPMrfHOh6Z+ekSIMRVFk7moql49qF2XVdxS6mFTBvuoqX7fununwTUNNT07YDswV6EMYq42p8Qi
 9lBfsI0LgwXsiSakcWKdYBki1n+Jj8g09ukuCGc7Vp/wbuv7UX2g2XRX8du8+GbaCJL+oiEYLSC
 yFE67uKaAJXkrfOYt2p/FShWDcA0pJOtr1DsF1brdw+Xs/5B0VBnEqjiNo6OesDB+n+ePknAfH1
 eszZ9FLq4OUlp65/eUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140004



On 10/13/2026 8:46 PM, Konrad Dybcio wrote:
> On 9/22/26 12:35 PM, Jie Gan wrote:
>> The APSS debug block is built with CoreSight devices like ETM,
>> replicator, funnel and TMC ETF. Add dt nodes for these devices to enable
>> ETM trace.
>>
>> The replicator, funnel and TMC ETF nodes in this block are physically
>> powered by the CPU cluster power rail rather than by a dedicated always-on
>> rail. Add a power-domains property referencing the corresponding
>> cluster_pdN domain to each of these nodes, so their power state is
>> tied to the CPU cluster domain and the runtime PM core can power the
>> domain on before the devices are accessed and let it be powered off
>> otherwise.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		funnel@12080000 {
>> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>> +			reg = <0x0 0x12080000 0x0 0x1000>;
>> +
>> +			clocks = <&aoss_qmp>;
>> +			clock-names = "apb_pclk";
>> +
>> +			in-ports {
> 
> No need for power-domains here? (also same question for the other
> platforms)

The power-domain only adds to the devices within the cluster. This 
funnel device doesnt sit in the CPU clusters.

Thanks,
Jie

> 
> Konrad

