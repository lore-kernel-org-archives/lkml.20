Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408CB254AFF
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 00:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788481472; cv=none; b=VzZ4W6E1K5+ZGCYeONDI7VaI8SLU2rtDi5JQXkKnLoyma6FENnetFrwc9iAQx0qeUFahTOs4XUCl6akfkQE+S3ZoMHiYCyT1e57G/kMy3zqUCyjG4ILlxQtAm1OUB3oUAYMyphYzVbWPn1feJMW45c8aJwkhooTw6rx1QDIaLLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788481472; c=relaxed/simple;
	bh=yAXXfMiQDDT+TX3uVpO3MhOalO1RXt+3/lszMXnkOjI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=C70SQjjQ/aEKm/oPuMc076JnSDwgc5e6Wn2Oifxlxz3hlek/lQDfnYwlJUxcGBCpQSQ+C6XZ7FTxZwk7h5t4z654ovjh7CZXFaE+ZtkaAjPaXde223m2OXeedX2XoWKWFiVKuyq1AoKgzH/T0Fif0PC0S6xQSQWvmwrZ9SOlfR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fljm5cKn; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fljm5cKn"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-85326b426c0so497533b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 17:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788481469; x=1789086269; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IBzhRz5zfoZi7n8bMbtw4lvWtqjJET4EFYtEvAZvYHA=;
        b=fljm5cKn/+ViheH4hkiscrw20vRDyiVts7GGDRLO+2f+rjxPdqe8UBtLWmDOxRSld0
         JhPbwclsNtzANp1XkrcMLdRb/zmJfPZwXq5adGSp8mpGhMccDt38T7V7j2qzkvFpArzl
         oGLJdmeXR3KK18A5xF1zhqBfsVSmpnGABi6n2+CcrJ7dQfsuEbz0jT8xa9PCdgZJ4yJ3
         6OZXlOhl1KIJLBkCdjC/XBFjGz+E9K9G1BfA3WBRwaDH447a7q2eJV2IluI8SnwmnV6H
         W2MtzHT1J7/r5E9wqUboJ5RiyHZiX4GldYTF+ThuMx7R5+8d1V/rI3mfYN6VKlnfTgUx
         Wv4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788481469; x=1789086269;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IBzhRz5zfoZi7n8bMbtw4lvWtqjJET4EFYtEvAZvYHA=;
        b=lfdpE1/DFxXhv6oXqHxl+EOXt0nMOtErIlnod4DbwYmaqxypv//fjo7qMu6ZAq14Bz
         yGmFM/GkV9YJfzdAAXigNl2JqS3ZqyT+RNF4faCUz265biarxjPOm8XspXpa1bny1EKb
         RZfoBdAQUVyYmIcAwKi27Wylpe8ew9HlE6qg3COihBA6XJG+wuvnhPoHpqnhMBcKWCzL
         DwJVDjIa/O/AMOekV1kK79g/AepDQAup6KGef7QImEMMWa5oblA6Y1SWDVvq/pK92ke1
         hUdf5lRsu3LkCPwThdHOhBBxgyam3GhHFlkT44LNrMTt9YpPj6/O5eGlFvxwbsAkyhVk
         GncQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfInPlxd7M5RYMjYyeBudXhVxGBzujb9tf39DX6xvhP5na78tcYmUBtuMskLDEgVvTSsdOEby5Ey5ZZds=@vger.kernel.org
X-Gm-Message-State: AFuF++k1OgS8r8I5DryXMVO/+lLdUd0jd/PwkNS1ZjeeaxKW9KWM/LRC
	s09cyQTtCuEpM+w5dOM+mhQPMaLUzZ1+UqecNHWzlTkSJVfwWSnI0j+o2fOjQo3YTBeFoF90I0V
	6E8nIhw==
X-Received: from pfbfy3.prod.google.com ([2002:a05:6a00:8283:b0:84e:2400:dc7d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4c83:b0:857:72ba:ff11
 with SMTP id d2e1a72fcca58-8616b967099mr4010021b3a.25.1788481468362; Thu, 03
 Sep 2026 17:24:28 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  3 Sep 2026 17:24:08 -0700
In-Reply-To: <20260904002423.3154436-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260904002423.3154436-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260904002423.3154436-3-seanjc@google.com>
Subject: [PATCH v4 02/17] KVM: nVMX: Make VMPTRST return eVMCS GPA when it is used
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
2.55.0.979.g7e5102b832-goog

