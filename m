Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792612295;
	b=yMNaKAXS+kvYuURLW0CxsOyAPApyogzjFOlxbX09oOtVqJ2NjWg1KNkf1dNysKhcD30i
	 /WnzdgWa6BZ3p2dOzhx/fuTujVOwSKUJGb8RYQ7VpWss9DE0+VcbIeno26Xn3Dm+sC44Z
	 Nq6Fzp15ply6iSTk0kNXsZyoNaHZVAtVVpavy0lMOc4X6RCgRPzdiV+7Y/hPkTMKVrgSv
	 jgo0EiDNDQDANXAMT16MNcUA+FgQUQNVoZ3sFrh8Eu2+yZA+Z70z8iAWQfjodLIpZwSfW
	 wbJ9o1Ii+t/AgReiiN/TLwZUMhZ5GJs70mR3Ze6cLrXmKm0zhDgPRvZtHphVhKiWmjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612295;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Subject:To:Cc:From:
	 Date:References:In-Reply-To:Message-Id;
	bh=mfmvaveZlBoKgLS30ezXZZGeQH0TxNRpPiJSZLSvmf4=;
	b=C0azevlObLKT47uoS+P15bfF0baZ7rY+nZcyFz5VZleFtjDJh6tPdqlSQNdrP4NX+a1z
	 a13HBiKv8+A6Mot43lb2mi0dDrgZL9BOrh27l2PAi8WKQYu7d0Ro8PxpV9d2x2wulZgyf
	 XYubf+2MPbhE4oeDCwIeWVvolIDDk//S7drnfbDDUvu2Wjsre07PNa1Dy5SyysScKUyED
	 2NTqX+2LImLOJ25IZMKkA3stUxoUrG27WIwat3nFLodRC4RuMbQd6cIsK6WmFFjBOj0/o
	 NAWdM3QfzCdG7srV3JeFra8QbdCoez1LTpZpw7aCIA41Ie0bhiaMFUT2f463gFPusKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kqaNuTB9;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4603606A325
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:51:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4603606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kqaNuTB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792612295; x=1824148295;
  h=subject:to:cc:from:date:references:in-reply-to:
   message-id;
  bh=LM/bZq6e5kgXIIsMlImGGAISRxrHYfkNxc21v39AtzU=;
  b=kqaNuTB9OOLgyuH+QQh3hpb8OU7VYJp7WWik6QiIbWUbnChc13UVEbJM
   Zj2SZOgmzHk29yDpFarcnyVwo1KPnLMHf95AwBI2Jjf2THqNXSKWWz0PY
   AQsKVp1mBf4js4BEqiDZUw/tAQKjxSGRmuJ4Sd/GlNlJW0O3oLUFLcTUI
   XNbiNyFJBLylHDtV5LNIyGlFzUpzu95EN3zIOVFkZ397Sn8rVQzxO70qi
   hRyfQkvthH5yPYdKzNeA+ko4cvRH2LXGHz6xY1bYqeP3klFcWsTCtjkkG
   xLtC1AX+ojG+6HV9DTMMToq/9707/DTr+LUZ0zKnWGonpqlmldWtHUCdG
   Q==;
X-CSE-ConnectionGUID: mV4VCd9RT8Wa2SiD3546JA==
X-CSE-MsgGUID: WR4JKUb1SqODVXCKOfAWgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1230137"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1230137"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:51:34 -0700
X-CSE-ConnectionGUID: ihe+1rkMS0G76BXUjBYWfg==
X-CSE-MsgGUID: T61SqgJrRUe1AC/4qQFNcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3092111"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by orviesa007.jf.intel.com with ESMTP; 21 Oct 2026 12:51:34 -0700
Subject: [RFC][PATCH 10/24] x86/cea: Refactor stack mapping macros
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Edgecombe, Rick P <rick.p.edgecombe@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, the arch/x86 maintainers <x86@kernel.org>, Kees Cook <kees@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Wed, 21 Oct 2026 12:51:34 -0700
References: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
In-Reply-To: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
Message-Id: <20261021195134.D056014B@davehans-spike.ostc.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list


Continuing the trend, the stack mapping macros can currently
only work with the "_stack" structure member. Make them more
flexible by taking a partial structure member name.

Also make the mapping permission explicit. This will allow
shadow stack permission mappings in the near future.

This does make following the macro maze a bit harder. But,
in the end, it's quite readable to have code that looks like
this:

	cea_map_stack(MCE, stack, PAGE_KERNEL);
vs.
	cea_map_stack(MCE, shadow_stack, PAGE_KERNEL_SHSTK);


---

 b/arch/x86/mm/cpu_entry_area.c |   20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff -puN arch/x86/mm/cpu_entry_area.c~cea-estacks-shadows-refactor-0 arch/x86/mm/cpu_entry_area.c
--- a/arch/x86/mm/cpu_entry_area.c~cea-estacks-shadows-refactor-0	2026-10-21 12:36:37.273879808 -0700
+++ b/arch/x86/mm/cpu_entry_area.c	2026-10-21 12:36:37.275879812 -0700
@@ -130,10 +130,10 @@ static void __init percpu_setup_debug_st
 
 #ifdef CONFIG_X86_64
 
-#define cea_map_stack(name) do {					\
-	npages = sizeof(estacks->name## _stack) / PAGE_SIZE;		\
-	cea_map_percpu_pages(cea->estacks.name## _stack,		\
-			estacks->name## _stack, npages, PAGE_KERNEL);	\
+#define cea_map_stack(name, member, perm) do {				\
+	npages = sizeof(estacks->name## _ ##member) / PAGE_SIZE;	\
+	cea_map_percpu_pages(cea->estacks.name## _ ##member,		\
+			estacks->name## _ ##member, npages, perm);	\
 	} while (0)
 
 static void __init percpu_setup_exception_stacks(unsigned int cpu)
@@ -151,15 +151,15 @@ static void __init percpu_setup_exceptio
 	 * by guard pages so each stack must be mapped separately. DB2 is
 	 * not mapped; it just exists to catch triple nesting of #DB.
 	 */
-	cea_map_stack(DF);
-	cea_map_stack(NMI);
-	cea_map_stack(DB);
-	cea_map_stack(MCE);
+	cea_map_stack(DF,  stack, PAGE_KERNEL);
+	cea_map_stack(NMI, stack, PAGE_KERNEL);
+	cea_map_stack(DB,  stack, PAGE_KERNEL);
+	cea_map_stack(MCE, stack, PAGE_KERNEL);
 
 	if (IS_ENABLED(CONFIG_AMD_MEM_ENCRYPT)) {
 		if (cc_platform_has(CC_ATTR_GUEST_STATE_ENCRYPT)) {
-			cea_map_stack(VC);
-			cea_map_stack(VC2);
+			cea_map_stack(VC,  stack, PAGE_KERNEL);
+			cea_map_stack(VC2, stack, PAGE_KERNEL);
 		}
 	}
 }
_
