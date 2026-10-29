Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793306008;
	b=SI5c7MyDDtXu3M2CEXVLYOaKsq6NLLjUdySvyTkGQOZYGtonZsR+nSgnZHFhQeNh6tq9
	 4CeFVsH73fWewkG8D9bxZMXXy5zHlFuDZlxwYXNsoizUbTYSOMqpKd5JISRGErbl+9cQ7
	 GymWNJq7gOKpiGVAEygcMDpQs5xzxQaKTLLpoe5UqkWTSnaGM7aHwadUcyTa9p1/UEqOW
	 6nokKrQKDImjwagsJOFm87cwpiRioPifvaeZFQAA9uZ+X4szZ99ZG/u38JfHju9TRuoJt
	 VdK/6g3UEtKU0NH+5kTGE4X4Ck5YCrEtQrGN8zj8F+GNIAj6+OrNkGuNDTnliXDlfzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793306008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=jMmNzlAVQ4YU/TdClKMIPFGx4bdoRURZ9N+KHeSsv48=;
	b=2rHgtzYrlK4qS7Z+EjRTsv8LTIQ/kwQMd+QrUZ/8t9USnT1GCgTHW85WQN44+SjQ5Q7c
	 YBkZ/2qXWzpFccWf5UOq3ptMqJnJRYEbqiaU/LiNTr4KoIvTITIk//k3Akd0g6R+7QTc9
	 eVGn5qK1IxfPLz5qeCLtHnEjRCnVdmv5+R0ru7NFNzm3lHvw/OD8V8PwbR/BSmCeJudnO
	 pmRo3oJwAIRRn2ZRG5XRWZBzBJ0isglCtys4hj5TK5WTfzi5Eh9X1VypawuUCuuKdrK7i
	 2TyyFZt9tFkkmiu9Q/xcfxhtlrsHpzg7DASsUC1cT3EISBZvSlO5ejg0UlowIAFvB3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eVFUBKsE;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9BE606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:33:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB9BE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eVFUBKsE
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3abfcf726dcso3193884a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793306007; x=1793910807; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jMmNzlAVQ4YU/TdClKMIPFGx4bdoRURZ9N+KHeSsv48=;
        b=eVFUBKsEWmC9glX7cmkaXKmE9Gvpbdu6PPmcjbKd0X5jp9ojQ4UvEMOgE6u1ADH0j8
         j9u4ZH41wXQZYqvjlqrAWt9SlILYvkhlyI3r1T5Qp/XxJXeTis0I3GnYEASb5JLf2g+l
         EWFyf9Lcq3klJyAcg3x6toSmdmFavCLqIamaug5THwEsJP9t2i/lHRxBC8OgN6tk4UiC
         h6XQd2+fYTrUZg5Qyer2z16IPUdsnteboFGJf+li3J8YvJpL0kO+zq7LhXVsC2stMBUx
         8Pfua2Qk4mgSg5/LPShH0lO5xm5SSR+4Iz+DPN1MnYop5hVoQAuTyGw9QwqUNvD6MedN
         AZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793306007; x=1793910807;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jMmNzlAVQ4YU/TdClKMIPFGx4bdoRURZ9N+KHeSsv48=;
        b=RH7XTpanvIwAkIE44RBlBH6lkZeqR62p95S5Uq9tCtKV8MhbZne+E2Kc+mtAehXX3b
         3QlOR7ojLP6sS6LhrmWYjKLVhSBQC6AviqbaWMaUlvxb/oBoEQi2UOC3KbWqrC7zVPMk
         a5Bn6oI+7ePh+oi6LwG/khyloouiLhSQk9L65LKf/8FdpbnBV2n8nNwHYAafd7Eut82g
         Y1Ef3TMz4yAN+dDBjBnTkST+dgTD0EBO2iOufDC2QK0XxdPzpQcFgSQ8bf/2MLOl78My
         Pejs4ww2ziRrHqJMJ03Cg8NpTY1BHcWxIZ9Pshhsa561Iy/e8bxTSZ7b5RjSBCGp6jHH
         c+bQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8Yzx2RzmahnV0u+D0FpkCtPvhC5hUQsQJF/yOQiIs0LT6ClRG6K8Z9BCu1FQ6z0I3xGIxa6mmnziaryg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/l+zZVaVgciC+tz2+U7Df0C0FjT+5NXcdFV/xyRhEfDs8ErrF
	PXcTWblnIn4yHwCuBVfK9eTzRKT2waL1/pd/xk9AFhJu1TaxbjKji6G9MfRUTdCQ46dJLS1xN53
	NshhS/TRx3OxicQ==
X-Received: from plhj8.prod.google.com ([2002:a17:903:248:b0:2e5:379c:9ba6])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4a83:b0:3a8:c0cd:57fa with SMTP id 98e67ed59e1d1-3ae897c834emr91263a91.11.1793306006771;
 Thu, 29 Oct 2026 13:33:26 -0700 (PDT)
Date: Thu, 29 Oct 2026 20:33:19 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261029203324.1637772-1-dmatlack@google.com>
Subject: [PATCH 0/5] vfio/pci: Fix power state race with SR-IOV enablement
From: David Matlack <dmatlack@google.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, stable@vger.kernel.org
Cc: Abhishek Sahu <abhsahu@nvidia.com>, Alex Williamson <alex@shazbot.org>, 
	David Matlack <dmatlack@google.com>, Raghavendra Rao Ananta <rananta@google.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"

This series fixes a race in VFIO's handling of device power state
transitions and a related missing data race annotation, both found while
reviewing Raghavendra's sriov_active patch [1]. It also adds a selftest
to exercise VFIO's handling of device power state transitions.

Patch 1 fixes a race between vfio_pci_core_disable() and
vfio_pci_core_sriov_configure(), both of which transition the device to
D0, but only the latter holds memory_lock. If userspace puts the device
into D3hot via config space and then closes the device while
concurrently enabling SR-IOV, both threads can transition the device
from D3hot to D0 at the same time. For devices with NoSoftRst-, this can
result in VFIO restoring the PF's BARs after VFs have been enabled
(triggering a WARN in pci_iov_update_resource()), or in a double-free of
vdev->pm_save. The fix is to hold memory_lock for all calls to
vfio_pci_set_power_state() and to assert it unconditionally.

Patch 2 annotates the intentional lockless accesses to
vdev->sriov_active with READ_ONCE() and WRITE_ONCE().

Patches 3-5 add vfio_pci_power_state_test, which covers closing a device
in D3hot, enabling SR-IOV while the PF is in D3hot, and racing the two.
Since power state bugs often only manifest as kernel warnings, the test
fails if /sys/kernel/warn_count changes during a test case. Patches 3
and 4 add the library helpers the test needs.

Testing
-----------------------------------------------------------------------

Tested in a QEMU VM with an emulated igb device (NoSoftRst-, SR-IOV
capable) bound to vfio-pci:

 - Without patches 1-2 (KASAN kernel), close_in_d3hot_races_sriov_enable
   fails reliably, hitting the pci_iov_update_resource() WARN on 9/10
   iterations.

 - With patches 1-2 (KASAN and lockdep kernels), all VFIO selftests pass
   with no warnings, KASAN reports, or lockdep splats.

[1] https://lore.kernel.org/r/20260514173449.3282188-1-rananta@google.com

David Matlack (5):
  vfio/pci: Hold memory_lock for all calls to vfio_pci_set_power_state()
  vfio/pci: Annotate lockless accesses to vdev->sriov_active
  vfio: selftests: Add vfio_pci_find_capability()
  vfio: selftests: Add sysfs_kernel_warn_count_get()
  vfio: selftests: Add test for device power state transitions

 drivers/vfio/pci/vfio_pci_core.c              |  19 +-
 tools/testing/selftests/vfio/Makefile         |   1 +
 .../vfio/lib/include/libvfio/sysfs.h          |   7 +
 .../lib/include/libvfio/vfio_pci_device.h     |   7 +
 tools/testing/selftests/vfio/lib/sysfs.c      |  19 +-
 .../selftests/vfio/lib/vfio_pci_device.c      |  25 +++
 .../vfio/vfio_pci_power_state_test.c          | 189 ++++++++++++++++++
 7 files changed, 257 insertions(+), 10 deletions(-)
 create mode 100644 tools/testing/selftests/vfio/vfio_pci_power_state_test.c


base-commit: 076d7e989cb69f6ded7d60f2a080eb909930061b
-- 
2.56.0.317.g454f8302e1-goog

