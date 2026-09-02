Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6F5317163
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788338121; cv=none; b=sKzoZqaRi2gzQ255UbMmwBrP4a9Uic+bFCg6jylkIfcb96TkeHXwQ+fI3S8nigF+4DmNcsJfAUC08x199YoQWB+sFn3euPhd6gGGK1HSHopxpJ/eD51utvVf0oSoTQTPA2Q5E20CYeQTJjcq0EnOq7yCpeWNWn/OFcdJd5i5LCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788338121; c=relaxed/simple;
	bh=Pz/sJGmoIoI9tEXg2ywinZR81PjoZtbAQpa34T2PdUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iPUn/nsW78nxE8S/RWYl/OC6tjBTCLRQi0OVJ1JLq/NNNCR8dtM68ukrHHoF91UawQVrwKIyMj9LTBinjNhsK1hT7yB07/Rzl4Z9BPgb88lg+cV3OlvOejfumQ9JBGme9lsbM+qrht6b3T3MtKcgmsdz3JjHdoICDldFfC8iubA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y5J5G6Uj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NkXWddSs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y5J5G6Uj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NkXWddSs"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826VlCB205043
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 08:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uqh7w91txZTQYrpWUrn/NFHyUOyhPOiuy/kbhGuZ5eE=; b=Y5J5G6Uj49qg8dCS
	OL12tnKb7BByLHCnzkaw54zOLjwmqimeJ1CL/WZoZRJsUDk/0CDPPFunhfN/YUjM
	OsU4LafWAJD9gQB/PySzrllEnvoK9qEHX7mfMBb0HueEGW8+lO/b7mBVHtcnn+xw
	7NO9aQzgqLc2YzFWA4pCun6TymPalUZtTmTD+4CYnH/IW4oZEyt8lD5TKkPWB1+d
	UvFQ0s4llECibPUvI23DYRrIYNE5Y2aylU1Ys2IKWPZrCA9MfwHxhsAg2LpKVRhz
	3kZF+VWU8BWYy0vprpGEQHG1NmZpySWO4guILYHXrfe9/+D1TgFGYxxdPSnxhmO/
	MLbp4A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge1wpbfup-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:35:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-395543dc382so1171567a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788338118; x=1788942918; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uqh7w91txZTQYrpWUrn/NFHyUOyhPOiuy/kbhGuZ5eE=;
        b=NkXWddSsLNsJcDIUak+QzUC2ZAgG4aHFxb7qqc+gCfqhRFjCca7EWbv5gsL/dtEGZn
         emqhPMbo0XyVjz4d+vqwCDKb3VPm1EXeDgNRMToTcSFbIV2qAFULjE7eLi4GfDUizRMU
         eMpPPucXhRtiGwQ+AGaQIONwtBd5rsv6rPqSK2YzOAzmHglIyBrMPCkrbfesUkbJvX5U
         TmK+Q/Pv2tpiW7fiwN7SfC+RLkh0i9FXYik4i8FLLa4EHpsyA9OvvuxrFxMOaEm1RZmh
         BfZLizFZVeaLGEjW/jEI9gHWkvlcMAiB/KkUzSFJ8eewTMD1FVRbwdtpA6jw342XTRrI
         L9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338118; x=1788942918;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uqh7w91txZTQYrpWUrn/NFHyUOyhPOiuy/kbhGuZ5eE=;
        b=cTDR4I2rPAllFPyvv3Lai/0lbIyrZERHGgEMVa58Kzed/atWGBRvi/aZq3pQLl3rUc
         s3FDi8d4lYfXkTyO2ZHaO4ow98HYxjARLV1sdg7m+/WRowhyVxxfYjXQrbYV/MCYWzil
         PBFGfErp63s41pdO1emGg2TH9zAr/PVU0kkqFOdsKD9flZSguGnzD6yycsWUtsy7x1pl
         jsNRjtKEr6MptgmSBm2ViiGxNbU4tTe4wndAhncV3ymrs38rDRcCvm8/NXT3su/wWWy2
         BEyqVFZri0h5BcEQgwQ2Cw8y9OcWgEVa6zng3TdflpZww3PUrkP3qLqS6feBT2VzjMK1
         P8Pg==
X-Forwarded-Encrypted: i=1; AKwUvByNGzpeWMli0WtromzcJNycTphthafYE3DgxKzja1j7Bl+M/SZk/6/QIZyIwqXnQXeXJSA/jURWiqdOFyU=@vger.kernel.org
X-Gm-Message-State: AFuF++l5kKhoPCSeu88viaW79/zhQkG6iYjMu+iIjUtFETq3ZakAdJGC
	N/mSffvaKJjGeUGccjHdi+lpZa9IZfuIr88gvTiS1fRP5qUA7sZHJAYSq1IQRzjYwEZE+PyFJyt
	KY09K7T6e+izJ4dlaPWyTvxz49IGbVVV6ioqwUWtljeOXYl2oa+9nQcjxxmOZpt6gPOI=
X-Gm-Gg: AYBFou20rsAujvt5+e5wNHbbktFL8dz6ToYanQFIvzm9FLVpvp9G2GmuBZgy9+RsulM
	kHgyPCkQT1THx7ggU/A9coVYQ7H9pPULu6RHCKO0EaZaSbdIx3YUzuWerSPANDFXjmvjiUAFlV+
	AmpxNwu4RG3IEArU1MXoTsHjVpCKBFzETmjtc3U8wJxGeBR/xr7LjM0/iPtnkdVc7ysmLLPJn+z
	QxqxwLmu5dHA43xUJ4MKOVEpRzNU6gDaBmZYkx/bWy8L8S1AwptYczJnhdX1sdyt02vwe2K5sFF
	RnEOb15VznOVMxrz73aXEBTZQ0F40LFLopMuj4plopBlpHakZpYZBbf2QTEJSo8X7Eg3a2jZcYA
	48Zbipr1fcpYUQT+y++Fm
X-Received: by 2002:a17:90b:164d:b0:398:c16e:69d3 with SMTP id 98e67ed59e1d1-39aedeb9aecmr4837758a91.1.1788338118509;
        Wed, 02 Sep 2026 01:35:18 -0700 (PDT)
X-Received: by 2002:a17:90b:164d:b0:398:c16e:69d3 with SMTP id 98e67ed59e1d1-39aedeb9aecmr4837690a91.1.1788338118013;
        Wed, 02 Sep 2026 01:35:18 -0700 (PDT)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae0f2a315sm5013948a91.8.2026.09.02.01.35.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 01:35:17 -0700 (PDT)
Message-ID: <28d5c8bf-87b1-4172-94a8-0e1b7ba1f083@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 16:35:11 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: fix trace ID search skipping pass-through NoC
 devices
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Richard Cheng <icheng@nvidia.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260817-fix-trace-id-assign-issue-v1-1-b2164e33f9fa@oss.qualcomm.com>
 <20260902082209.GT8904@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260902082209.GT8904@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F8JnsKhN c=1 sm=1 tr=0 ts=6a97dfc7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=e4JKUqTIyT31dI7uBdsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: RBbN4OOfYDud5uCiUeoBjp9C_tQcy-0w
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3NSBTYWx0ZWRfX5emwnqLQ4HWO
 a5VfhJGFNFKr+CH3znJx0LMIQkmxQPGIgd1+V2yTYuHJbF1TBYtS5CEKVw/1CcSV7Tet/4s8SsV
 vH80wrV7pnqUxn3xbylEFyO7ssIACC0=
X-Proofpoint-ORIG-GUID: RBbN4OOfYDud5uCiUeoBjp9C_tQcy-0w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3NSBTYWx0ZWRfX0zwamMECe+Qs
 cqQ9bW/APRAQF2Ys+BejL/hSa+cjUHWBRDWs5b8SM2oagWljEaKtDEIDm1Ob7Do6SMNzq2SUOLi
 zcM10fRqaKZUrTMgPAY7Uz7ElK1+mZtgAVxJS8dPMbmk0+T5JfsRy64mT11IwRYcxegeGgW8IL8
 nT0gaK84S+8RTMvMkUbMnboR37hTnjaak5FhGxYa+jf2D62TquUm4rKwFlRcZS2m64mUhvpI76F
 UrOkwBjqPQTahmhcvUl9aJyahpI5dnsdm0KHFXAQFXlM0hHFyuyWN8M3NsGJVOfpY2ScdBfIv4o
 W617p5pyty8Sa7/XNXarnACgWoSG8GBjkt3QqDDWAiNsafD+o61AYutXTSdIzbZXknLBULIncB6
 EBHW1gHatu3YJJ3KL1vd4Y6z5i5eEJmQmOii/xgUq1JXwnhmLcaJwC/1nHKqmue+ORjffq/dTri
 m0nVnXWk/Yd5yzeaQ+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020075



On 9/2/2026 4:22 PM, Leo Yan wrote:
> Hi Jie,
> 
> On Mon, Aug 17, 2026 at 04:50:15PM +0800, Jie Gan wrote:
> 
> [...]
> 
>> @@ -953,8 +953,12 @@ int coresight_path_assign_trace_id(struct coresight_path *path,
>>   		/* Assign a trace ID to the path for the first device that wants to do it */
>>   		trace_id = coresight_get_trace_id(nd->csdev, mode, sink);
>>   
>> -		/* 0 means the device has no ID assignment, so keep searching */
>> -		if (trace_id == 0)
>> +		/*
>> +		 * 0 means the device has no ID assignment, and -EOPNOTSUPP
>> +		 * means the device explicitly declines to assign one (e.g. a
>> +		 * pass-through NoC) - in both cases keep searching downstream.
>> +		 */
>> +		if (trace_id == 0 || trace_id == -EOPNOTSUPP)
>>   			continue;
> 
> Based on IS_VALID_CS_TRACE_ID(), I see 0 is for no ID assignment,
> could you improve a bit tnoc.c instead?
> 
> If so, We don't need to add a new error for the same purpose.
> 

Hi Leo,

Thanks for the suggestion.

I will fix this in the TNOC driver. I agree that there is no need to use 
additional error codes to report the failure.

I will post the new fix patch after below patch[1] to be applied to 
avoid conflict.

[1] 
https://lore.kernel.org/all/20260710-fix-tracenoc-probe-issue-v6-2-41eb36fef8d9@oss.qualcomm.com/

Thanks,
Jie

> ---8<---
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
> index 9e8de4323d28..bf221c1e5c48 100644
> --- a/drivers/hwtracing/coresight/coresight-tnoc.c
> +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
> @@ -51,8 +51,8 @@ static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
>   {
>          u32 val;
> 
> -       /* No valid ATID, simply enable the unit */
> -       if (drvdata->atid == -EOPNOTSUPP) {
> +       /* 0 means no ID assignment, simply enable the unit */
> +       if (!drvdata->atid) {
>                  writel(TRACE_NOC_CTRL_PORTEN, drvdata->base + TRACE_NOC_CTRL);
>                  return;
>          }
> @@ -130,10 +130,8 @@ static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
>   {
>          int atid;
> 
> -       if (!dev_is_amba(drvdata->dev)) {
> -               drvdata->atid = -EOPNOTSUPP;
> +       if (!dev_is_amba(drvdata->dev))
>                  return 0;
> -       }
> 
>          atid = coresight_trace_id_get_system_id();
>          if (atid < 0)

