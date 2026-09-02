Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3CF37881D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 06:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788328809; cv=none; b=LN5bmeZNKAhgpTkrurxsPjhzsAfuQorOKf8NxMCofvloT0ALH4RVof04V+n9Dd8BfPB39KUxuXriqTv4yriCJjo0Jl95m+txx3bq4bZTB1z8XbgWWb7yDSqPR16ZnccViCTI14ZrueFFSO9jDk25yoMkHCopiPrHBWzJRWeTMYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788328809; c=relaxed/simple;
	bh=Pf5cpuIB0u6c3CA0p6vcjPFyvUViZdV0YBNVUWqHCEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aCzbJvbSkLrNC0C4GumckABFbRLnFE1IGvcUeCJLrL0EVLUrJ+latef1TIWdk8k6hfulzmEVVEigdw1ws3wGO0ctzARC33vaTOBYeaufWS+LF1OeX1PQqocvULVE4RQ8JxVNS4lq1oqDzpzEzHhbsEGw6tJLN/O4dJuUUF7KFuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XhEs8iK+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NWg6ry7d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XhEs8iK+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NWg6ry7d"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6825YRAL015265
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 06:00:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SfEMvjkhdcJKnNVbGfwBeQDZU9T5YnWpt4uzfWzHLWU=; b=XhEs8iK+re31Euro
	SUs0TpWerwjDpmvXk7ZiOvEMayAIzQJOPWSxMt8i/0cKuleKojZaxHMrNTul1jPO
	b0CBxSanoTDi3Ff0CWiMdk7RI1/pMrUrh30aGAGf50kdGY0hcxrum1DRdTjFNJLm
	VQqhu/PGmevn0JB7rO5trUivKJtTt3CEla01952rJ0cuTheTXhQa7tqf9ZT0a6WG
	zPnqq+kNIp4EGv+JLNXAa0eh4ngY1Wap+MbdImhoQblVNAVMEVWEx+MYuCdy4C0J
	LTp4EhCQgYMZ9KIcZI3INiP8nxruA5MdeFjOH8lj58f+sIdZIa4ACEerWkfXPVjh
	SoGcJg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge397ack1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 06:00:06 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so838352a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 23:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788328806; x=1788933606; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SfEMvjkhdcJKnNVbGfwBeQDZU9T5YnWpt4uzfWzHLWU=;
        b=NWg6ry7d0slvOc0Gdy2Cm7IABQDazO6VKgY02oQlE9/ZYxypeaxo6kIeUporZt8Zln
         6x26x+wQ32SqSuC1KcaU07bWNaZoQXzfJ/PrNDXy6+v8f4BYd4mA/mOIOhnM4Ubh0k73
         vT+YeifkYzYguHxeCMyy6IaMmIaJayBOhjYkle+EzRx7F4O14JoImNWQz6jjsKxKftGX
         qeJdPJWza7YrHKN0cnrruJcSHaR1DBCfSkKdvdUdhHqND4p7wxBew0wpn0xdSmEJE3Qn
         ZmUTCWomPYBQTmtiOzn0V6e4Ud42lNSyLKuzQpd8UIbARGDXAT36zHZlvjcw3IYh51xY
         Ffkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788328806; x=1788933606;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SfEMvjkhdcJKnNVbGfwBeQDZU9T5YnWpt4uzfWzHLWU=;
        b=FMIFcCwMqwybEukmS6R0BJaRk5M4oQ178tGE7qG0T/F4ofIs2Ext8ON0m7zeISpZw5
         L3tA660BTHaoeI52y28YnHwLzGWZwxmhV/tZN8M6857ObQRgpoE+pk3DCHDNfhBBBdpv
         Y4kqOM+0hF0eABmS21+uTaUqdFKdWU0L1m12YCOFlmtYIGuGq0E0WfCmkoNvBwaFW1bM
         oAYYvSDsffYbzveqjRVpedXrH2/5/rDu8TKWJdGbHonC2DsPojG9ITK53iYTvFUiZCPU
         W61p5SlF2NzyzP/HUdQc/uurZQzA5ptT+XRyU4OgXnqUI65BQoB16z3j4u0ymxOLjix9
         NOxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsb1mt/9VRVRkSSPuZHj+ctpVqExfPpK3OD4hDklONRcc/OCa7NbzzNU4YeolaREdoYwA0w7yjg1xwnos=@vger.kernel.org
X-Gm-Message-State: AFuF++mmYW6LAmlcbmFf3rDKxvoj0MDdbRPbyrzpHQFdteCx5DH7GM77
	KJVoHy9ocHVMKuQ+vQaoyrfJ7ZgO5PbcDZqNbvp8zf/OTEXhte5vT8cnR9SM8IUfna8QMMSPdJP
	WYaM0NVHWMuNhbHgm9ZK+cBA1zs+66dtnCESGS5v1p6N7Z6E+SIV57XtQF0wlW7wk/Lk=
X-Gm-Gg: AYBFou2evsATyJxaW56YATG/rBPJ/wNOzXZReusIPIXjNhT15qtDU0h78shWWKAIyh7
	seypysPAQG4KNtZtrrfFFLmeRo5yqtXPq6XChZQF7ms7aMqUcJbfeCw6HS54unptlFDapt1MY43
	Td5xvjfU7rVMa1V5g56BSZpueal+aG/4tE0y5AHK3GwbxvbjVnxngo5PEBrpIzuSmK4nM48ZYDq
	3LLn/Eof9/8FCGsuAg2X/OavoQ4BInMl1q1ni8f+D4tsxNKEmjLIbNSph0o04M86Eh7JCaIyeA9
	RG3/h7YJzHq1UI0p/UMp3v5MziNLLjHDaZyY2tpTKGZ3CcHt7ZNaorESWlEkIBCHrxV0KK2+O1v
	D9cDyD6XQ8SCtvrqcL1Oz
X-Received: by 2002:a17:90b:4c41:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-39aedfb9a24mr2873946a91.10.1788328805552;
        Tue, 01 Sep 2026 23:00:05 -0700 (PDT)
X-Received: by 2002:a17:90b:4c41:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-39aedfb9a24mr2873886a91.10.1788328804870;
        Tue, 01 Sep 2026 23:00:04 -0700 (PDT)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae0f2a315sm3878760a91.8.2026.09.01.23.00.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 23:00:04 -0700 (PDT)
Message-ID: <1b5ac53d-61f5-4623-aac0-3640851a3133@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 14:00:00 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: fix trace ID search skipping pass-through NoC
 devices
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Richard Cheng <icheng@nvidia.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260817-fix-trace-id-assign-issue-v1-1-b2164e33f9fa@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260817-fix-trace-id-assign-issue-v1-1-b2164e33f9fa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA1MSBTYWx0ZWRfX7XKAm5HWPIZ7
 qoHi/W44GYegAPW3oWqf6uC1KIwUpKz/axxUAEAfLCnG0/09Cm2kmGdXBp6yLoJPpU+wRb+CdSd
 1+1XpMrw0e+GQNuX7j+livFNlL3Xwdcaa91tyta43p/BzTwCCzymcfWUIhTgyCdJ9y/eH4QoRcH
 ruZ4M9Fdt519wh8xoDU/Gm+bVzRnNtI/NTQ+8oAqjsG/m0xYcBQogGB7g0BJN2lvJwXqoRqTjLy
 SNVWxn+/UgEBk6KWLMJFXrMgSJeJAFsGpKLysTMu+uFiyi9Y7O4Px2MQVKYk1NoMirK56SsVXRs
 egbAaLaxLsWwj2Og8iTCsWJUZCRWALH2mcMq9vpCtFEtwlbmSL28jx9KJyJFaqCsr4aY4gvCXIM
 BJjwgKJhgvjsYTsICHh6In4fLnlOWU/ZqeBj1DchmJW8Ua8dzWSFnZoGsqG/oY5afz1WjxyLjlx
 IphtTZcUKPXEMBPWMoA==
X-Proofpoint-GUID: z8dl6Yk4KJGpoxacGh2pPNTj7szOpZOZ
X-Proofpoint-ORIG-GUID: z8dl6Yk4KJGpoxacGh2pPNTj7szOpZOZ
X-Authority-Analysis: v=2.4 cv=Re6gzVtv c=1 sm=1 tr=0 ts=6a97bb66 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=1rTBPEPs6ENoEJvntSoA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA1MSBTYWx0ZWRfX1yHopdgbg8ZF
 HUxiLNPfJktvweyUh/b+w+X6A2GPEnfO9tqQUG6haDAnN0SjYY22WjB2127ZPrGtM3Vn4VFZ1+G
 HTCgXg5VB8dnwcx0KTweXqZytDHyxDY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020051



On 8/17/2026 4:50 PM, Jie Gan wrote:
> coresight_path_assign_trace_id() only treats a trace_id of 0 as "this
> device has no ID assignment, keep searching downstream". Pass-through
> NoC links such as itnoc (qcom,coresight-itnoc) intentionally return
> -EOPNOTSUPP from their .trace_id callback since they have no ATID
> register to program, but that negative value falls through to the
> IS_VALID_CS_TRACE_ID() check and is rejected, aborting the whole path
> with -EINVAL before the real trace ID owner further downstream is
> ever reached.
> 

Gentle reminder

> This breaks enabling any source whose path traverses an itnoc, e.g.
> writing 1 to tpdm/enable_source for a TPDM fails with:
> 
>    sh: write error: Invalid argument
> 
> Skip devices that return -EOPNOTSUPP the same way as devices that
> return 0, so the search continues to the next device on the path.
> 
> Fixes: f4526ffee6ff ("coresight: fix missing error code when trace ID is invalid")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 6d65c43d574f..949ee9f00097 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -953,8 +953,12 @@ int coresight_path_assign_trace_id(struct coresight_path *path,
>   		/* Assign a trace ID to the path for the first device that wants to do it */
>   		trace_id = coresight_get_trace_id(nd->csdev, mode, sink);
>   
> -		/* 0 means the device has no ID assignment, so keep searching */
> -		if (trace_id == 0)
> +		/*
> +		 * 0 means the device has no ID assignment, and -EOPNOTSUPP
> +		 * means the device explicitly declines to assign one (e.g. a
> +		 * pass-through NoC) - in both cases keep searching downstream.
> +		 */
> +		if (trace_id == 0 || trace_id == -EOPNOTSUPP)
>   			continue;
>   
>   		if (!IS_VALID_CS_TRACE_ID(trace_id))
> 
> ---
> base-commit: 4477a78374a57c3809b172ad30cceabda48c47c6
> change-id: 20260817-fix-trace-id-assign-issue-d269e90d1c62
> 
> Best regards,

