Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794276969;
	b=MJ41hs3xOhXhleeJg9af0swQz1a54WhsjsVmuxLeC9bGfgxbHUfxJVNtgaDhoqJlMSWT
	 QueZK5yATTr3+sHeBi8hZLWjOpta5JPjTHYhHwgG39PO3KhvKV7laDn3pDNYNawjPzgQw
	 YD1WaQQn0tflgStl2RobKNerAAvqNAzefeo9ZYVwTAHIi6tZRmmGmGmrl2tFLEJCnLV2z
	 ZAEs1DfPZcgFSuDu/XeL1WNIBRZD0/qKSxwlVObWcrbMxP6owRdUM9FSPK7EHqLT7ZLIn
	 saL9X4atw83nbKk+8u/l/omFqOhGKuWFGOGD/8iYAKpDakXES2wGrfFE7qOD3oVenYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276969;
	h=DMARC-Filter:DKIM-Signature:From:Content-Transfer-Encoding:Subject:
	 Mime-Version:Message-Id:X-Lms-Return-Path:X-Original-From:In-Reply-To:
	 To:Cc:Date:Content-Type:References:User-Agent;
	bh=9HIPwNYvbOarmnCqPR7DA23o7bO4fjUXE8B8nsiUVuw=;
	b=t3OpgWmq0FAITWhNsgAynZjXHP9Hdn+JCQE0zUYZeZ7O4mAH1LsDz/zcPYInyhrZjh/Z
	 102AjEA3Gm6qWRAf+tPG1lsiWIzJu4e116l3gPyrPMiNQo4XjlD8pVzjzVhPLIHXySGKR
	 a1qfpZz+Uc2L1vJNHZNsRK86aDnMP511jx65OWo7N+/i+5Lt29AaLvDaQEPcA5Nw08at2
	 pPSKfwDeih9YfGsqEPfxxhrn122HUv228Ez6NmSChkVddai59PIoG5EQlU67yD7odq6WX
	 NJH8bqRH2nstyWuFwsU/0a14fAiFvV+apOA0xgoeFvi4F5t8igTYOPcTCpr0MG8G+4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=gCUC3LYO;
	arc=none smtp.remote-ip=209.127.230.112
Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F20F606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:16:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F20F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=gCUC3LYO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1794276957; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=9HIPwNYvbOarmnCqPR7DA23o7bO4fjUXE8B8nsiUVuw=;
 b=gCUC3LYOsR+wYxX/DzTp99RfgGOUN0Yg5EZV0Aag13kLWls0TEv2azhQ34y62yh4khWxEI
 s5e3+F580AOsIhYrktNRcEP5dgGTO4VExo7pezOxN2JT7pmqOFupUEEcqyUfYOdAXd/czW
 Zx+NfmJhL5fB5nuygggfn9/jmE30HyOlyubB9M24g8byqtBcC6h/xWo4ejkddacVa3r2WF
 c3xGV3+gji+yc/nxjlvqgvzM5GiF6627AnqD5GIgD2xRbuY952JvGCsun1JSSftfgSiNto
 vACtI4TlJkRwh73CO7Drfgz2WSQVtWiPklhZ5Xt6EkaeXSq5RkD3+jTu3ATUrw==
From: "Li Zhe" <lizhe.67@bytedance.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] mm/hugetlb: optimize bootmem hugepage tail vmemmap init
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Message-Id: <c82be2c1-b890-42dd-9966-72e6c7a95b25@bytedance.com>
X-Lms-Return-Path: <lba+26af27e5b+635ad9+vger.kernel.org+lizhe.67@bytedance.com>
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
In-Reply-To: <avGvlDENwtgUWv-4@kernel.org>
To: "Mike Rapoport" <rppt@kernel.org>
Cc: "Balbir Singh" <balbirs@nvidia.com>, <muchun.song@linux.dev>, 
	<osalvador@suse.de>, <david@kernel.org>, <akpm@linux-foundation.org>, 
	<apopple@nvidia.com>, <linux-mm@kvack.org>, 
	<linux-kernel@vger.kernel.org>
Date: Tue, 10 Nov 2026 10:15:39 +0800
Content-Type: text/plain; charset=UTF-8
References: <20261105120615.16817-1-lizhe.67@bytedance.com> <20261105120615.16817-3-lizhe.67@bytedance.com> <au2qhlsxQt3SRwIu@parvat> <ca38db3a-a8fe-47c3-8813-5c3b0ac4b7ac@bytedance.com> <3e5a9f27-ea35-4557-95d1-70ce359e4c92@bytedance.com> <avGVNISvj-v8IN3g@kernel.org> <ea9b76c1-ced7-4ef7-a428-7fb3db5c7f4c@bytedance.com> <avGvlDENwtgUWv-4@kernel.org>
User-Agent: Mozilla Thunderbird

On 11/9/26 7:33 PM, Mike Rapoport wrote:
> On Mon, Nov 09, 2026 at 05:52:19PM +0800, Li Zhe wrote:
>> On 11/9/26 5:41 PM, Mike Rapoport wrote:
>>> Hi,
>>>
>>> On Mon, Nov 09, 2026 at 05:22:24PM +0800, Li Zhe wrote:
>>>> On 11/9/26 11:01 AM, Li Zhe wrote:
>>>>> On 11/6/26 6:23 PM, Balbir Singh wrote:
>>>>>> On Thu, Nov 05, 2026 at 08:06:15PM +0800, Li Zhe wrote:
>>>>>>> Boot-time HugeTLB allocation has to initialize tail struct pages it=
self
>>>>>>> when HugeTLB vmemmap optimization (HVO) is unavailable or fails.=C2=
=A0 For
>>>>>>> gigantic pages, this can cover a large number of tail pages. Most s=
tate
>>>>>>> installed by __init_single_page() and prep_compound_tail() is ident=
ical
>>>>>>> for every tail page in the same huge page; only PFN-dependent field=
s
>>>>>>> need refreshing.
>>>>>>>
>>>>>>> Initialize the first tail page normally, copy it into a local templ=
ate,
>>>>>>> then initialize the remaining tails from that template with
>>>>>>> memmap_init_page_from_template().=C2=A0 This avoids repeatedly doin=
g the
>>>>>>> full
>>>>>>> __init_single_page() and prep_compound_tail() sequence for state
>>>>>>> that is
>>>>>>> identical across tail pages in the same huge page.
>>>>>>>
>>>>>>> On an arm64 QEMU/KVM guest using 4K pages and 64 boot-time 1G hugep=
ages
>>>>>>> (HVO unavailable on arm64 in v7.4-rc1), the measured fallback tail
>>>>>>> initialization time improved by 36.43%, measured with a temporary
>>>>>>> jiffies-based printk modeled after the existing timing in
>>>>>>> memmap_init_zone_device():
>>>>>>>
>>>>>>>   =C2=A0=C2=A0 base:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 318.4 ms
>>>>>>>   =C2=A0=C2=A0 with this patch:=C2=A0 202.4 ms
>>>>>>>
>>>>>>> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
>>>>>>> ---
>>>>>>>   =C2=A0 mm/hugetlb.c | 23 ++++++++++++++++++-----
>>>>>>>   =C2=A0 1 file changed, 18 insertions(+), 5 deletions(-)
>>>>>>>
>>>>>>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>>>>>>> index da5d04edf7c1..987f16a5ea27 100644
>>>>>>> --- a/mm/hugetlb.c
>>>>>>> +++ b/mm/hugetlb.c
>>>>>>> @@ -3219,19 +3219,32 @@ static void __init
>>>>>>> hugetlb_folio_init_tail_vmemmap(struct folio *folio,
>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum zone_type zone =3D folio_zone=
num(folio);
>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int nid =3D folio_nid(folio);
>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct page *page =3D folio_page(f=
olio, start_page_number);
>>>>>>> +=C2=A0=C2=A0=C2=A0 struct page template;
>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long head_pfn =3D folio_p=
fn(folio);
>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long pfn, end_pfn =3D hea=
d_pfn + end_page_number;
>>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int order =3D huge_page_o=
rder(h);
>>>>>>>   =C2=A0 +=C2=A0=C2=A0=C2=A0 if (start_page_number >=3D end_page_nu=
mber)
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>>>>>> +
>>>>>> Can this actually happen?
>>>>> No, current callers always pass a non-empty range. I kept this to
>>>>> preserve the old for-loop no-op semantics for an empty range, but it =
is
>>>>> not needed here. I will remove it in v2.
>>>> I need to correct this. A local Sashiko run pointed out that the bootm=
em
>>>> fallback caller can pass an empty range on SuperH.
>>>>
>>>> SuperH supports a 64M HugeTLB page size, and with 64K base pages
>>>> pages_per_huge_page(h) is 1024. HUGETLB_VMEMMAP_RESERVE_PAGES is
>>>> PAGE_SIZE / sizeof(struct page), which can also be 1024 or larger on a
>>>> 32-bit SuperH configuration.
>>> If the only difference is unnecessary initialization of the template on=
 SuperH,
>>> we don't care and you can drop that if.
>> It is not only initializing the local template. The code first
>> initializes one page with __init_single_page(), prep_compound_tail(),
>> and set_page_count(), and then copies that page into the template.
>>
>> So if start_page_number =3D=3D end_page_number =3D=3D pages_per_huge_pag=
e(h),
>> the old loop is a no-op, but without the check the new code would update
>> folio_page(folio, start_page_number), which is outside the HugeTLB
>> folio.
> A recent patch to arch/sh indicated that hugetlb is never used on sh:
>
> https://lore.kernel.org/linux-mm/auJI2blzfpFD9yLe@kernel.org/
>
> And it seems none of upstream sh defconfigs can hit it.


Thanks for the information. I will drop the empty-range check in v2.

Thanks,
Zhe

>  =20
>> Thanks,
>> Zhe
>>
>>>   =20
>>>> In that case the old for loop is a no-op. So I will keep the empty-ran=
ge
>>>> check in v2, before creating the seed template.
>>>>
>>>> Thanks,
>>>> Zhe
