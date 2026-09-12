Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB8A356754
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 07:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789199522; cv=none; b=s6Pg0duqypFa89ra+pvXN4t5Wke3gfONeBWgl0rxO2NKMp3xiIoQptFDVRSeK0DX0C6UhvydahStCJUE1ocUDVCDy0lOqFLIxxPaBbWJuiR5k9DgBgGIEENibOFHhgD+i+S4eP3uFiCDzA1CZm89tU/AXCgvla2nXxxYDLwsvYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789199522; c=relaxed/simple;
	bh=46h7Icp07RcnbhVwELPuCNWFoOPP/0gHjr3jGpDE618=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jPo2Te+B8KaNPeLxZgDFg/xPTrCv0M+Ttyme9UOIfmKfwf6bE5Aejf0Rbn3e+zSZBbrJSH5b+YBbirfVcvqnKIpwfn4S/UPYrX1ZbDG6tvecmucbtI2wquWdm+XVP1XZLmFcJT4C3K7/B227JW1JNWhoJC298lq4myMiNCMl0W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ngA28xaK; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ngA28xaK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789199520; x=1820735520;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=46h7Icp07RcnbhVwELPuCNWFoOPP/0gHjr3jGpDE618=;
  b=ngA28xaK5378vqVyvTjTsOb7mac1zJpIJ2+UIzDm+N8gt8RuS51vsiAi
   MSf3H6eN0D5DYRnXpwqoe6p7ku0T4sWLMVXURjgpq3PKpi0G8P4x4YiAK
   8X3uSQqpawUUmsjvR8g4hqxNFVUJ+YLd6seplxGALYnPM1kATgD3JDv5L
   FaQKwJbj8MHMRJu+lmImKb5Jw+EBt7b2D+Ha/OwDWG8YPO3C4UC1fYIiz
   3lTlkvew+oz7X4WcU3VrFocNu36pt/k7ZWKKarSpdKEjNWndbXvrYdNso
   118l6IIj0Zf+OjHVV/CSFgIDQbzDcmerVIOv4LJ1/CUToJ0MZ9UFvrHN4
   w==;
X-CSE-ConnectionGUID: 0n1HO8+RTP6xW1c2RXuARg==
X-CSE-MsgGUID: kTK4pGRqSVKU5hC2uC0ALw==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="93346175"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="93346175"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 00:51:59 -0700
X-CSE-ConnectionGUID: +YBMtQj6RHSU+ypduIdIFA==
X-CSE-MsgGUID: iKsquZWoS76O59FE1JyNnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="310395597"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 12 Sep 2026 00:51:57 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5IWg-000000002lf-0mG2;
	Sat, 12 Sep 2026 07:51:54 +0000
Date: Sat, 12 Sep 2026 15:51:51 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Zvolsky <matthew-kernel@post.cz>, gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, vaibhav.sr@gmail.com,
	mgreer@animalcreek.com, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Matthew Zvolsky <matthew-kernel@post.cz>
Subject: Re: [PATCH] staging: greybus: add missing newlines to sysfs_emit
Message-ID: <202609121553.VPi1qrGB-lkp@intel.com>
References: <20260911190253.894650-1-matthew-kernel@post.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911190253.894650-1-matthew-kernel@post.cz>

Hi Matthew,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Zvolsky/staging-greybus-add-missing-newlines-to-sysfs_emit/20260911-210253
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260911190253.894650-1-matthew-kernel%40post.cz
patch subject: [PATCH] staging: greybus: add missing newlines to sysfs_emit
config: nios2-randconfig-001-20260912 (https://download.01.org/0day-ci/archive/20260912/202609121553.VPi1qrGB-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609121553.VPi1qrGB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609121553.VPi1qrGB-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/greybus/audio_manager_module.c: In function 'send_add_uevent':
>> drivers/staging/greybus/audio_manager_module.c:162:3: error: initializer element is not constant
      name_string,
      ^~~~~~~~~~~
   drivers/staging/greybus/audio_manager_module.c:162:3: note: (near initialization for 'envp[0]')
   drivers/staging/greybus/audio_manager_module.c:163:3: error: initializer element is not constant
      vid_string,
      ^~~~~~~~~~
   drivers/staging/greybus/audio_manager_module.c:163:3: note: (near initialization for 'envp[1]')
   drivers/staging/greybus/audio_manager_module.c:164:3: error: initializer element is not constant
      pid_string,
      ^~~~~~~~~~
   drivers/staging/greybus/audio_manager_module.c:164:3: note: (near initialization for 'envp[2]')
   drivers/staging/greybus/audio_manager_module.c:165:3: error: initializer element is not constant
      intf_id_string,
      ^~~~~~~~~~~~~~
   drivers/staging/greybus/audio_manager_module.c:165:3: note: (near initialization for 'envp[3]')
   drivers/staging/greybus/audio_manager_module.c:166:3: error: initializer element is not constant
      ip_devices_string,
      ^~~~~~~~~~~~~~~~~
   drivers/staging/greybus/audio_manager_module.c:166:3: note: (near initialization for 'envp[4]')
   drivers/staging/greybus/audio_manager_module.c:167:3: error: initializer element is not constant
      op_devices_string,
      ^~~~~~~~~~~~~~~~~
   drivers/staging/greybus/audio_manager_module.c:167:3: note: (near initialization for 'envp[5]')
>> drivers/staging/greybus/audio_manager_module.c:180:46: error: passing argument 3 of 'kobject_uevent_env' from incompatible pointer type [-Werror=incompatible-pointer-types]
     kobject_uevent_env(&module->kobj, KOBJ_ADD, envp);
                                                 ^~~~
   In file included from drivers/staging/greybus/audio_manager.h:11,
                    from drivers/staging/greybus/audio_manager_module.c:10:
   include/linux/kobject.h:283:10: note: expected 'char **' but argument is of type 'const char * const*'
       char *envp[]);
       ~~~~~~^~~~~~
   cc1: some warnings being treated as errors


vim +162 drivers/staging/greybus/audio_manager_module.c

8db00736d365b75 Svetlin Ankov    2016-01-13  151  
8db00736d365b75 Svetlin Ankov    2016-01-13  152  static void send_add_uevent(struct gb_audio_manager_module *module)
8db00736d365b75 Svetlin Ankov    2016-01-13  153  {
8db00736d365b75 Svetlin Ankov    2016-01-13  154  	char name_string[128];
8db00736d365b75 Svetlin Ankov    2016-01-13  155  	char vid_string[64];
8db00736d365b75 Svetlin Ankov    2016-01-13  156  	char pid_string[64];
d0af1bd5f6f4497 Pankaj Bharadiya 2016-10-16  157  	char intf_id_string[64];
a9234bfd6cec442 Vaibhav Agarwal  2016-03-30  158  	char ip_devices_string[64];
a9234bfd6cec442 Vaibhav Agarwal  2016-03-30  159  	char op_devices_string[64];
8db00736d365b75 Svetlin Ankov    2016-01-13  160  
a33c60996e08817 Matthew Zvolsky  2026-09-11  161  	static const char * const envp[] = {
8db00736d365b75 Svetlin Ankov    2016-01-13 @162  		name_string,
8db00736d365b75 Svetlin Ankov    2016-01-13  163  		vid_string,
8db00736d365b75 Svetlin Ankov    2016-01-13  164  		pid_string,
d0af1bd5f6f4497 Pankaj Bharadiya 2016-10-16  165  		intf_id_string,
a9234bfd6cec442 Vaibhav Agarwal  2016-03-30  166  		ip_devices_string,
a9234bfd6cec442 Vaibhav Agarwal  2016-03-30  167  		op_devices_string,
8db00736d365b75 Svetlin Ankov    2016-01-13  168  		NULL
8db00736d365b75 Svetlin Ankov    2016-01-13  169  	};
8db00736d365b75 Svetlin Ankov    2016-01-13  170  
8db00736d365b75 Svetlin Ankov    2016-01-13  171  	snprintf(name_string, 128, "NAME=%s", module->desc.name);
8db00736d365b75 Svetlin Ankov    2016-01-13  172  	snprintf(vid_string, 64, "VID=%d", module->desc.vid);
8db00736d365b75 Svetlin Ankov    2016-01-13  173  	snprintf(pid_string, 64, "PID=%d", module->desc.pid);
d0af1bd5f6f4497 Pankaj Bharadiya 2016-10-16  174  	snprintf(intf_id_string, 64, "INTF_ID=%d", module->desc.intf_id);
a9234bfd6cec442 Vaibhav Agarwal  2016-03-30  175  	snprintf(ip_devices_string, 64, "I/P DEVICES=0x%X",
a9234bfd6cec442 Vaibhav Agarwal  2016-03-30  176  		 module->desc.ip_devices);
a9234bfd6cec442 Vaibhav Agarwal  2016-03-30  177  	snprintf(op_devices_string, 64, "O/P DEVICES=0x%X",
a9234bfd6cec442 Vaibhav Agarwal  2016-03-30  178  		 module->desc.op_devices);
8db00736d365b75 Svetlin Ankov    2016-01-13  179  
8db00736d365b75 Svetlin Ankov    2016-01-13 @180  	kobject_uevent_env(&module->kobj, KOBJ_ADD, envp);
8db00736d365b75 Svetlin Ankov    2016-01-13  181  }
8db00736d365b75 Svetlin Ankov    2016-01-13  182  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
