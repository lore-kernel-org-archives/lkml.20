Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793227409;
	b=VWmlUSjB6jxiPDyWTf3YHGvwJ9VaLyUaOBcAzDBOn4iDjlfeEmjAlVrW/uNAsoV6Fk/h
	 aXtZEqp6cI3gM9ORmdtDvl8kOV8CSQ7VQVn7yWb6btv4VO5Hm289aehf3iI8ma+IwYcbh
	 xDYrTdqgId9IEBVnkOJgpFBPdlMQSckAn+MsEzv9whhowa/1md7uC+6r9sOxaqiDo4/Fa
	 yDB8L6XoocOxVI0VScxv0O351Jf+8J5QsD8iXoMGVczvsUt2LRmhoEEbZNY3kCf2sBOta
	 p1q7tXDDyxXjRQE+yLMOOjcnthC4pOMMludWxnVjp6nhHjIgloBytH8Dp4OCMs79/qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793227409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dAZhtXQcONVBEEfX+FEqGwIc1UuckqT1BoM+QvmFfV4=;
	b=Hgw0ip3qTrgoS7uW1+k16gN47X91h62qAulSnH5UCAnE8oSIX4Py82eVjRj1iHfbJQKm
	 VLEPLw+3l1taQuE16A92DMnwYXLcA9sUI01USwyOVrCv2JHwFsa+OB0+V+d3JYXb2L3zA
	 masXTjB2mRKVzPiFWBGVFapPrEtk74nUBpD4Ipqf9uJUO1ohTWeQwni9o8Ev8d3N7q3gM
	 4/Kqo8ZzIGFVtWHOdXeMraMzlEQcq7MnQ/PIib0h+nZ76iNgdYBY2toW84O5BX1Toy2kN
	 jTe5CAsKUpr2VBH60PDiXoarPMAMh/+kjXgF+zX3hT2ArK2vkThgKrJ+4srv9Zhfp+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="lz/n5bjJ";
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8B960A2608
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A8B960A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lz/n5bjJ
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93a40a9a01aso19338785a.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793227407; x=1793832207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dAZhtXQcONVBEEfX+FEqGwIc1UuckqT1BoM+QvmFfV4=;
        b=lz/n5bjJgSiZUhivNxuxCdzHp9ioVTOOdtmElEBpSKIbMrLieFb6jSCIbUdlsUFzAA
         RF1k7gRKRoab7ipESmRoSXLXcaWqBl/MopxXC4K0J8p1v0RVSyPyi+aMg32MLq3Zn2Qk
         QFyb+8VPtNAOYqoYBqQZJbmEXetSJvLS0sr1Ev1pCCaoLPC5Z1uZTlHTvPDx4mEp8aT1
         m2UPAAbw7hnQBbCdsTgbuFLZEh732P5et1fb5GHoWrCEb4Nt2Vhq4GJDarcqoO6uVnVN
         QDAhtoGi4tmRuZngl2AGKxN14eVqsfxJGnedDLTo974dg+nYGRxlC1D/HROmSrnfeF7j
         1pog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793227407; x=1793832207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dAZhtXQcONVBEEfX+FEqGwIc1UuckqT1BoM+QvmFfV4=;
        b=P4+9kgxzF2DSolkrPiLEcjOGKXLIfJqtlLP+pIpk3X1HWpB8IPIlgEldydXLb9+lJa
         8hNzzTrgPtHuJkmGVzkNxwmCt8WJyLiIzV631D3VtAHicP/ezeer+jqUOZWcgG4zAwFz
         IMY3t7TewH6ks9hPF7t8LS//HLZhtfCnIpAD7ILPxDlzm8ovR/803xtDabzAhqUDtG8z
         xDJFuxezNZgJIezVYNAZANJ1t1wopbAbzGq0eJC9Lbyh8hBD8USC29wtPLruDAyQBWLE
         CVuV7O7OG4ZZudUak4lcrI2ah335RCcZiW7G9MofFMC5YOZ9HBrRUnBEVggwOT54rhaV
         RRpA==
X-Forwarded-Encrypted: i=1; AKwUvBzo9b2LPf52amSLptzyZsDzm8GMcW0DtN9V2mlxyzzDZYjksdQgDZQXJmj6ZjI4jxXifKqm92pMbPhmJNY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFCHghc25vCF0oKAkCkA2BIrcPvxVBXJPhUVDjlpAu95axdhDD
	RS+ucjYOb6ZuIu5/LOUyMT6wc8oS//Azim2FHptUddmTeVK5ySxnXTNW
X-Gm-Gg: AYBFou2CfslsdbECC2XjvOvl5mr6nNZyMrkbjkgk4r4KNoYJ6khhukWzZLv8xi4CwDO
	iB3HDGsIjnvSCrDuDaqY35ipeyrtDx7JZh1nTxGxfkOczaYFy6hRNuockfa6+vmqQXddgDzhmOZ
	mAng6K+sSupAv4815bolvR+bmTuBDHBT95aoNLuy9bNv7CyPTd2Pjxv09LzBJdagjRtjrumGlIT
	CzYtqclhh0mPoax7vlIcRnE6inDw8IwoTRfGY0tZBXM+4E1CkOSGM+cnVqti1xQPQpoIknqZv+P
	H7sMLdvk7fP2/KJDl6aF66KSEicuna7GAXHmWmMTjo0P7LHtg5ilUIW8JyRquTDtdsYvnCk8Pyg
	R1DUQegpNj2IF0snOnx0f5Bl5j1TJPc8y1qBlrT2evjFqz6uCi42OylbzVGs0ypNPgCqHqP93pN
	spe6gE6Rtzje39t8lM6VkScDe+NxQEZalSrdKFcnyTEwscrTeGCBEmr9kQKJiiaAIaJZ8W141zX
	94kPt+nVGkoWwmQvlePwOslMhP5IzOnAtCoa09zrMBv9nMlX2hS3QR/Eg//ualoW1mgTtA0UuaW
	97ksW4fqNF5NY6JNmx1BgYgc686hH2hja3T85yUr8v/7hP+NzrxlRaAJe5e6+1ks2cthBt9hFL+
	5G5BU2n4RZksz4oZlFZdECb4TOtcrwSKOli4xLGRctF+pi8n2SoM=
X-Received: by 2002:a05:620a:410f:b0:93e:53db:d59e with SMTP id af79cd13be357-9441338b4cfmr150529085a.23.1793227407492;
        Wed, 28 Oct 2026 15:43:27 -0700 (PDT)
Received: from paul-white-HP-Pavilion-Laptop-15-cs1xxx.mynetworksettings.com ([2600:4040:ad65:1c00:b8:5aeb:4bda:886])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f0787d96sm1370085685a.28.2026.10.28.15.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 15:43:26 -0700 (PDT)
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
Subject: [PATCH v2 2/2] KVM: riscv: Eliminate redundancy in set_reg function via pointers
Date: Wed, 28 Oct 2026 18:43:09 -0400
Message-ID: <7290d6f5bead955e7a4bcb5b7aba97962031f0cb.1793223506.git.paul.white.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793223506.git.paul.white.kernel@gmail.com>
References: <cover.1793223506.git.paul.white.kernel@gmail.com>
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
v2:
 - only checked whether size token listed was either 32 or 64 which
   could create/allow tokens with mismatched sizes and types to pass,
   but should've checked if token's size was correct for its FP type.
   Did this by replacing u32 and u64 with byte_offset because it is a
   existing mode-dependent variable.
---
 arch/riscv/kvm/vcpu_fp.c | 62 +++++++++++++++++++++++-----------------
 1 file changed, 36 insertions(+), 26 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_fp.c b/arch/riscv/kvm/vcpu_fp.c
index da4f83be6b19..b8e89107b6c3 100644
--- a/arch/riscv/kvm/vcpu_fp.c
+++ b/arch/riscv/kvm/vcpu_fp.c
@@ -142,41 +142,51 @@ int kvm_riscv_vcpu_set_reg_fp(struct kvm_vcpu *vcpu,
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
+		if (KVM_REG_SIZE(reg->id) != byte_offset)
+			return -EINVAL;
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

