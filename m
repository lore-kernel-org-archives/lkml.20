Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E55440E8D7
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 19:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791400084; cv=none; b=tAdeFTFKNXW0DQXYXfLIcOWk3Ldy0HauEu+v4B1kayVtLMj27dpmwke3vWTaDiBgNs0wt+QQ2SP1YZtVXWKRZ78yEJ1RM9b/wpRWODipoKEEHiQZfO1P3SULF/a7a2PXFUxMzlCkAz75ECjAb/ozQ56BXPQxndmPLIPP/d+QEcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791400084; c=relaxed/simple;
	bh=uh8JA1H9/jfpcvetjt9JHjeo0bOWMTIhWfx+KOoFI0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Au0MNz5Y9FjfVePuTim0e0U/iWijuTl8zye9WTu4D6h+L4Kp2SRuEqonPr0wvvSFtBj++6RIBqkpmPBERI0IDPw6kOmQ2yglwsMOz9Pwy1xIWPB79Sxo0rHQVRxZHpiXBn4UyKEaswciU13c8XlUv9kDc5muhwEj2eFxHWAeV+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IcsdSmG+; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IcsdSmG+"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-988c90ee9e8so725050241.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 12:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791400082; x=1792004882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rus/aaQtfqxW/kOzxONv3suVIcIuM8ehKkz4oCrtyBA=;
        b=IcsdSmG+Slp3o0WZHh5j1Ns9MXAqTmZllzrSq9IkaE27QG40E5SO/1Q6O0lIMumvOO
         RvF0qNW2OBmt0PU76Wz4TwlzHxg1yxP4L+/iNAfGaV4xp8k+zaDpemx5rJCkW3YWApKq
         vw9O8UYStW5sGlQ93wZBcyiSuW3jYH1xvcDnI6E5RA+m4eLtxsujuJZGEID87rdiE6p2
         tu6t8rKaZI7crjg3CRBbI7q76QGIZ3S+KQhpbm3gRNTSr1wI/r0yKAtghRl8ky8iAb4r
         vj/D5Y1x8FEYao4kP2knaUzsLnlYIcQShatKtUdQ44S77qP0cT1bqF8YYN6eD76ZXp1j
         Kzdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791400082; x=1792004882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rus/aaQtfqxW/kOzxONv3suVIcIuM8ehKkz4oCrtyBA=;
        b=HNT0GXFrwmx0nJbbZ87fe7vRvIwoPV0qj1uxOiKoJDCTlKHksJ/tR98bp6SPRRbnUs
         vS+RfJsYJ9S3NUR9VPWOzxVa1DDeL+GVRnN43yUdk1p9WatdnZXYijmHtFxhcQ70TBjz
         9YJ3iZrCmTSHkIFOeoDPsS0WZnSKobY9V3BH+7ZBMFitjrTCECJx0PqfVHAr1iUesulJ
         16iAAXwvvFn5N0xGMLKhkbzXfpeW+em88YLnD+W3/ScPK+YBEwmiFwlDRvIIxd7PUozG
         KFcjPF4tzO1Nkv994Lo93BGrNtgHctrpaCIyFzEBYtHymagT7zs8YdhtBuacN5vHZgy+
         Klqw==
X-Forwarded-Encrypted: i=1; AKwUvBxcI3qaHSEYVojr+ik9X0tO3VyBqx40WAxthysOzSG7/Ig/5wdeTROKp/FEchEdX5Gg4uaUbZpzN0+b0p4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlw6DjjACkOVRL0NluexBK/wIXJetdGn48gEVgRqtJP6NrkhA7
	lU5In/z2k4kuSZPGqC9jtS2JP9ybacuBbsLuvecD87S9Znox0T2/t+R/
X-Gm-Gg: AYBFou1PwGmD9WtY3AYf3wSuabkkCutTIaRPtGN0y9m7f2QGbTgKreCiqa8Bm1MPoTb
	9UPr2rK8G1JEwkM+qwwjk9fvbJzGZv6JBDOKlZ9QO/p3Gd2vLad2qsllpTONE2YWQ3AFlwsYskn
	rwGMl5NH+wlhHZ624dP1bHxOpKFl2KE2U2wgLKu4wgBQdmGNsqiCHhwhBfDEjaBysGyJvGaFxjv
	Y2w5+XWga2iIOCOuw7xqfJPLr9cW9LyFnLzqcDzpdoDk3pUQ4X7Rp6uErc++DJxdFtVY8nMNWCX
	JfU/WO0l6KtrSOVUta99YySe1oy3G3QjfBO0UdYMsqhfRkK87QZHQGoSpWfhYnGO/C8JAWGhPng
	rpvwNgdrChEY+xvTQTiu8ynux5pTPlfQ2B3bhLzELOjlt13gH0uO+/+6uJ21Qf8WJzbvvwbguJo
	vSaWogp617tdR5CdmXnVKCyM4JzGm/b6LvpF4hIpz70O112dAulRzIoaNFwM01pkQrkvwf2dROr
	4OSnkhuT99JS9oNWK4=
X-Received: by 2002:a05:6102:418c:b0:7c3:2401:c4be with SMTP id ada2fe7eead31-7ca38b448cbmr781417137.14.1791400081998;
        Wed, 07 Oct 2026 12:08:01 -0700 (PDT)
Received: from emedev.tailf75c28.ts.net ([74.244.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ca218138c6sm2456787137.12.2026.10.07.12.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 12:08:01 -0700 (PDT)
From: Emerson Busson <emersonbusson@gmail.com>
To: mhklinux@outlook.com
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v2 0/14] hv: vmbus: make rings and host-visible buffers survive buddy fragmentation
Date: Wed,  7 Oct 2026 16:07:38 -0300
Message-ID: <20261007190752.336426-1-emersonbusson@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series moves VMBus ring backing to the chunk allocator and keeps the
allocation, GPADL ownership, and mapping references together. It preserves
the exported four-argument interfaces while allowing the private allocation
paths to carry ownership and sharing policy.

A review of the original vzalloc fallback noted that CCA and TDX guests
without a paravisor need direct-map page transitions. This revision uses
contiguous chunks for buffers that must be host-shared, transitions each
page through page_address(), and combines the chunks with vmap(). Ordinary
guest-private buffers retain vzalloc-style allocation.

Allocation and compatibility
----------------------------

Every ring allocation uses the chunk allocator. Ordinary guests and buffers
kept private by channel policy use vzalloc(). For host-shared buffers in an
encrypted or isolated guest, the allocator uses contiguous chunks and
transitions them page by page. Guest-memory encryption is selected
independently of Hyper-V isolation.

Ring consumers select co_ring_buffer. External buffers and the legacy
allocator select co_external_memory. The exported allocator and caller-
decrypted GPADL prototypes retain four arguments throughout all fourteen
patches. UIO migration follows its release support.

The address, page and chunk arrays, and embedded GPADL belong to one buffer.
The allocation extent, host-described GPADL extent, and retained allocation
extent remain distinct. Interior GPADL duplication preserves the existing
exported interfaces. Prepared owned buffers avoid repeat decryption, and
HV_GPADL_BUFFER_DECRYPTED is removed.

Lifetime and host acknowledgement
---------------------------------

A host rescind alone does not prove GPADL revocation. For a known-live GPADL
whose channel identifier is still held, teardown posts a request and waits
for a matching GPADL_TORNDOWN message before clearing ownership. Synthetic
rescind notification cannot replace this acknowledgement. Unknown creates,
local removal, invalid identifiers, failed posting, and timeouts retain
ownership.

Waiter removal shares the response-list lock with matching replies so a late
acknowledgement cannot use a freed waiter. Released owners retain pages
across mapping references and failed page-state restoration. Reclaimer
shutdown cancels pending timers under the owner lock and requeues only work
that was actually canceled; running callbacks drain through workqueue
destruction without re-executing freed embedded work.

Sysfs mappings install no vm_ops and release the bridge pin on every setup
outcome. UIO mappings hold their pin through VMA close. Page, count, and
protection snapshots share the owner-lock boundary. New tests call the real
sysfs wrapper, insert actual PTEs, and check readable bytes and page
references through success and partial -EBUSY. They do not execute a full
kernfs syscall or full device destruction.

The final four fixes use vzalloc() for guest-private requestor arrays and
bitmaps, kvzalloc_obj() for guest-private RNDIS descriptors, handle NULL
control requests on empty NetVSC completions, and use kvzalloc_obj()/kvfree()
for the large guest-private NetVSC device object.

Qualification on the exact fourteen-patch series
------------------------------------------------

The code mails are pinned by series/SHA256SUMS. Applying all fourteen to
93f51579e7df248780214094418f205253383cc5 produces source tree
e6fe523ca92ce30ea7edb265b8a26bf20a867c47.

The VMBus workflow builds x86_64 and arm64 with W=1 and C=2, passes sparse,
and passes all 69 linked x86_64 QEMU KUnit cases. The distinct WSL backport
passes all 26 of its KUnit cases. CoCo source invariants pass on both
architectures; these are necessary static checks, not confidential-hardware
qualification.

Exact-source Hyper-V runtime, including controlled host rescind:
https://github.com/emersonbusson/WSL2-Linux-Kernel/actions/runs/37650468077

On both windows-2025 and windows-latest, the candidate passes 100 bind/unbind
cycles, bounded buddy fragmentation, channel rebind, UIO mapping teardown,
and the controlled host-origin NIC removal. Each report records
HYPERV_DRILL_HOST_RESCIND status=PASS, target_absent=yes,
matching_events=1. Both report zero splats and faults, restore the measured
kernel settings, and return lifecycle map accounting to the settled operational
baseline. Captured owner accounting reports 722 created, zero unobserved
creates, 715 reclaimed, and seven still active; active owners are not
classified as leaks. Trace capture has no overruns or dropped events, and
the disposable VM, VHD, and switch cleanup passes.

The baseline is an intentional negative control. It reproduces the expected
fragmented-allocation failure without guest faults; the workflow accepts
that exact signature as a passing control. It is not a candidate result.

WSL backport runtime matrix:
https://github.com/emersonbusson/WSL2-Linux-Kernel/actions/runs/37645708153

That separate backport passes the actual Windows candidate matrix. Each
runner completes 64 commands with matching teardown acknowledgements,
zero unacknowledged requests, no backing or tail growth, and all six
shutdown checks. The shutdown retry path is covered by 40 local parser and
refusal regressions; the live candidate runs required zero retries. These
results qualify the WSL backport's measured ordinary behavior, not the
mainline mail series.

Qualification limits
--------------------

The Hyper-V runtime uses the ordinary x86_64 vzalloc path. It does not
execute confidential chunk transitions. Full memory saturation, the
chunked CoCo fallback on hardware, SEV-SNP, TDX without a paravisor, Arm
CCA, and complete VMBus module unload and retained-owner destruction remain
unqualified. The exact mainline series has not been installed or booted on
the daily WSL host; the installed kernel and Windows WSL matrix are a separate
backport. The baseline is one intentional fragmentation negative control,
not a matched same-configuration diagnostic-count comparison for every patch.
No confidential-platform result is inferred from ordinary Hyper-V or static
checks.

---
Emerson Busson (14):
  hv: vmbus: convert ring backing through the chunk allocator
  hv: vmbus: validate chunk buffer allocation and cleanup
  uio: hv_generic: describe buffers for owned allocation
  hv: vmbus: add KUnit tests for GPADL post failure injection
  hv: vmbus: add KUnit test for order-zero allocation fallback
  hv: vmbus: cover all shared-page policy combinations
  hv: vmbus: distinguish host rescind from local channel unload
  hv: vmbus: retain backing until ownership and references clear
  hv: use owned VMBus buffers in NetVSC and UIO
  hv: vmbus: pin buffer pages across UIO mmap to close the reclaim race
  hv: vmbus: vmalloc requestor metadata
  hv: netvsc: allocate RNDIS request descriptors with kvzalloc_obj()
  hv: netvsc: handle a NULL request address on empty completions
  hv: netvsc: use kvzalloc for device state
