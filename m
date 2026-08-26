Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199A0479883
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762571; cv=none; b=Eze/A2LIrWbfS0vC9fw2BgMt1Zfj+Ucc8W0O6DD2d2/7zKOkgpFvrddtNOqLmYtgx1rYXKz/RzhPFnConllpc3jx/0CzInTJM/XhIirxriC4v+y06qiIOcyOL/ncml8uMxDk20PH+fPWkbrHmFeS+sMuNATB7bPUaMS4FVa+hzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762571; c=relaxed/simple;
	bh=i578dgYavrIdohpu+SpEj4jJ+sVyZzrBwA5orlX4/TM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=C+myOhUB4Hd/zozmJhcoqAUV+SXGnkeGY7QnafphnskaUW5yCbuTPK9as4qfWmrePRVuotXJx2g+sGb6wLWcO/yUmRIRhFTXqT6vhMBVMlmFbujgbEebo2drJ3QyKJEhgvxkwJTCsuZDy0/ugnu8OvRVoZ4iZlq9AcFA1vJCWDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tSUIZZ0y; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tSUIZZ0y"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbedb8673ceso1145281a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787762538; x=1788367338; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t27G+87/xldPf9EXxl/42NH6liZLtdScRqOAABQHwp0=;
        b=tSUIZZ0y4SjXHgxEnyp4zLNI5D3UOVcK+Bn9+5T8D2Zo4qXvCucomKd8DEL/6w3H8t
         cMZG948x2CaiyVn/yZOQixWIe1lDynVzttkCjkR5zxhXF5uHocnaD+hqtUj3f5pnc/xA
         tmjOfZvI1S6e+hkWCqg3iMhywnYbLL503JBAVgDwMyXQo7RuSMLZvvaWUAHTDF8kd0fa
         qSp4laKfkZKUZ+dSAUipo1jlL0rwaNGMjn7dCfe5B8sncmmzX7I/UrGlJGBRVjxCoyNC
         XtdsK1HPHOI1xe0dimhify2pUEzwOWjG2Ic954iXIO/J/b7X35Y/VcUbCI3F3UEoJBu8
         WAdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762538; x=1788367338;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t27G+87/xldPf9EXxl/42NH6liZLtdScRqOAABQHwp0=;
        b=KgkseHCKcXBXoyk+KTgXcsiuag3fe+jylduLGKCS8i8ZJ1ulwm5+Pb2kdIWFr2sMqb
         CMncskDqwl8MJkJ27DXPleqO/RJaVHu/Ut8R1cGIa+ZFuOe+L4mbo9m0q8fa9Z7Y+u+p
         1YD8VQATJbjwVJjwHNmL1v7K3g4zVUUdEKRC8Gp8xJ5VUP3vqAZUoNeVIb9wLj2VY6FY
         W7DiKFTc9hFaIHOyLC4OLpE4oE8CmgDnOe1u5/85MxA5qD31eemAFtk+cm9Ssj+KYLyV
         IU2dTnjEFp8v/ntpy8FkgIfhdIIex/G6CxryZqdh9so5z9236VOcRZBtCvcDCltmNmA3
         eSmQ==
X-Forwarded-Encrypted: i=1; AHgh+RoLtStVoF9ZylAJzPnynP6ne399lqBQYU5EfZDYOkqGW0NfvTlvPSHg+2w2QfJaI09EI1NyB2gAuSSEIoI=@vger.kernel.org
X-Gm-Message-State: AFuF++lNSndh7P60p/8OHIwTZTGkxtHvdHAG9W17Jo8q485BREEN/0gc
	VC5skgwxSAvV/yp/0GMcit07VT7G0svEEx3bCqwmKeaaALK9n9k25Lyg8l5ZnndW6CPqPK4S88H
	VanQRsQ==
X-Received: from pghp20.prod.google.com ([2002:a63:fe14:0:b0:c9a:c533:8316])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4f92:b0:848:2e3c:9955
 with SMTP id d2e1a72fcca58-85371fa599amr14451999b3a.4.1787762537296; Wed, 26
 Aug 2026 09:42:17 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 09:42:11 -0700
In-Reply-To: <20260826164214.756512-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826164214.756512-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.860.g4b6b3295ed-goog
Message-ID: <20260826164214.756512-2-seanjc@google.com>
Subject: [PATCH v2 1/4] KVM: x86/mmu: Reload MMU on *every* page pre-fault attempt/iteration
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Reload the MMU (which is a nop if the MMU doesn't need to be reloaded) on
every attempt to pre-fault a guest page, i.e. when the page fault path
signals that the caller should retry.  If the synchronize_srcu_expedited()
in kvm_invalidate_memslot() completes before kvm_vcpu_pre_fault_memory()
grabs SRCU, but kvm_mmu_reload() in the pre-fault path completes before
kvm_invalidate_memslot() triggers x86's "fast zap all", then the pre-fault
task will reach kvm_tdp_page_prefault() with an invalid root.

Attempting to fault-in memory with an invalid root ultimately puts
kvm_tdp_page_prefault() into an infinite (breakable) retry loop, which
manifests most obviously as a hang in the pre_fault_memory_test selftest,
but also eventually causes RCU (SRCU?) to complain.

  INFO: rcu_tasks detected stalls on tasks:
  000000000cda47bd: .. nvcsw: 6/6 holdout: 1 idle_cpu: -1/25
  task:pre_fault_memor state:R  running task     stack:12696
  pid:95588 tgid:95588 ppid:95584  task_flags:0x400000 flags:0x00080801
  Call Trace:
   <TASK>
   lock_release+0x4e/0x320
   __get_user_pages+0x546/0xcd0
   up_read+0x1b/0x30
   get_user_pages_unlocked+0xee/0x350
   hva_to_pfn+0xd3/0x3d0 [kvm]
   lock_release+0x4e/0x320
   xa_load+0x5c/0x170
   xa_load+0x14c/0x170
   __kvm_faultin_pfn+0xd9/0x130 [kvm]
   lock_acquire+0x65/0x2b0
   lock_release+0x4e/0x320
   kvm_mmu_faultin_pfn+0x1e1/0x690 [kvm]
   gup_fast_fallback+0x63e/0xdf0
   kvm_tdp_page_fault+0xeb/0x140 [kvm]
   kvm_mmu_do_page_fault+0x12e/0x200 [kvm]
   kvm_arch_vcpu_pre_fault_memory+0x16e/0x200 [kvm]
   kvm_vcpu_pre_fault_memory+0xc1/0x1f0 [kvm]
   kvm_vcpu_pre_fault_memory+0x116/0x1f0 [kvm]
   kvm_vcpu_ioctl+0x3a4/0x6b0 [kvm]
   clockevents_program_event+0x5d/0x170
   __se_sys_ioctl+0x6d/0xb0
   entry_SYSCALL_64_after_hwframe+0x4b/0x53
   do_syscall_64+0x10a/0x480
   __irq_exit_rcu+0x8e/0x140
   entry_SYSCALL_64_after_hwframe+0x4b/0x53
   </TASK>

Fixes: 6e01b7601dfe ("KVM: x86: Implement kvm_arch_vcpu_pre_fault_memory()")
Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 064ecc33b926..3220f05387b5 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -5061,6 +5061,10 @@ static int kvm_tdp_page_prefault(struct kvm_vcpu *vcpu, gpa_t gpa,
 		if (kvm_check_request(KVM_REQ_VM_DEAD, vcpu))
 			return -EIO;
 
+		r = kvm_mmu_reload(vcpu);
+		if (r)
+			return r;
+
 		cond_resched();
 		r = kvm_mmu_do_page_fault(vcpu, gpa, error_code, true, NULL, level);
 	} while (r == RET_PF_RETRY);
@@ -5101,14 +5105,6 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
 	if (kvm_is_gfn_alias(vcpu->kvm, gpa_to_gfn(range->gpa)))
 		return -EINVAL;
 
-	/*
-	 * reload is efficient when called repeatedly, so we can do it on
-	 * every iteration.
-	 */
-	r = kvm_mmu_reload(vcpu);
-	if (r)
-		return r;
-
 	direct_bits = 0;
 	if (kvm_arch_has_private_mem(vcpu->kvm) &&
 	    kvm_mem_is_private(vcpu->kvm, gpa_to_gfn(range->gpa)))
-- 
2.55.0.860.g4b6b3295ed-goog

