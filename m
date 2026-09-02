Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99E4442369
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 23:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788390576; cv=none; b=c10TqZu8+edpn5WVcVhIamP7WBibgqv0Dmc0fglvpDN8orOQcFIiQKOTY17sIblZG0iiV+8lX/savyltd44cXnCxDZHJL1bO0BS2TybJc0nZV96WvkueYcUiKM2y/ZGfjPMmRETRSnZWwLQgOLpCKn2+vsz1PzdG6yrLbdljQ3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788390576; c=relaxed/simple;
	bh=vOLWLIpAOn8agr/fPKKQvzK8HpLJg6z1A2uzVnNX/2o=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=eCVKNAjgtd4RWro4kGTnaW8fZ/7PphVcoaeM1r55ws9zST4/Dad0gwhTFcqV9KJb4mBiKoHu6zU7JKXBSIW86XMTMDV4zcqsXtgQ39R2gHGzOQ9yBtUiwNLJe+sLM0E+d10BkIemYRbADR58Xj7B+bzZs0zNF9XYrMP6/VxL6LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f2oByYTT; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f2oByYTT"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1b6f65dacso1985292a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 16:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788390574; x=1788995374; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9JHq/z+2fcrSIk4Q9ayuvYAiAfDsx8YFl0teuRj6jAk=;
        b=f2oByYTT07R+eSENiun/o8TqlcycFDcSO47eOIXxUxUXZrjyTMIkcgn07Oc45WrpPx
         RPiRnZL9XZaxHR4d09BUlBlDbLON0kwIvmiGsPKibV1+jiyqkLQN9XWEAAps9VMwYjCM
         J4ScAXLx9x+/beya7bU8g0G/bOLTiuSkiu03QTQocpS9SH5mKofkJkScDRoamZLGZ+XD
         i2OMJWyIIwgjDeza9uisP/wT7S2o3gmKj8eeVw1Gjw2GP5PukHQtPqoXt1EBobzLGiu9
         KHsQZ1tDjWUAlZB+TtzwBbEX86X1vFdrFcWW3wTko/DkVQqRPP5pplRHTjk8d4V5IyU/
         iEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788390574; x=1788995374;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9JHq/z+2fcrSIk4Q9ayuvYAiAfDsx8YFl0teuRj6jAk=;
        b=eTmwTI9lPFFO1rctURpJ4lJ3uw9G10vWxQSRFpXhcONsCrmIbQ9efY5FcFWZvU96Y5
         2RtK4ppqBbnZtirZ585s8tblaVGyRFpfHDC37r9fBkxij7EFm+po3Ydtk0VKdpPSnHgK
         O/MdHWgGdr9uSHEmpGcUUhaoTpvzweJVFNZNTZxbrGMFm1rgKB9zbMGsO2bAIQzwnxca
         3JqjPkuA51AACArd0S/jLaebzS0Kl9bfGcklmi0oVATgphdaMtAHZ6I9mBWErh2nTFJr
         /BHAOMuGwpSjFE1K0NdloWnQ9G1VugA5SyM6TLyz0LC+NJRbVmRR31Aw5v0iPr8Kin7A
         sY7A==
X-Forwarded-Encrypted: i=1; AKwUvBwgCD8oZMrgR0PlZa26xkSecZDWcF0ff4ecV2xwKmhB+Je6jnDsjMK6GrG3kOpx4Ev/SdWt+G2j13N913s=@vger.kernel.org
X-Gm-Message-State: AFuF++nkuq8O8lzTbxzCFaf+I/UubSgYCy44BU1rIBUlvT2Y/Is135ST
	yxnXuDNTZAfhIwc2vckHnHfMiLeo+cl5H4Yv1zZYvv99SFRylS73x9PYszi/wFYsOd6wA4G+4DJ
	ZUjihpA==
X-Received: from pfbkr10.prod.google.com ([2002:a05:6a00:4b4a:b0:848:5480:9ac7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2353:b0:842:2419:6c0b
 with SMTP id d2e1a72fcca58-85ed7d2185cmr11113689b3a.10.1788390573643; Wed, 02
 Sep 2026 16:09:33 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Sep 2026 16:09:29 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Message-ID: <20260902230932.2760127-1-seanjc@google.com>
Subject: [PATCH v3 0/3] KVM: VMX: Explicitly track TDX VMs' root level
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Fix a bug where a misbehaving (or niave?) userspace can configure guest CPUID
such that KVM will use the "wrong" root level for its mirror EPTs and trip the
KVM_BUG_ON() in tdx_load_mmu_pgd().

v3:
 - Use kvm_mmu_get_max_tdp_level() in __kvm_mmu_create() to avoid what is
   effectively a false positive WARN. [Sashiko]

v2:
 - https://lore.kernel.org/all/20260826215258.937210-1-seanjc@google.com
 - Rewrite the comment in kvm_mmu_get_tdp_level(). [Rick]
 - Check for kvm_has_mirrored_tdp() in kvm_mmu_get_tdp_level(), and yell if
   arch.mirror_root_level isn't also set. [Rick]
 - Separate the removal of TDX_SHARED_BIT_PWL_{4,5} from the bug fix. [Rick]
 - Fix a buring => buried typo. [Binbin]
 - Collect Tested/Reviewed-by. [Binbin, Rick, Yan] (I applied 'em only to
   patch 1, please  holler if that doesn't seem right).

v1: https://lore.kernel.org/all/20260814224509.2342760-1-seanjc@google.com

Sean Christopherson (3):
  KVM: x86/mmu: Use KVM's max TDP level to determine need for 32-bit TDP
    root
  KVM: VMX: Explicitly track TDX VMs' root level instead of guessing it
    from CPUID
  KVM: VMX: Drop TDX_SHARED_BIT_PWL_{4,5} and dedup related code

 arch/x86/include/asm/kvm_host.h |  1 +
 arch/x86/kvm/cpuid.c            | 14 --------------
 arch/x86/kvm/cpuid.h            |  1 -
 arch/x86/kvm/mmu/mmu.c          | 21 ++++++++++++---------
 arch/x86/kvm/vmx/tdx.c          | 20 +++++++++++---------
 5 files changed, 24 insertions(+), 33 deletions(-)


base-commit: 76671054f9a1ff6abb976583cd8da37650acdc97
-- 
2.55.0.970.g62bdec98f9-goog

