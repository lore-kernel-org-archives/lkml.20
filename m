Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794442126;
	b=YSIKo/2/0+4NdwSzq52ThyUqpp6hLHnfJ3IrYFw2lMhDHrRNsyJNU0xjE7YClj6wXY6I
	 kjCCC9ErPJeyT73RlwAJtr6RQwP2IHAtcH4TjGQtzSPrCCKg99DohApgpJPCsleAzzFjp
	 +n9WyTOWsGs8TmRVstnlOGquIQliD50eMowo+FDPHbYP+gWtT+neHbHdvn7bFRk1GurJf
	 bY1S94NJ9cUNvDj7CQ9bZoTnTzjNere8pfC1iujtXzXnmp7rvYObiteyz7evEwcxkGlfr
	 dB17640khPvZPMU3UIaEx96MLyGJzsLnYypbsetRl/b4USH6npR5WDQgJ6Wnzjc1zHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=deHK5iaGQ16uFonBvAPJyDuQf3J5jqXGDNfUZjZLMXo=;
	b=oru0SxmKrGFAchwAiPWrr2EIioBVNKqP/8fokigMbWu4tVbV4qhduZl1FxyJaLdnoND8
	 bTiLyvVGAG6m4Sanas4NCdQFoj5meNN6kaQXHHTLPQiEcFMmS6tQTd7RZmVqpWCatBnl9
	 Su5K4i2/P3xfyeEeY4EIJJGbrr7wSH66E74BCm2oiBf7cKUGS5rN3rYM5W+fdoDCpItJr
	 U+3KqmWY5ofEidBYAyNnayIvMDTJBs5G8FZIDNEHghXTkxlUi2i1UZv/Hdg2bmdWFu1Hu
	 ButIIx2/R1MkzQrcu0WYFE8Vk6W9yntgdz9ZKDOL8O3ZVzeY/q4lZu+mghZeCg8kbCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VIdsIopc;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF29606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEF29606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VIdsIopc
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-567ac848d83so4395356b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794442125; x=1795046925; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=deHK5iaGQ16uFonBvAPJyDuQf3J5jqXGDNfUZjZLMXo=;
        b=VIdsIopceTRxZSn5lZP/j7PhHpzTe5M7Wj3xajq6FrRjrQhFwByIu7oyAPblgJXHmV
         jNph+KDfNbafA7m4DOZsUkJsw5V2y4t03jgGzrEBQwtCAM2hSr1muHhcCLV+lAqS/F8U
         5h1XTpIzZSxAb3/5H1W3oK2a5hGt4bUmmg8VSy0Tl8XLH9ANiMHWXrsqzrgfmisb1ks8
         VC/bH7pSc5zGnzrWSkOSio+Rase2Sd77psbglQzCrj319djV+/96y9Du36EtzIvlKbt4
         95MEorimc8ru4A6R6ypWgO9WhFEISl8OX1Sd4yNnzrYiquvmv0GHRs2831U8uDLL/PTI
         ZUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794442125; x=1795046925;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=deHK5iaGQ16uFonBvAPJyDuQf3J5jqXGDNfUZjZLMXo=;
        b=nZjscmFCHafMcT27QspyU6gGDASnbMSR63APD3gRx/QCLI+dXOMebjIBfs6MliUIJg
         vmTOzRpG0shsju0Y+qRB0zc3PDSL6Ezc0GUfS9eqLxQ0v1G165lMCApTwFgCQkHAYXeW
         9yFelhHYyXvPx3hiZ5WYlnKrzCgJhKPgspi9CwXoJWy7wEHHRdJpaeP/5QgyUTFjzKnM
         wWUyUKgaetiDgqj3UoAGCATFz/SIHF4UplHwiNLqDMUlY/ijxDEMx9Q6zt9wLJ9sXGfj
         eyVD2Qd55htzfUAa0vLRsCbQbbSziCefYd/BcsBzVLIiQlpCGWF7x3oRtWSKct9rhBz7
         gWUQ==
X-Forwarded-Encrypted: i=1; AL+hErFUxqsucpd4jszLnrBoGbsfz2WcMD8yyQ/CqsaiGGzVR1KjwSiscgEXnYIpQMij9Qevz+4fgGB0AaaJaCY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HkTxj2A18bm796dMe+nr1HI7IWz9LM80b8ZEeD65jB3YzOlLe
	fgJkkLWqdAQD1jcVDSmetXUNORxxeVPfpFC6VX82qslTjVqhLy0SMqG4H0zfUYqHUPOZI+Ufe3M
	XCWS7QKTw8R8xLg==
X-Received: from ilbdw15-n1.prod.google.com ([2002:a05:6e02:410f:10b0:51a:346:d73b])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:c168:b0:4d6:90f4:48b7 with SMTP id 5614622812f47-56b986255cbmr3796223b6e.57.1794442124402;
 Wed, 11 Nov 2026 16:08:44 -0800 (PST)
Date: Wed, 11 Nov 2026 16:08:41 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261112000841.3013324-1-jmattson@google.com>
Subject: [PATCH v2] KVM: nSVM: Add missing CET VMRUN consistency checks
From: Jim Mattson <jmattson@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Yosry Ahmed <yosry@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

Per the APM, "Canonicalization and Consistency Checks,"

  [t]he following conditions are considered illegal state combinations:

   - CR4.CET=1 when CR0.WP=0
   - Any reserved bit set in S_CET
   - CR4.CET=1 and U_CET.SS=1 when EFLAGS.VM=1

Check these conditions in software before trying to VMRUN vmcb02, so that
the illegal states result in a #VMEXIT to L1 rather than an exit to
userspace with KVM_EXIT_FAIL_ENTRY.

Fixes: c5ba49458513 ("KVM: nSVM: Save/load CET Shadow Stack state to/from vmcb12/vmcb02")
Signed-off-by: Jim Mattson <jmattson@google.com>
---
v1 -> v2:
 - Warn and fail VMRUN if reading MSR_IA32_U_CET fails [Yosry]

v1: https://lore.kernel.org/all/20261110004037.125692-1-jmattson@google.com/

 arch/x86/kvm/svm/nested.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index af0ef678433d..6298160458bc 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -469,6 +469,21 @@ static bool nested_vmcb_check_save(struct kvm_vcpu *vcpu,
 	if (CC(!__kvm_is_valid_cr4(vcpu, save->cr4)))
 		return false;
 
+	if (CC((save->cr4 & X86_CR4_CET) && !(save->cr0 & X86_CR0_WP)))
+		return false;
+
+	if (guest_cpu_cap_has(vcpu, X86_FEATURE_SHSTK) &&
+	    CC(!kvm_is_valid_u_s_cet(vcpu, save->s_cet)))
+		return false;
+
+	if ((save->cr4 & X86_CR4_CET) && (save->rflags & X86_EFLAGS_VM)) {
+		u64 u_cet = 0;
+
+		if (WARN_ON_ONCE(__kvm_emulate_msr_read(vcpu, MSR_IA32_U_CET, &u_cet)) ||
+		    CC(u_cet & CET_SHSTK_EN))
+			return false;
+	}
+
 	if (CC(!kvm_valid_efer(vcpu, save->efer)))
 		return false;
 
-- 
2.56.0.567.gdb80ae8cd5-goog

