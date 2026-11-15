Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794730222;
	b=jtokTsMBsyIRnwdVbJDdweNNAtUCdGnRbdWOkfZqy+drWa14UhJ+ow4nrupg3zk1wnKX
	 byOCxj5LTkIk+gHX9Md2BQbTtH8UNY6bzVft2F0F5glNOUlU5e3jm8PqGHQrYVyBN/JSe
	 6ZtifZDgXFyzTsaxDCe6AvnRs6iYVzslIs9EoOtrfN+6XCzHobs06yrMxXsudTnuD4BRp
	 uVqK2R785Nmewk/xSNosTTeG3k+PJgKymFWCSbpuP9P2RC9sAi9QGhzivSII224uKeF/A
	 198fZg8qeh+TtwHCUvzN8NO0606Vhq74IqD/siaeW6ho+rq1O5qyNzWc06lFRTr2xqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794730222;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=eftIXPPf9pXf1ylbm90M+/I8H9a+zbncFEcPQIjwOfY=;
	b=igY4mEKA6I9uU0fgr1d7yM0fv2niQXF7Qhn8MN86A/XnLtoPtkxZtMrz/PJH0Ah52IoU
	 YNmASF5qi8Ddgv+qcEPnc/GdExIX8y6UCcMzUMJMCg9ZrvIpbAdOcy4jZTwgp5h/DleXR
	 LIj3NzJHH0mMXRm9ljkmBU9FklyJb55glVHpin/iiDR0sESYODDkAXCPZNgUfwi3NLaqo
	 oqqMwru+WRd0IhlAAYEuz1/8EORGDx0RzpVn4SUb7wSOjUuCAaFKi26HfeSX3olt3Y1kL
	 AY8gvsOf50/rNS929BD14L5CnBXwCIoa67fiTNoFUs4jHvlSrlu4BvHUfY4jP9SNUqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="g/dalwhO";
	arc=none smtp.remote-ip=91.218.175.161
Received: from mta0.migadu.com (out-161.mta0.migadu.com [91.218.175.161])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F57D606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:10:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F57D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=g/dalwhO
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ks9Q0ch7RjWGng/htsAt9i5kDZUQ9GU4wWCt+aHsq8M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794730219; v=1; x=1795335019;
 b=g/dalwhOy65C6OKo1Qzc3JAqZ/xkb0dSx5SWlC0iP0jDb6JGbD3u72+R9EZrtCJ3kaJvx6MV
 5Dyo/bdBqWLpwek/yW8b0xZA8LBi5rKGg3j5dQPsk81HoGZjvJlvQG6L0vJ6H9w/RC4Tiwr2Y31
 WF406BCUYMQQ8BG8mAL6TtaI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 582e74fec350fdd3;
	Sun, 15 Nov 2026 08:10:16 +0000
X-Mizu-Trace-ID: 582e74fec350fdd3
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH 2/3] mm/page_ext: support early allocation for SPARSEMEM
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <179472790175.1870365.16622132821657916911.b4-review@b4>
Date: Sun, 15 Nov 2026 16:09:55 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 David Hildenbrand <david@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Brendan Jackman <brendan.jackman@linux.dev>,
 Zi Yan <ziy@nvidia.com>,
 Sang-Heon Jeon <ekffu200098@gmail.com>,
 Mostafa Saleh <smostafa@google.com>,
 Ketan <ketan.kishore@oss.qualcomm.com>,
 Usama Arif <usama.arif@bytedance.com>,
 kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <DBDBD5E7-2938-4534-BB3A-35848C4821F3@linux.dev>
References: <20261114104150.58424-1-songmuchun@bytedance.com>
 <20261114104150.58424-3-songmuchun@bytedance.com>
 <179472790175.1870365.16622132821657916911.b4-review@b4>
To: Mike Rapoport <rppt@kernel.org>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 15, 2026, at 15:31, Mike Rapoport <rppt@kernel.org> wrote:
>=20
> Hi Muchun,

Hi Mike,

>=20
>> Moving KMSAN's per-page metadata into page_ext requires page =
extensions
>> to be available when kmsan_init_shadow() runs, before memblock is =
freed.
>> FLATMEM page extensions are available by then, but SPARSEMEM normally
>> allocates them later from the page or vmalloc allocators.
>>=20
>> Add need_early so clients can request SPARSEMEM section backing from
>> memblock during page_ext_init_early().
>=20
> Can't we just always allocate page_ext for early sections from =
memblock?

That would be simpler. I checked the page_ext history but could not find =
a
documented reason for treating boot-time SPARSEMEM sections differently =
or
for avoiding memblock allocation there.

I agree with your suggestion. I will remove need_early and allocate
page_ext from memblock for boot-time SPARSEMEM sections whenever any =
client
needs it.

>=20
>> Use page_ext_init() as the common late path for client callbacks.
>> KMSAN starts requesting early page extensions in the following patch.
>>=20
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>> ---
>> include/linux/page_ext.h | 26 +++--------
>> mm/mm_init.c             | 11 +----
>> mm/page_ext.c            | 99 =
++++++++++++++++++++++++++++++----------
>> 3 files changed, 82 insertions(+), 54 deletions(-)
>>=20
>> +static __ref void *alloc_page_ext(size_t size, int nid)
>> {
>> 	gfp_t flags =3D GFP_KERNEL | __GFP_ZERO | __GFP_NOWARN;
>> 	void *addr =3D NULL;
>>=20
>> +	if (!slab_is_available()) {
>> +	addr =3D memblock_alloc_try_nid(size, PAGE_SIZE, 0,
>> +       			      MEMBLOCK_ALLOC_ACCESSIBLE, nid);
>> +	if (addr)
>> +		memmap_boot_pages_add(size / PAGE_SIZE);
>> +		return addr;
>> +	}
>> +
>> 	addr =3D alloc_pages_exact_nid(nid, size, flags);
>=20
> And unrelated to this patch, do we really need to try an allocation =
from
> buddy rather than always use vmalloc?
>=20

=46rom my perspective, I don't think it's necessary at all. The only =
real
benefit to allocating from the buddy might be better performance =
compared
to vmalloc, but do we actually care about performance here? It doesn't =
look
like this is on the hot path, so I don't think it's necessary. We can =
remove
it to simplify the code. I can make that a separate cleanup.

Thanks,
Muchun

> --=20
> Sincerely yours,
> Mike.


