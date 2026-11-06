Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957852;
	b=F4R2P6UJ7Om3KRAWnGIUX2HHKLIguMVR9e2VZGsb/WEQxXL5/XqI6JPH4Y7gIMpscGzH
	 0bFT7KswAw806qcknJ2EyjBjMfQDwVgykhhGVQ8w1S+ffxnbdjDYnQR7/wtbIZZImL92M
	 iKyjpKMUvZDe4cqIKKPUQt4WsNwqa9UAYaPMNmmYxcRE7uLkRc1Q5QZ6aQym36GKi2ji7
	 HKBI+h1YBx1NWv/34rZjacrTdi4BZ7hI4kflY2DedywpF9WYlEIRS4qlPS/Af0pPdJW/1
	 bKlQSWdbHjhRBV/UO8I6ikcXCkhUQDE6uHtitaEpCEQ2owihhQGLR+kCMfJHQzRiy2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957852;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=PLYAAogcGzOh2NI4d9WLpdaFRZuIFqV2eJZI8IGdoW8=;
	b=ldKCDmhWD7rPn6Bg/XxQdzPtg3TGSgsBE5UWI/IxRL0OEydvVKgoRMF2DEiomgSKqmGG
	 IhVU5oB/pF5Ellau10cV1nwB5M8jhU3caGSgYn/+F6vkSt2elpunpQkXkfGRKMAqhIEoE
	 kYV3VJcDJLHp2pNwCVmZdezLQHT6qEJ1EcLuuhO4bTUxFFoB8rfaLhM/1HdwqwUnuW7V7
	 Is9hqnjkaMo00avWrqk9Y7PmUQ7No+6gQmfWOfIAa5YpAVWT3Fqm4ix9x+ywL3+d10hM0
	 ZSbqj6GF5DgslUeuRtxYnRuoPs73IPCN94Zti0RnT2BBaqH1/TIGZ62424GGEPQ2fRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=HtL2ecgc;
	arc=none smtp.remote-ip=115.124.30.118
Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB6A606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DB6A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=HtL2ecgc
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793957848; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=PLYAAogcGzOh2NI4d9WLpdaFRZuIFqV2eJZI8IGdoW8=;
	b=HtL2ecgcTnvEijk8zU7wMRRlyi62sjWhQm6E3lfd7iX3QTorNWuTA6axquQ72D7ZixVnYBVAnkiFXavk55JWpLo9Ek6ziao3vStSVg82j5CkVrLZhVowk4G9N0VJIToP3gbtG8iV+mfFia9UFyMr6+eHOnf+WUuELgSB6VxXE6g=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R881e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=ying.huang@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0XEBH0Tu_1793957845;
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0XEBH0Tu_1793957845 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 17:37:27 +0800
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
In-Reply-To: <20261106041628.1177963-1-qiuzhiteng@hygon.cn> (Zhiteng Qiu's
	message of "Fri, 6 Nov 2026 12:16:28 +0800")
References: <20261106041628.1177963-1-qiuzhiteng@hygon.cn>
User-Agent: Gnus/5.13 (Gnus v5.13)
Date: Fri, 06 Nov 2026 17:37:24 +0800
Message-ID: <87zevmwbaj.fsf@DESKTOP-5N7EMDA>
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

> Since commit 7e12beb8ca2a ("migrate_pages: batch flushing TLB"), every
> MIGRATE_ASYNC migration unmaps with TTU_BATCH_FLUSH.  That includes NUMA
> balancing and memory-tiering promotion, which migrate one folio per call
> through migrate_misplaced_folio().  For an order-0 folio with a single
> mapping the batch holds one PTE and there is nothing to merge, but the
> flush still changes: on x86, arch_tlbbatch_flush() sends a full TLB
> flush to every CPU in mm_cpumask() instead of invalidating that one page.
>
> On a 2-socket, 384-CPU x86 server without INVLPGB, a 4 KiB-page,
> memory-heavy multithreaded workload takes about 200 TLB shootdown
> interrupts per page migrated by NUMA balancing (v5.15 on the same machine
> takes about 11), and balancing costs it 13-16% of its throughput.
>
> Skip the batched flush only when the batch cannot merge anything: the
> folio is the only one in this migrate_pages_batch() call, it is not a
> large folio, and it is mapped only once.  The rmap walk then meets at
> most one PTE, and ptep_clear_flush() invalidates just that page.
> Everything else keeps the batched flush, including PTE-mapped large
> folios, folios mapped more than once, and the batch of sub-folios
> produced when a partially mapped large folio is split during migration.
>
> PMD-mapped THPs already invalidate their mappings through
> set_pmd_migration_entry(), independently of TTU_BATCH_FLUSH, so their
> flush behaviour is unchanged.  On arm64 the batched path only defers the
> final DSB, so a one-PTE batch should cost about the same either way.
>
> migrate_folio_unmap() cannot see how many folios its caller is
> migrating, so migrate_pages_batch() passes that down.
>
> Measured on v7.3: 120 GiB anonymous working set, 384 threads, 180 s per
> run, three A/B pairs (numa_balancing on vs. off, same boot) per kernel.
>
>                                     v7.3            patched
>   throughput loss from balancing   13.0-16.5%      0.5-6.3%
>   kernel cycles per hinting PTE    1.18-1.22M      0.28-0.31M
>   TLB interrupts / migrated page   202-210         12.7-13.6

IIRC, after commit b99a342d4f11 ("NUMA balancing: reduce TLB flush via
delaying mapping on hint page fault"), we can avoid most TLB flushing
caused by do_numa_page().  Could you check why it does not work?

> Signed-off-by: Zhiteng Qiu <qiuzhiteng@hygon.cn>

[snip]

---
Best Regards,
Huang, Ying
