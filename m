Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.246.77.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925637;
	b=ajwssbwND8f0mTzXJ032x5gwvnnmF+/wh7Au4OiRs3cFYOj7kCQrGgk6eWh1QmP8F+ZO
	 dHM6pgLCtag5K/LuoNsXexlWuKFcrPzVzFM+Cc3Cyedm3y82mURVe0VaB6z/T30/T2Z8u
	 sHbw0sARFEQ8vuZG/jcflsJ7/F4L+/YxszeXhq+s5fHEXJLVpv1j0IJLRNqqHZRSzonsC
	 p+xo4wGVwE6JuOjXbvltH3W6JqHZq1d4yD2rQB+lnpfzKPaZihoV9r004Pr4w5m3dX23q
	 oqoEcrp5h5eH3nOzbd6RtX1bHCvWAq/j8fSXWbJQ4Fcnm4rpqvGJhC8LodQoxLrrRMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925637;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=cW65seGP9ksE5jfNfRqJ9ACaCuruaxzeO3U01S8Zm8k=;
	b=xbI7AF20aMmf1BimxTbCNbmBDzNY4Kyw6F3sd05UlM2q3VMCZ290DaeuBmVuXuFXUlLH
	 9R3hRQr1RrI4chlMEfG996ub561n0ruL9mhTBu8pfjtO9qZZlE5wtR4ecJeU04M6aJB10
	 oFLaI1cbOUYC2wh5EDcNZPcKtj3mAw7wfLdwUo24ZIyhXl2WlOZrg4eJDaH+DOWZvJgYl
	 aSlQQFifKrR0umWbIKGg+AoEdvI5vp/XPQFBGoTxitRURtUW80CapFDK/u8wsfFE7Tz2K
	 ikSXAQdzqgBZx1Abhf2JH31TVTrWFo7swCE3SZpT8qW/AFczeay7hhCAqlGVKpb1UTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.de;
	spf=pass smtp.mailfrom=amazon.de;
	dkim=pass header.d=amazon.de header.i=@amazon.de header.a=rsa-sha256 header.s=amazoncorp2 header.b=cF8qtHEg;
	arc=none smtp.remote-ip=44.246.77.92
Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.77.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E319D606A330
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:27:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E319D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.de header.i=@amazon.de header.a=rsa-sha256 header.s=amazoncorp2 header.b=cF8qtHEg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1794925636; x=1826461636;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cW65seGP9ksE5jfNfRqJ9ACaCuruaxzeO3U01S8Zm8k=;
  b=cF8qtHEgcsswlDPMBoZ9WWGXhrreqWElk3YLm8umX1wJgXAsnXbrIPQe
   Uyl0tPU00uXW7cngeTuZT26YUr+zdxArnX+t/ePI4rL3FkMStbJ9ewTzO
   2Kw1xAPDkJ/67V3rTYfPRATosUSNx1cSp0pF9K3UaDxrAh7VYbC3EVzta
   ZDwEf3kT/ATXlcqtVuwFNxq1Ccq+RyICnDGAXQCx5pUGmMLx3pwaYBGVu
   oY9546pXa3ubvu/l/qnbKS0Fpo+j9qs0QoFPiBDlOv+908vJSZ8caZW1A
   MAEWQoRnotb+aqXZMJPpGHzJee+8r8ftUHHOmQ8YG8mydUG/GCOh4vnGA
   g==;
X-CSE-ConnectionGUID: RBXh+pwqQgSk/T0L0WYcDw==
X-CSE-MsgGUID: f2gWztPHRhqKGMsnYOzR4A==
X-IronPort-AV: E=Sophos;i="6.27,218,1787011200"; 
   d="scan'208";a="34314686"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 14:27:14 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:25940]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.34.255:2525] with esmtp (Farcaster)
 id e1acaeaf-9e10-45fd-9922-263e1292e0db; Tue, 17 Nov 2026 14:27:13 +0000 (UTC)
X-Farcaster-Flow-ID: e1acaeaf-9e10-45fd-9922-263e1292e0db
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Tue, 17 Nov 2026 14:27:13 +0000
Received: from dev-dsk-lshahed-1a-d9c3b839.eu-west-1.amazon.com
 (172.19.123.145) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Tue, 17 Nov 2026
 14:27:11 +0000
From: Ibrahim Elshahed <lshahed@amazon.de>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak
	<kprateek.nayak@amd.com>, Josh Don <joshdon@google.com>,
	<linux-kernel@vger.kernel.org>, <nh-open-source@amazon.com>, Fernand Sieber
	<sieberf@amazon.com>, Roman Kagan <rkagan@amazon.de>
Subject: [PATCH 0/2] sched/core: Fix stale core_pick and forced idle after SM_IDLE fast path
Date: Tue, 17 Nov 2026 14:27:01 +0000
Message-ID: <20261117142704.6878-1-lshahed@amazon.de>
X-Mailer: git-send-email 2.47.3
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
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWA001.ant.amazon.com (10.13.139.88) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Under core scheduling, a core-wide selection can leave a pick for an
idle sibling in rq->core_pick and force the other sibling idle. If the
picked task is migrated away before the idle sibling schedules, and it
was that sibling's only task, the SM_IDLE fast path (v6.12+) sends the
sibling back to idle without consuming the pick. The core then stays
forced idle with nothing running, and the forced idle accounting keeps
using the stale pointer, also after the task and its cgroup are freed.

Patch 1 clears rq->core_pick when the picked task is dequeued. Patch 2
stops idle CPUs from taking the SM_IDLE fast path while core scheduling
still has a pick or forced idle to settle.

Testing, on tip sched/core d7e670601af6, schedstats=enable:

- KVM guest, 2 cores x 2 threads, idle=halt. A test init wakes a
  SCHED_FIFO task with its own cookie and cgroup on CPU1 while a
  cookied task yields on CPU0, migrates it to CPU2 0-50 us later, and
  checks that CPU0 is stuck forced idle. It then kills the task,
  removes its cgroup, waits 100 ms and wakes a task on CPU1.
  Without the series all 6 boots hit:

    BUG: unable to handle page fault for address: ffffa3511fcbc018
    #PF: supervisor write access in kernel mode
    #PF: error_code(0x0002) - not-present page
    RIP: 0010:__cgroup_account_cputime_field+0x51/0x70
    Call Trace:
     __sched_core_account_forceidle+0x14a/0x180
     __schedule+0x105d/0x19a0
     schedule_idle+0x1e/0x40
     cpu_startup_entry+0x24/0x30
     start_secondary+0xf3/0x100

  With the series, 6 boots of 240 s (about 1M attempts) showed no
  stuck forced idle and no oops.

- Bare metal, Intel Xeon Platinum 8375C, 128 CPUs, 2 threads per core.
  The same churn on 32 SMT pairs for 300 s, counting a stall when the
  yielding task makes no progress for 5 ms: 41 stalls in 123036
  attempts without the series, 0 in 109745 with it. dmesg clean on
  both, forced idle counters still increasing.

- Builds with SCHED_CORE on and off, SCHEDSTATS on and off,
  SCHED_CLASS_EXT, PREEMPT_RT, tinyconfig and allnoconfig, W=1 clean
  in kernel/sched/.

- Each patch builds on its own (kernel/sched/ with SCHED_CORE on and
  off, W=1).

I will reply with the test programs.


Ibrahim Elshahed (2):
  sched/core: Clear a stale rq->core_pick after dequeue
  sched/core: Don't skip a pending core-wide pick on idle re-entry

 kernel/sched/core.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

-- 
2.47.3

