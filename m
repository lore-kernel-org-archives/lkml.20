Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794135921;
	b=w73GzdDB0dH21xit6o8Qlzfs28SIvbdelyeEDW5qi0FsunCPTyNB4fZQ0BhsTskO+uws
	 9bO5ujjXubkpqD7iMj56bxL7TOTLdT+Rww4xXY5EctO9N5+dPm5MSazhfHdMk6AjQyPna
	 4SSfFkdvkbrvL3oRroD5LIMnFA6tJ9/EBeMPtuZGdtBEtrgwGJgRxrFJgsbzLGZhPaA3s
	 YkJkpeyTs2AbqwnUvjSg6ajCX6fWJ+2pbIjbJtTaj6RBbLA02bCGAVmDEKF12ULDItbdf
	 hKygOqdUxou/eycM30BuEOAML21CpdVrTW6Mrj2n3SvE1z9ETyfjQWttBz8U5/PpS2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794135921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UknItJXowOcjQfrYZmm9v6E5iZPTnDdyntGmdyqaylQ=;
	b=QCvlYq7qzetw/NQAeM1I5Bu1Bg7Z6D61VDM3lrl3K8hS+E26gPfJVy3+HF+RyLVwh1hF
	 LUjYl92Y469oGL/iCin/csHd/tHlIsfhEcpX8gWHpyGtrrR4+DroIEUP2d1VK1Pg82g7N
	 wipdx67Ch1TczuZx/iw61y2EEuT1w5DKHA5t2yrMOTVEHZ8s7M11GgyK17dw7+TZgavTw
	 8h+vbC5j38S72P5FLgWKQjffFurxfxczbEy2SumOBo+JwDSsuAGPI5O5X1XRWeQB6SnDL
	 CgEFk7dXuvPOAw5esnosf+QvDztlucgNyzRNiSJRBPCHA2KIA7PSsALG9W1pF+mL17w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=X8RG1YEQ;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9057B606A32A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 11:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9057B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=X8RG1YEQ
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdab9e9761cso3889a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 03:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794135920; x=1794740720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UknItJXowOcjQfrYZmm9v6E5iZPTnDdyntGmdyqaylQ=;
        b=X8RG1YEQHmGAZM/Jv48JSZs3BEY/Tko/9y54MRkbchXqmp3AU4CFUZOFZ8iaO+1nP/
         JMkF6xu0vSGmnqg9asKzumEsYp7fSGttJPyZRj4ZOe1aM0QpyuUBsPtnKovH+NzztAlP
         nW+EEUsT/nXkTx74mnV3rmiaKn8ql5uGrH/HW5/oj4VN+SXNFeptOsXdFFl/0lB8JdEe
         vKVOnA5b1yutDVMH7UCYIbd79nSxnEJjIWfb1V+c9HB0mufSCFrRrvKXj1YSW09vqgOo
         GnhlKAvfJHqnFKmddpvZ/HgDP6sunqi/ozLYScs1JI8/2YdBVhA2NvJgEhhy8cwvLW3o
         GnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794135920; x=1794740720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UknItJXowOcjQfrYZmm9v6E5iZPTnDdyntGmdyqaylQ=;
        b=EKSEnc3cZGbOmfbVg+CCateu17DS7dJov3IHE/eg2bE3m+3/drzrorhpJ3bR/r+JiD
         D+kWI/6UDIstTZMZOelTPugBhkRvtx4ROZ+n6R7r21Zb5xqJnRS2tM5WRoonzKdMwO9I
         WKuJnOC4GRtZpT4YSrVcxl3YalLCNTzZyI8gOISGGA0JER/nDJrMYjXKy/wUiEFU5Nrk
         L0uHaclXztmn5UTwDNbderjE4htwUECMDd/XUAw7yDQsAgawd7FZhuWS4JeuN1PnrHsC
         8XFt9JjaQXNxNKBqjBpeA5N9xicyD5uUDrvZV9lUSXGXyd0GWsmtgn7bdWYD/aMb1RYl
         BXIw==
X-Forwarded-Encrypted: i=1; AL+hErHQRLt+ebYVezynv0G3e+SkS8RSR+OLc3KWLmfPoqW7twmmr3gZwlcxPq+8DbGvgFImO15AMtshpp7eKgs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CXSUNP7DdOP3FZo6/an0iyNxbHFtaQJI54OvuE637nV67i6gb
	nA+KRC87ebiMTB2AdVYpAxM+FE4OnIYz672J2TOWeMaIvqJYRvdnovg1A9kbzATxXMs=
X-Gm-Gg: AYBFou3hsVoKkyW1D1tAvli90LFSHtBf9YsHXu2r6F/ull+QDmV7t4c1svnl/i+0kb9
	4KtZ/NPCR0uv2FwJgtyiT8elGl0XxZlTC7is6rP3GJoEfaP3DFRYQ/xQ7MmHDo3GIOLOHZKk1SA
	asZ5FYKhXPWqla9AZ2IXC30uG46R3ezoFV2Ed3PzUigz2bx6rb3PzQL61nMq6fc/4x8cDIb6qtb
	cGy5qxUg3hHKBlTaen9B/TdCEiXrPyEP7xPaWAiQIOOIE4Jty2bCGuwmvgjO5WZS02HUFi4QTyY
	ZokmM7sJmKl2NMoLhaZfYZEurdI+Uv4vR+Y/f8JavHeGcFjEZVlO7zUmacZBU3LTkmWqjVm1TBc
	6CVp6dL/eDAdZ7f72iDwVUdM8+6dkeuWRnb4iR1yLc4NTvx5w8PCa9/IITuT8zue5ZvhR03ROYU
	6Q7mpEkjPbByxQNk2PcTsWmKTugvnzbMbHo7mp79IbK3wHfRJbNj0BFQSowjhPyBYZuSgI1O60R
	nn+/eWcHAO+ydPprgpQxIdzwdnkX6zd58jX5Pq7kuEd29PRJ7gO+jr0MGx1JxHwEWhfCqFsUiaM
	2ptexXT0Kl8KIoYrIKfr+7Mv+5bMrvYraRfO1Kkhgt4MtngQsda5soaGkycUMmw=
X-Received: by 2002:a17:90b:39cc:b0:3a6:e901:e79b with SMTP id 98e67ed59e1d1-3b12d3e6f4dmr989964a91.15.1794135919750;
        Sun, 08 Nov 2026 03:05:19 -0800 (PST)
Received: from localhost.localdomain ([139.177.225.233])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1278918f4sm2609818a91.6.2026.11.08.03.05.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 03:05:18 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dennis@kernel.org,
	tj@kernel.org,
	cl@gentwo.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	bjorn@kernel.org,
	pulehui@huawei.com,
	puranjay@kernel.org,
	thuth@redhat.com,
	ajones@ventanamicro.com,
	ben.dooks@codethink.co.uk,
	rkrcmar@ventanamicro.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	conor.dooley@microchip.com,
	tglx@kernel.org,
	debug@rivosinc.com,
	seanwascoding@gmail.com,
	andybnac@gmail.com,
	menglong8.dong@gmail.com,
	cyrilbur@tenstorrent.com,
	wangruikang@iscas.ac.cn,
	atishp@rivosinc.com,
	apatel@ventanamicro.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	bpf@vger.kernel.org,
	arnd@arndb.de,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	qingfang.deng@siflower.com.cn,
	linux-arch@vger.kernel.org,
	llvm@lists.linux.dev,
	dave@stgolabs.net,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	broonie@kernel.org,
	cuiyunhui@bytedance.com
Subject: [PATCH v9 1/3] riscv: implement this_cpu operations
Date: Sun,  8 Nov 2026 19:04:04 +0800
Message-Id: <20261108110406.97495-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20261108110406.97495-1-cuiyunhui@bytedance.com>
References: <20261108110406.97495-1-cuiyunhui@bytedance.com>
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

RISC-V has no asm/percpu.h, so this_cpu_*() read-modify-write
operations use generic implementations that disable local interrupts.

Implement RISC-V-specific this_cpu operations with preemption disabled
to keep accesses on the current CPU. Native-width read-modify-write
operations use relaxed AMOs, while 8-bit and 16-bit read-modify-write
operations use Zabha when available or a local 32-bit LR/SC sequence
otherwise.

Link: https://lore.kernel.org/r/20260826010748.zphu3wh2hlm4t4o2@offworld
Tested-by: Davidlohr Bueso <dave@stgolabs.net>
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/percpu.h | 569 ++++++++++++++++++++++++++++++++
 1 file changed, 569 insertions(+)
 create mode 100644 arch/riscv/include/asm/percpu.h

diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/percpu.h
new file mode 100644
index 0000000000000..280b122b9fe69
--- /dev/null
+++ b/arch/riscv/include/asm/percpu.h
@@ -0,0 +1,569 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifndef __ASM_PERCPU_H
+#define __ASM_PERCPU_H
+
+#include <linux/bits.h>
+#include <linux/preempt.h>
+
+#include <asm/alternative-macros.h>
+#include <asm/cmpxchg.h>
+#include <asm/cpufeature-macros.h>
+#include <asm/hwcap.h>
+#include <asm/irqflags.h>
+
+#define PERCPU_RW_OPS(sz)						\
+static inline unsigned long __percpu_read_##sz(void *ptr)		\
+{									\
+	return READ_ONCE(*(u##sz *)ptr);				\
+}									\
+									\
+static inline void __percpu_write_##sz(void *ptr, unsigned long val)	\
+{									\
+	WRITE_ONCE(*(u##sz *)ptr, (u##sz)val);				\
+}
+
+PERCPU_RW_OPS(8)
+PERCPU_RW_OPS(16)
+PERCPU_RW_OPS(32)
+
+#ifdef CONFIG_64BIT
+PERCPU_RW_OPS(64)
+#endif
+
+/*
+ * Use a real destination register instead of x0 even when the result is
+ * unused. Implementations may execute rd=x0 AMOs at a memory controller
+ * without returning the old value to the CPU. Value-returning AMOs are
+ * more likely to execute near the CPU, for example in the L1 cache. This
+ * better suits per-CPU data, which is typically accessed repeatedly by
+ * the same CPU.
+ *
+ * https://lore.kernel.org/r/e7d539ed-ced0-4b96-8ecd-048a5b803b85@paulmck-laptop
+ */
+#define __PERCPU_AMO_OP_CASE(sfx, name, sz, amo_insn)			\
+static inline void							\
+__percpu_##name##_amo_case_##sz(void *ptr, unsigned long val)		\
+{									\
+	u##sz tmp;							\
+									\
+	asm volatile (							\
+		"amo" #amo_insn #sfx " %[tmp], %[val], %[ptr]"	\
+		: [ptr] "+A" (*(u##sz *)ptr), [tmp] "=r" (tmp)	\
+		: [val] "r" ((u##sz)(val)));				\
+}
+
+__PERCPU_AMO_OP_CASE(.w, add, 32, add)
+__PERCPU_AMO_OP_CASE(.w, and, 32, and)
+__PERCPU_AMO_OP_CASE(.w, or, 32, or)
+
+#ifdef CONFIG_64BIT
+__PERCPU_AMO_OP_CASE(.d, add, 64, add)
+__PERCPU_AMO_OP_CASE(.d, and, 64, and)
+__PERCPU_AMO_OP_CASE(.d, or, 64, or)
+#endif
+
+static inline u32 __percpu_add_return_amo_case_32(void *ptr, unsigned long val)
+{
+	register u32 ret;
+
+	asm volatile ("amoadd.w %[ret], %[val], %[ptr]"
+		: [ptr] "+A" (*(u32 *)ptr), [ret] "=r" (ret)
+		: [val] "r" ((u32)(val)));
+
+	return ret + val;
+}
+
+#ifdef CONFIG_64BIT
+static inline u64 __percpu_add_return_amo_case_64(void *ptr, unsigned long val)
+{
+	register u64 ret;
+
+	asm volatile ("amoadd.d %[ret], %[val], %[ptr]"
+		: [ptr] "+A" (*(u64 *)ptr), [ret] "=r" (ret)
+		: [val] "r" ((u64)(val)));
+
+	return ret + val;
+}
+#endif
+
+#define PERCPU_8_16_GET_SHIFT(ptr)	(((unsigned long)(ptr) & 0x3) * BITS_PER_BYTE)
+#define PERCPU_8_16_GET_MASK(sz)	GENMASK((sz) - 1, 0)
+#define PERCPU_8_16_GET_PTR32(ptr)	((u32 *)((unsigned long)(ptr) & ~0x3))
+
+static inline void __percpu_add_amo_case_8(void *ptr, unsigned long val)
+{
+	u8 tmp;
+
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&
+	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZABHA)) {
+		asm volatile (".option push\n"
+			".option arch, +zabha\n"
+			"amoadd.b %[tmp], %[val], %[ptr]\n"
+			".option pop"
+			: [ptr] "+A" (*(u8 *)ptr), [tmp] "=r" (tmp)
+			: [val] "r" ((u8)(val & PERCPU_8_16_GET_MASK(8))));
+	} else {
+		u32 *ptr32 = PERCPU_8_16_GET_PTR32(ptr);
+		const unsigned long shift = PERCPU_8_16_GET_SHIFT(ptr);
+		const u32 mask = PERCPU_8_16_GET_MASK(8) << shift;
+		const u8 val_trunc = val & PERCPU_8_16_GET_MASK(8);
+		u32 old, new;
+		u8 field;
+
+		asm volatile ("0: lr.w %0, %2\n"
+			"and %3, %0, %4\n"
+			"srl %3, %3, %5\n"
+			"add %3, %3, %6\n"
+			"and %3, %3, %8\n"
+			"sll %3, %3, %5\n"
+			"and %1, %0, %7\n"
+			"or %1, %1, %3\n"
+			"sc.w %1, %1, %2\n"
+			"bnez %1, 0b\n"
+			: "=&r"(old), "=&r"(new), "+A"(*ptr32), "=&r"(field)
+			: "r"(mask), "r"(shift), "r"(val_trunc), "r"(~mask),
+			  "r"(PERCPU_8_16_GET_MASK(8)));
+	}
+}
+
+static inline void __percpu_add_amo_case_16(void *ptr, unsigned long val)
+{
+	u16 tmp;
+
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&
+	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZABHA)) {
+		asm volatile (".option push\n"
+			".option arch, +zabha\n"
+			"amoadd.h %[tmp], %[val], %[ptr]\n"
+			".option pop"
+			: [ptr] "+A" (*(u16 *)ptr), [tmp] "=r" (tmp)
+			: [val] "r" ((u16)(val & PERCPU_8_16_GET_MASK(16))));
+	} else {
+		u32 *ptr32 = PERCPU_8_16_GET_PTR32(ptr);
+		const unsigned long shift = PERCPU_8_16_GET_SHIFT(ptr);
+		const u32 mask = PERCPU_8_16_GET_MASK(16) << shift;
+		const u16 val_trunc = val & PERCPU_8_16_GET_MASK(16);
+		u32 old, new;
+		u16 field;
+
+		asm volatile ("0: lr.w %0, %2\n"
+			"and %3, %0, %4\n"
+			"srl %3, %3, %5\n"
+			"add %3, %3, %6\n"
+			"and %3, %3, %8\n"
+			"sll %3, %3, %5\n"
+			"and %1, %0, %7\n"
+			"or %1, %1, %3\n"
+			"sc.w %1, %1, %2\n"
+			"bnez %1, 0b\n"
+			: "=&r"(old), "=&r"(new), "+A"(*ptr32), "=&r"(field)
+			: "r"(mask), "r"(shift), "r"(val_trunc), "r"(~mask),
+			  "r"(PERCPU_8_16_GET_MASK(16)));
+	}
+}
+
+static inline void __percpu_and_amo_case_8(void *ptr, unsigned long val)
+{
+	u8 tmp;
+
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&
+	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZABHA)) {
+		asm volatile (".option push\n"
+			".option arch, +zabha\n"
+			"amoand.b %[tmp], %[val], %[ptr]\n"
+			".option pop"
+			: [ptr] "+A" (*(u8 *)ptr), [tmp] "=r" (tmp)
+			: [val] "r" ((u8)(val & PERCPU_8_16_GET_MASK(8))));
+	} else {
+		u32 *ptr32 = PERCPU_8_16_GET_PTR32(ptr);
+		const unsigned long shift = PERCPU_8_16_GET_SHIFT(ptr);
+		const u32 mask = PERCPU_8_16_GET_MASK(8) << shift;
+		const u8 val_trunc = val & PERCPU_8_16_GET_MASK(8);
+		u32 old, new;
+		u8 field;
+
+		asm volatile ("0: lr.w %0, %2\n"
+			"and %3, %0, %4\n"
+			"srl %3, %3, %5\n"
+			"and %3, %3, %6\n"
+			"and %3, %3, %8\n"
+			"sll %3, %3, %5\n"
+			"and %1, %0, %7\n"
+			"or %1, %1, %3\n"
+			"sc.w %1, %1, %2\n"
+			"bnez %1, 0b\n"
+			: "=&r"(old), "=&r"(new), "+A"(*ptr32), "=&r"(field)
+			: "r"(mask), "r"(shift), "r"(val_trunc), "r"(~mask),
+			  "r"(PERCPU_8_16_GET_MASK(8)));
+	}
+}
+
+static inline void __percpu_and_amo_case_16(void *ptr, unsigned long val)
+{
+	u16 tmp;
+
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&
+	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZABHA)) {
+		asm volatile (".option push\n"
+			".option arch, +zabha\n"
+			"amoand.h %[tmp], %[val], %[ptr]\n"
+			".option pop"
+			: [ptr] "+A" (*(u16 *)ptr), [tmp] "=r" (tmp)
+			: [val] "r" ((u16)(val & PERCPU_8_16_GET_MASK(16))));
+	} else {
+		u32 *ptr32 = PERCPU_8_16_GET_PTR32(ptr);
+		const unsigned long shift = PERCPU_8_16_GET_SHIFT(ptr);
+		const u32 mask = PERCPU_8_16_GET_MASK(16) << shift;
+		const u16 val_trunc = val & PERCPU_8_16_GET_MASK(16);
+		u32 old, new;
+		u16 field;
+
+		asm volatile ("0: lr.w %0, %2\n"
+			"and %3, %0, %4\n"
+			"srl %3, %3, %5\n"
+			"and %3, %3, %6\n"
+			"and %3, %3, %8\n"
+			"sll %3, %3, %5\n"
+			"and %1, %0, %7\n"
+			"or %1, %1, %3\n"
+			"sc.w %1, %1, %2\n"
+			"bnez %1, 0b\n"
+			: "=&r"(old), "=&r"(new), "+A"(*ptr32), "=&r"(field)
+			: "r"(mask), "r"(shift), "r"(val_trunc), "r"(~mask),
+			  "r"(PERCPU_8_16_GET_MASK(16)));
+	}
+}
+
+static inline void __percpu_or_amo_case_8(void *ptr, unsigned long val)
+{
+	u8 tmp;
+
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&
+	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZABHA)) {
+		asm volatile (".option push\n"
+			".option arch, +zabha\n"
+			"amoor.b %[tmp], %[val], %[ptr]\n"
+			".option pop"
+			: [ptr] "+A" (*(u8 *)ptr), [tmp] "=r" (tmp)
+			: [val] "r" ((u8)(val & PERCPU_8_16_GET_MASK(8))));
+	} else {
+		u32 *ptr32 = PERCPU_8_16_GET_PTR32(ptr);
+		const unsigned long shift = PERCPU_8_16_GET_SHIFT(ptr);
+		const u32 mask = PERCPU_8_16_GET_MASK(8) << shift;
+		const u8 val_trunc = val & PERCPU_8_16_GET_MASK(8);
+		u32 old, new;
+		u8 field;
+
+		asm volatile ("0: lr.w %0, %2\n"
+			"and %3, %0, %4\n"
+			"srl %3, %3, %5\n"
+			"or %3, %3, %6\n"
+			"and %3, %3, %8\n"
+			"sll %3, %3, %5\n"
+			"and %1, %0, %7\n"
+			"or %1, %1, %3\n"
+			"sc.w %1, %1, %2\n"
+			"bnez %1, 0b\n"
+			: "=&r"(old), "=&r"(new), "+A"(*ptr32), "=&r"(field)
+			: "r"(mask), "r"(shift), "r"(val_trunc), "r"(~mask),
+			  "r"(PERCPU_8_16_GET_MASK(8)));
+	}
+}
+
+static inline void __percpu_or_amo_case_16(void *ptr, unsigned long val)
+{
+	u16 tmp;
+
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&
+	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZABHA)) {
+		asm volatile (".option push\n"
+			".option arch, +zabha\n"
+			"amoor.h %[tmp], %[val], %[ptr]\n"
+			".option pop"
+			: [ptr] "+A" (*(u16 *)ptr), [tmp] "=r" (tmp)
+			: [val] "r" ((u16)(val & PERCPU_8_16_GET_MASK(16))));
+	} else {
+		u32 *ptr32 = PERCPU_8_16_GET_PTR32(ptr);
+		const unsigned long shift = PERCPU_8_16_GET_SHIFT(ptr);
+		const u32 mask = PERCPU_8_16_GET_MASK(16) << shift;
+		const u16 val_trunc = val & PERCPU_8_16_GET_MASK(16);
+		u32 old, new;
+		u16 field;
+
+		asm volatile ("0: lr.w %0, %2\n"
+			"and %3, %0, %4\n"
+			"srl %3, %3, %5\n"
+			"or %3, %3, %6\n"
+			"and %3, %3, %8\n"
+			"sll %3, %3, %5\n"
+			"and %1, %0, %7\n"
+			"or %1, %1, %3\n"
+			"sc.w %1, %1, %2\n"
+			"bnez %1, 0b\n"
+			: "=&r"(old), "=&r"(new), "+A"(*ptr32), "=&r"(field)
+			: "r"(mask), "r"(shift), "r"(val_trunc), "r"(~mask),
+			  "r"(PERCPU_8_16_GET_MASK(16)));
+	}
+}
+
+static inline u8 __percpu_add_return_amo_case_8(void *ptr, unsigned long val)
+{
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&
+	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZABHA)) {
+		register u8 ret;
+
+		asm volatile (".option push\n"
+			".option arch, +zabha\n"
+			"amoadd.b %[ret], %[val], %[ptr]\n"
+			".option pop"
+			: [ptr] "+A"(*(u8 *)ptr), [ret] "=r"(ret)
+			: [val] "r"((u8)(val & PERCPU_8_16_GET_MASK(8))));
+		return ret + (u8)(val & PERCPU_8_16_GET_MASK(8));
+	}
+
+	{
+		u32 *ptr32 = PERCPU_8_16_GET_PTR32(ptr);
+		const unsigned long shift = PERCPU_8_16_GET_SHIFT(ptr);
+		const u32 mask = PERCPU_8_16_GET_MASK(8) << shift;
+		const u32 inv_mask = ~mask;
+		const u8 val_trunc = val & PERCPU_8_16_GET_MASK(8);
+		u32 old, new, field;
+
+		asm volatile ("0: lr.w %0, %3\n"
+			"and %1, %0, %4\n"
+			"srl %1, %1, %5\n"
+			"add %1, %1, %6\n"
+			"and %1, %1, %7\n"
+			"sll %1, %1, %5\n"
+			"and %2, %0, %8\n"
+			"or %2, %2, %1\n"
+			"sc.w %2, %2, %3\n"
+			"bnez %2, 0b\n"
+			: "=&r"(old), "=&r"(field), "=&r"(new), "+A"(*ptr32)
+			: "r"(mask), "r"(shift), "r"(val_trunc),
+			  "r"(PERCPU_8_16_GET_MASK(8)), "r"(inv_mask));
+		return field >> shift;
+	}
+}
+
+static inline u16 __percpu_add_return_amo_case_16(void *ptr, unsigned long val)
+{
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&
+	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZABHA)) {
+		register u16 ret;
+
+		asm volatile (".option push\n"
+			".option arch, +zabha\n"
+			"amoadd.h %[ret], %[val], %[ptr]\n"
+			".option pop"
+			: [ptr] "+A"(*(u16 *)ptr), [ret] "=r"(ret)
+			: [val] "r"((u16)(val & PERCPU_8_16_GET_MASK(16))));
+		return ret + (u16)(val & PERCPU_8_16_GET_MASK(16));
+	}
+
+	{
+		u32 *ptr32 = PERCPU_8_16_GET_PTR32(ptr);
+		const unsigned long shift = PERCPU_8_16_GET_SHIFT(ptr);
+		const u32 mask = PERCPU_8_16_GET_MASK(16) << shift;
+		const u32 inv_mask = ~mask;
+		const u16 val_trunc = val & PERCPU_8_16_GET_MASK(16);
+		u32 old, new, field;
+
+		asm volatile ("0: lr.w %0, %3\n"
+			"and %1, %0, %4\n"
+			"srl %1, %1, %5\n"
+			"add %1, %1, %6\n"
+			"and %1, %1, %7\n"
+			"sll %1, %1, %5\n"
+			"and %2, %0, %8\n"
+			"or %2, %2, %1\n"
+			"sc.w %2, %2, %3\n"
+			"bnez %2, 0b\n"
+			: "=&r"(old), "=&r"(field), "=&r"(new), "+A"(*ptr32)
+			: "r"(mask), "r"(shift), "r"(val_trunc),
+			  "r"(PERCPU_8_16_GET_MASK(16)), "r"(inv_mask));
+		return field >> shift;
+	}
+}
+
+/*
+ * Put arch_cmpxchg_relaxed() behind a function boundary to isolate its macro
+ * locals from those at the call site. asm-generic implements
+ * this_cpu_try_cmpxchg_N() using this_cpu_cmpxchg_N() and a local named __old.
+ * RISC-V's _arch_cmpxchg() also declares __old, so expanding it in the caller's
+ * scope would turn its initializer into "__old = (__old)" and read the
+ * uninitialized inner variable.
+ *
+ * __always_inline avoids an out-of-line call.
+ * _pcp_protect_cmpxchg_return() provides the instrument_atomic_read_write()
+ * hook that cmpxchg_relaxed() would otherwise provide.
+ */
+#define PERCPU_CMPXCHG_OP(sz)						\
+static __always_inline unsigned long					\
+__percpu_cmpxchg_case_##sz(void *ptr, unsigned long old,		\
+			   unsigned long new)				\
+{									\
+	return arch_cmpxchg_relaxed((u##sz *)ptr, (u##sz)old,		\
+				    (u##sz)new);			\
+}
+
+PERCPU_CMPXCHG_OP(8)
+PERCPU_CMPXCHG_OP(16)
+PERCPU_CMPXCHG_OP(32)
+
+#ifdef CONFIG_64BIT
+PERCPU_CMPXCHG_OP(64)
+#endif
+
+#define _pcp_protect(op, pcp, ...)					\
+({									\
+	preempt_disable_notrace();					\
+	op(raw_cpu_ptr(&(pcp)), __VA_ARGS__);				\
+	preempt_enable_notrace();					\
+})
+
+#define _pcp_protect_return(op, pcp, args...)				\
+({									\
+	typeof(pcp) __retval;						\
+	preempt_disable_notrace();					\
+	__retval = (typeof(pcp))op(raw_cpu_ptr(&(pcp)), ##args);	\
+	preempt_enable_notrace();					\
+	__retval;							\
+})
+
+#define _pcp_protect_cmpxchg_return(op, pcp, old, new)			\
+({									\
+	typeof(pcp) __retval;						\
+	typeof(pcp) *__pcp_ptr;						\
+									\
+	preempt_disable_notrace();					\
+	__pcp_ptr = raw_cpu_ptr(&(pcp));				\
+	instrument_atomic_read_write(__pcp_ptr, sizeof(*__pcp_ptr));	\
+	__retval = (typeof(pcp))op(__pcp_ptr, (unsigned long)(old),	\
+				     (unsigned long)(new));		\
+	preempt_enable_notrace();					\
+	__retval;							\
+})
+
+#define this_cpu_read_1(pcp)		_pcp_protect_return(__percpu_read_8, pcp)
+#define this_cpu_read_2(pcp)		_pcp_protect_return(__percpu_read_16, pcp)
+#define this_cpu_read_4(pcp)		_pcp_protect_return(__percpu_read_32, pcp)
+
+#ifdef CONFIG_64BIT
+#define this_cpu_read_8(pcp)		_pcp_protect_return(__percpu_read_64, pcp)
+#endif
+
+#define this_cpu_write_1(pcp, val)	_pcp_protect(__percpu_write_8, pcp, (unsigned long)val)
+#define this_cpu_write_2(pcp, val)	_pcp_protect(__percpu_write_16, pcp, (unsigned long)val)
+#define this_cpu_write_4(pcp, val)	_pcp_protect(__percpu_write_32, pcp, (unsigned long)val)
+
+#ifdef CONFIG_64BIT
+#define this_cpu_write_8(pcp, val)	_pcp_protect(__percpu_write_64, pcp, (unsigned long)val)
+#endif
+
+#define this_cpu_add_1(pcp, val)	_pcp_protect(__percpu_add_amo_case_8, pcp, val)
+#define this_cpu_add_2(pcp, val)	_pcp_protect(__percpu_add_amo_case_16, pcp, val)
+#define this_cpu_add_4(pcp, val)	_pcp_protect(__percpu_add_amo_case_32, pcp, val)
+
+#ifdef CONFIG_64BIT
+#define this_cpu_add_8(pcp, val)	_pcp_protect(__percpu_add_amo_case_64, pcp, val)
+#endif
+
+#define this_cpu_add_return_1(pcp, val)		\
+_pcp_protect_return(__percpu_add_return_amo_case_8, pcp, val)
+
+#define this_cpu_add_return_2(pcp, val)		\
+_pcp_protect_return(__percpu_add_return_amo_case_16, pcp, val)
+
+#define this_cpu_add_return_4(pcp, val)		\
+_pcp_protect_return(__percpu_add_return_amo_case_32, pcp, val)
+
+#ifdef CONFIG_64BIT
+#define this_cpu_add_return_8(pcp, val)		\
+_pcp_protect_return(__percpu_add_return_amo_case_64, pcp, val)
+#endif
+
+#define this_cpu_and_1(pcp, val)	_pcp_protect(__percpu_and_amo_case_8, pcp, val)
+#define this_cpu_and_2(pcp, val)	_pcp_protect(__percpu_and_amo_case_16, pcp, val)
+#define this_cpu_and_4(pcp, val)	_pcp_protect(__percpu_and_amo_case_32, pcp, val)
+
+#ifdef CONFIG_64BIT
+#define this_cpu_and_8(pcp, val)	_pcp_protect(__percpu_and_amo_case_64, pcp, val)
+#endif
+
+#define this_cpu_or_1(pcp, val)	_pcp_protect(__percpu_or_amo_case_8, pcp, val)
+#define this_cpu_or_2(pcp, val)	_pcp_protect(__percpu_or_amo_case_16, pcp, val)
+#define this_cpu_or_4(pcp, val)	_pcp_protect(__percpu_or_amo_case_32, pcp, val)
+
+#ifdef CONFIG_64BIT
+#define this_cpu_or_8(pcp, val)	_pcp_protect(__percpu_or_amo_case_64, pcp, val)
+#endif
+
+#define this_cpu_xchg_1(pcp, val)	_pcp_protect_return(xchg_relaxed, pcp, val)
+#define this_cpu_xchg_2(pcp, val)	_pcp_protect_return(xchg_relaxed, pcp, val)
+#define this_cpu_xchg_4(pcp, val)	_pcp_protect_return(xchg_relaxed, pcp, val)
+
+#ifdef CONFIG_64BIT
+#define this_cpu_xchg_8(pcp, val)	_pcp_protect_return(xchg_relaxed, pcp, val)
+#endif
+
+#define this_cpu_cmpxchg_1(pcp, o, n)					\
+	_pcp_protect_cmpxchg_return(__percpu_cmpxchg_case_8, pcp, o, n)
+
+#define this_cpu_cmpxchg_2(pcp, o, n)					\
+	_pcp_protect_cmpxchg_return(__percpu_cmpxchg_case_16, pcp, o, n)
+
+#define this_cpu_cmpxchg_4(pcp, o, n)					\
+	_pcp_protect_cmpxchg_return(__percpu_cmpxchg_case_32, pcp, o, n)
+
+#ifdef CONFIG_64BIT
+#define this_cpu_cmpxchg_8(pcp, o, n)					\
+	_pcp_protect_cmpxchg_return(__percpu_cmpxchg_case_64, pcp, o, n)
+
+#define this_cpu_cmpxchg64(pcp, o, n)	this_cpu_cmpxchg_8(pcp, o, n)
+#endif
+
+#ifdef system_has_cmpxchg128
+static inline u128 __percpu_generic_cmpxchg128(void *ptr, u128 old_val,
+						      u128 new_val)
+{
+	unsigned long flags;
+	u128 *p = ptr;
+	u128 ret;
+
+	flags = arch_local_irq_save();
+	ret = *p;
+	if (ret == old_val)
+		*p = new_val;
+	arch_local_irq_restore(flags);
+
+	return ret;
+}
+
+#define this_cpu_cmpxchg128(pcp, o, n)					\
+({									\
+	u128 old__ = (o), new__ = (n), ret__;				\
+	typeof(pcp) *ptr__;						\
+									\
+	preempt_disable_notrace();					\
+	ptr__ = raw_cpu_ptr(&(pcp));					\
+	if (system_has_cmpxchg128())					\
+		ret__ = cmpxchg128_local(ptr__, old__, new__);		\
+	else								\
+		ret__ = __percpu_generic_cmpxchg128(ptr__, old__, new__); \
+	preempt_enable_notrace();					\
+	ret__;								\
+})
+#endif
+
+#undef PERCPU_RW_OPS
+#undef __PERCPU_AMO_OP_CASE
+#undef PERCPU_8_16_GET_SHIFT
+#undef PERCPU_8_16_GET_MASK
+#undef PERCPU_8_16_GET_PTR32
+#undef PERCPU_CMPXCHG_OP
+
+#include <asm-generic/percpu.h>
+
+#endif /* __ASM_PERCPU_H */

base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.39.5

