Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCE71862
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790297323; cv=none; b=bb7u1kJ+ejMQjzeJFzNGne+TQCILaXaMsYgjx3uKRoEZ2n7JH16XhdyPRFvq87tpuKRdu2ucLl+Cgli+B2EjQbIOVSMOZhhLAnS162V69QeQW/d2flJMcyAwQW4PD9ibJqBpb395Gd5CP6+ZAu5QrbqjQwWKc93InkOUBJdv9rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790297323; c=relaxed/simple;
	bh=GFw5Gj8ibtE/tRg6SmBQRQcbrLj8EinE+LJ63pA78F8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MDMm1NOOnSGIqxz+l3abSmYqWScmKlz6Yo3zN66sChCoGUQgyiAbFOCJ8haqSspqKqy92bbDXheHJcBPmkPGJtV49QFFqDsFIeJSZHEosmEX/PBbzP7JnLp+sGYQqwbSB4AIjlFX4pPa2fcYquZBOBLMdlX0KojMKeugZezAd2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aluNRLae; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aluNRLae"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790297321; x=1821833321;
  h=date:from:to:cc:subject:message-id;
  bh=GFw5Gj8ibtE/tRg6SmBQRQcbrLj8EinE+LJ63pA78F8=;
  b=aluNRLaeMIQne/TIWMBZMUMYKFQxmoov3sp4W4VYkUM+HXCnz0H753OT
   cC6nX51VJWHkZnWUGY/AidQeAol2ilbhMKriuHIbZ98T+wCEG7eMD2rvZ
   /woFOD1LiHrdgG5wO8z5Kda8Ccpiu75y1dXbNmZBUoCa/JPnWZS0exTKj
   7idkUtWJLTBhcrlO4BEZOnidmAfXqSUmhZSQbeXspcO6RQjnlyxoRR2jh
   bhFoFZrps6+nNBdcfDa2MiNUufHwnwXPUF8Cvj+hAb53T9+f/7x1o9bP4
   eAhpnwfkIt7T5PIaRKmSijkbh7OAxkuMdwDK3Mm20t+Ebuzb6uWtIf7Oe
   w==;
X-CSE-ConnectionGUID: QFJ7DBglSxatsYPbKzF7ow==
X-CSE-MsgGUID: cJQyFKUrQR276FYPRH218w==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="102444284"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="102444284"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 17:48:40 -0700
X-CSE-ConnectionGUID: D8UNRBX7Sjyj5NtyWAqJeA==
X-CSE-MsgGUID: 8VIzWg28SgqcuFUv6Ym51Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="277353397"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Sep 2026 17:48:37 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9u78-00000000JtK-00A2;
	Fri, 25 Sep 2026 00:48:34 +0000
Date: Fri, 25 Sep 2026 08:48:14 +0800
From: kernel test robot <lkp@intel.com>
To: Karan Tilak Kumar <kartilak@cisco.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Sesidhar Baddela <sebaddel@cisco.com>,
 Arulprabhu Ponnusamy <arulponn@cisco.com>,
 Gian Carlo Boffa <gcboffa@cisco.com>, Arun Easi <aeasi@cisco.com>,
 Hannes Reinecke <hare@kernel.org>, Lee Duncan <lduncan@suse.com>
Subject: drivers/scsi/fnic/fnic_isr.c:225:33: sparse: sparse:
 incompatible types in conditional expression (different base types):
Message-ID: <202609250836.JWz5fAA0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5fc5768c7ca92895ccd1de94dc521e5a55ae7896
commit: b93c38a9f2ce5441c90de55776f8df97679cf8a2 scsi: fnic: Make debug logging protocol independent
date:   8 weeks ago
config: x86_64-randconfig-1300-20260925 (https://download.01.org/0day-ci/archive/20260925/202609250836.JWz5fAA0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609250836.JWz5fAA0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b93c38a9f2ce ("scsi: fnic: Make debug logging protocol independent")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609250836.JWz5fAA0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/scsi/fnic/fnic_isr.c: note: in included file (through drivers/scsi/fnic/fdls_fc.h, drivers/scsi/fnic/fnic_fdls.h, drivers/scsi/fnic/fnic_io.h):
   include/uapi/scsi/fc/fc_els.h:1152:37: sparse: sparse: array of flexible structures
   include/uapi/scsi/fc/fc_els.h:1170:37: sparse: sparse: array of flexible structures
>> drivers/scsi/fnic/fnic_isr.c:225:33: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_isr.c:225:33: sparse:    void
   drivers/scsi/fnic/fnic_isr.c:225:33: sparse:    int
   drivers/scsi/fnic/fnic_isr.c:253:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_isr.c:253:9: sparse:    void
   drivers/scsi/fnic/fnic_isr.c:253:9: sparse:    int
   drivers/scsi/fnic/fnic_isr.c:256:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_isr.c:256:9: sparse:    void
   drivers/scsi/fnic/fnic_isr.c:256:9: sparse:    int
   drivers/scsi/fnic/fnic_isr.c:268:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_isr.c:268:17: sparse:    void
   drivers/scsi/fnic/fnic_isr.c:268:17: sparse:    int
   drivers/scsi/fnic/fnic_isr.c:274:33: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_isr.c:274:33: sparse:    void
   drivers/scsi/fnic/fnic_isr.c:274:33: sparse:    int
   drivers/scsi/fnic/fnic_isr.c:278:41: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_isr.c:278:41: sparse:    void
   drivers/scsi/fnic/fnic_isr.c:278:41: sparse:    int
   drivers/scsi/fnic/fnic_isr.c:290:33: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_isr.c:290:33: sparse:    void
   drivers/scsi/fnic/fnic_isr.c:290:33: sparse:    int
   drivers/scsi/fnic/fnic_isr.c:298:25: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_isr.c:298:25: sparse:    void
   drivers/scsi/fnic/fnic_isr.c:298:25: sparse:    int
   drivers/scsi/fnic/fnic_isr.c:303:25: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_isr.c:303:25: sparse:    void
   drivers/scsi/fnic/fnic_isr.c:303:25: sparse:    int
   drivers/scsi/fnic/fnic_isr.c:308:25: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_isr.c:308:25: sparse:    void
   drivers/scsi/fnic/fnic_isr.c:308:25: sparse:    int
   drivers/scsi/fnic/fnic_isr.c:314:25: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_isr.c:314:25: sparse:    void
   drivers/scsi/fnic/fnic_isr.c:314:25: sparse:    int
   drivers/scsi/fnic/fnic_isr.c:354:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_isr.c:354:17: sparse:    void
   drivers/scsi/fnic/fnic_isr.c:354:17: sparse:    int
   drivers/scsi/fnic/fnic_isr.c:380:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_isr.c:380:17: sparse:    void
   drivers/scsi/fnic/fnic_isr.c:380:17: sparse:    int
--
   drivers/scsi/fnic/fip.c: note: in included file (through drivers/scsi/fnic/fdls_fc.h, drivers/scsi/fnic/fnic_fdls.h, drivers/scsi/fnic/fnic_io.h, drivers/scsi/fnic/fnic.h):
   include/uapi/scsi/fc/fc_els.h:1152:37: sparse: sparse: array of flexible structures
   include/uapi/scsi/fc/fc_els.h:1170:37: sparse: sparse: array of flexible structures
>> drivers/scsi/fnic/fip.c:30:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fip.c:30:9: sparse:    void
   drivers/scsi/fnic/fip.c:30:9: sparse:    int
   drivers/scsi/fnic/fip.c:49:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fip.c:49:17: sparse:    void
   drivers/scsi/fnic/fip.c:49:17: sparse:    int
   drivers/scsi/fnic/fip.c:57:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fip.c:57:9: sparse:    void
   drivers/scsi/fnic/fip.c:57:9: sparse:    int
   drivers/scsi/fnic/fip.c:60:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fip.c:60:9: sparse:    void
   drivers/scsi/fnic/fip.c:60:9: sparse:    int
   drivers/scsi/fnic/fip.c:84:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fip.c:84:9: sparse:    void
   drivers/scsi/fnic/fip.c:84:9: sparse:    int
   drivers/scsi/fnic/fip.c:90:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fip.c:90:9: sparse:    void
   drivers/scsi/fnic/fip.c:90:9: sparse:    int
   drivers/scsi/fnic/fip.c:114:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fip.c:114:9: sparse:    void
   drivers/scsi/fnic/fip.c:114:9: sparse:    int
   drivers/scsi/fnic/fip.c:118:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fip.c:118:9: sparse:    void
   drivers/scsi/fnic/fip.c:118:9: sparse:    int
   drivers/scsi/fnic/fip.c:131:33: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fip.c:131:33: sparse:    void
   drivers/scsi/fnic/fip.c:131:33: sparse:    int
   drivers/scsi/fnic/fip.c:138:25: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fip.c:138:25: sparse:    void
   drivers/scsi/fnic/fip.c:138:25: sparse:    int
   drivers/scsi/fnic/fip.c:144:33: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fip.c:144:33: sparse:    void
   drivers/scsi/fnic/fip.c:144:33: sparse:    int
   drivers/scsi/fnic/fip.c:160:25: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fip.c:160:25: sparse:    void
   drivers/scsi/fnic/fip.c:160:25: sparse:    int
   drivers/scsi/fnic/fip.c:170:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fip.c:170:17: sparse:    void
   drivers/scsi/fnic/fip.c:170:17: sparse:    int
   drivers/scsi/fnic/fip.c:195:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fip.c:195:17: sparse:    void
   drivers/scsi/fnic/fip.c:195:17: sparse:    int
   drivers/scsi/fnic/fip.c:222:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fip.c:222:9: sparse:    void
   drivers/scsi/fnic/fip.c:222:9: sparse:    int
   drivers/scsi/fnic/fip.c:257:25: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fip.c:257:25: sparse:    void
   drivers/scsi/fnic/fip.c:257:25: sparse:    int
   drivers/scsi/fnic/fip.c:264:33: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fip.c:264:33: sparse:    void
   drivers/scsi/fnic/fip.c:264:33: sparse:    int
   drivers/scsi/fnic/fip.c:272:33: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fip.c:272:33: sparse:    void
   drivers/scsi/fnic/fip.c:272:33: sparse:    int
   drivers/scsi/fnic/fip.c:291:41: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fip.c:291:41: sparse:    void
   drivers/scsi/fnic/fip.c:291:41: sparse:    int
   drivers/scsi/fnic/fip.c:359:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fip.c:359:17: sparse:    void
   drivers/scsi/fnic/fip.c:359:17: sparse:    int
   drivers/scsi/fnic/fip.c:412:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fip.c:412:17: sparse:    void
   drivers/scsi/fnic/fip.c:412:17: sparse:    int
   drivers/scsi/fnic/fip.c:424:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fip.c:424:9: sparse:    void
   drivers/scsi/fnic/fip.c:424:9: sparse:    int
   drivers/scsi/fnic/fip.c:454:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fip.c:454:9: sparse:    void
   drivers/scsi/fnic/fip.c:454:9: sparse:    int
   drivers/scsi/fnic/fip.c:458:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fip.c:458:17: sparse:    void
   drivers/scsi/fnic/fip.c:458:17: sparse:    int
   drivers/scsi/fnic/fip.c:468:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fip.c:468:17: sparse:    void
   drivers/scsi/fnic/fip.c:468:17: sparse:    int
   drivers/scsi/fnic/fip.c:481:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fip.c:481:17: sparse:    void
   drivers/scsi/fnic/fip.c:481:17: sparse:    int
   drivers/scsi/fnic/fip.c:489:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fip.c:489:17: sparse:    void
   drivers/scsi/fnic/fip.c:489:17: sparse:    int
   drivers/scsi/fnic/fip.c:499:25: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fip.c:499:25: sparse:    void
   drivers/scsi/fnic/fip.c:499:25: sparse:    int
   drivers/scsi/fnic/fip.c:515:33: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fip.c:515:33: sparse:    void
   drivers/scsi/fnic/fip.c:515:33: sparse:    int
   drivers/scsi/fnic/fip.c:523:25: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fip.c:523:25: sparse:    void
   drivers/scsi/fnic/fip.c:523:25: sparse:    int
   drivers/scsi/fnic/fip.c:570:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fip.c:570:9: sparse:    void
   drivers/scsi/fnic/fip.c:570:9: sparse:    int
   drivers/scsi/fnic/fip.c:612:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fip.c:612:9: sparse:    void
   drivers/scsi/fnic/fip.c:612:9: sparse:    int
   drivers/scsi/fnic/fip.c:620:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fip.c:620:17: sparse:    void
   drivers/scsi/fnic/fip.c:620:17: sparse:    int
   drivers/scsi/fnic/fip.c:635:33: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fip.c:635:33: sparse:    void
--
   drivers/scsi/fnic/fnic_main.c: note: in included file (through drivers/scsi/fnic/fdls_fc.h, drivers/scsi/fnic/fnic_fdls.h, drivers/scsi/fnic/fnic_io.h):
   include/uapi/scsi/fc/fc_els.h:1152:37: sparse: sparse: array of flexible structures
   include/uapi/scsi/fc/fc_els.h:1170:37: sparse: sparse: array of flexible structures
>> drivers/scsi/fnic/fnic_main.c:188:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_main.c:188:9: sparse:    void
   drivers/scsi/fnic/fnic_main.c:188:9: sparse:    int
   drivers/scsi/fnic/fnic_main.c:238:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_main.c:238:17: sparse:    void
   drivers/scsi/fnic/fnic_main.c:238:17: sparse:    int
   drivers/scsi/fnic/fnic_main.c:264:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_main.c:264:17: sparse:    void
   drivers/scsi/fnic/fnic_main.c:264:17: sparse:    int
   drivers/scsi/fnic/fnic_main.c:375:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_main.c:375:17: sparse:    void
   drivers/scsi/fnic/fnic_main.c:375:17: sparse:    int
   drivers/scsi/fnic/fnic_main.c:292:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_main.c:292:9: sparse:    void
   drivers/scsi/fnic/fnic_main.c:292:9: sparse:    int
   drivers/scsi/fnic/fnic_main.c:295:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_main.c:295:9: sparse:    void
   drivers/scsi/fnic/fnic_main.c:295:9: sparse:    int
   drivers/scsi/fnic/fnic_main.c:298:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_main.c:298:9: sparse:    void
   drivers/scsi/fnic/fnic_main.c:298:9: sparse:    int
   drivers/scsi/fnic/fnic_main.c:301:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_main.c:301:9: sparse:    void
   drivers/scsi/fnic/fnic_main.c:301:9: sparse:    int
   drivers/scsi/fnic/fnic_main.c:304:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_main.c:304:9: sparse:    void
   drivers/scsi/fnic/fnic_main.c:304:9: sparse:    int
   drivers/scsi/fnic/fnic_main.c:307:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_main.c:307:9: sparse:    void
   drivers/scsi/fnic/fnic_main.c:307:9: sparse:    int
   drivers/scsi/fnic/fnic_main.c:310:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_main.c:310:9: sparse:    void
   drivers/scsi/fnic/fnic_main.c:310:9: sparse:    int
   drivers/scsi/fnic/fnic_main.c:313:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_main.c:313:9: sparse:    void
   drivers/scsi/fnic/fnic_main.c:313:9: sparse:    int
   drivers/scsi/fnic/fnic_main.c:316:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_main.c:316:9: sparse:    void
   drivers/scsi/fnic/fnic_main.c:316:9: sparse:    int
   drivers/scsi/fnic/fnic_main.c:319:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_main.c:319:9: sparse:    void
   drivers/scsi/fnic/fnic_main.c:319:9: sparse:    int
   drivers/scsi/fnic/fnic_main.c:322:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_main.c:322:9: sparse:    void
   drivers/scsi/fnic/fnic_main.c:322:9: sparse:    int
   drivers/scsi/fnic/fnic_main.c:325:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_main.c:325:9: sparse:    void
   drivers/scsi/fnic/fnic_main.c:325:9: sparse:    int
   drivers/scsi/fnic/fnic_main.c:328:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_main.c:328:9: sparse:    void
   drivers/scsi/fnic/fnic_main.c:328:9: sparse:    int
   drivers/scsi/fnic/fnic_main.c:331:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_main.c:331:9: sparse:    void
   drivers/scsi/fnic/fnic_main.c:331:9: sparse:    int
   drivers/scsi/fnic/fnic_main.c:334:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_main.c:334:9: sparse:    void
   drivers/scsi/fnic/fnic_main.c:334:9: sparse:    int
   drivers/scsi/fnic/fnic_main.c:337:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_main.c:337:9: sparse:    void
   drivers/scsi/fnic/fnic_main.c:337:9: sparse:    int
   drivers/scsi/fnic/fnic_main.c:340:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_main.c:340:9: sparse:    void
   drivers/scsi/fnic/fnic_main.c:340:9: sparse:    int
   drivers/scsi/fnic/fnic_main.c:343:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_main.c:343:9: sparse:    void
   drivers/scsi/fnic/fnic_main.c:343:9: sparse:    int
   drivers/scsi/fnic/fnic_main.c:346:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_main.c:346:9: sparse:    void
   drivers/scsi/fnic/fnic_main.c:346:9: sparse:    int
   drivers/scsi/fnic/fnic_main.c:349:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_main.c:349:9: sparse:    void
   drivers/scsi/fnic/fnic_main.c:349:9: sparse:    int
   drivers/scsi/fnic/fnic_main.c:689:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_main.c:689:17: sparse:    void
   drivers/scsi/fnic/fnic_main.c:689:17: sparse:    int
   drivers/scsi/fnic/fnic_main.c:694:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_main.c:694:9: sparse:    void
   drivers/scsi/fnic/fnic_main.c:694:9: sparse:    int
   drivers/scsi/fnic/fnic_main.c:698:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_main.c:698:17: sparse:    void
   drivers/scsi/fnic/fnic_main.c:698:17: sparse:    int
--
   drivers/scsi/fnic/fnic_fcs.c: note: in included file:
   include/uapi/scsi/fc/fc_els.h:1152:37: sparse: sparse: array of flexible structures
   include/uapi/scsi/fc/fc_els.h:1170:37: sparse: sparse: array of flexible structures
>> drivers/scsi/fnic/fnic_fcs.c:85:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_fcs.c:85:9: sparse:    void
   drivers/scsi/fnic/fnic_fcs.c:85:9: sparse:    int
   drivers/scsi/fnic/fnic_fcs.c:93:25: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_fcs.c:93:25: sparse:    void
   drivers/scsi/fnic/fnic_fcs.c:93:25: sparse:    int
   drivers/scsi/fnic/fnic_fcs.c:98:25: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_fcs.c:98:25: sparse:    void
   drivers/scsi/fnic/fnic_fcs.c:98:25: sparse:    int
   drivers/scsi/fnic/fnic_fcs.c:128:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_fcs.c:128:9: sparse:    void
   drivers/scsi/fnic/fnic_fcs.c:128:9: sparse:    int
   drivers/scsi/fnic/fnic_fcs.c:134:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_fcs.c:134:9: sparse:    void
   drivers/scsi/fnic/fnic_fcs.c:134:9: sparse:    int
   drivers/scsi/fnic/fnic_fcs.c:152:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_fcs.c:152:9: sparse:    void
   drivers/scsi/fnic/fnic_fcs.c:152:9: sparse:    int
   drivers/scsi/fnic/fnic_fcs.c:171:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_fcs.c:171:17: sparse:    void
   drivers/scsi/fnic/fnic_fcs.c:171:17: sparse:    int
   drivers/scsi/fnic/fnic_fcs.c:178:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_fcs.c:178:17: sparse:    void
   drivers/scsi/fnic/fnic_fcs.c:178:17: sparse:    int
   drivers/scsi/fnic/fnic_fcs.c:187:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_fcs.c:187:17: sparse:    void
   drivers/scsi/fnic/fnic_fcs.c:187:17: sparse:    int
   drivers/scsi/fnic/fnic_fcs.c:190:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_fcs.c:190:17: sparse:    void
   drivers/scsi/fnic/fnic_fcs.c:190:17: sparse:    int
   drivers/scsi/fnic/fnic_fcs.c:202:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_fcs.c:202:17: sparse:    void
   drivers/scsi/fnic/fnic_fcs.c:202:17: sparse:    int
   drivers/scsi/fnic/fnic_fcs.c:206:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_fcs.c:206:17: sparse:    void
   drivers/scsi/fnic/fnic_fcs.c:206:17: sparse:    int
   drivers/scsi/fnic/fnic_fcs.c:210:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_fcs.c:210:17: sparse:    void
   drivers/scsi/fnic/fnic_fcs.c:210:17: sparse:    int
   drivers/scsi/fnic/fnic_fcs.c:216:25: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_fcs.c:216:25: sparse:    void
   drivers/scsi/fnic/fnic_fcs.c:216:25: sparse:    int
   drivers/scsi/fnic/fnic_fcs.c:222:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_fcs.c:222:9: sparse:    void
   drivers/scsi/fnic/fnic_fcs.c:222:9: sparse:    int
   drivers/scsi/fnic/fnic_fcs.c:228:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_fcs.c:228:17: sparse:    void
   drivers/scsi/fnic/fnic_fcs.c:228:17: sparse:    int
   drivers/scsi/fnic/fnic_fcs.c:231:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_fcs.c:231:17: sparse:    void
   drivers/scsi/fnic/fnic_fcs.c:231:17: sparse:    int
   drivers/scsi/fnic/fnic_fcs.c:240:25: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_fcs.c:240:25: sparse:    void
   drivers/scsi/fnic/fnic_fcs.c:240:25: sparse:    int
   drivers/scsi/fnic/fnic_fcs.c:246:33: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_fcs.c:246:33: sparse:    void
   drivers/scsi/fnic/fnic_fcs.c:246:33: sparse:    int
   drivers/scsi/fnic/fnic_fcs.c:250:33: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_fcs.c:250:33: sparse:    void
   drivers/scsi/fnic/fnic_fcs.c:250:33: sparse:    int
   drivers/scsi/fnic/fnic_fcs.c:256:33: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_fcs.c:256:33: sparse:    void
   drivers/scsi/fnic/fnic_fcs.c:256:33: sparse:    int
   drivers/scsi/fnic/fnic_fcs.c:263:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_fcs.c:263:17: sparse:    void
   drivers/scsi/fnic/fnic_fcs.c:263:17: sparse:    int
   drivers/scsi/fnic/fnic_fcs.c:269:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_fcs.c:269:17: sparse:    void
   drivers/scsi/fnic/fnic_fcs.c:269:17: sparse:    int
   drivers/scsi/fnic/fnic_fcs.c:278:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_fcs.c:278:9: sparse:    void
   drivers/scsi/fnic/fnic_fcs.c:278:9: sparse:    int
   drivers/scsi/fnic/fnic_fcs.c:305:25: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_fcs.c:305:25: sparse:    void
   drivers/scsi/fnic/fnic_fcs.c:305:25: sparse:    int
   drivers/scsi/fnic/fnic_fcs.c:331:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_fcs.c:331:9: sparse:    void
   drivers/scsi/fnic/fnic_fcs.c:331:9: sparse:    int
   drivers/scsi/fnic/fnic_fcs.c:410:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_fcs.c:410:9: sparse:    void
   drivers/scsi/fnic/fnic_fcs.c:410:9: sparse:    int
   drivers/scsi/fnic/fnic_fcs.c:480:25: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_fcs.c:480:25: sparse:    void
   drivers/scsi/fnic/fnic_fcs.c:480:25: sparse:    int
   drivers/scsi/fnic/fnic_fcs.c:490:25: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_fcs.c:490:25: sparse:    void
   drivers/scsi/fnic/fnic_fcs.c:490:25: sparse:    int
   drivers/scsi/fnic/fnic_fcs.c:497:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_fcs.c:497:17: sparse:    void
   drivers/scsi/fnic/fnic_fcs.c:497:17: sparse:    int
   drivers/scsi/fnic/fnic_fcs.c:504:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_fcs.c:504:17: sparse:    void
   drivers/scsi/fnic/fnic_fcs.c:504:17: sparse:    int
   drivers/scsi/fnic/fnic_fcs.c:514:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_fcs.c:514:17: sparse:    void
   drivers/scsi/fnic/fnic_fcs.c:514:17: sparse:    int
   drivers/scsi/fnic/fnic_fcs.c:524:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_fcs.c:524:17: sparse:    void
   drivers/scsi/fnic/fnic_fcs.c:524:17: sparse:    int
   drivers/scsi/fnic/fnic_fcs.c:570:33: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_fcs.c:570:33: sparse:    void
--
   drivers/scsi/fnic/fnic_scsi.c: note: in included file:
   include/uapi/scsi/fc/fc_els.h:1152:37: sparse: sparse: array of flexible structures
   include/uapi/scsi/fc/fc_els.h:1170:37: sparse: sparse: array of flexible structures
>> drivers/scsi/fnic/fnic_scsi.c:1607:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_scsi.c:1607:9: sparse:    void
   drivers/scsi/fnic/fnic_scsi.c:1607:9: sparse:    int
   drivers/scsi/fnic/fnic_scsi.c:1632:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_scsi.c:1632:17: sparse:    void
   drivers/scsi/fnic/fnic_scsi.c:1632:17: sparse:    int
   drivers/scsi/fnic/fnic_scsi.c:151:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_scsi.c:151:9: sparse:    void
   drivers/scsi/fnic/fnic_scsi.c:151:9: sparse:    int
   drivers/scsi/fnic/fnic_scsi.c:183:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_scsi.c:183:9: sparse:    void
   drivers/scsi/fnic/fnic_scsi.c:183:9: sparse:    int
   drivers/scsi/fnic/fnic_scsi.c:271:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_scsi.c:271:17: sparse:    void
   drivers/scsi/fnic/fnic_scsi.c:271:17: sparse:    int
   drivers/scsi/fnic/fnic_scsi.c:286:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_scsi.c:286:17: sparse:    void
   drivers/scsi/fnic/fnic_scsi.c:286:17: sparse:    int
   drivers/scsi/fnic/fnic_scsi.c:290:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_scsi.c:290:17: sparse:    void
   drivers/scsi/fnic/fnic_scsi.c:290:17: sparse:    int
   drivers/scsi/fnic/fnic_scsi.c:329:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_scsi.c:329:17: sparse:    void
   drivers/scsi/fnic/fnic_scsi.c:329:17: sparse:    int
   drivers/scsi/fnic/fnic_scsi.c:335:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_scsi.c:335:17: sparse:    void
   drivers/scsi/fnic/fnic_scsi.c:335:17: sparse:    int
   drivers/scsi/fnic/fnic_scsi.c:481:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_scsi.c:481:17: sparse:    void
   drivers/scsi/fnic/fnic_scsi.c:481:17: sparse:    int
   drivers/scsi/fnic/fnic_scsi.c:490:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_scsi.c:490:17: sparse:    void
   drivers/scsi/fnic/fnic_scsi.c:490:17: sparse:    int
   drivers/scsi/fnic/fnic_scsi.c:504:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_scsi.c:504:17: sparse:    void
   drivers/scsi/fnic/fnic_scsi.c:504:17: sparse:    int
   drivers/scsi/fnic/fnic_scsi.c:518:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_scsi.c:518:17: sparse:    void
   drivers/scsi/fnic/fnic_scsi.c:518:17: sparse:    int
   drivers/scsi/fnic/fnic_scsi.c:524:25: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_scsi.c:524:25: sparse:    void
   drivers/scsi/fnic/fnic_scsi.c:524:25: sparse:    int
   drivers/scsi/fnic/fnic_scsi.c:547:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_scsi.c:547:17: sparse:    void
   drivers/scsi/fnic/fnic_scsi.c:547:17: sparse:    int
   drivers/scsi/fnic/fnic_scsi.c:567:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_scsi.c:567:17: sparse:    void
   drivers/scsi/fnic/fnic_scsi.c:567:17: sparse:    int
   drivers/scsi/fnic/fnic_scsi.c:707:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_scsi.c:707:17: sparse:    void
   drivers/scsi/fnic/fnic_scsi.c:707:17: sparse:    int
   drivers/scsi/fnic/fnic_scsi.c:747:25: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_scsi.c:747:25: sparse:    void
   drivers/scsi/fnic/fnic_scsi.c:747:25: sparse:    int
   drivers/scsi/fnic/fnic_scsi.c:752:25: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_scsi.c:752:25: sparse:    void
   drivers/scsi/fnic/fnic_scsi.c:752:25: sparse:    int
   drivers/scsi/fnic/fnic_scsi.c:761:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_scsi.c:761:17: sparse:    void
   drivers/scsi/fnic/fnic_scsi.c:761:17: sparse:    int
   drivers/scsi/fnic/fnic_scsi.c:813:25: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_scsi.c:813:25: sparse:    void
   drivers/scsi/fnic/fnic_scsi.c:813:25: sparse:    int
   drivers/scsi/fnic/fnic_scsi.c:817:25: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_scsi.c:817:25: sparse:    void
   drivers/scsi/fnic/fnic_scsi.c:817:25: sparse:    int
   drivers/scsi/fnic/fnic_scsi.c:824:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_scsi.c:824:17: sparse:    void
   drivers/scsi/fnic/fnic_scsi.c:824:17: sparse:    int
   drivers/scsi/fnic/fnic_scsi.c:935:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_scsi.c:935:17: sparse:    void
   drivers/scsi/fnic/fnic_scsi.c:935:17: sparse:    int
   drivers/scsi/fnic/fnic_scsi.c:938:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_scsi.c:938:17: sparse:    void
   drivers/scsi/fnic/fnic_scsi.c:938:17: sparse:    int
   drivers/scsi/fnic/fnic_scsi.c:944:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_scsi.c:944:17: sparse:    void
   drivers/scsi/fnic/fnic_scsi.c:944:17: sparse:    int
   drivers/scsi/fnic/fnic_scsi.c:947:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_scsi.c:947:17: sparse:    void
   drivers/scsi/fnic/fnic_scsi.c:947:17: sparse:    int
   drivers/scsi/fnic/fnic_scsi.c:959:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_scsi.c:959:17: sparse:    void
   drivers/scsi/fnic/fnic_scsi.c:959:17: sparse:    int
   drivers/scsi/fnic/fnic_scsi.c:987:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_scsi.c:987:17: sparse:    void
   drivers/scsi/fnic/fnic_scsi.c:987:17: sparse:    int
   drivers/scsi/fnic/fnic_scsi.c:1014:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_scsi.c:1014:17: sparse:    void
   drivers/scsi/fnic/fnic_scsi.c:1014:17: sparse:    int
   drivers/scsi/fnic/fnic_scsi.c:1046:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_scsi.c:1046:17: sparse:    void
   drivers/scsi/fnic/fnic_scsi.c:1046:17: sparse:    int
   drivers/scsi/fnic/fnic_scsi.c:1109:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_scsi.c:1109:17: sparse:    void
   drivers/scsi/fnic/fnic_scsi.c:1109:17: sparse:    int
   drivers/scsi/fnic/fnic_scsi.c:1202:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_scsi.c:1202:17: sparse:    void
   drivers/scsi/fnic/fnic_scsi.c:1202:17: sparse:    int
   drivers/scsi/fnic/fnic_scsi.c:1205:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fnic_scsi.c:1205:17: sparse:    void
--
   drivers/scsi/fnic/fdls_disc.c: note: in included file (through drivers/scsi/fnic/fdls_fc.h, drivers/scsi/fnic/fnic_fdls.h, drivers/scsi/fnic/fnic_io.h, drivers/scsi/fnic/fnic.h):
   include/uapi/scsi/fc/fc_els.h:1152:37: sparse: sparse: array of flexible structures
   include/uapi/scsi/fc/fc_els.h:1170:37: sparse: sparse: array of flexible structures
>> drivers/scsi/fnic/fdls_disc.c:1854:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fdls_disc.c:1854:17: sparse:    void
   drivers/scsi/fnic/fdls_disc.c:1854:17: sparse:    int
   drivers/scsi/fnic/fdls_disc.c:1882:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fdls_disc.c:1882:17: sparse:    void
   drivers/scsi/fnic/fdls_disc.c:1882:17: sparse:    int
   drivers/scsi/fnic/fdls_disc.c:1903:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fdls_disc.c:1903:9: sparse:    void
   drivers/scsi/fnic/fdls_disc.c:1903:9: sparse:    int
   drivers/scsi/fnic/fdls_disc.c:1910:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fdls_disc.c:1910:9: sparse:    void
   drivers/scsi/fnic/fdls_disc.c:1910:9: sparse:    int
   drivers/scsi/fnic/fdls_disc.c:1919:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fdls_disc.c:1919:17: sparse:    void
   drivers/scsi/fnic/fdls_disc.c:1919:17: sparse:    int
   drivers/scsi/fnic/fdls_disc.c:1930:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fdls_disc.c:1930:9: sparse:    void
   drivers/scsi/fnic/fdls_disc.c:1930:9: sparse:    int
   drivers/scsi/fnic/fdls_disc.c:1937:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fdls_disc.c:1937:9: sparse:    void
   drivers/scsi/fnic/fdls_disc.c:1937:9: sparse:    int
   drivers/scsi/fnic/fdls_disc.c:1944:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fdls_disc.c:1944:17: sparse:    void
   drivers/scsi/fnic/fdls_disc.c:1944:17: sparse:    int
   drivers/scsi/fnic/fdls_disc.c:1953:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fdls_disc.c:1953:9: sparse:    void
   drivers/scsi/fnic/fdls_disc.c:1953:9: sparse:    int
   drivers/scsi/fnic/fdls_disc.c:1960:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fdls_disc.c:1960:9: sparse:    void
   drivers/scsi/fnic/fdls_disc.c:1960:9: sparse:    int
   drivers/scsi/fnic/fdls_disc.c:1968:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fdls_disc.c:1968:17: sparse:    void
   drivers/scsi/fnic/fdls_disc.c:1968:17: sparse:    int
   drivers/scsi/fnic/fdls_disc.c:1975:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fdls_disc.c:1975:9: sparse:    void
   drivers/scsi/fnic/fdls_disc.c:1975:9: sparse:    int
   drivers/scsi/fnic/fdls_disc.c:1999:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fdls_disc.c:1999:17: sparse:    void
   drivers/scsi/fnic/fdls_disc.c:1999:17: sparse:    int
   drivers/scsi/fnic/fdls_disc.c:2027:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fdls_disc.c:2027:17: sparse:    void
   drivers/scsi/fnic/fdls_disc.c:2027:17: sparse:    int
   drivers/scsi/fnic/fdls_disc.c:2092:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fdls_disc.c:2092:9: sparse:    void
   drivers/scsi/fnic/fdls_disc.c:2092:9: sparse:    int
   drivers/scsi/fnic/fdls_disc.c:2101:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fdls_disc.c:2101:9: sparse:    void
   drivers/scsi/fnic/fdls_disc.c:2101:9: sparse:    int
   drivers/scsi/fnic/fdls_disc.c:2107:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fdls_disc.c:2107:9: sparse:    void
   drivers/scsi/fnic/fdls_disc.c:2107:9: sparse:    int
   drivers/scsi/fnic/fdls_disc.c:1012:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fdls_disc.c:1012:17: sparse:    void
   drivers/scsi/fnic/fdls_disc.c:1012:17: sparse:    int
   drivers/scsi/fnic/fdls_disc.c:1039:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fdls_disc.c:1039:17: sparse:    void
   drivers/scsi/fnic/fdls_disc.c:1039:17: sparse:    int
   drivers/scsi/fnic/fdls_disc.c:1048:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fdls_disc.c:1048:9: sparse:    void
   drivers/scsi/fnic/fdls_disc.c:1048:9: sparse:    int
   drivers/scsi/fnic/fdls_disc.c:3473:9: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fdls_disc.c:3473:9: sparse:    void
   drivers/scsi/fnic/fdls_disc.c:3473:9: sparse:    int
   drivers/scsi/fnic/fdls_disc.c:3477:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fdls_disc.c:3477:17: sparse:    void
   drivers/scsi/fnic/fdls_disc.c:3477:17: sparse:    int
   drivers/scsi/fnic/fdls_disc.c:3483:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fdls_disc.c:3483:17: sparse:    void
   drivers/scsi/fnic/fdls_disc.c:3483:17: sparse:    int
   drivers/scsi/fnic/fdls_disc.c:3495:25: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fdls_disc.c:3495:25: sparse:    void
   drivers/scsi/fnic/fdls_disc.c:3495:25: sparse:    int
   drivers/scsi/fnic/fdls_disc.c:3505:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fdls_disc.c:3505:17: sparse:    void
   drivers/scsi/fnic/fdls_disc.c:3505:17: sparse:    int
   drivers/scsi/fnic/fdls_disc.c:3515:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fdls_disc.c:3515:17: sparse:    void
   drivers/scsi/fnic/fdls_disc.c:3515:17: sparse:    int
   drivers/scsi/fnic/fdls_disc.c:3525:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fdls_disc.c:3525:17: sparse:    void
   drivers/scsi/fnic/fdls_disc.c:3525:17: sparse:    int
   drivers/scsi/fnic/fdls_disc.c:3536:25: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fdls_disc.c:3536:25: sparse:    void
   drivers/scsi/fnic/fdls_disc.c:3536:25: sparse:    int
   drivers/scsi/fnic/fdls_disc.c:3542:17: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fdls_disc.c:3542:17: sparse:    void
   drivers/scsi/fnic/fdls_disc.c:3542:17: sparse:    int
   drivers/scsi/fnic/fdls_disc.c:3550:25: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fdls_disc.c:3550:25: sparse:    void
   drivers/scsi/fnic/fdls_disc.c:3550:25: sparse:    int
   drivers/scsi/fnic/fdls_disc.c:3558:25: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fdls_disc.c:3558:25: sparse:    void
   drivers/scsi/fnic/fdls_disc.c:3558:25: sparse:    int
   drivers/scsi/fnic/fdls_disc.c:3567:25: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fdls_disc.c:3567:25: sparse:    void
   drivers/scsi/fnic/fdls_disc.c:3567:25: sparse:    int
   drivers/scsi/fnic/fdls_disc.c:3575:25: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fdls_disc.c:3575:25: sparse:    void
   drivers/scsi/fnic/fdls_disc.c:3575:25: sparse:    int
   drivers/scsi/fnic/fdls_disc.c:3579:33: sparse: sparse: incompatible types in conditional expression (different base types):
   drivers/scsi/fnic/fdls_disc.c:3579:33: sparse:    void

vim +225 drivers/scsi/fnic/fnic_isr.c

   174	
   175	int fnic_request_intr(struct fnic *fnic)
   176	{
   177		int err = 0;
   178		int i;
   179	
   180		switch (vnic_dev_get_intr_mode(fnic->vdev)) {
   181	
   182		case VNIC_DEV_INTR_MODE_INTX:
   183			err = request_irq(pci_irq_vector(fnic->pdev, 0),
   184					&fnic_isr_legacy, IRQF_SHARED, DRV_NAME, fnic);
   185			break;
   186	
   187		case VNIC_DEV_INTR_MODE_MSI:
   188			err = request_irq(pci_irq_vector(fnic->pdev, 0), &fnic_isr_msi,
   189					  0, fnic->name, fnic);
   190			break;
   191	
   192		case VNIC_DEV_INTR_MODE_MSIX:
   193	
   194			sprintf(fnic->msix[FNIC_MSIX_RQ].devname,
   195				"%.11s-fcs-rq", fnic->name);
   196			fnic->msix[FNIC_MSIX_RQ].isr = fnic_isr_msix_rq;
   197			fnic->msix[FNIC_MSIX_RQ].devid = fnic;
   198	
   199			sprintf(fnic->msix[FNIC_MSIX_WQ].devname,
   200				"%.11s-fcs-wq", fnic->name);
   201			fnic->msix[FNIC_MSIX_WQ].isr = fnic_isr_msix_wq;
   202			fnic->msix[FNIC_MSIX_WQ].devid = fnic;
   203	
   204			for (i = fnic->copy_wq_base; i < fnic->wq_copy_count + fnic->copy_wq_base; i++) {
   205				sprintf(fnic->msix[i].devname,
   206					"%.11s-scsi-wq-%d", fnic->name, i-FNIC_MSIX_WQ_COPY);
   207				fnic->msix[i].isr = fnic_isr_msix_wq_copy;
   208				fnic->msix[i].devid = fnic;
   209			}
   210	
   211			sprintf(fnic->msix[fnic->err_intr_offset].devname,
   212				"%.11s-err-notify", fnic->name);
   213			fnic->msix[fnic->err_intr_offset].isr =
   214				fnic_isr_msix_err_notify;
   215			fnic->msix[fnic->err_intr_offset].devid = fnic;
   216	
   217			for (i = 0; i < fnic->intr_count; i++) {
   218				fnic->msix[i].irq_num = pci_irq_vector(fnic->pdev, i);
   219	
   220				err = request_irq(fnic->msix[i].irq_num,
   221								fnic->msix[i].isr, 0,
   222								fnic->msix[i].devname,
   223								fnic->msix[i].devid);
   224				if (err) {
 > 225					FNIC_ISR_DBG(KERN_ERR, fnic,
   226								"request_irq failed with error: %d\n",
   227								err);
   228					fnic_free_intr(fnic);
   229					break;
   230				}
   231				fnic->msix[i].requested = 1;
   232			}
   233			break;
   234	
   235		default:
   236			break;
   237		}
   238	
   239		return err;
   240	}
   241	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
