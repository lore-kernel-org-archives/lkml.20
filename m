Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E0D37FF46
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791282585; cv=none; b=RANrNM1mjDnVCiR2VRPewVgY2GbWW/ome1twn1JwqwqHCOBk+ApxzSNnoP/frHFdcClMiw4ELFjVl4/Xl7C+RZ9P1xNfmn6OkGEt/O4zqwMqzCXMhwufkhivBQNy/qwN2EkZY06/GZvXF+80Gr4BCUPs12UZfF0lzuPacAsxfNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791282585; c=relaxed/simple;
	bh=ksFLCcuv6cLlI8/Pp3Sn4sZLXXzFXHsqqr3tWb5XSsU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EnWkHT+A9Mr9Hhz8COcRu0aH47Ct9ikHCND4SEj8zH7M5xtTeINQ9cJSMIJqfg1mQ4/jdFkL6dACoebkfsnbH9jESqhP6XCA3oX5ueKNspliOYS8JZz4+CRmL87VcKobU2H+YFaNTyeQEmc6y5MWLzYV/BIGZfloCt2novJzI9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gmxvxY6z; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gmxvxY6z"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-15354aa70e8so6940351c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 03:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791282583; x=1791887383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=05GXKUT/YWkG/6TjV8sM9LD7ngJ6Vk2E269NPbqlb5Q=;
        b=gmxvxY6zTBgu/Chs60AJUff7f2ci+ppxzx6+2ner5jxnFrEnaMRuDkxsD/xkF57Zf2
         2k/thaUR51BmnvuOnh2WUcXc/itd0+weTP0FIyDhwHooTnwTKKE9iL7lRPLBWMty/6Cv
         bQYMiiINuF8ZYNr78D5aZ8kfZkJCG9siqqRPc1fuH5e272FfmKvG4qfmZvYz51WMZ7E9
         mwQc/k2HuYrWZeP/f00t2RtnjLGNXrky1G5631P5vsWQ6sv4xMDI4TLMaZ36YGStRLOd
         p8z/LfX28G1p2d+C3597NcRUJhGeUFUcGHCp649o+V3BRR+21d3Av7S3OAA1OQsM/Ku6
         /oWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791282583; x=1791887383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=05GXKUT/YWkG/6TjV8sM9LD7ngJ6Vk2E269NPbqlb5Q=;
        b=CSYnZqbsukH10gt8C57aJorvLI50Lswt7K+w+ROJo5WALYZQzLo2XVJ0Fxs7faq7Z5
         WazdOEvbhawrU/pFfghInGIiU4kEy5xquYkn6z0i8HaCjh/ccTGHG6HitfSzyYnpAZaB
         AJR0oFG8xQE5QcfVUHuUBoMcgIy8Bt/BeHz0tM/SpMAJrfaB/Q3ogD2QY1K4xVX+g2WS
         x2UNuKHyiJB21lImfw2sXWqAkU8v3oERBGlz2y2JaTUNcCYoPb9/NtQs9NU6dy6L2qOY
         97VVWCa7bqmWCNJ4d7+2n5gxSUMmSLxjara8pxtEwBbma8+ggJo30tirHuvtZ/vNtpxW
         8CyA==
X-Forwarded-Encrypted: i=1; AKwUvBzeQCVC+ICamCgRz8lbBnZltZWlnOC0eWiA4vaCfKcKG+psgVEeA2VSA1FhCO3OxQcvk7AWC4wsr1tHrc8=@vger.kernel.org
X-Gm-Message-State: AFuF++muQFYWV2obH8qc0nJTIBQw0nFo5OsYY9okG4hFzSOEluNG/I6Z
	J9AZLcgjb+0CpSomhOfHrKGgl4LXwc20Z/NwalN/CEnmsX2vUQwc/RlT
X-Gm-Gg: AYBFou0VQwKz9xZkoYIiWXQyUd5hI0DQ7CQxa5DUjO1T/MZfw07Uk2DoPBo/2pYdmjZ
	gJeVpjm9KBYMAis9hqjA1BBsNkfgWKCoTmAGJ3lOmX31RdWcndbro/Yv1/P1JDHRL0K+2HZ+PxD
	dMeQoUSJ4QwTeFCfwIMnNNmi3BiBJuc849u6Df8vWP8xG5M3eBQDtc/Xk2F72Ouo0jm9siFBKUu
	7+MiBXG9KKBpLKk6psBLpU6ukNnLIkd6oxZFL/FJlkfi15kT1Yip/Y//Qk5YtS93u3db+mXq5Ts
	AcyIbQdyUvcjhFUXW5ogvBf+45CrPjCKuun1pna0X4h+zUkTkbDYUL3YrsAXhfNguwkPmV7Y06r
	mJoVb7k2pOlUNPvBQrwH2MSX4wxbIYNmsfn8o2SVAKvFOCuMtCZpiTZbtYxpG5AE+pBGKYW0x6P
	PWdtc5lwnuLAfdxeVaIerTeYlstnzQ24kQp+Fuu1aVGAUqhe4bnsge+VNkkIAC5E4jsEshArtPW
	V5Czjpvwq2X5Ybmpgv0Yylf4pq/Pv7szJmZBkBwQwfqBhZRnFBt7Ms/s5LF
X-Received: by 2002:a05:7022:5f07:b0:14e:906f:9c8e with SMTP id a92af1059eb24-151c3a9ebf3mr12917648c88.20.1791282583240;
        Tue, 06 Oct 2026 03:29:43 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351469fa189sm7443970eec.6.2026.10.06.03.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:29:42 -0700 (PDT)
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
Subject: [PATCH v7 0/8] KVM: selftests: add powerpc support
Date: Tue,  6 Oct 2026 15:58:34 +0530
Message-Id: <cover.1791280439.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch v5 -> v7:
================
(Suggestions from Sean):
1. Added kvm_is_ppc_pseries_lpar() helper in kvm_util.h to avoid sprinkling
   multiple #ifdef __powerpc64__ checks.
2. Enable all tests via TEST_GEN_PROGS_COMMON for powerpc
3. Enable hardware_disable_test and skip when running on powerpc pseries LPAR
   (nested).
4. Re-arranged the fixes in appropriate order.

This is based off v2 of Sean PPC pre-enablement series [1].
[1]: https://lore.kernel.org/kvm/20260902164123.2546762-1-seanjc@google.com/

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

Ritesh Harjani (IBM) (7):
  KVM: selftests: Don't limit LE dirty-bitmap bitops to s390x
  KVM: selftests: Move memslot_perf_test off the 256M ELF load address
  KVM: selftests: Skip the max vCPU ID test when KVM_CAP_PPC_SMT is set
  KVM: selftests: Add helper for checking if running on powerpc pseries LPAR
  KVM: selftests: Skip kvm_create_max_vcpus on powerpc pseries LPAR
  KVM: selftests: Only warn for idle-page checks on powerpc pseries LPAR
  KVM: selftests: Skip hardware_disable_test on powerpc pseries LPAR

 MAINTAINERS                                   |   2 +
 tools/testing/selftests/kvm/Makefile          |   2 +-
 tools/testing/selftests/kvm/Makefile.kvm      |   9 +
 .../selftests/kvm/access_tracking_perf_test.c |  10 +
 tools/testing/selftests/kvm/dirty_log_test.c  |  12 +-
 .../selftests/kvm/hardware_disable_test.c     |   3 +
 .../testing/selftests/kvm/include/kvm_util.h  |  26 +
 .../selftests/kvm/include/powerpc/hcall.h     |  17 +
 .../kvm/include/powerpc/kvm_util_arch.h       |  22 +
 .../selftests/kvm/include/powerpc/ppc_asm.h   |  32 ++
 .../selftests/kvm/include/powerpc/processor.h |  39 ++
 .../selftests/kvm/include/powerpc/ucall.h     |  21 +
 .../selftests/kvm/kvm_create_max_vcpus.c      |  14 +-
 tools/testing/selftests/kvm/lib/guest_modes.c |  20 +-
 tools/testing/selftests/kvm/lib/kvm_util.c    |   8 +
 .../selftests/kvm/lib/powerpc/handlers.S      |  93 ++++
 .../testing/selftests/kvm/lib/powerpc/hcall.c |  45 ++
 .../selftests/kvm/lib/powerpc/processor.c     | 512 ++++++++++++++++++
 .../testing/selftests/kvm/lib/powerpc/ucall.c |  22 +
 .../testing/selftests/kvm/memslot_perf_test.c |   2 +-
 20 files changed, 898 insertions(+), 13 deletions(-)
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

