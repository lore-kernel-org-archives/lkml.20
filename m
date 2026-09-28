Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A66519F40B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790589999; cv=none; b=ef7lh9DYYPdI4G4YJiz9YooLqvFlP9OVJmcnpnYgJiEockqRKMlyedjXwfucJO2xkyChKnHKKJznyLC//HnZ9tNjduA7Nx9XABGczmKOA0X7wIKia1Nh27/zusgO80ph+lNvatwQcU5gANHF/TDo8OCNEjr1nWcuuEFl3l/5YMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790589999; c=relaxed/simple;
	bh=UkrDHIOlRzw0AkKHorPE4M+cke4cHQ7AZn3FJ2HDXWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iUZPLVoOZasuNQyU++uY+oIpcmDpbnxw6JzFEdN7ZlYnKB4GIEghSU8KDIS4nvFyk/dRO0XPE+HiYuIlc0OntdzH8d4tD6xqDWCwmM1X6H6OAqamkOJymawq2ZMHgztUCz20fR+jLJ020DWyOsgYo8lmrjqHE4RQRPOHIuITik4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=T/LZi2sg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=J/jYptmh; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="T/LZi2sg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="J/jYptmh"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8823B14000DE;
	Mon, 28 Sep 2026 06:06:36 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 28 Sep 2026 06:06:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1790589996; x=
	1790676396; bh=kcUsOL3101xiV9NL11+6UCDVa/c8zCTvs2ZvNLpRaUs=; b=T
	/LZi2sg4uuBWkOjTyNhCVObsn/DS+ZLuyww5KBI+VR+LMoYmLG5qVxFC8DPJEMLU
	zCg5ZSDx3XZnBf3o6tAnnlv9XjbZ27plLqBnQQ4Mf9bf/RTnwlOyTlirAwLicNJH
	ePapL++6HhWEQYA6ODwWZ2qunWJXbRbqe9q1h4pnYckOItqJGJRcnEtxUNp1KCwW
	ng3U62MKI0mjf9QOVsQ6ScOnc9E5V2qKhfZUFNmWG4t1FqvXrs3rpeLNEsl3mPdx
	uhLSsX8vzlC6jH19/lOWaiB4CwHgI6a5andWwG1p5iLbKLnwaKa8GqyNjcD8BpWJ
	C8TSvDDX/Y1tNE8OksbEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790589996; x=1790676396; bh=k
	cUsOL3101xiV9NL11+6UCDVa/c8zCTvs2ZvNLpRaUs=; b=J/jYptmhWRqiG/+5q
	n4x+RmHp8dmJolILwLSCJFzPxbbLZHmFZVtponmj5hc8UQTP0VLUkdU9pxIRDLNF
	xQS6u/I+0mw5hl6/sojXitXHjxVRzuv/DZzEHaWj7SxIeze+7dQGpX5Xv5VwLKic
	C/usFjS4+GJXlZwkmwwvjJZM14uYEzJZxcBnl8ZF86OURQ5vtPhXPQ05PilZMhMb
	I/jPBg/iMbNdn3o1dDrD9DpQqYiZRah4p0dIO/a9dTseCpjAr2JO7ARtUgslG52k
	nkIA9oMCp2c6yY14BBU89d8y6nZhiZF+LUGovG5H6hrRHgFe3tKBLaV96AupCDxA
	EvRQQ==
X-ME-Sender: <xms:LDy6avLfqQjp-yK0TWiT6j8SaqKTBPrw8E1x9Zyks8_ardtQEHUk5A>
    <xme:LDy6avGE5OeXHQCNGYG4qlWpol2lQ4D67uknTFgXTo66JeLXVQ_kJBTDNWto9tFHE
    w7HyLqawVtAespFnRNSmdkgY7VqMQMnHF3Roq4N0QqMdMi5dbfYcdkp>
X-ME-Received: <xmr:LDy6at28ylqVdclOEQ5rV8U0eF5QTex3Bt0oWVwx9Uyg5qbdBWDL5lnTxzo>
X-ME-Proxy-Cause: dmFkZTF8+FzWl2kPFFw+2+MUnNndpG3Es29zlM3W8MqBD0QW9993JqL27RjsdWHL5iQTuv
    8LHkef+10EFcRNyu6aMfBJblGtUMhigK1wvWUg5pa/T2F4HZOycwBRl+2S+z7tqw2cJfHU
    gdsF/P6BOMqpKS9LZRm0d8oBtyKEEqCXwj8zji6pXjSixGW9yMDmevXCSXRhMug+RBOuj6
    H/TPGEbj0UBxBpkklI8Q2dk1KPN1FfxQ05T6kAzB+fcPQyWzSSafNh6004OlOqdREfhbRG
    BHI+j7BDMASDclZuapGmxVrXolh8JlQnm8Hn+THchpsYHB/1yAmWKg/yew9Ltzw86nEqaa
    nkU2cSQL8qRENKHB4iLNlXxdqgyOVujeFZPY74aW8lk80wFKRFo5VNSaZ7AT7QmlDWD9LR
    0yipAeB93S3lT7SuNh0By8tlp0OfFp2H8zgTSrQFo0KHX5n2NESmCyvNsDjZk8XaZbHIST
    ZPBWSoO1tX2inUBxZBeekbSe37r41xaOOV2PulMgtKG58RnGeLhAV0T8OH5yiRIoqbrmVd
    rE1verYunpxGQv9dp7hI2EwK8yDFx2fJJ/dWIgZxWZ5d1F2VtlbOGwI8/VX8tKwzmSYfE8
    kXoTXNVhISb8KqFylRnZAVVbp+5Vyeo83tcqBZaBffEQeZold3dtspwRSUrw
X-ME-Proxy: <xmx:LDy6auzQYrJrdyET1-xzeeFunAEG-S3GcTZMqTsqB-KXcARhxMbT-g>
    <xmx:LDy6akivFgq_rF-Vc7qOEEZSnw63Q7QrUHYqFgykkCRvZuoyuPEUZQ>
    <xmx:LDy6alztq1DqoAh5tn1TFl_P6zwpsHZQAmmCyfAe8Golq_2GdqNb6w>
    <xmx:LDy6aqzX47Mg6uhRuYWVCKAF0FOCEOP03LYWqiKdFgAiKqzXOuM8kQ>
    <xmx:LDy6auZLLy71yC652L2PG6mBw9wnLrjjhpSNO7UbUrJzrCQs6GPAUUsB>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Sep 2026 06:06:35 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>
Subject: [PATCH v4 01/13] mm/khugepaged: drop redundant mm_struct pin in madvise_collapse()
Date: Mon, 28 Sep 2026 11:06:15 +0100
Message-ID: <20260928100630.21870-2-kirill@shutemov.name>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260928100630.21870-1-kirill@shutemov.name>
References: <20260928100630.21870-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

madvise_collapse() holds an mmgrab() reference across its work. It is
redundant. Every caller already holds mm_users:

 - madvise(2) works on current->mm, which lives as long as the task is in
   the syscall;
 - process_madvise(2) reaches a remote mm through mm_access(), which takes
   an mm_users reference and holds it until the syscall returns;
 - io_uring passes current->mm;
 - DAMON takes one with get_task_mm() and drops it after the call.

Drop the mmgrab()/mmdrop() pair.

Assisted-by: LLM
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/khugepaged.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index e13d233b9967..75c876acf527 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -3229,7 +3229,6 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
 	cc->is_khugepaged = false;
 	cc->progress = 0;
 
-	mmgrab(mm);
 	lru_add_drain_all();
 
 	for (addr = hstart; addr < hend; addr += HPAGE_PMD_SIZE) {
@@ -3285,7 +3284,6 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
 	}
 out_nolock:
 	mmap_assert_locked(mm);
-	mmdrop(mm);
 	kfree(cc);
 
 	return thps == ((hend - hstart) >> HPAGE_PMD_SHIFT) ? 0
-- 
2.54.0

