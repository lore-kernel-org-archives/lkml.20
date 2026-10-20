Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=207.46.229.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478523;
	b=ZSQAairoBdIN+8xgnbsl/z6sM3YwzWFNS0LyLN85au5KWglfJVAu1ydGB+9QosyOBkCL
	 fcgz61+JaBac/CHnS0CufbnDDlmA0e8dNn22bjV0zQnXf1z2TYci6pStJ/jGtY47V1uqk
	 oKuQ5LyQD6Zs9iGRk3+r5ilBwe3b2cD5xyyVhMRPuYRp28gcz6M/VRLUjj0AQathJOHps
	 cjdlOwURia49qDGmC/Z6Ox5VVhgpZgJ1wkAuptVBwHyNlI31m9/qd4RsfAfRlg0tFlOAc
	 LXs61u1Xjl2DCMSHVjNcYesVJYdari6W0r7CcMP9P6LRpjOk2CvetCax5r9zTOPRtCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478523;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=g497YcHdwz+Uww6diKBHY/t3LQwZXMZQtR2kJAxRvPE=;
	b=AsJRKzprG1M9TUI1Ul0vPF8BKJ08qVxCqGY/xlH3o95fgXgFPIJ6ywgl54BV3hND9mt3
	 /MbTtBndSckrj7ryg+iqpe0uel+nPB98GPN01BfA2YzCTrKpkHiLiDFfIGhqaDEXdS73o
	 Vqf+iHdyq9QXPB+9f+wD0FPCGBulwtrcLVJqh4B0QaPHvb/5VTLzJZNKAiaZCfn9UPATV
	 xl6jQzkQj98y/Yo3267zxoTsPMKGNLOhj2ycPWGCxUfe/kOk3rH5StYJWePTlizKV5puk
	 95Ap3EA/APLisMoSiCiO+OulBXxg6P540YLt3OijvjPO4V+DwG6LO8OG14FRz9yox/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=eswincomputing.com;
	spf=pass smtp.mailfrom=eswincomputing.com;
	arc=none smtp.remote-ip=207.46.229.174
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AF71606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AF71606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0002472LT.eswin.cn (unknown [10.12.96.78])
	by app1 (Coremail) with SMTP id TAJkCgDniXMgDddqfWGHAA--.19571S3;
	Tue, 20 Oct 2026 14:41:38 +0800 (CST)
From: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
To: Nam Cao <namcao@linutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Subject: [PATCH v4 1/2] riscv: kprobes: simulate nop and c.nop instructions
Date: Tue, 20 Oct 2026 14:41:35 +0800
Message-Id: <20261020064136.665-2-yuanxiaofeng@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20261020064136.665-1-yuanxiaofeng@eswincomputing.com>
References: <20261020064136.665-1-yuanxiaofeng@eswincomputing.com>
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
X-CM-TRANSID:TAJkCgDniXMgDddqfWGHAA--.19571S3
X-Coremail-Antispam: 1UD129KBjvJXoW3Wr43AryxXF1kXF48Xw45GFg_yoW7Xw48pa
	n0k3ZxKrWDWFs7Cr9xArs8ur4rtws5Kw43Ka1UJa15K3y7WryrZ3sagw43AF1DJFyFgry7
	KFyYvrykC343A37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPa14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWUAVWUtw
	CY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r
	43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
	WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU
	e5r4UUUUU
X-CM-SenderInfo: h1xd05xldrwv1qj6v25zlqu0xpsx3x1qjou0bp/1tbiAgEGE2rWRqodbgACs3

A kprobe or uprobe placed on a nop currently replays the instruction
out-of-line: the breakpoint trap runs the probe handler and redirects
execution to a copy of the instruction sitting in an XOL slot, and a
second breakpoint appended after the copy traps again to finish the
hit.  That costs an extra exception round-trip per hit; for uprobes
the slot runs in user mode, so the re-trap is a full
kernel<->userspace round-trip.

nop and c.nop have no architectural effect, so the replay can be
replaced by simply advancing the program counter when handling the
initial breakpoint, completing every hit within a single trap.
arm64 does the same in its probe-decode path, which is also shared
between kprobes and uprobes; see commit ac4ad5c09b34 ("arm64: insn:
Simulate nop instruction for better uprobe performance").

riscv_probe_decode_insn() is shared by kprobes and uprobes, so the
simulation applies to both.  It primarily matters for uprobes on
USDT probe sites: under the SystemTap SDT ABI (sys/sdt.h, parsed by
libbpf), the recorded probe location is by construction a plain nop
or c.nop, the same case that motivated the arm64 series.

Measured on QEMU (RISC-V virt, emulated): for a uprobe on a USDT
style nop site the per-hit cost drops by roughly 80 percent; for a
kprobe on a nop by roughly 40 percent.  On real arm64 hardware the
referenced commit measured ~2x.

Compile tested on RISC-V, and verified with the RISC-V kprobes
KUnit test which now covers nop and c.nop.

Signed-off-by: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Reviewed-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/include/asm/insn.h            |  7 +++++++
 arch/riscv/kernel/probes/decode-insn.c   |  6 ++++++
 arch/riscv/kernel/probes/simulate-insn.c | 14 ++++++++++++++
 arch/riscv/kernel/probes/simulate-insn.h |  2 ++
 4 files changed, 29 insertions(+)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index ad348d8b8..29a8a121e 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -228,6 +228,11 @@
 #define RVG_MASK_EBREAK		0xffffffff
 #define RVG_MASK_SRET		0xffffffff
 
+#define RVG_MATCH_NOP		0x00000013
+#define RVG_MASK_NOP		0xffffffff
+#define RVC_MATCH_C_NOP		0x0001
+#define RVC_MASK_C_NOP		0xffff
+
 #define __INSN_LENGTH_MASK	_UL(0x3)
 #define __INSN_LENGTH_GE_32	_UL(0x3)
 #define __INSN_OPCODE_MASK	_UL(0x7F)
@@ -262,6 +267,8 @@ __RISCV_INSN_FUNCS(c_ebreak, RVC_MASK_C_EBREAK, RVC_MATCH_C_EBREAK)
 __RISCV_INSN_FUNCS(ebreak, RVG_MASK_EBREAK, RVG_MATCH_EBREAK)
 __RISCV_INSN_FUNCS(sret, RVG_MASK_SRET, RVG_MATCH_SRET)
 __RISCV_INSN_FUNCS(fence, RVG_MASK_FENCE, RVG_MATCH_FENCE);
+__RISCV_INSN_FUNCS(nop, RVG_MASK_NOP, RVG_MATCH_NOP)
+__RISCV_INSN_FUNCS(c_nop, RVC_MASK_C_NOP, RVC_MATCH_C_NOP)
 
 /* special case to catch _any_ system instruction */
 static __always_inline bool riscv_insn_is_system(u32 code)
diff --git a/arch/riscv/kernel/probes/decode-insn.c b/arch/riscv/kernel/probes/decode-insn.c
index 433d9035b..e8888d3a4 100644
--- a/arch/riscv/kernel/probes/decode-insn.c
+++ b/arch/riscv/kernel/probes/decode-insn.c
@@ -44,5 +44,11 @@ riscv_probe_decode_insn(probe_opcode_t *addr, struct arch_probe_insn *api)
 	RISCV_INSN_SET_SIMULATE(auipc,		insn);
 	RISCV_INSN_SET_SIMULATE(branch,		insn);
 
+	/* Simulate NOP for better performance */
+	RISCV_INSN_SET_SIMULATE(nop,		insn);
+#ifdef CONFIG_RISCV_ISA_C
+	RISCV_INSN_SET_SIMULATE(c_nop,		insn);
+#endif
+
 	return INSN_GOOD;
 }
diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
index f8a2f6857..9a9b128d2 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -244,3 +244,17 @@ bool __kprobes simulate_c_beqz(u32 opcode, unsigned long addr, struct pt_regs *r
 {
 	return simulate_c_bnez_beqz(opcode, addr, regs, false);
 }
+
+bool __kprobes simulate_nop(u32 opcode, unsigned long addr, struct pt_regs *regs)
+{
+	instruction_pointer_set(regs, addr + 4);
+
+	return true;
+}
+
+bool __kprobes simulate_c_nop(u32 opcode, unsigned long addr, struct pt_regs *regs)
+{
+	instruction_pointer_set(regs, addr + 2);
+
+	return true;
+}
diff --git a/arch/riscv/kernel/probes/simulate-insn.h b/arch/riscv/kernel/probes/simulate-insn.h
index b89e1bb01..64e65e82a 100644
--- a/arch/riscv/kernel/probes/simulate-insn.h
+++ b/arch/riscv/kernel/probes/simulate-insn.h
@@ -30,5 +30,7 @@ bool simulate_c_jr(u32 opcode, unsigned long addr, struct pt_regs *regs);
 bool simulate_c_jalr(u32 opcode, unsigned long addr, struct pt_regs *regs);
 bool simulate_c_bnez(u32 opcode, unsigned long addr, struct pt_regs *regs);
 bool simulate_c_beqz(u32 opcode, unsigned long addr, struct pt_regs *regs);
+bool simulate_nop(u32 opcode, unsigned long addr, struct pt_regs *regs);
+bool simulate_c_nop(u32 opcode, unsigned long addr, struct pt_regs *regs);
 
 #endif /* _RISCV_KERNEL_PROBES_SIMULATE_INSN_H */
-- 
2.34.1

