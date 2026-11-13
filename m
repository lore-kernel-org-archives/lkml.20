Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794589471;
	b=k7PD3RkIZ5YHb0qWIMz3Xl2VqYii5OzdG6l5mulyhkhwVRgKGQBVya0NeBVmtocNGhMO
	 8Q4uo/ON6q4qEC2ZqT5rJTakHa275uTr+q9K7dhrk1rjAngNPDG6srAIZBQDQA7ZSvjM6
	 9eoDq7t2t11jwGkguE2+u5kW9EBUh5VVQQ/U8A7qZaZ6GJ0e/jVTqY3cpfMetTZ+vRRjR
	 1sl77Q9/cyNC6y2rvwtvagGanZVNGKlxAQUHUcm2z7JRyag7+nVkKKXrsrUeRhdeHdDat
	 eE+/NCZhs38FUEkVVh6b8hQD+zNzegmjzq7ihi0+COO/kjRL/7fwhAf8s7lcaAojizw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794589471;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=zDSv49j+RC7blbeAA8J/fPgGpqdzGyAQV5qTaZUyPN8=;
	b=4eIRrR3ZBBdu/139vj/pdD3ziOiUV5DQnOm61BRZlxSccc35IhfBGzvoSU/j+sLoz9ba
	 6Ak8tTGNyv9Fq6PHBA+PFjGIokTbatRu9prSH/P3kBx04Fo2BxohC+cSmMNWw6ZIMarHd
	 JdyyuIoOg+Qnm0vh1XJVOLqAardNfUJkojj9qZDyrOqIj7yDeXtnn8zqmHjcWuGQfeMFE
	 RJFgPMY7uLZHKjGjMsqyapZWCOe0cvyVHSeqEDj3XlfzlzMkiqzHE0xeQbJ5ankOwEAhg
	 dVfuWu99H0x01pFuUADJQtHwTCOTLIZE6+4mXyR47cvDz3nRGlTIwCsU6yEyJfWeHTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HkBoG90O;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=dqoPcTw0;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905E2606AA0E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:04:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 905E2606AA0E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HkBoG90O;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=dqoPcTw0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794589469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zDSv49j+RC7blbeAA8J/fPgGpqdzGyAQV5qTaZUyPN8=;
	b=HkBoG90OJYAJNe917WcUK3ewMCkKkPQNkS011e1sV4io3kLzI27b2CP9UQ9p6HKl8Vk1Ti
	/fIoPPpDU6I+eSx5RqrmF7fuhouRnwI+Wo7TvOGMCzyvNmkTlit+GybDINqEan19TIZqkq
	udc6N/GGkChZAG7y9cVWKcaq7HfKPF0=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-fth1x0dROkC3wmMEhL-3sA-1; Fri, 13 Nov 2026 12:04:26 -0500
X-MC-Unique: fth1x0dROkC3wmMEhL-3sA-1
X-Mimecast-MFC-AGG-ID: fth1x0dROkC3wmMEhL-3sA_1794589465
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b18165dc53so1753404a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794589465; x=1795194265; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zDSv49j+RC7blbeAA8J/fPgGpqdzGyAQV5qTaZUyPN8=;
        b=dqoPcTw0eOUhLYTZ/p+sBLq2LDtf08z2YUoAup5NmCQp29wvF9oNEN5PEShwnYmV8l
         N2Vzh7Rw5ZADVRvUm2qFD4AeBv/LbkRWndLnNBG135RQd6B1q0c1MxUpnTCZHCHz0qyp
         Iatbo6PmcTP6xncENmbx/HJpS9AkjxO6zOtHjMoaFzsp+nisRUHxr/FSZDsgWf1yBnRp
         j67y/xxd8zdxIHBhfMS9l6g1aWtxR+Dh61X/e6AuBQ7Pdd+LVen146VF5MCN861ePZvh
         I1PLoB8IiBsUP3MaMRzoyG2hp/NstIqpExL3mASV+Y0W/5oC3tb+bFHq9PmR2h4WNFnZ
         8Z5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794589465; x=1795194265;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zDSv49j+RC7blbeAA8J/fPgGpqdzGyAQV5qTaZUyPN8=;
        b=N8HE1Hu4gF/N9QjlBZXjBIuUolEal66BooZ6AIY0GQdrkfXGUWDr1nRH3G65KpoTL4
         Z683KFAU5xOwUGBNtjUZruOBf1beV9291KqN/CDFj8gwB1CBOPycgO8ZrgrwRFNg3Ohp
         bRm4aVmG6HA7GLxcmDHRd7D149/2y9jDdm5MkzP0vHkO5g+Z1tAa4JFyyTFrlONEijTO
         hvBPlfNvk7jDN/6B/RUVsnpJtZUTzNvAKzMZoH0W2YIr5HDU6uy8jBuDBw6DR/QB6+8s
         xzA/H8qeOjtn82ujihV84zQ7f/c1JBKviG8V2Mwpvug9RUQTfx8u9otb9d5w/VPGBYNC
         Rtig==
X-Forwarded-Encrypted: i=1; AL+hErEc/flaKZS/XtnkrViG+gEKj9Z6Zc65G2u7WkzpMsaZHz4BAXDZGs48FcKWLbOaK4AUsUsOrv9SvOGKnJg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1mB71IQ0WBnpiNbPMLO5hjGUsc1WJjxB5jHW96b6/2Q8tph4X
	T1SsOPCIBpxEm36HlTajxiwJl3NmNGXrkAP31JTzBS1h7NbIzEq1rluVzkfKg0Le+XAVPCJ91tq
	GtNTHYm139MzCXpQ8ReCE+FiT2eSNqC1kOeqUh4vRDFxxKCBrSnCX78mz5QgTEa3jbA==
X-Gm-Gg: AYBFou1ExiwPiTl1l00HxQVN7YHmDqrrs1Cl4IvSRR71kPnUckSGrwf8OuzmU0oID5J
	Z1Ly+BfzDLVzvUR/H3xl/Uq9nCj+u/dT1p2Mzq7cDjZTKpQR4463dUH6++t7kwnR9Eo0n+bpX84
	7vMhPxptKC8wwlVgTxeMIVKh8G8aubd2N5LqDC5jMn4kA7V+/Tl8hkAvjOqc+BPzfSpgJ1c0Jbi
	1fkR/LRUJpuRJdaatBqhP1EMNIZl3koeKp72ISDnnMDF6eGKxyJnlmfg1I3gxs/6wnFnuPEx0Cl
	IpP99WtAM0LA+6HE0lI6eDQk2YLT4iC3M/VfA5Ri3bnSIq2fy1bcvndlvtrPjDGwlSRy02SUONt
	Sla/vp5PvVJaw+4lWn228KxeJsT5vkeaauRFDjP0Dh95mNfCkiT83U5ld0Y9AqnpxsWoJ1ig=
X-Received: by 2002:a17:90b:4e8f:b0:3b0:ce1c:e754 with SMTP id 98e67ed59e1d1-3b1b0b52de7mr2828890a91.62.1794589465080;
        Fri, 13 Nov 2026 09:04:25 -0800 (PST)
X-Received: by 2002:a17:90b:4e8f:b0:3b0:ce1c:e754 with SMTP id 98e67ed59e1d1-3b1b0b52de7mr2828163a91.62.1794589454220;
        Fri, 13 Nov 2026 09:04:14 -0800 (PST)
Received: from [192.168.1.102] ([117.245.168.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f7d9971sm13310855ad.34.2026.11.13.09.04.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 09:04:13 -0800 (PST)
Message-ID: <7d5f300f-ab18-4086-8a61-c3347168067a@redhat.com>
Date: Fri, 13 Nov 2026 22:34:06 +0530
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
Subject: Re: [PATCH v2 1/3] kho: walk bootmem areas in address order
To: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
 Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Chen Pei <cp0613@linux.alibaba.com>, George Guo <guodongtai@kylinos.cn>,
 Kexin Liu <liukexin@kylinos.cn>, Sourabh Jain <sourabhjain@linux.ibm.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20261104-kho-bootmem-sizing-v2-0-b0d1a834780f@kernel.org>
 <20261104-kho-bootmem-sizing-v2-1-b0d1a834780f@kernel.org>
 <990cc079-70ab-4fcf-9974-679aaf07849e@redhat.com>
 <avV9qoaPMBLCNOXD@kernel.org>
Content-Language: en-US
From: Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <avV9qoaPMBLCNOXD@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mike,

Thanks for the quick check. I apologies in advance if I am missing
something obvious.

On 12/11/26 2:19 pm, Mike Rapoport wrote:
> On Thu, Nov 12, 2026 at 12:02:05PM +0530, Mukesh Pilaniya wrote:
>> Hi Mike,
>>
>> On 04/11/26 10:20 pm, Mike Rapoport (Microsoft) wrote:
>>> kexec_add_buffer() users may depend on the order in which memory holes are
>>> searched. For instance, arm64 places the kernel bottom-up and then
>>> requires the DTB to be above the kernel.
>>>
>>> kho_walk_bootmem() walks the bootmem areas in the order they were
>>> reserved, so if the kernel lands in a small area at the top of the memory
>>> there is no room left for the DTB and kexec fails. For example, on an
>>> arm64 VM with 2G of RAM and kho_bootmem=8M,64M,64M, the lowmem area is
>>> reserved first at the top of the memory, the kernel image takes most of
>>> it and kexec fails with
>>>
>>>   kexec_file(Image): Could not find any suitable kernel location!
>>>
>>> Sort the bootmem areas by address and walk them in ascending order, or in
>>> descending order for top-down searches, like kexec_walk_resources() does.
>>>
>>> Fixes: 3bdecc3c93f9 ("kexec: add KHO support to kexec file loads")
>>> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>>> ---
>>>  kernel/liveupdate/kexec_handover.c | 57 ++++++++++++++++++++++++++++++--------
>>>  1 file changed, 46 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
>>> index 6f1f55fe31819..2ac5d94f33fd4 100644
>>> --- a/kernel/liveupdate/kexec_handover.c
>>> +++ b/kernel/liveupdate/kexec_handover.c
>>> @@ -26,6 +26,7 @@
>>>  #include <linux/list.h>
>>>  #include <linux/memblock.h>
>>>  #include <linux/page-isolation.h>
>>> +#include <linux/sort.h>
>>>  #include <linux/unaligned.h>
>>>  #include <linux/vmalloc.h>
>>>  
>>> @@ -820,6 +821,14 @@ bool kho_bootmem_overlap(phys_addr_t phys, size_t size)
>>>  	return false;
>>>  }
>>>  
>>> +static int __init kho_bootmem_cmp(const void *_a, const void *_b)
>>> +{
>>> +	const struct kho_bootmem *a = _a;
>>> +	const struct kho_bootmem *b = _b;
>>> +
>>> +	return cmp_int(a->addr, b->addr);
>>> +}
>>> +
>>>  /**
>>>   * kho_reserve_bootmem - Reserve a contiguous chunk of memory for kexec
>>>   *
>>> @@ -904,6 +913,9 @@ static void __init kho_reserve_bootmem(void)
>>>  	 */
>>>  	kho_bootmem_cnt = i;
>>>  
>>> +	sort(kho_bootmem, kho_bootmem_cnt, sizeof(*kho_bootmem),
>>> +	     kho_bootmem_cmp, NULL);
>> This only covers the case where this kernel allocated the areas itself.
>> On a KHO boot the array comes from the previous kernel. A kernel with
>> this series that is handed over from one without it therefore keeps
>> walking the areas in reservation order for every following
>> kexec_file_load, and the arm64 failure you describe comes back until the
>> next cold boot and vise versa because the ABI string is still
>> "kho-v4".
> 
> If we were able to kexec from a kernel with no reservation ordering, the
> issue is not there, isn't it?
IMHO that holds for the image that was just handed over, but maybe not
for the next one. The producer's last kexec_file_load did place that
exact Image, DTB and command line through the areas in that order, so I
agree that reloading the same image from the consumer will find the same
spot. The order is still arbitrary though, and whether it works seems to
depend on the size of the image being loaded.

To give you the case I was looking at: on a QEMU arm64 guest with 4K
pages, 2 GiB of RAM and kho_bootmem=44M,64M,64M, the 44 MiB lowmem area
is reserved first, at the top of RAM (0xb8800000). The Image is about
38 MiB, and the DTB has to go above it on a 2 MiB boundary, which lands
exactly on 0xbb400000, the end of that area. The load then fails with
"kexec_file_load failed: Cannot assign requested address", and the next
area is never tried, because the walk stops at the first area that
cannot take the buffer. With the areas walked in address order the same
image is placed in a lower, larger area and boots. So the first area
decides, and a few MiB of growth in the Image or a larger DTB is enough
to flip the result -- which is the part that makes me a bit nervous
about the first kexec after a handover.

It also does not settle down the chain, as far as I can tell. A kernel
booted by KHO never reserves, so it never sorts: B inherits A's order,
C inherits B's order, and only a cold boot sorts. That makes the same
binary behave differently depending on how it was started. Sorting in
kho_mem_retrieve as well would cover it.
> 
> And after a cycle of KHO boots to newer kernels we anyway can get to the
> point when bootmem is not large enough.
That is the same argument, and it is probably why I am not fully
convinced that the previous successful kexec covers the ordering case
either. The inherited state was adequate for the load that produced the
running kernel, not necessarily for the load it is about to perform.

>  
>>> +static int kho_bootmem_walk_top_down(struct kexec_buf *kbuf,
>>> +				     int (*func)(struct resource *, void *))
>>>  {
>>>  	int ret = 0;
>>> -	int i;
>>>  
>>> -	for (i = 0; i < kho_bootmem_cnt; i++) {
>>> -		struct resource res = {
>>> -			.start = kho_bootmem[i].addr,
>>> -			.end = kho_bootmem[i].addr + kho_bootmem[i].size - 1,
>>> -		};
>>> +	for (int i = kho_bootmem_cnt - 1; i >= 0; i--) {
>>
>> kho_bootmem_cnt is unsigned, but the reverse loops in
>> kho_reserve_bootmem() and kho_bootmem_walk_top_down() start an int
>> counter at kho_bootmem_cnt - 1, which for a zero count is UINT_MAX
>> converted to int.  That conversion is implementation-defined; with the
>> current compilers it yields -1 and the loop body is skipped.
> 
> We never get here with kho_bootmem_cnt == 0.
Unless I am misreading it, we do, via kho_bootmem=0%. The parser accepts
it and stores the scale without a zero check, then bootmem_size_update()
takes the explicit-size branch and assigns the zero-initialised
bootmem_size_pernode to every node. kho_reserve_bootmem_area() returns
early for a zero size without recording the area, so kho_bootmem_cnt
stays 0 and kho_enable is left alone and only the error path clears it.

kho_locate_mem_hole() is guarded by kho_enable only, so with cnt == 0
both walks return 0 and the caller turns that into -EADDRNOTAVAIL: KHO
is enabled with no regions and every kexec_file_load fails with "Cannot
assign requested address".

FWIW this became possible with 214f9649 commit, before it the
zero-sized areas were recorded, so cnt was never 0. The zero-scale patch
you posted in the v4 series [v3 1/5]thread closes this one.

>  
>> How about using this one.
>> 	for (unsigned int i = kho_bootmem_cnt; i-- > 0;)
>>
>> Reviewed-by: Mukesh Pilaniya <mpilaniy@redhat.com>
> 
> Thanks!
>  
>> -- 
>> Regards,
>> Mukesh Pilaniya
>>
> 

-- 
Regards,
Mukesh Pilaniya

