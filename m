Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794469519;
	b=jKyAD17tQuxArVI6mA/uS+SFV6XdX5WKINixwjjxQfwGjm+aapwuey3MpsUmLROBelsX
	 t578AzVtpKBTWyon1iuLtoRGSXBXIs6or2wFfqk+cTMHNH+94XkbgCDNvUZRWnYce3nmk
	 2B0J0YZYDzx6S1L5JGfosZQQ64Pni4AMM2/DXWgBjtbQxDSAf+ztLf48J6CPEaVb5k28T
	 SNdowBM31oVoQ0GqPXLNGRJg5PN/CE7Qqn4+7DzhsA8osIxlavE/GlG3fF+/E+VoHxYWt
	 s1+5JickedbdBrFjR23fLmUWTF0sLXq2BmawTolfmayQgutKJVN0fKoxjAGILkGs3ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794469519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=XonEwXskiTjcZGriLRKPr8S1lDz0l/ASP2xVg5gbydQ=;
	b=NfeQ7thPaTwNLxBBJCtEHlE9tDzxjv69F3Gif+fygv0U/TXdmLpL6KTwqr/bL+9MW6Ah
	 eMVk8f0fd8A8y2FLwCfWQhDh4n2GHJKulsEyqyiQ8Eh97jFnvWoprB8HCLyTDdhiC6Ubj
	 NY8k5zvEhw1HgiaJUiN7zAkREdb81waJl7cZUqC2DhjDoS7f33IyouPYtALFMHtpwjsoL
	 TKZ8hUT9ynl07ECHbhDFvU/e9d8KptsjvRa7E2GagdQjccRniw70/RxuqwhgeXGQ4XbSn
	 vxPQ6dQ6pPGzeH2pSqpahr0uSkNMFiMEb7zMbcCbgBul3/20dxYWGLkeRD9qvEmG0xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q+cJ30Wu;
	arc=none smtp.remote-ip=74.125.227.133
Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6217F606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:45:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6217F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q+cJ30Wu
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2eb040841a9so3825215ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794469518; x=1795074318; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XonEwXskiTjcZGriLRKPr8S1lDz0l/ASP2xVg5gbydQ=;
        b=Q+cJ30WuvyyKwWaMoR9MNCuroMXGxhHndbLUsXZTdo9zR5c1E7btKUbkUhbEQHAShQ
         Gh4FrFiNML+eItfpsFfjpylghgiY+w1llfUmvVAOtYfHxMcZLneX22RHjEZGjAPXRSWP
         pwCOmbWKiZ81inM2Dl3Snu4XDAX2HX5JFS+Vg/r+GzrBTtYAw+ZWyKErNwL4Hu1Dg0BH
         qe6DWHumDSuh6kA/ZLcrpKkUZfpD6rHFUue3aE4s4pi5pwirhYtxIa2jJWYJbTgRRwGR
         uJzsK+C3JThA7+LdpmWpEozh+Y2XiKlojR5gYMEaA3jiHjZ1Y+ACQQzH7TPgfWgZD+/2
         Enww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794469518; x=1795074318;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XonEwXskiTjcZGriLRKPr8S1lDz0l/ASP2xVg5gbydQ=;
        b=cEAAmJGsL4u+ohLxd47dAZ0jRct92B0rbzWwRirkR4fZ6PftaOzpZhlIr1MdPDUd3j
         5qELusH33/254h7hJ242TJkNIkNjyKAcx3W0IXGBQyp0UQhV1/rKnNxiKHUwMK+MwXLE
         xcU87xS95IAHD/G+y9jQ2CYS2NSonNTh73EeyiRjJGRdNZYmTs4S+Aeu4eZPO28kiMI1
         tLlxVKtnOduPFz0U+gr7p/HwAf1zcM05A+A/SaeziOcNjudJPSLzePXMk8ynnzr5uE+3
         BA8S5VIpEIt3FQUh3NjbnLo0pTknGXHevSf3wEgmZyELCVl3nvfDehHKIlPbK0AmRH1K
         ymAw==
X-Forwarded-Encrypted: i=1; AL+hErHWTFbr/6VkSw0epTlkrJJSF0Ez0l6+RxVHPjG/gDkRuRjO4/5QN+VcY4yf0MBvbPRTLGJaAWvlbpsPdn4=@vger.kernel.org
X-Gm-Message-State: APuU4Z94V3D2JtZtiCua4jWMl3atO52yumaa1cD2EktTejXn8jWrbEQY
	itT4XOC0auGJ1IW6v4H1U33584M7uawLxxsXUDkaewm2YV/oFHOBptVS
X-Gm-Gg: AYBFou24vXq7oJuOI407aXfdsfghGRwujBiJcdpDyijDegMknvX8L2YfmJyBCbxdIl5
	2vrelyRXUM+ajUqgwjwgSSWkcpX0HU7VdDchWWetXursfuLwmrqlBAEFjTTTZZHib8+/c69NzRb
	GEus+Q/OWZyKmPXrQTcasf33+B7lJnma6KLLXLgBhVR4wn224EmJ/5cVxLnoUc9huJyGqIgnsPy
	aJR8ueKNZ1of13TBL8YG/uLhS6bC+7uXyyNWemDU3o5MmqmW9FwvSZCrxiwWCcnVB0Qm8Z8pcfR
	bjLOCFd4a2nzTpJHGUEfOq/fpKfePx2UsBtKhU4Vg6ERFiIhuNDk4qZ1QFtxr/ASSLjtkp8aO/R
	NFfEKt2ZZiycRR2Z2aY57GNPRzLFvK792XZO2clflV7yMkeH9L9K0F2iUI4K8v/nRjR/CZhseHd
	krwxQIFYkpD8qDK0dRU8BhHWi9IP62scKtD/4j4TR+99jhfcEcW3Q6l2xc/alAdJsbxoJrK5OuV
	of/6Iv1reHVrdt7qNC1it2p9pOOT1rDdxiHCxaBGjrgN5wRmgPdQcU6XjZakzWvJTEv1GmnRZco
	9BRDHY7KNMAC/jxxwSSylVSH2oXRenPPhaTK
X-Received: by 2002:a17:902:fc4b:b0:2ed:dddf:8489 with SMTP id d9443c01a7336-2edf166fbbamr12780695ad.12.1794469518391;
        Wed, 11 Nov 2026 23:45:18 -0800 (PST)
Received: from [10.125.112.22] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6dd2225sm30454285ad.56.2026.11.11.23.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 23:45:17 -0800 (PST)
Message-ID: <eef4c5ee-2487-4668-bf24-742af6d71484@gmail.com>
Date: Thu, 12 Nov 2026 15:45:09 +0800
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
Subject: Re: [PATCH v2] mm/migrate: improve mlock tracking for PTE-mapped
 large folios
To: Kiryl Shutsemau <kas@kernel.org>,
 "David Hildenbrand (Arm)" <david@kernel.org>
Cc: hughd@google.com, akpm@linux-foundation.org, ziy@nvidia.com,
 matthew.brost@intel.com, joshua.hahnjy@gmail.com, byungchul@sk.com,
 gourry@gourry.net, ying.huang@linux.alibaba.com, apopple@nvidia.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261110123218.1579490-1-chenwandun1@gmail.com>
 <5f9c449e-43b3-4732-9c14-8199418cace0@kernel.org>
 <avS7FfzvjieHufUE@thinkstation>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <avS7FfzvjieHufUE@thinkstation>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/12/26 03:01, Kiryl Shutsemau wrote:
> On Wed, Nov 11, 2026 at 09:00:10AM +0100, David Hildenbrand (Arm) wrote:
>> On 11/10/26 13:32, Wandun Chen wrote:
>>> From: Wandun Chen <chenwandun@lixiang.com>
>>>
>>> Commit ab521b4142aa ("mm/rmap: improve mlock tracking for large folios")
>>> mlocks a large folio when all its pages are added in one rmap operation.
>>> However, when a PTE-mapped large folio is migrated, remove_migration_pte()
>>> restores PTEs individually, passing nr_pages = 1 to the rmap helpers. As a
>>> result, PG_mlocked is not set on the destination folio.
>>>
>>> Reclaim can restore mlock in try_to_unmap(), but Mlocked in /proc/meminfo
>>> remains undercounted until that scan occurs.
>>>
>>> Restore mlock once the full mapping has been restored in a locked VMA
>>> under one page table lock, rather than waiting for try_to_unmap() to
>>> restore the mlock state.
>>>
>>> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
>>> ---
>>>  mm/migrate.c | 10 +++++++++-
>>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/mm/migrate.c b/mm/migrate.c
>>> index 94033c222e04..140e291d4587 100644
>>> --- a/mm/migrate.c
>>> +++ b/mm/migrate.c
>>> @@ -353,6 +353,7 @@ static bool remove_migration_pte(struct folio *folio,
>>>  {
>>>  	struct rmap_walk_arg *rmap_walk_arg = arg;
>>>  	DEFINE_FOLIO_VMA_WALK(pvmw, rmap_walk_arg->folio, vma, addr, PVMW_SYNC | PVMW_MIGRATION);
>>> +	unsigned long nr_ptes = 0;
>>>  
>>>  	while (page_vma_mapped_walk(&pvmw)) {
>>>  		rmap_t rmap_flags = RMAP_NONE;
>>> @@ -446,9 +447,16 @@ static bool remove_migration_pte(struct folio *folio,
>>>  			else
>>>  				folio_add_file_rmap_pte(folio, new, vma);
>>>  			set_pte_at(vma->vm_mm, pvmw.address, pvmw.pte, pte);
>>> +
>>> +			nr_ptes++;
>>>  		}
>>> -		if (READ_ONCE(vma->vm_flags) & VM_LOCKED)
>>> +		if (READ_ONCE(vma->vm_flags) & VM_LOCKED) {
>>> +			if (folio_test_large(folio) &&
>>> +			    nr_ptes == folio_nr_pages(folio) &&
>>> +			    !(pvmw.flags & PVMW_PGTABLE_CROSSED))
>>> +				mlock_vma_folio(folio, vma);
>>>  			mlock_drain_local();
>>> +		}
>>>  
>>>  		trace_remove_migration_pte(pvmw.address, pte_val(pte),
>>>  					   compound_order(new));
>>
>> I guess pte batching would be one way of handling it, but that requires more churn.
>>
>> The spirit is similar as in try_to_unmap_one(), where we count the number of
>> ptes in one VMA. For consistency, I would call it "ptes".
>>
>> @Kiryl, can you take a look?
> 
> Looks right to me. Agreed on "ptes".
> 
> With that adjusted:
> 
> Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

I'll rename it to ptes and send a v3 with Reviewed-by tag.

On pte batching: following the swap_pte_batch()/do_swap_page()
precedent, restore could scan consecutive migration entries with
matching flags and do one set_ptes() plus one folio_add_*_rmap_ptes();
a full-folio batch would even set PG_mlocked for free via the rmap
helpers.

However, try_to_migrate_one() creates migration entries per-PTE with
per-PTE flags, so restore batches will often be truncated by flag
changes. For such folios the ptes counting in this patch remains the
only way to restore mlock (it survives batching with a one-line
change: ptes += nr). So I'd like to land this first and do the pte
batching as a separate follow-up series.

Thanks,
Wandun


> 
>>
>> BTW, why don't we care about that in try_to_migrate?
> 
> try_to_migrate_one() unmaps the folio whether the VMA is VM_LOCKED or
> not, so there is no mapping left to keep mlocked; removing the rmap
> munlocks the source.
> 
> The mlock is rebuilt on the destination in remove_migration_ptes(),
> which is the path this patch fixes.
> 

