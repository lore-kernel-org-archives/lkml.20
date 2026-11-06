Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793933673;
	b=dmmhquIyX2JneNU4cvbNq/ZWCSfN5t0BZgDhTTYEkS8L3oIRTx0KPAsX3mWj9vzocA+9
	 4nmzpmG4toy3KaNyllPY/tfqBpATReHqcLQZy+Ve1k3JcfdaFyjB6GhDaw0g5CDHE3bpn
	 CmPxoikGyuQpoZcrApEh4PpquZZ/ghz1P6jWbc5nUYXuhcXdvgPo/gMJ5Sa1EUhDTfN2l
	 6St70pBWbAp5NdJFfe+JHeYslk75ZSZ0WvJ/v9ma0C6ORew4FCg0ormMIGUD5zPpuWFfx
	 WCFOO4wcwFHYs9X7ia7qt5B4hS5M+lq/peaP1JD/sVVQSgGdoQ+tSR0ju6oLdhfOuGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793933673;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=+zOtCFcE7RqUU0PBGSnDyGDe/moPxuMOnjuMw8Y5ppU=;
	b=q59ZoTxlkStSrGVqTaguk909bJEggl1b2k1Zi6Y9rnsnyKDO6yOfDwuLGK+Z6Ob/UW2l
	 c3hWjNxnk62XRtAXRwtA0LvUOEXb9zdYRS5aBQKklHTLDXmlc7TgBDB2uyF41baCX5wg1
	 /no8uH6mFjXkabD5KEAp8yhOFA1YmS0qPwx1n4OFNhiyUjYo7OymHn1lUm0+kh31w3+2q
	 YjmEDUGDL/u+QrhtEsM9oa+rVZnVYfAG6zfs+S/9K/0NYD4T8vRn0s5791cA/j6QcSjf9
	 ZBcnUzQ78a0l1t2oELVHVrvKAxidLtMTD27kxKfq7UWOt7nwEbP8skcVFl7vQwMUNsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=giIFEOCE;
	arc=none smtp.remote-ip=91.218.175.51
Received: from mta0.migadu.com (out-51.mta0.migadu.com [91.218.175.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166D1606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 02:54:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 166D1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=giIFEOCE
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=cq7ZuuC5w2lt71axYm7fgLbho4rWP3X1twp9z5xV2ZU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793933670; v=1; x=1794538470;
 b=giIFEOCEQO1u+pkZHjbf8duu258+M6iZsrdqhnn9+VYR4/3OZzXw8ZI/g+VSbMVTTqZjG6G1
 x1oxJh5hwiSoUXVMel1yIo/JRiKQdNW9T2RMv/kgYfkuhWNPq1kO1LOkl5WZkyMWi5dt2CX8H3o
 exu6iY8JiNHZFZIGP3SbH09k=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 58241d6b69efd81c;
	Fri, 06 Nov 2026 02:54:30 +0000
X-Mizu-Trace-ID: 58241d6b69efd81c
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
Subject: Re: [PATCH v2 2/4] mm: gup: allow long-term pins of CMA-allocated
 HugeTLB folios
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <39b7ecd4-e5a1-48d9-8d34-4bf8f8ad4ca2@linux.dev>
Date: Fri, 6 Nov 2026 10:54:10 +0800
Cc: osalvador@suse.de,
 David Hildenbrand <david@kernel.org>,
 akpm@linux-foundation.org,
 azpijr@gmail.com,
 Lance Yang <lance.yang@linux.dev>,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,
 stable@vger.kernel.org,
 Qi Zheng <zhengqi.arch@bytedance.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <ED3C9A78-9823-4F37-BF2B-0A8873001BF5@linux.dev>
References: <cover.1793850539.git.zhengqi.arch@bytedance.com>
 <818fb0b4bbb234e4a2bd0552d61634f1a8431616.1793850539.git.zhengqi.arch@bytedance.com>
 <8F5F930D-A05E-4255-8E70-2567921A92A0@linux.dev>
 <39b7ecd4-e5a1-48d9-8d34-4bf8f8ad4ca2@linux.dev>
To: Qi Zheng <qi.zheng@linux.dev>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 6, 2026, at 10:48, Qi Zheng <qi.zheng@linux.dev> wrote:
>=20
>=20
>=20
> On 11/5/26 1:13 PM, Muchun Song wrote:
>>> On Nov 5, 2026, at 12:07, Qi Zheng <qi.zheng@linux.dev> wrote:
>>>=20
>>> From: Qi Zheng <zhengqi.arch@bytedance.com>
>>>=20
>>> Long-term pinning treats explicitly CMA-allocated HugeTLB folios as
>>> unpinnable, causing unnecessary migration or pinning failures.
>>>=20
>>> These folios already own their CMA bitmap ranges, and memory blocks
>>> overlapping CMA areas cannot be offlined. Allow HugeTLB folios with
>>> HPG_cma to be pinned directly, including in ZONE_MOVABLE.
>>>=20
>>> Fixes: cf11e85fc08c ("mm: hugetlb: optionally allocate gigantic =
hugepages using cma")
>>> Cc: stable@vger.kernel.org
>>> Suggested-by: Muchun Song <muchun.song@linux.dev>
>>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> Acked-by: Muchun Song <muchun.song@linux.dev>
>=20
> Thanks.
>=20
>> But a nit bellow.
>>> ---
>>> include/linux/mm.h | 29 +----------------------------
>>> mm/gup.c           | 31 +++++++++++++++++++++++++++++++
>>> 2 files changed, 32 insertions(+), 28 deletions(-)
>>>=20
>>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>>> index 2d0b8a4c9974f..75dd40265d3f4 100644
>>> --- a/include/linux/mm.h
>>> +++ b/include/linux/mm.h
>>> @@ -2975,35 +2975,8 @@ static inline bool is_zero_folio(const struct =
folio *folio)
>>> return is_zero_page(&folio->page);
>>> }
>>>=20
>>> -/* MIGRATE_CMA and ZONE_MOVABLE do not allow pin folios */
>>> #ifdef CONFIG_MIGRATION
>>> -static inline bool folio_is_longterm_pinnable(struct folio *folio)
>>> -{
>>> -#ifdef CONFIG_CMA
>>> - 	int mt =3D folio_migratetype(folio);
>>> -
>>> - 	if (mt =3D=3D MIGRATE_CMA || mt =3D=3D MIGRATE_ISOLATE)
>>> - 		return false;
>>> -#endif
>>> - 	/* The zero page can be "pinned" but gets special handling. */
>>> - 	if (is_zero_folio(folio))
>>> - 		return true;
>>> -
>>> - 	/* Coherent device memory must always allow eviction. */
>>> - 	if (folio_is_device_coherent(folio))
>>> - 		return false;
>>> -
>>> - 	/*
>>> - 	 * Filesystems can only tolerate transient delays to truncate =
and
>>> - 	 * hole-punch operations
>>> - 	 */
>>> - 	if (folio_is_fsdax(folio))
>>> - 		return false;
>>> -
>>> - 	/* Otherwise, non-movable zone folios can be pinned. */
>>> - 	return !folio_is_zone_movable(folio);
>>> -
>>> -}
>>> +bool folio_is_longterm_pinnable(struct folio *folio);
>>> #else
>>> static inline bool folio_is_longterm_pinnable(struct folio *folio)
>>> {
>>> diff --git a/mm/gup.c b/mm/gup.c
>>> index 2b405cce2ca5c..e8503141bb275 100644
>>> --- a/mm/gup.c
>>> +++ b/mm/gup.c
>>> @@ -2216,6 +2216,37 @@ struct page *get_dump_page(unsigned long =
addr, int *locked)
>>>=20
>>> #ifdef CONFIG_MIGRATION
>>>=20
>>> +bool folio_is_longterm_pinnable(struct folio *folio)
>>> +{
>>> +#ifdef CONFIG_CMA
>>> + 	int mt =3D folio_migratetype(folio);
>>> +
>>> + 	/* Explicit HugeTLB CMA allocations own their bitmap ranges. */
>> The description of "bitmap ranges" is weird, making me think what's =
the meaning of
>> bitmap. Please use more generic description here.
>=20
> How about this:
>=20
> /* These HugeTLB folios own the CMA memory, so they can be long-term =
pinned. */
>=20

At least better than original.

Thanks,
Muchun

> Thanks,
> Qi


