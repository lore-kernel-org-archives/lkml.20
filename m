Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794396298;
	b=Dfx/mjMXIdl8wZ93DP8c0EXdK1qg/HiirozMt4U6igrC2PoZJ3NT28u96khM3XPpkCxt
	 k6tJDITnHr7plFTGNF6ZSo/pdbQvNxXCZgzOcb6y07/2uQMB3izUQihbLyNLWn4TCvLXN
	 EXO160VUUZ7rfd1Zwr1ouPQwkw06jGsuvzofTYclRUdjfTePhHm98qPMaUqdmLkM0kIV0
	 BWHmyYRjGOAXeo3qoM269gLetWehbeFgWX2bs3Z2K1kLwuF12+dehtp/4MqllT0UHvZ15
	 ZFTbewcxZzE2INk+pANc2oCpnIt9GCobk4MHXdRkOP5Eo1kfjxLThHVJ8BISfFbUotg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794396298;
	h=DMARC-Filter:DKIM-Signature:Content-Type:References:Date:Message-Id:
	 Mime-Version:Content-Transfer-Encoding:In-Reply-To:User-Agent:From:
	 X-Lms-Return-Path:X-Original-From:To:Subject:Cc;
	bh=NVdfdUf+zfYeCBjYOT/U/HtbAWZ/RAxAIgf7+f5fEIo=;
	b=r5mOlZpsHWwWOG4Ew2g+TDnCQiffe6gui+WhbrZqvp3b/CeUEFMI34Oz/xkL6lztdVZ/
	 lgfkLvoY+62/VrpEEUigtsJAlw1fA528HbiwO3Xi/nooxy+p7kWJfnjowYHEQUSX7oV1U
	 H+a9pk/4nTjyQx7eAnRoZGcsp8KlZ5wd2V0N7eVr85/I20PQYSW4bwrBAvj2O7LEF6Y7j
	 v2jLQK4hO4sBq19mA+YR43MwvQoYjXPwT3GNkAP7EvAS2xjEpxp/aQa1wCWctHYo3/FGt
	 ggRWg7oywoGdlVKhRft5UigLkHtESEMBeb7p/vjVgOpH/RpbO6jebaNmZIcrMJbj0SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=bl5uhVOo;
	arc=none smtp.remote-ip=209.127.230.113
Received: from va-1-113.ptr.blmpb.com (va-1-113.ptr.blmpb.com [209.127.230.113])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E67F606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E67F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=bl5uhVOo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1794396292; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=NVdfdUf+zfYeCBjYOT/U/HtbAWZ/RAxAIgf7+f5fEIo=;
 b=bl5uhVOoos64AzgvqPNRcE9nkGzyKPkB4Nw1A4ZqYOZqn51XaCTYG7WTe5kLq7AjiwwF92
 5dVkUuNX3xkPeox4hUzpdLhtLW3up+r7Vd9FaVCz6ilmVPWbxOTkInR3PCdjlz61qYYXeK
 4e3kHtL96iL2vxTaOpLuTAKJp7PQI+r8MUvB3gZk3zXlYXdIJ58Jdszahxk9FSPnhqISml
 /5powAz86rxub69+6Pp0zDZ/8dP6EdMp0/5EBLV0EopxUMrEqr0b1I3eyZWNnRYK/IpMLR
 mYed++T0ymgb94exuxERGkCWt09kODXsn7a0IvPizy+Bk3TsOBAaic7gqqY3ow==
Content-Type: text/plain; charset=UTF-8
References: <20261110114859.76343-1-lizhe.67@bytedance.com> <avQjbt-QUp-W3_9v@kernel.org>
Date: Wed, 11 Nov 2026 19:24:33 +0800
Message-Id: <016ed325-2b5c-4170-b545-47b766d7f8e8@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <avQjbt-QUp-W3_9v@kernel.org>
User-Agent: Mozilla Thunderbird
From: "Li Zhe" <lizhe.67@bytedance.com>
X-Lms-Return-Path: <lba+26af45082+77afdc+vger.kernel.org+lizhe.67@bytedance.com>
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
To: "Mike Rapoport" <rppt@kernel.org>, "Muchun Song" <muchun.song@linux.dev>
Subject: Re: [PATCH v2 0/2] mm: optimize HugeTLB bootmem hugepage init
Cc: <akpm@linux-foundation.org>, <apopple@nvidia.com>, <balbirs@nvidia.com>, 
	<david@kernel.org>, <osalvador@suse.de>, <linux-kernel@vger.kernel.org>, 
	<linux-mm@kvack.org>

On 11/11/26 4:12 PM, Mike Rapoport wrote:
> Hi,
>
> On Tue, Nov 10, 2026 at 07:48:57PM +0800, Li Zhe wrote:
>> This series speeds up the fallback initialization path for HugeTLB tail
>> struct pages during boot-time hugepage allocation, when HugeTLB vmemmap
>> optimization (HVO) is unavailable or fails.
>>
>> Patch 1 factors the existing ZONE_DEVICE template-copy operation into
>> memmap_init_page_from_template().
>>
>> Patch 2 reuses that helper in hugetlb_folio_init_tail_vmemmap():
>> initialize the first tail page normally, copy it into a local template,
>> then initialize the remaining tail pages by refreshing only PFN-dependent
>> fields before copying the template.
>>
>> In the earlier discussion, Mike asked whether the same kind of
>> template-based initialization also helps the ordinary struct page
>> initialization path:
>>
>> https://lore.kernel.org/all/akfB6Qe-jKDEMUxz@kernel.org/
>>
>> I tested that direction as well, but did not see a measurable benefit
>> for ordinary struct page initialization. The measurable improvement I
>> could find is in the HugeTLB bootmem hugepage tail path, where gigantic
>> pages can require initializing a large number of tail struct pages when
>> HVO does not cover the allocation.
>>
>> Tested on an arm64 QEMU/KVM guest with 4K base pages and 64 boot-time 1G
>> hugepages. HVO is unavailable on arm64 in v7.4-rc1, so the fallback tail
>> initialization path is exercised.
>>
>> Results averaged over five boots, measured with a temporary
>> jiffies-based printk:
>>
>>    base (v7.4-rc1):  318.4 ms
>>    with this patch:  202.4 ms
> Are there numbers for x86 without HVO as well?
> We need to be sure this does not regress that use case.


Thanks for the feedback.

I did some additional x86 testing today, but the result was different
from the similar x86 test I did earlier on linux-7.2-rc1. After
replacing memcpy_nontemporal() with regular memcpy(), the result looked
better. I need to re-check the old test code, since I may have mixed up
which copy primitive was used there.

Muchun, could you please hold off folding this series into your patchset
until I send v3?

Thanks,
Zhe

>   
>> This is a 36.43% reduction in the measured fallback tail initialization
>> time. The temporary measurement instrumentation is not part of this
>> series.
>>
>> Li Zhe (2):
>>    mm/mm_init: factor out memmap_init_page_from_template()
>>    mm/hugetlb: optimize bootmem hugepage tail vmemmap init
>>
>>   mm/hugetlb.c | 20 +++++++++++++++-----
>>   mm/mm_init.c | 34 ++++++++++++++++++++--------------
>>   mm/mm_init.h |  2 ++
>>   3 files changed, 37 insertions(+), 19 deletions(-)
>>
>> ---
>> v1: https://lore.kernel.org/all/20261105120615.16817-1-lizhe.67@bytedance.com/#t
>>
>> Changes in v2:
>> - Add a comment for the template-before-copy ordering, as suggested by
>>    Muchun Song.
>> - Drop the empty-range guard in hugetlb_folio_init_tail_vmemmap()
>>    as suggested by Balbir Singh and Mike Rapoport; current callers are
>>    expected to pass a non-empty range.
>>
>> -- 
>> 2.20.1
