Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C4E36166A
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 07:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789803884; cv=none; b=gOS12phyu3SG9ptm6ZGM+EboEaCIUqZEPBDKR4+BwCWXHFvpTq4E2xyB95aAx6L/33XmkXntbgqzVU/OcL16h6HetwFyK7+MFh+7MCRZz5rLJOnTH31Ofo4MP8mSM/CqqDou8LbY3p9y6Qm8s2u7hKYULWavv6YP0+WZlvn5ZTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789803884; c=relaxed/simple;
	bh=zmQaAqUIl7//Kq0oq/8binkgmY6+p1Kj0FCnPr/APxY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HTt3Pd26DvkzzkseA3Fi980ScicTtfF2uUS91kF/HwzJqrT9R3Wb2ywMOLP96jMmdEi+aYzKUrBohPnKki+TdaMGB+A5znMDCSU/4u1I1h8xZVJ2EPcCfkoBiXbHAzB5nTtVrAsaf+z1tJFz9YOq7KpILdcdupHUa4vedPuif7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c51o0feI; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c51o0feI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789803883; x=1821339883;
  h=date:from:to:cc:subject:message-id;
  bh=zmQaAqUIl7//Kq0oq/8binkgmY6+p1Kj0FCnPr/APxY=;
  b=c51o0feI/H5bRdmaEnvIkxuDwWXy2I77Vva5sxK7AfYvyPNbyzfM4YNU
   OaitW0TYKlDuC/RQATVLhGcyD0RNEfduu5X3b4+uNhmiYwrkgGFH7PsqS
   5n7wWZN9SAA+a6/XSqU3o1vs/r3tPCNfWenWWSevSqwpsXehqyM565Pii
   D24X2REnxAfJUc16x36ptQQ3TgKpJwvTaw0YqboY629xmCtBO6+v0u8gL
   0I6kJmkQo6PsOHHrsGMPXKndEjvKW9zBYZsEia9H/LibCRQiezbSy7uin
   F1by04/Z8yNkBex5FoKYqJONt6xb32lecaOg0E9f8mUG8kyWG+2vU4Opx
   w==;
X-CSE-ConnectionGUID: M7L57X0IRtKbIGj8bmTwIQ==
X-CSE-MsgGUID: 5LqukY8VQxiWltSz+GvEIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="838847"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="838847"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 00:44:42 -0700
X-CSE-ConnectionGUID: 9PMppINCR1mb0JhMI3QQMg==
X-CSE-MsgGUID: BE4RmvhDQaa60m8rXisXQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="268448315"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 19 Sep 2026 00:44:40 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7pkQ-000000001O6-1viq;
	Sat, 19 Sep 2026 07:44:34 +0000
Date: Sat, 19 Sep 2026 09:44:02 +0200
From: kernel test robot <lkp@intel.com>
To: Youling Tang <tangyouling@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>
Subject: arch/loongarch/kernel/machine_kexec.o: warning: objtool:
 kexec_shutdown_secondary+0x60: stack state mismatch: cfa1=3+0 cfa2=3+16
Message-ID: <202609190905.OZTcO07l-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi Youling,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   40288c9206c17eb66a603262e06a58d300d0f279
commit: d162feec6b6e7ed97986118450812fdd7e9ba202 LoongArch: Add preparatory infrastructure for kexec_file
date:   12 months ago
config: loongarch-randconfig-r2105-20260919 (https://download.01.org/0day-ci/archive/20260919/202609190905.OZTcO07l-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260919/202609190905.OZTcO07l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d162feec6b6e ("LoongArch: Add preparatory infrastructure for kexec_file")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609190905.OZTcO07l-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/loongarch/kernel/machine_kexec.o: warning: objtool: kexec_shutdown_secondary+0x60: stack state mismatch: cfa1=3+0 cfa2=3+16

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
