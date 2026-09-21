Received: from mta1.migadu.com (out-236.mta1.migadu.com [95.215.58.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B735318ED7
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789962584; cv=none; b=GXYqsjRLCYOjobPpVe4O8wFlNfYt3rkk8fZwOo7Y433J//YyZo/h/Tlp4VxW26MEBWxMYE1tPJDbJ5CnNeQnKVkHjXTCAIsmA+lqxXC+ZdPgmgCyDXw2POWyPPsJdsShQC/oZeLVdp3fUEMGgVoJ6qP3TjNfMY7oVxwrbJnWkDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789962584; c=relaxed/simple;
	bh=28SAODsjBVAdEFNL/DREIySi6dVovlUoxUjNe7E0v7k=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=jns1viTEMPgcg3K2pN6V6KO0HoyvDzKofF2wzzlAxdTe8YYwHJVVpOe8xiDo8oZ00DDCPSq0e6Rlmp7cKIHjq6qQLx28qd0V4eC3qmd8moRW3WNiXYVSWOI7c1Z78xNDF7JenESigKpoLdoRjrRaslDE+7/CZF5+ae/HXJyNKEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=R3djp9Lp; arc=none smtp.client-ip=95.215.58.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="R3djp9Lp"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=28SAODsjBVAdEFNL/DREIySi6dVovlUoxUjNe7E0v7k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789962580; v=1; x=1790567380;
 b=R3djp9Lp6q7p1WQW44p6wZoyKGyJN0bqYAZSySR1ojICUXRB2S1cozr2bAwNFJhz4iN3zIf3
 vX3oEkH4Yx7LZ1g7RMkzlXW5dBE+cBtq376DVzzzUpqmBWzUsJDJd7Gz5LwiPbIzWxTMLoDl2PU
 kEmUhQUTmSbSfTviXpL/KLeE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id e91057e5e69ad459;
	Mon, 21 Sep 2026 03:49:39 +0000
X-Mizu-Trace-ID: e91057e5e69ad459
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH 1/6] mm/sparse-vmemmap: drop VMEMMAP_POPULATE_DAX
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <95d326cb-ebb4-492c-9062-5d373609e18b@linux.dev>
Date: Mon, 21 Sep 2026 11:49:23 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Mike Rapoport <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <6479325A-E6FA-45BD-9392-262E71467EDB@linux.dev>
References: <20260913083734.86802-1-songmuchun@bytedance.com>
 <20260913083734.86802-2-songmuchun@bytedance.com>
 <186ee2ba-daf3-4120-a3e3-101cac1ff5a1@linux.dev>
 <4AA6C66B-0FD8-49F3-8447-959A3E438FC2@linux.dev>
 <95d326cb-ebb4-492c-9062-5d373609e18b@linux.dev>
To: Qi Zheng <qi.zheng@linux.dev>
X-Mailer: Apple Mail (2.3864.700.51.1.1)



> On Sep 21, 2026, at 11:43, Qi Zheng <qi.zheng@linux.dev> wrote:
> On 9/19/26 10:07 PM, Muchun Song wrote:
>>> On Sep 19, 2026, at 22:01, Qi Zheng <qi.zheng@linux.dev> wrote:
>>> On 9/13/26 4:37 PM, Muchun Song wrote:
>>>> VMEMMAP_POPULATE_DAX currently distinguishes DAX vmemmap population =
in two
>>>> places: it keeps allocations on the normal path and takes a =
reference when
>>>> a backing page is supplied for reuse.
>>>> After Device DAX switched to the common per-zone shared tail page, =
both
>>>> conditions can be determined locally. DAX supplies ptpfn for every =
shared
>>>> tail mapping and requests an allocation only for compound head =
mappings,
>>>> whose PFNs are not optimizable. Therefore, =
vmemmap_optimizable_pfn() alone
>>>> selects the correct allocation path.
>>>> When ptpfn is supplied, the caller is reusing an existing backing =
page.
>>>> Once the slab allocator is available, take a reference for each =
reused
>>>=20
>>> Does the availability of slab mean the buddy allocator is already =
being
>>> used? Could there be a window where the buddy allocator is =
functional
>>> but slab hasn't become available yet?
>> Yes, because the slab allocator is based on buddy allocator. But I =
want to know
>> what's your concern here?
>=20
> The goal here is to check if the buddy allocator is ready, but the =
code
> actually checks for slab.
>=20
> I'm concerned there could be a gap between these two:
>=20
> buddy is ready <-- gap --> slab is ready

There is no vmemmap population during the gap. We don't need to concern =
the gap.

Thanks.

>=20
> Thanks,
> Qi
>=20
>=20

