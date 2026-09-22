Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58493BFE41
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078315; cv=none; b=fLFiZkA3Br+vNOhMhE+U8i/rzPOjOaBFQOdN62+iMlvTFnEU3kj7JL4gixToxVSAehgCMvJqjS2ATRBio8n8OyN4g5KIlm2n+yCJDhFPFcnKnrZ8bvfwwr2pog8AMmoOOBEaaBWJY97j8NraSh94Uci/tDPI83xjC5eZIbH4gOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078315; c=relaxed/simple;
	bh=hGJGOcp512c5TKfdw0aquhoA79xE41bhzJuxa6vV9go=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IvVa82TJKEKubfc3TE3DiwiB1i/G1N5AjaZIz/C/ttPjqiyaGs7KkXMlNHKmkjh/PNQCQVhtCgWKtvAylLqLbdOmCUf/ejxOBVb7kWE7ni+sMvjUQagt3GBftB5Zwrz6elJSZYaflrSoanTXFxeA3tk4AH/owAZbeJxQhgeqwaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j/L0hR8V; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j/L0hR8V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790078302; x=1821614302;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hGJGOcp512c5TKfdw0aquhoA79xE41bhzJuxa6vV9go=;
  b=j/L0hR8V1ztFV7WTPTd1vFW3oTqQvEuY1XliHeYD1ig993h7dFA97KCe
   LXwZdl3veyNxyE+TdU6VdaNxV8BqitKmsbY8Zqi3EX7AtHP8jWT4qdsXI
   1tvZo8PdHBHqZrc2ORLDAchOfzOs1z3pUaFbHI4TppzqHAGahYa8uZMtW
   faaj0cxlgrTb6iOrYzM0KPZO+7zo1UbL6eqYfRrp0g4eMTQJhy7PU/al/
   Pkt8dVO3/0bDDW2bPLgJzpwfjbkI69wbQ3pZZ4yvMCoylnEQRGqP6POBw
   xnWB2eYYG2jmu7yS0yhkra1Pi7VSHDZUEvZA2kKhqacufr2NhmKFAwFGd
   Q==;
X-CSE-ConnectionGUID: N/nLrKv5RcKyChqdIsIJFw==
X-CSE-MsgGUID: /3r8wiiGTVagiQg+7Wf8vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="102023561"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="102023561"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 04:58:20 -0700
X-CSE-ConnectionGUID: TKw1Bjb2SDW7y9vmZuuZRw==
X-CSE-MsgGUID: HsW58FxWRVibn6LJ9qxjyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="281165547"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Sep 2026 04:58:17 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8z8Y-00000000FS2-19mj;
	Tue, 22 Sep 2026 11:58:14 +0000
Date: Tue, 22 Sep 2026 19:57:20 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 David Gow <davidgow@google.com>
Subject: drivers/scsi/mvumi.c:429:30: sparse: sparse: incorrect type
 in argument 1 (different address spaces)
Message-ID: <202609221930.sZkDrNI6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
commit: 031cdd3bc3f369553933c1b0f4cb18000162c8ff kunit: Enable PCI on UML without triggering WARN()
date:   1 year ago
config: um-randconfig-r1307-20260922 (https://download.01.org/0day-ci/archive/20260922/202609221930.sZkDrNI6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260922/202609221930.sZkDrNI6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 031cdd3bc3f3 ("kunit: Enable PCI on UML without triggering WARN()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609221930.sZkDrNI6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/scsi/mvumi.c:81:52: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/scsi/mvumi.c:81:52: sparse:     expected void [noderef] __iomem *
   drivers/scsi/mvumi.c:81:52: sparse:     got void *
   drivers/scsi/mvumi.c:90:39: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   drivers/scsi/mvumi.c:90:39: sparse:     expected void *
   drivers/scsi/mvumi.c:90:39: sparse:     got void [noderef] __iomem *
   drivers/scsi/mvumi.c:210:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] baseaddr_l @@     got restricted __le32 [usertype] @@
   drivers/scsi/mvumi.c:210:34: sparse:     expected unsigned int [usertype] baseaddr_l
   drivers/scsi/mvumi.c:210:34: sparse:     got restricted __le32 [usertype]
   drivers/scsi/mvumi.c:211:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] baseaddr_h @@     got restricted __le32 [usertype] @@
   drivers/scsi/mvumi.c:211:34: sparse:     expected unsigned int [usertype] baseaddr_h
   drivers/scsi/mvumi.c:211:34: sparse:     got restricted __le32 [usertype]
   drivers/scsi/mvumi.c:213:17: sparse: sparse: invalid assignment: |=
   drivers/scsi/mvumi.c:213:17: sparse:    left side has type unsigned int
   drivers/scsi/mvumi.c:213:17: sparse:    right side has type restricted __le32
   drivers/scsi/mvumi.c:213:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] size @@     got restricted __le32 [usertype] @@
   drivers/scsi/mvumi.c:213:17: sparse:     expected unsigned int [usertype] size
   drivers/scsi/mvumi.c:213:17: sparse:     got restricted __le32 [usertype]
   drivers/scsi/mvumi.c:242:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] baseaddr_l @@     got restricted __le32 [usertype] @@
   drivers/scsi/mvumi.c:242:26: sparse:     expected unsigned int [usertype] baseaddr_l
   drivers/scsi/mvumi.c:242:26: sparse:     got restricted __le32 [usertype]
   drivers/scsi/mvumi.c:243:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] baseaddr_h @@     got restricted __le32 [usertype] @@
   drivers/scsi/mvumi.c:243:26: sparse:     expected unsigned int [usertype] baseaddr_h
   drivers/scsi/mvumi.c:243:26: sparse:     got restricted __le32 [usertype]
   drivers/scsi/mvumi.c:245:9: sparse: sparse: invalid assignment: |=
   drivers/scsi/mvumi.c:245:9: sparse:    left side has type unsigned int
   drivers/scsi/mvumi.c:245:9: sparse:    right side has type restricted __le32
   drivers/scsi/mvumi.c:245:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] size @@     got restricted __le32 [usertype] @@
   drivers/scsi/mvumi.c:245:9: sparse:     expected unsigned int [usertype] size
   drivers/scsi/mvumi.c:245:9: sparse:     got restricted __le32 [usertype]
   drivers/scsi/mvumi.c:407:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *inb_read_pointer @@
   drivers/scsi/mvumi.c:407:40: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:407:40: sparse:     got void *inb_read_pointer
>> drivers/scsi/mvumi.c:429:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *ib_shadow @@
   drivers/scsi/mvumi.c:429:30: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:429:30: sparse:     got void *ib_shadow
>> drivers/scsi/mvumi.c:458:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *ib_shadow @@
   drivers/scsi/mvumi.c:458:31: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:458:31: sparse:     got void *ib_shadow
   drivers/scsi/mvumi.c:459:48: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *inb_write_pointer @@
   drivers/scsi/mvumi.c:459:48: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:459:48: sparse:     got void *inb_write_pointer
>> drivers/scsi/mvumi.c:496:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *outb_copy_pointer @@
   drivers/scsi/mvumi.c:496:41: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:496:41: sparse:     got void *outb_copy_pointer
   drivers/scsi/mvumi.c:497:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *ob_shadow @@
   drivers/scsi/mvumi.c:497:48: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:497:48: sparse:     got void *ob_shadow
>> drivers/scsi/mvumi.c:516:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *outb_read_pointer @@
   drivers/scsi/mvumi.c:516:33: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:516:33: sparse:     got void *outb_read_pointer
   drivers/scsi/mvumi.c:517:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *outb_copy_pointer @@
   drivers/scsi/mvumi.c:517:33: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:517:33: sparse:     got void *outb_copy_pointer
>> drivers/scsi/mvumi.c:578:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *outb_read_pointer @@
   drivers/scsi/mvumi.c:578:42: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:578:42: sparse:     got void *outb_read_pointer
   drivers/scsi/mvumi.c:585:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *enpointa_mask_reg @@
   drivers/scsi/mvumi.c:585:26: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:585:26: sparse:     got void *enpointa_mask_reg
>> drivers/scsi/mvumi.c:586:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *arm_to_pciea_msg1 @@
   drivers/scsi/mvumi.c:586:26: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:586:26: sparse:     got void *arm_to_pciea_msg1
   drivers/scsi/mvumi.c:589:40: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *pciea_to_arm_drbl_reg @@
   drivers/scsi/mvumi.c:589:40: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:589:40: sparse:     got void *pciea_to_arm_drbl_reg
>> drivers/scsi/mvumi.c:1281:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *arm_to_pciea_drbl_reg @@
   drivers/scsi/mvumi.c:1281:28: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1281:28: sparse:     got void *arm_to_pciea_drbl_reg
   drivers/scsi/mvumi.c:1282:28: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *arm_to_pciea_drbl_reg @@
   drivers/scsi/mvumi.c:1282:28: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1282:28: sparse:     got void *arm_to_pciea_drbl_reg
>> drivers/scsi/mvumi.c:1284:48: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *arm_to_pciea_mask_reg @@
   drivers/scsi/mvumi.c:1284:48: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1284:48: sparse:     got void *arm_to_pciea_mask_reg
>> drivers/scsi/mvumi.c:1285:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *enpointa_mask_reg @@
   drivers/scsi/mvumi.c:1285:28: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1285:28: sparse:     got void *enpointa_mask_reg
   drivers/scsi/mvumi.c:1286:28: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *enpointa_mask_reg @@
   drivers/scsi/mvumi.c:1286:28: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1286:28: sparse:     got void *enpointa_mask_reg
   drivers/scsi/mvumi.c:612:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *enpointa_mask_reg @@
   drivers/scsi/mvumi.c:612:26: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:612:26: sparse:     got void *enpointa_mask_reg
   drivers/scsi/mvumi.c:613:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *arm_to_pciea_msg1 @@
   drivers/scsi/mvumi.c:613:28: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:613:28: sparse:     got void *arm_to_pciea_msg1
   drivers/scsi/mvumi.c:615:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *pciea_to_arm_drbl_reg @@
   drivers/scsi/mvumi.c:615:46: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:615:46: sparse:     got void *pciea_to_arm_drbl_reg
   drivers/scsi/mvumi.c:624:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *arm_to_pciea_msg1 @@
   drivers/scsi/mvumi.c:624:36: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:624:36: sparse:     got void *arm_to_pciea_msg1
>> drivers/scsi/mvumi.c:670:32: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *reset_enable @@
   drivers/scsi/mvumi.c:670:32: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:670:32: sparse:     got void *reset_enable
   drivers/scsi/mvumi.c:671:34: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *reset_request @@
   drivers/scsi/mvumi.c:671:34: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:671:34: sparse:     got void *reset_request
   drivers/scsi/mvumi.c:673:35: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *reset_enable @@
   drivers/scsi/mvumi.c:673:35: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:673:35: sparse:     got void *reset_enable
   drivers/scsi/mvumi.c:674:35: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *reset_request @@
   drivers/scsi/mvumi.c:674:35: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:674:35: sparse:     got void *reset_request
>> drivers/scsi/mvumi.c:1100:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *arm_to_pciea_msg0 @@
   drivers/scsi/mvumi.c:1100:36: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1100:36: sparse:     got void *arm_to_pciea_msg0
>> drivers/scsi/mvumi.c:1115:52: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *pciea_to_arm_msg1 @@
   drivers/scsi/mvumi.c:1115:52: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1115:52: sparse:     got void *pciea_to_arm_msg1
   drivers/scsi/mvumi.c:1116:39: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *pciea_to_arm_msg0 @@
   drivers/scsi/mvumi.c:1116:39: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1116:39: sparse:     got void *pciea_to_arm_msg0
   drivers/scsi/mvumi.c:1117:47: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *pciea_to_arm_drbl_reg @@
   drivers/scsi/mvumi.c:1117:47: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1117:47: sparse:     got void *pciea_to_arm_drbl_reg
   drivers/scsi/mvumi.c:1122:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *pciea_to_arm_msg1 @@
   drivers/scsi/mvumi.c:1122:45: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1122:45: sparse:     got void *pciea_to_arm_msg1
>> drivers/scsi/mvumi.c:1124:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *arm_to_pciea_msg1 @@
   drivers/scsi/mvumi.c:1124:45: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1124:45: sparse:     got void *arm_to_pciea_msg1
   drivers/scsi/mvumi.c:1127:39: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *pciea_to_arm_msg0 @@
   drivers/scsi/mvumi.c:1127:39: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1127:39: sparse:     got void *pciea_to_arm_msg0
   drivers/scsi/mvumi.c:1128:47: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *pciea_to_arm_drbl_reg @@
   drivers/scsi/mvumi.c:1128:47: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1128:47: sparse:     got void *pciea_to_arm_drbl_reg
   drivers/scsi/mvumi.c:1168:39: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *pciea_to_arm_msg0 @@
   drivers/scsi/mvumi.c:1168:39: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1168:39: sparse:     got void *pciea_to_arm_msg0
   drivers/scsi/mvumi.c:1169:47: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *pciea_to_arm_drbl_reg @@
   drivers/scsi/mvumi.c:1169:47: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1169:47: sparse:     got void *pciea_to_arm_drbl_reg
   drivers/scsi/mvumi.c:1174:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *enpointa_mask_reg @@
   drivers/scsi/mvumi.c:1174:36: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1174:36: sparse:     got void *enpointa_mask_reg
   drivers/scsi/mvumi.c:1176:36: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *enpointa_mask_reg @@
   drivers/scsi/mvumi.c:1176:36: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1176:36: sparse:     got void *enpointa_mask_reg
   drivers/scsi/mvumi.c:1177:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *ib_shadow @@
   drivers/scsi/mvumi.c:1177:50: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1177:50: sparse:     got void *ib_shadow
   drivers/scsi/mvumi.c:1180:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *inb_aval_count_basel @@
   drivers/scsi/mvumi.c:1180:45: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1180:45: sparse:     got void *inb_aval_count_basel
>> drivers/scsi/mvumi.c:1182:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *inb_aval_count_baseh @@
   drivers/scsi/mvumi.c:1182:45: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1182:45: sparse:     got void *inb_aval_count_baseh
>> drivers/scsi/mvumi.c:1188:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *ob_shadow @@
   drivers/scsi/mvumi.c:1188:61: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1188:61: sparse:     got void *ob_shadow
>> drivers/scsi/mvumi.c:1190:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *outb_copy_basel @@
   drivers/scsi/mvumi.c:1190:61: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1190:61: sparse:     got void *outb_copy_basel
>> drivers/scsi/mvumi.c:1192:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *outb_copy_baseh @@
   drivers/scsi/mvumi.c:1192:61: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1192:61: sparse:     got void *outb_copy_baseh
   drivers/scsi/mvumi.c:1244:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *arm_to_pciea_msg1 @@
   drivers/scsi/mvumi.c:1244:34: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1244:34: sparse:     got void *arm_to_pciea_msg1
   drivers/scsi/mvumi.c:1248:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *pciea_to_arm_drbl_reg @@
   drivers/scsi/mvumi.c:1248:51: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1248:51: sparse:     got void *pciea_to_arm_drbl_reg
   drivers/scsi/mvumi.c:1256:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *arm_to_pciea_msg1 @@
   drivers/scsi/mvumi.c:1256:42: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1256:42: sparse:     got void *arm_to_pciea_msg1
   drivers/scsi/mvumi.c:1849:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] src_low_addr @@     got restricted __le32 [usertype] @@
   drivers/scsi/mvumi.c:1849:35: sparse:     expected unsigned int [usertype] src_low_addr
   drivers/scsi/mvumi.c:1849:35: sparse:     got restricted __le32 [usertype]
   drivers/scsi/mvumi.c:1851:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] src_high_addr @@     got restricted __le32 [usertype] @@
   drivers/scsi/mvumi.c:1851:36: sparse:     expected unsigned int [usertype] src_high_addr
   drivers/scsi/mvumi.c:1851:36: sparse:     got restricted __le32 [usertype]
   drivers/scsi/mvumi.c:1903:48: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *arm_to_pciea_mask_reg @@
   drivers/scsi/mvumi.c:1903:48: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1903:48: sparse:     got void *arm_to_pciea_mask_reg
   drivers/scsi/mvumi.c:1904:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *enpointa_mask_reg @@
   drivers/scsi/mvumi.c:1904:29: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1904:29: sparse:     got void *enpointa_mask_reg
   drivers/scsi/mvumi.c:1906:29: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *enpointa_mask_reg @@
   drivers/scsi/mvumi.c:1906:29: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1906:29: sparse:     got void *enpointa_mask_reg
   drivers/scsi/mvumi.c:1918:26: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *arm_to_pciea_mask_reg @@
   drivers/scsi/mvumi.c:1918:26: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1918:26: sparse:     got void *arm_to_pciea_mask_reg
   drivers/scsi/mvumi.c:1919:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *enpointa_mask_reg @@
   drivers/scsi/mvumi.c:1919:29: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1919:29: sparse:     got void *enpointa_mask_reg
   drivers/scsi/mvumi.c:1922:29: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *enpointa_mask_reg @@
   drivers/scsi/mvumi.c:1922:29: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1922:29: sparse:     got void *enpointa_mask_reg
>> drivers/scsi/mvumi.c:1931:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *main_int_cause_reg @@
   drivers/scsi/mvumi.c:1931:31: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1931:31: sparse:     got void *main_int_cause_reg
   drivers/scsi/mvumi.c:1935:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *outb_isr_cause @@
   drivers/scsi/mvumi.c:1935:36: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1935:36: sparse:     got void *outb_isr_cause
>> drivers/scsi/mvumi.c:1939:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *outb_isr_cause @@
   drivers/scsi/mvumi.c:1939:61: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1939:61: sparse:     got void *outb_isr_cause
   drivers/scsi/mvumi.c:1945:53: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *outb_isr_cause @@
   drivers/scsi/mvumi.c:1945:53: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1945:53: sparse:     got void *outb_isr_cause
   drivers/scsi/mvumi.c:1951:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *outb_isr_cause @@
   drivers/scsi/mvumi.c:1951:36: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1951:36: sparse:     got void *outb_isr_cause
   drivers/scsi/mvumi.c:1953:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *outb_isr_cause @@
   drivers/scsi/mvumi.c:1953:61: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1953:61: sparse:     got void *outb_isr_cause
   drivers/scsi/mvumi.c:1956:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *arm_to_pciea_drbl_reg @@
   drivers/scsi/mvumi.c:1956:43: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1956:43: sparse:     got void *arm_to_pciea_drbl_reg
   drivers/scsi/mvumi.c:1958:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *arm_to_pciea_drbl_reg @@
   drivers/scsi/mvumi.c:1958:51: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1958:51: sparse:     got void *arm_to_pciea_drbl_reg
   drivers/scsi/mvumi.c:1975:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *arm_to_pciea_drbl_reg @@
   drivers/scsi/mvumi.c:1975:37: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1975:37: sparse:     got void *arm_to_pciea_drbl_reg
   drivers/scsi/mvumi.c:1977:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *arm_to_pciea_drbl_reg @@
   drivers/scsi/mvumi.c:1977:45: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/mvumi.c:1977:45: sparse:     got void *arm_to_pciea_drbl_reg
--
   drivers/scsi/myrs.c:2271:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *base @@     got struct myrs_hba *cs @@
   drivers/scsi/myrs.c:2271:42: sparse:     expected void [noderef] __iomem *base
   drivers/scsi/myrs.c:2271:42: sparse:     got struct myrs_hba *cs
>> drivers/scsi/myrs.c:2423:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] val @@
   drivers/scsi/myrs.c:2423:16: sparse:     expected unsigned int [usertype] value
   drivers/scsi/myrs.c:2423:16: sparse:     got restricted __le32 [usertype] val
   drivers/scsi/myrs.c:2476:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] val @@
   drivers/scsi/myrs.c:2476:16: sparse:     expected unsigned int [usertype] value
   drivers/scsi/myrs.c:2476:16: sparse:     got restricted __le32 [usertype] val
   drivers/scsi/myrs.c:2416:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] val @@
   drivers/scsi/myrs.c:2416:16: sparse:     expected unsigned int [usertype] value
   drivers/scsi/myrs.c:2416:16: sparse:     got restricted __le32 [usertype] val
   drivers/scsi/myrs.c:2476:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] val @@
   drivers/scsi/myrs.c:2476:16: sparse:     expected unsigned int [usertype] value
   drivers/scsi/myrs.c:2476:16: sparse:     got restricted __le32 [usertype] val
   drivers/scsi/myrs.c:2409:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] val @@
   drivers/scsi/myrs.c:2409:16: sparse:     expected unsigned int [usertype] value
   drivers/scsi/myrs.c:2409:16: sparse:     got restricted __le32 [usertype] val
   drivers/scsi/myrs.c:2438:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] val @@     got unsigned int @@
   drivers/scsi/myrs.c:2438:13: sparse:     expected restricted __le32 [usertype] val
   drivers/scsi/myrs.c:2438:13: sparse:     got unsigned int
   drivers/scsi/myrs.c:2508:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] val @@     got unsigned int @@
   drivers/scsi/myrs.c:2508:13: sparse:     expected restricted __le32 [usertype] val
   drivers/scsi/myrs.c:2508:13: sparse:     got unsigned int
   drivers/scsi/myrs.c:2511:18: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/myrs.c:2416:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] val @@
   drivers/scsi/myrs.c:2416:16: sparse:     expected unsigned int [usertype] value
   drivers/scsi/myrs.c:2416:16: sparse:     got restricted __le32 [usertype] val
   drivers/scsi/myrs.c:2469:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] val @@
   drivers/scsi/myrs.c:2469:16: sparse:     expected unsigned int [usertype] value
   drivers/scsi/myrs.c:2469:16: sparse:     got restricted __le32 [usertype] val
   drivers/scsi/myrs.c:2454:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] val @@
   drivers/scsi/myrs.c:2454:16: sparse:     expected unsigned int [usertype] value
   drivers/scsi/myrs.c:2454:16: sparse:     got restricted __le32 [usertype] val
   drivers/scsi/myrs.c:2430:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] val @@     got unsigned int @@
   drivers/scsi/myrs.c:2430:13: sparse:     expected restricted __le32 [usertype] val
   drivers/scsi/myrs.c:2430:13: sparse:     got unsigned int
   drivers/scsi/myrs.c:2402:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] val @@
   drivers/scsi/myrs.c:2402:16: sparse:     expected unsigned int [usertype] value
   drivers/scsi/myrs.c:2402:16: sparse:     got restricted __le32 [usertype] val
   drivers/scsi/myrs.c:2461:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] val @@     got unsigned int @@
   drivers/scsi/myrs.c:2461:13: sparse:     expected restricted __le32 [usertype] val
   drivers/scsi/myrs.c:2461:13: sparse:     got unsigned int
   drivers/scsi/myrs.c:2446:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] val @@
   drivers/scsi/myrs.c:2446:16: sparse:     expected unsigned int [usertype] value
   drivers/scsi/myrs.c:2446:16: sparse:     got restricted __le32 [usertype] val
   drivers/scsi/myrs.c:2409:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] val @@
   drivers/scsi/myrs.c:2409:16: sparse:     expected unsigned int [usertype] value
   drivers/scsi/myrs.c:2409:16: sparse:     got restricted __le32 [usertype] val
--
   drivers/tty/nozomi.c:389:26: sparse: sparse: cast to restricted __le16
   drivers/tty/nozomi.c:392:26: sparse: sparse: cast to restricted __le32
   drivers/tty/nozomi.c:400:36: sparse: sparse: cast to restricted __le16
   drivers/tty/nozomi.c:404:34: sparse: sparse: cast to restricted __le32
>> drivers/tty/nozomi.c:433:24: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] value @@     got restricted __le16 [usertype] @@
   drivers/tty/nozomi.c:433:24: sparse:     expected unsigned short [usertype] value
   drivers/tty/nozomi.c:433:24: sparse:     got restricted __le16 [usertype]
   drivers/tty/nozomi.c:441:24: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   drivers/tty/nozomi.c:441:24: sparse:     expected unsigned int [usertype] value
   drivers/tty/nozomi.c:441:24: sparse:     got restricted __le32 [usertype]
   drivers/tty/nozomi.c:449:32: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] value @@     got restricted __le16 [usertype] @@
   drivers/tty/nozomi.c:449:32: sparse:     expected unsigned short [usertype] value
   drivers/tty/nozomi.c:449:32: sparse:     got restricted __le16 [usertype]
   drivers/tty/nozomi.c:453:32: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   drivers/tty/nozomi.c:453:32: sparse:     expected unsigned int [usertype] value
   drivers/tty/nozomi.c:453:32: sparse:     got restricted __le32 [usertype]
   drivers/tty/nozomi.c:332:25: sparse: sparse: array of flexible structures
   drivers/tty/nozomi.c:761:16: sparse: sparse: cast to restricted __le32
--
   drivers/rpmsg/qcom_glink_native.c:419:9: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int version @@     got restricted __le16 [assigned] [usertype] param1 @@
   drivers/rpmsg/qcom_glink_native.c:419:9: sparse:     expected unsigned int version
   drivers/rpmsg/qcom_glink_native.c:419:9: sparse:     got restricted __le16 [assigned] [usertype] param1
   drivers/rpmsg/qcom_glink_native.c:419:9: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int features @@     got restricted __le32 [assigned] [usertype] param2 @@
   drivers/rpmsg/qcom_glink_native.c:419:9: sparse:     expected unsigned int features
   drivers/rpmsg/qcom_glink_native.c:419:9: sparse:     got restricted __le32 [assigned] [usertype] param2
   drivers/rpmsg/qcom_glink_native.c:738:9: sparse: sparse: incorrect type in argument 5 (different base types) @@     expected unsigned int [usertype] count @@     got restricted __le32 [assigned] [usertype] count @@
   drivers/rpmsg/qcom_glink_native.c:738:9: sparse:     expected unsigned int [usertype] count
   drivers/rpmsg/qcom_glink_native.c:738:9: sparse:     got restricted __le32 [assigned] [usertype] count
>> drivers/rpmsg/qcom_glink_native.c:738:9: sparse: sparse: incorrect type in argument 6 (different base types) @@     expected unsigned int [usertype] size @@     got restricted __le32 [assigned] [usertype] size @@
   drivers/rpmsg/qcom_glink_native.c:738:9: sparse:     expected unsigned int [usertype] size
   drivers/rpmsg/qcom_glink_native.c:738:9: sparse:     got restricted __le32 [assigned] [usertype] size
   drivers/rpmsg/qcom_glink_native.c:738:9: sparse: sparse: incorrect type in argument 7 (different base types) @@     expected unsigned int [usertype] liid @@     got restricted __le32 [assigned] [usertype] liid @@
   drivers/rpmsg/qcom_glink_native.c:738:9: sparse:     expected unsigned int [usertype] liid
   drivers/rpmsg/qcom_glink_native.c:738:9: sparse:     got restricted __le32 [assigned] [usertype] liid
   drivers/rpmsg/qcom_glink_native.c:934:9: sparse: sparse: restricted __le16 degrades to integer
   drivers/rpmsg/qcom_glink_native.c:1067:9: sparse: sparse: incorrect type in argument 6 (different base types) @@     expected unsigned int [usertype] size @@     got restricted __le32 @@
   drivers/rpmsg/qcom_glink_native.c:1067:9: sparse:     expected unsigned int [usertype] size
   drivers/rpmsg/qcom_glink_native.c:1067:9: sparse:     got restricted __le32
   drivers/rpmsg/qcom_glink_native.c:1067:9: sparse: sparse: incorrect type in argument 7 (different base types) @@     expected unsigned int [usertype] liid @@     got restricted __le32 @@
   drivers/rpmsg/qcom_glink_native.c:1067:9: sparse:     expected unsigned int [usertype] liid
   drivers/rpmsg/qcom_glink_native.c:1067:9: sparse:     got restricted __le32
--
   drivers/infiniband/core/user_mad.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/ib_umad.h):
>> include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be32
>> include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be32
>> include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be32
>> include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be32
>> include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be32
>> include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be32
>> include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be32
>> include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be32
>> include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be32
>> include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be32
>> include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be32
>> include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be32
   include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be16
   include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be16
   include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be16
   include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be16
>> include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be32
>> include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be32
>> include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be32
>> include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be32
>> include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be32
>> include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be32
   include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be16
   include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be16
   include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be16
   include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be16
   include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be16
   include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be16
   include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be16
   include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be16
   include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be64
   include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be64
   include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be64
   include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be64
   include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be64
   include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be64
   include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be64
   include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be64
   include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be64
   include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be64
   include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be16
   include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be16
   include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be16
   include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be16
>> include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be32
>> include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be32
>> include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be32
>> include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be32
>> include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be32
>> include/trace/events/ib_umad.h:16:1: sparse: sparse: cast to restricted __be32
   drivers/infiniband/core/user_mad.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/ib_umad.h):
>> include/trace/events/ib_umad.h:16:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] qpn @@     got restricted __be32 [usertype] qpn @@
   include/trace/events/ib_umad.h:16:1: sparse:     expected unsigned int [usertype] qpn
   include/trace/events/ib_umad.h:16:1: sparse:     got restricted __be32 [usertype] qpn
>> include/trace/events/ib_umad.h:16:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] qkey @@     got restricted __be32 [usertype] qkey @@
   include/trace/events/ib_umad.h:16:1: sparse:     expected unsigned int [usertype] qkey
   include/trace/events/ib_umad.h:16:1: sparse:     got restricted __be32 [usertype] qkey
   include/trace/events/ib_umad.h:16:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] lid @@     got restricted __be16 [usertype] lid @@
   include/trace/events/ib_umad.h:16:1: sparse:     expected unsigned short [usertype] lid
   include/trace/events/ib_umad.h:16:1: sparse:     got restricted __be16 [usertype] lid
>> include/trace/events/ib_umad.h:16:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] flow_label @@     got restricted __be32 [usertype] flow_label @@
   include/trace/events/ib_umad.h:16:1: sparse:     expected unsigned int [usertype] flow_label
   include/trace/events/ib_umad.h:16:1: sparse:     got restricted __be32 [usertype] flow_label
   include/trace/events/ib_umad.h:16:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] mad_status @@     got restricted __be16 [usertype] status @@
   include/trace/events/ib_umad.h:16:1: sparse:     expected unsigned short [usertype] mad_status
   include/trace/events/ib_umad.h:16:1: sparse:     got restricted __be16 [usertype] status
   include/trace/events/ib_umad.h:16:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] class_specific @@     got restricted __be16 [usertype] class_specific @@
   include/trace/events/ib_umad.h:16:1: sparse:     expected unsigned short [usertype] class_specific
   include/trace/events/ib_umad.h:16:1: sparse:     got restricted __be16 [usertype] class_specific
   include/trace/events/ib_umad.h:16:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] tid @@     got restricted __be64 [usertype] tid @@
   include/trace/events/ib_umad.h:16:1: sparse:     expected unsigned long long [usertype] tid
   include/trace/events/ib_umad.h:16:1: sparse:     got restricted __be64 [usertype] tid
   include/trace/events/ib_umad.h:16:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] attr_id @@     got restricted __be16 [usertype] attr_id @@
   include/trace/events/ib_umad.h:16:1: sparse:     expected unsigned short [usertype] attr_id
   include/trace/events/ib_umad.h:16:1: sparse:     got restricted __be16 [usertype] attr_id
   include/trace/events/ib_umad.h:16:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] attr_mod @@     got restricted __be32 [usertype] attr_mod @@
   include/trace/events/ib_umad.h:16:1: sparse:     expected unsigned int [usertype] attr_mod
   include/trace/events/ib_umad.h:16:1: sparse:     got restricted __be32 [usertype] attr_mod
--
>> drivers/infiniband/core/roce_gid_mgmt.c:292:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct net_device [noderef] __rcu *[addressable] ndev @@     got struct net_device *ndev @@
   drivers/infiniband/core/roce_gid_mgmt.c:292:23: sparse:     expected struct net_device [noderef] __rcu *[addressable] ndev
   drivers/infiniband/core/roce_gid_mgmt.c:292:23: sparse:     got struct net_device *ndev
   drivers/infiniband/core/roce_gid_mgmt.c:386:48: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct net_device [noderef] __rcu *ndev @@     got struct net_device *ndev @@
   drivers/infiniband/core/roce_gid_mgmt.c:386:48: sparse:     expected struct net_device [noderef] __rcu *ndev
   drivers/infiniband/core/roce_gid_mgmt.c:386:48: sparse:     got struct net_device *ndev
>> drivers/infiniband/core/roce_gid_mgmt.c:832:48: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *filter_cookie @@     got struct net_device [noderef] __rcu *ndev @@
   drivers/infiniband/core/roce_gid_mgmt.c:832:48: sparse:     expected void *filter_cookie
   drivers/infiniband/core/roce_gid_mgmt.c:832:48: sparse:     got struct net_device [noderef] __rcu *ndev
   drivers/infiniband/core/roce_gid_mgmt.c:835:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct net_device *dev @@     got struct net_device [noderef] __rcu *ndev @@
   drivers/infiniband/core/roce_gid_mgmt.c:835:31: sparse:     expected struct net_device *dev
   drivers/infiniband/core/roce_gid_mgmt.c:835:31: sparse:     got struct net_device [noderef] __rcu *ndev
   drivers/infiniband/core/roce_gid_mgmt.c:872:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct net_device [noderef] __rcu *ndev @@     got struct net_device *ndev @@
   drivers/infiniband/core/roce_gid_mgmt.c:872:31: sparse:     expected struct net_device [noderef] __rcu *ndev
   drivers/infiniband/core/roce_gid_mgmt.c:872:31: sparse:     got struct net_device *ndev
--
   drivers/infiniband/core/cache.c:654:52: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/infiniband/core/cache.c:654:52: sparse:    struct net_device [noderef] __rcu *
   drivers/infiniband/core/cache.c:654:52: sparse:    struct net_device *
   drivers/infiniband/core/cache.c:692:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct net_device [noderef] __rcu *ndev @@     got struct net_device *ndev @@
   drivers/infiniband/core/cache.c:692:43: sparse:     expected struct net_device [noderef] __rcu *ndev
   drivers/infiniband/core/cache.c:692:43: sparse:     got struct net_device *ndev
   drivers/infiniband/core/cache.c:847:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct net_device [noderef] __rcu *[addressable] ndev @@     got struct net_device *ndev @@
   drivers/infiniband/core/cache.c:847:23: sparse:     expected struct net_device [noderef] __rcu *[addressable] ndev
   drivers/infiniband/core/cache.c:847:23: sparse:     got struct net_device *ndev
   drivers/infiniband/core/cache.c:1018:52: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct net_device [noderef] __rcu *ndev @@     got struct net_device *ndev @@
   drivers/infiniband/core/cache.c:1018:52: sparse:     expected struct net_device [noderef] __rcu *ndev
   drivers/infiniband/core/cache.c:1018:52: sparse:     got struct net_device *ndev
>> drivers/infiniband/core/cache.c:1389:59: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct net_device *dev @@     got struct net_device [noderef] __rcu *const ndev @@
   drivers/infiniband/core/cache.c:1389:59: sparse:     expected struct net_device *dev
   drivers/infiniband/core/cache.c:1389:59: sparse:     got struct net_device [noderef] __rcu *const ndev
--
   drivers/mtd/nand/onenand/onenand_base.c:779:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/onenand/onenand_base.c:779:9: sparse:     expected void const *
   drivers/mtd/nand/onenand/onenand_base.c:779:9: sparse:     got void [noderef] __iomem *
   drivers/mtd/nand/onenand/onenand_base.c:779:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/onenand/onenand_base.c:779:9: sparse:     expected void const *
   drivers/mtd/nand/onenand/onenand_base.c:779:9: sparse:     got void [noderef] __iomem *
   drivers/mtd/nand/onenand/onenand_base.c:779:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/onenand/onenand_base.c:779:9: sparse:     expected void const *
   drivers/mtd/nand/onenand/onenand_base.c:779:9: sparse:     got void [noderef] __iomem *
   drivers/mtd/nand/onenand/onenand_base.c:817:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/onenand/onenand_base.c:817:9: sparse:     expected void const *
   drivers/mtd/nand/onenand/onenand_base.c:817:9: sparse:     got void [noderef] __iomem *
   drivers/mtd/nand/onenand/onenand_base.c:817:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/onenand/onenand_base.c:817:9: sparse:     expected void const *
   drivers/mtd/nand/onenand/onenand_base.c:817:9: sparse:     got void [noderef] __iomem *
   drivers/mtd/nand/onenand/onenand_base.c:817:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/onenand/onenand_base.c:817:9: sparse:     expected void const *
   drivers/mtd/nand/onenand/onenand_base.c:817:9: sparse:     got void [noderef] __iomem *
   drivers/mtd/nand/onenand/onenand_base.c:860:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/onenand/onenand_base.c:860:9: sparse:     expected void const *
   drivers/mtd/nand/onenand/onenand_base.c:860:9: sparse:     got void [noderef] __iomem *
   drivers/mtd/nand/onenand/onenand_base.c:860:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/onenand/onenand_base.c:860:9: sparse:     expected void const *
   drivers/mtd/nand/onenand/onenand_base.c:860:9: sparse:     got void [noderef] __iomem *
>> drivers/mtd/nand/onenand/onenand_base.c:860:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/onenand/onenand_base.c:860:9: sparse:     expected void *
   drivers/mtd/nand/onenand/onenand_base.c:860:9: sparse:     got void [noderef] __iomem *
--
   drivers/net/ethernet/broadcom/cnic.c:1743:56: sparse:     got unsigned int
   drivers/net/ethernet/broadcom/cnic.c:1745:56: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] hi @@     got unsigned long long @@
   drivers/net/ethernet/broadcom/cnic.c:1745:56: sparse:     expected restricted __le32 [usertype] hi
   drivers/net/ethernet/broadcom/cnic.c:1745:56: sparse:     got unsigned long long
   drivers/net/ethernet/broadcom/cnic.c:1747:61: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] lo @@     got unsigned int [usertype] @@
   drivers/net/ethernet/broadcom/cnic.c:1747:61: sparse:     expected restricted __le32 [usertype] lo
   drivers/net/ethernet/broadcom/cnic.c:1747:61: sparse:     got unsigned int [usertype]
   drivers/net/ethernet/broadcom/cnic.c:1749:61: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] hi @@     got unsigned int [usertype] @@
   drivers/net/ethernet/broadcom/cnic.c:1749:61: sparse:     expected restricted __le32 [usertype] hi
   drivers/net/ethernet/broadcom/cnic.c:1749:61: sparse:     got unsigned int [usertype]
   drivers/net/ethernet/broadcom/cnic.c:1751:56: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] lo @@     got unsigned int @@
   drivers/net/ethernet/broadcom/cnic.c:1751:56: sparse:     expected restricted __le32 [usertype] lo
   drivers/net/ethernet/broadcom/cnic.c:1751:56: sparse:     got unsigned int
   drivers/net/ethernet/broadcom/cnic.c:1753:56: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] hi @@     got unsigned long long @@
   drivers/net/ethernet/broadcom/cnic.c:1753:56: sparse:     expected restricted __le32 [usertype] hi
   drivers/net/ethernet/broadcom/cnic.c:1753:56: sparse:     got unsigned long long
   drivers/net/ethernet/broadcom/cnic.c:1775:57: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] lo @@     got unsigned int @@
   drivers/net/ethernet/broadcom/cnic.c:1775:57: sparse:     expected restricted __le32 [usertype] lo
   drivers/net/ethernet/broadcom/cnic.c:1775:57: sparse:     got unsigned int
   drivers/net/ethernet/broadcom/cnic.c:1777:57: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] hi @@     got unsigned int [usertype] rq_page_table_addr_hi @@
   drivers/net/ethernet/broadcom/cnic.c:1777:57: sparse:     expected restricted __le32 [usertype] hi
   drivers/net/ethernet/broadcom/cnic.c:1777:57: sparse:     got unsigned int [usertype] rq_page_table_addr_hi
   drivers/net/ethernet/broadcom/cnic.c:1788:53: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] lo @@     got unsigned int [usertype] rq_page_table_addr_lo @@
   drivers/net/ethernet/broadcom/cnic.c:1788:53: sparse:     expected restricted __le32 [usertype] lo
   drivers/net/ethernet/broadcom/cnic.c:1788:53: sparse:     got unsigned int [usertype] rq_page_table_addr_lo
   drivers/net/ethernet/broadcom/cnic.c:1790:53: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] hi @@     got unsigned int [usertype] rq_page_table_addr_hi @@
   drivers/net/ethernet/broadcom/cnic.c:1790:53: sparse:     expected restricted __le32 [usertype] hi
   drivers/net/ethernet/broadcom/cnic.c:1790:53: sparse:     got unsigned int [usertype] rq_page_table_addr_hi
   drivers/net/ethernet/broadcom/cnic.c:1792:53: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] lo @@     got unsigned int [usertype] hi @@
   drivers/net/ethernet/broadcom/cnic.c:1792:53: sparse:     expected restricted __le32 [usertype] lo
   drivers/net/ethernet/broadcom/cnic.c:1792:53: sparse:     got unsigned int [usertype] hi
   drivers/net/ethernet/broadcom/cnic.c:1793:53: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] hi @@     got unsigned int [usertype] lo @@
   drivers/net/ethernet/broadcom/cnic.c:1793:53: sparse:     expected restricted __le32 [usertype] hi
   drivers/net/ethernet/broadcom/cnic.c:1793:53: sparse:     got unsigned int [usertype] lo
   drivers/net/ethernet/broadcom/cnic.c:1794:55: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] lo @@     got unsigned int @@
   drivers/net/ethernet/broadcom/cnic.c:1794:55: sparse:     expected restricted __le32 [usertype] lo
   drivers/net/ethernet/broadcom/cnic.c:1794:55: sparse:     got unsigned int
   drivers/net/ethernet/broadcom/cnic.c:1796:55: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] hi @@     got unsigned long long @@
   drivers/net/ethernet/broadcom/cnic.c:1796:55: sparse:     expected restricted __le32 [usertype] hi
   drivers/net/ethernet/broadcom/cnic.c:1796:55: sparse:     got unsigned long long
   drivers/net/ethernet/broadcom/cnic.c:1798:55: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] lo @@     got unsigned int [usertype] @@
   drivers/net/ethernet/broadcom/cnic.c:1798:55: sparse:     expected restricted __le32 [usertype] lo
   drivers/net/ethernet/broadcom/cnic.c:1798:55: sparse:     got unsigned int [usertype]
   drivers/net/ethernet/broadcom/cnic.c:1800:55: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] hi @@     got unsigned int [usertype] @@
   drivers/net/ethernet/broadcom/cnic.c:1800:55: sparse:     expected restricted __le32 [usertype] hi
   drivers/net/ethernet/broadcom/cnic.c:1800:55: sparse:     got unsigned int [usertype]
   drivers/net/ethernet/broadcom/cnic.c:1802:53: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] lo @@     got unsigned int [usertype] cq_page_table_addr_lo @@
   drivers/net/ethernet/broadcom/cnic.c:1802:53: sparse:     expected restricted __le32 [usertype] lo
   drivers/net/ethernet/broadcom/cnic.c:1802:53: sparse:     got unsigned int [usertype] cq_page_table_addr_lo
   drivers/net/ethernet/broadcom/cnic.c:1804:53: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] hi @@     got unsigned int [usertype] cq_page_table_addr_hi @@
   drivers/net/ethernet/broadcom/cnic.c:1804:53: sparse:     expected restricted __le32 [usertype] hi
   drivers/net/ethernet/broadcom/cnic.c:1804:53: sparse:     got unsigned int [usertype] cq_page_table_addr_hi
   drivers/net/ethernet/broadcom/cnic.c:1807:56: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] lo @@     got unsigned int [usertype] hi @@
   drivers/net/ethernet/broadcom/cnic.c:1807:56: sparse:     expected restricted __le32 [usertype] lo
   drivers/net/ethernet/broadcom/cnic.c:1807:56: sparse:     got unsigned int [usertype] hi
   drivers/net/ethernet/broadcom/cnic.c:1808:56: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] hi @@     got unsigned int [usertype] lo @@
   drivers/net/ethernet/broadcom/cnic.c:1808:56: sparse:     expected restricted __le32 [usertype] hi
   drivers/net/ethernet/broadcom/cnic.c:1808:56: sparse:     got unsigned int [usertype] lo
   drivers/net/ethernet/broadcom/cnic.c:1822:64: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] lo @@     got unsigned int [usertype] hi @@
   drivers/net/ethernet/broadcom/cnic.c:1822:64: sparse:     expected restricted __le32 [usertype] lo
   drivers/net/ethernet/broadcom/cnic.c:1822:64: sparse:     got unsigned int [usertype] hi
   drivers/net/ethernet/broadcom/cnic.c:1824:64: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] hi @@     got unsigned int [usertype] lo @@
   drivers/net/ethernet/broadcom/cnic.c:1824:64: sparse:     expected restricted __le32 [usertype] hi
   drivers/net/ethernet/broadcom/cnic.c:1824:64: sparse:     got unsigned int [usertype] lo
   drivers/net/ethernet/broadcom/cnic.c:1828:50: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] lo @@     got unsigned int @@
   drivers/net/ethernet/broadcom/cnic.c:1828:50: sparse:     expected restricted __le32 [usertype] lo
   drivers/net/ethernet/broadcom/cnic.c:1828:50: sparse:     got unsigned int
   drivers/net/ethernet/broadcom/cnic.c:1830:50: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] hi @@     got unsigned long long @@
   drivers/net/ethernet/broadcom/cnic.c:1830:50: sparse:     expected restricted __le32 [usertype] hi
   drivers/net/ethernet/broadcom/cnic.c:1830:50: sparse:     got unsigned long long
   drivers/net/ethernet/broadcom/cnic.c:1832:49: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] lo @@     got unsigned int [usertype] @@
   drivers/net/ethernet/broadcom/cnic.c:1832:49: sparse:     expected restricted __le32 [usertype] lo
   drivers/net/ethernet/broadcom/cnic.c:1832:49: sparse:     got unsigned int [usertype]
   drivers/net/ethernet/broadcom/cnic.c:1834:49: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] hi @@     got unsigned int [usertype] @@
   drivers/net/ethernet/broadcom/cnic.c:1834:49: sparse:     expected restricted __le32 [usertype] hi
   drivers/net/ethernet/broadcom/cnic.c:1834:49: sparse:     got unsigned int [usertype]
   drivers/net/ethernet/broadcom/cnic.c:1845:48: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] lo @@     got unsigned int @@
   drivers/net/ethernet/broadcom/cnic.c:1845:48: sparse:     expected restricted __le32 [usertype] lo
   drivers/net/ethernet/broadcom/cnic.c:1845:48: sparse:     got unsigned int
   drivers/net/ethernet/broadcom/cnic.c:1847:48: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] hi @@     got unsigned long long @@
   drivers/net/ethernet/broadcom/cnic.c:1847:48: sparse:     expected restricted __le32 [usertype] hi
   drivers/net/ethernet/broadcom/cnic.c:1847:48: sparse:     got unsigned long long
   drivers/net/ethernet/broadcom/cnic.c:1849:48: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] lo @@     got unsigned int [usertype] @@
   drivers/net/ethernet/broadcom/cnic.c:1849:48: sparse:     expected restricted __le32 [usertype] lo
   drivers/net/ethernet/broadcom/cnic.c:1849:48: sparse:     got unsigned int [usertype]
   drivers/net/ethernet/broadcom/cnic.c:1850:48: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] hi @@     got unsigned int [usertype] @@
   drivers/net/ethernet/broadcom/cnic.c:1850:48: sparse:     expected restricted __le32 [usertype] hi
   drivers/net/ethernet/broadcom/cnic.c:1850:48: sparse:     got unsigned int [usertype]
   drivers/net/ethernet/broadcom/cnic.c:1851:50: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] lo @@     got unsigned int @@
   drivers/net/ethernet/broadcom/cnic.c:1851:50: sparse:     expected restricted __le32 [usertype] lo
   drivers/net/ethernet/broadcom/cnic.c:1851:50: sparse:     got unsigned int
   drivers/net/ethernet/broadcom/cnic.c:1853:50: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] hi @@     got unsigned long long @@
   drivers/net/ethernet/broadcom/cnic.c:1853:50: sparse:     expected restricted __le32 [usertype] hi
   drivers/net/ethernet/broadcom/cnic.c:1853:50: sparse:     got unsigned long long
   drivers/net/ethernet/broadcom/cnic.c:1857:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] lo @@     got unsigned int @@
   drivers/net/ethernet/broadcom/cnic.c:1857:47: sparse:     expected restricted __le32 [usertype] lo
   drivers/net/ethernet/broadcom/cnic.c:1857:47: sparse:     got unsigned int
   drivers/net/ethernet/broadcom/cnic.c:1859:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] hi @@     got unsigned int [usertype] cq_page_table_addr_hi @@
   drivers/net/ethernet/broadcom/cnic.c:1859:47: sparse:     expected restricted __le32 [usertype] hi
   drivers/net/ethernet/broadcom/cnic.c:1859:47: sparse:     got unsigned int [usertype] cq_page_table_addr_hi
>> drivers/net/ethernet/broadcom/cnic.c:2078:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got fouled restricted __sum16 @@
   drivers/net/ethernet/broadcom/cnic.c:2078:17: sparse:     expected unsigned short [usertype] val
   drivers/net/ethernet/broadcom/cnic.c:2078:17: sparse:     got fouled restricted __sum16
   drivers/net/ethernet/broadcom/cnic.c:2078:17: sparse: sparse: cast from restricted __sum16
   drivers/net/ethernet/broadcom/cnic.c:2078:17: sparse: sparse: cast from restricted __sum16
   drivers/net/ethernet/broadcom/cnic.c:2327:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] lo @@     got unsigned int @@
   drivers/net/ethernet/broadcom/cnic.c:2327:35: sparse:     expected restricted __le32 [usertype] lo
   drivers/net/ethernet/broadcom/cnic.c:2327:35: sparse:     got unsigned int
   drivers/net/ethernet/broadcom/cnic.c:2328:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] hi @@     got unsigned long long @@
   drivers/net/ethernet/broadcom/cnic.c:2328:35: sparse:     expected restricted __le32 [usertype] hi
   drivers/net/ethernet/broadcom/cnic.c:2328:35: sparse:     got unsigned long long
   drivers/net/ethernet/broadcom/cnic.c:2329:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] eq_pbl_size @@     got int num_pages @@
   drivers/net/ethernet/broadcom/cnic.c:2329:32: sparse:     expected restricted __le32 [usertype] eq_pbl_size
   drivers/net/ethernet/broadcom/cnic.c:2329:32: sparse:     got int num_pages
   drivers/net/ethernet/broadcom/cnic.c:2331:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] sb_num @@     got unsigned int [usertype] status_blk_num @@
   drivers/net/ethernet/broadcom/cnic.c:2331:27: sparse:     expected restricted __le16 [usertype] sb_num
   drivers/net/ethernet/broadcom/cnic.c:2331:27: sparse:     got unsigned int [usertype] status_blk_num
   drivers/net/ethernet/broadcom/cnic.c:2332:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] eq_prod @@     got unsigned int @@
   drivers/net/ethernet/broadcom/cnic.c:2332:28: sparse:     expected restricted __le16 [usertype] eq_prod
   drivers/net/ethernet/broadcom/cnic.c:2332:28: sparse:     got unsigned int
   drivers/net/ethernet/broadcom/cnic.c:2373:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] l5_cid @@     got restricted __le16 [usertype] fcoe_conn_id @@
   drivers/net/ethernet/broadcom/cnic.c:2373:16: sparse:     expected unsigned int [usertype] l5_cid
   drivers/net/ethernet/broadcom/cnic.c:2373:16: sparse:     got restricted __le16 [usertype] fcoe_conn_id
   drivers/net/ethernet/broadcom/cnic.c:2430:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] fcoe_conn_id @@     got restricted __le16 [usertype] fcoe_conn_id @@
   drivers/net/ethernet/broadcom/cnic.c:2430:27: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] fcoe_conn_id
   drivers/net/ethernet/broadcom/cnic.c:2430:27: sparse:     got restricted __le16 [usertype] fcoe_conn_id
   drivers/net/ethernet/broadcom/cnic.c:2431:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] completion_status @@     got int @@
   drivers/net/ethernet/broadcom/cnic.c:2431:32: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] completion_status
   drivers/net/ethernet/broadcom/cnic.c:2431:32: sparse:     got int
   drivers/net/ethernet/broadcom/cnic.c:2448:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] cid @@     got restricted __le32 [usertype] context_id @@
   drivers/net/ethernet/broadcom/cnic.c:2448:13: sparse:     expected unsigned int [usertype] cid
   drivers/net/ethernet/broadcom/cnic.c:2448:13: sparse:     got restricted __le32 [usertype] context_id
   drivers/net/ethernet/broadcom/cnic.c:2449:21: sparse: sparse: restricted __le32 degrades to integer
   drivers/net/ethernet/broadcom/cnic.c:2476:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] cid @@     got restricted __le32 [usertype] context_id @@
   drivers/net/ethernet/broadcom/cnic.c:2476:13: sparse:     expected unsigned int [usertype] cid
   drivers/net/ethernet/broadcom/cnic.c:2476:13: sparse:     got restricted __le32 [usertype] context_id
   drivers/net/ethernet/broadcom/cnic.c:2477:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] l5_cid @@     got restricted __le32 [usertype] conn_id @@
   drivers/net/ethernet/broadcom/cnic.c:2477:16: sparse:     expected unsigned int [usertype] l5_cid
   drivers/net/ethernet/broadcom/cnic.c:2477:16: sparse:     got restricted __le32 [usertype] conn_id
   drivers/net/ethernet/broadcom/cnic.c:2510:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] cid @@     got restricted __le32 [usertype] context_id @@
   drivers/net/ethernet/broadcom/cnic.c:2510:13: sparse:     expected unsigned int [usertype] cid
   drivers/net/ethernet/broadcom/cnic.c:2510:13: sparse:     got restricted __le32 [usertype] context_id
   drivers/net/ethernet/broadcom/cnic.c:2511:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] l5_cid @@     got restricted __le32 [usertype] conn_id @@
   drivers/net/ethernet/broadcom/cnic.c:2511:16: sparse:     expected unsigned int [usertype] l5_cid
   drivers/net/ethernet/broadcom/cnic.c:2511:16: sparse:     got restricted __le32 [usertype] conn_id
   drivers/net/ethernet/broadcom/cnic.c:2523:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [usertype] completion_status @@     got int @@
   drivers/net/ethernet/broadcom/cnic.c:2523:32: sparse:     expected restricted __le32 [addressable] [usertype] completion_status
   drivers/net/ethernet/broadcom/cnic.c:2523:32: sparse:     got int
   drivers/net/ethernet/broadcom/cnic.c:2538:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] fcoe_conn_context_id @@     got unsigned int [usertype] cid @@
   drivers/net/ethernet/broadcom/cnic.c:2538:35: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] fcoe_conn_context_id
   drivers/net/ethernet/broadcom/cnic.c:2538:35: sparse:     got unsigned int [usertype] cid
   drivers/net/ethernet/broadcom/cnic.c:2610:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] cid @@     got restricted __le32 [usertype] context_id @@
   drivers/net/ethernet/broadcom/cnic.c:2610:29: sparse:     expected unsigned int [assigned] [usertype] cid
   drivers/net/ethernet/broadcom/cnic.c:2610:29: sparse:     got restricted __le32 [usertype] context_id
   drivers/net/ethernet/broadcom/cnic.c:2611:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] l5_cid @@     got restricted __le32 [usertype] conn_id @@
   drivers/net/ethernet/broadcom/cnic.c:2611:32: sparse:     expected unsigned int [usertype] l5_cid
   drivers/net/ethernet/broadcom/cnic.c:2611:32: sparse:     got restricted __le32 [usertype] conn_id
   drivers/net/ethernet/broadcom/cnic.c:3512:40: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3512:40: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3512:40: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3512:40: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3512:40: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3512:40: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3513:40: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3513:40: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3513:40: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3513:40: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3513:40: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3513:40: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3514:40: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3514:40: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3514:40: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3514:40: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3514:40: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3514:40: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3515:40: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3515:40: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3515:40: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3515:40: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3515:40: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3515:40: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3516:40: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3516:40: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3516:40: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3516:40: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3516:40: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3516:40: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3517:40: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3517:40: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3517:40: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3517:40: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3517:40: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3517:40: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3532:27: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3532:27: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3532:27: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3532:27: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3532:27: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3532:27: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3533:27: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/broadcom/cnic.c:3533:27: sparse: sparse: cast to restricted __be32
--
>> drivers/infiniband/ulp/rtrs/rtrs-srv.c:1037:16: sparse: sparse: restricted __le16 degrades to integer
--
   drivers/net/ethernet/chelsio/cxgb3/sge.c:2371:50: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] rss @@     got restricted __be32 [assigned] [usertype] rss_hi @@
   drivers/net/ethernet/chelsio/cxgb3/sge.c:2371:50: sparse:     expected unsigned int [usertype] rss
   drivers/net/ethernet/chelsio/cxgb3/sge.c:2371:50: sparse:     got restricted __be32 [assigned] [usertype] rss_hi
   drivers/net/ethernet/chelsio/cxgb3/sge.c:2434:43: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __wsum [usertype] csum @@     got restricted __be32 [assigned] [usertype] rss_hi @@
   drivers/net/ethernet/chelsio/cxgb3/sge.c:2434:43: sparse:     expected restricted __wsum [usertype] csum
   drivers/net/ethernet/chelsio/cxgb3/sge.c:2434:43: sparse:     got restricted __be32 [assigned] [usertype] rss_hi
   drivers/net/ethernet/chelsio/cxgb3/sge.c:2435:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] priority @@     got restricted __be32 [assigned] [usertype] rss_lo @@
   drivers/net/ethernet/chelsio/cxgb3/sge.c:2435:47: sparse:     expected unsigned int [usertype] priority
   drivers/net/ethernet/chelsio/cxgb3/sge.c:2435:47: sparse:     got restricted __be32 [assigned] [usertype] rss_lo
>> drivers/net/ethernet/chelsio/cxgb3/sge.c:2120:16: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/chelsio/cxgb3/sge.c:2120:16: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/chelsio/cxgb3/sge.c:2120:16: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/chelsio/cxgb3/sge.c:2120:16: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/chelsio/cxgb3/sge.c:2120:16: sparse: sparse: cast to restricted __be32
>> drivers/net/ethernet/chelsio/cxgb3/sge.c:2120:16: sparse: sparse: cast to restricted __be32
--
   drivers/net/ethernet/chelsio/cxgb3/t3_hw.c:833:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/chelsio/cxgb3/t3_hw.c:833:31: sparse:     expected unsigned int [usertype]
   drivers/net/ethernet/chelsio/cxgb3/t3_hw.c:833:31: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/chelsio/cxgb3/t3_hw.c:3601:52: sparse: sparse: dubious: !x | y
--
   drivers/net/ethernet/emulex/benet/be_cmds.c:315:39: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:316:39: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:390:43: sparse: sparse: cast to restricted __le16
   drivers/net/ethernet/emulex/benet/be_cmds.c:401:33: sparse: sparse: cast to restricted __le16
   drivers/net/ethernet/emulex/benet/be_cmds.c:413:23: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:417:42: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:460:44: sparse: sparse: cast to restricted __le16
   drivers/net/ethernet/emulex/benet/be_cmds.c:804:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] request_length @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:804:33: sparse:     expected unsigned int [usertype] request_length
   drivers/net/ethernet/emulex/benet/be_cmds.c:804:33: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:812:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] pa_hi @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:812:28: sparse:     expected unsigned int [usertype] pa_hi
   drivers/net/ethernet/emulex/benet/be_cmds.c:812:28: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:813:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] pa_lo @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:813:28: sparse:     expected unsigned int [usertype] pa_lo
   drivers/net/ethernet/emulex/benet/be_cmds.c:813:28: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:814:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] len @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:814:26: sparse:     expected unsigned int [usertype] len
   drivers/net/ethernet/emulex/benet/be_cmds.c:814:26: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:827:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] lo @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:827:29: sparse:     expected unsigned int [usertype] lo
   drivers/net/ethernet/emulex/benet/be_cmds.c:827:29: sparse:     got restricted __le32 [usertype]
>> drivers/net/ethernet/emulex/benet/be_cmds.c:828:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] hi @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:828:29: sparse:     expected unsigned int [usertype] hi
   drivers/net/ethernet/emulex/benet/be_cmds.c:828:29: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:899:29: sparse: sparse: restricted __le32 degrades to integer
   drivers/net/ethernet/emulex/benet/be_cmds.c:1017:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] num_pages @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:1017:24: sparse:     expected unsigned short [usertype] num_pages
   drivers/net/ethernet/emulex/benet/be_cmds.c:1017:24: sparse:     got restricted __le16 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:1032:29: sparse: sparse: cast to restricted __le16
   drivers/net/ethernet/emulex/benet/be_cmds.c:1034:38: sparse: sparse: cast to restricted __le16
   drivers/net/ethernet/emulex/benet/be_cmds.c:1066:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] if_id @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:1066:28: sparse:     expected unsigned short [usertype] if_id
   drivers/net/ethernet/emulex/benet/be_cmds.c:1066:28: sparse:     got restricted __le16 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:1067:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] pmac_id @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:1067:30: sparse:     expected unsigned int [usertype] pmac_id
   drivers/net/ethernet/emulex/benet/be_cmds.c:1067:30: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:1105:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] if_id @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:1105:20: sparse:     expected unsigned int [usertype] if_id
   drivers/net/ethernet/emulex/benet/be_cmds.c:1105:20: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:1112:28: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:1148:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] if_id @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:1148:20: sparse:     expected unsigned int [usertype] if_id
   drivers/net/ethernet/emulex/benet/be_cmds.c:1148:20: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:1149:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] pmac_id @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:1149:22: sparse:     expected unsigned int [usertype] pmac_id
   drivers/net/ethernet/emulex/benet/be_cmds.c:1149:22: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:1179:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] num_pages @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:1179:24: sparse:     expected unsigned short [usertype] num_pages
   drivers/net/ethernet/emulex/benet/be_cmds.c:1179:24: sparse:     got restricted __le16 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:1218:26: sparse: sparse: cast to restricted __le16
   drivers/net/ethernet/emulex/benet/be_cmds.c:1257:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] num_pages @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:1257:24: sparse:     expected unsigned short [usertype] num_pages
   drivers/net/ethernet/emulex/benet/be_cmds.c:1257:24: sparse:     got restricted __le16 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:1265:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] cq_id @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:1265:28: sparse:     expected unsigned short [usertype] cq_id
   drivers/net/ethernet/emulex/benet/be_cmds.c:1265:28: sparse:     got restricted __le16 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:1279:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:1279:36: sparse:     expected unsigned int
   drivers/net/ethernet/emulex/benet/be_cmds.c:1279:36: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:1293:28: sparse: sparse: cast to restricted __le16
   drivers/net/ethernet/emulex/benet/be_cmds.c:1322:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] num_pages @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:1322:24: sparse:     expected unsigned short [usertype] num_pages
   drivers/net/ethernet/emulex/benet/be_cmds.c:1322:24: sparse:     got restricted __le16 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:1337:28: sparse: sparse: cast to restricted __le16
   drivers/net/ethernet/emulex/benet/be_cmds.c:1383:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] if_id @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:1383:28: sparse:     expected unsigned short [usertype] if_id
   drivers/net/ethernet/emulex/benet/be_cmds.c:1383:28: sparse:     got restricted __le16 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:1387:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] cq_id @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:1387:20: sparse:     expected unsigned short [usertype] cq_id
   drivers/net/ethernet/emulex/benet/be_cmds.c:1387:20: sparse:     got restricted __le16 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:1396:27: sparse: sparse: cast to restricted __le16
   drivers/net/ethernet/emulex/benet/be_cmds.c:1398:42: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:1429:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] cq_id @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:1429:20: sparse:     expected unsigned short [usertype] cq_id
   drivers/net/ethernet/emulex/benet/be_cmds.c:1429:20: sparse:     got restricted __le16 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:1433:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] interface_id @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:1433:27: sparse:     expected unsigned int [usertype] interface_id
   drivers/net/ethernet/emulex/benet/be_cmds.c:1433:27: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:1434:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] max_frame_size @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:1434:29: sparse:     expected unsigned short [usertype] max_frame_size
   drivers/net/ethernet/emulex/benet/be_cmds.c:1434:29: sparse:     got restricted __le16 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:1435:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] rss_queue @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:1435:24: sparse:     expected unsigned int [usertype] rss_queue
   drivers/net/ethernet/emulex/benet/be_cmds.c:1435:24: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:1441:27: sparse: sparse: cast to restricted __le16
   drivers/net/ethernet/emulex/benet/be_cmds.c:1495:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] id @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:1495:17: sparse:     expected unsigned short [usertype] id
   drivers/net/ethernet/emulex/benet/be_cmds.c:1495:17: sparse:     got restricted __le16 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:1522:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] id @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:1522:17: sparse:     expected unsigned short [usertype] id
   drivers/net/ethernet/emulex/benet/be_cmds.c:1522:17: sparse:     got restricted __le16 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:1547:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] capability_flags @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:1547:31: sparse:     expected unsigned int [usertype] capability_flags
   drivers/net/ethernet/emulex/benet/be_cmds.c:1547:31: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:1548:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] enable_flags @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:1548:27: sparse:     expected unsigned int [usertype] enable_flags
   drivers/net/ethernet/emulex/benet/be_cmds.c:1548:27: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:1555:30: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:1559:47: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:1580:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] interface_id @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:1580:27: sparse:     expected unsigned int [usertype] interface_id
   drivers/net/ethernet/emulex/benet/be_cmds.c:1580:27: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:1653:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] pport_num @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:1653:42: sparse:     expected unsigned short [usertype] pport_num
   drivers/net/ethernet/emulex/benet/be_cmds.c:1653:42: sparse:     got restricted __le16 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:1728:39: sparse: sparse: cast to restricted __le16
   drivers/net/ethernet/emulex/benet/be_cmds.c:1781:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] fat_operation @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:1781:28: sparse:     expected unsigned int [usertype] fat_operation
   drivers/net/ethernet/emulex/benet/be_cmds.c:1781:28: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:1787:38: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:1832:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] fat_operation @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:1832:36: sparse:     expected unsigned int [usertype] fat_operation
   drivers/net/ethernet/emulex/benet/be_cmds.c:1832:36: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:1833:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] read_log_offset @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:1833:38: sparse:     expected unsigned int [usertype] read_log_offset
   drivers/net/ethernet/emulex/benet/be_cmds.c:1833:38: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:1834:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] read_log_length @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:1834:38: sparse:     expected unsigned int [usertype] read_log_length
   drivers/net/ethernet/emulex/benet/be_cmds.c:1834:38: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:1835:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] data_buffer_size @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:1835:39: sparse:     expected unsigned int [usertype] data_buffer_size
   drivers/net/ethernet/emulex/benet/be_cmds.c:1835:39: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:1841:25: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:1915:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] num_eq @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:1915:21: sparse:     expected unsigned int [usertype] num_eq
   drivers/net/ethernet/emulex/benet/be_cmds.c:1915:21: sparse:     got restricted __le32 [usertype]
>> drivers/net/ethernet/emulex/benet/be_cmds.c:1917:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] eq_id @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:1917:39: sparse:     expected unsigned int [usertype] eq_id
   drivers/net/ethernet/emulex/benet/be_cmds.c:1917:39: sparse:     got restricted __le32 [usertype]
>> drivers/net/ethernet/emulex/benet/be_cmds.c:1919:50: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] delay_multiplier @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:1919:50: sparse:     expected unsigned int [usertype] delay_multiplier
   drivers/net/ethernet/emulex/benet/be_cmds.c:1919:50: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:1997:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] if_id @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:1997:20: sparse:     expected unsigned int [usertype] if_id
   drivers/net/ethernet/emulex/benet/be_cmds.c:1997:20: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:1998:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] if_flags_mask @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:1998:28: sparse:     expected unsigned int [usertype] if_flags_mask
   drivers/net/ethernet/emulex/benet/be_cmds.c:1998:28: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:2007:36: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/emulex/benet/be_cmds.c:2007:36: sparse:    left side has type unsigned int
   drivers/net/ethernet/emulex/benet/be_cmds.c:2007:36: sparse:    right side has type restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:2010:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] mcast_num @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:2010:32: sparse:     expected unsigned int [usertype] mcast_num
   drivers/net/ethernet/emulex/benet/be_cmds.c:2010:32: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:2063:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] tx_flow_control @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:2063:30: sparse:     expected unsigned short [usertype] tx_flow_control
   drivers/net/ethernet/emulex/benet/be_cmds.c:2063:30: sparse:     got restricted __le16 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:2064:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] rx_flow_control @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:2064:30: sparse:     expected unsigned short [usertype] rx_flow_control
   drivers/net/ethernet/emulex/benet/be_cmds.c:2064:30: sparse:     got restricted __le16 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:2106:26: sparse: sparse: cast to restricted __le16
   drivers/net/ethernet/emulex/benet/be_cmds.c:2107:26: sparse: sparse: cast to restricted __le16
   drivers/net/ethernet/emulex/benet/be_cmds.c:2136:37: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:2137:42: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:2138:42: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:2139:37: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:2204:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] if_id @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:2204:20: sparse:     expected unsigned int [usertype] if_id
   drivers/net/ethernet/emulex/benet/be_cmds.c:2204:20: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:2205:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] enable_rss @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:2205:25: sparse:     expected unsigned short [usertype] enable_rss
   drivers/net/ethernet/emulex/benet/be_cmds.c:2205:25: sparse:     got restricted __le16 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:2206:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] cpu_table_size_log2 @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:2206:34: sparse:     expected unsigned short [usertype] cpu_table_size_log2
   drivers/net/ethernet/emulex/benet/be_cmds.c:2206:34: sparse:     got restricted __le16 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:2376:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] write_offset @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:2376:27: sparse:     expected unsigned int [usertype] write_offset
   drivers/net/ethernet/emulex/benet/be_cmds.c:2376:27: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:2378:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] descriptor_count @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:2378:31: sparse:     expected unsigned int [usertype] descriptor_count
   drivers/net/ethernet/emulex/benet/be_cmds.c:2378:31: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:2379:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] buf_len @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:2379:22: sparse:     expected unsigned int [usertype] buf_len
   drivers/net/ethernet/emulex/benet/be_cmds.c:2379:22: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:2380:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] addr_low @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:2380:23: sparse:     expected unsigned int [usertype] addr_low
   drivers/net/ethernet/emulex/benet/be_cmds.c:2380:23: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:2383:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] addr_high @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:2383:24: sparse:     expected unsigned int [usertype] addr_high
   drivers/net/ethernet/emulex/benet/be_cmds.c:2383:24: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:2400:33: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:2509:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] desired_read_len @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:2509:31: sparse:     expected unsigned int [usertype] desired_read_len
   drivers/net/ethernet/emulex/benet/be_cmds.c:2509:31: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:2510:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] read_offset @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:2510:26: sparse:     expected unsigned int [usertype] read_offset
   drivers/net/ethernet/emulex/benet/be_cmds.c:2510:26: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:2512:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] descriptor_count @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:2512:31: sparse:     expected unsigned int [usertype] descriptor_count
   drivers/net/ethernet/emulex/benet/be_cmds.c:2512:31: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:2513:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] buf_len @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:2513:22: sparse:     expected unsigned int [usertype] buf_len
   drivers/net/ethernet/emulex/benet/be_cmds.c:2513:22: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:2514:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] addr_low @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:2514:23: sparse:     expected unsigned int [usertype] addr_low
   drivers/net/ethernet/emulex/benet/be_cmds.c:2514:23: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:2515:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] addr_high @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:2515:24: sparse:     expected unsigned int [usertype] addr_high
   drivers/net/ethernet/emulex/benet/be_cmds.c:2515:24: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:2521:30: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:2522:24: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:2554:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] op_type @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:2554:29: sparse:     expected unsigned int [usertype] op_type
   drivers/net/ethernet/emulex/benet/be_cmds.c:2554:29: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:2556:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] offset @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:2556:36: sparse:     expected unsigned int [usertype] offset
   drivers/net/ethernet/emulex/benet/be_cmds.c:2556:36: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:2558:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] op_code @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:2558:29: sparse:     expected unsigned int [usertype] op_code
   drivers/net/ethernet/emulex/benet/be_cmds.c:2558:29: sparse:     got restricted __le32 [usertype]
>> drivers/net/ethernet/emulex/benet/be_cmds.c:2559:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] data_buf_size @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:2559:35: sparse:     expected unsigned int [usertype] data_buf_size
   drivers/net/ethernet/emulex/benet/be_cmds.c:2559:35: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:2600:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] op_type @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:2600:29: sparse:     expected unsigned int [usertype] op_type
   drivers/net/ethernet/emulex/benet/be_cmds.c:2600:29: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:2602:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] offset @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:2602:36: sparse:     expected unsigned int [usertype] offset
   drivers/net/ethernet/emulex/benet/be_cmds.c:2602:36: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:2604:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] offset @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:2604:36: sparse:     expected unsigned int [usertype] offset
   drivers/net/ethernet/emulex/benet/be_cmds.c:2604:36: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:2606:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] op_code @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:2606:29: sparse:     expected unsigned int [usertype] op_code
   drivers/net/ethernet/emulex/benet/be_cmds.c:2606:29: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:2607:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] data_buf_size @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:2607:35: sparse:     expected unsigned int [usertype] data_buf_size
   drivers/net/ethernet/emulex/benet/be_cmds.c:2607:35: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:2641:36: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:2643:36: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:2875:24: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:2876:26: sparse: sparse: cast to restricted __le16
   drivers/net/ethernet/emulex/benet/be_cmds.c:2946:25: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:2947:30: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:2948:30: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:2949:30: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:3193:20: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:3199:21: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:3319:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] timeout @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:3319:26: sparse:     expected unsigned int [usertype] timeout
   drivers/net/ethernet/emulex/benet/be_cmds.c:3319:26: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:3320:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] pattern @@     got restricted __le64 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:3320:22: sparse:     expected unsigned long long [usertype] pattern
   drivers/net/ethernet/emulex/benet/be_cmds.c:3320:22: sparse:     got restricted __le64 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:3321:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] src_port @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:3321:23: sparse:     expected unsigned int [usertype] src_port
   drivers/net/ethernet/emulex/benet/be_cmds.c:3321:23: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:3322:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dest_port @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:3322:24: sparse:     expected unsigned int [usertype] dest_port
   drivers/net/ethernet/emulex/benet/be_cmds.c:3322:24: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:3323:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] pkt_size @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:3323:23: sparse:     expected unsigned int [usertype] pkt_size
   drivers/net/ethernet/emulex/benet/be_cmds.c:3323:23: sparse:     got restricted __le32 [usertype]
>> drivers/net/ethernet/emulex/benet/be_cmds.c:3324:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] num_pkts @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:3324:23: sparse:     expected unsigned int [usertype] num_pkts
   drivers/net/ethernet/emulex/benet/be_cmds.c:3324:23: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:3325:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] loopback_type @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:3325:28: sparse:     expected unsigned int [usertype] loopback_type
   drivers/net/ethernet/emulex/benet/be_cmds.c:3325:28: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:3335:18: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:3367:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] pattern @@     got restricted __le64 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:3367:22: sparse:     expected unsigned long long [usertype] pattern
   drivers/net/ethernet/emulex/benet/be_cmds.c:3367:22: sparse:     got restricted __le64 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:3368:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] byte_count @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:3368:25: sparse:     expected unsigned int [usertype] byte_count
   drivers/net/ethernet/emulex/benet/be_cmds.c:3368:25: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:3458:41: sparse: sparse: cast to restricted __le16
   drivers/net/ethernet/emulex/benet/be_cmds.c:3460:25: sparse: sparse: cast to restricted __le16
   drivers/net/ethernet/emulex/benet/be_cmds.c:3462:25: sparse: sparse: cast to restricted __le16
   drivers/net/ethernet/emulex/benet/be_cmds.c:3464:25: sparse: sparse: cast to restricted __le16
   drivers/net/ethernet/emulex/benet/be_cmds.c:3466:25: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:3500:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] valid_bits @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:3500:25: sparse:     expected unsigned int [usertype] valid_bits
   drivers/net/ethernet/emulex/benet/be_cmds.c:3500:25: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:3501:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] max_bps_nic @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:3501:26: sparse:     expected unsigned int [usertype] max_bps_nic
   drivers/net/ethernet/emulex/benet/be_cmds.c:3501:26: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:3552:50: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:3591:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] valid_cap_flags @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:3591:30: sparse:     expected unsigned int [usertype] valid_cap_flags
   drivers/net/ethernet/emulex/benet/be_cmds.c:3591:30: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:3593:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] cap_flags @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:3593:24: sparse:     expected unsigned int [usertype] cap_flags
   drivers/net/ethernet/emulex/benet/be_cmds.c:3593:24: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:3599:39: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:3639:30: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:3676:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] privileges_lancer @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:3676:40: sparse:     expected unsigned int [usertype] privileges_lancer
   drivers/net/ethernet/emulex/benet/be_cmds.c:3676:40: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:3678:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] privileges @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:3678:33: sparse:     expected unsigned int [usertype] privileges
   drivers/net/ethernet/emulex/benet/be_cmds.c:3678:33: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:3730:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] mac_id @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:3730:29: sparse:     expected unsigned int [usertype] mac_id
   drivers/net/ethernet/emulex/benet/be_cmds.c:3730:29: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:3731:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] iface_id @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:3731:31: sparse:     expected unsigned short [usertype] iface_id
   drivers/net/ethernet/emulex/benet/be_cmds.c:3731:31: sparse:     got restricted __le16 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:3760:41: sparse: sparse: cast to restricted __le16
   drivers/net/ethernet/emulex/benet/be_cmds.c:3767:44: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:3987:33: sparse: sparse: cast to restricted __le16
   drivers/net/ethernet/emulex/benet/be_cmds.c:4105:25: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:4106:33: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:4110:70: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dbg_lvl @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:4110:70: sparse:     expected unsigned int [usertype] dbg_lvl
   drivers/net/ethernet/emulex/benet/be_cmds.c:4110:70: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:4146:33: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:4181:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] parameter_type @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:4181:29: sparse:     expected unsigned int [usertype] parameter_type
   drivers/net/ethernet/emulex/benet/be_cmds.c:4181:29: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:4330:27: sparse: sparse: cast to restricted __le16
   drivers/net/ethernet/emulex/benet/be_cmds.c:4331:26: sparse: sparse: cast to restricted __le16
   drivers/net/ethernet/emulex/benet/be_cmds.c:4332:30: sparse: sparse: cast to restricted __le16
   drivers/net/ethernet/emulex/benet/be_cmds.c:4333:26: sparse: sparse: cast to restricted __le16
   drivers/net/ethernet/emulex/benet/be_cmds.c:4334:27: sparse: sparse: cast to restricted __le16
   drivers/net/ethernet/emulex/benet/be_cmds.c:4335:26: sparse: sparse: cast to restricted __le16
   drivers/net/ethernet/emulex/benet/be_cmds.c:4336:27: sparse: sparse: cast to restricted __le16
   drivers/net/ethernet/emulex/benet/be_cmds.c:4337:29: sparse: sparse: cast to restricted __le16
   drivers/net/ethernet/emulex/benet/be_cmds.c:4338:32: sparse: sparse: cast to restricted __le16
   drivers/net/ethernet/emulex/benet/be_cmds.c:4339:30: sparse: sparse: cast to restricted __le16
   drivers/net/ethernet/emulex/benet/be_cmds.c:4341:29: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:4384:34: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:4501:54: sparse: sparse: cast to restricted __le16
   drivers/net/ethernet/emulex/benet/be_cmds.c:4510:32: sparse: sparse: cast to restricted __le16
   drivers/net/ethernet/emulex/benet/be_cmds.c:4554:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] desc_count @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:4554:25: sparse:     expected unsigned int [usertype] desc_count
   drivers/net/ethernet/emulex/benet/be_cmds.c:4554:25: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:4582:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] channel_id_param @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:4582:31: sparse:     expected unsigned short [usertype] channel_id_param
   drivers/net/ethernet/emulex/benet/be_cmds.c:4582:31: sparse:     got restricted __le16 [usertype]
>> drivers/net/ethernet/emulex/benet/be_cmds.c:4620:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [assigned] [usertype] bw_max @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:4620:33: sparse:     expected unsigned int [addressable] [assigned] [usertype] bw_max
   drivers/net/ethernet/emulex/benet/be_cmds.c:4620:33: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:4627:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [assigned] [usertype] bw_max @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:4627:33: sparse:     expected unsigned int [addressable] [assigned] [usertype] bw_max
   drivers/net/ethernet/emulex/benet/be_cmds.c:4627:33: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:4651:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [assigned] [usertype] num_vfs @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:4651:27: sparse:     expected unsigned short [addressable] [assigned] [usertype] num_vfs
   drivers/net/ethernet/emulex/benet/be_cmds.c:4651:27: sparse:     got restricted __le16 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:4661:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [assigned] [usertype] cap_flags @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:4661:32: sparse:     expected unsigned int [addressable] [assigned] [usertype] cap_flags
   drivers/net/ethernet/emulex/benet/be_cmds.c:4661:32: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:4662:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [assigned] [usertype] rq_count @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:4662:31: sparse:     expected unsigned short [addressable] [assigned] [usertype] rq_count
   drivers/net/ethernet/emulex/benet/be_cmds.c:4662:31: sparse:     got restricted __le16 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:4663:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [assigned] [usertype] txq_count @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:4663:32: sparse:     expected unsigned short [addressable] [assigned] [usertype] txq_count
   drivers/net/ethernet/emulex/benet/be_cmds.c:4663:32: sparse:     got restricted __le16 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:4664:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [assigned] [usertype] rssq_count @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:4664:33: sparse:     expected unsigned short [addressable] [assigned] [usertype] rssq_count
   drivers/net/ethernet/emulex/benet/be_cmds.c:4664:33: sparse:     got restricted __le16 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:4665:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [assigned] [usertype] cq_count @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:4665:31: sparse:     expected unsigned short [addressable] [assigned] [usertype] cq_count
   drivers/net/ethernet/emulex/benet/be_cmds.c:4665:31: sparse:     got restricted __le16 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:4668:48: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [assigned] [usertype] unicast_mac_count @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:4668:48: sparse:     expected unsigned short [addressable] [assigned] [usertype] unicast_mac_count
   drivers/net/ethernet/emulex/benet/be_cmds.c:4668:48: sparse:     got restricted __le16 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:4671:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [assigned] [usertype] vlan_count @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:4671:41: sparse:     expected unsigned short [addressable] [assigned] [usertype] vlan_count
   drivers/net/ethernet/emulex/benet/be_cmds.c:4671:41: sparse:     got restricted __le16 [usertype]
>> drivers/net/ethernet/emulex/benet/be_cmds.c:4673:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [assigned] [usertype] iface_count @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:4673:42: sparse:     expected unsigned short [addressable] [assigned] [usertype] iface_count
   drivers/net/ethernet/emulex/benet/be_cmds.c:4673:42: sparse:     got restricted __le16 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:4676:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [assigned] [usertype] mcc_count @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:4676:40: sparse:     expected unsigned short [addressable] [assigned] [usertype] mcc_count
   drivers/net/ethernet/emulex/benet/be_cmds.c:4676:40: sparse:     got restricted __le16 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:4704:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] target_iface_id @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:4704:30: sparse:     expected unsigned int [usertype] target_iface_id
   drivers/net/ethernet/emulex/benet/be_cmds.c:4704:30: sparse:     got restricted __le32 [usertype]
>> drivers/net/ethernet/emulex/benet/be_cmds.c:4724:37: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __be16 [usertype] port @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:4724:37: sparse:     expected unsigned short [usertype] val
   drivers/net/ethernet/emulex/benet/be_cmds.c:4724:37: sparse:     got restricted __be16 [usertype] port
   drivers/net/ethernet/emulex/benet/be_cmds.c:4724:37: sparse: sparse: cast from restricted __be16
   drivers/net/ethernet/emulex/benet/be_cmds.c:4724:37: sparse: sparse: cast from restricted __be16
   drivers/net/ethernet/emulex/benet/be_cmds.c:4724:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] nv_port @@     got unsigned short [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:4724:35: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] nv_port
   drivers/net/ethernet/emulex/benet/be_cmds.c:4724:35: sparse:     got unsigned short [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:4759:37: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:4931:31: sparse: sparse: cast to restricted __le16
   drivers/net/ethernet/emulex/benet/be_cmds.c:4972:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] link_config @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:4972:26: sparse:     expected unsigned int [usertype] link_config
   drivers/net/ethernet/emulex/benet/be_cmds.c:4972:26: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:5021:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] features @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:5021:23: sparse:     expected unsigned int [usertype] features
   drivers/net/ethernet/emulex/benet/be_cmds.c:5021:23: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:5022:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] parameter_len @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:5022:28: sparse:     expected unsigned int [usertype] parameter_len
   drivers/net/ethernet/emulex/benet/be_cmds.c:5022:28: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:5023:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] uer @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/emulex/benet/be_cmds.c:5023:32: sparse:     expected unsigned int [usertype] uer
   drivers/net/ethernet/emulex/benet/be_cmds.c:5023:32: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/emulex/benet/be_cmds.c:5032:17: sparse: sparse: cast to restricted __le16
   drivers/net/ethernet/emulex/benet/be_cmds.c:5034:17: sparse: sparse: cast to restricted __le16
   drivers/net/ethernet/emulex/benet/be_cmds.c:145:25: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:145:25: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/emulex/benet/be_cmds.c:866:12: sparse: sparse: context imbalance in 'be_cmd_lock' - wrong count at exit
   drivers/net/ethernet/emulex/benet/be_cmds.c:880:38: sparse: sparse: context imbalance in 'be_cmd_unlock' - unexpected unlock
--
   drivers/scsi/bnx2i/bnx2i_hwi.c:220:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   drivers/scsi/bnx2i/bnx2i_hwi.c:220:16: sparse:     expected unsigned int [usertype] value
   drivers/scsi/bnx2i/bnx2i_hwi.c:220:16: sparse:     got restricted __le32 [usertype]
   drivers/scsi/bnx2i/bnx2i_hwi.c:347:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] tsih @@     got restricted __be16 [usertype] tsih @@
   drivers/scsi/bnx2i/bnx2i_hwi.c:347:25: sparse:     expected unsigned short [usertype] tsih
   drivers/scsi/bnx2i/bnx2i_hwi.c:347:25: sparse:     got restricted __be16 [usertype] tsih
   drivers/scsi/bnx2i/bnx2i_hwi.c:350:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] cid @@     got restricted __be16 [usertype] cid @@
   drivers/scsi/bnx2i/bnx2i_hwi.c:350:24: sparse:     expected unsigned short [usertype] cid
   drivers/scsi/bnx2i/bnx2i_hwi.c:350:24: sparse:     got restricted __be16 [usertype] cid
>> drivers/scsi/bnx2i/bnx2i_hwi.c:427:54: sparse: sparse: restricted itt_t degrades to integer
   drivers/scsi/bnx2i/bnx2i_hwi.c:430:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] ref_itt @@     got restricted itt_t [usertype] @@
   drivers/scsi/bnx2i/bnx2i_hwi.c:430:39: sparse:     expected unsigned int [usertype] ref_itt
   drivers/scsi/bnx2i/bnx2i_hwi.c:430:39: sparse:     got restricted itt_t [usertype]
   drivers/scsi/bnx2i/bnx2i_hwi.c:433:32: sparse: sparse: cast to restricted __be32
   drivers/scsi/bnx2i/bnx2i_hwi.c:433:32: sparse: sparse: cast to restricted __be32
   drivers/scsi/bnx2i/bnx2i_hwi.c:433:32: sparse: sparse: cast to restricted __be32
   drivers/scsi/bnx2i/bnx2i_hwi.c:433:32: sparse: sparse: cast to restricted __be32
   drivers/scsi/bnx2i/bnx2i_hwi.c:433:32: sparse: sparse: cast to restricted __be32
   drivers/scsi/bnx2i/bnx2i_hwi.c:433:32: sparse: sparse: cast to restricted __be32
   drivers/scsi/bnx2i/bnx2i_hwi.c:434:32: sparse: sparse: cast to restricted __be32
   drivers/scsi/bnx2i/bnx2i_hwi.c:434:32: sparse: sparse: cast to restricted __be32
   drivers/scsi/bnx2i/bnx2i_hwi.c:434:32: sparse: sparse: cast to restricted __be32
   drivers/scsi/bnx2i/bnx2i_hwi.c:434:32: sparse: sparse: cast to restricted __be32
   drivers/scsi/bnx2i/bnx2i_hwi.c:434:32: sparse: sparse: cast to restricted __be32
   drivers/scsi/bnx2i/bnx2i_hwi.c:434:32: sparse: sparse: cast to restricted __be32
>> drivers/scsi/bnx2i/bnx2i_hwi.c:1351:48: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted itt_t [usertype] @@     got int @@
   drivers/scsi/bnx2i/bnx2i_hwi.c:1351:48: sparse:     expected restricted itt_t [usertype]
   drivers/scsi/bnx2i/bnx2i_hwi.c:1351:48: sparse:     got int
   drivers/scsi/bnx2i/bnx2i_hwi.c:1447:45: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted itt_t [usertype] @@     got int @@
   drivers/scsi/bnx2i/bnx2i_hwi.c:1447:45: sparse:     expected restricted itt_t [usertype]
   drivers/scsi/bnx2i/bnx2i_hwi.c:1447:45: sparse:     got int
   drivers/scsi/bnx2i/bnx2i_hwi.c:1514:50: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted itt_t [usertype] @@     got int @@
   drivers/scsi/bnx2i/bnx2i_hwi.c:1514:50: sparse:     expected restricted itt_t [usertype]
   drivers/scsi/bnx2i/bnx2i_hwi.c:1514:50: sparse:     got int
   drivers/scsi/bnx2i/bnx2i_hwi.c:1574:47: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted itt_t [usertype] @@     got int @@
   drivers/scsi/bnx2i/bnx2i_hwi.c:1574:47: sparse:     expected restricted itt_t [usertype]
   drivers/scsi/bnx2i/bnx2i_hwi.c:1574:47: sparse:     got int
   drivers/scsi/bnx2i/bnx2i_hwi.c:1613:46: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted itt_t [usertype] @@     got int @@
   drivers/scsi/bnx2i/bnx2i_hwi.c:1613:46: sparse:     expected restricted itt_t [usertype]
   drivers/scsi/bnx2i/bnx2i_hwi.c:1613:46: sparse:     got int
   drivers/scsi/bnx2i/bnx2i_hwi.c:1628:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] t2wait @@     got restricted __be32 [usertype] @@
   drivers/scsi/bnx2i/bnx2i_hwi.c:1628:26: sparse:     expected restricted __be16 [usertype] t2wait
   drivers/scsi/bnx2i/bnx2i_hwi.c:1628:26: sparse:     got restricted __be32 [usertype]
>> drivers/scsi/bnx2i/bnx2i_hwi.c:1629:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] t2retain @@     got restricted __be32 [usertype] @@
   drivers/scsi/bnx2i/bnx2i_hwi.c:1629:28: sparse:     expected restricted __be16 [usertype] t2retain
   drivers/scsi/bnx2i/bnx2i_hwi.c:1629:28: sparse:     got restricted __be32 [usertype]
   drivers/scsi/bnx2i/bnx2i_hwi.c:1658:46: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted itt_t [usertype] @@     got int @@
   drivers/scsi/bnx2i/bnx2i_hwi.c:1658:46: sparse:     expected restricted itt_t [usertype]
   drivers/scsi/bnx2i/bnx2i_hwi.c:1658:46: sparse:     got int
   drivers/scsi/bnx2i/bnx2i_hwi.c:1708:29: sparse: sparse: cast from restricted itt_t
   drivers/scsi/bnx2i/bnx2i_hwi.c:1717:27: sparse: sparse: cast to restricted itt_t
>> drivers/scsi/bnx2i/bnx2i_hwi.c:1813:25: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted itt_t [usertype] @@
   drivers/scsi/bnx2i/bnx2i_hwi.c:1813:25: sparse:     expected unsigned int [usertype] val
   drivers/scsi/bnx2i/bnx2i_hwi.c:1813:25: sparse:     got restricted itt_t [usertype]
   drivers/scsi/bnx2i/bnx2i_hwi.c:1813:25: sparse: sparse: cast from restricted itt_t
   drivers/scsi/bnx2i/bnx2i_hwi.c:1813:25: sparse: sparse: cast from restricted itt_t
   drivers/scsi/bnx2i/bnx2i_hwi.c:1813:25: sparse: sparse: cast from restricted itt_t
   drivers/scsi/bnx2i/bnx2i_hwi.c:1813:25: sparse: sparse: cast from restricted itt_t
   drivers/scsi/bnx2i/bnx2i_hwi.c:1838:44: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted itt_t [usertype] @@     got int @@
   drivers/scsi/bnx2i/bnx2i_hwi.c:1838:44: sparse:     expected restricted itt_t [usertype]
   drivers/scsi/bnx2i/bnx2i_hwi.c:1838:44: sparse:     got int
   drivers/scsi/bnx2i/bnx2i_hwi.c:1912:43: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted itt_t [usertype] @@     got int @@
   drivers/scsi/bnx2i/bnx2i_hwi.c:1912:43: sparse:     expected restricted itt_t [usertype]
   drivers/scsi/bnx2i/bnx2i_hwi.c:1912:43: sparse:     got int
   drivers/scsi/bnx2i/bnx2i_hwi.c:1982:44: sparse: sparse: cast from restricted itt_t
--
   drivers/gpu/drm/nouveau/dispnv50/dac507d.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, drivers/gpu/drm/nouveau/dispnv50/disp.h, ...):
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
>> drivers/gpu/drm/nouveau/dispnv50/dac507d.c:44:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/dispnv50/dac507d.c:44:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/dispnv50/dac507d.c:44:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/nvif/chan906f.c:31:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nvif/chan906f.c:31:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nvif/chan906f.c:31:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nvif/chan906f.c:31:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nvif/chan906f.c:31:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nvif/chan906f.c:82:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *ptr @@     got void *sema @@
   drivers/gpu/drm/nouveau/nvif/chan906f.c:82:28: sparse:     expected void [noderef] __iomem *ptr
   drivers/gpu/drm/nouveau/nvif/chan906f.c:82:28: sparse:     got void *sema
--
>> drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c:182:20: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] *vaddr @@
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c:182:20: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c:182:20: sparse:     got unsigned int [usertype] *vaddr
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c:225:26: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned int [usertype] *vaddr @@
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c:225:26: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c:225:26: sparse:     got unsigned int [usertype] *vaddr
--
   drivers/gpu/drm/nouveau/nouveau_drm.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
>> drivers/gpu/drm/nouveau/nouveau_drm.c:407:41: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nouveau_drm.c:407:41: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_drm.c:408:41: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_drm.c:408:41: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_drm.c:408:41: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_drm.c:408:41: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_drm.c:412:33: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_drm.c:412:33: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/head827d.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, drivers/gpu/drm/nouveau/dispnv50/disp.h, ...):
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
>> drivers/gpu/drm/nouveau/dispnv50/head827d.c:39:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/dispnv50/head827d.c:39:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:44:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:44:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:58:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:58:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:58:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:69:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:69:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:83:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:83:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:86:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:86:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:86:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:86:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:86:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:104:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:104:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:120:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:120:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:123:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:123:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:137:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:137:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:137:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:145:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head827d.c:145:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:105:58: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:105:58: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:105:58: sparse:     got void *
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:111:58: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:111:58: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:111:58: sparse:     got void *
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:158:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *[assigned] emap @@
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:158:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:158:25: sparse:     got void *[assigned] emap
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:175:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *map @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:175:19: sparse:     expected void *map
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:175:19: sparse:     got void [noderef] __iomem *
>> drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:228:28: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __iomem * @@     got void *map @@
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:228:28: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:228:28: sparse:     got void *map
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:237:28: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __iomem * @@     got void *map @@
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:237:28: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:237:28: sparse:     got void *map
>> drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:244:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *map @@     got void *map @@
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:244:21: sparse:     expected void [noderef] __iomem *map
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:244:21: sparse:     got void *map
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:333:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *[assigned] map @@
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:333:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:333:25: sparse:     got void *[assigned] map
--
   drivers/gpu/drm/nouveau/dispnv04/crtc.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
>> drivers/gpu/drm/nouveau/dispnv04/crtc.c:1135:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/dispnv04/crtc.c:1135:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:1220:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:1220:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:1221:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:1221:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:1222:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:1222:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:1223:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv04/crtc.c:1223:17: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/ovly907e.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, drivers/gpu/drm/nouveau/dispnv50/disp.h, ...):
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
>> drivers/gpu/drm/nouveau/dispnv50/ovly907e.c:38:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/dispnv50/ovly907e.c:38:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly907e.c:42:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly907e.c:42:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly907e.c:44:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly907e.c:44:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly907e.c:47:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly907e.c:47:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly907e.c:49:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly907e.c:49:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly907e.c:49:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly907e.c:49:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/nv04_fence.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
>> drivers/gpu/drm/nouveau/nv04_fence.c:45:17: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nv04_fence.c:45:17: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/head907d.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
>> drivers/gpu/drm/nouveau/dispnv50/head907d.c:46:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/dispnv50/head907d.c:46:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/dispnv50/head907d.c:46:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:67:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:67:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:87:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:87:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:120:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:120:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:148:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:148:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:162:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:162:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:167:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:167:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:181:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:181:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:181:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:191:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:191:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:205:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:205:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:219:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:219:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:222:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:222:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:222:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:222:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:222:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:240:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:240:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:256:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:256:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:259:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:259:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:273:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:273:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:273:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:281:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:281:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:333:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:333:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:333:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:333:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:333:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:333:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:333:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:358:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:358:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:363:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:363:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:363:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:363:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:388:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:388:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:394:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:394:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:398:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:398:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:398:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head907d.c:398:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/disp.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, drivers/gpu/drm/nouveau/dispnv50/disp.h):
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/dispnv50/disp.c:138:31: sparse: sparse: subtraction of different types can't work (different address spaces)
>> drivers/gpu/drm/nouveau/dispnv50/disp.c:187:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/disp.c:201:31: sparse: sparse: subtraction of different types can't work (different address spaces)
   drivers/gpu/drm/nouveau/dispnv50/disp.c:261:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [usertype] *bgn @@     got void [noderef] __iomem *ptr @@
--
   drivers/gpu/drm/nouveau/dispnv50/pior507d.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, drivers/gpu/drm/nouveau/dispnv50/disp.h, ...):
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
>> drivers/gpu/drm/nouveau/dispnv50/pior507d.c:45:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/dispnv50/pior507d.c:45:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, drivers/gpu/drm/nouveau/dispnv50/disp.h, ...):
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
>> drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:49:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:49:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:49:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:62:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:62:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:75:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:75:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:75:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:75:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:104:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:104:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:104:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:104:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:104:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:104:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:104:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:104:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:149:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:149:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:153:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:153:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:166:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:166:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:171:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:171:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:171:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:171:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:171:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:193:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:193:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:193:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:194:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:194:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:196:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:196:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:200:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:200:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:204:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:204:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:219:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:219:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:232:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:232:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:232:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:249:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:249:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:262:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:262:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:262:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:262:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:262:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:278:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:278:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:278:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:282:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:282:9: sparse: sparse: dubious: !x & y
   drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c:282:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, drivers/gpu/drm/nouveau/dispnv50/disp.h, ...):
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
>> drivers/gpu/drm/nouveau/dispnv50/headc57d.c:39:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/dispnv50/headc57d.c:39:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:68:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:68:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:89:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:89:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:106:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:106:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:120:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:120:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:120:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:120:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:120:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:212:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:212:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:212:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:212:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:212:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:229:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:229:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:230:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:230:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:232:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:232:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:235:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:235:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:239:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/headc57d.c:239:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/sor907d.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, drivers/gpu/drm/nouveau/dispnv50/disp.h, ...):
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
>> drivers/gpu/drm/nouveau/dispnv50/sor907d.c:41:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/dispnv50/sor907d.c:41:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, drivers/gpu/drm/nouveau/dispnv50/disp.h, ...):
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
>> drivers/gpu/drm/nouveau/dispnv50/corec37d.c:44:17: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/dispnv50/corec37d.c:44:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:61:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:61:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:67:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:67:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:67:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:69:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:69:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:74:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:74:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:137:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:137:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:140:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:140:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:140:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:149:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec37d.c:149:17: sparse: sparse: cast removes address space '__iomem' of expression
--
>> drivers/gpu/drm/nouveau/nouveau_bo85b5.c:58:17: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nouveau_bo85b5.c:58:17: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nouveau_bo85b5.c:58:17: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nouveau_bo85b5.c:58:17: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nouveau_bo85b5.c:58:17: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nouveau_bo85b5.c:58:17: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nouveau_bo85b5.c:58:17: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nouveau_bo85b5.c:58:17: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nouveau_bo85b5.c:58:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo85b5.c:66:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo85b5.c:66:17: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, drivers/gpu/drm/nouveau/dispnv50/disp.h, ...):
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
>> drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:29:17: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:29:17: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:29:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:36:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:36:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:41:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:41:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:41:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:44:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:44:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:50:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:50:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:69:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:69:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:69:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:77:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:77:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:77:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:87:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:87:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:93:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:93:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:95:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/coreca7d.c:95:17: sparse: sparse: cast removes address space '__iomem' of expression
--
>> drivers/gpu/drm/nouveau/nouveau_bo9039.c:56:17: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nouveau_bo9039.c:56:17: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nouveau_bo9039.c:56:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo9039.c:61:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo9039.c:61:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo9039.c:61:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo9039.c:61:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo9039.c:61:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo9039.c:61:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo9039.c:61:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo9039.c:70:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo9039.c:70:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo9039.c:96:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo9039.c:96:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/nouveau_gem.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
>> drivers/gpu/drm/nouveau/nouveau_gem.c:883:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_gem.c:884:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_gem.c:916:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_gem.c:917:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_gem.c:919:33: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/base507c.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, drivers/gpu/drm/nouveau/dispnv50/disp.h, ...):
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
>> drivers/gpu/drm/nouveau/dispnv50/base507c.c:44:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/dispnv50/base507c.c:44:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:57:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:57:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:61:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:61:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:74:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:74:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:78:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:78:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:81:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:81:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:81:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:88:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:88:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:88:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:96:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:96:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:98:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:98:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:98:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:98:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:127:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:127:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:141:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:141:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:167:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:167:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:180:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:180:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:180:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:204:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:204:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:217:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:217:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:217:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:217:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/base507c.c:217:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/nvc0_fence.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
>> drivers/gpu/drm/nouveau/nvc0_fence.c:40:17: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nvc0_fence.c:40:17: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nvc0_fence.c:40:17: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nvc0_fence.c:40:17: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nvc0_fence.c:40:17: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nvc0_fence.c:40:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nvc0_fence.c:63:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nvc0_fence.c:63:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nvc0_fence.c:63:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nvc0_fence.c:63:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nvc0_fence.c:63:17: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, drivers/gpu/drm/nouveau/dispnv50/disp.h, ...):
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c:40:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c:40:9: sparse: sparse: dubious: !x & y
   drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c:40:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c:55:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c:55:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/nouveau_bo0039.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
>> drivers/gpu/drm/nouveau/nouveau_bo0039.c:62:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nouveau_bo0039.c:62:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nouveau_bo0039.c:62:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:73:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:73:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:73:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:73:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:73:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:73:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:73:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:73:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:73:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:86:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:86:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:106:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:106:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:107:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:107:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/crcc57d.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, drivers/gpu/drm/nouveau/dispnv04/disp.h, ...):
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
>> drivers/gpu/drm/nouveau/dispnv50/crcc57d.c:40:17: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/dispnv50/crcc57d.c:40:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/crcc57d.c:41:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/crcc57d.c:41:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/crcc57d.c:43:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/crcc57d.c:43:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/crcc57d.c:44:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/crcc57d.c:44:17: sparse: sparse: cast removes address space '__iomem' of expression
--
>> drivers/gpu/drm/nouveau/nouveau_bo74c1.c:47:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nouveau_bo74c1.c:47:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nouveau_bo74c1.c:47:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nouveau_bo74c1.c:47:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nouveau_bo74c1.c:47:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nouveau_bo74c1.c:47:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nouveau_bo74c1.c:47:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/head507d.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, drivers/gpu/drm/nouveau/dispnv50/disp.h, ...):
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
>> drivers/gpu/drm/nouveau/dispnv50/head507d.c:39:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/dispnv50/head507d.c:39:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:58:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:58:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:90:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:90:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:118:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:118:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:132:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:132:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:149:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:149:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:149:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:198:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:198:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:212:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:212:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:215:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:215:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:215:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:215:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:215:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:233:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:233:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:288:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:288:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:303:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:303:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:303:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:356:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:356:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:356:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:365:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:365:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:365:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:365:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:365:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:365:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:365:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:365:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:393:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:393:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:410:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:410:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:416:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:416:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:420:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:420:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/head507d.c:420:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/nvkm/core/gpuobj.c:97:22: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem *map @@
   drivers/gpu/drm/nouveau/nvkm/core/gpuobj.c:97:22: sparse:     expected void *
   drivers/gpu/drm/nouveau/nvkm/core/gpuobj.c:97:22: sparse:     got void [noderef] __iomem *map
   drivers/gpu/drm/nouveau/nvkm/core/gpuobj.c:155:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *map @@     got void * @@
   drivers/gpu/drm/nouveau/nvkm/core/gpuobj.c:155:21: sparse:     expected void [noderef] __iomem *map
   drivers/gpu/drm/nouveau/nvkm/core/gpuobj.c:155:21: sparse:     got void *
>> drivers/gpu/drm/nouveau/nvkm/core/gpuobj.c:157:33: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nvkm/core/gpuobj.c:157:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *map @@     got unsigned char [usertype] * @@
   drivers/gpu/drm/nouveau/nvkm/core/gpuobj.c:157:30: sparse:     expected void [noderef] __iomem *map
   drivers/gpu/drm/nouveau/nvkm/core/gpuobj.c:157:30: sparse:     got unsigned char [usertype] *
   drivers/gpu/drm/nouveau/nvkm/core/gpuobj.c:162:22: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem *map @@
   drivers/gpu/drm/nouveau/nvkm/core/gpuobj.c:162:22: sparse:     expected void *
   drivers/gpu/drm/nouveau/nvkm/core/gpuobj.c:162:22: sparse:     got void [noderef] __iomem *map
--
   drivers/gpu/drm/nouveau/nouveau_bo5039.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
>> drivers/gpu/drm/nouveau/nouveau_bo5039.c:63:25: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nouveau_bo5039.c:63:25: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nouveau_bo5039.c:63:25: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nouveau_bo5039.c:63:25: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nouveau_bo5039.c:63:25: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nouveau_bo5039.c:63:25: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nouveau_bo5039.c:63:25: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nouveau_bo5039.c:63:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:80:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:80:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:85:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:85:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:85:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:85:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:85:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:85:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:85:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:85:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:102:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:102:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:106:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:106:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:106:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:112:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:112:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:112:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:112:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:112:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:112:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:112:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:112:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:112:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:126:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:126:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:146:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:146:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:147:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:147:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:147:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:147:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/dac907d.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, drivers/gpu/drm/nouveau/dispnv50/disp.h, ...):
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
>> drivers/gpu/drm/nouveau/dispnv50/dac907d.c:38:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/dispnv50/dac907d.c:38:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/ovly507e.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, drivers/gpu/drm/nouveau/dispnv50/disp.h, ...):
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
>> drivers/gpu/drm/nouveau/dispnv50/ovly507e.c:42:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/dispnv50/ovly507e.c:42:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/dispnv50/ovly507e.c:42:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/dispnv50/ovly507e.c:42:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly507e.c:64:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly507e.c:64:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly507e.c:68:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly507e.c:68:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly507e.c:70:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly507e.c:70:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly507e.c:73:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly507e.c:73:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly507e.c:75:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly507e.c:75:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly507e.c:75:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly507e.c:75:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/nvif/chan.c:11:32: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nvif/chan.c:38:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const [usertype] *map @@     got void [noderef] __iomem *ptr @@
   drivers/gpu/drm/nouveau/nvif/chan.c:38:51: sparse:     expected unsigned int const [usertype] *map
   drivers/gpu/drm/nouveau/nvif/chan.c:38:51: sparse:     got void [noderef] __iomem *ptr
>> drivers/gpu/drm/nouveau/nvif/chan.c:101:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *ptr @@     got void *userd @@
   drivers/gpu/drm/nouveau/nvif/chan.c:101:29: sparse:     expected void [noderef] __iomem *ptr
   drivers/gpu/drm/nouveau/nvif/chan.c:101:29: sparse:     got void *userd
   drivers/gpu/drm/nouveau/nvif/chan.c:103:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *ptr @@     got void *gpfifo @@
   drivers/gpu/drm/nouveau/nvif/chan.c:103:30: sparse:     expected void [noderef] __iomem *ptr
   drivers/gpu/drm/nouveau/nvif/chan.c:103:30: sparse:     got void *gpfifo
   drivers/gpu/drm/nouveau/nvif/chan.c:107:39: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *ptr @@     got void *push @@
   drivers/gpu/drm/nouveau/nvif/chan.c:107:39: sparse:     expected void [noderef] __iomem *ptr
   drivers/gpu/drm/nouveau/nvif/chan.c:107:39: sparse:     got void *push
   drivers/gpu/drm/nouveau/nvif/chan.c:119:32: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nvif/chan.c:155:22: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/corec57d.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, drivers/gpu/drm/nouveau/dispnv50/disp.h, ...):
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
>> drivers/gpu/drm/nouveau/dispnv50/corec57d.c:40:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/dispnv50/corec57d.c:40:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec57d.c:43:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec57d.c:43:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec57d.c:43:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec57d.c:51:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/corec57d.c:51:17: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/nv84_fence.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
>> drivers/gpu/drm/nouveau/nv84_fence.c:41:17: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nv84_fence.c:41:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:43:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:43:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:43:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:43:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:43:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:43:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:64:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:64:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:66:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:66:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:66:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:66:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nv84_fence.c:66:17: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nv84_fence.c:88:45: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct nouveau_channel *chan @@     got struct nouveau_channel [noderef] __rcu *channel @@
   drivers/gpu/drm/nouveau/nv84_fence.c:88:45: sparse:     expected struct nouveau_channel *chan
   drivers/gpu/drm/nouveau/nv84_fence.c:88:45: sparse:     got struct nouveau_channel [noderef] __rcu *channel
--
>> drivers/gpu/drm/nouveau/nvif/chanc36f.c:36:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nvif/chanc36f.c:36:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nvif/chanc36f.c:36:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/nvif/chanc36f.c:36:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nvif/chanc36f.c:42:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nvif/chanc36f.c:42:9: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/nouveau_chan.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h):
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
>> drivers/gpu/drm/nouveau/nouveau_chan.c:133:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [usertype] *bgn @@     got void [noderef] __iomem *ptr @@
   drivers/gpu/drm/nouveau/nouveau_chan.c:133:37: sparse:     expected unsigned int [usertype] *bgn
   drivers/gpu/drm/nouveau/nouveau_chan.c:133:37: sparse:     got void [noderef] __iomem *ptr
>> drivers/gpu/drm/nouveau/nouveau_chan.c:174:44: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *ptr @@     got void *virtual @@
   drivers/gpu/drm/nouveau/nouveau_chan.c:174:44: sparse:     expected void [noderef] __iomem *ptr
   drivers/gpu/drm/nouveau/nouveau_chan.c:174:44: sparse:     got void *virtual
   drivers/gpu/drm/nouveau/nouveau_chan.c:439:71: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *userd @@     got void [noderef] __iomem *ptr @@
   drivers/gpu/drm/nouveau/nouveau_chan.c:439:71: sparse:     expected void *userd
   drivers/gpu/drm/nouveau/nouveau_chan.c:439:71: sparse:     got void [noderef] __iomem *ptr
   drivers/gpu/drm/nouveau/nouveau_chan.c:446:71: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *userd @@     got void [noderef] __iomem *ptr @@
   drivers/gpu/drm/nouveau/nouveau_chan.c:446:71: sparse:     expected void *userd
   drivers/gpu/drm/nouveau/nouveau_chan.c:446:71: sparse:     got void [noderef] __iomem *ptr
   drivers/gpu/drm/nouveau/nouveau_chan.c:453:71: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *userd @@     got void [noderef] __iomem *ptr @@
   drivers/gpu/drm/nouveau/nouveau_chan.c:453:71: sparse:     expected void *userd
   drivers/gpu/drm/nouveau/nouveau_chan.c:453:71: sparse:     got void [noderef] __iomem *ptr
>> drivers/gpu/drm/nouveau/nouveau_chan.c:471:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_chan.c:485:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/nouveau_chan.c:485:17: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/gpu/drm/nouveau/dispnv50/ovly827e.c: note: in included file (through drivers/gpu/drm/nouveau/nouveau_drv.h, drivers/gpu/drm/nouveau/nouveau_display.h, drivers/gpu/drm/nouveau/dispnv50/disp.h, ...):
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:9:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:10:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:11:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:12:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:13:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:14:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:17:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:18:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:20:1: sparse: sparse: directive in macro's argument list
   drivers/gpu/drm/nouveau/include/nvif/ioctl.h:21:1: sparse: sparse: directive in macro's argument list
>> drivers/gpu/drm/nouveau/dispnv50/ovly827e.c:41:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/gpu/drm/nouveau/dispnv50/ovly827e.c:41:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly827e.c:45:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly827e.c:45:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly827e.c:47:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly827e.c:47:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly827e.c:50:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly827e.c:50:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly827e.c:52:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly827e.c:52:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly827e.c:52:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/gpu/drm/nouveau/dispnv50/ovly827e.c:52:9: sparse: sparse: cast removes address space '__iomem' of expression

vim +429 drivers/scsi/mvumi.c

f0c568a478f035 Jianyun Li 2011-05-11  423  
bd756ddea18e02 Shun Fu    2012-09-23  424  static unsigned int mvumi_check_ib_list_9580(struct mvumi_hba *mhba)
bd756ddea18e02 Shun Fu    2012-09-23  425  {
bd756ddea18e02 Shun Fu    2012-09-23  426  	unsigned int count;
bd756ddea18e02 Shun Fu    2012-09-23  427  	if (atomic_read(&mhba->fw_outstanding) >= (mhba->max_io - 1))
bd756ddea18e02 Shun Fu    2012-09-23  428  		return 0;
bd756ddea18e02 Shun Fu    2012-09-23 @429  	count = ioread32(mhba->ib_shadow);
bd756ddea18e02 Shun Fu    2012-09-23  430  	if (count == 0xffff)
bd756ddea18e02 Shun Fu    2012-09-23  431  		return 0;
bd756ddea18e02 Shun Fu    2012-09-23  432  	return count;
f0c568a478f035 Jianyun Li 2011-05-11  433  }
f0c568a478f035 Jianyun Li 2011-05-11  434  
bd756ddea18e02 Shun Fu    2012-09-23  435  static void mvumi_get_ib_list_entry(struct mvumi_hba *mhba, void **ib_entry)
bd756ddea18e02 Shun Fu    2012-09-23  436  {
bd756ddea18e02 Shun Fu    2012-09-23  437  	unsigned int cur_ib_entry;
bd756ddea18e02 Shun Fu    2012-09-23  438  
bd756ddea18e02 Shun Fu    2012-09-23  439  	cur_ib_entry = mhba->ib_cur_slot & mhba->regs->cl_slot_num_mask;
f0c568a478f035 Jianyun Li 2011-05-11  440  	cur_ib_entry++;
f0c568a478f035 Jianyun Li 2011-05-11  441  	if (cur_ib_entry >= mhba->list_num_io) {
f0c568a478f035 Jianyun Li 2011-05-11  442  		cur_ib_entry -= mhba->list_num_io;
bd756ddea18e02 Shun Fu    2012-09-23  443  		mhba->ib_cur_slot ^= mhba->regs->cl_pointer_toggle;
f0c568a478f035 Jianyun Li 2011-05-11  444  	}
bd756ddea18e02 Shun Fu    2012-09-23  445  	mhba->ib_cur_slot &= ~mhba->regs->cl_slot_num_mask;
bd756ddea18e02 Shun Fu    2012-09-23  446  	mhba->ib_cur_slot |= (cur_ib_entry & mhba->regs->cl_slot_num_mask);
bd756ddea18e02 Shun Fu    2012-09-23  447  	if (mhba->hba_capability & HS_CAPABILITY_SUPPORT_DYN_SRC) {
bd756ddea18e02 Shun Fu    2012-09-23  448  		*ib_entry = mhba->ib_list + cur_ib_entry *
bd756ddea18e02 Shun Fu    2012-09-23  449  				sizeof(struct mvumi_dyn_list_entry);
bd756ddea18e02 Shun Fu    2012-09-23  450  	} else {
f0c568a478f035 Jianyun Li 2011-05-11  451  		*ib_entry = mhba->ib_list + cur_ib_entry * mhba->ib_max_size;
bd756ddea18e02 Shun Fu    2012-09-23  452  	}
f0c568a478f035 Jianyun Li 2011-05-11  453  	atomic_inc(&mhba->fw_outstanding);
f0c568a478f035 Jianyun Li 2011-05-11  454  }
f0c568a478f035 Jianyun Li 2011-05-11  455  
f0c568a478f035 Jianyun Li 2011-05-11  456  static void mvumi_send_ib_list_entry(struct mvumi_hba *mhba)
f0c568a478f035 Jianyun Li 2011-05-11  457  {
bd756ddea18e02 Shun Fu    2012-09-23 @458  	iowrite32(0xffff, mhba->ib_shadow);
bd756ddea18e02 Shun Fu    2012-09-23  459  	iowrite32(mhba->ib_cur_slot, mhba->regs->inb_write_pointer);
f0c568a478f035 Jianyun Li 2011-05-11  460  }
f0c568a478f035 Jianyun Li 2011-05-11  461  
f0c568a478f035 Jianyun Li 2011-05-11  462  static char mvumi_check_ob_frame(struct mvumi_hba *mhba,
f0c568a478f035 Jianyun Li 2011-05-11  463  		unsigned int cur_obf, struct mvumi_rsp_frame *p_outb_frame)
f0c568a478f035 Jianyun Li 2011-05-11  464  {
f0c568a478f035 Jianyun Li 2011-05-11  465  	unsigned short tag, request_id;
f0c568a478f035 Jianyun Li 2011-05-11  466  
f0c568a478f035 Jianyun Li 2011-05-11  467  	udelay(1);
f0c568a478f035 Jianyun Li 2011-05-11  468  	p_outb_frame = mhba->ob_list + cur_obf * mhba->ob_max_size;
f0c568a478f035 Jianyun Li 2011-05-11  469  	request_id = p_outb_frame->request_id;
f0c568a478f035 Jianyun Li 2011-05-11  470  	tag = p_outb_frame->tag;
f0c568a478f035 Jianyun Li 2011-05-11  471  	if (tag > mhba->tag_pool.size) {
f0c568a478f035 Jianyun Li 2011-05-11  472  		dev_err(&mhba->pdev->dev, "ob frame data error\n");
f0c568a478f035 Jianyun Li 2011-05-11  473  		return -1;
f0c568a478f035 Jianyun Li 2011-05-11  474  	}
f0c568a478f035 Jianyun Li 2011-05-11  475  	if (mhba->tag_cmd[tag] == NULL) {
f0c568a478f035 Jianyun Li 2011-05-11  476  		dev_err(&mhba->pdev->dev, "tag[0x%x] with NO command\n", tag);
f0c568a478f035 Jianyun Li 2011-05-11  477  		return -1;
f0c568a478f035 Jianyun Li 2011-05-11  478  	} else if (mhba->tag_cmd[tag]->request_id != request_id &&
f0c568a478f035 Jianyun Li 2011-05-11  479  						mhba->request_id_enabled) {
f0c568a478f035 Jianyun Li 2011-05-11  480  			dev_err(&mhba->pdev->dev, "request ID from FW:0x%x,"
f0c568a478f035 Jianyun Li 2011-05-11  481  					"cmd request ID:0x%x\n", request_id,
f0c568a478f035 Jianyun Li 2011-05-11  482  					mhba->tag_cmd[tag]->request_id);
f0c568a478f035 Jianyun Li 2011-05-11  483  			return -1;
f0c568a478f035 Jianyun Li 2011-05-11  484  	}
f0c568a478f035 Jianyun Li 2011-05-11  485  
f0c568a478f035 Jianyun Li 2011-05-11  486  	return 0;
f0c568a478f035 Jianyun Li 2011-05-11  487  }
f0c568a478f035 Jianyun Li 2011-05-11  488  
bd756ddea18e02 Shun Fu    2012-09-23  489  static int mvumi_check_ob_list_9143(struct mvumi_hba *mhba,
bd756ddea18e02 Shun Fu    2012-09-23  490  			unsigned int *cur_obf, unsigned int *assign_obf_end)
f0c568a478f035 Jianyun Li 2011-05-11  491  {
bd756ddea18e02 Shun Fu    2012-09-23  492  	unsigned int ob_write, ob_write_shadow;
bd756ddea18e02 Shun Fu    2012-09-23  493  	struct mvumi_hw_regs *regs = mhba->regs;
f0c568a478f035 Jianyun Li 2011-05-11  494  
f0c568a478f035 Jianyun Li 2011-05-11  495  	do {
bd756ddea18e02 Shun Fu    2012-09-23 @496  		ob_write = ioread32(regs->outb_copy_pointer);
bd756ddea18e02 Shun Fu    2012-09-23  497  		ob_write_shadow = ioread32(mhba->ob_shadow);
bd756ddea18e02 Shun Fu    2012-09-23  498  	} while ((ob_write & regs->cl_slot_num_mask) != ob_write_shadow);
f0c568a478f035 Jianyun Li 2011-05-11  499  
bd756ddea18e02 Shun Fu    2012-09-23  500  	*cur_obf = mhba->ob_cur_slot & mhba->regs->cl_slot_num_mask;
bd756ddea18e02 Shun Fu    2012-09-23  501  	*assign_obf_end = ob_write & mhba->regs->cl_slot_num_mask;
f0c568a478f035 Jianyun Li 2011-05-11  502  
bd756ddea18e02 Shun Fu    2012-09-23  503  	if ((ob_write & regs->cl_pointer_toggle) !=
bd756ddea18e02 Shun Fu    2012-09-23  504  			(mhba->ob_cur_slot & regs->cl_pointer_toggle)) {
bd756ddea18e02 Shun Fu    2012-09-23  505  		*assign_obf_end += mhba->list_num_io;
bd756ddea18e02 Shun Fu    2012-09-23  506  	}
bd756ddea18e02 Shun Fu    2012-09-23  507  	return 0;
f0c568a478f035 Jianyun Li 2011-05-11  508  }
f0c568a478f035 Jianyun Li 2011-05-11  509  
bd756ddea18e02 Shun Fu    2012-09-23  510  static int mvumi_check_ob_list_9580(struct mvumi_hba *mhba,
bd756ddea18e02 Shun Fu    2012-09-23  511  			unsigned int *cur_obf, unsigned int *assign_obf_end)
bd756ddea18e02 Shun Fu    2012-09-23  512  {
bd756ddea18e02 Shun Fu    2012-09-23  513  	unsigned int ob_write;
bd756ddea18e02 Shun Fu    2012-09-23  514  	struct mvumi_hw_regs *regs = mhba->regs;
bd756ddea18e02 Shun Fu    2012-09-23  515  
bd756ddea18e02 Shun Fu    2012-09-23 @516  	ob_write = ioread32(regs->outb_read_pointer);
bd756ddea18e02 Shun Fu    2012-09-23  517  	ob_write = ioread32(regs->outb_copy_pointer);
bd756ddea18e02 Shun Fu    2012-09-23  518  	*cur_obf = mhba->ob_cur_slot & mhba->regs->cl_slot_num_mask;
bd756ddea18e02 Shun Fu    2012-09-23  519  	*assign_obf_end = ob_write & mhba->regs->cl_slot_num_mask;
bd756ddea18e02 Shun Fu    2012-09-23  520  	if (*assign_obf_end < *cur_obf)
bd756ddea18e02 Shun Fu    2012-09-23  521  		*assign_obf_end += mhba->list_num_io;
bd756ddea18e02 Shun Fu    2012-09-23  522  	else if (*assign_obf_end == *cur_obf)
bd756ddea18e02 Shun Fu    2012-09-23  523  		return -1;
bd756ddea18e02 Shun Fu    2012-09-23  524  	return 0;
bd756ddea18e02 Shun Fu    2012-09-23  525  }
bd756ddea18e02 Shun Fu    2012-09-23  526  
bd756ddea18e02 Shun Fu    2012-09-23  527  static void mvumi_receive_ob_list_entry(struct mvumi_hba *mhba)
bd756ddea18e02 Shun Fu    2012-09-23  528  {
bd756ddea18e02 Shun Fu    2012-09-23  529  	unsigned int cur_obf, assign_obf_end, i;
bd756ddea18e02 Shun Fu    2012-09-23  530  	struct mvumi_ob_data *ob_data;
bd756ddea18e02 Shun Fu    2012-09-23  531  	struct mvumi_rsp_frame *p_outb_frame;
bd756ddea18e02 Shun Fu    2012-09-23  532  	struct mvumi_hw_regs *regs = mhba->regs;
bd756ddea18e02 Shun Fu    2012-09-23  533  
bd756ddea18e02 Shun Fu    2012-09-23  534  	if (mhba->instancet->check_ob_list(mhba, &cur_obf, &assign_obf_end))
bd756ddea18e02 Shun Fu    2012-09-23  535  		return;
bd756ddea18e02 Shun Fu    2012-09-23  536  
f0c568a478f035 Jianyun Li 2011-05-11  537  	for (i = (assign_obf_end - cur_obf); i != 0; i--) {
f0c568a478f035 Jianyun Li 2011-05-11  538  		cur_obf++;
f0c568a478f035 Jianyun Li 2011-05-11  539  		if (cur_obf >= mhba->list_num_io) {
f0c568a478f035 Jianyun Li 2011-05-11  540  			cur_obf -= mhba->list_num_io;
bd756ddea18e02 Shun Fu    2012-09-23  541  			mhba->ob_cur_slot ^= regs->cl_pointer_toggle;
f0c568a478f035 Jianyun Li 2011-05-11  542  		}
f0c568a478f035 Jianyun Li 2011-05-11  543  
f0c568a478f035 Jianyun Li 2011-05-11  544  		p_outb_frame = mhba->ob_list + cur_obf * mhba->ob_max_size;
f0c568a478f035 Jianyun Li 2011-05-11  545  
f0c568a478f035 Jianyun Li 2011-05-11  546  		/* Copy pointer may point to entry in outbound list
f0c568a478f035 Jianyun Li 2011-05-11  547  		*  before entry has valid data
f0c568a478f035 Jianyun Li 2011-05-11  548  		*/
f0c568a478f035 Jianyun Li 2011-05-11  549  		if (unlikely(p_outb_frame->tag > mhba->tag_pool.size ||
f0c568a478f035 Jianyun Li 2011-05-11  550  			mhba->tag_cmd[p_outb_frame->tag] == NULL ||
f0c568a478f035 Jianyun Li 2011-05-11  551  			p_outb_frame->request_id !=
f0c568a478f035 Jianyun Li 2011-05-11  552  				mhba->tag_cmd[p_outb_frame->tag]->request_id))
f0c568a478f035 Jianyun Li 2011-05-11  553  			if (mvumi_check_ob_frame(mhba, cur_obf, p_outb_frame))
f0c568a478f035 Jianyun Li 2011-05-11  554  				continue;
f0c568a478f035 Jianyun Li 2011-05-11  555  
f0c568a478f035 Jianyun Li 2011-05-11  556  		if (!list_empty(&mhba->ob_data_list)) {
f0c568a478f035 Jianyun Li 2011-05-11  557  			ob_data = (struct mvumi_ob_data *)
f0c568a478f035 Jianyun Li 2011-05-11  558  				list_first_entry(&mhba->ob_data_list,
f0c568a478f035 Jianyun Li 2011-05-11  559  					struct mvumi_ob_data, list);
f0c568a478f035 Jianyun Li 2011-05-11  560  			list_del_init(&ob_data->list);
f0c568a478f035 Jianyun Li 2011-05-11  561  		} else {
f0c568a478f035 Jianyun Li 2011-05-11  562  			ob_data = NULL;
f0c568a478f035 Jianyun Li 2011-05-11  563  			if (cur_obf == 0) {
f0c568a478f035 Jianyun Li 2011-05-11  564  				cur_obf = mhba->list_num_io - 1;
bd756ddea18e02 Shun Fu    2012-09-23  565  				mhba->ob_cur_slot ^= regs->cl_pointer_toggle;
f0c568a478f035 Jianyun Li 2011-05-11  566  			} else
f0c568a478f035 Jianyun Li 2011-05-11  567  				cur_obf -= 1;
f0c568a478f035 Jianyun Li 2011-05-11  568  			break;
f0c568a478f035 Jianyun Li 2011-05-11  569  		}
f0c568a478f035 Jianyun Li 2011-05-11  570  
f0c568a478f035 Jianyun Li 2011-05-11  571  		memcpy(ob_data->data, p_outb_frame, mhba->ob_max_size);
f0c568a478f035 Jianyun Li 2011-05-11  572  		p_outb_frame->tag = 0xff;
f0c568a478f035 Jianyun Li 2011-05-11  573  
f0c568a478f035 Jianyun Li 2011-05-11  574  		list_add_tail(&ob_data->list, &mhba->free_ob_list);
f0c568a478f035 Jianyun Li 2011-05-11  575  	}
bd756ddea18e02 Shun Fu    2012-09-23  576  	mhba->ob_cur_slot &= ~regs->cl_slot_num_mask;
bd756ddea18e02 Shun Fu    2012-09-23  577  	mhba->ob_cur_slot |= (cur_obf & regs->cl_slot_num_mask);
bd756ddea18e02 Shun Fu    2012-09-23 @578  	iowrite32(mhba->ob_cur_slot, regs->outb_read_pointer);
f0c568a478f035 Jianyun Li 2011-05-11  579  }
f0c568a478f035 Jianyun Li 2011-05-11  580  
bd756ddea18e02 Shun Fu    2012-09-23  581  static void mvumi_reset(struct mvumi_hba *mhba)
f0c568a478f035 Jianyun Li 2011-05-11  582  {
bd756ddea18e02 Shun Fu    2012-09-23  583  	struct mvumi_hw_regs *regs = mhba->regs;
bd756ddea18e02 Shun Fu    2012-09-23  584  
bd756ddea18e02 Shun Fu    2012-09-23  585  	iowrite32(0, regs->enpointa_mask_reg);
bd756ddea18e02 Shun Fu    2012-09-23 @586  	if (ioread32(regs->arm_to_pciea_msg1) != HANDSHAKE_DONESTATE)
f0c568a478f035 Jianyun Li 2011-05-11  587  		return;
f0c568a478f035 Jianyun Li 2011-05-11  588  
bd756ddea18e02 Shun Fu    2012-09-23  589  	iowrite32(DRBL_SOFT_RESET, regs->pciea_to_arm_drbl_reg);
f0c568a478f035 Jianyun Li 2011-05-11  590  }
f0c568a478f035 Jianyun Li 2011-05-11  591  

:::::: The code at line 429 was first introduced by commit
:::::: bd756ddea18e02ccea8b29496b2fe3bd91af8eb7 [SCSI] mvumi: Add support for Marvell SAS/SATA RAID-on-Chip(ROC) 88RC9580

:::::: TO: Shun Fu <fushun@gmail.com>
:::::: CC: James Bottomley <JBottomley@Parallels.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
