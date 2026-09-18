Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A620729D281
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789695625; cv=none; b=u1ZBUPqo2IBrtl3Rq3aUpQExN7lzfaNn195MT9HRMLg5sMfhovIR7wTB1/8wkWrHaWY2oSCGo8dbAqSw2cs+Vp3uZ0RyXYwTwvRFMQRnUTQ4M9uaCjBcXqJKQW0TilZneXAyRA/ZryWLysiosVWG9/dq7ak0hHEwctQvMHQ4QbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789695625; c=relaxed/simple;
	bh=ARQUN0lt/sxKO9hR//Y8eDIsdKxKnl1lrOTJ/VZNAis=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BeUUh/CQWTi2bB7dFdAJ6m4PR7EJisMzWkL0WroFNVIAyVW2o6fKQFbjqM8+ZCYwRjctD+/yD7+6+3xP8HWWQUaZ/g5bv44xq60QLMrIbCkIX44i82iBbqzfsMnMa23UmepLf+cwkM5L5zs9mq1yHLqN/AESsT6YQ5Jx2cJqCWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KPUjp0F+; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KPUjp0F+"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-91219376dd6so3528126d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789695622; x=1790300422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xiaWNb/WvWpKBxKejVnMtp1u6saI4NZPdWKC5eTmAw0=;
        b=KPUjp0F+FONntrEGhnmDhjRMf/QUKZneb1WxYntXD2GnvwoIHW4aFpniPUmgJcnQrW
         O5I1j94a9pK4Kwon7QVyVfe2q6rd8CBsiCJw0as0BsLl0t4DGRnH0iX0v4r6lGj5Hs8Z
         Ra0639NmjycVslK/GTbq9+1QYyAuNFVdyDsMXK4ILKcMa8u3sXcoooQYGzYjMXewGfxP
         UWNHf3veVQ0HFeCoKlk6ntxukfB+16pwq2qkvF4estbqP6Y0icRKjwuBApLbHBvjWSg5
         za+xp4QQ7nFirozKTDxvy4BkgFgrHs7TmG7zZjoQ2fkKEHYt/m8k09+oY2kDiWT5R9X7
         yhcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789695622; x=1790300422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xiaWNb/WvWpKBxKejVnMtp1u6saI4NZPdWKC5eTmAw0=;
        b=Sv4rYC/mPppOFhwTUmH6XYrkmW8AN1IYpgnT4PyB45hG+yGEP/fDsAOVT6Jm1NS65H
         ixP59frMdkjYYuLlwTFdGxwnv2N/ExVpoWLYCazn7B2SzRgTW9Amw3LCsIPzGfxvaz2p
         O19/rBJxeFlL0FqR/fllZ1UDMVm6eLytD39q7/32SUYMJVo56jcQmcQAe4gaijRUwILF
         VSxyuQXwJZVIwyY7bG5rCGl6OvPJmrwNea+UU7XH1E7cTFdGU1RhBPia3UuGX4E0nD1w
         Z4PxKDqCt/PKnoNxMBwPqzKJ6tpENGdL3GV1P0WFClAcZbRzXcdvBe6dD2qegDYa8aNd
         Yn7w==
X-Forwarded-Encrypted: i=1; AKwUvBwuNhW23HJAyakQouYlnREIVBwHb2KxWqV5Y0PiPfh/B8rlEbJ54ukM7Ncb/Ovs/jKw8cMAVKmqF8hcyZs=@vger.kernel.org
X-Gm-Message-State: AFuF++mIbLrc3vVtb8+DlMVg2bkMTuZ+rtLSXffNXZ0x4I04kwrzFWZ9
	7ERq8j1RpLIYGiUL6crqtn3IJhfcpBliaYG2hV93yxDPFrOPRj7JhYSZ
X-Gm-Gg: AYBFou0J8LVUEkXkNS0hE4kfCxb5vme4R/w4BLWcveGb2uCf2jOYE3c3fJEeMY5sABP
	vazImj/eazjHCMQbPY6oXGAa1CVuxYT99w9ofoscDNKdhAv1hsrvAu/5cRrEtdztmm8bcJ+7gye
	fNXjV5xCauwxt/2no7IuqzTaqeDn/p9Hix+eqNlsXS9c0qkb9+dUYhlo4wOqBLHb87Bfm381CJn
	pD4VoFdT5NeN4xAQCXK1RKmpbCRJiz/MEZbtg33cl0Bf+QsEmdT75M//mdwN6+3F+IahIBB88/3
	MU1YREu4NnYa0LfrucwEB4Kt1aLpHxJpT9W/iGTFsV1pUz7QIipS2SI4tZmXCQzXWFe5k+2yop9
	Egaq+RVnmfZ7xsepNBvms2lxgFM2m3NdeoXBK+wV3zxniqdK4JR30iIqzVrQLgYSdhMfgzZnuGr
	tYrdvNFVm3GfLh4YRDNslY7NpXu7rojFKFO0pyT2Qm+TAbIbslIX6NZsSXZy2EDFguyQLBkmitZ
	onSHNv3ZWPDRiMpAu/QuQ==
X-Received: by 2002:a05:620a:45a8:b0:93b:d7a1:ba14 with SMTP id af79cd13be357-93bdca67ce0mr132986285a.63.1789695622227;
        Thu, 17 Sep 2026 18:40:22 -0700 (PDT)
Received: from emedev.tailf75c28.ts.net ([148.222.209.140])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93be0e4f987sm13002285a.14.2026.09.17.18.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 18:40:21 -0700 (PDT)
From: Emerson Busson <emersonbusson@gmail.com>
To: linux-hyperv@vger.kernel.org
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	linux-kernel@vger.kernel.org,
	emersonbusson@gmail.com
Subject: [PATCH 0/2] hv: vmbus: prevent control-plane starvation and order-7 ring deadlocks under memory pressure
Date: Thu, 17 Sep 2026 22:40:15 -0300
Message-ID: <20260918014017.2536753-1-emersonbusson@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Under Microsoft Hyper-V and WSL2 virtual machine environments, heavy
memory pressure and memory tiering workloads (e.g. swap-heavy tasks,
containerized compilation, in-memory databases) frequently expose
guest kernels to starvation across two critical VMBus mechanisms:

1. Control-plane and heartbeat starvation:
   During aggressive direct reclaim, available pages drop below safety
   watermarks. Atomic allocations (GFP_ATOMIC) required by synthetic
   VMBus packets, virtual network switches (netvsc), and balloon
   management fail. When the guest fails to service host heartbeats,
   the Windows Host Compute System (HCS) watchdog presumes a guest
   hard lock, triggering abrupt virtual switch teardowns
   (Hyper-V-VmSwitch Event 102/291) and ungracefully restarting the VM
   prior to any Linux OOM killer intervention. Concurrently, host
   balloon driver requests exacerbate exhaustion.

2. High-order contiguous allocation failures:
   Dynamically instantiated VMBus sub-channels (e.g., synthetic SCSI,
   network, and vsock) invoke vmbus_alloc_ring(), requiring order-7
   (512 KiB) contiguous physical pages via alloc_pages(GFP_KERNEL |
   __GFP_ZERO, order). Severe buddy allocator fragmentation causes
   alloc_pages() to fail with -ENOMEM even when ample virtual memory
   exists. On WSL2, this directly manifests as userspace communication
   failures (e.g. "accept4 failed 110: Connection timed out" on vsock
   control planes).

This series resolves both issues:

- Patch 1/2 dynamically establishes a memory headroom floor for
  vm.min_free_kbytes during late_initcall (clamped between 64 MiB and
  512 MiB based on 3.125% of total guest RAM), safeguarding atomic
  allocations and VMBus heartbeats. It also defers balloon driver
  inflation when available memory drops below totalram_pages() / 32 to
  avoid competing with direct reclaim.

- Patch 2/2 introduces a fallback to vzalloc_node() / vzalloc() in
  vmbus_alloc_ring() when high-order physical allocation fails, adapts
  hv_ringbuffer_init() using vmalloc_to_page() for double-mapped ring
  wraparounds, and preserves Confidential VM (CoCo) guest memory
  re-encryption guarantees in vmbus_free_ring().

Verification & Testing:
Tested and validated against Microsoft WSL2 rolling-lts 6.18 kernel
under multi-tier memory pressure (13.66 GB/s transfer bandwidth across
ZRAM, VRAM, and SSD tiers), verifying zero kernel panics, zero HCS
disconnects, and flawless vsock channel open resilience.

Related issue discussions:
- https://github.com/microsoft/WSL/issues/41634
- https://github.com/microsoft/WSL/issues/40795


Emerson Busson (2):
  hv: vmbus: prevent control-plane starvation and balloon thrash under
    memory pressure
  hv: vmbus: add virtual memory fallback for ring buffer allocations
    under memory pressure

 drivers/hv/channel.c      | 46 ++++++++++++++++++++++++++++++++++-----
 drivers/hv/hv_balloon.c   | 12 ++++++++++
 drivers/hv/hv_common.c    | 32 +++++++++++++++++++++++++++
 drivers/hv/hyperv_vmbus.h |  2 +-
 drivers/hv/ring_buffer.c  | 19 +++++++++++-----
 include/linux/hyperv.h    |  2 ++
 6 files changed, 101 insertions(+), 12 deletions(-)

-- 
2.43.0

