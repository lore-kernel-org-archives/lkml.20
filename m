Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.204.27.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794049730;
	b=Pb7Y2OSY8y+q2ZnQW5dzFQGo3+n2132Jvd7xoqo/HH9Tv1iDsh/rb339/l70RpYHWSLA
	 SvFafp9Z21UNpbBAQ1oxDEBow41CagAXhh2WSqH/cqZGnKpYJmkAc5uRjxO/lo3y4Lecu
	 lVBxvLV7jY6lKPABSqLAL81bDostYhLEm6kfHFCa/0WqXK3xFgSbF1kttHKdZAzEelvHy
	 R7JL0ju9v2nMRWAqCuD4/VZhGAESlKdt1TLpunYvmpf5p2q9P72l/sgbJGHsFeZcuLJ+/
	 ufNb70Za+Ki4snYZVeBF+oFrLGoI4aSNcIZzdq8LQZqE0hjYiidnBMr0bnSNlVFrYfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794049730;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=i6dE4Qc2basO/b0AjLfl4KhmoQ0CUlCYVpAq8NuxGkU=;
	b=Wv9zeCvxGB1OOAxYmfxKNeRajYVi06wWYINExXtFmX5z6sxeP5cLGQz3STJDUAA9YoZ7
	 7slNqCKUVUFnBwSaky8Die+rXFwoHrjUZUYNZBtVK/S1OpD1WQ0nA0jm1OpedfPByu/Pf
	 bJw5OXFsULgIIQig38yy18yUKNOM1jv2bSE9h8gRNNA2p+1Wsc5CCH7GWHdVM7qpvi5gO
	 o8hCkGaAhZaGHkbs7tMh8wzcDrEmrY3eOMyJYy9K7Wku0AU876o6kVJViyF9tuTvP57Wi
	 2SbNwvenDLnG6xW8SVSHrnwepDj4/N5kuKWHmvJQj1E6MV30AxjvSJ2MXYZkLvYbbLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hygon.cn;
	spf=pass smtp.mailfrom=hygon.cn;
	arc=none smtp.remote-ip=101.204.27.37
Received: from spam01.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CB7C606A330
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 11:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CB7C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp2.hygon.cn (unknown [127.0.0.1])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jMCvs55zMz22Pn0;
	Sat,  7 Nov 2026 19:08:25 +0800 (CST)
Received: from maildlp2.hygon.cn (unknown [172.23.18.61])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jMCvq3lVSz22Pn0;
	Sat,  7 Nov 2026 19:08:23 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp2.hygon.cn (Postfix) with ESMTPS id 7517030A6439;
	Sat,  7 Nov 2026 19:07:43 +0800 (CST)
Received: from ws.local (172.25.64.90) by cncheex04.Hygon.cn (172.23.18.114)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Sat, 7 Nov
 2026 19:08:24 +0800
From: Zhiteng Qiu <qiuzhiteng@hygon.cn>
To: Ying Huang <ying.huang@linux.alibaba.com>
CC: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand
	<david@kernel.org>, Zi Yan <ziy@nvidia.com>, Matthew Brost
	<matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul
 Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Alistair Popple
	<apopple@nvidia.com>, Xin Hao <xhao@linux.alibaba.com>, Dave Hansen
	<dave.hansen@linux.intel.com>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mm/migrate: don't batch the TLB flush when there is
 nothing to batch
Date: Sat, 7 Nov 2026 19:07:37 +0800
Message-ID: <20261107190737.1538200-1-qiuzhiteng@hygon.cn>
In-Reply-To: <87qzgxw2qx.fsf@DESKTOP-5N7EMDA>
References: <20261106041628.1177963-1-qiuzhiteng@hygon.cn>
 <87zevmwbaj.fsf@DESKTOP-5N7EMDA>
 <179395975709.1235605.1971486611419119070@hygon.cn>
 <20261107015057.1328227-1-qiuzhiteng@hygon.cn>
 <87qzgxw2qx.fsf@DESKTOP-5N7EMDA>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ClientProxiedBy: cncheex05.Hygon.cn (172.23.18.115) To cncheex04.Hygon.cn
 (172.23.18.114)

Hi Ying,

> Have you adjusted the NUMA scanning parameters?

No.  All NUMA balancing tunables are at their defaults
(scan_delay_ms=1000, scan_period_min_ms=1000,
scan_period_max_ms=60000, scan_size_mb=256).

The scan is indeed slow: 58 passes of 256 MB in 55 s, 89 ms each,
about 9% of wall time.  But the hint faults are not spread evenly
between passes: those 9% carry 33% of all migrations.

The faults come from the scan, just not from the pass that happens
to be running at that instant.  Of the migrations that happen
during a pass, 60% are for pages in the 256 MB chunk being scanned
right now; nearly all the rest are for pages scanned one or two
chunks earlier (lower addresses, within 512 MB).  None are from
addresses the scanner has not reached yet.  So the scan makes the
pages PROT_NONE and the workload touches them again within a second
or two, while this or the next pass is running.  The collision is
not a coincidence between two independent events.

Here is the sequence, one pass on the unpatched kernel:

  CPU A (task_numa_work)          CPU B..N (workload threads)
  ----------------------          ---------------------------
  tlb_gather_mmu()
    tlb_flush_pending++
  change_pte_range(table 1)
    PTEs -> PROT_NONE
                                  access page in table 1
                                  do_numa_page()
                                   migrate_misplaced_folio()
                                    try_to_migrate_one()
                                     PROT_NONE, but pending set:
                                     pte_accessible() == true
                                     tlb_flush_batched++
                                    try_to_unmap_flush()
                                     full flush, IPI to ~380 CPUs
  change_pte_range(table 2)
    flush_tlb_batched_pending()
      pending != flushed:
      flush_tlb_mm(), IPI to ~380 CPUs
    PTEs -> PROT_NONE
                                  (same for pages in table 2)
  ... 128 PTE tables, ~0.7 ms each ...
  tlb_finish_mmu()                    pass took ~89 ms, not ~7 ms
    tlb_flush_pending--

Each table flush makes the pass longer, and a longer pass lets more
faults happen while tlb_flush_pending is set.  With the patch the
migration takes the direct path: it may still flush while the pass
is running, but it does not bump tlb_flush_batched, so the scan does
not pay per table and the pass stays at ~7 ms.

> That appear too complex.

Agreed.  I'll keep the change in migrate_folio_unmap() and put the
sequence above into the v2 changelog.

Thanks,
Zhiteng

