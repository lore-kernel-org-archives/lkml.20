Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622759;
	b=a9e2pAD+awv8MZQTpQKlIm9HLjKlerxwzR2q4wn3+lOO3XDLc+a0ATNfnb+ckgNPIBwP
	 6XVE5suwZyw4edVUDGYMXy5QxMF0LQcJYp66QQtWUGxYQmehbjrKxY4QqK69e0SlFeank
	 Kg5AbcHPStSqjeXsF+xgx1Qlta0i3U91/8vLYfqfSR4TuztKawG/puoyWdiAU6ME96wId
	 ihSFmf7ao3NMRJpr0PuxtGS/u7/rqQzUNFbIEsECSa1FPzAMb53PpuUUkcqc6K3m7/hEd
	 cCf/k3lalddet26Gu1RlNmFoGO7LqTLUSKHiFbr9IZSd1SG8r6qJEuTKpz8cSV2I2gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622759;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=MbVB6oIt2gPR9RHYbN6eNZPOxVT7qQgbn8Ano4EsPmY=;
	b=2oz4KFA3MNA3kLLmPZiGDg9OPQ1aT3qzw7IEwBQAGouo8NsQxL5Pmavqj1EZXKXHrFPe
	 wao1LJQ99jGnvDcgb8wX2PKW0O5xf57TV/N4yQASF5MhljC3ZtPIsYEwIRYa0LqKclKqF
	 Xe75KuBhUbaJxGc7CMOjqEwgW9uE1Ajlt51jky1aTSHWikZSWO/b++6P4rnJ8rK9ZoaUE
	 MWPPn8Usf2qxskaXRpBUgScBPGjO2RhbDPzE61miDkmV7dbE3J+7chEfiJD5cr3G1r9Nl
	 6/pLM/ROSz6iaOSWO7zgYsZos2dPFa1k8NHJAINe55AeWjCnMkEZEmojOdUR3Yf4X5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=korea.io;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C0D60A2602
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:32:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27C0D60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.io
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2eac4877accso9719745ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:32:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793622758; x=1794227558;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MbVB6oIt2gPR9RHYbN6eNZPOxVT7qQgbn8Ano4EsPmY=;
        b=u/ZafxU0AYyTjPzpVpYOrz8Kp5Hp69WQzbbFrXMDo7nLlkQlz2Y22xpD2kzuAm7jo2
         KeqK4UYEW/P4lfLd9T5oj5gadtBdgbZRml2sGgQmYCrwHBhNvz7WDcDaJZGrxJAVTNMX
         GVHiGOfROVRw1zt1JbHXDDUcYakE/cc0ED2czXUZcbFnjxy+TLiaia4Po8qEz6wLoCnO
         9O02QCXblXvTFXLLlYsvxiMbB+tX4oH9hhscwlcq0d0Fm4KR+23yAr6VJBVWprMt0/mJ
         ngIG6f0UjEfLc+Kk/MvmqmIpjxYXOht4XACcpRwmKTzVQa9qHoKXoj96WQWgCOkB6+u/
         HfPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTQ9S57uSpUj7/BcsD6pwR21gacb+KP1lxnUkGzxxTMc0j1lioK++lDtdLSmPx29Q2uE/WjBhMfvj3khg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dzpnNKdY/mRzaRx7pyQadaiBJ/3Y1z/jsQWGz3eFztgQIn+jQ
	uQ4EtNJIHzJaRTdHaFM136008kaRnPrM5FavUcQRYPdh/m6hD0oBQNkG95xwk8isJ95d
X-Gm-Gg: AYBFou2tavioOnmjSQYem0iZBCEl/Pp1L7GhjOjJYPK7fYbHHLMWMlTDvW89la0G4h+
	GJMU+ofD0yExTExI8kEVI3hLcoZvK003bAO9EMcRCy+FmUXGlt+dpD8M+cvMfwfxUtZICSgyGJL
	1Jwm2LTTf9MTd7Ryzx5l/Y/fxOR/k8d9B7+0IIObbB/BZsBbOXJiljpreFy1pz0K+jyCAJYcTWy
	xOoUkSJupVhXYiNABhg9TqYmE7c2a2zKDEDHglL7xJed5ZaSui71aXmQOYqk5g/EaglLGYgm2nC
	K0U2hMXtIHy9CrP39DtU3mxbmL6cF9RO6z4XdoFUvr6E5rApj470Bw9w36VAW7lF8LBzMw9NGx1
	S6rq2DPWuBkIQRWZIbNOyyg4cauZZccOGvgbNyYiMf2FCkV4cDeFnghw4UI2T9EzcavIEMo1qKA
	mxiwoBwx6z1zTuRz14OCnXyUidsFRzaKJa8bMd7iOOhlHH0fgbbwxk2FtwZLMs8qrZl+CQ7gj2V
	PU6HkkVsoDor0p8qkCPEKMOWcnUwaJWJT/usDmZ3KMa/dB+9DOkp+Fo0Yt1YpHny7vJlSYFhTcO
	q3fDNH4CW1jn2TIi8NseOg7RJXnKzR0iegXznZRYlifPUoDuICGbxENKfaDgFkfZBjYMG4BZoSx
	cqKdE7eZMlAKNz+SylncP/02NifCSElHCEd57drE=
X-Received: by 2002:a17:903:185:b0:2dd:ad73:5b6c with SMTP id d9443c01a7336-2eb364ae847mr91835595ad.28.1793622758280;
        Mon, 02 Nov 2026 04:32:38 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([118.217.70.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392492fbsm27101845ad.32.2026.11.02.04.32.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2026 04:32:37 -0800 (PST)
From: Jongwon Lee <ai@linux.com>
To: Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jic23@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dan Williams <djbw@kernel.org>
Cc: Ira Weiny <iweiny@kernel.org>, Li Ming <ming.li@zohomail.com>,
 Richard Cheng <icheng@nvidia.com>, linux-cxl@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] cxl/edac: Fix event record lookups for memory repair
Date: Mon, 02 Nov 2026 21:32:33 +0900
Message-ID: <20261102123233.74598-1-ai@linux.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Patch 1 fixes a use-after-free between the repair path and the event
path. Sashiko's review of v2 pointed out that the repair path reads
cached DRAM event records with no lock that keeps the event path from
freeing them [1]. The race was already there in cxl_find_rec_dram() and
cxl_mem_perform_sparing(). Patch 1 does the DRAM lookup under the xarray
lock and copies the matching record out for the sparing path.

Patch 2 is the DPA flag masking fix from v2. It also does the General
Media lookup under the same lock, since v2 added a read of that record.

I used xa_lock() instead of RCU freeing. The cached records are copies
of the spec-defined event structures, so kfree_rcu() would need a
wrapper struct with an rcu_head, and the lookups only compare a few
fields. Taking device_lock() in the repair path, as the event path does,
looked like it could deadlock against unbind, where the EDAC sysfs
files are removed with device_lock() held.

Changes in v4:
- Patch 1: copy the whole struct cxl_event_dram out instead of only
  validity_flags (Richard Cheng)
- Patch 2: make cxl_rec_key() and cxl_rec_not_repairable() static
  inline (Richard Cheng)
- Cover letter: describe patch 1 first (Richard Cheng)

Changes in v3:
- New patch 1 for the record lifetime race (Sashiko)
- Patch 2: General Media lookup under the xarray lock, returns bool

Changes in v2:
- Moved the Claude Code note below the --- (Dave Jiang)

v3: https://lore.kernel.org/r/20261101013418.87326-1-ai@linux.com
v2: https://lore.kernel.org/r/20261031161121.15948-1-ai@linux.com
v1: https://lore.kernel.org/r/20261030072721.31970-1-ai@linux.com

Testing, QEMU master (b574eaf) with a CXL type 3 device and a committed
region, on top of d89e1d186e. Debug options: KASAN, PROVE_LOCKING,
PROVE_RAW_LOCK_NESTING, PROVE_RCU, DEBUG_ATOMIC_SLEEP, DEBUG_LIST,
UBSAN_BOUNDS, KMEMLEAK, hung task and soft lockup detection, booted with
preempt=full.

- Repair table: DRAM events at 0x1001, 0x2000 and 0x3002 and General
  Media events at 0x5001 and 0x6002, then a repair request on all five
  mem_repair devices for eight DPAs. With v4, 0x1000 and 0x2000 succeed
  for all five repair types and 0x5000 succeeds for PPR only. 0x3000
  and 0x6000 (NOT_REPAIRABLE set), 0x7000 (no record), 0x1001 and
  0x3002 are rejected with -EINVAL. Unpatched, 0x1000 and the PPR
  request at 0x5000 fail, and 0x1001 and 0x3002 are accepted.
- Race test with a test-only mdelay(20): the host injects DRAM and
  General Media events with no gap, repeating some DPAs so that
  xa_store() replaces and frees records and adding enough distinct
  DPAs to reach the overflow path, while four guest loops request
  repairs on all five devices. Unpatched, delay after xa_load() and
  after the lookup in the sparing path: KASAN slab-use-after-free in
  cxl_do_mem_sparing() after 120 s, a 2-byte read of validity_flags in
  a record freed by cxl_store_rec_dram(). v4, delay after both
  xa_load() calls inside the locked section and after the lookup in
  the sparing path: 600 s, 11070 repair requests, 261973 events, no
  report.
- The same race test without the delay: v4 for 1800 s, 56460 repair
  requests and 786023 events; unpatched for 900 s, 24150 repair
  requests and 301280 events. Neither kernel reported anything.
- Unbind test: two repair loops and the event injection as above for
  600 s while a loop unbinds cxl_mem, waits 2 s, binds it and waits
  3 s. v4: 78 unbind/bind cycles, 7248 repair requests, no report,
  mem0 bound at the end.
- kmemleak scan at the end of each run: no unreferenced objects.
- Builds: W=1 after each patch, sparse, clang W=1 for x86_64 and arm64,
  and CONFIG_CXL_EDAC_MEM_REPAIR=n, with no new warnings. The series
  applies to cxl/next (cf15f9f236) and builds there.

This series was developed with Claude Code.

[1] https://lore.kernel.org/r/sashiko-outbox-192042@kernel.org

Jongwon Lee (2):
  cxl/edac: Read cached DRAM event records under the xarray lock
  cxl/edac: Mask DPA flags in the event record cache key

 drivers/cxl/core/edac.c | 115 ++++++++++++++++++++++++++--------------
 1 file changed, 76 insertions(+), 39 deletions(-)


base-commit: cf15f9f2361dd4002203716b7b878393c0eee4bf
-- 
2.55.0

