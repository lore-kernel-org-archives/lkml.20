Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792612300;
	b=fFk5PutrCYhkUNYjY1yRVu/GYh6KnEwyJXEzImwBATvhlKrG9pI+Lp09XiLUci97dQhR
	 LRTrVbIdybAOtphFHDLvj5TttonHOih9VehHZlq6iWbcQYBVvdpR0JR0zc+Xff4w4Iziw
	 EDnZVR4J0wiZ1T69Kt9ByoCpVieOvK2cUBJQFvE0RbcxCFu+nxEy7qpBGsDL3AeBgBiAM
	 +2VaIX+GephOcma9BCJxy627iKxa0fV4V4yWmTySiEwkVhJyg14yE1WUHnYj9cJn405Oj
	 BOV+WmR/943iz5tv4pUgZg6g06v3oW39SRlAklCpvQEU6Vb9r19aCPtxH/6g6Bvp69w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612300;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Subject:To:Cc:From:
	 Date:References:In-Reply-To:Message-Id;
	bh=8qjvUAlPni93RcARYvlG6IUzeV0GqnOsObMxKiZSdpw=;
	b=PUll3xlOfuxMlIdAdF4VcgJ8xPTraYhB8illk9xTbEi7m0YTa5LWoSnLrebv6W1Z2f0R
	 WVCNcP4+6RJBOfIsjnpOd37B6rwZfiXhMdoxAs5D3OnPRULiUWe0XCcZwYsrgKyG+9in3
	 3Xt8XyzRV0eFvpHusWFZ4X9pW3bbGhObKqPU+2MILyt0r6m4UKlJc5YChZYcmcMxGKDK+
	 gNi/4C8yMM5d8ypqwoNvNdPw9fDfuK2A6uW5S8lNzTmyid2ZY//M4WoAxgWys5SleX6oC
	 TVCmmJTAkihLpWzyBO1XssLBrmNvr6aR1C06dJbioXyldELfOVFYj90qy497Ikpj1MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lqsuk70e;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1459B60A4AC9
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:51:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1459B60A4AC9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lqsuk70e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792612300; x=1824148300;
  h=subject:to:cc:from:date:references:in-reply-to:
   message-id;
  bh=n5Uk+nYByWB6GW/+tnYs21PPu0aB2QrJxUPlQFdGD8w=;
  b=lqsuk70eJuu3lPENAY19rO9niGex3HLz5S7RkwjTKN7I3Xn+3utUzlqQ
   7/unwiUbCtX6l2H5mOO8DAojEwL6UJWOD7kkSbFO8/Ga7dREytWfI+z97
   1BMr4voaPfKGUcy2y2rs7IiTduDsxGzU0DdShMhvMdpmQ/gdSJ+f/f3hk
   16CsCkvJVVETmBZ+IZpCEMuezpuLLBhN8tMOagIhbiYjDWBiC0zCHrmap
   +WS+Ia2RkgVc0ULWnGhwpJionQ7y0TBSYi/4hnPlwQF3BSsH6yHLuR8CK
   /LWNZwUesqOiFezkiQEvDuSq+d6jG/7L5AB2Oq98zW1zyuQsJSFOzqrvQ
   Q==;
X-CSE-ConnectionGUID: vv3wZ4qCTwaQVADhZgvlTA==
X-CSE-MsgGUID: dGAH6nrlR7eOJT/9Xyzj4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1230187"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1230187"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:51:40 -0700
X-CSE-ConnectionGUID: nehxjkp9TIeYF8E/chqk3Q==
X-CSE-MsgGUID: O3Dr80eaTS2f82OKcF3txw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3092168"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by orviesa007.jf.intel.com with ESMTP; 21 Oct 2026 12:51:39 -0700
Subject: [RFC][PATCH 14/24] x86/mm: Establish shadow stack permissions in thread mapping
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Edgecombe, Rick P <rick.p.edgecombe@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, the arch/x86 maintainers <x86@kernel.org>, Kees Cook <kees@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Wed, 21 Oct 2026 12:51:39 -0700
References: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
In-Reply-To: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
Message-Id: <20261021195139.A1ADD044@davehans-spike.ostc.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list


This represents the simplest way to establish a per-task shadow stack
mapping. It is not an efficient way to do it. It costs a TLB flush
each time a stack is allocated which is wicked stupid and slow. But,
it's simple and will function for now. Fix it properly later by doing:

	vm_area = __get_vm_area_node()
	pages = kmalloc(); // the array
	vmap(PAGE_KERNEL) // 16k
	vmap(PAGE_KERNEL_SHSTK) // 4k

That way, there's no TLB flush, and the shadow stack permissions are
set up properly. The shadow stack is allocated in the same way as the
normal stack, and the permissions are set up correctly

== Optimization ==

It might be nice to turn arch_init_thread_stacks() into a static call
to keep the overhead down.

Nit: I don't love the #ifdef in shstk.c, but it's over a tiny area.

---

 b/arch/x86/include/asm/thread_info.h |    7 +++++++
 b/arch/x86/kernel/shstk.c            |   21 +++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff -puN arch/x86/include/asm/thread_info.h~x86-set-shadow-stack-permissions arch/x86/include/asm/thread_info.h
--- a/arch/x86/include/asm/thread_info.h~x86-set-shadow-stack-permissions	2026-10-21 12:36:39.397883874 -0700
+++ b/arch/x86/include/asm/thread_info.h	2026-10-21 12:36:39.409883897 -0700
@@ -226,6 +226,13 @@ static inline int arch_within_stack_fram
 
 extern void arch_setup_new_exec(void);
 #define arch_setup_new_exec arch_setup_new_exec
+
+#ifdef CONFIG_X86_KERN_SHADOW_STACK
+struct thread_stacks;
+extern void arch_init_thread_stacks(struct thread_stacks *ts);
+#define arch_init_thread_stacks arch_init_thread_stacks
+#endif
+
 #endif	/* !__ASSEMBLER__ */
 
 #endif /* _ASM_X86_THREAD_INFO_H */
diff -puN arch/x86/kernel/shstk.c~x86-set-shadow-stack-permissions arch/x86/kernel/shstk.c
--- a/arch/x86/kernel/shstk.c~x86-set-shadow-stack-permissions	2026-10-21 12:36:39.406883891 -0700
+++ b/arch/x86/kernel/shstk.c	2026-10-21 12:36:39.409883897 -0700
@@ -630,3 +630,24 @@ bool shstk_is_enabled(void)
 {
 	return features_enabled(ARCH_SHSTK_SHSTK);
 }
+
+#ifdef CONFIG_X86_KERN_SHADOW_STACK
+static inline int set_shstk_pte(pte_t *ptep, unsigned long addr, void *data)
+{
+	set_pte(ptep, pte_mkwrite_shstk(pte_wrprotect(ptep_get(ptep))));
+	return 0;
+}
+
+void arch_init_thread_stacks(struct thread_stacks *ts)
+{
+	unsigned long shstk_vaddr = (unsigned long)&ts->shadow_stack;
+	unsigned long shstk_size  = sizeof(ts->shadow_stack);
+
+	if (!cpu_feature_enabled(X86_FEATURE_KERN_SHSTK))
+		return;
+
+	apply_to_existing_page_range(&init_mm, shstk_vaddr, shstk_size,
+				     set_shstk_pte, NULL);
+	flush_tlb_kernel_range(shstk_vaddr, shstk_vaddr + shstk_size);
+}
+#endif
_
