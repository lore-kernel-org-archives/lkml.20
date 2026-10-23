Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.72.0.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792735933;
	b=22JTesIDu5EII9YYbNaS+er03GrBTvMsXAxCktQwo4kggwi2S2YVLdV6xjrpPsATd5Ig
	 GyXTMB2hToNsXXG0Ldgf67FSZKGiwQ1m5t3iCvGkIfuVQG6rQN7dc++LbOFHSTjZKeISN
	 0wHl/22F1NXp5wJsJuNGC296pUrhSaUS6XkcQKWrdf5xOFOK/TOPZskY1axos/Z9zRCXX
	 1DbaUDEUNnDm+4R+2YtWjZ4bPZMyFeke3zWNBtwBN8vp50DYJ2BDFUOUVQFKNKoxbXLtr
	 iWFJ766xtiOEwSmOmGwVqbtdvB+UVRfGmfIC1/geRK1AJ2r8Dwua+xSpE+sfLvH4F4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792735933;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=BLB4RMyLpbOaySg5bzno5AFw3mz4sdewTwFtwU0dbts=;
	b=G0agJzc1Jm0BtxVoeBCrFnAXkSxFdYr6Wri4CMmMNKNoBjvNHxmVixl0xhfGYp3XLF44
	 pWRXTyqT6S+mW+olXQaOs2VwnAfDcrXqqkEyNk9NXcNls5mxSeKz+Auf38HgTCOtwIebS
	 38Nq0LiX/DoetR5tOyk0qjmTCCYHoOhsU4eCmAITSlVn7dVGFNL/w2g3k+3VfC1EoxcOC
	 v9KbAOcd3aKYgwvzVQW+zepndY7mmJ13VR2Gpi0nYZ8H7OkJRIoRRifX3YIotjtPF1Kw3
	 j+NhCevg9UOuFkMtxpalIL8Oths8Kjb4MIVUwhrPUBUVR/P0ft0kJY5KqNS0x2OYFNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gentwo.org;
	spf=pass smtp.mailfrom=gentwo.org;
	dkim=pass header.d=gentwo.org header.i=@gentwo.org header.a=rsa-sha256 header.s=default header.b=a5Z17+nH;
	arc=none smtp.remote-ip=62.72.0.81
Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4952606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4952606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=gentwo.org header.i=@gentwo.org header.a=rsa-sha256 header.s=default header.b=a5Z17+nH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1792735931;
	bh=ei02egPMCgBQVEBhEfrbrg3x+AfiwIgotAy8D3urOK0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=a5Z17+nH8moY4uM7ppZGjF2ucnNE6FBx/XqXwVOpQTPg5PGtop3z2ghci3ucJRGgg
	 xGqVbuSdUCPQJfcugPR0sJMgF+rNiD9mRPImaC+Qng2a+o0XICAWLvFMZzrUhfGPyD
	 8JyOE40e0tL4g/PUieKdtGwTMZLagUjlFzyVLSfI=
Received: by gentwo.org (Postfix, from userid 1007)
	id EE14240261; Thu, 22 Oct 2026 23:12:11 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id EB07A401A2;
	Thu, 22 Oct 2026 23:12:11 -0700 (PDT)
Date: Thu, 22 Oct 2026 23:12:11 -0700 (PDT)
From: Shubhang <sh@gentwo.org>
To: Andrew Morton <akpm@linux-foundation.org>
cc: Uladzislau Rezki <urezki@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, 
    Shubhang Kaushik <shubhang@os.amperecomputing.com>, 
    "Christoph Lameter (Ampere)" <cl@gentwo.org>, linux-mm@kvack.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/vmalloc: reject overflowing vm_map_ram page counts
In-Reply-To: <20261022201921.e418c25c44fd24e46405a3ba@linux-foundation.org>
Message-ID: <69cfd321-0e9d-4fd5-4694-9fb6580e8659@gentwo.org>
References: <20261022-vmalloc-reject-overflow-v1-1-5fde0042ffb9@gentwo.org> <20261022201921.e418c25c44fd24e46405a3ba@linux-foundation.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

Hi Andrew,

On Thu, 22 Oct 2026, Andrew Morton wrote:

> On Thu, 22 Oct 2026 16:35:20 -0700 "Shubhang Kaushik (Ampere)" <sh@gentwo.org> wrote:
>
>> vm_map_ram() converts its unsigned int page count to an unsigned long
>> byte size without checking for overflow.
>>
>> On 32-bit kernels, a count greater than ULONG_MAX >> PAGE_SHIFT wraps
>> the byte size.  vm_map_ram() passes that size to both alloc_vmap_area()
>> and vmap_pages_range(), so it can allocate and map only the wrapped
>> number of pages while returning success for the original larger request.
>>
>> For example, with 4 KiB pages, a count of 1048577 produces a
>> PAGE_SIZE byte size after wrapping, allowing a one-page mapping.
>>
>> Reject page counts whose byte size cannot be represented.
>
> Thanks,
>
> When fixing a bug, please always fully describe the worst-case
> userspace-visible runtime effects of that bug.
>
> AI tells me:
>
> : On 32-bit kernels an overflowing count can currently cause vm_map_ram()
> : to return a non-NULL pointer to a mapping smaller than requested.  The
> : patch makes such requests fail before allocating anything.
> :
> : However, I haven't identified a kernel caller through which
> : userspace can trigger this condition. The callers I've examined
> : appear to constrain the page count appropriately.
> :
> : So I'd describe this as hardening against invalid kernel API
> : arguments rather than fixing a demonstrated userspace-visible
> : failure.
>
>
> Also,
>
> : On 64-bit kernels count is an unsigned int, so the comparison against
> : ULONG_MAX >> PAGE_SHIFT is always false.  Clang W=1 can warn about
> : this, potentially breaking WERROR builds.
> :
> : Could we instead use:
> :
> :	if (check_mul_overflow((unsigned long)count, PAGE_SIZE, &size))
> :		return NULL;
>

Thanks, agreed. I'll respin this using check_mul_overflow().

I'll also expand the changelog to describe the failure mode. On a 32-bit
kernel, converting a requested page count to a byte size can overflow. 
vm_map_ram() can then return success after mapping fewer pages than 
requested. If a caller later accesses the returned address as if all 
requested pages were mapped, an access to one of the omitted pages can 
fault. If another vmalloc mapping occupies that virtual address, the 
access can instead reach unrelated kernel memory. Userspace can observe 
this as a failed operation or a kernel oops/panic; in the worst case, the 
erroneous access can corrupt kernel memory.

I found that udmabuf can pass a userspace-controlled page count to
vm_map_ram() when a DMA-BUF importer invokes its vmap operation. 
However, for the same oversized count, udmabuf also truncates both the 
advertised DMA-BUF size and the byte length used for its SG table.
That said, I have not found a current in-tree importer that accesses the 
returned mapping as if it covered all of the originally requested pages.

Regards,
Shubhang Kaushik
