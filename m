Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794638764;
	b=zOp6Hfzx/QY2xiz6G76gyJ/PbqU6TJl3nYYt4rYXmP4HbNPIuGrluLOyGoh35XxJhvxt
	 c4jnEOO6N86YvSsVauWT1Y1yf3BsJqMrzIQVrc6HzQvLqoET8fVeFXYgqiwl0rmxBig0r
	 b1GHW+1nB6VGEDARyu1qKWyv1NiIJthMhIDJghVHpatggAxzZ77teaT5C6CMP0f56GB/w
	 d8NzVoBKZoKK3oraqCOeAXgTrFAAYzyBXNR+3UqeV1yOYhhqXvEdbM9tfxPCmZZWS8JUl
	 gmupK1HRKsHaYP3JO6Hsoc2dElOeQKgjWo045Q5Zm4PFOzsTWc6s1kCPZvNCEZPzo8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794638764;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=iHbcITGOkxyEh3nCOC1u0s4lDXjvYPiyn4teM7lM8pk=;
	b=S7ppyidcaMPdj4TS/rWEahYVsgME8dbI0vz22vBOke9Y11/O64Q4gMJIIu54Injyf0fU
	 SjHqIoANBY2g49OawktMtykomvM7R8c++1Gche7Cy1OqBj7/J8ZYFoWdXNm1ZB2nrxL/q
	 QKNBHW9mH/V1KYortFrb6fyQevT0JA3EIuCDRh9NwNpeyFq7B2DS2bbPzGsFclktFj0i3
	 x5Xp7SiODWN6FaOgkLuVa+590DYNwoWbobWLSs65gBCuHUxuYZYMgoi0SkUKpc302JYWf
	 unbJc8oiIzDzTR6z6pK133x4508mdxuRxdKill1bag02p5CcFSi4fnAmjfSZ8A26Ilg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eCN44lcA;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Z9JyRNti;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5377606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5377606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eCN44lcA;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Z9JyRNti
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794638761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iHbcITGOkxyEh3nCOC1u0s4lDXjvYPiyn4teM7lM8pk=;
	b=eCN44lcAmg8WWt7EytFdeuDTgnSkRBXZxj85YZi0/8+EJACmLeXPxzbIbddBZXtUyUd7gQ
	b89sRnxuSf5jjRvbNLgy1M2HCZHgMBe0LstSMmAYqW1htqQbKWIdiIbQdLBhBCQ/KY1GBs
	EFnTiKvrq9nz16mtdTLspXCV0btMCgk=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-QquBRMG7Nb2FKDRw9OXY2w-1; Sat, 14 Nov 2026 01:46:00 -0500
X-MC-Unique: QquBRMG7Nb2FKDRw9OXY2w-1
X-Mimecast-MFC-AGG-ID: QquBRMG7Nb2FKDRw9OXY2w_1794638758
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-5c159755becso907967e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794638758; x=1795243558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iHbcITGOkxyEh3nCOC1u0s4lDXjvYPiyn4teM7lM8pk=;
        b=Z9JyRNtiGxsUxOTxjRXOUUYL5sZxLCCF7uohgZH+ACUBNaNK77Gws4JJTUmQ3BqRqf
         xPtOeDPwvzrrQFs3XcIut12Z2E/NBeLooONPXp127Hddp42E0v0aDRUV1x2TdbaDl1Fz
         uqWfRtEB4lnwiP4XohTTUhf3i9H/cscianavIn3W156zfyw1kO2VapArMQwLF3kppbgf
         vCz47bV/WyrVsr+htOoMdeiTr9jOYiR41KXzCv3wzSsDrafgwfXq8b1xiG/tAq8JcW0h
         ZPev1DfOrt8FGDMbwXd/KM66n6uXFpj1v7dYN2umDo1grMqdfnyhCyyZwR0bCahrCo5i
         0b/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794638758; x=1795243558;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iHbcITGOkxyEh3nCOC1u0s4lDXjvYPiyn4teM7lM8pk=;
        b=lTUdbVnfmYwj/1OsQDM96xt53hQMXi7zrBFKqE9kDorKfFikHPzSgXO95sokogd+In
         3CEUjQlnpkLFl8Rn5pw2b9lcJNLMiA3wLrN++PgvtVH49/JDFyowY0iRETXLt9Z19xDq
         XOcQfrI+mld1CjPn4cN4t5z8ORRwk7k7Mfeqg/GYMSY4QK66Phee2VooI8aoRGJmIxSL
         CDgaAE7ks8Ewx93Vfaqce/Pgh3wTFCfO+ASPe347QPsCjelRqphbJbQGW06v0EXSr4or
         dsTqEk6msnZmyFClgHaIrQ4BGIq+j7to3sSzbBbTbynP21A5XkUeSktu3ffKogJuRVff
         nRdg==
X-Forwarded-Encrypted: i=1; AL+hErEovxsTVA3lW1xZsSqNdwUyb0Eb5nxbhxqEF2SQcF4odn4lA6cAlMNlOtT4q6E8SHaXqEXYHk43WC+YZMY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZgJpjpKnT2l+d8c/aNXTG1OSYrIAB5dlnZnDeQkNGLMVRddzP
	Dd65T38laadM9dhxgjAubrpDT6aZ73HPzvWy4wvYAWbZrSvgVEcQxoSiEQh4mNdu/ysFZplemT3
	6pEBjw6D50qSuAzEBLORD6WWnZiLhDIbEd2dbLVpYLC66P9KNMkUk2K0O1znyFOdq
X-Gm-Gg: AYBFou019eWGO9AmMMg4jQn8vP1Sa8KSbQTPWgkS7LWYfxho4HtTTDDAxtx/N108/UF
	iiBZ4pZ4MsddZqOQVO4igklysJgFBkbK5GNC1xHNR4oAJfUQtIf65hy5HlSlODkPl3uQ3O1pbD9
	uWOuGMxJsuqMHGPwScXQj2g2ansqS/pWy0pCznC8sYa/2fhKDaNR0xRa2edqbwwEdnJDK6XibPj
	CMvanmpkRw/TpdZIYDi7rpIlwlQgzqTjWgWs0rP6zWXLDel4a0iJhMK+UKjLjNycDKq8WorH3R+
	R8FVMhfLGQGXzJMsOdYGSAhrnGuKWsohdF7v51+g1oI5VVf6Kulh1R03TAiQk/muKsWB/5h1exE
	1BLwH7m6gWEeiI4eekSFnVYLn31qascds97FDRGXaQocxIcyvAeKNYvCLqkT224SK+LG6TWeNVQ
	vhpP0o
X-Received: by 2002:ac2:4bc5:0:b0:5b6:4ae:5b83 with SMTP id 2adb3069b0e04-5c1709ca612mr1930543e87.33.1794638758295;
        Fri, 13 Nov 2026 22:45:58 -0800 (PST)
X-Received: by 2002:ac2:4bc5:0:b0:5b6:4ae:5b83 with SMTP id 2adb3069b0e04-5c1709ca612mr1930526e87.33.1794638757811;
        Fri, 13 Nov 2026 22:45:57 -0800 (PST)
Received: from [192.168.1.86] (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17133e3acsm1466215e87.45.2026.11.13.22.45.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 22:45:56 -0800 (PST)
Message-ID: <8c79ce88-7730-44c4-92a0-d760d6f8e9e1@redhat.com>
Date: Sat, 14 Nov 2026 08:45:55 +0200
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
Subject: Re: [PATCH v2 05/13] mm/migrate_device: don't collect a range twice
To: Balbir Singh <balbirs@nvidia.com>, "Lorenzo Stoakes (ARM)"
 <ljs@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, "Liam R. Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, David Rientjes <rientjes@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>,
 Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Usama Arif <usama.arif@linux.dev>, Kairui Song <kasong@tencent.com>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Kiryl Shutsemau <kas@kernel.org>, Yu-cheng Yu <yu-cheng.yu@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dennis Zhou <dennis@kernel.org>,
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
 Peng Fan <peng.fan@nxp.com>, Josef Bacik <jbacik@fb.com>,
 Chris Mason <mason@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 "Borislav Petkov (AMD)" <bp@alien8.de>, Mark Brown <broonie@kernel.org>,
 "Dennis Zhou (Facebook)" <dennisszhou@gmail.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Josef Bacik <josef@toxicpanda.com>, stable@vger.kernel.org
References: <20261113-mason-migrate-et-al-fixes-v2-0-50a2ed382b61@kernel.org>
 <20261113-mason-migrate-et-al-fixes-v2-5-50a2ed382b61@kernel.org>
 <avfrWjzLQdDcmXO6@parvat>
Content-Language: en-US
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <avfrWjzLQdDcmXO6@parvat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 11/14/26 07:09, Balbir Singh wrote:
> On Fri, Nov 13, 2026 at 09:45:23PM +0000, Lorenzo Stoakes (ARM) wrote:
>> From: Josef Bacik <josef@toxicpanda.com>
>>
>> migrate_vma_collect_pmd() drops the page table lock to split a large folio
>> which it finds in the middle of a page table, and then starts over at the
>> "again" label. The entries for [start, addr) are in migrate->src[] and
>> migrate->dst[] by then.
>>
>> While the page table lock is dropped the page table can go away, in which
>> case the restarted walk invokes migrate_vma_collect_huge_pmd(). However
>> this is passed start rather than addr, so [start, addr) is collected a
>> second time.
>>
>> This can result in migrate->npages exceeding the number of pages the
>> caller asked for, and therefore in writes past the end of the
>> migrate->src[] and migrate->dst[] arrays.
>>
>> Fix this by only handing over what has not yet been collected,
>> page-by-page, and flush the TLB for those entries which have been
>> previously replaced, similar to the other returns in the function.
>>
>> Fixes: 022a12deda53 ("mm/migrate_device: handle partially mapped folios during collection")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
>> [ ljs: cleanup commit message ]
>> Tested-by: Gregory Price (Meta) <gourry@gourry.net>
>> Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
>> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>> ---
>>  mm/migrate_device.c | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>> index 9e5dab8e1b77..28ed706109da 100644
>> --- a/mm/migrate_device.c
>> +++ b/mm/migrate_device.c
>> @@ -257,13 +257,17 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>  	pte_t *ptep;
>>  
>>  again:
>> +	/* [start, addr) is collected if we get here after splitting a folio */
>>  	if (pmd_trans_huge(*pmdp) || !pmd_present(*pmdp)) {
>> -		int ret = migrate_vma_collect_huge_pmd(pmdp, start, end, walk, fault_folio);
>> +		int ret = migrate_vma_collect_huge_pmd(pmdp, addr, end, walk, fault_folio);
>>  
>>  		if (ret == -EAGAIN)
>>  			goto again;
>> -		if (ret == 0)
>> +		if (ret == 0) {
>> +			if (unmapped)
>> +				flush_tlb_range(walk->vma, start, end);
>>  			return 0;
>> +		}
>>  	}
>>  
>>  	ptep = pte_offset_map_lock(mm, pmdp, start, &ptl);
>>
> Is the intended race a concurrent MADV_DONTNEED reclaiming the PTE table while
> PTL is dropped for the split? That would leave pmd_none() true on retry, entering
> migrate_vma_collect_huge_pmd() through !pmd_present() and taking its hole path.

I think this is "ok" for the fix, the hole is collected from [addr, end). 

But couple of things follow. It can't be possibly collected as
MIGRATE_PFN_COMPOUND entry, only small pages. And the collected entries
in [start, addr) are wrong ones.  Finalize will recover, but the
migration will fail for those. These all are handled in the HMM walk
based migration series.

--Mika


>
> Thanks,
> Balbir
>

