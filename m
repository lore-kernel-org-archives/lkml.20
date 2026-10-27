Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116843;
	b=nPqH6w13qqufSEq19d5Ld3ptzbVTbi5XN3QduTbV7OpONlsp3IlnwCTPCY0mYWPgC8Tr
	 wfmn2XoqiPcHjeWjJ3Kb6kM9vFTb3M7uOBpHSsLB0YrMjJ+4W3mbrRx3BHyvhY4iRD0+S
	 vYWr2rMP9vnGB1+MHfKHE98Z4os9yXu7Eq5a2xjLmWPXosBcD4FUWJgiZ9BT08ngM8Opg
	 +mKW6Xdit6jazmnoq8wPgHPGtSFdhFhT1crsMjAufScM22DptGvgLQny7Jy61PimKX/MD
	 C77VfdVeXIw1unhf1oEHqCQdsekhHunQfLE14o8gbXV+O0ngGjijmBpXE/e7YhaMzvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=lUFPvWUhnbq1nlKdj+4iPr3v7FCFuq1r2DJKFXSbd2o=;
	b=ZNxOB+rCv2p0Y0+MdB1MfhVKX2Vc/gMr0HariagfmqOQPcY00DGOUG2uDwbrV1P7fVNw
	 JimpRR+xHoDfARs1DigaHWI40vr5vsbpbtLdgmAAqBfglXHM9GwtjljjiCrgkz/YojkIR
	 b4qx9m8PAyw8qbAcecl+pc8lT6IVhBlUTbt0/lsUcTjydK7dcntKOYvkSpt5tLna90mvF
	 AV0RH/2qAFtL6vEKL3HAVdKojjbDr99HJWFGRg1y5FyXsD2/4xki49wZppNTKJwAYSZcm
	 VdjJv3Qf7SnoS1xNYs9cdfBkTOCzBO6joi0myYYymSJNGfOLuzi0fv+DiF5UQOpNn+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UP4I+lit;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7305B606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7305B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UP4I+lit
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso28348635ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793116842; x=1793721642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lUFPvWUhnbq1nlKdj+4iPr3v7FCFuq1r2DJKFXSbd2o=;
        b=UP4I+lity2OJEUV3qsO7bHkzdbX35UzOsi9Z1qCPcLXNwsd3PIO15GMKJGPsJSKswz
         +8swA9mTq4HBrCHMrOoXwpfrfddCukMbyU+XJWL2farluTgk1ZO9u+SKEThV2MTNTTGD
         mr7imid/fvgWdKEMEcCPeAaQgoV1RoKsx7Z7F5rqlS/5zaHOSF0rjchIJLLImzuoGPju
         2SuLSLfDJ3yh+GVnVYcm+jv9CUjc6kvadeQ7GO2PUbxh/Ylp+zntQTvFXC2+RBN3PkdW
         r8SYMwqTC5OnUm7aTTZOG33G+owpRGu3Zm6PERP2xmdnnCCLsd/d9St/EjfWn2AnQnMa
         XZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116842; x=1793721642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lUFPvWUhnbq1nlKdj+4iPr3v7FCFuq1r2DJKFXSbd2o=;
        b=UmhFUxnDSecDKTasv5+wIj9uHVus3YTMFJbN51ey9fjlaGP8yK2loKNtCpHf+OrEEk
         1rfRU+N3cCOuxd4Li7W0sFUDea9JiU4IRD6MORNeIAsQNx7e6RABCiGzdIHHdx4ZZH7h
         97Rfrb3oSBAhbSj4tybQwV+WPNvQDjrs9tfRGKPW0Vi6IHkQDE9I+u0HYnP6P0dKwxNZ
         b+T0K4avOpaV8ybXyEiXVZD5uwr2KxfzsWTdnubPm+3yLCBBlOhece5LfGNf0tLfEnS5
         Mb0KBuxfh9biXphF3vD3bGmsDfShWnA0eM5cER/QWsJNwpkdqLtPfbqv5LaGjwZZubBS
         TpiQ==
X-Gm-Message-State: AFq9FYIpGx33ZoSgGUZM8J6DOHMw9qSdE5nma3gvMfnFjGTUwCCTqd22
	aHKKNTfraCPSr/6qbYxgRKa2EQvNwFKZZYKN/zp7upJKOEqixRXw902g
X-Gm-Gg: AYBFou36z5Kgqt5H7Pewz6nQWbM6i0hci6m214xwyG9r1SlpqWnhBHtFe5wRb+2Nrl7
	HR/HcNOIXVNYJ7z9xjSjdz9MdnK5CeoL1471x2igexkELwrWbXjaafbHfnmJmt7AUmPADtRQ7uA
	AAziv5COQ3RcAwMmP4bFdK4N0UkyV46NoK7QC9hhbq82R0uLMBS8kFA/r4BFZqvdPfou0MB8xmn
	2mZxxNXgxZI7Be6BnJfeHgfxGSgqWVz+L2YKV99+wUtftTjKvWzKTRMVmNhaMNLash/9PvCPHgd
	FNUmGjTXX0dSGpfKIGtjHhUruC1DdyKXdnUiXX44Vl19NDac1tON1X+t/I5rS36fsUy8Bx70B0w
	IxZFFgXM7Qe+bxwyxv30ODQPtS/eI29nRGPQmEbFSBCpSKp4n3WzTMyG8Y+dR8ogr+4tbixePY8
	YKp8qYSkipbZMKlE99fn5wT6ruCgUr7jBN9QXmIxFjL2C2Ng9JL7EhvAkwDphihNTywLqUy0lWD
	EpxqT4IMsniC1D7NQFo+122fQv4leHbtjiwqXdFMTVcfWfQFkYevjZTtcbReXBbrJlkfOVxNMpg
	WiAyNQZa5b58O/wGLOo5YHFX+ADGCJ/0tA89GbfU6hg/++AmMhRZgEpy27x1M1tXNdmi
X-Received: by 2002:a17:90b:528c:b0:3a0:e4ce:31fd with SMTP id 98e67ed59e1d1-3adead444ecmr8771470a91.10.1793116841476;
        Tue, 27 Oct 2026 09:00:41 -0700 (PDT)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae4064f4bdsm4334209a91.11.2026.10.27.09.00.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 09:00:40 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	chrisl@kernel.org,
	nphamcs@gmail.com,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com,
	shikemeng@huaweicloud.com,
	kasong@tencent.com,
	linjh22s@gmail.com,
	kunwu.chan@linux.dev,
	kees@kernel.org,
	gustavoars@kernel.org,
	tglx@kernel.org,
	linux-hardening@vger.kernel.org
Subject: [RFC PATCH v3 00/18] mm/swap: introduce priority queues for swap device allocation
Date: Tue, 27 Oct 2026 23:58:40 +0800
Message-ID: <cover.1793106426.git.lianux.mm@gmail.com>
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

Hi all,

This is v3 of Kairui's swap priority queue RFC [1, 2], retaining the
original authorship. It separates device selection from device-local
cluster allocation to support integration with the ongoing swap tier
work, while preserving existing swap priorities, the swapon interface,
and memcg swap accounting and limits.

The global per-CPU cluster cache couples device choice to cluster
locality. Moving that cache below device selection gives each device its
own allocation hints. The available plist's shared rotation is then
replaced by a priority-ordered array of same-priority device rings, with
per-CPU starting offsets and quotas. A task-local cursor keeps each retry
walk stable. Rotational devices retain per-device sequential hints shared
across CPUs.

This remains an RFC. I would appreciate feedback on the allocation model
and its integration with the ongoing swap tier work.

Following v1, the changes address related allocation problems:

1) A cache above device selection couples the chosen device to the cached
   cluster. Device-local ownership lets selection determine the eligible
   device before consulting its hints, which is useful for tiering.

2) Rotating the available plist changes shared state under
   swap_avail_lock. Per-CPU readers keep rotation state off that shared
   selection path, with a quota measured in base pages.

3) Device rotation was tied to cluster draining and the fast/slow split.
   Selecting a device first also lets allocation handle its pending
   discard directly, with a bounded amount of synchronous work.

The series is organized as follows:

  01-04: Cleanup, device-state boundaries and iteration helpers.
  05-07: Locking, writer-serialized publication and accounting.
  08:    Restore per-device per-CPU cluster locality.
  09:    Keep cluster metadata population out of direct reclaim.
  10-11: Introduce the safely published queue and remove the avail plist.
  12:    Bound synchronous discard to one cluster per device attempt.
  13-14: Preserve priority-aware throttle selection while removing the
         active plist and unused plist_requeue API.
  15-18: Reuse reader capacity, advance cursors directly, bypass singleton
         rotation and redistribute reader phases on membership changes.

Test results
============
The kernel-build and BRD tests follow the v1 workloads on a newer
baseline. The results below compare the unpatched baseline 4dbe24720eb3
with queue revision db66c58fac8f. The additional usemem and lock-call
results compare the same baseline with 18ec4b962755. These are
measurements of the named revisions; this posting contains revision
fdfe5fac0d5b.

Eight-ZRAM kernel build
----------------------
The workload used eight 8-GiB ZRAM devices and make -j96 in 2-GiB and
3-GiB memcgs. Each case had 12 fresh-output builds per revision, with no
warm-up. The workload source was fixed at 4dbe, using x86 defconfig and
the targets bzImage modules. The revisions ran on separate boots, Before
first; the 12 samples are within-boot repeats.

Mean system CPU time in seconds (lower is better):

                         Before       Queue (db66)       delta
  2-GiB memcg          4469.0100          4457.1575       -0.27%
  3-GiB memcg          2352.7325          2338.9325       -0.59%

Mean elapsed time changed from 170.1283 to 170.3675 s (+0.14%) at 2 GiB
and from 136.6125 to 136.6775 s (+0.05%) at 3 GiB. No clear regression
was observed in these kernel-build runs.

Twelve-BRD usemem
----------------
The same Before/db66 pair used twelve 8-GiB BRD devices and a private
memcg with 24 GiB of memory and 64 GiB of swap allowance.

  usemem --init-time -O -y -x -n 32 1536M

There was one complete invocation per revision. Mapped throughput below
is the requested 48 GiB divided by elapsed time, in MiB/s.

                         Before       Queue (db66)       delta
  elapsed time (s)          7.00                7.11       +1.57%
  mapped MiB/s           7021.71             6913.08       -1.55%

All 50 kernel-build and BRD invocations exited successfully, reported no
memcg OOM events and performed swap I/O.

Additional eight-ZRAM usemem and lock-call measurements
-----------------------------------------------------
A separate experiment used eight 8-GiB equal-priority ZRAM devices and
the same usemem command, with memory.max=24 GiB, memory.swap.max=64 GiB
and memory.zswap.max=0 in the workload's memcg. Both kernels ran on the
same x86-64 host with configs differing only in LOCALVERSION. There was
one workload timing run per revision, with no warm-up, on separate boots,
18ec first.

                         Before       Queue (18ec)       delta
  elapsed time (s)          7.97                8.59       +7.78%
  system CPU time (s)     175.13              192.39       +9.86%
  pswpout (pages)      6,317,548           6,317,684         +136

Both runs exited successfully and completed 32 workers, with no memcg
OOM events. The times increased in this single-sample comparison; the
cause has not been established.

Separate sampled runs recorded 12,451 swap_avail_lock acquisitions at
the selected allocation callsites in Before. Source and binary inspection
confirmed that these calls are absent from the 18ec allocation reader
path. Availability-update callsites recorded zero acquisitions during
both sampled workload windows. This shows removal of the shared
selection-lock calls, rather than an end-to-end speedup.

Current revision checks
-----------------------
All 18 patches in fdfe replay to their expected intermediate trees and
pass checkpatch. Static review and userspace checks of the actual helper
code with ASan/UBSan cover publication, ownership, rollback, selector
progression and throttle priority selection. These checks use userspace
shims and do not constitute kernel runtime testing.

Cooperation with swap tiers
==========================
Device-local cluster hints remain below device selection, so a future
tier policy can determine the eligible candidates before those hints are
used.

V1 proposed taking tiering first and rebasing this queue onto it as an
optimization [1]. I am happy to follow that route. Another option, if
reviewers agree, is to take the refactoring under the existing swap
priority model first, then work with Youngjun on adapting the queue and
reader scope to the tier infrastructure [3].

Youngjun, which ordering would fit your current work better? Are there
constraints we should preserve to make a later rebase straightforward?

The integration should have one authority for device membership,
swapon/swapoff publication and lifetime. Tier policy would determine the
eligible candidates before any device-local hint is used. Within-tier
priority semantics need agreement with that work; this series adds no
tier ABI or per-memcg device-selection control.

Link: https://lore.kernel.org/all/20260714-swap-pcp-priq-v1-0-de9b164ed419@tencent.com/ [1]
Link: https://lore.kernel.org/all/20260829-swap-pcp-priq-v2-resend-0-68d3d925578c@gmail.com/ [2]
Link: https://lore.kernel.org/all/20260916183437.2946306-1-youngjun.park@lge.com/ [3]

---
Changes in v3:
- Serialize file/ref/writable publication when removing swapon_mutex.
- Establish metadata and writer allocation safety at their first use.
- Preserve priority-aware blkcg throttling when removing the active list.
- Add reader-capacity reuse, direct cursor advancement, singleton
  selection and membership redistribution.
- Present the completed ZRAM/BRD results with their tested revisions and
  sample counts, including the observed time increases.
- Add measurements of shared selection-lock calls.

---
Kairui Song (12):
  mm/swap: remove unused parameter for reading swap header
  mm/swap: slightly cleanup the code for hibernation error handling
  mm/swap: cleanup and document swap device availability flag usage
  mm/swap: introduce swap device iteration helper
  mm/swap: change the swapon lock into a percpu rwsem
  mm/swap: serialize swap publication before removing swapon mutex
  mm/swap: consolidate swap inuse accounting helpers
  mm/swap: add priority queue for swap device allocation
  mm/swap: remove available list
  mm/swap: bound synchronous discard during allocation
  mm/swap: drop swap active plist
  lib/plist.c: remove requeue function

Lian Wang (5):
  mm/swap: avoid direct reclaim when populating swap cluster metadata
  mm/swap: reuse per-CPU queue readers across priority changes
  mm/swap: advance the global queue cursor directly between priority
    rings
  mm/swap: skip reader rotation for single-device priority rings
  mm/swap: redistribute queue readers after membership changes

Youngjun Park (1):
  mm/swap: change back to use each swap device's percpu cluster

 include/linux/plist.h |    2 -
 include/linux/swap.h  |   43 +-
 lib/plist.c           |   64 --
 mm/swap.h             |   12 +-
 mm/swapfile.c         | 1421 ++++++++++++++++++++++++++---------------
 5 files changed, 926 insertions(+), 616 deletions(-)
---
base-commit: 4dbe24720eb3811563cd56b35d87ddf3f9beed2a

Best regards,
-- 
Lian Wang <lianux.mm@gmail.com>
