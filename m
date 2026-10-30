Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793374673;
	b=evX+ZZBP1fIQIgwnzDjyWVOyAAc9n1j3lwmyJ5UIQFGvpuoQoXcoW+ksLFkcGYOljNRv
	 PO9M+tlUarQl7/QVqZMzs6OOk6TcZZFXSswEAXIL4b40jnn3om+cwga9//aKi/TqIiV8s
	 pGlsDMd0AwIr6yKgGa0k6BuPHtEZP4A8UF/jIx0aMN0fdTGL3HuvDyR4q7BlPF3tliVV4
	 s8lbGONwgT0olwx0oYmQNg8lFqFHS/1Lr1hAIrmbuTu9B3IhpikOnaE2cx59uquIJftUt
	 MNq8pIznlxJiOG9SGsNxhmSUK3663h4aMzdNasIIYWXhLJ+DWEF0b57hrvytn2KrgCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793374673;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ZVIlfayF5vUxT7epbX9dc09pgWCaEWLWPRoQ2PnaHw8=;
	b=d8nmwQ3too91mbuD5/xxMnyzZ8Xf+5Qxbkf0oMR4xzdgmNwV6Gaz/zI5/VM9Duv06fXI
	 w/zTfkXei+NCPn3SJhwSqyTdlD4NPszcATOxD2AldcQ6RmD8559Q3NiAwkEu9YVUZXStw
	 NRMdE6Ph9slSPLqLiIM7ALXRxy3leHlMzQJvAvOaIcj/xyTEAQC6Qy8EyrcabZSGpJ/86
	 c3DFslclf9plR+g9ymo/O0nZH44gK9Tf7tQaq62krI3Vag0gul+Q+NliPFqd4wSXsrKUQ
	 ELFjSmQtD8QQJ7gWP+vgphmSh+NNps5PIBXM+b5D9bH1U9Yn/PCrm0NRwCt04+AEORQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fFYhMSiv;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8873C606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:37:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8873C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fFYhMSiv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793374671; x=1824910671;
  h=date:from:to:cc:subject:message-id;
  bh=8nADVrkXlSf8Rzfp23Bj0glyjKPxgJMbJBa8KcK4Zbc=;
  b=fFYhMSiveL5lovFd+X3e9JCd/nmLtyuIxUFQZvk0ckc60oUkxRn/gF2c
   EaIjC2ULDVtgoYnV9i+eD6q15dQE1aD2mQkWpqYGztdfm1VuN8ajhyQw1
   18Yxj6J/0F0pl34dHS+euZV9KtK9oEGU5yUh0f+wOJYXk8D6ROB0rsfIx
   TAf5QPOXfGzhv0/77H2F7ph05oy5StL6If8oqyezf9ogT7QdPNmLu6Xxy
   I2gWRvjqSuIxhJmvrKYBR/4XDfNucRzdYGigdNNptENxXDTLIUsLCDThx
   sKTUNGTqrVjRrAn8PrAk2JQKWTQ8pkRnsd/EmvWFzKI/lwwW/Ct0g6M6S
   A==;
X-CSE-ConnectionGUID: Eu9XeK/IT0ybhihqjkPImg==
X-CSE-MsgGUID: RDZZ+JgrS5yJQcbX/BjK4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2018538"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2018538"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 08:37:51 -0700
X-CSE-ConnectionGUID: vu+uvwjuRMq7oHTmZNpcXw==
X-CSE-MsgGUID: 5JmSM+7VQ8uyWLI9H50nJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5789039"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 30 Oct 2026 08:37:49 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMofq-000000005cP-2dy4;
	Fri, 30 Oct 2026 15:37:46 +0000
Date: Fri, 30 Oct 2026 16:36:57 +0100
From: kernel test robot <lkp@intel.com>
To: Florian Westphal <fw@strlen.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Pablo Neira Ayuso <pablo@netfilter.org>
Subject: net/netfilter/ipset/ip_set_hash_ipportnet.c:141:25: sparse:
 sparse: cast to non-scalar
Message-ID: <202610301616.CMLXGsZd-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d89e1d186ec9271bf78e62771779e9fc03bf0fc3
commit: e80456d79ec83b00a6bd44c377684b1632ccc3c7 netfilter: ipset: remove need to allocate memory on delete operations
date:   2 months ago
config: alpha-randconfig-r2311-20261030 (https://download.01.org/0day-ci/archive/20261030/202610301616.CMLXGsZd-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261030/202610301616.CMLXGsZd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e80456d79ec8 ("netfilter: ipset: remove need to allocate memory on delete operations")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610301616.CMLXGsZd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/netfilter/ipset/ip_set_hash_ipportnet.c: note: in included file:
   net/netfilter/ipset/ip_set_hash_gen.h:368:22: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:368:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:440:22: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:440:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:460:22: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:460:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:1333:40: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:1333:40: sparse: sparse: cast from non-scalar
>> net/netfilter/ipset/ip_set_hash_ipportnet.c:141:25: sparse: sparse: cast to non-scalar
>> net/netfilter/ipset/ip_set_hash_ipportnet.c:141:25: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_ipportnet.c: note: in included file:
   net/netfilter/ipset/ip_set_hash_gen.h:368:22: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:368:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:440:22: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:440:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:460:22: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:460:22: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:1333:40: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_gen.h:1333:40: sparse: sparse: cast from non-scalar
   net/netfilter/ipset/ip_set_hash_ipportnet.c:401:25: sparse: sparse: cast to non-scalar
   net/netfilter/ipset/ip_set_hash_ipportnet.c:401:25: sparse: sparse: cast from non-scalar
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

vim +141 net/netfilter/ipset/ip_set_hash_ipportnet.c

3d14b171f004f75 Jozsef Kadlecsik 2011-06-16  132  
41d22f7b2e48c77 Jozsef Kadlecsik 2011-02-01  133  static int
41d22f7b2e48c77 Jozsef Kadlecsik 2011-02-01  134  hash_ipportnet4_kadt(struct ip_set *set, const struct sk_buff *skb,
b66554cf03fe866 Jozsef Kadlecsik 2011-06-16  135  		     const struct xt_action_param *par,
5d50e1d88336a93 Jozsef Kadlecsik 2013-04-08  136  		     enum ipset_adt adt, struct ip_set_adt_opt *opt)
41d22f7b2e48c77 Jozsef Kadlecsik 2011-02-01  137  {
21956ab290f7f3f Jozsef Kadlecsik 2015-06-26  138  	const struct hash_ipportnet4 *h = set->data;
41d22f7b2e48c77 Jozsef Kadlecsik 2011-02-01  139  	ipset_adtfn adtfn = set->variant->adt[adt];
5d50e1d88336a93 Jozsef Kadlecsik 2013-04-08  140  	struct hash_ipportnet4_elem e = {
8e5fd2a55e2468f Jozsef Kadlecsik 2026-07-30 @141  		.cidr = INIT_CIDR(h->rnets[0], HOST_MASK),
9b03a5ef49c0151 Jozsef Kadlecsik 2011-06-16  142  	};
ca134ce86451f3f Jozsef Kadlecsik 2013-09-07  143  	struct ip_set_ext ext = IP_SET_INIT_KEXT(skb, opt, set);
41d22f7b2e48c77 Jozsef Kadlecsik 2011-02-01  144  
41d22f7b2e48c77 Jozsef Kadlecsik 2011-02-01  145  	if (adt == IPSET_TEST)
5d50e1d88336a93 Jozsef Kadlecsik 2013-04-08  146  		e.cidr = HOST_MASK - 1;
41d22f7b2e48c77 Jozsef Kadlecsik 2011-02-01  147  
ac8cc925d35fc5a Jozsef Kadlecsik 2011-06-16  148  	if (!ip_set_get_ip4_port(skb, opt->flags & IPSET_DIM_TWO_SRC,
5d50e1d88336a93 Jozsef Kadlecsik 2013-04-08  149  				 &e.port, &e.proto))
41d22f7b2e48c77 Jozsef Kadlecsik 2011-02-01  150  		return -EINVAL;
41d22f7b2e48c77 Jozsef Kadlecsik 2011-02-01  151  
5d50e1d88336a93 Jozsef Kadlecsik 2013-04-08  152  	ip4addrptr(skb, opt->flags & IPSET_DIM_ONE_SRC, &e.ip);
5d50e1d88336a93 Jozsef Kadlecsik 2013-04-08  153  	ip4addrptr(skb, opt->flags & IPSET_DIM_THREE_SRC, &e.ip2);
5d50e1d88336a93 Jozsef Kadlecsik 2013-04-08  154  	e.ip2 &= ip_set_netmask(e.cidr + 1);
41d22f7b2e48c77 Jozsef Kadlecsik 2011-02-01  155  
5d50e1d88336a93 Jozsef Kadlecsik 2013-04-08  156  	return adtfn(set, &e, &ext, &opt->ext, opt->cmdflags);
41d22f7b2e48c77 Jozsef Kadlecsik 2011-02-01  157  }
41d22f7b2e48c77 Jozsef Kadlecsik 2011-02-01  158  

:::::: The code at line 141 was first introduced by commit
:::::: 8e5fd2a55e2468f6225ef5af01ae58cdbcbae8cf netfilter: ipset: rework cidr bookkeeping

:::::: TO: Jozsef Kadlecsik <kadlec@netfilter.org>
:::::: CC: Pablo Neira Ayuso <pablo@netfilter.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
