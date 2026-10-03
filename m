Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CD4314A98
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 15:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791040189; cv=none; b=AjHPY77c5PRWiBNgwJM4iPnR/RwqvcZS1mIhtGNR5TdAPY6cyoq6UWP/n+lEylaRyhr4APjSMx3P3E+UUzJ45pxhBxv/fAB2/Fs1+jda7GBHr/o8fGSK6vfhacCz3t0G8TtZcKtDqPdxSYAhVP8pM9WVwI7RHpLsYTIiT7WnvZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791040189; c=relaxed/simple;
	bh=m5sU5EXTiiyNrj70E1s93NCvoJTYqO8Ta5+TOaFgI+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gdyJ4UJyxWTu3x4Cp8HeKCF/1ZukadXHFyPldxvNXmdAANyOAbFLeShog6EJHgSsGn4CtF/xECqxE9GsgkS5+LtpP7sWY8hcHRa+K20ZyFetAiPA/cu/qcFxsh79mkvkUtVkYdDFfdgB9g4gR+lxRp8Z7T8+6v5h4gsd72D5HWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RD8CUvis; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RD8CUvis"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791040186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YIxj6ry01eJ+GYC6y0yG2M4VVnKiRtjxj+gvc7C8aEM=;
	b=RD8CUvisjigs3p2Nxy7uEjRKEXy1P0DkunyLuYVJmTvNybAntusECFBMsa9aIQFBrM2405
	oui3zr1xD7f7oGnp2oHAiSYObbIhfmRBxOINWCWcrJkmpVPbrnEHxcsUrNylWWXxHlMdyB
	6Y1mWdQmDGBtcProgvqdZ0C+7orQVEE=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-Yj0SeDCEOvGYObM9mXekZg-1; Sat, 03 Oct 2026 11:09:45 -0400
X-MC-Unique: Yj0SeDCEOvGYObM9mXekZg-1
X-Mimecast-MFC-AGG-ID: Yj0SeDCEOvGYObM9mXekZg_1791040185
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb6391e89so54652185a.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 08:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791040185; x=1791644985;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YIxj6ry01eJ+GYC6y0yG2M4VVnKiRtjxj+gvc7C8aEM=;
        b=rWcCKZq/kKIpi6ceGfqp+GUpA/H54Am0luhiUyxiPpKubF5tj1iyPuNSf/v1Id/3ER
         Ru9Gut+348DkxHKD4mAmFBq7YrMMc1aofvmY3oYuG2I8bf/OFkodH073QYyP/vnFfANN
         QGgpYtckK9vFGkyFDFb3MzMx1gANmScAilxyhIceHCI709h8a+HMQXD0oa/HzPR3A7Q4
         ZuB8MDYYFrxDmEvwi/Q+YtZGzV9ftzdje492Tsy6a3VJoJ5pFm5vd71rTZAUeW2NqFoh
         ZomjqueCScy6vkyySjGloXNHMBKuveP1iIltveRsltFXPmbt/HAh1QI3fRi4Dl+1D9wu
         ZQuQ==
X-Forwarded-Encrypted: i=1; AKwUvByS5b5XoIaL5I5r0b2kKnqJGk9pIv5qFMWv38SCX64Mov+fUkR2CTxXn+vjk04qx9wNOxKM6k69xLRLgwc=@vger.kernel.org
X-Gm-Message-State: AFuF++kfwBgEA0zEXwXqBFCXPXhMR4lpZ+UyMVrP4vh17BYsowWKgwC1
	zXLihD+1n9axOBt5ja3BhQsaFLOYpKhAwNOWP4xUXuv+fLyMN5hi06UBXHUOL9GXTtLoK0DOTMr
	FUldPHVP+000OOK0JXL5Gv8VwyMCREbeqPHCOe7yCZkqFj89ZlD1SrcqRj1fd4gQ1IQ==
X-Gm-Gg: AYBFou0n+adtpUsda8MYKkUFjvl39QNxQixkz0rmyYq0rJ8qT8+nJvh2KJbPpSp7Anl
	4UtICecyd98sBtjQXVpgWNk5Z1c/UwBpyuP7Vt0RArbbEdzB9bv2t/V1ajxZurPXz5Y5UMW3g6+
	Q+dQZM1Z9nFAYiYnqgUVbkFwfinlYYRhlHEFhiclXYYgjjDeSbrHYH50n5hg+fpP3mQZNz/8oRW
	hAdQOidXIdZiS4jVGoY8hPgjp6retKlsCtJlFpHykSOrkVne2xeYdUCWOK5bIg/CJpsuhWDtNer
	dCsjsNsO6jdojIVsk2FD8yWbt4HQQONuSBFT3ZegsAO3MtqNmTRtUIm6eFzZXNf0DDthAuHOlXr
	0i6o=
X-Received: by 2002:a05:620a:4113:b0:93a:f9:614a with SMTP id af79cd13be357-93cf1748ff3mr1013749085a.34.1791040184684;
        Sat, 03 Oct 2026 08:09:44 -0700 (PDT)
X-Received: by 2002:a05:620a:4113:b0:93a:f9:614a with SMTP id af79cd13be357-93cf1748ff3mr1013742585a.34.1791040184161;
        Sat, 03 Oct 2026 08:09:44 -0700 (PDT)
Received: from [192.168.2.110] ([142.172.30.162])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93e457a4e20sm361949485a.40.2026.10.03.08.09.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 08:09:43 -0700 (PDT)
Message-ID: <0162d0f5-8e75-458b-a0a1-6071f46d4b35@redhat.com>
Date: Sat, 3 Oct 2026 11:09:42 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 07/14] mm: shmem: allow THP support determination at
 folio allocation time
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 baolin.wang@linux.alibaba.com, ziy@nvidia.com, lance.yang@linux.dev
Cc: corbet@lwn.net, tsbogend@alpha.franken.de, maddy@linux.ibm.com,
 mpe@ellerman.id.au, agordeev@linux.ibm.com, gerald.schaefer@linux.ibm.com,
 hca@linux.ibm.com, gor@linux.ibm.com, x86@kernel.org, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, hughd@google.com,
 dave.hansen@linux.intel.com, djbw@kernel.org, vishal.l.verma@intel.com,
 dave.jiang@intel.com, akpm@linux-foundation.org, yintirui@huawei.com,
 dev.jain@arm.com, usama.arif@linux.dev
References: <cover.1789695931.git.luizcap@redhat.com>
 <f74ada750d1910f8ea7e55955eb0c330747b93d4.1789695931.git.luizcap@redhat.com>
 <b63f546b-ee92-46c3-85bd-bc64dbaae367@kernel.org>
Content-Language: en-US
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <b63f546b-ee92-46c3-85bd-bc64dbaae367@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/2/26 3:23 PM, David Hildenbrand (Arm) wrote:
> On 9/18/26 03:45, Luiz Capitulino wrote:
>> In order to enable THP support in shmem today, besides the user
>> configuration required, the CPU must support PMD-sized pages. This
>> is the case because of the following has_transparent_hugepage()
>> usage:
>>
>> - shmem_parse_one() and shmem_parse_huge(): Check if THP is built-in and
>>    if the CPU supports PMD-sized pages
>>
>> - shmem_init(): Since the CONFIG_TRANSPARENT_HUGEPAGE guard is outside
>>    the code block calling has_transparent_hugepage(), the
>>    has_transparent_hugepage() call is exclusively checking if the CPU
>>    supports PMD-sized pages
>>
>> While it's necessary to check if CONFIG_TRANSPARENT_HUGEPAGE is enabled
>> in all cases, shmem can determine THP size support at folio allocation
>> time. Therefore, drop the has_transparent_hugepage() usage listed above
>> while keeping the CONFIG_TRANSPARENT_HUGEPAGE checks.
>>
>> Additionally, we need to check if PMD size order is supported in
>> shmem_getattr(). Use pgtable_has_pmd_leaves() for that.
>>
>> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
>> ---
>>   mm/shmem.c | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/mm/shmem.c b/mm/shmem.c
>> index 776dff8a848e..930657d05375 100644
>> --- a/mm/shmem.c
>> +++ b/mm/shmem.c
>> @@ -690,7 +690,7 @@ static int shmem_parse_huge(const char *str)
>>   	else
>>   		return -EINVAL;
>>   
>> -	if (!has_transparent_hugepage() &&
>> +	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
>>   	    huge != SHMEM_HUGE_NEVER && huge != SHMEM_HUGE_DENY)
>>   		return -EINVAL;
>>   
>> @@ -1524,6 +1524,8 @@ static int shmem_getattr(struct mnt_idmap *idmap,
>>   	generic_fillattr(idmap, request_mask, inode, stat);
>>   
>>   	orders = shmem_huge_global_enabled(inode, 0, 0, false, NULL, 0);
> 
> I'm curious: why is that not handled inside shmem_huge_global_enabled() ? If PMD
> order is impossible (well, okay, it is possible, but we simply cannot map these
> things through PMDs), I would expect that we never list them as "enabled".

Yes, you're right. What about renaming current shmem_huge_global_enabled() to
__shmem_huge_global_enabled() and then having:

static unsigned int shmem_huge_global_enabled(struct inode *inode, pgoff_t index,
					      loff_t write_end, bool shmem_huge_force,
					      struct vm_area_struct *vma,
					      vm_flags_t vm_flags)
{
	unsigned int orders;

	orders = __shmem_huge_global_enabled(inode, index, write_end,
					     shmem_huge_force, vma, vm_flags);
	if (!pgtable_has_pmd_leaves())
		orders &= ~BIT(PMD_ORDER);

	return orders;
}

Would this be acceptable?

> 
> (while shmem could allocate PMD folios, it would have to map them always through
> PTEs. I think this would be possible through some changes, but we can defer that
> to some future work).
> 

