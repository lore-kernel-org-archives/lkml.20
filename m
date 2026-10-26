Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792986274;
	b=DtunUXGxBPYs6brbaJ9fpp3PY9CJ/y2oJ/d9TohUIZB137Dz3/5pkaGaAe6r9ROctAU7
	 /ourtcpz64o4zMMKIoTac8hB1/6jDC0NWdYyX4PmMI76ZZ0Y9c487JYfBuSeO1VNTtPf/
	 10TrCKTbaG9E5zq45exthXi3+daxA9PL18QUySu3V5/mypocP2iAlpfFgPfJiJf03H6D+
	 2l1u9F8q4y+Jt47LyWY8HXidyx6SXo5z/MV6UryeBtEbAIER3N1sA3b6FmSWJfgJcqJo1
	 iz/bvl45AnGy0yOVbceB4/NGFrQMvvbg5vZIlY57Sa81I7jT0dKthrlJ2cgKhhmKYKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792986274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ODlqko/BPpmyU4h+oI7UAqT8yjWxPc3m1CLwqWBtjDo=;
	b=WCTvvcqXaFnMwyRJ8ZROzAE/us2Eie0fCCUS9By7FtjWevRE0fmlDyPR3LOdV8ywaD9X
	 MgrD2LGxDVaBRwfSMcpyXqHygPKGaV6lpqJkSCgu9Fclz0237jEg5UEix0EyF6Qvts2XQ
	 +aMl6X2FkpsaP/mDIGfTbzzo6nweeCuEKiEHPDhDe+nDeLB0ltxJCseRaLi4QzdY/csCw
	 jB4Noh6Q5nZjfPttiW0kgCfb7UAl868jIptcyrCRMooAnMXzONss2zRHh9okuUy6xvvFr
	 1chviRRKxxq1c2Q8Pkh2d10662pCrW/3CkwAVXVE3GMPA6Gbbz1nCsTG330Ore6nwwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Z2T7bn1/";
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188A5606A335
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 188A5606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Z2T7bn1/
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5364042eecfso34363131cf.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792986273; x=1793591073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ODlqko/BPpmyU4h+oI7UAqT8yjWxPc3m1CLwqWBtjDo=;
        b=Z2T7bn1/dfBZJYPhK3YXmDRnVXvrXbXu++RBIHFoIfzV1O34CKgvTmiQg35fP5Ap9O
         0s9CCqQmA9ukR/SHXE96ya64JrmSs+pdkZoc7Xxg0UOP+AiB1WMT/8OAEs2T2JzeLFvQ
         RJlbvMTQG70g3OtxWYRBoNREGNJQMTlT4wonHXz+l5Fv38AHAmz3fa0lCHApC47isLMl
         G9dTfdFcH/QLI19JxixWwu3EMQbmZFYWBiPIPdT5sw/FEkxK8+WmQvKP2U1M6mBHhYAq
         0hE6AgeDg5iGSzKPRxCDDTLBxbp2PatAktvwtsaEwTzM472uimMgr9/f2bdOMc0LM3Jx
         C/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792986273; x=1793591073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ODlqko/BPpmyU4h+oI7UAqT8yjWxPc3m1CLwqWBtjDo=;
        b=vzX9l/WrQc5rdQ0qt4iuI+6fOCCk3G9Im0i7/zIySu2Cw+xSGyk66G2fenwVIbO/ZS
         JWiAvhLX5b1ZGoXugpFxAEsipsbt7rbtOLRrhuJycnfH0ErUN1z9nYLm36PIJ7/B7CYs
         0ZUKaDbszwhx/8wfprP5+0wn8Euga+sZ3BUA+qiGMhndGBtMszDuNzeLCYPk8YsbUcAN
         5ssDvcECmA/lGOWtBgJrQXmfD9OEpXZmTPOtSPaT8Hz7rJ3YVg5cgsXsABRsFrvBao1u
         4eCmAuWj0lxCfZnFEkTweXRaR/KijlUM0dNeyoak3eUtqSlq8VMVMGuEzpEtlCneypD+
         lF5A==
X-Forwarded-Encrypted: i=1; AKwUvBxxI82gr6zQUrjlQw2rxHPyJmZfaz9eyZPabmVjGUWe60H/X+qLUT505GuslqUyhBX+0HTGR4cA2N4LrJ0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJs2pqPogEYeJlYP7/X3lJsH+gn9a1VJPnX0NCwyx5G5gjLgXnp
	OK65g/BC2/N90CQTcxRBH0zNanULhzmRD3DIDD9neeiuEJc/rUAJne3v
X-Gm-Gg: AYBFou2Wc19L9luwnWMELavVL5vr+V/Mh4CSlSDQXTA9LeLJM4Em9DmQktU0nCBALsI
	uvKildOuOpkRd6KT72Gtz8ed3u32Go/CF3/yc/V/F0PQR/u1i4JVJ1Rzomk91kqEUZj8RYhFaw4
	QAbXEsj8iFtIiwiUhy5RDnCLm8UJWeax3o5xA611dfWinOvMGcQUHHuuvukhSywhJCntXuTdDof
	Zix2yKWkM3wa4jGTnXQVufZgliG7RePOi1dZ5EwqDZMwuUFkrWcIEuHUsHWy0Lpvew+pzf3yW7c
	IwUD+A5x/u3m1iuL1o4CWaM6tlgOefznLaP19S05RMV9zeFLg5BrxZ9Iy3SXhBFRMJW3IgUFU2e
	NFx821mkr1y5J5y6H0uJi23d0scOhSXXrnyrXg9z56A156gp5ALagEcEKva96gNUW0gDuWkCVtg
	iVro2/w7cVEsrLdD+IQOJ0JezI+Oa54INrymST+Yen1tQ20W21+jRvWiQT/H1i9rDYk2NZpIRyr
	BxJbsXPKZGRqogfmjlKzn8EDn6AlEohLGIqkT9Q1qLo6JWs8H8DFdI/lBiLKGH81bsTzH/aVAby
	Gk8x3osVrYvY19UR5MvYsk1Vp2rIu3xRGJmGu0zSC7oRuYHP4yp0jfNKguPH
X-Received: by 2002:ac8:5a0f:0:b0:530:1b1:72be with SMTP id d75a77b69052e-5383b6838c2mr89604751cf.40.1792986273086;
        Sun, 25 Oct 2026 20:44:33 -0700 (PDT)
Received: from paul-white-HP-Pavilion-Laptop-15-cs1xxx.mynetworksettings.com ([2600:4040:ad65:1c00:4cc4:d0be:4ab6:9a0b])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-538394c5273sm46202121cf.9.2026.10.25.20.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:44:32 -0700 (PDT)
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
Subject: [PATCH 2/2] KVM: riscv: Eliminate redundancy in set_reg function via pointers
Date: Sun, 25 Oct 2026 23:41:27 -0400
Message-ID: <073a56efd7e8f5b1e54207f266e1fa972b54a0e2.1792982932.git.paul.white.kernel@gmail.com>
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
requested in a token so that it can write data into that register. It
differentiated it from the many other variables with the word reg in
it.

Signed-off-by: Paul White <paul.white.kernel@gmail.com>
---
 arch/riscv/kvm/vcpu_fp.c | 64 ++++++++++++++++++++++++----------------
 1 file changed, 38 insertions(+), 26 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_fp.c b/arch/riscv/kvm/vcpu_fp.c
index 16999a5c45de..fe4957603519 100644
--- a/arch/riscv/kvm/vcpu_fp.c
+++ b/arch/riscv/kvm/vcpu_fp.c
@@ -144,41 +144,53 @@ int kvm_riscv_vcpu_set_reg_fp(struct kvm_vcpu *vcpu,
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
-			 reg_num <= KVM_REG_RISCV_FP_F_REG(f[31])) {
-			reg_num = array_index_nospec(reg_num,
-						     ARRAY_SIZE(cntx->fp.f.f));
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
-						     ARRAY_SIZE(cntx->fp.d.f));
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
 
 	if (copy_from_user(reg_val, uaddr, KVM_REG_SIZE(reg->id)))
 		return -EFAULT;
-- 
2.53.0

