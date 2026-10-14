Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A490C4734FC
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792018212; cv=none; b=RzD2VlPbNJvFh9cM2Gd5EDhVMCT+uMsCkjCRkf3VvdbmRj4UhIXY6eh3kCVFsbSAmIqAOTMEM9vV3RZk1jl0USGIblUWNO+cNfAaO+gfuj/1mfp0Ch5nkV9opdt7F0Yk15Yhb51tVU82SDmETgI7jUCZ2n48Ksr1gczDn9AlqIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792018212; c=relaxed/simple;
	bh=n+pWVEaEz1G9hLasrMChZGdCwbGdJlHaGRy8PhjyNtE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CuEQgShJocdtYnoPkzl0M9Ep/8HJu7LzWG8lHlxbWvdMt3y5rAJy6wrpfXpX9t6JMkHM+4AbQ0aNqGwSDHI+3nnsdJO8H6tx7E/KYmIyQUimgtI87O1qxL9d9LTRkNmsgJ8I65Jgn9XgBSDcPR/9Zad6qo4XDgd2V/dUGR3DxTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JyDhJYHK; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JyDhJYHK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792018211; x=1823554211;
  h=date:from:to:cc:subject:message-id;
  bh=n+pWVEaEz1G9hLasrMChZGdCwbGdJlHaGRy8PhjyNtE=;
  b=JyDhJYHKTWQFCNsOLJyJC7BIgDbpBQOoEEmMWYameY2xUxhhpb3daGuL
   M3BfXEny1oQbA4VrqDnVY4V6Ou+Q3I2EbP+y0PbXuOFtA6SSYkXaRQlQn
   QpQqud23oX8Kwyt0FB9/ROHBtaowZFV0IeHqX/N1c/LmLTZtZxy0S/VMB
   Wfj7o5K8w0Vl8RXlF4kFjEEI+xUeFe5lxsQOI8Jd19z5oONT1CD8hybHP
   zyrbuqlHygb7IXnSl5VtEU9PmFWPz5BpWnUxTl+qkvNUHCVFOLeKh4YSj
   T8rNRG9Bq9jdPLHBWI8GBwvEYJygTeBbs/Tua/PmH59cHi8SfWntxzvNj
   Q==;
X-CSE-ConnectionGUID: Sdu+hfKFTg2l4OEejyEwBg==
X-CSE-MsgGUID: ifJn/m9zTGagj2enQmcW6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="655746"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="655746"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 15:50:10 -0700
X-CSE-ConnectionGUID: K8L7SaRDQrWfg0Iii7Dv9A==
X-CSE-MsgGUID: nSqefY6wRyW38gGVhw3cLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1611178"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 14 Oct 2026 15:50:08 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xH7nS-00000000BLT-0XNY;
	Wed, 14 Oct 2026 22:50:06 +0000
Date: Thu, 15 Oct 2026 00:49:15 +0200
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: kernel/trace/trace_snapshot.c:51:3: error: call to
 undeclared function 'trace_array_puts'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202610150045.WoETcMQu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0fcb05b72344f40806cbe810de8872f1698bf053
commit: bade44fe546212e142befb69ba22f34944030a99 tracing: Move snapshot code out of trace.c and into trace_snapshot.c
date:   7 months ago
config: hexagon-randconfig-r2110-20261014 (https://download.01.org/0day-ci/archive/20261015/202610150045.WoETcMQu-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project e1354f31346666c78d758cee13692ea3b1fe3ec2)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610150045.WoETcMQu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bade44fe5462 ("tracing: Move snapshot code out of trace.c and into trace_snapshot.c")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610150045.WoETcMQu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/trace_snapshot.c:51:3: error: call to undeclared function 'trace_array_puts'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      51 |                 trace_array_puts(tr, "*** SNAPSHOT CALLED FROM NMI CONTEXT ***\n");
         |                 ^
   kernel/trace/trace_snapshot.c:51:3: note: did you mean 'trace_array_put'?
   include/linux/trace.h:84:20: note: 'trace_array_put' declared here
      84 | static inline void trace_array_put(struct trace_array *tr)
         |                    ^
   kernel/trace/trace_snapshot.c:57:3: error: call to undeclared function 'trace_array_puts'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      57 |                 trace_array_puts(tr, "*** SNAPSHOT NOT ALLOCATED ***\n");
         |                 ^
   kernel/trace/trace_snapshot.c:64:3: error: call to undeclared function 'trace_array_puts'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      64 |                 trace_array_puts(tr, "*** BUFFER MEMORY MAPPED ***\n");
         |                 ^
   kernel/trace/trace_snapshot.c:71:3: error: call to undeclared function 'trace_array_puts'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      71 |                 trace_array_puts(tr, "*** LATENCY TRACER ACTIVE ***\n");
         |                 ^
>> kernel/trace/trace_snapshot.c:251:6: error: redefinition of 'tracing_snapshot_alloc'
     251 | void tracing_snapshot_alloc(void)
         |      ^
   include/linux/trace_printk.h:188:20: note: previous definition is here
     188 | static inline void tracing_snapshot_alloc(void) { }
         |                    ^
   kernel/trace/trace_snapshot.c:1065:3: error: call to undeclared function 'trace_array_puts'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1065 |                 trace_array_puts(tr, "** Boot snapshot taken **\n");
         |                 ^
   6 errors generated.


vim +/trace_array_puts +51 kernel/trace/trace_snapshot.c

    36	
    37	
    38	static int __init boot_snapshot(char *str)
    39	{
    40		snapshot_at_boot = true;
    41		boot_alloc_snapshot(str);
    42		return 1;
    43	}
    44	__setup("ftrace_boot_snapshot", boot_snapshot);
    45	static void tracing_snapshot_instance_cond(struct trace_array *tr,
    46						   void *cond_data)
    47	{
    48		unsigned long flags;
    49	
    50		if (in_nmi()) {
  > 51			trace_array_puts(tr, "*** SNAPSHOT CALLED FROM NMI CONTEXT ***\n");
    52			trace_array_puts(tr, "*** snapshot is being ignored        ***\n");
    53			return;
    54		}
    55	
    56		if (!tr->allocated_snapshot) {
    57			trace_array_puts(tr, "*** SNAPSHOT NOT ALLOCATED ***\n");
    58			trace_array_puts(tr, "*** stopping trace here!   ***\n");
    59			tracer_tracing_off(tr);
    60			return;
    61		}
    62	
    63		if (tr->mapped) {
    64			trace_array_puts(tr, "*** BUFFER MEMORY MAPPED ***\n");
    65			trace_array_puts(tr, "*** Can not use snapshot (sorry) ***\n");
    66			return;
    67		}
    68	
    69		/* Note, snapshot can not be used when the tracer uses it */
    70		if (tracer_uses_snapshot(tr->current_trace)) {
    71			trace_array_puts(tr, "*** LATENCY TRACER ACTIVE ***\n");
    72			trace_array_puts(tr, "*** Can not use snapshot (sorry) ***\n");
    73			return;
    74		}
    75	
    76		local_irq_save(flags);
    77		update_max_tr(tr, current, smp_processor_id(), cond_data);
    78		local_irq_restore(flags);
    79	}
    80	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
