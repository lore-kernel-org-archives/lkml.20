Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794747218;
	b=v9GzxthLMD8FmEWXD5ff0obqfroYRPCDagzLK/expH2Vcc/TmkygSwvwE5sF1f35qDFR
	 oX8HICBpbR9sGc1fogmaqoOBXRIFALCvZWAXNepJaMX7VXscHXCT/1NIy/BNQnYbWwEov
	 J/X1OmMIm7PH5/vwlik6UziiwiYmI5l0jMm4Rh8fLqlevIrbldKGyS0WCkVHeGYbjFU3k
	 DeLCnBNMaoag0xxOXBkFbVjcrpBFFsi+xYZlwEnXH1WnwHISeS6vOFUBaAsnoZVOuMPgf
	 upXcl6TMJstV7lGXVA2m5Hl5A6NMs9WqTS3zUsjBiBu8k1TWIPdxg8+PUS2YGejyDZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794747218;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=4/rq2agXROmOwSeZ3U7PlpKJ4dgPBVpEYHZz+QxPf5A=;
	b=RbLo6Le6iEWLDN+QgklBYkuGP+8jcW8ZJIgRaf/Ug/G31a/DCoxIpjOHswDgVeVemB4L
	 sfSVCArqJJHXY8GaKs94CMrxCA5++1JHQFqicwiVYQnI2C70wkkYdEhGsFrN3pc06MYxT
	 LBFk5Es1KBO7ha1GIPicSi+i+rl5diivsOTWD5w5gOeVsmPoxRhZv7aGjZxyuK+UFFdTD
	 pT4MrCieGp9fFvjYBEx7g5cZDg2dimkpFZb+JXIm2z2VqBp8Ai5YpSaSgR4NFQ/p+8Bis
	 hS+BHifMvLS0r5IZXOe7m5Z0ght2/EhfMyxHFLiB5vKQMXaF3U+T5CA6N0hOM//OwHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f1RcW7Ky;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335F0606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 12:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 335F0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f1RcW7Ky
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794747219; x=1826283219;
  h=date:from:to:cc:subject:message-id;
  bh=lbKIPl0TIThwlE1opQq8QdIMgDKHSrK/w7B4xG4Kbdo=;
  b=f1RcW7Kyt7ICxUKJVX67the3G3n60qvjYZSYrFUOo4FggK+V5ik0aezO
   XQB63lYWbR5Z+du3mzofdfy7CJdORF1KyLMZRfcIMvLJaRgkFSGKTbtnf
   XFClAEi5uV/gU1PG/S7c9LWYeJuNkQpJrgn3ILB3eM9NigW98CXNEm3Nm
   R/LjknFdceDACxNzphFiFSEbbdLzjf7NVJBptUJQq4ZvmewlYziJUuQWq
   IRmj1QIPuxM4meCbRfnDkIK/Qk4UW1BCaiuwcNeZX2rawiukYgysChxqJ
   Lhgsx8f7KzOl9SbvvWkli9L8MN02x8Fr7tj68pRP1tRFiIC7WfM9gVFA7
   g==;
X-CSE-ConnectionGUID: 2glOzNeeT16HyhMw1AsevA==
X-CSE-MsgGUID: FAqe5prQR++y4izDKwcFvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3486968"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3486968"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 04:53:38 -0800
X-CSE-ConnectionGUID: dUd0X0L+RUe5m+jRY2zMZw==
X-CSE-MsgGUID: ey1BBB8YSZaotdc9ZrBHbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="11048780"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 15 Nov 2026 04:53:37 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSZjh-000000002BM-3Nwv;
	Sun, 15 Nov 2026 12:53:33 +0000
Date: Sun, 15 Nov 2026 13:52:33 +0100
From: kernel test robot <lkp@intel.com>
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>
Subject: {standard input}:2813: Error: register save offset not a
 multiple of 4
Message-ID: <202611151335.qjG1sZIV-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Hi Eduard,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   23c62304dde29abe92013d85910d03a77dada35d
commit: bf0c571f7feb6fa05a512e2a5e50702501849d61 bpf: introduce forward arg-tracking dataflow analysis
date:   7 months ago
config: m68k-randconfig-r2106-20261115 (https://download.01.org/0day-ci/archive/20261115/202611151335.qjG1sZIV-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611151335.qjG1sZIV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bf0c571f7feb ("bpf: introduce forward arg-tracking dataflow analysis")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611151335.qjG1sZIV-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:2813: Error: register save offset not a multiple of 4
   {standard input}:2814: Error: register save offset not a multiple of 4
   {standard input}:2815: Error: register save offset not a multiple of 4
   {standard input}:2816: Error: register save offset not a multiple of 4
   {standard input}:2817: Error: register save offset not a multiple of 4

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
