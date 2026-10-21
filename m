Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792612307;
	b=qGta8Y6ZdO/QKvL55t7qTeH0fj0xzhvF7+8IAmyLDb1uRku2SB7/b6KoLVjx/hASEpYn
	 d7iIhrooUKL0it/FyDd5nYJpTv6fvjrWnjsojoqYgQj+eUjKLt3l0sRJmmClz5v0OUsj3
	 RK8eRRn7tQk8XZdAhk5UttzoUymbuVQ7H45h1NOijQlMUVzPDl3zyTyxKLTmQWZgLhiiV
	 RH1zZxN75LKDXecJRFWmKgzK7SB/uCCuBsOOjtJ4XipyrEoO83YAYy6nylOWnVtBmwWnK
	 oGz438EBOfW6FjxsjI5UGKFr7+He5Mq7YjXLxHsBhLixdhWviHYWffEkNHDSWv3BLhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612307;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Subject:To:Cc:From:
	 Date:References:In-Reply-To:Message-Id;
	bh=8EYCEbTNikoR6q4pK8E0f8PDojb5NB048AuSw3FMlzQ=;
	b=arLeBYT3nG9zuJtW3bmFlwvSiQMnUle9uMZ6ikR1OZ30t5UZ6SVXxpAvSW5rN+2/9YUp
	 i4VuY4ueAa9bcQyrVPk4sALeQZk1ChKtjpX+kKTRZ/oil5F3PtTcDd5oNJ3xwAsJBVXVy
	 rX5DSlu4DbAFGwW6uOQKiczsCSKA79qImtN6erqIhFoe6Kr+HdnW2bKn3OQAXPC0Ex/0n
	 u+P9YOwSv1tHtuGfdo8PbVUeuLMP/XPOc60H7habfWNBl/BLYEQSqfqeSibiBgIom3c2X
	 4ScrQu3ax512QMfCD1lZfhGTz/P9H7WpDYiuMYaIA2YiiI2ZEq1VNGZ4mRBZqIgMXDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HIT8GpAQ;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C163D60A3808
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C163D60A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HIT8GpAQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792612307; x=1824148307;
  h=subject:to:cc:from:date:references:in-reply-to:
   message-id;
  bh=KnTbtszAL6+LsTzXEhciCqoa8/o+eZku6h6JWuHY4wo=;
  b=HIT8GpAQn3O7daUVMoIW/P6AtrqyyoVmyKrr0mtR7VY2Hs4Ea1wfjOOe
   GZUwATNqr5Dc947GNDskzr3G6m9KFnhLYdztoWAFBq+VD0IESABXrUcPz
   SbCr2Qiis0Zxu530JOKB0LUvuxY3kxZtreIihrxSK7iSsuOgrMVk8c4tl
   cPolulqDG8BeQQQf0LZhVi7E8cZKlfLTT1smMgclIWIFV7ba+dYTZSmGn
   AprYwWy4/AI8LoY8Y/xPaY1CWwhADtZX9wEoMrQgoYhCdl+8tjTKDWEJB
   nCf28egIZ9wVbxH/FD0rIPI3i0iD/9TLk1TyeRNmK83GuT2WA0OtH+HLK
   Q==;
X-CSE-ConnectionGUID: OSEOUHKoRIekrLV2MF2otg==
X-CSE-MsgGUID: BFe08IPlSGWzvsstrl2ndA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1230234"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1230234"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:51:47 -0700
X-CSE-ConnectionGUID: 4KWQFNjRTPayjSFNBBIcoQ==
X-CSE-MsgGUID: QMA4hsUxTI+5ZLvNMtGGAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3092231"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by orviesa007.jf.intel.com with ESMTP; 21 Oct 2026 12:51:46 -0700
Subject: [RFC][PATCH 19/24] x86/process: Initialize cloned task shadow stack
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Edgecombe, Rick P <rick.p.edgecombe@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, the arch/x86 maintainers <x86@kernel.org>, Kees Cook <kees@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Wed, 21 Oct 2026 12:51:46 -0700
References: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
In-Reply-To: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
Message-Id: <20261021195146.EAB62E7B@davehans-spike.ostc.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list


A child task can obviously not share its shadow stack with its parent.
It needs its own shadow stack.

First, ensure that the child's ->kshstk_ssp is pointed to its own
shadow stack. Second, write a pointer to the shadow stack itself that
corresponds to the RSP value consumed in ret_from_fork_asm.

Note that this implementation uses the direct map alias of the new
task's shadow stack. It would probably be best to use WRSS. But
shadow stacks may not be enabled on the current CPU before the
context switch making WRSS unavailable.

An implementation that universally enabled shadow stacks and made
the ISA available at the first context switch could use WRSS. This
is something else that will be simpler if the init task gets a working
shadow stack.

TODO: I don't like the #ifdef in the .c file, but there needs to
be an #ifdef somewhere for 'kshstk_ssp' since it is not defined when
shadow stacks are disabled.

---

 b/arch/x86/kernel/process.c |   35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff -puN arch/x86/kernel/process.c~enable-task-kssp arch/x86/kernel/process.c
--- a/arch/x86/kernel/process.c~enable-task-kssp	2026-10-21 12:36:42.071888995 -0700
+++ b/arch/x86/kernel/process.c	2026-10-21 12:36:42.074889001 -0700
@@ -167,6 +167,40 @@ __visible void ret_from_fork(struct task
 	syscall_exit_to_user_mode(regs);
 }
 
+/*
+ * The goal here is to build a shadow stack for the new thread. It
+ * just needs to survive the first RET from ret_from_fork_asm().
+ */
+static void prep_kernel_shadow_stack(struct task_struct *tsk)
+{
+#ifdef CONFIG_X86_KERN_SHADOW_STACK
+	unsigned long *ss_top_slot;
+	u8 *shstk_base_writable;
+	u8 *shstk_base_vmap;
+	u8 *ss_top;
+
+	if (!cpu_feature_enabled(X86_FEATURE_KERN_SHSTK))
+		return;
+
+	/* Start with the shadow stack permission mapping: */
+	shstk_base_vmap = &task_thread_union(tsk)->stacks.shadow_stack[0];
+
+	/* Walk the page tables and find the direct map alias of the sshstk */
+	shstk_base_writable = page_address(vmalloc_to_page(shstk_base_vmap));
+
+	/* Point at the end of the shadow stack: */
+	ss_top = shstk_base_writable + TASK_SHADOW_STACK_SIZE;
+	/* Back up one ulong from the end to write the first return pointer: */
+	ss_top_slot = (unsigned long *)ss_top - 1;
+
+	/* Write the return address for the first RET: */
+	*ss_top_slot = (unsigned long)ret_from_fork_asm;
+
+	// Needs helper?
+	tsk->thread.kshstk_ssp = shstk_base_vmap + TASK_SHADOW_STACK_SIZE - sizeof(unsigned long);
+#endif
+}
+
 int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 {
 	u64 clone_flags = args->flags;
@@ -185,6 +219,7 @@ int copy_thread(struct task_struct *p, c
 	frame->bp = encode_frame_pointer(childregs);
 	frame->ret_addr = (unsigned long) ret_from_fork_asm;
 	p->thread.sp = (unsigned long) fork_frame;
+	prep_kernel_shadow_stack(p);
 	p->thread.io_bitmap = NULL;
 	clear_tsk_thread_flag(p, TIF_IO_BITMAP);
 	p->thread.iopl_warn = 0;
_
