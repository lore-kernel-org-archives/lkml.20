Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793139132;
	b=p6BTbpsBy1BtI9TkE3BwrbiUC9ERuke2H22zTYtb2sQvAq3cJOlczutMfgSO3lHM3P6m
	 Lk9L/ZsRUgjCIaPggVLf5IzdTS8U1VQOtGZBzRB/Uog7tGcZ/y48fx+ign8EDAETVAoRF
	 NRqBJIahdOLfba61Jlmg5u2XuXCxGvMlX9TEXMJ3R7uiKUOb19vpeQDCPDsS3srQIFqut
	 U3zpKeZNp+1JSFSl45gOFR2+M4ExX58kOt97ojO/DRBM9CQ+3+dYoXTrB1/TXEiIVWQ0I
	 9vQMQRg9SevshyEC08iPNQ3hjIfKEiYHzSUv8ydBtaeYcu+vBB7aBxeHxM6cJn7Onrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793139132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 Mime-Version:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=5Vq2l0nNlx4Jt5Br3FhBTT5y6+xzpkVfJlHDQEljzdw=;
	b=CQYnyNvYVTyUNSFASLERIohPbSCKH2ZEDJtzka+AjgJNCfJPuvKasCivQRoWA9HN7pn+
	 5vWSGHjKodCNL2Jchlw7CYNCjJY0j5bSlhMCrZemOft+7Ux1VAZIN1xZ9CKL0iMZSdKqc
	 BO6UbOFiyodC3jFPO2vWXblGBKdToAB95RWR+oaa7b12mXr56f07ilrsUeWr5B6zTnPLu
	 zu4neoROFGQWSRdtCcnhzvW2OXv69fxfkSVrOHHaP5kQQ4CvAkheEuEvIi/Jj1FdkNg1Y
	 ayv70JdlBqFfnn+iUoHKeQ6eoZMNC5H3RtPdsxQQRG8/4zRQVrj9r7TXH68vaahf7sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Tzko39Gb;
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4817606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:12:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4817606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Tzko39Gb
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd60a365440so248993a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793139131; x=1793743931; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Vq2l0nNlx4Jt5Br3FhBTT5y6+xzpkVfJlHDQEljzdw=;
        b=Tzko39Gb8NK/pISNaMz2B1Yq1HUoap3Gu7pMr5Zke3dZCqzwxoKxorktaoCIOmeWst
         4y4wyvjMGqGCt7XMlhFtGSebCxisln2f2AV3Two5Ferweaq3ihtc5vGEYxKcjZQvEa9O
         iVLHma9J4m+X3T6vTNZgBxUOPjfFI+CPvTpsiiaRIT95aV8/I6GWatTGAPTEOI7UIzYp
         xLVkK80HpXJHF0h49u4G8QfVmVwsVLJZWUCMkRSJVReUyjukmFX9HYnkqi7uGg1NCdzP
         S5USayKgDSP/Un1sSvc8g4imPcDEHevbJu3s9paEDu+TtQAp5/dr5f0UsFMl4JsFOiBT
         yH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793139131; x=1793743931;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5Vq2l0nNlx4Jt5Br3FhBTT5y6+xzpkVfJlHDQEljzdw=;
        b=EhK/+gfoBbG/viQYTVzOBAiJS87gMo7eYEqa1aDc+Fu+qtdiXEbcOnl+DMjX1y/+Fy
         uWgGSyoFLQoDx7bGqTe8+UC8kV4Fk43flNpCUklhLUtAUYtymmXcvYP/byd3rLmYz/pJ
         IBYNvhb4jxkRNbGoItIxn17ga04O9xpM16aXVTMgETQNO48TVSSm/J8CzyT0DY6CC7dA
         +Iu7NB6lKep0wpE9LdP0oIpxF9AEukhKu307pQWxySr0lKYk6seMgvAe3+udPf9pyna6
         LrJMr9IcSh1gt0T9ZKDDCai+lDvDSEMflr7jenJfwfyO2ktRlul0ePyLYdsukkqMsDDE
         DjFg==
X-Forwarded-Encrypted: i=1; AKwUvBxR1tDr4B/+XjL0MuOAbWDdiGBis3Wygm550V/OPONhn3SrVewiy2wTQrZy8ZQb3LVxeGnD+ZUuh4RLzok=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/eUCc/blbpY1R+UyXxNuVFByazp4zWrSnNxFrDN6GUZLLN/Ud
	GzqClO8cQ9Zy/XvDBXLZ2m+Ry+0jBR1J9KyQUKEOlSpcDXLMQ1IjfrzneHHlhu1JJvkbzf6nC57
	SdMqsng==
X-Received: from pfbig23.prod.google.com ([2002:a05:6a00:8b97:b0:89e:af6f:f0c7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6a0c:b0:3e0:d2ba:5b37
 with SMTP id adf61e73a8af0-3e902462639mr382770637.75.1793139130927; Tue, 27
 Oct 2026 15:12:10 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 27 Oct 2026 15:11:53 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261027221209.1560865-1-seanjc@google.com>
Subject: [PATCH v3 00/15] KVM: Fix+harden against bad uaccess using dying VM
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>, 
	James Houghton <jthoughton@google.com>, Chris Mason <mason@kernel.org>
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

Patch 2 fixes the underlyihng nVMX bug where KVM absuses the architectural
nested VM-Exit flow when tearing down a vCPU, which has a truly absurd number
of problems.

Patch 3 fixes what I assume is a blatant PPC bug.  KVM PPC completely ignores
kvm_arch_flush_shadow_all(), i.e. AFAICT, doesn't tear down its page tables
when the owning process exits.  I don't have much confidence in the "fix", in
part because it seems impossible that such a blatant bug could have gone
unnoticed, but also because I went with a very naive approach of invoking
kvm_arch_flush_shadow_memslot() for each memslot.  The changelog is pretty
sparse, because I didn't know how to describe the issue byeond "this is
completely broken".

Patches 4-6 implement more agressive hardening to nuke the memslots before
calling kvm_arch_destroy_vm(), e.g. to guard against writing to guest memory
during kvm_arch_destroy_vm() without going through uaccess.  Setting dummy
memslots feels a little hacky, but kvm_arch_flush_shadow_all() should have
purged everything that effectively caches memslots, so it seems like the right
approach?

Patches 7-9 add more hardening to detect KVM bugs (though the uaccess+memslot
changes earlier in the series should render any bugs benign).

The remaining patches double down on open coding nVMX's vCPU teardown by
tearing down the vCPU "as-is", instead of forcing a switch to L1 and then
doing teardown.  The forced switch is quite heinous, as it requires KVM to
*load* the vCPU when it's dying due to architectural constraints for active
VMCSes.  Not only is that gross, it was also papering over a bug (hopefully
just the one) where KVM was relying on the vCPU load for nested VMX to take
vCPUs off the posted interrupts wakeup list.

v3:
 - Give up, and open code nVMX teardown. [Sashiko, syzbot, Chris]
 - Drop the nVMX hacks that were trying to fudge around the mass of nVMX
   teardown issues.
 - Free the VMA only for the non-SMM internal memslot. [Sashiko]
 - Use @len, not hardcoded PAGE_SIZE, in kvm_is_guest_access_ok(). [Sashiko]
 - Rip out the awful vCPU load code from nested_vmx_free_vcpu().
 - Collect James' reviews.

v2: https://lore.kernel.org/all/20261001202234.3794060-1-seanjc@google.com

v1: https://lore.kernel.org/all/20260908132838.2116068-1-jmattson@google.com

Sean Christopherson (15):
  KVM: Reject user accesses to guest memory if current->mm != kvm->mm
  KVM: nVMX: Don't force a full nested VM-Exit when destroying a vCPU
  KVM: PPC: Flush/zap all memslots on kvm_arch_flush_shadow_all()
  KVM: x86: Unmap VMAs for KVM-internal memslots when the memslot is
    freed
  KVM: Disallow setting memslots when the VM is being destroyed
  KVM: Destroy memslots immediately after mmu_notifiers are unregistered
  KVM: WARN if KVM attempts to do guest-related uaccess with "wrong"
    process
  KVM: WARN and reject guest-based uaccess if VM is dying
  KVM: Pre-check uaccesses in KVM's APIs to read/write guest memory
  KVM: VMX: Explicility free vmcs01, not the current VMCS, in vCPU free
    paths
  KVM: nVMX: Don't explicitly VMCLEAR+free() vmcs01's shadow VMCS when
    freeing vCPU
  KVM: nVMX: Cancel the nested VMX Preemption Timer's hrtimer in
    free_nested()
  KVM: VMX: Explicitly remove dying vCPUs from the PI wakeup list
  KVM: nVMX: Don't switch to vmcs01 when freeing a vCPU
  KVM: nVMX: Don't load+put the vCPU when freeing nested state for a
    dying vCPU

 arch/powerpc/include/asm/kvm_host.h |  1 -
 arch/powerpc/kvm/powerpc.c          | 11 ++++
 arch/x86/kvm/vmx/nested.c           | 69 ++++++++++++-----------
 arch/x86/kvm/vmx/posted_intr.c      | 68 +++++++++++++---------
 arch/x86/kvm/vmx/posted_intr.h      |  1 +
 arch/x86/kvm/vmx/sgx.c              |  2 +-
 arch/x86/kvm/vmx/vmx.c              | 19 ++++---
 arch/x86/kvm/x86.c                  | 38 ++++++-------
 include/linux/kvm_host.h            | 26 ++++++++-
 virt/kvm/kvm_main.c                 | 87 +++++++++++++++++++----------
 10 files changed, 199 insertions(+), 123 deletions(-)


base-commit: 7e60162b16f9da0d2fa83da5c1723b6853a0ac1d
-- 
2.56.0.307.g5fe7bd680c-goog

