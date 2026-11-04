Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793794409;
	b=dH8EGbTxb7G3Dq6SO+xxZJAHxmJx50C9fY7zyfZnxRYZ5acKmYNHEiOf+9DWwSIO3dxI
	 kfBrC646jVzE/SA3uSDjG0QbQaXoELA4d5ye+PyDgEL2mGropbF4lofqbvifkpWB8B5Cz
	 /W6bl4308d9HqX//o8ufw6wSARm5wuNCj2X/PPuviF7Q5fCj13TpMYZ/quhr598xG6RGH
	 CNXtmNATsqijyxB+ioMUHGVC0y8qo+FL8rGSO68dBbdd+XsO3LX+EtvnDTQin+NwytSoG
	 uLnuUWWF/pCOb181dEVPrCevqSo1AqL1drTC+4ZpvYHLHT1W7/raN6INbxeQc3My0Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793794409;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=xI1Euu70YUflyL8kMW3VkLtf2BBOiDl/YP7uIS54om4=;
	b=Wt1uU1hes96VXVTtbWgFAYFcW1bRs7YOXlNSGTyenvrFO94XkLm0edK3OVXuLSO8Gn1p
	 VjiXWiyUPmh3uMH2d6HEqTShSqg4KJi5XObOr6dD5anApWAyYwLdEpE6FTr86EgzJh9K1
	 KKeqyP9ViOAeQk/ts7WZJyt25bhXVNgi0B0DP3mJe8wBGUcO8zyb9wjcUUctHAkqC+U9M
	 kPjLCsfpDTHPoRt3W1PMkQr2yvSM2g2TprigsC+P2bC1hDTJI3+mGa9dUYHAPqqLyninD
	 3qJGHKT85VLVNK80Xuyd4jW1xziXh2/2k3LxRwgR1OwltKupcNSS7TcT5dAgv3KqEYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bjt0GwCP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871DC606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bjt0GwCP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B4871F000C1;
	Wed,  4 Nov 2026 12:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793794409;
	bh=xI1Euu70YUflyL8kMW3VkLtf2BBOiDl/YP7uIS54om4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=bjt0GwCPsVqSBZmBajC5cqnTxurvBTha5TBGNnuGjMcY/0RTazrh5fIHq8bFWGQJZ
	 Sl3ZZM5n6doE/Ftx4asgxVmHQR2R1O/dLRdMTU+uCRc5KobE6A61lhMFJxz2AAXL/n
	 mwLfVnHy8mP8qKSgleVvE0YCsvOODm/0zkLprwAHYenBDBa5Hu96BT20L6ne2x8mqc
	 eaMc0NaaRIaVF4HKwPhtv0exAzuTDF+YQSqiLvhEhZtocQ5lU6tno7VrHd/Ukf5JPF
	 lv8lFVhK9j8reWbzfJSRVa1gx4MjwWy8dUqz65qOkXdM62ndm/VwxfOTM4FL5S4tPK
	 yqE/KXNjxSACw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Pasha Tatashin
 <pasha.tatashin@soleen.com>,  Alexander Graf <graf@amazon.com>,  Andrew
 Morton <akpm@linux-foundation.org>,  Chen Pei <cp0613@linux.alibaba.com>,
  George Guo <guodongtai@kylinos.cn>,  Kexin Liu <liukexin@kylinos.cn>,
  Sourabh Jain <sourabhjain@linux.ibm.com>,  kexec@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-mm@kvack.org
Subject: Re: [PATCH 2/2] kho: fix bootmem sizing
In-Reply-To: <auopkIsiqxzg4anJ@kernel.org> (Mike Rapoport's message of "Tue, 3
	Nov 2026 20:36:00 +0200")
References: <20261103-kho-bootmem-sizing-v1-0-45aa74098f34@kernel.org>
	<20261103-kho-bootmem-sizing-v1-2-45aa74098f34@kernel.org>
	<2vxz5wydnbuj.fsf@kernel.org> <auopkIsiqxzg4anJ@kernel.org>
Date: Wed, 04 Nov 2026 13:13:25 +0100
Message-ID: <2vxzse1glrq2.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Nov 03 2026, Mike Rapoport wrote:

> On Tue, Nov 03, 2026 at 05:01:08PM +0100, Pratyush Yadav wrote:
>> Hi Mike,
>> 
>> On Tue, Nov 03 2026, Mike Rapoport (Microsoft) wrote:
>> 
>> > Bootmem areas are sized from overlapping views of the memory reserved in
>> > memblock:
>> >
>> > * the global area is sized from all reserved memory, including memory
>> >   allocated on specific nodes, so on NUMA systems everything allocated
>> >   on a node is accounted in both the global area and the area of that
>> >   node.
>> > * per-node sizes are calculated after the lowmem and the global areas
>> >   are reserved. With CONFIG_NUMA=n all memblock regions belong to node 0,
>> >   so the lowmem and the global areas are accounted in the size of node 0
>> >   area and scaled once again.
>> >
>> > As a result, bootmem is about twice bigger than it should be on NUMA
>> > systems and about four times bigger with CONFIG_NUMA=n. On small systems
>> > reservation of the bootmem may fail and then KHO gets disabled.
>> >
>> > Make the areas cover separate parts of the reserved memory: the lowmem
>> > area covers allocations below ARCH_LOW_ADDRESS_LIMIT, per-node areas
>> > cover allocations above it on each node and the global area covers
>> > allocations that are not bound to any node. Calculate all sizes before
>> > reserving any of the areas.
>> >
>> > With CONFIG_NUMA=n the global area becomes empty and it is not reserved.
>> >
>> > Bootmem sizes in MiB in x86 QEMU VMs, before -> after:
>> >
>> >                      CONFIG_NUMA=y     CONFIG_NUMA=n
>> >   1G,  1 node         176 ->   92       320 ->   80
>> >   4G,  1 node         508 ->  332      1264 ->  316
>> >   16G, 2 nodes       1268 ->  704      2944 ->  736
>> >   32G, 4 nodes       2296 -> 1224      5196 -> 1300
>> >   64G, 4 nodes       4344 -> 2248      9664 -> 2420
>> >
>> > Fixes: 3dc92c311498 ("kexec: add Kexec HandOver (KHO) generation helpers")
>> > Reported-by: Kexin Liu <liukexin@kylinos.cn>
>> > Reported-by: George Guo <guodongtai@kylinos.cn>
>> > Closes: https://lore.kernel.org/all/20260904025101.9959-1-dongtai.guo@linux.dev
>> > Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> > Closes: https://lore.kernel.org/all/20260922131217.698809-1-sourabhjain@linux.ibm.com
>> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>> 
>> Thanks for the patch! My LLM caught an interesting problems that is
>> worth considering.
>> 
>> On arm64, ARCH_LOW_ADDRESS_LIMIT is arm64_dma_phys_limit - 1, and
>> dma_limits_init() sets the default value to PHYS_MASK + 1, and it can
>> also be memblock_end_of_dram() in some cases. So on arm64, it is
>> possible for lowmem to span the entire RAM.
>> 
>> Currently, that results in over-allocation of bootmem, and it ends up
>> being 4x what it should be. While obviously problematic, it should still
>> work. With this patch, all memory is in lowmem, and nothing ever goes to
>> per-node bootmem (except for the node that hosts the lowmem area).
>> 
>> All this is from reading the code, I haven't tried anything out yet.
>> 
>> Not sure how to fix this though. Should we perhaps use
>> min(ARCH_LOW_ADDRESS_LIMIT, U32_MAX) for the lowmem limit?
>
> Argh :)
>
> Maybe we reset lowmem to zero if memblock_end_of_DRAM() <
> ARCH_LOW_ADDRESS_LIMIT?

Sounds good.

>  
>> Also, a couple nitpicks below.
>> 
>> > ---
>> >  kernel/liveupdate/kexec_handover.c | 83 ++++++++++++++++++++------------------
>> >  1 file changed, 44 insertions(+), 39 deletions(-)
>> >
>> > +
>> > +		lowmem = reserved_mem_size(ARCH_LOW_ADDRESS_LIMIT, NUMA_NO_NODE);
>> > +		global = reserved_mem_size(MEMBLOCK_ALLOC_ANYWHERE, NUMA_NO_NODE);
>> > +		global -= lowmem;
>> 
>> Nit: Please add a short comment above this to explain why you remove
>> lowmem from global.
>
> I prefer to extend the comment above the function to say that calculations
> for global and node that includes lowmem remove that.

Sure, that works too.

-- 
Regards,
Pratyush Yadav
