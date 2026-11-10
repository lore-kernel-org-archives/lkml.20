Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329650;
	b=EvczpK3cCM6pwd/U8LQKbHV8OAFROOaDacqXGn8RRPMmAyCKbAwzBDZiVqB9SH3xyBKc
	 yOPBKtoRoYQ6j+t7pCGQK4hlGxnh/g3oY7BkmKVeDG59jPxE4C6A70pkHl6oQLaUG3ZsH
	 Ky2hjPKfVjOez4oEy7lk9Yaaqt8UjjKyaZztKGkuC7hX9XiXtTbynfZ07wv5sG2S5ubfS
	 psVs3gZu1cbaKEPkLjROiPeAaTlwlHFUkZ5gy5vpiMSxrE4D5/xL2X2LgzZR4La0r3vTn
	 o5GdKEFeWt4bYGGsCNuc+9HS52qBoR3+71i727fmtAqmOJbK1U0ZrxecKmMG8ek5cxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329650;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=Ex4dVJ9I9Q8lqhJNdjzHP1bMR0am48AWVaJF7+qsMjA=;
	b=5eCnlZiEUt0pKBmz8Lcbttx5Q9P/5hBtTjdYID89ukk/Q+3nIsVdqwTchLlNioBbS1EE
	 SWL/nNLQ5ccVcsa9vSzU813HlrrXaQW1Dro+mw0cTr06Rq9weAh77O0dxSpfjA2ihyaCa
	 pSUm9CPPnhGDQXKEg/fFmV4oaoG8igxYKm1KqFG4GherKyI6MrNWVxA7a9BIqEQnbwqre
	 dROHCyebNcj5BvRuWo1TD9s09kHA/wbzwWk/pEHA/harItVF2a6/QYTZ03BXbz90vozp6
	 o5G7BgT0z37rIcZM0AIFOCmpsKmnf/4U/BJDbLSPvBfMK2r++mfkEVBcM189MHfGf2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kUjnB7jj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA53606A33C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kUjnB7jj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 953741F0089F;
	Tue, 10 Nov 2026 16:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794329649;
	bh=Ex4dVJ9I9Q8lqhJNdjzHP1bMR0am48AWVaJF7+qsMjA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=kUjnB7jjWwbn6apvOgtDPvTzekBFurc2yWAt+G4hqRvI8O5lNsAhUcsIyDTfsh+Si
	 SeTF3N+b4eOamAS0Ibbv55mh92DVwaX96cf8VKOxWASg0HLYtUZDtqVANs7j9tRUP8
	 TdLmGIphHJhyp8LCoz8oSqLhi1QjBhg8jqNjDAmOy1kOkVNjq3Xkn2Psn99hvE9mvb
	 fnx1bzYQWtKg+xG5bi7ehexY1sbmWYYUIBOAzUFGoE2RFDDE75jnLYKjjzuedaWMup
	 nxzG8Nb7E5fD248tLjuX7ToqybB/EqltODzgwyJErS2Q5swvfHJrAkZur0+Ici9BMR
	 vLYdm4F5aVAUg==
From: Pratyush Yadav <pratyush@kernel.org>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Alexander Graf <graf@amazon.com>,  Andrew Morton
 <akpm@linux-foundation.org>,  Chen Pei <cp0613@linux.alibaba.com>,  George
 Guo <guodongtai@kylinos.cn>,  Kexin Liu <liukexin@kylinos.cn>,  Sourabh
 Jain <sourabhjain@linux.ibm.com>,  kexec@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-mm@kvack.org
Subject: Re: [PATCH v2 3/3] kho: fix bootmem sizing
In-Reply-To: <20261104-kho-bootmem-sizing-v2-3-b0d1a834780f@kernel.org> (Mike
	Rapoport's message of "Wed, 04 Nov 2026 18:50:11 +0200")
References: <20261104-kho-bootmem-sizing-v2-0-b0d1a834780f@kernel.org>
	<20261104-kho-bootmem-sizing-v2-3-b0d1a834780f@kernel.org>
Date: Tue, 10 Nov 2026 17:54:06 +0100
Message-ID: <2vxz33t8iq4x.fsf@kernel.org>
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

On Wed, Nov 04 2026, Mike Rapoport (Microsoft) wrote:

> Bootmem areas are sized from overlapping views of the memory reserved in
> memblock:
>
> * the global area is sized from all reserved memory, including memory
>   allocated on specific nodes, so on NUMA systems everything allocated
>   on a node is accounted in both the global area and the area of that
>   node.
> * per-node sizes are calculated after the lowmem and the global areas
>   are reserved. With CONFIG_NUMA=n all memblock regions belong to node 0,
>   so the lowmem and the global areas are accounted in the size of node 0
>   area and scaled once again.
>
> As a result, bootmem is about twice bigger than it should be on NUMA
> systems and about four times bigger with CONFIG_NUMA=n. On small systems
> reservation of the bootmem may fail and then KHO gets disabled.
>
> Make the areas cover separate parts of the reserved memory: the lowmem
> area covers allocations below ARCH_LOW_ADDRESS_LIMIT, per-node areas
> cover allocations above it on each node and the global area covers
> allocations that are not bound to any node. Calculate all sizes before
> reserving any of the areas.
>
> With CONFIG_NUMA=n the global area becomes empty and it is not reserved.
>
> If ARCH_LOW_ADDRESS_LIMIT covers all memory, as may happen on arm64, any
> area can serve lowmem allocations, so don't reserve the lowmem area.
>
> Bootmem sizes in MiB in x86 QEMU VMs, before -> after:
>
>                      CONFIG_NUMA=y     CONFIG_NUMA=n
>   1G,  1 node         176 ->   92       320 ->   80
>   4G,  1 node         508 ->  332      1264 ->  316
>   16G, 2 nodes       1268 ->  704      2944 ->  736
>   32G, 4 nodes       2296 -> 1224      5196 -> 1300
>   64G, 4 nodes       4344 -> 2248      9664 -> 2420
>
> Fixes: 3dc92c311498 ("kexec: add Kexec HandOver (KHO) generation helpers")
> Reported-by: Kexin Liu <liukexin@kylinos.cn>
> Reported-by: George Guo <guodongtai@kylinos.cn>
> Closes: https://lore.kernel.org/all/20260904025101.9959-1-dongtai.guo@linux.dev
> Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Closes: https://lore.kernel.org/all/20260922131217.698809-1-sourabhjain@linux.ibm.com
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav
