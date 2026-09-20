Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363E11F94F
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 04:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789878306; cv=none; b=cMMGxjZQt56TWZcBW3O88sqHNtL+dgnLLffhYYu5q7xlciFyRCTkXzENQ8Z8/wPi0p70J4qI09jWMMtg4beO3wU0nwv6Qub8d4wMcEL32DTKejb2JiJoAN7xUQJShLCHztWjeJB5FbxFEa7pA+YpIy583QoUzfpaFb93Sk3Czd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789878306; c=relaxed/simple;
	bh=2lq7Hxrr1IPb7YPtAL5VfN9rTd/2TgU4gNtD3m4u1fU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bUXe3I3Omdb+jJappxwZOf22YCZl8g+s4HFrvptBRzgzZhuRteqcLMzgIZ8JYamTbScjtrqAeaOENMKjjte+vueyS9G0GaNMnpSAalTyh4YJPKVBjE617gSmgWL0PoYaWlUS3KaIQcRQVqds9xnVNWYR9JD6RzA1hVfF/mBVHJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i7qUrjpY; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i7qUrjpY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789878304; x=1821414304;
  h=date:from:to:cc:subject:message-id;
  bh=2lq7Hxrr1IPb7YPtAL5VfN9rTd/2TgU4gNtD3m4u1fU=;
  b=i7qUrjpYIto1iflBYTfXNy8uX9IeFfsym2cse9VHFqfuV6eaTClbLr6n
   aRBBJeoJXEKs4URPpGI/snFaziysHbQ5yiZnfXZeZGACgsR/g8DfLsWbZ
   HBXFH5edSd0N0Xz30+7znoZ/V8spOe1IX7Ml0u9P7xLoF9BAMZOz65OES
   QAhthYgQSaR6IOkXpgnOE8s7DcCxEpT8IX5y3v8voXO3owS16rk4gcKx3
   9tVaG/7u9e7B87ExEdthp/hRzOMGt21ciMra+RXajnSs69lQACHJUcPDB
   rKRAAbv+nfEncBKlVg3tncjQfrzzB0TqaZceh4xJhFOC2W/fujWCzZ3FD
   Q==;
X-CSE-ConnectionGUID: 48n9fGE4R4uySGihX0hKNw==
X-CSE-MsgGUID: w/6bMEJoQZu5kryaC3k/PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11910"; a="100984298"
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="100984298"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 21:25:03 -0700
X-CSE-ConnectionGUID: SE4gxFH+SYClWPF1KWH6sA==
X-CSE-MsgGUID: wpb2ZenDRnuGBejKuXLuSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="3202126"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 19 Sep 2026 21:25:02 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x896p-00000000Bpz-2nNM;
	Sun, 20 Sep 2026 04:24:59 +0000
Date: Sun, 20 Sep 2026 12:24:47 +0800
From: kernel test robot <lkp@intel.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrii Nakryiko <andrii@kernel.org>
Subject: FAILED: load BTF from .tmp_vmlinux1.BTF.1: No such file or
 directory
Message-ID: <202609201259.nAjryHrZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi Ihor,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f259f446f5198d98e13756d2cd531812a0ad3064
commit: 522397d05e7d4a7c30b91841492360336b24f833 resolve_btfids: Change in-place update with raw binary output
date:   9 months ago
config: nios2-randconfig-r1309-20260919 (https://download.01.org/0day-ci/archive/20260920/202609201259.nAjryHrZ-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260920/202609201259.nAjryHrZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 522397d05e7d ("resolve_btfids: Change in-place update with raw binary output")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609201259.nAjryHrZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   Complex, interval and imaginary float types are not supported
   btf_encoder__encode_cu: error encoding base_type (core_id 31): -1
   Error while encoding BTF.
>> FAILED: load BTF from .tmp_vmlinux1.BTF.1: No such file or directory

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
