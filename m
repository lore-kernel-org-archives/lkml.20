Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395277;
	b=c0Xj/OGDSvBhoJL0tdo/sPZSZSil5gg5diYzs6QqpG6udNKvVrICGoB04nwwXkleUvUM
	 FEpyxXtTmOZ4blzqdqooLEemN9gnVItw97tyOm6scUcNvRv8IKZ77ee1I5ilAsSp2PGWh
	 BRUHBmDJk7ImEXJDgo4T9oF56r0QiZDgjJpfFxsOD94gzhd/JZjKa7tCtOGupT6DObj6a
	 0zor8/5rlP+VCPKbHsay9x8aoaIUjSgmM3SCDSi1WLpmUAHWr5ob2mhR8wv3ISpM13QGV
	 IRBzE/R6s5g2/rE/HP6PUg2IadOBpNzeKD7/NL10IUZ/0LsUF/OQLNz+D4c6Iy1JkTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=GVfrMv/JwLPpbAn4FrjFqU3DE6u8ipaxUY48dYc7+h0=;
	b=0GGrG7bmxzi9EmUUmUq2HVKjow4d1Zal0cWwo8MYSnDcvYj8UylR975mqdOhVlmxiEic
	 A7PnrKEahqoFNjZ72Gi982LLFzDAmhQsMRuTTBoKgI3+PfzMNP0Bz89VC8qdF0jUoemxR
	 muM8RmMb/0iZDWZ/LJmJQf0im22War7QBZYmy6qD7k4TlPABpG7v90PVhgMbF82KSCMN9
	 4qR4BZ84MUc/YsU+tThag4ow/6YSdf69cq1VfkKuZzA6HDqf8yMiWNXTioM7vqxZWzuTI
	 akNC8Ayv+FbxgtYwvJwv3idUCRsfGGaHRECCTYvxfdMbeZOqq+z0ai7TNoO/VYujboA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Tuh4TM7o;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB7B606B798
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:21:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FB7B606B798
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Tuh4TM7o
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ea63087d79so10957285ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793395276; x=1794000076; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GVfrMv/JwLPpbAn4FrjFqU3DE6u8ipaxUY48dYc7+h0=;
        b=Tuh4TM7oSQ5uc31/tj0In4W/mmQosgiHfmEnO8V5wmXtc43tZ4JxyAJCEDxd4DmrW7
         9CJaCj8qIlrQw239S+bTeNURo+78+tkkts807CDGXazpAbLSvWz6iQyFBCzScAkbqtnx
         jZCFyAoE+ygfuDiq+NAraXnkIDK8CMq+R+4PIHPTgtj79y+oge7GQtJOyqMmHFHp/lQ5
         bgrWK6cyz8NgnVb1/PygMhQIEex4LuU/YQHGVuxnErULyltbYuc96ajn8Blzd609IRYO
         lmQuX8pZxFu/CzJnLLckZs5O142gvdHQLJiQn0YelFSOgREnxgHvWiEaVkniMgNevuoG
         Ja5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395276; x=1794000076;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GVfrMv/JwLPpbAn4FrjFqU3DE6u8ipaxUY48dYc7+h0=;
        b=05mSfRotQ16tz8VR3joa+heY0g3ialCdBeVD90MsT/LIcliV+f86/cXrOGYAIPTHnD
         bAJt7FQm1t8vrQMZcvtylKdJpH/pa8K3ASOB/aaq69CbopvKNH4TUvHYFC/s0+nSpT11
         CVFXiIMzbXbZhWWKzdVZL4Nw8MTTwO2mF1VueECGxRwu9cJhHRb3VW8KtnSNLbsxyvQg
         eFOFtwLhDCcnLpUGHsZYC0QX+M7AXTNraj9nDefCOnuGJch6JokBhsg9aysw7cmmkXrX
         b+YscSPob8LezYTEbZMVN3JmKSlvpiWVWtsu545QuQacPnCEeYXXi4Qwm/4qfrYLoacQ
         SzOg==
X-Forwarded-Encrypted: i=1; AKwUvBymIGcUHvoQxTvXMohmk29mKyNpDKJblaPb21l4uKioV36q3NDpRGl/R317CCpJ27L6NvQLmbArV/7hBEM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVsLeq8fpg46sXy/UVKFX0Cu3psIOlZzWLiji1Bv0hKwL8E7WD
	yPRJzu4fovrjHMsEdokVYKjjWPaZsViT+0d/CXIFkCGZ9kQsjFhNyfRQxJARi0/8dL8nJgFWUyJ
	TXyeDMg==
X-Received: from plbme3.prod.google.com ([2002:a17:902:fc43:b0:2ea:884b:e7df])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:cec4:b0:2e9:851a:7188
 with SMTP id d9443c01a7336-2eb3649c631mr36367485ad.23.1793395275725; Fri, 30
 Oct 2026 14:21:15 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 30 Oct 2026 14:20:50 -0700
In-Reply-To: <20261030212112.2598640-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030212112.2598640-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261030212112.2598640-3-seanjc@google.com>
Subject: [PATCH v4 02/23] KVM: nVMX: Don't force a full nested VM-Exit when
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
2.56.0.385.gac671c819a-goog

