Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D1D22126C
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 03:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791172063; cv=none; b=KAOCx1c1IMl/TRiYT0Ixkc7H5+UFdRoVknzWkvy3lKBXId5QJcvlKpikBk+hNpjbG0JF9vzFRxGXntdUsLmDm0yTzyIRW2uPQgWsDRI8ei4wnA5QY1Ggt7gwcdVgNPdGAYJwRi97goR/aSgW1ByejPkLDv7SltT4+yl+wBbK5AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791172063; c=relaxed/simple;
	bh=QoaSLy2l7/4OCeodeMSTqluTiSSt1oe7fSnN0v3xLiQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ipb0anoeKyRH6rIYFqWaZ/R3gFlZ79+ZWRLpZq96EL4pM/M/8u30VTX0/df+Rl03kW0WbeKTzQztD0xQDy81p5AHDCgP4K2+aiYF0158IFK01WhqYXqk6VGrb8qJ/q00uklrGCTRNPPEw4qNeKJ+EXvKswsxi9jl8I1bjUEE7Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Doqq1i6e; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Doqq1i6e"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33bfb26865fso841260eec.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 20:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791172061; x=1791776861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uw6WYwed2JfK8m0vFjl2cwW4PACl3pWVaZ2CPggu3Es=;
        b=Doqq1i6etBlRe6ZTQzfw57Nz5YEQ9kKiF1C2d+ydjXSWs51H35hqyJMVbORtM3B5be
         Qvj0j4jxlU81fozJndeYQ2SSck4+zjOBJTSaJ6WfCnf+dcp/85LcCthmFiwhhblfEEuZ
         C8c6uwTCwt0KHGMocSGvofZNyCtt/mieV7hFe8jQYmgxmoRWYaKLrkHgfdlMIFZCRd2v
         rkSOZBnsx5Uj8lS37jh0rm1aa2biYo1eTwim1/khBDOPFmTLO0GPYQpMV7KB/BGyqges
         KlbZFB++aiRhwkymcBXLk3cNIgE27SqWBNczKtQWBrjBhGLFTU0oJdkcEyZY+VHhHVeM
         cZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791172061; x=1791776861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uw6WYwed2JfK8m0vFjl2cwW4PACl3pWVaZ2CPggu3Es=;
        b=L2wJMt0/1v470vAjODO+do4urGCeKwVKvBGvdURpyNCqoFiGBk+QwfQ3i+BbceUs/r
         iU91fMMoydPFXiecWKbw8zBS1YHVHt3MuDsC9NXh03cqAFXAZgcwpOX5blVmhdw4kXQB
         SGRQArXVpEaP2wf7S8MUy09Vhu3euKrF7Ob9DNnHB0Uhi+szLFwPoE3Mrsqc/JTHXmpP
         2DgJz8ZXLkKW0xMrJauXFqoEyKtTBKUaboYT6EcI8vF0TOB4kfVOEvvIcb+30bqXKWi+
         dT3piyFBD1/NVImOqR28FyyWwD+ylK9EJwKjUx8pEO9oSu39/IBya2DkqYnwFIxx0KJJ
         WzFw==
X-Forwarded-Encrypted: i=1; AKwUvByjElszFBfXzeO1MCtjrP+8qHSxFMoGZH8/o+QnQIA568vlxGhzT8Xr2EdBb+kadh9v9nj3yk0K5dDvrqE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfNJjGGa3j7OcvjIUlE+q04DUEIzbnIB0yiQRlAqm9LwAuqeID
	F6LbcEoIrKp9A4+TMtpxgeskfhsEhqMURt2q3bqWkntyzAXj17p5aoOe
X-Gm-Gg: AYBFou2utyjSWbB6lhUObYWk75O3k0QPDiwEz1qynt/kUxQV9xdim8egd9LWj/L95XI
	JIgd8k3oD+bQNf3/xcVrW+L7PJH23wgjITG8F1QeHwWFr9xjNBjrFwlBGGwMZUE+9meyRHwiZSp
	O2vDCrk/bDpATImNnMAdopuy8X7awuzypz/8GcwNEC77nkhSkfCyJN3RICxHvvhzuhX21rhHw9Y
	2pSPPzkdxfRqrWTHLpPpdfHwOJ0bWsKpeexwlbn2cUZV0SAftKCnSgOgkFjiTZievgWZKtVjocc
	j4wWZN8+/jIq8N9yUsQLQVRgIOE3T9monB6gOOeJ77/p+tMT23cDzBmO3QwRz1W9ZEHSn2oyRgn
	d/6st/kb7IpiYi4c/seV0u0F993cRCjjhMGt9jnwfJMbpypJy8W9tlWthUTzJmSfsZUAVLx2Rqe
	rIKAIIpUYeKJUa0TC8U3gZZVofMEPtsGUFDbFPKCtGkQ7oytHIx6BtQ4HdT3AYzoBO20HNNEmec
	EhXzwHvze71MWOz3lNHKd+tnXwrbhdhvl8Jg+88k0+hzu5zgdQFbf1m76VKkg==
X-Received: by 2002:a05:7301:928:b0:34b:3230:5cda with SMTP id 5a478bee46e88-34f21858da7mr11358827eec.26.1791172061374;
        Sun, 04 Oct 2026 20:47:41 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3512718a18esm10840958eec.17.2026.10.04.20.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 20:47:40 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: kvm@vger.kernel.org,
	Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Anushree Mathur <anushree.mathur@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v6 0/5] KVM: selftests: add powerpc support
Date: Mon,  5 Oct 2026 09:17:23 +0530
Message-Id: <cover.1791014923.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch v5 -> v6:
================
(Suggestions from Sean):
1. Dropped kvm_create_max_vcpu, hardware_disable_test and their respective
   plumbing.
2. Bundled the enablement and the fixes for few of the tests together to avoid
   the ordering issues.


Patch v4 -> v5:
==============
- Fixed the issues reported by Anushree while running on kvm on powervm
  (nested).
- Fixed memslot_perf_test on powerpc.

PATCH v3 -> PATCH v4:
==================
- Rebased on top of Sean's new page allocator patch series v2 [1]
  This allowed to drop and patch-2 since it will now come from Sean's
  v2.
- Addressed review comments from Sean - squashed patches 6-10 in patch-1 of
  this.
- Dropped patch-5 to print vcpu_id when KVM_CREATE_VCPU ioctl fails.
- Added additional patch-3 to this series to allow dirty_log_test to run on all
  big-endian machines.

[1]: https://lore.kernel.org/kvm/20260902164123.2546762-1-seanjc@google.com/
[v3]: https://lore.kernel.org/linuxppc-dev/2d2c46be7f051c7f1c645afaec67f57067d37a81.1781093720.git.ritesh.list@gmail.com/

Testing updates:
================
I have done some fair amount of testing of the selftests both on real HW and
using various combinations on qemu (powernv+LE (default), pseries+cap-nested-hv,
pseries+cap-nested-papr, powernv+BE). There were few powerpc kvm kernel fixes
which were identified as part of this work. I will send those patches separately
as those anyway needs to go in separately.

<pasted snippet of cover letter from previous versions>
=======================================================

Hi All,

This series primarly adds KVM selftests support for powerpc (64-bit, BookS,
radix MMU).

This patch series is originally Nick's work. I have mainly only rebased it on
the latest upstream tree. Since the rebase required few changes to all the four
patches (Patch 1-4), I have dropped the earlier Acked-by from Michael Ellerman.

Since the last series was posted three years ago [1], I am resetting the version
to RFC. This rebase was done as part of a larger effort to improve the selftests
infrastructure for Linux on PowerPC tree. Thanks to Harsh and Maddy for their
help on this.


Nicholas Piggin (1):
  KVM: PPC: selftests: add support for powerpc

Ritesh Harjani (IBM) (4):
  KVM: selftests: Move memslot_perf_test off the 256M ELF load address
  KVM: PPC: selftests: Add helper for checking if running nested
  KVM: PPC: selftests: Skip idle-page check when running nested on pseries LPAR
  KVM: selftests: Don't limit LE dirty-bitmap bitops to s390x

 MAINTAINERS                                   |   2 +
 tools/testing/selftests/kvm/Makefile          |   2 +-
 tools/testing/selftests/kvm/Makefile.kvm      |  15 +
 .../selftests/kvm/access_tracking_perf_test.c |  11 +
 tools/testing/selftests/kvm/dirty_log_test.c  |  12 +-
 .../testing/selftests/kvm/include/kvm_util.h  |   9 +
 .../selftests/kvm/include/powerpc/hcall.h     |  17 +
 .../kvm/include/powerpc/kvm_util_arch.h       |  22 +
 .../selftests/kvm/include/powerpc/ppc_asm.h   |  32 ++
 .../selftests/kvm/include/powerpc/processor.h |  46 ++
 .../selftests/kvm/include/powerpc/ucall.h     |  21 +
 tools/testing/selftests/kvm/lib/guest_modes.c |  20 +-
 tools/testing/selftests/kvm/lib/kvm_util.c    |   8 +
 .../selftests/kvm/lib/powerpc/handlers.S      |  93 ++++
 .../testing/selftests/kvm/lib/powerpc/hcall.c |  45 ++
 .../selftests/kvm/lib/powerpc/processor.c     | 512 ++++++++++++++++++
 .../testing/selftests/kvm/lib/powerpc/ucall.c |  22 +
 .../testing/selftests/kvm/memslot_perf_test.c |   2 +-
 18 files changed, 879 insertions(+), 12 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/include/powerpc/hcall.h
 create mode 100644 tools/testing/selftests/kvm/include/powerpc/kvm_util_arch.h
 create mode 100644 tools/testing/selftests/kvm/include/powerpc/ppc_asm.h
 create mode 100644 tools/testing/selftests/kvm/include/powerpc/processor.h
 create mode 100644 tools/testing/selftests/kvm/include/powerpc/ucall.h
 create mode 100644 tools/testing/selftests/kvm/lib/powerpc/handlers.S
 create mode 100644 tools/testing/selftests/kvm/lib/powerpc/hcall.c
 create mode 100644 tools/testing/selftests/kvm/lib/powerpc/processor.c
 create mode 100644 tools/testing/selftests/kvm/lib/powerpc/ucall.c

--
2.39.5

