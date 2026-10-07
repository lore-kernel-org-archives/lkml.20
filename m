Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFD74AA03E
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 14:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791382025; cv=none; b=IFXHWpGQiMUtwzz31Q7aBp8H5QwMkhSuksLJH/SvClgD7Cs8dbJaQ9nbAmUFEM6qB0hMiawET5n9DPU8irqUB4AKeItL0ESnQuiuus90PjN6lzZrNRyFMZiyJKHE7bgTu757GjUjofq07JLlu8mQ08hpnkQrpYGzgvQd0+xnJw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791382025; c=relaxed/simple;
	bh=wFiCFGitZ0uN/vgxSf2rcN644RgkZhN3J2GoUKr3AXo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZvVqIA4t8893KD0xG5qfqC9TmMmsOfvpK07EShiQW6u8b5sxy9Ox5jZlhHOIlq1p5tnBOY4UHYtTCS0OQ4ZJw76V+5HAj+n9xaB6jAmYHT+oGpPC56kgFRD5tOZDAEzVgBaORabHA9oU8IXhwcDIZ2jYjkiteDDLyRrm/YtoHhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b1gqx6Yc; arc=none smtp.client-ip=209.85.218.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b1gqx6Yc"
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c2d93b92937so408701466b.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 07:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791382017; x=1791986817; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=imywIXeZN+/or3shxnnFEehI44taL7I6PvUTOA24c8E=;
        b=b1gqx6YcFJmlnECNl8b+WIKk2s2cm82XpyjNYAJmZ4+8jLk3KISzQ21jJG2+lSHUZC
         cBVlQvDNPqC5eamJ1DwZWhLHuHl6PmpTt0sXKLTlDQCOaNR9JGylCLttiAIVf0erNmiK
         MYcE/Bwb4NvNbu8rXRujqF5SYR3nuum6KnQOqo/DwAcjqFY8Zv5frr9kM6JhzlV+zJe7
         YNFsrxNjD98eoih1MKk6F8RW2tHe4h+/hdkAErrUFj7ZfHFxIRkdN55pXhbHrJqoQvR1
         Tv+QdUg/SOrqaSzWzuqLw+IJvBvSpt8LLWsZSgunJ7RB/P2DHwoUPbdlkCBol/1O3iO0
         eKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791382017; x=1791986817;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=imywIXeZN+/or3shxnnFEehI44taL7I6PvUTOA24c8E=;
        b=yhpoo5LOPV4qtykGb68NppvRDsV2iDBkN75Jih0S0ctsMzerlkbqkTwQGwIWQ3/Tmv
         Bq/YRIVOYZN/NvtYLu4YcwpC505FVlnmf7KxCotK//5JU6qKKPwBwrYtnhfkSCWDNYzz
         H2WCNY3RFoILEO6m0DZxZy//jDoV/O1aMHus5GIRVOgAR2UsxuelZiitGkTALRn+LLJE
         h1pzxEyPmQmMKv6ebRVvgydsDj4WwiXIzn/ksND7rt3T3bhCrqXefD0cyAXHiEk7TCSN
         uOEU/lZqngxcltJLkctyt0ZW5up6WiSd2VrLy2Dp/J3I1de4D3AUy7fd6oFLL8v2PJfi
         /6xw==
X-Forwarded-Encrypted: i=1; AKwUvBxwUqP8zdSBDBWhH9+Z8DPiOeUb/o5sWog0GP5ALt7rXwJPSxf43d+ZBOFEFptplcadlQ++QzZbjfPGki0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqB3r+jgilycAxO+EXlyiTX//GXrtgLfmshk77NDnwwpPFJ0tD
	vM/yaqkK3hfc/Pi331H8sFM+nlfz4qX7Atfs2LArceUGSGWjLbesejBS7S9rLe+DTw3B59MaqqW
	m5XgwbqxtIyNL+U/YtA==
X-Received: from ejeck7-n2.prod.google.com ([2002:a17:907:e1c7:20b0:c2e:3bb5:3475])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:7955:b0:c2a:fbe1:7340 with SMTP id a640c23a62f3a-c317c0d81f8mr206753866b.41.1791382017061;
 Wed, 07 Oct 2026 07:06:57 -0700 (PDT)
Date: Wed, 07 Oct 2026 14:06:56 +0000
In-Reply-To: <asC1FwHVHOhBHDGK@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260926092448.4090401-1-tarunsahu@google.com>
 <20260926092448.4090401-2-tarunsahu@google.com> <asC1FwHVHOhBHDGK@kernel.org>
Message-ID: <9huzy0c9siyn.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH v3 2/2] memblock: use binary search to locate candidate regions
From: tarunsahu@google.com
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	dmatlack@google.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dev.jain@arm.com, Pratyush Yadav <pratyush@kernel.org>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Mike Rapoport <rppt@kernel.org> writes:

> On Sat, Sep 26, 2026 at 09:24:48AM +0000, Tarun Sahu wrote:
>> Use binary search (memblock_bsearch_start) in memblock_add_range() and
>> memblock_isolate_range() to locate candidate regions instead of linearly
>> scanning from index 0.
>> 
>> Under heavy memory fragmentation (such as KHO page preservation registering
>> hundreds of thousands of disjoint folios), scanning from index 0 on every
>> insertion and isolation results in O(N^2) complexity, causing boot-time
>> memory retrieval to take several minutes (~268s for 393k pages).
>> 
>> Using binary search reduces the worst-case complexity to O(N log N)
>> (and O(N) for sequential appends), cutting KHO memory retrieval time
>> from ~268s to ~50ms.
>> 
>> memblock_search() open codes the same binary search, so reimplement it on
>> top of the new helper.
>> 
>> Signed-off-by: Tarun Sahu <tarunsahu@google.com>
>> 
>>  mm/memblock.c | 53 +++++++++++++++++++++++++++++++++++----------------
>>  1 file changed, 37 insertions(+), 16 deletions(-)
>> 
>> diff --git a/mm/memblock.c b/mm/memblock.c
>> index 59dda7d085f3..87c71435c80c 100644
>> --- a/mm/memblock.c
>> +++ b/mm/memblock.c
>> @@ -586,6 +586,33 @@ static void __init_memblock memblock_insert_region(struct memblock_type *type,
>>  	type->total_size += size;
>>  }
>>  
>> +/**
>> + * memblock_bsearch_start - Find the first region index where rend > base
>> + * @type: memblock type to search
>> + * @base: base physical address of the candidate range
>> + *
>> + * Returns the first region index that could potentially overlap @base.
>> + */
>> +static int __init_memblock memblock_bsearch_start(struct memblock_type *type,
>> +						  phys_addr_t base)
>
> I'd call it __memblock_search()

Okay.

>
>> +{
>> +	int mid, low = 0;
>> +	int high = type->cnt;
>> +
>> +	if (type->cnt && base >= type->regions[type->cnt - 1].base +
>> +				 type->regions[type->cnt - 1].size)
>> +		return type->cnt;
>
> Using local variables would make it more readable IMHO.

removing this as per next comment. Let me know what you think? Should we
keep this optimization or not.

~Tarun

>
>> +
>> +	while (low < high) {
>> +		mid = (low + high) / 2;
>> +		if (type->regions[mid].base + type->regions[mid].size <= base)
>> +			low = mid + 1;
>> +		else
>> +			high = mid;
>> +	}
>> +	return low;
>> +}
>> +
>>  /**
>>   * memblock_add_range - add new memblock region
>>   * @type: memblock type to add new region into
>> @@ -609,7 +636,7 @@ static int __init_memblock memblock_add_range(struct memblock_type *type,
>>  	bool insert = false;
>>  	phys_addr_t obase = base;
>>  	phys_addr_t end = base + memblock_cap_size(base, &size);
>> -	int idx, nr_new, start_rgn = -1, end_rgn;
>> +	int idx, start_idx, nr_new, start_rgn = -1, end_rgn;
>>  
>>  	if (!size)
>>  		return 0;
>> @@ -644,8 +671,9 @@ static int __init_memblock memblock_add_range(struct memblock_type *type,
>>  	 */
>>  	base = obase;
>>  	nr_new = 0;
>> +	start_idx = memblock_bsearch_start(type, base);
>>  
>> -	for (idx = 0; idx < type->cnt; idx++) {
>> +	for (idx = start_idx; idx < type->cnt; idx++) {
>>  		struct memblock_region *rgn = &type->regions[idx];
>>  		phys_addr_t rbase = rgn->base;
>>  		phys_addr_t rend = rbase + rgn->size;
>> @@ -809,7 +837,7 @@ static int __init_memblock memblock_isolate_range(struct memblock_type *type,
>>  					int *start_rgn, int *end_rgn)
>>  {
>>  	phys_addr_t end = base + memblock_cap_size(base, &size);
>> -	int idx;
>> +	int idx, start_idx;
>>  
>>  	*start_rgn = *end_rgn = 0;
>>  
>> @@ -821,7 +849,9 @@ static int __init_memblock memblock_isolate_range(struct memblock_type *type,
>>  		if (memblock_double_array(type, base, size) < 0)
>>  			return -ENOMEM;
>>  
>> -	for (idx = 0; idx < type->cnt; idx++) {
>> +	start_idx = memblock_bsearch_start(type, base);
>> +
>> +	for (idx = start_idx; idx < type->cnt; idx++) {
>>  		struct memblock_region *rgn = &type->regions[idx];
>>  		phys_addr_t rbase = rgn->base;
>>  		phys_addr_t rend = rbase + rgn->size;
>> @@ -2062,19 +2092,10 @@ void __init memblock_mem_limit_remove_map(phys_addr_t limit)
>>  
>>  static int __init_memblock memblock_search(struct memblock_type *type, phys_addr_t addr)
>>  {
>> -	unsigned int left = 0, right = type->cnt;
>> +	int idx = memblock_bsearch_start(type, addr);
>>  
>> -	do {
>> -		unsigned int mid = (right + left) / 2;
>> -
>> -		if (addr < type->regions[mid].base)
>> -			right = mid;
>> -		else if (addr >= (type->regions[mid].base +
>> -				  type->regions[mid].size))
>> -			left = mid + 1;
>> -		else
>> -			return mid;
>> -	} while (left < right);
>> +	if (idx < type->cnt && addr >= type->regions[idx].base)
>> +		return idx;
>>  	return -1;
>>  }
>>  
>> base-commit: 1f18d740165163910df64d3063e1ad31648bc5e0
>> -- 
>> 2.56.0.rc1.315.gc6ed9934b7-goog
>> 
>
> -- 
> Sincerely yours,
> Mike.
