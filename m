Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5372F8EAC
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787790399; cv=none; b=YR3Wku/40NlK+hDBS2sTf48BMxGpOQCcBsl3eEdrR4SNsqNnKOercFzAtR+nFEZ8WDW6TkWWCkO6qdgDtm8fg5OTfCigw41ynIeQC80qwhuQhJ0SQ7rlKMIYxPtuekSR4EyC5r4meDOhEa7E23RvAlHA9jfuOG3xL6gwIwKCRiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787790399; c=relaxed/simple;
	bh=Ts2qD1/SZN24AeQ9qJOJ6utrljGi96qe530FN6JzC20=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ru9JQT3dKUM35hVZmgfvkTM+Xehq2k6SkfAOB7N1/IJJeSFMbcjwX1mcZejE+rWgXX2ci/TN02uuexxB7oBBlHTs29hJ42ekrAYyAjSgKaOkhikltQkD/arBpQmhijNmHmnYESAAIMiorv4vecJiu1wsCU4dok0uZ7vona+JshI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U2rdXIC6; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U2rdXIC6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787790396; x=1819326396;
  h=date:from:to:cc:subject:message-id;
  bh=Ts2qD1/SZN24AeQ9qJOJ6utrljGi96qe530FN6JzC20=;
  b=U2rdXIC676l0rJatwzC66G3401Uj4EDmoUJy9NWl84+bfhyH1FnIPc6c
   t7JZ084goW/npFAYKkPD060ND6spZAZf+ju9Xfvfh2Mk3KEylpR2pEm4i
   G6viRhK7UqL2R1qBn5VLur2p6kPNHPmYqBSTNOJUOBifUWTko/oKvxJwG
   LjhJ8vbaczGwZEuyYZ7ZQl4d2JbG7xb/pAV2RgtcPSVXNS8ckSECXAyC1
   SLPNyhxFl/QLqgJLPz+LzWOKlb6CAXdnIDS19hczVF1BevycTvrCALjeJ
   RmLyp+/3640tsYmLyqAmTwZEBCEgb3Cs8XLGH14yniG96kC0/Aa/NW57q
   w==;
X-CSE-ConnectionGUID: dh6G5oEuQQSmdg0QKpeYcA==
X-CSE-MsgGUID: 4MkHiVmhSjGt+UH4403Lrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="98954694"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="98954694"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:26:36 -0700
X-CSE-ConnectionGUID: LGz/FOyUSF605tyKlUT8Uw==
X-CSE-MsgGUID: yj2yIzncQdOKLsWdRABcHA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Aug 2026 17:26:34 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzNwu-000000008hV-07ku;
	Thu, 27 Aug 2026 00:26:32 +0000
Date: Thu, 27 Aug 2026 08:26:17 +0800
From: kernel test robot <lkp@intel.com>
To: Tyrel Datwyler <tyreld@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Warning: drivers/scsi/ibmvscsi/ibmvfc-core.c:4952 function
 parameter 'protocol' not described in 'ibmvfc_alloc_target'
Message-ID: <202608270829.lHI1FAdO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229
commit: 249313b3f7b5dbbf1aed31feff339ab48937a6fc scsi: ibmvfc: allocate targets based on protocol
date:   4 weeks ago
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260827/202608270829.lHI1FAdO-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260827/202608270829.lHI1FAdO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 249313b3f7b5 ("scsi: ibmvfc: allocate targets based on protocol")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608270829.lHI1FAdO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/scsi/ibmvscsi/ibmvfc-core.c:4952 function parameter 'protocol' not described in 'ibmvfc_alloc_target'
>> Warning: drivers/scsi/ibmvscsi/ibmvfc-core.c:4952 function parameter 'protocol' not described in 'ibmvfc_alloc_target'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
