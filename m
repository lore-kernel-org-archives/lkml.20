Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792612287;
	b=eJ9wHfI1ZA4891lFaiQ7YxSA94TjUi5lahZimhdQGuti9N6NGRgkoqZZC53HFjNGGl5K
	 3WC/37mLFwVOKdMKXtBrfKgjD5BXjUUpnrc0zoPr6jsfgGwGDTwDYInBLLVhwk6h9Vk1W
	 OYf/V6zN365mII0yDe7MUByIvIav2no12QxuoqSaRYEVB2NddpK/NEmLFPRrOwQURIplU
	 II/D3d5mHDHNctbRIo3GinkDXWNeCL+B2ANCadIlJyxkmQbxvaVYQjqDv0GQDyc5kN9a/
	 3i6gZ9bauK7lWalMMZi4WaFfNYC3ZV9CZ1UG253vwldcFlN90qTb6U3bq2ScVQeTa7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612287;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Subject:To:Cc:From:
	 Date:References:In-Reply-To:Message-Id;
	bh=evT2BynPa0sAUIX/byF2Q7cQ46qJbL+BQbWuivs6WLU=;
	b=kQTMGNqXTGxWLV0gCG++IHJBxLsAS7s2H9WTq8O38xlukqIs13U5JPKVwLEUDuEqrAv2
	 9in5tFkqxR/X87Qk81U0V9ezDiPcwKpm/nWgFl+qowITJrd8m7D1h5JF35C/hb70Nkupo
	 7QH+19lZGZpGDtcTpTXBpl48nbtIHE0BWV8NViiA1pfs00VtBRbHp9vTvYoV6w3a++vBN
	 xCJb7UxljsJFoFdV7/DAci/eMUyxx0/W+7WTeK7LzNaFetJ+q7FYV8J6DRTeDDftun6Fe
	 TEKRnXl9QLygJZuE7uLLzXsPxgAQhp4N1F3nsAUZuGJZHz0iMW1fqct1+MxMwiFEeHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lopgnNJn;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11BD60A2611
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E11BD60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lopgnNJn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792612287; x=1824148287;
  h=subject:to:cc:from:date:references:in-reply-to:
   message-id;
  bh=gZAEl9+A1PQaNJe+OJ6nVKTzoqfSGa6FZQUZvL0UNFw=;
  b=lopgnNJnH9uKm1F9yKSTCKamlJCCjZp9o+jntVXMZOF/F+tRT39nOVGl
   tgVKQWq9ooEp/oL8ZNtTPCnLvTGwcGeyRzwRLGcJPURDSSFetSqJF6CW3
   rQ5DqjX2lZaG+mYEgotMo6ZB7JbXHG/hEob+EBNE57SZlHlx+LT1gjabH
   BvGkWZP+8kklDqakbgGTitGj2zLzokvhd6/aEaYZWm6tl9uwJKfBPErm4
   xss+yZuwjgjVPZ/SYjIvxx1dLobEKY9LTrwpQcVOwmVzFZwR3bMuJQuLJ
   QfkUWj3jf3bbTNRF39INnRg8qHsySnjrstyyCSnMxawHX21RIVCisBUw0
   g==;
X-CSE-ConnectionGUID: edVJwLMkQVKxccO6kbxS2A==
X-CSE-MsgGUID: cXpWN7+zQsK3pE5fKTJ1Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1230067"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1230067"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:51:26 -0700
X-CSE-ConnectionGUID: qGWq7vsRT+Gbx1IXzj2ubw==
X-CSE-MsgGUID: vgTJ4FE5QTCd3lN15oSM+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3092035"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by orviesa007.jf.intel.com with ESMTP; 21 Oct 2026 12:51:26 -0700
Subject: [RFC][PATCH 04/24] kernel/fork: Allow arch-specific stack initialization
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Edgecombe, Rick P <rick.p.edgecombe@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, the arch/x86 maintainers <x86@kernel.org>, Kees Cook <kees@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Wed, 21 Oct 2026 12:51:26 -0700
References: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
In-Reply-To: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
Message-Id: <20261021195126.CE2581EB@davehans-spike.ostc.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list


Right now, the entire thread_union has uniform permissions. Shadow
stacks obviously do not have the same page permissions as the rest
of the stacks. Add a new arch-specific hook so shadow stack page
permissions can be established.

Note: this is slow. It requires TLB invalidation in the arch code,
which is abhorrently stupid. It will be fixed up in due time.

---

 b/include/linux/thread_info.h |    5 +++++
 b/kernel/fork.c               |   14 +++++++++++---
 2 files changed, 16 insertions(+), 3 deletions(-)

diff -puN include/linux/thread_info.h~generic-arch_init_thread_stacks include/linux/thread_info.h
--- a/include/linux/thread_info.h~generic-arch_init_thread_stacks	2026-10-21 12:36:34.114873761 -0700
+++ b/include/linux/thread_info.h	2026-10-21 12:36:34.177873882 -0700
@@ -228,6 +228,11 @@ static inline int arch_within_stack_fram
 static inline void arch_setup_new_exec(void) { }
 #endif
 
+struct thread_stacks;
+#ifndef arch_init_thread_stacks
+static inline void arch_init_thread_stacks(struct thread_stacks *ts) { }
+#endif
+
 void arch_task_cache_init(void); /* for CONFIG_SH */
 void arch_release_task_struct(struct task_struct *tsk);
 int arch_dup_task_struct(struct task_struct *dst,
diff -puN kernel/fork.c~generic-arch_init_thread_stacks kernel/fork.c
--- a/kernel/fork.c~generic-arch_init_thread_stacks	2026-10-21 12:36:34.175873878 -0700
+++ b/kernel/fork.c	2026-10-21 12:36:34.178873884 -0700
@@ -332,9 +332,17 @@ err:
 
 static void *__vmalloc_thread_stack_node(int node)
 {
-	return __vmalloc_node(sizeof(union thread_union), THREAD_ALIGN,
-			      GFP_VMAP_STACK,
-			      node, __builtin_return_address(0));
+	union thread_union *tu;
+
+	tu = __vmalloc_node(sizeof(union thread_union), THREAD_ALIGN,
+			    GFP_VMAP_STACK,
+			    node, __builtin_return_address(0));
+	if (!tu)
+		return NULL;
+
+	arch_init_thread_stacks(&tu->stacks);
+
+	return tu;
 }
 
 static int alloc_thread_stack_node(struct task_struct *tsk, int node)
_
