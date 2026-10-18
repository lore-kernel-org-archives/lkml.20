Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1072868AB
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 01:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792285839; cv=none; b=tO5qA0Eiuy7pcCr+DbB9TB15nslcrrSoOvAmgCMRqtMw0oYicmoSy/aLk9MP8GyDssNisUjlt1MvP0WKPF/1+Vp2Ngzxyes+cIxMeHC7FkuqmUO3U0+QaWj1WnBv1bXs7WukSZ6j+TpuYDHpiPIBoj5OjfsbYOIyCMh/eVs1JG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792285839; c=relaxed/simple;
	bh=eTL3zCKW2b+yMArvP33aNj0EbUaBajQIzEbeKrRKhQk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tyRhgoZEcRd9M/uN1JiNpbiJO8tVZTyT6CfdFc3fCmDPYGTuyXxYsW9rKhr7gsGa6Yzuwbvu4ct+WOaxG05SFOuWm415VeNwrUdJn316U/InEunPUGnR6sx+j8efczxA5cPjX12SCFjuxN/EZmDcWIrySzAuYrL131drVDoDhKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zy08EHhg; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zy08EHhg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792285837; x=1823821837;
  h=date:from:to:cc:subject:message-id;
  bh=eTL3zCKW2b+yMArvP33aNj0EbUaBajQIzEbeKrRKhQk=;
  b=Zy08EHhgSyM0/9yIvUIiRvuXphgIVgyRcnkR9shL0rpjFoPIgGO5P7nw
   x3CSKJKW+vwWizbU+rtyHGZOZFKHl8WVe+j7tzEy196w6SCpLYnDrayti
   dcEcTmeVoI9m2QZnHWB6w9YH/IIax391AMN0mrdHN0HqtLUXxE/ELyMQ1
   xpcANXBI+I/jmPymOZiEKy469heEHfXqRO5bNP2ObNoQfnbj4sEFDaani
   fcFuhyzD0ps2JOsfcEX2j376jdagyhDpSwcDtpW/kORAvfeIIql/yT0f0
   2z6uqwm5BdUpdb58uYGnZ8eOmNhEO1mAmewqyFPgAC33J7hPvaCJHE/P1
   w==;
X-CSE-ConnectionGUID: EwU6wmqRQySG0HTHogGGDw==
X-CSE-MsgGUID: 32lfwYnFRtSyPdkfWrDyLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="898004"
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="898004"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2026 18:10:36 -0700
X-CSE-ConnectionGUID: JBoYHGWRTDicc4GaLghELA==
X-CSE-MsgGUID: sk8yhIzCQ3egQJUX1CHu6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="2608537"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Oct 2026 18:10:34 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIFQ0-00000000Jwi-147C;
	Sun, 18 Oct 2026 01:10:32 +0000
Date: Sun, 18 Oct 2026 09:10:17 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/media/cec/core/cec.o: warning: objtool:
 cec_receive_notify.isra.0+0x44b: ignoring unreachables due to jump table
 quirk
Message-ID: <202610180940.mjhxIMez-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   90201351a862182bdabfc1ad1c97b1e1b6ed5931
commit: f2c356d1d0f048e88c281a4178c8b2db138d3ac1 kbuild,objtool: Defer objtool validation step for CONFIG_KLP_BUILD
date:   1 year ago
config: x86_64-buildonly-randconfig-1000-20261018 (https://download.01.org/0day-ci/archive/20261018/202610180940.mjhxIMez-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261018/202610180940.mjhxIMez-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f2c356d1d0f0 ("kbuild,objtool: Defer objtool validation step for CONFIG_KLP_BUILD")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610180940.mjhxIMez-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/cec/core/cec.o: warning: objtool: cec_receive_notify.isra.0+0x44b: ignoring unreachables due to jump table quirk

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
