Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D7020E6E2
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 00:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788481468; cv=none; b=QEyqSuHLJfOWApkhq8pzmF52wNIwjxqDsHIyZmcse4U1XCuZAhdHeWE/7PMgvzW3wI8YIPcVbgt60wISNmTnuGh9fnTTuAb2cRSoXFolw/DHyvs185C3LfOrI0dcmj5iGw1LKyPpVy3xRoP7ZhLt+CegDUS7PxSuU1HTT2PTrdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788481468; c=relaxed/simple;
	bh=3UJVSOf/zQ3R/LCUqgu+uWYIoEske7jiFPTRPaDEp3Y=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=TwSJ7JV81yIsxXuf7OXHQcKss2KVRYln0ihfAKYA6tzlh6MecFJSZ4OLZHCVQAphD4W+siEXifY1IZUy87RHoqwRk9wtOKbb4ODIqwTF3Y7BTauXheC17ZDQ+R5yrY0a42RGzz9CPxjg6/OMgjyM3TuDI3Ru2gZz7NLhGNY0enA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XnoXuxjz; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XnoXuxjz"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6f73d0f89so5551455ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 17:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788481466; x=1789086266; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uAgyR6SHHf2VtxP6jZ6gU1Ff60o4GfZbL3l/u+NRPJg=;
        b=XnoXuxjzYWvxAagX4Eu9R+Sl21sOxZ1VkF55FjHXcAysv8DhVLNKEZt95k2ic1KM2T
         LllCVRXqucxh6y2zU8VY4WY3zko98/iO/CyxqUZnLZiYXxDflfTLGKDKU/J4E3nHol4l
         SoPESMsjDY47mRqOhB8cumeaZfyuY/qRcKDaYw5xeaa4yxA7Br5+Qcuo77qGL75kWiU2
         E3PWN4ghiSqUl9ZJg654tX0mP12yt0fsJjqon2PM1YBaCAKQJthTcJPtuwC7O9ziNRlS
         iK3d3EMCSdjOAPjjEBI/jU1PRbzJJBdvnN+wJmdbtEy7lRmJcYlTxrrDOn+o3zzoGj6s
         Qyqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788481466; x=1789086266;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uAgyR6SHHf2VtxP6jZ6gU1Ff60o4GfZbL3l/u+NRPJg=;
        b=rhfUrjT+cUsjNJ6Nlj5ObLbQMvH22CW8V7ZLVuS9XyXHnpMDO5IXSh8MBOTVUyfy09
         zNVMGk1pP0G5ufAi8Qmbws66/shJna5YHmET7zqXOsivFj6E0SzBF69yR7kJou690oJC
         O6rgdYUq0YDn4xp/Sd1V3V0Yv1GupIvM1Y8BcMf6zk2lqVr5WlasjtyQdt/hSA3nchir
         Bu8NMd89pXadJ4nbeQeF5j4kaWV2VZquewFzKQ+9EChwagmTPG9NKyEIhlOm9INytzwN
         5BZjAaLnkF7chLU5O4wRQE+8ZXQITIHIYae8q1cpl8cAHHAJOdUGuwAwYogN+OWIt+qt
         7fIg==
X-Forwarded-Encrypted: i=1; AKwUvBxACuduEncaJV4dlyApEXG1ZCU3DM6VJk0OdXm6IYsj0EB31/Vy5kWLIcYP5IC+6OLIBAyh2ATEC5+jdW8=@vger.kernel.org
X-Gm-Message-State: AFuF++lXeuGgB3H1TkXPUQMoydljryFzy3y5ZDEu/mkw2pWtWsszy0Yq
	TY9U6Ko6RJXklsW3DIFdUgdoeqY8S6/AcErnDZnG8XQpI3YFJpmQU3DpIUzNKKoj9TSTG5Rrszj
	JinXFWA==
X-Received: from plll17.prod.google.com ([2002:a17:902:d051:b0:2d0:f9b3:3acb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d4c8:b0:2d9:69c9:2815
 with SMTP id d9443c01a7336-2db12588b02mr36267515ad.7.1788481466032; Thu, 03
 Sep 2026 17:24:26 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  3 Sep 2026 17:24:06 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260904002423.3154436-1-seanjc@google.com>
Subject: [PATCH v4 00/17] KVM: nVMX: Adjust VMPTRLD/VMPTRST behavior with
 active eVMCS
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, f734222792@gmail.com, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Sashiko Bot <sashiko-bot@kernel.org>, 
	Yosry Ahmed <yosry@kernel.org>
Content-Type: text/plain; charset="UTF-8"

The first four patches are Vitaly's series to adjust KVM's emulation of
VMPTRLD/VMPTRST when the vCPU has an active eVMCS to match Hyper-V, and more
importantly to not put the vCPU into an infinite loop.

The churn piled on top came from wanting to use KVM_ASM_SAFE() for more VMX
instructions to verify the RFLAGS bug+fix Sashiko pointed out, lack impulse
control when it comes to cleanups, and Yosry being a bad/good influence.

v4:
 - Redo the VMLAUNCH/VMRESUME handling, dedup eVMCS as well. [Yosry]
 - Give vmread() and vmwrite() the same treatment. [Yosry]
 - Drop pointless returns from eVMCS setup.

v3:
 - https://lore.kernel.org/all/20260826233919.998904-1-seanjc@google.com
 - MOAR PATCHES.

v2:
 - https://lore.kernel.org/all/20260818165258.2613603-1-vkuznets@redhat.com
 - Fix build when !CONFIG_KVM_HYPERV [Sashiko]
 - Drop now-unneeded evmcs_vmptrst() [Sashiko]
 - Avoid hardcoding VMPTRLD insn length in hyperv_evmcs [Sashiko], use
   KVM_ASM_SAFE framework instead [Sean]

v1: https://lore.kernel.org/all/20260814162221.2144473-1-vkuznets@redhat.com

Sean Christopherson (13):
  KVM: selftests: Don't clobber RFLAGS in happy path of __KVM_ASM_SAFE()
  KVM: selftests: Assert success in vmptrst(), kill off vmptrstz()
  KVM: selftests: Always assert that vmxon() and
    prepare_for_vmx_operation() succeed
  KVM: selftests: Always assert that vmclear() succeeds
  KVM: selftests: Always assert that vmptrld() succeeds
  KVM: selftests: Drop useless return code from load_vmcs()
  KVM: selftests: Add macros to handle simple VMX instructions
  KVM: selftests: Drop dead return code from evmcs_vmptrld() and
    load_evmcs()
  KVM: selftests: Dedup assembly code for VMLAUNCH and VMRESUME
  KVM: selftests: Assert success in vmlaunch() and vmresume()
  KVM: selftests: Add __vmwrite() and use it when initializing optional
    fields.
  KVM: selftests: Always assert that vmwrite() succeeds
  KVM: selftests: Always assert that vmreadz() succeeds

Vitaly Kuznetsov (4):
  KVM: nVMX: Make VMPTRLD result in #UD when eVMCS is used
  KVM: nVMX: Make VMPTRST return eVMCS GPA when it is used
  KVM: selftests: Adapt to the updated VMPTRST behavior when eVMCS is
    used
  KVM: selftests: Check VMPTRLD with active eVMCS

 arch/x86/kvm/vmx/nested.c                     |  24 ++-
 .../testing/selftests/kvm/include/x86/evmcs.h |  78 +--------
 .../selftests/kvm/include/x86/processor.h     |   2 +-
 tools/testing/selftests/kvm/include/x86/vmx.h | 165 ++++++------------
 .../testing/selftests/kvm/lib/x86/memstress.c |   8 +-
 tools/testing/selftests/kvm/lib/x86/vmx.c     | 143 ++++++++++-----
 .../selftests/kvm/x86/aperfmperf_test.c       |  10 +-
 .../kvm/x86/evmcs_smm_controls_test.c         |   6 +-
 .../testing/selftests/kvm/x86/hyperv_evmcs.c  |  83 +++++----
 .../selftests/kvm/x86/kvm_buslock_test.c      |   8 +-
 .../selftests/kvm/x86/nested_close_kvm_test.c |   6 +-
 .../selftests/kvm/x86/nested_dirty_log_test.c |   8 +-
 .../selftests/kvm/x86/nested_emulation_test.c |  23 +--
 .../kvm/x86/nested_exceptions_test.c          |  29 +--
 .../kvm/x86/nested_invalid_cr3_test.c         |  14 +-
 .../selftests/kvm/x86/nested_tdp_fault_test.c |  16 +-
 .../kvm/x86/nested_tsc_adjust_test.c          |  10 +-
 .../kvm/x86/nested_tsc_scaling_test.c         |  12 +-
 .../kvm/x86/save_restore_pf_stress_test.c     |  14 +-
 tools/testing/selftests/kvm/x86/smm_test.c    |   4 +-
 tools/testing/selftests/kvm/x86/state_test.c  |  70 ++++----
 .../kvm/x86/triple_fault_event_test.c         |   8 +-
 .../selftests/kvm/x86/vmx_apic_access_test.c  |  20 +--
 .../kvm/x86/vmx_apicv_updates_test.c          |  16 +-
 .../kvm/x86/vmx_invalid_nested_guest_state.c  |  12 +-
 .../kvm/x86/vmx_nested_la57_state_test.c      |  10 +-
 .../kvm/x86/vmx_preemption_timer_test.c       |  24 ++-
 27 files changed, 387 insertions(+), 436 deletions(-)


base-commit: 76671054f9a1ff6abb976583cd8da37650acdc97
-- 
2.55.0.979.g7e5102b832-goog

