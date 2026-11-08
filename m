Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794127648;
	b=WKV5FLez0ykaHpsQ5+x//Zx6PiLh5v9/fsFoGtHTBhNZWL5ShHA+Yka700zre4P/WYW7
	 cHV76sRVwoQbP3eh2MHaRN94lCxD733pVaN98pNMs4GrLEKche43PVK5/Bo6+z98wqyLN
	 pyMZTrpzomWUAhwTymyL9iiMsSYN8MKCn+2C0We8L/Yi/vExNlUZtn+pWbuOyYEIOrG/P
	 k/zWR0YzfVntZ1VmUL9+hBETvHnNIaj6WijCS0lX5j1TT88LN7kSYIWcjjJFnduTRkBa3
	 ltbR6x1gIgFaZsLZQ6H6SAI6y8lCDJCmu42jiLUlrU5u/WzfmKDQ/+R2tnWZjOvgiIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794127648;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=+vIKb+5UC4MoJoAuiRAh5ZXkksDm4RPFNdKQsFxtNvg=;
	b=4HadnoLFJojllgtcCeQ23Tv7LVwwB8Fq1iSss53LYFNj9Pp1LicFm87r7hxCn3HwO0zO
	 DP1iuKfiemgi06VTY4ZQhJRuw1ShRnM8iItjkYviD+jdofyXrPbcmKlBNj11++H4FTh9r
	 69JANmhbB+BflMgU2NQAGkHCiSa/WC79Lt/eQzPi+BgAFSKbEMCswnt2OX1hC4Ze8W/kX
	 OdmvC5zlgSvWVFS4NoHd8pUc5sAey0tXefGzeQTk8ut1L11cbVtMbVb1dtXTLGF29k6Ce
	 pN+oPX6jVrLtTJocwCPRKHJqiPP6nlq+afA+FUFR28jsXIb/hovgItMkegvk1YddkOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UXQe2gmx;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117DA606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 08:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 117DA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UXQe2gmx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794127648; x=1825663648;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=q4NOqskWQTyg1tTdO2oBl1EJQ8QeJomuhYXJQeCLeWw=;
  b=UXQe2gmxq64ZmF9+mWk1iNkWOB00GlpOTRqqC9OlqAUL/qP9n+APdW9P
   Fue+90ShOux5BixT+NfdTJWhoPlp6f58lwCMkajRrGFtyOsJrthzjXiNI
   HWHF64zbajmza+GVnlo1KPWhzfO1ja7hRr3LIDsMqEGvUGO+ieGG6bi14
   nnjG+RoCHY2bJESDLEidrZzaPm3mIP4jDb6O+3XX/hWMqEudejBHNUS1R
   G1evZmgoXJNtAq5q8CAYRX9+csvQ4RzyXepGRgJFLNOHLJwAsT2dMYhaQ
   N00IaZV1V26sdCyF1le3EMPJksYuRf63vugXTtZE01v5YYY89MrAjTiMz
   Q==;
X-CSE-ConnectionGUID: GkPk0OymQCC9LpCEsPTl5A==
X-CSE-MsgGUID: W9XV18qhTE6udXlTLoLVZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2984603"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2984603"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 00:47:27 -0800
X-CSE-ConnectionGUID: eHSn27TXSsecr98OEOTotA==
X-CSE-MsgGUID: 1UzSz17jRoSG/0NK7F3F3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7637015"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 00:47:26 -0800
Date: Sun, 8 Nov 2026 16:47:22 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	yi1.lai@intel.com
Subject: [linus:master] [x86/signal]  9da9f342a8: stress-ng.timer.ops_per_sec
 2.8% improvement
Message-ID: <202611080951.256d230a-lkp@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit



Hello,

kernel test robot noticed a 2.8% improvement of stress-ng.timer.ops_per_sec on:


commit: 9da9f342a897a2d43ad947d4073b1912800ab436 ("x86/signal: Use scoped user access in the sigreturn system calls") https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory
parameters:

  nr_threads: 100%
  testtime: 60s
  test: timer
  cpufreq_governor: performance


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261108/202611080951.256d230a-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-srf-2sp3/timer/stress-ng/60s

commit: 
  2806617c9c ("x86/entry: Use get_user() for the fast 32-bit syscall EBP fetch")
  9da9f342a8 ("x86/signal: Use scoped user access in the sigreturn system calls")

2806617c9c02fe16 9da9f342a897a2d43ad947d4073
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      9031            +1.9%       9207        stress-ng.time.system_time
      1344           -11.8%       1184 ±  2%  stress-ng.time.user_time
 5.442e+09            +2.8%  5.593e+09        stress-ng.timer.ops
  90751049            +2.8%   93261655        stress-ng.timer.ops_per_sec


Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


