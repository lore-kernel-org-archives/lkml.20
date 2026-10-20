Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485778;
	b=0Nbd2dQd7ZzRSFv3iOesLe1gtYeE1YgDMonkx+quKIVcNx2WoDXplNWAtv53F4LKtemm
	 HjIoulGOyROkecFycJWMxGCnntUoErr6B7xHaS48M+8yWix7ElXX8ITP6paU2ZCP77Aaa
	 N+HWUv9evj/BwrosxhTRJ4HhCqrzBgOQgj4wcRCAnD//jaBpSFwXsiDBP9VvkcggTbGAX
	 A3GGUWj4IwlP2S1Iy8Y/ClZEpDeZmiBDuCHnhY6M24kqZOWVUDXiKKIjzb6AoXaIoIrUF
	 st/heDm0KV65pO5+uY8vKL1Kpt/ImGZmaxsp7Lnx5IGk7mYIKVnfcxFiBTJorfbsS/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485778;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=sLynr6//lH+2rxsY6ffbt7Cr2xdwoxHTD2+TxPt+66k=;
	b=L0gAy2ClMLAti8D9XZ5d2ET/L7UmjCZo3uXhkSQoMXPPUNvwn1uLikQiZsC74EZXu1Iq
	 nbbbrFoEDS3pG3d4Kr1biMzq36CBhwvMTN+v/cZTPzyHz5hyirH0VOHauuyIFCZ2j58CO
	 cilb03QQo0GNS0Oe7TUttPvd4MEB1vdRv7RO9j/5wMpIWVB1VlNsOsCnjyiHvUKee9Ho2
	 E6rGUPAvsE9NKdrg7KVPTqq6cSlO2r61bF2Irq/6bf4adzIHqpfJlkGApuKGOfuIJJCHi
	 wuN27vhNTNPd/IFYS+OxFYLUjJU4/EByYEBXhb9deC/EhDwTVlqJ0IucwQVECU8UldA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e2cYCQVT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0B0606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e2cYCQVT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E4C41F000C5;
	Tue, 20 Oct 2026 08:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792485777;
	bh=sLynr6//lH+2rxsY6ffbt7Cr2xdwoxHTD2+TxPt+66k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=e2cYCQVT81RkTLLpwPg2CVfrhyKaN1vcviAOmjORE4hrFf1z/hO6KII9Mat0Lktmy
	 abEyCOsIGTrqXzBhobmEb89JCZg4Gz7hYBP9WvCr6rtXz84FE39nlsCSFv56QgmOs/
	 /LgXvk003PCM93iyc0WQVmFqW38Kekez+4FRP1ctF1oa5sKHb/ehbnxpbKK9N9HzBd
	 I90fGmjLh+HPRkeTh1Kn8r5bx6iRjLobhfaKjF188C0TNgreJulITRySfkeXkBQqFZ
	 gwTsZUYwfdZMDG+1ldipvIL4P0zz2rIOVdVWNAxv2wliusIHypFFLQtv3tKEOic85M
	 SZKU1iVljOfaA==
Message-ID: <de86277d-ed7e-4208-a3c2-6d26a8278d0c@kernel.org>
Date: Tue, 20 Oct 2026 10:42:53 +0200
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
Subject: Re: [PATCH v1] mempool: fix min_nr exceeding the elements array after
 concurrent resizes
Content-Language: en-US
To: Harry Yoo <harry@kernel.org>, Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>,
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Vitaly Wool <vitaly.wool@konsulko.se>,
 Vitaly Vul <vitaly.vul@partner.samsung.com>
References: <20261016132510.789715-1-nickolai@csail.mit.edu>
 <atJBK6hWYh2AqXwK@thinkstation>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <atJBK6hWYh2AqXwK@thinkstation>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/16/26 17:46, Harry Yoo wrote:
> [+Cc Christoph Hellwig and Vitaly Wool ]
> 
> On Fri, Oct 16, 2026 at 09:25:10AM -0400, Nickolai Zeldovich wrote:
>> mempool_resize() shrinks a pool by dropping pool->lock around every
>> free_fn() call and, once the pool holds no more than new_min_nr
>> elements, stores new_min_nr into pool->min_nr.  new_min_nr was only
>> compared against pool->min_nr before the lock was first dropped, so that
>> store assumes nothing changed meanwhile.  The kernel-doc allows
>> mempool_alloc()/mempool_free() to run while a resize is in progress and
>> the grow path also copes with concurrent resizes ("Raced, other resize
>> will do our work"), but the shrink path does not: while its lock is
>> dropped another resize may shrink the pool below new_min_nr and a third
>> one may grow it again to a size between the two, replacing
>> pool->elements with an array of exactly that size.  Storing the stale
>> new_min_nr afterwards leaves pool->min_nr larger than the elements
>> array.
>> 
>> Interleaving on a pool with min_nr = curr_nr = 10:
>> 
>>   CPU A: mempool_resize(pool, 8)
>>     takes the lock, 8 <= 10 so it shrinks: remove_element(), drops the
>>     lock, calls free_fn() and is preempted there
>>   CPU B: mempool_resize(pool, 3)
>>     completes: curr_nr = 3, min_nr = 3, elements still has 10 slots
>>   CPU B: mempool_resize(pool, 5)
>>     completes: elements = kmalloc_objs(5), min_nr = 5, curr_nr = 5
>>   CPU A: retakes the lock, 8 < curr_nr (5) is false, stores min_nr = 8
>>     while elements has 5 slots
>> 
>> Every later mempool_free() sees curr_nr < min_nr and add_element()
>> stores the returned element at elements[5], [6] and [7], past the end
>> of the 5-slot kmalloc allocation: a heap out-of-bounds write, i.e. slab
>> corruption, a KASAN report, or a crash in whichever unrelated object
>> sits next to the array.  The invariant that breaks is that pool->min_nr
>> never exceeds the size of pool->elements; every other path that changes
>> min_nr or elements keeps it.

Instead of reading all this, it was simpler for me to check what the code does.

>> An in-tree caller can hit this: fs/smb/client resizes the global
>> cifs_req_poolp from cifs_demultiplex_thread() (grow, when a TCP session
>> is created) and from clean_demultiplex_info() (shrink, when one goes
>> away).  The two are coordinated only through the atomic
>> tcpSesAllocCount, so mounts and unmounts racing on one client run the
>> resizes above concurrently; pool->free is kmem_cache_free() there and
>> the window is a preemption inside it.  The other callers
>> (block/blk-zoned.c, drivers/s390/scsi/zfcp_erp.c) serialise their
>> resizes.

This is useful to know, but maybe could be also less dense.

> The bug looks valid in theory, not sure if how easily it can be
> reproduced in practice as resizing should be quite rare.
> (A bug is a bug and should be fixed, but no need to hurry in this case)

Ack.

>> The shrink path has stored new_min_nr unconditionally since
>> mempool_resize() was introduced, while the grow path has always
>> re-checked pool->min_nr after reacquiring the lock.
> 
> So it's Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2") ? 
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/commit/?id=6892188b54d484098b79b0c9813c20e543124e2d
> 
> ...from a historical commit before git era, 1da177e4c3f4.
> 
>> Re-check new_min_nr against pool->min_nr under the lock before storing
>> it.  If a concurrent resize has shrunk the pool below new_min_nr in the
>> meantime, keep that resize's min_nr (and whatever array it installed),
>> as the grow path already does; otherwise the store is unchanged.  The
>> elements the loop has already freed stay freed, which is right either
>> way because the pool's limit is now below new_min_nr.

Again too verbose IMHO.

>> Found by formal verification of mm/mempool.c against the kernel binary.
>> Reproduced with a userspace build of the affected functions in which the
>> free_fn() callback drives the interleaving above: before the fix min_nr
>> ends at 8 with a 5-slot array and the next mempool_free() writes past it
>> (AddressSanitizer heap-buffer-overflow); after the fix min_nr stays at 5
>> and the element is handed to free_fn().  Not reproduced on a running
>> kernel, where the window is a single preemption inside free_fn().

Alright.

>> Assisted-by: LLM
>> Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
>> ---
>>
>>  mm/mempool.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>> 
>> diff --git a/mm/mempool.c b/mm/mempool.c
>> index cb74e718b2c6..95533e2975ce 100644
>> --- a/mm/mempool.c
>> +++ b/mm/mempool.c
>> @@ -378,7 +378,9 @@ int mempool_resize(struct mempool *pool, int new_min_nr)
>>  			pool->free(element, pool->pool_data);
>>  			spin_lock_irqsave(&pool->lock, flags);
>>  		}
>> -		pool->min_nr = new_min_nr;
>> +		/* Raced, the array may now be smaller than new_min_nr */
>> +		if (new_min_nr <= pool->min_nr)

There could be just '<' ?
The outer if uses <= but the == case only leads to an early goto out_unlock.

>> +			pool->min_nr = new_min_nr;
>>  		goto out_unlock;
>>  	}
>>  	spin_unlock_irqrestore(&pool->lock, flags);
>> 
>> base-commit: 90201351a862182bdabfc1ad1c97b1e1b6ed5931
>> -- 
>> 2.53.0
>> 
> 

