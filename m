Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794258858;
	b=d0Soe2X7qtyHUwW3B5m8Lyv7nJkmi6tk1TgH4LeuSFsHhL/znrmuTpfX9xYcmV2H+MFM
	 WtGy8UBxFfBY37uS5DRwan0pHgoqVzyYwjjGjhMUkGLAucuu4Ymf6A1lw6mJyI0Xmb2Gy
	 7SpsxXdcP1F75y+bM/KdQ4OnIXEbLY5soWU9zGOwl8+AstnCCVztawm77HVPDcjVGlZ2e
	 7dZiVkFyKlkZ1Gfn06xRkly+9mbvIMbKwTmV6sIt03Nu93jYwqqQ0Z8OcBLWkr9IjNnuV
	 /zn+65vEZ758jpz5q/Y6vOrD1sZ14pwz1f5HMGGZrEMRupFR49YLL5+Bpr7Hz2phctw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794258858;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=1NtsNuj46Dzk0jkhcJogOuPuCcF1LqC48vhpTmVcMPk=;
	b=0MRd9paDid4ys8Q9iNsYFIub4ZAhjnh4OanHbrYlV2k5Nrxx5bR1Eu5a3amqErpQ6ZhK
	 NIoSgiyx+mJ5CAg7M5VmjNVIY6RgPAbflEKjE0sfRWY9SmyiIE47kxHFPqWgjDwS6gEWr
	 Ubme916OkdeX9OWDk7MZRXc0fFrW5HvHTXkmtz/8iqNBNthaV3hG0ZfmWCbTpN25ABN8I
	 wwHE/TU0g2wpCTZGLf9+kj+NF/cD0odfpe8TtfV4AureHoWPuxv8vNfTqcROMkVut1XZ6
	 s8gV1lRVbP2u0DGZrqZoneg1ij47TkNGDBavhGbXyXHOIl0D/5q0OYsntwCkmK4mBzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ePZizGX4;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E90606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:14:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66E90606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ePZizGX4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794258858; x=1825794858;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uBbJGX0ROzFfOyISdoSsTEY5cGeOybtEFrw6eFurM4s=;
  b=ePZizGX4LcbOhDoC8BPGPvx8lz1+wohv3KF9qrJcBY9UMGUWAEGneqAz
   gKF1fjODBxBWO52FY7aCHHnjX8B/olwWl+BfUjJJXQWPf4imtHQWP5aHj
   YR+LYv2Qs2F8VxGfQYCDYowQsVxg0KWiy4jADz1zWvEbKkybCw0jWo0mj
   06UbTWocolFXdkwuMmU5+IvfJUHTYTSC/+/AKlX4TwyitnQxbuaHdfeNQ
   mPLwDxNZMlotdOev7tUC5s9zGXuUYl97po8/NOGs/6hLc++nSwtbabwg8
   jgmB7gEDWzT8+VoQDb8PDoZ3HyOhZf4Cm+FpVNQ/gci3lEmKvOBe+8tDa
   Q==;
X-CSE-ConnectionGUID: 52kD8zIWQYuaLhctWQ0/Fw==
X-CSE-MsgGUID: Uxnf5vXlTtCVlo4GkLdd/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3079966"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="3079966"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 13:14:17 -0800
X-CSE-ConnectionGUID: /UmNdik9RoqjUpV3TogPcQ==
X-CSE-MsgGUID: +V8aMcX/RJGH558EwhsCmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="7854540"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Nov 2026 13:14:12 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQWgo-00000000vLX-3BBm;
	Mon, 09 Nov 2026 21:14:06 +0000
Date: Tue, 10 Nov 2026 05:13:25 +0800
From: kernel test robot <lkp@intel.com>
To: Laurijssen <lauserve@gmail.com>, linux-kernel@vger.kernel.org,
	pjw@kernel.org, akpm@linux-foundation.org, jannh@google.com,
	brauner@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Laurijssen <laurijssen@protonmail.com>
Subject: Re: [PATCH] SYS: add utsname_set_field to reuse code in
 setdomainname and sethostname
Message-ID: <202611100542.gPwF4AkM-lkp@intel.com>
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
config: nios2-randconfig-1000-20261110 (https://download.01.org/0day-ci/archive/20261110/202611100542.gPwF4AkM-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261110/202611100542.gPwF4AkM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611100542.gPwF4AkM-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: kernel/sys.o: in function `__do_sys_sethostname':
   kernel/sys.c:1424:(.text+0x1c8c): undefined reference to `utsname_set_field'
>> kernel/sys.c:1424:(.text+0x1c8c): relocation truncated to fit: R_NIOS2_CALL26 against `utsname_set_field'
   nios2-linux-ld: kernel/sys.o: in function `__do_sys_setdomainname':
   kernel/sys.c:1457:(.text+0x1ccc): undefined reference to `utsname_set_field'
   kernel/sys.c:1457:(.text+0x1ccc): relocation truncated to fit: R_NIOS2_CALL26 against `utsname_set_field'


vim +1424 kernel/sys.c

  1421	
  1422	SYSCALL_DEFINE2(sethostname, char __user *, name, int, len)
  1423	{
> 1424		return utsname_set_field(name, len, UTS_PROC_HOSTNAME);
  1425	}
  1426	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
