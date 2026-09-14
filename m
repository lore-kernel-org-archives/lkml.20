Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064C3457E47
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388862; cv=none; b=rNOY5zI+u8ikIMUncgbK0oYu5veldRNMQb4MNDNtKsIsj1C+jQMnoBLxRYBMGaztgHBvKeoImrt6uIIUbJdJ9k8U5AmAnr9t3yk3oxe6nlMoZi7vvSFwI/2wPQQyEm//8yfV3ApGbrcSKpeBCBK7TPxDOwiv/XgTcO06xCocy6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388862; c=relaxed/simple;
	bh=KsCEks0czQ3KTn9/c2CQL91GTdL3uRkDvEd+0HAl1uM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UlsLm326fmHYm2dLtiIuPF8O7KqtnvHNgGp+ADVrb1tsPIkO6qezz8OvgLXovuV/xwPEUVdO7qjaO9QccQvwzJg7h5mbseuMPKxGG6n9qxbbpfUBe35wo2PDr3KisQXLWD/Vjqv0AUMzmVpahu7gZZByseyXSDTKb3fGa3n0hmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mecwkzyo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GZccO4Td; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mecwkzyo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GZccO4Td"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm2Rs901967
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u3goAOXXvK1XlNCabwFzEFSXrwsh7ycvSFuTFsYFLFQ=; b=mecwkzyoxz+wYDMk
	ghZM3KSrDi1ge0ZRR+sWxAS0CHTlDPUlqbdkz1nnS08qQlwGkIidKdOhabo7VKuN
	gF3YGjn/hc7wn+BKlr42gZvKAp/PU0T40bjodMnZr8hRzhj+UTfvwFGvmqNHVYok
	kTQCO6EqU+w1OCx6V6fktYWdcY9DIQSMK9sXnBSS1Ar0vymuYDQWRkKqN5fCvven
	t7HdgdYmqEB0Rsd3SnYt+wA9/aKtQuXe9L/BXWzmIVJlYcvt7XZ9NQzeyTuYUVdc
	+3qOPiSZi4549xJVLdlurVO1ZDJz4NcCv+EX934QzIZ+Aj0r+utSjz1vUhOruqtj
	w2yQXw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevru5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:27:39 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c84b0a43efso105210e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388859; x=1789993659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u3goAOXXvK1XlNCabwFzEFSXrwsh7ycvSFuTFsYFLFQ=;
        b=GZccO4TdV0qxZRa5yR5UAQcXVFD8W1SQgIDv8QvTbtwrrR/MqPkatytWnRqMAqKDvU
         vlt3+P4df6vV+EKLoAROaRmIC9zp+k5IEZdJUuZjUtFAYrPejDpphw8Lc3vD/t1mYPpD
         TlI0hCpyOVHBoJFwg8ZvLLwdZkwNy41qUOiQakAg1pqvD5P9zFaviM8/ABKVNxx30itO
         bqdjPk39iGDeRXWW8SF7nMQu9hxDcS+uuSrxsqlutx678ZS2Cc9vCXqZhf39ELaYgjY5
         zYCB3lNapeq6AYLClXQrEddqgy6UgW4XmQ8MTPWRUqCgJc/xPqYbT+YD6pa/jFAoEJbU
         2vSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388859; x=1789993659;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u3goAOXXvK1XlNCabwFzEFSXrwsh7ycvSFuTFsYFLFQ=;
        b=f7AQ7/0Kp4BE46j8cHG7uoOmAln/7RZr04ZQkt+jKtsNTP4KcJWdrghjmRIslU78Lb
         EmwSbvgMXCelresKWLDGeJHjswWchhfVjGgr+UmCqoTHCGxIbpbka3K7jjNJb8CW8MHY
         LMAzI5jvYAuR3CREoqOCWSImXsaLr9leQl2JR2kheWUt3XqIeRksjRBLX9NC7+LgjQuN
         gc1tSXNQx71lIEComa6kJURoCdSwY5VPD8P3+duh6PbUUmXg+NRhPr40xr+mGoEi9S1l
         Pk4qdVrzILZF09VqVs1qG1WlCykX/LWiASGlSe8JctcMGPkMFWH6JQiLN94DVGwJbC5n
         3j+g==
X-Forwarded-Encrypted: i=1; AKwUvBy+Q/3uuSi0qLpkctxZAeA8UxkRzK2K4k5zWAmtx4nXpfZK9OE518f1F087rMEiG3iweUDDNAAscobV1RA=@vger.kernel.org
X-Gm-Message-State: AFuF++kqAMag7etmvSnF4Jb+96t7vWqgzYeV4t/6WeHhYQpbty9oO1rx
	1nBD4YIOKPZpVJz99nuGLlNVxVFzoPm8pOLVBEnPiGWay41fVzMaMCA33aX3mlOAP71C4mTk77B
	SzdzBoh5BnYE4k9ttm2AMVIiT+qeXg6CVEoNTfWtDt/sMgrO2w2pK2bGWeFzz/hmOWWc=
X-Gm-Gg: AYBFou3UuznNSlWWcwpDFP3mpPclShH+kF2F0DNNDOllrNsagE4KLay4csjxNWc2Kve
	Lz40Q0MMbcDCsvgF5lwu8LLXzCJmvByhOsLade+uLU/49FEmOor5xHBtrdDqYZH7od3XMwvmRqx
	FCv77+cyuI8onW/B+TOKWG+7aVInnCPBXOphlQpr2wpiqjC9st3BkMx2Xbi8cUSjS9IB9CQoJwm
	48a8TagLJlqoOx2ANcirNc2VJMyz+8xYe6UUIGcMQLLbmzbi3oXIhKOwEl+SUXDS48k1RlV9Sew
	pGaDf8EmBPNCQV9twIkGKU/DX0CCh4bmiSXWMU8F6/Z3mhp71o4zvONlloJYEFJgVsww9eDxxbz
	4js23YVEnJVIBWOWiOClB+w==
X-Received: by 2002:a05:6102:5792:b0:797:925f:2563 with SMTP id ada2fe7eead31-79b5c8ff6dbmr319138137.2.1789388859157;
        Mon, 14 Sep 2026 05:27:39 -0700 (PDT)
X-Received: by 2002:a05:6102:5792:b0:797:925f:2563 with SMTP id ada2fe7eead31-79b5c8ff6dbmr319131137.2.1789388858588;
        Mon, 14 Sep 2026 05:27:38 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a047aa12sm2432030e87.74.2026.09.14.05.27.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:27:37 -0700 (PDT)
Message-ID: <1b4860df-8c5f-4ba2-bcac-6ebca94a664a@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:27:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/31] arm64: dts: qcom: monaco: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-22-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-22-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rQuLbw0u6qSw35XHADSBvjyr8nxRZ6DJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX87yuo4tym4c3
 hOZIMQzhw+t1sBBhFI0vOKYt8qPOdQvgfCed/pScmv9A6QUZPSdAke4FceKvLZTRX6WhfOilMr/
 aoP43V1HRl4Flv6obJZIZu3UuS0QJ6A=
X-Proofpoint-GUID: rQuLbw0u6qSw35XHADSBvjyr8nxRZ6DJ
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7e83b cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfXxGDHZC7o+a0f
 nHsv2IWHxoefheff0Uk6iJXgYtX+YkmD2Uh/4fkHqOAiJPokLVcqaihX06zKjui4WdyPAB83+pq
 GsLbCd/nxZAT1fJYpfUwSzGuWDa20PMv1dXZwb+lD71lbWqiMUSfcmYrDMywzJQlo0px5y0dSsy
 3Bhrp7i5jjLXx6gAQoeeUWoa9i8X2Z4yHAqTh/2N4rF650N/LA7he6lcSsd3f4117KEYZTGW8dp
 pvxu/kCZx7vO9517uRKvuhW9btq7NRASrE4NEW9gK8NeRsa+ro8r0zYb5lK/yzcapjYqjbc/Od3
 /83NoibfMt/FlAHqZUolZ4xVCiTnVuGKkUZ8bYGV19jHyLngbrt1B96FVlPv/U+iEE/qCYMKvYV
 YSJ7LrbmpSA4kR8jVD2wDy6NdITyfZUEzelyqeR+girzsL73BKZqBh7bm+t8DzRwgmdA05ujL4q
 NVis8jvX5OHmJ7taS7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140177

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

[...]

>  			gold_cluster_sleep: cluster-sleep-1 {
>  				compatible = "domain-idle-state";
> +				idle-state-name = "l3-pc";
>  				arm,psci-suspend-param = <0x41000044>;
>  				entry-latency-us = <2752>;
>  				exit-latency-us = <3048>;
>  				min-residency-us = <6118>;
>  			};
>  
> -			system_sleep: domain-sleep {
> +			cluster_sleep_apss_rsc_pc: domain-sleep {

This is really a system-level state and any overloading of the name
'cluster' is only confusing here

Konrad
