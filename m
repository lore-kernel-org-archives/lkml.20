Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF77E4EBAF4
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789557864; cv=none; b=jsZKV3vpk+Dvji1Li0ZdGNCuJ5IFBmqpCkRE+4k6PP5MWTONsHNB2H3jqdTH8bISVxC3oUAGbYydSC3wMSz5LSjGsiMxdw301SG/UC4XLB0uFjwZkVnwFYKYqnLhEsyyWzllI/pFMwImT9MxVknTjqObPuEhBdJBz+vnbDiOzJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789557864; c=relaxed/simple;
	bh=6UxCH6MRYg6mEePj2KMRo1g+H/E4R17RxQPgnOFUnWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EEjILakTzvfvJ9WIAvB+Cin612vS0PVHFkSanyMKzr49TIEIuWT7MuhAZ9lUu17KXH2E5MlUAUj06wjPJeuoRv9tkKlQ+hmYf+lVY2DGsbA6YvvaX7UE87F89WGNBuxEBNqieUpajCX/pOjIeCyxoxv9cfqoHSb++pF1TcjbGNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GFVe+g7B; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=s5x3CSK9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GFVe+g7B";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="s5x3CSK9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789557855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=94ot/NkUW9As5MJhkTwENc7dewwxKgZK/8SOm5fAzho=;
	b=GFVe+g7Bk+mtcemQJm8oi98J0ezhK69GhTdnODJAQsYdOb8+eUlAEA+NI/DG6das4uhZH5
	Pklo+RoCKZYUki4OgrarT9tVitWZdyg0gcUAszy4LWmkHk7g/6jm8hsq06ibVLE4zntJTN
	vUIAHyNvexVtRt+/cBxZwzTqnHUbJWY=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-tXWxYWODN6W1zNIVoLgrxg-1; Wed, 16 Sep 2026 07:24:13 -0400
X-MC-Unique: tXWxYWODN6W1zNIVoLgrxg-1
X-Mimecast-MFC-AGG-ID: tXWxYWODN6W1zNIVoLgrxg_1789557853
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc73f47bdcso73717895ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 04:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789557852; x=1790162652; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=94ot/NkUW9As5MJhkTwENc7dewwxKgZK/8SOm5fAzho=;
        b=s5x3CSK9fL0+TfCQoOUEDIxOzf3FlUIB6lYgTfs9+iMrrOcY5tyYREKEjMiiLxHhVg
         Ql4l1RtoeFO7IvD1GvXKn6spaMr9QqV5QtZGsay+6Zyu5O7895BiOrJwhTPzg2JGNgY+
         GY5pjmeJ96j/djUIBAN+58CNQ5IKPRlRBF1RK8epg1IhHcR5qAXBFFBR1M/z35tPQpRL
         dsMdaW1oIW/oudluW9rJiASYC9qbLBky5/6oGBf4OQ8X0mF2/SWTWugvBc0E/fPr43FB
         2Jg4VSnsTVmbysqk6LonnXI0HMrkZnpakmUyIRZXc34+1K8BnL+Z7qkJA16wxR2hFyR2
         cisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789557852; x=1790162652;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=94ot/NkUW9As5MJhkTwENc7dewwxKgZK/8SOm5fAzho=;
        b=hibys+V6c7ASABis7gIBX+uLIztemz/Y3hZRzAFaeq6EVJGLw1XZNp94LJ3xaEQKyP
         ZXY8vxEb995HZfDkf08KYb9nmzgYwhVN1IyRy//9Neg68XKsfeIyI8bRtDwiLGiKFNSe
         Xu4T2UJ8niwFYwsZDFv1TlzzxxeZFN7aNZXkIodwmeieJj66jan1yAtZnZ1IgUNYo3mb
         afU19einO0SYLZZcCscpgd9qKzfxoMgg6rc6BiM3V6K0UnPNtqPxM36UrF0ZiLJJ8Tvz
         tqpk1M/qv1rjk1myW4RZC9R8GXLHmr3NJ6YD6rLbeeyxwUHCDV6PlBgjkL3zpvdFeliE
         ps7A==
X-Forwarded-Encrypted: i=1; AKwUvBwfnqztVVEvD09MF/+khWYfbV2AjVsaxTniztrBqIMK7Cisubmhg1jjxypKPVTqjmmpy/LRHvz3ymkOx60=@vger.kernel.org
X-Gm-Message-State: AFuF++mcTryD6a2QoADSd/Kzs1bo47u0S7RIvkJk9KyPNVi5YuTcCSM+
	P32jXKsO2/wQRvuWd5zio4ZuhNe9Pt/PVlcAaNPiQDwhx+EogEUffju4I4hTSUj+rA5ecoCm83a
	exKQN8ACTiUlnkpW2z2VyW30++F93/JL/acL8GQVadwzGui1Nbueks8/fODva3cvQrg==
X-Gm-Gg: AYBFou1PvBbBlyDOO/Ao01jGLwLgTP83Oz7hQfBDOarOHy0J4sNu36fICfVzA1OHtOa
	oXbTg8p8K8t7vth0HTxhzGLYXZ3dyoa7F+GVrqZ73ZXwxNzKRKgC0rJufelrP/8qTLJegxnLahV
	pl/OjUlYNoazGpr3m2njfGgZnFqtkZSYP4Nt/pYr56zZkMDgx4kJEuwu4EoIU+OrEQ6r/ZYAPRM
	wXP1mro/0LhWXXnE/02QIq+h0v7+bLkgji4ijmfS1hQIPRuwJRBcCbe7bDDm79lZ1UwAnlwjaln
	sBDK2SzmeSolpU7onqotnaHVg6sUJDzbx0IVdyYRWRJJqm2qoOjSlAc9pi6v7oFPK7hEV397lAi
	JnkihxP+MgAEqVZ/ld4Zht0OdaAlfURSy5vhAGYdT0Q==
X-Received: by 2002:a17:902:ebd2:b0:2dd:7ede:4c0e with SMTP id d9443c01a7336-2dd8e402c96mr56049525ad.12.1789557852587;
        Wed, 16 Sep 2026 04:24:12 -0700 (PDT)
X-Received: by 2002:a17:902:ebd2:b0:2dd:7ede:4c0e with SMTP id d9443c01a7336-2dd8e402c96mr56048745ad.12.1789557852161;
        Wed, 16 Sep 2026 04:24:12 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89ebc548sm9967905ad.37.2026.09.16.04.24.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 04:24:11 -0700 (PDT)
Message-ID: <ea703546-3871-42f9-840b-3fe38b9dc67f@redhat.com>
Date: Wed, 16 Sep 2026 21:24:05 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: resctrl: Catch and propagate error from
 get_cpu_cacheinfo_id()
To: Ben Horgan <ben.horgan@arm.com>, Andre Przywara <andre.przywara@arm.com>,
 James Morse <james.morse@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Fenghua Yu <fenghuay@nvidia.com>, Tony Luck <tony.luck@intel.com>,
 Dave Martin <Dave.Martin@arm.com>, Yin Li <yin.li@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260902143757.3469690-1-andre.przywara@arm.com>
 <ea42f2a7-f4f7-46ab-a5e0-239c74174499@arm.com>
 <2c682691-3037-4d62-a941-bc41baca35aa@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <2c682691-3037-4d62-a941-bc41baca35aa@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/16/26 7:49 PM, Ben Horgan wrote:
> Hi Andre,
> 
> On 07/09/2026 13:59, Ben Horgan wrote:
>> Hi Andre,
>>
>> On 02/09/2026 15:37, Andre Przywara wrote:
>>> get_cpu_cacheinfo_id() can fail, in which case it returns a negative
>>> error value.
>>>
>>> Check the returned value for this error condition, before passing the
>>> value on to other code, which would hide the negative number in some high
>>> value in the unsigned type.
>>>
>>> Fixes: 36528c7681b8 ("arm_mpam: resctrl: Add support for 'MB' resource")
>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>
>> This looks good to me. Out of interest what led you to find this?
>>
>> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> 
> I seem to have been a bit hasty here.
> 
> Sashiko points out at [1] that 0xFFFFFFFF is the only value we were previously considering invalid
> and that the value coming from dt or acpi can provid other valid values that would after this patch
> be considered invalid.
> 
> [1] https://sashiko.dev/#/patchset/20260902143757.3469690-1-andre.przywara%40arm.com
> 

I think Sashiko is correct that the check 'if (cache_id < 0) return -ENOENT' is incorrect
because only -1 is a invalid ID. The correct check would be:

	u32 cache_id = get_cpu_cacheinfo_id(cpu, 3);

	if (cache_id = UINT_MAX)
		return -ENOENT;

Or

	int cache_id = get_cpu_cacheinfo_id(cpu, 3);

	if (cache_id == -1)
		return -ENOENT;

Thanks,
Gavin

> Thanks,
> 
> Ben>
>> Thanks,
>>
>> Ben
>>
>>> ---
>>>   drivers/resctrl/mpam_resctrl.c | 5 ++++-
>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>>> index 9d223057953ab..a5e661eff86d7 100644
>>> --- a/drivers/resctrl/mpam_resctrl.c
>>> +++ b/drivers/resctrl/mpam_resctrl.c
>>> @@ -786,7 +786,10 @@ static u32 get_mba_min(struct mpam_props *cprops)
>>>   /* Find the L3 cache that has affinity with this CPU */
>>>   static int find_l3_equivalent_bitmask(int cpu, cpumask_var_t tmp_cpumask)
>>>   {
>>> -	u32 cache_id = get_cpu_cacheinfo_id(cpu, 3);
>>> +	int cache_id = get_cpu_cacheinfo_id(cpu, 3);
>>> +
>>> +	if (cache_id < 0)
>>> +		return -ENOENT;
>>>   
>>>   	lockdep_assert_cpus_held();
>>>   
>>
>>
> 
> 

