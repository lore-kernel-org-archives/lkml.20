Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794887402;
	b=zCip3SgVo9ikmujNQE1hVjfI5MwvoMuUVGJJ8aNVGDU/0Z0fjtrhaaIZj4yWlbUToLxZ
	 SOB6MltIzoEVkYqG8+EYs2mvzLadP7teJLK++rr+vzAuJhyfcoyufUzp0qVdAdxX+1Ucx
	 SAIrNtPfvvKM5yUkTXN5MZd2p6vOD/y8ybm2OqKFZ9Y4kfOTZ9LeZWy8mif+iGJaCo2RJ
	 S45VvYwP1aQ0eMIBQAVVUGhbaLvfE+vRrquAzCMTQHz+ljPJwdPRS0ppk89vzO9G6Ij30
	 Jspf4W0Jl3zLsh+W30o3IBK9Bw/HmTommZilQDVAOtfVfQcyYTQHOO7rhFoQVGy6haA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794887402;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=VjhI9txFfRTko2BSCtlm1pUp3KaQ41pWXwKSOhoN710=;
	b=TDhnVPL/Ye2nc+Nlx0qD6DgXrGI+3WTRu0krQU0ycs4w45YcoBbbmVTUkniQaVVZY/S1
	 3a+BSX4ytWgH6/WML3d/R1ZgGQwfgAD5AlpkiaRbKFMjxr6Y6QcfEzbHzxwCk1Ese1rRY
	 iiljUJoCShy6Wa3+JHHQZAFECwAqB6uuuNUaVHSA4lAkXG7R1Lfj/9zKcdkEuyvvruhB9
	 k8dvhMFkGV0T6/AipxpzdNjTntMZlLHkU5nmudKaZ6k4Wu20KAjbgCyRu5qRlGCuwZczK
	 p9H+pPmrivlTZE+sN+nHTXAuRuLJ9ENaZskDcCKcwM8RmDdZmCYK29cxc6vu/ACWzGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L9qflDvY;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=lKWnOCzl;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E48606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:50:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78E48606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L9qflDvY;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=lKWnOCzl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794887400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VjhI9txFfRTko2BSCtlm1pUp3KaQ41pWXwKSOhoN710=;
	b=L9qflDvYoqsC+GEzWadd+dnqFzmoBOodJA5qmZuzbUKY3rUb7au5RNi4ydF7H3TdDBBPLR
	+d8G18dnfwG/jTNN+OU6HuYBlYHiznGlgmI2QVzluSaWVW74G1vRRn7grRiPXlvUjFjKea
	PyOEsNkDTffWtqS1mT3Y0hf3lgM0E0s=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-03TwfCLaMmqMgh64C3d-9g-1; Mon, 16 Nov 2026 22:49:59 -0500
X-MC-Unique: 03TwfCLaMmqMgh64C3d-9g-1
X-Mimecast-MFC-AGG-ID: 03TwfCLaMmqMgh64C3d-9g_1794887398
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a0522cdaf3so2932710b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794887398; x=1795492198; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VjhI9txFfRTko2BSCtlm1pUp3KaQ41pWXwKSOhoN710=;
        b=lKWnOCzltOzTyi+B8xeT4fz208Yu7Wpr6UEoVGtsahp/MoRpS58E6g1CcL1Ryu7wCJ
         VaD12Ptj5knpDIWos+grkfZfFgA1G8CfGorToQYqyIJZbAf+uyuCS5gMKIcwL5z1g66k
         bsK0O92n6PPtTJhJpa1LOLULz47MXG1S9V/8Km140VqIRYQb2X7yGWw3filOZbf/ylwH
         b0tjGMzuVhjPmSJXtQ1QfPp26sKD030sfhag/k1CtdZlP8XLSvqTfYLqvpohZmD5VTbe
         lCY9vTO28/eD/0pWGNL5vF7f3GGclR/hVNU5emKHZthF7Lt7pVfB8LLjx1pACwerKpO3
         gFWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794887398; x=1795492198;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VjhI9txFfRTko2BSCtlm1pUp3KaQ41pWXwKSOhoN710=;
        b=ZJbrWbACPEwvzaKOQO5/rf9LEjY/bIZhoyeZwHUsc7woF2jOixaUkF4h1HzOt/tBT4
         GOQljYu88fWH4Wz706zwEX2xAX6ff5ckntauhldsZV34Bk7GJUIEJx3//WQOoG6RY930
         icInlnVCVHhuJ1Cemzqgd4jdTaCBxLO8zjDrhLIwGuwa2ucDVix6PGc2BwrbO0VDzMC2
         eRzfnbXPJKIt/COCAs8R2tiYKR75TEwcGLlNpkD+Gh0gb/TdtkFdJ0TMYV9ibCu6Sdq/
         XOyAVQ3UjCdgQ+pL65NF/gOQpwnvgYGKeO7BizkgMUIGrAamnbdGW5kWEfYBhUJNyWOo
         DNMQ==
X-Forwarded-Encrypted: i=1; AL+hErGYWB6KfGerNz3bXuydwfVlglPi7iZVoG2IMFOH9R+8BkEYFWQFYtoaiOT3R6/T6bDyl90p01tRR+2udnI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8v2FMp8xW6XC5Ap2+0SCO7VAvi7IA19Abqd9X8Z/sVY+pCcUO
	MZvuqtnIOo4iPATso4jvAVXYhY1xbs7R4jEQIbrJKxWUeKE37+JKED7Th+J13R8v6U9wuf0GvYS
	7lKaZike2COVib/DBToKNJ/pxpsnTWBUftxmxJrvecYwje/a6uUgQ3ocSdkc9mFbG3Q==
X-Gm-Gg: AYBFou3d0jZx3HOkk5lyG6/ty+hlUToCkpT4nswtWFnOEsud95Dk5t6gXBMCVcD78JB
	ZSZVp4deFXE+xHDGyGTup/fCnySzPrUx8yn/nIFsxI2BuZdpym4eAKZwkN3Rw67QAapZEKmlfWD
	Bjdp8G9A1W4n9ZIndMPuZFjnAWt9k99x0Pv8eJEw6OkgLsdOsAZBc0o6TlMh7mmxCnQAwr5nob7
	jJIQqMps0Ee8KHK+u//G3hYxPNQbVsSihJWZbhLkEQjZq3Fukcs1uwXJhz2a+u7Qd4U6xCxUIwI
	Vqb5FMXBUGFJMiNaZ+SjH8LoMnIqgKmtqVxQcBwgZBOUGTIQfckYXlNIZMsATxyAC9NHoLfgVW5
	lfW9M17knNtcOsejald22mRAG7stAiUfp7sqiakOJj9yZiSa1q0R+ITydqAGx85trvwKhURrhIw
	SXolhk7SMVvucs/Kg=
X-Received: by 2002:a05:6a00:340f:b0:857:7317:cff5 with SMTP id d2e1a72fcca58-8beb6197550mr10516411b3a.22.1794887397487;
        Mon, 16 Nov 2026 19:49:57 -0800 (PST)
X-Received: by 2002:a05:6a00:340f:b0:857:7317:cff5 with SMTP id d2e1a72fcca58-8beb6197550mr10516380b3a.22.1794887396928;
        Mon, 16 Nov 2026 19:49:56 -0800 (PST)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bececcc68csm4430596b3a.8.2026.11.16.19.49.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 19:49:56 -0800 (PST)
Message-ID: <cc2d1a43-d8be-4ed0-ac96-30b326b67280@redhat.com>
Date: Tue, 17 Nov 2026 13:49:48 +1000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm_mpam: resctrl: Only enable CDP on a resource
 that supports it
To: Jinjie Ruan <ruanjinjie@huawei.com>, james.morse@arm.com,
 ben.horgan@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 zengheng4@huawei.com, tan.shaopeng@jp.fujitsu.com, jic23@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261111081316.3828283-1-ruanjinjie@huawei.com>
 <20261111081316.3828283-3-ruanjinjie@huawei.com>
 <a783b375-7c27-4c91-b40e-7e615d33bc5b@redhat.com>
 <b1fd5fa8-bf03-4575-bc05-540a288b609d@huawei.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <b1fd5fa8-bf03-4575-bc05-540a288b609d@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jinjie,

On 11/17/26 1:31 PM, Jinjie Ruan wrote:
> 在 2026/11/13 7:42, Gavin Shan 写道:
>> On 11/11/26 6:13 PM, Jinjie Ruan wrote:
>>> resctrl_arch_set_cdp_enabled() enables CDP for any cache level that is
>>> requested, even one that has no MPAM cache controls. Mounting resctrl
>>> with -o cdpl2 when only L3 can allocate still turns CDP emulation on for
>>> the whole system, so every CLOSID takes two PARTIDs while resctrl keeps
>>> its CLOSID count at the number of PARTIDs. Control groups in the upper
>>> half then map to PARTIDs beyond mpam_partid_max, which index past the
>>> configuration and monitor arrays and program out of range PARTIDs into
>>> the MSCs. On QEMU with 5 PARTIDs the first monitor read after creating
>>> 2 control groups raises MSMONCFG_ID_RANGE for PARTID 5, and MPAM is
>>> disabled.
>>>
>>> Do not enable CDP when a resource cannot allocate or is not CDP capable,
>>> as x86 does, so the mount fails instead. Only the enable path is checked,
>>> since unmount disables CDP on both cache levels to restore the MBA
>>> control.
>>>
>>> A system where only MBA can allocate, or that only has monitors, now
>>> fails a mount with CDP as well: CDP hides the MBA control because
>>> mbw_max is a per-PARTID maximum, leaving nothing for CDP to apply to.
>>>
>>> Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
>>> Link: https://sashiko.dev/#/bug/linux-05c19551-0bba-4a06-
>>> aa2c-3c90fab5853d
>>> Suggested-by: Ben Horgan <ben.horgan@arm.com>
>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>> Cc: <stable@vger.kernel.org> # 7.1+
>>> ---
>>>    drivers/resctrl/mpam_resctrl.c | 4 ++++
>>>    1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/
>>> mpam_resctrl.c
>>> index 573617ba09df..afa3c084c475 100644
>>> --- a/drivers/resctrl/mpam_resctrl.c
>>> +++ b/drivers/resctrl/mpam_resctrl.c
>>> @@ -222,6 +222,10 @@ int resctrl_arch_set_cdp_enabled(enum
>>> resctrl_res_level rid, bool enable)
>>>        if (enable && mpam_partid_max < 1)
>>>            return -EINVAL;
>>>    +    if (enable && (!
>>> mpam_resctrl_controls[rid].resctrl_res.alloc_capable ||
>>> +               !mpam_resctrl_controls[rid].resctrl_res.cdp_capable))
>>> +        return -EINVAL;
>>> +
>>
>> x86 only checks 'cdp_capable', so this check isn't exactly same as to
>> what's
>> done on x86, as claimed in the commit log?
> 
> Sorry, the commit message is somewhat misleading and need updated.
> 
> In my opinion, CDP is a feature related to resource allocation, and it
> is always reasonable to check alloc_capable.

Making sense, with the commit log improved:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> 
> Best regards,
> Jinjie
> 
>>
>> int resctrl_arch_set_cdp_enabled(enum resctrl_res_level l, bool enable)
>> {
>>          struct rdt_hw_resource *hw_res = &rdt_resources_all[l];
>>
>>          if (!hw_res->r_resctrl.cdp_capable)
>>                  return -EINVAL;
>>
>>          :
>> }
>>
>>
>>>        /*
>>>         * resctrl_arch_set_cdp_enabled() is only called with enable set to
>>>         * false on error and unmount.
>>

Thanks,
Gavin

