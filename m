Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794212982;
	b=UIisv6zsAvPQx3fy5nOip4DbbRUB6ElD+K965c9SUR8zONvm0MR1nAHUN5px5/dnsaee
	 Sft0StWNE/qVFzUV3QIfLye8EhdOr7wMXp4O4CvfN+FpWl054N30ncsG1BPHT8WSzxaim
	 EhOIVbHxM84gxYoR2XzAbHwG51miJQfzgL7o4FoSOHiwIeKBTJbpDiE2sU4/ndnIXmA/I
	 9IFEs89avEh4vrhN1mNtpBxN9lc8xD6nCoA8EuV3wkGIvUL3+g6XIS4cH+QhbWBIRRQiO
	 eAf6TpOtOG8QZvfddFodLH7NyWm+42BrH2A4tc7WrgPCJRU76z2PJ+srSejqDnY0xjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794212982;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=VcAkY3YiPTQFVieeDjubnbkf41BaBANgAAkiKJvWm2w=;
	b=PnhTEpiFiJQjWVAr0CvPKRCLu2hyQkMAzkVgw0I7AdQGzsHUdG+8JPDgAjLy2QyutfZP
	 8N3MjOJFQegq4bDh7xCwMg0LuOmZhDS48qjW3JclVRwv1HVQqCx3QQDbSb4UHQfmrpm+G
	 4rxotNcHlSiuQzYA/zSSYoA2m4Ubl/6g32EtGgBsAj70yJLSRubRqhjpg23n2pb/dLTV/
	 /HHkdZUM1ijGc6VuJOgWmL8RiKy6yWFaQVOBhmKXiQoHph8njJx80FMaUFbOiEsU+54yB
	 KFV9/zlN6DJqA44YMSS8MJM6x1tXFS6Iu3SZWbtW3XoCo5aRUh+Hr134IG7hmIFJFaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jTJK+klQ;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81383606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:29:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81383606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jTJK+klQ
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-35eaf84cc66so719205eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794212982; x=1794817782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VcAkY3YiPTQFVieeDjubnbkf41BaBANgAAkiKJvWm2w=;
        b=jTJK+klQIhwZcI8nXKXUvWnmrsCAo4Bka//lMKtAjLXVZt4CcJWNqH4oLQwMsYdBhz
         FwFK+1N5w4rSpvpACsE8/37DB7Dcr98yWVa+oy4xfTJBrp4c00M6FD+YdFcLjwwzv6/p
         V7rayz8PJFjGog0SlI88is62rUbdua/yAPojjuLNkSb/sTE1bUa8wf44GZqz0Yk3S244
         9hNscGHZl3MdY4M/p/HZInXNY1BYK+8/NC8uAueWw4BQs9KBkHishtovO+qx79yBeS3/
         Qxt5upweJANXql6/E6lwtF0+/1maZoRidGHZQklKlzBNb7FbvStlhtlzgvbwJbOcTq5s
         kW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794212982; x=1794817782;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VcAkY3YiPTQFVieeDjubnbkf41BaBANgAAkiKJvWm2w=;
        b=Q9i39A4jutXlBwlw+1OOXe6iEaXoIW/ppNIujRGsrTSC0PJoFcAiZWHLg50o0oh5bn
         c8W4XrQ/xeYPhSSqnLvnpgzAdgv6Xvu8ORcDs1mStPdJ4fC5dUFR9vwsMrDGhU6kIuG3
         9odM201TuuoanxJ5RNdUqxAvDExMj6jHcwsCeroqOmQzjReefXBx5xaXgyoT2L0atS7u
         CavnUE7T/Q0QTy7YNiy0hXXZ1MmF/MAkHxSEMW2Dcl2Ri4ikipO3YsBY+1DuYBi6N5p4
         UeR9fNKqL7bxqUaE2WoEahO70CJE7GduKfpB3cs11a3huWQFADAMn9DmsKH6qeJU/rKO
         FBbg==
X-Forwarded-Encrypted: i=1; AL+hErGcRbMsibSIXqFKtE4lg0xAV2cZycVacf6EW/EE+9l++GrA4NBpzwtlIE2XlDLyzJtY05t+5DW1g6sb6rs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tdjt+X4laU/gE99TQQlOO20tGcHDOZqEz5YrtBFcY9obwX2xt
	w0osG7D1R13H1NswSJvO7L2pvUalFWBtpIV78aeE+HKNAPmAxbXMV63FndQbUHNMuu8=
X-Gm-Gg: AYBFou2U9ZL6kDXBTL0/Flg1Iq6QNmHFBtoPh/LXffZI1OLKDtKykHwnJ3za76g9Fcr
	IGi5bMV22Dv1YSjd62cKBeAGACE9DtEWM//XZWwIjoFV0eWxz9ZgcKUJulXOq0CQ/XYGTEjvhyB
	i3w4XZKVaMN8ZqjuifSD4IewTIZiU0W20W6sj8XwChSq4tBVqNcDPqi7FT1mN7x92pvWFkymJsP
	akNjZz8aKfxHMnL9VDkGpab9I2q5ZOaR4fJAQ3Tf+PfxdhpKkT10Ead58mpGOg4VwtGf0O/s2fc
	Mu6UfAqfSUlb68LQR53kf8FwWhCbcbGsFq8hH+mif0Z5JUHvvAEBSgMd4P9rHIoHBDz+LmREk8Z
	e4uvOML+unQXFadYXnSSyXzjyU6fdNY6/1NiBcuhG4+Nwi9bC4ppBiWFiQRVA++1fOXH0U6h+Ob
	0zccrO9inh/k/pUUrV4rWx5umQe+vuNULB4ct7OywZY28aUoB2C6I/N3CoFWEk0supEorPYdodR
	qYf5+6QH2eUi9PhoaED3+Oy9csLGVJmU/igAdUBneNqGEm8K3BFkSwiWFOqzgAMs5D6j14NzxXj
	dEVnRybu9WPUZ5TG197c66h7I3+yHDuuSQv+c6o=
X-Received: by 2002:a05:6a20:258e:b0:3e2:100b:1043 with SMTP id adf61e73a8af0-3eed3c6c6e1mr3218263637.42.1794207088842;
        Sun, 08 Nov 2026 22:51:28 -0800 (PST)
Received: from [100.125.153.207] ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb9677c58dsm1220517a12.3.2026.11.08.22.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 22:51:28 -0800 (PST)
Message-ID: <ce196fb6-87cb-486a-a465-ccd0ea2ce343@gmail.com>
Date: Mon, 9 Nov 2026 14:51:22 +0800
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
From: Jinjie Ruan <ruanjinjie01@gmail.com>
Subject: Re: [PATCH] arm_mpam: resctrl: Leave CDP off when there are too few
 PARTIDs
To: Ben Horgan <ben.horgan@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>,
 james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 tan.shaopeng@jp.fujitsu.com, jic23@kernel.org, zengheng4@huawei.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261031025257.1540228-1-ruanjinjie@huawei.com>
 <750c9d05-94f8-4936-a824-5ccbed1d13ed@huawei.com>
 <fd20a317-1f3c-43bf-b629-587877cf9503@arm.com>
Content-Language: en-US
In-Reply-To: <fd20a317-1f3c-43bf-b629-587877cf9503@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/11/6 19:34, Ben Horgan 写道:
> Hi Jinjie,
> 

Hi Ben,

> On 06/11/2026 08:35, Jinjie Ruan wrote:
>> Hi Ben,
>>
>> Is this modification okay?
> 
> Yes it's ok but there is more we can do here. Sashiko has raised a bug that points out we don't take
> into account whether or not a resource is cdp_capable or not [1].
> 
> This leads to an additional check along the lines of:
> 
> if (enable && (!the_res.alloc_capable || !the_res.cdp_capable))
>      return -EINVAL;

Ok, I will fix it together.

> 
> On a process note, it would helpful to me for reviewing and later on when collecting the patches
> together if you could put related patches together in a series. In the case of this patch it it is
> solving a cdp related problem, as is your patch "arm_mpam: resctrl: Limit num_rmids to the CLOSIDs
> in use". fs/resctrl patches though should be kept separately unless there is a particular reason why
> they should be in a series with MPAM patches, e.g. new resctrl_arch_ helpers and such like.

OK, I will send them in a patch set for the mpam cdp patches.

Best Regards,
Jinjie

> 
> [1] https://sashiko.dev/#/bug/linux-05c19551-0bba-4a06-aa2c-3c90fab5853d
> 
> Thanks,
> 
> Ben
> 
>>
>> 在 2026/10/31 10:52, Jinjie Ruan 写道:
>>> Enabling CDP requires at least 2 PARTIDs. If there are too few PARTIDs,
>>> resctrl_arch_set_cdp_enabled() returns -EINVAL, but only after it has
>>> recorded CDP as enabled, halved the monitor count and turned off the
>>> mbw_max MBA control. resctrl then believes CDP is off, which leaves the
>>> two sides out of step and the halved monitor count and the missing MBA
>>> control are not undone.
>>>
>>> Check the PARTID limit before anything is changed so a failed enable has
>>> no effect.
>>>
>>> Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>> ---
>>> RFC v2 -> v1:
>>> - Check mpam_partid_max ahead and The partid_d/partid_i determination
>>>    remains in place.
>>> - Update the commit message as Ben suggested.
>>> ---
>>>   drivers/resctrl/mpam_resctrl.c | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>>> index 5468367776e2..aa3b3a093857 100644
>>> --- a/drivers/resctrl/mpam_resctrl.c
>>> +++ b/drivers/resctrl/mpam_resctrl.c
>>> @@ -210,6 +210,9 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
>>>   	if (enable)
>>>   		pr_warn("CDP is an expert feature and may cause MPAM to malfunction.\n");
>>>   
>>> +	if (enable && mpam_partid_max < 1)
>>> +		return -EINVAL;
>>> +
>>>   	/*
>>>   	 * resctrl_arch_set_cdp_enabled() is only called with enable set to
>>>   	 * false on error and unmount.
>>> @@ -239,9 +242,6 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
>>>   		mpam_resctrl_controls[RDT_RESOURCE_MBA].resctrl_res.alloc_capable = true;
>>>   
>>>   	if (enable) {
>>> -		if (mpam_partid_max < 1)
>>> -			return -EINVAL;
>>> -
>>>   		partid_d = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_DATA);
>>>   		partid_i = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_CODE);
>>>   	}
>>
> 

