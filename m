Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792612299;
	b=2+InYzuOjJLLG36adL5+IuD0+Ni+I3uSKB3+z/0Y1q1aWZ4k+89aXY9b/BGgfnoUkau3
	 jd+21vIGqDA4B6A9ZS58+lYKgDnn1cLQLObrJBFjCtOhdwlh3gfOYR746TFAG6T1hGIZm
	 yldaSUq07lpVVtR8VPNBUQ4tgF1C2ItZuHDWNJ4Cl1bd7YRPTlSI2RklLVTlMayb2O7ah
	 hPdp6Y9fMNEFH6WVR9x7IEQpG8jXjzKHHjiXAjQmrmL+Y43RAWfzatvKWKcxEVW5Bc/Bc
	 zrHv+NhmHTUZtAJ6xvVW6oohsd+R1kCzMzCQEWwZ769ohUsTQ7vQwkQ4Ltk6eTBHTsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612299;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Subject:To:Cc:From:
	 Date:References:In-Reply-To:Message-Id;
	bh=A+Bt8wo6K3YjUpc2d/J45rYKksEEpSk/3MD1EBMQDvE=;
	b=daQv1UqlF/Uxt9X1WXdKZVyIZtYt2265m1W46JK52jmxSjcyEabK1v9CfTjbiVpeggHe
	 ISqb55r4J04uOqNWAfCH9lcfXqk+Q2XuprQQ3FpmTvl8EKe+S40VFSejOE3fcWqCO3cF9
	 aDkyR/hWOyiDHonZpreqjyW8hprkmBVUFZ45xFDY4cJKivMZ2yvWnSp1k70B8AlbCEZMk
	 nmGRRzRkzQRYGwhIU6OtK/+W8ssy1Q+RZJgMnbPPcWbpFMMRFqLfm/hY8mDR7nGL2CejK
	 aIO1//0n4O7moZ5UY3ZFZ1VJbnYPwXUDAUtZ0lmSBRn88hLYqM1XdeU1srDZPXkISCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kSDxDRb9;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AFD60A3837
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:51:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1AFD60A3837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kSDxDRb9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792612299; x=1824148299;
  h=subject:to:cc:from:date:references:in-reply-to:
   message-id;
  bh=+qcw7SEeiybCi6bcctztYlnfCYF4mYnL8Sjw1M0V3M0=;
  b=kSDxDRb9lc/T+lwAoO10MpZG+ludtDBN89QDDzJwACKI5MtONtJzhOge
   SC12yipBslCplhw28LsuRlppN6IEYNGW8tZ3YrLeHjTsaYkY9Qn0hHjYw
   bwV5WkVaSkwxvonr7mct8/z8aLFJV3YAqje2vn+jATj6cEdjuHgXwYCQy
   4MEWzw31Ni118X2plB/uJZOOaH5yoLaHe9rsWNB8W6zq4R5zWvzt02d2+
   wP0DelOhmbHsVlVNpO6JTwNLLj+KsQanwHHQa+nkLSD76G0L5emd0hp2I
   3WsXFS4woBjuSI643NJxv4xdXLsAsBDKSkc3oelcG+EDt85g/3Kn/72n7
   A==;
X-CSE-ConnectionGUID: UEAYUDxjQlqCSm08o+Clow==
X-CSE-MsgGUID: 8HIRx2rPSL2iiUgVSGvcMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1230164"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1230164"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:51:38 -0700
X-CSE-ConnectionGUID: lB7QQG0dSu+/iSBhoE5HvA==
X-CSE-MsgGUID: 2mf+oQFURla19Tl2zpp1hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3092132"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by orviesa007.jf.intel.com with ESMTP; 21 Oct 2026 12:51:38 -0700
Subject: [RFC][PATCH 13/24] x86/task: Grow thread_union for shadow stacks
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Edgecombe, Rick P <rick.p.edgecombe@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, the arch/x86 maintainers <x86@kernel.org>, Kees Cook <kees@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Wed, 21 Oct 2026 12:51:38 -0700
References: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
In-Reply-To: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
Message-Id: <20261021195138.72096CA4@davehans-spike.ostc.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list


Define the size of an x86 shadow stack: one page. This will inflate the
virtual size and physical backing of thread_union, wasting one page
per task on non-shadow-stack configurations.

This waste can be cleaned up with the "double vmap()" approach discussed
earlier. For now, please ignore the gluttonous use of DRAM.

---

 b/arch/x86/include/asm/page_64_types.h |    9 +++++++++
 1 file changed, 9 insertions(+)

diff -puN arch/x86/include/asm/page_64_types.h~x86-define-shadow-stack-size arch/x86/include/asm/page_64_types.h
--- a/arch/x86/include/asm/page_64_types.h~x86-define-shadow-stack-size	2026-10-21 12:36:38.870882865 -0700
+++ b/arch/x86/include/asm/page_64_types.h	2026-10-21 12:36:38.872882869 -0700
@@ -15,6 +15,15 @@
 #define THREAD_SIZE_ORDER	(2 + KASAN_STACK_ORDER)
 #define THREAD_SIZE  (PAGE_SIZE << THREAD_SIZE_ORDER)
 
+/*
+ * Grow 'thread_union' to make space for the shadow stack
+ * page. For now, this wastes a page of space per task on
+ * systems that do not support shadow stacks.
+ */
+#ifdef CONFIG_X86_KERN_SHADOW_STACK
+#define TASK_SHADOW_STACK_SIZE PAGE_SIZE
+#endif
+
 #define EXCEPTION_STACK_ORDER (1 + KASAN_STACK_ORDER)
 #define EXCEPTION_STKSZ (PAGE_SIZE << EXCEPTION_STACK_ORDER)
 
_
