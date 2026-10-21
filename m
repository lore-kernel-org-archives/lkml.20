Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792612282;
	b=EnaF35sVFCAdO9VS6jPocmfXqoewUzq+uVaaWFGeqaYZcbXMzkqworbbu4AZGlovsxAU
	 dpXhFdw3ZKEDg8rckuPYtgwvy94jO4BTyUxB2/ZT9s+bDVsaMi73Usck54JiOEmopa3W1
	 B4EaiDcWrlYnDtZIMp4kv5jxQJ7yLgDOtjLnYvtdWkavHwifSdcpAByMZ2dBYkZ72tO93
	 WmPT3SCk6+H79uAsQgo1cA6lSJa1WW8xUKiEwVDCfWS9OywVyXj+iJX+hBso0sNdUs1xS
	 9EHG8LDCpJ1QT/UXc2nlCw2dv9VTLAXsVdoERlPSAdLjL9KJunVjChVpTTw/OyFbVfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612282;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Subject:To:Cc:From:
	 Date:Message-Id;
	bh=mQPmzwMwoYFlUMO51m5cARcsfU/n9XjeDF4DxBf4jHI=;
	b=UI0jyGEJQ7EEJv6BjI56Xt2RidYPot577zZiRn92zRIP22EU7Ju5ysp/lWJ9mWSWw6Li
	 n+QtVWTgw/8Cn/ECZkjiH8KoBbsg12oKCnTKTJeFufx7Tg1Itl5AU9hLE4PW0TJhCQkXJ
	 zSZTExMql2Ogv4sMFq9eVNXXX88UDyqFoLo22fUFcsBaZZrC4E8mIpWGWEJu0r764P3xv
	 L1o7XqgzSaNmAZzY7fbUSKzxrWF9bEaI78mGW28pvCa3a7of6x6U5px0rVtpHXH/krZj0
	 v9bntHHxOU4VBGBABWmdpCiRbJrOr1T23eQ5rZbSGeYauUQJk2CSJLf/nTgBWJW+8Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SAOjzzIB;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2D0606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C2D0606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SAOjzzIB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792612281; x=1824148281;
  h=subject:to:cc:from:date:message-id;
  bh=vqlhEAc/QPGfBjBWPwnGXWOxgEbEgVfuUrpoAKdmfJU=;
  b=SAOjzzIBUMBo2J+jWdIQZ3Fx2ZeeIzLwSvaUazfju12E8oxD8i35/LWG
   UbXQVeK0Q75a9Kv7HHXPfWFMeNkWo1vz/fnTv5uhdRPgYlSDXLoORORf4
   YZy2LXmp3WnWSHMtxLfo0qy31Da0ydNdQxAMxct98rtPTuwLX7IUdeCKX
   FmKJvahDxcLvUlSchQvZejczRoduiOvf53diLRW9KbnK7wSqnUE8ppyGX
   PyuxwqaKBmWVosUY9q3tt77e6e7OqoU9mpUqqOn3xj7o3j1yd4i/TTSpi
   c3PaWnkRMxA7PPi6Kdu0UPvt1bLXg2GjOdbc4J/4Dr18HavPF3/Zu3KQm
   A==;
X-CSE-ConnectionGUID: i0rwFYpDS7CoOgcIqtGcEg==
X-CSE-MsgGUID: 0YhkfyVeRCq34ntTNz342w==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1341768"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1341768"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:51:20 -0700
X-CSE-ConnectionGUID: vN756FwdQrqxs8NseVsJWg==
X-CSE-MsgGUID: g6JCHmJTSiqr9Kxa/0fYOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3248189"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by fmviesa003.fm.intel.com with ESMTP; 21 Oct 2026 12:51:20 -0700
Subject: [RFC][PATCH 00/24] x86 Kernel Shadow Stacks
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Edgecombe, Rick P <rick.p.edgecombe@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, the arch/x86 maintainers <x86@kernel.org>, Kees Cook <kees@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Wed, 21 Oct 2026 12:51:20 -0700
Message-Id: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Shadow stacks are a processor security feature that provides a
parallel, separate, protected stack for storing return addresses
(mostly). There is currently support for them when running userspace,
but not running the kernel.

Shadow stacks are a very powerful control flow protection mechanism.
They represent probably the single most important kernel mitigation in
silicon that Linux is not using.

This series is a proof-of-concept to run the kernel with shadow
stacks. Some of it will hopefully be mergeable in its current form.
Other parts are pure junk and will need to be completely redone.
Note the lack of SoB lines.

The point of the series and of this post is to start the conversation
about what an initial merge might look like. What are the
showstoppers?  Let's say eBPF was not supported, or you could only
use kernel shadow stacks if mitigation=off. Would that be mergeable?

I also owe a big debt to the Xen project and Andrew Cooper for
leading the way on this with their implementation and answering
questions along the way. Thank you Andy!

Let's dive in.

The series is roughly broken up into a few parts. This ordering is
not strict yet and needs refinement.

Patches  1- 7: arch-independent infrastructure to get shadow stacks
	       in to existing thread/task structures
Patches  8-16: Run the kernel single threaded with shadow stacks.
Patches 16-19: Run userspace and context switch between tasks
Patches 20-23: Handle kernel RIP modifications

== Background ==

=== Page Permissions ===

Shadow stacks have special page permissions. They are read-only and
dirty (Write=0, Dirty=1). This means that the normal direct map can
not be used to map them. Either the direct map needs to be modified,
or some alias mapping needs to be created.

=== FRED ===

The kernel often needs to stop normal execution and go off to do
something else like handle an interrupt or exception. Handling these
events often means manipulating the stack. FRED is a new (released
in 2026 CPUs) x86 hardware feature that simplifies event handling,
including some stack manipulation. When in use, FRED replaces the
ancient IDT mechanism. This means that kernel stack manipulation when
using FRED and the IDT look very different.

By "look very different", I mean that a FRED kernel shadow stack
implementation is relatively straightforward and the IDT is a
hellscape of essentially unfixable problems.

== Design ==

There are a few critical parts of the design:
 1. A shadow stack is allocated per-thread. Space is carved out
    in the thread_info structure, adjacent to the normal stack.
    vmap'd stacks are leveraged. They already provide an alias of the
    program stack with 4k pages so it is straightforward to create an
    alias of the 4k shadow stack page with its special permissions in
    the same area.
 2. FRED is a required prerequisite. If someone wants to go back and
    do an IDT implementation, I'm all for it. But FRED is way simpler
    and it is absolutely the place to _start_.
 3. In addition to the per-thread stacks, there are also kernel
    exception stacks. This is also true for shadow stacks. Leverage
    the "CEA" infrastructure to allocate space for the exception
    shadow stacks. (look for "x86/cea" patches).
 4. The kernel shadow stack pointer needs per-thread storage and needs
    to be context-switched.
 5. Any event handling (exceptions or interrupts) that modifies the
    "return to" instruction pointer now needs corresponding changes
    to the shadow stack event frame.

== Warts ==

In order of things I want folks looking at.

 * The shadow stack is not used for the init_task. The most ideal
   thing would be to find a convenient, simple time where the regular
   stack is shallow and it is simple to create a corresponding shadow
   stack. This is not currently done.
 * The context switching assembly is overly complicated and also
   subverts the safety in the architecture-intended
   RSTORSSP/SAVEPREVSSP sequence. This is more nicely fixed once all
   tasks have a shadow stack, including the init task.
 * Locating the FRED shadow stack event frame is ugly ("Stash kernel
   SSP on FRED entry"). It is currently implemented by reading the
   shadow stack pointer during event entry and stashing it on the
   normal stack. Xen seems to accomplish the goal by unwinding the
   stack instead, which has more complicated code, but has adds no
   complexity or overhead to event entry or the entry data structures.
 * The direct map alias of the shadow stack is left in place. This
   means that an attacker can write to the shadow stack without needing
   to leverage one of the very limited WRSS kernel sites. This is a
   big weakness in the security model. But, kernel shadow stacks with
   this weakness are still way better than no kernel shadow stacks.

== Future Work / TODO ==

 * The main thing left is to chew through the list of things in the
   last patch that are incompatible with kernel shadow stacks. There
   are some quite essential things in there.
 * Add a "warn on #CP and continue". Good for debugging. But, bad
   for security. Ideally, a secure kernel would have no easy to
   reach gadgets to disable shadow stacks.
 * Zap the direct map shadow stack alias. Might also require some
   performance optimization work to try and constrain the shadow
   stack allocations to a more modest set of the physical address
   space so the direct map damage is lessened.
 * Work with non-vmap stacks
 * Work with IDT-based systems (without FRED)

== Testing ==

I'm testing this on actual FRED hardware, an off the shelf "Intel(R)
Core(TM) Ultra 5 325" Panther Lake system. So far, I've only run it
under a qemu that has "cet-ss" suport (11.1.2) on a host with
out-of-tree support for CET-SS:

	https://github.com/sohilmeh/linux-dev/

It boots to userspace with 4 CPUs.

This series is based on 7.3-rc6.

 arch/x86/Kconfig                      |  116 ++++++++++++++++++++++++++++++++++
 arch/x86/Kconfig.cpufeatures          |    5 +
 arch/x86/entry/entry_64.S             |   87 +++++++++++++++++++++++++
 arch/x86/entry/entry_64_fred.S        |   22 ++++++
 arch/x86/include/asm/cpu_entry_area.h |   38 +++++++----
 arch/x86/include/asm/cpufeatures.h    |    9 +-
 arch/x86/include/asm/entry-common.h   |    2 
 arch/x86/include/asm/fred.h           |    8 ++
 arch/x86/include/asm/insn-eval.h      |   12 +++
 arch/x86/include/asm/page_64_types.h  |    9 ++
 arch/x86/include/asm/pgtable.h        |    3 
 arch/x86/include/asm/pgtable_types.h  |    2 
 arch/x86/include/asm/processor.h      |    4 +
 arch/x86/include/asm/shstk.h          |    3 
 arch/x86/include/asm/special_insns.h  |    7 ++
 arch/x86/include/asm/thread_info.h    |   13 +++
 arch/x86/kernel/asm-offsets.c         |    3 
 arch/x86/kernel/cet.c                 |   54 +++++++++++++++
 arch/x86/kernel/cpu/common.c          |   14 ++--
 arch/x86/kernel/dumpstack_64.c        |    9 +-
 arch/x86/kernel/fred.c                |   14 ++++
 arch/x86/kernel/process.c             |   35 ++++++++++
 arch/x86/kernel/shstk.c               |   21 ++++++
 arch/x86/mm/cpu_entry_area.c          |   25 ++++---
 arch/x86/mm/extable.c                 |    2 
 include/linux/sched.h                 |   10 ++
 include/linux/sched/task_stack.h      |   28 ++++++--
 include/linux/thread_info.h           |   12 +++
 kernel/fork.c                         |   54 ++++++++++++---
 mm/kasan/report.c                     |    6 -
 30 files changed, 570 insertions(+), 57 deletions(-)
