Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27024A7CAE
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048549; cv=none; b=aBx5ZtWW1oP9EfvRVFWZFsriGTsN2+/qf3cqKknUr2tM0TxYMF/aF1TXhLhok66K1TX3C+Cb/9fEFYCCDVbCJLLg+Xi+P6bcenz1loj0GWqwHSUn+f5z0HNEKjWWuVr8mshSO1+xBB8pcNLzRwvyiWEXUpjhhMvqSGl6Vjzdir0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048549; c=relaxed/simple;
	bh=/wSh3zJmkx6TtnnckwzhBMdBXjxjl8xQdGNCsjICl+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B6dwhWqs6yS+v8g6jjFPDnXC4dfNcfdBoRkl4yESxVm3dUQ06/SzUF04lv4NCtJWUvYEeZzjv7E93p3CXF5IX3Fq/S/yg4MbgOIDIgC4fKWJZVQTxs14QzfzE3DapA2YrNLbxG0sIbysehzmO57yL31WWBwqjGZcxyts894ZQPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K2ruZgF8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ck8rdLfu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K2ruZgF8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ck8rdLfu"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F72cSB1672304
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	37uRL9c9rOSmwS/mEtP7cPrnXUUGMopoQZo9iRjCIoQ=; b=K2ruZgF8J3jtYrUE
	17ObGhOSjwoqNxY0Yc2lqTcT/po7C09qq2p71Ngob6oZfVfXv8foF/tYbeJCwV66
	8ktL1L2KQ4Fy8NRbBjRgVVESMl/4yqr77X8EKp5x2oRt7/c5abPbmTRfo1fkUQFx
	ZYVp76OR4KP4WjzcRWLrKssiKjT8+n2YROgH5NU3Dt/MAWgr4agHSPUGf50RFs38
	uEr2aY1vQmaaukYknt6OqNeW2ivQMeqMV7Eq+He61Q+gYL0IvqrPv1FSViyu7JRR
	mBfv4QlZlKUimDrjzpcFjLu7zQYPLSe8vRv93OV3f0+rXue3pLDNqCTMW/mOdIKQ
	R+6Pkg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacrhb2w9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:15:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39deda201bcso8135314a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792048534; x=1792653334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37uRL9c9rOSmwS/mEtP7cPrnXUUGMopoQZo9iRjCIoQ=;
        b=Ck8rdLfuQmvBCBqr5jy+9Uz4eoDWwrAAsRYwuCykHSZxgeFauis4BmLxZu1iq+VCRr
         n5mVKJ0mHO47I5KdAOfCHGZRYcm1AxH1cXYq2ioGU27lyG1DNkW3NIjpTsRIHeJD4l6U
         48UtPrgJTo0U92QWVv7w3oyaAKhtTZAiKi+lx5RRToE8KmjCB8x2gJGbe1RDtlRSkhx3
         5nT51stlY+NfAaedyRHrV4JJ/GH/aTUGZDjLDhyPr6RtLFEIUKk3KS/rFKs03+Wa6Db+
         r4dr87lo92ys/oJPCwRi53VaAu9Nz5OHFwJuiF/c2QRH+GvqOIfIul7P6g9499xhjIq6
         DYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792048534; x=1792653334;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=37uRL9c9rOSmwS/mEtP7cPrnXUUGMopoQZo9iRjCIoQ=;
        b=1P2S3lhxRH2XgHqJ9WDM5JCR9kC5NlkG4acNHHpWT77L9QpiR8OnIw3AHkgYKu1lze
         xu8Etck2DVG6yHDFrSYEu4MY5S18PIFZ9AGqjjySu8mLqTJSP5jbGXAzVTXC258xRKmC
         Zmma2qK7agLWhj+zKy7vlOVw9svN3jwDN7cqAiO5n4AJyujHTPiiHtGf3n4WSGHKOwoL
         bDu1h1HMZKK8WNJ4nyavEDBt6156sPnKMogeAtkAnw6BXp/Xws2wLqv3t72R+Q2S5czv
         OgBk41ZCnAJUdjPrOHni5zb6TAA7qjNvIVO2K2j11f3ITjkGvw1yQHVphJAazkQMtEYN
         hy1w==
X-Forwarded-Encrypted: i=1; AKwUvByvqTl+M5S1UHneaTskRACmMFqIVNgy61616Vy/l1tviIlkVMppjVVQQkjskGeg9WPVk3Oalmvo9GvxYsg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIG1TnBv6KVHHpifGseSIEY+QIredxOTLQQ56ew5TMyNUGmDUop
	2Hmbv/y//V6C4JpB16A61putcj1H+hB5e2IRjKeIDQRI1SjZxahhIwby642lVdW3hEGKiAVUSXN
	8BvJ+qN/boAr5OpSo0hVU5IXUR/q8leqXHgPvvU8Gx3ueXj4Y1QvsbegWVLa2Pg0oRz0=
X-Gm-Gg: AYBFou3/Q6Ot1oyjMxfyRgjamhRqqavrvriiPO3DK1DzPWIVQeeT4617x3oW4b7gMUs
	/id1MyO2aDrxm/nnriJSPgEBxjiuIh0Zyn7VHoTQHweBMKgYgG/eWqLmlfQF36Td4oHGqM1Du5/
	jiLpDr1AXDsxOqIX2gKimTvl7dmuWoceq7HrrA5UjmhRrRNgO4nh3rerA5AqxP588qNjykTHckj
	vGmBN6nMSI6SUsikkhDAekXltWUMKp5xG+MHFvT4AFnoGnl9kCYuruCIWXyEHVh/80CcN0HMnv4
	YXVSC3jUCtr/3RBVO7iPLsHIGEKXKnUlD3BgHuKm1jhfWCTDYJ7066W3CmbLMM72foDOkczPqun
	Exko2ElzP/e8Qvn8rq78/KF9HISA=
X-Received: by 2002:a17:90b:3a48:b0:3a0:9640:803a with SMTP id 98e67ed59e1d1-3ab3a33db41mr16430161a91.5.1792048534148;
        Thu, 15 Oct 2026 00:15:34 -0700 (PDT)
X-Received: by 2002:a17:90b:3a48:b0:3a0:9640:803a with SMTP id 98e67ed59e1d1-3ab3a33db41mr16430141a91.5.1792048533687;
        Thu, 15 Oct 2026 00:15:33 -0700 (PDT)
Received: from [10.217.216.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac92a43d98sm1617534a91.0.2026.10.15.00.15.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 00:15:33 -0700 (PDT)
Message-ID: <a944b2e1-3985-452a-bcc6-8b16969a7392@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:45:23 +0530
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
 <03ec182f-b1a2-4ebe-8e48-9e88168f7694@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <03ec182f-b1a2-4ebe-8e48-9e88168f7694@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: i9zeKMxRO_1T9gGe4nUIE2PcKOBq4cqm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX5LGkzl+ioVYu
 CThQ70yQcWM5Q/RpOt3Gxfgvd0xVAuf2HQpSzlK8qba9a2sDLFInW80CfMcaUPrCzcxTZZ+P0yz
 PJEiV3FApdcPc14runyotXzbszc00tc=
X-Proofpoint-GUID: i9zeKMxRO_1T9gGe4nUIE2PcKOBq4cqm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfXxhs/9TOYMSAN
 AG0xwRSBp6X8s1OhTwbufUyYrdYxio7IbnbTALl8eeKVey/RlR5r+M3NKjk5KVSDc+tFkseaXIK
 MBkNk29p36qlOMMC2oI+5n4KQXvkuUgKqHoGzWEwdfA7jwYZNguIG8UKk1D7arZLoeEk+GqXoI1
 rNHQhKShPSL3bDpzqUtVObhPZt1sFgBhshIajmcMMcVVvUhJeff5wWUQPdJX295WSbYFctYdY85
 qF/WwAFRUweqZEFY2YKLOgImbD2PtAo3rGg8Rw8fsRisAhMSAug0pPLxByfz11BmvW1D5EyYceN
 UzOK2f9F/BflGEWAtCuCo/vEoCiHN6vJmyCX/ZkA5cFVLO/w7Qk7LdefJmPntGQpdy74Mss7IUW
 Ky0Q+HQN+vs1gBGykLqBRgg+CZLZXSt6F4KsGEKomvT9X4VDicOtahrjEjYIBvpwrXH+g4UVxkW
 QGc1nCGginCH2AQu3Hw==
X-Authority-Analysis: v=2.4 cv=SYZi5fRu c=1 sm=1 tr=0 ts=6ad07d96 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=PM9MLdjoRCq9o7e-zGMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150028



On 6/9/2026 6:55 PM, Konrad Dybcio wrote:
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
>> +  clock-output-names:
>> +    maxItems: 1
> 
> This should be deferred to the driver

Sure.

> 
>> +
>> +  pinctrl-0:
>> +    description: Pin configuration for the GP_MN output in the active state.
>> +
>> +  pinctrl-names:
>> +    items:
>> +      - const: active
> 
> I think these 2 are always allowed/defined

Sure, will remove them.

>> +
>> +  assigned-clocks:
>> +    maxItems: 1
>> +    description: Parent clock phandle used to set the input frequency.
>> +
>> +  assigned-clock-rates:
>> +    maxItems: 1
>> +    description: |
>> +      Rate for the parent clock in Hz.
>> +      Supported rates: 19200000, 9600000, 6400000, 4800000.
> 
> Likewise, we could simply set_rate on the GCC clock which is the
> parent of this one, via something like CLK_SET_RATE_PARENT


The GCC clock could be either at 19.2MHz, 9.6MHz, 6.4MHz, or
4.8MHz(consumer/customer use case dependent) and the output clock at
GP_MND can be a range of frequencies(which are not fixed).

    assigned-clock-rates
            |
            v
     bi_tcxo (19.2 MHz)
            |
            v
          CDIV (1, 2, 3, 4)
            |
            |
            v
      gcc_pdm_xo4_clk (CBC)
            |
 	    +----> 19.2 MHz
            +----> 9.6  MHz
            +----> 6.4  MHz
            +----> 4.8  MHz
            |
            v
         PDM GP_MND (Variable frequency range)

I missed one patch where I didn't add the CLK_SET_RATE_PARENT on the
gcc_pdm_xo4_clk and CDIV(additional) modelling.

-- 
Thanks,
Taniya Das

