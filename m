Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792612294;
	b=d7LQyGWEHJolY+z7kT70k/reByljcZWoviOb4g/ryXUHIcnHteUibGB9yd1GY33o6vQq
	 e4u/yvejoz4AvAX8F04PZ387vRJKeV4FZWHnsnK8JV0NWCac2eo4RuHE3eJ+oUQZ+Avud
	 y87lgQCzn3FDenG1iuajq3385WgWU8ly/M4zwOBjHznz74hErthCudqK9uGQCbXAx/Pp4
	 TcQAlKIao8MWlbD7e9VRruqn0W56Rg+jFBkk31FPaQa9i1NiCnMQcrdGbli3/1ObZ5ZDo
	 EkcFnKoEaqy9CIAhwxrdicf+iIJMWoR3qXmpdNVSYS6+Q07Y6DSYeCpGUZKwQofyKLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612294;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Subject:To:Cc:From:
	 Date:References:In-Reply-To:Message-Id;
	bh=cTv/RWROaNNg2fohf47K3TazZJCywREs8rfpR6AinDQ=;
	b=SlfGjmB/cN4J/6HNGpmihUa+OuDkKiOQgUgMEU4VxJ/kN4C/YpM4D2rX47nKJFjyUdW3
	 yp54BxJAEgG/bmzgCJD9364lp9v6xdfLQbvCzmx02i5kUDYnE4gKmpGYyWr9+PDtoTxie
	 AsRQx5grcNUZOvRqXePt0pDYFC9QL+ZhS1z5i7t/XZ/qyP8ef1CmP26JLbEqk+PbK8BAN
	 7avanZOdTbOJO8se4tOZd0btve+zDRIxjCzkhVukfTdinALbX4KIy+KuwSQJbrs8cHdLh
	 6tmRkmNx6o4PvR9PJNGnI2lWPlgKv40SAwSbAvzBGNuiEzTcqu0uIl+ITWSWyUQroCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U0Ggly17;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9082060A3810
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9082060A3810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U0Ggly17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792612294; x=1824148294;
  h=subject:to:cc:from:date:references:in-reply-to:
   message-id;
  bh=8OlnrPlLJ01Ej0tP4vpflUK4uYnqBNijTR2S1qlf9Yw=;
  b=U0Ggly17armuNLes9qSLeo9ADhnfZU5LAwaTJfcI34ki11mogDsP0Weo
   dQhetYiROwsse3Z/iv/1AJgLK1xemSZ+xXKkywqIgERUDGOzmiBo1eRWw
   74oOT0wB39ALvrcToC1B26KirKZ6ecxDjb94oUMvm5QIy4FD1uxEsEVz1
   s1FtEg0c5yM0xh8G8jVlAgZkyu+FNerytq5dwsyFwtHgBrM0tKmyPxy8s
   LIhZw1XJbqcOoQOwg74qM2e9WCjcyBA3y1CloUfdJq6ut0vbqjEagUSRP
   /aEATFEQSCNIaW8vZPRCy9fGxHlbXbm4TMn9eK1wNwNtGhCubaYgEEBH6
   g==;
X-CSE-ConnectionGUID: EjTEbOkoSEKhmxvKcYghVg==
X-CSE-MsgGUID: 4I4YUAqgQmOMCBSd3ft8Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1230125"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1230125"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:51:33 -0700
X-CSE-ConnectionGUID: rjRYqOVkRxiDrwx5e/Z6QQ==
X-CSE-MsgGUID: KsHEvS7aRdeSpHoGrVbrCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3092102"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by orviesa007.jf.intel.com with ESMTP; 21 Oct 2026 12:51:33 -0700
Subject: [RFC][PATCH 09/24] x86/cea: Refactor "CEA" macros to deal with multiple stacks
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Edgecombe, Rick P <rick.p.edgecombe@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, the arch/x86 maintainers <x86@kernel.org>, Kees Cook <kees@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Wed, 21 Oct 2026 12:51:32 -0700
References: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
In-Reply-To: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
Message-Id: <20261021195132.EF14B7C8@davehans-spike.ostc.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list


There are a series of CPU Entry Area (CEA) helper macros to make
it easier to deal with the CEA structure geometry. Right now,
many of them can deal only with the regular stack.

Prepare for shadow stacks by refactoring the macros to take a
(partial) structure member name. For now, that is just "stack".

This is a pure refactoring. No behavioral changes intended.

Nits: CEA_ESTACK_PAGES gets a whitespace change to make it
consistent with the new width of the four related macros above
it. There's also some slight rewrapping of the macros in a place
or two to make them more readable.

---

 b/arch/x86/include/asm/cpu_entry_area.h |   23 ++++++++++++-----------
 b/arch/x86/kernel/dumpstack_64.c        |    9 +++++----
 2 files changed, 17 insertions(+), 15 deletions(-)

diff -puN arch/x86/include/asm/cpu_entry_area.h~cea-estacks-shadows arch/x86/include/asm/cpu_entry_area.h
--- a/arch/x86/include/asm/cpu_entry_area.h~cea-estacks-shadows	2026-10-21 12:36:36.741878790 -0700
+++ b/arch/x86/include/asm/cpu_entry_area.h	2026-10-21 12:36:36.746878799 -0700
@@ -55,19 +55,20 @@ enum exception_stack_ordering {
 	N_EXCEPTION_STACKS
 };
 
-#define CEA_ESTACK_SIZE(st)					\
-	sizeof(((struct cea_exception_stacks *)0)->st## _stack)
+#define CEA_ESTACK_SIZE(st, member)					\
+	sizeof(((struct cea_exception_stacks *)0)->st## _ ##member)
 
-#define CEA_ESTACK_BOT(ceastp, st)				\
-	((unsigned long)&(ceastp)->st## _stack)
+#define CEA_ESTACK_BOT(ceastp, st, member)				\
+	((unsigned long)&(ceastp)->st## _ ##member)
 
-#define CEA_ESTACK_TOP(ceastp, st)				\
-	(CEA_ESTACK_BOT(ceastp, st) + CEA_ESTACK_SIZE(st))
+#define CEA_ESTACK_TOP(ceastp, st, member)				\
+	(CEA_ESTACK_BOT(ceastp, st, member) +				\
+	 CEA_ESTACK_SIZE(st, member))
 
-#define CEA_ESTACK_OFFS(st)					\
-	offsetof(struct cea_exception_stacks, st## _stack)
+#define CEA_ESTACK_OFFS(st, member)					\
+	offsetof(struct cea_exception_stacks, st## _ ##member)
 
-#define CEA_ESTACK_PAGES					\
+#define CEA_ESTACK_PAGES						\
 	(sizeof(struct cea_exception_stacks) / PAGE_SIZE)
 
 #endif
@@ -145,9 +146,9 @@ static __always_inline struct entry_stac
 }
 
 #define __this_cpu_ist_top_va(name)					\
-	CEA_ESTACK_TOP(__this_cpu_read(cea_exception_stacks), name)
+	CEA_ESTACK_TOP(__this_cpu_read(cea_exception_stacks), name, stack)
 
 #define __this_cpu_ist_bottom_va(name)					\
-	CEA_ESTACK_BOT(__this_cpu_read(cea_exception_stacks), name)
+	CEA_ESTACK_BOT(__this_cpu_read(cea_exception_stacks), name, stack)
 
 #endif
diff -puN arch/x86/kernel/dumpstack_64.c~cea-estacks-shadows arch/x86/kernel/dumpstack_64.c
--- a/arch/x86/kernel/dumpstack_64.c~cea-estacks-shadows	2026-10-21 12:36:36.743878793 -0700
+++ b/arch/x86/kernel/dumpstack_64.c	2026-10-21 12:36:36.746878799 -0700
@@ -69,10 +69,11 @@ struct estack_pages {
 };
 
 #define EPAGERANGE(st)							\
-	[PFN_DOWN(CEA_ESTACK_OFFS(st)) ...				\
-	 PFN_DOWN(CEA_ESTACK_OFFS(st) + CEA_ESTACK_SIZE(st) - 1)] = {	\
-		.offs	= CEA_ESTACK_OFFS(st),				\
-		.size	= CEA_ESTACK_SIZE(st),				\
+	[PFN_DOWN(CEA_ESTACK_OFFS(st, stack)) ...			\
+	 PFN_DOWN(CEA_ESTACK_OFFS(st, stack) +				\
+		  CEA_ESTACK_SIZE(st, stack) - 1)] = {			\
+		.offs	= CEA_ESTACK_OFFS(st, stack),			\
+		.size	= CEA_ESTACK_SIZE(st, stack),			\
 		.type	= STACK_TYPE_EXCEPTION + ESTACK_ ##st, }
 
 /*
_
