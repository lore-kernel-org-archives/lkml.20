Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794034461;
	b=m001Gp9ziHom8inA5jxoksxYRNQjNpWV6jVuLeEtFh2aWzKvQFdbTXGxvtC7Vpobhc65
	 qVzzIiOutw+XtMeY7ba22IUEt+wbZCROBJsci10uZ14YS39fhhuNSbrDcFCmgiuEGJbWq
	 A0JNe6kzhM2Zkeg/QVMItnuFsolczktQ/pL6pbQBhmIrRhqaki52MDqyTA6ldK3tUBnJ1
	 pN9j4B+bJsMp7HE14GwWcVPSu+gKpHAYy3M7E9b5obg+5LJSi/fbzKlnairpyCdQZR/x/
	 MHHJrQcibY0EN99jEjKe/uxiK6oo0VHBqDV8AILOWlgwNknmbIfyKyrPOpC/sNRGYiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794034461;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:In-Reply-To:References:Date:Message-ID:User-Agent:
	 MIME-Version:Content-Type;
	bh=7KJP7j2uL4vPq5fW0b0gSJi5ZwRkv6NnOMBE9fSZtqQ=;
	b=IxdZUnZhL6CGA2mlhzJD+/vmxPyqpRfChuufLrIYmaguiiOMrDiftiVsIv7q/HKW1EOa
	 14fFDqUoxOAZSy1KN3Bmh9JOvggbxIEff+mH9p42OhLxPdo17C+kxRauQZl6Xgdlai3PK
	 iOLPAqT6cYLDdVBtghqHKE8n3tKUQhyCHnWMcJo0VemH/vVpB7OMkKKXUKfkiadzvv9aY
	 +fj30OkjJR0zrP8wjRo2JLIrpFlSUzy/DyQrr6Xq6j4NwgyRSc9ilyCrmvjdFpL23dT08
	 Pnuq4z0CH3IKPHQyKjPuEh2G5pVHFZQYfv5T+9q8Ka30lMgj8D0JYKBg6theAtX5n6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=NpNHKmNh;
	arc=none smtp.remote-ip=115.124.30.124
Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9CD606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 06:54:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC9CD606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=NpNHKmNh
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794034457; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=7KJP7j2uL4vPq5fW0b0gSJi5ZwRkv6NnOMBE9fSZtqQ=;
	b=NpNHKmNhUAx622uQqI6k5wGpxeTIhX+N5T4rWKBE+AQ72WCGu9j9UM+7e6W8lZxFA59qG2q+Oq3riUFzvgIO0R5l4vBQX6kkk7pvmu9vO8gMDN0K7VSCIYVjyJgx4TkY8l9uLjQv4hvIQmg/5nAUVb19vEEDjXL7jDRkzpJJdX4=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=ying.huang@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0XEDj0Ge_1794034454;
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0XEDj0Ge_1794034454 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 07 Nov 2026 14:54:15 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Zhiteng Qiu <qiuzhiteng@hygon.cn>
Cc: Andrew Morton <akpm@linux-foundation.org>,  David Hildenbrand
 <david@kernel.org>,  Zi Yan <ziy@nvidia.com>,  Matthew Brost
 <matthew.brost@intel.com>,  Joshua Hahn <joshua.hahnjy@gmail.com>,
  Byungchul Park <byungchul@sk.com>,  Gregory Price <gourry@gourry.net>,
  Alistair Popple <apopple@nvidia.com>,  Xin Hao <xhao@linux.alibaba.com>,
  Dave Hansen <dave.hansen@linux.intel.com>,  <linux-mm@kvack.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mm/migrate: don't batch the TLB flush when there is
 nothing to batch
In-Reply-To: <20261107015057.1328227-1-qiuzhiteng@hygon.cn> (Zhiteng Qiu's
	message of "Sat, 7 Nov 2026 01:50:57 +0800")
References: <20261106041628.1177963-1-qiuzhiteng@hygon.cn>
	<87zevmwbaj.fsf@DESKTOP-5N7EMDA>
	<179395975709.1235605.1971486611419119070@hygon.cn>
	<20261107015057.1328227-1-qiuzhiteng@hygon.cn>
Date: Sat, 07 Nov 2026 14:54:14 +0800
Message-ID: <87qzgxw2qx.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii

Zhiteng Qiu <qiuzhiteng@hygon.cn> writes:

> Hi Ying,
>
> I instrumented the unmap path on both kernels (kprobes, 55 s windows,
> same workload).
>
> b99a342d4f11 does what it should.  On the patched kernel, where the
> old PTE can be read from ptep_clear_flush(), about 96% of the PTEs are
> still PROT_NONE when try_to_migrate_one() clears them.  The flushes
> come from pte_accessible() treating a PROT_NONE PTE as accessible while
> mm->tlb_flush_pending is raised.  On the unpatched kernel that is the
> case for about 42% of the migrations (3.5% with the patch), and each of
> those does a full arch_tlbbatch_flush() to about 380 CPUs.
>
> tlb_flush_pending is raised that often because of a loop.  Each batched
> unmap bumps mm->tlb_flush_batched, and only flush_tlb_batched_pending()
> marks it flushed.  So while migrations keep coming, change_pte_range()
> in the NUMA scanner does a flush_tlb_mm() for every PTE table it walks:
> about 11,600 full flushes in the window, one per 512 pages scanned,
> and 99.9% of them come from that call stack.  The average mmu_gather
> in task_numa_work() takes 91 ms on the unpatched kernel and 6.7 ms with
> the patch.  A longer scan catches more migrations with
> tlb_flush_pending set, and more migrations make the scan pay again.
> With the patch, a lone order-0 folio is unmapped with
> ptep_clear_flush() and never touches tlb_flush_batched, so the loop
> does not start.  The remaining ~13 interrupts per page with the patch
> are the same effect at a much smaller scale: the 3.5% of migrations
> that still overlap a scan.
>
> So the patch helps by not leaving a pending batch behind, not by making
> a single flush cheaper.  I'll rewrite the changelog to say that in v2.

I found that it's not easy to understand the text above.  A figure like
the one in the below commit may help:

https://github.com/torvalds/linux/commit/5a6c9cf117fca3c38a98fb2a2d5549795c8b0b73

Have you adjusted the NUMA scanning parameters?  I originally thought
that the scanning is slow, so it wouldn't be common for scanning and
NUMA hint faulting to race.

> The loop could also be broken on the flush side, by letting
> try_to_unmap_flush() mark the batch as flushed.  But tlb_flush_batched
> is per mm while the batch is per task, so I don't see a simple and safe
> way to do that.  Would you prefer that direction, or is the change in
> migrate_folio_unmap() fine?

That appear too complex.

---
Best Regards,
Huang, Ying
