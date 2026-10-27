Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793140245;
	b=2NglGx540WCBr/zObhbIImOWEUaXc/HXPiySCq8U1Vu5bfbE1GGTqicb819G2fG0/Z2z
	 PejUg3l35Jp0uBOrw+hlvic1BMtywgTGNXr1KK/QBYjfn7Y9zmVSf5ng76z4IxdkAGdIa
	 7L3AAM3zJGM3BH3QFxwRfl8B8P9wnEnZ+lE0g8ljiOCk5zbZeOvdsZvIHjETmm6nqXy1B
	 ZSv6ahzqpzxmQFm9Z+C/npWgheuNLgdPNN7hq+XIXm81gIkHVG8XMc7bp1fzjuOAWPluf
	 v7kueRVMuAbS41PvBXULOxbKoDe1fSQsFqObw+RdJhSoxOLXbMnfruOMrGsxxFJ6Hgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793140245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=i8kJqQzMIJPzYheb5omgxLW7EEpDJoWV7/L+arjRZD8=;
	b=TFIrhLKUUoHd6OPN+1wk+CQ9khsUJcAPmYYo5AWCTJ2KICdhXfnyn3KjXwJjiTqZYV9R
	 fJZ0oN+bsEGnFRGuOjcguOjg4NxQBAW8CWTVdsmrlkNgvViJyM9DBcIN8fOcvRVJ06cyn
	 sh9G6bFUY9dMPRFAnaCw+XSxK+StYxiyJyEZSfnjI3JaaQI8mngOm3ixD/oQhKtjpbGDn
	 7rmr6QJ/J349X2IJ+7RrTR9oTbyZsjQ5L0Ptuk73iNldv5QQMiwFyBKb6sfXCmHmYKWpU
	 MzGmXxF7STFMmigk9OoUQinwwZDSkZ+gR3hxb0xJr9WET7aT95dwMQe8bg/z/4cgQVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V3pZ7V1f;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AB7606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:30:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1AB7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V3pZ7V1f
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ada8bc8575so606355a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793140244; x=1793745044; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i8kJqQzMIJPzYheb5omgxLW7EEpDJoWV7/L+arjRZD8=;
        b=V3pZ7V1f2tixLciaVFD2xmG2cABlR2PY5LAdHTaYd61TU+M9EBa/bHKxA+hRVr6Q0H
         V2+Z5qYBGSO63b8uQ05qUjhYece113Vy0I8U1ly7whoum4ZbkaPOURRAYMIFfVawPRC4
         ZPwsbxgmUTOd37wyVUHqXoLwfslADs27r9WpejrihJUC4HNonwwla3WWnUSvylSs/ZDl
         bd+7aTCB/91npknAK96ulASudyFhX5E8vPGICE6tK22HVreNiPxCfjsnajFflMQOuNMV
         /dDIAVpFM6yQVrLk24yKalTimZ9GNHJd66a7KO9JKD7JQPXsvxi9eXuoPbIUF5wGNTBo
         Z90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140244; x=1793745044;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i8kJqQzMIJPzYheb5omgxLW7EEpDJoWV7/L+arjRZD8=;
        b=UPFP+O4ePYhNLQ5IE5Lnlc5vT4WltpzFS+wcpfZ94stbf0hlUwThcpZg302NUBTvHb
         9Ia6gg+mihnWxBfBkBrs5aH2JwIzOUtMN57frWP1QzV2lkAzWKncKT+P4of8uWe6iP+D
         7fPJp77DN7g2tJvL0kuYNjO0SDu1Q7KmHUbiLdvRmfkzuRfauKj5Mke7b1w+R4bSoGDg
         t/UZJq+vRs46es1JIuLVeR38/Ym0spffY67gamljWDq9+pdAwEmnJNhR7ZtXJSjWxiv+
         XJKyrxpzMNArJemfXHd5z00y+sTtg80pCPh/ysxz0+VzfEys8dbiPOrMUunGESRyyc1P
         5oxA==
X-Forwarded-Encrypted: i=1; AKwUvBwS6ZucU9b5orRvIstAnvx+pF6JIyr45S6BQSlqgjVmzxtqtqCSaipySK7Up7j8mo2VUaropFsy+cJcBlE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJI9F4XouN66Dra13lp783kMaIAWRddQWIsEqVcJYT47ahXwX/c
	KG/3NlNB7Czr40hWJVz3qNgpyKFLLRhG08VlLZchgrRI/0aPw1Po68Skt9cblU+2tQqYkPQ6z02
	8UnSh0g==
X-Received: from pjzj16.prod.google.com ([2002:a17:90a:eb10:b0:3aa:dfda:ecdb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2e48:b0:3ac:aa8d:19de
 with SMTP id 98e67ed59e1d1-3ae57df56demr338825a91.3.1793140243806; Tue, 27
 Oct 2026 15:30:43 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 27 Oct 2026 15:30:37 -0700
In-Reply-To: <20261027223038.1566931-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261027223038.1566931-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261027223038.1566931-3-seanjc@google.com>
Subject: [PATCH v3 2/3] KVM: x86: Switch to vmcs01 to update EOI exiting
 bitmap on-demand if L2 is active
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko Bot <sashiko-bot@kernel.org>, 
	Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>
Content-Type: text/plain; charset="UTF-8"

If KVM needs to update the EOI bitmap while L2 is running, temporarily load
vmcs01 and immediately refresh the bitmap in vmcs01 instead of deferring
the update until the next nested VM-Exit.  I.e. give the EOI bitmap the
same treatment as the many other updates that were previously deferred.

Reported-by: Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>
Closes: https://lore.kernel.org/all/20261017093016.32348-2-amirmohammad.eftekhar@cispa.de
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |  3 +--
 arch/x86/kvm/regs.h             |  6 ------
 arch/x86/kvm/vmx/vmx.c          |  2 ++
 arch/x86/kvm/x86.c              | 13 -------------
 4 files changed, 3 insertions(+), 21 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 0378577d9d8b..92aae551bfae 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -113,7 +113,7 @@
 #define KVM_REQ_HV_RESET		KVM_ARCH_REQ(20)
 #define KVM_REQ_HV_EXIT			KVM_ARCH_REQ(21)
 #define KVM_REQ_HV_STIMER		KVM_ARCH_REQ(22)
-#define KVM_REQ_LOAD_EOI_EXITMAP	KVM_ARCH_REQ(23)
+/*#define FREE!!!  USE ME!!!		KVM_ARCH_REQ(23) */
 #define KVM_REQ_GET_NESTED_STATE_PAGES	KVM_ARCH_REQ(24)
 #define KVM_REQ_APICV_UPDATE \
 	KVM_ARCH_REQ_FLAGS(25, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
@@ -746,7 +746,6 @@ struct kvm_vcpu_arch {
 	u64 host_debugctl;
 	u64 apic_base;
 	struct kvm_lapic *apic;    /* kernel irqchip context */
-	bool load_eoi_exitmap_pending;
 	DECLARE_BITMAP(ioapic_handled_vectors, 256);
 	unsigned long apic_attention;
 	int32_t apic_arb_prio;
diff --git a/arch/x86/kvm/regs.h b/arch/x86/kvm/regs.h
index 97c17b120a57..04d047f46753 100644
--- a/arch/x86/kvm/regs.h
+++ b/arch/x86/kvm/regs.h
@@ -463,12 +463,6 @@ static inline void enter_guest_mode(struct kvm_vcpu *vcpu)
 static inline void leave_guest_mode(struct kvm_vcpu *vcpu)
 {
 	vcpu->arch.hflags &= ~HF_GUEST_MASK;
-
-	if (vcpu->arch.load_eoi_exitmap_pending) {
-		vcpu->arch.load_eoi_exitmap_pending = false;
-		kvm_make_request(KVM_REQ_LOAD_EOI_EXITMAP, vcpu);
-	}
-
 	vcpu->stat.guest_mode = 0;
 }
 
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index d8e66d67138f..ba5575002538 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -7082,6 +7082,8 @@ void vmx_load_eoi_exitmap(struct kvm_vcpu *vcpu, u64 *eoi_exit_bitmap)
 	if (!lapic_in_kernel(vcpu) || !enable_apicv)
 		return;
 
+	guard(vmx_vmcs01)(vcpu);
+
 	vmcs_write64(EOI_EXIT_BITMAP0, eoi_exit_bitmap[0]);
 	vmcs_write64(EOI_EXIT_BITMAP1, eoi_exit_bitmap[1]);
 	vmcs_write64(EOI_EXIT_BITMAP2, eoi_exit_bitmap[2]);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 32563a91fba9..0028d57e964a 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8062,17 +8062,6 @@ static void vcpu_scan_ioapic(struct kvm_vcpu *vcpu)
 		kvm_ioapic_scan_entry(vcpu, vcpu->arch.ioapic_handled_vectors);
 #endif
 
-	if (is_guest_mode(vcpu))
-		vcpu->arch.load_eoi_exitmap_pending = true;
-	else
-		kvm_make_request(KVM_REQ_LOAD_EOI_EXITMAP, vcpu);
-}
-
-static void vcpu_load_eoi_exitmap(struct kvm_vcpu *vcpu)
-{
-	if (!kvm_apic_hw_enabled(vcpu->arch.apic))
-		return;
-
 #ifdef CONFIG_KVM_HYPERV
 	if (to_hv_vcpu(vcpu)) {
 		u64 eoi_exit_bitmap[4];
@@ -8240,8 +8229,6 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
 		}
 		if (kvm_check_request(KVM_REQ_SCAN_IOAPIC, vcpu))
 			vcpu_scan_ioapic(vcpu);
-		if (kvm_check_request(KVM_REQ_LOAD_EOI_EXITMAP, vcpu))
-			vcpu_load_eoi_exitmap(vcpu);
 		if (kvm_check_request(KVM_REQ_APIC_PAGE_RELOAD, vcpu))
 			kvm_vcpu_reload_apic_access_page(vcpu);
 #ifdef CONFIG_KVM_HYPERV
-- 
2.56.0.307.g5fe7bd680c-goog

