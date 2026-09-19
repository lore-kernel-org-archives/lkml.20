Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4776D34AB1D
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789852487; cv=none; b=hFwNKITHFcNPhX8yPRzIlkqYjeSqbO43IyShXtqbbNDq1prg3uCq5cxkiAwY2FmwdDrEeOmYFx24evcQm8+pECCB6bgvXSch6cquOghcLqHSs4EJBZ4SR0CYszZy2qn0tcagb9D5zIpRYvCubKX2Q+Lmbk6olXvEFZ0QrusQL7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789852487; c=relaxed/simple;
	bh=BugfzPWQEksi5N7qv6dtW/MfPONRAIDUp9+0wR8ULXc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eHiGhmTlzu0kbLXd3EbDhM5zETikM4sGdvT5mhVZ1/6mzb5UGL6PgDPHU/s6n+DPjLli/IIshZXTLvVyUFM1lnq9Y1HeDlW/WUuaZtKWoZSMrmZMEycOsWJ/z6ipbXeRLriD1c1OwJd1KdONgHgell5UrM4Cw+giQcLShqxmC4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TgHvVESh; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TgHvVESh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789852484; x=1821388484;
  h=date:from:to:cc:subject:message-id;
  bh=BugfzPWQEksi5N7qv6dtW/MfPONRAIDUp9+0wR8ULXc=;
  b=TgHvVEShbKxj7EFTOk8Z55NSEkMKTBy6qzo6nscQ0Gt/dqcjGGjqHswV
   Vzp+gAZ9dDGLtgbhC9zTGn0EB1w52EEfprVZXtbi6RgB8TE9QfhkIuoRx
   eNseoUdxV3rolWjCZo4QEprC4AccQkQgEC5cSlSHvlCVV2ccDxDpVFpHv
   FTgcYxFy/ZtWBuybNE5fKmz+wL49NHsXcgeZlZGH9lilY6yfrGx2p2+HC
   9Qhlw6ya8vj5NkLtR5Z/RgBN19+KsbYfYGGqAmDAkrnKSUWeFiel5L9QC
   FG6kk6IDSaOjnIgVXxMky8qaXZG+OJ16Q8Vlwh0CLCqLw/8br/iUtn/f0
   w==;
X-CSE-ConnectionGUID: y57orFzgTcWZgeDF6OIEOw==
X-CSE-MsgGUID: 96XFwFP8SGaDUoKqDkLhqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11910"; a="90386652"
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="90386652"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 14:14:44 -0700
X-CSE-ConnectionGUID: a4AY7yr8R+qgjKeOEaDsqQ==
X-CSE-MsgGUID: BmFzEaKaSOyj39wLDxbiEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="3105927"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 19 Sep 2026 14:14:42 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x82ON-00000000BNR-1xYV;
	Sat, 19 Sep 2026 21:14:39 +0000
Date: Sun, 20 Sep 2026 05:13:59 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Westphal <fw@strlen.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Pablo Neira Ayuso <pablo@netfilter.org>
Subject: net/netfilter/ipset/ip_set_hash_netiface.c:163:25: sparse:
 sparse: cast to non-scalar
Message-ID: <202609200503.KbHsIjIf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f259f446f5198d98e13756d2cd531812a0ad3064
commit: e80456d79ec83b00a6bd44c377684b1632ccc3c7 netfilter: ipset: remove need to allocate memory on delete operations
date:   5 weeks ago
config: alpha-randconfig-r1306-20260919 (https://download.01.org/0day-ci/archive/20260920/202609200503.KbHsIjIf-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260920/202609200503.KbHsIjIf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e80456d79ec8 ("netfilter: ipset: remove need to allocate memory on delete operations")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609200503.KbHsIjIf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/netfilter/ipset/ip_set_hash_netiface.c: note: in included file:
   net/netfilter/ipset/ip_set_hash_gen.h:368:22: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:368:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:440:22: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:440:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:460:22: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:460:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:1333:40: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:1333:40: sparse: sparse: cast from non-scalar
>> net/netfilter/ipset/ip_set_hash_netiface.c:163:25: sparse: sparse: cast to non-scalar
>> net/netfilter/ipset/ip_set_hash_netiface.c:163:25: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_netiface.c: note: in included file:
   net/netfilter/ipset/ip_set_hash_gen.h:368:22: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:368:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:440:22: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:440:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:460:22: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:460:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:1333:40: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:1333:40: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_netiface.c:384:25: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_netiface.c:384:25: sparse: sparse: cast from non-scalar
--
   net/netfilter/ipset/ip_set_hash_netnet.c: note: in included file:
   net/netfilter/ipset/ip_set_hash_gen.h:368:22: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:368:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:440:22: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:440:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:460:22: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:460:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:1333:40: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:1333:40: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:1341:48: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:1341:48: sparse: sparse: cast from non-scalar
>> net/netfilter/ipset/ip_set_hash_netnet.c:153:21: sparse: sparse: cast to non-scalar
>> net/netfilter/ipset/ip_set_hash_netnet.c:153:21: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_netnet.c:154:21: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_netnet.c:154:21: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_netnet.c: note: in included file:
   net/netfilter/ipset/ip_set_hash_gen.h:368:22: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:368:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:440:22: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:440:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:460:22: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:460:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:1333:40: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:1333:40: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:1341:48: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:1341:48: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_netnet.c:394:21: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_netnet.c:394:21: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_netnet.c:395:21: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_netnet.c:395:21: sparse: sparse: cast from non-scalar
--
   net/netfilter/ipset/ip_set_hash_netportnet.c: note: in included file:
   net/netfilter/ipset/ip_set_hash_gen.h:368:22: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:368:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:440:22: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:440:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:460:22: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:460:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:1333:40: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:1333:40: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:1341:48: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:1341:48: sparse: sparse: cast from non-scalar
>> net/netfilter/ipset/ip_set_hash_netportnet.c:160:21: sparse: sparse: cast to non-scalar
>> net/netfilter/ipset/ip_set_hash_netportnet.c:160:21: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_netportnet.c:161:21: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_netportnet.c:161:21: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_netportnet.c: note: in included file:
   net/netfilter/ipset/ip_set_hash_gen.h:368:22: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:368:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:440:22: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:440:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:460:22: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:460:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:1333:40: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:1333:40: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:1341:48: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:1341:48: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_netportnet.c:457:21: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_netportnet.c:457:21: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_netportnet.c:458:21: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_netportnet.c:458:21: sparse: sparse: cast from non-scalar

vim +163 net/netfilter/ipset/ip_set_hash_netiface.c

c737b7c4510026 Florian Westphal 2015-04-02  154  
e385357a2f214e Jozsef Kadlecsik 2011-06-16  155  static int
e385357a2f214e Jozsef Kadlecsik 2011-06-16  156  hash_netiface4_kadt(struct ip_set *set, const struct sk_buff *skb,
e385357a2f214e Jozsef Kadlecsik 2011-06-16  157  		    const struct xt_action_param *par,
5d50e1d88336a9 Jozsef Kadlecsik 2013-04-08  158  		    enum ipset_adt adt, struct ip_set_adt_opt *opt)
e385357a2f214e Jozsef Kadlecsik 2011-06-16  159  {
21956ab290f7f3 Jozsef Kadlecsik 2015-06-26  160  	struct hash_netiface4 *h = set->data;
e385357a2f214e Jozsef Kadlecsik 2011-06-16  161  	ipset_adtfn adtfn = set->variant->adt[adt];
5d50e1d88336a9 Jozsef Kadlecsik 2013-04-08  162  	struct hash_netiface4_elem e = {
8e5fd2a55e2468 Jozsef Kadlecsik 2026-07-30 @163  		.cidr = INIT_CIDR(h->rnets[0], HOST_MASK),
bd9087e0407bfb Jozsef Kadlecsik 2012-09-10  164  		.elem = 1,
e385357a2f214e Jozsef Kadlecsik 2011-06-16  165  	};
ca134ce86451f3 Jozsef Kadlecsik 2013-09-07  166  	struct ip_set_ext ext = IP_SET_INIT_KEXT(skb, opt, set);
e385357a2f214e Jozsef Kadlecsik 2011-06-16  167  
e385357a2f214e Jozsef Kadlecsik 2011-06-16  168  	if (adt == IPSET_TEST)
5d50e1d88336a9 Jozsef Kadlecsik 2013-04-08  169  		e.cidr = HOST_MASK;
e385357a2f214e Jozsef Kadlecsik 2011-06-16  170  
5d50e1d88336a9 Jozsef Kadlecsik 2013-04-08  171  	ip4addrptr(skb, opt->flags & IPSET_DIM_ONE_SRC, &e.ip);
5d50e1d88336a9 Jozsef Kadlecsik 2013-04-08  172  	e.ip &= ip_set_netmask(e.cidr);
e385357a2f214e Jozsef Kadlecsik 2011-06-16  173  

:::::: The code at line 163 was first introduced by commit
:::::: 8e5fd2a55e2468f6225ef5af01ae58cdbcbae8cf netfilter: ipset: rework cidr bookkeeping

:::::: TO: Jozsef Kadlecsik <kadlec@netfilter.org>
:::::: CC: Pablo Neira Ayuso <pablo@netfilter.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
