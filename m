Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221793DEFF3
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789889106; cv=none; b=A6VBGccZFb7xx8Gn0X6ztcuaEHb9yg2f1t+pX54TTYIuPHMzTDQA2k47jqA3Wap5TSFKM5FQpAgbH7r2NapXFaaqDISLRY1oh02q8VZylH+9xncruhVVEsu4qI7ymplxmv3dmakfTYpe2SMF5/JhCNZqrK3XOVLMvsoR4vd5ZKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789889106; c=relaxed/simple;
	bh=eA25W9wPF906HF0oiOd65O9ppQ/GP3fr4a+upcr0/ec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hqyRD6r7mq0z+ebO02xHS8jFbLupwzZ4fKRfwB7MBkyiTo3AnrbvNKCswaH2tSyk6bHX4GG4l70IjloGMgN9zYjfpAl/v8U1z2JPOFnR+/9nM3Cw9XzsQKs9Kdl3yKKTK/9n9kuT069w4lpb+2x0NCJ4EEELnLXAcINiKZnrXj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DoZvOtP+; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DoZvOtP+"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so10871305e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 00:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789889102; x=1790493902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AVd7bFzd0ZX9iRwPMPjomvmczu/wfwuYfR0YpCmlLo8=;
        b=DoZvOtP+o1XuZrDCA4wWGEd2o13QWSRKByrDZwByGkT/KwZanxY3O7c93sYZEK2XRY
         fjgSXGgAK8HXMGhnKBWRGhnlonn8RSobSQYelWLKa2TTagcaL5vjkbqdlpjPg6YXTof+
         1mP12GXtRHo3WTWCe59f5053XISKiI3ZjT3yH71dLSzmuLxSr3+vBA4x1g3rvAKTqeGr
         LaGR6YICxnR1I1ah/3qmTYc89LK+d45l+f6zUrQc+yu1qaf93/qPLEEbo5fjT2XYPJV3
         jcC3qgM3qVjXqwkl4N2DD+LEG4k7ba9HylO9LfiKAnHZDVjLNM/shgGY4dTVxOkB8U3/
         9oDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789889102; x=1790493902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AVd7bFzd0ZX9iRwPMPjomvmczu/wfwuYfR0YpCmlLo8=;
        b=JcxG13FtzRYmawL55mUoTmtoUbgpwIgj7ZRNrlfXOH7uryXZUePVAnjIPrT7wGY8F5
         /dTBBaxuwX3njZ/ChMEX+G/n96aI0M6GgFwYRGCHfkgM7mEhb1J8YJDu2onAZbIzHF3M
         ywGWwSivLo6+pc7qbhqcfpVj/FLBHlRYVLuoocuUXyLdvu4qGeb4thg6NlpwYesM4+qd
         fdTsp+2tc6Gy6QbuNdWa2cV1qHlJJhXKmavsNk5v3V4WbU43vspOxCnO1cF2bc/4MOKO
         /tPgJfe1uvc5UTrN5+RV34UrER9h7ZDKFEy0B3sQ9Kf3+yQyq7QOKb8FYdzV5xyL27uD
         UIvA==
X-Forwarded-Encrypted: i=1; AKwUvByr55hwkB//P6wUm5WtQrC5o1d63+XMpSS6n2EgSQVTIDihAOsexUUBQdxesn5paugyyt33sGknZYDXTMQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mEt8GJeHSV/DhrmWUIJe6Su+6E0aQSL6zsFh0g/glTS1qTbfJu
	qGI4dQ4b0JEClvvzWV+MZgfeVhuk1cvW9UGvzTXYSdTQ2MZ0se1eSvaR
X-Gm-Gg: AYBFou31Q+VyD528EtAFOT8C/RV3jevJFSbaiz1oWN0Y7M3OAbe2dc2JHRpabxQKgSy
	U2R+xviI04Pb30Mcha2/DcLAwSeFDaxmlCnnziwCDWByDw1924e5YBFOBcnGKHdunaKtvlZjqTd
	cODavBFVqwwrIlpLBwU/eFAOxwCQny9a+m97O0XBDYREbz/SEz/PXBK8mUdnoe5Fw78uYWKIYaO
	WuHiEQY1MvznFSgSZN21owXfavjBhzCkZiQRpFGBMdGxtGi5ETE53Hnj6HS9pt7xfO5rVWQj0BM
	m8cHUWIO+rqGJQRG2UtAMlDHHYzIf7UxRoBgNPJK31DIakZk+S3z0DiW6LJ3JK5aC7TlkVd44Ei
	pyBTy3hQc+ZymWVnDt7ZhXJm1LgnLEfGa79FasKGttyCUpllSVtoDK15ivz2N3QDE+zwO3A1HEp
	yFSdeWsIrxcZpLhf9mqOYa4Smlz2zTLw+NidB2CTrUy3MgmgsE3hT9F5HzIGBIAD4Rli4AaMK3d
	qfL
X-Received: by 2002:a05:600c:3b8e:b0:49f:bc43:9e96 with SMTP id 5b1f17b1804b1-49fc57144aamr126372555e9.8.1789889101638;
        Sun, 20 Sep 2026 00:25:01 -0700 (PDT)
Received: from build-server.. ([62.96.37.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd07bba7sm125191575e9.9.2026.09.20.00.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:25:00 -0700 (PDT)
From: mike.malyshev@gmail.com
To: seanjc@google.com,
	pbonzini@redhat.com,
	kvm@vger.kernel.org
Cc: amoorthy@google.com,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	x86@kernel.org,
	chao.p.peng@linux.intel.com,
	xiaoyao.li@intel.com,
	yu.c.zhang@linux.intel.com,
	linux-kernel@vger.kernel.org,
	Mikhail Malyshev <mike.malyshev@gmail.com>
Subject: [PATCH v2 0/2] KVM: x86/mmu: Fill memory_fault for unresolvable guest page faults
Date: Sun, 20 Sep 2026 07:24:57 +0000
Message-ID: <20260920072459.3485710-1-mike.malyshev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mikhail Malyshev <mike.malyshev@gmail.com>

When KVM cannot resolve a guest page fault, kvm_handle_error_pfn() returns
a bare -EFAULT.  KVM_CAP_MEMORY_FAULT_INFO documents the opposite: that
KVM_RUN fills kvm_run.memory_fault "if KVM cannot resolve a guest page
fault VM-Exit, e.g. if there is a valid memslot but no backing VMA for the
corresponding host virtual address".

The gap has a practical cost.  On a host that assigns an Intel integrated
GPU (Raptor Lake-P) to a guest via vfio-pci, the guest's display driver
clears PCI_COMMAND.MEM on one vCPU while another vCPU is mid-MMIO to BAR0
of the same device.  vfio-pci zaps the BAR's mmap, so the second vCPU's
fault finds a valid memslot whose VM_PFNMAP fault handler declines to
install a PTE, and KVM_RUN fails with -EFAULT and nothing else.  The VMM
has nothing to act on and kills the VM, even though the guest did nothing
architecturally invalid and the condition clears as soon as the driver
re-enables memory decoding.  This reproduces on demand and has been
observed in the field on production edge hardware.

Patch 1 is Anish Moorthy's 2024 patch [1], code unchanged, with the
changelog rewritten around that user.  Patch 2 converts the remaining
WARN_ON_ONCE()-protected -EFAULTs in x86's fault path to KVM_BUG_ON() +
-EIO, so that an -EFAULT out of the fault path consistently means "guest
access KVM could not resolve" rather than "KVM is broken".

Changes since v1
================

v1 [2] took a different approach: it mapped KVM_PFN_ERR_PFNMAP to MMIO
semantics inside KVM.  Sean objected that giving PFNMAP memory emulated
MMIO semantics changed long-standing ABI inconsistently, and outlined this
approach instead [3][4], including the shape of both patches.  v2
implements that outline:

  - report the fault via KVM_EXIT_MEMORY_FAULT rather than inventing MMIO
    semantics for PFNMAP memory;
  - take Anish's patch rather than writing an equivalent one, crediting
    both authors;
  - add the KVM_BUG_ON() + -EIO conversions as a separate patch;
  - x86 only, and based on kvm-x86/next rather than linus/master.

The userspace half
==================

This series reports the fault; it deliberately does not define what an
access to a BAR with memory decoding disabled returns.  That policy belongs
in userspace, and QEMU does not implement it yet: QEMU routes
KVM_EXIT_MEMORY_FAULT into its guest_memfd conversion path, which rejects
a vfio BAR -- a ram_device region with no guest_memfd -- and stops the VM
with an internal error.  Unmodified QEMU therefore still loses the VM
exactly as it does today on a bare -EFAULT; only the reported error
changes.  A QEMU series emulating Unsupported Request semantics for this
case -- reads return all ones, writes are dropped, as the hardware does --
will follow and will link back here.

So this series does not regress today's userspace, but neither does it
fix anything for it: it is the enabling half, not a standalone crash fix.
That is also why patch 1 carries a Fixes: tag but is not tagged for
stable: a backport would not help any userspace that exists today.

Testing
=======

arch/x86/kvm/ builds clean with no new warnings for x86_64 and for i386
allmodconfig, the latter covering the 32-bit-only hunk in patch 2.
checkpatch.pl --strict reports 0 errors, 0 warnings, 0 checks on both
patches and on this cover letter.  End-to-end testing against the
reproducer requires the QEMU counterpart and will be reported with that
series.

Link: https://lore.kernel.org/all/20240809205158.1340255-1-amoorthy@google.com/ [1]
Link: https://lore.kernel.org/all/20260621133708.3454718-1-mike.malyshev@gmail.com/ [2]
Link: https://lore.kernel.org/all/ajnEAkFGyJWmomhq@google.com/ [3]
Link: https://lore.kernel.org/all/aj1Vc13mqb-fXiow@google.com/ [4]

Anish Moorthy (1):
  KVM: x86/mmu: Report a memory fault exit when the fault handler
    EFAULTs

Mikhail Malyshev (1):
  KVM: x86/mmu: Convert can't-happen fault path EFAULTs to KVM_BUG_ON()
    + -EIO

 arch/x86/kvm/mmu/mmu.c         | 13 +++++++------
 arch/x86/kvm/mmu/paging_tmpl.h |  4 ++--
 2 files changed, 9 insertions(+), 8 deletions(-)


base-commit: 70c944caf570fda2d79baa71435589a8db39f048
-- 
2.43.0

