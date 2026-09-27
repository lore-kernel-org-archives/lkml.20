Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE1A22A4E1
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790495947; cv=none; b=bLoedmr9EtPYzlhm3d9rWB70bboYA0KE+oAqkAHNDz4JPb/JkCzaBHqwz9fHnRkpn0DGAzb/GlFzz9//igjbg82Iiy84LJz7a08DOWfhQl9kCLX2p881rYPcO2GYr644u+Cu6y5X5IXYeVFXC3H5UaYOecT7oQ1+9n/EKL/XoAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790495947; c=relaxed/simple;
	bh=lcTHQXcWb3yUwgYQL6SoP+V/S8Tkv9igIw4KHLXhkZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UbXsSAZ6BwIsvxz1c/Mdu8uHNrjsOpu5oMY0mPuFhzXjwMrkiCifQ5UPV/H146rY/zbwu4u66bB7S5s3y7o5qoNQJzULROevQc6mkBzPfHImQnklmFPehwjWZEGqUPpkcvCSW/x9P7x70U6jM4Z4s0FrvwsHxvUkG2/b5lbnLhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I3A++rHc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I3A++rHc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A91E51F000FF;
	Sun, 27 Sep 2026 07:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790495945;
	bh=22F+LgdFmUCPf3vHQYUTlRByNYtmziVwY4fwqIdBEjE=;
	h=Date:From:To:Cc:Subject;
	b=I3A++rHcyh7nY8G5RNqYNLx+rBiibpqxpN0vnBUEXygVS5v035oq4V9F8SwfKCv87
	 jVo+1VgW70hDgtW2B/6uCpbxGz6LQBbgHJoNvqfoazHv/IzUY61KhXm6cHI9bahBZw
	 LT/vwbfM3tImYvRzPOZtUPOuKGE3xHFAcM/Hj7+8rXzr7i7EvqOd7s2fDyTJ9c9UON
	 TrBeZ/cr7YMHD5HSdBIy1H7RBrQ3qQGm0qXefFdbB57joCQ1PntyVOjSTILcMfC0Z3
	 NHBHkG/WRRbV3OsvwkDq/1VY3Dun+6UKEHMDxgAhwugMgP9kZirlzLkq8TBDW4PzwY
	 5BNe7RZxNHSlw==
Date: Sun, 27 Sep 2026 09:59:00 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Namhyung Kim <namhyung@kernel.org>
Subject: [GIT PULL] perf events fixes
Message-ID: <arjMxNosOxpWmNNh@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest perf/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2026-09-27

for you to fetch changes up to 24b620729e53d978b3e425f55bc66efd3bab1f59:

Perf events fixes:

 - Fixes for KVM guest PEBS virtualization (Sean Christopherson)

 - Fixes for various Intel PMUs related to PEBS data-source
   (Dapeng Mi)

 - Fix Intel Panther Cove event scheduling constraints (Dapeng Mi)

 - Fix Intel DMR/NVL OMR extra registers event scheduling (Dapeng Mi)

 - Rename two confusingly named PMU attributes (Dapeng Mi)

 - Fix a refcount leak in attach_perf_ctx_data() (Namhyung Kim)

 - Fix NULL pointer dereference crash in __perf_pmu_sched_task()
   (Puranjay Mohan)

 - Fix CPU-wide event scheduling (Puranjay Mohan)

 - Fix x86 LBR branch entry generation (Puranjay Mohan)

 Thanks,

	Ingo

------------------>
Dapeng Mi (12):
      perf/x86/intel: Fix GRT PEBS load/store direction for latency events, to fix sample classification
      perf/x86/intel: Fix CMT PEBS load/store direction for latency events, to fix sample classification
      perf/x86/intel: Fix DKT PEBS load/store direction for latency events, to fix sample classification
      perf/x86/intel: Update arw_latency_data() mem-op direction handling
      perf/x86/intel: Remove incorrect LionCove PEBS data-source constraints
      perf/x86/intel: Remove incorrect Panther Cove PEBS data-source constraints
      perf/x86/intel: Fix Panther Cove PEBS data-source snoop states
      perf/x86/intel: Delete dead NVL PEBS data-source initcall
      perf/x86/intel: Constrain Panther Cove UOPS_DISPATCHED events to PMCs 0-3
      perf/x86/intel: Fix precise OMR event scheduling for DMR/NVL
      perf/x86/intel: Rename DMR offcore_rsp attribute to offmodule_rsp
      perf/x86/intel: Rename NVL offcore_rsp attribute to offmodule_rsp

Namhyung Kim (1):
      perf/core: Fix a refcount leak in attach_perf_ctx_data()

Puranjay Mohan (3):
      perf/core: Fix NULL pmu_ctx passed to pmu->sched_task()
      perf/core: Run sched_task() for PMUs with only CPU-wide events
      perf/core: Fill branch entries with a single assignment

Sean Christopherson (4):
      perf/x86/intel: Ensure KVM guest PEBS path doesn't set unwanted PERF_GLOBAL_CTRL bits
      perf/x86/intel: Don't write PEBS_ENABLED on host<=>guest xfers if CPU has PEBS isolation, to fix stuck PEBS_ENABLED
      perf/x86/intel: Don't pointlessly context switch DS_AREA (and PEBS config) if PEBS is unused
      perf/x86/intel: Make @data a mandatory param for intel_guest_get_msrs()


 arch/x86/events/amd/brs.c    |   9 ++-
 arch/x86/events/amd/lbr.c    |  16 +++---
 arch/x86/events/intel/core.c | 131 +++++++++++++++++++++++++++++++++----------
 arch/x86/events/intel/ds.c   |  74 +++++++++++-------------
 arch/x86/events/intel/lbr.c  |  65 +++++++++++----------
 arch/x86/events/perf_event.h |   4 --
 drivers/perf/arm_brbe.c      |   2 +-
 include/linux/perf_event.h   |  17 ------
 kernel/events/core.c         |  17 ++++--
 9 files changed, 196 insertions(+), 139 deletions(-)
