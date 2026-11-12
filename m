Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480285;
	b=SR6LrD/isDYHV5YTPBn9lvjRrEpCgHH6EUlAazj3VGcP/qmanwIFsjR51eyLohzvMbEw
	 GpvpffWCQdaGeo0t8jKLWsObYlAMkjtX1Nuj5lZWJRMTWNuYUHWb8bFlmfXsx2L/PsdGR
	 1nuhZuxopSDJWVAyTsU0t3TwgwzWGh9LlFMgCPi/IwdIvNF5c1EuG2gDDzNllOYS11gNK
	 2Z8q7Dvp0cSDBxm4A77u8xhk/hVhghFTP4dgHAUwMLiCC8jp1NKJuQPYPBVq6ViBFHsNW
	 dDSld8mf85xjtH6sDxgaVN+fFcOnxdl2NM6/XPzf0m+Yf4K3zL6x/WxugRlaaIbNjuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3OeTM1TzwuEgoxs5/RujJPoBJ6uQ7k0zO4x50L7a91Q=;
	b=qIiETX3JNiLERqgrp5doQfWRdr8GKzcpeSdpgkMBCgXIfb09HQo48/CWxfI2F6ei1IPe
	 CtguIMavOq5gIxzulWh4AWJuIzkN1X7U/509IZUHcLnfELckeA4zxOY7YXSLTLTCj1qKv
	 MWKuibfptGOXjY/mQ0TMEU15X5N4EFgACpkLnjHrJvh5GFwlDQCZS350ILCBRZFobplPf
	 Fwob9rY62R48rCdK3mXsVg2rCnyU2cPUnUNfH8UJ8MSfvq/bYeQ+nlXOUj500/1hH+IEN
	 fEJrrWBfCH9LAEQgbcMD96UC8e2QkqOBPe6Uy6PXeyJzgs4zuaOtHhbGZqyYWB7KtmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=cVu3Fhif;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7064F606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7064F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=cVu3Fhif
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso6181397eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794480285; x=1795085085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3OeTM1TzwuEgoxs5/RujJPoBJ6uQ7k0zO4x50L7a91Q=;
        b=cVu3FhifDYyw/8ovEmb0XXkxrC7JTJXzQpQoB/cyBQBJEqG9ZjWpZflWP9PKQ/l9Tr
         pS0k2Ze0U2AywiW3kAzoeBmomzV7SElEufbYjoh0FUQmD2nwHpKasPYChDhI36/Gvvph
         3dCRjDRZDz405IRSivQLt52PQJbbB0azaAbrIfBGq6QM5bJCdGaGIbnn5bod/4Nkw7xU
         lgu4XjVIumLaWFEOJku3iLmtNzuQDAR39FnXUAYN6mgGkA5D/6I8BaMkEiKF2NA8ADSd
         d02EtMRqr8MPtrnRLAWnU4tfoe1R/ZgAPte+i7ahrrDzqqeWp1J+gZ+OczxMxFd1vsMF
         D4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794480285; x=1795085085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3OeTM1TzwuEgoxs5/RujJPoBJ6uQ7k0zO4x50L7a91Q=;
        b=BXqllLukoBPjZE1/6HYsLGC9U381YP8N5lISGg8fWe5WfLsBU2cg9Q+Au+0jJDTr+1
         PyDSMnlD9iQJRNC8QkRoOisgAt6G+oHRMNsB7VkhV0CdnIUMlZ2yt8Wx4HIcu69d1EZY
         QlCPWu7+4pgG7VL/niYGV880TGi1YmSx6iZ1n5Oa/Xx/Mc2fMFgAtrPWxw12Jyg+/4P8
         GzDJAgkfDFxLRJroE7WZfTWv/7OXcP0DnNvxXQiUdaE8DIc4C03a3E4qFvG4KZSsBpk4
         QlFh9ugrkyNEaTS3vL+WUvhN2jiNobSSRY5Th1BpeuzM3Ln7H5O2qUD4rIdsdMlc27Xh
         3xlA==
X-Forwarded-Encrypted: i=1; AL+hErFiFDFu2T8TNM7QlsYdacPKNt0dX4osJ6847k6DyPAo8/nd/6HJqNiFZ2sXejkGkB3JYsU4vi6cU0Yycc8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HMuwVutS6Frw8BOVpLaKRV7mwqk57JonF7IfYA+BHSfigx+Gb
	Z+0dynJ7hB54m/V1+cPlVhBwEJ27U5UaWe7SPDP5rXSbHVXjRpVuWNBBhEw+ljUtFwQ=
X-Gm-Gg: AYBFou0vhjaZjGaCgjhKtoAUR40Rwd9Pf7oEpFlId6kIC76x526Xal8W+cPEfYEI3S7
	W2DYMuTwMzAdqEOuJ/eRs2d7JzlbzMAeRrBucmcjLFg+sfvG5U5SXIsqc+hpI41z9DznmOMD0cr
	FgDyVz1CAptuIgmTAZUxVTDj/Dle7J/TFTv+1K9+Q3ucNKDedXER0Yrv1dhzbbjomol0uuPkrLP
	KtKRvEH0zXl/pJR29keOmijYzm2z9yR2JrScudLn9leO7u+obQV6OZBj96rI3g7m1pXFwchRlnF
	xHt/aF582FrVvnYEBIOqBoWAree2dM1qUyrIiW7ZK4Nvm/rmfVAKRGjs1sqyUsWIMS7h07COolQ
	QII6XnjUXjUgPI05tT7TG1B5b+dh8mc12EQ2YxrMlZ3k82nBpmavuuVBesFw/CZcEuZGB3DA25e
	eOXO0axsyQV/JrQisj2qfZSRJWrqH9svOP3Twypjf9iu22N2qHggxUsaU9qepOXViLXMICEjeQb
	DHtlNntkj3a6GoIRVxwcZSzSPVdrFywi9ZLKQNnpBujraRpfUEQ5bPb7x4o4VHYTDNfFrvy1qew
	2N8BrxcBfp7gdCeT/BchYURJU4C+6tsjOv+hC0G9bX1pyytr2CSlL97RjBTpWA09sX8=
X-Received: by 2002:a05:693c:6381:10b0:378:a35b:9e1c with SMTP id 5a478bee46e88-378a35b9e83mr512290eec.37.1794480284232;
        Thu, 12 Nov 2026 02:44:44 -0800 (PST)
Received: from FR9WL0RHKY.bytedance.net ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3772121e654sm13228694eec.2.2026.11.12.02.44.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 02:44:43 -0800 (PST)
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
Subject: [PATCH v10 7/9] riscv: implement preemptible this_cpu cmpxchg operations
Date: Thu, 12 Nov 2026 18:41:47 +0800
Message-Id: <20261112104149.38589-8-cuiyunhui@bytedance.com>
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

Apply the recoverable per-CPU address handling to compare-and-exchange
operations. Providing this_cpu_cmpxchg() also allows asm-generic to derive
this_cpu_try_cmpxchg().

Use Zacas where available and LR/SC otherwise. Keep masked subword operands
XLEN-wide so RV64 LR.W sign extension does not affect the comparison, and
use typed helpers to separate asm-generic from the architecture cmpxchg
macro expansion.

Link: https://lore.kernel.org/r/20260826010748.zphu3wh2hlm4t4o2@offworld
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/percpu.h | 140 ++++++++++++++++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/percpu.h
index 810f4c5eaa508..4d2fc10cbdab1 100644
--- a/arch/riscv/include/asm/percpu.h
+++ b/arch/riscv/include/asm/percpu.h
@@ -401,6 +401,123 @@ __percpu_xchg_case_##sz(void __percpu *pcp, unsigned long val)		\
 
 __PERCPU_8_16_XCHG_CASE(8, .b)
 __PERCPU_8_16_XCHG_CASE(16, .h)
+
+#define __PERCPU_CMPXCHG_CASE(sz, lr_sfx, sc_sfx, cas_sfx)		\
+static __always_inline unsigned long					\
+__percpu_cmpxchg_case_##sz(void __percpu *pcp, unsigned long old,	\
+			   unsigned long new)				\
+{									\
+	__PCPU_OP_CONTEXT();						\
+	const long cmp = (long)(s##sz)(u##sz)old;			\
+	unsigned long rc;						\
+	u##sz ret = (u##sz)old;						\
+									\
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) &&			\
+	    IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZACAS) &&			\
+	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZACAS)) {	\
+		asm volatile (__PCPU_GPRS_BEGIN				\
+			".option push\n"				\
+			".option arch, +zacas\n"			\
+			"amocas" #cas_sfx " %[ret], %[new], 0(%[addr])\n"	\
+			".option pop\n"					\
+			__PCPU_GPRS_END					\
+			: [gprs] "=m" (__ti->pcpu_gprs),		\
+			  [off] "=&r" (__off), [addr] "=&r" (__addr),	\
+			  [ret] "+&r" (ret)				\
+			: [pcpu_offset] "m" (__ti->pcpu_offset),	\
+			  [pcp] "r" (pcp), [new] "r" ((u##sz)new)	\
+			: "memory");					\
+	} else {							\
+		asm volatile (__PCPU_GPRS_BEGIN				\
+			"0: lr" #lr_sfx " %[ret], 0(%[addr])\n"		\
+			"bne %[ret], %[old], 1f\n"			\
+			"sc" #sc_sfx " %[rc], %[new], 0(%[addr])\n"	\
+			"bnez %[rc], 0b\n"				\
+			"1:\n"						\
+			__PCPU_GPRS_END					\
+			: [gprs] "=m" (__ti->pcpu_gprs),		\
+			  [off] "=&r" (__off), [addr] "=&r" (__addr),	\
+			  [ret] "=&r" (ret), [rc] "=&r" (rc)		\
+			: [pcpu_offset] "m" (__ti->pcpu_offset),	\
+			  [pcp] "r" (pcp), [old] "r" (cmp),		\
+			  [new] "r" ((u##sz)new)			\
+			: "memory");					\
+	}								\
+									\
+	return ret;							\
+}
+
+__PERCPU_CMPXCHG_CASE(32, .w, .w, .w)
+#ifdef CONFIG_64BIT
+__PERCPU_CMPXCHG_CASE(64, .d, .d, .d)
+#endif
+
+/*
+ * Use XLEN-wide masks to clear the upper bits of an RV64 sign-extended
+ * LR.W result before comparing a high byte or halfword.
+ */
+#define __PERCPU_8_16_CMPXCHG_CASE(sz, sfx)				\
+static __always_inline unsigned long					\
+__percpu_cmpxchg_case_##sz(void __percpu *pcp, unsigned long old,	\
+			   unsigned long new)				\
+{									\
+	__PCPU_OP_CONTEXT();						\
+	const unsigned long shift = PERCPU_8_16_GET_SHIFT(pcp);		\
+	const unsigned long field_mask = PERCPU_8_16_GET_MASK(sz);	\
+	const unsigned long mask = field_mask << shift;			\
+	const unsigned long old_field = (old & field_mask) << shift;	\
+	const unsigned long new_field = (new & field_mask) << shift;	\
+	void __percpu *pcp32 = PERCPU_8_16_GET_PCP32(pcp);		\
+	unsigned long ret32, tmp, rc;					\
+	u##sz ret = (u##sz)old;						\
+									\
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&			\
+	    IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) &&			\
+	    IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZACAS) &&			\
+	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZABHA) &&	\
+	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZACAS)) {	\
+		asm volatile (__PCPU_GPRS_BEGIN				\
+			".option push\n"				\
+			".option arch, +zacas, +zabha\n"		\
+			"amocas" #sfx " %[ret], %[new], 0(%[addr])\n"	\
+			".option pop\n"					\
+			__PCPU_GPRS_END					\
+			: [gprs] "=m" (__ti->pcpu_gprs),		\
+			  [off] "=&r" (__off), [addr] "=&r" (__addr),	\
+			  [ret] "+&r" (ret)				\
+			: [pcpu_offset] "m" (__ti->pcpu_offset),	\
+			  [pcp] "r" (pcp), [new] "r" ((u##sz)new)	\
+			: "memory");					\
+	} else {							\
+		asm volatile (__PCPU_GPRS_BEGIN				\
+			"0: lr.w %[ret], 0(%[addr])\n"			\
+			"and %[tmp], %[ret], %[mask]\n"			\
+			"bne %[tmp], %[old], 1f\n"			\
+			"and %[tmp], %[ret], %[inv_mask]\n"		\
+			"or %[tmp], %[tmp], %[new]\n"			\
+			"sc.w %[rc], %[tmp], 0(%[addr])\n"		\
+			"bnez %[rc], 0b\n"				\
+			"1:\n"						\
+			__PCPU_GPRS_END					\
+			: [gprs] "=m" (__ti->pcpu_gprs),		\
+			  [off] "=&r" (__off), [addr] "=&r" (__addr),	\
+			  [ret] "=&r" (ret32), [tmp] "=&r" (tmp),	\
+			  [rc] "=&r" (rc)				\
+			: [pcpu_offset] "m" (__ti->pcpu_offset),	\
+			  [pcp] "r" (pcp32), [mask] "r" (mask),		\
+			  [old] "r" (old_field),			\
+			  [new] "r" (new_field),			\
+			  [inv_mask] "r" (~mask)			\
+			: "memory");					\
+									\
+		ret = (ret32 & mask) >> shift;				\
+	}								\
+									\
+	return ret;							\
+}
+
+__PERCPU_8_16_CMPXCHG_CASE(8, .b)
+__PERCPU_8_16_CMPXCHG_CASE(16, .h)
 #define _pcp_wrap(op, pcp, ...)						\
 ({									\
 	op(&(pcp), __VA_ARGS__);					\
@@ -421,6 +538,15 @@ __PERCPU_8_16_XCHG_CASE(16, .h)
 					     (unsigned long)(val));	\
 })
 
+#define _pcp_wrap_cmpxchg(op, pcp, old, new)				\
+({									\
+	__auto_type __pcp_ptr = &(pcp);					\
+									\
+	(TYPEOF_UNQUAL(*__pcp_ptr))op(__pcp_ptr,			\
+					     (unsigned long)(old),	\
+					     (unsigned long)(new));	\
+})
+
 #define this_cpu_read_1(pcp)	_pcp_wrap_return(__percpu_read_8, pcp)
 #define this_cpu_read_2(pcp)	_pcp_wrap_return(__percpu_read_16, pcp)
 #define this_cpu_read_4(pcp)	_pcp_wrap_return(__percpu_read_32, pcp)
@@ -480,11 +606,25 @@ __PERCPU_8_16_XCHG_CASE(16, .h)
 #define this_cpu_xchg_8(pcp, val)	_pcp_wrap_xchg(__percpu_xchg_case_64, pcp, val)
 #endif
 
+#define this_cpu_cmpxchg_1(pcp, o, n)					\
+	_pcp_wrap_cmpxchg(__percpu_cmpxchg_case_8, pcp, o, n)
+#define this_cpu_cmpxchg_2(pcp, o, n)					\
+	_pcp_wrap_cmpxchg(__percpu_cmpxchg_case_16, pcp, o, n)
+#define this_cpu_cmpxchg_4(pcp, o, n)					\
+	_pcp_wrap_cmpxchg(__percpu_cmpxchg_case_32, pcp, o, n)
+#ifdef CONFIG_64BIT
+#define this_cpu_cmpxchg_8(pcp, o, n)					\
+	_pcp_wrap_cmpxchg(__percpu_cmpxchg_case_64, pcp, o, n)
+#define this_cpu_cmpxchg64(pcp, o, n)	this_cpu_cmpxchg_8(pcp, o, n)
+#endif
+
 #undef PERCPU_RW_OPS
 #undef __PERCPU_AMO_OP_CASE
 #undef __PERCPU_8_16_OP_CASE
 #undef __PERCPU_XCHG_AMO_CASE
 #undef __PERCPU_8_16_XCHG_CASE
+#undef __PERCPU_CMPXCHG_CASE
+#undef __PERCPU_8_16_CMPXCHG_CASE
 #undef PERCPU_8_16_GET_SHIFT
 #undef PERCPU_8_16_GET_MASK
 #undef PERCPU_8_16_GET_PCP32
-- 
2.39.5

