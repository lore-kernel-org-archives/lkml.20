Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480208;
	b=N0cc6DRt3LMHvtzmSZyRXAYqcz3dENOIkgNiftDwoZZV4A6xNAX/t5rStsUlFqiXOvpc
	 WEZQXu1sb4Z4Xt4+knJ4RWV1IUJIkPg8a9gOXLiKND01uap82t2y01NY+9vfyw65WGTDl
	 8H8frtUpPxw6HhCQdSWWOmEOa1q/6FEihRBiTwIODa76C6mrd633QozRzWj1SBJFfeZOA
	 p796/9Lpn7Tp/4IkNvvYhIqR+hp8cxQlexBs9WY11RD3VTPiyDlEi3GTxA79Jom8aarIj
	 QYi5CTdZZWF/wjIJDiqoXXEACrGhpprK1ihlI3EEdbKHHCDI4LkKskJ9iWlEOOW1QxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tKHbJSnTS/xgwwH8xY3FZeNU74t03Ua9SzHRVgCuNfk=;
	b=fpILIfGUhSaDrfnzaQvB0dgDKrRK7l/Ch5R2PUaPJYOCEiAF4f5h2CFY4urrYbOg0XBw
	 WXJ7dOCQ15jWY+ljepw7dSNECbZ9oTzUQsho5JLly2comG2vlcQ4FSR/Yx1I9K7/dJghs
	 o/3jeG97abdBUxYtLGXXgmWbp0BgT+RYt+mabgL5zirlr7M7FMDnBdZ8ZljvbXiiy4fT3
	 PEyXPPQUtcyx4APdInMIoQpbXa2OTg7ccEGVv19qlC/M6dS+j4xoUX+94pQnriCwYqfwj
	 t/KAidMS4fHzB9tMGmtJeeIqI7mmkoZjHn4OGyNMcYeB6gvF6uoq9Dy/9rrP8Yay0fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=FCxhZTnA;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A437606A885
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A437606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=FCxhZTnA
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so7557071eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794480207; x=1795085007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tKHbJSnTS/xgwwH8xY3FZeNU74t03Ua9SzHRVgCuNfk=;
        b=FCxhZTnAeK7n/dzZlGfF22knsUTMPuXwGQSbxR9VnkVe3ltOK6T1yguzUaHIKK2Vr7
         rjXbtbB0TyoD8eWSwZPFSE/msrGdN2FQwWdsktysafMpuWSRc9ArZ8STX8HGMDTONHsY
         jfy5b3ErpckgJQzRehMt/SpYX5rJwmWgSpmg8CSNgpaEK90R08nR/dPJWQDT+eV5nfKN
         T/Kz96UKOCz9F5DXzqEzESLKHD8y3gXh0W3l6c+sqjYAEnUT7eAh/TQrZ5r68xEB4oqL
         xerL5YQGYOR7YA1cV3TWRypuC2VcIuMPF524ziJF9beW5zLwnIy4+TWQg8WRaFVCuEzg
         K6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794480207; x=1795085007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tKHbJSnTS/xgwwH8xY3FZeNU74t03Ua9SzHRVgCuNfk=;
        b=KCMYRJdo43ucZyQ9EO2kNkE7Uwbzkudo7yiPMFF/fNCH+064ynkRi3P7gsF6XLikHB
         y1nmMW3S8XW72BMiS8MfFeMUl3M/v9kxfYArydspQDjtrZeFGuyZH5AST2I53WF5i0yl
         GnEW0aT4EYm08EnUT2ZZbQj4MtPAUEdflpecv/vHtDOThUyjqS7qkNVRd5KDNsbHZoUe
         xDVNZmOCXza77ZWftQ8eNE8umacaP/rAA8JH1GcJnedjfGljLeT3v93NExaRhIJEAx6M
         NjPGkv5ElzzMmNSm3WVvl3qaTBxdwSeEXNym+s6boL8XHX5Vf+341YjPIfG5ykiqQuDU
         FuOw==
X-Forwarded-Encrypted: i=1; AL+hErFSTd9X9VdgORfDQIzMCwhErfcoGmz0PDJ8W5zdt5y69FSNlD5KZzjzSqjliQVd3Uj/2A0jI+ru1RbakEM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/N+w8vElrhjw5sdDbyscL2DR8jjNZIYhw90OMimp+5wUKbexWE
	lbOXuOCQUWzeY1xxhl4wIm8oZg9AGXkmph4ksisAAOQ4knxffqjCmMrQ56dyfsItrRM=
X-Gm-Gg: AYBFou2L/JgrEbBgSZOLKadQCGcYHnO34vFfhN9WGtqP6xqkjftiLNU5Oy2pymXRRrB
	RyYLzoB6Z0XFqb+OP1WAjJc3q3aOHfj1b36l1HYIFugxo+mu9/e1Y6CFvl+QN7sNxWW3GqeD9vS
	vpVap0lfiwycZP9dJX85VDAnrY95061oqfVP66cOAo1F/hd/17lLIxIoo1pJ34MMnE8vANTAiSB
	Zf/9DmyVQURs2NMnc3qbC4mvPKbPrqP2Hy7ir21friiD4ojp+8V8tLgA9/9ARaqIY2DQ2UO9DOs
	bxg5EsJ/GXUWDgs0EcHR8EED7dfehONfXSFntXczIPDhjL76fCHEmmEzjylgdGvHVT1PkllIKzB
	34Q4WbOlLrLvZguA85rEI5aIAe6n98j7GWKpj4yx6zUMbKDVw/RXhFDgdh948IwLkF8Jt6kS9+q
	UvqvVHbCt4JJPy3H/lQpgvOWbWtRKgQgicZKPH1B6FDgJpW2vRtr+MOv+P/3FvAvgB6bqtozNqd
	XCQMmMuf0up58b8h1hjNylyD9L/CZEDfwQokfs4/oYo81phkKMU/86vQhBBBXPF5239YGkOwhzz
	HrLRoVwOGjMg26NUmvQrx13yLJDldAZ8s8OJpc0xVgY4S7+dF822tveg0KOFPLQlpMg=
X-Received: by 2002:a05:7300:bf9c:b0:36e:1fbe:3571 with SMTP id 5a478bee46e88-3768366a461mr5368073eec.3.1794480207004;
        Thu, 12 Nov 2026 02:43:27 -0800 (PST)
Received: from FR9WL0RHKY.bytedance.net ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3772121e654sm13228694eec.2.2026.11.12.02.43.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 02:43:26 -0800 (PST)
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
Subject: [PATCH v10 3/9] riscv: implement preemptible this_cpu read and write operations
Date: Thu, 12 Nov 2026 18:41:43 +0800
Message-Id: <20261112104149.38589-4-cuiyunhui@bytedance.com>
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

Apply the recoverable per-CPU address handling to read and write
operations.

Keep the address calculation and memory access in the same inline assembly
block, and use naturally sized loads and stores while preserving the type
semantics of the generic percpu API.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/percpu.h | 85 +++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/percpu.h
index 59f7d44f7d3fe..ae7c123a48093 100644
--- a/arch/riscv/include/asm/percpu.h
+++ b/arch/riscv/include/asm/percpu.h
@@ -4,6 +4,7 @@
 #define __ASM_PERCPU_H
 
 #include <linux/bits.h>
+#include <linux/compiler.h>
 #include <linux/stringify.h>
 #include <linux/thread_info.h>
 
@@ -52,6 +53,90 @@
 #define __PCPU_GPRS_END							\
 	"sh zero, %[gprs]\n"
 
+#define __PCPU_OP_CONTEXT()						\
+	struct thread_info *__ti = (struct thread_info *)current;	\
+	unsigned long __off, __addr
+
+#define PERCPU_RW_OPS(load, store, sz)					\
+static __always_inline unsigned long					\
+__percpu_read_##sz(const void __percpu *pcp)				\
+{									\
+	__PCPU_OP_CONTEXT();						\
+	unsigned long val;						\
+									\
+	asm volatile (__PCPU_GPRS_BEGIN					\
+		load " %[val], 0(%[addr])\n"				\
+		__PCPU_GPRS_END						\
+		: [gprs] "=m" (__ti->pcpu_gprs),			\
+		  [off] "=&r" (__off), [addr] "=&r" (__addr),		\
+		  [val] "=&r" (val)					\
+		: [pcpu_offset] "m" (__ti->pcpu_offset),		\
+		  [pcp] "r" (pcp)					\
+		: "memory");						\
+									\
+	return (u##sz)val;						\
+}									\
+									\
+static __always_inline void __percpu_write_##sz(void __percpu *pcp,	\
+				       unsigned long val)		\
+{									\
+	__PCPU_OP_CONTEXT();						\
+									\
+	asm volatile (__PCPU_GPRS_BEGIN					\
+		store " %[val], 0(%[addr])\n"				\
+		__PCPU_GPRS_END						\
+		: [gprs] "=m" (__ti->pcpu_gprs),			\
+		  [off] "=&r" (__off), [addr] "=&r" (__addr)		\
+		: [pcpu_offset] "m" (__ti->pcpu_offset),		\
+		  [pcp] "r" (pcp), [val] "r" ((u##sz)val)		\
+		: "memory");						\
+}
+
+PERCPU_RW_OPS("lbu", "sb", 8)
+PERCPU_RW_OPS("lhu", "sh", 16)
+
+#ifdef CONFIG_64BIT
+PERCPU_RW_OPS("lwu", "sw", 32)
+PERCPU_RW_OPS("ld", "sd", 64)
+#else
+PERCPU_RW_OPS("lw", "sw", 32)
+#endif
+
+#define _pcp_wrap(op, pcp, ...)						\
+({									\
+	op(&(pcp), __VA_ARGS__);					\
+})
+
+#define _pcp_wrap_return(op, pcp, args...)				\
+({									\
+	__auto_type __pcp_ptr = &(pcp);					\
+									\
+	(TYPEOF_UNQUAL(*__pcp_ptr))op(__pcp_ptr, ##args);		\
+})
+
+#define this_cpu_read_1(pcp)	_pcp_wrap_return(__percpu_read_8, pcp)
+#define this_cpu_read_2(pcp)	_pcp_wrap_return(__percpu_read_16, pcp)
+#define this_cpu_read_4(pcp)	_pcp_wrap_return(__percpu_read_32, pcp)
+
+#ifdef CONFIG_64BIT
+#define this_cpu_read_8(pcp)	_pcp_wrap_return(__percpu_read_64, pcp)
+#endif
+
+#define this_cpu_write_1(pcp, val)					\
+	_pcp_wrap(__percpu_write_8, pcp, (unsigned long)(val))
+#define this_cpu_write_2(pcp, val)					\
+	_pcp_wrap(__percpu_write_16, pcp, (unsigned long)(val))
+#define this_cpu_write_4(pcp, val)					\
+	_pcp_wrap(__percpu_write_32, pcp, (unsigned long)(val))
+
+#ifdef CONFIG_64BIT
+#define this_cpu_write_8(pcp, val)					\
+	_pcp_wrap(__percpu_write_64, pcp, (unsigned long)(val))
+#endif
+
+#undef PERCPU_RW_OPS
+#undef __PCPU_OP_CONTEXT
+
 #include <asm-generic/percpu.h>
 
 #endif /* __ASM_PERCPU_H */
-- 
2.39.5

