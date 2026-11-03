Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793676114;
	b=AF6bpExOCLXsbKgsairot1d9tbH/fFBXUiAqodwM14EstmiIZZiLXLUH+yd8CroqVNB9
	 sJl/tC0kVAvGj+3ixLwuFUeIMyGKpnGBBTEyFhEiBgLD3ceNy0rTbUbNRuDr0PN0qDl/3
	 m/eo59Y9hjEXIEXUZZOxX/gKwdOykpxvhEjkyeWozZfm2PUfqIqyb7VhlJH78vEsnxvYx
	 0Esru+0k61c6o7jQFzKjqBPtWTcvLaRJX6eEZftXSPZwmgW4mkV8XTu5B4WQoBq53blHe
	 N3TPYGPCJ8ABB/CrRcq65Jx22gHguKB9M4HUIyRxMWziHGUh47AOp9TdQHKK9Hu/uEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793676114;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=6hpdvsK0Hrmc4uMZchvry04ArqEL30GvpLJeJ7hrgyk=;
	b=C4UwOW4IWK/7nOEHwFxTd76P04mg3IRatAOrPk+Fev4uk3FsZ5gVXuy4+pDsZSiFcQCz
	 A+WTH77RsgdIvZqtB1WHqlVTmk6u38yN6D/2s6qshGQr3ZiFIbj26oj4KJFbvxALNw4q9
	 qegYA/dtXKQoOGGFRRGKmUtXXN7xgsVd/ex3esaq0TeMxnlS348JbaWFeyMLo4B/LgLiP
	 scmmjDmk2jYsfrjtoJ5FvWjNI5MZ55SOSWwvyUYS1Ruh/4X2KgYdts1AiPGHHch7aJn1b
	 THKwdotTn4MSXy0JfTxCRMT+xvhXtYeTqxfqGJiq65qKHaWO9X2q/Y+mP1R4/Y39xug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=erDD87IF;
	arc=none smtp.remote-ip=91.218.175.201
Received: from mta0.migadu.com (out-201.mta0.migadu.com [91.218.175.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD4B606A330
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 03:21:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BD4B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=erDD87IF
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qpopzn/+LxUuJye0OmBehYq4z85SruAh2igo69vC/Dg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793676111; v=1; x=1794280911;
 b=erDD87IFKhVaekyO+FkeXbc9mEeQmViLGA8XE/RWb51zBlfheRmlnVVYU0Wmwc+ZlKAkmPvB
 cOc0qyXE0+EhzTbyhd1ViLBplk32nT6aJW+oSWguQK/AQo/YkDJ2XGIv25yzGyY/CEfFoxm3YEQ
 uRH0YOAKwU8QWigGa/Qs5VR4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id bb50f4f34a0a70ae;
	Tue, 03 Nov 2026 03:21:50 +0000
X-Mizu-Trace-ID: bb50f4f34a0a70ae
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
Subject: Re: [PATCH v2 04/12] mm: hugetlb_vmemmap: generalize vmemmap page
 allocation
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <aujPACLfTbPJnIJa@kernel.org>
Date: Tue, 3 Nov 2026 11:21:31 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Qi Zheng <qi.zheng@linux.dev>,
 Lance Yang <lance.yang@linux.dev>,
 James Houghton <jthoughton@google.com>,
 David Hildenbrand <david@kernel.org>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <BFFEC8BA-6BEA-48E5-8D40-687A630D3D64@linux.dev>
References: <20261102032525.3597743-1-songmuchun@bytedance.com>
 <20261102032525.3597743-5-songmuchun@bytedance.com>
 <179361471104.1337633.3959715900505206111.b4-review@b4>
 <09EF0F81-23CA-4F3C-BA0E-41F34A0AA4B2@linux.dev>
 <aujPACLfTbPJnIJa@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 3, 2026, at 01:57, Mike Rapoport <rppt@kernel.org> wrote:
>=20
> On Mon, Nov 02, 2026 at 08:34:03PM +0800, Muchun Song wrote:
>>> On Nov 2, 2026, at 18:18, Mike Rapoport <rppt@kernel.org> wrote:
>>>=20
>>> Hi Muchun,
>>=20
>> Hi,
>>=20
>> It's my email client's fault. Let me email it again.
>=20
> Things happen :)
>=20
>>>> Vmemmap page allocation is currently tied to restoring a virtual =
range
>>>> and assumes an empty destination list.  These constraints prevent =
it from
>>>> being reused when pages are requested independently of a vmemmap =
range or
>>>> appended to an existing list.
>>>>=20
>>>> Generalize the allocator and give it an all-or-nothing list =
contract so
>>>> the restore and optimization paths can share the same allocation =
policy.
>>>> This also allows HVO head-page allocation to fail gracefully under =
memory
>>>> pressure without triggering the OOM killer.
>>>>=20
>>>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>>>> Reviewed-by: Lance Yang <lance.yang@linux.dev>
>>>> Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
>>>> ---
>>>> v2:
>>>> - Collect Reviewed-by from Lance Yang and Qi Zheng
>>>> ---
>>>> mm/hugetlb_vmemmap.c | 39 ++++++++++++++++++---------------------
>>>> 1 file changed, 18 insertions(+), 21 deletions(-)
>>>>=20
>>>> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
>>>> index 0e5b2b182d1bf..4b20a8efc0678 100644
>>>> --- a/mm/hugetlb_vmemmap.c
>>>> +++ b/mm/hugetlb_vmemmap.c
>>>> @@ -334,28 +334,26 @@ static int vmemmap_remap_free(unsigned long =
start, unsigned long end,
>>>> 	return ret;
>>>> }
>>>>=20
>>>> -static int alloc_vmemmap_page_list(unsigned long start, unsigned =
long end,
>>>> -				    struct list_head *list)
>>>> +static int alloc_vmemmap_page_list(struct list_head *head, =
unsigned int nr_pages,
>>>> +				    int nid)
>>>=20
>>> Please indent with two tabs, like David likes :)
>>> Applies throughout the series.
>>=20
>> Sure. Should we update scripts/checkpatch.pl in the future for MM,
>> since this script seems to favor the alignment approach?
>=20
> Yes, makes sense to me.=20
>=20
>>>> -	for (i =3D 0; i < nr_pages; i++) {
>>>> -		page =3D alloc_pages_node(nid, gfp_mask, 0);
>>>> -		if (!page)
>>>> -			goto out;
>>>> -		list_add(&page->lru, list);
>>>> +	for (unsigned int i =3D 0; i < nr_pages; i++) {
>>>> +		struct page *page;
>>>> +
>>>> +		page =3D alloc_pages_node(nid, GFP_KERNEL | =
__GFP_RETRY_MAYFAIL, 0);
>>>> +		if (!page) {
>>>=20
>>> I think goto err_do_cleanup is cleaner than ad-hok cleanups
>>=20
>> I=E2=80=99ll use goto style, either is OK for me.
>>=20
>>>=20
>>>> +			memmap_pages_add(i);
>>>=20
>>> This is confusing. Updating counters only to use
>>> free_vmemmap_page_list() seems worse choice than walking the list =
and
>>> __free_page().
>>=20
>> I think the memmap accounting should be done right after each =
successful
>> allocation =E2=80=94 that way, using free_vmemmap_page_list() becomes =
more natural
>> and simple.
>=20
> Why are you against using a loop with a plain __free_page()?

I'm not against. This is probably just my own fixation, I think I've =
fallen
too deeply into the trap of code that looks simple but actually isn't =
that
great. Good thing you pulled me out in time. So I'll use your suggested
approach to fix the problem here.

Thanks,
Muchun

>=20
> We know for sure it's not a reserved page and there is no need in
> free_vmemmap_page().
>=20
> And with memmap_pages_add() per page do a bunch of atomic_long_add()s
> instead of one.
>=20
> BTW, it would have been nice to avoid per-page counters update in
> free_vmemmap_page_list() too, but that's not related to this series.
>=20
>> Somthing like:
>>=20
>> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
>> index c04f53f708d2..cab9ec14873d 100644
>> --- a/mm/hugetlb_vmemmap.c
>> +++ b/mm/hugetlb_vmemmap.c
>> @@ -207,14 +207,13 @@ static int alloc_vmemmap_page_list(struct =
list_head *head, unsigned int nr_pages
>>=20
>>                page =3D alloc_pages_node(nid, GFP_KERNEL | =
__GFP_RETRY_MAYFAIL, 0);
>>                if (!page) {
>> -                       memmap_pages_add(i);
>>                        free_vmemmap_page_list(&local);
>>                        return -ENOMEM;
>>                }
>> +               memmap_pages_add(1);
>>                list_add(&page->lru, &local);
>>        }
>>        list_splice(&local, head);
>> -       memmap_pages_add(nr_pages);
>>=20
>>        return 0;
>> }
>>=20
>> Thanks for your review, Mike.
>>=20
>> Muchun
>>=20
>>>=20
>>> --=20
>>> Sincerely yours,
>>> Mike.
>>=20
>>=20
>=20
> --=20
> Sincerely yours,
> Mike.


