Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217966;
	b=04Leyl9PhvACPnCvlTdrF4R9VwCXYNsN6BJtxxBwZtnHg/aZemR/QIu1nxcV4fJ/D5ut
	 aymMlXqHoqckelU0def8UtBkQ6eo0j5OyFM90x/MK46e6AJYttYplt/9ZHOTFiJ4uwFKc
	 SGY0Rvbfm8cltMA1b0OXzUxqux2eO/5EmpCTXBvVnjVVcXCWaEtb1tMLEC7yadME4OZdz
	 mICTvzS4HtzGkwkZWIV88+c+8ZDz+mPRwYyZkdq/Ew9ycokQTOvZ20N+IhcrK7AwNlFoK
	 AZCFGDX0jNSt42NlnJUxGOKXXQA3kNneBG95WXc+Z2NvlFbVJ7WjL16xRVznXCweFDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217966;
	h=DMARC-Filter:DKIM-Signature:X-Original-From:In-Reply-To:To:Cc:
	 User-Agent:Subject:Mime-Version:X-Lms-Return-Path:
	 Content-Transfer-Encoding:Content-Type:From:Date:Message-Id:
	 References;
	bh=rMQ7EtDkYDjDl+za8vShzpqCW7ypnaRbeTrLqAXEDl0=;
	b=pgBaV7l3fQzk+SDcIfgfz3u6cpbaHcuDCfpxvvlppc2q5fFoAWnV685g9/S9pMl2vr6a
	 Kj2YOUb+pi2CH7kmNZl8WgDUpcaiplkYPsp7UU3kPCqmTy6kS/jS6Qu2aY9p87JzgjC8k
	 V/EAL2VLiZPHrv97rjKBlQ3MhjObdRCSRUQLCB46R23KD1pxEz1VlxVkgvVWzWnW6SP9Y
	 urclsy14/kBg96xXNSHv04i9JQ6UZXguz5rXw23Z2N2CNBEfbv7m+HCTOsJt0RYLr4Thl
	 4TT2pXCwdSjCZo/7/RNTY263pp+ebCC99OkXQ7+C0o2qlnhOqf8E6Se/Op4J65gnp2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b="iCtfqv/o";
	arc=none smtp.remote-ip=209.127.230.113
Received: from va-1-113.ptr.blmpb.com (va-1-113.ptr.blmpb.com [209.127.230.113])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6516606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6516606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=iCtfqv/o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1794217959; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=rMQ7EtDkYDjDl+za8vShzpqCW7ypnaRbeTrLqAXEDl0=;
 b=iCtfqv/oPnFwF/AXfhIcnlCd+GyTk0CNAvfoxYr/JjSc/dXsoUkqPdAa57dpSGvsRmBVWd
 cCGHUDA7vm8Nr35HsTmyhIE4fgLxVYJQU72/3NxPWkE4OiHaAn72r5J6/b1N43RLQe+DmX
 4gQdDUmkqQ6YreZyzVVtYQMpe+vtqEu2dd+eH89MmJgeXvUfebp+kVsbpKgtNrJpwUCie9
 EN7MhdNuHY0wxHdZZnbVypLKyGI0lLzqTr+1U0OS8kQ0zWXSmGUU9WeTKhcCmAwyCcAldp
 JEQIM5SWJ1HY1Em/PSK8yEf01AjT9DTooSHGFLCi7TQOW7zIXrm1gO1SGJYjDg==
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
In-Reply-To: <avGVNISvj-v8IN3g@kernel.org>
To: "Mike Rapoport" <rppt@kernel.org>
Cc: "Balbir Singh" <balbirs@nvidia.com>, <muchun.song@linux.dev>, 
	<osalvador@suse.de>, <david@kernel.org>, <akpm@linux-foundation.org>, 
	<apopple@nvidia.com>, <linux-mm@kvack.org>, 
	<linux-kernel@vger.kernel.org>
User-Agent: Mozilla Thunderbird
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
X-Lms-Return-Path: <lba+26af197e5+b062bd+vger.kernel.org+lizhe.67@bytedance.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
From: "Li Zhe" <lizhe.67@bytedance.com>
Date: Mon, 9 Nov 2026 17:52:19 +0800
Message-Id: <ea9b76c1-ced7-4ef7-a428-7fb3db5c7f4c@bytedance.com>
References: <20261105120615.16817-1-lizhe.67@bytedance.com> <20261105120615.16817-3-lizhe.67@bytedance.com> <au2qhlsxQt3SRwIu@parvat> <ca38db3a-a8fe-47c3-8813-5c3b0ac4b7ac@bytedance.com> <3e5a9f27-ea35-4557-95d1-70ce359e4c92@bytedance.com> <avGVNISvj-v8IN3g@kernel.org>

On 11/9/26 5:41 PM, Mike Rapoport wrote:
> Hi,
>
> On Mon, Nov 09, 2026 at 05:22:24PM +0800, Li Zhe wrote:
>> On 11/9/26 11:01 AM, Li Zhe wrote:
>>> On 11/6/26 6:23 PM, Balbir Singh wrote:
>>>> On Thu, Nov 05, 2026 at 08:06:15PM +0800, Li Zhe wrote:
>>>>> Boot-time HugeTLB allocation has to initialize tail struct pages itse=
lf
>>>>> when HugeTLB vmemmap optimization (HVO) is unavailable or fails.=C2=
=A0 For
>>>>> gigantic pages, this can cover a large number of tail pages. Most sta=
te
>>>>> installed by __init_single_page() and prep_compound_tail() is identic=
al
>>>>> for every tail page in the same huge page; only PFN-dependent fields
>>>>> need refreshing.
>>>>>
>>>>> Initialize the first tail page normally, copy it into a local templat=
e,
>>>>> then initialize the remaining tails from that template with
>>>>> memmap_init_page_from_template().=C2=A0 This avoids repeatedly doing =
the
>>>>> full
>>>>> __init_single_page() and prep_compound_tail() sequence for state
>>>>> that is
>>>>> identical across tail pages in the same huge page.
>>>>>
>>>>> On an arm64 QEMU/KVM guest using 4K pages and 64 boot-time 1G hugepag=
es
>>>>> (HVO unavailable on arm64 in v7.4-rc1), the measured fallback tail
>>>>> initialization time improved by 36.43%, measured with a temporary
>>>>> jiffies-based printk modeled after the existing timing in
>>>>> memmap_init_zone_device():
>>>>>
>>>>>  =C2=A0=C2=A0 base:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 318.4 ms
>>>>>  =C2=A0=C2=A0 with this patch:=C2=A0 202.4 ms
>>>>>
>>>>> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
>>>>> ---
>>>>>  =C2=A0 mm/hugetlb.c | 23 ++++++++++++++++++-----
>>>>>  =C2=A0 1 file changed, 18 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>>>>> index da5d04edf7c1..987f16a5ea27 100644
>>>>> --- a/mm/hugetlb.c
>>>>> +++ b/mm/hugetlb.c
>>>>> @@ -3219,19 +3219,32 @@ static void __init
>>>>> hugetlb_folio_init_tail_vmemmap(struct folio *folio,
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum zone_type zone =3D folio_zonenum=
(folio);
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int nid =3D folio_nid(folio);
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct page *page =3D folio_page(foli=
o, start_page_number);
>>>>> +=C2=A0=C2=A0=C2=A0 struct page template;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long head_pfn =3D folio_pfn(=
folio);
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long pfn, end_pfn =3D head_p=
fn + end_page_number;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int order =3D huge_page_orde=
r(h);
>>>>>  =C2=A0 +=C2=A0=C2=A0=C2=A0 if (start_page_number >=3D end_page_numbe=
r)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>>>> +
>>>> Can this actually happen?
>>>
>>> No, current callers always pass a non-empty range. I kept this to
>>> preserve the old for-loop no-op semantics for an empty range, but it is
>>> not needed here. I will remove it in v2.
>>
>> I need to correct this. A local Sashiko run pointed out that the bootmem
>> fallback caller can pass an empty range on SuperH.
>>
>> SuperH supports a 64M HugeTLB page size, and with 64K base pages
>> pages_per_huge_page(h) is 1024. HUGETLB_VMEMMAP_RESERVE_PAGES is
>> PAGE_SIZE / sizeof(struct page), which can also be 1024 or larger on a
>> 32-bit SuperH configuration.
> If the only difference is unnecessary initialization of the template on S=
uperH,
> we don't care and you can drop that if.


It is not only initializing the local template. The code first
initializes one page with __init_single_page(), prep_compound_tail(),
and set_page_count(), and then copies that page into the template.

So if start_page_number =3D=3D end_page_number =3D=3D pages_per_huge_page(h=
),
the old loop is a no-op, but without the check the new code would update
folio_page(folio, start_page_number), which is outside the HugeTLB
folio.

Thanks,
Zhe

>  =20
>> In that case the old for loop is a no-op. So I will keep the empty-range
>> check in v2, before creating the seed template.
>>
>> Thanks,
>> Zhe
