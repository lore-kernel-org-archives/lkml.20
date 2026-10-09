Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1784DE70F
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791547098; cv=none; b=Nteu8GG5CDhqhRtU2yJQb+FdBqXbqyIeBMljn1zRfh6QanLsc9DRjT6muimVjo0P7lkgeZfCgCYC6+FgPA60iO1nOFQ81iHkeyptxy3gUqK5p4iqVLlO/cMiXeqaA2JinV8r2DwIBm3x2x7nzeSnzkPT/2M6hFMRNMb9xhTr9IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791547098; c=relaxed/simple;
	bh=qAbtOAU4cZmh/gGXC8LQW1eizMuJfIyPzlW+rn8U5rQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HFDCjevwF1yCUyqgS4IcSa+0NCYpC7VG1XmbxDetHot/F4sRKQQxzzOzh2PnhRkUzQiXgV8yYUWoWdGQw8o2cwg6ykswqLzXgVTrKaTniWHblOTp6AsMo4lo2vHGvdGpUPYhZHWWuyD6j9BZVQuNs4u/ukUXBLKo9zpAympwBSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WgsM5S7/; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WgsM5S7/"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c3156e7705cso770201066b.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 04:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791547090; x=1792151890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZhIqMDFehZfMi6aZD/VrwWgbqieeLKaEp79d2KkzeSY=;
        b=WgsM5S7/3NZD0SchUUpH2o4TXJX/QUA9qpaxV2zwhhBLRyHOVNduf+xvqKfkVFrYB8
         a2u8dYfRHiS5xckATbkJP8Da+x7UZpA0aXo8QECrCJ4U0XP2SAYtSwE3LtgqSXXG9iXf
         kcMCt9CMeofMH451sqgs7HAvP6XgIUfG5G685zmVpvElM8LbT+FIfTztqUy6IFwkKQDB
         y4QYWRrgf4m7TPlOzfE7QS+pgDQr6do1kqjt344fFE+m7GCs6JE05yK2NsYvPG9PwCIs
         JdgzG1hIFQbtsFO1M+oVJ+mLjNMRe0mTmDcph4fEbF8JQvJPRYap7Yi0uj7ZQnAgDQbV
         NgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791547090; x=1792151890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZhIqMDFehZfMi6aZD/VrwWgbqieeLKaEp79d2KkzeSY=;
        b=xlGPf20bUQCfKOvRoqi5A44HCasDt/pKHvfy/4SjawjpgtlDUW+POajWguuBYElZ0I
         5BG5aaKtu6zixC/AaFegHyxt9eHEo8pGfZ7Qc/5ArGDZpgm6HJ8PO5Jh+MyiCXTgpK/E
         c6MR/SAobhrqD9IXBw+7rFRyAYyRkLXNXUK5/0nFnv/If7i2VuvyMVvueJ7o79pZ/M3A
         MaxnCZ1rpqgoyX2H/HAN/rP+SN6oPXhHHlon3lRwlWEu8lbGl+RliyiZTaiYGQrseJDS
         M/3LT3JuNp0yxk2gLOOcv/CYmpp1c/rTtp7Nsq8MN+NLzMwlmHuayj631sLUaf0M6ZCV
         s+Hg==
X-Forwarded-Encrypted: i=1; AKwUvBx2Bf2ooLbZPCLItVvMjkK6hLp74i+pOvrK9Aqh266eFpgtYpl8wH1ZD+BxgvPZ7FqoRTjaqSOQkGL4uMs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZ6dswTaTsOMFi4akRF3DIMH0SpWNnJAvU+KcnBQdA5Cz3z7Be
	G6BLlPxq40wMYDC62qQynNt5O2kuQJazRpIctGLBoy+RX9ZB+08WyKql
X-Gm-Gg: AYBFou00d+j1tEMGBeZz4Fe00mj3jvHjdZA+T2yynrYpPEHOP3HNRexESq78LsgSetV
	3KYNXHtIXcgbmuQNYOqQZq/4CYiM0ga8niW0gtZZvfq+223K4zQnjoj7aplXrsW8z3EkjPZBQ4u
	aHqmYPcg9Vr2RLawvsE2tAm0Zf2n45RaZNDhspREsrLjnBMr7lEY/zYPSPMSryhWgbqKwIrfWIZ
	wt+tMuyi4iXvdBTxPajB43Npq6uTOIDgLYc+mY9TtQal4rV/ku2R/gqWRlRo3kMPXgWyRvkcHRv
	wjIw8h5xQX3bBvj+SaqWNMdyfUXzBvuq2u9a6z3WxTB7m/CqNuu1c62JbLCQtd/F/cvh2+PZb0d
	IB75ycPhJhrt7XuvS5jDX+g80Pofl8fCNby/NGD8g8qUQaENG8DgJFUP0v5TBfi0R2aJyFWPLf0
	60IMLJ2Fj8RZY/q0c/1twjXoxbUgW9B4pABIgefTwnzwfBA6bfgrnRqESnFPLgFwKFV17Min8bA
	PAymCx7TORlaYMRssUrzcI2t/PaWCloXy6lsTaPfjqW7y/o0QQ=
X-Received: by 2002:a17:906:4786:b0:c2e:513a:e964 with SMTP id a640c23a62f3a-c31aa0e1b8emr176029866b.49.1791547089604;
        Fri, 09 Oct 2026 04:58:09 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31aa825e4bsm78525966b.9.2026.10.09.04.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:58:09 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v5 5/5] alpha: decode Clipper environmental events and retain Tsunami console logs
Date: Fri,  9 Oct 2026 13:54:41 +0200
Message-ID: <20261009115627.969047-6-linmag7@gmail.com>
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

Restrict ES40 live environmental decoding to Clipper. Honor the print
argument, bound each string table, and classify only fault bits; enabled
supplies, closed doors and fan speeds are context. Leave inverted
halt/reset signals undecoded pending hardware confirmation.

Table D-18 in the ES40 Service Guide gives a console system offset that
conflicts with its field positions. Print console environmental packets
as raw data until the firmware layout can be verified. Do not interpret
those packets using the live layout from Table D-20.

Register console handling for every Tsunami board. Validate packet lengths
before decoding, keep shared subpacket identifiers with the Regatta types,
and terminate annotation arrays for safe raw dumps of longer packets.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/err_common.h |   2 +
 arch/alpha/kernel/err_tsunami.c     | 324 ++++++++++++++++++++++++++++
 arch/alpha/kernel/proto.h           |   2 +
 arch/alpha/kernel/sys_dp264.c       |  12 +-
 arch/alpha/kernel/sys_eiger.c       |   2 +-
 5 files changed, 335 insertions(+), 7 deletions(-)

diff --git a/arch/alpha/include/asm/err_common.h b/arch/alpha/include/asm/err_common.h
index 610e01fe73ab..63d4320581e2 100644
--- a/arch/alpha/include/asm/err_common.h
+++ b/arch/alpha/include/asm/err_common.h
@@ -47,6 +47,8 @@
 #  define EL_TYPE__REGATTA__PROCESSOR_ERROR_FRAME	(1)
 #  define EL_TYPE__REGATTA__SYSTEM_ERROR_FRAME		(2)
 #  define EL_TYPE__REGATTA__ENVIRONMENTAL_FRAME		(3)
+#  define EL_TYPE__REGATTA__TSUNAMI_PCHIP0_EXTENDED	(6)
+#  define EL_TYPE__REGATTA__TSUNAMI_PCHIP1_EXTENDED	(7)
 #  define EL_TYPE__REGATTA__TITAN_PCHIP0_EXTENDED	(8)
 #  define EL_TYPE__REGATTA__TITAN_PCHIP1_EXTENDED	(9)
 #  define EL_TYPE__REGATTA__TITAN_MEMORY_EXTENDED	(10)
diff --git a/arch/alpha/kernel/err_tsunami.c b/arch/alpha/kernel/err_tsunami.c
index bdaa39d6242a..cd8a93de79f0 100644
--- a/arch/alpha/kernel/err_tsunami.c
+++ b/arch/alpha/kernel/err_tsunami.c
@@ -269,3 +269,327 @@ tsunami_machine_check(unsigned long vector, unsigned long la_ptr)
 	if (expected)
 		process_mcheck_info(vector, la_ptr, "TSUNAMI", 1);
 }
+
+static const char * const CLIPPER_EnvQW1SMIR[] = {
+	"System Power Supply failure detected",
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
+	"Set = System CPU door is open",
+	"Set = System Fan door is open",
+	"Set = System PCI door is open",
+	"",
+	"Set = System CPU door is closed",
+	"Set = System Fan door is closed",
+	"Set = System PCI door is closed"
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
+static char *el_tsunami_pchip0_extended_annotation[] = {
+"Subpacket Header",	"P0_PCTL",	"P0_PERRMASK",
+"P0_WSBA0",		"P0_WSBA1",	"P0_WSBA2",	"P0_WSBA3",
+"P0_WSM0",		"P0_WSM1",	"P0_WSM2",	"P0_WSM3",
+"P0_TBA0",		"P0_TBA1",	"P0_TBA2",	"P0_TBA3", NULL
+};
+
+static char *el_tsunami_pchip1_extended_annotation[] = {
+"Subpacket Header",	"P1_PCTL",	"P1_PERRMASK",
+"P1_WSBA0",		"P1_WSBA1",	"P1_WSBA2",	"P1_WSBA3",
+"P1_WSM0",		"P1_WSM1",	"P1_WSM2",	"P1_WSM3",
+"P1_TBA0",		"P1_TBA1",	"P1_TBA2",	"P1_TBA3", NULL
+};
+
+
+static struct el_subpacket_annotation el_tsunami_annotations[] = {
+	SUBPACKET_ANNOTATION(EL_CLASS__REGATTA_FAMILY,
+			     EL_TYPE__REGATTA__TSUNAMI_PCHIP0_EXTENDED,
+			     1,
+			     "Tsunami PChip 0 Extended Frame",
+			     el_tsunami_pchip0_extended_annotation),
+	SUBPACKET_ANNOTATION(EL_CLASS__REGATTA_FAMILY,
+			     EL_TYPE__REGATTA__TSUNAMI_PCHIP1_EXTENDED,
+			     1,
+			     "Tsunami PChip 1 Extended Frame",
+			     el_tsunami_pchip1_extended_annotation),
+	SUBPACKET_ANNOTATION(EL_CLASS__REGATTA_FAMILY,
+			     EL_TYPE__TERMINATION__TERMINATION,
+			     1,
+			     "Termination Subpacket",
+			     NULL)
+};
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
+static int
+clipper_print_bits(const char * const *messages, size_t count,
+		   u64 value, u64 mask, int print)
+{
+	size_t i;
+
+	if (!(value & mask))
+		return MCHK_DISPOSITION_DISMISS;
+	if (print)
+		for (i = 0; i < count; i++)
+			if (value & mask & (1UL << i))
+				printk("%s    %s\n", err_print_prefix, messages[i]);
+	return MCHK_DISPOSITION_REPORT;
+}
+
+#define CLIPPER_BITS(table, value, mask) \
+	clipper_print_bits(table, ARRAY_SIZE(table), value, mask, print)
+
+static int
+clipper_process_environment(struct el_common *header, int print)
+{
+	struct el_clipper_envdata *frame;
+	int status = 0;
+
+	if (!tsunami_frame_valid(header, sizeof(*frame))) {
+		if (print)
+			printk("%s  Truncated Clipper environmental frame\n", err_print_prefix);
+		return MCHK_DISPOSITION_UNKNOWN_ERROR;
+	}
+	frame = (void *)header + header->sys_offset;
+	/* Only QW1 through QW7 carry error state in the live 680 frame. */
+	/* Inverted halt/reset signals remain raw context until verified. */
+	status |= CLIPPER_BITS(CLIPPER_EnvQW1SMIR, frame->smir, 0x15);
+	status |= CLIPPER_BITS(CLIPPER_EnvQW2CPUIR, frame->cpuir, 0xf0);
+	status |= CLIPPER_BITS(CLIPPER_EnvQW3PSIR, frame->psir, 0x70);
+	status |= CLIPPER_BITS(CLIPPER_EnvQW4LM78ISR,
+			       frame->fault, CLIPPER_ENV_LM78ISR_MASK);
+	status |= CLIPPER_BITS(CLIPPER_EnvQW5DOOR, frame->doors, 0x0e);
+	status |= CLIPPER_BITS(CLIPPER_EnvQW6TEMP, frame->temp_warn, 0x7f);
+	status |= CLIPPER_BITS(CLIPPER_EnvQW7FAN, frame->fan_ctrl, 0x3f);
+	if (!(status & MCHK_DISPOSITION_REPORT))
+		return MCHK_DISPOSITION_DISMISS;
+	if (print) {
+		printk("%s  Environmental summary: %016llx DIR: %016llx\n",
+		       err_print_prefix, frame->summary, frame->dir);
+		printk("%s  SMIR: %016llx (inverted halt/reset bits undecoded)\n",
+		       err_print_prefix, frame->smir);
+		CLIPPER_BITS(CLIPPER_EnvQW2CPUIR, frame->cpuir, 0x0f);
+		CLIPPER_BITS(CLIPPER_EnvQW3PSIR, frame->psir, 0x07);
+		CLIPPER_BITS(CLIPPER_EnvQW5DOOR, frame->doors, 0xe0);
+		CLIPPER_BITS(CLIPPER_EnvQW7FAN, frame->fan_ctrl, 0xf00);
+		if (frame->fault & (0x3fUL << 42))
+			printk("%s  Power supply warning source: %llu (3 = reserved)\n",
+			       err_print_prefix, (frame->fault >> 40) & 3);
+	}
+	return MCHK_DISPOSITION_REPORT;
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
+	if (header->code != 0x206 ||
+	    clipper_process_environment(header, 0) != MCHK_DISPOSITION_DISMISS) {
+		err_print_prefix = KERN_CRIT;
+		printk("%sSystem correctable environmental event (code %x) on CPU %d:\n",
+		       err_print_prefix, header->code, smp_processor_id());
+		if (header->code == 0x206)
+			clipper_process_environment(header, 1);
+		else
+			printk("%s  Unrecognized environmental event\n", err_print_prefix);
+		err_print_prefix = saved_err_prefix;
+	}
+	wrmces(0x7);
+	/* Complete acknowledgment before returning from the event. */
+	mb();
+}
+
+static struct el_subpacket *
+tsunami_process_subpacket(struct el_subpacket *packet)
+{
+	struct el_common *frame;
+	size_t offset = offsetof(struct el_subpacket, by_type.regatta_frame.data_start);
+	int status;
+
+	/* Raw dumps consume whole quadwords, and the next packet must advance. */
+	if (packet->length < offsetof(struct el_subpacket, by_type) ||
+	    (packet->length & 7))
+		return NULL;
+	if (packet->revision != 1) {
+		el_annotate_subpacket(packet);
+		return (void *)packet + packet->length;
+	}
+
+	switch (packet->type) {
+	case EL_TYPE__REGATTA__PROCESSOR_ERROR_FRAME:
+	case EL_TYPE__REGATTA__PROCESSOR_DBL_ERROR_HALT:
+	case EL_TYPE__REGATTA__SYSTEM_ERROR_FRAME:
+	case EL_TYPE__REGATTA__SYSTEM_DBL_ERROR_HALT:
+		if (packet->length < offset + sizeof(*frame))
+			return NULL;
+		frame = (void *)packet + offset;
+		if (frame->size > packet->length - offset || frame->size < sizeof(*frame))
+			return NULL;
+		if (packet->type == EL_TYPE__REGATTA__PROCESSOR_ERROR_FRAME ||
+		    packet->type == EL_TYPE__REGATTA__PROCESSOR_DBL_ERROR_HALT) {
+			status = ev6_process_logout_frame(frame, 0);
+			if (status != MCHK_DISPOSITION_DISMISS)
+				ev6_process_logout_frame(frame, 1);
+		} else {
+			tsunami_process_logout_frame(frame, 1);
+		}
+		break;
+	case EL_TYPE__REGATTA__ENVIRONMENTAL_FRAME:
+		/*
+		 * ES40 Table D-18 gives sys_offset=0x20, but places the
+		 * summary at frame+0x18. Preserve the complete packet until
+		 * the console layout is verified; do not apply the live layout.
+		 */
+		printk("%s  Console environmental layout unverified; raw packet follows\n",
+		       err_print_prefix);
+		el_annotate_subpacket(packet);
+		break;
+	default:
+		el_annotate_subpacket(packet);
+		break;
+	}
+	return (void *)packet + packet->length;
+}
+
+static struct el_subpacket_handler tsunami_subpacket_handler =
+	SUBPACKET_HANDLER_INIT(EL_CLASS__REGATTA_FAMILY, tsunami_process_subpacket);
+
+void __init
+tsunami_init_pci(void)
+{
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(el_tsunami_annotations); i++)
+		cdl_register_subpacket_annotation(&el_tsunami_annotations[i]);
+	cdl_register_subpacket_handler(&tsunami_subpacket_handler);
+	ev6_register_error_handlers();
+	cdl_check_console_data_log();
+	common_init_pci();
+}
diff --git a/arch/alpha/kernel/proto.h b/arch/alpha/kernel/proto.h
index f138bd494628..9f3d77d9d8bc 100644
--- a/arch/alpha/kernel/proto.h
+++ b/arch/alpha/kernel/proto.h
@@ -78,6 +78,8 @@ extern struct _alpha_agp_info *titan_agp_info(void);
 extern struct pci_ops tsunami_pci_ops;
 extern void tsunami_init_arch(void);
 extern void tsunami_kill_arch(int);
+extern void tsunami_init_pci(void);
+extern void clipper_machine_check(unsigned long vector, unsigned long la_ptr);
 extern void tsunami_machine_check(unsigned long vector, unsigned long la_ptr);
 extern void tsunami_pci_tbi(struct pci_controller *, dma_addr_t, dma_addr_t);
 
diff --git a/arch/alpha/kernel/sys_dp264.c b/arch/alpha/kernel/sys_dp264.c
index 0a2d319bb1c8..961902a1da03 100644
--- a/arch/alpha/kernel/sys_dp264.c
+++ b/arch/alpha/kernel/sys_dp264.c
@@ -516,7 +516,7 @@ clipper_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
 static void __init
 dp264_init_pci(void)
 {
-	common_init_pci();
+	tsunami_init_pci();
 	SMC669_Init(0);
 	locate_and_init_vga(NULL);
 }
@@ -524,7 +524,7 @@ dp264_init_pci(void)
 static void __init
 monet_init_pci(void)
 {
-	common_init_pci();
+	tsunami_init_pci();
 	SMC669_Init(1);
 	es1888_init();
 	locate_and_init_vga(NULL);
@@ -533,7 +533,7 @@ monet_init_pci(void)
 static void __init
 clipper_init_pci(void)
 {
-	common_init_pci();
+	tsunami_init_pci();
 	locate_and_init_vga(NULL);
 }
 
@@ -616,7 +616,7 @@ struct alpha_machine_vector webbrick_mv __initmv = {
 	.init_arch		= webbrick_init_arch,
 	.init_irq		= dp264_init_irq,
 	.init_rtc		= common_init_rtc,
-	.init_pci		= common_init_pci,
+	.init_pci		= tsunami_init_pci,
 	.kill_arch		= tsunami_kill_arch,
 	.pci_map_irq		= webbrick_map_irq,
 	.pci_swizzle		= common_swizzle,
@@ -627,7 +627,7 @@ struct alpha_machine_vector clipper_mv __initmv = {
 	DO_EV6_MMU,
 	DO_DEFAULT_RTC,
 	DO_TSUNAMI_IO,
-	.machine_check		= tsunami_machine_check,
+	.machine_check		= clipper_machine_check,
 	.max_isa_dma_address	= ALPHA_MAX_ISA_DMA_ADDRESS,
 	.min_io_address		= DEFAULT_IO_BASE,
 	.min_mem_address	= DEFAULT_MEM_BASE,
@@ -667,7 +667,7 @@ struct alpha_machine_vector shark_mv __initmv = {
 	.init_arch		= tsunami_init_arch,
 	.init_irq		= clipper_init_irq,
 	.init_rtc		= common_init_rtc,
-	.init_pci		= common_init_pci,
+	.init_pci		= tsunami_init_pci,
 	.kill_arch		= tsunami_kill_arch,
 	.pci_map_irq		= clipper_map_irq,
 	.pci_swizzle		= common_swizzle,
diff --git a/arch/alpha/kernel/sys_eiger.c b/arch/alpha/kernel/sys_eiger.c
index aea8a54da4bc..c53c5006ea81 100644
--- a/arch/alpha/kernel/sys_eiger.c
+++ b/arch/alpha/kernel/sys_eiger.c
@@ -217,7 +217,7 @@ struct alpha_machine_vector eiger_mv __initmv = {
 	.init_arch		= tsunami_init_arch,
 	.init_irq		= eiger_init_irq,
 	.init_rtc		= common_init_rtc,
-	.init_pci		= common_init_pci,
+	.init_pci		= tsunami_init_pci,
 	.kill_arch		= tsunami_kill_arch,
 	.pci_map_irq		= eiger_map_irq,
 	.pci_swizzle		= eiger_swizzle,
-- 
2.43.0

