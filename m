Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEC634E75A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790730799; cv=none; b=jyqQtkVUwhYqdaNBTfM/rPknqd/UFhSKWfLXUSec2xZLEpvMS/aVtvANWjSrB/8uJGRXEpMCezZa9ep4HCIkqr7+SYF87thoaXk2odeZJIzV4AU/bfOvfkaAu1KPO4lIC9Iwcx16kKmZs5h+0/Q0wBs3Bqija1NJaqQkHnWMAlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790730799; c=relaxed/simple;
	bh=wqr+SMrt7dxBNk54DLAnLV4dP8Pt5nYHC5LIfJSQCT4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HkTHqVqGEn5a9Sh1G0PKN+/VEAt0f+y+VvXuMaDILpRUnzt2lV+T2jQfpPf4/hFUtTONVVvAEgFegqUG7Kql88HjN8FPn1EwAC1ryH2jRFSNfZZ/bNdRE/MTcz+izHpQ68iQkn8Nmr7vA9SB86ak5qgVEASs1cNDCNwUPmuayRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AdnV53On; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AdnV53On"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so2897695a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790730797; x=1791335597; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=APU6Hsi/UB4LmSAjtjOtU74/6EleNQVrcW2jpeijhhA=;
        b=AdnV53OnfwQJ+a0q5dXnX43vYe8Aser8WAAPl4z2s0Mc8nS2fvIYrPZyQjsH8pIT0t
         Iybzkjc+pvng1/l38mXxa1O1kSDBbYrbGpFOolmnCh42nFEwoN1wN7al4o6Zb+RLQMtm
         bB4CC3VUxUBEkwVha6wwb42kI5Q7AiIJ+Ly4wRcZagI9e4YpnUqPaJTqNlqpCl+sKLrL
         ivbbhJxtfKTrxqhzV5k4hoqq6sCZG7lThSwUnBFZ30arulQgJAkDnzA1Xrea3+5LcKrF
         EbHbsmccJBB8RHLSCWrVyS9Ezg0UD7Igztkz7bMYVX0rlnStSM/OAXwK+G83mbMNgaRP
         XwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790730797; x=1791335597;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=APU6Hsi/UB4LmSAjtjOtU74/6EleNQVrcW2jpeijhhA=;
        b=WcOAQNro0AjHc6ROjnra7M2pHAH+4FThHH5y9VSFMUDCVAtCcwlqh+YcqVVFa+2CYc
         N538Q4zoGAm+XWgwcp5+FXQAqVtl2J+wKrqBQMLYAdkYv+wBnApfsE2dpeze6c8BV936
         GgPUE+OWlp1yHNfu1okCCYyuVFFWL8wm9Z9GiofSuLuGAqPYOx17AgqBpJcF5HP31MBd
         Qjoy6lLDVmAGlYYg+eMAcJ4iwy3FN7N8sy3xPYWxlw7Mxg3ZIxKCn8aTaiS5XlOQwOCK
         J92omcLMOmesyh1X7LDo2VIjqQShN2W0COfjaM8aWXu0wiqMMFGK7wW9LfrGIfzRedeP
         6FVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhEDM31MTz34eoW0H7CceydW+a/sqkFIWGarKYDbc+I/q1tvK2oj3pZrPe02NbJ4Z8BuwBQwwC4m8QVoE=@vger.kernel.org
X-Gm-Message-State: AFuF++nAs1wlksZe8XggHxeKljpipFnA0w7kXL+kb85GJjUHQEAPsnXQ
	AApDn15Nj2D9kPdkcIfD8PJQ6C1nczE0rVqBkm7ekuzd1U6Jfy8Cleo1MRBnKXPGh6XbmecgP05
	1apUlsg==
X-Received: from pgdh4.prod.google.com ([2002:a05:6a02:5184:b0:cc7:b470:94ff])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:cf82:b0:3dd:a195:dd5b
 with SMTP id adf61e73a8af0-3de953c2acamr737312637.61.1790730797369; Tue, 29
 Sep 2026 18:13:17 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 29 Sep 2026 18:13:03 -0700
In-Reply-To: <20260930011313.3197688-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930011313.3197688-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930011313.3197688-3-seanjc@google.com>
Subject: [PATCH v5 02/12] KVM: x86: Rename kvm_dr6_fixed() => kvm_get_dr6_fixed_1()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>, Shivansh Dhiman <shivansh.dhiman@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"

Rename kvm_dr6_fixed() to kvm_get_dr6_fixed_1() to make it more clear that
the helper retrieves the fixed-1 DR6 bits for a given vCPU.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/regs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/regs.c b/arch/x86/kvm/regs.c
index fad31b59c622..62075443f6b9 100644
--- a/arch/x86/kvm/regs.c
+++ b/arch/x86/kvm/regs.c
@@ -772,7 +772,7 @@ void kvm_update_dr7(struct kvm_vcpu *vcpu)
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_update_dr7);
 
-static u64 kvm_dr6_fixed(struct kvm_vcpu *vcpu)
+static u64 kvm_get_dr6_fixed_1(struct kvm_vcpu *vcpu)
 {
 	u64 fixed = DR6_FIXED_1;
 
@@ -798,7 +798,7 @@ int kvm_set_dr(struct kvm_vcpu *vcpu, int dr, unsigned long val)
 	case 6:
 		if (!kvm_dr6_valid(val))
 			return 1; /* #GP */
-		vcpu->arch.dr6 = (val & DR6_VOLATILE) | kvm_dr6_fixed(vcpu);
+		vcpu->arch.dr6 = (val & DR6_VOLATILE) | kvm_get_dr6_fixed_1(vcpu);
 		break;
 	case 5:
 	default: /* 7 */
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

