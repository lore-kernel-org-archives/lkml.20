Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794125679;
	b=x/2od8yJzu4jq6zBAU3qXI2PWZN6Zp7rSgj8nTrIkIQn4SEQY4K3Oqe0YEoxczkpjeuU
	 eMfRb85J7tPRJeSJD7QmJrTYDQqJwBYsLrDb87ATcAJYQRSf02IVJ1KAugj0L4G+sLSWA
	 K3l/a+LK+7V1hJ1uDnipwuLbdTOyNCfpG2h+sHkQhGwEvIkZ0I9SyY0U7rPH4pzZwDhq7
	 D/NFBUSAeSgIeGDdoxO1Bnl3jpx20lCrKxdLYb0M9jKAmKdLiYYKCqaclNRKb2zcOsfIX
	 T/0LygL0KArNFmswf7Ip/D/k/m4wC15HqhH68a2KzK7Rs7c6ovAAScJwooyS+PS8IbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794125679;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=bfz9+h0yf44yXspz+aihsE+ejM490QZWdZkmfUuMTDA=;
	b=FxpErdLwmZrZ/MYYw/ZvGxjpIDLkUTH9avh90cQgRztjjs3Fo6Rrje7uVl1vju2RO53U
	 /AV6qKjIChzCux1vwulosEWO04uD/9Jrh0qoEjNCRUyv7cbm3N/Wl3Nh9AmfYxq7pxBYJ
	 pBHsmk0mp8FHffjPUKMRXvOnA2i2CuyC0LyWKtVysrUrlRo6jczgvyvRkD1j9o8hfwZ7b
	 skOQcuNfaX+05/adIetRIyuCpdP7kyqR/rWXWNHCBXkv4nrmTCffybr60BlZcBmph2u+Y
	 nHJ4lbeyzuVgtt3qXopUyokFeg6tzhCJnWMVh+MR+E94LVN8hurI5pr3J/u2Dg1c99g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ak9y2n0s;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20074606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 08:14:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20074606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ak9y2n0s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794125677; x=1825661677;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rsyIzfhuguUrGhsHYiFFB6SqcWKFh1kR+agy5Bl+Riw=;
  b=ak9y2n0suFLiQ0z01a/y20URcF7bla+aFVksaT+YWurSV8HCYi5WkYFO
   Tz2xYELmCmiod7cydeT84zCkO8zzlqsxe/8J++mh2ifukCO+tnEGt4gLR
   iQ+rJ6JUYli1Ntlla3uErTUWjbq3KTljz2WJ7Hqmg587XU8YGAGqHBvNf
   W8773et1VEviUjtS3cWi0n6JrZ+JvFucuKZvxFrCk/nyxsF+G2mlupVNU
   s8gu0zY1Lxk5bc3xZQFCuzM2fO8ozljsQOLq37j6vSpoeXXrlueIw4Ty6
   Bwe83Kj5Suy/l9T2xIHLCXnZE2CiC+RJcjhdlISi2c0T0m+GlUP8K+a3h
   A==;
X-CSE-ConnectionGUID: cai7BGqOQSmEc2K3EKEmPA==
X-CSE-MsgGUID: Yi7pQshXQc+RALje4P8jcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2925921"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2925921"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 00:14:15 -0800
X-CSE-ConnectionGUID: pxtqn/MhS12FhTRPkvGUMg==
X-CSE-MsgGUID: JEP1GETWSSid0Ip0b//Hrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7489387"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 00:14:11 -0800
Date: Sun, 8 Nov 2026 16:14:08 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Dmitry Ilvokhin <d@ilvokhin.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Michal Hocko <mhocko@suse.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Hugh Dickins <hughd@google.com>,
	Liam Howlett <liam.howlett@oracle.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org,
	yi1.lai@intel.com
Subject: [linus:master] [mm]  e97d7c5165: trinity.invoked oom-killer
Message-ID: <202611081559.ec60e6e4-lkp@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline



Hello,

kernel test robot noticed "trinity.invoked oom-killer" on:

commit: e97d7c5165227e6e4423b4a869d7805b01706392 ("mm: shmem/tmpfs hugepage defaults config choice") https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[test failed on linux-next/master ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b]

in testcase: trinity
version: trinity-i386-abe9de86-1_20230429 with following parameters:

  runtime: 300s
  group: group-01
  nr_groups: 5


config: x86_64-randconfig-1008-20261105
compiler: clang-22
test machine: qemu-system-x86_64 -enable-kvm -cpu Icelake-Server-noTSX,enforce -smp 4 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202611081559.ec60e6e4-lkp@intel.com


[  147.803560][ T3738] trinity-c3 invoked oom-killer: gfp_mask=0x440dc0(GFP_KERNEL_ACCOUNT|__GFP_ZERO|__GFP_COMP), order=0, oom_score_adj=500
[  147.808170][ T3738] CPU: 0 UID: 65534 PID: 3738 Comm: trinity-c3 Not tainted 6.18.0-rc5-00155-ge97d7c516522 #1 PREEMPT(lazy)
[  147.808179][ T3738] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[  147.808182][ T3738] Call Trace:
[  147.808186][ T3738]  <TASK>
[  147.808190][ T3738]  dump_stack_lvl+0xc0/0x138
[  147.808212][ T3738]  dump_header+0xd3/0x440
[  147.808225][ T3738]  oom_kill_process+0x107/0xf00
[  147.808240][ T3738]  ? out_of_memory+0x897/0x12f0
[  147.808252][ T3738]  out_of_memory+0xeaa/0x12f0
[  147.808265][ T3738]  ? out_of_memory+0x897/0x12f0
[  147.808278][ T3738]  __alloc_pages_may_oom+0x1a5/0x2c0
[  147.808295][ T3738]  __alloc_pages_slowpath+0x6d7/0xe00
[  147.808316][ T3738]  __alloc_frozen_pages_noprof+0x1fb/0x270
[  147.808330][ T3738]  alloc_pages_mpol+0x16f/0x340
[  147.808340][ T3738]  alloc_pages_noprof+0x95/0x1b0
[  147.808349][ T3738]  pte_alloc_one+0x23/0x2f0
[  147.808357][ T3738]  ? __pte_alloc+0x1a/0x170
[  147.808367][ T3738]  __pte_alloc+0x22/0x170
[  147.808378][ T3738]  do_pte_missing+0x2500/0x3180
[  147.808401][ T3738]  handle_mm_fault+0x1061/0x36b0
[  147.808409][ T3738]  ? handle_mm_fault+0x41/0x36b0
[  147.808435][ T3738]  do_user_addr_fault+0xa18/0x1030
[  147.808447][ T3738]  ? rcu_is_watching+0x15/0xb0
[  147.808459][ T3738]  exc_page_fault+0x6d/0xf0
[  147.808474][ T3738]  asm_exc_page_fault+0x26/0x30
[  147.808480][ T3738] RIP: 0023:0xf7e1d80e
[  147.808486][ T3738] Code: c6 44 24 28 00 8b 7c 24 14 89 bd 4c 01 00 00 e9 ca fe ff ff 8d b4 26 00 00 00 00 90 ba 10 00 00 00 29 ca 8d 3c 10 89 f0 29 d0 <89> 17 83 c7 08 83 c8 02 89 47 fc e9 b9 fd ff ff 66 90 89 4c 24 14
[  147.808490][ T3738] RSP: 002b:00000000ffe58f80 EFLAGS: 00010212
[  147.808497][ T3738] RAX: 0000000000200ff8 RBX: 00000000f7f84740 RCX: 0000000000000008
[  147.808501][ T3738] RDX: 0000000000000008 RSI: 0000000000201000 RDI: 00000000f58b3008
[  147.808505][ T3738] RBP: 00000000f7f84000 R08: 0000000000000000 R09: 0000000000000000
[  147.808508][ T3738] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
[  147.808511][ T3738] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
[  147.808529][ T3738]  </TASK>


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261108/202611081559.ec60e6e4-lkp@intel.com


--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

