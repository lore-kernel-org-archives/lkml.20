Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D39E3B8D5C
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787787570; cv=none; b=p0bP8XuqtpVQVhp4CIHa6RhiCqr0CUS9i1ETdoEwvRZ7mQuFJuGulkcR0GmAw+30RDJMfb///Pkcew7ngGq/q/m/nZyG0vEjEf0pd1rN3JGwQZ+H4j5p7rmgP0r8czcX3PNvpnXBv7bTxReqNSjvi3oTiwpjLXrXgPI+M8khLCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787787570; c=relaxed/simple;
	bh=LBn4L8NUDl0yvODO+6G9Egy3RyVXyCAyGY5Rk7DQUAo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cXpMjCH+fyZBk5P5iBQO3kAoxmmt5vOwUe9upT7LqIH9U0oxdIyGAf1zIzvOv+reYZuVEZhFe+Go9wpJUzm158DNWEn6ooc45qhC8KLVA38YMNrtxE/Wr/kJpSpz2Anc1LUhB5opBi6eqKzgNXKaTkBf+R4QVxd7isQD0VGHFns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HtJI+7WD; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HtJI+7WD"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso2319265a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787787563; x=1788392363; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5AUNZFgs1KdCrvguiFO2LLkObL9OkQrih/oCexn450g=;
        b=HtJI+7WD3sG/O8u4+8NREzlKU9H2GKGk60/o7LEDw5gYq4MyfhE0Z/wrobAiCcpcEW
         3CdUTg++kzZG/wlIC0bhGF0nfibr6fzxHp3MGSaH2jtScdNs4j0Tj/m5gqSq43wpuZ8i
         UqCxjvfm0HBkKcnoba32oRU8RUxnYg53Vf01YgCXpS4I89Z+YwwOr8IOB14t/zi3Dnkc
         HvdmYqSrLxxR7ZWyP0w2qDcxlToUAercVGqEdO8OaUR89YL0sLrzXTfo0jh2APo7iCYO
         arOp9TyFpsjSOe9b2M5KEN+MhCVi60Yj+tynud+m7v9846nL/sAu8yF+nAM0F5Xp1k35
         QqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787787563; x=1788392363;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5AUNZFgs1KdCrvguiFO2LLkObL9OkQrih/oCexn450g=;
        b=keNYbI4XlLnpe6R9caQNzE7LkWXGGUhI6HzKAfIVLAQvSG5DkPZgUWT3uuw1hlyKYi
         p6OE4b/v3LbSRnYefSw22jlrzySTEHigirvRm/WUgEdtewElOx5gPVoHUCKx9Xxuwme3
         SK+X6J1+G5Mov8N6eOkwHG7ZkiBLx/fsUZF1go4aPH6MZwVU2t1J+1tZ7Ld1x2Gn1h/f
         QHP0zPC5kyl7Zkax2r3M142w3c0GoZC1zH9WZ/csw0EedP9lHPBQl4pYHC3T4oySsx0L
         uPJpAEeFbzlY12Jqc0kuWJN2lf0AS+DH178T6GE7FGmRgSpZAoUeeaIpj18SzoGRtFYg
         o7mA==
X-Forwarded-Encrypted: i=1; AHgh+RoneAliRLmqQqlvfWvDdxAQwzRsUKyQ4oR0lsoaR/IkUi1byXiAParFh4JGYPlvk9m79P4GZ1wWR/ya3iE=@vger.kernel.org
X-Gm-Message-State: AFuF++ndASC17wc69DLyM27AVVVBIWoSQTwGl2Rln6V8rRr6bNGXlgCF
	M2J92UTTAjejhQk1IufuFkm+Lo288ULtcrVnW74G4d25myk5IDh6eOnDgWAhaS3eqYt4+9zwAM1
	4yv+rGQ==
X-Received: from pgbcf9.prod.google.com ([2002:a05:6a02:849:b0:cc1:b96e:df3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:e290:b0:3d1:66cb:d49
 with SMTP id adf61e73a8af0-3d166cb0e18mr244423637.4.1787787563139; Wed, 26
 Aug 2026 16:39:23 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 16:39:08 -0700
In-Reply-To: <20260826233919.998904-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826233919.998904-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826233919.998904-3-seanjc@google.com>
Subject: [PATCH v3 02/13] KVM: nVMX: Make VMPTRST return eVMCS GPA when it is used
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, f734222792@gmail.com, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Sashiko Bot <sashiko-bot@kernel.org>, 
	Yosry Ahmed <yosry@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Vitaly Kuznetsov <vkuznets@redhat.com>

VMPTRST with active eVMCS is currently forbidden, however, returning 1
without skipping the instruction will likely result in L1 getting
stuck. While TLFS does not specify the expected behavior, genuine Hyper-V
seems to be returning eVMCS GPA. Implement the same behavior in KVM.

Reported-by: f734222792@gmail.com
Link: https://bugzilla.kernel.org/show_bug.cgi?id=221841
Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index ad3726fd4fda..3058efa65c82 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -5964,7 +5964,7 @@ static int handle_vmptrst(struct kvm_vcpu *vcpu)
 {
 	unsigned long exit_qual = vmx_get_exit_qual(vcpu);
 	u32 instr_info = vmcs_read32(VMX_INSTRUCTION_INFO);
-	gpa_t current_vmptr = to_vmx(vcpu)->nested.current_vmptr;
+	gpa_t current_vmptr;
 	struct x86_exception e;
 	gva_t gva;
 	int r;
@@ -5972,8 +5972,16 @@ static int handle_vmptrst(struct kvm_vcpu *vcpu)
 	if (!nested_vmx_check_permission(vcpu))
 		return 1;
 
-	if (unlikely(nested_vmx_is_evmptr12_valid(to_vmx(vcpu))))
-		return 1;
+	/*
+	 * Hyper-V TLFS does not specify the behavior of VMPTRST when eVMCS is used
+	 * but genuine Hyper-V seems to be returning eVMCS GPA.
+	 */
+#ifdef CONFIG_KVM_HYPERV
+	if (nested_vmx_is_evmptr12_valid(to_vmx(vcpu)))
+		current_vmptr = to_vmx(vcpu)->nested.hv_evmcs_vmptr;
+	else
+#endif
+		current_vmptr = to_vmx(vcpu)->nested.current_vmptr;
 
 	if (get_vmx_mem_address(vcpu, exit_qual, instr_info,
 				true, sizeof(gpa_t), &gva))
-- 
2.55.0.887.g758fc8c411-goog

