Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292061;
	b=3dZvHCeJBwykAlkP/hfHys0ubg8AI4SjpS1CzodrvW2HQXSTO944UyqzO41RBERmpOU7
	 0I6Pv86yYDqCkF7sN0qJZzWw6PkCbJHDO8dEUrYfQ8Dj7uD9A66xjjE8eYcO/Zi29heRf
	 slT0lT0QTkgHdVIJS3rbj7Xq2jonSwt/eDXkFlE1k1CvJdmQFwKNb3N1Q0Uo+37yMEgZl
	 CTOORhsqejHgjzKxjGgDEsf40/fK0CIH9/YfP4b7cnSreBbEP0bbfeqkcehQt1+xCWJC4
	 VIRIT1y87ymmaZHqATPpVp1qPgFnl9L1COIK0cerNBqAhFfwANSDRntf3USP7jwOt2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292061;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=RSj86Hc7K2z1X4Epw37BkpA+aLDPOX4tf6yZloUics8=;
	b=E3lcSCTk4Li+FMAi/KV6XGfFlHsoP2sMhB1oWYYfKRJWhFm7lzoonFYzSWfEW/oWDMbK
	 EiNojTuCqr059jsmcseeLccw6cS4vPYCiENZOaPRiP5RIPTv8T5A7of4kGRddY3efYtTX
	 Pna1vLjKTID5DLOJuzqBRVyoFQDau4JlXajOQGaz9utjwyW9O4XSiPr7oKUDUyuMsNNzD
	 7Mk46O08ffQG7Ps0wwVHX9LZjH0n/lvSPkZoYRduySZwLEzICXbzS2HEEtGMHRfncleZe
	 GZaEcWXkKbuT6MI4HxRG7venWMy03PDRLw22aH6XnupkB08RGMnaytAV0SxVmzpgjqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZlEpz3in;
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4960B606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:27:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4960B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZlEpz3in
Received: by mail-pj2-f8.google.com with SMTP id d9443c01a7336-2e93d9c7973so12583585ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 22:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794292061; x=1794896861; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RSj86Hc7K2z1X4Epw37BkpA+aLDPOX4tf6yZloUics8=;
        b=ZlEpz3injAMQoGwwEFSH3lXgr3Or/lKAPgSmYLReVSZZvKaBnyMZrSbcXv5esSTnWG
         uxgck52BfDZhGluBEpeW+muSNHOSj6PIkK6sVuab0b6vI+Co3E/GF5A4x02kPlNANtAQ
         BRPkI14Xb/N0poW3aRKobX75QRei+ShT4XBcAdxS5rqoIByPVVVGttvxDjgqzeMaaPJw
         zCWprHt3lXvmqLjHJ6YxGiYZo+Gv36kwKeeQsB4+g5k8mPbooAKJ7iyIeoDZvlQwsUbK
         DDveaTTxNU+aLxtTagOHYsBfnCLtVseGwzpvEywIN6VAV9XTxMPiTCqhCvYs5jbobS6b
         62OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794292061; x=1794896861;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RSj86Hc7K2z1X4Epw37BkpA+aLDPOX4tf6yZloUics8=;
        b=Fi9niupjCb9wy4Eq0o0CVnfj49Rf/vLHjyYOO/WO33MIoSMrFIUSpH/EV/cf17MXtO
         3zDvxg8Ojx41uw8zepWhWyAR5tAxAboVTLsnLmO59bR7z8U46x7kgp1L7Ijxm7hSCa5C
         1TajPSvGoFNNjgYK4O6RtxBUt7OtLEMB3nDWOzXBID93gSR43zecQmxmnBpqksTTA+VF
         bJhW+nJOUGTAyspm+IRs6VSN3UQZXpXHj0p7Rn/4kE8DSip0cHzObzHJ+KA90SRjiy7x
         J1rGIZVn4KcjimQ3cD7BR1MKxHLvqB01xWJ4JkfShTqct+b3fWG4vuPPDn1Gy5WcWeUc
         eoMw==
X-Forwarded-Encrypted: i=1; AL+hErECw//bGf+onbwpdeBNQp6Ti+F/Tt6Hsp/jQFF0VKURgWIt9lKCGV4rDRgVslKHnnArL6dmv4WgRy9ETew=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WrdLPFnvlWjUyPiOQLA/2yaSEqo8Ij/gR3RuPCprNmqneqRJx
	wdQeWYJ7D4YG25CjdM5izH0rQB19kmQYrKygsOe39rLA2Kz8J/C79Xu9
X-Gm-Gg: AYBFou1hx1wrY4jqStXMIgK9BfMovVmbgnEO9+kFh5sBEPxlTNQTuKiZ/X2soMdJqKf
	btfkPp175tjKzfQjvzY/SIKD8jIQ7Z3MWxj/UvF8jqHB26apeMfpF/bA8NOTQPWo120xLFfKn93
	CHHWl2om/pGncu0YayiVQgkFI18YyI+hOhasEKmv1RwJS5GAPrZTOhdiWmkHd442t9Oeb8Ir3ZR
	8fFvVVm1g9JzI2O8XU586rxjqApoRP+Ro9IEi5+dAp3tDFRa+gfxa/bHY5qshRjezXBpGrR4pw9
	z4HE1y9a/Lq3p6BVgct8VqE3XNZuJu8rRB7kh7k+yH2FHnc2bAYco4tpZ8W/y8n1598BfTGjQhn
	Hy4Xvm6UvORZRBuKiWYKu2pm6+KbMIzlWoHPkxYa4ADYQ/v73s2a3Rm4Ap68hDh7rqChkwPTnjU
	hDDbzpiA9WqzyTsK2bbEV3NLqLAydSZ/jR9RMAgAIRRwWKSQzNHTlCpkQSzOffX2HVyDPhgR25+
	iS97gT1iIsR2ORIUjZj3iyZcP0YVSM2N5VTEMQH+4BbxKt7ChBdVqGaTk/TT3WvJYii1cZtO4+c
	p6++bTZ3Nop+EvBcq8GN8XIU/cCGDLqrekoK
X-Received: by 2002:a05:6a20:9c94:b0:3dd:a197:edfb with SMTP id adf61e73a8af0-3f19057bee9mr1544827637.74.1794292060357;
        Mon, 09 Nov 2026 22:27:40 -0800 (PST)
Received: from [10.125.112.22] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa86e030sm473518b3a.27.2026.11.09.22.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 22:27:39 -0800 (PST)
Message-ID: <dff3e90b-f03a-4dfe-8c53-fd65db20de1b@gmail.com>
Date: Tue, 10 Nov 2026 14:27:32 +0800
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
 akpm@linux-foundation.org, fengwei.yin@intel.com
Cc: ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com,
 byungchul@sk.com, gourry@gourry.net, ying.huang@linux.alibaba.com,
 apopple@nvidia.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261109090846.1068409-1-chenwandun1@gmail.com>
 <fc3c1e68-9321-46bd-9f1f-4209bf5c6a7d@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <fc3c1e68-9321-46bd-9f1f-4209bf5c6a7d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/9/26 21:51, David Hildenbrand (Arm) wrote:
> On 11/9/26 10:08, Wandun Chen wrote:
>> From: Wandun Chen <chenwandun@lixiang.com>
>>
>> try_to_migrate() clears PG_mlocked when unmapping the source folio.
>> For PTE-mapped large folios, remove_migration_pte() restores one PTE at
>> a time, but the rmap helpers only restore mlock for full-folio mappings.
>> This leaves the destination PTE-mapped large folio without PG_mlocked.
>>
>> Restore mlock once all PTEs of the destination folio are restored under
>> a single page table lock.
>>
>> Fixes: dc68badcede4 ("mm: mlock: update mlock_pte_range to handle large folio")
>> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
>> ---
>>  mm/migrate.c | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/mm/migrate.c b/mm/migrate.c
>> index 94033c222e04..140e291d4587 100644
>> --- a/mm/migrate.c
>> +++ b/mm/migrate.c
>> @@ -353,6 +353,7 @@ static bool remove_migration_pte(struct folio *folio,
>>  {
>>  	struct rmap_walk_arg *rmap_walk_arg = arg;
>>  	DEFINE_FOLIO_VMA_WALK(pvmw, rmap_walk_arg->folio, vma, addr, PVMW_SYNC | PVMW_MIGRATION);
>> +	unsigned long nr_ptes = 0;
>>  
>>  	while (page_vma_mapped_walk(&pvmw)) {
>>  		rmap_t rmap_flags = RMAP_NONE;
>> @@ -446,9 +447,16 @@ static bool remove_migration_pte(struct folio *folio,
>>  			else
>>  				folio_add_file_rmap_pte(folio, new, vma);
>>  			set_pte_at(vma->vm_mm, pvmw.address, pvmw.pte, pte);
>> +
>> +			nr_ptes++;
>>  		}
>> -		if (READ_ONCE(vma->vm_flags) & VM_LOCKED)
>> +		if (READ_ONCE(vma->vm_flags) & VM_LOCKED) {
>> +			if (folio_test_large(folio) &&
>> +			    nr_ptes == folio_nr_pages(folio) &&
>> +			    !(pvmw.flags & PVMW_PGTABLE_CROSSED))
>> +				mlock_vma_folio(folio, vma);
>>  			mlock_drain_local();
>> +		}
> 
> I have the recollection that the next try_to_unmap() would fix that up? Or is
> that not the case?

It is the case, try_to_unmap() can restore it. However, until reclaim scans
the folio, Mlocked in /proc/meminfo can remain undercounted, giving users
a misleading impression that less memory is locked.

A similar fix was made in commit
	ab521b4142aa ("mm/rmap: improve mlock tracking for large folios").

and handles cases where an entire folio is added in one rmap operation.

However, when a PTE-mapped large folio is migrated, remove_migration_pte()
restores PTEs individually, passing nr_pages = 1 to the rmap helpers,
as a result, PG_mlocked is not set on the destination folio.

This patch handles that case once the full mapping has been restored,
rather than waiting for try_to_unmap() to restore the mlock state.

> 
> The "nr_ptes == folio_nr_pages(folio)" case is shaky either way for folios that
> are mapped into multiple VMAs, or what's the logic behind that, such that is is
> fine to only focus on large folios that getting fully pte-mapped?

The logic follows the mlock restoration in try_to_unmap_one(), IIUC
only mlock a large folio when it is fully mapped in a VM_LOCKED VMA.
nr_ptes is counted per VMA. A complete mapping in any one locked VMA
is sufficient, regardless of other mappings.

Best regards,
Wandun

> 

