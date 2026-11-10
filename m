Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311842;
	b=z5dzUnY9LoZ/GpgZfrGijQQC6ofePHne8Ent8QEB4MvjyP3K9HhwtTjaA/Hi8jq/Dpb9
	 l9C7bBILf4kRK6uCbmnZb2Q9bOR2VDjO1qmF/7GsJeEgm+7iQcV4CTYi7e9NHEPXpRVJM
	 dD/fUAm7CbEZpcffgJFBVmBl1gFTkYWUcOcWPIzpYY7aE4BHN/iokZnJagP/WlBt0XrJ6
	 LXbayT98by2Rhmvz97lOeALRf07Fn28/F6W41QNcSEA5RGgmoD5MXm46ut2cJcFjp5RKg
	 K0EHvyMU2Zqz/bO4MtmhfCmYpFvp18Xx/xBaaEFclZ6KuEAEpdfaQ+B2BeOut3+nW5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=by6Ti3o1wDAVApAYIKWV2YwwlW1fQPE6wPwXZus2Kyg=;
	b=Y/tBH1TmyppTHC2uBOZqCHdVH5R72XCL5Ibc4Ne20Z1zJCcAc1Xd11VzoTjX9LsPGPn/
	 +XPY0RYfNBANI2RBjYSXsGPUjSY2RNzTjSeCekFyDCuXcCkfPLrUNPRh0vKF4HS7N2F/C
	 zRzmDnPUu7Dk25LsHc9ID4SkFXrYrdfwA7xScMt2/YtuQ3B4yrG71IYcp1i+jGR3tyq7r
	 7+IrZUxp/RYE2I68L5puUCFToM/oSzp4tlcNEUlmb/IbR6QZ1YbBQKeRYXsJRX02Yxte9
	 HYzv0lZtCvcn9P3H5cFlfJcXZUfAY6/5sTX66TF/sECYvl8BZW1ajRgQLe3CHyq9DSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GU39PdO4;
	arc=none smtp.remote-ip=74.125.227.131
Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F63A606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:57:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F63A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GU39PdO4
Received: by mail-pj2-f3.google.com with SMTP id 98e67ed59e1d1-3ada6c66964so583915a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794311842; x=1794916642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=by6Ti3o1wDAVApAYIKWV2YwwlW1fQPE6wPwXZus2Kyg=;
        b=GU39PdO4DT5chZ1jhEdqoFEdoCMldaXKlX7BlyK0yYdDgL/hacywOdH+UFPIKLmrie
         Hk09KDWGb8OZ4u9q5nnAqHwsQgDyPJ9uFLkDMLbx+DpeW87W/NUHr0IHKfYnwCNLlQoh
         +b2HCIYWP5RrLIYwVBaeGUvrDtyKtGuvEK/rAQb4/tUm4878y3TDOaxFgP3Mya4RAVVw
         Yj4N7nr/2dsiUgx/Xky/PvGguXb+b7Xz8s4rCV7aAJFq9Co0GEtPxijgOmtDJh+RVi7b
         BNznT0tkvxvpZQh1x3vzr3A7ZaNV7yZnKGNxlz9kABxODPfM+4iTB5nlJ68QPubKuzM5
         gM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794311842; x=1794916642;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=by6Ti3o1wDAVApAYIKWV2YwwlW1fQPE6wPwXZus2Kyg=;
        b=n9CfQgVywEOWTmUpFx9yXtEGbypniRNQrXR6DFtuWeB8QVZIT/UzeLz+MTPZLKs/Rg
         xQUG30p+33npn+FbsGiTo5X8O5dCL/2O76KmSDn8gFuELrHbizkuqpS4PT2h6YNN/SaM
         PNyXVrFQpBDUFJ9lvagn6cS7oD8hBojp2MMrx0h9AtOBG5gAn6WQgoVD6lfO+AViV9B/
         a3EmYBoO+uk5dv3TEpRlKbrJa/oPQNR0wX84L7j1nkKli80pahASxUSd/P37qiVpMcUS
         VTJBj/oz9Sms6XOqpuN+8lDwAqeBkroKSnL0jG8GX+AW0eiBfmsl64cQUa29FgxDDkdj
         J28w==
X-Forwarded-Encrypted: i=1; AL+hErHWD+DsZJkt1Y+Re003wSW9Z+8fGYGr2Rl1CN2LBKU9tHJe+4P5mZI/vAMIr2osty/MiFOW6sA3xrb2pdw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+C+2pPCetLLAgSZLAKuxSvbbwaF2akxQMvAIBJLKm8WfVa3Awb
	7zguBwGftK7wl5mflW7zAFWwhyIpAzVW24rSddGOI4G4LohQ+3bo5Hw1JW3QxXnXcfO8ikZk
X-Gm-Gg: AYBFou39OtS1US9B2TAzAocJn9tJHG/phcW5Y/cv4mCIqpLETneZoV7zbwIGoxViSDI
	1koh756C71HrWddZYxAyGPY57ZsuJiRRfGvlU3XE/nBy7UOdMDBMuKThoA+COIT7kofSNnLyZE/
	VNwsUEe2BygWTJbgDgoNvhAXaq8/l3bDUv8HSnAzP+9ou2tmunSEBQ1d1iu1AjnGfdrpxpsZeba
	bPOQdd3RY+v1jwhzrM5qMlSvUOC/6kTfDqyJFxSVovejYzIkd5oe/xIPQ0siKVK2N/ZPAKuWA91
	3SdIHFmEb5UcuyPXEZJedn4HRkn/KsBc3d8MSQbXS6ghzqG0BIe33qa+wEUlQR63D86T9p1SJeB
	3+/8khAKBV1R/TsFIjfDc0C+tBhHIHosqtnxCusIuDFOaUaDuk4tNHaov8adQU1fr+p6It6WhX5
	XFu8x9kdw94m2FKnahmZed1+CXK5XkpbErg/61HvPYxwP0ZkeZDqXQCXLGnJ5KZo6j+PUd55ujW
	tfnWPsY432FTGvN3pTfe8Dndy2KcDkCtj8j9IsT7iFie0mctdHTeSKl7+S4YQ0m5dGf38uwhdyJ
	A1rrPi10lQz1Py0dQYrY+0Pbv1qGg1Ldmma0ag==
X-Received: by 2002:a17:90a:c107:b0:3ad:47ce:3876 with SMTP id 98e67ed59e1d1-3b166d3f6b4mr2455090a91.61.1794311841562;
        Tue, 10 Nov 2026 03:57:21 -0800 (PST)
Received: from [10.125.112.22] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16fea4243sm1639325a91.14.2026.11.10.03.57.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 03:57:20 -0800 (PST)
Message-ID: <8a7c7bff-2be9-438d-b8bb-e75361be56cf@gmail.com>
Date: Tue, 10 Nov 2026 19:57:13 +0800
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
Subject: Re: [PATCH] mm/migrate: fix mlock state loss when migrating
 PTE-mapped large folios
To: "David Hildenbrand (Arm)" <david@kernel.org>, hughd@google.com,
 akpm@linux-foundation.org
Cc: ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com,
 byungchul@sk.com, gourry@gourry.net, ying.huang@linux.alibaba.com,
 apopple@nvidia.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261109090846.1068409-1-chenwandun1@gmail.com>
 <fc3c1e68-9321-46bd-9f1f-4209bf5c6a7d@kernel.org>
 <dff3e90b-f03a-4dfe-8c53-fd65db20de1b@gmail.com>
 <c94d09e5-78df-454a-be27-f2208a39779a@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <c94d09e5-78df-454a-be27-f2208a39779a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/10/26 19:16, David Hildenbrand (Arm) wrote:
> On 11/10/26 07:27, Wandun wrote:
>>
>>
>> On 11/9/26 21:51, David Hildenbrand (Arm) wrote:
>>> On 11/9/26 10:08, Wandun Chen wrote:
>>>> From: Wandun Chen <chenwandun@lixiang.com>
>>>>
>>>> try_to_migrate() clears PG_mlocked when unmapping the source folio.
>>>> For PTE-mapped large folios, remove_migration_pte() restores one PTE at
>>>> a time, but the rmap helpers only restore mlock for full-folio mappings.
>>>> This leaves the destination PTE-mapped large folio without PG_mlocked.
>>>>
>>>> Restore mlock once all PTEs of the destination folio are restored under
>>>> a single page table lock.
>>>>
>>>> Fixes: dc68badcede4 ("mm: mlock: update mlock_pte_range to handle large folio")
>>>> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
>>>> ---
>>>>  mm/migrate.c | 10 +++++++++-
>>>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/mm/migrate.c b/mm/migrate.c
>>>> index 94033c222e04..140e291d4587 100644
>>>> --- a/mm/migrate.c
>>>> +++ b/mm/migrate.c
>>>> @@ -353,6 +353,7 @@ static bool remove_migration_pte(struct folio *folio,
>>>>  {
>>>>  	struct rmap_walk_arg *rmap_walk_arg = arg;
>>>>  	DEFINE_FOLIO_VMA_WALK(pvmw, rmap_walk_arg->folio, vma, addr, PVMW_SYNC | PVMW_MIGRATION);
>>>> +	unsigned long nr_ptes = 0;
>>>>  
>>>>  	while (page_vma_mapped_walk(&pvmw)) {
>>>>  		rmap_t rmap_flags = RMAP_NONE;
>>>> @@ -446,9 +447,16 @@ static bool remove_migration_pte(struct folio *folio,
>>>>  			else
>>>>  				folio_add_file_rmap_pte(folio, new, vma);
>>>>  			set_pte_at(vma->vm_mm, pvmw.address, pvmw.pte, pte);
>>>> +
>>>> +			nr_ptes++;
>>>>  		}
>>>> -		if (READ_ONCE(vma->vm_flags) & VM_LOCKED)
>>>> +		if (READ_ONCE(vma->vm_flags) & VM_LOCKED) {
>>>> +			if (folio_test_large(folio) &&
>>>> +			    nr_ptes == folio_nr_pages(folio) &&
>>>> +			    !(pvmw.flags & PVMW_PGTABLE_CROSSED))
>>>> +				mlock_vma_folio(folio, vma);
>>>>  			mlock_drain_local();
>>>> +		}
>>>
>>> I have the recollection that the next try_to_unmap() would fix that up? Or is
>>> that not the case?
>>
>> It is the case, try_to_unmap() can restore it. However, until reclaim scans
>> the folio, Mlocked in /proc/meminfo can remain undercounted, giving users
>> a misleading impression that less memory is locked.
>>
>> A similar fix was made in commit
>> 	ab521b4142aa ("mm/rmap: improve mlock tracking for large folios").
>>
>> and handles cases where an entire folio is added in one rmap operation.
>>
>> However, when a PTE-mapped large folio is migrated, remove_migration_pte()
>> restores PTEs individually, passing nr_pages = 1 to the rmap helpers,
>> as a result, PG_mlocked is not set on the destination folio.
>>
>> This patch handles that case once the full mapping has been restored,
>> rather than waiting for try_to_unmap() to restore the mlock state.
> 
> Please revise the patch description pointing all that out :)

Sure, I'll update the patch description in next version.

> 
> Note that ab521b4142aa wasn't a fix (no Fixes:) why should this one here be one?
> 
I also agree that the Fixes tag should be dropped.

I was hesitant about including Fixes tag in v1, as there was no single obvious
commit to reference. I eventually added it because I considered the Mlocked
undercount in /proc/meminfo an accounting bug.

Best regards,
Wandun
