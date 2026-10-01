Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13C952B1F3
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 20:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790886170; cv=none; b=t3JitZ8lAD9rsAhpGo/UrJJXjzHvAdX80fqYNJzGwfhsHlvaviM2Cvt6DLGBe8uDVc6Cu5nAFOVh2JqKhfNXMyJe0nrhYVR7aMaHMVg9AlfGJSpGD2Ag0J1A286RLc4EOhD62SDYPCDkN0NWyzGtN0rUhMq8k9pziQSJxZh9hjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790886170; c=relaxed/simple;
	bh=yrZc68iSAUXYWwWhHS4Y8klRu/ywx0tJEa4BYtU0N2Q=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Fw749SVieYwHdnkYZ6DGM2cyKzW0uKHZBo0JuH/oC1eMgluwy0AObgDrBWFcl+AHMXBK41DRJVXdnTOJ1hjSgyYB0v2jP7y3JN0Pi7eSUQNklJE3rqY/LgweiDRMAjs+/+lOm2ALrvBYLnvbX3EhzOyCXa6yryuvZihuzRBpA3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XkKraSt3; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XkKraSt3"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso4267275a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 13:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790886161; x=1791490961; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h55kbjbOzz1CLCuyE736LNDaYbs1qeRtkzsUvXEbxPA=;
        b=XkKraSt3uXUKBD8rWTQkGs/R+Pny3uccw/jrdDUkXPGGSl45acEoITAqO5vD7IN9rd
         /WCNSGls8A5RABleKccORlB4at2IV6We5J4kspx6oPpz4S0vm4T4L0Aeoewh+a16k7JC
         a+rVOXYwO30yyWSKgr1Z/E/cFMV8eaFkqhwFpGNo115iMyz/iGROe+ad2FUS2xXGBmJy
         tHFCs7aj3ygzA7+i9JZjnJfkCj3mTRiasQ2ryX1DH2x6k2Ia7X8GgNmZZsYUNsrmXaL8
         ZglIRYbvtxSanYQTx/l1S2EiTPbBsVQsBbgDbWHXb5qEnLLY99KtIf4E8NaLvk/Gr/dp
         zpYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790886161; x=1791490961;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=h55kbjbOzz1CLCuyE736LNDaYbs1qeRtkzsUvXEbxPA=;
        b=abkKGuRsVwe9XNWMUvioRdMe/Pw//M/9d2F1XziC/Cv7Qq11Xf2/Lc2oakZ6L1HXkn
         wjK1NlaPloFI2eKNA0C3348qOor4MaPMM1kJE0te+gSb3wUUMlLvgvrQCM3D32otpv61
         anrVWPEtgJpnEyyd1r6ZIrJgg4Lm0m2o5hH9g8oD4IspFmOf87H4XroF5eTPaa4shmjM
         j9saBz1ZsMipqyEJNcv/nQ1uIcdNDo23/3ffxCggnvaayyWZ4IVntesgbm6LchYlcI45
         LH+LPJllYb+5A/b9I05JrHFhtAql/kY+N7TIL9DpIZWiR/TTtu8a2ToMHLS3lEduF5rJ
         LcTQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3bLbkLgyl6QNJhVdiHuRDBMw1mAYEOqpJnXoIOnSwSbNUmDJlP0TTruynNwyNyUIbm8owFbJ4W9nfE9k=@vger.kernel.org
X-Gm-Message-State: AFuF++lUMLfzLX0oth/kE3WI0yGN/QEKKC23DfcSQv3ktGW1RVW2OH6v
	0gL7WQgp8BTgBXhyHkO2+yKC3agN1SwedwynAXpTQSVrMrU1Lv9e/9yzpRhHHp3wsD/ikYyD0el
	RtqDDGg==
X-Received: from pgde21.prod.google.com ([2002:a05:6a02:315:b0:cc7:e6e5:e624])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:e292:b0:3dd:a196:30a9
 with SMTP id adf61e73a8af0-3e0bd4d2b15mr507037637.89.1790886161199; Thu, 01
 Oct 2026 13:22:41 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  1 Oct 2026 13:22:24 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001202234.3794060-1-seanjc@google.com>
Subject: [PATCH v2 00/10] KVM: Fix+harden against bad uaccess using dying VM
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

Fix a class of bugs (limited to nested VMX, as far as we know) where KVM can
corrupt an unrelated process' memory if KVM (attempts to) write to guest memory
during VM destruction.  Because current->mm usually isn't kvm->mm when a VM is
dying, e.g. because the associated kvm->mm process has already exited, writing
to what KVM thinks is guest memory will corrupt the current address space if
the associated userspace address happens to be writable in the victim.

Patch 1 is a blanket fix for the uaccess paths.  AFAIK, x86's nVMX is the only
path in KVM that screws up, but auditing kvm_arch_destroy_vm() proved to be
infeasible for a human (I didn't throw AI at it, yet...), and I can't think of
any downsides to going straight to a broader fix.

Patch 2 fixes what I assume is a blatant PPC bug.  KVM PPC completely ignores
kvm_arch_flush_shadow_all(), i.e. AFAICT, doesn't tear down its page tables
when the owning process exits.  I don't have much confidence in the "fix", in
part because it seems impossible that such a blatant bug could have gone
unnoticed, but also because I went with a very naive approach of invoking
kvm_arch_flush_shadow_memslot() for each memslot.  The changelog is pretty
sparse, because I didn't know how to describe the issue byeond "this is
completely broken".

Patches 3-5 implement more agressive hardening to nuke the memslots before
calling kvm_arch_destroy_vm(), e.g. to guard against writing to guest memory
during kvm_arch_destroy_vm() without going through uaccess.  Setting dummy
memslots feels a little hacky, but kvm_arch_flush_shadow_all() should have
purged everything that effectively caches memslots, so it seems like the right
approach?

The remaining patches fudge around the nVMX bugs (KVM abuses its nested VM-Exit
flow to forcefully take a vCPU out of L2, which has been an endless source of
pain, but is also equally difficult to fix properly), and add more hardening to
detect KVM bugs (though the uaccess+memslot changes earlier in the series should
render any bugs benign).

v1: https://lore.kernel.org/all/20260908132838.2116068-1-jmattson@google.com

Jim Mattson (1):
  KVM: nVMX: Don't flush shadow VMCS12 to guest memory during vCPU
    teardown

Sean Christopherson (9):
  KVM: Reject user accesses to guest memory if current->mm != kvm->mm
  KVM: PPC: Flush/zap all memslots on kvm_arch_flush_shadow_all()
  KVM: x86: Unmap VMAs for KVM-internal memslots when the memslot is
    freed
  KVM: Disallow setting memslots when the VM is being destroyed
  KVM: Destroy memslots immediately after mmu_notifiers are unregistered
  KVM: WARN if KVM attempts to do guest-related uaccess with "wrong"
    process
  KVM: WARN and reject guest-based uaccess if VM is dying
  KVM: nVMX: Don't try to load eVMCS12 page when the VM is dying
  KVM: Pre-check uaccesses in KVM's APIs to read/write guest memory

 arch/powerpc/include/asm/kvm_host.h |  1 -
 arch/powerpc/kvm/powerpc.c          | 11 ++++
 arch/x86/kvm/vmx/nested.c           | 14 ++++-
 arch/x86/kvm/vmx/sgx.c              |  2 +-
 arch/x86/kvm/vmx/vmx.c              |  8 +--
 arch/x86/kvm/x86.c                  | 36 +++++-------
 include/linux/kvm_host.h            | 30 +++++++++-
 virt/kvm/kvm_main.c                 | 87 +++++++++++++++++++----------
 8 files changed, 126 insertions(+), 63 deletions(-)


base-commit: d4b7fb647204f0c81dfeae2d1a708e4d858e0c94
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

