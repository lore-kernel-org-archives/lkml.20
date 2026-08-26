Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BFA3B8111
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787787563; cv=none; b=BGvL633XZ1Q2c2r7B6WktSv2eB28qglz0FxXIFn3kazSuYHRbIK+QrEUx3/mOlzHfS+0ZQjRLDpFUtbee3YaKOBlxkBLYzZpZY+hSLwoA5PepR1jgduR3zc3b2oQj7DCFybtnZZSHqhilBraMadBduc8KwpwTX5p1M4ekn0Ik5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787787563; c=relaxed/simple;
	bh=8Kw3Nj7xOGrbmUBSV/kVU/ochnXj0oWLrOcYJzQlq9k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZQ1+vboTu3zBo4xwKD3uFnrykgJgqJROI9zi4yRerIuZqRrqmbRSHGN4RpmQxjuaJa1t4l1SRHGjsFMBsUKEeQ85+N3c4qSry/zQW3DnKn/NMPV571UaEMFG84fZGcuiscjZo7F5vYJwAQyWnZ75saO8ZE7fEERzuNEf+qwyWeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GGbRjvei; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GGbRjvei"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso91586a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787787562; x=1788392362; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6KDDUNP2gAbt/e9olovJkhStLhLbdjWDJkc7h/s+5jY=;
        b=GGbRjveikoNGetF7QrLF+NAAKA3sL6KQFZCt7BQs5Kp61lUGryzyV9iOcfrwBDkFB1
         RUOoT0Vz6a0ayrzVbqjkzoHQUaOWHhuZJqBM4jtOpUP4fLdvkTafictHuxZTplsG8PHw
         la4utzs0JucFNq4THvGkXzRDta7alFqF6Dk5sN8eb/NbZdurNvZdGhZRKaEH+BHUlEjs
         OWbn3E4WRvPt5R1qL3pmrMemu0EXUp6TmC6UF1O9qQc+vIIeEs/H7tRSM8YtcPGqRXB1
         zV12F4AMqSOkfpCsAlDf904l9xoTItWZXAesYtPLaxeAJyWflDYSQlzudvqUOv4r9Dk3
         s9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787787562; x=1788392362;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6KDDUNP2gAbt/e9olovJkhStLhLbdjWDJkc7h/s+5jY=;
        b=cHxAPVvjHo9hvXJ5VE5FpISDHuOdLIZhAcvMd5sQNbp1yA4O94z+ynEtNPsvQf48Hn
         3/EEBgh46GSHzZi33Qy9Es+/GRd86hOw4b367g4pYK29Tn2H79E1rbqV18fquogqa0it
         CWpLoMySJOCLADqUgwu9TBZ5T/QnY/DSW5gyNiLHVtvcet/YGfABTiEM2oVAhWRRchMO
         mJ7mZuSqRAMy8DpS0ah2a10kAQUqyUunsVTBfUI8p2ya8UTo5wBBgPAuapVWV3xOC6/H
         se7IYd9++bR1e2tlczlU1tGMTooS6ShLNV3LO9hv1VyHs21b8nCSRnW+PBAuHL4Rl9p4
         +Mfw==
X-Forwarded-Encrypted: i=1; AHgh+RrAthq+zxK3maREUetBRjYkHwOEEjzSuf1goUv0jyiadtDV09MAe77WKA0wTCTO/7xxEGVxqUTyUAglflI=@vger.kernel.org
X-Gm-Message-State: AFuF++mr9Jxsr23KSCysDLCs+Cgxo9+hWY60YRtFkbtI5LH/YpI+Ovye
	s+tOeTL3J9m00UrayZ7lrCXBjKveXMTX+cM8ANtVO8+PyW9kkK5oezFYOEy5pXfkfDh/N6KsKxk
	S8kRBGQ==
X-Received: from pga9.prod.google.com ([2002:a05:6a02:4f89:b0:cc1:be9e:35ed])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:8986:b0:3d0:868d:8ccb
 with SMTP id adf61e73a8af0-3d0868d974amr10614945637.13.1787787561472; Wed, 26
 Aug 2026 16:39:21 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 16:39:07 -0700
In-Reply-To: <20260826233919.998904-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826233919.998904-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826233919.998904-2-seanjc@google.com>
Subject: [PATCH v3 01/13] KVM: nVMX: Make VMPTRLD result in #UD when eVMCS is used
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, f734222792@gmail.com, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Sashiko Bot <sashiko-bot@kernel.org>, 
	Yosry Ahmed <yosry@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Vitaly Kuznetsov <vkuznets@redhat.com>

VMPTRLD with active eVMCS is already forbidden, however, returning 1
without skipping the instruction or queuing an exception will likely
result in L1 getting stuck. Genuine Hyper-V seems to inject #UD under
similar circumstances, mimic the behavior in KVM.

Reported-by: f734222792@gmail.com
Link: https://bugzilla.kernel.org/show_bug.cgi?id=221841
Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 151873407abd..ad3726fd4fda 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -5897,6 +5897,12 @@ static int handle_vmptrld(struct kvm_vcpu *vcpu)
 	if (!nested_vmx_check_permission(vcpu))
 		return 1;
 
+	/* Forbid normal VMPTRLD if Enlightened version was used */
+	if (nested_vmx_is_evmptr12_valid(vmx)) {
+		kvm_queue_exception(vcpu, UD_VECTOR);
+		return 1;
+	}
+
 	if (nested_vmx_get_vmptr(vcpu, &vmptr, &r))
 		return r;
 
@@ -5906,10 +5912,6 @@ static int handle_vmptrld(struct kvm_vcpu *vcpu)
 	if (vmptr == vmx->nested.vmxon_ptr)
 		return nested_vmx_fail(vcpu, VMXERR_VMPTRLD_VMXON_POINTER);
 
-	/* Forbid normal VMPTRLD if Enlightened version was used */
-	if (nested_vmx_is_evmptr12_valid(vmx))
-		return 1;
-
 	if (vmx->nested.current_vmptr != vmptr) {
 		struct gfn_to_hva_cache *ghc = &vmx->nested.vmcs12_cache;
 		struct vmcs_hdr hdr;
-- 
2.55.0.887.g758fc8c411-goog

