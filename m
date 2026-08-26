Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5002E390237
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787787562; cv=none; b=USkIXyIn3jDWF8uqZMQFhN7jhXiutf2JLSul/UDr87elIhctRII4dEv+u37V1SLtaIWAhNcHekMl0f5ZdaWWjjq412QjVt5lj8rffIsgEE40xrL7HpfGcy4uZ/knJjbz0IJFPbAoYEMvtcRzQvrjfJNiLF3rPN9HZAVVPH/jvWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787787562; c=relaxed/simple;
	bh=ltnk6ZEe6UBI+OuxfAsKht6KJZGAQfW6WOiKhx0pKlc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=BT2tsgQ7C9cQuz8k7MuV2pq2TYMO9/DvGz33WEE9FRBkw5Y7s0DepMcJnnHAiLvOwAVDNyaKgAcSw7YVVtXiEk+qkW9TamNtRZAIbgi4/SillibIFOa++H/4cMsifIKlTipMFpP+xIlgVf7ryueAJnw7Xv1vEUOVbw0EQmu1lXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KcOJ7zRp; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KcOJ7zRp"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d733799ebfso2068095ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787787560; x=1788392360; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1gny5c0JRJP6S8e9mlpbqEEJSGDZQAlsB6AnRfyperE=;
        b=KcOJ7zRpjzGpp0R8rThMu0YGWh7XzvmZZ0CuXHnPE6xEujsakDEz+8IwFUhA8+/jh1
         SooKJoVqLp70ap/yd+FZ0xZO1qcH/tvj15UgREXxSBX3dEgEb4wJL31WyNXlHn4naZ5h
         +mUAEdB7P38pKd06m8x2ik45Obz8y5bdt0aSJWDlm5J/haxm0GfXTK292dcHTv8l1//D
         cwuMtD51dDpfbwzCrj5eXJomdvwMaclvWsiFYJBPUCSsz2SZ5DDUPyXul0AZ+ZIAIIqw
         A1CknJk/MGAPhTB6Rw+DRlTJlBlh3np/o3pnI3l8qJ/ryRNqT6TiNrNcxKheHAUSl32M
         19jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787787560; x=1788392360;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1gny5c0JRJP6S8e9mlpbqEEJSGDZQAlsB6AnRfyperE=;
        b=oQI7l4/w3WMuqExXYZVVYju91n1n7V6VKJNh5zyKHo8CX/4k3aYLEBhQHkwDrqjgDq
         v1EzeNkc1uJnN/ioYL5Z7esbPp1+wpFlKmsWMkMDw1KGoNmZwW02Q2oSaW4u67U4VQ9h
         FOE/nQjCXyyDhJ9gBPbHjUMaUnPSqa/QinHj2qpl9x6r7A78UmwDBFON+oPHaiPfAumd
         bvnW8B/KC9mFui3EWeNlI1WT/PVrMvZYFOwvWE/nbmuu1tOlBGHBio4tv0Lo1fa2+jUW
         QWPN+m5OYFRGY0viHc+7Eldq/odk0EP1zMyvrp5POItBzhlXM1Mt8s9SWu10bHE/MAmR
         XssA==
X-Forwarded-Encrypted: i=1; AHgh+Rp5zwpAknCMG3LmxjLqT4UKIYc5G9uEvJPvDEA1w5TTXi7A0zvEu2MgS1CIXOuwh/PpNUHjZKjebcyvjMs=@vger.kernel.org
X-Gm-Message-State: AFuF++kBd1y7LOwR3VghkynkxYVyETgqX7z4shp2u8PN4pwploDGgoJd
	jXLa9B658zSreFQnLc0BoxONx7TX44CwNBoVp8WYmBa4NBqRMUMC9tgfK+NScV2XAB8rp4/8Te4
	n5bnspQ==
X-Received: from plpe14.prod.google.com ([2002:a17:903:3c2e:b0:2ca:d0f4:2f91])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1a45:b0:2cc:d6de:d597
 with SMTP id d9443c01a7336-2d707a9fecbmr190994405ad.7.1787787560405; Wed, 26
 Aug 2026 16:39:20 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 16:39:06 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826233919.998904-1-seanjc@google.com>
Subject: [PATCH v3 00/13] KVM: nVMX: Adjust VMPTRLD/VMPTRST behavior with
 active eVMCS
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, f734222792@gmail.com, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Sashiko Bot <sashiko-bot@kernel.org>, 
	Yosry Ahmed <yosry@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Vitaly's series to adjust KVM's emulation of VMPTRLD/VMPTRST when the vCPU
has an active eVMCS to match Hyper-V, and more importantly to not put the
vCPU into an infinite loop.

The patches from Vitaly remain the same from v2.  The churn I piled on top
came from wanting to use KVM_ASM_SAFE() for more VMX instructions to verify
the RFLAGS bug+fix Sashiko pointed out, and I lack impulse control when it
comes to cleanups.

v3:
 - See above.

v2:
 - https://lore.kernel.org/all/20260818165258.2613603-1-vkuznets@redhat.com
 - Fix build when !CONFIG_KVM_HYPERV [Sashiko]
 - Drop now-unneeded evmcs_vmptrst() [Sashiko]
 - Avoid hardcoding VMPTRLD insn length in hyperv_evmcs [Sashiko], use
   KVM_ASM_SAFE framework instead [Sean]

v1: https://lore.kernel.org/all/20260814162221.2144473-1-vkuznets@redhat.com

Sean Christopherson (9):
  KVM: selftests: Don't clobber RFLAGS in happy path of __KVM_ASM_SAFE()
  KVM: selftests: Assert success in vmptrst(), kill off vmptrstz()
  KVM: selftests: Always assert that vmxon() and
    prepare_for_vmx_operation() succeed
  KVM: selftests: Always assert that vmclear() succeeds
  KVM: selftests: Always assert that vmptrld() succeeds
  KVM: selftests: Drop useless return code from load_vmcs()
  KVM: selftests: Add macros to handle simple VMX instructions
  KVM: selftests: Dedup assembly code for VMLAUNCH and VMRESUME
  KVM: selftests: Add and use double-underscore versions of vmlaunch()
    and vmresume()

Vitaly Kuznetsov (4):
  KVM: nVMX: Make VMPTRLD result in #UD when eVMCS is used
  KVM: nVMX: Make VMPTRST return eVMCS GPA when it is used
  KVM: selftests: Adapt to the updated VMPTRST behavior when eVMCS is
    used
  KVM: selftests: Check VMPTRLD with active eVMCS

 arch/x86/kvm/vmx/nested.c                     |  24 ++-
 .../testing/selftests/kvm/include/x86/evmcs.h |   8 -
 .../selftests/kvm/include/x86/processor.h     |   2 +-
 tools/testing/selftests/kvm/include/x86/vmx.h | 173 +++++++-----------
 .../testing/selftests/kvm/lib/x86/memstress.c |   6 +-
 tools/testing/selftests/kvm/lib/x86/vmx.c     |  20 +-
 .../selftests/kvm/x86/aperfmperf_test.c       |   6 +-
 .../kvm/x86/evmcs_smm_controls_test.c         |   4 +-
 .../testing/selftests/kvm/x86/hyperv_evmcs.c  |  57 +++---
 .../selftests/kvm/x86/kvm_buslock_test.c      |   6 +-
 .../selftests/kvm/x86/nested_close_kvm_test.c |   6 +-
 .../selftests/kvm/x86/nested_dirty_log_test.c |   6 +-
 .../selftests/kvm/x86/nested_emulation_test.c |   6 +-
 .../kvm/x86/nested_exceptions_test.c          |   6 +-
 .../kvm/x86/nested_invalid_cr3_test.c         |   8 +-
 .../selftests/kvm/x86/nested_tdp_fault_test.c |   6 +-
 .../kvm/x86/nested_tsc_adjust_test.c          |   6 +-
 .../kvm/x86/nested_tsc_scaling_test.c         |   6 +-
 .../kvm/x86/save_restore_pf_stress_test.c     |   8 +-
 tools/testing/selftests/kvm/x86/smm_test.c    |   4 +-
 tools/testing/selftests/kvm/x86/state_test.c  |  42 ++---
 .../kvm/x86/triple_fault_event_test.c         |   6 +-
 .../selftests/kvm/x86/vmx_apic_access_test.c  |   8 +-
 .../kvm/x86/vmx_apicv_updates_test.c          |   8 +-
 .../kvm/x86/vmx_invalid_nested_guest_state.c  |   6 +-
 .../kvm/x86/vmx_nested_la57_state_test.c      |   6 +-
 .../kvm/x86/vmx_preemption_timer_test.c       |  10 +-
 27 files changed, 214 insertions(+), 240 deletions(-)


base-commit: 76671054f9a1ff6abb976583cd8da37650acdc97
-- 
2.55.0.887.g758fc8c411-goog

