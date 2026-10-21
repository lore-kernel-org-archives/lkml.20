Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792612289;
	b=WOdm/206UOK6OzAVTk7Xo1To1TCX4ODKfwYgWODJNCZfAuH/7Wrl8vAPNrzt0hvlr321
	 KTzC3bEqiAPdBCBRg2m8a9DBTK6tAbW7sKpgvgU4+Lo6viEat+YCysxlu9xLip8jF1tdG
	 bqFBPWhfhcVtLAftfL5g9Qwwa/DHO1Ff8/LCCSRBs750DRPUdZmtwslxaKamaEGjLERvI
	 hhGyp3xjae2nFOXcdWY+fzkKeTD79qs5EvBlRnWhP/3mjyY4WmVN5hI0KWClVxcwHUlOd
	 4JdRYH7DmeO0JPehM7blwoKtlU0UZ1JOlrrL/Y0Z3YmlLHjSs5HrZNywV4lR5mVYzlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612289;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Subject:To:Cc:From:
	 Date:References:In-Reply-To:Message-Id;
	bh=wKhi3tfbv2yfyYPN/wPNJqaDBZj225JaHkTKXd9tORc=;
	b=VxR7jXWomkF2OA3oU1NGikeeEJDtTLspqe0Rlqxb3i4scGuU1MDoyZKlkrfn3ojgDBie
	 L+S4QVRCcFjkpX9DhGvYx4zOf77yn/+F7P0HnZANlphifl6Fe7r8R3EvcjoYyW9P+JZM9
	 qa8M/ebyKiRe7bMTeNzQjv9n6wJozMBeZG3NePDWJpV5nmOR7wXpudp6OUkiU3XLHiO+9
	 IcOakFgEBi+yF1eODhhZ4JeGK4EX71PBcgq4Gf/szPcyZ+Vv/FhpJElH8qgGXMEuPRakn
	 3HMQW85lS45tq/LNwXDo5D8TwWlxjVGf6k/fCU202MUffpjWbN3EGlfp7tfdAm/NXSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ped69aOx;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B665606A337
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:51:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B665606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ped69aOx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792612289; x=1824148289;
  h=subject:to:cc:from:date:references:in-reply-to:
   message-id;
  bh=VrqNAo3AYEIbG1AFxWpYLsPu9AdDHSf3X+QbCp6YU3Q=;
  b=Ped69aOxmG4zpJRNyUZhXypF/Noaysjhgc5gwEqSLnETFmfR082k/dQL
   GyfPLHqX0AFJS1J4ce0UVeXU9c5kuUXzw7TK8zLzT49s06x9Mp2/1Qfsz
   moTm2bf+Ov+2b553RNoLwj3Zj+eRNmNnR40wuy2crfpymEcx+tbCdlXoO
   EpsJq71yKEM+9sxv2Eh8+V3RSQFKsDEkjD+9IAXWc0+FMfMWmHgyeLnWQ
   E5NsbCXXr/4LPB2PxjEMRYQ9vsev9d/sCzV58wqhfSzQUPDRqe12KqKlP
   voK3Z2N/eq5ZIijxQwN+BJ56/rSTCKMSQbMO0khJrFFVtOFuEoy++dtfE
   A==;
X-CSE-ConnectionGUID: EragD2lARNm3zmE4BUKzeQ==
X-CSE-MsgGUID: +aCViwR1QZCqqJfkniwM+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1230095"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1230095"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:51:29 -0700
X-CSE-ConnectionGUID: F7QBlrE9Tzix77AFFjDz5A==
X-CSE-MsgGUID: McLVvUZ6QeqmR+XI+kCpmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3092077"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by orviesa007.jf.intel.com with ESMTP; 21 Oct 2026 12:51:29 -0700
Subject: [RFC][PATCH 06/24] kernel/task: Add "runtime" check for shadow stack support
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Edgecombe, Rick P <rick.p.edgecombe@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, the arch/x86 maintainers <x86@kernel.org>, Kees Cook <kees@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Wed, 21 Oct 2026 12:51:29 -0700
References: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
In-Reply-To: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
Message-Id: <20261021195129.567E4A68@davehans-spike.ostc.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list


Add a generic helper to see whether shadow stacks are supported at runtime.
This is needed to switch shadow stack code on and off at runtime. But, it
also serves to help the compiler optimize shadow stack code out as well.

---

 b/include/linux/thread_info.h |    7 +++++++
 1 file changed, 7 insertions(+)

diff -puN include/linux/thread_info.h~generic-arch-shadow-stacks-enabled include/linux/thread_info.h
--- a/include/linux/thread_info.h~generic-arch-shadow-stacks-enabled	2026-10-21 12:36:35.168875778 -0700
+++ b/include/linux/thread_info.h	2026-10-21 12:36:35.170875782 -0700
@@ -233,6 +233,13 @@ struct thread_stacks;
 static inline void arch_init_thread_stacks(struct thread_stacks *ts) { }
 #endif
 
+#ifndef arch_kernel_shstk_enabled
+static inline bool arch_kernel_shstk_enabled(void)
+{
+	return false;
+}
+#endif
+
 void arch_task_cache_init(void); /* for CONFIG_SH */
 void arch_release_task_struct(struct task_struct *tsk);
 int arch_dup_task_struct(struct task_struct *dst,
_
