Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377023AB287
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789084805; cv=none; b=qW5kjntjWE72EdVRMw/JqzillOYboovXjWZUhSLSU29YoVl6RKUnFR3Rp/v6eLcITjrEn4W1//dPmCWj10K+kBYf4sr1hIibi25tbVYFUrPu/AC7bilrTazovA+NcXPXYpVCVPubEgirG2s2AqRnywIK+B0kzCp+NuSogF6TzPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789084805; c=relaxed/simple;
	bh=vvfi7Fw71BJkDCCaLEZSIdhw9TgspSc3U+p2jdVAHGw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sM4qU7lkU0uS1U8CgRWrHcRi7E7ze3Zy69M8f1XtyPonPGNzmcoycc0P53eYuagYyWOIQS2mtSdxB4qSMrLLkOFxTk54p+CIuDN0QByarQOAMOEZa2ha5DvuYaH3p0XTLpK/82jkfjwb1M77l0mRskTv3JKueBQfQGqfNPjsbig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=meVoAKw4; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="meVoAKw4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789084801; x=1820620801;
  h=date:from:to:cc:subject:message-id;
  bh=vvfi7Fw71BJkDCCaLEZSIdhw9TgspSc3U+p2jdVAHGw=;
  b=meVoAKw4RLstAQ7YpPeSWndRxfYOtL/NjW7ZDoe24R3mocu98nVhyege
   ViUBd9wprvv9ehujrwyS83kTwCb0qeulncUf49h6kQmtbG9b3KIw6J/RW
   ZwyLybfneNKAwWtYjeLQV+VgBAVHe7hG2AEzpA6aLTrz7gYi9j3RXhIEN
   AFxv8Z97YNsT0aSK0b1a0NFN9TF1PU5ONiUJifwLGo5+nteGTpjpMWU3O
   rLQ6DmC/uKmo3Oifnf+xWef10zQ7BNghOCb8ni+XmHqsFajPO/mjxfK4X
   yw77+ASHSZI0Pw/pW5G6swh3Uiiq86cvDSPks8NI3fBwUpav1FxbZkWW+
   w==;
X-CSE-ConnectionGUID: kNgqr9N1Q56obnQGJrP0WA==
X-CSE-MsgGUID: rRipEbMOQ06RDyaa3x0H0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="115089436"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="115089436"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 17:00:00 -0700
X-CSE-ConnectionGUID: 86WGAsaaQR6LDnNmEwYocA==
X-CSE-MsgGUID: RZue8XpqSUq5qRvnRMgLSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="268486967"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 10 Sep 2026 16:59:55 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4ogB-000000000fP-37ex;
	Thu, 10 Sep 2026 23:59:46 +0000
Date: Fri, 11 Sep 2026 07:59:39 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Hwang <leon.hwang@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>
Subject: kernel/trace/ftrace.c:6651:40: sparse: sparse: incorrect
 type in assignment (different address spaces)
Message-ID: <202609110704.Q3M5vCDV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   50d05c7c76c96b90462f24debacca971d2e86713
commit: 092f8ec7dbdc71f5bde9bb0f8dead384d2115a44 ftrace: Protect direct_functions in update_ftrace_direct_mod
date:   5 weeks ago
config: x86_64-randconfig-122-20260911 (https://download.01.org/0day-ci/archive/20260911/202609110704.Q3M5vCDV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609110704.Q3M5vCDV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 092f8ec7dbdc ("ftrace: Protect direct_functions in update_ftrace_direct_mod")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609110704.Q3M5vCDV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/trace/ftrace.c:1093:43: sparse:     expected struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:1093:43: sparse:     got struct ftrace_hash *
   kernel/trace/ftrace.c:1094:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:1094:43: sparse:     expected struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:1094:43: sparse:     got struct ftrace_hash *
   kernel/trace/ftrace.c:1350:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:1350:40: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:1350:40: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:1351:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:1351:40: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:1351:40: sparse:     got struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:1352:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:1352:37: sparse:     expected struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:1352:37: sparse:     got struct ftrace_hash *
   kernel/trace/ftrace.c:1353:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:1353:38: sparse:     expected struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:1353:38: sparse:     got struct ftrace_hash *
   kernel/trace/ftrace.c:2165:54: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash *old_hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:2165:54: sparse:     expected struct ftrace_hash *old_hash
   kernel/trace/ftrace.c:2165:54: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:1557:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/ftrace.c:1557:9: sparse:    struct ftrace_hash [noderef] __rcu *
   kernel/trace/ftrace.c:1557:9: sparse:    struct ftrace_hash *
   kernel/trace/ftrace.c:1573:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:1574:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:1575:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:1576:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:1747:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops *ops @@     got struct ftrace_ops [noderef] __rcu *[addressable] [toplevel] ftrace_ops_list @@
   kernel/trace/ftrace.c:1748:43: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops *ops @@     got struct ftrace_ops [noderef] __rcu *next @@
   kernel/trace/ftrace.c:1809:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:1810:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *notrace_hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:2143:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:2154:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:2637:53: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3450:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *B @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3451:66: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:3457:52: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *B @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3458:66: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:3471:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3472:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *src @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3475:52: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *notrace_hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3479:52: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *src @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3494:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3495:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3503:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3509:81: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3513:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *notrace_hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3515:56: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *new_hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3545:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *new_hash1 @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3546:49: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct ftrace_hash *new_hash2 @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3585:45: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3587:46: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3589:48: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3591:49: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3597:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3598:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3604:34: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *save_filter_hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3605:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *save_notrace_hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3607:45: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash *[addressable] filter_hash @@
   kernel/trace/ftrace.c:3608:46: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash *[addressable] notrace_hash @@
   kernel/trace/ftrace.c:3613:53: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash *save_filter_hash @@
   kernel/trace/ftrace.c:3614:54: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash *save_notrace_hash @@
   kernel/trace/ftrace.c:3661:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3662:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3677:59: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *[addressable] filter_hash @@
   kernel/trace/ftrace.c:3678:59: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *[addressable] notrace_hash @@
   kernel/trace/ftrace.c:3683:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *[addressable] filter_hash @@
   kernel/trace/ftrace.c:3684:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *[addressable] notrace_hash @@
   kernel/trace/ftrace.c:3686:39: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *[addressable] filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3687:40: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *[addressable] notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3729:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3730:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3731:45: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3732:46: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:4022:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:4039:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:4728:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:4731:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:5142:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5144:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5524:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5668:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5674:34: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash *[assigned] old_hash @@
   kernel/trace/ftrace.c:5941:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5943:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:6024:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *static [addressable] [toplevel] direct_functions @@
   kernel/trace/ftrace.c:6027:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *static [addressable] [toplevel] direct_functions @@
   kernel/trace/ftrace.c:6043:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:6087:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:6137:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *free_hash @@     got struct ftrace_hash [noderef] __rcu *static [addressable] [toplevel] direct_functions @@
   kernel/trace/ftrace.c:6202:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:6240:52: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *static [addressable] [assigned] [toplevel] direct_functions @@
   kernel/trace/ftrace.c:6393:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *static [addressable] [assigned] [toplevel] direct_functions @@
   kernel/trace/ftrace.c:6398:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *old_filter_hash @@     got struct ftrace_hash [noderef] __rcu * @@
   kernel/trace/ftrace.c:6414:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *a @@     got struct ftrace_hash [noderef] __rcu *static [addressable] [assigned] [toplevel] direct_functions @@
   kernel/trace/ftrace.c:6418:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *old_direct_functions @@     got struct ftrace_hash [noderef] __rcu *static [addressable] [assigned] [toplevel] direct_functions @@
   kernel/trace/ftrace.c:6425:45: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash *[assigned] new_filter_hash @@
   kernel/trace/ftrace.c:6430:53: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash *old_filter_hash @@
   kernel/trace/ftrace.c:6534:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *old_filter_hash @@     got struct ftrace_hash [noderef] __rcu * @@
   kernel/trace/ftrace.c:6645:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *orig_hash @@     got struct ftrace_hash [noderef] __rcu * @@
>> kernel/trace/ftrace.c:6651:40: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash *hash @@
   kernel/trace/ftrace.c:6948:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *extern [addressable] [toplevel] ftrace_graph_hash @@     got struct ftrace_hash *[assigned] hash @@
   kernel/trace/ftrace.c:6950:43: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *extern [addressable] [toplevel] ftrace_graph_notrace_hash @@     got struct ftrace_hash *[assigned] hash @@
   kernel/trace/ftrace.c:7021:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:7029:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:7094:47: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *[addressable] [toplevel] ftrace_graph_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:7095:55: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *[addressable] [toplevel] ftrace_graph_notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:7815:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:7816:47: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:7820:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:7838:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops *ops @@     got struct ftrace_ops [noderef] __rcu *[addressable] [toplevel] ftrace_ops_list @@
   kernel/trace/ftrace.c:7838:66: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops *ops @@     got struct ftrace_ops [noderef] __rcu *next @@
   kernel/trace/ftrace.c:7890:59: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:7891:59: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:8283:62: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:8284:62: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:8328:36: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/ftrace.c:8328:36: sparse:    struct ftrace_ops [noderef] __rcu *
   kernel/trace/ftrace.c:8328:36: sparse:    struct ftrace_ops *
   kernel/trace/ftrace.c:9106:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:9106:14: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:9106:14: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:9155:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:9155:14: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:9155:14: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:230:20: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:230:20: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:230:20: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3505:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3505:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3505:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3505:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3505:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3505:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3539:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3539:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3539:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3539:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3539:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3539:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:6105:30: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:6114:21: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:6116:17: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3810:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3810:48: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:3810:48: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:3811:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3811:49: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:3811:49: sparse:     got struct ftrace_hash [noderef] __rcu *notrace_hash

vim +6651 kernel/trace/ftrace.c

8d2c1233f37149 Jiri Olsa  2025-12-30  6594  
e93672f770d72f Jiri Olsa  2025-12-30  6595  /**
e93672f770d72f Jiri Olsa  2025-12-30  6596   * update_ftrace_direct_mod - Updates @ops by modifing its direct
e93672f770d72f Jiri Olsa  2025-12-30  6597   * callers provided in @hash
e93672f770d72f Jiri Olsa  2025-12-30  6598   * @ops: The address of the struct ftrace_ops object
e93672f770d72f Jiri Olsa  2025-12-30  6599   * @hash: The address of the struct ftrace_hash object
e93672f770d72f Jiri Olsa  2025-12-30  6600   * @do_direct_lock: If true lock the direct_mutex
e93672f770d72f Jiri Olsa  2025-12-30  6601   *
e93672f770d72f Jiri Olsa  2025-12-30  6602   * This is used to modify custom direct callers (ip -> addr) in
e93672f770d72f Jiri Olsa  2025-12-30  6603   * @ops specified via @hash.
e93672f770d72f Jiri Olsa  2025-12-30  6604   *
e93672f770d72f Jiri Olsa  2025-12-30  6605   * This can be called from within ftrace ops_func callback with
e93672f770d72f Jiri Olsa  2025-12-30  6606   * direct_mutex already locked, in which case @do_direct_lock
e93672f770d72f Jiri Olsa  2025-12-30  6607   * needs to be false.
e93672f770d72f Jiri Olsa  2025-12-30  6608   *
e93672f770d72f Jiri Olsa  2025-12-30  6609   * Returns: zero on success. Non zero on error, which includes:
e93672f770d72f Jiri Olsa  2025-12-30  6610   *  -EINVAL - The @hash is empty
e93672f770d72f Jiri Olsa  2025-12-30  6611   *  -EINVAL - The @ops is not registered
e93672f770d72f Jiri Olsa  2025-12-30  6612   */
e93672f770d72f Jiri Olsa  2025-12-30  6613  int update_ftrace_direct_mod(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock)
e93672f770d72f Jiri Olsa  2025-12-30  6614  {
e93672f770d72f Jiri Olsa  2025-12-30  6615  	struct ftrace_func_entry *entry, *tmp;
e93672f770d72f Jiri Olsa  2025-12-30  6616  	static struct ftrace_ops tmp_ops = {
e93672f770d72f Jiri Olsa  2025-12-30  6617  		.func		= ftrace_stub,
e93672f770d72f Jiri Olsa  2025-12-30  6618  		.flags		= FTRACE_OPS_FL_STUB,
e93672f770d72f Jiri Olsa  2025-12-30  6619  	};
092f8ec7dbdc71 Leon Hwang 2026-07-30  6620  	struct ftrace_hash *direct_hash;
e93672f770d72f Jiri Olsa  2025-12-30  6621  	struct ftrace_hash *orig_hash;
e93672f770d72f Jiri Olsa  2025-12-30  6622  	unsigned long size, i;
e93672f770d72f Jiri Olsa  2025-12-30  6623  	int err = -EINVAL;
e93672f770d72f Jiri Olsa  2025-12-30  6624  
e93672f770d72f Jiri Olsa  2025-12-30  6625  	if (!hash_count(hash))
e93672f770d72f Jiri Olsa  2025-12-30  6626  		return -EINVAL;
e93672f770d72f Jiri Olsa  2025-12-30  6627  	if (check_direct_multi(ops))
e93672f770d72f Jiri Olsa  2025-12-30  6628  		return -EINVAL;
e93672f770d72f Jiri Olsa  2025-12-30  6629  	if (!(ops->flags & FTRACE_OPS_FL_ENABLED))
e93672f770d72f Jiri Olsa  2025-12-30  6630  		return -EINVAL;
e93672f770d72f Jiri Olsa  2025-12-30  6631  
e93672f770d72f Jiri Olsa  2025-12-30  6632  	/*
e93672f770d72f Jiri Olsa  2025-12-30  6633  	 * We can be called from within ops_func callback with direct_mutex
e93672f770d72f Jiri Olsa  2025-12-30  6634  	 * already taken.
e93672f770d72f Jiri Olsa  2025-12-30  6635  	 */
e93672f770d72f Jiri Olsa  2025-12-30  6636  	if (do_direct_lock)
e93672f770d72f Jiri Olsa  2025-12-30  6637  		mutex_lock(&direct_mutex);
092f8ec7dbdc71 Leon Hwang 2026-07-30  6638  	else
092f8ec7dbdc71 Leon Hwang 2026-07-30  6639  		lockdep_assert_held_once(&direct_mutex);
092f8ec7dbdc71 Leon Hwang 2026-07-30  6640  
092f8ec7dbdc71 Leon Hwang 2026-07-30  6641  	direct_hash = rcu_dereference_protected(direct_functions, lockdep_is_held(&direct_mutex));
092f8ec7dbdc71 Leon Hwang 2026-07-30  6642  	if (direct_hash == EMPTY_HASH)
092f8ec7dbdc71 Leon Hwang 2026-07-30  6643  		goto unlock;
e93672f770d72f Jiri Olsa  2025-12-30  6644  
e93672f770d72f Jiri Olsa  2025-12-30  6645  	orig_hash = ops->func_hash ? ops->func_hash->filter_hash : NULL;
e93672f770d72f Jiri Olsa  2025-12-30  6646  	if (!orig_hash)
e93672f770d72f Jiri Olsa  2025-12-30  6647  		goto unlock;
e93672f770d72f Jiri Olsa  2025-12-30  6648  
50b35c9e50a865 Jiri Olsa  2026-03-12  6649  	/* Enable the tmp_ops to have the same functions as the hash object. */
e93672f770d72f Jiri Olsa  2025-12-30  6650  	ftrace_ops_init(&tmp_ops);
50b35c9e50a865 Jiri Olsa  2026-03-12 @6651  	tmp_ops.func_hash->filter_hash = hash;
e93672f770d72f Jiri Olsa  2025-12-30  6652  
e93672f770d72f Jiri Olsa  2025-12-30  6653  	err = register_ftrace_function_nolock(&tmp_ops);
e93672f770d72f Jiri Olsa  2025-12-30  6654  	if (err)
e93672f770d72f Jiri Olsa  2025-12-30  6655  		goto unlock;
e93672f770d72f Jiri Olsa  2025-12-30  6656  
e93672f770d72f Jiri Olsa  2025-12-30  6657  	/*
e93672f770d72f Jiri Olsa  2025-12-30  6658  	 * Call __ftrace_hash_update_ipmodify() here, so that we can call
e93672f770d72f Jiri Olsa  2025-12-30  6659  	 * ops->ops_func for the ops. This is needed because the above
e93672f770d72f Jiri Olsa  2025-12-30  6660  	 * register_ftrace_function_nolock() worked on tmp_ops.
e93672f770d72f Jiri Olsa  2025-12-30  6661  	 */
e93672f770d72f Jiri Olsa  2025-12-30  6662  	err = __ftrace_hash_update_ipmodify(ops, orig_hash, orig_hash, true);
e93672f770d72f Jiri Olsa  2025-12-30  6663  	if (err)
e93672f770d72f Jiri Olsa  2025-12-30  6664  		goto out;
e93672f770d72f Jiri Olsa  2025-12-30  6665  
e93672f770d72f Jiri Olsa  2025-12-30  6666  	/*
e93672f770d72f Jiri Olsa  2025-12-30  6667  	 * Now the ftrace_ops_list_func() is called to do the direct callers.
e93672f770d72f Jiri Olsa  2025-12-30  6668  	 * We can safely change the direct functions attached to each entry.
e93672f770d72f Jiri Olsa  2025-12-30  6669  	 */
e93672f770d72f Jiri Olsa  2025-12-30  6670  	mutex_lock(&ftrace_lock);
e93672f770d72f Jiri Olsa  2025-12-30  6671  
e93672f770d72f Jiri Olsa  2025-12-30  6672  	size = 1 << hash->size_bits;
e93672f770d72f Jiri Olsa  2025-12-30  6673  	for (i = 0; i < size; i++) {
e93672f770d72f Jiri Olsa  2025-12-30  6674  		hlist_for_each_entry(entry, &hash->buckets[i], hlist) {
092f8ec7dbdc71 Leon Hwang 2026-07-30  6675  			tmp = __ftrace_lookup_ip(direct_hash, entry->ip);
e93672f770d72f Jiri Olsa  2025-12-30  6676  			if (!tmp)
e93672f770d72f Jiri Olsa  2025-12-30  6677  				continue;
e93672f770d72f Jiri Olsa  2025-12-30  6678  			tmp->direct = entry->direct;
e93672f770d72f Jiri Olsa  2025-12-30  6679  		}
e93672f770d72f Jiri Olsa  2025-12-30  6680  	}
e93672f770d72f Jiri Olsa  2025-12-30  6681  
e93672f770d72f Jiri Olsa  2025-12-30  6682  	mutex_unlock(&ftrace_lock);
e93672f770d72f Jiri Olsa  2025-12-30  6683  
e93672f770d72f Jiri Olsa  2025-12-30  6684  out:
e93672f770d72f Jiri Olsa  2025-12-30  6685  	/* Removing the tmp_ops will add the updated direct callers to the functions */
e93672f770d72f Jiri Olsa  2025-12-30  6686  	unregister_ftrace_function(&tmp_ops);
e93672f770d72f Jiri Olsa  2025-12-30  6687  
e93672f770d72f Jiri Olsa  2025-12-30  6688  unlock:
e93672f770d72f Jiri Olsa  2025-12-30  6689  	if (do_direct_lock)
e93672f770d72f Jiri Olsa  2025-12-30  6690  		mutex_unlock(&direct_mutex);
e93672f770d72f Jiri Olsa  2025-12-30  6691  	return err;
e93672f770d72f Jiri Olsa  2025-12-30  6692  }
e93672f770d72f Jiri Olsa  2025-12-30  6693  

:::::: The code at line 6651 was first introduced by commit
:::::: 50b35c9e50a865600344ab1d8f9a8b3384d7e63d ftrace: Use hash argument for tmp_ops in update_ftrace_direct_mod

:::::: TO: Jiri Olsa <jolsa@kernel.org>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
