Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792636099;
	b=j2TnNUW2Gy/OKRe8woJm9eHsvYAV4TlMx48YQvVLBgz/WCgga0MYFHzfTu8CKUW36a2w
	 IjPfzlRYYj1i96mRxeqo7dCZY54T/tpNfYFMgGmyf37r/49hS2+1EMi0eJfqtqgeQrGwm
	 wxyoBlpjAzwqz9WKB92paZK/2/FhQgP8PYmvJcN+14pA4AkUs+zSpYzHoGlxgdRUDs4o5
	 S2eBSHhVX3MnXyW/qxTFMtSEZTCBD7EHfoEfaYDvvKHNmfcykvD6Ff+KuT+hJDfR/ngUc
	 eLl+nNVIwcBGWaN5ETH2/6Vd6siU4+f3NYsenLYtKV/5is47qV43xdbukOa5taDVUow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792636099;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=EAAWKPNIvnyz4HJ+1ciZLxfch9wphgM0NQmQydeHNgo=;
	b=RoEdA+4fLvs6VhHzlz42f23QUIVhnuyIvnPnh1JGCfzGhWnCBLE9Yjz1KNa3hJi3rmsb
	 kHn3P4PteysGc9Rd+bUEI4dqY1m56hoR5rCFHTqgAIljNRfCv4J4xJxSUfaYfvEnC4xRk
	 jFAjUr9xZRVolv7hQh+Lh5jBYtm1BfrltjhzsQv5MvkBNYhnXEIKbBiU9eH3Dk2JUUn+U
	 /L18xPcIcvCtG1CmxNlXky2JO26nK76loUSSafMgflklg5xzV0Zuydfi7imZPVcTwOe2j
	 4+TEOXcBSCsyQCU9WCPIXWmRcOc1J3ZjK8kmv0rBeZWrvvGfV/E4HORng/WtXYEfH/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=pEIsnjxv;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA32606A326
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:28:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FA32606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=pEIsnjxv
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e601800e58so18580505ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792636098; x=1793240898; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EAAWKPNIvnyz4HJ+1ciZLxfch9wphgM0NQmQydeHNgo=;
        b=pEIsnjxvndomloZziXjUozDNpVKzKo57Y8WjqClBGF24o16h7eIB8xiTaHNgZ16ydK
         YRAGbvuKBlVAYAQO/8WYx0RGS47eVQ8SFa7m0Mz3C9o5VCQhIRlEgqouK9Qq9Z9k1POx
         2XmO5M3qt/3aNIWJCg1OHsDKFeiCxjhrtpaAPcWizrx+Vph954RZRxpFpeO92EL+RY8Q
         igXNUBE/EufpL/vso/2xrj+oYSkIQecx+UsuSS1HFxae8p1AKxADIU2puWJ60HdMy6jr
         Vl+6PY7OMr9+4Ywvwivnf1P9tG/2Ea0NPSCa2SD9VisunCIxEdsEjpWfdg8EiiY4WsPY
         FDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792636098; x=1793240898;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EAAWKPNIvnyz4HJ+1ciZLxfch9wphgM0NQmQydeHNgo=;
        b=J0gjuAoueNfTYiR7jj+loaPu1SmNv1DrwYeghAzPNh9Q22MpcFL4h9prG4sQCGZYG1
         BwldlOsXKeFDkjX34JcP70xK01L1T/H1w+LuYx+nQOvHIabWGhOBF2qNSwAY86IyzcAg
         JWjzjCriEaqEcUV4Qs7Nu1KycFJOUHQ8tacbgaWTckgmmvcnp2KNFZ7FD/ej8G+WGi0G
         DI2vRBeLLfMuOsW0Ttri1jk3flgtzvcNttJYXjApwaRsgqcSs3Teit/bnsuGRQm6/Axm
         MWYNTLB3aD4LUhw2K9RNKkM4FhpJkNgbV9+mK1CN1J7CGBP42Wty4Fr3PVwLmJqQEmaR
         QvZQ==
X-Forwarded-Encrypted: i=1; AKwUvByaOMkY3RZUWS16T7O29dCRBlXIGv5KyBMYqT/Cj+Fsgm6onVyOADUPXpIQMVjh3rDcGNhWceZbW0VJXAo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHXJRg3746eZfYJRX2ui4qEt8F8uezgfnUUKqbva9gsyjTGinq
	HXFjs3R9Kvr4qktS/nvizOEVxxYvqy92gYEwa4nDXazNnAD0+6Ip+/AiuEiQU89lNdHNkY5lq1L
	ImdyiiQ==
X-Received: from plkq19.prod.google.com ([2002:a17:902:edd3:b0:2e5:db9c:f03f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1a0c:b0:2e9:5714:6082
 with SMTP id d9443c01a7336-2ea43d85a51mr32346975ad.55.1792636097710; Wed, 21
 Oct 2026 19:28:17 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 21 Oct 2026 19:28:13 -0700
In-Reply-To: <20261022022813.303978-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022022813.303978-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261022022813.303978-3-seanjc@google.com>
Subject: [PATCH v2 2/2] KVM: x86: Consolidate invocations of kvm_x86_ops.load_eoi_exitmap()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>
Content-Type: text/plain; charset="UTF-8"

Rework KVM's handling of EOI exit bitmap updates to consolidate the calls
to vendor code so that it's easier to see that the Hyper-V path is doing
the exact same thing, just with extra input to account for the SynIC
vectors.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 0028d57e964a..483dac323c8e 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8047,6 +8047,9 @@ EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_inc_or_dec_irq_window_inhibit);
 
 static void vcpu_scan_ioapic(struct kvm_vcpu *vcpu)
 {
+	unsigned long *eoi_exit_bitmap = vcpu->arch.ioapic_handled_vectors;
+	DECLARE_BITMAP(__eoi_exit_bitmap, 256) __maybe_unused;
+
 	if (!kvm_apic_present(vcpu))
 		return;
 
@@ -8064,17 +8067,14 @@ static void vcpu_scan_ioapic(struct kvm_vcpu *vcpu)
 
 #ifdef CONFIG_KVM_HYPERV
 	if (to_hv_vcpu(vcpu)) {
-		u64 eoi_exit_bitmap[4];
-
-		bitmap_or((ulong *)eoi_exit_bitmap,
+		bitmap_or(__eoi_exit_bitmap,
 			  vcpu->arch.ioapic_handled_vectors,
 			  to_hv_synic(vcpu)->vec_bitmap, 256);
-		kvm_x86_call(load_eoi_exitmap)(vcpu, eoi_exit_bitmap);
-		return;
+
+		eoi_exit_bitmap = __eoi_exit_bitmap;
 	}
 #endif
-	kvm_x86_call(load_eoi_exitmap)(
-		vcpu, (u64 *)vcpu->arch.ioapic_handled_vectors);
+	kvm_x86_call(load_eoi_exitmap)(vcpu, (u64 *)eoi_exit_bitmap);
 }
 
 void kvm_arch_guest_memory_reclaimed(struct kvm *kvm)
-- 
2.56.0.218.g1ec904b173-goog

