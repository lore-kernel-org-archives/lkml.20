Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5554343B483
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789381953; cv=none; b=KWiU6B7rJFh7zssqYqtO1y/BOVBlMVaKbzfahMzS+8/znbsbE09RDMB3a4YMNi1R1qa4yrj2oS/MAz9W0V+FAEZJjHQNisMh/nRL4xzDOIP4ComzkTRu8tUp+/Xd2/fdHul2d87mUxywe2fthZH5XvT0Anu5EEdB8Nps8O5eSmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789381953; c=relaxed/simple;
	bh=CsTSGMNgezd6W2ks2ALNoKIyNvOTGnytW6kkNu5t9UM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=ajh7bXr80qxXpJMfwW6SlWW7YCJoa8x+UU3D9sNXlYwCHFHXibIqAVSCWL7QRnjnVTSQd7xeBBbmp8xgp1KHM5YR8Qf3/G1lMJqzejBGreueDXMTQd0wZoGNkSVCfk0PlOz+vQpaUyV/PT/hY5+7rwr3CMiWGG6/OR6Am/CiZ+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=gImcwN2R; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="gImcwN2R"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260914103227epoutp04bb44b5e9edea630af514d69b532f9a97~VKWabHtZ71848918489epoutp049
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:32:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260914103227epoutp04bb44b5e9edea630af514d69b532f9a97~VKWabHtZ71848918489epoutp049
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789381947;
	bh=fFIqqR/F8PLfP6zNW4dYen4tufE7iY8MDrNDtEkHrwk=;
	h=From:To:Cc:Subject:Date:References:From;
	b=gImcwN2R5O5//YS9t5i5vmWtGOVk2Z73etnSPGlDpgM9Q/Hysb2Rh/sn65wHUKRvf
	 GEVySsml8uSccSX7oKZLWAiRHaMmHqA37rtEWRX2C830P90y2qzc9YmN4FyaZSPDST
	 H6rMZYQijUFJYtnZbBAHPucaUmnod89KxWkdaDaI=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260914103226epcas5p45d0c0f46d91b53f2342c1416ee2f5327~VKWZcKRDl2792027920epcas5p4R;
	Mon, 14 Sep 2026 10:32:26 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.41.40]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4hk1gG3mC0z2SSKX; Mon, 14 Sep
	2026 10:32:26 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20260914103226epcas5p4832171ae7e2b5e19ab4eaaf66a6e6768~VKWZRtwQq2809428094epcas5p4W;
	Mon, 14 Sep 2026 10:32:26 +0000 (GMT)
Received: from localhost.localdomain (unknown [107.97.243.203]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260914103224epsmtip21fa592912a341e6f0d4deed21f89eaa5~VKWXYQSPF2465124651epsmtip2a;
	Mon, 14 Sep 2026 10:32:24 +0000 (GMT)
From: Maninder Singh <maninder1.s@samsung.com>
To: linux@armlinux.org.uk, linusw@kernel.org, mark.rutland@arm.com,
	kmehltretter@gmail.com, vbabka@suse.cz, elver@google.com,
	akpm@linux-foundation.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	r.thapliyal@samsung.com, Maninder Singh <maninder1.s@samsung.com>, Hariom
	Panthi <hariom1.p@samsung.com>
Subject: [PATCH 1/1] lib/stackdepot: add __irq_svc to irq text section to
 filter it from traces
Date: Mon, 14 Sep 2026 16:02:18 +0530
Message-Id: <20260914103218.1125401-1-maninder1.s@samsung.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260914103226epcas5p4832171ae7e2b5e19ab4eaaf66a6e6768
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20260914103226epcas5p4832171ae7e2b5e19ab4eaaf66a6e6768
References: <CGME20260914103226epcas5p4832171ae7e2b5e19ab4eaaf66a6e6768@epcas5p4.samsung.com>

Stackdepot usage is growing exponentially because current irq filter
is not removing trace after __irq_svc frame, so adding __irq_svc in
irq text section.

     stacktrace 1                        stacktrace 2

  kmem_cache_free+0x148/0x398        kmem_cache_free+0x148/0x398
  mt_free_rcu+0x20/0x24              mt_free_rcu+0x20/0x24
  rcu_core+0x338/0x9fc               rcu_core+0x338/0x9fc
  rcu_core_si+0x18/0x1c              rcu_core_si+0x18/0x1c
  handle_softirqs+0x194/0x47c        handle_softirqs+0x194/0x47c
  irq_exit+0xb0/0xdc                 irq_exit+0xb0/0xdc
  generic_handle_arch_irq+0x48/0x4c  generic_handle_arch_irq+0x48/0x4c
  call_with_stack+0x1c/0x20          call_with_stack+0x1c/0x20
  __irq_svc+0x128/0x154              __irq_svc+0x128/0x154
  _raw_spin_unlock_irq+0x30/0x64     stack_trace_consume_entry+0x58/0x74
  __vma_link_file+0x4c/0x70          arch_stack_walk+0x88/0x120
  vma_link_file+0x40/0x4c            stack_trace_save+0x48/0x54
  __mmap_region+0x660/0x99c          save_stack+0x5c/0x14c
  mmap_region+0x6c/0x108             __set_page_owner+0x38/0x254
  do_mmap+0x3c4/0x4d8                get_page_from_freelist+0x1714/0x1938
  vm_mmap_pgoff+0xd0/0x16c           __alloc_pages_noprof+0x120/0x1204

Co-developed-by: Hariom Panthi <hariom1.p@samsung.com> 
Signed-off-by: Hariom Panthi <hariom1.p@samsung.com>
Signed-off-by: Maninder Singh <maninder1.s@samsung.com>
---
 arch/arm/kernel/entry-armv.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
index 2d2ea3ca880c..38696256d997 100644
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@ -223,6 +223,7 @@ __dabt_svc:
 ENDPROC(__dabt_svc)
 
 	.align	5
+.pushsection   .irqentry.text, "ax"
 __irq_svc:
 	svc_entry
 	irq_handler from_user=0
@@ -239,6 +240,7 @@ __irq_svc:
 	svc_exit r5, irq = 1			@ return from exception
  UNWIND(.fnend		)
 ENDPROC(__irq_svc)
+.popsection
 
 	.ltorg
 
-- 
2.34.1

