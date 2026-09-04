Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0007244687
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 00:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788481469; cv=none; b=C4ZIsdyxTCK0uJIez6wO+8MRmtkgGgZ5EmpYwKgL3AKYAglw3m8vGOZNMLQETLcFCI5vc4G0pf6ydqeejXjPan4i08q4+k6han++9xkdB9owJmCTolAtQL0wHXkszXY25Ft0lVh69g027xKMlX3ZUz5L2Ou/cQnHjFZk/Qfqzpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788481469; c=relaxed/simple;
	bh=q9o2sO+8tFxBRqdWv+G5m4qqEyReNwVpsJM88/0++yQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=saY1WjvRreQ+Qym9f5Q0qSEWjaib3z8OR/WYnSV8NonAdW7/nf3fFAn90v3nYPYkzQSgpbs9Ckdk2bHGeH3HUhwBUX+hJNSR4XOpWwoXB42PI3BYbzDPs4C3qkiU1FrONKbz4H+7pHEZUEXccgJaiILvF8ab5jkBCA0mHIYE6E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a3i6r+pX; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a3i6r+pX"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84a251c2e3eso2093016b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 17:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788481467; x=1789086267; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/766USs3JdFk4eApT4HnvuxiQ4O/gSl+NL1dajtI/fI=;
        b=a3i6r+pXvR/KHC0ZQLB3AW84ZaZhkWz4++ua5hjvRs4os7a85BOWDb43nElTitaQO9
         YW0hIHUztMW7rEYtKlGhTHpxiUlKXlKLPYuxwVWR8vZwy/CIgwf9jZn40Uon6kqGUfzy
         /RIQMYjTYkqcqzXAcmnQ5vMQmn962HUIWorgI5vlIa95lgt9AP8nyaj8sT78evhITRN4
         ZqXz9NR9oj26RQVHeuWXkJU8PdQs/mCoKEzTm+TPxqZFdOCETav9m/k5enkodgqFzskY
         tKC8nxMOj47HyELEoRLrjwFdq38B38czfQWKMmKpMEumFY5ulhO+ESvKihc7sUyv6Ms8
         /5zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788481467; x=1789086267;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/766USs3JdFk4eApT4HnvuxiQ4O/gSl+NL1dajtI/fI=;
        b=YfeV2xY8jk0IKb5zD1M1VtIHLFnwE2zAscIWW4RXFdNTKV3eS7dRRbAjO46+Y7qwrQ
         HAB9Av1e16Nj/Qklgth7rUSYu+W0g3mC1lp7MjoLZ7OEicVyD+e/XQBUgI+a4i+GcqK0
         qh3M4pR0nwj5jGkGgqdGLkbHzrih78bmvr1tlfjvvT9/pvMa449M37KK2Nfe6lo5iqfO
         llA/Muf8SZXpcstGHpMUr+mi25FyYGBZFDfLfnOmbqM5LNriUtcQLUaADUgx5nYq/XYh
         5nY3NgTHfgxySgXOkeY1WD/3NXJEWwBVdB3BDJ9F9RPmWZom/gQZrjhWyN1tRKL8K0j1
         prLQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2M1B7X2+8SeClf26B/VsupIDgwAYcDrr0x5YVgNBJ+PMOU7X5JCs8Ud1f2YxNQcLCj9kxJI56eXFm8oE=@vger.kernel.org
X-Gm-Message-State: AFuF++l26lgklyO6ZXJv9YkBzVLYvAm6Kp5d1pGOIDUnG80TIU5/ewAB
	rAoHEwNwIPh8k6NT4eDE3qSX3R0O5PnPpDmnjIsWgfWt6ut3PBhLSQCzzacee57tKG6hkClP5U2
	QZpb1+g==
X-Received: from pfbkq17.prod.google.com ([2002:a05:6a00:4b11:b0:847:9be8:84d5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1d8b:b0:84a:2b96:5986
 with SMTP id d2e1a72fcca58-85ffc774e48mr8112529b3a.8.1788481467148; Thu, 03
 Sep 2026 17:24:27 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  3 Sep 2026 17:24:07 -0700
In-Reply-To: <20260904002423.3154436-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260904002423.3154436-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260904002423.3154436-2-seanjc@google.com>
Subject: [PATCH v4 01/17] KVM: nVMX: Make VMPTRLD result in #UD when eVMCS is used
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
2.55.0.979.g7e5102b832-goog

