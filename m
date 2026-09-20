Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFC13D6473
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 06:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789884753; cv=none; b=eNi7KlEvMKO2lrx4cIuG+ePpWnLBWnsbhRisUlL3GWS72Vu2F1/1tzU9ak24NdKDm+5M5J+IzdoY52MBoh223Qx5RgphULkrdChM+NmgukPkg/rHydiDzt0FId+7a9hASlYBxRPmjCg/g9ZU6yZlVh8JrfCE7W39AmzRB8sbMPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789884753; c=relaxed/simple;
	bh=rJ7JV7fe/imem88MeBzmgQzVzxxJuNxRZ6eOp/+uA4g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CAO/7fT8Tl7vtDq3JbvLKCCyyDQVF79KWen7TRaFEPryzMN9ww2J9uDW9dTO78c+xo2MDRzHclx24Zi8ZmTdU/7R7DyFSEMnZzPkaSo3epHBVS7EXIQCAbbQXejpcBugG+BSXN6EHNas4P+pag07TLSWKLxL7Yw48Ru9dHHBBE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I9khwo+n; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I9khwo+n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789884752; x=1821420752;
  h=date:from:to:cc:subject:message-id;
  bh=rJ7JV7fe/imem88MeBzmgQzVzxxJuNxRZ6eOp/+uA4g=;
  b=I9khwo+nZZZctuVhUcZ/dPLXJpo/LeCvLf3TFSEWtlnlW1OC72inbhDl
   VLOQFPpBhKmuIwFo/WjU/JY1cB2lF8tRQ/qTcInN5BghIej6+1R3AEn2B
   MIN5mqRjeTKtNe5PaQHSDziS31SjGh2OxjWmoVT/qIL35qS0BgDnhCTQI
   Tb10NGmxTlQR6+01ClzUlSODR15u9Z9ZtZluLDfg9ea8i+xeJpM1Q3W8x
   kjVjlQnwK2RTcPRWxLWHPaAIhpLs4I1tUcheqvnmk0rrlP1NI0rdfI6PA
   hXy8wvO3Mk3/8p5AChw6zf1xQNyoJzGc9v8U9TQTOb7XEyVMRaEeKQGpw
   A==;
X-CSE-ConnectionGUID: dqw922SgQjGXrtbiOLX4Rw==
X-CSE-MsgGUID: 4LdnFkX+Tiit4eLIp2X+3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11910"; a="107900302"
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="107900302"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 23:12:31 -0700
X-CSE-ConnectionGUID: qM8UP+fHQOSZavZ2q/vx3g==
X-CSE-MsgGUID: XhT5knpvTUeb9ut/zPWdWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="271673003"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 19 Sep 2026 23:12:30 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8Amp-00000000C0x-1GF2;
	Sun, 20 Sep 2026 06:12:27 +0000
Date: Sun, 20 Sep 2026 14:11:39 +0800
From: kernel test robot <lkp@intel.com>
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>
Subject: {standard input}:6011: Error: register save offset not a
 multiple of 4
Message-ID: <202609201441.HMtNMLer-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi Eduard,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f259f446f5198d98e13756d2cd531812a0ad3064
commit: bf0c571f7feb6fa05a512e2a5e50702501849d61 bpf: introduce forward arg-tracking dataflow analysis
date:   5 months ago
config: m68k-randconfig-r1306-20260920 (https://download.01.org/0day-ci/archive/20260920/202609201441.HMtNMLer-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260920/202609201441.HMtNMLer-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bf0c571f7feb ("bpf: introduce forward arg-tracking dataflow analysis")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609201441.HMtNMLer-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:6011: Error: register save offset not a multiple of 4
   {standard input}:6012: Error: register save offset not a multiple of 4
   {standard input}:6013: Error: register save offset not a multiple of 4
   {standard input}:6014: Error: register save offset not a multiple of 4
   {standard input}:6015: Error: register save offset not a multiple of 4
   {standard input}:6016: Error: register save offset not a multiple of 4

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
