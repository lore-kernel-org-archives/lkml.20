Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395645;
	b=QjPOyxJG1/CRnmndW322iXHq7wimR5CKi3SCqHBwHhfb0DPyBl6gCFLI6HqjB28d4Wal
	 brSRr6+RjIQQC3/EWWN4kkrvhRfFPYzn00dVQZnA2usvRA0BDnXwgaOxJOdOQ6hV1A4Dk
	 ukF5XoUrb1EW8JqHRaj59iroh5F7HIU9yP6XufkuJWP9DD4IxmlCvOlwqQaq6A+kPbE9Y
	 Yl7p+mqmyD4WAmd5lN5owECM2yFy/x9KRYhFTtZPv3Kuf4xEQovkLPUzUlK7JX+db14N5
	 817vmZcR+thoQvxwtRmK35fzZ3p/sOUn/psh7mAoN7g79RIw4KDDWKpzkkKi3tegI4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=hkp5qs0Xl0GwSlkqXL2hIPnMMlQxkKMz2tez2uhZA7U=;
	b=VthevatV1AkMh3p22Q3E3KcUvDqNMD6B3blV8MiFaRG5Fnm0o/ibFeMG1q8T+y6QGCSG
	 41o9bNVyb9Ujcxjx9VneVcOd9UjAKIASn41mROw4A6+iH5Sle4oynjHhUUbTKBgt6exZZ
	 0OQZg6jWGHSIeJak1Hhpq16vmtS9jGSMJGmI9y9Rc22FODQKK6ft9P6Oev2zfl1UOiIIt
	 rCjRzF+XOocxoTEwsYOJOLZgvOh8kukZww3PwQLJBj9KOTfrIVdIyKvjUZKc083uO/oaf
	 B2Qjqch+ZMUH9JkVrCy7tTnUsP1Yyge7Cg0/iFaOzaTDePffZNjJUt5VMNmaV6kyy4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=M0QGiDTy;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6087606A327
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:27:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6087606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=M0QGiDTy
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e9821ca96fso18384275ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793395644; x=1794000444; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hkp5qs0Xl0GwSlkqXL2hIPnMMlQxkKMz2tez2uhZA7U=;
        b=M0QGiDTyrpmo+KZWFCT8zegoxT7pNNKYk1d973zXxisTSWgjpMI/BykiL2oeA1mI4x
         SUe3LKk8NjgnAN0W3TsAnjcyS7rPfDUARgayYcm9pvcSUcEnPbpTzyPNe54dRwddx2Al
         rw9dnxBCnKuENnxo2z5a2vkZuMAbv7cFXGiyMHqoWxXZbLIy1IBqS4XSb+AHT1Hpk+Sm
         inZ/FmcjoYilDjSxyXjMwjnwl5ke+il/+cL+qpapCixXvMSev2boBcDkQ/FElRiDWqJq
         qhYI4LqgM0tnzLP4EvnSfEd8yrwAT7fHzj9gjV/XGO/uhcX1G7QdHMu4W1Sueg3s0wvQ
         5CsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395644; x=1794000444;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hkp5qs0Xl0GwSlkqXL2hIPnMMlQxkKMz2tez2uhZA7U=;
        b=oTA+6AieRZSwvDEGrUaLdJF4r/nQ3z2HjhI9qDylwqlKlVAPZnQlW+Bwgbz34ALNsU
         WQKFEKX2WwBJEGyXS91W057KAZFyFH3agYsT4KpWiVi+PVpb5bPUepVGTzLF4kUZjboS
         Rc6k1rnWyi9bbbKj/XNCaDFpnAxQt+vE6ZNdWprDqdNzpBaPSSmCFIDNaBB9ja3TT/lm
         o3d9w5zhNsc/gg+k8DVcKfII9pWzF7CzbsemfkEU6XwhiIFcZhlkELDAmXylzzP/VK1q
         jPfuWAOeHUbxrFxMYOdErYpR4girJ84iuNks6rThAEmSOaMuc/O2qqqBBQStuFDYy2qM
         9EqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqkLMdBkVqLtfarTzvAKLh53P+uOM2kokJdi87zew+jPP7hT8hhcalOh2SB1KDFA+tlwjbtBRd/f9s/IY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJskjB15VDP2Fr79wMmAplZrvuzFXRLe5xFPN5jBIz/sp/Wvs0H
	Mi9rIsxYKfqAFcMLRcypoQZbmHN6Do/iLSb9Zn2gE39JJDxTvL7zsCrcJPgVrh5fSgGsO7Ftlhq
	UXiuTjw==
X-Received: from pjbcq4.prod.google.com ([2002:a17:90a:f984:b0:3ad:ce09:ff3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2e4f:b0:3ac:9a5e:9ce9
 with SMTP id 98e67ed59e1d1-3ae897f3440mr2987534a91.29.1793395643960; Fri, 30
 Oct 2026 14:27:23 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 30 Oct 2026 14:27:15 -0700
In-Reply-To: <20261030212721.2606393-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030212721.2606393-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261030212721.2606393-2-seanjc@google.com>
Subject: [PATCH v3 1/7] Revert "KVM: x86: Skip EFER vs. guest CPUID checks for
 host-initiated writes"
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Revert the misguided-in-hindsight decision to allow userspace to violate
architectural consistency when setting EFER as it has since been solidified
that userspace is required to configure guest CPUID prior to setting MSRs,
and skipping the CR0.PG vs. EFER.LME check in allows userspace to load an
end state of EFER.LMA=1 && EFER.LME=0, which is supposed to be impossible
and trips a variety of KVM_BUG_ON()s in the MMU.

This reverts commit 11988499e62b310f3bf6f6d0a807a06d3f9ccc96.

Fixes: 11988499e62b ("KVM: x86: Skip EFER vs. guest CPUID checks for host-initiated writes")
Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/msrs.c | 30 +++++++++---------------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/arch/x86/kvm/msrs.c b/arch/x86/kvm/msrs.c
index e91650af44c2..2df42276fd82 100644
--- a/arch/x86/kvm/msrs.c
+++ b/arch/x86/kvm/msrs.c
@@ -580,8 +580,11 @@ static int do_get_feature_msr(struct kvm_vcpu *vcpu, unsigned index, u64 *data)
 				 kvm_get_feature_msr);
 }
 
-static bool __kvm_valid_efer(struct kvm_vcpu *vcpu, u64 efer)
+bool kvm_valid_efer(struct kvm_vcpu *vcpu, u64 efer)
 {
+	if (efer & ~kvm_caps.supported_efer_bits)
+		return false;
+
 	if (efer & EFER_AUTOIBRS && !guest_cpu_cap_has(vcpu, X86_FEATURE_AUTOIBRS))
 		return false;
 
@@ -610,33 +613,18 @@ static bool __kvm_valid_efer(struct kvm_vcpu *vcpu, u64 efer)
 
 	return true;
 }
-
-bool kvm_valid_efer(struct kvm_vcpu *vcpu, u64 efer)
-{
-	if (efer & ~kvm_caps.supported_efer_bits)
-		return false;
-
-	return __kvm_valid_efer(vcpu, efer);
-}
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_valid_efer);
 
-static int set_efer(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
+static int set_efer(struct kvm_vcpu *vcpu, u64 efer)
 {
 	u64 old_efer = vcpu->arch.efer;
-	u64 efer = msr_info->data;
 	int r;
 
-	if (efer & ~kvm_caps.supported_efer_bits)
+	if (!kvm_valid_efer(vcpu, efer))
 		return 1;
 
-	if (!msr_info->host_initiated) {
-		if (!__kvm_valid_efer(vcpu, efer))
-			return 1;
-
-		if (is_paging(vcpu) &&
-		    (vcpu->arch.efer & EFER_LME) != (efer & EFER_LME))
-			return 1;
-	}
+	if (is_paging(vcpu) && (vcpu->arch.efer & EFER_LME) != (efer & EFER_LME))
+		return 1;
 
 	efer &= ~EFER_LMA;
 	efer |= vcpu->arch.efer & EFER_LMA;
@@ -1547,7 +1535,7 @@ int kvm_set_msr_common(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 		wrmsrq(MSR_IA32_FLUSH_CMD, L1D_FLUSH);
 		break;
 	case MSR_EFER:
-		return set_efer(vcpu, msr_info);
+		return set_efer(vcpu, msr_info->data);
 	case MSR_K7_HWCR: {
 		/*
 		 * Allow McStatusWrEn and TscFreqSel. (Linux guests from v3.2
-- 
2.56.0.385.gac671c819a-goog

