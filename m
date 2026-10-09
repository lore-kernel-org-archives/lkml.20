Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0150A2EEE83;
	Fri,  9 Oct 2026 05:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791523239; cv=none; b=sBL5aJ2hWN1XeIxdlnVgiNY5etr/Sy+e+2n/Y+FYqj5P8Rh4Bc1e8VhdKqhZbPF6q13AFhEl6XDUzxjIjPHTX+nJOKYFua51jlFfUGtvrJNW/C896MUM4k57yTernvwbV6pncSMTd/bI/6qdLFM77gvzCFNmsoQGT9eKPb0IASs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791523239; c=relaxed/simple;
	bh=xhtmVVGd5YK/g4pvEYSi0j/h86N+dnT8EWTbUFDzkeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sqxSCTiyKvIQu/JH7eXCxU4gH4LJ8MUp7QhjMccnM6iuKzmE85Ye+ARBlUvg/uQI/dnXMy4/j+NakvZtLIjHgCjJzPHKlPWyAQFoufPXVENM4pgN6AB6sP0mRS51vDz67CR7W2nOixdrYfs7I2wdOTuqNY508OsGp0IpWztvjFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gAPlqepK; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gAPlqepK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791523236; x=1823059236;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xhtmVVGd5YK/g4pvEYSi0j/h86N+dnT8EWTbUFDzkeA=;
  b=gAPlqepKYPVDnXQ9oTl4KoL72UtDiYrfTVRBep8zofgfgCqKiI1j+v1U
   kR3nBQTVXe8ib37KsF9NQ7vEiXuwlaxDTW4tllH7m8+lQyany1LOdVz50
   qHG9TwSwTvnJhyl7wMJwYcwX7zVO1oUE9DD7v9jALKvyzAMsdgcFP19Yh
   5MGO3YIDgFtQxZ7yHPolBHIPOw/q0i7EMv3kmgFtdFaZ39L6887dPjfr1
   ZE3cuMrkwSKgOrA7bZz89l1JS3DzCSGJcw1RHtLWc1F50A7hEc7/H7XT7
   IVjlo9Py+3lE8A5EjznqxNjtI1z8ioUPJjdudt0abNa4To++0a40iyR3y
   A==;
X-CSE-ConnectionGUID: iRJpPsStSXmKx5dCSGuW1w==
X-CSE-MsgGUID: MeDIkewtQeGmfPDw/6lM1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="324343"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="324343"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 22:20:36 -0700
X-CSE-ConnectionGUID: ypCTQnOlQrOVDUGGrwXC4w==
X-CSE-MsgGUID: vaDae3PmR6CFJTkuE9r9ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="181330"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Oct 2026 22:20:33 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xF31y-000000005Ls-23w3;
	Fri, 09 Oct 2026 05:20:30 +0000
Date: Fri, 9 Oct 2026 13:20:07 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-mm@kvack.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mike Rapoport <rppt@kernel.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Oreoluwa Babatunde <oreoluwa.babatunde@oss.qualcomm.com>,
	Wandun <chenwandun1@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH v2 2/2] of: reserved_mem: allocate and map the
 reserved_mem array early
Message-ID: <202610091317.jGUqplBp-lkp@intel.com>
References: <20261008152403.766439-3-m.szyprowski@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008152403.766439-3-m.szyprowski@samsung.com>

Hi Marek,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v7.3-rc6 next-20261008]
[cannot apply to linux-review/Marek-Szyprowski/of-reserved_mem-group-allocation-helpers-together/20261008-114122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Szyprowski/of-reserved_mem-group-allocation-helpers-together/20261008-172400
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20261008152403.766439-3-m.szyprowski%40samsung.com
patch subject: [PATCH v2 2/2] of: reserved_mem: allocate and map the reserved_mem array early
config: csky-allnoconfig (https://download.01.org/0day-ci/archive/20261009/202610091317.jGUqplBp-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610091317.jGUqplBp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610091317.jGUqplBp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/of/of_reserved_mem.c:27:10: fatal error: asm/early_ioremap.h: No such file or directory
      27 | #include <asm/early_ioremap.h>
         |          ^~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +27 drivers/of/of_reserved_mem.c

    13	
    14	#include <linux/err.h>
    15	#include <linux/ioport.h>
    16	#include <linux/libfdt.h>
    17	#include <linux/of.h>
    18	#include <linux/of_fdt.h>
    19	#include <linux/of_platform.h>
    20	#include <linux/mm.h>
    21	#include <linux/sizes.h>
    22	#include <linux/of_reserved_mem.h>
    23	#include <linux/sort.h>
    24	#include <linux/slab.h>
    25	#include <linux/memblock.h>
    26	#include <linux/kmemleak.h>
  > 27	#include <asm/early_ioremap.h>
    28	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
