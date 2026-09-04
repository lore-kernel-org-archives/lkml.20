Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FE6511231
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 18:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788546019; cv=none; b=AiMkhGRTGXu7sDjCZb2vvGZmfAO2HCd0AbfIWagSte6RDLU7OTcVYBTEme+Bdn0lXxehE8jKc0kv/szLEn1dOtin16GwOTE3JM8CnXncRNiLiHvPQenH34pyB8jKPtdtCnnPJNIQ7KNGraFH/QFBpNQWSKve1mL+HNaHLJVR1d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788546019; c=relaxed/simple;
	bh=d2NCExlfP/h2C8234YBmgoaVvL1y1L3WCe77vhIYyDg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EflPVBhr9G0z5mTCs4L0DlfPx6FHsFi8CncUNbKdHWVbcgJP4wl/M6lzy/xzh5axdBqQ4358+hfGzBMBdVtgKQeIxvHl3ohqqwVD8QdBElyRXfHV2EEphJMsEnPsrnRgLCFKTbzT5LmgRkHlGTvyiov5CA6uMQl0GPHc7ouacXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=s1uUw3kt; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="s1uUw3kt"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-92e99ef0902so110873085a.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 11:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788546016; x=1789150816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=15/euYVzQb+bVm46MuDTQD81/N6uJc5AIVkvvPF4JRU=;
        b=s1uUw3kt9ASWTY1jalbIsunJnAq0/L85ROnRpq7LZbGlvF3xsJQKgW5wY+wZAvf4Y3
         ldNo2s4vCsS8CBu6Eb405ccuoyK6DdLNcCD8AXEIK6RlqxVMmydliF8XFhhCehOH4wML
         bJDxpLqX/ENxMUckIdZf8+0P3wY5bMvGKeNdHTQUv+00t9SCF2OIgdylmXQVWXytsJkf
         ti1soM08HX5V9jzwHRyNkn8AvAcwA8EWP70IsKdm0K0i3drTwT8V4rwjtE2upxvXdGKJ
         hWo3dn7Mj/YE7+PVFtMeGiKSZA0NQyPacvBB2EfvAtAUIpSCWNdh+oWkPMCpMXi+VgpM
         EPyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788546016; x=1789150816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=15/euYVzQb+bVm46MuDTQD81/N6uJc5AIVkvvPF4JRU=;
        b=NMyXwp+MqnnzOXbUjDTJV1YcbrqAurEIh4m2j2oEzzBrCOAUQAH2XLzsFiodYDoNEA
         cTIr9sGY1ZMFPb3O6xE1+aQR1rilt50hU6jgU4CrXKnTINsmjJ4jQGPnSMI5UsoaVMuN
         Lv95SwrFGVJqq6ifZwyqR0NYO3CYjMVKVW65n6NFrOoNRom2kMsQ8LILwsYWdGq+fJVl
         M0dVLK9m1Sx+SQ55unNeaDyYjyWw+hns6FWH9w/EXUe+izf/OmO8LWUByYJSDL0fAbqK
         bxl6vHUptZY48TogqVf7Mg9WytpdtfBau7poLNoG4+gxjPhSsYgWrkTYyccAxWMv7HMQ
         nbbQ==
X-Gm-Message-State: AFuF++nc3mQP2FoZQRjlYZNFUcR56ZZGiyQnYD01EzWtmhissd32AlLe
	FFJ7EYmk81DyTS1UCJKY/dL3BQde1IZLWJHOZ+0uMsKEMLcwZyfaEkaJRBlGCJ3cWtc=
X-Gm-Gg: AYBFou0kloWX6VpM4qULWnJTqxEr3rkNo6zWk43ieFpYvhcZI6fZ73X/rhxI5erUkaH
	Y4WCr50yrwWxv2JP4+JM94cd/5sOkKV6YMNxH75KDWMs4eGfet4TZXDrOtdU2E9OkGPFHpgzcQt
	bznDTxBNeZXvODxWLaGxOEzK3JyCyB+4wPepNkf4YpLOsaXLG53PDGTONzSp3motjp1ww/nfPT6
	+sHvynJSWit3uWazzSG0CcxNMM/OmQT9Y1Ybm0tUR3VPovbQY38qiiha/eSTMeZc+RHS4YVa7Tl
	PbovBpXtkVpeoI169PsyUANHjl9vbC+o/eQRiw7u60j3MypJRWzXUl+8PQkHEGRFuCNoQYUp0QG
	8AgC3UjCL1wy1FyBtR/z/ByHubUsJZuLNcvcsssOcrHSAXZCJRHHwOSdHo4r73Cl6gnHWo1UxNE
	YlDt20cW5vZEZUgnKqYksjIKZ4X39xXGs9BoP05SPNAqVmZPN3gUNtiOmSjzCKY7Gcf+v/xLDwp
	hezz2CJSGf2xDEHkeIxgfz9CTiwlyO6up2XYkORtOVu2KXYAQ==
X-Received: by 2002:a05:620a:3c13:b0:939:69a:4764 with SMTP id af79cd13be357-939804a4503mr516368085a.39.1788546016090;
        Fri, 04 Sep 2026 11:20:16 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93982db6a95sm207374585a.9.2026.09.04.11.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 11:20:15 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	raghavendra.kt@amd.com,
	shy828301@gmail.com,
	baolin.wang@linux.alibaba.com,
	osalvador@suse.de
Subject: [PATCH 0/2] sched/numa: stop VMA scan filters from gating promotion
Date: Fri,  4 Sep 2026 14:20:04 -0400
Message-ID: <20260904182006.1562449-1-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

task_numa_work() applies a series of VMA-level filters before it will mark
a VMA for hint faults.  Those filters were written when the hint fault was
a socket-residency signal. Skipping a VMA only cost some resolution.

Under memory tiering the hint fault is not a signal, it is the mechanism.
A folio on the slow tier is considered for promotion only because the scan
marked it and something then touched it.  A VMA excluded from the scan is
excluded from promotion, and stays excluded, because the filters take
their input from faults the scan itself produces.

Patch 1 covers the per-VMA PID filter, which is self-referential: a VMA
needs a hint fault to earn a scan, and a scan to produce a hint fault.

Patch 2 covers the read-only file mapping exclusion, whose premise:
"if we are never going to migrate the page, it is overhead for no gain"
only applies to socket-residency, not tier-residency.

Neither patch removes a filter.

Patch 1 adds vma->numab_state->slow_only, which restricts one scan of one
VMA to folios on non-toptier nodes, and scans the rejected VMAs under it.

Patch 2 reuses it.  A toptier folio is never marked anywhere the filters
would not already have marked it, in any mode, so placement behaviour is
unchanged and only promotion candidates are added.

On a 768G DRAM + 256G CXL host running two ~430G database services:

  before - DRAM bandwidth decayed from 200GB/s to 150GB/s, CXL climbed
           from 5GB/s to 45GB/s and capped, request latency went from
           800us to 5ms and tracked CXL bandwidth

  after  - DRAM holds 200-250GB/s, CXL holds 7-10GB/s, request latency
           sits at 800us-2ms and tracks request load

Gregory Price (2):
  sched/numa: do not let the per-VMA PID filter gate promotion
  sched/numa: scan read-only file mappings in tiering mode

 include/linux/mm_types.h |  7 +++++++
 kernel/sched/fair.c      | 41 ++++++++++++++++++++++++++++++++++------
 mm/mempolicy.c           |  9 +++++----
 3 files changed, 47 insertions(+), 10 deletions(-)

-- 
2.55.0

