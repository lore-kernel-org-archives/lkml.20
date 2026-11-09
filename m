Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794256269;
	b=kOeH6DknPlqAbElTn2JLsl3WwBf5Q7R+OrwGKo5V3nZTpczvP4Zeg9sp0ywY9BFBcIkU
	 TESzrmoeRLn4eBRk7rgmCXRtHWactIpuulwPeSHipU9OP9oHt709AKpdRTavfMrR1l7Rn
	 /XaHeZctay9O5uFxJEj48y0zlI7MNbH2qGqGC29nK9WI/KSo2L8AdvlGldF4OxyF4eFbR
	 g0WXtuCqKVvAYWqN5Hz2tUEO4usuhyIQlf0Z5KSenNRYfhbrY8zwAuCLF9mCIALX4Y9L0
	 CkFMU3AUAgUIoZDfQkoeUkciXOTrzWoc06SCo1kAHzlkAG6Kj0zm/FhG6eQqLty+8WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794256269;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=koKg/VGMDifDAmaoIYwjdD/ZI8QKZXVCSNPTeoBdGtA=;
	b=gbnyFtaskaE3GDLCZZmc4ZVjaNqh7fnlAz5AMyy2FmWXkmFNk/7ICzXPtek9xIgyV800
	 pFSlUJ6PBQl9i1JkQmrfVJU7BI4XxecUAX65mwnP6tM3bxsnCKHQApa860E5DhyMyD9s2
	 rrrp/HYTDty//yed3UTqTG3mrgfe2n6T2JiDZ5d3ZFUT1cbAUVQrz9rTLBEqDmH4QnM9v
	 bMK2z6Hl7RhQw6oSWZX0L70mGjiLT4NLDpL7WzwmJSFzpBfgLb0HTVuj7e+XZ2Vfkt/E4
	 yh83X14x8j8aJXE6VyblVdHCeBefOcakniLqxjDffwtE9XlJuW5kSiraR5cYbzxbY0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HZj0BbLj;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BF2606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 20:31:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30BF2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HZj0BbLj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794256268; x=1825792268;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fNUqN4AQUG0ApAUwQCliFpkAqDMc0SHm6R20DFw7CXQ=;
  b=HZj0BbLj5f2+Ja5kpOEGTGa0R65oSc7repfLq5xTQXFNUqZJgpr8O4t6
   ECgtzKxo9uV/4ficPl9lMOjHti9FwpIzJBLabFHIZf34R2Y9+GK6Ye7HS
   DOg1ivgX09uOR3hOe80JAUWKHjUD8Bso6be3Kbghkky4gbftVbiMCj4Vj
   sKY+UFfWGDgLCdtV/29ZBOA4ANFjjoBB/pBi3V0yPuhcnVK0RiBisB6EX
   MfVaFCsD2lU8pSk8oOd5WjAdkPgOfy46NrodqzZDWXtD1Uv0niJQ+zN5c
   rmRopAwV1Omfxu4ZJraK8e2ERAsFOArYFCalKQiO1fNz2RqEcVK5t3CF3
   w==;
X-CSE-ConnectionGUID: MGgKSpZfTFSOvCYrnPOU1Q==
X-CSE-MsgGUID: aB1u+E5NTlGv6rqTZn7opA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2986497"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2986497"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 12:31:07 -0800
X-CSE-ConnectionGUID: p20qYfrySbKkT5sWgfe6lQ==
X-CSE-MsgGUID: CLU4JFBtS+qKx5/KNT19TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8295660"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Nov 2026 12:31:05 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQW18-00000000vI3-0RSh;
	Mon, 09 Nov 2026 20:31:02 +0000
Date: Tue, 10 Nov 2026 04:30:22 +0800
From: kernel test robot <lkp@intel.com>
To: Laurijssen <lauserve@gmail.com>, linux-kernel@vger.kernel.org,
	pjw@kernel.org, akpm@linux-foundation.org, jannh@google.com,
	brauner@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Laurijssen <laurijssen@protonmail.com>
Subject: Re: [PATCH] SYS: add utsname_set_field to reuse code in
 setdomainname and sethostname
Message-ID: <202611100455.BsA8k1Nb-lkp@intel.com>
References: <20261109114421.8414-1-laurijssen@protonmail.com>
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
In-Reply-To: <20261109114421.8414-1-laurijssen@protonmail.com>

Hi Laurijssen,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on brauner-vfs/vfs.all linus/master v7.4-rc2 next-20261109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Laurijssen/SYS-add-utsname_set_field-to-reuse-code-in-setdomainname-and-sethostname/20261109-124421
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20261109114421.8414-1-laurijssen%40protonmail.com
patch subject: [PATCH] SYS: add utsname_set_field to reuse code in setdomainname and sethostname
config: arc-randconfig-1001-20261109 (https://download.01.org/0day-ci/archive/20261110/202611100455.BsA8k1Nb-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261110/202611100455.BsA8k1Nb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611100455.BsA8k1Nb-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-linux-ld: kernel/sys.o: in function `__do_sys_sethostname':
   kernel/sys.c:1424:(.text+0x2c40): undefined reference to `utsname_set_field'
>> arc-linux-ld: kernel/sys.c:1424:(.text+0x2c40): undefined reference to `utsname_set_field'
   arc-linux-ld: kernel/sys.o: in function `__do_sys_setdomainname':
   kernel/sys.c:1457:(.text+0x2c80): undefined reference to `utsname_set_field'
   arc-linux-ld: kernel/sys.c:1457:(.text+0x2c80): undefined reference to `utsname_set_field'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
