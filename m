Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C090F3546EE
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790730806; cv=none; b=Cayki3OByQdeQVPbh9NxbYMUroJAQ/HITtIh7rZn1BTWPkOUs7rE+wTwyhBH5Io7wtYxk5qx5E5MXIwopnVUjAG0JjRMWvKu273S28xNzPT7zj5rFiFU3V15ko1BaLzu7KQe++7nYpOXJM6QU/fgXujtQRHwv4wbPnziBt/PrbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790730806; c=relaxed/simple;
	bh=ElgxEW6lOhjTcQ0sPGPYJIl4XkjO88C2Pm126cID8VQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lwWKiomCqFuA+XLrBqafNrbG+7Gx2uuxJZsaDkgfnlg4ke0rtTGpywp85MdkwdJxxsdFOCnq6zmzLBRCVIn5iZuNZ25hibMSO9kh3N2KA8FAj8YrOPTJyLAPYZWha27Zd5PtPz0e+f15IMua9Pqf+XJTFY3VSCpkDee9lO30pEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UjQDYe17; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UjQDYe17"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfc52ddc55so45890555ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790730800; x=1791335600; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gsm0Z8tsp+/USWWrr0ezp3yOKKjCMmloBgzjcNPK3i8=;
        b=UjQDYe17MC66TtMEAIoKCRXWbAjIrl8cMk5d4inCx+16LbpXsGRoUTtLa+s6e7IVOe
         SCUpohY1V7S9Hw2weiQk60Od857gC1JVZBvfKPYikqkAqtj3FXoA9d7pLQpAdiwoE8sz
         cENe+CZrpcoz+JntoF/Y3i6QeUFuC4HSDHLGdxmO+jY38HxAvqPTAGpNBBQpmVNfin+j
         Z6yWQuut/mt347t3lgkc41cRlmQiQu5i7BHmxjpea8v51j2ERaJk3qAQZdeGBI55sgAA
         2Sg8BEJFfwDG+KTLqPw7bW1WKHclHeuXRwUtewEVngOr5h0XmwbAOkW/Du5PY3qntHiA
         jxcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790730800; x=1791335600;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gsm0Z8tsp+/USWWrr0ezp3yOKKjCMmloBgzjcNPK3i8=;
        b=wnr51Kaa6yL7V8GvgXum2onkVLTrjZxWxmIPbjdS1rDlBjWAgjrUBh5iTFBpaT2rRZ
         pIaTBn1HZ9kafVPpYU0pNmxcXRcLBc7ikHrkv7OC9ee9aAlor5fJXSbfSIcBTTT6uWda
         Dmt0rJ0dVt9fd9GXVNFBWQJReENjLVEiWuMEo7wENpWDQropsaJaOjxfYusTLTMpUgeW
         IXgPplXf3/maKNx6VobJyG7p/+ZuxS7WvD36Mwzm0nOr9kDh2ciOtBuv6eSgl//hhrwM
         w0OOUsHNwjcJrw8D1etPDISq3kJ80mvqk+8fs45iFD1uUmV5hfLMuxivRqCqeDkwu/KV
         aiuw==
X-Forwarded-Encrypted: i=1; AKwUvBx49QrXzAFV0SMpewBAIkH6xRynOKkhqfO4zU3Yo5Q2g100oSjSyIJGQPLaRMv3PeXLDzGZRSPEmFXzLvE=@vger.kernel.org
X-Gm-Message-State: AFuF++la4HEYaDaqLi3vyA9C8bo/XAhc2Th0ai6nbHx5lzBvz5W6u4KR
	KWbSzvtY91dGseehDTwiwmXXgucEFciOsjwe2PWyJ3mypbtJL5S9JtVhloH0Wmf3dBJDHhd4hR4
	YMlFGdg==
X-Received: from pgbcs5.prod.google.com ([2002:a05:6a02:4185:b0:cc7:b455:d230])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:4391:b0:3da:80a1:f2f
 with SMTP id adf61e73a8af0-3de950dd8c3mr740035637.14.1790730799934; Tue, 29
 Sep 2026 18:13:19 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 29 Sep 2026 18:13:05 -0700
In-Reply-To: <20260930011313.3197688-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930011313.3197688-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930011313.3197688-5-seanjc@google.com>
Subject: [PATCH v5 04/12] KVM: x86: Force fixed-1 bits in DR6 after
 synchronizing with hardware
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>, Shivansh Dhiman <shivansh.dhiman@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"

Set all fixed-1 bits in KVM's version of DR6 after synchronizing with
hardware to paper over as much of the virtualization hole as possible.
Because KVM dynamically disables DR interception, a guest can write any
DR6 bit that isn't fixed in bare metal, even if the bit is supposed to be
fixed from the guest's perspective.

In addition to providing some amount of consistency in KVM, this will allow
adding sanity checks that KVM never ends up with fixed-1 bits clear in its
version of DR6.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/regs.c | 2 +-
 arch/x86/kvm/regs.h | 1 +
 arch/x86/kvm/x86.c  | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/regs.c b/arch/x86/kvm/regs.c
index f74a29621661..db43ade8ceb1 100644
--- a/arch/x86/kvm/regs.c
+++ b/arch/x86/kvm/regs.c
@@ -772,7 +772,7 @@ void kvm_update_dr7(struct kvm_vcpu *vcpu)
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_update_dr7);
 
-static unsigned long kvm_get_dr6_fixed_1(struct kvm_vcpu *vcpu)
+unsigned long kvm_get_dr6_fixed_1(struct kvm_vcpu *vcpu)
 {
 	unsigned long fixed = DR6_FIXED_1;
 
diff --git a/arch/x86/kvm/regs.h b/arch/x86/kvm/regs.h
index 447f0ec3e63e..3ca5cd8a8d95 100644
--- a/arch/x86/kvm/regs.h
+++ b/arch/x86/kvm/regs.h
@@ -62,6 +62,7 @@ int kvm_set_cr4(struct kvm_vcpu *vcpu, unsigned long cr4);
 int kvm_set_cr8(struct kvm_vcpu *vcpu, unsigned long cr8);
 int kvm_set_dr(struct kvm_vcpu *vcpu, int dr, unsigned long val);
 unsigned long kvm_get_dr(struct kvm_vcpu *vcpu, int dr);
+unsigned long kvm_get_dr6_fixed_1(struct kvm_vcpu *vcpu);
 unsigned long kvm_get_cr8(struct kvm_vcpu *vcpu);
 void kvm_lmsw(struct kvm_vcpu *vcpu, unsigned long msw);
 int load_pdptrs(struct kvm_vcpu *vcpu, unsigned long cr3);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index ea1406c3b260..99518e3265b4 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8417,6 +8417,7 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
 		WARN_ON(vcpu->arch.switch_db_regs & KVM_DEBUGREG_AUTO_SWITCH);
 		kvm_x86_call(sync_dirty_debug_regs)(vcpu);
 		kvm_update_dr0123(vcpu);
+		vcpu->arch.dr6 |= kvm_get_dr6_fixed_1(vcpu);
 		kvm_update_dr7(vcpu);
 	}
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

