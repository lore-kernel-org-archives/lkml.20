Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFE7547041
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789722381; cv=none; b=lb9B4v4mdNv4BuO0nGVEFODNJ4WKq1TIBXfI0XagA/WcLmvkaFVjisjULIsjchZZA1bgW/LNb0qGM3xNbHrLlLSkmZrCLAXIoDlGtpmQrdq+oJy8gnrhB7sRyl19yUdatVPnkl9cUrgX2WgDOzI7ibE/sB+IOsKaMKxZSjRR2Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789722381; c=relaxed/simple;
	bh=YE0hxpp1N3lqYdwFhEMMmoh1MyQuAOfTp728SUg/K9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kdN6rjfBT39VOMSg5+N27aM/qUcWR2TYY+3xuGJnD6v1ZLt1S3BpiKpLBtDDp0ijyZJrKhakBBLy8gtoRhpG2urkF1Tm4z4s5SqGjUrcUDe1aGo9//bThHGuGhaVbEQgnvmS7wrBawjcKtfdUd10TipEXqiBI6YmAgd2DZytg6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ioNvN02Z; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ioNvN02Z"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789722376; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Xiz4ClEGfoyBjTaUK3UJ93XNcGn3MukFPVK9wlb3W2Y=;
	b=ioNvN02ZygKJDwda2sInrmF2a8fmScPeKvMsMIxG/7YP3v0l+rIGVOTxqbY89XiytCWUB+lXZBVjSaU2ZksR0aK4rnfHxWhwlMo+HQ0Om2wQko1OmLPdPniYjRd8IcnGJKTKwv2zmx972H/JcIc+CHFZ8Gz0GjJL42rLCK0y9Qo=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0XBAoH36_1789722373;
Received: from 30.74.144.124(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XBAoH36_1789722373 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 18 Sep 2026 17:06:14 +0800
Message-ID: <0230e861-8364-4302-a607-c34809a4a809@linux.alibaba.com>
Date: Fri, 18 Sep 2026 17:06:13 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/12] mm/collapse: separate scanning a PTE table from
 collapsing it
To: Kiryl Shutsemau <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Zi Yan <ziy@nvidia.com>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>,
 Jann Horn <jannh@google.com>
References: <20260916093145.4022188-1-kirill@shutemov.name>
 <20260916093145.4022188-9-kirill@shutemov.name>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260916093145.4022188-9-kirill@shutemov.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/16/26 5:31 PM, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> A collapse is two jobs.  One reads a PTE table under mmap_lock and decides
> whether the range is worth collapsing.  The other allocates, isolates,
> copies and flushes, and wants the lock given up first.
> 
> collapse_single_pmd() did both, so the boundary between them was somewhere
> in the middle of a function.
> 
> Give each half its own function:
> 
>    - collapse_scan_pmd() scans one table and only reads.  The anonymous
>      scan that used to carry that name keeps its body as
>      collapse_scan_anon_pmd(), and collapse_scan_pmd() is now the entry
>      that picks the anonymous or the file side.
> 
>    - collapse_run_pmd() does the collapse the scan asked for, and is
>      handed what the scan returned.  SCAN_SUCCEED means there is
>      something to collapse.  SCAN_PTE_MAPPED_HUGEPAGE means the page
>      cache already holds the PMD folio and only the PTE table is left to
>      retract.  Both are work for the run; anything else is why there is
>      nothing to do.
> 
> collapse_single_pmd() is now the two of them with the mmap_lock drop in
> between, so its callers see what they saw before.
> 
> What the scan found and the run needs travels in collapse_control.  For
> an anonymous table that is the orders and the referenced and swapped-out
> counts, which mthp_collapse() and collapse_huge_page() now read from
> there instead of taking as arguments.  For a file it is the file itself
> and the offset in it.
> 
> The file side moves with the anonymous one.  collapse_scan_file() used to
> run with mmap_lock already given up, and called collapse_file() itself
> when the page cache looked worth it.  It now runs under the lock like the
> anonymous scan and only reads; the run does the collapse.  A file
> collapse works on the page cache and never sees a VMA, so the scan takes
> the file reference while it still has one and the run gives it back.
> 
> That changes what a refused file table costs khugepaged.  Every file
> table it scanned used to end its pass over that mm, because the lock had
> been dropped to scan it; now only a table it goes on to collapse does.
> 
> Two things on the file side stop being rescanned.  When the page cache
> already holds the PMD folio, the scan says so and the run goes straight
> to retracting the PTE table.  A run that refuses dirty pages and may
> write them back retries collapse_file() alone.  The checks the scan makes
> ahead of it are ones collapse_file() repeats under the page cache lock.
> 
> Tracing changes with it.  mm_khugepaged_scan_pmd and
> mm_khugepaged_scan_file used to fire after the collapse, so for an
> accepted table their status field carried what the collapse made of it.
> They now fire before it and read SCAN_SUCCEED for an accepted table.  What
> the collapse then made of it is for mm_collapse_huge_page and
> mm_khugepaged_collapse_file to report.
> 
> Assisted-by: LLM
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
