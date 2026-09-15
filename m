Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830173D525F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789445210; cv=none; b=oT04KLlY8GZvnmNsYa2qZOJdwwEsypz9KvXyKBztxyXNp+mhemfFy1g/cW6OT/u3auZeJt5KRMstwIbTfmRJ3SYNZ/7fw4RaOqxc30+qX3hTaNJZobo6xWwmSv/RDxPpEOTNCVWV2euINxF9knyn6RO6ZG68PwHrnMfDSU2eYIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789445210; c=relaxed/simple;
	bh=DPtwqi63UScmhwwFYSCiyPsCCYsVN7zTQzg743QeiuU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=rOlpf0FXWZKKCooiB4qSpWHCSz3L7XZiKPzsKPCeRwsckKXkuEE9Pls1sQC6Q8mrDRbMQ1b2W4pWZKUK4SrbxXEQDt1OWTuQtzK4P5xhr6uDLoMM3lH8gd/CI7krUVhhek5lGXUNRsznHlBZusInN8FlHQFC2yKeWKmKMbXJkQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=QWLul0Sw; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="QWLul0Sw"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260915040643epoutp037dfced5742f06c08727993c63199d581~VYu6VzcXO1067710677epoutp03E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:06:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260915040643epoutp037dfced5742f06c08727993c63199d581~VYu6VzcXO1067710677epoutp03E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789445203;
	bh=4e4fp+ABg7CpgFECkOr6P1TEYwIlfxgaqexNJWMeVGA=;
	h=From:To:Cc:Subject:Date:References:From;
	b=QWLul0SwDd0rP9iM99tygcF/s03oGwQWBLkCpS/MmbgtgdMrMSwocuNWLNxgU881U
	 KgwrZFv7WYtLRSpVo2ctEOLJXE5O0jbjdmAY9ypM4UTKBmliwqzQDuFgGoVracppF1
	 heVy2EGCEd2+KYHUcOMPrRdX6+6R2GCTTwm8B/KU=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260915040643epcas5p12db0b5491f5788115fa1dc0a56f752fe~VYu5rfNmI0033400334epcas5p18;
	Tue, 15 Sep 2026 04:06:43 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.41.39]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4hkT3l0SCdz3hhTD; Tue, 15 Sep
	2026 04:06:43 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260915040642epcas5p16bb7640ba867beca189668e2565cdeb4~VYu5LIy6Z0494004940epcas5p1X;
	Tue, 15 Sep 2026 04:06:42 +0000 (GMT)
Received: from localhost.localdomain (unknown [107.97.243.203]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260915040640epsmtip2c612ce5fc9e568179a8936ea06caa389~VYu3R6adx2835328353epsmtip2u;
	Tue, 15 Sep 2026 04:06:40 +0000 (GMT)
From: Maninder Singh <maninder1.s@samsung.com>
To: linux@armlinux.org.uk, linusw@kernel.org, mark.rutland@arm.com,
	kmehltretter@gmail.com, vbabka@suse.cz, elver@google.com,
	akpm@linux-foundation.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	r.thapliyal@samsung.com, Maninder Singh <maninder1.s@samsung.com>, Hariom
	Panthi <hariom1.p@samsung.com>
Subject: [PATCH 1/1] ARM: entry: add __irq_svc to irqentry section
Date: Tue, 15 Sep 2026 09:36:22 +0530
Message-Id: <20260915040622.1346592-1-maninder1.s@samsung.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260915040642epcas5p16bb7640ba867beca189668e2565cdeb4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20260915040642epcas5p16bb7640ba867beca189668e2565cdeb4
References: <CGME20260915040642epcas5p16bb7640ba867beca189668e2565cdeb4@epcas5p1.samsung.com>

Stackdepot usage is growing exponentially because current irq filter
is not removing trace after __irq_svc frame, so adding __irq_svc in
irqentry text section.

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

