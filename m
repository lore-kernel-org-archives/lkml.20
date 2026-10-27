Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793139135;
	b=A/jngMYQoeFepBQrWr89Yd4e5MBfs2nHCEZkDaoNMa5V9I+PD5hFw75jLIm7+M1n4NHa
	 Kwh5AarmKFfGdra9QXfRG1nyAQbP9Y9fNMg4i/jV6+4h3uGjoDjXjUNoJXZdC1pIUi3Ch
	 LJwgNjku9fNWYZLQuGvirk/RQGkNbF/9b1sEQf+sMotKaWplJrcv621mrf8qxgJJuCAYZ
	 iBrUCkkjV4lSZIYLT0U68osfTzVxEQ0L5aSJRE7PbMiYgVf/1n3dPNnrOWdYqt2572mp1
	 fNS3Vd92pk5JWf7EoupoEUtKsNbiRUjMT9yLQUxFahj+ugdsenV+3ZVQnCdfVOj2hSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793139135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=4+wo0Hnq368mIoBgSKtnd7+wHbHIcDQRZtxGt/eUG9s=;
	b=orQZcSu/O7bIev+t7ZB0SP7k5cHWoosj5us974MmNgJfkmx+f00Rq0j/758TN/toEAa9
	 Oplt0gHpxhWcWL2IvRZAJcjsiM/afQQ6xWuUyXZ1eyVgj60TEQvAk87qUdE5cteNY4POI
	 eco1WVy5XIgz+2AqniT7qcsAVMjlioCnifqoA20UbTcgLryU9gFfdFoYRhrehUXCXRNJv
	 JmGrnLUVzQZQROEv6OTcOGFzM3M3uEuoXpJSToYZJJAnz7t47u8hvEXt5HD1SlRajNcBF
	 +HclOFfJdV3fxRq/LVlQenRr/oBGTjosgjLTT9SAigWNvF9Dzfn8R+BjAI0wrWNbk8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=J2SuGckM;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1DD606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:12:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C1DD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=J2SuGckM
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e60770381cso2684245ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793139134; x=1793743934; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4+wo0Hnq368mIoBgSKtnd7+wHbHIcDQRZtxGt/eUG9s=;
        b=J2SuGckMEea6+N7uGSEKo7pSzH3SEPkJfVgT/TxTooWozy6PkCcqJ40AV8sPipP7lI
         WOO1ylny7xZWxEtWgh8xhHbO+fvCdHLsmTj/A5+aJisxnUklHEuxqRQrbTlgutbXOt6N
         pPAbj0+XoLo9DrhQTcPvQHGdA/F4AKc5E3W2akZHCpm+/xBwW2H2081QpRbSgRSk5q5J
         aBicYmk+XpN3YhK89kypo5t8RyaIVPIPeHbb8eC+axo9JpY/mrcks0u6KRoBWAEgqwXR
         uk70HunxhpzV9315Xulpbf6yspq4FJndswmETStyMa4vCMOn1rjVE4X6VlCPUNr+MarZ
         LuEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793139134; x=1793743934;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4+wo0Hnq368mIoBgSKtnd7+wHbHIcDQRZtxGt/eUG9s=;
        b=OG1u71w5pCBKcB9B9/RyQQN9D4iXOkccnOu3CnSoVWiPiEXs87SHoc5g+yF+U/YCKr
         PBKDLJDMoBif3BtaUKP+Wqro6pmUNYQqCzpS64l4xS56Wz53YulK1lwRHr/q3pClAoPN
         sW/EMnKhSbLCq86CiUI/0qRAsWEsyIQbfKj0G9+rlIOMiTt9EuEKdqAROatu6/4XsFRe
         N83EAemC/i4Mg9sFY0XHcBL7ZW17KYz9PHP0sZ5JwgyJ7NRzp8gd25GnxBMi1ZKdWqYO
         tt6J95+/eJEfJ5is7WNlZC0cFN7OKY2tnb1wQH8FbkY+Sie81rPpOWEmbW4E4TWRO/98
         2Tfw==
X-Forwarded-Encrypted: i=1; AKwUvBwaRO8jUAmUn3hXceOuvp5BVWn2ZvX6gLRVkPxLkmyN/+7CqHoopudXKze8C/Oh6BC2k7H/jOI10rfJ4+I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfgDTHOqYyYeXhSGfwT2aLXn+wmwA9z3mqyRxbrPWc9q0/wDLM
	gD7qRNAFW9A0lFqW0FaGCFw7TrDYdPXcuzyIQWdp/vsbmQ5K0zUXFgKKyZJupRQfDZjtQ/LjVnB
	lWG8cpg==
X-Received: from pjzj16.prod.google.com ([2002:a17:90a:eb10:b0:3aa:dfda:ecdb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:582e:b0:398:e96a:8999
 with SMTP id 98e67ed59e1d1-3ae57f637c3mr292276a91.16.1793139133835; Tue, 27
 Oct 2026 15:12:13 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 27 Oct 2026 15:11:55 -0700
In-Reply-To: <20261027221209.1560865-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261027221209.1560865-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261027221209.1560865-3-seanjc@google.com>
Subject: [PATCH v3 02/15] KVM: nVMX: Don't force a full nested VM-Exit when
 destroying a vCPU
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>, 
	James Houghton <jthoughton@google.com>, Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"

For all intents and purposes, revert commit b4b65b5642d6 ("KVM: x86: cleanup
freeing of nested state") and go back to manually tearing down nested state
when freeing a vCPU.

When a vCPU is destroyed while L2 is active, KVM synthesizes a nested
VM-Exit, which flushes the cached shadow VMCS12 back to guest memory:

  vmx_vcpu_free()
  |-> nested_vmx_free_vcpu()
      |-> vmx_leave_nested()
          |-> nested_vmx_vmexit(vcpu, -1, 0, 0)
              |-> nested_flush_cached_shadow_vmcs12()
                  |-> kvm_write_guest_cached()
                      |-> __copy_to_user(ghc->hva, ...)

Accessing user memory via a memslot during VM destruction is broken, as
there are no guarantees that current->mm == kvm->mm when the VM is dying,
because the last reference to the VM can be put from a different process
than the original creating processes.

And even if the original process does put the final reference, during
process exit, do_exit() calls exit_mm() before closing file descriptors, so
vCPU destruction runs with current->mm == NULL on a borrowed lazy TLB
active_mm.  If the borrowed address space has a writable mapping at the
to-be-written userspace address, KVM will corrupt an unrelated task's
memory since uaccess APIs, including __copy_to_user(), don't sanity check
current->mm (and *can't* sanity perform KVM's current->mm == kvm->mm check
since that is firmly a KVM-only concept).

Furthermore, the shadow VMCS flaw is only the tip of the iceberg, as the
MSR load/store lists mean that emulating a nested VM-Exit can read or write
an arbitrary set of MSRs, e.g. if MSR_KVM_SYSTEM_TIME_NEW is in L1's MSR
load list:

      kvm_arch_vcpu_destroy()
        kvmclock_reset() - takes pv_time off kvm->gpc_list
        vmx_vcpu_free()
          nested_vmx_free_vcpu()
            vmx_leave_nested()
              nested_vmx_vmexit()
                __nested_vmx_vmexit()
                  load_vmcs12_host_state()
                    nested_vmx_load_msr() - writes the MSRs that L1 listed
                  kvm_cpu_has_injectable_intr() - reads Xen's vcpu_info
        kvm_xen_destroy_vcpu() - deactivates the vcpu_info cache

processing the MSR write puts the "pv_time" cache back on kvm->gpc_list,
and the next list_del() writes into the freed vCPU.  And as effectively
pointed out by syzbot[*], attempting to fix each case individually is a
losing game of whack-a-mole.

Deliberately leave "nested_run_pending" as-is, because even though doing so
creates potentitally inconsistent state, KVM should *never* consume said
state while freeing a vCPU.  I.e. if leaving nested_run_pending set trips a
sanity check or bug, then that just means there's more fixing to be done.

Open code only the "free vCPU" path, i.e. keep emulating a nested VM-Exit
when forcing a vCPU out of L2 via vmx_leave_nested(), as there are a number
of updates buried in the nested VM-Exit flow that are needed if the vCPU is
going to run in L1, e.g. clearing pending exceptions and MTF traps, setting
the TSC offset+scale information back to L1, and so on and so forth.  Note,
this means svm_leave_nested() is all but guaranteed to be buggy, but that's
basically an open secret at this point and at least any bugs "only" break
L1, i.e. don't corrupt host state as is the case for abusing nested VM-Exit
when freeing a vCPU.

Link: https://lore.kernel.org/all/6ac0145f.34119e79.2f92f3.0003.GAE@google.com [*]
Fixes: b4b65b5642d6 ("KVM: x86: cleanup freeing of nested state")
Cc: stable@vger.kernel.org
Co-developed-by: Chris Mason <mason@kernel.org>
Signed-off-by: Chris Mason <mason@kernel.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 9b0bfa2f854c..49c4529901c5 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -385,8 +385,15 @@ static void free_nested(struct kvm_vcpu *vcpu)
  */
 void nested_vmx_free_vcpu(struct kvm_vcpu *vcpu)
 {
+	struct vcpu_vmx *vmx = to_vmx(vcpu);
+
 	vcpu_load(vcpu);
-	vmx_leave_nested(vcpu);
+	if (is_guest_mode(vcpu)) {
+		hrtimer_cancel(&vmx->nested.preemption_timer);
+		leave_guest_mode(vcpu);
+		vmx_switch_vmcs(vcpu, &vmx->vmcs01);
+	}
+	free_nested(vcpu);
 	vcpu_put(vcpu);
 }
 
-- 
2.56.0.307.g5fe7bd680c-goog

