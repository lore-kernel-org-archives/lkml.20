Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827877;
	b=x4LmcKdgl5Qb06pxrbsDYn18+eUmeAc1hRkbMImnUXgbH/K+d1PJXYpXp6p0EmuBUMYt
	 AA/4M+W8+MUudXb+qF+dd/+BHDcnEiRj44xnYMWxx3U1W8hFSpiCsr4KYZpAk24VXksYk
	 p36rj3QIoENiKU1hhrN769NR68HO/B2fjwNDE1gNqVUDpVRzozdxgy7cdRTMBm1sccACk
	 +7enNNHxQ3GYnsctR1xwrgc5FTngaJcWgD5DWGIFSQZhqIubxux8tUhj4MtX5Ll6yC6jk
	 g0kPgS2D1gLGXElfVv+ptN1DRKsqZswz4aevMccnmSFTVNz39EG3GmsKF3/FO+2OtqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827877;
	h=DMARC-Filter:DKIM-Signature:Content-Type:Content-Transfer-Encoding:
	 From:Subject:Date:Message-Id:X-Original-From:X-Lms-Return-Path:
	 User-Agent:Cc:Mime-Version:To:In-Reply-To:References;
	bh=gcSYfJo9DBtW87ibrEcEB+4TxGxQarLrxm69h/JCdcA=;
	b=NLVovbIzuzodQWzgSik6AOsnNmfH789Xk2Nijox8/UGri/nbTMiyLLFN4vTHy2oOcgEI
	 FyEjlpfu65zRaeSWccqZFoKjmYbCsqLJsekqPoCHBPKMo92giW+sRWzZfKP3zp7IIh2yI
	 ZhEHvH91wOMinddSRHOL4I6AaPTZ2+DfHBaA/vVUANp/kMgEzH7z6otqcOuUE74LLCJ3F
	 k98cvvJuLyb3I4Rb7O4B4cBbyXeCKet0VHgHugwpAeMLjzppgYTvmgJNmG8qhS7Yru8RI
	 GRtt11gmAMZPmbe2uKkOIYSY6DfmgRG3j7A6fTQhQtSutrqQz8HgcXQGkISqwz6zCPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=mQcxeC6t;
	arc=none smtp.remote-ip=209.127.230.111
Received: from va-1-111.ptr.blmpb.com (va-1-111.ptr.blmpb.com [209.127.230.111])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B85606E487
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77B85606E487
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=mQcxeC6t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1794827870; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=gcSYfJo9DBtW87ibrEcEB+4TxGxQarLrxm69h/JCdcA=;
 b=mQcxeC6tNSjEUQqT1PHD9V7k1HbfoEE3KELg89HubxEA97yFDXM9EtbD4F9tKVWOGoQ2gY
 RMfsd1avzgnoSVOBDbDRW5wKY5iSx9e3Bh3m2YMbQIOvOohcMR1FLEbqvM3/a02HtWwi15
 cSY7pzarXdhyHFfiq/lg8h9E8CDXgbv266+7lwOIn7nVjkC7Sfw+NOSb3bQ9q4qBryBSZ+
 WYLa3mUGNEDq7zs79X3YBv8aVRNSLNbdO9utyS7I9gDoFc8mSd3TTTAE99n3c9zDbKd/DD
 DzyD6y/VGMkCGaKuQ6m8yfFJVFyTQxqBAaNp95lIPoMIsXpGq3C9gGQl23O2Uw==
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
From: "Li Zhe" <lizhe.67@bytedance.com>
Subject: Re: [PATCH v2 00/14] mm: Unify memmap initialization for compound pages
Date: Mon, 16 Nov 2026 19:17:27 +0800
Message-Id: <f38322fb-abb7-4284-b6d5-bd6e747333bb@bytedance.com>
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
X-Lms-Return-Path: <lba+26afae65c+33a578+vger.kernel.org+lizhe.67@bytedance.com>
User-Agent: Mozilla Thunderbird
Cc: "Andrew Morton" <akpm@linux-foundation.org>, 
	"David Hildenbrand" <david@kernel.org>, 
	"Oscar Salvador" <osalvador@suse.de>, 
	"Andrew Popple" <apopple@nvidia.com>, 
	"Balbir Singh" <balbirs@nvidia.com>, "Lorenzo Stoakes" <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, 
	"Vlastimil Babka" <vbabka@kernel.org>, 
	"Suren Baghdasaryan" <surenb@google.com>, 
	"Michal Hocko" <mhocko@suse.com>, "Muchun Song" <muchun.song@linux.dev>, 
	"James Houghton" <jthoughton@google.com>, 
	"Lance Yang" <lance.yang@linux.dev>, "Qi Zheng" <qi.zheng@linux.dev>, 
	<linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
To: "Mike Rapoport" <rppt@kernel.org>, 
	"Muchun Song" <songmuchun@bytedance.com>
In-Reply-To: <179482576829.2379196.3205677806966393313.b4-review@b4>
References: <20261113033442.62970-1-songmuchun@bytedance.com> <179482576829.2379196.3205677806966393313.b4-review@b4>

On 11/16/26 6:42 PM, Mike Rapoport wrote:
> Hi,
>
>> Hi,
>>
>> This v2 is based on the mm-new branch at commit daed51c91051.
>>
>> This series is split out from the earlier, larger series
>> "mm: Generalize HVO for HugeTLB and device DAX" [1]. That series
>> generalized vmemmap optimization across HugeTLB and device DAX. One
>> remaining piece is the separate compound struct page initialization used
>> by boot-time gigantic HugeTLB pages and compound ZONE_DEVICE ranges.
>>
>> This v2 also folds in Li Zhe's two-patch series, using that series' v2
>> as the integration point [2].
>>
>> Li Zhe (2):
>>    mm/mm_init: factor out memmap_init_page_from_template()
>>    mm/hugetlb: optimize bootmem hugepage tail vmemmap init
>>
>> Muchun Song (12):
>>    mm/mm_init: verify zones for template-initialized pages
>>    mm/mm_init: factor out common struct page initialization
>>    mm/mm_init: simplify zone device page initialization
>>    mm/mm_init: factor out frozen compound page initialization
>>    mm/hugetlb: drop boot-time HVO handling for gigantic folios
>>    mm/hugetlb: initialize all struct pages for bootmem hugepages
>>    mm/hugetlb: use common compound page initialization helper
>>    mm/mm_init: make __init_single_page() static
>>    mm/mm_init: make memmap_init_page_from_template() static
>>    mm/cma: centralize CMA pageblock initialization
>>    mm/cma: localize init_cma_pageblock() to cma.c
>>    mm/mm_init: move pageblock migratetype init to memmap helpers
>>
>>   include/linux/mm.h   |   8 --
>>   mm/cma.c             |  24 +++--
>>   mm/hugetlb.c         | 111 ++-----------------
>>   mm/hugetlb_vmemmap.c |  17 +--
>>   mm/mm_init.c         | 247 +++++++++++++++++--------------------------
>>   mm/mm_init.h         |  13 +--
>>   mm/sparse-vmemmap.c  |   7 +-
>>   7 files changed, 129 insertions(+), 298 deletions(-)
> That's nice :)
>
> The series would be easier to review if Li Zhe's patches were integrated
> rather than stacked in. I hoped that the changes for template
> initialization would fit into the patches that rework other parts.
>
> The way it's done now several patches in the beginning of the series
> change code that the later patches remove or turn some of new functions
> into static.
>
> Another thing is that the numbers Li Zhe measured were for a different
> implementation, so they would be stale for the state after these
> changes.


Agreed. I would be happy to provide updated performance numbers once the
final integrated form is ready.

Thanks,
Zhe

>
> I have some nits and naming comments in a few patches, other than that
> the series LGTM.
