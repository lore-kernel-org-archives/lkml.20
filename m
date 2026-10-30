Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.245
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793351807;
	b=fK1Ld4T5V6WcQ65wYRc35DWfjXKDsiexN33rRbUDKzvlbg4l/0QcHXsu+gDG87vSZCB8
	 /JZrk9iwguaOIUT6xXIoi+JiLAqY0i9G5sWSfgzhWBtNtnOO1z4y/qYPz2EcBUXoJwIxS
	 qshEyWgrAtFiZL2D4XthDGDKiJH67ptMWLzEcir1KKBxZINeupPu0zQFjEKBdv+/lRS81
	 bzI1MYlb9dfm/i3oMnf7hiNzx8my7e33TmCzrALNqH3lQIvp90xYnEoJhRXL2bwcv8Vsh
	 /iwTW5cuwExqacL6x9EN7rkHoU+hlbjvP4ERWFZey64EwRLGkeUrbsglJLnoWmUkeEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793351807;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=cvtULt05CNENF+dcGaZHfj6dxMkQ2uk2IJDUbG8kU5k=;
	b=od2Ob8CC53D+f2HCzuvGAHaP3V7lsYpA0K1MGZ9q41gQVLDlRllV1dSCgEOXHuSAV/LT
	 FLWnBaomYx3DzaJ8S6ueWBCQeR9vpcbJAmIWgiwVBo38No6BQqxT4vGx59Sp8BDBHHBYM
	 f9spJ1DVU1xokW6bWWlhzoCTFQjAVAbzrnUpR2CCVfxDC42GrBkiFc6kKlQHAMvru4QFD
	 aJbCXBkA8odVaiQRPC7sWmIkeNHytlRYTOOE+rmU+bPqGxd5zgLVWbmkUV1V27V90Z92Z
	 4Q1XPiEVu+GYO9N3Gvt5+kXBBlDG2QYdJEj4YSbcGqFSpJEov59rpXj+IfrGBZQWhYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vCxKaGCa;
	arc=none smtp.remote-ip=91.218.175.245
Received: from mta0.migadu.com (out-245.mta0.migadu.com [91.218.175.245])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC7C606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDC7C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vCxKaGCa
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OWKCARjtfy267o2XbXOnvCk2rMveSznO0EDjspP5kOc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793351805; v=1; x=1793956605;
 b=vCxKaGCa8XdTEH3cRIlQG7YJ9HhHuHhhVBmrQ5NQnJs35a7x6KI99FQfPEZqInlPJ8x9kWgw
 SF0MpEP3K1cLFo2g53kEQtmUBqUUdWTq9xVw57OlUQRwIdCHr94/4/ako6Rfms7fWM5bEQvPOnU
 xG3Wo7AAShron3KNLkb5U+To=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 339b1e922908af26;
	Fri, 30 Oct 2026 09:16:44 +0000
X-Mizu-Trace-ID: 339b1e922908af26
X-Migadu-Flow: FLOW_OUT
Message-ID: <5b0f90a4-c7d2-4f12-9d95-95c7149c49c7@linux.dev>
Date: Fri, 30 Oct 2026 17:18:01 +0800
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
Subject: Re: [PATCH v3 04/10] mm/vmalloc: propagate errors in
 vmap_pages_p*d_range()
To: Dev Jain <dev.jain@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Suren Baghdasaryan <surenb@google.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, Dennis Zhou <dennis@kernel.org>,
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>
References: <20261026080329.140244-1-hao.ge@linux.dev>
 <20261026080329.140244-5-hao.ge@linux.dev>
 <e1cfd568-8fdf-4aa1-a8c5-961bb8d7efba@arm.com>
Content-Language: en-US
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <e1cfd568-8fdf-4aa1-a8c5-961bb8d7efba@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dev

Thanks for your review.

On 2026/10/30 15:29, Dev Jain wrote:
> 
> 
> On 26/10/26 1:33 pm, Hao Ge wrote:
>> vmap_pages_pmd_range(), vmap_pages_pud_range() and
>> vmap_pages_p4d_range() return -ENOMEM whenever the level below them
>> fails.  But vmap_pages_pte_range() can also return -EINVAL for a
>> page without a valid pfn and -EBUSY for a pte that is already
>> mapped.  Pass the error up as-is instead, like the vmap_p*d_range()
>> helpers for vmap_page_range() do.
>>
>> Signed-off-by: Hao Ge <hao.ge@linux.dev>
>> ---
> 
> Fixes?
>

Sorry, I missed that.

> Reviewed-by: Dev Jain <dev.jain@arm.com>

Thanks! If you have some time, I'd also appreciate a review of the
remaining patches in the series -- or Suren and Uladzislau, if they
get a chance. No rush, I know everyone is busy.

Thanks
Best Regards
Hao

> 
> 
>>  mm/vmalloc.c | 24 +++++++++++++++---------
>>  1 file changed, 15 insertions(+), 9 deletions(-)
>>
>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>> index 7131f60d1a8e..d60b99b81ec9 100644
>> --- a/mm/vmalloc.c
>> +++ b/mm/vmalloc.c
>> @@ -600,16 +600,18 @@ static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
>>  {
>>  	pmd_t *pmd;
>>  	unsigned long next;
>> +	int err = 0;
>>  
>>  	pmd = pmd_alloc_track(&init_mm, pud, addr, mask);
>>  	if (!pmd)
>>  		return -ENOMEM;
>>  	do {
>>  		next = pmd_addr_end(addr, end);
>> -		if (vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask))
>> -			return -ENOMEM;
>> +		err = vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask);
>> +		if (err)
>> +			break;
>>  	} while (pmd++, addr = next, addr != end);
>> -	return 0;
>> +	return err;
>>  }
>>  
>>  static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
>> @@ -618,16 +620,18 @@ static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
>>  {
>>  	pud_t *pud;
>>  	unsigned long next;
>> +	int err = 0;
>>  
>>  	pud = pud_alloc_track(&init_mm, p4d, addr, mask);
>>  	if (!pud)
>>  		return -ENOMEM;
>>  	do {
>>  		next = pud_addr_end(addr, end);
>> -		if (vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask))
>> -			return -ENOMEM;
>> +		err = vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask);
>> +		if (err)
>> +			break;
>>  	} while (pud++, addr = next, addr != end);
>> -	return 0;
>> +	return err;
>>  }
>>  
>>  static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
>> @@ -636,16 +640,18 @@ static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
>>  {
>>  	p4d_t *p4d;
>>  	unsigned long next;
>> +	int err = 0;
>>  
>>  	p4d = p4d_alloc_track(&init_mm, pgd, addr, mask);
>>  	if (!p4d)
>>  		return -ENOMEM;
>>  	do {
>>  		next = p4d_addr_end(addr, end);
>> -		if (vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask))
>> -			return -ENOMEM;
>> +		err = vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask);
>> +		if (err)
>> +			break;
>>  	} while (p4d++, addr = next, addr != end);
>> -	return 0;
>> +	return err;
>>  }
>>  
>>  static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
> 
