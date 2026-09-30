Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A58017B418
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790727093; cv=none; b=EXsjtPRlWZLxy9Ge7zcMGxKFfe71IzlWEpL3Z01iKtDH0C9dzDyRfJAAe8M3bYyxUYeNZq6WK5y801MDr+jZ16PKpdt9BYUS5Us07Grju4Gk40rGrckn2gF1V2VpOmRmFr7GUpzta2e/4vmEsFWKTdHwSGdKgixNdhvWpO7+SUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790727093; c=relaxed/simple;
	bh=sZFXk0BIchYjOjDaEK0ZoynBeIbw22eT1lGZHMbQVgI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GRHWutg4P17KVuxco77T1ZuqbENYyviD/Gk2rzA0QI7TYl6LUz9NuVGphDmXstPcNYzGTN5qXFYdFmFyM41ni+Pv3CTOxKZJyrY/ElTQPB2QaGq8IyRLpCQ0/j/pwJm3EuQZoWKq5gB6VMa1ycwDgI/yn8v8I9u9LsX+yLVMbwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PJNTdZeX; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PJNTdZeX"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2df8d1e91c9so70336475ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 17:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790727090; x=1791331890; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=edNeZC9TNiU8IY0mX2z6Pr9YDXA5iNLVK2rM3T8F938=;
        b=PJNTdZeX+i9h6AmXxMPHRpRUED35hc/kAuusj2lLGX5CJIQ5anIw2gIqJ3h4cJWT89
         hH9kVdo+F/2/HgjWNIZ0/coKiFadbHuVEwG3PHx3G4VtKheslHEqnZRceM/4pThxWQC9
         kIk5xLLxVCMkdoQ7H6rqmhghXiZONu0jMAgD88EEO8MfiHQ8KTnKj8Ey1I3pQQdPWoBr
         Mb2ypXLunyuSXn/tnfpu06oVwFRAhiW4jmNPkxaeJr+WoKDfyR15utNxgp7qZbtcicqw
         gtgVJwWmWFcE8MqVbqbRHG6m0/qupsnhyVgo0NhwJ6zs/zL5OxGPRfbeEVO8aoNDw0Ts
         usIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790727090; x=1791331890;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=edNeZC9TNiU8IY0mX2z6Pr9YDXA5iNLVK2rM3T8F938=;
        b=HyIR2JkXJahv4KNW4ZfV/QrqWUVV3/IU3iO+K/WSEEwmD9QgimgDD9lUiSrF/zR70L
         GBRYNsQxuB1gja0jMkxDyUwfTkt96ZIjfI/n2q1GGVGO8QOGK/wP9knYBNTo7G9rVFMB
         4065gIQBkmUCnE24DQflcbglRi8NfTcdIkkh/i/TM4fLhWoh7dR2jLg+SG59Unebu0AS
         nBh7InzNQnp4IB5H/Ui617pVVQaDlhvfi4ThCgW8ECRGgfz0NHvCP6yX/+QZ/gA9FoP9
         cDXo5vRM1AaEr4+9+5wGdog0aDnAYou7bYs13lwxTQSqtaScQlHqU8XrIgKPxe4bAPo0
         2d4w==
X-Forwarded-Encrypted: i=1; AKwUvBxIgBzgM1qTyn4frHQsjhQYw4yWQes0pqvYc2gd8DAXRBEiv2NT/IIDbo5II7Vl9wyz44RenN49KZ8QvKg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJH9FPiPRTOfaSG/hXeZ8enG3IkyWCB9gDUYYugNo3qWrugQVu5
	IdURX4Z7DBNQF9WOd9tnXCLhy1v5L7VPFjt1TvQ8j6QYtA01d/CGYB79l/VTha/Kep9vwKwopoj
	UDfYg6w==
X-Received: from plme16.prod.google.com ([2002:a17:903:4910:b0:2e2:b29f:52a7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d98e:b0:2dd:ad73:c936
 with SMTP id d9443c01a7336-2e2de536e36mr5887855ad.23.1790727090389; Tue, 29
 Sep 2026 17:11:30 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 29 Sep 2026 17:11:25 -0700
In-Reply-To: <20260930001127.3170009-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930001127.3170009-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930001127.3170009-2-seanjc@google.com>
Subject: [PATCH v2 1/3] KVM: x86: Add a helper to prepare vcpu->run for a
 SHUTDOWN exit to userspace
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, kvm@vger.kernel.org, x86@kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	James Houghton <jthoughton@google.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Ackerley Tng <ackerleytng@google.com>, Vishal Annapurve <vannapurve@google.com>, 
	Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Add kvm_prepare_shutdown_exit() to dedup the paths that exit to userspace
with KVM_EXIT_SHUTDOWN, all of which happen to be x86 (presumably other
architectures use KVM_EXIT_SYSTEM_EVENT?).

Note, this adds a clearing of mmio_needed for SVM's shutdown_interception().
Not clearing mmio_needed in that case is all but guaranteed to be benign;
KVM should never enter the guest with outstanding emulated MMIO operations
(the equivalent VMX and TDX paths likely copy+pasted the code from
KVM_REQ_TRIPLE_FAULT, which does need to clear mmio_needed as KVM can
synthesize a triple fault shutdown in the middle of instruction emulation).

Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/svm.c   | 3 +--
 arch/x86/kvm/vmx/tdx.c   | 3 +--
 arch/x86/kvm/vmx/vmx.c   | 3 +--
 arch/x86/kvm/x86.c       | 3 +--
 include/linux/kvm_host.h | 8 ++++++++
 5 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 0eb1623052c1..d2feb57d774f 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -2190,7 +2190,6 @@ static int mc_interception(struct kvm_vcpu *vcpu)
 
 static int shutdown_interception(struct kvm_vcpu *vcpu)
 {
-	struct kvm_run *kvm_run = vcpu->run;
 	struct vcpu_svm *svm = to_svm(vcpu);
 
 
@@ -2214,7 +2213,7 @@ static int shutdown_interception(struct kvm_vcpu *vcpu)
 		kvm_vcpu_reset(vcpu, true);
 	}
 
-	kvm_run->exit_reason = KVM_EXIT_SHUTDOWN;
+	kvm_prepare_shutdown_exit(vcpu);
 	return 0;
 }
 
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index ee1d412b0ee6..29d4751f37fb 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2092,8 +2092,7 @@ int tdx_handle_exit(struct kvm_vcpu *vcpu, fastpath_t fastpath)
 
 	switch (exit_reason.basic) {
 	case EXIT_REASON_TRIPLE_FAULT:
-		vcpu->run->exit_reason = KVM_EXIT_SHUTDOWN;
-		vcpu->mmio_needed = 0;
+		kvm_prepare_shutdown_exit(vcpu);
 		return 0;
 	case EXIT_REASON_EXCEPTION_NMI:
 		return tdx_handle_exception_nmi(vcpu);
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index dc635145eeaf..35db7197c586 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -5588,8 +5588,7 @@ static __always_inline int handle_external_interrupt(struct kvm_vcpu *vcpu)
 
 static int handle_triple_fault(struct kvm_vcpu *vcpu)
 {
-	vcpu->run->exit_reason = KVM_EXIT_SHUTDOWN;
-	vcpu->mmio_needed = 0;
+	kvm_prepare_shutdown_exit(vcpu);
 	return 0;
 }
 
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index cf3fcdfd8ad2..cffd1b6ef789 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8139,8 +8139,7 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
 				kvm_nested_call(triple_fault)(vcpu);
 
 			if (kvm_check_request(KVM_REQ_TRIPLE_FAULT, vcpu)) {
-				vcpu->run->exit_reason = KVM_EXIT_SHUTDOWN;
-				vcpu->mmio_needed = 0;
+				kvm_prepare_shutdown_exit(vcpu);
 				r = 0;
 				goto out;
 			}
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index a836756baebb..02ca5d5d83b5 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2522,6 +2522,14 @@ static inline void kvm_account_pgtable_pages(void *virt, int nr)
 /* Max number of entries allowed for each kvm dirty ring */
 #define  KVM_DIRTY_RING_MAX_ENTRIES  65536
 
+static inline void kvm_prepare_shutdown_exit(struct kvm_vcpu *vcpu)
+{
+	vcpu->run->exit_reason = KVM_EXIT_SHUTDOWN;
+#ifdef CONFIG_HAS_IOMEM
+	vcpu->mmio_needed = 0;
+#endif
+}
+
 static inline void kvm_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
 						 gpa_t gpa, gpa_t size,
 						 bool is_write, bool is_exec,
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

