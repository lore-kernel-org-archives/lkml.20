Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793980617;
	b=zeQKGQB3Kq1ByKe1akKROoI7qZ+a1DA8mECOtVmfoH+2W00waMMZ+0jp+VrI1kLhCKx6
	 khkYToXknWPCWAXKxzwbuqmYA7Uo1n8DaITKOUYlcm3iZc46/B+E4UrAYc3HxlBZIjInq
	 v+kCeDI424C/H8iHyZNieJGLF4FZmoqD0iNKwhpu7CAfm3q6rH3dmwharNQladDKqtR3Y
	 J99IG/4VxITC9jMEUMbV6KUZMawY518UKZCn9elUM5zB9T4LTg6QEhwBnN/VNJnISqkut
	 KKOaFDTH5tbuTTd4BJhtXZvMYnrftvy3pD9yAjERtKc2YKKQXNzDiAs2cqSZ6r0x+qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793980617;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=avbA/FGOKdwvskc2UA8yTZJwUAS5mgtOwGeeKk8EOZI=;
	b=p9F1VPNc6NxR9WxH6YERV5mLI1ZWpDjL1i6IIhbRRgiauFj6OSfzpw4CFilAKjE8eZS6
	 UrGItjuXE/kiwEvAUk23w3qMHE+nXw3OHXTCTMOwUk07KmpN8h9x54RZRcEIXX5i7uGT5
	 fbv4D7FCoJJ4f/0Cqx9194gjDv5sN0+jzg7MgaBrpXaL7niDQDl1aSrZ4UftjjZ+v7JkO
	 oWYIS5bxYyg9aFprDSaXM+pH4djg2IWBjKB0JWWbeXhsNW8R4mmOFsU5K3VDWZUBOpFjz
	 kfIqcauuqjJbbVp7s9gqhvGkilgVwpUGdheQprviV7FtuGTvGWFBiHosdnqXL2mdRLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RvHsUYaJ;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F7C606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:56:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4F7C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RvHsUYaJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793980616; x=1825516616;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zo0dl6bDFeSqtNSEh0fXIQg8Cz84Zo6FM2qDtEfbCQ4=;
  b=RvHsUYaJgN9u5BUPbkAvh+qchC7wf22KKI2iwYh5nVrr1SC6xNcFS7x3
   J5+BBXDjhihsl59D+ISjdy6EBChvJxERq98OkU72ec64QcdfAzCIZeBLY
   G2CmuExL7JK2Lf0Wt8TZ4z0ddrr1G+EVZkfNcuW759SfQLyXj8Quo55g3
   iYytnsdppVxMcepHUowlbsF0Bm8tVVseoqVxfJrr27ItkjbQKuUkaB82f
   cYvVwPlsQHoJZJ2IOmJmYyV384hhnun8T1zn5dirbQ7sghOfat4Mdksdx
   a2hHHluZIy7NBiA3iJjHDBezyQbTvktwcG8M0po+4tqf1yhzhx12c3rib
   g==;
X-CSE-ConnectionGUID: TIm0YoN6RnGkAFVo7pEQgw==
X-CSE-MsgGUID: xGPUS3p9TqCHIzw31bMZeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2896173"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2896173"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 07:56:55 -0800
X-CSE-ConnectionGUID: 1XxeQ7MtSMef0cLVrnFgwA==
X-CSE-MsgGUID: FZwEEPXERoqN0QgFuNM8lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7426578"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Nov 2026 07:56:53 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPMJ8-00000000pTv-2zIu;
	Fri, 06 Nov 2026 15:56:50 +0000
Date: Fri, 6 Nov 2026 23:56:05 +0800
From: kernel test robot <lkp@intel.com>
To: Laurijssen <lauserve@gmail.com>, linux-kernel@vger.kernel.org,
	pjw@kernel.org, akpm@linux-foundation.org, jannh@google.com,
	brauner@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Laurijssen <laurijssen@protonmail.com>
Subject: Re: [PATCH] add utsname_set_field to reuse code in setdomainname and
 sethostname
Message-ID: <202611062313.QD6BbpXI-lkp@intel.com>
References: <20261105120751.920311-1-laurijssen@protonmail.com>
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
In-Reply-To: <20261105120751.920311-1-laurijssen@protonmail.com>

Hi Laurijssen,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on brauner-vfs/vfs.all linus/master v7.4-rc1 next-20261105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Laurijssen/add-utsname_set_field-to-reuse-code-in-setdomainname-and-sethostname/20261105-130751
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20261105120751.920311-1-laurijssen%40protonmail.com
patch subject: [PATCH] add utsname_set_field to reuse code in setdomainname and sethostname
config: sh-randconfig-1000-20261106 (https://download.01.org/0day-ci/archive/20261106/202611062313.QD6BbpXI-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611062313.QD6BbpXI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611062313.QD6BbpXI-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: kernel/sys.o: in function `__se_sys_sethostname':
>> kernel/sys.c:1422:(.text+0x3d5c): undefined reference to `utsname_set_field'
   sh4-linux-ld: kernel/sys.o: in function `__se_sys_setdomainname':
   kernel/sys.c:1455:(.text+0x3edc): undefined reference to `utsname_set_field'


vim +1422 kernel/sys.c

5cacdb4add1b1e5 Christoph Hellwig 2010-03-10  1421  
5a8a82b1d306a32 Heiko Carstens    2009-01-14 @1422  SYSCALL_DEFINE2(sethostname, char __user *, name, int, len)
^1da177e4c3f415 Linus Torvalds    2005-04-16  1423  {
58c79d6f0053050 Laurijssen        2026-11-05  1424  	return utsname_set_field(name, len, UTS_PROC_HOSTNAME);
^1da177e4c3f415 Linus Torvalds    2005-04-16  1425  }
^1da177e4c3f415 Linus Torvalds    2005-04-16  1426  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
