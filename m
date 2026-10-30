Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793394220;
	b=wQa2UH+SvoxTyT1dPPERTj8daf3RJphjqfdvkHcAied+xj9iyFxQSGHJwFUgqtfkhSX2
	 5wdgMFzDzOseZhzmmuKXEZw4ZNJTQQA4qUKYaXN5RqtBVxXtyKYXp4yFuno4uB8QYn0oX
	 Gsl2BBYLCJcpUTc7VMG0N4Mi3PwUb/O1lel6cwY/j+v4L6KpzFaLsThT3z66b0sfndJCA
	 Q2/Ve9GSYXFIO6Jr+WqdsmtUNPMsGM84AzMObnoVhrN9nsTvME5N6i/bbmNzBfXu1FIoY
	 Qz2zQZXnjTpDg+ufbwVqxhHckpHOIjEU2h2OVSauSe1aH+tqdLYZ+9KliWCpRv1vz6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=ewb43Uvomg/tIuEU/p7qaUSF+JjKwFlhid12RrCUYb8=;
	b=qU9wIQj+mxtcI9++v7SU+ZFtY6NF1/2yIZk/myUmv8VYmG1H64ebzLhzSlrnYpYRc11m
	 TiNjQ4SJe7+fh1tUVIbp3tHzIwFXcBbpHDnurcAgeq/fpGu+1q3Ppyls+T7p41OsJMIv2
	 xj7Vt0nVeWTLNrFMJeAJ74lO+71FBBlisoLvShwkCKlu5z3UZPw0D/dGCJVaoeo7xYplc
	 gNESG0fFxhWpJd+7NFSgL3ihxFqlE1A4q0fePUD7Unqjh0+5Wm/5YGeXdaVOy9GjRC5Lc
	 Naog/C/CQ32opsESKUgx76hyqcaeR7CEOBpitOmd4DSE5HGhXtpy4itHYP1VuAqnetw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NdzLHUe6;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479F6606A323
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 479F6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NdzLHUe6
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ea71803effso12429235ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793394218; x=1793999018; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ewb43Uvomg/tIuEU/p7qaUSF+JjKwFlhid12RrCUYb8=;
        b=NdzLHUe69p2KrD71b54Mo5Q3kHvlVDjvur1FSfegDP+tng9oqTQFnUJcPRb90U1AWr
         xN7uJCyUy7W5Zb/rWqv/NF2syTGACZMXybsFuj3Lh2mHJPgOUPajGToWDse7B01u9iMT
         2LdZehKTzPrsRbnquw1HkHEml5D/pSOyY6AXhdYskiFFXhs26H8lc5d2+hzSlB1EBYcP
         ippTVcADBYLwcZc7HjB5Vi11GGZ+jez4PIbz1PS9Gzm844yVBR4Y1bgvNC12j8zAqK5f
         wrgRANSg0ZkXtUCkcpk0WtXKystTO7OawVw/0wZnLCIfMiyyuob4bU63GVAswdTtx10F
         gFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793394218; x=1793999018;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ewb43Uvomg/tIuEU/p7qaUSF+JjKwFlhid12RrCUYb8=;
        b=bKEvmeooNZM3DoBlrDr/Epk+45lhPUGzdDRkGP20MLk44ywOmxSXVymjzziu2l2Hfx
         hPcfvjs5SNWpYZSmzRawrC78L/4ayOe+cCslixdh8ZSmDqyPbTxMnc61fh+uS58m+zQF
         44nhPEDeKjS/v9/vD/4vzseB4WACcf1kIv3ZapLbMOCG0v9GVPP2acLKpZPEWUzQivgu
         Bkw8TBTkmicOKnh61PIgx/Z01Nilsd70awXtn/un6xuR82fK6MtkD32hAHwKeKBfVSAk
         hGZaGocjB4dtId2PGFY+/ZAYQhb57o8YKnppWJk2Gy/BqMg0fWbhFXHGi1JWx1t6i3tb
         3asw==
X-Forwarded-Encrypted: i=1; AKwUvBxX/V+vJLWI9+8K1Uz+lsT6xskVu/TN8JA1jHhV6LHb72ycjOESHaVqzUcF3NQuYwSRVLO+qGxXIzzlYBM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGvKPoQzVVWopNDlu2VrXBa3S3d4ObExQCkoLrAKyyxfSLqIac
	CEQmAbf0I3wEA5dxmA6egWSZYnSg6GChf6C/B39nVnr8a5v9buIEstwq4KkGLemqDI7K9k+9pUs
	h9CJPaRhN9OlaZg==
X-Received: from plgx6.prod.google.com ([2002:a17:902:ec86:b0:2eb:4a7:306e])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e88d:b0:2e2:c55c:90c with SMTP id d9443c01a7336-2eb3650b7b7mr35700475ad.64.1793394218381;
 Fri, 30 Oct 2026 14:03:38 -0700 (PDT)
Date: Fri, 30 Oct 2026 14:03:21 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261030210321.3019901-1-jmattson@google.com>
Subject: [PATCH] KVM: SVM: Stub out MSR_VM_CR to return VM_CR.LOCK and ignore writes
From: Jim Mattson <jmattson@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosry@kernel.org>, 
	Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

Commit 4a810181c8bc ("KVM: SVM: Implement emulation of vm_cr msr") added
svm_set_vm_cr() and svm->nested.vm_cr_msr solely because Hyper-V wrote
to MSR_VM_CR when running under nested SVM [1]. At the time, Avi Kivity
noted that the MSR needed to be exposed to userspace for save/restore
[2], but it was never added to KVM_GET_MSR_INDEX_LIST.

Moreover, KVM's emulation of MSR_VM_CR does not actually wire up any of
its five defined bits (DPD, R_INIT, DIS_A20M, LOCK, SVMDIS) to their
architectural behaviors (not even checking VM_CR.SVMDIS on writes to
MSR_EFER), checks the wrong bit (SVMDIS instead of LOCK) when locking
bits 4:3, and never resets vm_cr_msr on vCPU reset/INIT.

Replace svm->nested.vm_cr_msr and svm_set_vm_cr() with a simple stub
that returns SVM_VM_CR_SVM_LOCK_MASK on reads (matching typical
bare-metal state after platform firmware enables and locks SVM) and
silently ignores all writes. Document the lack of MSR_VM_CR
virtualization and the missing #GP faults on writes in
Documentation/virt/kvm/x86/errata.rst.

Link: https://lore.kernel.org/all/1267034360-5907-1-git-send-email-joerg.roedel@amd.com [1]
Link: https://lore.kernel.org/all/4B8650CF.6@redhat.com [2]
Signed-off-by: Jim Mattson <jmattson@google.com>
---
 Documentation/virt/kvm/x86/errata.rst |  9 ++++++++-
 arch/x86/kvm/svm/svm.c                | 29 ++-------------------------
 arch/x86/kvm/svm/svm.h                |  1 -
 3 files changed, 10 insertions(+), 29 deletions(-)

diff --git a/Documentation/virt/kvm/x86/errata.rst b/Documentation/virt/kvm/x86/errata.rst
index a9cf0e004651..8dc9c3435752 100644
--- a/Documentation/virt/kvm/x86/errata.rst
+++ b/Documentation/virt/kvm/x86/errata.rst
@@ -84,4 +84,11 @@ memory.
 
 Note, this erratum does not affect AMD CPUs, which fully virtualize CR0.CD in
 hardware, i.e. put the CPU caches into "no fill" mode when CR0.CD=1, even when
-running in the guest.
\ No newline at end of file
+running in the guest.
+
+VM_CR
+-----
+KVM does not virtualize VM_CR (MSR_VM_CR) on AMD CPUs.  RDMSR always returns
+VM_CR.LOCK (bit 3) set and all other bits clear, and WRMSR silently ignores all
+writes without raising a #GP if reserved bits (bits 63:5) are set or if
+VM_CR.SVMDIS (bit 4) is set while EFER.SVME is set.
\ No newline at end of file
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 136069dfcd44..be9de34ea6b5 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -2954,7 +2954,7 @@ static int svm_get_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 		msr_info->data = svm->nested.hsave_msr;
 		break;
 	case MSR_VM_CR:
-		msr_info->data = svm->nested.vm_cr_msr;
+		msr_info->data = SVM_VM_CR_SVM_LOCK_MASK;
 		break;
 	case MSR_IA32_SPEC_CTRL:
 		if (!msr_info->host_initiated &&
@@ -3015,31 +3015,6 @@ static int svm_complete_emulated_msr(struct kvm_vcpu *vcpu, int err)
 	return 1;
 }
 
-static int svm_set_vm_cr(struct kvm_vcpu *vcpu, u64 data)
-{
-	struct vcpu_svm *svm = to_svm(vcpu);
-	int svm_dis, chg_mask;
-
-	if (data & ~SVM_VM_CR_VALID_MASK)
-		return 1;
-
-	chg_mask = SVM_VM_CR_VALID_MASK;
-
-	if (svm->nested.vm_cr_msr & SVM_VM_CR_SVM_DIS_MASK)
-		chg_mask &= ~(SVM_VM_CR_SVM_LOCK_MASK | SVM_VM_CR_SVM_DIS_MASK);
-
-	svm->nested.vm_cr_msr &= ~chg_mask;
-	svm->nested.vm_cr_msr |= (data & chg_mask);
-
-	svm_dis = svm->nested.vm_cr_msr & SVM_VM_CR_SVM_DIS_MASK;
-
-	/* check for svm_disable while efer.svme is set */
-	if (svm_dis && (vcpu->arch.efer & EFER_SVME))
-		return 1;
-
-	return 0;
-}
-
 static int svm_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr)
 {
 	struct vcpu_svm *svm = to_svm(vcpu);
@@ -3262,7 +3237,7 @@ static int svm_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr)
 		svm->nested.hsave_msr = data & PAGE_MASK;
 		break;
 	case MSR_VM_CR:
-		return svm_set_vm_cr(vcpu, data);
+		return 0;
 	case MSR_VM_IGNNE:
 		kvm_pr_unimpl_wrmsr(vcpu, ecx, data);
 		break;
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index 6d0242966dc8..91acddf12082 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -214,7 +214,6 @@ struct vmcb_ctrl_area_cached {
 struct svm_nested_state {
 	struct kvm_vmcb_info vmcb02;
 	u64 hsave_msr;
-	u64 vm_cr_msr;
 	u64 vmcb12_gpa;
 	u64 last_vmcb12_gpa;
 	u64 last_bus_lock_rip;
-- 
2.56.0.317.g454f8302e1-goog

