Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571C5530E06
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790178877; cv=none; b=JIQxjufnQ5JvL2mWPRZJGVcGYPEW93IrmfpTf/4O9YA/QHnrZxXcu6YnZyab6Pz1bPN3pcYH5FUh7O8K8t8B1my0Oa3g8EDTULqzsUygk8FBYcibYrvLnO6X4F6Yg6F1Rb38rAKIaMhZMZPd7yM9dK4a1U0MTvdZdy5f80dh2BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790178877; c=relaxed/simple;
	bh=pTdwXlMaGi9z9IMDIuQ2m2T5pI9pak/qH4Bj3Nk93Go=;
	h=Date:From:To:Cc:Subject:Message-ID; b=D/4FGJvknQh7t0hGnIsEtPSqag972zvVhYjsKvO9zBwrdiLIz1Pwtn6ApxTqIQv4bjkXI+QTeHt5D+d3qMdkG7FI/3mRuEuPmXLJ0rL7GUg8Kj6HNHlrFMVgaBqoa2/zH9JkIzudq+9etMPW6QsyJ1BCRqOc8/7ynhQFJxWSc1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gjSD9yP+; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gjSD9yP+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790178875; x=1821714875;
  h=date:from:to:cc:subject:message-id;
  bh=pTdwXlMaGi9z9IMDIuQ2m2T5pI9pak/qH4Bj3Nk93Go=;
  b=gjSD9yP+B67Ah+ys8clCWDB9GJLDX29DhabYAMTx1ShKCQUJGOfnYeHk
   tILViuHibbfO0M0JcLImmCQPWS+CeFtqr8C553W8yI/y4IZkPlMWPfnrK
   K2YFvKHtK1j6+rktRonQQ4bu0O+QrJc9WC2e4FShrKdeKolkXWj0TAEDg
   TpW24Yl6lQbgeYG0agLV6vzfGstoc/XLjldaZ7/bHK2CVYSj8NT6v8Emi
   qKXHUdtvewsuko3YjwRf+XTUOe/MTNPFNT1QI38eTu56J0lmJvsdnF5m+
   zLKI6PNpJYcRuNRr29LbZDCrDVm1Bo36gNt2ycxMJz9M1OdlW0eB8CMVV
   Q==;
X-CSE-ConnectionGUID: z1Tb94v1TK+THMcIk69pDg==
X-CSE-MsgGUID: 7JPs2qOmQjq2vvSQVXlPJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90914251"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="90914251"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 08:54:34 -0700
X-CSE-ConnectionGUID: L5yYdq7NS9KAnEWPS69Qug==
X-CSE-MsgGUID: 0S4xCikSSlekWS4B2Dj9Nw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Sep 2026 08:54:32 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9PIj-00000000HJw-01ze;
	Wed, 23 Sep 2026 15:54:29 +0000
Date: Wed, 23 Sep 2026 23:54:12 +0800
From: kernel test robot <lkp@intel.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Sudeep Holla <sudeep.holla@arm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Alexey Klimov <alexey.klimov@linaro.org>
Subject: {standard input}:2398: Error: Insn jl has an instruction
 mpyuw with limm in its delay slot.
Message-ID: <202609232331.5WLTyoFy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi Vivek,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fe2ec83746e501645709761605c2464a44fd2929
commit: 6c2fd7a71e7ab490a0a9d591486d923712012f59 firmware: arm_scmi: Increase performance MAX_OPPS limit to 64
date:   9 months ago
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20260923/202609232331.5WLTyoFy-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609232331.5WLTyoFy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6c2fd7a71e7a ("firmware: arm_scmi: Increase performance MAX_OPPS limit to 64")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609232331.5WLTyoFy-lkp@intel.com/

All errors (new ones prefixed by >>):

   Assembler messages:
>> {standard input}:2398: Error: Insn jl has an instruction mpyuw with limm in its delay slot.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
