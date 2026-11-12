Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794524347;
	b=Dg59pnsyziXqBGCB9Yn+C7+H72/lPIKBFSQqVOvusth2oI6xwD/n2Fpov3eeWIF98MxX
	 yXxSI0UBTsT9pF22T6Xg7neLGTfYaciUZDzvKw4c1m1hS49wQwDB7rp9zC0YUEdquaZpw
	 MR6o0mi1OeSGqt3sycNVzjj9Nn4474H6sBBHigzRAurZiCaoJQKlsrgPxoW+SbmfDs4Xl
	 /kQCKOywmdoPu/P51H0RBUjFv9NibvDyNnZYEYdJWFL0HTgSCCmFgvQmi/6rpoK2LEDWS
	 7gpFjXzG0X5HFLOujQVuHinztsL4Pj31LxDei2YgxJYoIGOPjmlpsZgZsVsFSJprUOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794524347;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=blshDriFn5UbMDKS3q3Vd5jruWnlAyFKn7ja3qEeVzY=;
	b=UqA2ldCa1ODt+P4uLj/avW60Bd+4PAR17uU2dW6Y7pGXfirmYwwM7NXHvDE3rVl8Bbcs
	 VFOiAcCXY2Mfrn3Rbmjp5JFRHzuVw1qCi/oAF0kl3JckI3l+mA3PswBvMKDnsBsH+PBxd
	 VpgAG0yF7/Tyd/qYNP9xDvJhDLD591aWol3miC18GRgpOfJdSGY2QxNvrM4toFfK6wKz7
	 FfM5lW/pJWVXkOFdcGu+8JAH272waDt8xVni2/hpK65ppg/9YTnQl0xO95IicltphGu54
	 GSbTf54sPreEWoclLHIkuAwigHxavAWeSmIhzTGCBGkarqJBUcrtyLXctsVtyYPZsbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDE4606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DDE4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67c6f1019a3so446602d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:59:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524346; x=1795129146;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=blshDriFn5UbMDKS3q3Vd5jruWnlAyFKn7ja3qEeVzY=;
        b=d2QmMoPPs3iR1gSebB+Jk8Eb7OPm1eFEdcqsqDTD7S/1oolv1+reRXNax/BTlFk3H5
         wgf4xcJOJgeoky4/Q8htqVoc4iLdfc5W1h9nhX3ONv2IvVKZsOvYGrZXfrbS7by679D+
         7cTmHKy5njCEkHdRqokZMKlk5KevpW7mWdwG0zD8UQL01MLQsDlODE6WnMetg4Tia9YZ
         Am4LEBsV0t6sLtZn2WMEU7yVhMTK638Q6hgWFZBgXiqzaiSjCQnfoYZWJzn1XYBsJHwu
         0EPEFin7JYAbrqq5dIlbO7iyps2QuHqhay8//k+qJ4H0MwGWMF9yXKCxkHtoEPn1q0ji
         owYw==
X-Forwarded-Encrypted: i=1; AL+hErFYfR15Y/SeqdPWLyDT7Mfa49MK2BRrVxG5qUyJfKTeIW/0UI8bf7rW7mLcLhILIfhKFm4T2opsKyDunjM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9e2+DwMmfkkMkVxFk3NisqShUDEHIoWlIPLYNcgYu/QiynOkwc
	XTZVRQn2uTf3cvF6G2ep28oKQgLbZPPQTBd/QYUFZj5+Ng/mVNvAe1l1
X-Gm-Gg: AYBFou20jdHuk47a70o7NToL7DNry9gdFfW7yfY3oUBneZ1aDs+qneSADh2YNk7KCz2
	DC9BBEBYsdKpKgVEOr42DXaV6cWNrBy2O/JN9FZqw8J0wiACtrlUzaUB1FMlid7PCRU5ZdI68bf
	mZ3d/BVbxQmMgMcjcjc01ZYdZ5eQj1+UBjZW+Jy9nQcE4ygtYFH9GuHetzLVaUbKm1GHSRXpzm5
	VpHV5Lgp7UeOP5xazuVP7FqYR1MeGlb9g1FhR7Q10SDd+BG546dL5xeYWNMe6Ge1GIGSVmC+euE
	YhJEDUXVRU4vD9xv5dsAyOdxnVbHce5DCOMCWWRa1KUprzA4oNdp/9VV0haKPn5q5jnrcbpoQyG
	bGEFaxm1TICy2AZzN/Pm4Ev6XHrMRSSK1yoj/NrUUtRCopZyb1PXMaET2wUeChq9ufaIsLg4Ctg
	5e+5uOIHGvLYp967Sv2XL1NGfD7LM8JSh+VqTxSrbytD4A+3ZfoPvHi/AOGHsRx7e9wrkPoJQrY
	GhCSGvT27nJyj81idpiBhmXnsxRKQnoDDIbMfDatTfI7MZgnoOXR4tW5qVBTwXlXOKk6EqZ4PRV
	b0x0YDrb/KbZ7knM923bJobOsKWRdck++MUBiEWl4TS7CPNSeOi3icARkcPukeJCE4DThK7MmMD
	F7U8O6NU1izDvgJGipFZICiEWi41jgFN2E36tV4TwcjPQRwY+y3rON/bBc0K413OnpR0lebjiNm
	K37XJPiZU7zKOg5LWJySnFEvNn
X-Received: by 2002:a05:690e:12c7:b0:67c:4b6e:1119 with SMTP id 956f58d0204a3-67d89738ccbmr443575d50.128.1794524346057;
        Thu, 12 Nov 2026 14:59:06 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa8f354asm7261077b3.14.2026.11.12.14.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 14:59:05 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Subject: [PATCH RFC 00/13] drm/powervr_sgx: Add a DRM driver for PowerVR
 SGX5xx GPUs
Date: Thu, 12 Nov 2026 17:58:50 -0500
Message-Id: <20261112-powervr-sgx-v1-0-c69b84bac011@telaak.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Mj3YL88tSisiLd4vQK3WTDJDPzFNPUtMREIyWgjoKi1LTMCrBp0Up
 Bbs5KsRDB4tKkrNTkEpA5SrW1AOkCaHl0AAAA
X-Change-ID: 20261112-powervr-sgx-c1b67d5efaa2
To: dri-devel@lists.freedesktop.org, 
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: imagination@lists.freedesktop.org, Frank Binns <frank.binns@imgtec.com>, 
 Gabriel Gama <operatingsystemsdepression@gmail.com>, 
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, 
 Philipp Stanner <phasta@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 linux-media@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.16.0

This RFC asks for design review of a render-only DRM driver for the
PowerVR SGX5xx (Series5) GPUs. It is not for merging: the Mesa driver
isn't in Mesa yet, the firmware isn't in linux-firmware, and until each
client has its own parameter buffer it isn't safe to expose to
untrusted clients.

The first platform is the SGX545 of the Intel Atom CE5300 (PCI
8086:089b). The second is Cedarview, where gma500 publishes the SGX as
an auxiliary device (patches 2 and 3). The OMAP3630's SGX530 is there
for bring-up only: it has one memory context, so the driver refuses it
without powervr_sgx.allow_unisolated=1, which drops client isolation and
isn't for general use.

Design
- drm_sched, one job on the GPU at a time; drm_gpuvm, a page directory
  per VM; GEM shmem; explicit sync only. A core table; an unknown core
  is refused before any register write.
- An open microkernel (MIT OR Apache-2.0) [4], loaded only in secure
  mode, where no client maps the firmware's memory.
- Commands are plain structs, checked field by field; uploaded shader
  code is checked instruction by instruction.
- The GPU doesn't snoop: a job lists the imported ranges it touches,
  and the kernel flushes them around it.

Known limits, to fix before a v1:
- One parameter buffer serves every client, so one client's GPU work
  can read and write another's binned geometry.
- Kernel objects and page tables use CPU physical addresses (x86
  without an IOMMU), imports keep the exporter's vmap, and cache flushes
  run uncapped in the fence-signaling path. All three move to the DMA
  API.
- Some firmware words are still written by index or named unk_*.
- Transfer and NULL jobs have no Mesa user, and a client's first
  transfer can fault after another client's transfers.

Userspace is a Gallium driver with a NIR compiler [3]. On this tree, a
2,146-case sample of dEQP-GLES2 on the CE5300 gives the same results as
before the last uAPI revision (2,082 pass, 7 fail, 56 not supported, 1
warning), with no GPU resets; it is a sample, not the full suite.

Questions
1. Imagination said in 2023 that SGX should have its own driver [1].
   Alessio, Luigi: beside drivers/gpu/drm/imagination, or under it?
2. gma500 publishes the SGX as an auxiliary device, as nova-core does
   for nova-drm, and forwards its interrupt through a callback, because
   CE5300 kernels have no gma500 to link against. Gabriel Gama is
   preparing gma500's SGX535 code [2]. Is a separate driver the right
   split?
3. Is cache maintenance in SUBMIT_JOBS, as per-job ranges, acceptable,
   or should it be a BO_SYNC-style ioctl?
4. On x86, shmem flips every map_wc object's pages to write-combined
   and back. Is TTM, cached pages with flushes, or a GFP_WC allocator
   the way?

I maintain this alone for now and would welcome a reviewer.

Most of this series was written using the assistance of an AI coding
assistant, Claude Code (Anthropic), working under my direction over many
sessions: the kernel driver, the open microkernel, the Mesa driver and
most of the documentation. I set the design and the uAPI decisions,
chose what to fix or disclose, and reviewed the changes; before posting,
the series also had an independent automated review whose findings are
fixed or listed above. All the testing described here ran on my own
hardware. I'm responsible for every line and will answer review
questions myself.

Testing: on the CE5300, 7.3.3 kernels with this series plus board
patches outside it: the uAPI, frame, hang, PRIME and unbind tests [5]
and a three-client soak, also under lockdep, KASAN, UBSAN, kmemleak and
DMA-API debugging. Testers ran an earlier version of the import path on
four Cedarview machines; this posting's path isn't retested there.
Suspend is tested with pm_test only. CI applies each patch to
drm-misc-next and runs checkpatch --strict and kernel-doc on it, and gcc
and clang W=1, sparse and smatch on what it builds (the driver builds
from patch 12).

[1] https://lore.kernel.org/r/ccfae572cb6a5ba70eea273e641b66cd7f6fe58b.camel@imgtec.com
[2] https://lore.kernel.org/r/20261109063303.32658-1-operatingsystemsdepression@gmail.com
[3] https://github.com/The1TrueJoe/powervr_sgx/tree/525bdadb0e088bd3f64f0407b8cb0a16c6c03a2d/mesa
[4] https://github.com/The1TrueJoe/powervr_sgx/tree/525bdadb0e088bd3f64f0407b8cb0a16c6c03a2d/ukernel
[5] https://github.com/The1TrueJoe/powervr_sgx/tree/525bdadb0e088bd3f64f0407b8cb0a16c6c03a2d/drm/tests

---
Joseph Telaak (13):
      drm/gem-shmem: Map pages for the DMA device
      drm/gma500: Publish the Cedarview SGX as an auxiliary device
      drm/gma500: Export GEM objects as dma-bufs
      drm/powervr_sgx: Add the uAPI header and its documentation
      drm/powervr_sgx: Add the core table, registers and device bring-up
      drm/powervr_sgx: Load and start the microkernel
      drm/powervr_sgx: Add GEM objects, VMs and dma-buf sharing
      drm/powervr_sgx: Add contexts, the scheduler and SUBMIT_JOBS
      drm/powervr_sgx: Add the client command checks
      drm/powervr_sgx: Add render jobs
      drm/powervr_sgx: Validate shader code in the kernel
      drm/powervr_sgx: Add the DRM driver, power management and debugging
      drm/powervr_sgx: Add KUnit tests

 Documentation/gpu/drivers.rst                      |    1 +
 Documentation/gpu/powervr_sgx/index.rst            |  201 ++++
 Documentation/gpu/powervr_sgx/uapi.rst             |  133 +++
 MAINTAINERS                                        |   11 +
 drivers/gpu/drm/Kconfig                            |    1 +
 drivers/gpu/drm/Makefile                           |    1 +
 drivers/gpu/drm/drm_gem_shmem_helper.c             |    8 +-
 drivers/gpu/drm/gma500/Kconfig                     |    1 +
 drivers/gpu/drm/gma500/Makefile                    |    3 +-
 drivers/gpu/drm/gma500/cdv_device.c                |    5 +
 drivers/gpu/drm/gma500/gem.c                       |  192 +++-
 drivers/gpu/drm/gma500/gem.h                       |    1 +
 drivers/gpu/drm/gma500/psb_drv.c                   |   42 +-
 drivers/gpu/drm/gma500/psb_drv.h                   |   26 +
 drivers/gpu/drm/gma500/psb_irq.c                   |   32 +-
 drivers/gpu/drm/gma500/sgx_aux.c                   |  102 ++
 drivers/gpu/drm/powervr_sgx/Kconfig                |   65 ++
 drivers/gpu/drm/powervr_sgx/Makefile               |   34 +
 drivers/gpu/drm/powervr_sgx/pvrsgx_aux.c           |   83 ++
 drivers/gpu/drm/powervr_sgx/pvrsgx_cache.h         |   66 ++
 drivers/gpu/drm/powervr_sgx/pvrsgx_ccb.c           |  208 ++++
 drivers/gpu/drm/powervr_sgx/pvrsgx_ccb.h           |   52 +
 drivers/gpu/drm/powervr_sgx/pvrsgx_cmd.c           |  234 ++++
 drivers/gpu/drm/powervr_sgx/pvrsgx_cmd.h           |  132 +++
 drivers/gpu/drm/powervr_sgx/pvrsgx_cmd_checks.c    |   62 ++
 drivers/gpu/drm/powervr_sgx/pvrsgx_cmd_checks.h    |   13 +
 drivers/gpu/drm/powervr_sgx/pvrsgx_cmd_defs.c      |  353 ++++++
 drivers/gpu/drm/powervr_sgx/pvrsgx_cmd_defs.h      |   43 +
 drivers/gpu/drm/powervr_sgx/pvrsgx_core.c          |  300 +++++
 drivers/gpu/drm/powervr_sgx/pvrsgx_core.h          |  196 ++++
 drivers/gpu/drm/powervr_sgx/pvrsgx_debugfs.c       |   78 ++
 drivers/gpu/drm/powervr_sgx/pvrsgx_debugfs.h       |   13 +
 drivers/gpu/drm/powervr_sgx/pvrsgx_device.c        |  461 ++++++++
 drivers/gpu/drm/powervr_sgx/pvrsgx_device.h        |  354 ++++++
 drivers/gpu/drm/powervr_sgx/pvrsgx_drv.c           |  378 +++++++
 drivers/gpu/drm/powervr_sgx/pvrsgx_drv.h           |   52 +
 drivers/gpu/drm/powervr_sgx/pvrsgx_dump.c          |  227 ++++
 drivers/gpu/drm/powervr_sgx/pvrsgx_dump.h          |   16 +
 drivers/gpu/drm/powervr_sgx/pvrsgx_fw.c            |  736 ++++++++++++
 drivers/gpu/drm/powervr_sgx/pvrsgx_fw.h            |   77 ++
 drivers/gpu/drm/powervr_sgx/pvrsgx_fwif.h          |  519 +++++++++
 drivers/gpu/drm/powervr_sgx/pvrsgx_gem.c           |  120 ++
 drivers/gpu/drm/powervr_sgx/pvrsgx_gem.h           |   46 +
 drivers/gpu/drm/powervr_sgx/pvrsgx_hw.h            |   55 +
 drivers/gpu/drm/powervr_sgx/pvrsgx_job.c           | 1028 +++++++++++++++++
 drivers/gpu/drm/powervr_sgx/pvrsgx_job.h           |  143 +++
 drivers/gpu/drm/powervr_sgx/pvrsgx_kobj.c          |  285 +++++
 drivers/gpu/drm/powervr_sgx/pvrsgx_kobj.h          |   82 ++
 drivers/gpu/drm/powervr_sgx/pvrsgx_mmu.c           |  281 +++++
 drivers/gpu/drm/powervr_sgx/pvrsgx_mmu.h           |   28 +
 drivers/gpu/drm/powervr_sgx/pvrsgx_of.c            |  119 ++
 drivers/gpu/drm/powervr_sgx/pvrsgx_pds.c           |   97 ++
 drivers/gpu/drm/powervr_sgx/pvrsgx_pds.h           |   37 +
 drivers/gpu/drm/powervr_sgx/pvrsgx_pm.c            |  138 +++
 drivers/gpu/drm/powervr_sgx/pvrsgx_pm.h            |   30 +
 drivers/gpu/drm/powervr_sgx/pvrsgx_prime.c         |  207 ++++
 drivers/gpu/drm/powervr_sgx/pvrsgx_prime.h         |   26 +
 drivers/gpu/drm/powervr_sgx/pvrsgx_regs.h          |   79 ++
 drivers/gpu/drm/powervr_sgx/pvrsgx_render.c        |  957 ++++++++++++++++
 drivers/gpu/drm/powervr_sgx/pvrsgx_render.h        |  122 ++
 drivers/gpu/drm/powervr_sgx/pvrsgx_trace.c         |    5 +
 drivers/gpu/drm/powervr_sgx/pvrsgx_trace.h         |  134 +++
 drivers/gpu/drm/powervr_sgx/pvrsgx_transfer.c      |  175 +++
 drivers/gpu/drm/powervr_sgx/pvrsgx_transfer.h      |   38 +
 drivers/gpu/drm/powervr_sgx/pvrsgx_usse.c          |  240 ++++
 drivers/gpu/drm/powervr_sgx/pvrsgx_usse.h          |   45 +
 drivers/gpu/drm/powervr_sgx/pvrsgx_usse_table.h    |  342 ++++++
 drivers/gpu/drm/powervr_sgx/pvrsgx_validate.c      |  192 ++++
 drivers/gpu/drm/powervr_sgx/pvrsgx_validate.h      |   25 +
 drivers/gpu/drm/powervr_sgx/pvrsgx_vm.c            |  799 +++++++++++++
 drivers/gpu/drm/powervr_sgx/pvrsgx_vm.h            |   69 ++
 drivers/gpu/drm/powervr_sgx/tests/.kunitconfig     |    5 +
 .../gpu/drm/powervr_sgx/tests/pvrsgx_ccb_test.c    |  111 ++
 .../gpu/drm/powervr_sgx/tests/pvrsgx_core_test.c   |  119 ++
 .../drm/powervr_sgx/tests/pvrsgx_equiv_golden.h    |   32 +
 .../gpu/drm/powervr_sgx/tests/pvrsgx_equiv_test.c  |  555 +++++++++
 drivers/gpu/drm/powervr_sgx/tests/pvrsgx_fw_test.c |  168 +++
 .../gpu/drm/powervr_sgx/tests/pvrsgx_kobj_test.c   |  203 ++++
 .../gpu/drm/powervr_sgx/tests/pvrsgx_prime_test.c  |  125 +++
 drivers/gpu/drm/powervr_sgx/tests/pvrsgx_rt_test.c |   63 ++
 .../gpu/drm/powervr_sgx/tests/pvrsgx_usse_test.c   |  145 +++
 .../drm/powervr_sgx/tests/pvrsgx_validate_test.c   |   32 +
 include/drm/gma500_sgx.h                           |   52 +
 include/uapi/drm/powervr_sgx_drm.h                 | 1175 ++++++++++++++++++++
 84 files changed, 14178 insertions(+), 63 deletions(-)
---
base-commit: c88084027d0e922dd925b96e5a0d184ba04a8f43
change-id: 20261112-powervr-sgx-c1b67d5efaa2

Best regards,
--  
Joseph Telaak <joseph@telaak.dev>

