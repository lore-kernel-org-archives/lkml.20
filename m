Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BFC33ADBF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789624606; cv=none; b=Pz5wwjRLTFDAZr7N2N8fDpafWyoS1uWq2moVsgVNxS4DaZboPa/nBHn5KmxWm5zqGyMqQ/i1kngCg/iz7M9lldP8lpLOK9N3WN8VKKokaAJt1PoJVyKdbfgsWohlGthslA/dGXbMEKFBaCqnNrDybGG07H1EVSK1Htix/tTkDg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789624606; c=relaxed/simple;
	bh=IRwy3v4RbeEQb7tDTKXoI8cnAJR4oVGR+vCDRpGGxF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ahA0m8HcZ4F5Kaii1tLP/CvFkoiRn8FypW71gnak7CwMaU5mCHcUkD3XGV5MgRdzOeKFS1wA2g9rX/kXqW6HR8A7C5gpMMIpTPWNLEO8tQDjPodwm593RgeR4Ai6KaIrqC7yvX1g6YghoKSE8p0QvMsLQzwojnWPMzLwaIGzTQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MNpbfkV9; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cx3pGQJk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MNpbfkV9";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cx3pGQJk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789624603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a5IexDE5RwVjuRt7QVn2TA0PVUO278ucUqo3lGJjXXA=;
	b=MNpbfkV9rcuZoJyvzbeGrnMwU+4p3svFlwF/SaXuh/x0ofE1rtl7jpF8rhnSu2eO2f5YUZ
	+ioa/vRrGxZ3s11Su7myEwPlwdXl1EiKSDx0qhHWwuJ2fgZIDxldTHwYvE9cXnj1KrVajY
	JhCWVCJmOll1SHE2UYb6AVztIt0JYOc=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-tQEIuf7iO2WD4lqwaJUiLQ-1; Thu, 17 Sep 2026 01:56:36 -0400
X-MC-Unique: tQEIuf7iO2WD4lqwaJUiLQ-1
X-Mimecast-MFC-AGG-ID: tQEIuf7iO2WD4lqwaJUiLQ_1789624591
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-86a6f4ba619so584381b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 22:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789624591; x=1790229391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a5IexDE5RwVjuRt7QVn2TA0PVUO278ucUqo3lGJjXXA=;
        b=Cx3pGQJkdGIa0WKNWPCo9W40OW6agjBtqMbLXozguwAQOZ09O0lmRIyVSdEDlNHL61
         ZM8vYafka1jfEe9RU8lAlpW6X5zs4fhBkFKT+B1r3RWI2buvR7kugGta6SodmOPn+b30
         zgktbNNNPcN5Y41EL1l9jxilkITlDseD+tCcwxICKsVCiLvMxgmKESPFMi0uPwpHCkad
         GjE0DLNr996/spZQUAA+eWZrA4uUhvU2oaW0/JAVafkGhew2plOmrivnz2g0+9i4dHEt
         mgaXsLuqLcnCw4vlkkLzhoZMuriyTFgfbkb64yeUIG2PRP7uDgre8DdBHnpv2I8g16/A
         Nn2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789624591; x=1790229391;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a5IexDE5RwVjuRt7QVn2TA0PVUO278ucUqo3lGJjXXA=;
        b=tGjth647eCWEhFWCgmSMAcAIG2m8UyBBhYlrMHz6JoHT9rMke8mFMZL0dmFZMTgUdI
         U9WsZHGQuK7PVzSf38L6zpZNRSFVlyadJucQ34ALvNBajeLC5/B/Qi8ihRD5+6iASRFj
         EX4/oJ1zZKWUYFT0aPKIoPAICZuk+7UH2WdMUn4Q5cFJAF/qo6HrboBCtILpUNnllt+E
         KlP9/F0zY38E6kg77dOZfjkGnDn5KHzUAuHQsKPbnaE+lsX62rLhhwdNWp82ROzRvOmv
         ZF9p6XGsn47BWpVnesR4Xh1n5IkdyrX09xqtOEVwLUlOiFcO6FN1IpkEvNQeeY/Gc2jQ
         pE2A==
X-Forwarded-Encrypted: i=1; AKwUvBz4e48dZPyxMynD1PsUBZmq6Q1QtwfHJ+MEEmhHHSMFeNngQGV0MnzFe4cWEZ0QaQtAeLw2G3Wu6UPMHpE=@vger.kernel.org
X-Gm-Message-State: AFuF++kiZQpREGbRoscEuXgKSkjTzenwAwdblZDkG/cbFbjE5zbB49tL
	1raw+wYNtocusE7HZLsXh4jwCdinNeE+NGaH3ERXbghcLXLXh2hRi66Zwms/qgLybwb4nL162q8
	3dXysoa1czlnETBvT45WrLnj8AaRo5zMPxl4o/lRSfXB+cZlFZSVQIWl20ug60rGntg==
X-Gm-Gg: AYBFou3YJau5WQpBbe1Q/f5Z76h20iBcMFkF/6ZaeAL7np1T48DpWTAP6b/JQDsctob
	d2UlLj8dQPJilIVi8ZHjM2p/wKKZyXf/fDEnm37sGAD0EtVrwBr5gfz/ytZzZ+XgusWjUPrZ9BF
	C57VKC9FEnpYQ+2P24RxQ1NjAJc/NndtxHm8+hTLi0oNaQOKzHm9pBRkXQmjbdkccN7TjiKR9LG
	ybH4o3Dul8q9/WTQsy3Pf8DQNP28ibgs7pDQhKvwZUU4jGx6FzZgJY+8Q/GjJ7iMIQgXAjpHL9D
	Dcain916pTsrDU4f4jZk/A/bEK2exRTwzVlrjXWhIijioOUoR24PgiCK+HY4kCy8B0dxMGGNI2B
	vyZRQiwNWqnzn3HxaiVgS0AAUIKjG6Qr7GKbBGol1zw==
X-Received: by 2002:a05:6a00:bd0e:b0:845:ba94:a56 with SMTP id d2e1a72fcca58-872372c313emr11817049b3a.5.1789624590918;
        Wed, 16 Sep 2026 22:56:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:bd0e:b0:845:ba94:a56 with SMTP id d2e1a72fcca58-872372c313emr11816999b3a.5.1789624590365;
        Wed, 16 Sep 2026 22:56:30 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-871febde2f7sm2262500b3a.6.2026.09.16.22.56.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 22:56:29 -0700 (PDT)
Message-ID: <dc160a37-5413-4dc0-bda9-ce75c388f665@redhat.com>
Date: Thu, 17 Sep 2026 15:56:24 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: resctrl: Catch and propagate error from
 get_cpu_cacheinfo_id()
To: Andre Przywara <andre.przywara@arm.com>, Ben Horgan <ben.horgan@arm.com>,
 James Morse <james.morse@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Fenghua Yu <fenghuay@nvidia.com>, Tony Luck <tony.luck@intel.com>,
 Dave Martin <Dave.Martin@arm.com>, Yin Li <yin.li@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260902143757.3469690-1-andre.przywara@arm.com>
 <ea42f2a7-f4f7-46ab-a5e0-239c74174499@arm.com>
 <2c682691-3037-4d62-a941-bc41baca35aa@arm.com>
 <4f35abf6-6dac-4c60-9ece-c1af02a98c9c@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <4f35abf6-6dac-4c60-9ece-c1af02a98c9c@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/16/26 11:34 PM, Andre Przywara wrote:
> On 9/16/26 11:49, Ben Horgan wrote:
>> On 07/09/2026 13:59, Ben Horgan wrote:
>>> On 02/09/2026 15:37, Andre Przywara wrote:
>>>> get_cpu_cacheinfo_id() can fail, in which case it returns a negative
>>>> error value.
>>>>
>>>> Check the returned value for this error condition, before passing the
>>>> value on to other code, which would hide the negative number in some high
>>>> value in the unsigned type.
>>>>
>>>> Fixes: 36528c7681b8 ("arm_mpam: resctrl: Add support for 'MB' resource")
>>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>>
>>> This looks good to me. Out of interest what led you to find this?
>>>
>>> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
>>
>> I seem to have been a bit hasty here.
>>
>> Sashiko points out at [1] that 0xFFFFFFFF is the only value we were previously considering invalid
>> and that the value coming from dt or acpi can provid other valid values that would after this patch
>> be considered invalid.
> 
> Fair, and I can easily change the check to only check explicitly for -1.
> 
> But this is somewhat broken already, right? I mean the return type for the existing get_cpu_cacheinfo_id() has always been "int". It looks like this comes from the x86 world, where the cache IDs never get that large? I can have a deeper look, but my gut feeling is that this is practically irrelevant, since we barely see Aff3 at all, not to mention high values of it.
> 

I guess we also can exploit CACHE_ID flag in struct cacheinfo::attributes.
struct cacheinfo::id is valid only when CACHE_ID flag is set. So we would
introduce our own helper as below, where an extra return value to indicate
the (returned) cached ID is valid or not.

In drivers/resctrl/mpam_internal.h:

/* NULL is returned if struct cacheinfo::attributes don't have CACHE_ID set */
static inline bool mpam_cpu_cache_id(int cpu, int level, unsigned int *id)
{
         struct cacheinfo *ci = get_cpu_cacheinfo_level(cpu, level);

         if (!ci)
                 return false;
         
         if (id)
                 *id = ci->id;
         
         return true;
}

Thanks,
Gavin

