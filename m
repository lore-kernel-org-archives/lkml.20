Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEDD378D8D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791876845; cv=none; b=fIQ1TLYX5ARloTw7RJ2RiRskw48Oc8z4gZiJm6wYsdGWGpJD6pKlMv1UkZD35zEZBIFukFXEV7I6erGs40XCBaT9RKD9UuN7t+QJGtMhqT3AKwGhM9x6S45jylnAt7UGo/2jBaSBgzyTVUFvQ4pEnNpbXDKY87Iu8ZBTZXjoF0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791876845; c=relaxed/simple;
	bh=6VNgbfurhLYeCD9e85I74wGbMVIVBvFYIQP2eTv9/OQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MWkDE9DWKrTFZBzDx42mKhnnvsEqpsOlN8SaKceYBptKVyzY5FUYqoEHev8yg2VvZWgoh41rSxFEC2sM0p89Yk3k5tf+n3lYROXR90L/LEh6gZzW2YDDJeCqEMeftKAVyVaeEvcH2n4dhOQa1v0vwJRn2HsOgVRaTZA15dDXFSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fW3Xb6Ui; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ITRNUl9J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fW3Xb6Ui";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ITRNUl9J"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D45r8v173254
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:34:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QnAC6pQZmx6ev8l+Wp+rlXv2fKnslv6GIEdOe/wgt2c=; b=fW3Xb6UihFx/p3nu
	2EU+C8tK+z/QiS1kMwZkprRe2oeQ59jH4En/YRLLLEOKjk9ThaCBP9qcQHjNslwo
	AH2hzvaoIaRZ1WymPV/XeuADZGoMgSYJOCcYvNWoU5nJmqO7jgz4ebPKY5FQQU2v
	Ka6r0s5syiTksNSB/AhmqOmcHy1dZnyms3h5Hrb0HwtKStNzhup8zEJUN/jnmX6A
	qEB7hgJqc0DGuid5wqQFRzH++NVHZ3CYGq7thi4eKeuqZE8GoqmBBti8FAEmc1mY
	iVWwAZv59mUtdLpzRqgyoLdYXOrqznHBtXxE0C7KqCK+jzKpkgS0140UlltDSOm8
	QJEh5g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9daqrrxd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:34:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab868fe362so3043806a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791876842; x=1792481642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QnAC6pQZmx6ev8l+Wp+rlXv2fKnslv6GIEdOe/wgt2c=;
        b=ITRNUl9JmbuDLQ6dArFMkG8gsA5jXfaSUdLHg77mCDbqRIIHu7yl2XzlnsoHjWsA3w
         9XQI1kgbjgvJ0+QCddm0owIM0g7B3TjBvCcINFcq+NkBVlgpRR68aX7ZK4tnPY8p2iHy
         OdSEc9BBqcf+1u7+ng+iIu/L5hntR0SOx7u9vRvFFkGrjvshDggaxxmg2japZjx82zwX
         0zku/lzEq2TqhRnDNy56gDdAbvK29BqdVVcaQ0q0DQZQsCBRojPBEMRXcBD1k/Q6pWJd
         QwRPPZymxTXL4q5uXjXlmrhfKYgU5X5YZzGfvo6IHXvVLrQQpmRq0Qd0vjImd4PcLOPj
         dqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791876842; x=1792481642;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QnAC6pQZmx6ev8l+Wp+rlXv2fKnslv6GIEdOe/wgt2c=;
        b=akLWaJrIge4/HD9q7ckPIn6P8Vp70Yd5BQjl+WbT3/LzInJftPa20v6+WJqnJP/AcP
         i6M60/EAuYtjmVR+9YKCmQ/EeLPoaCe50cy21svjj7UQ+pdRkRFPmB8lmWgXFC8Q2NDL
         b/oMCIUtNHSGe64qe83KrEFpMtEWAxOESXRr4HYTM4DU0LWOLIlf+8rMd7xgM4idHAEQ
         Bz5iTAc99BLtQ/mt9vfFP2UlFntJcaNTaFWvT3v7uLVnFtT/CExslfdSdRmDHBCZWr0+
         DerMSKzC/9pHqVOwZ6DIVA1Fm711KNtYM69F3wk3VOY1wXtTWhz7v6UQOpw0KsiG5u6V
         KLtA==
X-Forwarded-Encrypted: i=1; AKwUvBy5k8Juu7kGlM04FCWoE0gjBV+uPImEK4I3LxZaEqtONRS4NDK5WMPIHOnqanh2G3WQkJLM+1jkefcX/ls=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUuDZ9SavG8XB2okC1R65kadIxsJAsQIbPOdFCZMhLFD5ksGgs
	iiqXaAPYiumdfmzjFD0ibQs9PTJbRNs/ZkPYEdMSnFao86uU5eZQADMU6n39emXLwsh8+azZg96
	IbdiquRSPwU8TjB+Vi9lo4sb9uscY0ziLjEXs+bkfd9VdXnu0mAj5ZXWMGzOhmSyxHPc=
X-Gm-Gg: AYBFou0Xu/7Zh5d2diVe5bbN8P6pwV7Iwl4QGI0i7y8Y43BWUcuL18sDAe08c0hRIhd
	UBzEYGG/5pquSXZXzwJJWO0hInqxrBEsPLTrUFxZGUCfgSIg/41vwi4Wj6f7lss9qH/pdR3IOLl
	Hfy3nIXtTmnrNxLIvHAF3dtED3Y84xCk0x5jBlSvRDD1OixmQi0PThqrS60OOm6mEI9622AX8Dg
	diIhoSf6/CY4E8ksrE6rQDBsG7K1+3bxFqfvRX5BLNHb04ae/Opx727ZLL2v4lPmMljY7890tI4
	89ZGncmTZtyba5mdZAkzTXt0z4yu4aeugvRw9HFWO0Dd9UVEs+LC5OrcgrceZl0TBPrm3voJ+Zq
	dBX2fsQOxGKb5+vZy9cJLfO0HnzA=
X-Received: by 2002:a17:90b:4fcb:b0:3a4:bbec:b4b4 with SMTP id 98e67ed59e1d1-3ab3a94c1efmr9124387a91.26.1791876841640;
        Tue, 13 Oct 2026 00:34:01 -0700 (PDT)
X-Received: by 2002:a17:90b:4fcb:b0:3a4:bbec:b4b4 with SMTP id 98e67ed59e1d1-3ab3a94c1efmr9124362a91.26.1791876840939;
        Tue, 13 Oct 2026 00:34:00 -0700 (PDT)
Received: from [10.204.78.62] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab371e2833sm20926517a91.17.2026.10.13.00.33.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 00:34:00 -0700 (PDT)
Message-ID: <0752c7fd-4746-4260-bc24-3e8785bc936f@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 13:03:54 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] drm/msm/dpu: rework layer mixer allocation and
 mode limits
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Xilin Wu <sophon@radxa.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20261008-lm_fixes_final-v4-0-fa986071c3c1@oss.qualcomm.com>
 <ahg4xrildtnicph5ecwknrxqwkct3odcjkfnsc6ehympy6y5mz@ddwmentwnuth>
Content-Language: en-US
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
In-Reply-To: <ahg4xrildtnicph5ecwknrxqwkct3odcjkfnsc6ehympy6y5mz@ddwmentwnuth>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MpYhIVPM0m6vqCuW6Hnyio-bq75wQTm1
X-Authority-Analysis: v=2.4 cv=FZuiV5+6 c=1 sm=1 tr=0 ts=6acddeea cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=z6WxN8cy-vpheZIcWT4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyOSBTYWx0ZWRfX4/Hp0gRKDlTV
 /EKAKP0a3NJtPAZKVwV6FBdMORH47J2bakN7oBE3nlVxTUvIA3HhR9M1xUKRqbDui+BMC8Ng4yj
 GgLb5meAqH//VVYE0E8sul7SdX+Ra8c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyOSBTYWx0ZWRfXz8iZ2KSfXSLk
 2KoB1TIu8HCAkWOXSvCJNzHTjLHLe/IWznNddjutviO2Q5kC5vLomqs11sMLVY1/Pz7L9sv0zSv
 LFXE3fe6IjMcA4EUR0mtNfoVrN1aamFZ95is1oFF3PfmuZHWl9c9Xsz0dXlZ0rSS2AWuww/NcTA
 Bjji7RHzCls4B9AYRO9smS82rDt/FLI9BDyG51Ak16wDsrwy2I6BvmwXIGsXArtbcHzhWaJd6iT
 stqsL91qUeW3SYbA/xhu6IWuIekd+UhGvDgS8BXzMmhJx0ycARDYXsrZXnXzvgBFnJrfxiCte3h
 O2ki/xs4xD4TltKN1irHbpOYqu2A2yLE65FBp9k+32ENbZ9Y1f2cnstUPDUsqvub+IbxidgDbX7
 z/6eH7ACRH7fPNzraKvXDATY9ORtehj6wCRpdeqV0nSk929A0fMRHPU13KnHxq6GADW+O7T9Die
 qsb+72kbJaykwGkCA+w==
X-Proofpoint-ORIG-GUID: MpYhIVPM0m6vqCuW6Hnyio-bq75wQTm1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130029


On 10/12/2026 5:35 PM, Dmitry Baryshkov wrote:
> On Thu, Oct 08, 2026 at 10:53:46PM +0530, Mahadevan P wrote:
>> Currently, the DPU driver bases LM reservation off of the maximum
>> supported width for the layer mixer and an arbitrary MAX_HDISPLAY_SPLIT.
>> However, these limits are not hardware limits meaning that a single LM
>> can support higher resolutions.
>>
>> Switch to basing LM reservation off of PINGPONG and DSC encoder hardware
>> limits.
>>
>> This revision also adds clock-based mixer selection and a source-pipe
>> width guard for mixers without source split.
>>
>> Assisted-by: LLM
>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>> ---
>> Changes in v4:
>> - Rebased on msm-next, resolving conflicts.
>> - Added clock-based mixer selection and reused the helper in mode
>>    validation.
>> - Added a source-pipe width guard for mixers without source split.
>> - Extended the catalog cleanup to newer platforms.
> What was the issue that caused display breakage on the CRD as reported
> by Xilin Wu? How did you fix it?
The v3 change allowed this mode to use one LM because its width fits 
within the PINGPONG limit, without accounting for LM throughput. For the 
reported 3840×2160@120 timing, a single LM requires 1036.8 MHz before 
margin, exceeding the reported 600 MHz MDP clock. v4 adds clock-based LM 
selection, retaining two LMs for this mode and addressing the allocation 
issue.

The separate clock-validation requirement remains: the dual-pipe rate is 
1188 / 2 = 594 MHz, increasing to 623.7 MHz with the 5% inefficiency 
margin specified by the HPG. Xilin’s working test bypassed that check. 
At 600 MHz, there is only about 1% headroom above 594 MHz, so success in 
that configuration does not guarantee reliable operation across other 
workloads, where underruns may still occur. We therefore cannot remove 
the hardware programming guide prescribed 5% margin based on this test 
alone.

Thanks,
Mahadevan

>
>> - Link to v3: https://lore.kernel.org/r/20260112-max-mixer-width-v3-0-f98063ea21f5@oss.qualcomm.com
>>
