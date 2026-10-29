Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267384;
	b=kKdg8KACdiIkm0FLDzzV0BD7bvmHlyoLXiUiYfs59aC82+YBGD3v6JO6/V21iIwo3bgu
	 YGN6cDIzovohcximQySTziKi9Va76DxLuaUspBDFYBdEMRETDFrZ9AWxvvkqNIMqUblp/
	 hr/p532URaBbeM8uB4EeREmkuhg5u/TmSDUuzyDCPN8gvfnyMFibUlXqEcSpBuf4b6CdK
	 T+Mb2k6MyuDFUtzBrfdUABMDfgZQFMMe3hxpTN5Qt8u63/NMmXAUtgonzhUqRWkawcmyx
	 YfK8dDbXCZh6SGfhC9hWTNFEHsxNfky01t0Sv57zpj+TeDo8PXOCuCe2hj1c2buMWEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267384;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Ip6OodyYgPxE8i09BPkUuXD8qFekO1thWPUvSkoK3J8=;
	b=hdGgeW95BOyjygEghWCcUajhbpyYnL7gA00HU/nKGbBukneOy+Y/uRqFlV5PBrQcWZrA
	 ZPv1EVyLLXiUK6Jm+M0ri76tgpcZrfz27S+DTrx0Aan24e+hLd3z8w2EdXTcVxclGkUQG
	 HPNYSaFn+yM+oW98F21uBKKp3bMNKDE+QE6yqpQYTyLxRZzhUU5rrmVqTbWHp92Xb30GS
	 uoUaKooczFrwTVVqhDcVga/2iEwhuJNRu9oTmdIyoN4WbU0vCPt3RflwdqQ4OWfqC0YAR
	 TS4K5eeiG3XBwqFCvsdRwFOPjyn/Q6yTRiNpCvwdu83QiyYk+AfqmTdknAwRTt1ZmYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A2gyxIZU;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8070B606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:49:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8070B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A2gyxIZU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793267384; x=1824803384;
  h=date:from:to:cc:subject:message-id;
  bh=Dq9NImGikAuV9Umk8V6qIF4lVM1M/yT467NQ5v6qDPA=;
  b=A2gyxIZUqLPBohsWDkqJDkUyjV65k/i8X+Ah+PGEODmAzo8GlFBSjoFJ
   vPqClLLrgzrZ+PehxPvm1mEBdpnyNXgYVtaAnUgxFYyMZC6Owcsbwaf/y
   p/jkIxgxnd0ab1cLK+gqMZ7ztleL7Kj7XdNqji4RMz3bU2UJcWQYEpiYN
   Ro6TWh0gILWDX7orjgcyTud+5kKT9O2VEUcjok6BxHLas9+HwdSm/Wm/f
   nONQdMYRNXW3M35lx/2R/2IH7qF40NdDoXeuCgVqxN7SgyM+aJ+FVdAAE
   qF3Jx5LKy+iZhBAEC8nQ6t35+jwtmWm7xSjeLr2nt5CgjWRw+hx8fxiTC
   A==;
X-CSE-ConnectionGUID: JY9vka4wQ36TzetwGHGAsA==
X-CSE-MsgGUID: cpKMs16LTdSH+IZwBylpzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2008848"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2008848"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 02:49:43 -0700
X-CSE-ConnectionGUID: S4hyHfXDRx+gLYzdF+BIpQ==
X-CSE-MsgGUID: pN/2Iq8UQaeYqceB1AlvWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="4977246"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 29 Oct 2026 02:49:40 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMMlO-00000000Zuy-1PSC;
	Thu, 29 Oct 2026 09:49:38 +0000
Date: Thu, 29 Oct 2026 17:48:57 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Suren Baghdasaryan <surenb@google.com>,
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 dump_buffer_page.isra.25+0x194 (section: .text.unlikely) ->
 initcall_level_names (section: .init.data)
Message-ID: <202610291727.DXytMLtV-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c339f4010dea8b0d754f84ace70cd1b089878ef8
commit: 47e725702b0b7c01d4ae4ef231df8f63e5f305d5 mm: make per-VMA locks available universally
date:   3 weeks ago
config: xtensa-randconfig-1001-20261029 (https://download.01.org/0day-ci/archive/20261029/202610291727.DXytMLtV-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610291727.DXytMLtV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 47e725702b0b ("mm: make per-VMA locks available universally")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610291727.DXytMLtV-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: trace_initcall_level+0x3c (section: .text.unlikely) -> initcall_level_names (section: .init.data)
>> WARNING: modpost: vmlinux: section mismatch in reference: dump_buffer_page.isra.25+0x194 (section: .text.unlikely) -> initcall_level_names (section: .init.data)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
