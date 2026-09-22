Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D693BFE2B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790099155; cv=none; b=VflxMH2A5h1tI6i+wInMK1SmNwqpw73Wv8a2X9x/pn1s/sj6he3gM59Vin+tCvmGowCqphTF7udU2GiBc71IPu6d/IbXOltcsQ7niyflGQyDl5+3uuyNC+tx4cn7Gr63JQpCGpAKKdI4x+EAA86q+3OViio2kJsK1D9YIMeJfxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790099155; c=relaxed/simple;
	bh=cvdUdWoOkgZ3g4xFdPGzXxH6A2uWP/NHWmlfA4zoi7A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Cqdtw40bzA6QCkM6u6NaejfFO0oIIdHo8BTwWOvOx6vjTjkrFZmOz2E3Li36SavaQE9tAJsSEesZzBUePBVDlarzTWWh648VW2fAotchNGnYeNMwL1/ShPttj0cQ77G2Pr5VuZyAVTrtFV5T6rUaR6U9mXStbUfo3qRiF8XLweU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bbQO4EVH; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bbQO4EVH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790099153; x=1821635153;
  h=date:from:to:cc:subject:message-id;
  bh=cvdUdWoOkgZ3g4xFdPGzXxH6A2uWP/NHWmlfA4zoi7A=;
  b=bbQO4EVHWxmHjKwlhJNoLFa3cl6k9NHSffbsR/Uxu0v4Tl4CLEXZgjTc
   wNyKEPqQhUTM3Po306UJW7ujvQBpwQpCim3d+frATRAq7Gz3w/oAqtQ98
   T1q8kgitKowKJ1vYciWeceXHNTWDjBBLxPXSNEWPBACI0esLDyG1OqGot
   c4bmmPgX0dR1SUg1MWLWmZUUFOKpHF5IEDM2L5hyGcfnLAGv0cSysgf32
   IRCvvfnXeuBpezUqml7EzrB4tHmW5O71NLx8RwSDdUIt5HPge3oopCa6a
   fC8mjKncCKodQs2QtCKtJcggoDPXqqS76mg7gq5kaGdI1ezJhVzTYS/WV
   Q==;
X-CSE-ConnectionGUID: UtFJw1maQsShctXcGxVEmA==
X-CSE-MsgGUID: 0H6tqWRuRbS6aGzkudGWzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="89644757"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="89644757"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 10:45:41 -0700
X-CSE-ConnectionGUID: flO297o6QXKIXzuhEkBgQg==
X-CSE-MsgGUID: 17M0ajnbRXOteaFcSaHbtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="301133559"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Sep 2026 10:45:39 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x94Yi-00000000Fps-2Fwq;
	Tue, 22 Sep 2026 17:45:36 +0000
Date: Wed, 23 Sep 2026 01:45:15 +0800
From: kernel test robot <lkp@intel.com>
To: Wei Wang <weibunny@fb.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Daniel Zahka <daniel.zahka@gmail.com>
Subject: net/psp/psp_nl.c:513:13: sparse: sparse: cast removes
 address space '__rcu' of expression
Message-ID: <202609230135.7bC6QbWs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
commit: 06c2dce2d0f69727144443664182052f56d1da35 psp: add new netlink cmd for dev-assoc and dev-disassoc
date:   3 months ago
config: riscv-randconfig-r1305-20260922 (https://download.01.org/0day-ci/archive/20260923/202609230135.7bC6QbWs-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609230135.7bC6QbWs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 06c2dce2d0f6 ("psp: add new netlink cmd for dev-assoc and dev-disassoc")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609230135.7bC6QbWs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> net/psp/psp_nl.c:513:13: sparse: sparse: cast removes address space '__rcu' of expression

vim +/__rcu +513 net/psp/psp_nl.c

   475	
   476	int psp_nl_dev_assoc_doit(struct sk_buff *skb, struct genl_info *info)
   477	{
   478		struct psp_dev *psd = info->user_ptr[0];
   479		struct psp_assoc_dev *psp_assoc_dev;
   480		struct net_device *assoc_dev;
   481		struct sk_buff *rsp;
   482		u32 assoc_ifindex;
   483		struct net *net;
   484		int err;
   485	
   486		if (psd->assoc_dev_cnt >= PSP_ASSOC_DEV_MAX) {
   487			NL_SET_ERR_MSG(info->extack,
   488				       "Maximum number of associated devices reached");
   489			return -ENOSPC;
   490		}
   491	
   492		net = psp_nl_resolve_assoc_dev_ns(psd, info);
   493		if (IS_ERR(net))
   494			return PTR_ERR(net);
   495	
   496		psp_assoc_dev = kzalloc_obj(*psp_assoc_dev);
   497		if (!psp_assoc_dev) {
   498			err = -ENOMEM;
   499			goto err_put_net;
   500		}
   501	
   502		assoc_ifindex = nla_get_u32(info->attrs[PSP_A_DEV_IFINDEX]);
   503		assoc_dev = netdev_get_by_index(net, assoc_ifindex,
   504						&psp_assoc_dev->dev_tracker,
   505						GFP_KERNEL);
   506		if (!assoc_dev) {
   507			NL_SET_BAD_ATTR(info->extack, info->attrs[PSP_A_DEV_IFINDEX]);
   508			err = -ENODEV;
   509			goto err_free_assoc;
   510		}
   511	
   512		/* Check if device is already associated with a PSP device */
 > 513		if (cmpxchg(&assoc_dev->psp_dev, NULL, RCU_INITIALIZER(psd))) {
   514			NL_SET_ERR_MSG(info->extack,
   515				       "Device already associated with a PSP device");
   516			err = -EBUSY;
   517			goto err_put_dev;
   518		}
   519	
   520		psp_assoc_dev->assoc_dev = assoc_dev;
   521		rsp = psp_nl_reply_new(info);
   522		if (!rsp) {
   523			err = -ENOMEM;
   524			goto err_clean_ptr;
   525		}
   526	
   527		list_add_tail(&psp_assoc_dev->dev_list, &psd->assoc_dev_list);
   528		psd->assoc_dev_cnt++;
   529	
   530		put_net(net);
   531	
   532		psp_nl_notify_dev(psd, PSP_CMD_DEV_CHANGE_NTF);
   533	
   534		return psp_nl_reply_send(rsp, info);
   535	
   536	err_clean_ptr:
   537		rcu_assign_pointer(assoc_dev->psp_dev, NULL);
   538	err_put_dev:
   539		netdev_put(assoc_dev, &psp_assoc_dev->dev_tracker);
   540	err_free_assoc:
   541		kfree(psp_assoc_dev);
   542	err_put_net:
   543		put_net(net);
   544	
   545		return err;
   546	}
   547	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
