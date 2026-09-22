Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07878443ABC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790067247; cv=none; b=gT1wH+iDbKciS+tz+Da8GVuETfeHSs9S2x7eSua13eS5vmYp8z2mxbDxPS+Erip37BlsO9pAoD5Z27mNtlyY/oN32weT/ALghbgQn42oeTohZsFIn7FFmI9Zuxkx2l/zC7ui8yIFJN1hbSLr8VsI3jqvTFN/xlWokBVpvciHq40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790067247; c=relaxed/simple;
	bh=uHsNq0tHql05paguIrjv0Kj3VWRU7+vCkDwp17faAck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TID3Bxdm9Padyc9NTf2EQj4p86qmQ0I40GB2GP8SZGs/xoA0dReVVxTDo4OFg01IspgCeTeScMvZREpLasB/sEtG/u60tBUXwrpXqalrz5UagHYDyqmYBlxS4M5CRIre/RAOvFc8Sx4/aX3lFfKKkuH6XDmj4NlT1HuWlTBoU2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RdVyy0TR; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RdVyy0TR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790067244; x=1821603244;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uHsNq0tHql05paguIrjv0Kj3VWRU7+vCkDwp17faAck=;
  b=RdVyy0TRqBIhUNNsKQCey5qylZMmu/Tey7u+kWSHwk27BjZR7b+w8LsL
   CSepXePU5WwQPvvn58I1rw6aw/3I6IxbMWwMHEtmD8v6tSvK35kmHGXcf
   2J7+N5ITi3+XLq/esf624ySsf/yJG4j6hwE+da1wZZKnJ+fBQSlu4AauH
   0es/NHw+cGHmtb0BpGxi8sAGUgnMg+nPpW1cdj1KmBEfrVzITVwX32ONh
   mjwF7lV7ed+3i/oZzz/eusvOtBZq59BCEYSMJiOywkJKqN00tlkQnoQQ3
   HipHptYy0I5pH0k9LuVl4IPi6AK0Ivi0aNZqsttxkpfaYai8d2zwfWy8W
   g==;
X-CSE-ConnectionGUID: 11n85vd0RJy+gd7D5x5z8g==
X-CSE-MsgGUID: PoLaEM3JQCmcOXmrHoqayA==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="90519390"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="90519390"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 01:54:02 -0700
X-CSE-ConnectionGUID: 3ibhvx7vSky7KzBLEVmQOQ==
X-CSE-MsgGUID: 5jIu/YYvR2iUJraZlM2+9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="300979141"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Sep 2026 01:54:00 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8wG8-00000000FFE-3spO;
	Tue, 22 Sep 2026 08:53:52 +0000
Date: Tue, 22 Sep 2026 16:53:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 David Gow <davidgow@google.com>
Subject: drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:2325:25: sparse: sparse:
 cast to restricted __be64
Message-ID: <202609221636.xKdion6f-lkp@intel.com>
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
config: um-randconfig-r1306-20260922 (https://download.01.org/0day-ci/archive/20260922/202609221636.xKdion6f-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260922/202609221636.xKdion6f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 031cdd3bc3f3 ("kunit: Enable PCI on UML without triggering WARN()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609221636.xKdion6f-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:2325:25: sparse: sparse: cast to restricted __be64
>> drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:2325:25: sparse: sparse: cast to restricted __be64
>> drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:2325:25: sparse: sparse: cast to restricted __be64
>> drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:2325:25: sparse: sparse: cast to restricted __be64
>> drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:2325:25: sparse: sparse: cast to restricted __be64
>> drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:2325:25: sparse: sparse: cast to restricted __be64
>> drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:2325:25: sparse: sparse: cast to restricted __be64
>> drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:2325:25: sparse: sparse: cast to restricted __be64
>> drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:2325:25: sparse: sparse: cast to restricted __be64
>> drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:2325:25: sparse: sparse: cast to restricted __be64
>> drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:1304:24: sparse: sparse: cast to restricted __be32
>> drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:1304:24: sparse: sparse: cast to restricted __be32
>> drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:1304:24: sparse: sparse: cast to restricted __be32
>> drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:1304:24: sparse: sparse: cast to restricted __be32
>> drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:1304:24: sparse: sparse: cast to restricted __be32
>> drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:1304:24: sparse: sparse: cast to restricted __be32
   drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:1323:17: sparse: sparse: cast to restricted __be32
   drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:1323:17: sparse: sparse: cast to restricted __be32
   drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:1323:17: sparse: sparse: cast to restricted __be32
   drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:1323:17: sparse: sparse: cast to restricted __be32
   drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:1323:17: sparse: sparse: cast to restricted __be32
   drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:1323:17: sparse: sparse: cast to restricted __be32
   drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:1323:17: sparse: sparse: cast to restricted __be32
   drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:1323:17: sparse: sparse: cast to restricted __be32
   drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:1323:17: sparse: sparse: cast to restricted __be32
   drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:1323:17: sparse: sparse: cast to restricted __be32
   drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:1323:17: sparse: sparse: cast to restricted __be32
   drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:1323:17: sparse: sparse: cast to restricted __be32

vim +2325 drivers/scsi/cxgbi/cxgb4i/cxgb4i.c

7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2306  
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2307  #define RX_PULL_LEN	128
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2308  static int t4_uld_rx_handler(void *handle, const __be64 *rsp,
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2309  				const struct pkt_gl *pgl)
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2310  {
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2311  	const struct cpl_act_establish *rpl;
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2312  	struct sk_buff *skb;
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2313  	unsigned int opc;
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2314  	struct cxgbi_device *cdev = handle;
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2315  
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2316  	if (pgl == NULL) {
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2317  		unsigned int len = 64 - sizeof(struct rsp_ctrl) - 8;
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2318  
24d3f95a5b6082 kxie@chelsio.com 2010-09-23  2319  		skb = alloc_wr(len, 0, GFP_ATOMIC);
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2320  		if (!skb)
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2321  			goto nomem;
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2322  		skb_copy_to_linear_data(skb, &rsp[1], len);
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2323  	} else {
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2324  		if (unlikely(*(u8 *)rsp != *(u8 *)pgl->va)) {
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16 @2325  			pr_info("? FL 0x%p,RSS%#llx,FL %#llx,len %u.\n",
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2326  				pgl->va, be64_to_cpu(*rsp),
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2327  				be64_to_cpu(*(u64 *)pgl->va),
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2328  				pgl->tot_len);
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2329  			return 0;
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2330  		}
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2331  		skb = cxgb4_pktgl_to_skb(pgl, RX_PULL_LEN, RX_PULL_LEN);
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2332  		if (unlikely(!skb))
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2333  			goto nomem;
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2334  	}
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2335  
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2336  	rpl = (struct cpl_act_establish *)skb->data;
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2337  	opc = rpl->ot.opcode;
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2338  	log_debug(1 << CXGBI_DBG_TOE,
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2339  		"cdev %p, opcode 0x%x(0x%x,0x%x), skb %p.\n",
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2340  		 cdev, opc, rpl->ot.opcode_tid, ntohl(rpl->ot.opcode_tid), skb);
ccc495efb326d1 Dan Carpenter    2018-04-03  2341  	if (opc >= ARRAY_SIZE(cxgb4i_cplhandlers) || !cxgb4i_cplhandlers[opc]) {
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2342  		pr_err("No handler for opcode 0x%x.\n", opc);
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2343  		__kfree_skb(skb);
ccc495efb326d1 Dan Carpenter    2018-04-03  2344  	} else
ccc495efb326d1 Dan Carpenter    2018-04-03  2345  		cxgb4i_cplhandlers[opc](cdev, skb);
ccc495efb326d1 Dan Carpenter    2018-04-03  2346  
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2347  	return 0;
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2348  nomem:
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2349  	log_debug(1 << CXGBI_DBG_TOE, "OOM bailing out.\n");
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2350  	return 1;
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2351  }
7b36b6e03b0d6c kxie@chelsio.com 2010-08-16  2352  

:::::: The code at line 2325 was first introduced by commit
:::::: 7b36b6e03b0d6cee0948593a6a11841a457695b9 [SCSI] cxgb4i v5: iscsi driver

:::::: TO: kxie@chelsio.com <kxie@chelsio.com>
:::::: CC: James Bottomley <James.Bottomley@suse.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
