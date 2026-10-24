Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792808747;
	b=exRMKQ5CLitrrrO+K5THGo5AfYIHi57Dv6VhRoOACbJd0gpoiFlou+/DUcjbKZdgCzxU
	 au98hNNIE15GLngq97EV03OhzU6BOwWdX7yHM/B3zfptESwasQ4mdlJLMrpJGcBp93tmK
	 dAgtM/kXwqysf6LSZrdap72e/C+Go8Bc27bZV9Wu0yD6zzqgUFnYdXCztRFAE1UjxO5jZ
	 0WzPvgGEQ+1dPYtl2jVVzpbrDiUSY+usyMBBzWbdYd9dvZgzKESrCWSzUltVndq6uihgd
	 trJnClFgJ9Gd88huLzQfPyNzS0rIGglX/lp4xuLqz6+j8pSKXcW/ljDEWbc+HBsV1pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792808747;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=dPWbmLr59T8e+2TlBRacI+IgQsnfj+U97VaVYm40bRM=;
	b=yj3L/U9zB7eSq+17Rbuy+Nk4jL8m3QCf0kPhBMpR3mUkoWnKmTqz2pMgIT0LM7/iBP0d
	 3vgQhNJbuVwE0WuSzoqn0hrySoZUxW953qil1XVDEShcCcYIusI3/FRR2gXEpvsChwhFW
	 Y0LMvSUZVikaQL23hRSDTe0fN5rBTlhdzA+dU5Q/+EvxaxoVdqqaNAPNIUX9V0drm3Ze1
	 JevjZMrqNdJEaOVb6AvWpQx9ZQeFJpkj1sq+fRFsmYNhb6tvSwcHa+dQ/KkU/3UICFVRq
	 rbnleeSs7OXnnxIEitZT9GkXPB/dQN5AM0CGtMQiUnSAMLmzl36AgoKkFDehHIC32hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YxQfB+j4;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5B1606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 02:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D5B1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YxQfB+j4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792808746; x=1824344746;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9z7fk9knGX9sKiE2em0bX9/7uTbHHQ6pMQxcxugWRJw=;
  b=YxQfB+j4bibEB6n/9/nc8B6xjtOSws4vkmI3RJ0mhL3q8qdttxKEygiw
   WmWgNUPCQpW68WakV7WCrZGxRfGdtDyt51N0L9rdDJPRbAX+5Mn2soitl
   dmtta4aorM+TN8I8KJJYcB/UTJrRJjhtU65fwnOE5SSF0AeZvwqmvoQM/
   Q/8UitJU6MQoy0VTOsK0/ENE4sfUYtZkV/aV9JEn4NAh/nu2lW4smna7h
   W0oOdSB97h0fFg3SRZEbDroy6JDLftM/L26sp8eot7XPeADM5nqxOTXQQ
   x6Yz0mxNNICvqxYgf3DOPRmvglI+sBmO8hyeKNruySyOF/x0ekdt6syDQ
   Q==;
X-CSE-ConnectionGUID: 1NJRaoDITeO+Ar98sWB52w==
X-CSE-MsgGUID: JC9AebXBS9WlZ2oCRZXp7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1576281"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1576281"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 19:25:45 -0700
X-CSE-ConnectionGUID: bwDFRVyvTIqLgv5zlBPxfw==
X-CSE-MsgGUID: cw796wBmQwiZz7NYZxg7JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="5635668"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 23 Oct 2026 19:25:44 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKRS1-00000000TVa-3ZAO;
	Sat, 24 Oct 2026 02:25:41 +0000
Date: Sat, 24 Oct 2026 10:25:27 +0800
From: kernel test robot <lkp@intel.com>
To: LiuJunyuan <2058432396@qq.com>, gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, LiuJunyuan <2058432396@qq.com>
Subject: Re: [PATCH] staging: vme_user: use scnprintf in tsi148_alloc_resource
Message-ID: <202610241010.ezQcs5lj-lkp@intel.com>
References: <tencent_F5EEA06B3CD49F9EFF5C185259BF4134DA0A@qq.com>
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
In-Reply-To: <tencent_F5EEA06B3CD49F9EFF5C185259BF4134DA0A@qq.com>

Hi LiuJunyuan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/LiuJunyuan/staging-vme_user-use-scnprintf-in-tsi148_alloc_resource/20261021-111349
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/tencent_F5EEA06B3CD49F9EFF5C185259BF4134DA0A%40qq.com
patch subject: [PATCH] staging: vme_user: use scnprintf in tsi148_alloc_resource
config: i386-randconfig-1006-20261021 (https://download.01.org/0day-ci/archive/20261024/202610241010.ezQcs5lj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261024/202610241010.ezQcs5lj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610241010.ezQcs5lj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/vme_user/vme_tsi148.c: In function 'tsi148_alloc_resource':
>> drivers/staging/vme_user/vme_tsi148.c:748:38: warning: passing argument 1 of 'scnprintf' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     748 |         scnprintf(image->bus_resource.name, VMENAMSIZ + 3, "%s.%d",
         |                   ~~~~~~~~~~~~~~~~~~~^~~~~
   In file included from include/linux/kernel.h:32,
                    from include/linux/random.h:7,
                    from include/linux/nodemask.h:94,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from arch/x86/include/asm/paravirt.h:19,
                    from arch/x86/include/asm/irqflags.h:100,
                    from include/linux/irqflags.h:18,
                    from arch/x86/include/asm/special_insns.h:10,
                    from arch/x86/include/asm/processor.h:25,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/staging/vme_user/vme_tsi148.c:12:
   include/linux/sprintf.h:15:36: note: expected 'char *' but argument is of type 'const char *'
      15 | __printf(3, 4) int scnprintf(char *buf, size_t size, const char *fmt, ...);
         |                              ~~~~~~^~~


vim +748 drivers/staging/vme_user/vme_tsi148.c

   705	
   706	/*
   707	 * Allocate and map PCI Resource
   708	 */
   709	static int tsi148_alloc_resource(struct vme_master_resource *image,
   710					 unsigned long long size)
   711	{
   712		unsigned long long existing_size;
   713		int retval = 0;
   714		struct pci_dev *pdev;
   715		struct vme_bridge *tsi148_bridge;
   716	
   717		tsi148_bridge = image->parent;
   718	
   719		pdev = to_pci_dev(tsi148_bridge->parent);
   720	
   721		existing_size = (unsigned long long)(image->bus_resource.end -
   722			image->bus_resource.start);
   723	
   724		/* If the existing size is OK, return */
   725		if ((size != 0) && (existing_size == (size - 1)))
   726			return 0;
   727	
   728		if (existing_size != 0) {
   729			iounmap(image->kern_base);
   730			image->kern_base = NULL;
   731			kfree(image->bus_resource.name);
   732			release_resource(&image->bus_resource);
   733			memset(&image->bus_resource, 0, sizeof(image->bus_resource));
   734		}
   735	
   736		/* Exit here if size is zero */
   737		if (size == 0)
   738			return 0;
   739	
   740		if (!image->bus_resource.name) {
   741			image->bus_resource.name = kmalloc(VMENAMSIZ + 3, GFP_ATOMIC);
   742			if (!image->bus_resource.name) {
   743				retval = -ENOMEM;
   744				goto err_name;
   745			}
   746		}
   747	
 > 748		scnprintf(image->bus_resource.name, VMENAMSIZ + 3, "%s.%d",
   749			  tsi148_bridge->name, image->number);
   750	
   751		image->bus_resource.start = 0;
   752		image->bus_resource.end = (unsigned long)size;
   753		image->bus_resource.flags = IORESOURCE_MEM;
   754	
   755		retval = pci_bus_alloc_resource(pdev->bus, &image->bus_resource,
   756						size, 0x10000, PCIBIOS_MIN_MEM,
   757						0, NULL, NULL);
   758		if (retval) {
   759			dev_err(tsi148_bridge->parent, "Failed to allocate mem resource for window %d size 0x%lx start 0x%lx\n",
   760				image->number, (unsigned long)size,
   761				(unsigned long)image->bus_resource.start);
   762			goto err_resource;
   763		}
   764	
   765		image->kern_base = ioremap(image->bus_resource.start, size);
   766		if (!image->kern_base) {
   767			dev_err(tsi148_bridge->parent, "Failed to remap resource\n");
   768			retval = -ENOMEM;
   769			goto err_remap;
   770		}
   771	
   772		return 0;
   773	
   774	err_remap:
   775		release_resource(&image->bus_resource);
   776	err_resource:
   777		kfree(image->bus_resource.name);
   778		memset(&image->bus_resource, 0, sizeof(image->bus_resource));
   779	err_name:
   780		return retval;
   781	}
   782	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
