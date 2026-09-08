Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B164538D81
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 19:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788897152; cv=none; b=Iu6Bq7fi34ZC5ByDvPlNdgWh/I1HRTsbbEB2/NRuzxviUj4HpOKeOXD9l9GLvTz+P3fx8PEoFGJZ0E0SZhoAEp3C0bmvw1dhrenZmcv09FqhkBWiv8Z/Ajs9SpqshIzYUaFURAV8Np/XWMT9jaK5uSG7WKhn05kYo852gl6paxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788897152; c=relaxed/simple;
	bh=mCBqO3q+TTaZFhkJi/oHaFyrgdEqi6EOg2WjbZ2o1gk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PGAe+greJ+krv6Sxn6sLjfcRHPR0l16EOqkBc8Fwzlr7jF7qXuTy79bhnc+2dEhXKVM2DoyY3TYMtKJrWnpORCqxOHwQh7V7izJLmh70+P1p5JwMrnVzMr7WFsRttTcScmnxIAG5PnfaiLiVZi+czbhvJd1RY9sRg80JlW4PyzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GJuXgOR5; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GJuXgOR5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788897150; x=1820433150;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mCBqO3q+TTaZFhkJi/oHaFyrgdEqi6EOg2WjbZ2o1gk=;
  b=GJuXgOR5Vrkk479L5vq6CyMkprGsoe1fjbAywTR10I4IhbShFznxrpLs
   HKQwRsFMMHyZDgwP16vyaL8070cxamoqs13i+Z8K7BwR5Tn6u3MbBKU/s
   DwDbiMPiphfFH0vVlleaLVFJnmwMV5HZZ4sWy/76dhqa7seVcs3DqYUkQ
   J1kWqF9ATZjRQIMNVf8BmplYW1KdJxNn754EVj+t0yuFQ8OL0S1mEAxcw
   +AwJWXtkZr391A9IYxmsdFpT1o1QEjqUNSi8mMWODVUcaRC5BZMG7sm9E
   l042lIrL5QdyoZrbNvHZM7ztouwRfEBnYgxYio1Q1O7tUTFiG/7gojteq
   A==;
X-CSE-ConnectionGUID: EitE/zhNTNK3uVc6Sli/Bw==
X-CSE-MsgGUID: J7eGnCYfQSaZHIY6VhQLvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99904489"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="99904489"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 12:52:30 -0700
X-CSE-ConnectionGUID: xca8AO7tTdyc+C1UsTxzEQ==
X-CSE-MsgGUID: 3Fyafx6uR7uKu3+kM+lnIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="276332534"
Received: from smtp.ostc.intel.com ([10.54.69.131])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 12:52:29 -0700
Received: from ray2.jf.intel.com (unknown [10.24.81.183])
	by smtp.ostc.intel.com (Postfix) with ESMTP id 8000B6368;
	Tue,  8 Sep 2026 12:52:29 -0700 (PDT)
From: Dave Hansen <dave.hansen@linux.intel.com>
To: torvalds@linux-foundation.org
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: [GIT PULL] x86/urgent for 7.3-rc3
Date: Tue,  8 Sep 2026 12:52:17 -0700
Message-ID: <20260908195217.3202284-1-dave.hansen@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull some x86/urgent changes for 7.3-rc3. Note that these are
fixes for some older issues. But, they are issues that are affecting
real users and aren't just cleaning up AI drive-by reports.

These is coming a wee bit later than the usual Sundays because of
a late breaking issue with one of the patches which is now temporarily
kicked out.

--

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_urgent_for_7.3-rc3

for you to fetch changes up to d2929113b15bfc06793b852aeba3d2db6d79fcc9:

  x86/MCE/AMD: Fix inverted interrupt enablement during storm handling (2026-09-08 09:16:32 +0200)

----------------------------------------------------------------
 * AMD device topology and machine check fixes

----------------------------------------------------------------
Jasjeet Rangi (1):
      x86/MCE/AMD: Fix inverted interrupt enablement during storm handling

Jason Andryuk (2):
      x86/amd_node: Avoid divide by zero on virtualized systems
      x86/amd_node: Fix potential NULL pointer dereference

 arch/x86/kernel/amd_node.c    | 19 +++++++++++++------
 arch/x86/kernel/cpu/mce/amd.c |  2 +-
 2 files changed, 14 insertions(+), 7 deletions(-)
