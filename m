Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922382;
	b=JvufS3nqet4ObkkneOyrdKUmTHaUYK10GezqqCgmoihtU/C5Lu+/Vi+gVI8wrrcsjBup
	 N1dSAM9QRyqTdBmNFrIkIXfjtJlQ5EjC/2BKKQWNrzfx172EFiuMwDfT8yu7DxuMEL/bI
	 I8Tq9hHoRydm2OAk/hQTuYyjjc5FWgS9HdE0PLSGyqkMZ2wBBqQ/XqhvNzeb40bVqnHRD
	 4979xeP6WeJJvfqDG1udKNrDvuKg3qA0BI4KnPk7RuvK7y55G5cfeI6rPdf/NIcMi/Uba
	 g6FaWlLgWMpm9OeIGM4eq4HZoAiW/oZWTX297x64l9vc3QXTPxsaueE6altbmTXTyYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922382;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=mty3QCtny+kxDlCmdX8ssy+X5iQX3S1usQjDW0VglUg=;
	b=lYZU3Gyj78xCJDeLPj2mfdrCcwJRVda8AYuUyPuPtyhrzqqngQssQ5GAODK/wGA+Vvhz
	 80SYm8pbnxkGJeyAup//2StFxDynThrhaU7flYB50LSH6LTl7qJMJc/o2GAHSI4OvlnHc
	 h+I4abUJrVwHPAwj+TtUrp5TALFUmYFrpwOiVizn1RaYVj0lNjJMy7U4JHPlmOj5vyYE7
	 yauEJSwWemunhZHFEDZQ2Q0nAFYHDecHNW8xGcAZWhQpyBf7F4R9QvuzrZAOTfdSWz7z0
	 GT7ivsJPscVnJGlRSaXRWS5f6j02sxoJZCOr56auKiS29nXq8GX0v+/WDBJnQb8ZbAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DQdLlc+i;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF92606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EF92606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DQdLlc+i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794922382; x=1826458382;
  h=date:from:to:cc:subject:message-id;
  bh=B3k19C46oxvmNK98eF2GKdwx5NtCxSNcnqEGDdv1USw=;
  b=DQdLlc+ibkAs8xj2q3KeR8dynwrnRaJ4Ks9cCKUhNqVERRCztigCWSQ3
   uoGWGrKp/40Z8UxHa6KqKPQcHtdE4BXbQRna2DW7NKtslAy9hrZKQo/Ao
   fIJhLQ06Ft80+wy5p8F55mUZokyaeoH5/HnYEkYKwjNxRA6r1cjxHb6CR
   GmVHRGQ8CM1zJl1hJ76FvgFLaTL+P2VivOzM+uO8VE+ag/XOqh12FhcJn
   NK3Vkijefo31gf7qLt4CrLwK9uPvaIOkNztxwPLv6GXpZazmaEbkqQG/P
   pII+XBBDkDNriGUYxTG9t0XmdRF9flqpNVTtJAvzwhEUHqxNUe23uxRXK
   g==;
X-CSE-ConnectionGUID: lu39U/1nQDCpFRDtVCZ2Jg==
X-CSE-MsgGUID: DhlxuaFySt+0hMnZStHFJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3681701"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3681701"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 05:33:01 -0800
X-CSE-ConnectionGUID: R/IVg+3bT3qJIE/3qgtrGQ==
X-CSE-MsgGUID: IuquUHOGSnC0xtDuk6C0vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9624490"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 17 Nov 2026 05:33:00 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTJIn-0000000037i-2Sf0;
	Tue, 17 Nov 2026 13:32:49 +0000
Date: Tue, 17 Nov 2026 14:32:05 +0100
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees+treewide@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 strncmp+0x40 (section: .text.unlikely) -> initcall_level_names (section:
 .init.data)
Message-ID: <20261117142858.2AAnSUeF-lkp@intel.com>
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
head:   666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
commit: 0af298e62e5cff4ebf9bec47b8711177a7e2f115 treewide: refresh kmalloc_obj() conversions
date:   11 days ago
config: xtensa-randconfig-r2306-20261117 (https://download.01.org/0day-ci/archive/20261117/20261117142858.2AAnSUeF-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/20261117142858.2AAnSUeF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0af298e62e5c ("treewide: refresh kmalloc_obj() conversions")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261117142858.2AAnSUeF-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: strncmp+0x40 (section: .text.unlikely) -> initcall_level_names (section: .init.data)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
