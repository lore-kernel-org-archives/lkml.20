Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792708256;
	b=1WS82PV2KUlhf5Za+l8BKqv7RNEUnnyI3r8mFcZf58GWB10t3i+8U3ZW39cGtAFlJP3r
	 /LL3Thma3+WdF3hHI0eYKkGLrdpBr7HDmKTzzo+zMBeXpn4grv2X00Ehrmj+tz7RhWD/n
	 MGLkE0E/BeAWZ27UsQmwr2lJccJatN+N6gbjuIuh5BAhUuVRyIUp7HeN9SSlK/nh2+gVX
	 1IgPUqWVqYAtRojmG2NWNfGebzR+fb3ZONhbyqbgXg8dAsV14FvIV9vCrFzE0m8MNIo2/
	 1p6Z+QkexoCSpqW2gtXvo23OPzNVPkqnP/MUg+TYn2Bl9nJkj3zoJ8OeajpNm5+vwgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792708256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=c1ICGtebK4PnUz+eTPBqGZS7H61BX5xXk5/xh07UySM=;
	b=5Z2k3afulfRq8KN95xlm0sxFdlJBPYkbhbZ9VZaDZm0vKmMB62FnBwq664JlPlACb15O
	 GgP9K1cob+KoqylRSi0UxdqXi887OP2ozY0IXfOMakjljJFWQu74NIwkkcjh3pjyZUEtP
	 FevuR+FTS8tIDo6eCQHRWt2X+y9oK5tj5F2hkhv+gaZs1E/b/d9DpJFRnJq6ycCAnXmw1
	 I2norGLe7GjWGVH3Rz65gC5drgvx2BKsOG5A+JlT+1j4yU0nbPM1gYykD480IxWtV8GVC
	 LAlcOQMtCYylcKxbJJ4laBOf3Ir5OPAcdHoLrc7SHgwTAvrdRe98xtrgGf4pE4aFyNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="LUOw/BMB";
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F0F606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:30:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0F0F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=LUOw/BMB
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a065e2933fso361338b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792708255; x=1793313055; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=c1ICGtebK4PnUz+eTPBqGZS7H61BX5xXk5/xh07UySM=;
        b=LUOw/BMBx97hKPKCbPzJRyCiigoIQIZ+/ugNLh/T67HADnNpOk3RvzV1bjpcp7eTSQ
         hyb5KxuWTLj2NA7OA94u7HLh4HTpIzOAibkzyk2EhHkgzQO2NSP+EytuAweWOtVLzz3j
         Lm+MrBknxnPesoOZFnZJDeNGhyXXRKpTh+kq279UJZIKFqEOuGwp1Obt47ybLO8FV5se
         Ne9hUFrxMgDJt82GcnMlKOu6ZmBz9tS277iKK28UoqcB28vfgkgH8LWgiK/m2yZdZRdl
         55tdLbPRI+ptA0kozYZfLPE83b+s3zMaJYkUqzE7E+Eo/oTAqUS7Ayfa/LSI5cp2C6KG
         BwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792708255; x=1793313055;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c1ICGtebK4PnUz+eTPBqGZS7H61BX5xXk5/xh07UySM=;
        b=H9oLBToAWgzxmlj6FEUxdDkUlaXEJ9KM8L/vDoT4ao62UR2rlSMj7yzvNpESgmsX3u
         e+KqyKA/Gauu9SBP/FBgyD+7eOuvyXtZuk18XNOyD27vF/EdajJugc3BLPSPJh/p9f0H
         3KYRB16nhXV5UxVpYnStykTqat1rMfL/PtA/xiIVmwH7To1clGyzHxcHuhRY42t2CGix
         sOsXzGv4Jr8hosVuSPLmf1F2uYFoIzMAzNFZC4yH66v7qy2Qqg+TX00yVq58rEYrI9Z9
         GjvyA+wkZnsEznC0bzdsS+0kk58cpxVecKSRySMUXv6r2dLEBDx4EWi5q3apnu+/R/K0
         s6WQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyh/eHUnCYPhG+gIwq+axURWS/BpgnF80dzaPvVRUvsXzSQnFCiG88hQqzTT4RWHuang/JPvzg7iLh4wU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIx4zMYQ4TbfHreR+NIEurRIpX497EbASXRzQeAVDDYs8Q+c+9j
	rlva6XbUXoZL2ANY1bZq7VETQH8nyMV0wnUrxpdxCzYVeo2AHGKgvSWNrFFkEyXAVSPkP4wyynZ
	gffHMsQ==
X-Received: from pgca20-n1.prod.google.com ([2002:a05:6a02:6394:10b0:cd8:b213:347])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:4393:b0:3e2:1418:aae2
 with SMTP id adf61e73a8af0-3e376759aa3mr305777637.68.1792708255129; Thu, 22
 Oct 2026 15:30:55 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 Oct 2026 15:30:49 -0700
In-Reply-To: <20261022223052.646891-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022223052.646891-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022223052.646891-2-seanjc@google.com>
Subject: [PATCH 1/4] Revert "KVM: x86: Skip EFER vs. guest CPUID checks for
 host-initiated writes"
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
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
2.56.0.257.gf7497c7d27-goog

