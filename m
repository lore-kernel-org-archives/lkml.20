Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793194026;
	b=cItWFQzva02xNqPNdk6F/cpodKVHx/wNd0Q3s506KEYVNmpuDhacBK6FJX6NJPjYsVnk
	 VcXAus5meqFlWO1FgDjDQcClYGQy5V+/vTRh8UM0hv1HOpF7C3i9/RY4komXqfngbpYtg
	 6nKtj0DC6584hd9e1ubR3xIIH1+UF5bAfXoQm08yF1bv6y6Z9ZKx14JUeQfvdPytmJOPk
	 rPZYVaPIe3iRpAgkzSUVKQXQY2e0E2pVlXmb7+m9PCOZxNaZv3NRQj1HNG7lWNtru30s7
	 7ATT/yCroIWfUbA6UduRG+0ccVkBNdT86uurhc1tMh90n3/M94cTTAe7XVTczWx9XTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793194026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=tf7OmJ6aFCP7UVyB60ZS3JuIzhVsrK4m0LoABXWpn+s=;
	b=1eRxaN9erviVVsNoBEquV5Cls8Eh8A6zXfl+J4Sth0f9ZX40XHAi+HugwbN0OtxcodMo
	 xf+mPZw9b1D9brJMCQGKB9puHSjiFdjwF9d3TNqDOJtI/3ptcTUxjTrSqT++RSR7B91F1
	 vf8J/aaNye1eIYZ7SBWh+qJWaCWQmctbEc05Z/Dhc1ZZs8ZIX6K6VfkXhEzkFlOoxwV57
	 Oy3kBBCYWxbpUek0m2sc3Mctes7nxU6oKUzQ/KRbCU1CQmZMOgXO4GcwUQJjkNojlKvIb
	 LGH21MnpP+5/E5KQSel7UkX/kQpUvUpv7m4SwKoM2uEgSKkKmJ9dF0axU5Gyem4R2KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=k4DHAWk9;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B9B606A33E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:27:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28B9B606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=k4DHAWk9
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-89e96c03cd0so857266b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793194025; x=1793798825; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tf7OmJ6aFCP7UVyB60ZS3JuIzhVsrK4m0LoABXWpn+s=;
        b=k4DHAWk9rRyub8viRoyNE9VSCSdkCB4ff4ukkRKe4H5HSWa5/qjQVOAN9iJdQT+ay5
         +4YlXlNRC8uBxHAj22ar9dlt8Hbbe7Aqicyg78J5WblqaQlqyr8LZ8sLHaaNQ4Tk4kWc
         44SG2L86XEI6OhfiP0zupGDtzsLFdhmhUuAs7s+eOkWCK5B7aoG6HB5fMjZhtidHCwka
         4nvlmMgXsiSfOeCYeJrMJnbs0cVcJMMmUVdclQu9RfsY95gldO/N77oHn94yrDcn1rzj
         YdmkWvlADrWo9FTYZcbSMc3JN4cWiXcRbFavwL40Kue3c93j3/oTf1hGoig2sWEeNDF2
         MzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793194025; x=1793798825;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tf7OmJ6aFCP7UVyB60ZS3JuIzhVsrK4m0LoABXWpn+s=;
        b=eTV3jL4Vw/XgVcE2X1RjsCgoJuK8RT4AC9LopS4E6uj2/5D0yKh4YWf2bYdbCg2bG9
         OFWqc/vP0++XmjTAfCyemDpEAAT47DMZieebtqB1Fqi9KE5yUejoqACNulEVUNYdsNFG
         28N39YifUvugivVwrqT1YOGON9i+yDkmTVy53Ypj4OV2vFf+CYU0ynV5+T9Be7qNk0Gq
         TVccvVZoLBbk087LGKyEl7d23hZuK8RpJFYsxFXaTIjpyYGG4QCTR3c/fr41NvK6OL3P
         nBPSHAHFme7wvI3ASsa6tYbQLCaUgUM9F9vThnuh1WAyXaHUD4RfpZpIKqbKkV5+dY2k
         Pzzw==
X-Forwarded-Encrypted: i=1; AKwUvBx9W2JXwiiTvS+L6xqUWxO8ZmzPeei+sbVMvxrSVKMhWawXEIcd9mE4cU8HybtbTcPxrdbz+IKnK99eky4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmEOa4+G4bZ3AjmNZUs+jN//Xi0hzIOKQOczNTktgZxrC/227c
	e+4Y4TuMwdaE66984K+KUCZ3BmNyZS+m6UHfNO5Il6J0q9Br64zTeg+pA9VAKyCtrqCN8kszOEa
	XGh2JmUf+7vjD8A==
X-Received: from pfbbd40.prod.google.com ([2002:a05:6a00:27a8:b0:8a7:b2ee:e219])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:9e48:b0:3dd:a195:dd55 with SMTP id adf61e73a8af0-3e9023e52c4mr2092511637.55.1793194025273;
 Wed, 28 Oct 2026 06:27:05 -0700 (PDT)
Date: Wed, 28 Oct 2026 06:26:53 -0700
In-Reply-To: <20261028132657.1416783-1-jmattson@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261028132657.1416783-1-jmattson@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261028132657.1416783-2-jmattson@google.com>
Subject: [PATCH 2/2] KVM: SVM: Set NMI_VECTOR in event_inj in svm_inject_nmi()
From: Jim Mattson <jmattson@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Jim Mattson <jmattson@google.com>, Yosry Ahmed <yosry@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Include NMI_VECTOR (2) in svm->vmcb->control.event_inj when injecting an
NMI in svm_inject_nmi(), matching vmx_inject_nmi().

Although hardware ignores EVENTINJ.VECTOR on VMRUN when TYPE is NMI (APM
Vol. 2, "Event Injection"), omitting NMI_VECTOR causes
svm_get_entry_info() to report vector 0 instead of 2 to the kvm_entry
tracepoint, and causes svm_cancel_injection() to copy an exit_int_info
value with vector 0 into the active VMCB.

Fixes: 95ba82731374 ("KVM: SVM: Add NMI injection support")
Signed-off-by: Jim Mattson <jmattson@google.com>
---
 arch/x86/kvm/svm/svm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 136069dfcd44..41e85702b380 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -3914,7 +3914,7 @@ static void svm_inject_nmi(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_svm *svm = to_svm(vcpu);
 
-	svm->vmcb->control.event_inj = SVM_EVTINJ_VALID | SVM_EVTINJ_TYPE_NMI;
+	svm->vmcb->control.event_inj = SVM_EVTINJ_VALID | SVM_EVTINJ_TYPE_NMI | NMI_VECTOR;
 
 	if (svm->nmi_l1_to_l2)
 		return;
-- 
2.56.0.307.g5fe7bd680c-goog

