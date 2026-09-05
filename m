Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA802D73A0
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 05:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788584943; cv=none; b=L/q3q7Z2/zWfqmV2eLcc9T2iC6UNnpamr3bmGtrHc8UnvCW74tNvqpqLUlpmkBBEl7UjjGY2codpEQwgaebwdar+l7DrQr2LbZrqLzywYJhYUI2DpPyriQYYbJ4U4I2OrsjV1HR1TB9ZqFxkobBiP+Ti9UoYqmZWFKn7cvr3+iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788584943; c=relaxed/simple;
	bh=R/WlR+5WhojrQIVjjVAqZ7/vKIW6bTsqhfcxstYRIf4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Sj5nBfNA6hpVcx+OCsb1fjRTjoNTXovAAUvNDODoSoAxbAWiDVqxWIdh09qD5m+geZeUNKgKXD/2iyrtw8pDQKjKdTk4YqAACWY6wHd4gcopWOlM/264SXgD7i+ECdnWTyGsC+OuquER5JOuh2896nTs2CbNJr8ZwTplomzzBZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NaVhQRF3; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NaVhQRF3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788584942; x=1820120942;
  h=date:from:to:cc:subject:message-id;
  bh=R/WlR+5WhojrQIVjjVAqZ7/vKIW6bTsqhfcxstYRIf4=;
  b=NaVhQRF3ySiEPekxwHYKOS05MRqMC3Wy391ru87pZjihc2ngkXWzb7jr
   h59SxmicD4zXLjd8+KKaAakbWvX3/vY6N2XWglYUStrJrdvGc4hN/IzGn
   K4GYLVvLdmOr5cAFA5tCF8wbCmSRMVjXooN2kShTE8lsegbUkNs2kvch7
   X7SVJtvVGhksbUrX0rboN782SCvOSpfYYwa8OTwS3BlZZyfodY/9Ycwfu
   uaQ/SwibDXUvyvgDsDStLj+DORgzJhF0R+wBaGiEWFq/PTj8shqTtfFwq
   vS2exvbLHclwBRIWvMKDZy+0u5dHYnnIah5NMMp5wOnFVApTc08MBlcn4
   A==;
X-CSE-ConnectionGUID: TTQVyvkfQRiSN6mtB35JNQ==
X-CSE-MsgGUID: xXFFrYuIRme2Nd5v3RxWtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89008085"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="89008085"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 22:09:02 -0700
X-CSE-ConnectionGUID: sQo1poxsQwS9tV96SjkIZA==
X-CSE-MsgGUID: GZ0jPC60SHWPc1EaqDUY3Q==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Sep 2026 22:08:59 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2ie8-0000000003d-3Cea;
	Sat, 05 Sep 2026 05:08:56 +0000
Date: Sat, 05 Sep 2026 13:08:28 +0800
From: kernel test robot <lkp@intel.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Sudeep Holla <sudeep.holla@arm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Alexey Klimov <alexey.klimov@linaro.org>
Subject: {standard input}:2362: Error: Insn bl has an instruction
 mpyuw with limm in its delay slot.
Message-ID: <202609051329.lSNL4i6x-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi Vivek,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4d7d9486c04d917265f64c55bd23b2cc4fe7749c
commit: 6c2fd7a71e7ab490a0a9d591486d923712012f59 firmware: arm_scmi: Increase performance MAX_OPPS limit to 64
date:   9 months ago
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260905/202609051329.lSNL4i6x-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609051329.lSNL4i6x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6c2fd7a71e7a ("firmware: arm_scmi: Increase performance MAX_OPPS limit to 64")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609051329.lSNL4i6x-lkp@intel.com/

All errors (new ones prefixed by >>):

   Assembler messages:
>> {standard input}:2362: Error: Insn bl has an instruction mpyuw with limm in its delay slot.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
