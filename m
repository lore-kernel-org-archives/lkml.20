Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B88B51814F
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059857; cv=none; b=iliiqpcTzb4ffdpl0H2b5ORRyAVZ2ZdHp/jiREud+76p0YgncI07QAP44JVkpIeyeiuZadsFmfxmzvgQ36y61/AmjDYD+vGtKPOaND1LtVzwlEces3mIOk0EX50XYQjIDJ8tNqbcWdMGwgJQRxWAsMk3dPCvkCkwl8NVIZkoGO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059857; c=relaxed/simple;
	bh=uQEDniOn1PwdKF3FSnKRHiZwsCWkSsCRoWdBTC2Z7pA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NA0yI+YkC6BLi9+BTtLnVqgpObSVet+DBM/JouKQ9cn5kDc6AUgstEONozuI1Bf/SQdgtOY95MkDohGYH5L1kol0zF3nZVXc4cXV6iCEb+lPS63oJ/rxaPv0ILDB2hdb8C+/yWIXktpcqiQPh6bhV4sNiJMBujae05utCMCNXkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hH3ao5qp; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hH3ao5qp"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c3f5e5e4c1dso48193866b.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792059854; x=1792664654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cp28yyr3SzAyjRv8HYwIaVWW5BzBa/tEPBTq/XwtduI=;
        b=hH3ao5qpxCifSa/GhWpwt302MYg0x/O+panT3e4Tatj8mMPuVRMYGnmltkXLNkC7/T
         sN/ictZDsbx99ZfAhxuceLhSIBGUuhwvBeHqxRzdrtG886fdS7uo7QUepeO24IPedT9y
         +saTJw3ZRdE3h7feYMN7EgTptRJGRAt7G5EpA0QEKX3HbE6TMrdnX57ALmeDHvTsFGcF
         FQpu57s6gz0jH7/+El1/WU7zhvA+YKaQ6Wxbw9NBsE4y/cVtvSzvgv7+5y/FRSx1B6Sq
         vtr20qtEqyOYTtqeDLVjQAiBd3TqmhywLjd5sva9A80OkEEbcz8O3RZgkJj8Jh33ltid
         3liA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059854; x=1792664654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cp28yyr3SzAyjRv8HYwIaVWW5BzBa/tEPBTq/XwtduI=;
        b=xg65t1h+EJMhr9ZUw0zfxB3qyFOgioU2yMoC+x7VXzP8Ay5czjTKGtFB87WfmoB5pR
         kORqQOol7oLdGzU79I0wm7yC0BZM4OoKkEwIUQoRFM2c4QzXQcK9qBxBn9OwhVIuXpUF
         hvCcQBXHz6H+2BqInl2iPDNJOgcX2zmsNfJrIR4+h4Q9phmYdOyY/CZg7JdaCn9FsxFL
         YOQ+9s6408kDdtJu59viAHcTGLSrGng0vFWTdxjxUBR6Zp/KSGuJMJV44zCIu5oi74d2
         SW00job51Hq6FhShxJdg/pEkZXECwk24VOxMhZuiBHXIAEwoUft/foDDKx4zPd9CuvaB
         YMjw==
X-Forwarded-Encrypted: i=1; AKwUvBwhTv5WIISEQQQefuQDAFl81BWVVIdKcLe0JUXX9TTSjRCU2nz3mHkRlmnIbgLaUX9t8cxWj2FgtDG25Gg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcJ9c6y2RVopOo1PlXjE79RY5eNeS/BesBiv8IpS9WBg2vb2AZ
	lG1PKDVdoBV5EXAbbkADgqWCIE6PFvUmiEZVuYAblLndfxr13E9XwWf3
X-Gm-Gg: AYBFou0kz140h8dtpHW74ZdXMZVPFpvYHkubqbvsHTv+4sekxdBOoHd5cWX3ED2OHtt
	3Gj+F5rUvkc9MFOwOzMhUElc4bj8csXzf1WQDE6CS8YNW/Ccsyf+5cwbKvbsoRz7UODCTzhZlBN
	ydXMDoEOZ4Yc+ZO7Tnjaf/f4Rjqbrw1CEt6ZMk/lDlAQyN/Z3Eir8YeSk1FftSF9+zDFRPZOOK6
	1Dz5kCP+3jLXv/U1Zjfgt2DiJdU1XmXoNqBnbRygr7wE1hQyDWqOWeGiovOUxjT6P5olwGAqrfS
	BJtyEKNjemEn163e+O7oQSJ1dl7+zxMkcEX2qRVoTr9/dCFoZrl23AmjbcM78tOByMm3TPOcf7T
	/p5BKfTWXPyLCagCmn4NqmhuaCm/PmzJ9yBiwnVgfvwBM3+arTODqI7F8MH4ctjR7SVuKCRpWFT
	e8wzbu9zwTnUTo7exSCU8701KluvNpuB9cHz5099GVy99k66qu7gGoR7U6PReLyJKVO6gHklHia
	lEOf5xz8KM0V4xSlBONorWFpH6iXvVKVHMRmtDa
X-Received: by 2002:a17:906:630c:b0:c19:45e3:2f57 with SMTP id a640c23a62f3a-c31a9d0ab5amr1764971966b.9.1792059853367;
        Thu, 15 Oct 2026 03:24:13 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3edab13f4esm108371766b.87.2026.10.15.03.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:24:12 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v8 5/6] alpha: decode Clipper environmental events
Date: Thu, 15 Oct 2026 12:22:54 +0200
Message-ID: <20261015102353.999695-6-linmag7@gmail.com>
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

Restrict ES40 live environmental decoding to Clipper. Validate frame bounds
and string-table masks, and separate fault bits from status context.
Report valid notifications even when no recognized fault bits are set,
so door-closed and supply-return notifications remain visible. A single
status snapshot does not establish a recovery transition.

Keep SMIR bit 0 and inverted halt/reset bits as raw context. During the
ES40 PSU cable test, bit 0 remained set after the individual PSU failure
indication cleared. Its polarity/latching is unverified, so do not call
it a current PSU failure. Use mask 0x14 for the remaining SMIR faults.
Decode only QW1 through QW7 as live environmental status, as documented
in the ES40 Service Guide, Tables D-20 and D-21.

Use plain door-status messages. Preserve unknown or truncated frames
in bounded raw dumps. Firmware console-log scanning is independent of
the live environmental handler.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
Changes since v7:
- Split console-log support into patch 6 so it can be reviewed separately.
- Make clipper_process_environment() void and remove its unused print
  parameter. Always print from the bit helper, retaining a boolean only
  to decide whether to report that no recognized faults are present.
- Keep version-history remarks here rather than in the commit message.

Changes since v6:
- Remove the redundant environmental silent pass, treat SMIR bit 0 as raw
  context, and retain only mask 0x14 for recognized SMIR faults.

 arch/alpha/kernel/err_tsunami.c | 221 ++++++++++++++++++++++++++++++++
 arch/alpha/kernel/proto.h       |   1 +
 arch/alpha/kernel/sys_dp264.c   |   2 +-
 3 files changed, 223 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/err_tsunami.c b/arch/alpha/kernel/err_tsunami.c
index 03080d219cde..471d6888b9d4 100644
--- a/arch/alpha/kernel/err_tsunami.c
+++ b/arch/alpha/kernel/err_tsunami.c
@@ -263,3 +263,224 @@ tsunami_machine_check(unsigned long vector, unsigned long la_ptr)
 		mb();
 	}
 }
+
+static const char * const CLIPPER_EnvQW1SMIR[] = {
+	"", /* SMIR<0>: retain as raw context until its semantics are known. */
+	"OCP or RMC halt detected",
+	"Sys_DC_Notok failure detected",
+	"",
+	"System temperature over 50 degrees C failure",
+	"PCI Bus #0 is in reset",
+	"PCI Bus #1 is in reset",
+	"System is being reset"
+};
+
+static const char * const CLIPPER_EnvQW2CPUIR[] = {
+	"CPU0 regulator is enabled",
+	"CPU1 regulator is enabled",
+	"CPU2 regulator is enabled",
+	"CPU3 regulator is enabled",
+	"CPU0 regulator or configuration sequence fail",
+	"CPU1 regulator or configuration sequence fail",
+	"CPU2 regulator or configuration sequence fail",
+	"CPU3 regulator or configuration sequence fail"
+};
+
+static const char * const CLIPPER_EnvQW3PSIR[] = {
+	"Power Supply 0 is enabled",
+	"Power Supply 1 is enabled",
+	"Power Supply 2 is enabled",
+	"",
+	"Power Supply 0 was enabled but failed",
+	"Power Supply 1 was enabled but failed",
+	"Power Supply 2 was enabled but failed"
+};
+
+static const char * const CLIPPER_EnvQW4LM78ISR[] = {
+	"PS +3.3V out of tolerance",
+	"PS +5V out of tolerance",
+	"PS +12V out of tolerance",
+	"VTERM out of tolerance",
+	"Temperature zone 0 (PCI Backplane slots 1-3 area) over limit failure",
+	"LM75 CPU0-3 Temperature over limit failure",
+	"System Fan 1 failure",
+	"System Fan 2 failure",
+	"CTERM out of tolerance",
+	"",
+	"-12V out of tolerance",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"CPU0_VCORE +2V out of tolerance",
+	"CPU0_VIO +1.5V out of tolerance",
+	"CPU1_VCORE +2V out of tolerance",
+	"CPU1_VIO +1.5V out of tolerance",
+	"Temperature zone 1 (PCI Backplane slots 7-10 area) over limit failure",
+	"",
+	"System Fan 4 failure",
+	"System Fan 5 failure",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"",
+	"CPU2_VCORE +2V out of tolerance",
+	"CPU2_VIO +1.5V out of tolerance",
+	"CPU3_VCORE +2V out of tolerance",
+	"CPU3_VIO +1.5V out of tolerance",
+	"Temperature zone 2 (PCI Backplane slots 4-6 area) over limit failure",
+	"",
+	"System Fan 3 failure",
+	"System Fan 6 failure",
+	"",
+	"",
+	"Power supply 3.3V rail above high amperage warning",
+	"Power supply 5.0V rail above high amperage warning",
+	"Power supply 12V rail above high amperage warning",
+	"Power supply high temperature warning",
+	"Power supply AC input low limit warning",
+	"Power supply AC input high limit warning"
+};
+
+static const char * const CLIPPER_EnvQW5DOOR[] = {
+	"",
+	"System CPU door is open",
+	"System Fan door is open",
+	"System PCI door is open",
+	"",
+	"System CPU door is closed",
+	"System Fan door is closed",
+	"System PCI door is closed"
+};
+
+static const char * const CLIPPER_EnvQW6TEMP[] = {
+	"CPU0 temperature warning fault has occurred",
+	"CPU1 temperature warning fault has occurred",
+	"CPU2 temperature warning fault has occurred",
+	"CPU3 temperature warning fault has occurred",
+	"System temperature zone 0 warning fault has occurred",
+	"System temperature zone 1 warning fault has occurred",
+	"System temperature zone 2 warning fault has occurred"
+};
+
+static const char * const CLIPPER_EnvQW7FAN[] = {
+	"System Fan 1 is not responding to RMC Commands",
+	"System Fan 2 is not responding to RMC Commands",
+	"System Fan 3 is not responding to RMC Commands",
+	"System Fan 4 is not responding to RMC Commands",
+	"System Fan 5 is not responding to RMC Commands",
+	"System Fan 6 is not responding to RMC Commands",
+	"",
+	"",
+	"CPU fans 5/6 at maximum speed",
+	"CPU fans 5/6 reduced speed from maximum",
+	"PCI fans 1-4 at maximum speed",
+	"PCI fans 1-4 reduced speed from maximum"
+};
+
+#define CLIPPER_ENV_LM78ISR_MASK	0xfcdf00df05ffUL
+
+/* ES40 Service Guide EK-ES240-SV A01, live frame: Tables D-20 and D-21. */
+struct el_clipper_envdata {
+	u64 summary;
+	u64 dir;
+	u64 smir;
+	u64 cpuir;
+	u64 psir;
+	u64 fault;
+	u64 doors;
+	u64 temp_warn;
+	u64 fan_ctrl;
+	u64 fatal_power_down;
+	u64 reserved;
+};
+
+static bool
+clipper_print_bits(const char * const *messages, size_t count,
+		   u64 value, u64 mask)
+{
+	size_t i;
+
+	if (!(value & mask))
+		return false;
+	for (i = 0; i < count; i++)
+		if (value & mask & (1UL << i))
+			printk("%s    %s\n", err_print_prefix, messages[i]);
+	return true;
+}
+
+#define CLIPPER_BITS(table, value, mask) \
+	clipper_print_bits(table, ARRAY_SIZE(table), value, mask)
+
+static void
+clipper_process_environment(struct el_common *header)
+{
+	struct el_clipper_envdata *frame;
+	bool fault = false;
+
+	if (!tsunami_frame_valid(header, sizeof(*frame))) {
+		printk("%s  Truncated Clipper environmental frame\n", err_print_prefix);
+		mchk_dump_logout_frame_raw(header);
+		return;
+	}
+	frame = (void *)header + header->sys_offset;
+	/* Only QW1 through QW7 carry error state in the live 680 frame. */
+	/* PSU summary and inverted halt/reset signals remain raw context. */
+	fault |= CLIPPER_BITS(CLIPPER_EnvQW1SMIR, frame->smir, 0x14);
+	fault |= CLIPPER_BITS(CLIPPER_EnvQW2CPUIR, frame->cpuir, 0xf0);
+	fault |= CLIPPER_BITS(CLIPPER_EnvQW3PSIR, frame->psir, 0x70);
+	fault |= CLIPPER_BITS(CLIPPER_EnvQW4LM78ISR,
+			       frame->fault, CLIPPER_ENV_LM78ISR_MASK);
+	fault |= CLIPPER_BITS(CLIPPER_EnvQW5DOOR, frame->doors, 0x0e);
+	fault |= CLIPPER_BITS(CLIPPER_EnvQW6TEMP, frame->temp_warn, 0x7f);
+	fault |= CLIPPER_BITS(CLIPPER_EnvQW7FAN, frame->fan_ctrl, 0x3f);
+	/* A notification with no recognized fault can describe recovery. */
+	if (!fault)
+		printk("%s    No recognized environmental fault bits set\n",
+		       err_print_prefix);
+	printk("%s  Environmental summary: %016llx DIR: %016llx\n",
+	       err_print_prefix, frame->summary, frame->dir);
+	printk("%s  SMIR: %016llx (PSU summary/halt/reset bits undecoded)\n",
+	       err_print_prefix, frame->smir);
+	CLIPPER_BITS(CLIPPER_EnvQW2CPUIR, frame->cpuir, 0x0f);
+	CLIPPER_BITS(CLIPPER_EnvQW3PSIR, frame->psir, 0x07);
+	CLIPPER_BITS(CLIPPER_EnvQW5DOOR, frame->doors, 0xe0);
+	CLIPPER_BITS(CLIPPER_EnvQW7FAN, frame->fan_ctrl, 0xf00);
+	if (frame->fault & (0x3fUL << 42))
+		printk("%s  Power supply warning source: %llu (3 = reserved)\n",
+		       err_print_prefix, (frame->fault >> 40) & 3);
+}
+
+void
+clipper_machine_check(unsigned long vector, unsigned long la_ptr)
+{
+	struct el_common *header = (void *)la_ptr;
+	char *saved_err_prefix = err_print_prefix;
+
+	if (vector != SCB_Q_SYSEVENT) {
+		tsunami_machine_check(vector, la_ptr);
+		return;
+	}
+	/* Drain pending accesses before inspecting the environmental frame. */
+	mb();
+	draina();
+	err_print_prefix = KERN_CRIT;
+	printk("%sSystem correctable environmental event (code %x) on CPU %d:\n",
+	       err_print_prefix, header->code, smp_processor_id());
+	if (header->code == 0x206)
+		clipper_process_environment(header);
+	else {
+		printk("%s  Unrecognized environmental event; raw frame follows\n",
+		       err_print_prefix);
+		mchk_dump_logout_frame_raw(header);
+	}
+	err_print_prefix = saved_err_prefix;
+	wrmces(0x7);
+	/* Complete acknowledgment before returning from the event. */
+	mb();
+}
diff --git a/arch/alpha/kernel/proto.h b/arch/alpha/kernel/proto.h
index f138bd494628..8cdf72f4ab8b 100644
--- a/arch/alpha/kernel/proto.h
+++ b/arch/alpha/kernel/proto.h
@@ -78,6 +78,7 @@ extern struct _alpha_agp_info *titan_agp_info(void);
 extern struct pci_ops tsunami_pci_ops;
 extern void tsunami_init_arch(void);
 extern void tsunami_kill_arch(int);
+extern void clipper_machine_check(unsigned long vector, unsigned long la_ptr);
 extern void tsunami_machine_check(unsigned long vector, unsigned long la_ptr);
 extern void tsunami_pci_tbi(struct pci_controller *, dma_addr_t, dma_addr_t);
 
diff --git a/arch/alpha/kernel/sys_dp264.c b/arch/alpha/kernel/sys_dp264.c
index 0a2d319bb1c8..0b5687ab45f2 100644
--- a/arch/alpha/kernel/sys_dp264.c
+++ b/arch/alpha/kernel/sys_dp264.c
@@ -627,7 +627,7 @@ struct alpha_machine_vector clipper_mv __initmv = {
 	DO_EV6_MMU,
 	DO_DEFAULT_RTC,
 	DO_TSUNAMI_IO,
-	.machine_check		= tsunami_machine_check,
+	.machine_check		= clipper_machine_check,
 	.max_isa_dma_address	= ALPHA_MAX_ISA_DMA_ADDRESS,
 	.min_io_address		= DEFAULT_IO_BASE,
 	.min_mem_address	= DEFAULT_MEM_BASE,
-- 
2.43.0

