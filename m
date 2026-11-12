Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794507405;
	b=1VXSP2V96F5JHOu944vs2ngCBz3O2qi8PloPMzW25Vd12NdZhwK+dyUmREHnWtIErqBn
	 9iJBRpfl6yNeIueOrLdRohSpQyIsfHhvzbZwVvvFUDlZQiJ2/TIIIcoiA92ZrG8OXYYqu
	 PXRbyX87A85u6bvYCEvH+InoUUgshQFXd2ZFkEmiW9i4XuGIi+ZVFmrbKPqYqQsxmbNTU
	 RA7rPF/av5CsFDFYbUYC593LxdF7ON84WZ7zRK3UM9+q3QG2qDn7AQXCSTYFMDvQhw0+q
	 yIhKQK/KqRKKcjoqT/j5Pv0+/f1PhsXJf7qr/cQynKgP4cAXTNN1SxmiIMc4CduMXiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794507405;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=tWrw0y03ynEPeUvFezB4WbfoI9K+tvQ0sZQOxjw0zUo=;
	b=XkktgsxjLK/zhVrNeI+BNJAxxcFDsUm3AqTOUA1XuZfiKhqSB/chNFbnJQCxv/71wtNm
	 reTsquX+y4+ipu2tNvGWRVKpP4J7CGgNlUHFPn8qNeQp2Gtl04QNl1oQp37unaPZdqxa1
	 fEdCf1PYWfmKR8SsG99Lg/2qc0tvmaGlimcfxH0BluA3NNknTNCwaVrrXSfdfe1axwuPd
	 weUkN6/LXxrZT2Ok9VuDpOOolyyqd+tMcECKnXNKeXHfIP64wJwFGwP5r3c1iZjLVFoaR
	 HmMjoR5ECx4Wh+isjDv8aS5pWZgUv9gCEo34AuqrjPKPntV8ykPUf12w+cz2olyEznQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Y6UxD/q7";
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5692606A31C;
	Thu, 12 Nov 2026 18:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5692606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y6UxD/q7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794507404; x=1826043404;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KwLGfoyejnZaBvuQi10IWhoIdUZQZN1o2DyNVaGrRTo=;
  b=Y6UxD/q7I69JzUM9k444P/mTC+n403il7y2d6qYY388OpYysIpT0yXjs
   1ZHlBNzSkTFLy0De4cKs5UmIvRxJyJoDTx1krDyQXD7LdaV2sHHDOWYqu
   vxkSvEJGfxI5/8/np1RDacwUKAtGQ3z7iEzbSw4xRvvr3Ma9zsrGIvicp
   iLil+0EjaFL6/QQgHjxQ83KBQkF47PYIwvOmQrcD9oYroHlvyXL3W/q6C
   jzIjXw+HoKu5f7FxNtbFq9dhJAe158AzMmg1hMfR+H1coSJJX0wTIlFLa
   +4/A/EhgMGgJzJBMIAHKcE+dezAkyIn6iNjDDG2qn4ldkl9HaKT+5lBmq
   Q==;
X-CSE-ConnectionGUID: I73Cq7+XRgWnUbEmvWn29g==
X-CSE-MsgGUID: 1SHh8rn3RWKhqriGEJFlbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3203204"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3203204"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 10:16:42 -0800
X-CSE-ConnectionGUID: ZYRhuLRbRvq1liZofQ9WwQ==
X-CSE-MsgGUID: 1SJI9iuuQr6WQwjdpwVQOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8898605"
Received: from b04f130c83f2.jf.intel.com ([10.165.154.98])
  by orviesa009.jf.intel.com with ESMTP; 12 Nov 2026 10:16:41 -0800
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Tim Chen <tim.c.chen@linux.intel.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Chen Yu <yu.c.chen@intel.com>,
	Jemmy Wong <jemmywong512@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] sched/cahce: Document cache aware scheduling
Date: Thu, 12 Nov 2026 10:21:45 -0800
Message-Id: <cover.1794507151.git.tim.c.chen@linux.intel.com>
X-Mailer: git-send-email 2.32.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds the documentation for cache aware scheduling
(CONFIG_SCHED_CACHE) and fixes the migration decision tables in the
comment above can_migrate_llc().

Patch 1 adds Documentation/scheduler/sched-cache.rst, written in the
same style as sched-energy.rst. It explains the operation principles
of the scheduler and describes the debugfs tunables with tuning
guidance.

Patch 2 fixes the example tables in the comment above can_migrate_llc().
Several cells did not match what the function computes with the default
thresholds. The tables now use 45% instead of 40% so they also show the
imb_pct hysteresis. This is a comment-only change and is tagged for
stable so the comment matches the code in v7.2.y and v7.3.y.

Tim Chen (2):
  Documentation/scheduler: Add cache aware scheduling documentation
  sched/cache: Fix decision matrix comment above can_migrate_llc()

 Documentation/scheduler/index.rst       |   1 +
 Documentation/scheduler/sched-cache.rst | 554 ++++++++++++++++++++++++
 kernel/sched/fair.c                     |  14 +-
 3 files changed, 562 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/scheduler/sched-cache.rst

-- 
2.32.0

