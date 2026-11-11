Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794397040;
	b=gAgS+9oKIwf7yQksj0qH2xkXK2BE9ZfDL5f9JcWcXlfmIpx4pJKN6iLb1DLwaBZ0bWbE
	 Abrb8tPrbJSN0uvandjTnYHcCBcyrWeqAjqixIN023QdjpD2zbVIyRqjdiOE8a8rCcwHq
	 Z5mZof1G3StHvNOKeV0vTWwcR3VqX+L+HhNzfjNP+ekRY1Pgfy818aZfFFVeT/NPB9Mlj
	 ZWldN9DFeJl35PgW6Z348QZhSPsb3OdOcnPT43uN3QA4mOHXRI9TtkjgcAMsjgq0VQbVk
	 Ug100q2TFhJpxW/PrXHS30Zr9HtnClshqIpYZAdcjZCYOOZ+3TPQywFS0uQY3ixjkrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397040;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=gHjHPYzYFGNoBcBOrXZtd+e39D6l/yEcTx52k80YRjg=;
	b=2y+jI0lHhGAdkOvcueO/EHZQKqrEWHnzEuY5r9qtj7PkCZ0UcJoaQmSuP2Mr0/fQopg5
	 fhjDcNw2ogTSMiHkdvt3/CiGopCVgAzbck5k/Mq0Dqvb30osWczIESMlV2jH/q250gPfv
	 VwPMGICkv1GnnqjUqazTlm1oG79ZN1s9UmWjBBcp5LaE+osXxlp6SSQ3J3y/XfDNJZ4yk
	 5OuTJmMbVTUkDwxWI7jKysQRisFQzXUsi/iKp7QzpNJMDk5AXlNeD+n3OfivA13GojiwV
	 ivAkIi1m+8FWNC+xBNSs39HLzcqqvuOefTdHiiwnqaQvRyo5OOr6rkT+vkbHs7cUT3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BCk4wntb;
	arc=none smtp.remote-ip=95.215.58.18
Received: from mta1.migadu.com (out-18.mta1.migadu.com [95.215.58.18])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5446C606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:37:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5446C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BCk4wntb
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=gP+bjxnK3W7GTVCgRjyqyfMbhuLKSiiRqPVwb9GN29c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794397037; v=1; x=1795001837;
 b=BCk4wntbKqQ1VxpnfJrGukgQdXpxqo04mrTAMB75yxxGpJDz86lf6aZCpMZkUwZ1U+zWR+Dh
 Kwq30CdrKELyWPk1Yrk9jujFHLuix5bqAALuOUP4CClpTfaCNEAcWB45f9cpPcrAuynZsV19/UN
 Xi9HNPFF3PW9JuBxAlpvLCMU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id e4099ae768a2b555;
	Wed, 11 Nov 2026 11:37:17 +0000
X-Mizu-Trace-ID: e4099ae768a2b555
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
Subject: Re: [PATCH v2 0/2] mm: optimize HugeTLB bootmem hugepage init
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <016ed325-2b5c-4170-b545-47b766d7f8e8@bytedance.com>
Date: Wed, 11 Nov 2026 19:37:02 +0800
Cc: Mike Rapoport <rppt@kernel.org>,
 akpm@linux-foundation.org,
 apopple@nvidia.com,
 balbirs@nvidia.com,
 David Hildenbrand <david@kernel.org>,
 osalvador@suse.de,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <60D78CBE-E9AC-4032-A1F9-AA0B2264494D@linux.dev>
References: <20261110114859.76343-1-lizhe.67@bytedance.com>
 <avQjbt-QUp-W3_9v@kernel.org>
 <016ed325-2b5c-4170-b545-47b766d7f8e8@bytedance.com>
To: Li Zhe <lizhe.67@bytedance.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 11, 2026, at 19:24, Li Zhe <lizhe.67@bytedance.com> wrote:
>=20
> On 11/11/26 4:12 PM, Mike Rapoport wrote:
>> Hi,
>>=20
>> On Tue, Nov 10, 2026 at 07:48:57PM +0800, Li Zhe wrote:
>>> This series speeds up the fallback initialization path for HugeTLB =
tail
>>> struct pages during boot-time hugepage allocation, when HugeTLB =
vmemmap
>>> optimization (HVO) is unavailable or fails.
>>>=20
>>> Patch 1 factors the existing ZONE_DEVICE template-copy operation =
into
>>> memmap_init_page_from_template().
>>>=20
>>> Patch 2 reuses that helper in hugetlb_folio_init_tail_vmemmap():
>>> initialize the first tail page normally, copy it into a local =
template,
>>> then initialize the remaining tail pages by refreshing only =
PFN-dependent
>>> fields before copying the template.
>>>=20
>>> In the earlier discussion, Mike asked whether the same kind of
>>> template-based initialization also helps the ordinary struct page
>>> initialization path:
>>>=20
>>> https://lore.kernel.org/all/akfB6Qe-jKDEMUxz@kernel.org/
>>>=20
>>> I tested that direction as well, but did not see a measurable =
benefit
>>> for ordinary struct page initialization. The measurable improvement =
I
>>> could find is in the HugeTLB bootmem hugepage tail path, where =
gigantic
>>> pages can require initializing a large number of tail struct pages =
when
>>> HVO does not cover the allocation.
>>>=20
>>> Tested on an arm64 QEMU/KVM guest with 4K base pages and 64 =
boot-time 1G
>>> hugepages. HVO is unavailable on arm64 in v7.4-rc1, so the fallback =
tail
>>> initialization path is exercised.
>>>=20
>>> Results averaged over five boots, measured with a temporary
>>> jiffies-based printk:
>>>=20
>>>   base (v7.4-rc1):  318.4 ms
>>>   with this patch:  202.4 ms
>> Are there numbers for x86 without HVO as well?
>> We need to be sure this does not regress that use case.
>=20
>=20
> Thanks for the feedback.
>=20
> I did some additional x86 testing today, but the result was different
> from the similar x86 test I did earlier on linux-7.2-rc1. After
> replacing memcpy_nontemporal() with regular memcpy(), the result =
looked
> better. I need to re-check the old test code, since I may have mixed =
up
> which copy primitive was used there.
>=20
> Muchun, could you please hold off folding this series into your =
patchset
> until I send v3?

Sure.

Thanks.

>=20
> Thanks,
> Zhe
>=20
>>=20
>>> This is a 36.43% reduction in the measured fallback tail =
initialization
>>> time. The temporary measurement instrumentation is not part of this
>>> series.
>>>=20
>>> Li Zhe (2):
>>>   mm/mm_init: factor out memmap_init_page_from_template()
>>>   mm/hugetlb: optimize bootmem hugepage tail vmemmap init
>>>=20
>>>  mm/hugetlb.c | 20 +++++++++++++++-----
>>>  mm/mm_init.c | 34 ++++++++++++++++++++--------------
>>>  mm/mm_init.h |  2 ++
>>>  3 files changed, 37 insertions(+), 19 deletions(-)
>>>=20
>>> ---
>>> v1: =
https://lore.kernel.org/all/20261105120615.16817-1-lizhe.67@bytedance.com/=
#t
>>>=20
>>> Changes in v2:
>>> - Add a comment for the template-before-copy ordering, as suggested =
by
>>>   Muchun Song.
>>> - Drop the empty-range guard in hugetlb_folio_init_tail_vmemmap()
>>>   as suggested by Balbir Singh and Mike Rapoport; current callers =
are
>>>   expected to pass a non-empty range.
>>>=20
>>> --=20
>>> 2.20.1


