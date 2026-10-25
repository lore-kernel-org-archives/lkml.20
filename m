Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792959457;
	b=sPZ3kEViZfd9MxpBmbUOI7TSdQzfjAUqgH+o1nWpybE8aZixWD0tM0BUpKPkRrk60XJs
	 /MIgzlRx03fAccQ1pER3wnev1+XaUZ1uIoc0S3ExFd3QPvMvsqJnNY+QWoHqnUpevoV2D
	 3BpkeTKF2xqvkc0MrRI19OIQIJX0JlsBZHJwbHSDrLcwpvG4tNKtEQzqKTXc3WXqkWG1O
	 EokwN+3kYBDkjvKlOFp8fVkkmsiWeOl/WP4F+XNq2QPkiVPU7rZRUOIUgp4RsmSS5eYX2
	 whmd7NSg6qpNUgPgDsNjGRdYVvgDUZsW33TFSeJxg0/7NwpSftY8kjnY7BFbJ6vO1Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792959457;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=46WEtRZ+0CGOkp0Boc8DGNL6y/8ZUUah7QZB53jNGg0=;
	b=F8irjTqQOitdwzllY66DwL9YQv/6iaScKQCziBco7lk/keb3MAN38rt7htV3QaU4a1TD
	 Rc1gOVm0k4P9TCa1IVDISaQ+9KEyXnUd18gH7Lld1hXxLsBz57XxCwlfW6XFjvJmEVuh/
	 AL7rmYhE3GmSXK0pa7mspRjOkLxJN53xpipFWu/bp6q9PRqoJMJfC+i2dCkJtz6HE8Qap
	 iUn2HC8iKQPp2h7D5Oo1gto0SJzXdj0U4aNBUK/zuehgmz01ibZPfPqhTsCw0+Iy6f5pd
	 Fnh3QYk0oNuzNlyQAMRm8K0etGox9RmYJd2XR+htDgJ3mFJxiTD6sOV6nXbeq2PCydg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cwOmVmPK;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60740606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:17:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60740606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cwOmVmPK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792959456; x=1824495456;
  h=date:from:to:cc:subject:message-id;
  bh=syAfG+kp2XB6yrbAcLipgM6CejacTQP8smCRAWAmD8Y=;
  b=cwOmVmPKxaK/OgHQAvyZFejsFWj56gE+cTTgCYY7Tgpgh7DXgc4EotE8
   Jsb0NhoDezO2e9zKfGLGN7cGePLsardJN0SfwgGMyOfSTOfSNDKt7Q0Fe
   pUeiaK45OaOvMg6h21flK5aOWzGjG2HgxXeZNusrqZwuDrSuZ1fq7vRaw
   2DjXPVKDARHsDCHNPcP1RqhitpB1HjXeOR/KaQlQgf+fkUETVKZQ/moX+
   9d3Z47M1+GVS+zqZAs1w9Ox14x3hzFIn/krE8LOvmuJPVt9luG3/D8BiN
   oNUHjP4AGZyHyurrm33At49g0X+k36uq2btr1ifEywhegZoq3AiOPDI8P
   g==;
X-CSE-ConnectionGUID: l7r7C2StSsWxSBdQrNTsRA==
X-CSE-MsgGUID: LVjrip2zRxmSWf4IMYj7LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1654654"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1654654"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 13:17:35 -0700
X-CSE-ConnectionGUID: n7+DC3RSTeqZ/YJio4cTYQ==
X-CSE-MsgGUID: bBKqubHNQiyuUDoT++hNdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4050398"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 25 Oct 2026 13:17:34 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xL4eq-000000003ot-24Wf;
	Sun, 25 Oct 2026 20:17:32 +0000
Date: Sun, 25 Oct 2026 21:17:24 +0100
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: vmlinux.o: error: objtool: do_jit+0x4f77: relocation to
 !ENDBR: .text+0x24c3b5
Message-ID: <202610252131.3Wl3JYJ5-lkp@intel.com>
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
head:   21a7f44fd0765fcc5194130b28767786eba1d1e7
commit: cff94a3d78d8cc12ceaf60aa9272aac422b1dc39 bpf, x86: Support unwind_goto and unwind_exit
date:   5 days ago
config: x86_64-randconfig-r2107-20261025 (https://download.01.org/0day-ci/archive/20261025/202610252131.3Wl3JYJ5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261025/202610252131.3Wl3JYJ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: cff94a3d78d8 ("bpf, x86: Support unwind_goto and unwind_exit")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610252131.3Wl3JYJ5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> vmlinux.o: error: objtool: do_jit+0x4f77: relocation to !ENDBR: .text+0x24c3b5

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
