Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08B648F004
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101774; cv=none; b=eEIGKnSnUwmmsSWErprpoN/Fif+drf27lquNBID76c12s0aJHsdLU9rDS0MLKl4x/84+h50JokQMl04Nqo1jnWvddCU12OAS0GZreTXs/zu98g26/b+9JbzU8eLcueigTR20oZ+io1yPEI2/6SJATQ5xHd+nm5zBAKAYuCibl1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101774; c=relaxed/simple;
	bh=j/9FWgu4IWQZKkfBfVkfUR1dbqbBKxmSN9z8RaY8oOM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f2YusYuDee248UJEcwoDqHMRbhaP5EXCVN8AHiyEi8YmUkDtF2vH5TCYuGTG4a079TjvZXsVK0negy07PZvM7Hj5FZfA4vQonxNPNPUR4ORWK65P/6utv2YooeU+bYSXQTz813WMhZDEOyZ4uaMf7b1NU6DEqpZOXeRGi75liMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=LquXRh1z; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="LquXRh1z"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76ec395so1778761cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790101771; x=1790706571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AOswCkwwgcwBAO+R2zWSvXVx/mcY+k3pNgoQsE6AHHc=;
        b=LquXRh1z7mZEzO1ozSEvo0/w2EcFhQbGu6Bjz8qvM4WZjoRfE6zyPZpWVzeAHTU9iM
         drIDZxljcz7PWpHxRLfJxrODd/hjZ0J4K+NOOPx5Mj1KiKVp/re2PV3y68EPIwdRGc7w
         Yd/MjonK87WARk9p++r+XG0uCUtPYMyIZnrTbTjAWoe2sc/gJ0rH7sOJpgo4MHa85nu2
         X1OGb98btul3BJ8QMhWOoLNJWghe+ltv9zcr0gYdNcXhIojVJNpawiq3fF+8BAHPJ9JZ
         akadsf6+xO8xHHCOtf6uByqT8OWow7FZ+Ie95n92xEHxBESs/bmTIODyEaeFLRZ8tQoC
         9FNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790101771; x=1790706571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AOswCkwwgcwBAO+R2zWSvXVx/mcY+k3pNgoQsE6AHHc=;
        b=HervTLYb3PBy+Oq9872RSN0z+iuiWl3MYZfzmB3Crqtf7TPEBkqAJ/3Y53nzZCRX69
         SeRa+GyE7/pLbAI710MS2q7yQwhT+wbM/ofF93YmZ07DHtkTUeoma8EzNJaiRVc8B7iM
         EHrnXGzW5dVjU5QfD4w39g3YkuWGNtVrgALNgghI26ZR7lIkOoakD97hn05RHWyejL0z
         XZNKaYgvCj5ylORxH3zu6OMSNU8Bf2yVxvI2+Uyfx3LU871DH+1O3aVxI1gaU0WDxnMC
         b8OiKL7gf9ypVAXwlOeaiUgcU4sXVroj9d9z69iKUQ8PtMldx8DLcHno6gEHB3pJtmCD
         4qFQ==
X-Gm-Message-State: AFuF++lcWh0PxbDQzoZ+sDg3C6+lSGXBtiuR5oow1Qre9wTaX7qSdGe9
	mO1MUcUh9eYOLFyvP0bpGW0e+kEyYJ9M1sN5K3jyScXTuCOnEUaaaL2Wdxw1NfGcUvQ=
X-Gm-Gg: AYBFou3VyoUcHbgIO00G/qziRP21cm14srjJeoXO5Pw0MNT640K0ihKGbFIioORLviq
	iKh1ZleAyqJYhgPgt3y4CvL1046AACoGw0Rum+beKkaQF/qZbXj0yA4mfGOuWMHAeMugVNOe6sb
	UUgKNk/KgvFUUCd+R+EZzqfq6cy29Nb9aGJ8/gNwBoHUZyj6ezN5KNw99JgsKV38iPYgo+MIE/8
	+fYsM1pnTDuvaoSiWskNmdB+qwDWabnPlH7Kd1AzuVtczSW+D2/lx6Eps9HbTK2LuksEw0KHOBC
	pJ0/mPKXEW09oCglhoE/721T6jRNyn5JPFrTdy/rbp9aAGKXonVPSCwWt5oFmU5ygepd+19a9LH
	pdcY2I5wbwtORrCKtxDNUp7olA1tYAc1fpb0yFbbGs1EclMAbWU5WdlWxqrnBhaWb08/4le07uz
	04cq++gH6lEUkng7ChahMyqlltrp2crkYdtKmOCMO/oGDnxu9u30QNzmYzVQ0dXY877ctlr/gLq
	yS7kpVLRZPNYWtfQilG5iocJ+A4idxYctWWUGmnwfTpa2DDQfsntJRemqHsuWPoapbmhLD7
X-Received: by 2002:a05:620a:2993:b0:93b:d7a3:45cc with SMTP id af79cd13be357-93c251f453amr37224085a.53.1790101771541;
        Tue, 22 Sep 2026 11:29:31 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c24889ac9sm37130085a.27.2026.09.22.11.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:29:31 -0700 (PDT)
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
	hannes@cmpxchg.org,
	shy828301@gmail.com,
	raghavendra.kt@amd.com
Subject: [PATCH v3 0/7] sched/numa: stop VMA scan filters from gating promotion
Date: Tue, 22 Sep 2026 14:29:21 -0400
Message-ID: <20260922182928.2199090-1-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NUMA balancing uses hinting faults for both task placement and
memory-tier promotion. Several filters designed to avoid unproductive
socket-placement faults also prevent promotion.

In a production deployment using kernel.numa_balancing=2 on a host
with 768 GB of DRAM and 256 GB of CXL memory running two ~430 GB
database workloads with large shmem VMAs - we discovered poor NUMA
balancing behavior:

Before patch series:
  - 150-200 GB/s DRAM bandwidth
  - 40-45 GB/s CXL bandwidth, saturating the device
  - request latency above 5 ms with longer tails

After patch series:
  - 250+ GB/s sustained DRAM bandwidth
  - approximately 5-10 GB/s sustained CXL bandwidth
  - request latency between 800 us and 2 ms

The core issue is that the global balancing mode says which mechanisms
are enabled, but it cannot describe the intent of an individual
VMA/PTE walk (placement vs promotion).

This plumbs the scan reasoning into the prot_none injection while
retaining the placement-scan filtering.

Patches 1-5 form the backportable fix set:

  1. Add promotion-only NUMA protection walks and derive private VMA
     state in the folio eligibility check.
  2. Permit eligible shared folios to be promoted to a fast tier and
     name the lower-tier predicate according to its use.
  3. Scan mappings covered by the legacy file placement filter using
     promotion-only scans.
  4. Separate VMA placement eligibility from partial-scan continuation.
  5. Scan PID-inactive VMAs for promotion and account for placement scans
     separately.

Patch 4 and 5 are technically part of the same fix, but are separated to
make it easier to review - they must be backported together.

Patches 6-7 are independently requested cleanups.

  6. Use BIT() for the change_protection() flags.
  7. Use the VMA flag API in the touched NUMA-balancing code.

Gregory Price (Meta) (7):
  mm: support promotion-only NUMA hinting scans
  mm: allow shared folios to be promoted to a fast tier
  sched/numa: scan read-only file mappings in tiering mode
  sched/numa: separate VMA placement from scan continuation
  sched/numa: scan PID-inactive VMAs for promotion
  mm: use BIT() for change_protection() flags
  mm: use VMA flag helpers in NUMA balancing

 include/linux/mm.h       | 23 +++++-----
 include/linux/mm_types.h | 10 +++++
 kernel/sched/fair.c      | 95 ++++++++++++++++++++++++++++------------
 mm/huge_memory.c         |  3 +-
 mm/internal.h            |  6 +--
 mm/memory-tiers.c        |  9 ++--
 mm/memory.c              |  2 +-
 mm/mempolicy.c           | 37 +++++++++-------
 mm/migrate.c             | 14 ++++--
 mm/mprotect.c            |  7 +--
 10 files changed, 133 insertions(+), 73 deletions(-)

-- 
2.53.0-Meta

base-commit: 8d29b5365d528da545c1fe0768a55babadee95d0

