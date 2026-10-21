Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792612311;
	b=u+aroxsCj+qB9Hx3H0XZxcf2/XA9xZIAJqOi9F0QlpB+AC9Aou/oqZ+wQmANpGs57sEs
	 uRNfL2OIJWRp0v89rll2SklE1ydrpGuXd+DUtAshtZaRyMwuhJdveXy23RbGtKtBg1zXi
	 zom8FApTftt2t6o/cKTxfcesymXp8SX9Am5im/R4vXCM7/P/XZXYsYyaF7S6i/GVR6GKA
	 yg6plju+6py8gDyCLB8Gxo4fHSrgQvzD2SaSCWapBT+IxhW6d0mltPxZdD+U4iQcC4SGa
	 IrSuDSyc7t3el3uzKZQ3X51GzUmG0N2tv0RQrvxfwwjiUE/F2WZEMHD4WGQoSEF/aeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612311;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Subject:To:Cc:From:
	 Date:References:In-Reply-To:Message-Id;
	bh=5WBBP/iZs3woCQ/nq+lE8LYlnLJYMcU7D8jTRBV/i5M=;
	b=ix71Al6+o/UMhrO80flYRwOaA8JMlrlYde0qzQTT0FIwbaywcVQO4ZM0dgC7aF8+FwMS
	 Knaw/aCS+uC/xHFxYFfUZREM21lbaKvScyxrViG3Cf8cU5p7R9wC1VhMeB91WWS021U6Z
	 JIaeeQzpyMyUxroU6nT7XPN7b4PWFUA9pJmTWL9o8prHBIsR3PNHx0tenHFllg/E6W9yj
	 DG/pC4b7nzuP1bt7sf/4HkKm4lAQ/qa5835FFucAtHntTVR1/LgrKfyr9e0NJvDQw85mj
	 dTSvQp9wbUdxz4WKARtXaSdea+vf6UmL5oEQOSGu+VichcxyG1ewn6DPvi8y1fdSxTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=adyRkLJd;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCB060A6F50
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:51:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACCB060A6F50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=adyRkLJd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792612311; x=1824148311;
  h=subject:to:cc:from:date:references:in-reply-to:
   message-id;
  bh=A4Lt6b5pe0YQbmoY1HugP3jYATkwLLZGvb/8rWhF8+Q=;
  b=adyRkLJdk/5NnweKf8LrcHBwTL6KKCFj7HjUqXNj6ZXG3GbNhtOq3Rv8
   bd7n3b9+urNQxAG3I4GcKJrApBci6/hpmadwrDsy1eVQbjCVZtp/6N9NI
   zC5mamDUyYLU1zNekM8zdUL/Q7akBeIrIxwiZo/M/dYCrOFMIqYZQ7wdg
   wDWxsZo1r2BHSTYS3pEQLailH6iNkksFDrvf07OhDIMHjvTqfW4e4Uhad
   ONf3HlA4jxD5SudtDT4o2KssAx8cj5wOJ9dSxbDxz5wgnr3xHQhaotUOj
   jUVWdooj49mIWs8jrP3aWtSXUfDdPVyiLwoFEo+Tkp7I1vdMlJ6ZpnuRP
   w==;
X-CSE-ConnectionGUID: FdFA7GQTSqqAxBaq8m6hYQ==
X-CSE-MsgGUID: s3fIpHneTX+f58muGCoJpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1230269"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1230269"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:51:51 -0700
X-CSE-ConnectionGUID: ETKL0tToS12o35i6QO6jfQ==
X-CSE-MsgGUID: YKq80LAgRrqeMEi2DgJdWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3092251"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by orviesa007.jf.intel.com with ESMTP; 21 Oct 2026 12:51:50 -0700
Subject: [RFC][PATCH 22/24] kernel/task: Add a helper to locate the top of the shadow stack
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Edgecombe, Rick P <rick.p.edgecombe@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, the arch/x86 maintainers <x86@kernel.org>, Kees Cook <kees@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Wed, 21 Oct 2026 12:51:50 -0700
References: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
In-Reply-To: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
Message-Id: <20261021195150.2AE17115@davehans-spike.ostc.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list


Just like the normal RSP stack, the shadow stack starts at the top of the
stack and grows down. Add a helper to calculate the top (exclusive)
address of the shadow stack.

Note that this is generic code without #ifdefs. The shadow_stack member
is present and 0 bytes long on configs without shadow stacks.

---

 b/include/linux/sched/task_stack.h |   23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff -puN include/linux/sched/task_stack.h~generic-shstk-top-helper include/linux/sched/task_stack.h
--- a/include/linux/sched/task_stack.h~generic-shstk-top-helper	2026-10-21 12:36:43.603891930 -0700
+++ b/include/linux/sched/task_stack.h	2026-10-21 12:36:43.606891936 -0700
@@ -23,11 +23,6 @@ static __always_inline void *task_stack_
 	return task->stack;
 }
 
-static inline union thread_union *task_thread_union(struct task_struct *tsk)
-{
-        return (union thread_union *)task_stack_page(tsk);
-}
-
 #define setup_thread_stack(new,old)	do { } while(0)
 
 static __always_inline unsigned long *end_of_stack(const struct task_struct *task)
@@ -119,4 +114,22 @@ static inline int kstack_end(void *addr)
 	return !(((unsigned long)addr+sizeof(void*)-1) & (THREAD_SIZE-sizeof(void*)));
 }
 
+static inline union thread_union *task_thread_union(struct task_struct *tsk)
+{
+        return (union thread_union *)task_stack_page(tsk);
+}
+
+/*
+ * Return the address of the top of the shadow stack for a task.
+ *
+ * Note that this is the address just above the last shadow stack
+ * slot. It is an invalid address and needs to be decremented by
+ * something before actual use.
+ */
+static inline void *task_shstk_top(struct task_struct *tsk)
+{
+        return task_thread_union(tsk)->stacks.shadow_stack +
+                sizeof(task_thread_union(tsk)->stacks.shadow_stack);
+}
+
 #endif /* _LINUX_SCHED_TASK_STACK_H */
_
