Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C9D5187EB
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059858; cv=none; b=aAOZgGADtlEcm8GNkA0WbrX5IocKQPcWeFELKq2M6VMufWsa8JqHjc5zQ/R0jZyz9hWjvULfbylAfGNGug1+RQo0ApdH7M+NzsV7SXXf3vRqdjZyt7WleUaUn0b0qjIeIyf0d4/Si/Yz09cTyibfFVDVpFnbq8dIJhn2VdOcFGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059858; c=relaxed/simple;
	bh=zD+L5KHfj9GRtwAR++EBgo1T8d5iADu23RvrPbiHu1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ICmNkhr4iyQpQXXEPSCdWMRiIISNlD69WcPJvlhsZuq2vq8F5RQfY/iZlX4MaAbAGPmOhcAZNhFgZVU9dj3JuBOTxIbbtRAXm0FuBMjMNAY3ohSsti31ova6nisjDP3zUQXNBDJ9d1/oIW5lto8NEDwto32piCOjG/nykyPjhEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AaRz1nsn; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AaRz1nsn"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2e36c3478aso270701966b.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792059854; x=1792664654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h5bOlJnTGH5cpuiaTW0rEF4siHSAFvk91ho32bHKFDc=;
        b=AaRz1nsnuhXlltigisvUE/SVdbW4xFB9P+cM9Y++6PACL96EeeKO1GoUES1ZrksEmp
         p1DAAU/hX37XLjaM4g3sZN8ky3SDRwvMjDxW7wPvlKAcy7QJ0fNeWwHhXKKhIWAXgnkd
         RD14U/bO2yi+wYM4HTMdOhKv8mwzg5KQIUmyk4gNL2RB3Rxa2a7IflqMOX6C1eCyTERQ
         AKcLD730PA1ohaqHs5KAwOmFoDby883b6MmElGgu7RT3ZTGAMecsJm/b1H0PSqWMd6zf
         A3F806EhXuM2lO/qhOE3RyS3UogEQN+fe8SbwdsrXjHrFz2FELUJ9K0iw2If2MAqikDg
         Q2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059854; x=1792664654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h5bOlJnTGH5cpuiaTW0rEF4siHSAFvk91ho32bHKFDc=;
        b=c3F36pHy+TYYY6cKgPzzn+ITfCWbZyJjSpblo1XHFCj4nuwP2AOwSZ66S7ID5aIzqY
         L/fM9Fv9Dg0+Usnwzl8hiqnBw6iA4a242OhSI5QY+h23Mv3jR7nHcOjt9KDkmHfdnFd1
         E9U7jksQEUb5jyAKd0vlRLt6pXJxJhiDkVabr1MNI8sVDY2/mNWiqzzjk5sekgjwdqpN
         +CoFkh3Gt10MUuvoYE9gmyJobvu8yhJ3w+EWgIR0rI63+zeOumRVJ07pts/QNUKDA7re
         ulUGzv6RGRRSf52vqBtHp38QvaVnDeaJOfQTZ3WEjp9x/Zw28MLh+OAnoTHfnwUxCwh6
         KLYg==
X-Forwarded-Encrypted: i=1; AKwUvBw9qvIcF0buoow8wA8ZVfhfqhhsPaptzg3QLXepOcsv35aF006njH8ibsPYYiNVMuxksm2lJrz8rUKhjU0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfRindLxPyNjNasGw9uJynzVVPIZwv5UqZCfYV2mUjQv1DnZXn
	eR8VwX7i4krt8PaYp4Yh4fE8tonBEz6T5oDe806NcFAoDKyEhxun9V76
X-Gm-Gg: AYBFou2rVA+Bfr9+h7SeDBhnp/9vFAddmKsWWWAVHtXZKe7H7FBnxIfscG+6Sp1Pz3m
	ZEoz/c4wqsS1GmStPns5uKqJJfA0MkBZy8B40UPKG8m6A5sFhH2kbfkwTY4/HbzdlpfkH6Kh1yM
	1aVQHxVWDmcQo9xBenAG7KCB1wOkiBjRM5bC9YYXPePHnMQJVQFHMvzGGyBQdAEbNxVyeFxjvrV
	eVDDR4Q3YQ3ujMWzI2T5XHP2sXZ64l7rnsmFPdo2CJvfs5FmLR5EKaS5LSz1SsY/nbiM+fItGAV
	LKR/9ibCmacQzXNuLuKDl8cDkpkno8in/q1mGr0AZm111G26/miG1fJ5NcAibET5VVm4ROP9UU3
	ehQLbobWBuGAnzHbX3F9GNcX5w/BpHssCcNas6hWEk5G3aob2OB+OXfnM1jcKBQpFCyl/QgxmWx
	vQVh8dJxq6mhj7MdzUs+Q0rytci6zhDFfA34+TLP9mlFZVlwaK0BImK9r4TX/yViQPy1e07qlZ5
	5VYIwby540zbGPKn+7vKECK/ixKZj8ICCnrJ6NA
X-Received: by 2002:a17:907:72ca:b0:c29:462b:f908 with SMTP id a640c23a62f3a-c31a9fec198mr2249276866b.10.1792059854413;
        Thu, 15 Oct 2026 03:24:14 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3edab13f4esm108371766b.87.2026.10.15.03.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:24:13 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v8 6/6] alpha: add bounded Clipper console-log scanning
Date: Thu, 15 Oct 2026 12:22:55 +0200
Message-ID: <20261015102353.999695-7-linmag7@gmail.com>
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

Clipper console logs have an HWRPB byte count. Bound wrapper and child
traversal by that count before decoding embedded processor and system
logout frames. Print the wrapper name and event/halt timestamp, halt
code, and recorded CPU ID for processor packets.

Acknowledge the log only after a complete termination packet. Retain the
firmware pointer on unknown or incomplete wrappers and print at most
1 KiB of raw bytes using print_hex_dump(). This avoids the generic
scanner's unconditional acknowledgment after a parsing failure.

The ES40 record observed during testing is class 5, type 4. Its wrapper
layout is unknown and remains raw and unacknowledged; it may therefore
be printed again at each boot. Successful decoding of a nonempty hardware
log remains unverified. Keep console scanning independent of the live
machine-check and environmental handlers and restrict it to Clipper.

Console environmental payloads also remain raw: ES40 Service Guide
Table D-18's sys_offset conflicts with its field offsets. No register
layout is assumed for unverified extended subpacket types 6 and 7.

The scanner invokes the payload decoder directly during PCI init; no
generic subpacket-handler registration is needed. Mark its helpers
__init and retain the PCI init hook in sys_dp264.c.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
Changes since v7 patch 5:
- Separate the console scanner from live environmental decoding.
- Print wrapper names, event/halt timestamps and the halt code.
- Use print_hex_dump() for the bounded raw fallback.
- Remove the unused subpacket-handler registration and mark the three
  private console helpers __init. The empty registration wrapper and its
  call to the currently empty EV6 registration function are unnecessary.
- Remove the unverified extended-type 6/7 definitions and annotations.
  Those payloads remain raw, without assigning register names.
- Keep the observed class-5/type-4 record unsupported and preserve its
  pointer on incomplete parsing. Successful hardware decode is unverified.

 arch/alpha/kernel/err_tsunami.c | 196 ++++++++++++++++++++++++++++++++
 arch/alpha/kernel/proto.h       |   1 +
 arch/alpha/kernel/sys_dp264.c   |   1 +
 3 files changed, 198 insertions(+)

diff --git a/arch/alpha/kernel/err_tsunami.c b/arch/alpha/kernel/err_tsunami.c
index 471d6888b9d4..ea4cce54d042 100644
--- a/arch/alpha/kernel/err_tsunami.c
+++ b/arch/alpha/kernel/err_tsunami.c
@@ -6,9 +6,11 @@
  * Register definitions: 21272 Hardware Reference Manual, revision 4.0.
  */
 #include <linux/init.h>
+#include <linux/printk.h>
 #include <linux/pci.h>
 #include <linux/sched.h>
 #include <asm/io.h>
+#include <asm/hwrpb.h>
 #include <asm/core_tsunami.h>
 #include <asm/smp.h>
 #include <asm/err_common.h>
@@ -484,3 +486,197 @@ clipper_machine_check(unsigned long vector, unsigned long la_ptr)
 	/* Complete acknowledgment before returning from the event. */
 	mb();
 }
+
+static struct el_subpacket * __init
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
+			printk("%s  ** Occurred on CPU %d:\n", err_print_prefix,
+			       (int)packet->by_type.regatta_frame.cpuid);
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
+/*
+ * Clipper console logs have an HWRPB byte count. Do not use the generic
+ * unbounded dispatcher: a rejected record must not acknowledge the log.
+ */
+static bool __init
+tsunami_console_log(void *data, size_t remaining)
+{
+	struct el_subpacket *packet;
+	unsigned char *pos = data;
+	size_t size, length;
+	u32 count;
+	union el_timestamp timestamp;
+	const char *name;
+
+	while (remaining >= offsetof(struct el_subpacket, by_type)) {
+		packet = (void *)pos;
+		size = packet->length;
+		if (size < offsetof(struct el_subpacket, by_type) ||
+		    size > remaining || (size & 7))
+			return false;
+		if (packet->class == EL_CLASS__TERMINATION)
+			return packet->type == EL_TYPE__TERMINATION__TERMINATION;
+		if (packet->class != EL_CLASS__HEADER || packet->revision != 1)
+			return false;
+
+		timestamp.as_int = 0;
+		/* Check each header's extent before accessing its union member. */
+#define CONSOLE_HEADER_SIZE(member) \
+	(offsetof(struct el_subpacket, by_type.member) + \
+	 sizeof(packet->by_type.member))
+		switch (packet->type) {
+		case EL_TYPE__HEADER__SYSTEM_ERROR_FRAME:
+			if (size < CONSOLE_HEADER_SIZE(sys_err))
+				return false;
+			name = "SYSTEM ERROR";
+			length = packet->by_type.sys_err.frame_length;
+			count = packet->by_type.sys_err.frame_packet_count;
+			break;
+		case EL_TYPE__HEADER__SYSTEM_EVENT_FRAME:
+			if (size < CONSOLE_HEADER_SIZE(sys_event))
+				return false;
+			name = "SYSTEM EVENT";
+			timestamp = packet->by_type.sys_event.timestamp;
+			length = packet->by_type.sys_event.frame_length;
+			count = packet->by_type.sys_event.frame_packet_count;
+			break;
+		case EL_TYPE__HEADER__HALT_FRAME:
+			if (size < CONSOLE_HEADER_SIZE(err_halt))
+				return false;
+			name = "ERROR HALT";
+			timestamp = packet->by_type.err_halt.timestamp;
+			length = packet->by_type.err_halt.frame_length;
+			count = packet->by_type.err_halt.frame_packet_count;
+			break;
+		case EL_TYPE__HEADER__LOGOUT_FRAME:
+			if (size < CONSOLE_HEADER_SIZE(logout_header))
+				return false;
+			name = "LOGOUT FRAME";
+			length = packet->by_type.logout_header.frame_length;
+			count = 1;
+			break;
+		default:
+			return false;
+		}
+#undef CONSOLE_HEADER_SIZE
+		if (length > remaining - size || (length & 7) ||
+		    count > length / offsetof(struct el_subpacket, by_type))
+			return false;
+		printk("%s*** %s: CLASS %u, TYPE %u\n", err_print_prefix,
+		       name, packet->class, packet->type);
+		el_print_timestamp(&timestamp);
+		if (packet->type == EL_TYPE__HEADER__HALT_FRAME)
+			printk("%s  HALT CODE: %04x\n", err_print_prefix,
+			       packet->by_type.err_halt.halt_code);
+		pos += size;
+		remaining -= size + length;
+		while (count--) {
+			if (length < offsetof(struct el_subpacket, by_type))
+				return false;
+			packet = (void *)pos;
+			size = packet->length;
+			if (size < offsetof(struct el_subpacket, by_type) ||
+			    size > length || (size & 7) ||
+			    packet->class != EL_CLASS__REGATTA_FAMILY)
+				return false;
+			/* This handler checks embedded logout-frame bounds. */
+			if (tsunami_process_subpacket(packet) != (void *)pos + size)
+				return false;
+			pos += size;
+			length -= size;
+		}
+		if (length)
+			return false;
+	}
+	/* Exhaustion without a complete termination packet is incomplete. */
+	return false;
+}
+
+static void __init
+tsunami_console_data_log(int cpu, struct percpu_struct *pcpu)
+{
+	unsigned char *data = (void *)(IDENT_ADDR | pcpu->console_data_log_pa);
+	size_t length = pcpu->console_data_log_length;
+	size_t dump = length < 1024 ? length : 1024;
+
+	printk("%sConsole data log for CPU %d (%zu bytes):\n",
+	       err_print_prefix, cpu, length);
+	if (!(pcpu->console_data_log_pa & 7) &&
+	    length <= ~0UL - (unsigned long)data &&
+	    tsunami_console_log(data, length)) {
+		/* Acknowledge only after reaching a valid termination packet. */
+		pcpu->console_data_log_pa = 0;
+		return;
+	}
+	printk("%s  Incomplete console log; retaining firmware pointer\n",
+	       err_print_prefix);
+	/* Byte reads preserve partial headers without rounding beyond length. */
+	if (dump > ~0UL - (unsigned long)data)
+		return;
+	print_hex_dump(err_print_prefix, "  ", DUMP_PREFIX_OFFSET, 16, 1,
+		       data, dump, false);
+	if (dump < length)
+		printk("%s  Raw console log truncated to %zu bytes\n",
+		       err_print_prefix, dump);
+}
+
+void __init
+tsunami_check_console_data_log(void)
+{
+	struct percpu_struct *pcpu;
+	unsigned long cpu;
+
+	for (cpu = 0; cpu < hwrpb->nr_processors; cpu++) {
+		pcpu = (void *)hwrpb + hwrpb->processor_offset +
+			cpu * hwrpb->processor_size;
+		if (pcpu->console_data_log_pa)
+			tsunami_console_data_log(cpu, pcpu);
+	}
+}
diff --git a/arch/alpha/kernel/proto.h b/arch/alpha/kernel/proto.h
index 8cdf72f4ab8b..7ece3b635e27 100644
--- a/arch/alpha/kernel/proto.h
+++ b/arch/alpha/kernel/proto.h
@@ -78,6 +78,7 @@ extern struct _alpha_agp_info *titan_agp_info(void);
 extern struct pci_ops tsunami_pci_ops;
 extern void tsunami_init_arch(void);
 extern void tsunami_kill_arch(int);
+extern void tsunami_check_console_data_log(void);
 extern void clipper_machine_check(unsigned long vector, unsigned long la_ptr);
 extern void tsunami_machine_check(unsigned long vector, unsigned long la_ptr);
 extern void tsunami_pci_tbi(struct pci_controller *, dma_addr_t, dma_addr_t);
diff --git a/arch/alpha/kernel/sys_dp264.c b/arch/alpha/kernel/sys_dp264.c
index 0b5687ab45f2..f844d8141553 100644
--- a/arch/alpha/kernel/sys_dp264.c
+++ b/arch/alpha/kernel/sys_dp264.c
@@ -533,6 +533,7 @@ monet_init_pci(void)
 static void __init
 clipper_init_pci(void)
 {
+	tsunami_check_console_data_log();
 	common_init_pci();
 	locate_and_init_vga(NULL);
 }
-- 
2.43.0

