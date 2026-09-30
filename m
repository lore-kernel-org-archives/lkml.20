Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350973546D0
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790730818; cv=none; b=Tg7+ZeBRRU4Qsu6nu95AxUOtnaBOOVbOhE3vnZz/iT2mNOFr4E4bcLJO+F5ztlFD47Zov2ZRyzgcn8ok36YJfUcXssL4WhYTZ+JF7YbZWzmoHpWSUoOyZTWidX53SOGYtH7zYcE6Cbe37Wrxr3jpZbcA1WbqdmIznxKmpwf8Jv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790730818; c=relaxed/simple;
	bh=MSuuc/cocbqG6Hsb1NWDCs84MFsTBnA7k6WbI0Ly02c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pRLltit8S0F39aVgV9pRSC7CZzc1Wkje8ai8mr/CnPsvLjWHSJLLbe0YMmNKMq39UuTtTeNGU7t5J0NVKyMdshegRWzpNa18gXPB7J4psIdS6cM6nmgIJjMcMBNl+3kEetqaITHeYhkif3hd02aXkRToILmoYJKVmoWP/w71mZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wiDT6Xtm; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wiDT6Xtm"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so3616756a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790730806; x=1791335606; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b4O4inbQYDjTuXf1AXWgPFLW4HG4gSKfcYxNlQZJdQM=;
        b=wiDT6XtmZJwZUOHQCuQ/nrtYy9uGrAuOetWNtjdQgE5uhE7sw26zRqawJZRU8ftAOX
         fvNc7FaWFnbi6u2K1TBcu2Q8cLxaPTjoV8R4xVWUGJXbNTwapblmvRqQHK/SQwLGkqrT
         JuEhGkdnn+h6p36SNQrQ2bLHonM9O+UuhTFq8BxDmjGuhsAMRdl6XAStGlYtjmNhX3vL
         cwiWOcwu5dX5SH67sK84ye7TpUGJOhSznsJifW1cLemRS3oMpzDVHoqGMEaB3aUBvBqF
         AymQ4Ljzs6fEETm+0IJmC+8KH5F5pfS08llNEtRvXkz4QjUhjX7o8FtmoEBOYpct2vUq
         sKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790730806; x=1791335606;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b4O4inbQYDjTuXf1AXWgPFLW4HG4gSKfcYxNlQZJdQM=;
        b=S99ILiYN+wzZ62SIVdZdvudCby4VmF6zylkudGBGx9GxrqEHBcqF9np6JyTdlaf/P/
         eIPQbD9eVCJCB1cKhjmIYmTEL6uiFesT4bW0kTSAqQr4a19x2lcc0nlI4y3XPtxYDf4i
         SflHLzNeq/SXDTvu6OvxQCladxpVaDidK4HriKSnQfNeAoCvtKHq/DNTxFrMjRky3EjE
         OGZkZh8NvqV+lQOnPzfFYxh4T45r6D9ni+YoJ58aBfSkSJGEu6nW7Qy/Lrj8UUyYZPns
         /fO8sP/pA7Ic/jr/RNqvxwq9JRZJ6ugmGwxgdssIWNh3fcg1ZMtyYWpTGEXwng6+6B1k
         R68w==
X-Forwarded-Encrypted: i=1; AKwUvBxokzxRNHilva+qIBsIWvWE3Luq2+8+Y2zuXXlvSW4wi64regnUYoWKodwBiT/sQH1TTEVmAjd5DIFECtU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3vChp07Xy8o77VIoGbFS1oeMKNLpPoH03F1MxpqoTH73t3Uu/
	5Jq0G5/GhNlKlCRDHoOlAIzb/aQmttAz4owWDwl6K0otMAtpyvT/DSegSpIMdiAbWn8cNFvNQ++
	bWLCsJw==
X-Received: from pgbeu25.prod.google.com ([2002:a05:6a02:4799:b0:cc7:ac48:5288])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5826:b0:3a0:abe7:f0f3
 with SMTP id 98e67ed59e1d1-3a4bf67a802mr891804a91.0.1790730806186; Tue, 29
 Sep 2026 18:13:26 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 29 Sep 2026 18:13:10 -0700
In-Reply-To: <20260930011313.3197688-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930011313.3197688-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930011313.3197688-10-seanjc@google.com>
Subject: [PATCH v5 09/12] KVM: nSVM: Open code check on LBR virtualization
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

