Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794518792;
	b=i96Nvs+SIudfW9qumGNDNBLpuym836uPodWJ9mE5vFqPnZaUNs8UKfTTe3svSID+/F+H
	 fUttsKhmmzXd3A4PMTz8u/cap/x0BaC9GvqklPnLXVHyi2rFtt8uEhyfz1WrpIZFydTSm
	 HF34ButdKC/yJ/WiPwLUsOrO9iTv8EL8UarYsWnQODOcsrQrf+9TW5RWhnq91KxblUvMT
	 kK8IHdSer69EtmmlWb7gwXjZep/iF6UcjesV5cQcYb11urdPz/JwXR+esTm7gx1c8+FFB
	 CjZU1fwg4F6KxztdTPcKXJ2EEmfwXyF5OVq51gJrw+6hlSNeerEu7qq4bXX0hyCTE5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794518792;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=TESmgCxUPr1Vm2wbKzVzpf5OFlB+4n+j8+LrMnvA4m0=;
	b=US/E772MDfji+ZPA52jcqujd/85c2zGgfGgpPK1U+AYM+nu+xU+xSBKIugQS+9JfKMwI
	 UAl3MgE5fufGL48PiE7ZyCNOQA5lGmkCYiDfp8Cv+bAeJc0Los67czgfxiT3ZDVWt+8Wq
	 33yUaRxDY+FXXC5mzpaOJHB0IW+VhWQ7EKUCmaUX4pNj9oGCb4eQVkmtLFgrJBQEYBggR
	 SXbwFAg08llh5RADVy3Jtb3UzUYD7lIPvhrVCoLS3tkGXtrqv88ZMvYqWiTegAt+/zZ9p
	 Q3lmMfTGqkM3OVYSTiPm/IELXRcE3ILW+zsZNKMuwjp+rj51z57u1FGPyVt0BUv0I5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QopOShDW;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F39606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:26:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52F39606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QopOShDW
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4a41f46d629so342572b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794518791; x=1795123591; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TESmgCxUPr1Vm2wbKzVzpf5OFlB+4n+j8+LrMnvA4m0=;
        b=QopOShDWxI1E9RX0pzFGc+2f6Yy/h/7mxtYw/URNk09ek9vnzDdKKHqbOQOLYYr107
         W3c4GBMYzAq3EZQDEFB46+KF7OUH7hhj7YXrqJFdfWod/vmoz3E5GLU/DOd54WPRQXZP
         Vv9I4/KLG0tqV61NjaimWDUhruut1Ko1g9y9QtVRNjqmLPyJB+kiLEcwIOawzTS6r5DJ
         EBsPkkwES+VIt5PIsVZNt2/cuxYbrpfAS5xsfkA3jv77Sk9gschHDf1nIeaC4lknV/dO
         4Q3x2lWbtwuApUZKD2lGdOvgDf1AxVdPnpEvyWl3jbfRkl1lLcF0s486KNAQ010czhRe
         o8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794518791; x=1795123591;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TESmgCxUPr1Vm2wbKzVzpf5OFlB+4n+j8+LrMnvA4m0=;
        b=Yt4DpgedUxrmBs7OG7xVT48Uj88RFReBisQSNtMQUMXgfVkh5OCp5vCOWZ1FscL/Zr
         hlmtlwxXPkMLTB6UFQawq7d3NRao7UN8jnXMoKFPdZCls4NAaDKLHC6LwHDqEFmrR5z1
         0TOjdKMhSRoDg+Q1GVtS98xXi/NDQQPPBjaVQrkyYmaW7V6pRi60DeL7iVtPT9KgTSae
         Vd4oRY2qLLVce/4B3a7ZwZJ+wuJ+mKzdT49N0o7hbJviCwLXeVGWnDgvCAFxhngsTvpi
         qk1dmvJVAZoy4zM1BKnwcoUql5H5cFLYHf+yrBMIJOoKm0bBD5EHqCYNyJpar12K9dQo
         VIwQ==
X-Forwarded-Encrypted: i=1; AL+hErHqCcDwoIuVwSGyt4no7pV1YxjZv+JDgksoesKV9DO7YmPvwC9wN6S26bUSWKCpzWMFadX3Qn63cuk8uJE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9psz+s1/dy3o4S48LfPwZwBXcyxe1U8+DqYA17WHIq2PLgO7/z
	kFHXOuw0OQbKvvOxiSGGFVP08onhLO2Y0IPywn6z769BdXVBkKxo3R+XS7TtWWss0U6wbz+KDlB
	7J7Y0Z74pYqqvyw==
X-Received: from iofe23.prod.google.com ([2002:a05:6602:82d7:b0:9c7:9256:112a])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:250d:b0:4ec:4c7e:37b5 with SMTP id 5614622812f47-56e641d6157mr456217b6e.29.1794518791076;
 Thu, 12 Nov 2026 13:26:31 -0800 (PST)
Date: Thu, 12 Nov 2026 13:26:28 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261112212628.265262-1-jmattson@google.com>
Subject: [PATCH] KVM: nSVM: Gate CET state copy in svm_copy_vmrun_state() on
 guest SHSTK
From: Jim Mattson <jmattson@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Yosry Ahmed <yosry@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

Like nested_vmcb02_prepare_save() and nested_svm_vmexit_update_vmcb12(),
svm_copy_vmrun_state() should gate copying s_cet, isst_addr, and ssp on
guest_cpu_cap_has(vcpu, X86_FEATURE_SHSTK) (i.e. the feature is advertised
to the guest). Instead, copying is gated on
kvm_cpu_cap_has(X86_FEATURE_SHSTK) (i.e. the host supports shadow stacks).

Check guest_cpu_cap_has(vcpu, X86_FEATURE_SHSTK) instead of
kvm_cpu_cap_has(X86_FEATURE_SHSTK) in svm_copy_vmrun_state().

Fixes: c5ba49458513 ("KVM: nSVM: Save/load CET Shadow Stack state to/from vmcb12/vmcb02")
Signed-off-by: Jim Mattson <jmattson@google.com>
---
 arch/x86/kvm/svm/nested.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index 1299fdadeb73..b73bc9c3ebdb 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -1248,7 +1248,7 @@ void svm_copy_vmrun_state(struct kvm_vcpu *vcpu, struct vmcb_save_area *to_save,
 	to_save->rip = from_save->rip;
 	to_save->cpl = 0;
 
-	if (kvm_cpu_cap_has(X86_FEATURE_SHSTK)) {
+	if (guest_cpu_cap_has(vcpu, X86_FEATURE_SHSTK)) {
 		to_save->s_cet  = from_save->s_cet;
 		to_save->isst_addr = from_save->isst_addr;
 		to_save->ssp = from_save->ssp;
-- 
2.56.1.703.gf848ed807c-goog

