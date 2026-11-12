Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480246;
	b=SLzLt+GrsCc8gFIf7AYqHS0zAdD0XSzuR9gfs6zroNpaTRM1+uYJ8hXng6OzaHFk1tKZ
	 8yPeyia9GRY5cMHY00f//h5wLHu4dpAdXbuy/wmPPuAn0qJKH+5Cf+NptEjHT+aaKUcUu
	 iRKkM5AYjqEJ9fj0beCOmFdTOwILIpVye+2GJ/cUiyc4AwnbjmlhEAbBBEtfJIEURdFEM
	 KBncVrC9EA7uQE6k4AqnrfvTOjwEUJU8YY5jKHQ0RCKukfKASPW54hfxcJH5+C29aDY1l
	 2jexD1YD3t0GG7f2+gX7+QmQ/G91YZ+2+k5sl1C3+fniMHNSBtNKQi2PETFts2iBsrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tPVt/aU+A2sVokgBjAuMpT5U1lyKBduiFFPOAO3us6w=;
	b=CmtI6ZpmIfazEMbCfk/lbdbDOGsLSeouyKjYTwrmL+Im9XwAwFJCdMHSTUyQeKPwemhy
	 i2jh+MI0HrMKshEVURDbBo9aqa3YPatx4+IGYMW+X58WHAZwmaftvRdFQJ1lOxHNcB3oP
	 x/t6pr7RYxPUwwiHbdX9taN09ww0y3D5TAlopfEo+0MRDxWpLoRyuXFrRT0Go75MNyVjJ
	 8PPstcWYdtWA/MsnBn0CyqNP4fgYSEp/UMclr9u3LeC/N50FLo0bFyOGd+hRJYnEOXcIS
	 ywesisZEJTqtYz/845DnV8S0MBjmDyvBSfpNr5kEIiVeAyHv3h4CvJvOFtZsAAkFl4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Ha8XywnD;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6C2606A331
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:44:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B6C2606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Ha8XywnD
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-37000e7234bso4156534eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794480245; x=1795085045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tPVt/aU+A2sVokgBjAuMpT5U1lyKBduiFFPOAO3us6w=;
        b=Ha8XywnDWnrfonKquSB2nyzG8xQISefntVAMf2DCJEFBkRKyC+7sUktaFz0K8SuXct
         fWSR6zjXBYK03XauIl4jcWes4M6bi66BlCBfhCGuCRnWnJRR/XukK4YERlP5bWqrdMku
         4e4ixqeCL8n89uHmvgsETLZYhsjcYkBK4X7rXVoiZJVK9+zp+BdW7KS19dbCt/Qwzg7Z
         WKaavQCDfAyfRe6YGSeZmSePTwbHNOhuFOHA5Krx1k3uK4q/xx+cHY62rsdQc8OGUuhz
         YuW5ZN4uocgnChxxYr0LIg4mWlkp0L9vbRq9o8GBU8WzLK5lp20cbe2TYfg9iKjxdi6L
         UcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794480245; x=1795085045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tPVt/aU+A2sVokgBjAuMpT5U1lyKBduiFFPOAO3us6w=;
        b=AyGvO99PtBuWSn3jpd52uv4ewNw9uReQwKd/7yaWMIgyQmoLWkILVYKpEcaLRZxJhr
         Mf1/ZGPJRij6ImZ3DlrLpIApvIcYH0YyfWt3aT259L18KNRe6wJwxX4lfqOBPxE8E1am
         +e68yS01QqLwTsv5p7Tqq4vmrlS3pkSY0jDvKxum6acvjinSulKk8B2VfiLalFaQohp8
         w9Ls5Qyh+fP8s9z6OFxUtJCSlhsOf925TEdhdJjwuA3pUCij860ClX1EbpAsQIMNlKl4
         WN41hdCyUYEKnTT15HGigZFQ41S6vaHewYznl+PIKgGqSRnCuw8hlS140dOOhYSm4Nui
         TwRA==
X-Forwarded-Encrypted: i=1; AL+hErG4YIZjmVh2S0gR2OFjkzHdtOCglMxOUb/JEk71UnrCj8AdxQCXojAjrId35i1w46ZxvCzoiCqp/LRDajQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z84UW78Y9524WbqFuh4EEUy6/fvwkMfQoMagIewjU5ElmJyP9Sy
	ccskhVPdvLPm0S/XRe/oS9rLBb7IvPsTadttHQluz3fk8XPL4hi+7sgGBQI492w2XlI=
X-Gm-Gg: AYBFou2M9yqkj6sUybV+AxaJrV1SgfL3gmbMWqqAoDtiSJJrW3BcoDmGg/a9toI6wPO
	vcpq0vJ4LR/uLqmoTTNgBtpNzH3jf//svCPgxmc3dZLkWno8Q7ml0tDp+qA4pfwLKznFkEtX8Nl
	Gg/X0LKRhYjC+EaCKqRkHOECn2bxIvQr1xVkBwfTZSXlSMeMdxi6w8koeR7UdREM7VZERg4XACO
	VQfzcQSxC6mx9kfC4C5UYVQVccY16tS5U1K42W5A7gURj5btmm15f3kbcrnvCEJPaUjYvslLp0K
	eD6Kth52puSo1hEb0WnV8ZxFb1igbe6XMtgxtMf7CX+pxrhPs2yNrXfQH/t50lwkeYutb+4xYbN
	TGUR7W+niXHlsuWRcC6NaW6T5xUFUpGAPDjRNRXoR3+PItLPzRGAle+vo+BoN+fOLOrWn3mbfKT
	ZbnCvmfQ1maG+zKBGEt4FtNazAQ4EQizc4CnRmMIWm0Eau1efImeHQDjr69fMVk19AanCVhgJoD
	vWjjBeX3TxgPgB3U+1G+eM1x/i65NalToYw8bKFaqs7aN0Gc8QBmxO+6Wd5OTUiKn2oQRqi9Mc1
	ec4ZZ804xQsB+QCEvw8Znir8V1rOcsT3oz/2hnv5Mor54GTWQKsKbOooqilY9+Jq9EA=
X-Received: by 2002:a05:7301:d80b:b0:375:370e:f1ff with SMTP id 5a478bee46e88-37687214128mr6314130eec.35.1794480245214;
        Thu, 12 Nov 2026 02:44:05 -0800 (PST)
Received: from FR9WL0RHKY.bytedance.net ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3772121e654sm13228694eec.2.2026.11.12.02.43.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 02:44:04 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dennis@kernel.org,
	tj@kernel.org,
	cl@gentwo.org,
	oleg@redhat.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	bjorn@kernel.org,
	pulehui@huawei.com,
	puranjay@kernel.org,
	broonie@kernel.org,
	cuiyunhui@bytedance.com,
	dave@stgolabs.net,
	david.laight.linux@gmail.com,
	jszhang@kernel.org,
	tglx@kernel.org,
	conor.dooley@microchip.com,
	thuth@redhat.com,
	ajones@ventanamicro.com,
	ben.dooks@codethink.co.uk,
	rkrcmar@ventanamicro.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	debug@rivosinc.com,
	seanwascoding@gmail.com,
	andybnac@gmail.com,
	menglong8.dong@gmail.com,
	cyrilbur@tenstorrent.com,
	wangruikang@iscas.ac.cn,
	atishp@rivosinc.com,
	apatel@ventanamicro.com,
	arnd@arndb.de,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	qingfang.deng@siflower.com.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	bpf@vger.kernel.org,
	linux-arch@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v10 5/9] riscv: implement preemptible this_cpu add_return operations
Date: Thu, 12 Nov 2026 18:41:45 +0800
Message-Id: <20261112104149.38589-6-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20261112104149.38589-1-cuiyunhui@bytedance.com>
References: <20261112104149.38589-1-cuiyunhui@bytedance.com>
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

Apply the recoverable per-CPU address handling to add-return operations.

Native-width AMOs return the old value, so derive the new value required
by the percpu API from the operand. Use Zabha for subword operations when
available, or a masked LR/SC sequence that returns the updated field.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/percpu.h | 134 ++++++++++++++++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/percpu.h
index 46eafa1ef02a1..9ff02f3811550 100644
--- a/arch/riscv/include/asm/percpu.h
+++ b/arch/riscv/include/asm/percpu.h
@@ -203,6 +203,129 @@ __PERCPU_8_16_OP_CASE(and, 16, .h, and, "and")
 __PERCPU_8_16_OP_CASE(or, 8, .b, or, "or")
 __PERCPU_8_16_OP_CASE(or, 16, .h, or, "or")
 
+static __always_inline u32
+__percpu_add_return_amo_case_32(void __percpu *pcp, unsigned long val)
+{
+	__PCPU_OP_CONTEXT();
+	u32 ret;
+
+	asm volatile (__PCPU_GPRS_BEGIN
+		"amoadd.w %[ret], %[val], 0(%[addr])\n"
+		__PCPU_GPRS_END
+		: [gprs] "=m" (__ti->pcpu_gprs),
+		  [off] "=&r" (__off), [addr] "=&r" (__addr),
+		  [ret] "=&r" (ret)
+		: [pcpu_offset] "m" (__ti->pcpu_offset),
+		  [pcp] "r" (pcp), [val] "r" ((u32)val)
+		: "memory");
+
+	return ret + (u32)val;
+}
+
+#ifdef CONFIG_64BIT
+static __always_inline u64
+__percpu_add_return_amo_case_64(void __percpu *pcp, unsigned long val)
+{
+	__PCPU_OP_CONTEXT();
+	u64 ret;
+
+	asm volatile (__PCPU_GPRS_BEGIN
+		"amoadd.d %[ret], %[val], 0(%[addr])\n"
+		__PCPU_GPRS_END
+		: [gprs] "=m" (__ti->pcpu_gprs),
+		  [off] "=&r" (__off), [addr] "=&r" (__addr),
+		  [ret] "=&r" (ret)
+		: [pcpu_offset] "m" (__ti->pcpu_offset),
+		  [pcp] "r" (pcp), [val] "r" ((u64)val)
+		: "memory");
+
+	return ret + (u64)val;
+}
+#endif
+
+static __always_inline unsigned long
+__percpu_add_return_8_16(void __percpu *pcp, unsigned long val,
+			 unsigned int bits)
+{
+	__PCPU_OP_CONTEXT();
+	const u32 field_mask = GENMASK(bits - 1, 0);
+	const unsigned long shift = PERCPU_8_16_GET_SHIFT(pcp);
+	const u32 mask = field_mask << shift;
+	const u32 val_trunc = val & field_mask;
+	void __percpu *pcp32 = PERCPU_8_16_GET_PCP32(pcp);
+	u32 old, new, field;
+	unsigned long ret;
+
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&
+	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZABHA)) {
+		if (bits == 8) {
+			asm volatile (__PCPU_GPRS_BEGIN
+				".option push\n"
+				".option arch, +zabha\n"
+				"amoadd.b %[ret], %[val], 0(%[addr])\n"
+				".option pop\n"
+				__PCPU_GPRS_END
+				: [gprs] "=m" (__ti->pcpu_gprs),
+				  [off] "=&r" (__off), [addr] "=&r" (__addr),
+				  [ret] "=&r" (ret)
+				: [pcpu_offset] "m" (__ti->pcpu_offset),
+				  [pcp] "r" (pcp), [val] "r" ((u8)val)
+				: "memory");
+			return (u8)(ret + val);
+		}
+
+		asm volatile (__PCPU_GPRS_BEGIN
+			".option push\n"
+			".option arch, +zabha\n"
+			"amoadd.h %[ret], %[val], 0(%[addr])\n"
+			".option pop\n"
+			__PCPU_GPRS_END
+			: [gprs] "=m" (__ti->pcpu_gprs),
+			  [off] "=&r" (__off), [addr] "=&r" (__addr),
+			  [ret] "=&r" (ret)
+			: [pcpu_offset] "m" (__ti->pcpu_offset),
+			  [pcp] "r" (pcp), [val] "r" ((u16)val)
+			: "memory");
+		return (u16)(ret + val);
+	}
+
+	asm volatile (__PCPU_GPRS_BEGIN
+		"0: lr.w %[old], 0(%[addr])\n"
+		"and %[field], %[old], %[mask]\n"
+		"srl %[field], %[field], %[shift]\n"
+		"add %[field], %[field], %[val]\n"
+		"and %[field], %[field], %[field_mask]\n"
+		"sll %[field], %[field], %[shift]\n"
+		"and %[new], %[old], %[inv_mask]\n"
+		"or %[new], %[new], %[field]\n"
+		"sc.w %[new], %[new], 0(%[addr])\n"
+		"bnez %[new], 0b\n"
+		__PCPU_GPRS_END
+		: [gprs] "=m" (__ti->pcpu_gprs),
+		  [off] "=&r" (__off), [addr] "=&r" (__addr),
+		  [old] "=&r" (old), [new] "=&r" (new),
+		  [field] "=&r" (field)
+		: [pcpu_offset] "m" (__ti->pcpu_offset),
+		  [pcp] "r" (pcp32), [mask] "r" (mask),
+		  [shift] "r" (shift), [val] "r" (val_trunc),
+		  [field_mask] "r" (field_mask), [inv_mask] "r" (~mask)
+		: "memory");
+
+	return field >> shift;
+}
+
+static __always_inline u8
+__percpu_add_return_amo_case_8(void __percpu *pcp, unsigned long val)
+{
+	return __percpu_add_return_8_16(pcp, val, 8);
+}
+
+static __always_inline u16
+__percpu_add_return_amo_case_16(void __percpu *pcp, unsigned long val)
+{
+	return __percpu_add_return_8_16(pcp, val, 16);
+}
+
 #define _pcp_wrap(op, pcp, ...)						\
 ({									\
 	op(&(pcp), __VA_ARGS__);					\
@@ -256,6 +379,17 @@ __PERCPU_8_16_OP_CASE(or, 16, .h, or, "or")
 #define this_cpu_or_8(pcp, val)		_pcp_wrap(__percpu_or_amo_case_64, pcp, val)
 #endif
 
+#define this_cpu_add_return_1(pcp, val)					\
+	_pcp_wrap_return(__percpu_add_return_amo_case_8, pcp, val)
+#define this_cpu_add_return_2(pcp, val)					\
+	_pcp_wrap_return(__percpu_add_return_amo_case_16, pcp, val)
+#define this_cpu_add_return_4(pcp, val)					\
+	_pcp_wrap_return(__percpu_add_return_amo_case_32, pcp, val)
+#ifdef CONFIG_64BIT
+#define this_cpu_add_return_8(pcp, val)					\
+	_pcp_wrap_return(__percpu_add_return_amo_case_64, pcp, val)
+#endif
+
 #undef PERCPU_RW_OPS
 #undef __PERCPU_AMO_OP_CASE
 #undef __PERCPU_8_16_OP_CASE
-- 
2.39.5

