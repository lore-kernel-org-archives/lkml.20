Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794271243;
	b=dEBP4kv25OxRiI9o/ls+YnU6I+rQHjMjmf2DogQJShjAat13z6lY5DfcAWqHxFtJh3dN
	 R4VwIUnVtbd9uu3dgNl5Sd0ge4vmzHpYzgT7Pfg48DYEX3EBciJZDSsrXG+weB/fieaXJ
	 SKJdeXiHdAYpcgi5cSsiwheQk89OUwVx5YovkgLOQY0YrjWvje+ltdV7bjIAu3QxOBMjW
	 qiilvpimDA+CW/23cjMdx8QFivr5ZXNFc9G0cpD/fePUx0maCtTY/enKdiEnAF22jJwyV
	 rcdgxLcHbIj9txcQ0FdTAIO5ljslNlUAQzVcO7UpjJy9eHJimHnw8rlk/sIIwjuOcIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794271243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=g/b9kIVqE8FBGxMZo7/8K2qykpzXHnDK16SJKlo2ikg=;
	b=mDusR/+w8S4hXjtNbPXpTxuJCIUrN1qukJlXNEjOe1/KoAyFmXftbTOZgVvSzfwEwzoc
	 j/sxGf0CxgaM9rh1tTcRAZPj+soeNjOGr9T82tssIPh1YHNU0oZYi3Bcr7/ksxKOtQVV3
	 yWN9732x2CxdobkUgQTv2AkDcD/MaXj+zpyLdGr7a71A6s0gCxpjEbyXFtRqsceUKvbqe
	 HRV2igNqWVdkiRRF+6cgT1Ubgv/awmr7looz7obTM41IQcDxTYRxfFRf0bHZCO2NSXBgK
	 O29rIy+sovbKYoeLPa4DxdjMpn+xOttCbVcEcdcUNVlUxLN7hvW3rJELvcuIG3e6n3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=g7l9QrEE;
	arc=none smtp.remote-ip=209.85.160.69
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BECB606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BECB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=g7l9QrEE
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4adae323d5fso912290fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794271242; x=1794876042; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g/b9kIVqE8FBGxMZo7/8K2qykpzXHnDK16SJKlo2ikg=;
        b=g7l9QrEEEOXA/X3sgL7HtamjAHPgBfmncdUqwXN7KozQyY75iPoixThv5uD4v6/3OX
         UQRMbv9IkXHMPHDcBY2B08w9nJ/mcyfEiXR1fHCbtbcyu8E170bungSsMCT7/nIYxweX
         PTHSvZv2BKmGVX96m76rkzeRtjks4y7V3JTE+mlZCLUpeMd3qpsUhQusIgjd50tjmkFp
         w1GAxkdzDXhz8SmhZksNm8GMM9XlfM1rWZdbu5IvaVXzKLuCllAgorv9uwEWKLll/SjP
         o07vPPm54tQsN5pKUcWlyvVIf/QoKjlxP5q8wYJlCFxluMBJNSdLnON8ez6Z8G8TXDy6
         aahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794271242; x=1794876042;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g/b9kIVqE8FBGxMZo7/8K2qykpzXHnDK16SJKlo2ikg=;
        b=hAJBzuItbnynl8xEf/Y7BYskkEuDuUEKYHBkmHwRQ3RSLmQgnHZRupfL+mmitqmpbH
         CHeVHnyofyhJOt/l0S1JpLbh/zd6d1tf5MYgvqpst4p7aK8GYHvLPLG0Korg468f8UVc
         7UUjNm9AoXWEXaPBu8ad5iUEOB35K4qZg04IV7MwBwufOayzy0/1fP57rHhYHDcEttwQ
         KuHi4vgdRh0XruYD0oa2FkZVIAXkaAme6/udMDjmsHOE4tn0xEapGGnRUMEBtzLDSnSH
         im2a0iFjACswM/RetBbQLGAjcJZ6v9fd0o5N8X9hbZJXvEaY0MWJ5K0XWG9pYJPLTALb
         NtAw==
X-Forwarded-Encrypted: i=1; AL+hErHRIwD1ePFR5859ys2alGO54CW2Zn9i96xYyq9p4x3x0IrofSoQK065pGgQ1WZLm4B/j3Zod64ZTaf1Bew=@vger.kernel.org
X-Gm-Message-State: APuU4Z9t5ZetJ0ctn9EK8ov/G/gPEJhWHUpboDieJ0e/4HjWtk2OXxuU
	nZrCW5bBfbAuacjSO/aA3ebGr4ObiEjZcVPa+Hez6TszWRY9zGL2AmVWakOsyojsf3QpHModDDT
	0bVYd+TSfbTun3w==
X-Received: from iogk24-n2.prod.google.com ([2002:a05:6602:c498:20b0:9c7:b2b5:20af])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:250d:b0:567:cbf5:bb96 with SMTP id 5614622812f47-5683cac433dmr906887b6e.44.1794271241975;
 Mon, 09 Nov 2026 16:40:41 -0800 (PST)
Date: Mon,  9 Nov 2026 16:40:37 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
Message-ID: <20261110004037.125692-1-jmattson@google.com>
Subject: [PATCH] KVM: nSVM: Add missing CET VMRUN consistency checks
From: Jim Mattson <jmattson@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: John Allen <john.allen@amd.com>, Chao Gao <chao.gao@intel.com>, 
	Yosry Ahmed <yosry@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
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
 arch/x86/kvm/svm/nested.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index af0ef678433d..20ede403b62d 100644
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
+		if (!__kvm_emulate_msr_read(vcpu, MSR_IA32_U_CET, &u_cet) &&
+		    CC(u_cet & CET_SHSTK_EN))
+			return false;
+	}
+
 	if (CC(!kvm_valid_efer(vcpu, save->efer)))
 		return false;
 
-- 
2.56.0.506.g506a7eabc5-goog

