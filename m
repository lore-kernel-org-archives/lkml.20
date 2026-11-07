Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794054186;
	b=A1iegJETKiHB6tzNs/RC0OSzJY2HYNHRinI++yld5bAUjqDUt5DdwnO3YJni1SYPV3gE
	 tMkdBJ0UcFd2uDmc5L3BhlsnyMrdAM8d1M6bUk6i/jL0r7whY1IYxzURZwNAv+3YdTQqw
	 zVZQ0TZbViDTilqBCMwbHbS3fVc3u++lJZbmR7H3OOW7n4pSMLfLZzLFffB4NPhw1KStQ
	 p7z7MiveqtFfT8ooFAGepL0g3c6iXsdzeFpVIhy4yqp3b+WHquXSY8v4xaImllSR/6sKF
	 ZGenpoA6IVTwe4f77/a/oVPGiJFjA+dtURVc+ZTmBuajIOpSsxDuYss4wZvlHKIhBnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794054186;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:In-Reply-To:References:Date:Message-ID:User-Agent:
	 MIME-Version:Content-Type;
	bh=TBEFW26Kc/QyTcxgmba5XzRa43zG6gzVhqlbzSDo17M=;
	b=xrUGF573oFE1mn+pivFB/kGwoYy9aTzaFHhnzNPq0oZtVRqgMdZJAz2l5zLsRpg18qyA
	 0D1HvlNCeamp9FZC9p1kUSj2TD+LQliPudj7e4Pg5+9wawAyQ9Vo8Fc8sRD4ui6lIzzCZ
	 bwNmOnnymrrIHgRnjwYiVYRkZU/8SmUKHdII57wInZCTnNq14jWj4os0xc6DxcmvXv77p
	 0wbo9e2FPRywzFw9x749NjLHmmetILf2GEprYbZKo6Mlz6eyEGWQ8NURh36Z+dIw5xcWP
	 9ys+5HKwrNdOrYXNecg8qqgdfPOxsOZ1iPq4557gmg7nEPEiTDkzIjYF6wnISGC62pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=CixpGjrE;
	arc=none smtp.remote-ip=115.124.30.119
Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF591606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 12:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF591606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=CixpGjrE
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794054174; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=TBEFW26Kc/QyTcxgmba5XzRa43zG6gzVhqlbzSDo17M=;
	b=CixpGjrEj/7iaCzDjfkoklDY+Cul9M6ytkOvWcEKf/Y3RKpd7nDkuKXwBrnc/fiWSnUWL69EXQNp1jb2WTeVSSv/JVVGapPBuNbTPWq1W/IPs5JRAceMHoZBXhEAfC/NXMLKZH2tfH0EzplL7gC6KEKfdKYek8+kZ/zNW9qivTI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=ying.huang@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0XEEWiqy_1794054171;
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0XEEWiqy_1794054171 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 07 Nov 2026 20:22:52 +0800
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
In-Reply-To: <20261107190737.1538200-1-qiuzhiteng@hygon.cn> (Zhiteng Qiu's
	message of "Sat, 7 Nov 2026 19:07:37 +0800")
References: <20261106041628.1177963-1-qiuzhiteng@hygon.cn>
	<87zevmwbaj.fsf@DESKTOP-5N7EMDA>
	<179395975709.1235605.1971486611419119070@hygon.cn>
	<20261107015057.1328227-1-qiuzhiteng@hygon.cn>
	<87qzgxw2qx.fsf@DESKTOP-5N7EMDA>
	<20261107190737.1538200-1-qiuzhiteng@hygon.cn>
Date: Sat, 07 Nov 2026 20:22:50 +0800
Message-ID: <87ld74x23p.fsf@DESKTOP-5N7EMDA>
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
>> Have you adjusted the NUMA scanning parameters?
>
> No.  All NUMA balancing tunables are at their defaults
> (scan_delay_ms=1000, scan_period_min_ms=1000,
> scan_period_max_ms=60000, scan_size_mb=256).
>
> The scan is indeed slow: 58 passes of 256 MB in 55 s, 89 ms each,
> about 9% of wall time.  But the hint faults are not spread evenly
> between passes: those 9% carry 33% of all migrations.
>
> The faults come from the scan, just not from the pass that happens
> to be running at that instant.  Of the migrations that happen
> during a pass, 60% are for pages in the 256 MB chunk being scanned
> right now; nearly all the rest are for pages scanned one or two
> chunks earlier (lower addresses, within 512 MB).  None are from
> addresses the scanner has not reached yet.  So the scan makes the
> pages PROT_NONE and the workload touches them again within a second
> or two, while this or the next pass is running.  The collision is
> not a coincidence between two independent events.
>
> Here is the sequence, one pass on the unpatched kernel:
>
>   CPU A (task_numa_work)          CPU B..N (workload threads)
>   ----------------------          ---------------------------
>   tlb_gather_mmu()
>     tlb_flush_pending++
>   change_pte_range(table 1)
>     PTEs -> PROT_NONE
>                                   access page in table 1
>                                   do_numa_page()
>                                    migrate_misplaced_folio()
>                                     try_to_migrate_one()
>                                      PROT_NONE, but pending set:
>                                      pte_accessible() == true
>                                      tlb_flush_batched++
>                                     try_to_unmap_flush()
>                                      full flush, IPI to ~380 CPUs
>   change_pte_range(table 2)
>     flush_tlb_batched_pending()
>       pending != flushed:
>       flush_tlb_mm(), IPI to ~380 CPUs
>     PTEs -> PROT_NONE
>                                   (same for pages in table 2)
>   ... 128 PTE tables, ~0.7 ms each ...
>   tlb_finish_mmu()                    pass took ~89 ms, not ~7 ms
>     tlb_flush_pending--

This looks much more clear!  Thanks!

> Each table flush makes the pass longer, and a longer pass lets more
> faults happen while tlb_flush_pending is set.  With the patch the
> migration takes the direct path: it may still flush while the pass
> is running, but it does not bump tlb_flush_batched, so the scan does
> not pay per table and the pass stays at ~7 ms.
>
>> That appear too complex.
>
> Agreed.  I'll keep the change in migrate_folio_unmap() and put the
> sequence above into the v2 changelog.

Sounds good to me.

---
Best Regards,
Huang, Ying
