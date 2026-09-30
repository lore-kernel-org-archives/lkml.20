Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703E94D4888
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790797011; cv=none; b=rghynDxKYrEtjryafGyQ+oH0i7QmRQFQeIkfmwduj9Cd8uls4XEXNV3BsiQKDmV0p2uPyU8hxBCM4qUQBnNGEvRbwISmk/GNYk38zQVXI5o5ye/8tP8ZR47uou7dBjB8gq4o5xIkOSAhj1Zc6gj3sQGDC1YbFvhHOhPmjs/+J7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790797011; c=relaxed/simple;
	bh=MSuuc/cocbqG6Hsb1NWDCs84MFsTBnA7k6WbI0Ly02c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Vr7WrnZatU5RDpopflGMisHoLhUeuAT5H6M46kK1aam8RzjXNgHJTSAstHetEOMJFKbQI7YkUxxxQnXIMyXFqPbUw+zouDQm6SR3gBxhBBVNM8hH8ux+ymc5DGufmY0ilSAsBBxCkS12wYFbTF5tsxKgVagvd0wiMyDDbo1e/A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=alEv9MCf; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="alEv9MCf"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbe77d6864dso5153932a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790797010; x=1791401810; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b4O4inbQYDjTuXf1AXWgPFLW4HG4gSKfcYxNlQZJdQM=;
        b=alEv9MCfPLk/asKn+rcOC0L/NnXnBxS/gNIvoOYUE8Lt56og/7EIASPM/scxSpuRoD
         XLL9Jg2PjTDweWhM5Sd2KuNnf3DK9BchjcJ5QBJwAuvZzZRvNgKF4hkaaYShhygUnCpz
         a3bfQzZtc6dPrvyxDMftk2nwur67GxVkJbRcQ8jwieoOFyenEw295n+e/hz0PHfTZvqI
         S2SmKcb0xIukPVXAmcduX8tuSVIUQyKhPXisKYWaLq2jXDZcfIrPhc2JxwMVCTFAQXYC
         Eo0uq2Br9bR0MvOtPFnhpMnjnx4FnZP++5/YzSkPNr7jJPqFsPChszRzPiWdgiDG8jee
         yQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790797010; x=1791401810;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b4O4inbQYDjTuXf1AXWgPFLW4HG4gSKfcYxNlQZJdQM=;
        b=GxcZ/fUTrYeUFg0emzZnb6+trrtnBjPszuSl196BwmFf/i0mMu5FI5nk+nH3gO8CE6
         djeLfYyFoKmHAwMRqRmms6Oz3DLgt6D8WfeQWdF4sEKLDjt+Rusdo+BVfPtyAPrfsCGp
         06AefudQNaF66nD672xjiDGQ3V05gY9weQmHMS98GFdWQmGlVWwei7plJ/AMWhduaaqq
         0ePChSkVVQGoJFbJt39MbVhiB3Fytaj9FbNOKjswrprAchD0cKTVOvjMvEJty6CaqT0W
         CUCypuh0FuNzSb4Vb7BYD0JRdEp5rYzoTaDE7wlAdpSICw56JjIbyIjHrtkmfzWPQ1VG
         Hz+g==
X-Forwarded-Encrypted: i=1; AKwUvBzicDtO2S37y7TEFgmLj1aowLPV0oVaL+IcHQxsD0+05UULYWoL6JdIGlETms0J90jAHCMGn39x/3XMUbg=@vger.kernel.org
X-Gm-Message-State: AFuF++kE3BdC9eWE16QqDZeg2orP99ZHGIBJMpVny0EJ7gexehABCKyL
	n5Dpru/rVIriGHFKqniJBZlHsQS9hBM9tKd2smPiqPoq+Z8g6JVT4PaXyaDDwYTq3MuHTvMxKg4
	fwE7nFA==
X-Received: from pgay14.prod.google.com ([2002:a05:6a02:496e:b0:cc7:e378:a127])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6113:b0:3de:773c:df14
 with SMTP id adf61e73a8af0-3de9e739c6fmr2637009637.24.1790797009545; Wed, 30
 Sep 2026 12:36:49 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 30 Sep 2026 12:36:31 -0700
In-Reply-To: <20260930193634.3415089-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930193634.3415089-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930193634.3415089-10-seanjc@google.com>
Subject: [PATCH v6 09/12] KVM: nSVM: Open code check on LBR virtualization
 being enabled in vmcb12
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>, Shivansh Dhiman <shivansh.dhiman@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"

Now that KVM clears ENABLE_V_LBR if LBR virtualization isn't supported when
caching vmcb12 control fields, i.e. now that the logic is a simple
one-liner, open the check and drop the now-superfluous wrapper.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/nested.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index aca2bbc66f47..d3f249cd0f2d 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -738,11 +738,6 @@ static int nested_svm_load_cr3(struct kvm_vcpu *vcpu, unsigned long cr3,
 	return 0;
 }
 
-static bool nested_vmcb12_has_lbrv(struct kvm_vcpu *vcpu)
-{
-	return to_svm(vcpu)->nested.ctl.misc_ctl2 & SVM_MISC2_ENABLE_V_LBR;
-}
-
 static void nested_vmcb02_prepare_save(struct vcpu_svm *svm)
 {
 	struct vmcb_ctrl_area_cached *control = &svm->nested.ctl;
@@ -817,7 +812,7 @@ static void nested_vmcb02_prepare_save(struct vcpu_svm *svm)
 		vmcb_mark_dirty(vmcb02, VMCB_DR);
 	}
 
-	if (nested_vmcb12_has_lbrv(vcpu)) {
+	if (control->misc_ctl2 & SVM_MISC2_ENABLE_V_LBR) {
 		/*
 		 * Reserved bits of DEBUGCTL are ignored.  Be consistent with
 		 * svm_set_msr's definition of reserved bits.
@@ -1310,7 +1305,7 @@ static int nested_svm_vmexit_update_vmcb12(struct kvm_vcpu *vcpu)
 	if (guest_cpu_cap_has(vcpu, X86_FEATURE_NRIPS))
 		vmcb12->control.next_rip  = vmcb02->control.next_rip;
 
-	if (nested_vmcb12_has_lbrv(vcpu))
+	if (svm->nested.ctl.misc_ctl2 & SVM_MISC2_ENABLE_V_LBR)
 		svm_copy_lbrs(&vmcb12->save, &vmcb02->save);
 
 	vmcb12->control.event_inj	  = 0;
@@ -1387,7 +1382,7 @@ void nested_svm_vmexit(struct vcpu_svm *svm)
 	if (!nested_exit_on_intr(svm))
 		kvm_make_request(KVM_REQ_EVENT, &svm->vcpu);
 
-	if (!nested_vmcb12_has_lbrv(vcpu)) {
+	if (!(svm->nested.ctl.misc_ctl2 & SVM_MISC2_ENABLE_V_LBR)) {
 		svm_copy_lbrs(&vmcb01->save, &vmcb02->save);
 		vmcb_mark_dirty(vmcb01, VMCB_LBR);
 	}
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

