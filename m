Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792702908;
	b=bijl6apfPfsJWHHLM3iTeEeWvqZ0X3vmwXhAj6mY8WxcUZ/kWxnfzBlEHp7DLFP3DaiS
	 ifsd7PXTL08sHTxedCTjuwvwkbQCaN32VDqV6kDMJsnkDFWJ5luiGwgshP3V9zF7vv8h8
	 oRt3kKADJ6N1HDd+nh32oNJbXgPz68kwraHc7S68hX38ILAnm2dI0b+iUV1xLPIL4Qhdx
	 UpYEW899LV559jUF5oHnSZ9sfci6dk9r+FVBrw7+7H8o0WjPc5YdJQEq6Nq20MnvQe0XR
	 4WCQLZc3+W6zP3c2vDpQOIK2avqWejMulv1NCHzt+ZWU1LTXaA2Kuc/J9zLgAlcNmkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792702908;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=Oq8LnbfxGj58+AMKrtsZJUVrBg8Ev8BIHd1Au12gnbE=;
	b=yfgpkR9khFrJj3zXTk6l0vUDV7xABa8auOW8YPyLeHG1piawik5j5/xG2fnhwkZyWx0k
	 Fj2HnBsSL+JRb+iO+036XMKqq2NXIcOLKiz0/rI7NtVbIEAXxyRjbdoDu53FhzCsdL2Pt
	 CgGC4AiBr7fT7h14FaOCUixWp0ZqlC16EtaES87TLVh6+2LGazY9iIzzyuU1m07ZlZoLN
	 plBomlHI/B4BD36rU4TXHkUYPu5ewfCCVygC/KCMnSnyQ4QSoul0riSgsAN9fQz8fSwcn
	 HigKkAUuBMo6qv6HOKp8wR27KNeYxBn9miMLdPMIkSg2T8ozz4y/dHV+4CQc3GdERqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=BIEcK2ED;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76570606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76570606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=BIEcK2ED
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad7030e886so277463a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792702903; x=1793307703; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Oq8LnbfxGj58+AMKrtsZJUVrBg8Ev8BIHd1Au12gnbE=;
        b=BIEcK2ED6hblV0C/s/+ok0EL/hnreWtMuQk7iF2jyhyu2HBGTE6whWsWahqEZDeBFY
         T7ysN55y1iheD4x0bPF3RNSzTaC+52+NFUiT+Eudg3HVQG38QF9hcDxRE9Ytx+4E2Lrk
         0oter0Qzhcb/7r1wIAuuI4BSUz1D+GBpJ9U1lPMFVguu2PyBwL5TFlDUCyBBH00EF8J3
         4CMz8RHQUxvYYQ4CkZ5r8vNyCfCuAIyUlT2nFj8E73RmSspiznDhQ1UkC8eC5D1oOKSJ
         n0CyySyIlOCPkdBzVEUcZYDpLJ4jQRkxWOO2uDctWy6k/am82H1IaHo8yaROXvWOlQXj
         ZlKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792702903; x=1793307703;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Oq8LnbfxGj58+AMKrtsZJUVrBg8Ev8BIHd1Au12gnbE=;
        b=M5GqESLUxzK/3DgYZQh4R8cqvbe4ljEX7fvveyy4hims60JJSYWpXLysFEPgtbLonV
         rl6QDPhDQyxNfcI1T6trRH6JJmSTniSmlP/6LXpjtSIINoUFK5dVQxcrlQ+B4CkmbzD9
         DrZrDzUPX/foh3P3PpEX9fxtBQAp7Ay2jZRW7QRc7IgIRO8DTzpg35allfnNorI1DEi0
         2wHibxPBbEK+0bglb2evuHBUFxDC5hKnkvhkjGG9WzwvVs6vx73RsnE6QGUwn7NUZNhp
         WudnDEzHLX/jLFmBHkmsqVgwtQPO6T0m9BlRt3VjvLCobLJtAaH9Dl87g6IVQ4DyOdTr
         yHBw==
X-Forwarded-Encrypted: i=1; AKwUvBxCcMiv1vVewJuiBcidZlp4qNr8hPq5vtMKrS9CaoksSlkDTgpPjPcbaWDL6oOUcESpw1l9ptlUm1ZRMY8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIf7FTc7ZvDQ6ebDwuYydX9Tikjn5s2ihENuxa5HV+PLfS5YE54
	qsFl4A1kRbX1ahwywnxynq0AQTrcEdb4HF6ajuviR9GLFYIjF3VoLuv/l/5yPfMO18FH/L2EWZr
	NzLa/qw==
X-Received: from pgca6-n1.prod.google.com ([2002:a05:6a02:6386:10b0:cd6:9a71:5dac])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d40c:b0:3ac:c024:b275
 with SMTP id 98e67ed59e1d1-3adcddb7bb6mr137328a91.9.1792702902649; Thu, 22
 Oct 2026 14:01:42 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 Oct 2026 14:01:33 -0700
In-Reply-To: <20261022210134.612848-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022210134.612848-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022210134.612848-3-seanjc@google.com>
Subject: [PATCH v2 2/3] KVM: TDX: Set SIGNIFCANT_INDEX flag as appropriate
 when filling CPUID entries
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, Binbin Wu <binbin.wu@linux.intel.com>, 
	Changyuan Lyu <changyuanl@google.com>, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Changyuan Lyu <changyuanl@google.com>

Set the KVM_CPUID_FLAG_SIGNIFCANT_INDEX flag in the kvm_cpuid_entry2
structures returned by KVM_TDX_CAPABILITIES if the CPUID is indexed,
otherwise KVM could confuse userspace and induce a configuration error.
This also ensures consistency with the CPUID entries returned by
KVM_GET_SUPPORTED_CPUID.

WARN if KVM and the TDX Module don't align on which functions have
significant indices, e.g. to help ensure the kernel is updated when the
TDX Module learns about new CPUID leaves, and vice versa.

Opportunistically add a comment to call out that zeroing the index when it
isn't significant is ABI that userspace relies on, e.g. QEMU looks for '0'
instead of checking KVM_CPUID_FLAG_SIGNIFCANT_INDEX.

Fixes: 61bb28279623 ("KVM: TDX: Get system-wide info about TDX module on initialization")
Cc: stable@vger.kernel.org
Cc: Binbin Wu <binbin.wu@linux.intel.com>
Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
[sean: keep the WARN, don't key off KVM_TDX_CPUID_NO_SUBLEAF, add comment]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 271c2f94b8dd..37d088f6f7a8 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2,6 +2,7 @@
 #include <linux/cleanup.h>
 #include <linux/cpu.h>
 #include <asm/cpufeature.h>
+#include <asm/cpuid/api.h>
 #include <asm/fpu/xcr.h>
 #include <linux/misc_cgroup.h>
 #include <linux/mmu_context.h>
@@ -163,12 +164,23 @@ static void td_init_cpuid_entry2(struct kvm_cpuid_entry2 *entry, unsigned char i
 
 	entry->function = (u32)td_conf->cpuid_config_leaves[idx];
 	entry->index = td_conf->cpuid_config_leaves[idx] >> 32;
+	entry->flags = 0;
 	entry->eax = (u32)td_conf->cpuid_config_values[idx][0];
 	entry->ebx = td_conf->cpuid_config_values[idx][0] >> 32;
 	entry->ecx = (u32)td_conf->cpuid_config_values[idx][1];
 	entry->edx = td_conf->cpuid_config_values[idx][1] >> 32;
 
-	if (entry->index == KVM_TDX_CPUID_NO_SUBLEAF)
+	WARN_ON_ONCE(cpuid_function_is_indexed(entry->function) !=
+		     (entry->index != KVM_TDX_CPUID_NO_SUBLEAF));
+
+	/*
+	 * Explicitly zero the index when it's not significant, even though it
+	 * _should_ be meaningless.  Userspace relies on the index being zero
+	 * (the ABI was inherited from KVM_GET_SUPPORTED_CPUID).
+	 */
+	if (cpuid_function_is_indexed(entry->function))
+		entry->flags |= KVM_CPUID_FLAG_SIGNIFCANT_INDEX;
+	else
 		entry->index = 0;
 
 	/*
-- 
2.56.0.257.gf7497c7d27-goog

