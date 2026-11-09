Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216171;
	b=Rdd6EMHAL0Q+tU6s+yEU5nDiMexV0iUjUqyQu55f2uCJvxUB9dOyksdp+MWQpqCLG55o
	 1XrT1Us29rKY4ncTNCOxewvOHoqTDu0u+8iJf8Uro6puew/EvLeXQ6zVSqAToaGXXvagg
	 Ec3fNDKysRSWxGgHlHj6Q8y6pdSPqRDU23o4fBlF2G7InzGGU/dVdrAjhocTgqqHn0SGT
	 PJKFfyFxRNAGZ/VyPazvT5WO6FRVlJqezfD2iLTIHkEtjCfQbcBLoGqIr2oL0YZfT7w6L
	 BmAwNmcCWAWm/sTRjnaS6Sbi8oXWnkkPe7WzOOOk3o8UnVtUMZvdW643g847FFPwMzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216171;
	h=DMARC-Filter:DKIM-Signature:From:Message-Id:References:
	 X-Lms-Return-Path:User-Agent:X-Original-From:Content-Type:In-Reply-To:
	 To:Cc:Subject:Date:Mime-Version:Content-Transfer-Encoding;
	bh=FNnB213C2cP0gdxYuL/Mc+HzLUB0/mR4NaAsZTbzJJI=;
	b=sLReOsPUexus6KluhABDIFjZSgfacF+Cskt1v3slBYzjvvaDMw/CpjtACm9lPW9xh7QM
	 1XJ0yQbX7/Uf++k1Y26efMEFL7RcXTBVMHQ8ZYAhOWDx8v/Lx3TC+9/JScutiqXiVd3dw
	 wC+Q9HctWQyhjN1Ets94RZD1MGbCbSgthu4rN2aurCA9OhhzDbvgb0z/a2rAfwv3hxPD4
	 sE3lnIuNkVwO5fml/hM3cR+sUZ0iLVKgch9E1QssalUibzSt8mE7ANgXsmzYmLNZZ44JN
	 mlblFMhN4236/4gd1BZHNd/zx3lhpo0F2QZezHw2Nm9foD/0fheQc9jYG/ahvH9uA5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b="ZBhZOro/";
	arc=none smtp.remote-ip=209.127.230.111
Received: from va-1-111.ptr.blmpb.com (va-1-111.ptr.blmpb.com [209.127.230.111])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3697606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3697606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=ZBhZOro/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1794216163; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=FNnB213C2cP0gdxYuL/Mc+HzLUB0/mR4NaAsZTbzJJI=;
 b=ZBhZOro//66cOhz/DkdekwbBVWx6A1ys7GBryWKo1VycRSJqGMyWY+rtSRvsXwDu6AIYH8
 Ldb6x6vjx2AbCnRJRFOnAvs+xOYVYgNaWDassu6Vt4GbPniDkkbwS/ONYGx4YsvGCXFps/
 yX4ZuH6gOe+bYU5AZ9BkiR3X3dOhC88Gsv7OaKvl2E6vvSrmjiHYCX5zNst31gp/PDDjF/
 zhvheQKP8Rl3bj7Gds/Tm39jKSa+DUQevrg7IRPaF/BQuc7eXR1evyqFrDWggHeLdoRzZN
 7vpE2Id61PdUD35yx1/n6NrNEeaY9O7UGzSERXNqmf7Ujmvbks0PnEVdpIeE2A==
From: "Li Zhe" <lizhe.67@bytedance.com>
Message-Id: <3e5a9f27-ea35-4557-95d1-70ce359e4c92@bytedance.com>
References: <20261105120615.16817-1-lizhe.67@bytedance.com> <20261105120615.16817-3-lizhe.67@bytedance.com> <au2qhlsxQt3SRwIu@parvat> <ca38db3a-a8fe-47c3-8813-5c3b0ac4b7ac@bytedance.com>
X-Lms-Return-Path: <lba+26af190e1+65bbd0+vger.kernel.org+lizhe.67@bytedance.com>
User-Agent: Mozilla Thunderbird
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <ca38db3a-a8fe-47c3-8813-5c3b0ac4b7ac@bytedance.com>
To: "Balbir Singh" <balbirs@nvidia.com>
Cc: <muchun.song@linux.dev>, <osalvador@suse.de>, <david@kernel.org>, 
	<akpm@linux-foundation.org>, <rppt@kernel.org>, <apopple@nvidia.com>, 
	<linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] mm/hugetlb: optimize bootmem hugepage tail vmemmap init
Date: Mon, 9 Nov 2026 17:22:24 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/9/26 11:01 AM, Li Zhe wrote:
>
> On 11/6/26 6:23 PM, Balbir Singh wrote:
>> On Thu, Nov 05, 2026 at 08:06:15PM +0800, Li Zhe wrote:
>>> Boot-time HugeTLB allocation has to initialize tail struct pages itself
>>> when HugeTLB vmemmap optimization (HVO) is unavailable or fails.=C2=A0 =
For
>>> gigantic pages, this can cover a large number of tail pages. Most state
>>> installed by __init_single_page() and prep_compound_tail() is identical
>>> for every tail page in the same huge page; only PFN-dependent fields
>>> need refreshing.
>>>
>>> Initialize the first tail page normally, copy it into a local template,
>>> then initialize the remaining tails from that template with
>>> memmap_init_page_from_template().=C2=A0 This avoids repeatedly doing th=
e=20
>>> full
>>> __init_single_page() and prep_compound_tail() sequence for state=20
>>> that is
>>> identical across tail pages in the same huge page.
>>>
>>> On an arm64 QEMU/KVM guest using 4K pages and 64 boot-time 1G hugepages
>>> (HVO unavailable on arm64 in v7.4-rc1), the measured fallback tail
>>> initialization time improved by 36.43%, measured with a temporary
>>> jiffies-based printk modeled after the existing timing in
>>> memmap_init_zone_device():
>>>
>>> =C2=A0=C2=A0 base:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 318.4 ms
>>> =C2=A0=C2=A0 with this patch:=C2=A0 202.4 ms
>>>
>>> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
>>> ---
>>> =C2=A0 mm/hugetlb.c | 23 ++++++++++++++++++-----
>>> =C2=A0 1 file changed, 18 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>>> index da5d04edf7c1..987f16a5ea27 100644
>>> --- a/mm/hugetlb.c
>>> +++ b/mm/hugetlb.c
>>> @@ -3219,19 +3219,32 @@ static void __init=20
>>> hugetlb_folio_init_tail_vmemmap(struct folio *folio,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum zone_type zone =3D folio_zonenum(fo=
lio);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int nid =3D folio_nid(folio);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct page *page =3D folio_page(folio, =
start_page_number);
>>> +=C2=A0=C2=A0=C2=A0 struct page template;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long head_pfn =3D folio_pfn(fol=
io);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long pfn, end_pfn =3D head_pfn =
+ end_page_number;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int order =3D huge_page_order(h=
);
>>> =C2=A0 +=C2=A0=C2=A0=C2=A0 if (start_page_number >=3D end_page_number)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>> +
>> Can this actually happen?
>
>
> No, current callers always pass a non-empty range. I kept this to
> preserve the old for-loop no-op semantics for an empty range, but it is
> not needed here. I will remove it in v2.


I need to correct this. A local Sashiko run pointed out that the bootmem
fallback caller can pass an empty range on SuperH.

SuperH supports a 64M HugeTLB page size, and with 64K base pages
pages_per_huge_page(h) is 1024. HUGETLB_VMEMMAP_RESERVE_PAGES is
PAGE_SIZE / sizeof(struct page), which can also be 1024 or larger on a
32-bit SuperH configuration.

In that case the old for loop is a no-op. So I will keep the empty-range
check in v2, before creating the seed template.

Thanks,
Zhe

>
>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * As we marked all tail pages with=
=20
>>> memblock_reserved_mark_noinit(),
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * we must initialize them ourselve=
s here.
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> -=C2=A0=C2=A0=C2=A0 for (pfn =3D head_pfn + start_page_number; pfn < en=
d_pfn; page++,=20
>>> pfn++) {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __init_single_page(page, pf=
n, zone, nid);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prep_compound_tail(page, &f=
olio->page, order);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_page_count(page, 0);
>>> -=C2=A0=C2=A0=C2=A0 }
>>> +=C2=A0=C2=A0=C2=A0 pfn =3D head_pfn + start_page_number;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /*
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Seed a template from the first real tail pa=
ge and refresh only
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * PFN-dependent fields before copying it.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0 __init_single_page(page, pfn, zone, nid);
>>> +=C2=A0=C2=A0=C2=A0 prep_compound_tail(page, &folio->page, order);
>>> +=C2=A0=C2=A0=C2=A0 set_page_count(page, 0);
>>> +=C2=A0=C2=A0=C2=A0 memcpy(&template, page, sizeof(template));
>> Do we need a separate template and page?
> Yes. page is the first tail page that has already been initialized
> normally. A separate template is needed so that later iterations can
> refresh the PFN-dependent fields before memcpy_nontemporal() copies the
> final state to each destination page.
>
> Thanks for the review and the Ack.
>
> Thanks,
> Zhe
>
>>
>>> +
>>> +=C2=A0=C2=A0=C2=A0 for (pfn++; pfn < end_pfn; pfn++)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memmap_init_page_from_templ=
ate(pfn_to_page(pfn), pfn, zone,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 &template);
>>> =C2=A0 }
>>> =C2=A0 =C2=A0 static void __init hugetlb_folio_init_vmemmap(struct foli=
o *folio,
>> Acked-by: Balbir Singh <balbirs@nvidia.com>
