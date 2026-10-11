Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973423B42C0
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 19:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791746052; cv=none; b=GMZKhVn5cr+b/Y6zpZt41GYOU4w4pdBDBJPUjFYJ6wiEVccYcA/dedZa7ecWsnjY+/cuHNIjSBmTP4V6KT8WHf+aGzfWmZLEYwQNnzjA3Ts74UWf9rdLe6OpGTp2VxkHQ89ErupyEGYSblu3ohtFZTQSS9b6bvT9bLeA2HB3rMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791746052; c=relaxed/simple;
	bh=JSQHhTYitW5zT3+S7+Tzpd5028JuESys8ACE+2lPNVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=enXJEYps5l7Y2upH1KkOm6Zw2iTNyL1mLb8L3ARi66/z+DfAjJlv0amadSDjDOj2YC7ofp7J0YhQNB2GwBvycmHjw3b3PUXr4EOaRxpeexNBKeDKkUtFPt2LE1T/7JpPvMuauH80G4P2+68+YWuRnL4Xbxq+JLcbsczFELcrBq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ptysat6t; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ptysat6t"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a601ba6870so1881255a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 12:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791746045; x=1792350845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gbMfPIzo0a/G4ZHxk1CdnKGoF9WEXOJizXDd0DZMXRI=;
        b=Ptysat6tniKSijvFIeQ34Un8LGsXlJhGemtU/jpK0mnOhz5aZgybfUzVaVWPRLsC1U
         Mnn11C0gm6lo0ZpR1NAHJ5exGkxEveVDi3HshmKmpp6qgi1Kdvo2NnzQpL3nqrDjlV3E
         H3RdqUwZVHEinOM3KF03XzPDbhA+6jTX3APlFTKxQEy4zxVwQ0Ea7X6Etb1F0KB32ZZy
         zACJT6WM5DOTPwgfC3gQPRny630qhd0Kpcri83UuTanUXfTaFcSs6+aYw5WZ855hoA/9
         QlVIcHZAdhCza8gWYChZ9blzOubK8KnBVhvfm/A9sjYmh4pSUGkeMUex10Y/8QrYiiXu
         y05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791746045; x=1792350845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gbMfPIzo0a/G4ZHxk1CdnKGoF9WEXOJizXDd0DZMXRI=;
        b=J1p4b35uecAXTI/VPa13qdnG0ivmDlTqJAhX1lEfd9MnezREUplMFgHCk07/3ezNnh
         21SkJvGyowfmcQASUozKAlrOII5uEe1tSrSP5c9pN6kFKSAPRssfWBz0GocgPnUBnI+9
         C0ZfM2UzhDWgzckV2TUiEuCqSXubEXj9ffmvrYS1JvyTTypQs+4fbsidpoTaanEoUeRs
         Ge0RcBCnYkmTlTnBrQLoxMd5Ui6lqDjKBf5Q+ugbhkihq+ku+payC4zCsQHo5k4UwzJh
         v53m+9N6dNWbsAC2himmsdA5OZmjlB6BZ4SX4M6J/AIjQ77XmGtAR7ZEbs6iU6yUqZII
         EDgQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+a+mQ8SVh8l4UHfcDZhtg5uYK2qKpZrz0MH+3+yGx8C9+X4/GjE3uYgPdL47EPNwZb/ucZWbmRvTH+z4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJi6l7M37leDDFL7X1G13pzpJCL6jCWVa0DwRxpGH4GSMnl5gVF
	JNbxPAYxayqVLiu6aG+UJgaPXiZThStTMsnxDcz3CEfMU2Spay8ohjrN
X-Gm-Gg: AYBFou3qqCrmKzRWi5jP82Eh8EjGqj+qXZ0k6gpE3GmGvmcW8sLlVohs7xrsdb3jMHO
	3YTHnHwKP5r/84BTntKd1bjB51R/Uwi3A9tYfxQ+r/XN1GvrtONS0i1dDP2XZyQTcpa4B60VCQ4
	ZJc91mA0EfdNty2fOZ6yF3u+sbIAbBy8qtMZmBtje17bf76cvIHWWunIxhXsDf9ajfDDgco3lsH
	Fbrb75EXBgbvuoWyD2adsXPtYKA6EPr6RL/THHzGJjKIOtV+f6atXMZOD8UsWi/pDOQGgWhY4o6
	oumKPNRZusmYVbMnytrjrW8GN7wY0USiAF6VqVMYuNHL9ABUZT8H2JFfIXkn3t6lZEaNeNFHi7p
	Ha8qQaFSI92yBhaHPV6dt7NsQJXqZyPii5DRfDLWy4FJENOfocQTEHPikaFVl+TuE0trfdM5lXv
	miITEdHRBPYShrzFCeUCydUBjL/LEpmBxOGbUY504KRoIqJvQRQop60qr0NiAZJolP1s9iWzGii
	fub/U10Auhk95p9U8iK+CHFF1FnWgBwn2PSZ+26zw==
X-Received: by 2002:a05:6402:a0d6:b0:6ac:b861:dab3 with SMTP id 4fb4d7f45d1cf-6b17c296bf6mr6019192a12.39.1791746044832;
        Sun, 11 Oct 2026 12:14:04 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dd3736sm4084832a12.18.2026.10.11.12.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 12:14:04 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v6 5/6] alpha: decode Clipper environmental events and retain console logs
Date: Sun, 11 Oct 2026 21:12:52 +0200
Message-ID: <20261011191344.981000-6-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261011191344.981000-1-linmag7@gmail.com>
References: <20261011191344.981000-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Restrict ES40 live environmental decoding to Clipper. Honor print control,
validate bounds and masks, and separate fault bits from status context.
Report valid notifications even when no recognized fault bits are set,
so door-closed and supply-return notifications are not silently discarded.
Do not infer a recovery transition from a single status snapshot.

Keep inverted SMIR halt/reset bits undecoded and print their raw value.
Use plain door-status messages without the manual's "Set =" prefix.
Dump unknown or truncated environmental frames raw.

Register bounded console decoders from the error file, but keep the PCI
init hook and console-log invocation in sys_dp264.c, as Titan does.
Limit console-log scanning to Clipper pending older-board firmware tests.
The ES40 boot and QEMU Clipper test do not establish that nonempty console
logs are safe on DS10, DS20 or XP1000 firmware.

Print console environmental packets raw: ES40 Table D-18's sys_offset
conflicts with its field offsets. Actual SRM records are still needed.
Terminate annotation arrays and reject invalid packet bounds/revisions.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/err_common.h |   2 +
 arch/alpha/kernel/err_tsunami.c     | 329 ++++++++++++++++++++++++++++
 arch/alpha/kernel/proto.h           |   2 +
 arch/alpha/kernel/sys_dp264.c       |   5 +-
 4 files changed, 337 insertions(+), 1 deletion(-)

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
index 91d187cb2a0d..91937fd2d6e0 100644
--- a/arch/alpha/kernel/err_tsunami.c
+++ b/arch/alpha/kernel/err_tsunami.c
@@ -250,3 +250,332 @@ tsunami_machine_check(unsigned long vector, unsigned long la_ptr)
 	}
 
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
+		if (print) {
+			printk("%s  Truncated Clipper environmental frame\n", err_print_prefix);
+			mchk_dump_logout_frame_raw(header);
+		}
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
+	/* A notification with no recognized fault can describe recovery. */
+	if (print && !(status & MCHK_DISPOSITION_REPORT))
+		printk("%s    No recognized environmental fault bits set\n",
+		       err_print_prefix);
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
+		else {
+			printk("%s  Unrecognized environmental event; raw frame follows\n",
+			       err_print_prefix);
+			mchk_dump_logout_frame_raw(header);
+		}
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
+tsunami_register_error_handlers(void)
+{
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(el_tsunami_annotations); i++)
+		cdl_register_subpacket_annotation(&el_tsunami_annotations[i]);
+	cdl_register_subpacket_handler(&tsunami_subpacket_handler);
+	ev6_register_error_handlers();
+}
diff --git a/arch/alpha/kernel/proto.h b/arch/alpha/kernel/proto.h
index f138bd494628..16dbc02954b7 100644
--- a/arch/alpha/kernel/proto.h
+++ b/arch/alpha/kernel/proto.h
@@ -78,6 +78,8 @@ extern struct _alpha_agp_info *titan_agp_info(void);
 extern struct pci_ops tsunami_pci_ops;
 extern void tsunami_init_arch(void);
 extern void tsunami_kill_arch(int);
+extern void tsunami_register_error_handlers(void);
+extern void clipper_machine_check(unsigned long vector, unsigned long la_ptr);
 extern void tsunami_machine_check(unsigned long vector, unsigned long la_ptr);
 extern void tsunami_pci_tbi(struct pci_controller *, dma_addr_t, dma_addr_t);
 
diff --git a/arch/alpha/kernel/sys_dp264.c b/arch/alpha/kernel/sys_dp264.c
index 0a2d319bb1c8..0ebee9aad98d 100644
--- a/arch/alpha/kernel/sys_dp264.c
+++ b/arch/alpha/kernel/sys_dp264.c
@@ -32,6 +32,7 @@
 
 #include "proto.h"
 #include "irq_impl.h"
+#include "err_impl.h"
 #include "pci_impl.h"
 #include "machvec_impl.h"
 
@@ -533,6 +534,8 @@ monet_init_pci(void)
 static void __init
 clipper_init_pci(void)
 {
+	tsunami_register_error_handlers();
+	cdl_check_console_data_log();
 	common_init_pci();
 	locate_and_init_vga(NULL);
 }
@@ -627,7 +630,7 @@ struct alpha_machine_vector clipper_mv __initmv = {
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

