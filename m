Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.91
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793790924;
	b=JD+oY4Fm2SNUaxDr6PUvWL7TsyM6q62NSbLuy7BPfjXvBZqiHEPuEk1hwrviqpjmTY1v
	 k5s5W4pIuKz06xFy86IdMGhkCm4k4QDXgh8A4nsEihzbROs/tXzQ81a/0L0AUtMetvcDy
	 8FaSlu2pP4fKQ7vogHppTNrW3DqJmGWBabAztsAEaDjDUUUxm/KUAfRomJV5b1ZLmeUAl
	 YkRT3Cttb7i1xsPZMd/xsSUKnALxqX/3H8nN+QR+I6+6W1Bzm4luJ1JgtM5cW0qznbQ4/
	 zrzBpkht0k5tA5UUfcgUbt5fRx2ttTYAJVFwAqiLiL/q9qegUV+jBgr94/bOBYsT4zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790924;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=qpEDw5hjXj7841PRbs5dGID3L5ntxvD9VVbE0nNrrAA=;
	b=4fZ9KSqBXxga6LCttel+6UlezxogwZnJog/CJLzb4iSv6hyYIghaJX9KGJMlXFWZ8B/L
	 3UtDTvjFcwsxaYoGn/40bgYV9L0wtAzMRaj3vCZ1XdSXEdHB72TyJUkpO7B4M2NajTa1s
	 lEecVxC0w8IiHVTMigK3mKxqK6iI3jrCm+0rSyMz3gjmKd84jIS6qTGGLv+PrqohUiasw
	 mMAhgOHJ/woIou7PeXsdAtuQRNriaGrdbgyWP4uuMr+GrocnzOsORU4FuKm8IXjnhMFsn
	 AEoKFpvaAnEbLx8s7074SbGlZ+YCf+IOhTMfTDfjbFYt5jMuGiv7VA8PS2eREHFDELw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="hnnV/ht7";
	arc=none smtp.remote-ip=95.215.58.91
Received: from mta1.migadu.com (out-91.mta1.migadu.com [95.215.58.91])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E23606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:15:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15E23606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hnnV/ht7
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=sk+qxKHeyasIiOhy5LS3K94shR3FnmgUqi2mNGl6j6U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793790915; v=1; x=1794395715;
 b=hnnV/ht7MPpfuPiYc5OnoYdShepbOj+OHpIWxHZNm38ZqyIjR7Y7uoRJDw2p0V1pyrYPis2U
 sij1bZavn34aUgginERHwZr3snM7PgIfBThHazlAQ22Koa9sO3YOUcSfCWmL9FiRGHQUG0HWPQn
 DOpWSjYWQQaS+MQXaPyFoHjg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 170b41dc14da184d;
	Wed, 04 Nov 2026 11:15:13 +0000
X-Mizu-Trace-ID: 170b41dc14da184d
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v3 04/12] mm: hugetlb_vmemmap: generalize vmemmap page
 allocation
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <ausBsbaw9DNVh4KA@localhost.localdomain>
Date: Wed, 4 Nov 2026 19:14:48 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>,
 Qi Zheng <qi.zheng@linux.dev>,
 Lance Yang <lance.yang@linux.dev>,
 James Houghton <jthoughton@google.com>,
 David Hildenbrand <david@kernel.org>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <650347FF-8445-45FD-B1F8-085ED6F997B3@linux.dev>
References: <20261104023510.260766-1-songmuchun@bytedance.com>
 <20261104023510.260766-5-songmuchun@bytedance.com>
 <ausBsbaw9DNVh4KA@localhost.localdomain>
To: "Oscar Salvador (SUSE)" <osalvador@kernel.org>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 4, 2026, at 17:58, Oscar Salvador (SUSE) <osalvador@kernel.org> =
wrote:
>=20
> On Wed, Nov 04, 2026 at 10:35:02AM +0800, Muchun Song wrote:
>> Vmemmap page allocation is currently tied to restoring a virtual =
range
>> and assumes an empty destination list.  These constraints prevent it =
from
>> being reused when pages are requested independently of a vmemmap =
range or
>> appended to an existing list.
>>=20
>> Generalize the allocator and give it an all-or-nothing list contract =
so
>> the restore and optimization paths can share the same allocation =
policy.
>> This also allows HVO head-page allocation to fail gracefully under =
memory
>> pressure without triggering the OOM killer.
>>=20
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>> Reviewed-by: Lance Yang <lance.yang@linux.dev>
>> Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
>=20
> Reviewed-by: Oscar Salvador <osalvador@suse.de>

Thanks for your review.

>=20
> A small nit below:
>=20
>> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
>> index 0e5b2b182d1b..d3058e106795 100644
>> --- a/mm/hugetlb_vmemmap.c
>> +++ b/mm/hugetlb_vmemmap.c
> ...
>> +static int alloc_vmemmap_page_list(struct list_head *head,
>> +		unsigned int nr_pages, int nid)
>> {
>> -	gfp_t gfp_mask =3D GFP_KERNEL | __GFP_RETRY_MAYFAIL;
>> -	unsigned long nr_pages =3D (end - start) >> PAGE_SHIFT;
>> -	int nid =3D page_to_nid((struct page *)start);
>> +	LIST_HEAD(new_pages);
>> 	struct page *page, *next;
>> -	int i;
>>=20
>> -	for (i =3D 0; i < nr_pages; i++) {
>> -		page =3D alloc_pages_node(nid, gfp_mask, 0);
>> +	for (unsigned int i =3D 0; i < nr_pages; i++) {
>> +		page =3D alloc_pages_node(nid, GFP_KERNEL | =
__GFP_RETRY_MAYFAIL, 0);
>> 		if (!page)
>> -			goto out;
>> -		list_add(&page->lru, list);
>> +		goto free_pages;
>> +		list_add(&page->lru, &new_pages);
>> }
>> +	list_splice(&new_pages, head);
>> 	memmap_pages_add(nr_pages);
>>=20
>> 	return 0;
>> -out:
>> -	list_for_each_entry_safe(page, next, list, lru)
>> +free_pages:
>> +	list_for_each_entry_safe(page, next, &new_pages, lru)
>> 		__free_page(page);
>> 	return -ENOMEM;
>> }
> ...
>> @@ -527,15 +526,13 @@ static int =
__hugetlb_vmemmap_optimize_folio(const struct hstate *h,
>>  */
>> folio_set_hugetlb_vmemmap_optimized(folio);
>>=20
>> -	vmemmap_head =3D alloc_pages_node(nid, GFP_KERNEL, 0);
>> -	if (!vmemmap_head) {
>> +	if (alloc_vmemmap_page_list(vmemmap_pages, =
VMEMMAP_OPTIMIZATION_PAGES, nid)) {
>> 		ret =3D -ENOMEM;
>> 		goto out;
>=20
> alloc_vmemmap_page_list() already gives you the error code (ENOMEM), =
so
> it would look more natural to me to use that already and not =
"overwrite"
> it.
> e.g:=20
>=20
> ret =3D alloc_vmemmap_page_list
> if (ret)
>     goto out;

Agreed, thanks =E2=80=94 I'll just propagate the return value next =
version.

Muchun

>=20
> but as I said, just a nit :-)
>=20
>=20
> --=20
> Oscar Salvador
> SUSE Labs


