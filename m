Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AC01A6834
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789085915; cv=none; b=RsHEzQ/knx4SVONNGzBGE4oqoHpQXeX4W/QSf2RcxZQEJ+dsihhlugT6/tjT4U7ykFz0pSxAs4larp6r5vhKH7OFSSl3rIKZ/jokVSm4BZSIGstiMByV8FjkBzM/mpcz8xiGLAAg+cC67WjNIi6+gKT3UIewShVkPH5E+tnHPAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789085915; c=relaxed/simple;
	bh=m/TuYBHe/zTMnkPla4dPs8wzRSbeCtws8NC01aZDz00=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RG/zS1TJ2w9Mbj7kGmwV2MZw24mOsT5pMgghzkVvNekSiNs7uFOcxqOK7C+GDwn38Q4/wW1qCsIx+njs5F+J5ZvFGDsLkf37ij0dx5RslxVMEnKI/m1YszJs41ln6XeP/eX3eWUIJ8WGwkhEC76100ADuQc0PZIuvrCKXDlEQmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=sdw2CKTa; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="sdw2CKTa"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-939d917fee3so28975985a.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789085913; x=1789690713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ejo+90E50fXi5k+UdJPEJ6xbgHQPbd1TRBdPlxbvODU=;
        b=sdw2CKTa6TJOkScSIAU4OjRpYs/7Z6XWA2y4ydJ1EMOwEB1srszXUAUBkoOUuXjc07
         5fhEiDWHuDvyFNQ7sS/64wDeTvtQr7jKPZepvje6+QpYkGHT5GrJjmwQ6Ixjhx2tZ+BZ
         6n7xDiligXh3U6EBmK0aC9RYm4yfaPi4om/2t4uShS8g0PVl1lTftISdScJT5aQEcz5n
         39ByesBUnscjjqpM35OcqihiPJA2Uz7x5iuIEnLYsKrr6BpAEC4of0+DGlPqvx6isWrE
         SOZxsQzuqw/lDGnfRtWjzdsMdqdtwXnIvzDguN6MhMHThC2DUrsZd3kNl3hrLmAHYKxM
         Q2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789085913; x=1789690713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ejo+90E50fXi5k+UdJPEJ6xbgHQPbd1TRBdPlxbvODU=;
        b=dcbiXHEixqHqh42ghMzo8j5+PImbFcHsuXvBIm8dmfKL/Jru0grs+JmgB7qSv1aBLN
         A4EohFV9EHCgkXDSMTmJWCPXmAxtgOyHwlHLfvSZGC0mJ9xE+XFvBLHluIn1j4uDJrS8
         aX2mjSWmffUiLwqmbjlM1XdV85IR6Emr8DlTOksATCMEwXidzYkRCnpiAHWfoHosyKpY
         S5X1WxebhmTwHpb1NQDmv0AVlXgm0X4ob6+MYWOcnFsQYW5MBrVrqVIuw26j3GGamCDK
         pHN6/or9Gtk5MBtXYGLjpaE4xyOIQrDJqeqJG8NFCUkTx5caZIL7vg9GB22sBoLAsYPY
         JLzg==
X-Gm-Message-State: AFuF++mrNazeB+kF+8UjNYzzHrI5DAE+9PYHtx2bPvRKxrAXSTLuk0J0
	ik1DqLfMRF6brbv5zHMY7mv8wSJctxEswigo5wnnkTBvlgCbOrIR7/9qy6zPv+hjacc=
X-Gm-Gg: AYBFou1ulUJ8MrOyIxF4XqcubGX23KxMqsv9DJYBkEHlqQqwqGVtnoPFsGUpXkC8mE9
	fI8BLqFChEhGe7JKaKlVo3wTHksQ+MLL+sorT9XAHj/PffUIaEgbtH3ViOh6KRgY406wQkWWIZc
	GsW1C8JclGRLr3QAVNjHyxfSh8ZUH/L/zhhMGYgaLqfeZiUto7r9o5+b9NOG1p9ByR3XMyFRITn
	LKzKj2lb37fsWRF35SwPy4FDEx3ZikFc+qSmg7AFSSCd4QQa3HjV3Ni6fAg6Xa5kFFA539pwdvh
	7rb20Xx1VWzw/QJipQVmUkDuenc+U+x54p6wRtlSVU5n57PibbxvkVbeTSZzX4T9lRuuB0iynR3
	xdKC8RsKQjMpBU73W4nWR+PNijQZwWvmvWNydl+0jURQ4td/9gt1DbY42vi6BEP9BDF93tx4jax
	ql646UxMdTUCUdonWr79rvLicmq4eKhhJNXaQ4g98pAkM5Pyfj573g0dOgEVqdt7MjY9YZMJyzK
	SUk+scQHd4X67Xh+iOU4dG6j5mYPlAWcowMN974B5dD8/1XRTsHVo0DiqY1
X-Received: by 2002:a05:620a:1a22:b0:936:9fd4:e2bf with SMTP id af79cd13be357-939ea189d6dmr225830285a.37.1789085912637;
        Thu, 10 Sep 2026 17:18:32 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e80e4c36sm108896485a.40.2026.09.10.17.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 17:18:32 -0700 (PDT)
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
	baolin.wang@linux.alibaba.com,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	jannh@google.com,
	pfalcato@suse.de,
	osalvador@suse.de,
	hannes@cmpxchg.org,
	raghavendra.kt@amd.com
Subject: [PATCH v2 0/4] sched/numa: stop VMA scan filters from gating promotion
Date: Thu, 10 Sep 2026 20:18:22 -0400
Message-ID: <20260911001826.2109390-1-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NUMA balancing uses hinting faults for both task placement and memory-tier
promotion. Several filters designed to avoid unproductive socket-placement
faults can also prevent promotion.

Read-only file mappings and VMAs without recent PID activity may never be
scanned, while lower MM layers reject some shared folios. Hot memory in
these mappings can therefore remain on a slow tier indefinitely.

Separate promotion-only scans from socket-placement scans.

MM_CP_PROT_NUMA_PROMO_ONLY carries that choice for one protection walk, so
the PTE and PMD paths can restrict hinting faults to promotion candidates.
Keeping this transient state in the protection flags avoids per-mm state and
its associated lifetime, concurrency, and VMA identity problems.

  - Allow eligible shared folios to be promoted to a fast tier.
  - Scan read-only file mappings and PID-inactive VMAs for promotion
    without re-enabling placement sampling.
  - Track the last placement scan separately so promotion-only scans
    cannot postpone the existing placement-starvation fallback.

The series is ordered as follows:

  1. Add promotion-only NUMA protection walks without changing behavior.
  2. Permit eligible shared folios to be promoted to a fast tier.
  3. Scan read-only file mappings using promotion-only scans.
  4. Scan PID-inactive VMAs for promotion and account for placement scans
     separately.

Tested on a host with 768GB/256GB DRAM/CXL.
Ran 2 ~430GB database workloads with large (>300GB) shmem VMAs.

Before change:
  - 150-200GB/s DRAM bandwidth usage
  - 40-45GB/s CXL bandwidth usage (maxed out)
  - request latencies over 5ms (longer tails)

After chage:
  - 250GB/s+ sustained DRAM bandwidth usage
  - ~10GB/s sustained CXL bandwidth usage
  - request latencies 800us-2ms.

Functional observation:
  A 20 GB hash table VMA that previously remained entirely on CXL was
  split evenly between DRAM and CXL after the changes - and tier
  residency tracked hotness.  This was previously affected by the
  stavation issue caused by the "unaccessed VMA" filter.

Gregory Price (Meta) (4):
  mm: support promotion-only NUMA hinting scans
  mm: allow shared folios to be promoted to a fast tier
  sched/numa: scan read-only file mappings in tiering mode
  sched/numa: do not let VMA PID activity gate promotion

 include/linux/mm.h       |  4 ++-
 include/linux/mm_types.h |  7 ++++
 kernel/sched/fair.c      | 72 +++++++++++++++++++++++++++++-----------
 mm/huge_memory.c         |  3 +-
 mm/internal.h            |  5 +--
 mm/mempolicy.c           | 30 +++++++++++------
 mm/migrate.c             |  6 ++--
 mm/mprotect.c            |  4 ++-
 8 files changed, 93 insertions(+), 38 deletions(-)

-- 
2.55.0

