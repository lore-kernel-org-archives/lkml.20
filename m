Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313BB3655F5
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791617331; cv=none; b=Xf57CRjHATYYUM6xMKJiL3rJbUeDwV0G+1KCMhy2m6CuVMF99BO6qz89bmnsa6P6sDj3LlR9bw3NRL20lBOSN+nZCUis8sK3gYkRuRy5PdOTozYqtJz1P3xc0K/kDIALIleCgUDD7rWQc7iXjg9W7tq4gFThmcxUpGMZWNHiO9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791617331; c=relaxed/simple;
	bh=t5n5L6GQmhHIn97p4LvzKeZiCVVSUwyp6iJQtnlr1ls=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j/skNhp2SSS7IWZyHIZ2X42pUMXTe8IRRbczZGgqVE85179nLxzc92vsE5jIwFxd0d3W+y5eiBV9wrI+hnTMiJbL9ulBDIXSWzOhPtahLILnzpDCkt9G06pp9fhM2mXm4k11g9Vx3hkxhBUQ46p0rPQ6iPjcgeEd4xMLZ2yOew4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GEwwBn7V; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GEwwBn7V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791617329; x=1823153329;
  h=date:from:to:cc:subject:message-id;
  bh=t5n5L6GQmhHIn97p4LvzKeZiCVVSUwyp6iJQtnlr1ls=;
  b=GEwwBn7VmQF86zTiWzZSHM6TxOKecY/9uZdWLnaEdiM7O4qzXp/ecRTK
   Z8ogtNMg4ROAM+DtUO8ir5GkCCWwng5fCTGan3SZibIxkZF+jiNlTa4C/
   uw4ty8Tm5kvM4th4PKSL2tGhtsTsA6d6RpAARtzJZYZVy2YHBjXaoBws3
   GmiNSOJ6xTKkgd2UKX0ucnC2RmwXsXlHxkTM0wVIhiX3MwKlrSdjtSATD
   +CUXIO32Jx4pL/uDpspRpSFZCKsw8cQwT3iCRFUP0dEtuNzobZGWjIO/r
   eyTdm2gGuohoKz17ggzcPyjecQwb06QU+qFYanmxoCgIdJwUBsfj76zV8
   Q==;
X-CSE-ConnectionGUID: snQ1Qp7pQNi9Th/uZyZvHA==
X-CSE-MsgGUID: hi6zCrLwS/S3Oj76PlDPGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="308635"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="308635"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 00:28:49 -0700
X-CSE-ConnectionGUID: hNcrTooDTbSbWYvMqXU/tw==
X-CSE-MsgGUID: TernOuOkT6CjlNIJExKMBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="2288975"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 10 Oct 2026 00:28:47 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFRVd-000000007iQ-1Nkk;
	Sat, 10 Oct 2026 07:28:45 +0000
Date: Sat, 10 Oct 2026 09:27:45 +0200
From: kernel test robot <lkp@intel.com>
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>
Subject: {standard input}:2941: Error: register save offset not a
 multiple of 4
Message-ID: <202610100918.wzKI5KwL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi Eduard,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3857c2fe5449541e24afc5efdb0f81a8a8f9a3a0
commit: bf0c571f7feb6fa05a512e2a5e50702501849d61 bpf: introduce forward arg-tracking dataflow analysis
date:   6 months ago
config: m68k-randconfig-r2309-20261010 (https://download.01.org/0day-ci/archive/20261010/202610100918.wzKI5KwL-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261010/202610100918.wzKI5KwL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bf0c571f7feb ("bpf: introduce forward arg-tracking dataflow analysis")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610100918.wzKI5KwL-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:2941: Error: register save offset not a multiple of 4
   {standard input}:2942: Error: register save offset not a multiple of 4
   {standard input}:2943: Error: register save offset not a multiple of 4
   {standard input}:2944: Error: register save offset not a multiple of 4
   {standard input}:2945: Error: register save offset not a multiple of 4

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
