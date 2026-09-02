Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0292C4A0130
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378434; cv=none; b=qrYsRe7Ka0101FKPxnnGrbg26mglWibCBoC1raqfdX7uS8e/jxM1TN7yGHEghG9UzyxZFP6WlKn18lC5Pzb27WLURwVs3boE3CVogBHCwOGUhk7NUVoXqNq6ypD3H8ttw6qA6UJuOqmz3pZFS6uuokKo2X9CzaExiREvfuDXXx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378434; c=relaxed/simple;
	bh=ygs5b/4pGa9bJCsjvEaGg9guWrDVzMHPo/gVLjTXl70=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nphXFXqs3GYZ74hrfLA3Y0KpQqVRM+nnH5BkHG2AwOYA9cEoRZEtfsa08UoCZhTh6P4Pf+IUjiM3cFVq0dCi5Epka+dhjc/7zRd0nrkl5yTZryZeyyPEdEE8WqoeuIzSU68T8p8+hGoAIkNA8Ng9o9cQTzeeqxTlpvzVHlimFO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=QyzDPy6b; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="QyzDPy6b"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-939309d02d6so141303885a.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788378424; x=1788983224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=043T58xMxK5U0+nF6j3a8AXR/ljZlHLZb140yWsthLI=;
        b=QyzDPy6b5NVKUPWApyf439zzEFYZZ7dx8MmAw7Ib3OZGJxaQ6ecLGYTLH97L2hL9Cl
         JUk2jGWX2VF6GGQ0CF8XlSChZxTOt4yiOku2sj4w4hGaWBKjEiUO+pzVL90fWDnwDqDZ
         g9gh8frLiXabA0umTYNb9kQt4YROUIN4cTHQDhtPAW7iV4g7L7kcPwn789DvVWW5MQH7
         9ih7/Zg0bLeINdi2U3ZoOT+WnGK+gfucg8bn92Hxxs/q8pRzACtp8tpAk6qC1kkxdZL2
         nTddK0djaPpXmSzUfx4DukZi4BVLux0wKxrRYXiEbWBsBonb/jo9PoUUPb7lN5FhEIjZ
         TVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378424; x=1788983224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=043T58xMxK5U0+nF6j3a8AXR/ljZlHLZb140yWsthLI=;
        b=sfSsHq2MOHNMEttvBJqufp4ahOtol6aLFUUSnmjqmw1u5FsHxfk9ARIBKFny9vW192
         TKiaKs4UmgQq1Q1bSahSnbfu0depS5RQ5Jv9nnMU3AoBLOZ/aOd8IxX+3VcA4oB+dJfG
         tWCqf2xFSXmpL6uOKqvJKRHAL0hyzppCM1aeCcbeTSwozrVMdDuftgbKsY3oK96si3qd
         Qv5g6GdE+/OMtTdtItHrsRvmJ41D8DPkPoqcwX2i5GmqTHV2xBRIN6EsfA5PcJKx6pL0
         bX/X/MK4sVWaDXjPE0LpuhdxCJ2NahpMau5RaFKWMIYrmMw2hSA9aDpLO0cpirc6ZyYD
         0NBg==
X-Forwarded-Encrypted: i=1; AKwUvBwL9B89VT6xuk3XzvDnw1iMjIS6k3xTow8u7HE6oNQ6wrT+ptdvsB0GF0zSfnukk75NPsjLGAaK70R3MUE=@vger.kernel.org
X-Gm-Message-State: AFuF++lZCGw39d01e6OgvTKtr0OE/+FV//WB1o1PBSNF2a0mXgxEztMy
	lBaDyfIPm/iNAWraGRMkzFZAnoQ6Vi+OVOhm/IKkzXltDedUcU3SDgeUngihLXUhN3k=
X-Gm-Gg: AYBFou2NAJFEFnjkCpsp+BFO+8SxbCGaZQEA8KUZAKoiZLRR30FIYjtvBRqFOuioJ1r
	Zu9nXn8Kf9AOE6cm7NNe2FY1vW1Ddwmt9Hnb50E/m3zRbLQ3tEENJi/3xrYXIePbIeHdFd0T2v+
	vd26bhlPtsdH1udBF5Xfe81fJBwtQBmmX3mdbh9olhqM9ypsHA6rop+0jkyv9RAI6l8E1tQD22z
	Uq/T33tvy5l+tMj0u6rANm6y9nlp6L1Atek+BYvin4xBalhxxDRv+yyk+JwkYKRNjw7NweLJGoE
	eMf+86+COWa+JaiG/OuNRkS/4HvfkYqFoCobhcGNcR8JHI5obavfGO3+8t/MSeXph4HYIhogRIl
	58RMEAzimG5+vjAOcN4UG3YmNucPNhIUvxBNP+zPDtELDTgO/SNEaY6LOKilsO4Pv9LRs/sZNEr
	tFx4J4s44/9wctuJhEx0qaLQb4r+UJWTfa25Y8bzWJQxicixxNDk1arDND/1nzptXo+UoIEayIR
	uPGPAAPBtY6Q6MMQrEOgGvi1DciQE4PRhb+kpx1m69In0/0E2VWjYc5a9tY
X-Received: by 2002:a05:620a:5bd3:b0:939:6de7:a623 with SMTP id af79cd13be357-9396de7ccf2mr158269885a.47.1788378420256;
        Wed, 02 Sep 2026 12:47:00 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f18801asm299300585a.16.2026.09.02.12.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:46:59 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	pbonzini@redhat.com,
	seanjc@google.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	shuah@kernel.org
Subject: [PATCH 0/5] KVM: guest_memfd: bind backing memory to a NUMA node
Date: Wed,  2 Sep 2026 15:46:52 -0400
Message-ID: <20260902194657.79075-1-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

guest_memfd allocates its folios through a per-inode shared mempolicy.

Today that policy can only be set after the fact, with mbind() on a host
mmap of the fd. That requires the fd to be mappable, and it cannot reach
folios that are only ever guest-faulted. Neither holds for a
non-mappable (confidential) guest_memfd.

Add GUEST_MEMFD_FLAG_BIND_NODE and a node field to struct
kvm_create_guest_memfd. When set, KVM builds an MPOL_BIND policy for the
requested node and installs it over the whole inode, so every folio is
allocated there with no userspace mbind().

  1-2  mm/mempolicy prep. mempolicy_create() builds a validated,
       cpuset-contextualised policy without installing it into the
       calling task. mpol_set_shared_policy_range() installs one over a
       pgoff range with no VMA.
  3    The KVM flag.
  4-5  Selftest harness support, and the test.


Why a single node and not a full mempolicy?

  The fd is the unit of guest NUMA topology. A multi-node guest is one
  guest_memfd per guest node - or one range per node, since
  kvm_gmem_bind() is offset-based and mpol_set_shared_policy_range() is
  already range-capable - each bound to a host node, with the guest
  placing memory on top. This is the shape QEMU already builds with one
  memory-backend per guest node.

  Interleaving a single fd across host nodes would model a guest node
  whose pages are scattered underneath it. That defeats every placement
  decision the guest makes: guest NUMA balancing, tiering and weighted
  interleave would all be reasoning about a topology that doesn't exist.

  This narrow implementation enables the only clear use case.


User-visible behaviour:

  mempolicy_create() constrains the request to the task's cpuset.
  A node outside mems_allowed fails the ioctl with -EINVAL - the same
  constraint mbind() carries. A task cannot grant a guest_memfd access
  to a node it cannot reach itself.

  Nothing rebinds an inode's shared policy on a later cpuset change:
  mpol_rebind_task() walks tsk->mempolicy and mpol_rebind_mm() walks
  vma->vm_policy, and neither reaches a struct shared_policy. The bind
  is fixed for the life of the fd. This matches shmem's implementation.


Testing

  guest_memfd_test under virtme-ng, nested KVM:

  - 2-node guest, test pinned to the CPUs of the node it is not binding
    to, with the task mempolicy aimed at that other node. Pages land on
    the bound node, so the placement cannot be explained by the fault
    being local. Stripping the flag from the harness puts them on the
    other node, confirming the check has teeth.

  - CONFIG_NUMA=n: the flag is not advertised and the tests skip.

  - Single node: create/mmap/fault coverage, no placement claim.

Gregory Price (5):
  mm/mempolicy: add mempolicy_create()
  mm/mempolicy: add mpol_set_shared_policy_range()
  KVM: guest_memfd: bind backing memory to a NUMA node at creation
  selftests: KVM: guest_memfd: let the gmem_test() harness bind a node
  selftests: KVM: guest_memfd: test GUEST_MEMFD_FLAG_BIND_NODE

 include/linux/kvm_host.h                      |   3 +
 include/linux/mempolicy.h                     |   5 +
 include/uapi/linux/kvm.h                      |   5 +-
 mm/mempolicy.c                                |  75 +++++++++-
 .../testing/selftests/kvm/guest_memfd_test.c  | 134 ++++++++++++++++--
 virt/kvm/guest_memfd.c                        |  44 +++++-
 6 files changed, 248 insertions(+), 18 deletions(-)

---

base-commit: da6c37ed8beb273e3308e42d4bca3ce11b4432fa

-- 
2.53.0-Meta

