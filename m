Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B753C1F41
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789340042; cv=none; b=Uytj1kogp5Pi+XaCiQZEj1iIyZKXZ9YfZiXgO8bzLGDjv0a4hqS9lG291/79xnpOWpxm0LbznkulFDqiIebbeUr4MzFXSywkJ3lHxwI2AGIYYbx0tX684oUm81P5zP3QKTe0zfZ2hfDR5gTj5X7x9wCn66mtPq9TkW4ByrPhWS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789340042; c=relaxed/simple;
	bh=5LjP22tD66mq3m8a9bBsmCg2nw60q5U3H/qWDEihXzs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VSTUTvMXXUVChHg/X6IJQ0zMrtuaYzRQVvmzCqjCO/A8l9LCtxAGcU2AxVoJ3XTqhBsgUF9rN8tXuzS5Q9Z+iYJ4WzSd5xisJuYlINwTBqBJJGeYXnsccV0kCBsQmmh74EAT/9hiEbICl/ymjY45NzowJggfWuEQ2bxBTljogjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N+MoCqOp; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N+MoCqOp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789340039; x=1820876039;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5LjP22tD66mq3m8a9bBsmCg2nw60q5U3H/qWDEihXzs=;
  b=N+MoCqOpxpB4pmbj/XYzjPWkuRw0t0suDBvFMGnR5L9iTFh5IHgxxV05
   g1bmHjSuNkMji2DlVRtZKfzD2Osg1bW+noY6NxYkjdmpR+eQSE9BB+eG8
   hD9WkuGUN6zDaFxCeDVwzVsfw48buVkDwptMF4wykhKkT2b2VoHStFpWd
   KolyZ47OzwAaqXJhjZnAm1IiB9dy6t/c6Fz2Hj70k6XkAVr/JLLGf64wg
   zNr+EeO3+G6lEyRjk9Mri/BzM3QTZOePFC2+ThgS/FWr/y77i4V0vOGgx
   3E+8Tqczhy2Qbc81RA5trerBCKpl0TugaVynsc9+n4akY2+1bCtOiwUgW
   A==;
X-CSE-ConnectionGUID: KO1MRH/ERByQEwx1JQd7pQ==
X-CSE-MsgGUID: yCCaY66LQISsYUhK3/PZYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="107212878"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="107212878"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 15:53:58 -0700
X-CSE-ConnectionGUID: FtMvcg0FSc2a5fZ41LeFdw==
X-CSE-MsgGUID: qQiu4QK5ROGTS1ZfzCPz8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="271066081"
Received: from smtp.ostc.intel.com ([10.54.69.131])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 15:53:58 -0700
Received: from ray2.sr71.net (unknown [10.125.108.110])
	by smtp.ostc.intel.com (Postfix) with ESMTP id 104EB6393;
	Sun, 13 Sep 2026 15:53:58 -0700 (PDT)
From: Dave Hansen <dave.hansen@linux.intel.com>
To: torvalds@linux-foundation.org
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	Dave Hansen ' <dave.hansen@linux.intel.com>
Subject: [GIT PULL] x86/urgent for 7.4-rc4
Date: Sun, 13 Sep 2026 15:53:56 -0700
Message-ID: <20260913225356.1033865-1-dave.hansen@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull some x86/urgent changes for 7.4-rc4.

The MADV_FREE one is notable for silently losing user data and having
been around for a couple of years. The main explanation I'd have for
its longevity is that it requires a few different things to align at
the same time: MADV_FREE, THP and heavy reclaim.

There's also a good set of x86/mm fixes from Lorenzo and company.
They look somewhat theoretical at first but they have actually been
hampering folks' ability mm work in the area.
The following changes since commit d2929113b15bfc06793b852aeba3d2db6d79fcc9:

  x86/MCE/AMD: Fix inverted interrupt enablement during storm handling (2026-09-08 09:16:32 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_urgent_for_7.3-rc4

for you to fetch changes up to 27600805e62f800bacf990354632eae4e487d34c:

  x86/amd_node: Fix PCI device reference counting in amd_smn_init() (2026-09-10 18:05:43 -0700)

----------------------------------------------------------------
 * Fix user-space data loss with MADV_FREE and THP
 * Fix set_memory oopses
 * Fix addition of large constants in mul_u64_add_u64_div_u64()
 * Fix FineIBT hash offset in cfi_get_func_hash()
 * Fix PCI device reference counting in amd_smn_init()

----------------------------------------------------------------
David Laight (1):
      x86/div64: Fix addition of large constants in mul_u64_add_u64_div_u64()

Lorenzo Stoakes (ARM) (3):
      x86/mm/pat: Acquire init_mm write lock on collapse to avoid UAF
      x86/mm/pat: Acquire init_mm read lock on attribute changes to avoid UAF
      x86/mm/pat: Allocate split page tables as kernel page tables

Pedro Falcato (1):
      x86/alternatives: Exclude text poking against change_page_attr()

Soheil Hassas Yeganeh (1):
      x86/cfi: Fix FineIBT hash offset in cfi_get_func_hash()

Vernon Yang (1):
      x86/mm: Fix user-space data loss with MADV_FREE and THP

Yazen Ghannam (1):
      x86/amd_node: Fix PCI device reference counting in amd_smn_init()

 arch/x86/include/asm/div64.h   |   2 +-
 arch/x86/include/asm/pgtable.h |   2 +-
 arch/x86/kernel/alternative.c  | 111 +++++++++++++++++++++++++++--------------
 arch/x86/kernel/amd_node.c     |   6 +--
 arch/x86/mm/pat/set_memory.c   |  53 +++++++++++++++-----
 include/linux/mmap_lock.h      |   2 +
 6 files changed, 121 insertions(+), 55 deletions(-)
