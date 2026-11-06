Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.204.27.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987486;
	b=JHimMceHF3pc7FXznfJuhXMlDg8cHWP7Zu7AJDBB4a07+oZKEAdUSd1SHiIK+sCkwuT1
	 egYVY2SEC4TagZxMoHJT0yjuiZltNFEPEBAZRHSD6XnnAtgC5nmP+6H/KZchxsn0d5lCg
	 uJyFhmF4MC573pamXyqCnvqSyX12I9Muoq7jwcmCXa2+n0+OfCDnokiv1EVbQDejczNvj
	 oGzYfHVHM2G3Rq2Tyo7Pi0+mXF8BCIMPPxjFvd9xbL9swx/uOYR21pvYC+z/XAJK5v0f5
	 nHp9N6dee409Ric61sJeLHdN0TDmA4cBpIV2A/3qMKLjlz/UXjsx4z2F5UhGBVJEqzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987486;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=50CDwGjVnVq7EP7e9pA48xeTzp4afcqVVW+xvnsa4Qc=;
	b=SeFkubz9JO+DB9t/iwwfcErrCK6Q6x3L+COD/0y+VT+akU+q2TiaMkatfJLVKlm8iLtL
	 D8mfRaQV2+4L4zhReH+65vVHd8MhM1wKP8TocBe0qRssAj1O8gZX/ls19KS6/wRo5xtKK
	 DwaolbJFO5P9DJHRwV4Y47HIDk8ci/MIFpP8KkQ8wIqlgStvpG58xVsV59q/MAf8eZ24C
	 rKH8QSuxKi7U3lX7HAuI1rl1Kk7aqhL4AWsZmkXAscJYEM3LGbyADFEKHaiH/LOeVYZEm
	 bm/+c8E1SbSPV/hLdNs/aUNCYH5/uop/TcyYPH9j1uqzJaM9rXmHQRoeZIhYieL7tPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hygon.cn;
	spf=pass smtp.mailfrom=hygon.cn;
	arc=none smtp.remote-ip=101.204.27.37
Received: from spam01.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82577606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:51:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82577606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp2.hygon.cn (unknown [127.0.0.1])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jLmv12V7Hz6ySgX;
	Sat,  7 Nov 2026 01:51:09 +0800 (CST)
Received: from maildlp2.hygon.cn (unknown [172.23.18.61])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jLmtz1NLXz6ySgX;
	Sat,  7 Nov 2026 01:51:07 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp2.hygon.cn (Postfix) with ESMTPS id 737F5308158A;
	Sat,  7 Nov 2026 01:50:27 +0800 (CST)
Received: from ws.local (172.25.64.90) by cncheex04.Hygon.cn (172.23.18.114)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Sat, 7 Nov
 2026 01:51:06 +0800
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
Date: Sat, 7 Nov 2026 01:50:57 +0800
Message-ID: <20261107015057.1328227-1-qiuzhiteng@hygon.cn>
In-Reply-To: <179395975709.1235605.1971486611419119070@hygon.cn>
References: <20261106041628.1177963-1-qiuzhiteng@hygon.cn>
 <87zevmwbaj.fsf@DESKTOP-5N7EMDA>
 <179395975709.1235605.1971486611419119070@hygon.cn>
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
X-ClientProxiedBy: cncheex06.Hygon.cn (172.23.18.116) To cncheex04.Hygon.cn
 (172.23.18.114)

Hi Ying,

I instrumented the unmap path on both kernels (kprobes, 55 s windows,
same workload).

b99a342d4f11 does what it should.  On the patched kernel, where the
old PTE can be read from ptep_clear_flush(), about 96% of the PTEs are
still PROT_NONE when try_to_migrate_one() clears them.  The flushes
come from pte_accessible() treating a PROT_NONE PTE as accessible while
mm->tlb_flush_pending is raised.  On the unpatched kernel that is the
case for about 42% of the migrations (3.5% with the patch), and each of
those does a full arch_tlbbatch_flush() to about 380 CPUs.

tlb_flush_pending is raised that often because of a loop.  Each batched
unmap bumps mm->tlb_flush_batched, and only flush_tlb_batched_pending()
marks it flushed.  So while migrations keep coming, change_pte_range()
in the NUMA scanner does a flush_tlb_mm() for every PTE table it walks:
about 11,600 full flushes in the window, one per 512 pages scanned,
and 99.9% of them come from that call stack.  The average mmu_gather
in task_numa_work() takes 91 ms on the unpatched kernel and 6.7 ms with
the patch.  A longer scan catches more migrations with
tlb_flush_pending set, and more migrations make the scan pay again.
With the patch, a lone order-0 folio is unmapped with
ptep_clear_flush() and never touches tlb_flush_batched, so the loop
does not start.  The remaining ~13 interrupts per page with the patch
are the same effect at a much smaller scale: the 3.5% of migrations
that still overlap a scan.

So the patch helps by not leaving a pending batch behind, not by making
a single flush cheaper.  I'll rewrite the changelog to say that in v2.

The loop could also be broken on the flush side, by letting
try_to_unmap_flush() mark the batch as flushed.  But tlb_flush_batched
is per mm while the batch is per task, so I don't see a simple and safe
way to do that.  Would you prefer that direction, or is the change in
migrate_folio_unmap() fine?

Thanks,
Zhiteng

