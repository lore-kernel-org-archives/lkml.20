Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794193561;
	b=W6kLQmYNnfPBji2WZK8RefF/WQ/RbSIMURRJng1gM+CWDOjgaOAE2oahKnu1GnDtKuXI
	 J9V0mh6iWkZ/IwT+9o+WU+wraRx9pcVhosC+CVh78Q5rOUGzWQAC3hrg/x/tsTCjs83Zs
	 pUwigHAEjbeuSTAhvFLFIJhC5tlRkZfKSFWLGTvzcI6fCSJSOBpNsbLVaRAjVfGEHxXFO
	 v2+8WAm2WS4I80gJujMUkxkmvqhVuyXAa6j+uJALcKPFiDl7afnKCqobZk4QysJb12Loe
	 wL44z3zZJl1okBCoPzWfj50crndqS0+ti57sYSAAU53p+TBmD2lBYfH3sn7hlPTHzOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794193561;
	h=DMARC-Filter:DKIM-Signature:Date:Content-Transfer-Encoding:
	 User-Agent:Content-Type:Message-Id:Mime-Version:References:To:Cc:From:
	 X-Original-From:In-Reply-To:Subject:X-Lms-Return-Path;
	bh=qQS78PCj6FfdbwzR1JAthRgqg3Mq39AopQfbYGKHtWw=;
	b=MaE1MeU3dd41E5MC4eNhmoSKMfYX99N4jldBF10Amp7UzG43JK4Stt5LgLo4n4zTsNTC
	 wDS1bl50uUjeijMW33i0+4U9Nwl/X6vilj4RNa8DjxIRH8akoDP7IYxtSnPDnRV7bxxPe
	 X0dQCAnhbWJ6Fgv5W7HsgnPA9uq3Hdaxgo8RPFP1xqPWvqAlKZznE7Vi1TVDL3OA9jXWw
	 zFaMo89mDwk1fNYCPI8RuW92pSh3GgoOFalCT7I62oFnXLi8y2UtPTtMg51U9Kg+tpn9u
	 4ZKb56pZ4QXgoT+Y2w5Gyd98um5kJyhYO8JHzRfHYs4pNJnweKa+BRpsPlV/d7sMUag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=I0ZzmwaZ;
	arc=none smtp.remote-ip=209.127.230.112
Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB79606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:05:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCB79606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=I0ZzmwaZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1794193555; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=qQS78PCj6FfdbwzR1JAthRgqg3Mq39AopQfbYGKHtWw=;
 b=I0ZzmwaZdQJGUoREKpE01kWH0DO5tLxj29dcLpp32kmORQyTXAo9P82ty2OqtLTEjQe7Z9
 s2hONUeDfi/oI13aA8z18eEPurp70CnbVhlYnQ3lGETYaApjcxVFR6FvJufBzMOydTIN3V
 A6ixzMrm9S9FgfGWZcFadGACnk5dVNvRyaH6EgcTCFMHyvRVfGZ57846vIWm9WaoVih7aw
 sZIL6VOB/BVwFrV30YdG1rfuzY7OlziJlSrPBaPYWYx7PPwmxbjdCHtkIAsKdJbvqmdz0e
 Kl06AXneBuO1g9DAkndd/4J33wsSg8mFy3RnV4bETlWKLUwAzAFaMfGmDdh81A==
Date: Mon, 9 Nov 2026 11:05:36 +0800
Content-Transfer-Encoding: quoted-printable
User-Agent: Mozilla Thunderbird
Content-Type: text/plain; charset=UTF-8
Message-Id: <2f9730df-fade-4c5f-a4fe-fd3d43eb8bba@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261105120615.16817-1-lizhe.67@bytedance.com> <20261105120615.16817-2-lizhe.67@bytedance.com> <au2tQaaMBg3umthq@parvat> <25a188bf-05e4-4f0e-b670-a9dc88195b21@bytedance.com> <f062d92e-a016-447f-926f-bd1b1ce7f106@linux.dev>
To: "Muchun Song" <muchun.song@linux.dev>, 
	"Balbir Singh" <balbirs@nvidia.com>
Cc: <osalvador@suse.de>, <david@kernel.org>, <akpm@linux-foundation.org>, 
	<rppt@kernel.org>, <apopple@nvidia.com>, <linux-mm@kvack.org>, 
	<linux-kernel@vger.kernel.org>
From: "Li Zhe" <lizhe.67@bytedance.com>
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
In-Reply-To: <f062d92e-a016-447f-926f-bd1b1ce7f106@linux.dev>
Subject: Re: [PATCH 1/2] mm/mm_init: factor out memmap_init_page_from_template()
X-Lms-Return-Path: <lba+26af13891+09eb16+vger.kernel.org+lizhe.67@bytedance.com>

On 11/9/26 10:57 AM, Muchun Song wrote:
>
>
> On 2026/11/9 10:51, Li Zhe wrote:
>> On 11/6/26 6:34 PM, Balbir Singh wrote:
>>> On Thu, Nov 05, 2026 at 08:06:14PM +0800, Li Zhe wrote:
>>>> ZONE_DEVICE memmap initialization already uses a reusable struct page
>>>> template when initializing compound tail pages.=C2=A0 The template mos=
tly
>>>> contains invariant state, but a few fields still depend on the target
>>>> PFN and must be refreshed before copying the template into each
>>>> destination struct page.
>>>>
>>>> Factor that operation into memmap_init_page_from_template() so other
>>>> boot-time memmap initialization paths can reuse the same helper.
>>>>
>>>> No functional change intended.
>>>>
>>>> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
>>>> ---
>>>> =C2=A0=C2=A0 mm/mm_init.c | 29 +++++++++++++++--------------
>>>> =C2=A0=C2=A0 mm/mm_init.h |=C2=A0 2 ++
>>>> =C2=A0=C2=A0 2 files changed, 17 insertions(+), 14 deletions(-)
>>>>
>>>> diff --git a/mm/mm_init.c b/mm/mm_init.c
>>>> index 2a0e782a151d..495e20fbdec0 100644
>>>> --- a/mm/mm_init.c
>>>> +++ b/mm/mm_init.c
>>>> @@ -625,6 +625,17 @@ void __meminit __init_single_page(struct page=20
>>>> *page, unsigned long pfn,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vmemmap_optimization_verify_zone(=
page);
>>>> =C2=A0=C2=A0 }
>>>> =C2=A0=C2=A0 +void __meminit memmap_init_page_from_template(struct pag=
e *page,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long pfn, unsigne=
d long zone, struct page *template)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 set_page_section_from_pfn(template, pfn);
>>>> +#ifdef WANT_PAGE_VIRTUAL
>>>> +=C2=A0=C2=A0=C2=A0 if (!is_highmem_idx(zone))
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_page_address(template,=
 __va(pfn << PAGE_SHIFT));
>>>> +#endif
>>>> +=C2=A0=C2=A0=C2=A0 memcpy_nontemporal(page, template, sizeof(*page));
>>>> +}
>>>> +
>>> Can we make the template a const? Why can't we do
>>>
>>> void __meminit memmap_init_page_from_template(struct page *page,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long pfn, unsigned =
long zone,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct page *template)
>>> {
>>> =C2=A0=C2=A0=C2=A0=C2=A0memcpy_nontemporal(page, template, sizeof(*page=
));
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0set_page_section_from_pfn(page, pfn);
>>> #ifdef WANT_PAGE_VIRTUAL
>>> =C2=A0=C2=A0=C2=A0=C2=A0if (!is_highmem_idx(zone))
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_page_address(page, __va(=
pfn << PAGE_SHIFT));
>>> #endif
>>>
>>> That way we don't update template once it is set, if template is r/o,
>>> then we don't need both first page and template in the caller to
>>> be different.
>
> I used to think that too.
>
>> I kept it this way to preserve the memcpy_nontemporal() write pattern:
>> update the PFN-dependent fields in the template first, then copy the
>> final state to the destination page once.
>>
>> If we copy first and then update the destination page, the hot loop
>> would do a non-temporal copy followed by normal stores to the same
>> struct page. That is the pattern this helper avoids.
>
> After thinking it through, that should be the reason. To prevent
> similar confusion for others, I suggest adding a comment here
> explaining why this specific order is used.

Agreed, thanks. I will add a short comment in v2.

Thanks,
Zhe

>
> Thanks.
>
>>
>> Thanks,
>> Zhe
>>>> =C2=A0=C2=A0 #ifdef CONFIG_NUMA
>>>> =C2=A0=C2=A0 /*
>>>> =C2=A0=C2=A0=C2=A0 * During memory init memblocks map pfns to nids. Th=
e search is=20
>>>> expensive and
>>>> @@ -1073,17 +1084,6 @@ static void __ref=20
>>>> __init_zone_device_page(struct page *page, unsigned long pfn,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> =C2=A0=C2=A0 }
>>>> =C2=A0=C2=A0 -static void zone_device_page_init_from_template(struct p=
age *page,
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long pfn, struct =
page *template)
>>>> -{
>>>> -=C2=A0=C2=A0=C2=A0 set_page_section_from_pfn(template, pfn);
>>>> -#ifdef WANT_PAGE_VIRTUAL
>>>> -=C2=A0=C2=A0=C2=A0 if (!is_highmem_idx(ZONE_DEVICE))
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_page_address(template,=
 __va(pfn << PAGE_SHIFT));
>>>> -#endif
>>>> -=C2=A0=C2=A0=C2=A0 memcpy_nontemporal(page, template, sizeof(*page));
>>>> -}
>>>> -
>>>> =C2=A0=C2=A0 /*
>>>> =C2=A0=C2=A0=C2=A0 * With compound page geometry and when struct pages=
 are stored=20
>>>> in ram most
>>>> =C2=A0=C2=A0=C2=A0 * tail pages are reused. Consequently, the amount o=
f unique=20
>>>> struct pages to
>>>> @@ -1136,8 +1136,8 @@ static void __ref memmap_init_compound(struct=20
>>>> page *head,
>>>> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Initialize the re=
maining tail pages from template. */
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (pfn =3D head_pfn + 2; pfn < =
end_pfn; pfn++)
>>>> - zone_device_page_init_from_template(pfn_to_page(pfn), pfn,
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 &template);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memmap_init_page_from_temp=
late(pfn_to_page(pfn), pfn,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ZONE_DEVICE, &template);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prep_compound_head(head, order);
>>>> =C2=A0=C2=A0 }
>>>> =C2=A0=C2=A0 @@ -1192,7 +1192,8 @@ void __ref memmap_init_zone_device(=
struct=20
>>>> zone *zone,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (; pfn < end_pfn; pfn +=3D pf=
ns_per_compound) {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 page =3D =
pfn_to_page(pfn);
>>>> =C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 zone_device_p=
age_init_from_template(page, pfn, &template);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memmap_init_page_from_temp=
late(page, pfn, ZONE_DEVICE,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 &template);
>>>> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if (IS_ALIGNED(pfn, PAGES_PER_SECTION))
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 cond_resched();
>>>> diff --git a/mm/mm_init.h b/mm/mm_init.h
>>>> index 0034e37dbabd..22c465122b47 100644
>>>> --- a/mm/mm_init.h
>>>> +++ b/mm/mm_init.h
>>>> @@ -111,5 +111,7 @@ void memblock_free_all(void);
>>>> =C2=A0=C2=A0 =C2=A0=C2=A0 void __meminit __init_single_page(struct pag=
e *page, unsigned=20
>>>> long pfn,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long zone, int nid);
>>>> +void __meminit memmap_init_page_from_template(struct page *page,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long pfn, unsigne=
d long zone, struct page=20
>>>> *template);
>>>> =C2=A0=C2=A0 =C2=A0=C2=A0 #endif /* __MM_MM_INIT_H */
>>>> --=20
>>> Balbir
>
