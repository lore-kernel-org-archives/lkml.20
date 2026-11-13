Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.114
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538301;
	b=O7tQuwNOhOsAoUZmv7ro771rcxMQ/eN7eB3+F4iPoJ+59W7Fp/mLthJTE8CLbINfl/sb
	 5cxDUyyich7+JkOi0G+HQaFxwwaJwV+c0+l8GNFVfNBlZa9gtDCzqcatAdXKU8WGiaeyv
	 ZAzF//o5EpL1cWpATd840QjRUxsg1dudE9XHJ1kruJGNeq30qWU5/Cic5CIbU3q8fPKmi
	 zRmN78liLuIG9bAGgAUCwNtrur9hnPmVkiyjhX9WdbHJCKKGF11kCIoSJDNjmtLXSTiR2
	 BoGRnEF4eucAx54EbMI/BUyuMMvYw6l/RVrBvQI2ylMs2uiXS9hldyj1YiQzQU0BbZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538301;
	h=DMARC-Filter:DKIM-Signature:To:Cc:From:Content-Transfer-Encoding:
	 Subject:Message-Id:X-Lms-Return-Path:User-Agent:References:
	 Content-Type:Date:Mime-Version:In-Reply-To:X-Original-From;
	bh=+YRcWe5ydsqpJxzKXRG4SuI3NKwOOqWh/rIS+/JCBTc=;
	b=RJUtiLpN8sWcFlCOm6OBLgia3GjNMV321kDPrS1GiqfMTfVn1MdaHKlZoIPnkwx+JhDU
	 qyhZLIOtten6fIypIFKD/vSbrurVSzNexlrQ8e6pXUF4RwZGNCPyLJf6L/nvw3XzB0vSU
	 b5Rp/ggafziO0vgeCbsRSYUwkz8R+kL/URJnBIUbfu+WXQLc2obkxjeQk8ArWaJ0H1/Op
	 rqfadzb3vG/BoT2QxQkhcAUAz6qiSde/Y9eeveEyqpdroA+K55Z/Xqjfn1LLp/70KtmLb
	 0ndc5C5o62MCPKjpOtUkqZ5+Owcp/d06hvEmVdJAzdh9WmUwnEJDOKxY7JPMIhKUhpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=DZQ912y+;
	arc=none smtp.remote-ip=209.127.230.114
Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56191606A8A8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:51:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56191606A8A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=DZQ912y+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1794538294; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=+YRcWe5ydsqpJxzKXRG4SuI3NKwOOqWh/rIS+/JCBTc=;
 b=DZQ912y+P5MA9NsSSXotnrMR6eETM3MVhOkoASheTYQIdP8AQzL/qXrlbloawbuHG7La9f
 7rxtbQh5xiNpjq567aBHN9ozw9wfeZTY+12iZeFsDkrqO4NXsUlFHx61LdPH6DM2yjMvM8
 frlm+bMW1tBendbk9M/xBSzmWxM6MxbLrJwXD6mK7uVoaVZWkrke/KwsnHxYYNggxKjCy0
 BsOcAGuNOiNCfY+sW+ldPD+0Qku9qYFBk4yxUKhcfIh2Mt0lBj/lnf6dWPhkwIpt9ztoLK
 bzgKBUdjX/yvlx3ez4ERvxPxhGxwFw+z2IzUf1F+Omq2N1GiwYu+HaUdH9ntZw==
To: "Mike Rapoport" <rppt@kernel.org>, <muchun.song@linux.dev>
Cc: <akpm@linux-foundation.org>, <apopple@nvidia.com>, <balbirs@nvidia.com>, 
	<david@kernel.org>, <osalvador@suse.de>, <linux-kernel@vger.kernel.org>, 
	<linux-mm@kvack.org>
From: "Li Zhe" <lizhe.67@bytedance.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 0/2] mm: optimize HugeTLB bootmem hugepage init
Message-Id: <bc6988cd-b971-4846-a7e9-e7867b0d0880@bytedance.com>
X-Lms-Return-Path: <lba+26af67b34+277d00+vger.kernel.org+lizhe.67@bytedance.com>
User-Agent: Mozilla Thunderbird
References: <20261112112816.55095-1-lizhe.67@bytedance.com> <avXqoKO_5_tPRZ4g@kernel.org>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Nov 2026 10:51:15 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
In-Reply-To: <avXqoKO_5_tPRZ4g@kernel.org>
X-Original-From: Li Zhe <lizhe.67@bytedance.com>

On 11/13/26 12:34 AM, Mike Rapoport wrote:
> Hi,
>
> On Thu, Nov 12, 2026 at 07:28:14PM +0800, Li Zhe wrote:
>> This series speeds up the fallback initialization path for HugeTLB tail
>> struct pages during boot-time hugepage allocation, when HugeTLB vmemmap
>> optimization (HVO) is unavailable or fails.
>>
>> Patch 1 factors the PFN-dependent template refresh from the ZONE_DEVICE
>> template-copy path into memmap_init_refresh_pfn_fields().  The
>> ZONE_DEVICE path keeps its memcpy_nontemporal() copy primitive.
>>
>> Patch 2 adds a HugeTLB-specific copy helper in
>> hugetlb_folio_init_tail_vmemmap(): initialize the first tail page
>> normally, then initialize the remaining tail pages by copying that page
>> with memcpy() and refreshing only PFN-dependent fields in the destination
>> page.
>>
>> Tested on a v7.4-rc2 base with 4K base pages and 64 boot-time 1G
>> hugepages, measured with a temporary jiffies-based printk.  HVO is
>> unavailable on arm64; on x86-64, hugetlb_free_vmemmap=off was used to
>> exercise the fallback path.
>>
>>    arch    base      with this patch  reduction
>>    arm64   360.8 ms  256.0 ms         29.05%
>>    x86-64  171.0 ms  165.0 ms          3.51%
> Thanks for the numbers!
>   
> The changes are fine, but since they are going to be merged into Muchun's
> series, I'll wait for that for the detailed review.


Thanks Mike.

Muchun, thanks for integrating these patches into your series.

Thanks,
Zhe

>
>> Li Zhe (2):
>>    mm/mm_init: factor out memmap_init_refresh_pfn_fields()
>>    mm/hugetlb: optimize bootmem hugepage tail vmemmap init
>>
>>   mm/hugetlb.c | 23 ++++++++++++++++++-----
>>   mm/mm_init.c | 11 ++++++-----
>>   mm/mm_init.h | 11 +++++++++++
>>   3 files changed, 35 insertions(+), 10 deletions(-)
