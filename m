Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A39522697
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790067782; cv=none; b=cXYnkblAalsFhjS3O1tAq+P4Ij/s/gb6isF2bngA5haFGkm2howNzmgelw1gJkKlXP3dnJRSTwp+BVzcI66RGyCYDkZ2qp9EBwdY+sLCOc98eYCcLzFXF+vB7Tr2EdNvpH+6NQWXyUden/+a+NgmK1cHraA/X5aOKBdreitvw4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790067782; c=relaxed/simple;
	bh=vq63zvam2YrxozKBF5uw/I3puYVixinvPtyiu4EorpU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JmA53WlA6LtrQdPS6RBRHWWbr+8JlXMbH3Ji+/3JBcZ3+wAQDbJtzTgNIR4Irkqg1JVYkkjLPbfdBmSFGXfbX8z4YUNcdT7NuB3U5PS9Bv8LLCBLBSJvL7jvY22lmtyY2yCRdFSyUURiAvVYziGe66pWSIILaDY6vA6kl7OzQNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RR1SwzqG; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RR1SwzqG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790067781; x=1821603781;
  h=date:from:to:cc:subject:message-id;
  bh=vq63zvam2YrxozKBF5uw/I3puYVixinvPtyiu4EorpU=;
  b=RR1SwzqGDFCXq1iukitLFDf5z62YwicPb9WwEjp81yFIpCA5v6fpOP7t
   rq7aSyIw/yxJY+c7WRKNbSt3j4XRWgDsQRHbZ9qlCrEWsjHFkxOOwmdvH
   D4affNoJI0WCPnQGVjGlhFBeZgjcZ/Bku5nLdUPuD0iaABJ5Fu8ZWjTZ0
   J8pLoB/7pnCLzC0ZzjSC3j58cQkc4ZTUzFp+AuVP7K7xC/Ttl/76UYs93
   X+z8EpUGB+BnLhJttZTeFALdXg77hTgNHuNQY2SQ+r3R+yZcg6s7Qhl8h
   0yG+a0mqfvUU9m7lZJocMEY4Dq5bpc8r52myFR2d8kkXdHCQSXIFfZWwz
   w==;
X-CSE-ConnectionGUID: afIEMzTHQlmvt9Njec8/Mw==
X-CSE-MsgGUID: FFLDH/lNTY6aR3iq9TVhug==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="1156307"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="1156307"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 02:02:59 -0700
X-CSE-ConnectionGUID: cpR9iv3gR1iQDBTEQf1WIQ==
X-CSE-MsgGUID: TNuktza+QWS0I8IKXC44+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="281108564"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Sep 2026 02:02:56 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8wOr-00000000FFm-45u2;
	Tue, 22 Sep 2026 09:02:53 +0000
Date: Tue, 22 Sep 2026 17:02:50 +0800
From: kernel test robot <lkp@intel.com>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>
Subject: net/ipv6/ip6mr.c:295:24: sparse: sparse: incompatible types
 in comparison expression (different address spaces):
Message-ID: <202609221639.e2GA34hZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
commit: 2c309a863dd6e609b10caa55a362dc48d2e04564 ip6mr: Free mr_table after RCU grace period.
date:   4 months ago
config: powerpc64-randconfig-r1309-20260922 (https://download.01.org/0day-ci/archive/20260922/202609221639.e2GA34hZ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260922/202609221639.e2GA34hZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 2c309a863dd6 ("ip6mr: Free mr_table after RCU grace period.")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609221639.e2GA34hZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/ipv6/ip6mr.c:295:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/ipv6/ip6mr.c:295:24: sparse:    struct mr_table [noderef] __rcu *
   net/ipv6/ip6mr.c:295:24: sparse:    struct mr_table *
   net/ipv6/ip6mr.c:301:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/ipv6/ip6mr.c:301:16: sparse:    struct mr_table [noderef] __rcu *
   net/ipv6/ip6mr.c:301:16: sparse:    struct mr_table *
   net/ipv6/ip6mr.c:301:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/ipv6/ip6mr.c:301:16: sparse:    struct mr_table [noderef] __rcu *
   net/ipv6/ip6mr.c:301:16: sparse:    struct mr_table *
   net/ipv6/ip6mr.c:312:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/ipv6/ip6mr.c:312:16: sparse:    struct mr_table [noderef] __rcu *
   net/ipv6/ip6mr.c:312:16: sparse:    struct mr_table *
   net/ipv6/ip6mr.c:326:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/ipv6/ip6mr.c:326:9: sparse:    struct mr_table [noderef] __rcu *
   net/ipv6/ip6mr.c:326:9: sparse:    struct mr_table *
   net/ipv6/ip6mr.c:332:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/ipv6/ip6mr.c:332:32: sparse:    struct mr_table [noderef] __rcu *
   net/ipv6/ip6mr.c:332:32: sparse:    struct mr_table *
   net/ipv6/ip6mr.c:336:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/ipv6/ip6mr.c:336:9: sparse:    struct mr_table [noderef] __rcu *
   net/ipv6/ip6mr.c:336:9: sparse:    struct mr_table *

vim +295 net/ipv6/ip6mr.c

   283	
   284	bool ip6mr_rule_default(const struct fib_rule *rule)
   285	{
   286		return fib_rule_matchall(rule) && rule->action == FR_ACT_TO_TBL &&
   287		       rule->table == RT6_TABLE_DFLT && !rule->l3mdev;
   288	}
   289	EXPORT_SYMBOL(ip6mr_rule_default);
   290	#else
   291	static struct mr_table *ip6mr_mr_table_iter(struct net *net,
   292						    struct mr_table *mrt)
   293	{
   294		if (!mrt)
 > 295			return rcu_dereference(net->ipv6.mrt6);
   296		return NULL;
   297	}
   298	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
