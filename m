Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792612285;
	b=16gVLGVs0MDUrqkTEf5hNTEWVokDxT8yjJ94eNe1b5O1OasnE2H6URhxJJ6xP4PKLAjH
	 igRvECti5n0uI8rKcc13t90pen0TwZykCVE7SoqxnC4/8chWz71VuyeNQ/5jpoltTYbSy
	 OdOZImrUO0fE9ryIIJAsMECnvaJK/dHJrOPA1HnAwgDxd9RBvVFvnVA1D42j9CmxKihm2
	 DN3jZVANV5+UM9FN1eh4L/uT1F85l0oia2Ewl8PmqX6Uf1uuKPgB8kdvc6N/ZnGUyfiIV
	 Qu9ew+6KYFxQgzpkzI+tTnXUSme8m7fUC4UfPdg0B5NFuWjeWpN+ihbiJVWSxrN6EXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612285;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Subject:To:Cc:From:
	 Date:References:In-Reply-To:Message-Id;
	bh=QM12/xZ3trv78+xOzRS8nfhshsgNF1ewdsA7znSxtpg=;
	b=Myn8RYXNC5bsOv7m5VfeDccWBNPlIRJg9MSv30hFloyO9SD8QLky5ViBrmjIl/FWchl9
	 z5ZfoaXzNy7GDYaS2VCEvxhkZr0tK9J3fm00RuDofySDHKjhDk4wtXTZ1Kh2ceQ+9Y3f/
	 DuAebTGQtKu8EdB2G3IGgIb1DLx6hot45AyYRuCRXGqfCFsOjaU2pCCs5V8LleW6bIT+w
	 vUbCNCr/vbJOxZWHmNQD8dVcwCzsXKI+63nDr8gt9wtNVs/7IVXmlH6zeQz74yb6B20U8
	 9AMSzo8a9eNkLkEZC/Ts53XY5yRN4mToo1r3C2GjSKGIspkw49PrvQid+EKQ8MM/jFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OO2dl2oe;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6311D606A33F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6311D606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OO2dl2oe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792612285; x=1824148285;
  h=subject:to:cc:from:date:references:in-reply-to:
   message-id;
  bh=3plbptAwfnQVMa2J6g4yRayv74bKgdOONuxwQ/0VhNU=;
  b=OO2dl2oe/boKiFTJLpJlpZy+6emfASwNSEJT0aBWkDjaubtklY6Ir2oB
   q/mIEM70oLOM3jDl54Z/dhHsZa+hl9fLySINIXSQQzPeH8FrV7Gq5tYAA
   L+T8szRFhvs0wjw/pQO7huD07jZAm4MKWLZ53WSNR8zoe1AsnPf+NJBTG
   n3IRAnw/RyI5rchfmYe64evP7AkXYrrqKXD9T2PVhLkmSoKtPrID884+X
   dZFETMAjUQb4whlJrxBEuNxl0LOAKR6RTngL+qWN+p7eT5Nnmwv3Glvrh
   cWBn+jUFjkIeu5Fba9mXppD9KXSWoD5ZZ9X/LPy5s6XMPcFVBZO4twaDy
   g==;
X-CSE-ConnectionGUID: wcIigGsMR9WRxPVt2elzTQ==
X-CSE-MsgGUID: o0m7+VUqQUGy7LP/FAblxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1341793"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1341793"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:51:25 -0700
X-CSE-ConnectionGUID: kk0IGSWJQhSOuUdClbsqMw==
X-CSE-MsgGUID: xJvgaO9BQ5uvKSRvGHFldw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3248203"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by fmviesa003.fm.intel.com with ESMTP; 21 Oct 2026 12:51:24 -0700
Subject: [RFC][PATCH 03/24] kernel/sched: Move thread stack to its own structure
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Edgecombe, Rick P <rick.p.edgecombe@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, the arch/x86 maintainers <x86@kernel.org>, Kees Cook <kees@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Wed, 21 Oct 2026 12:51:24 -0700
References: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
In-Reply-To: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
Message-Id: <20261021195124.F173447A@davehans-spike.ostc.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list


Right now, the thread stack is directly declared in 'thread_union'.
There is shortly going to be more than one stack. Give all the stacks
their own structure instead of declaring *a* stack directly.

---

 b/include/linux/sched.h |    6 +++++-
 b/mm/kasan/report.c     |    6 +++---
 2 files changed, 8 insertions(+), 4 deletions(-)

diff -puN include/linux/sched.h~alloc_thread_stack_node-3 include/linux/sched.h
--- a/include/linux/sched.h~alloc_thread_stack_node-3	2026-10-21 12:36:33.575872729 -0700
+++ b/include/linux/sched.h	2026-10-21 12:36:33.613872802 -0700
@@ -1986,12 +1986,16 @@ extern void ia64_set_curr_task(int cpu,
 
 void yield(void);
 
+struct thread_stacks {
+	unsigned long stack[THREAD_SIZE/sizeof(long)];
+};
+
 union thread_union {
 	struct task_struct task;
 #ifndef CONFIG_THREAD_INFO_IN_TASK
 	struct thread_info thread_info;
 #endif
-	unsigned long stack[THREAD_SIZE/sizeof(long)];
+	struct thread_stacks stacks;
 };
 
 #ifndef CONFIG_THREAD_INFO_IN_TASK
diff -puN mm/kasan/report.c~alloc_thread_stack_node-3 mm/kasan/report.c
--- a/mm/kasan/report.c~alloc_thread_stack_node-3	2026-10-21 12:36:33.610872797 -0700
+++ b/mm/kasan/report.c	2026-10-21 12:36:33.613872802 -0700
@@ -365,9 +365,9 @@ static inline bool kernel_or_module_addr
 
 static inline bool init_task_stack_addr(const void *addr)
 {
-	return addr >= (void *)&init_thread_union.stack &&
-		(addr <= (void *)&init_thread_union.stack +
-			sizeof(init_thread_union.stack));
+	return addr >= (void *)&init_thread_union.stacks.stack &&
+		(addr <= (void *)&init_thread_union.stacks.stack +
+			sizeof(init_thread_union.stacks.stack));
 }
 
 static void print_address_description(void *addr, u8 tag,
_
