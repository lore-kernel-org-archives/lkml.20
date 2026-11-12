Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794504099;
	b=hgWDE+FAOpv229tKjk95bUXpj+6BeWk0NwYMFe0ZBiwr5dmXp6Go46c79bRSeT5SrWsa
	 rFwHp6y9hy2xElCWymFgJ1lrVy7goTS78I0rFVwdfqtiwV9iolzeZWfranRQufzjAJace
	 +xo62yzQwzJ65OSd0QC+FfYHa2004KKf4VMegE1xYovwSoJMnlYS0bEo3VWmjx2bf7osE
	 R8sSmO4qVDw1ixi5BP3R8XCAimR8GwlIWffFXZXaujMXPmVXjF+dBTRR8+nhAo509cWEH
	 /SuQdlMv/LrkyGeBKFNPIdQUo724wujLphoMlSYLdWF0c14QejhHxnp9tcjr1gVXsHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504099;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=GzzLhdvVHVhImWIaPXcpvvtgW/7/G6PUPzkwtovFrgM=;
	b=OCDvVPfMaS5jwq8HqqxSEAyFRVUeBop3lU436yoFnjW5NdUi7B90yskk+KpP4dNdS7GO
	 yxkmAAzISkDYYcwSUIfY2DX6qJsnaE2XzOgHhqlJcjYNzknSWYlUtnyYR72p+wu4muEFf
	 QRwENa/AD/Rymre/mFeskFA938NKm25x7MZsewfJCsdDtkUsmIteLbD78/jvBDMhJt977
	 Xn1TLHBk2CgfHqHmlzO3bPUk1vb8iQJ85Hi0HdNCCZvmAcLExbWwwzwjThHIHpOrIVtYQ
	 KkoK5L/C1L19wBWmxQ3pZlmsar6PdI5sc5oyMmIN3BV1KMSM/oFf5bn92nEjdPwYxVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZuNWy+NV;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A36606A32A;
	Thu, 12 Nov 2026 17:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70A36606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZuNWy+NV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794504098; x=1826040098;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uma/eEaGwRBtblC8rBaaMIa/ZWcOfIQeuzdmTFZMvVw=;
  b=ZuNWy+NV7HBYEGQbOF2mnYZ/YF9Cmk4i27RrL7fQ5r57Fk/rqmHPHZCW
   NyoIwwQY9SRpJ73udGkFPv04fX+yLH7w+F2QYv4LWl8ataDXEzJ9puuYk
   Hsjw+wnI4ILdCe8dn+6CkjVtfuuHJHpof1d0dl9iLKZ8WVAiok8YWQpio
   WVl1uJwTjcsI5YCQei6AQbz3UlITj0CvhynAfcMRk8e+z2sYjhIyw3666
   wJszOiv2SdwoBjQ1tu3XrkG9Spzkqq1yCHqdyIo0nhLfM1uiiS+d4vBpb
   aSHPHBg+rSbwxg/EJQ9ujnHKUCJDZNHMIgV6v+S4/MZ/lrwJFMBUsDLgn
   Q==;
X-CSE-ConnectionGUID: Ioq1poOeTFqhaBivAGrpIg==
X-CSE-MsgGUID: KORR6OsvSSqSUunf5OXu7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3196846"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3196846"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 09:21:38 -0800
X-CSE-ConnectionGUID: CzwW3/CgRYq5vVebJQA04Q==
X-CSE-MsgGUID: SyVchUWYSNmCAtOxVXU2yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8547261"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Nov 2026 09:21:34 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRYUN-000000011qF-4BY8;
	Thu, 12 Nov 2026 17:21:31 +0000
Date: Fri, 13 Nov 2026 01:21:14 +0800
From: kernel test robot <lkp@intel.com>
To: Moteen Shah <m-shah@ti.com>, conor+dt@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, nm@ti.com, ssantosh@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, u-kumar1@ti.com, gehariprasath@ti.com,
	m-shah@ti.com, vigneshr@ti.com, afd@ti.com, a-limaye@ti.com,
	y-abhilashchandra@ti.com, johan@kernel.org, kees@kernel.org,
	jm@ti.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/4] soc: ti: k3-socinfo: Export SoC registration
 helper
Message-ID: <202611130145.c9PExnQn-lkp@intel.com>
References: <20261112081047.1550471-4-m-shah@ti.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112081047.1550471-4-m-shah@ti.com>

Hi Moteen,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v7.4-rc2 next-20261111]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Moteen-Shah/dt-bindings-soc-ti-Document-the-ti-tda54-mcu-scm-conf/20261112-134044
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20261112081047.1550471-4-m-shah%40ti.com
patch subject: [PATCH v3 3/4] soc: ti: k3-socinfo: Export SoC registration helper
config: x86_64-buildonly-randconfig-1005-20261112 (https://download.01.org/0day-ci/archive/20261113/202611130145.c9PExnQn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611130145.c9PExnQn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611130145.c9PExnQn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/ti/k3-socinfo.c:17:10: fatal error: linux/soc/ti/k3-socinfo.h: No such file or directory
      17 | #include <linux/soc/ti/k3-socinfo.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +17 drivers/soc/ti/k3-socinfo.c

  > 17	#include <linux/soc/ti/k3-socinfo.h>
    18	#include <linux/string.h>
    19	#include <linux/sys_soc.h>
    20	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
