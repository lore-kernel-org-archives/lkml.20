Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733000;
	b=W0wbRKnPZAgJq1LbDK4Gu8dBMQN8crmkSMsl/gUwmD06wmHJlsrElzhagEL4qInKYtCH
	 bcrr0W0TxAVh3nF4jBmiW2vNvi9zJMYzql09+x7ywKIRib9ugfOJsgSOAp8ITqnFmzo0o
	 tVua89ZT95b+HAx1CnFVVqboMVenaK+0EmitCjSH8s+mbomRDSFmiHHX+9SIyaDXcjEPK
	 pG23MTqUxaiINBtLz3SNVD8sAwrYIDYwJ7CzK1V71BUZxjklQ88J0FO4fNKlZpOq8ELGy
	 ijaVopJN1oomdK3PSkHCllYzWS6GU/lQfrs5/RbKdadQqxT3scqmjW/ARwbber1hg0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733000;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=EIEaJi7O1+E/vAyp7gWUtcsPh4fKYZk8jULGdKld6LY=;
	b=z24PJ9pqTpBsISCrOPO+QXMETeyX15Hl4WTjZRpuSTUpXgxgzsCy0QCwvSHcA2vqN6lm
	 OTfCnxCi7OtjfNPBpxw50WVGIEK2ZTgP+eGjJLrqVUaGGks/JfryYbiQGWjBI9HVQ8zY/
	 W8rvdU/EbDhztJGcXgvSaW85AfTxKwTRiqQBYIuVR1OQQr5l510Qkdrd4Lki2JZ4XFO5P
	 nT3V1CugqPay1lN8GIn0dcbVlFasXu41hWPCetaK6r+SZ5ZiAUEXHDhYe8o6WYAo9Kc94
	 XOv53APmu/oBvgwKFUEGKDXHMYWy/5PxwwIcKU9baIPF7G/6u6pSajwv2jnpbuUeRsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="wa8zah/B";
	arc=none smtp.remote-ip=95.215.58.122
Received: from mta1.migadu.com (out-122.mta1.migadu.com [95.215.58.122])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF73606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:56:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BF73606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wa8zah/B
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=21+fkMMqv9ioo8p23KKS2p4sNO5hkMmWorH5aoezr/Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794732996; v=1; x=1795337796;
 b=wa8zah/BvLG8PwnznUaZxBsB6POh0xzqGrQVJUxEEZQFG0J5CgoaFppz8s0epEVzYm4m3CI7
 wVsc0XBQ2p++BTMG+lMNR+KriQlkAFiVFIqXW7nwRkqgLTunzi3+eHMzMaWhbQbbXTVLzPw908k
 MNT1pzo1lLMJuMDLgRvBdC/E=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 55d94d9b38c6f810;
	Sun, 15 Nov 2026 08:56:35 +0000
X-Mizu-Trace-ID: 55d94d9b38c6f810
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
In-Reply-To: <90DD8319-BE49-4355-8CFF-36B7AA9BA4EA@linux.dev>
Date: Sun, 15 Nov 2026 16:56:08 +0800
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
Message-Id: <76423A5A-0658-44B1-912F-EA3AFE54FE77@linux.dev>
References: <20261114104150.58424-1-songmuchun@bytedance.com>
 <20261114104150.58424-3-songmuchun@bytedance.com>
 <20261114222344.e65dbc73bf2c9276@chrisdown.name>
 <90DD8319-BE49-4355-8CFF-36B7AA9BA4EA@linux.dev>
To: Chris Down <chris@chrisdown.name>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 15, 2026, at 14:44, Muchun Song <muchun.song@linux.dev> wrote:
>=20
>=20
>=20
>> On Nov 15, 2026, at 14:23, Chris Down <chris@chrisdown.name> wrote:
>>=20
>> Hi Muchun,
>=20
> Hi,
>=20
>>=20
>> This looks good to me in general, I only have a few small things.
>=20
> Thanks for taking a look.
>=20
>>=20
>> Muchun Song writes:
>>> -	/*
>>> -	 * page_owner must be initialized after buddy is ready, and also =
after
>>> -	 * slab is ready so that stack_depot_init() works properly
>>> -	 */
>>> -	page_ext_init_flatmem_late();
>>=20
>> Not a big deal, but this means that on FLATMEM the init callbacks now =
run
>> after vmalloc_init() rather than straight after kmem_cache_init(). I =
can't
>> see anything that depends on the old place, but FLATMEM isn't what =
the
>> patch is about, so it'd be good to say in the changelog that this =
moves.
>=20
> Sure. The new behavior is aligned with the non-FLATMEM case. It should =
be fine.
>=20
>>=20
>>> +	if (!slab_is_available()) {
>>> +	addr =3D memblock_alloc_try_nid(size, PAGE_SIZE, 0,
>>> +				      MEMBLOCK_ALLOC_ACCESSIBLE, nid);
>>=20
>> Maybe this should pass __pa(MAX_DMA_ADDRESS) as min_addr, like
>> alloc_node_page_ext() does, so that the tables stay out of ZONE_DMA =
when
>> there's room elsewhere?
>=20
> Make sense.
>=20
>>=20
>>> +	page =3D virt_to_page(addr);
>>> +	if (PageReserved(page)) {
>>> +		memmap_boot_pages_add(-nr_pages);
>>> +		kmemleak_free_part_phys(__pa(addr), table_size);
>>> +		free_reserved_area(addr, addr + table_size, -1, =
"page_ext");
>>> +	return;
>>=20
>> free_reserved_area() prints "Freeing page_ext memory" when it's given =
a
>> name, and this runs once for every section, so offlining a few =
gigabytes
>> would put dozens of those in the log. I think it should pass NULL =
instead.
>=20
> Good point. I'll pass NULL in v2.
>=20
>>=20
>> Did you manage to get this branch to run, by the way? KMSAN is the =
only
>=20
> No. I only verified that the KMSCN kernel boots successfully.
>=20
>> user of need_early, and from a quick check offlining a memory block =
on a
>> KMSAN kernel fails with EBUSY, presumably because the metadata pages =
can't
>> be migrated, so I couldn't exercise it myself.
>=20
> I'll exercise this code on this path and report back.

I exercised this branch with a non-KMSAN kernel by temporarily setting
page_owner_ops.need_early =3D true. Offlining a boot memory block =
succeeded,
nr_memmap_boot_pages decreased by 576 pages, and the kernel logged:

    Freeing page_ext memory: 2304K

A subsequent kmemleak scan completed without reports or kernel warnings.

I could not exercise the branch with KMSAN enabled. During the
memblock-to-buddy handoff, kmsan_memblock_free_pages() retains the first
two of every three same-order blocks as shadow and origin backing, and
only releases the third block to the buddy allocator. The retained =
metadata
pages are not migratable. On this x86 setup, every ordinary boot memory
block therefore contains KMSAN metadata pages, and memory offlining =
fails
with -EBUSY before the MEM_OFFLINE notification is sent. Consequently,
page_ext_callback() never reaches this branch.

Thanks,
Muchun

>=20
>>=20
>> Once the changelog and the log message are fixed, please feel free to =
add:
>>=20
>> Reviewed-by: Chris Down <chris@chrisdown.name>
>=20
> Thanks for your review.
>=20
> Muchun
>=20
>>=20
>> Thanks!
>>=20
>> Chris


