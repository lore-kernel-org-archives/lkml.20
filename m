Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792612291;
	b=LcP0OwfRkV+vb5k3OpUQkvTB2hiJppNh0D3Gj+78ml+Y/k/a9VeeHbuj1C0ZWGhNr56F
	 NSnT8EmIzWKeAJhzAFSHYJP+blTZsdv+SukumZrs53GktGDKIXtPK0zsquMhakBsnHBOv
	 9eAvwndTDvhut2SGMA5YsJKHdwyuAMLNWugBMOBhTvIndg+CmGUkGXFmy24V0mUrPd2hN
	 EW6sQcgr1NKkXBgekZUaMb2TdQZrRmqbCVqh3wIyDO5/PJcbisUBLTIY45wyzkdTs1BNQ
	 Nsq6vd4iT5ZYi1TSDmUjT4z6HbM1Do+pZX91gMOTl17C9fvBLyiLYg8hwlvw0ubqQYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612291;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Subject:To:Cc:From:
	 Date:References:In-Reply-To:Message-Id;
	bh=AklO3PkVgmQIARKS1NekI3dJsal73mKoE9EQ9nIyLOY=;
	b=AMwIEXod+OJPq+WMfHw4mZjA/ayQNjUmvab2jPH1Ce2AVvmfhKK3M+XYEuH4JU7z1xAV
	 artJCLRSEiYuznyaFmAz4PjBlsnLJSMzWRVFVErZ9INQENDi6ZQ4u0PQQ2XgSsZKfR8XD
	 xt29WKo9KDAx2vIknjXEF90jnUtW+qe6nPzqefCNmdafCau+TMsXAXOV2AXgvwVxzjshb
	 YG6mGb0x4uUQ1HAAO/UHBKe3OftGgzq8KqnFQRS8dtHKB4f2OYDa1X7oEm+5e73t66hjt
	 aBPx7koxq8aofPZMJSUjduWXOHlvd5VYnNWKAoHq0pg48JLd6kgQkSRP/s8PRy7rqhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oBL0yMMa;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C91606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9C91606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oBL0yMMa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792612291; x=1824148291;
  h=subject:to:cc:from:date:references:in-reply-to:
   message-id;
  bh=mJtrL6fQXd1YqBgHLICyeKCDcOepOCEbKwOdD+Ed9WM=;
  b=oBL0yMMaMKU+/nTLuZanzZgKFiiw112cdA+X3GiZA1YY4xHfddKDd8z4
   LYqmq6llH+GParKvIgFSNemE+GcScmwUiL0+4oAv+hRJ7O073xRKs37Xm
   kGVX2FE6g26jUjL1e/A89vmKncvIVmRP5jg6zD49sYr3U1HasXcLjQu4H
   IqxzFhU3N1B3s/MUJco765Z9qjxt8/e+nGNK+1Bil78zCDfl7W7BQnh4B
   7zZKLvLAYnVveKqvbQSeFI8hE/XKSv7heLph1Ic7m1OzZx2wwCMjqyvKy
   SneK1zSElqhAVNSt++FZZhgwEV4MMbJC5lVFxcP1jES8CsFokvMeOli3s
   g==;
X-CSE-ConnectionGUID: r+1JBTsrQNuo/xzyENboxA==
X-CSE-MsgGUID: AH7URpS7TNCTzS6bPgn8Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1230106"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1230106"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:51:30 -0700
X-CSE-ConnectionGUID: UlkjU6mdTSqjgvi75cxwSg==
X-CSE-MsgGUID: klbm1f2fQce0R5cWbvFYdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3092085"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by orviesa007.jf.intel.com with ESMTP; 21 Oct 2026 12:51:30 -0700
Subject: [RFC][PATCH 07/24] kernel/fork: Clear shadow stacks alongside normal stacks
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Edgecombe, Rick P <rick.p.edgecombe@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, the arch/x86 maintainers <x86@kernel.org>, Kees Cook <kees@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Wed, 21 Oct 2026 12:51:30 -0700
References: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
In-Reply-To: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
Message-Id: <20261021195130.E1008E33@davehans-spike.ostc.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list


The old stack clear does not work for shadow stacks work because the
shadow stack page is not writeable via the vmalloc() mapping. It has
shadow stack permissions after all.

Use the 'vm_struct' for the vmap'ing to find the struct page for
the shadow stack and clear it via the direct map alias.

This should all compile back to the old clear_pages() if shadow
stacks are not supported.

This also only supports a single shadow stack page for now. It's
obviously not rocket science to add a loop, but leave it as simple
as possible for now since x86 has a single shadow stack page.

---

 b/kernel/fork.c |   25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff -puN kernel/fork.c~generic-clear-stack-area kernel/fork.c
--- a/kernel/fork.c~generic-clear-stack-area	2026-10-21 12:36:35.657876714 -0700
+++ b/kernel/fork.c	2026-10-21 12:36:35.660876720 -0700
@@ -345,6 +345,28 @@ static void *__vmalloc_thread_stack_node
 	return tu;
 }
 
+static inline void clear_stack_area(struct vm_struct *vm_area)
+{
+	union thread_union *tu = vm_area->addr;
+
+	int nr_stack_pages = sizeof(tu->stacks.stack)        / PAGE_SIZE;
+	int nr_shstk_pages = sizeof(tu->stacks.shadow_stack) / PAGE_SIZE;
+
+	/* Clear stale pointers from reused stack. */
+	clear_pages(&tu->stacks.stack, nr_stack_pages);
+
+	if (!nr_shstk_pages || !arch_kernel_shstk_enabled())
+		return;
+	/*
+	 * Clear the shadow stack page too, but via its direct map
+	 * alias. Note that the shadow stack is right after the
+	 * regular stack, so the nr_stack_pages'th page is the
+	 * first shadow stack page.
+	 */
+	BUILD_BUG_ON(nr_shstk_pages && nr_shstk_pages > 1);
+	clear_highpage(vm_area->pages[nr_stack_pages]);
+}
+
 static int alloc_thread_stack_node(struct task_struct *tsk, int node)
 {
 	struct vm_struct *vm_area;
@@ -363,8 +385,7 @@ static int alloc_thread_stack_node(struc
 
 		stack = kasan_reset_tag(vm_area->addr);
 
-		/* Clear stale pointers from reused stack. */
-		clear_pages(vm_area->addr, vm_area->nr_pages);
+		clear_stack_area(vm_area);
 
 		tsk->stack_vm_area = vm_area;
 		tsk->stack = stack;
_
