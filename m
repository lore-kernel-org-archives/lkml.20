Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C0D2ED141
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 16:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789835124; cv=none; b=cecA+ZhF5+xNSxwHpk3YYtUnQgj22lpWcEtT6lJdPMzpuBfIUE2uR66W/Dy5w22fVX5gfteZWMaj0gBJWWWKCP6vXhjSrzqYy9x0oOqnkj/8AGb+W77is4UdZWb0UtHbHNhqa1kFTDTD2Ti3qoN03uJwcXCKSYcpphFFU/lj87c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789835124; c=relaxed/simple;
	bh=eeSEjOBulGEufJlTnoQh4/dxpeNuGHOfib6T7s4m0kA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nxuEj6Yvo2Rqi8qtvvBOc86+8fbPv/uQJdYfoCwPB990Vjp4Hu93GL8vmx/dcCFjXidghhBfQ/IFLnlqgbGkG2gwtE1TFLeRAI/7ywd6I+M7eMaEbv76K6Wf9+J6dtX/YavHJ9VnWgLFPpPOve32rT2N7KNLuO+jyOgqQu/HYFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TxmAwVzJ; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TxmAwVzJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789835121; x=1821371121;
  h=date:from:to:cc:subject:message-id;
  bh=eeSEjOBulGEufJlTnoQh4/dxpeNuGHOfib6T7s4m0kA=;
  b=TxmAwVzJSPb65tmOXT9mwGJ4gel10aY6T410FoeAGT26aC8fu7KUlmcM
   536Idw5FGeackxELAHa/kUCAvvyiXa4lUBhAex+l1NKUAfctXOOKuyR0d
   nU6d3fAV92CRzptBRj9ve7zRBBxCAIJUMKfABP5iiqYsqPJ3WAGG6XN8q
   /ibin0Qt9sdcCbESi4XOMdlfrgAaBchqYKj0rBvcET7O9tFnidY+AAcI5
   6JwPjs4RdsvLGeTdnQamZma03wFKGO9kxWBtIZIHZRQbP9NWqMjKSR6H+
   TmxbMYJGVbcn0jEPdSTiGjuTo92ZWXGOui/U8ID3LYvY6MO4mcqrIuQzV
   A==;
X-CSE-ConnectionGUID: Z7Jli/WVRwGQzXOjUVTV+Q==
X-CSE-MsgGUID: j6DH1lDFRlW9E1zUAZZnYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11910"; a="872419"
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="872419"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 09:25:20 -0700
X-CSE-ConnectionGUID: FCjgV7AcTgeb4B8lYf7I9Q==
X-CSE-MsgGUID: LMDYDgN+RIyijIhoVDko4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="272185906"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 19 Sep 2026 09:25:19 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7xsL-00000000B6B-0C78;
	Sat, 19 Sep 2026 16:25:17 +0000
Date: Sun, 20 Sep 2026 00:24:47 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86:cpu] BUILD SUCCESS
 2711d67bc3a776abcfc651ad87be5d29ada19166
Message-ID: <202609200043.Q5PjUGg3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/cpu
branch HEAD: 2711d67bc3a776abcfc651ad87be5d29ada19166  x86/cpu: Don't transiently clear the boot CPU's capabilities

elapsed time: 68m

configs tested: 17
configs skipped: 147

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386                allmodconfig    gcc-14
i386                 allnoconfig    gcc-14
i386                allyesconfig    gcc-14
i386    randconfig-2100-20260917    gcc-14
i386    randconfig-2101-20260917    gcc-14
i386    randconfig-2102-20260917    gcc-14
i386    randconfig-2103-20260917    clang-22
i386    randconfig-2200-20260917    clang-22
x86_64              allmodconfig    clang-22
x86_64               allnoconfig    clang-22
x86_64              allyesconfig    clang-22
x86_64  randconfig-2100-20260917    clang-22
x86_64  randconfig-2101-20260917    gcc-14
x86_64  randconfig-2102-20260917    gcc-14
x86_64  randconfig-2103-20260917    gcc-13
x86_64  randconfig-2200-20260917    gcc-14
x86_64             rhel-9.4-rust    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
