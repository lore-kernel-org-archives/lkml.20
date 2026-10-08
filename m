Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CCF45D90F
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791452818; cv=none; b=jKsLDMcdoP2QRTYc9z/VkkIG204QNBa+7sGM9ZulJHOXwkuHgCfSeuZdQcOwXk2Nlq8RMIO1uE5BKAI+HAbM2ULojWtFmriVt4doA+X31x7Xv8b+F2fgMVnhBv+THFdM7JUvtBf2mPNzyFpsVVV3bt6IY2Sk7gK/XDu61STAujs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791452818; c=relaxed/simple;
	bh=MuajMaDzYr7DBXnccGrGw+m5zveXmQpKjZgcN/nVmJ4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pMpfqcfzz6JgZdiHrT19L8vgJkPT8zrgMhwNgdGfb/pvUSmocGVVrz72ZvmSWhgf6rRYimsaElhzQTYNAylZMNuhZv0KUqJ1ScqXAhFOjX5AFoAwLe7YaOKJdzOnLcSft2m2Lsz0sXn6hN34jNxWRQ5/xuqJcZnOlcPb1FUqacw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Du4tyorx; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Du4tyorx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791452816; x=1822988816;
  h=date:from:to:cc:subject:message-id;
  bh=MuajMaDzYr7DBXnccGrGw+m5zveXmQpKjZgcN/nVmJ4=;
  b=Du4tyorxzM8KVFG7Xx2pWl8TBuEAVp5EZGpBXRUoEfWj7XNxY1heE8Sj
   eRFTFxq3mt5FguXro5q2g5/dGPb5ErQxjf9l6vXTE38SqRpE7AsAYILBJ
   Gpp+9UFUhlFieuVKT/aVybLnFMc72mjaX3FNDilzg7SJ4JBMX/P/sDaKF
   z7svLDUmkiQF/SBL9SGhYrFS+pdfd58VeIl4hzFxCyHTwFsPjrlrkRKxR
   6D6WuDodYOP9Q0yJBrdpL4BoEDXQQuka7sz7qpCDTMNG+GpUNOBQkJszp
   H7pEtxkimVCnaztuRkbfTcX9iY9UiobtKC/hf2wNE5p4bIooBXk1ZxG/q
   Q==;
X-CSE-ConnectionGUID: XciFNjmUSUGhp2DYrMVtJg==
X-CSE-MsgGUID: pHYuLuBvTMqvNcprjHxx4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="120564"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="120564"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 02:46:55 -0700
X-CSE-ConnectionGUID: BvwyrsWqRguDHK86JOoe1g==
X-CSE-MsgGUID: VZBVhREFSk6BGGLK0rN78Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="4064"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Oct 2026 02:46:54 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEkiB-000000004FF-1We7;
	Thu, 08 Oct 2026 09:46:51 +0000
Date: Thu, 08 Oct 2026 17:46:16 +0800
From: kernel test robot <lkp@intel.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Sudeep Holla <sudeep.holla@arm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Alexey Klimov <alexey.klimov@linaro.org>
Subject: {standard input}:2398: Error: Insn jl has an instruction
 mpyuw with limm in its delay slot.
Message-ID: <202610081711.NhfWonIr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi Vivek,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   69f80fef3153299d9c72c53d1d71eef6354b6926
commit: 6c2fd7a71e7ab490a0a9d591486d923712012f59 firmware: arm_scmi: Increase performance MAX_OPPS limit to 64
date:   10 months ago
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20261008/202610081711.NhfWonIr-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610081711.NhfWonIr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6c2fd7a71e7a ("firmware: arm_scmi: Increase performance MAX_OPPS limit to 64")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610081711.NhfWonIr-lkp@intel.com/

All errors (new ones prefixed by >>):

   Assembler messages:
>> {standard input}:2398: Error: Insn jl has an instruction mpyuw with limm in its delay slot.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
