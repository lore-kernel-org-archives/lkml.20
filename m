Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792950022;
	b=qRP9f8RfEO0PfLOs5VFzgZ8OMBxZ6R2N1lMiFDI+Fe4tzSdJYg+8SdeTlpLhomipUXeG
	 8VzPQmcDomId8YE8O1uyXom9c7oAlROF4kntZkqrzyWUD3pcn6AtL2v/eAPYG+VCAXbya
	 mlbBUY7WTbgxKRLpd9pMRB37g4GCIFMkO4W8Fyt1wwHwmTV8Um3stcO1GzKr/r4dgqKz1
	 lf5L3TfyHOyEbqpEMfJPHq6njjpbm3y5wff2WhjQeKTL2+AZ7Lale09wJqeIccT719YHo
	 tvU/+Ly59GqxAxMWMmhHeHYkyFgmG3E3KK2zGOilXyoNnXY48gkUDXy2RHNpVRCwulw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792950022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=h3QApbBlAYhRMvgt4baVTZSCZ7KrzPHAuh9ddC7G5Kg=;
	b=W6RaDZOEpp86e6XASAld4JVhFtgWub+GR+hgNH92Jr8kNM6jsfdpljPbjGTqp+Ud6sEM
	 0U9keDRoBltcZG+sVQg/JFluSvYzF7sEbFjZHXchaHyDop3RCGCt2zTE0fPj1zYM9mp2j
	 kAEO/OYx1YFQZxiDaFLwRJYhR2B9ROav55TiGA6tIUkzsrojyK18iy19c1gb8867CCa+T
	 gggPFQKLSM/jCwLwGMHqXK2vN+OPuFsyncnSnUTgWv/YkBfbXAZveeePhHG7hKoN/5qy6
	 yJtndsBE9Prrwg3lNFHSNqwm4c3bDaB8PgE9cadz920YWmyqMAdMWGNwjeuJtZ5Z+1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=HJ4fE0hW;
	arc=none smtp.remote-ip=209.85.221.170
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3369F606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3369F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=HJ4fE0hW
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5ec3561ad43so23919e0c.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 10:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792950020; x=1793554820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h3QApbBlAYhRMvgt4baVTZSCZ7KrzPHAuh9ddC7G5Kg=;
        b=HJ4fE0hWm0GPzGiTRdzgiJWmIZSHIcVLcYLfo94QFpMgVa7XLpQTlZA8sJxUoeLtIZ
         RVya7NksaNAOC9Jk0CuRFPf0FXq4Ipib2epkgBlnOAWcQAt5yr5vwIUGtp7Liw0nUyNX
         jlelfpk+IBf0YGaVB33YFSVkKxnw1dWC35D2oLrc+b76Jq3f5NSDQ83KQbjfWaUQeWhX
         KJftkkmHeVBashFCTu6evCal59cAFA8MHdZOMyegmqy8jgRLe8fNBz6uP1dgtEmOWFo3
         8aURPUnmjefvPlEaTdB27h1dUYta9gHfKwYyUPd7EyZieSzqsBSGqCplVc387hVin7Wy
         R65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792950020; x=1793554820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=h3QApbBlAYhRMvgt4baVTZSCZ7KrzPHAuh9ddC7G5Kg=;
        b=QgVidPzC9rsFSXp9y4JCKzR4POG8BYdBpsSy6tY2Y200w6Ta8dKYrYK13WWZ9ZeOSA
         +OPs8+GgdLndR5Kr00lkMJMSgfGurbiTL++17335v5X6vaGPR6doZ+Y0q2E82v5CLNY7
         hypzVeoUXZNbvqvPmF75zS6QTEzTUh93mlsS4lOYbhQ4uH2JnbJ+MRrYpHyZknhN6A+Y
         mJ+IO6VbzAQ0s70sswTUnyp8irKTimGwKUfUGhWqianhEkfAoxpdFph63ieK0WYAuKnc
         sWYqGBXeP5zg00+WRJxogGag9HG4HS48pr+4iBpovPErBjly1zCRQbUHQDJKtf4dYHcn
         jTmQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhc4eQXLZJSONgIJYMNpw/aHueSM0rTWrvrP+Nh/Q5fLTYdFeDdzvIYWgYcSkdxs7qeVkxT/D5VWxIVlI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4dT9Q/h6RGPA7deh8XHe9pQc8Jjuc+tmbOqwk5eZa7Bf1UM1h
	+VKRp/qreq5+JZH2xf0cjU32tE9V0OZxKtk6oEWXjutQ7RGrei6+cp1q9R2SvZz3YCA=
X-Gm-Gg: AYBFou2FWAE0/ZW45n/4I35ZUDYudvPif5ikO13ikPThDYVzornnJfr3+w+LQNvlsko
	xpInVDbpb0v5769a8deBLf/Hi3CV1G7dTcKFZhBAYZAG2SVBoSJVG5+wHxG00twcxINwGeJpVnr
	im5EMBGHeMYWvgY5gE6eNlISI7M5MAkkFj67KUk2Tyl79zauahMIIwCGr16dIA1St34dOHG7Q1S
	0u4sEqnT15dOY3tv5jeV/25D2Ph7VpLK2Jp35rlpxPqr2se2jA7ciBfd8dVX9JHI4bwnMZkAB7U
	APucL/BhUCjW66iEtZlZQ+iYS7yIwn9LU2MePIK7DlHzoq+aDUAYOkOh+DIB0L8zsmlUx4aG952
	qK1ogZJ+qfc9ENZlAToaleO2CjKZ+0hnE3DZnQtdmtj/qFnTzDRW6zl6dIGyiZWOLz0Ur+XkMjZ
	cOyqxha1AwQIYCm9ofhnheAYB04RhYOqfKhN7N1DPTwa+P03utK+uYY2NvokU0ysdAyl30wc96c
	uV+DGPdKjVUXcOhYxtR5gpCs4CzzTt6RVhf/wLDMOfjdGeLq8z8BNMvEa6irnfJ+AtJjBgLJI2o
	6lIeONlgFTzLYJXAtBC3FxGQHBpSWlpUY89AY4vWM0Gs3XIggFKNUcd3IGQhDeeu63DcSEdYv+N
	V
X-Received: by 2002:a05:6122:4893:b0:5ea:c45f:6c4d with SMTP id 71dfb90a1353d-5ec23326819mr1425104e0c.22.1792950020005;
        Sun, 25 Oct 2026 10:40:20 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec234673ebsm5783333e0c.13.2026.10.25.10.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 10:40:19 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	kuba@kernel.org,
	enelsonmoore@gmail.com,
	bp@alien8.de,
	shuah@kernel.org,
	david@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	vbabka@kernel.org,
	dapeng1.mi@linux.intel.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	surenb@google.com,
	pasha.tatashin@soleen.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org,
	elver@google.com,
	graf@amazon.com,
	lirongqing@baidu.com,
	liam@infradead.org,
	jlayton@kernel.org
Subject: [PATCH v2 0/9] kho: add read-only Kexec Handover mode
Date: Sun, 25 Oct 2026 13:40:07 -0400
Message-ID: <20261025174017.3870481-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
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

This series introduces a read-only Kexec Handover mode, enabled at boot
via 'kho_ro=<pa>' pointing to the physical address of the KHO FDT.

In standard KHO, the outgoing kernel shuts down or serializes all
devices into LUO state, releases machine control, and passes the KHO
FDT physical address through the kexec_file_load() reboot path to the
next kernel, which becomes the sole "Machine Owner" (MO), initializes
struct pages for preserved folios during early boot, and reclaims KHO
metadata and preserved pages back into the page allocator as they are
restored.

In the "Linux Caretaker" (LC) model (as well as inspection kernels or
firmware), a minimal LC kernel runs concurrently on dedicated CPUs
offlined from the MO scheduler while MO is still active or undergoing a
standard KHO-preserved kexec reboot (Live Update). LC is given
read-only access to KHO so a minimal VMM inside LC can keep VMs
responsive (<30ms VM blackout time) by servicing software-only, fully
virtualized devices (such as virtio-console, pvpanic, virtio-rng, etc.)
that do not require host hardware interrupts or global machine state,
while leaving the preserved KHO tree intact for the incoming MO kernel
to retrieve normally once it boots.

LC is never MO: it has no PCI support, does not handle device
interrupts, and is booted inside a small LUO-preserved memfd region
(e.g., ~128MB of RAM on a host with terabytes of memory). Because LC's
direct map only covers its own small memory footprint (both for
isolation and to avoid struct page overhead for host memory), the KHO
FDT, radix tree, and preserved memory all reside outside of LC's direct
map. Furthermore, because LC is configured and launched from userspace
while MO is still running rather than through a kexec reboot handoff
from a shutting-down kernel, userspace reads the KHO FDT physical
address from /sys/kernel/debug/kho/out/fdt_phys and explicitly passes
'kho_ro=<pa>' on LC's kernel command line.

Both CONFIG_KEXEC_HANDOVER and CONFIG_KEXEC_HANDOVER_READONLY can be
compiled into the same kernel image, with the active mode selected at
boot via the kernel command line ('kho=on' vs 'kho_ro=<pa>'; passing
'kho_ro=<pa>' disables regular KHO).

Overview of the series:
- Patch 1 exposes the physical address of the outgoing KHO FDT via
  /sys/kernel/debug/kho/out/fdt_phys so userspace tooling can pass it
  to a 'kho_ro=<pa>' kernel.
- Patch 2 moves the shared radix-tree key encoding, indexing, leaf
  lookup (kho_radix_find_leaf()), FDT validation, and
  kho_retrieve_subtree() helpers into a shared
  kernel/liveupdate/kexec_handover_common.c compilation unit with
  declarations in kernel/liveupdate/kexec_handover_internal.h, while
  also checking that fdt_totalsize(fdt) does not exceed PAGE_SIZE in
  kho_check_fdt() and using get_unaligned() for 64-bit FDT property
  reads in kho_retrieve_subtree().
- Patch 3 hardens kho_restore_vmalloc() and factors out shared vmalloc
  helpers by introducing kho_vmalloc_validate() and kho_vmalloc_walk()
  in kernel/liveupdate/kexec_handover_common.c to validate the
  preservation metadata header and walk the chunk list.
- Patch 4 avoids modifying ser->next and bs->head_pa in kho_block_add()
  and kho_block_set_shrink_one() when operating on an incoming block
  set, as the chain is already linked and incoming blocks must not be
  modified in KHO read-only mode.
- Patch 5 adds CONFIG_KEXEC_HANDOVER_READONLY and
  kernel/liveupdate/kexec_handover_ro.c. When booted with
  'kho_ro=<pa>', the KHO FDT is mapped and validated once in an
  early_initcall, and radix-tree nodes, leaves, and folio/vmalloc
  mappings are cached on first visit in a unified RCU-protected hash
  table for the lifetime of the read-only KHO kernel, providing
  kho_is_ro(), kho_ro_lookup_folio_order(), kho_ro_map_folio(), and
  kho_ro_map_vmalloc().
- Patch 6 wires read-only KHO mode into KHO core (kho_populate(),
  kho_memory_init(), and kho_retrieve_subtree()).
- Patch 7 updates kho_block to map incoming serialized blocks read-only
  via kho_ro_map_folio() in read-only KHO mode.
- Patches 8 and 9 extend test_kho and tools/testing/selftests/kho/vmtest.sh
  to build a single kernel with both CONFIG_KEXEC_HANDOVER=y and
  CONFIG_KEXEC_HANDOVER_READONLY=y and test both standard KHO and
  read-only KHO handover when preserved memory lies outside the boot
  kernel's initial memory range on x86_64 and arm64.

This series is based on liveupdate/next commit 27be83a12b24 ("Merge
branch 'lu-pci-preservation' into next").

Changelog:
v2:
- Expand the cover letter with the LC architecture, explaining why
  'kho_ro=<pa>' takes the FDT physical address on the command line and
  describing the expected users of the read-only KHO APIs (Suggested by
  Mike Rapoport).
- Patch 2 (Suggested by Mike Rapoport):
  - Move the shared radix-tree, FDT, and subtree retrieval helpers into
    a dedicated kernel/liveupdate/kexec_handover_common.c file instead
    of static inline functions in
    kernel/liveupdate/kexec_handover_internal.h, and factor out
    kho_radix_find_leaf() for radix leaf lookup.
  - Check that fdt_totalsize(fdt) does not exceed PAGE_SIZE in
    kho_check_fdt(), drop the "setup: " log prefix from FDT validation
    warnings, and use get_unaligned() when reading 64-bit FDT properties
    in kho_retrieve_subtree().
- Patch 3:
  - Move kho_flags_to_vmalloc() to kexec_handover_common.c alongside
    kho_vmalloc_validate() and add a shared kho_vmalloc_walk() chunk
    walker used by both kho_restore_vmalloc() and kho_ro_map_vmalloc().
- Patches 5 and 6:
  - Allow CONFIG_KEXEC_HANDOVER and CONFIG_KEXEC_HANDOVER_READONLY to be
    compiled into the same kernel image and select the active mode via
    the kernel command line ('kho_ro=<pa>' forces regular KHO disabled).
  - Split the KHO core integration (kho_populate(), kho_memory_init(),
    and kho_retrieve_subtree()) into a separate patch (Patch 6) so
    Patch 5 only introduces the read-only KHO backend.
  - Map and validate the KHO FDT and preserved-memory-map root once in
    an early_initcall so kho_ro_get_fdt() and kho_retrieve_subtree() do
    not sleep or map lazily.
  - Replace kho_ro_restore_vmalloc() (which allocated RAM and copied
    pages) with kho_ro_map_vmalloc() to map preserved kho_vmalloc
    regions read-only in place using kho_vmalloc_walk().
  - Cache radix-tree node, leaf, folio, and vmalloc mappings in a
    unified RCU-protected hash table (kho_ro_map_ht) keyed by address,
    size, and protection for the lifetime of the read-only KHO kernel,
    and drop kho_ro_unmap().
- Patch 9:
  - Build the kernel and initrd only once in vmtest.sh with both
    CONFIG_KEXEC_HANDOVER=y and CONFIG_KEXEC_HANDOVER_READONLY=y
    enabled, running both the standard KHO test and the read-only KHO
    test on the same kernel image.
Link: https://lore.kernel.org/all/20261019021111.990394-1-pasha.tatashin@soleen.com/ # v1

Pasha Tatashin (9):
  kho: expose physical address of outgoing FDT
  kho: move radix tree and FDT helpers to common file
  kho: validate preservation metadata in kho_restore_vmalloc()
  kho: do not modify incoming serialized blocks
  kho: add read-only Kexec Handover mode
  kho: support read-only KHO mode in KHO core
  kho: support read-only KHO mode in kho_block
  kho: test: support read-only KHO mode in test_kho
  selftests: kho: add read-only KHO test to vmtest.sh

 .../admin-guide/kernel-parameters.txt         |   8 +
 Documentation/admin-guide/mm/kho.rst          |   3 +
 Documentation/core-api/kho/index.rst          |   6 +
 include/linux/kexec_handover.h                |  44 +-
 kernel/liveupdate/Kconfig                     |  10 +
 kernel/liveupdate/Makefile                    |   3 +-
 kernel/liveupdate/kexec_handover.c            | 284 +++---------
 kernel/liveupdate/kexec_handover_common.c     | 298 ++++++++++++
 kernel/liveupdate/kexec_handover_debugfs.c    |  22 +-
 kernel/liveupdate/kexec_handover_internal.h   |  47 +-
 kernel/liveupdate/kexec_handover_ro.c         | 429 ++++++++++++++++++
 kernel/liveupdate/kho_block.c                 |  78 +++-
 lib/Kconfig.debug                             |   2 +-
 lib/test_kho.c                                |  71 ++-
 tools/testing/selftests/kho/arm64.conf        |   1 +
 tools/testing/selftests/kho/init.c            |  38 +-
 tools/testing/selftests/kho/vmtest.sh         |  65 ++-
 tools/testing/selftests/kho/x86.conf          |   1 +
 18 files changed, 1121 insertions(+), 289 deletions(-)
 create mode 100644 kernel/liveupdate/kexec_handover_common.c
 create mode 100644 kernel/liveupdate/kexec_handover_ro.c


base-commit: 27be83a12b246b6b3783e7d3ac5c378ff7520f25
-- 
2.56.0.307.g5fe7bd680c-goog

