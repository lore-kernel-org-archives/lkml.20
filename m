Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4503AAF41
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787764398; cv=none; b=AHp9mkiM9Mdt/yFJ5EmBxRH8r76NLt+NIvYcgWV14zRsjlX272JNh8j2hWVizODFZGq3IqCeaWsC9Q7kgjl8bEVei6I7TKVsBEqdomYpgiNaE4p0+zPApZizSoLr/y0MinJjnodNrrMdH3uff/UaZH7j7SbHwUJs1uRfP9X7OEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787764398; c=relaxed/simple;
	bh=ETYszkt+PpDnzyBQpct9QDXpj2i+G42vlOEci4TgHog=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tR7PFJi5H7u6n1NjUkGT0F7kzVeQ9375N6wF+/X4Pbp6d1XCfWO0DUCFaFR1KIvMQzZmbxcwKDT2gtJzaS8/LE36Pdw8f88I4rjUTsAMMN4qAL0+H8cdwxfskaroxSJ/UWp6qTOgiGFhdtoS2t70/nLGS7RnNjzEOCqnyjwq6Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qiEJrrzj; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qiEJrrzj"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84859a64079so1495567b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787764383; x=1788369183; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IvVQPd56KlHv5ygDzHuD2XaX2Xb0ULf5ZrzcKWCrS+0=;
        b=qiEJrrzj7giOEAQHh4YK38G6DixPccjNYBIZ9MjWvskSU8Gd0WdemrxnHS+7m334eL
         x/ZLXxsvFqtkhuhVMwikGdOQ7oa7DlF3NrKolzV7CFBttYQB/kTpRoyFCO+TzwQJ0B62
         bXiohEhsVVl01c6nkVBflPgTWv/+I7ZQk3pf1LlmuVt3zoM9/vICrph6a0QBdTaeO26L
         nqANtPiboJvq8gJgpPrc8IKql/5SyJS1N4wgKCAnCOdbr0i43sGM6qaWbDf7ugqs4r3I
         yP2PbHTpBaJIr5FYJvimrVapUN5o5PBlW+cIWU0NnjKfHF1LqbrzHO1mwDjGnh3JJMmO
         MJuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787764383; x=1788369183;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IvVQPd56KlHv5ygDzHuD2XaX2Xb0ULf5ZrzcKWCrS+0=;
        b=Rv0Fb6970x+Zvbm4Uwz0l5XXuVXHQMpFwMxHAdU+l6CYAPbS7lMC3MhYN9WjED2YQv
         Xy1Fda1s+po0lOwKrgecgPyrKSne04zpjExQ/XYLjdYtadlUKsyFp7ByNFwsWNO0Jvbz
         Xcx/XnRtmZtoyjg0xNaMrfTcrnTWAsI0xCoesdu4PcIbGUSspYcTEwvcf+n8nMHCVGL4
         uE5CslzpIB8t5q2dkw1ZmzX9HWVml+T2t/KZuFqa6gId8OBHLRDIEzPmijYu+pP0r3iw
         +X4X13AGU3mSTKJeQ9CbghQ7biT8bI7DItoSaqHVz3Awy7eZAj69Gy5JesQKVTX80kSu
         TUlg==
X-Forwarded-Encrypted: i=1; AHgh+RrrqJiid4Yxmm3K2Sakq/G7dkhyT66w3qYYkfmGA5XYmIB5riVv1+QDCNIs+VfcXUUG8v71k0rkhArAOv0=@vger.kernel.org
X-Gm-Message-State: AFuF++kyvXjBmW29nvFgxyJJhnY/OWI4QLn4EJ5VfELvQh/27QF+Tscn
	4Yf/+RRp7XeiaUgnTQsWfh1WhMLsUxRt/bzlkSpI9iM9JjqXEYELkQe9jmq7SMutNiC21Q3PUOq
	+1DLW8w==
X-Received: from pgcp11.prod.google.com ([2002:a63:740b:0:b0:cbe:9dc7:9eec])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:21d2:b0:851:c1ba:7aa6
 with SMTP id d2e1a72fcca58-85373eb1adcmr14442590b3a.11.1787764382313; Wed, 26
 Aug 2026 10:13:02 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 10:12:43 -0700
In-Reply-To: <20260826171246.777729-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826171246.777729-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826171246.777729-6-seanjc@google.com>
Subject: [PATCH v2 5/8] KVM: VMX: Rename EPT violation handler prefix from
 "vmx" to "vt"
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Kai Huang <kai.huang@intel.com>, 
	Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="UTF-8"

Rename __vmx_handle_ept_violation() to __vt_handle_ept_violation to capture
that it is shared between VMX and TDX.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/common.h | 4 ++--
 arch/x86/kvm/vmx/tdx.c    | 2 +-
 arch/x86/kvm/vmx/vmx.c    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/vmx/common.h b/arch/x86/kvm/vmx/common.h
index ff4f6a2b6402..35b54938a5f5 100644
--- a/arch/x86/kvm/vmx/common.h
+++ b/arch/x86/kvm/vmx/common.h
@@ -86,8 +86,8 @@ static inline bool vt_is_tdx_private_gpa(struct kvm *kvm, gpa_t gpa)
 	return !kvm_is_addr_direct(kvm, gpa);
 }
 
-static inline int __vmx_handle_ept_violation(struct kvm_vcpu *vcpu, gpa_t gpa,
-					     unsigned long exit_qualification)
+static inline int __vt_handle_ept_violation(struct kvm_vcpu *vcpu, gpa_t gpa,
+					    unsigned long exit_qualification)
 {
 	u64 error_code;
 
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 36578d4c00ff..a3d6f0fb5951 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1987,7 +1987,7 @@ static int tdx_handle_ept_violation(struct kvm_vcpu *vcpu)
 	while (1) {
 		struct kvm_memory_slot *slot;
 
-		ret = __vmx_handle_ept_violation(vcpu, gpa, exit_qual);
+		ret = __vt_handle_ept_violation(vcpu, gpa, exit_qual);
 
 		if (ret != RET_PF_RETRY || !local_retry)
 			break;
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 506be74e3e0f..2532a9b8e92e 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -5991,7 +5991,7 @@ static int handle_ept_violation(struct kvm_vcpu *vcpu)
 	if (unlikely(allow_smaller_maxphyaddr && !kvm_vcpu_is_legal_gpa(vcpu, gpa)))
 		return kvm_emulate_instruction(vcpu, 0);
 
-	return __vmx_handle_ept_violation(vcpu, gpa, exit_qualification);
+	return __vt_handle_ept_violation(vcpu, gpa, exit_qualification);
 }
 
 static int handle_ept_misconfig(struct kvm_vcpu *vcpu)
-- 
2.55.0.887.g758fc8c411-goog

