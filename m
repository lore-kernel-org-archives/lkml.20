Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794725121;
	b=ngvy8R6pXsrn3O80aEmOwkpMIr72kxXIczBwWRUoevAoJxP8muHGl1jWdqhFCphyU/T4
	 G7aneHhUR7xd3Iyip5srRDNKiS0US1iW0625AI7kdumCvniQYfQWCmRD1rCxAjhrFv+MH
	 P3AreosypWc4iK3JOgeqfZ545P68fDBBLAX95VWbce4xv2Mdxq2Xcy2UBH3Cn5s1uUhL7
	 uu7WxPBvQnG0qdR99nPE2F3MV/+/lmn+0nAZSPceUkgQuM8+bqWbzajncbHi9Yvw/aHwR
	 YTpJKJ0GaOy9AyJJllLravHwd4PE18wRgeBxqP62izjNThRtjY9yJJ/IBLCbe4fZvEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794725121;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=Hy9lM7OviU25g29M4jtdgfdBG7/TUKoGJ32oQNZu2Rk=;
	b=mk6GrkE6lA9zvWA9DBFsJXQJuOmP0KYu/PaKi7iJsBiorkgCIVd3HDv9y6B6LDFCmU2y
	 73rg5tw38PkZN0xcV84lkbp04gXLqJSzfchD8iwIEq7RI2MbjCD7om9ynl8XN0vlqQHfs
	 w5Csoma4RwKCwg9Jg6if/5qAkX326JdQzVYekSAQGiJsxiQJTk0GRUN9Jc3SHiq0CQFaX
	 qWUSBe7QjZ8k0iO4CPpbo8LysD+S2CcmdV1eatG2CiMs+qYefE82jG7dvLVp+igHr9/2z
	 qNoggLp78vl10e6z97zARMLwuW5TfXg2UzMu2AEg5M5SqrNRm92cW1tvbdHs8DKWSbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="pi/7Vgk/";
	arc=none smtp.remote-ip=95.215.58.175
Received: from mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4C5606A332
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:45:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D4C5606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pi/7Vgk/
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5XwkqcHFhPzVcZzlFSKG0JJJqOr0gHJXncGteFyJ/mA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794725118; v=1; x=1795329918;
 b=pi/7Vgk/vReb8RlEMiv3d7thFIcJAVGv1rywzYoz+LpmJdUTWrjcsvBySOGJz0YTLpCSZxyW
 1xF6iADHJjmvvy6H8rYGb+5+1V6imgFGwVuVWkqngD01ZotbUyughQEEOu19omZzq0/bjArPChf
 3m/3Tu9qfjr7ApiL5j6oucv8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 84e8d21794d04bb6;
	Sun, 15 Nov 2026 06:45:15 +0000
X-Mizu-Trace-ID: 84e8d21794d04bb6
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
In-Reply-To: <20261114222344.e65dbc73bf2c9276@chrisdown.name>
Date: Sun, 15 Nov 2026 14:44:45 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 David Hildenbrand <david@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,
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
Message-Id: <90DD8319-BE49-4355-8CFF-36B7AA9BA4EA@linux.dev>
References: <20261114104150.58424-1-songmuchun@bytedance.com>
 <20261114104150.58424-3-songmuchun@bytedance.com>
 <20261114222344.e65dbc73bf2c9276@chrisdown.name>
To: Chris Down <chris@chrisdown.name>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 15, 2026, at 14:23, Chris Down <chris@chrisdown.name> wrote:
>=20
> Hi Muchun,

Hi,

>=20
> This looks good to me in general, I only have a few small things.

Thanks for taking a look.

>=20
> Muchun Song writes:
>> -	/*
>> -	 * page_owner must be initialized after buddy is ready, and also =
after
>> -	 * slab is ready so that stack_depot_init() works properly
>> -	 */
>> -	page_ext_init_flatmem_late();
>=20
> Not a big deal, but this means that on FLATMEM the init callbacks now =
run
> after vmalloc_init() rather than straight after kmem_cache_init(). I =
can't
> see anything that depends on the old place, but FLATMEM isn't what the
> patch is about, so it'd be good to say in the changelog that this =
moves.

Sure. The new behavior is aligned with the non-FLATMEM case. It should =
be fine.

>=20
>> +	if (!slab_is_available()) {
>> +		addr =3D memblock_alloc_try_nid(size, PAGE_SIZE, 0,
>> +					      MEMBLOCK_ALLOC_ACCESSIBLE, =
nid);
>=20
> Maybe this should pass __pa(MAX_DMA_ADDRESS) as min_addr, like
> alloc_node_page_ext() does, so that the tables stay out of ZONE_DMA =
when
> there's room elsewhere?

Make sense.

>=20
>> +	page =3D virt_to_page(addr);
>> +	if (PageReserved(page)) {
>> +		memmap_boot_pages_add(-nr_pages);
>> +		kmemleak_free_part_phys(__pa(addr), table_size);
>> +		free_reserved_area(addr, addr + table_size, -1, =
"page_ext");
>> +		return;
>=20
> free_reserved_area() prints "Freeing page_ext memory" when it's given =
a
> name, and this runs once for every section, so offlining a few =
gigabytes
> would put dozens of those in the log. I think it should pass NULL =
instead.

Good point. I'll pass NULL in v2.

>=20
> Did you manage to get this branch to run, by the way? KMSAN is the =
only

No. I only verified that the KMSCN kernel boots successfully.

> user of need_early, and from a quick check offlining a memory block on =
a
> KMSAN kernel fails with EBUSY, presumably because the metadata pages =
can't
> be migrated, so I couldn't exercise it myself.

I'll exercise this code on this path and report back.

>=20
> Once the changelog and the log message are fixed, please feel free to =
add:
>=20
> Reviewed-by: Chris Down <chris@chrisdown.name>

Thanks for your review.

Muchun

>=20
> Thanks!
>=20
> Chris

