Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792612288;
	b=svrhzOunrCu8WbURW4cK7TLXekhwxbpEtQxSKYscHfDsBPXj/cbEBU3OFnbBPyLpzpkd
	 BWLJzFBeXXzPFb9PL6FPUNzfyjkiZdqaIy0dSKN7oWFvdE5IVNv7mPM/O3velVWTloWpx
	 EsAfdhctXdRzJFQ7ymFVLSrEiIfzJHfu7EOli/0fn8/EO7x9Ub7WElEhRulthtHEEYnuN
	 41HGtMObnFLw0UPemO59mCGI7V3RWFO1b8/HAJJkvJqrClmgUSqSaMJq0KBmaLkX9z8xx
	 D8Sj8mFY+9chOFKs2keKMR8cJ+uOUdZ2hlR718XzfYxswnGzmaM6ybvSRCngTcpSgMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612288;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Subject:To:Cc:From:
	 Date:References:In-Reply-To:Message-Id;
	bh=8FJO66eP98KkHLvstq6Y19E+G+af7852sZNa+iMr/o4=;
	b=kWMduKfFFFR3uVYtD2WCx9tOH7xLNgmLtyJHuImpZY2auvUNLH6D0v5H4SiM9kCR1q0l
	 nYU0MtrkXDHd/ExloosEINJETdhIrkffwjwNIMgHD0gOCnE270IZWmP0Qjh/xhwzsVSH5
	 oHmBV/QLowThJHILpY80/yC40lZ9I8gImUpU3ujc5Ex2zcWnFYCh2/G6SKFFZ1ky4PMB9
	 QFdif6AGkd9kZcufWqE7F5Ho7xJmUeSHN1XvgsU7AKtyzAeY5sDBQEJ8Mq8DWEfUDvxFM
	 hc/EruKU1JPlfgJUy4+Cbp7Qls+CigFTgVDoceV/fBUVKWDgV1jSAnVWG5GRcKqslbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YWXQ8COg;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0401160A261A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0401160A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YWXQ8COg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792612288; x=1824148288;
  h=subject:to:cc:from:date:references:in-reply-to:
   message-id;
  bh=6jCu7sTpmGWXAbLbBGcvKOh4CxynpTUZ6+FnBUjlu5g=;
  b=YWXQ8COgfo2RDYhY5Bcm4s9Ue9kNO+YA+Jh2weZwIAzmDztlxMuDWRNe
   aocjB9J6wzd4U9JHlMMssSdfGOk4CcWmLT3PLzfe6s014PzhcIg9vIlvG
   mYa9s6oS6Q0BAUAxCNyoDmnCA9yxN8V+rzBcl1MFvrNbCWqRVLXqw7Pcf
   pGQvTF3ZZo2ns9W2y6KE7JBf+cTrrm8pNYT+12VVSL0opWWLy4Pn073Vs
   OsqMjLJX3AlzMr/52BRYux4l0i5ecdyWfbBrVW/cStXtR0u8TowXzX9Gj
   VYqmTXzWkmSKcnMLkWE6kveroCV3Dr6XW5dAobkphK8gqrHjIsFXmTB7J
   A==;
X-CSE-ConnectionGUID: E6XC1ewrQb6aT/gokuAKNw==
X-CSE-MsgGUID: jsq3TpcQRwu/W8NKmtMFug==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1230073"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1230073"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:51:28 -0700
X-CSE-ConnectionGUID: tcyzD9W5RpOuTvowIGt38g==
X-CSE-MsgGUID: BfFFY1CqRN6M60RAni3gZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3092042"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by orviesa007.jf.intel.com with ESMTP; 21 Oct 2026 12:51:27 -0700
Subject: [RFC][PATCH 05/24] kernel/task: Add shadow stack to thread structure
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Edgecombe, Rick P <rick.p.edgecombe@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, the arch/x86 maintainers <x86@kernel.org>, Kees Cook <kees@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Wed, 21 Oct 2026 12:51:27 -0700
References: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
In-Reply-To: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
Message-Id: <20261021195127.4EF5819A@davehans-spike.ostc.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list


Add a shadow stack member to the stack structure. It is zero-sized
for now. Adding it permits new code to reference it, though.

---

 b/include/linux/sched.h |    4 ++++
 1 file changed, 4 insertions(+)

diff -puN include/linux/sched.h~add-shadow_stack-to-thread_stacks include/linux/sched.h
--- a/include/linux/sched.h~add-shadow_stack-to-thread_stacks	2026-10-21 12:36:34.689874862 -0700
+++ b/include/linux/sched.h	2026-10-21 12:36:34.691874865 -0700
@@ -1986,8 +1986,12 @@ extern void ia64_set_curr_task(int cpu,
 
 void yield(void);
 
+#ifndef TASK_SHADOW_STACK_SIZE
+#define TASK_SHADOW_STACK_SIZE	0
+#endif
 struct thread_stacks {
 	unsigned long stack[THREAD_SIZE/sizeof(long)];
+	u8 shadow_stack[TASK_SHADOW_STACK_SIZE];
 };
 
 union thread_union {
_
