Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDF5511E73
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059859; cv=none; b=bwjmNwKqG1zvUaOr4o/XV5ar87sSkRyZmrivbwR3Qlui703QctQ3dBijjE3Q4fs4/DyyFmRHmPxhv0yLgtZTdlM86JBk9HgacSZBer/M8P3YUofAnvOzEhWouD8rVH5PHv7kK6AlcdOV6o7gKvo5r/xtNbcninwQ0agd82VvPhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059859; c=relaxed/simple;
	bh=tFjb4WNGJXfXmi1JOlUjmfEpmnhqi7/JUuAvovYnQAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OKRDcKPTksS4VmjWu6pCvS3UrWMUPFIx15ioXhiKLQNzGTAxjJkRDYzW/+fTXYdudmPbFD5nshFkNyuWUTurj8N4h3cpq0UuMhL5EsHn6viHyn1DWYDkF+y0LgaZT5jDMug+J+I0nLqgXq/heXVfyPow0So3rWVnkzBrJN6T/ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DL+6WM+h; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DL+6WM+h"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6acba4bf65eso6680704a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792059852; x=1792664652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hEIHx/GPAzOwioEMBa/gwWEJDDSuySiQ6qW5+XvxvMg=;
        b=DL+6WM+hqxCOb9mSkbzhk5b/LU88qiNHAquc6UjCWSmfg1NDM8K+hTLZO6P7nFyGLZ
         pChg94X2hjGr1T9wk9P5UecTlo/LG/dMDpE2SFWnKPmRZou+Za9GKp1z+zvq9cGbdzT8
         /CcVfluU4cXxKdZ54aYuUawIJ81t4UFKSw5/OUsXUS4xOVu1+j+grHqwL3AAOjekrCva
         mIJoc3+zmVfUBmfJs7D9IgN9ckL7cEvzAd65i4WkwqALeCcPXwIE0SDWjBPJrVDGCRKn
         EHAN+KM+wfZZFlBQD69jhcw/6WKC5/Hr8AmjbtESkIAyI8Zx0IO/M5/pJ9YPOrphuPP1
         UPdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059852; x=1792664652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hEIHx/GPAzOwioEMBa/gwWEJDDSuySiQ6qW5+XvxvMg=;
        b=vHbWd+KQE3finHrDT4rd7WUewiZn8BwOl6D6IAwfcxIf+P52lPdpJJg44GVTdFjfJ1
         9vqPKutpBIyogiMiq1fXBWtkxoxap1WQE4Xd5nmsIwLIMh1HxqnHlXrvLFowIOU4/Ime
         jDt3IdBhGSVC9yrERnwMONC/T6YFO5O3IBjDSnbaxeKg10AJzkV4T6gazEdjButyd2Sn
         Q1USdVpglcSkftGOTox5WzfpHYbnzDKHxCClPZlg2MmN0i8cQe54Fb43rxXlQjFGBiIl
         nSFcADDHegQoMlVHHBSQkCzCFX3vSlY6XxumJNupBGkVXNqkRxYR8ndk4kiFBvSFurFF
         FRRA==
X-Forwarded-Encrypted: i=1; AKwUvBySdiwvz32vVxc9ct0Jg0W4hONnWvSYkl4HHKC3CivTugJ4E0soxwU+xnXuR24eC8tmrZzPGmx1sa8yb7s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMF/Ea1V5zTrjDv9gps4VcpoxYtOKMCHtDvN1wMnRRoWTDw6wG
	cLFgkV92SV/EAZBExiUdFxLF/WY44ewftTr9SRf1gg3ZctmNVY0hJXphOHz3bCVB
X-Gm-Gg: AYBFou3Y8eQVcbC/TnW4+U5h7RyaRoy9MMwxwAd2wyCIoya6PbVdF+QDRziOR7d07l6
	m85hHZohB8+w6CRx7eBTgtjWVQ0liHEomlzhEEOiYB21MaKoLw9+Cv0acUcIGPz/ygqp5IeF2KQ
	lUIz5tX/o4K5JJSxmV+qgwnhBdlY1+ZMUS535BqQ6azMrTwZGPF0q4h6kpf6J7EP6Erbepi2lzh
	oqEq1ulTG3e4tgZpdfyY+au8fCjfJnCEQcdb3OtRIVfIRpw568rsfy4Aam4qQYt3A1X78fbIK3j
	Rejc5eG488vyCVONEYAPylyvVNStE0h3lWvZWvj1cOhLtIlNFQIZzuhUYKBKjRM90dVJuIn7PPt
	1uW3C4Wx54YgfDhHzMMZ4KsMhY4JbqXQ2OtCV56fBOimlSEtX7B/sXWwiW97j+I3gj/1H9Du7SC
	we7FspMEeBKSfF3WH1YebY/AI1O4FOOXes1cmrOaIozWTGRfc0SVOgMuIaeoA9NUH+kF8tRQehd
	oCOgMiIYMg7MqL6xm5xV0GgBEqA5A9fS8waW8Pl
X-Received: by 2002:a17:907:7b8a:b0:c2e:1b4d:e9e9 with SMTP id a640c23a62f3a-c31a9f6ade4mr1680050166b.30.1792059851989;
        Thu, 15 Oct 2026 03:24:11 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3edab13f4esm108371766b.87.2026.10.15.03.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:24:11 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v8 4/6] alpha: decode and acknowledge Tsunami system machine checks
Date: Thu, 15 Oct 2026 12:22:53 +0200
Message-ID: <20261015102353.999695-5-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015102353.999695-1-linmag7@gmail.com>
References: <20261015102353.999695-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Decode PCI and ECC transactions separately, honor invalid transaction
information, and select Pchip errors using the logout summary. Report
master aborts without importing Titan-specific dismissal policy.
Delegate processor vectors to the bounded EV6 decoder.

On system vectors 660/620, capture live PERROR and MISC before acknowledging
their defined W1C bits and report live status absent from the saved frame.
Leave live chipset registers alone on CPU and environmental vectors:
HRM 10.2.5.6 warns that PERROR can have INV set before the error reaches
DRIR. Consuming that state from a CPU vector could lose the transaction
and its pending system-error notification.

Leave PERRMASK as configured by firmware. HRM 10.2.5.7 says a cleared mask
bit prevents the corresponding PERROR bit from being set, including by
PERRSET. Table 10-43 gives a reset value of zero, so this reporting depends
on firmware enabling the errors; changing masks does not establish that
previously latched state is cleared. Table 10-42 marks PERROR bit 9 reserved
(MBZ/RAZ); remove the obsolete RTO definition and reserve its bitfield.

Use the system vector and frame bounds without restricting the reason
code to the ES40 values. Preserve invalid frames and unknown environmental
layouts in bounded raw dumps. Print CPU registers for uncorrectable system
errors, including the PC needed to diagnose NXM. Gate correctable system
register dumps on CONFIG_VERBOSE_MCHECK and alpha_verbose_mcheck while
retaining their error decode.

Keep transaction information unavailable whenever SERR is set, as required
by HRM 8.8.2.6. Table 10-42 selects ECC fields for CRE/UECC. The first error
freezes PERROR and only LOST can be set afterwards, so mixed error bits
were detected together.

The expected-probe path has no active Tsunami writer. Reporting and
acknowledgment do not establish recovery; panic policy remains separate.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Matt Turner <mattst88@gmail.com>
---
Changes since v7:
- Restrict live chipset reads, W1C acknowledgments and live-status reporting
  to system vectors 660/620. CPU and environmental vectors leave them alone.
- Correct the mixed-error comment: first-error freeze means mixed error
  bits were detected together; only LOST can be set afterwards.
- Remove the detached PERRMASK comment and add Matt Turner's Reviewed-by.
- Document the firmware dependency. Both ES40 Pchips read PERRMASK
  0x0000000000000ff7 under the v7 console-test kernel (read-only check).

 arch/alpha/include/asm/core_tsunami.h |   3 +-
 arch/alpha/kernel/Makefile            |   2 +-
 arch/alpha/kernel/err_tsunami.c       | 254 ++++++++++++++++++++++++--
 3 files changed, 238 insertions(+), 21 deletions(-)

diff --git a/arch/alpha/include/asm/core_tsunami.h b/arch/alpha/include/asm/core_tsunami.h
index fe3fd4570fac..5c5d3ff849ed 100644
--- a/arch/alpha/include/asm/core_tsunami.h
+++ b/arch/alpha/include/asm/core_tsunami.h
@@ -105,7 +105,6 @@ extern int TSUNAMI_bootcpu;
 #define perror_m_ta 0x40
 #define perror_m_rdpe 0x80
 #define perror_m_nds 0x100
-#define perror_m_rto 0x200
 #define perror_m_uecc 0x400
 #define perror_m_cre 0x800
 #define perror_m_addrl 0xFFFFFFFF0000UL
@@ -123,7 +122,7 @@ union TPchipPERROR {
 		unsigned perror_v_ta : 1;
 		unsigned perror_v_rdpe : 1;
 		unsigned perror_v_nds : 1;
-		unsigned perror_v_rto : 1;
+		unsigned perror_v_reserved : 1; /* PERROR<9>: MBZ, RAZ */
 		unsigned perror_v_uecc : 1;
 		unsigned perror_v_cre : 1;                 
 		unsigned perror_v_rsvd1 : 4;
diff --git a/arch/alpha/kernel/Makefile b/arch/alpha/kernel/Makefile
index a453e487b9d0..0178f6a5bdb8 100644
--- a/arch/alpha/kernel/Makefile
+++ b/arch/alpha/kernel/Makefile
@@ -89,6 +89,6 @@ obj-$(CONFIG_ALPHA_MARVEL)	+= err_ev7.o err_marvel.o
 obj-$(CONFIG_ALPHA_NAUTILUS)	+= err_ev6.o
 obj-$(CONFIG_ALPHA_TITAN)	+= err_ev6.o err_titan.o
 
-obj-$(CONFIG_ALPHA_TSUNAMI)	+= err_tsunami.o
+obj-$(CONFIG_ALPHA_TSUNAMI)	+= err_ev6.o err_tsunami.o
 
 endif # GENERIC
diff --git a/arch/alpha/kernel/err_tsunami.c b/arch/alpha/kernel/err_tsunami.c
index 1045b920fa6b..03080d219cde 100644
--- a/arch/alpha/kernel/err_tsunami.c
+++ b/arch/alpha/kernel/err_tsunami.c
@@ -1,5 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
-/* Machine check handling for Tsunami/Typhoon systems. */
+/*
+ * Machine check handling for Tsunami/Typhoon systems.
+ * Author: Magnus Lindholm <linmag7@gmail.com>
+ * Based on Titan error handling by Jeff Wiedemeier (Compaq).
+ * Register definitions: 21272 Hardware Reference Manual, revision 4.0.
+ */
 #include <linux/init.h>
 #include <linux/pci.h>
 #include <linux/sched.h>
@@ -12,36 +17,249 @@
 #include "proto.h"
 #include "pci_impl.h"
 
-static inline void
-tsunami_pci_clr_err_1(tsunami_pchip *pchip)
+#define TSUNAMI_PERROR_ERRMASK	0xdffUL
+#define TSUNAMI_PERROR_ECCMASK	(perror_m_uecc | perror_m_cre)
+#define TSUNAMI_PERROR_INV	(1UL << 51)
+#define TSUNAMI_MISC_NXM		(1UL << 28)
+
+static int
+tsunami_frame_valid(struct el_common *header, size_t size)
 {
-	pchip->perror.csr;
-	pchip->perror.csr = 0x040;
+	return !((header->sys_offset | header->size) & 7) &&
+	       header->sys_offset >= sizeof(*header) &&
+	       header->sys_offset <= header->size &&
+	       size <= header->size - header->sys_offset;
+}
+
+static int
+tsunami_parse_p_perror(int which, u64 perror, int print)
+{
+	static const char * const errors[] = {
+		"Lost error", "SERR asserted", "PERR asserted",
+		"Delayed-completion retry timeout", "Invalid scatter-gather PTE",
+		"Address parity error", "Target abort", "Read data parity error",
+		"No DEVSEL (master abort)", NULL,
+		"Uncorrectable ECC error", "Correctable ECC error"
+	};
+	static const char * const pci_cmd[] = {
+		"Interrupt acknowledge", "Special cycle", "I/O read", "I/O write",
+		"Reserved", "Reserved", "Memory read", "Memory write",
+		"Reserved", "Reserved", "Configuration read", "Configuration write",
+		"Memory read multiple", "Dual address cycle",
+		"Memory read line", "Memory write and invalidate"
+	};
+	unsigned long addr;
+	unsigned int cmd;
+	int i;
+
+	if (!(perror & TSUNAMI_PERROR_ERRMASK))
+		return MCHK_DISPOSITION_UNKNOWN_ERROR;
+	/* Do not import Titan's BIOS master-abort dismissal policy. */
+	if (!print)
+		return MCHK_DISPOSITION_REPORT;
+
+	printk("%s  Pchip %d PERROR: %016llx\n", err_print_prefix, which, perror);
+	for (i = 0; i < ARRAY_SIZE(errors); i++)
+		if ((perror & TSUNAMI_PERROR_ERRMASK & (1UL << i)) && errors[i])
+			printk("%s    %s\n", err_print_prefix, errors[i]);
+
+	/*
+	 * INV invalidates SYN, CMD and ADDR. HRM 8.8.2.6 leaves command/address
+	 * undefined whenever SERR is set, including with other error bits.
+	 */
+	if (perror & (TSUNAMI_PERROR_INV | perror_m_serr)) {
+		printk("%s    Transaction information unavailable\n", err_print_prefix);
+		return MCHK_DISPOSITION_REPORT;
+	}
+	cmd = (perror & perror_m_cmd) >> 52;
+	/*
+	 * Table 10-42 selects the ECC fields whenever CRE or UECC is set.
+	 * The first error freezes PERROR (10.2.5.6); mixed error bits were
+	 * detected together. Only LOST can be set afterwards.
+	 */
+	if (perror & TSUNAMI_PERROR_ECCMASK) {
+		const char *command = "Reserved";
+
+		if (cmd == 0)
+			command = "DMA read";
+		else if (cmd == 1)
+			command = "DMA RMW";
+		else if (cmd == 3)
+			command = "SGTE read";
+		addr = ((perror >> 19) & 0xffffffffUL) << 3;
+		printk("%s    Command: %s (%x), syndrome: %02llx\n",
+		       err_print_prefix, command, cmd, (perror & perror_m_syn) >> 56);
+		printk("%s    System address: %lx\n", err_print_prefix, addr);
+	} else {
+		addr = ((perror >> 18) & 0x3fffffffUL) << 2;
+		/* SGE captures only PCI address bits <31:13> (8KB page). */
+		if (perror & perror_m_sge)
+			addr &= ~0x1fffUL;
+		printk("%s    Command: %s (%x), PCI address: %lx%s\n",
+		       err_print_prefix, pci_cmd[cmd], cmd, addr,
+		       (perror & perror_m_sge) ? " (8KB page)" : "");
+		if (perror & (1UL << 17))
+			printk("%s    Monster window\n", err_print_prefix);
+		else if (perror & (1UL << 16))
+			printk("%s    DAC scatter-gather window 3\n", err_print_prefix);
+	}
+	return MCHK_DISPOSITION_REPORT;
+}
+
+/* SESF bits 0/1 identify PCI errors, bit 2 covers ECC on either Pchip/CPU. */
+static u64
+tsunami_pchip_error(struct el_TSUNAMI_sysdata_mcheck *frame, int which)
+{
+	u64 perror = which ? frame->p1_perror : frame->p0_perror;
+
+	if (frame->sesf & (1UL << which))
+		return perror;
+	if ((frame->sesf & 4) && (perror & TSUNAMI_PERROR_ECCMASK))
+		return perror;
+	return 0;
+}
+
+static struct el_TSUNAMI_sysdata_mcheck *
+tsunami_system_frame(struct el_common *header)
+{
+	if (!tsunami_frame_valid(header, sizeof(struct el_TSUNAMI_sysdata_mcheck)))
+		return NULL;
+	return (void *)header + header->sys_offset;
+}
+
+static int
+tsunami_process_logout_frame(struct el_common *header, int print)
+{
+	struct el_TSUNAMI_sysdata_mcheck *frame = tsunami_system_frame(header);
+	int status = MCHK_DISPOSITION_UNKNOWN_ERROR;
+	int i;
+
+	if (!frame) {
+		if (print) {
+			printk("%s  Invalid Tsunami system frame; raw frame follows\n",
+			       err_print_prefix);
+			mchk_dump_logout_frame_raw(header);
+		}
+		return MCHK_DISPOSITION_UNKNOWN_ERROR;
+	}
+	if (print)
+		printk("%s  SESF: %016llx DIR: %016llx MISC: %016llx\n",
+		       err_print_prefix, frame->sesf, frame->dir, frame->misc);
+	if (frame->misc & TSUNAMI_MISC_NXM) {
+		status = MCHK_DISPOSITION_REPORT;
+		if (print)
+			printk("%s  Non-existent memory, NXS: %llu\n",
+			       err_print_prefix, (frame->misc >> 29) & 7);
+	}
+	for (i = 0; i < 2; i++)
+		status |= tsunami_parse_p_perror(i, tsunami_pchip_error(frame, i), print);
+	return status;
+}
+
+struct tsunami_error_state {
+	u64 perror[2];
+	u64 misc;
+};
+
+static void
+tsunami_ack_pchip(tsunami_pchip *pchip, u64 perror)
+{
+	if (!(perror & TSUNAMI_PERROR_ERRMASK))
+		return;
+	pchip->perror.csr = perror & TSUNAMI_PERROR_ERRMASK;
+	/* Complete the W1C write before releasing the logout frame. */
 	mb();
 	pchip->perror.csr;
 }
 
-static inline void
-tsunami_pci_clr_err(void)
+static void
+tsunami_clear_errors(struct tsunami_error_state *state)
+{
+	bool pchip1 = TSUNAMI_cchip->csc.csr & (1UL << 14);
+
+	/* Preserve each chip's transaction and the NXM source before clearing. */
+	state->perror[0] = TSUNAMI_pchip0->perror.csr;
+	state->perror[1] = pchip1 ? TSUNAMI_pchip1->perror.csr : 0;
+	state->misc = TSUNAMI_cchip->misc.csr;
+
+	tsunami_ack_pchip(TSUNAMI_pchip0, state->perror[0]);
+	/* Do not access the second Pchip on single-Pchip systems. */
+	if (pchip1)
+		tsunami_ack_pchip(TSUNAMI_pchip1, state->perror[1]);
+	if (state->misc & TSUNAMI_MISC_NXM) {
+		/* Zero writes leave the other MISC fields unchanged. */
+		TSUNAMI_cchip->misc.csr = TSUNAMI_MISC_NXM;
+		/* Complete the NXM acknowledgment before releasing the frame. */
+		mb();
+		TSUNAMI_cchip->misc.csr;
+	}
+}
+
+static void
+tsunami_report_live_errors(struct tsunami_error_state *state,
+			  struct el_TSUNAMI_sysdata_mcheck *frame)
 {
-	tsunami_pci_clr_err_1(TSUNAMI_pchip0);
+	int i;
 
-	/* TSUNAMI and TYPHOON can have 2, but might only have 1 (DS10) */
-	if (TSUNAMI_cchip->csc.csr & 1L<<14)
-		tsunami_pci_clr_err_1(TSUNAMI_pchip1);
+	/* PALcode's frame may predate these errors, or describe another chip. */
+	for (i = 0; i < 2; i++) {
+		if (!(state->perror[i] & TSUNAMI_PERROR_ERRMASK) ||
+		    (frame && state->perror[i] == tsunami_pchip_error(frame, i)))
+			continue;
+		printk("%s  Live Pchip status before acknowledgment:\n", err_print_prefix);
+		tsunami_parse_p_perror(i, state->perror[i], 1);
+	}
+	if ((state->misc & TSUNAMI_MISC_NXM) &&
+	    (!frame || ((state->misc ^ frame->misc) & (0xfUL << 28))))
+		printk("%s  Live MISC: %016llx, non-existent memory, NXS: %llu\n",
+		       err_print_prefix, state->misc, (state->misc >> 29) & 7);
 }
 
 void
 tsunami_machine_check(unsigned long vector, unsigned long la_ptr)
 {
-	/* Clear error before any reporting.  */
+	struct el_common *header = (void *)la_ptr;
+	struct el_TSUNAMI_sysdata_mcheck *frame = NULL;
+	struct tsunami_error_state live;
+	char *saved_err_prefix = err_print_prefix;
+	bool show_regs = vector == SCB_Q_SYSMCHK;
+
+	/* Synchronize pending accesses before inspecting the chipset. */
 	mb();
-	mb();  /* magic */
-	draina();
-	tsunami_pci_clr_err();
-	wrmces(0x7);
 	mb();
+	draina();
+	/* CPU/event vectors must not consume a pending Pchip system error. */
+	if (vector == SCB_Q_SYSMCHK || vector == SCB_Q_SYSERR) {
+		tsunami_clear_errors(&live);
+		frame = tsunami_system_frame(header);
+	}
+
+#ifdef CONFIG_VERBOSE_MCHECK
+	show_regs |= alpha_verbose_mcheck != 0;
+#endif
+	err_print_prefix = KERN_CRIT;
+	if (vector == SCB_Q_SYSMCHK || vector == SCB_Q_SYSERR) {
+		printk("%sSystem %s error (vector %lx, code %x) on CPU %d:\n",
+		       err_print_prefix, vector == SCB_Q_SYSERR ? "correctable" :
+		       "uncorrectable", vector, header->code, smp_processor_id());
+		tsunami_process_logout_frame(header, 1);
+		if (show_regs)
+			dik_show_regs(get_irq_regs(), NULL);
+		tsunami_report_live_errors(&live, frame);
+	} else if (vector == SCB_Q_SYSEVENT) {
+		printk("%sTsunami environmental event (code %x): layout unknown\n",
+		       err_print_prefix, header->code);
+		mchk_dump_logout_frame_raw(header);
+	}
+	err_print_prefix = saved_err_prefix;
 
-	process_mcheck_info(vector, la_ptr, "TSUNAMI",
-			    mcheck_expected(smp_processor_id()));
+	if (vector != SCB_Q_SYSMCHK && vector != SCB_Q_SYSERR &&
+	    vector != SCB_Q_SYSEVENT) {
+		/* EV6 decoding also releases the logout frame. */
+		ev6_machine_check(vector, la_ptr);
+	} else {
+		wrmces(0x7);
+		/* Complete acknowledgment before resuming. */
+		mb();
+	}
 }
-- 
2.43.0

