Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793214191;
	b=CSbam4NSfl3lejUjQ15yYIrsWH7mthF9A9IzIBWAWgPePY+c/3B1v071I9QeDltXxEzV
	 egtPEcIXE/PaW4jujX10l7XQl0SWU9a4mVJBlGCuwFUxm8Al1oA1R7mk4nsXyhhKr6/Ur
	 cWg+R3jAnEkwYa6p+LxH9lgTlRNoISE2z8snpaS4CNVeGqSsJObXdqrkwlEk0+inBMrcV
	 vwMzPA7kq3Tq/mpfBRe03nJHF0HKm2njRTWdtKVz5r2ddYY2QVSp7yVpAYM4UCPh0LxEx
	 D2ZjI9qTdCbqN8VFooG4ZwJ1WmrbyaLdpXfWvIvyCi6lkiYHhGiP8r+6u+1BSdqsCZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793214191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=jCCEmu80ia44kI2vyDb6i59VDXRIs93I0WproZ1Xw/A=;
	b=HuLdvv87mSKSyDWv+cjokw6IRpf0ci8lPJMYjZ5pOAuoCRCZdJJF3MrjqOs5EeeucPFk
	 Xp5oH+t2zRWYpU4njL7llmY0CNpkbRN4S6+deL07G7lj2Lb+48dFEM4mrprClfHr3qeqU
	 JlHTEoH8/qJ8CSzFWVqfwwHqkzIqfgvwSpDHeuSfVBi1KiAwUJZHVTrHa3CIQTpxVE+RC
	 896GqowfRT/CHNg6rtFkUJteRBNY/PclV6OWSjl//wq9nZnrBJnszIooMVu4TI8WZwyUe
	 bDYuUsqm+NujW80SuQ5uzwHzmVx3mpuALvvWX2KfJRrZ9H5bU+P4TIuERBpqR9buOVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VKCoKKaW;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDD660A6F46
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:03:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BDD660A6F46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VKCoKKaW
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac76132001so1031233a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793214191; x=1793818991; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jCCEmu80ia44kI2vyDb6i59VDXRIs93I0WproZ1Xw/A=;
        b=VKCoKKaWzE2ZwVdJNmZ2sHfiG+KYy5lqQ6i0TsdahSfguB8+ESncbH3xe7BAm5PMEr
         Q2jNZybsr8T/OPE4rcgH6TJFsrEHx25QQodbvFRK9rmyThmhDrBShJEtAZPC5lf7Dw6Z
         n0j2lj1MdfRpm2YvS/mAQC7pHLFF02JaJLFKDf/j/2o6AD5FxpQ2Mykl2OvaoWH/q5SO
         11SmykgHIBFTO4Wqjb/oz7PvUtp0kSs/YxJVlLruwf+/gTk9MyKnG/GmkJvBgumlE//6
         +vR0EfuEnrgATAOhzav2N012MxlYmtHXZiPybtbyC9U5lzJn9XmnQ3/lZZ+pED1y9sIm
         /ArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793214191; x=1793818991;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jCCEmu80ia44kI2vyDb6i59VDXRIs93I0WproZ1Xw/A=;
        b=W2wex6kuLxEpikgGGSy7KtslI4UaqkO9y1i7ILPsegmlRYN3P75qs2pZZq04ZxSHmi
         lwi3jBCwdGf+SOISJ8UxLdVA62rwnuy39MLb3uTex2XCpHHOdFjfrUMTwmAZUd/xXZ3o
         JSvH4GXW0QyMRzcDzeQdK3sGP1PATL1K1cMBC4o0f9fGo+BWy3O6kgmvx9MLPp+pgavX
         +gyfbRgD7s1nJlZH2oh1y9coy9ofJEn14ncQnhXgbmnhYRTABNs/7oUMXLvqTxxtLnIK
         Nc/9jjbHXetUk0amKE/599TL22Bzma+MTzPWEBwApaS1eBytLNu9IypMAZ4s8g2pi8Fp
         6MlA==
X-Forwarded-Encrypted: i=1; AKwUvBwj6qZZFaJSklA9KpjTYq5lkQ+l+wUX9heWy2SbXllMYol+AsFMEznhQBa92iZWxqcILeFyj1ZunKhBias=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYKXcbSqpH9a6W2QficsmdqVeJLJ0kkEH7Fqw323y+UiY0JZVS
	mN6wKAomCzKOjusDmP9BltGqciCBq0kS3kbyP4wk3YQ0IR0xO6cdAmwUC/xP5y2XuPXBbFh2DD1
	69xCJJA==
X-Received: from pghv3.prod.google.com ([2002:a63:f203:0:b0:cd6:b233:e4aa])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4b06:b0:3ab:b64:5893
 with SMTP id 98e67ed59e1d1-3ae581bc654mr2418362a91.53.1793214190430; Wed, 28
 Oct 2026 12:03:10 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Oct 2026 12:02:59 -0700
In-Reply-To: <20261028190259.1819571-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261028190259.1819571-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261028190259.1819571-8-seanjc@google.com>
Subject: [PATCH 7/7] KVM: Drop kvm_vcpu_should_kick() and use kvm_request_needs_ipi()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="UTF-8"

Drop kvm_vcpu_should_kick() in favor of kvm_request_needs_ipi() to fix a
bug where KVM will fail to wait for a vCPU to exit guest mode if the vCPU
was already marked as EXITING_GUEST_MODE by a concurrent non-waiting kick.
Because kvm_vcpu_should_kick() (was kvm_arch_vcpu_should_kick()) only waits
(and sends an IPI to do so) if the target vCPU is fully IN_GUEST_MODE, the
sending task will proceed even though it hasn't actually guaranteed the
vCPU as fully exited the guest.

The flaw is most problematic for SNP VMSA invalidation with in-place gmem
conversion, as KVM invokes kvm_gmem_invalidate_start() => rmp_make_shared()
(via kvm_gmem_make_shared() in quick succession when in-place conversion is
enabled.  I.e. if the target has been marked as EXITING_GUEST_MODE but has
not yet received the other kicker's IPI, then updating the RMP will fail as
the VMSA is still in-use and subsequent accesses to the page will encounter
unexpected RMP #PFs.

Note, the bug exists and affects VMSA invalidation even without in-place
conversion, but is significantly more difficult to hit as PUNCH_HOLE and
.release() have to wade through a lot more code and several locks to get
from invalidation to kvm_gmem_free_folio().

Note #2, currently only x86 uses kvm_make_request_and_kick(), i.e. this is
a glorified nop for all other architectures as the KVM_REQUEST_WAIT path is
never taken.

Fixes: 309d28576f0a ("KVM: SVM: Fix SNP AP destroy race with VMRUN")
Fixes: d1a3c2162334 ("KVM: SEV: Forcefully invalidate SNP VMSA if its backing gmem page is zapped")
Reported-by: Stefan Teodorescu <fane@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index f1792256576b..f99a714698e3 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -191,7 +191,6 @@ void vcpu_put(struct kvm_vcpu *vcpu)
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(vcpu_put);
 
-/* TODO: merge with kvm_vcpu_should_kick */
 static bool kvm_request_needs_ipi(struct kvm_vcpu *vcpu, unsigned req)
 {
 	int mode = kvm_vcpu_exiting_guest_mode(vcpu);
@@ -209,11 +208,6 @@ static bool kvm_request_needs_ipi(struct kvm_vcpu *vcpu, unsigned req)
 	return mode == IN_GUEST_MODE;
 }
 
-static int kvm_vcpu_should_kick(struct kvm_vcpu *vcpu)
-{
-	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
-}
-
 static void ack_kick(void *_completed)
 {
 }
@@ -3935,7 +3929,7 @@ void __kvm_vcpu_kick(struct kvm_vcpu *vcpu, int req, bool force)
 
 	/*
 	 * Note, the vCPU could get migrated to a different pCPU at any point
-	 * after kvm_vcpu_should_kick(), which could result in sending an
+	 * after kvm_request_needs_ipi(), which could result in sending an
 	 * IPI to the previous pCPU.  But, that's ok because the purpose of the
 	 * IPI is to force the vCPU to leave IN_GUEST_MODE, and migrating the
 	 * vCPU also requires it to leave IN_GUEST_MODE
@@ -3944,7 +3938,7 @@ void __kvm_vcpu_kick(struct kvm_vcpu *vcpu, int req, bool force)
 	 * check also modifies vcpu->mode and KVM PPC needs to avoid that side
 	 * effect for unknown historical reasons.
 	 */
-	if (force || kvm_vcpu_should_kick(vcpu)) {
+	if (force || kvm_request_needs_ipi(vcpu, req)) {
 		cpu = READ_ONCE(vcpu->cpu);
 		if (cpu != me && (unsigned int)cpu < nr_cpu_ids && cpu_online(cpu)) {
 			/*
-- 
2.56.0.313.g2479322e68-goog

