Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF8E32824B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136670; cv=none; b=a/l1IyFi6F7tkoIp1VvAvDz7lobP9UwW+LKgmrz1nDKgqiwBTusiladLNKzRj3DabV7+MHqsr8MvNN2Ms4fkkBrc45toiH8vyod4kdXltemsRKJXPG+XZ7wzKZ/EiVH9jnR/Vi9lru3gPZiApku85Lz6HE4HMJSJy0x6gF9ApbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136670; c=relaxed/simple;
	bh=3msMrQhv6m1bdBA5H8ZWW2oE2chS9aPy3EzkwaGuRX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W96pKkwtt86rJYrK6sQFiARw7DjOGjJqeP9rB4L0zg4EqqsaoxOCaosm7zWPMA1DTI/rUdV/D+4IpGEniVZDyVHxXd6s2TI6zhGO6t8/Z4wxlLIe6rO34t+Yf9SYaOXGUS04NjwuWvWE7qWs+bKAEm0c029+M9RyXwvhPYKJhqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nWzNW695; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W8eskd6G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nWzNW695";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W8eskd6G"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCjL8R4041010
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7EzS41kG7kgi4E2ZuNT8R4Gi5YfYGMlXLxSCKkeP4Ds=; b=nWzNW695KRi71ZHB
	f38GmdrHvR8vUMx41vtBoEdm1FFBExp74/IEt9kCMDyEo3fznwQeiZ8v2+xOE5DS
	9H8pSbPMCQbpYTLkjAkS1vFK7Ku1af549bnRmcTT4Zm2tWfxbI0GYwwJocRPm681
	ntI9kUWEMo50QF0pDbGCn6x9oN/uaOeI79qEDBQWJ8G4t7vMdywkeGpHz2lFc+V/
	wZDzFGqvmM5bZEBs9U0Vi2aE3fFBqRFYCRc234D60dTa3TEQdV+AAFNz91EIE1MI
	v4nMXfq1pFUuaRqyqgKNrziEwJLTGRe7DeOSf1s8WRNwlpNxoqxEAvn5ywkGlZHl
	6FEUgw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm1k2cakv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:24:27 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c66ec39d8cso61212e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789136667; x=1789741467; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7EzS41kG7kgi4E2ZuNT8R4Gi5YfYGMlXLxSCKkeP4Ds=;
        b=W8eskd6GRMOb4K6v6URtLQf+teCDs1ZmUxYQwwZmxSRdHTvO8JLyVC2jLSO3Rx5hx5
         unkkndTfWT2k24XwHJwksbIKOU0TAk0XqgVAdrVC35rUMkT7H599ua0uvGsJD76q/opZ
         OgiZ/Tt6O1Rg22WcFWOOzhrCZT4WE2SDi3DW9CaENl+XQPtxxVWdc9vjy9cxzEO9iIR7
         MuEP3+g1kC74dsBmZzgz0OuOYa+IsrgMYcAb21oE8ZQmWoR5BpkHdZOiI2yD7OxvL9oC
         L6bvVHZUNDCzGfx1Nh44XWoQuDqKLp64RrPmW1lWitDfahyPPrpcFj78b0362f+lIlaT
         lu9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136667; x=1789741467;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7EzS41kG7kgi4E2ZuNT8R4Gi5YfYGMlXLxSCKkeP4Ds=;
        b=X/QQu5/SyWJ73ODL5bPxtpDcytCHcsp5Cyo53m5OepJ/haF/lh1wZhUdnKuDh9HJL5
         oWyMiVmkIVua3Y6imfSvs3VJSKDMGmMaDLY6ZaP4o3nhT6SFX7AFFpk3NA4IxAKDOMaV
         +JQ+uE7uXViH/y5qMO2atY1knmPfc7oWwVPGd6tMZ+Et7hNsgpNkqS0ONPUPNpdY+laT
         N6nPauvjbSbQ2Se5Dzg/z/fBsEi6PG7f23oOOdLXo3n4u3N+g/j72/k0cG/VRDT8CqYL
         BgHFIzp7EI13+6QHNQTXb/r/SWYwEkmv7+NqLjVig8gJpotGnvz+9eC7JPeRA+OpfCLh
         7+zQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyL9FG/VxgF2u4CLNgg8cmHR4kf1dhCwF5qoYoCEuHg7EZnDXP7/zo8dpwHeaNciG90r4jSCpsHCVffhk=@vger.kernel.org
X-Gm-Message-State: AFuF++nfEmUWJ9d14nlomv5H0LKI9nnoE3x/dkslFOGo2b73R+544QWX
	Xx4wzsFhEfJTipAl8pU1igYw68B354IYU9YC9gArbizNvfcdhNeBdeQcnQX9TzHeNWcC2G3//ga
	hSm0Nz6jPGY9kptNid9bstf6ZBk0Ib7eTR6w8MOGhW8MSn3tSs1qyY1Ip+I3jySMcuX4=
X-Gm-Gg: AYBFou29WYpovs/DlriygUrejX+ugQYKPl5BA5hjKRvWSspvgVswsBu/Qv/IuAum/p8
	IGmONc7jn5e/tbRg7g0qU8aKN9s7Dt/ft/Tk/YCCkF0a9pM0AUFy8XtvOYtxgrQsYK3PUY6lov3
	Tq5oNITNMamSWxD+vlry0d4l++F8FpVQ++nEhaejZI6ZexcWP/0Li84e3yzkDiEQWVtZU7O7a0n
	uRcX20Lwl4W3u98vPbwnBJXaKaeKjYbPtSjiOCQaFU9zVO0rhRNgWJAYTKq8tu6ZUyVfUTtHPIz
	xAam36mWLlv6C/8RwIyEXEvzEFiqsm9suQQNXqQu3lENW310v2QCCM6m601xVF3K+5/JB2wBLuF
	9A8CiHgiLzDXJclvFL9fdog==
X-Received: by 2002:a05:6102:2913:b0:786:d38d:f7c2 with SMTP id ada2fe7eead31-792a6b46388mr1542141137.1.1789136666561;
        Fri, 11 Sep 2026 07:24:26 -0700 (PDT)
X-Received: by 2002:a05:6102:2913:b0:786:d38d:f7c2 with SMTP id ada2fe7eead31-792a6b46388mr1542092137.1.1789136666147;
        Fri, 11 Sep 2026 07:24:26 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966067117sm84047166b.33.2026.09.11.07.24.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 07:24:24 -0700 (PDT)
Message-ID: <38fa7602-f03a-4343-9999-0eda108332e3@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 16:24:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: iris: Skip SCM call for non-SCM PAS backend
To: Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
References: <20260911-video-optee-pas-v1-v1-0-7bbddaaac5ba@kernel.org>
 <20260911-video-optee-pas-v1-v1-2-7bbddaaac5ba@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911-video-optee-pas-v1-v1-2-7bbddaaac5ba@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cM11IVeN c=1 sm=1 tr=0 ts=6aa40f1b cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=ixnSeaJBEYg3FVGQqKgA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: 0DtnMfUoDDBKVhJQo7h0-Am2lkJi6_f0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIwMSBTYWx0ZWRfXxrgeA8/D3TT8
 ImbNbk5+x2LBnj9NmgoG/jRWKRcpNuiRr50batBjNXxmx6efb7o9vUIxyACjY1n0kDuanyvQGm5
 V6NcdBzv654HdU2yeALLTgYHLK04qOk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIwMSBTYWx0ZWRfX8FCkixgkkByb
 RLAVdVI2quIQ3TgBNyiiRTZFhqRe9X4UTJchC/GTSv5+jeXahB3J+tTbx1l0ZUaB34mD0dC84qm
 UnciRl6Oa7u93PJqA3yGICgDogpxIoJ/Mih4QtjZWwr1HLTUKnpPJTa4V7E6A3gNYjkeidKW6Ti
 wFxL1s4IK3Toc9E47EccaoEs/0i+pdHCaB2i9eLxtglFj1YaNioflmQ3WVJkBPnSrPMBI5GytZT
 Y10Ljl0+zJ6wspgu3C5FyqSXotVcATODPJ7bphTxhnZk+OWzI/uLoEcRm3AQZqALMZP8q9tFAne
 qXxgNVIz7vRI0yIOHF7M1PJR9/ak8xgzsPcwJqG/YoODF6eb0JVlOKyt2Qzdl6icWGtIKrd8D3I
 RbM0MOxi/rDKal73PpfxhDT+fZ+n90K0ogDpnyuYJI5EdACWrqQgUTjrEgpSlGkI8MMjjuMTeZ9
 v4fxH9mrQmJGqO4DJ4g==
X-Proofpoint-ORIG-GUID: 0DtnMfUoDDBKVhJQo7h0-Am2lkJi6_f0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110201

On 9/11/26 2:38 PM, Sumit Garg wrote:
> From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> 
> qcom_scm_mem_protect_video_var() is only serviced by the SCM backend;
> with OP-TEE the TEE owns secure memory protection. Use
> qcom_pas_get_backend() to issue the SCM call only for the SCM backend.
> 
> Assisted-by: Copilot:claude-opus-4.8
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
> Co-developed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

[...]

> +	/*
> +	 * qcom_scm_mem_protect_video_var() only applies to the SCM backend;
> +	 * other backends (e.g. OP-TEE) own secure memory protection and do
> +	 * not service this call.

Can you not just stub it out in TF-A then?

Konrad
