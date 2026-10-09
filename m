Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DC84DDB21
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791547099; cv=none; b=U2/0t6LILBv5L/dJvWMc1sef5+4cY2dkKxQUFvhNYQI2btnxTugY/+f310EXQbEDiwD5MtrpH0I5qMrzf0pF64Xynv7MugUlJL6k3FOrxd9rzfFf9ISubAWxliI24L0fXV02DHyUCGFV/EJ2QNEhQIP1ifQfG/s0Q1imQYeGHjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791547099; c=relaxed/simple;
	bh=L1vYNFeFmf5JUTVfd7b392d95BbI99zedYZGeakJIWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SWcm95PDq3Xo7QMsik/tRQeW3p3pEWm9w0MGHbTx+3hK8cP46+tHS9tspdeBDX8wSP672KwJXWCbcgN7qXOr2djRpnghgFcZb/ukPcYwyVq/y6cnln+7TSE1jO15h5caoHFmJ2QyfjbA5EjBkiADKajOqTcQn1R2fTl+ZDDZWQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KpU3rbCR; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KpU3rbCR"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2533d83e3bso647329866b.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 04:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791547089; x=1792151889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nun6+F2Y8xqR5BOMywtmRRYwT/lpAGiBrDd9nMKXk8M=;
        b=KpU3rbCRcSX0R1YuTWTl9tAUUPdzrfjtBrMs6el7dRWXGJrgrJuXWclubA+q0TdUHr
         ksycBA4TRZrLTEIrsnsn4fxBj9nfZYXefeKpNmJxraM+I2DGcZjkFEhmJGozWAh52bPR
         j6ZhLn2oLUamvNlh3XJxnnvilXxbGX6k41zxvuAsWBPJeJmhE7yFREP9/uP35GZbiVOT
         Q1+32u1UMJvKTFUrLibRH7zcWS21mTAyLv1mwYMJzoV47QCBOyaOVb+ZkH1NVHCg43cO
         L27OkVhd1UFR/uUtIJridl2I+z/O3QuiJv4KN0mHQD+K4qWOr6L+V2nQFaT+bRp3WxEI
         qrWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791547089; x=1792151889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nun6+F2Y8xqR5BOMywtmRRYwT/lpAGiBrDd9nMKXk8M=;
        b=0v7aWJBKZU90mSYt6v8852THKQywNyfyCwm5nchXnpaauZq+gaN6/GRWt0L8/ggHNb
         WiI/Zb4VqsDGWX4O1Juh2ZkTNdf7TXwNcJIpMDsLrftfEJbi8BnawRaRCWtU4X1WHxwF
         IvnbVgGALs/OYdoi8vWW+Ypcmpg8ZSVPy+HcC+RPZ5w1nUWf6qv5EpQp195C2pJLEN3B
         CW3konA4sLNLZlGwrhtc13BsBvRRDrF68sn6Np8bVJeLzL/TS/1xeAlKvWNdKDNwiG3g
         sVba9abeyKM1Na+WIvsgh0EZRhcZO1Zfnz2Qigd0M9o+NvINycsxBXZJCNoOFNEYgmtG
         5i4g==
X-Forwarded-Encrypted: i=1; AKwUvBxN0jNJd6BGc4GWHUJxnuhCMgMPmcuROEHkoG/SJhbWO/zcbbW70l2zPqcp67JdTUt9vAyznh1d3FBPNuU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4iWB9MMpFghXzzNs2scZLKz3XMXpjla9Vie8pBo2KR5d+D+ZR
	QegRE4yCv1WRnoLsfdwHyqQGCKBSmY6Lci+7Q8EcU744lADzuecPoKET
X-Gm-Gg: AYBFou0YcZ7uWPrQE8CSDhCqggQXDMdsSxa5QsZss4kCdfvnyr9DcsfVfItjafj/dzq
	4XPWHLM3ZceSLhjWqM+C7FMRhGANunB3rx5ooM1NrtRuGRSFT8gHhTLdgsvcgzzunh+fOqZYsnw
	inrZWCu6faTR1170WtSU/HngPDm0X1VUCKKA9XeNL7RUsEmOxd5+aHDcdD0c6qJqcRu3Q4C1Vzn
	oQQdTsja3W9am3/sBb5pQ5RxqbIzPcClScypPIrXl7FQsmmRViFpA0IBeWgutsqr0dCJy3j/iNY
	sdqodGjpSJTBozW6M1tIwdp2FU29DpbqXWNsv0j6tlMjZF06Q9lreP3VqUfqRSrb4DjDkbbxENP
	6W9XTzOVqJ/l2CLqESGm9/2jRU+6IAR7SpKnCbNcwQPwqxKmeondPi/XPdAqUjuGWXvQ4IkeMLo
	6z2z/tl4G5cz47EYF4pG8ZRohjKJFcBNhSdu8rLspkg6ihdnKfz5EKvTyutBNHDPZX3kmVUCqmE
	foqj2SYzZ/uO3YHkWb6cs2d7px/i2OhvLUzqT1h
X-Received: by 2002:a17:907:3fa9:b0:c2a:6c3:9e98 with SMTP id a640c23a62f3a-c31aa098468mr149823066b.40.1791547088675;
        Fri, 09 Oct 2026 04:58:08 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31aa825e4bsm78525966b.9.2026.10.09.04.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:58:07 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v5 4/5] alpha: decode and acknowledge Tsunami system machine checks
Date: Fri,  9 Oct 2026 13:54:40 +0200
Message-ID: <20261009115627.969047-5-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009115627.969047-1-linmag7@gmail.com>
References: <20261009115627.969047-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Decode PCI and ECC transactions separately, honor invalid transaction
information, and select Pchip errors using the logout summary. Report
master aborts until a Tsunami-specific dismissal policy can be justified.
Delegate processor vectors to the bounded EV6 decoder.

Capture each live PERROR and MISC value before acknowledging their defined
W1C bits. Report live status not already represented in the saved frame,
retaining the Pchip identity, transaction and NXM source. Do not assume
that PALcode cleared the registers or that its frame captures later errors.

Check saved and live UECC/PERR before expected-probe dismissal and panic
on either. Preserve expected NXM probes, but report coincident Pchip
errors before consuming the probe exception. Leave PERRMASK unchanged.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/err_tsunami.c | 260 +++++++++++++++++++++++++++++---
 1 file changed, 242 insertions(+), 18 deletions(-)

diff --git a/arch/alpha/kernel/err_tsunami.c b/arch/alpha/kernel/err_tsunami.c
index 1045b920fa6b..bdaa39d6242a 100644
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
@@ -12,36 +17,255 @@
 #include "proto.h"
 #include "pci_impl.h"
 
-static inline void
-tsunami_pci_clr_err_1(tsunami_pchip *pchip)
+#define TSUNAMI_PERROR_ERRMASK	0xdffUL
+#define TSUNAMI_PERROR_ECCMASK	(perror_m_uecc | perror_m_cre)
+#define TSUNAMI_PERROR_FATAL	(perror_m_uecc | perror_m_perr)
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
+	/* INV invalidates SYN, CMD and ADDR; SERR has no command/address. */
+	if (perror & (TSUNAMI_PERROR_INV | perror_m_serr)) {
+		printk("%s    Transaction information unavailable\n", err_print_prefix);
+		return MCHK_DISPOSITION_REPORT;
+	}
+	cmd = (perror & perror_m_cmd) >> 52;
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
+	if ((header->code != 0x202 && header->code != 0x204) ||
+	    !tsunami_frame_valid(header, sizeof(struct el_TSUNAMI_sysdata_mcheck)))
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
+		if (print)
+			printk("%s  Unknown or truncated Tsunami system frame\n", err_print_prefix);
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
+	u64 perror;
+	bool fatal, expected;
+
+	/* Synchronize pending accesses before inspecting the chipset. */
 	mb();
-	mb();  /* magic */
-	draina();
-	tsunami_pci_clr_err();
-	wrmces(0x7);
 	mb();
+	draina();
+	tsunami_clear_errors(&live);
+	perror = live.perror[0] | live.perror[1];
+	if (vector == SCB_Q_SYSMCHK || vector == SCB_Q_SYSERR) {
+		frame = tsunami_system_frame(header);
+		if (frame)
+			perror |= tsunami_pchip_error(frame, 0) |
+				  tsunami_pchip_error(frame, 1);
+	}
+	/* Saved fatal errors matter even if PALcode already cleared PERROR. */
+	fatal = perror & TSUNAMI_PERROR_FATAL;
+	expected = vector != SCB_Q_SYSEVENT && mcheck_expected(smp_processor_id());
+	if (expected && !(perror & TSUNAMI_PERROR_ERRMASK)) {
+		wrmces(0x7);
+		/* Complete acknowledgment before returning to the probe. */
+		mb();
+		process_mcheck_info(vector, la_ptr, "TSUNAMI", 1);
+		return;
+	}
+
+	err_print_prefix = KERN_CRIT;
+	if (vector == SCB_Q_SYSMCHK || vector == SCB_Q_SYSERR) {
+		printk("%sSystem %s error (vector %lx, code %x) on CPU %d:\n",
+		       err_print_prefix, vector == SCB_Q_SYSERR ? "correctable" :
+		       "uncorrectable", vector, header->code, smp_processor_id());
+		if (tsunami_process_logout_frame(header, 0) == MCHK_DISPOSITION_UNKNOWN_ERROR)
+			printk("%s  Unrecognized system error\n", err_print_prefix);
+		tsunami_process_logout_frame(header, 1);
+	} else if (vector == SCB_Q_SYSEVENT) {
+		printk("%sTsunami environmental event (code %x): layout unknown\n",
+		       err_print_prefix, header->code);
+	}
+	tsunami_report_live_errors(&live, frame);
+	err_print_prefix = saved_err_prefix;
 
-	process_mcheck_info(vector, la_ptr, "TSUNAMI",
-			    mcheck_expected(smp_processor_id()));
+	if (vector != SCB_Q_SYSMCHK && vector != SCB_Q_SYSERR &&
+	    vector != SCB_Q_SYSEVENT) {
+		/* EV6 decoding also releases the logout frame. */
+		ev6_machine_check(vector, la_ptr);
+	} else {
+		wrmces(0x7);
+		/* Complete acknowledgment before resuming or panicking. */
+		mb();
+	}
+	if (fatal)
+		panic("Tsunami: uncorrectable ECC or PCI write parity error");
+	/* An expected probe may coincide with a separately reported error. */
+	if (expected)
+		process_mcheck_info(vector, la_ptr, "TSUNAMI", 1);
 }
-- 
2.43.0

