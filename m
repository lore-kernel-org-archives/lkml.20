Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792986273;
	b=luMM9WrlioMJJiJIEkFC4LccUwT01VZntjtRInH/CuOYoAEo+mqijz1ne5MplSAfNSYZ
	 K9vFLx4vp2r4PA7yMR9RFJOctTxZk+5W9977pluJmE7aAuD1dCIpxQkfX6ZHeY6xY+iaJ
	 B5S70IVA6v3tuXzxgyd8q/c2Dxe//kxlXLPsCxKzTdNMFnj6bYbCrkR055Ewf8QYSdIS4
	 oz7TR5K4d//W4sgwo9s4lzkvP9FhIgOZ+LhjX9eYAq7VSsq5mb5o7VV8HmUw5ZAndIuFg
	 7NcRWirQK6Iq9sOZVaytUpn+YMgInq2SGQS97Holzleld2stRPAv/5+RXrwT/TpwOeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792986273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=epO44nguKeOQQCjQUMlL4Yq07v1OlIx6nj2eYc7j0sg=;
	b=SaCZ4UczlymzNld4P1fYAEiS/CoXpzN1uvKYvfwZ/eJocgKHGVvW5pwkbEU6UPoT5Ilm
	 HMlZzli9Fgib3y+HPfglxkHyiiE8m7DuGbcqxDThIj7mFEvsot/DGhfkhZq0M2A8LQIR8
	 WS8VfcoBKg41PG1YyymYjamDdBmCyDi2qf7B6KrVvrcgTDk6oHynNpo5sz1uc+WXcV6kI
	 G69Oe9cLOmP/j6RbdEU4QnR2dEQVj5ECgpmn5dmbhR0YwBq4Z3PByjrrC6dRaDECLCBPy
	 4HN4Xi6v1+0qqaAZfzm5+Oksi4WsCxdTZYdK8Gox5iTwquEwLUk15C6yQ6q0T6nj+lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pARMttdt;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41649606A321
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41649606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pARMttdt
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5367cc15121so37037361cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792986272; x=1793591072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=epO44nguKeOQQCjQUMlL4Yq07v1OlIx6nj2eYc7j0sg=;
        b=pARMttdt5sIHUR6snNn2w+A8GAyfTtIb+GNhfxyv9r2teQJoncLOOzbyLmIelYfiVF
         1qEDkiXunBGuxl3tJ7D5/ZfDRbWSi/N9Yj1IGFHKPaThtmpsZjzAMZFXEEc7co7PHaGY
         pZX/d00f7g79OOOltSthIDkHQyUM8DxSaOC5mlrPgNa/lMnUCIF6s/OELJloKQHOod52
         xyzg0SKCdw07T1XBvDIgzvOS6jLkQHy0lTpWuSCTuKT8/8CDSfVX+bpujjd3T9mFmSwu
         UJ41d/HqW5aMYQGHEotLhY6aqx5OaWIkUlFAHnyUfguFdAjIXGJ8I9Xb9ZwK4hQLpX9I
         cs8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792986272; x=1793591072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=epO44nguKeOQQCjQUMlL4Yq07v1OlIx6nj2eYc7j0sg=;
        b=rcuwiXCg0IkxFtnK/dyYHsVmvmjUrOtHP1suPo9t9htLFNZ4uBjylr/YFwNliRVDjF
         o8O9joxLOQ6znT8bu1BSHFhQGu26Sa8WbLOmY2bRps9gdQGtmXonHsyaClc7T5rfpDOM
         VTpF6qfF3JwCiH5VwBklGCsekfxsxH6mQbvtaH6il0/gRUP+CxIZPjcgr6s8wckOTa55
         Y+FaqDwmGVuJ0fzZCJikA/v0pW4d056Z+buhwA+qoeu8+ipQLLsvirMgnvjBE2E4S4qM
         A/yDC8JJM8hPdwm+pCWx3Ln/kXwQ0MLE1yjdpRAu0zvstOHtKkmm0zIP3fImRF86sIHq
         3K+Q==
X-Forwarded-Encrypted: i=1; AKwUvBypi5IexioutuFuiIhGvYpjdKLcC86T8/uPlM2SxeSLjMISBKjvzQGFl037c4S6l1b7STc1GSe77UOGEmg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFiLMQvEQieV1ZOMvfmXtXgrDqp55zhS+e1Pg28r4LQ7aaH6yP
	PKmIkvaEcBgM2TrFMPC5ilR2JIiC8aT2fYjCFcqUoc6UCSetEZoqWFOi
X-Gm-Gg: AYBFou2uF/NBr/sWEjVAD0KEhVOFwWYdV1f5d/lFWjUYQJMwMpZdeqH421hJZcdXXbj
	LtxhI5GCpvVhwzHv4XtfaWf3DcPAn6KrD7rdDEtwwWEtownY47YK7YZP81BYPMiNAzU+eV8oa9v
	09gg14ewOrXu09jx3LX9lAOcHIwQ0G4MnoTY81gwzWmjmPfF0A/KjN2Syfyhv+BU7NEH6QMinDw
	hs2QTngQN/pfTjzLlN1AJrUWaolzuXSYWOCXtPjBRDe4qkgQr3bXb8qWicfLPYDMAcynHOoWYBV
	2o/395K9dScXxW4ZGbnu2cke/4n3gTqs4+h4HcANkK+VO+O2hDB7i8zDHn+MVq6gIfiLLiuGx/s
	hvSDEciVXtGb8l65Zg6AenylS2Tpy3y4t907jluPkznCw0YlMvMGbBW0nie6PVMbw4nFe3VuySt
	Sf3IEP2/kRE4vrLPyTGHOZspD2wi8XTk12PptwIh5d/cTG2dne+z/UbmzuDcpQfE8b8Hu+WTgRy
	TETKWFHpIRr8g409k3ZYAMQibjTfHjjOpi4oX77sLg4eqx+iiNm4RoAOv+Ghtkz1161Lwc1XBfT
	cEREuvtX88UOy77NpGIcQa+s3YUv82VTK3hn5ypAWqbJfKnttPqmR5P4tcVW5ClVdhCJwqTyUt2
	+S2qb3A==
X-Received: by 2002:a05:622a:64f:b0:535:13c1:ce94 with SMTP id d75a77b69052e-5383b5d830emr85091791cf.38.1792986272132;
        Sun, 25 Oct 2026 20:44:32 -0700 (PDT)
Received: from paul-white-HP-Pavilion-Laptop-15-cs1xxx.mynetworksettings.com ([2600:4040:ad65:1c00:4cc4:d0be:4ab6:9a0b])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-538394c5273sm46202121cf.9.2026.10.25.20.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:44:31 -0700 (PDT)
From: Paul White <paul.white.kernel@gmail.com>
To: anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Paul White <paul.white.kernel@gmail.com>
Subject: [PATCH 1/2] KVM: riscv: Eliminate redundancy in get_reg function via pointers
Date: Sun, 25 Oct 2026 23:41:26 -0400
Message-ID: <f7fcf15c1117ce734247cf951c0afff1f5eb54c8.1792982932.git.paul.white.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1792982932.git.paul.white.kernel@gmail.com>
References: <cover.1792982932.git.paul.white.kernel@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The original code is essentially asking: for each possible floating
point mode, ask if reg_num is a status control register or a data
register. It is redundant to ask those same questions for every
possible floating point mode case.

In order to only ask the "status control register or data register"
question once, the variables in the status control if statement and
the data register if statement that would be different depending on
the type of floating point mode (for example,
KVM_REG_RISCV_FP_F_REG(fcsr) would be KVM_REG_RISCV_FP_D_REG(fcsr) if
the floating point mode was double) were made local variables of the
entire function so that once the cpu passes the if statement inquiring
whether it is double point mode or single point mode, all the
variables that change depending on the type in the status control if
statements and data register if statements will be set to the
appropriate values they should be when in that mode before/when it
enters the status control and data register if statements, allowing me
to only have to ask those questions once and creating a dynamic code
that changes based on the information. This results in a "asking the
type then asking status control or data register question once"
structure rather than a type-questions, type-questions redundant
structure like before.

This results in faster cpu execution because despite the longer lines
of code the cpu has to make less decisions, which saves time in case,
due to its tendency to make assumptions about what an if statement will
evaluate to, it has to backpedal because it realized it needed to go
down a different if statement/path. Finding an address via my
bare-metal approach is also faster than looking up an object properties
and then an array. It is also more maintainable in the future. If the
original code needed to be changed, you would have to remember to do
the same thing to both type blocks whereas mine would just require a
change in the beginning if statements. If a new floating point mode was
added you have to ask those same questions all over again, which may
make the code longer in the long run.

I also renamed reg_num to token_reg_num in my code as I felt it made
it clearer that it was the register number the application wants and
requested in a token. It differentiated it from the many other
variables with the word reg in it.

Signed-off-by: Paul White <paul.white.kernel@gmail.com>
---
 arch/riscv/kvm/vcpu_fp.c | 70 +++++++++++++++++++++++-----------------
 1 file changed, 41 insertions(+), 29 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_fp.c b/arch/riscv/kvm/vcpu_fp.c
index bb11e6757d34..16999a5c45de 100644
--- a/arch/riscv/kvm/vcpu_fp.c
+++ b/arch/riscv/kvm/vcpu_fp.c
@@ -83,41 +83,53 @@ int kvm_riscv_vcpu_get_reg_fp(struct kvm_vcpu *vcpu,
 	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
 	unsigned long __user *uaddr =
 			(unsigned long __user *)(unsigned long)reg->addr;
-	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+	unsigned long token_reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
 					    KVM_REG_SIZE_MASK |
 					    rtype);
 	void *reg_val;
 
+	u32 *fcsr_addr;
+	void *f_array_addr;
+	size_t byte_offset = 0;
+	unsigned long offical_fcsr_num = 0;
+	unsigned long offical_first_reg = 0;
+	unsigned long offical_last_reg = 0;
+
 	if ((rtype == KVM_REG_RISCV_FP_F) &&
 	    riscv_isa_extension_available(vcpu->arch.isa, F)) {
+		fcsr_addr = &cntx->fp.f.fcsr;
+		f_array_addr = &cntx->fp.f.f;
+		byte_offset = 4;
+		offical_fcsr_num = KVM_REG_RISCV_FP_F_REG(fcsr);
+		offical_first_reg = KVM_REG_RISCV_FP_F_REG(f[0]);
+		offical_last_reg = KVM_REG_RISCV_FP_F_REG(f[31]);
+	} else if  ((rtype == KVM_REG_RISCV_FP_D) &&
+			   riscv_isa_extension_available(vcpu->arch.isa, D)) {
+		fcsr_addr = &cntx->fp.d.fcsr;
+		f_array_addr = &cntx->fp.d.f;
+		byte_offset = 8;
+		offical_fcsr_num = KVM_REG_RISCV_FP_D_REG(fcsr);
+		offical_first_reg = KVM_REG_RISCV_FP_D_REG(f[0]);
+		offical_last_reg = KVM_REG_RISCV_FP_D_REG(f[31]);
+	} else {
+		return -ENOENT;
+	}
+
+	if (token_reg_num == offical_fcsr_num) {
 		if (KVM_REG_SIZE(reg->id) != sizeof(u32))
 			return -EINVAL;
-		if (reg_num == KVM_REG_RISCV_FP_F_REG(fcsr))
-			reg_val = &cntx->fp.f.fcsr;
-		else if ((KVM_REG_RISCV_FP_F_REG(f[0]) <= reg_num) &&
-			  reg_num <= KVM_REG_RISCV_FP_F_REG(f[31])) {
-			reg_num = array_index_nospec(reg_num,
-					ARRAY_SIZE(cntx->fp.f.f));
-			reg_val = &cntx->fp.f.f[reg_num];
-		} else
-			return -ENOENT;
-	} else if ((rtype == KVM_REG_RISCV_FP_D) &&
-		   riscv_isa_extension_available(vcpu->arch.isa, D)) {
-		if (reg_num == KVM_REG_RISCV_FP_D_REG(fcsr)) {
-			if (KVM_REG_SIZE(reg->id) != sizeof(u32))
-				return -EINVAL;
-			reg_val = &cntx->fp.d.fcsr;
-		} else if ((KVM_REG_RISCV_FP_D_REG(f[0]) <= reg_num) &&
-			   reg_num <= KVM_REG_RISCV_FP_D_REG(f[31])) {
-			if (KVM_REG_SIZE(reg->id) != sizeof(u64))
-				return -EINVAL;
-			reg_num = array_index_nospec(reg_num,
-					ARRAY_SIZE(cntx->fp.d.f));
-			reg_val = &cntx->fp.d.f[reg_num];
-		} else
-			return -ENOENT;
-	} else
+		reg_val = fcsr_addr;
+	} else if ((offical_first_reg <= token_reg_num) && (token_reg_num <= offical_last_reg)) {
+		if ((KVM_REG_SIZE(reg->id) != sizeof(u32)) &&
+		    (KVM_REG_SIZE(reg->id) != sizeof(u64))) {
+			return -EINVAL;
+		}
+		token_reg_num = array_index_nospec(token_reg_num,
+						   32);
+		reg_val = (u8 *)f_array_addr + (token_reg_num * byte_offset);
+	} else {
 		return -ENOENT;
+	}
 
 	if (copy_to_user(uaddr, reg_val, KVM_REG_SIZE(reg->id)))
 		return -EFAULT;
@@ -144,9 +156,9 @@ int kvm_riscv_vcpu_set_reg_fp(struct kvm_vcpu *vcpu,
 		if (reg_num == KVM_REG_RISCV_FP_F_REG(fcsr))
 			reg_val = &cntx->fp.f.fcsr;
 		else if ((KVM_REG_RISCV_FP_F_REG(f[0]) <= reg_num) &&
-			  reg_num <= KVM_REG_RISCV_FP_F_REG(f[31])) {
+			 reg_num <= KVM_REG_RISCV_FP_F_REG(f[31])) {
 			reg_num = array_index_nospec(reg_num,
-					ARRAY_SIZE(cntx->fp.f.f));
+						     ARRAY_SIZE(cntx->fp.f.f));
 			reg_val = &cntx->fp.f.f[reg_num];
 		} else
 			return -ENOENT;
@@ -161,7 +173,7 @@ int kvm_riscv_vcpu_set_reg_fp(struct kvm_vcpu *vcpu,
 			if (KVM_REG_SIZE(reg->id) != sizeof(u64))
 				return -EINVAL;
 			reg_num = array_index_nospec(reg_num,
-					ARRAY_SIZE(cntx->fp.d.f));
+						     ARRAY_SIZE(cntx->fp.d.f));
 			reg_val = &cntx->fp.d.f[reg_num];
 		} else
 			return -ENOENT;
-- 
2.53.0

