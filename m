Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01124356A38
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 22:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789079697; cv=none; b=NIri740tob6ebQdTXtIWRXOn/aXSShYHJP96Dd/F/dbZSljXKhEuDOshnNP04/KCjyHbDolO/5jIyzb5pTQfEBDKt2y5inqjsCuFOa7Hyh6resO4wttV89NyzGEZv2Cvq5lrxM/wdFGJwh9Xwr2qnFLws3ra0GPu4NQDDQyEDX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789079697; c=relaxed/simple;
	bh=Ed8BXBbFKJMCwK1YL7vBEgg7WzzdNM0f6EYwsqfNj3s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VNLk4lOwsNOD/lNIKfBbu4ZIPqnXChX3kVbCD8en44G/rJF5hHqpRczAsd03eYmlfsPQRzUMXQ/yZYvfsmoc6HXaLBaCI/ISIJsFpNXC56XPvwMfibtdFJy4AnKl9OrtFUSsxFAKeSNvx25jYGl0I7GrRWe8wRjxt+m28Vtonl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z+Gh8/ac; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z+Gh8/ac"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789079695; x=1820615695;
  h=date:from:to:cc:subject:message-id;
  bh=Ed8BXBbFKJMCwK1YL7vBEgg7WzzdNM0f6EYwsqfNj3s=;
  b=Z+Gh8/acb5sZtiVKD1ZZLbCJXJ30sLj070LXJpURL5aIlssOKfkscSXz
   B91k5suNG7bEcpXyGgu/3TVbwlLMXfrwaXavS19/ps7C/ZXoaLHDvLRkg
   q1hcJyhEGP4NMSQWOeTpQFcGoGKOxm5lqoM/deHHq2gkT+ytCYZTgXx/i
   R2RbxmcArEAYmFc3DnkoYsoIn3c29Y1/hGhJ5ol8uDOv48kTwEFd/5V9R
   WmYhMh6Mh6MSumbn6qmbfLgtwpx7yUuxFiYdisCs9Je71OP0xYAIRxOd6
   Pyf5BNeQfDjW7s/e9wSVrr+RDObWNJbZ23kLcxMbWKqg5xNZ23KX+GpuT
   A==;
X-CSE-ConnectionGUID: CLdq46tqQwSOodzs+2ZeDg==
X-CSE-MsgGUID: z4zEYAgrTuSDwIbdxUiAlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89572702"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="89572702"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 15:34:54 -0700
X-CSE-ConnectionGUID: 6xkVuo8YQSqwlNTd1DuGUA==
X-CSE-MsgGUID: 9djpv1WmQgacMD039LtAtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="268472883"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 10 Sep 2026 15:34:53 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4nLz-000000000cP-2IvB;
	Thu, 10 Sep 2026 22:34:48 +0000
Date: Fri, 11 Sep 2026 06:33:32 +0800
From: kernel test robot <lkp@intel.com>
To: avivdaum <aviv.daum@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>
Subject: fs/fat/fat_test.c:261:9: sparse: sparse: incorrect type in
 initializer (different base types)
Message-ID: <202609110651.YiovhEHo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   50d05c7c76c96b90462f24debacca971d2e86713
commit: 4bbf3f58e00f8671eb384c7df6983d803058b204 fat: add KUnit tests for timestamp conversion helpers
date:   6 months ago
config: powerpc-randconfig-r134-20260910 (https://download.01.org/0day-ci/archive/20260911/202609110651.YiovhEHo-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609110651.YiovhEHo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4bbf3f58e00f ("fat: add KUnit tests for timestamp conversion helpers")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609110651.YiovhEHo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/fat/fat_test.c:261:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected long long left_value @@     got restricted __le16 const __left @@
   fs/fat/fat_test.c:261:9: sparse:     expected long long left_value
   fs/fat/fat_test.c:261:9: sparse:     got restricted __le16 const __left
>> fs/fat/fat_test.c:261:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected long long right_value @@     got restricted __le16 const __right @@
   fs/fat/fat_test.c:261:9: sparse:     expected long long right_value
   fs/fat/fat_test.c:261:9: sparse:     got restricted __le16 const __right
   fs/fat/fat_test.c:265:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected long long left_value @@     got restricted __le16 const __left @@
   fs/fat/fat_test.c:265:9: sparse:     expected long long left_value
   fs/fat/fat_test.c:265:9: sparse:     got restricted __le16 const __left
   fs/fat/fat_test.c:265:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected long long right_value @@     got restricted __le16 const __right @@
   fs/fat/fat_test.c:265:9: sparse:     expected long long right_value
   fs/fat/fat_test.c:265:9: sparse:     got restricted __le16 const __right
   fs/fat/fat_test.c:286:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected long long left_value @@     got restricted __le16 const __left @@
   fs/fat/fat_test.c:286:9: sparse:     expected long long left_value
   fs/fat/fat_test.c:286:9: sparse:     got restricted __le16 const __left
   fs/fat/fat_test.c:286:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected long long right_value @@     got restricted __le16 const __right @@
   fs/fat/fat_test.c:286:9: sparse:     expected long long right_value
   fs/fat/fat_test.c:286:9: sparse:     got restricted __le16 const __right
   fs/fat/fat_test.c:290:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected long long left_value @@     got restricted __le16 const __left @@
   fs/fat/fat_test.c:290:9: sparse:     expected long long left_value
   fs/fat/fat_test.c:290:9: sparse:     got restricted __le16 const __left
   fs/fat/fat_test.c:290:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected long long right_value @@     got restricted __le16 const __right @@
   fs/fat/fat_test.c:290:9: sparse:     expected long long right_value
   fs/fat/fat_test.c:290:9: sparse:     got restricted __le16 const __right

vim +261 fs/fat/fat_test.c

b0d4adaf3b3c44 David Gow 2021-04-15  248  
b0d4adaf3b3c44 David Gow 2021-04-15  249  static void fat_time_unix2fat_test(struct kunit *test)
b0d4adaf3b3c44 David Gow 2021-04-15  250  {
b0d4adaf3b3c44 David Gow 2021-04-15  251  	static struct msdos_sb_info fake_sb;
b0d4adaf3b3c44 David Gow 2021-04-15  252  	__le16 date, time;
b0d4adaf3b3c44 David Gow 2021-04-15  253  	u8 cs;
b0d4adaf3b3c44 David Gow 2021-04-15  254  	struct fat_timestamp_testcase *testcase =
b0d4adaf3b3c44 David Gow 2021-04-15  255  		(struct fat_timestamp_testcase *)test->param_value;
b0d4adaf3b3c44 David Gow 2021-04-15  256  
4bbf3f58e00f86 avivdaum  2026-03-16  257  	fat_test_set_time_offset(&fake_sb, testcase->time_offset);
b0d4adaf3b3c44 David Gow 2021-04-15  258  
b0d4adaf3b3c44 David Gow 2021-04-15  259  	fat_time_unix2fat(&fake_sb, &testcase->ts,
b0d4adaf3b3c44 David Gow 2021-04-15  260  			  &time, &date, &cs);
b0d4adaf3b3c44 David Gow 2021-04-15 @261  	KUNIT_EXPECT_EQ_MSG(test,
4bbf3f58e00f86 avivdaum  2026-03-16  262  			    testcase->time,
4bbf3f58e00f86 avivdaum  2026-03-16  263  			    time,
b0d4adaf3b3c44 David Gow 2021-04-15  264  			    "Time mismatch\n");
b0d4adaf3b3c44 David Gow 2021-04-15  265  	KUNIT_EXPECT_EQ_MSG(test,
4bbf3f58e00f86 avivdaum  2026-03-16  266  			    testcase->date,
4bbf3f58e00f86 avivdaum  2026-03-16  267  			    date,
b0d4adaf3b3c44 David Gow 2021-04-15  268  			    "Date mismatch\n");
b0d4adaf3b3c44 David Gow 2021-04-15  269  	KUNIT_EXPECT_EQ_MSG(test,
b0d4adaf3b3c44 David Gow 2021-04-15  270  			    testcase->cs,
b0d4adaf3b3c44 David Gow 2021-04-15  271  			    cs,
b0d4adaf3b3c44 David Gow 2021-04-15  272  			    "Centisecond mismatch\n");
b0d4adaf3b3c44 David Gow 2021-04-15  273  }
b0d4adaf3b3c44 David Gow 2021-04-15  274  

:::::: The code at line 261 was first introduced by commit
:::::: b0d4adaf3b3c4402d9c3b6186e02aa1e4f7985cd fat: Add KUnit tests for checksums and timestamps

:::::: TO: David Gow <davidgow@google.com>
:::::: CC: Shuah Khan <skhan@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
