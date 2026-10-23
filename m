Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743775;
	b=UOkv/J6tfEcs/Kpgz1/9ZkAuVqmGX/6gN64eTCG3+XsHdtQyd/ngAJKWXHdxVmdl8Jod
	 RQiDhBLCjNsEwpin5bCIdmflXfok8Ws48TwSMLmixm6iXC6R+xWK4k4mTTZVBxhP9PJo8
	 C/9OfDc3RxJ0vj5RwIRwGfyGHnj/Grh/PCIf4nWmqpzoVIDfNknsH6WiEGZ/hv2nRmM7b
	 HTMUldZnnfNpKuzfiWnPjfT71q3I0zTcp+2LL/fikOo1Jc0COzHQ57q1EGweZru6y5rT4
	 gwln1Fj8YwfG4f7p71MTlJYIL+yUOt7KiG+0GOCwGfEJTP9lZb/6Vz/0hP2/S2gfDBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743775;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=rFwRLuEL800954vZgLUxCOGD08K0kEaYzdU27GRt4rQ=;
	b=W8kwcihdf7QFJw6qfE/wMcKAUP0z+sXOHtFLPMsc+lYTzcrXtQLjd0z+ID+un+bUKhEA
	 wwXZDXXURmZRq9SlbMQg2F470Ge+B2UPAgyMg9JQP2dRW1IZcpkUGg9+0hd0ObApXj+BP
	 hPu8lKj1YLSnHtPQeY2s8FfFPt/8AzkwKkX9WU7H1xd86wJie0rUaC4MWMHWnw/ub6y28
	 Ac6Jes5G4yWT3dQgud2LbjQ15SmgHdXAfcKZV3Lmz0ov45pHSABNKqRiaHJKanVVE+6Qj
	 uRvmGQh6YDwxR5RFJPkiM1iG3yklF+7xsD3HdAy/JWRRLt72ikgQCG1knHCveEOvd8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Cw4EoFat;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55303606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55303606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Cw4EoFat
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792743774; x=1824279774;
  h=date:from:to:cc:subject:message-id;
  bh=te2N4EHsIew9AcDES7tPdYN3OKpGCFwcOOw9pYOjA0Q=;
  b=Cw4EoFat4vU8fRpqfOidYQVX/pw9OSOrw2MZCrigzKmKtupshDUEyT9+
   vh0jJtNL1thzZAv9k3N7DjcZPoWYNVxzuOD4V0kQTqtYmdyiXolTXihU4
   h29t5d3EIan8lSMUyllPwNQp9j+NDD/qm4zFI1PIRrf+lPM/y5t3QmBhD
   6x9mQw2aCTsxcOKTJjbti4b1RBzqimjb3nGiSU7gUN/sDCm5fNNo4qDgA
   OJHlSFWMZddijP2gCpYxj85d0IiDtqwVYUaraj7sy+pPCtAehjid1QpfO
   4vYmnXiZErR0WOme9MExWvlUVxltJ90BUevnxoElfvChjwYKpN1K+J1wS
   w==;
X-CSE-ConnectionGUID: Sq4cXR4dT0ezdK/69CBcCw==
X-CSE-MsgGUID: 1RlYC+G8Rp2hvI0JkD/nPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1381912"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1381912"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 01:22:53 -0700
X-CSE-ConnectionGUID: vfgmHO08SxmQCWMjUHzbUw==
X-CSE-MsgGUID: sy4UbMw0RPWduvj1mvU1PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3619693"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 Oct 2026 01:22:51 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKAY4-00000000SLo-1Rf0;
	Fri, 23 Oct 2026 08:22:48 +0000
Date: Fri, 23 Oct 2026 16:22:17 +0800
From: kernel test robot <lkp@intel.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: error: kernel-address sanitizer is not supported for this
 target
Message-ID: <202610231657.7LxpWzaj-lkp@intel.com>
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
head:   7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
commit: 73b741adb264967093ef4eb59905618a7e0d0de0 rust: Add PowerPC support
date:   3 months ago
config: powerpc-randconfig-1001-20261022 (https://download.01.org/0day-ci/archive/20261023/202610231657.7LxpWzaj-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 2c419645e808a6667eee9dbb16c828f77e2fd2f0)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261023/202610231657.7LxpWzaj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 73b741adb264 ("rust: Add PowerPC support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610231657.7LxpWzaj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: kernel-address sanitizer is not supported for this target

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
