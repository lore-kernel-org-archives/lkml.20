Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794513540;
	b=vvNg/10Mmo4IMFnxojfR85Gy0mPAjJUx8lV27RtTeS5bc8gQWUOoBiAuhNv3C1ZqkPPE
	 YnizJSiM/ZuXxYxlUVrJ4tfR0orgwau8aGvYk7YzjBJngxa7A8pqMHHFRbC/qR/GmgQYR
	 DITBRrLU1YorT4GU3Ci/Q9Xmg0wgF0NIl+A3NQK9US+PPJzME4SR0ep82bGwFVYYukrqW
	 z2DYh1epDIc64Pzbf9q/wcIk1XT7ZdZjyaZW13umK0WW9J41mH/9lJYU8AsXInGqtM3Ny
	 C+hgY/WX/rluO+7Hy7gMks7R/YqWLpnKxzsfpMnh3YnE/GZoC11FB1Eee+pmhmRYhcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794513540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Wbsijdun8X2c7X7cqmk6FaBlLT1QuRHEmkc3rgb9sXg=;
	b=ECk36cIIqerfutzuW4MPY+vxfDe8s7v+UrbzfEZIrd5usU6ED5lgg//yhdLWs97WyARE
	 KiUiL70wDhEA95camGIThdyYvzxjFW1re1RiC7Y4ICvxgUClKvBcNhHFbd16cxN0xs2F+
	 Kjpz7lNNFu2sPiM86+I5gCHI2Bpkyd+U5d/+M14mxb2l5s+OGBiFe8XGny5Wj9zs7kis3
	 3ZRnnShYHi+0TgLLnt7vdmAdfcz+yrWaAq+5gWZUs1etDqdegOKbDpRe6GpGhZgAgmlR8
	 rSuNtDu6GUokvBspuDZdNIQMCftMMQx/KRLtuNhu/dNzFbjNLQa3+uGsFHutkv237Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ygWK+BSz;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0CF606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B0CF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ygWK+BSz
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3720addb068so360868eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794513538; x=1795118338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wbsijdun8X2c7X7cqmk6FaBlLT1QuRHEmkc3rgb9sXg=;
        b=ygWK+BSzh5lyK/dHxqPkfK1LSvQlqsnnTXukwYLjuy04Zkvviz2V0AKPHfjCWZwpOg
         kUCrghj+8PnK35H/FunuAi0befEZ/LCaB+MlCPbIsTCDtZrePdc93dHysHmDWLsTenBN
         Ue0IICCavkRrpODDvBhrqPRn8zR0c2vmylJmMGj3AsLKSvXjEcxlCE0zdhYYdDur6ZVh
         Hxn9YoqzOgp2ty8Z8wiOLShdUPoBTcyQam+2xrteti3QqfCAknHVgTAIpeXe3btNmFnX
         UZUhQbBPRyF4HgLUHw4DK2iiQtTF8vbuKxSichaxivh66IAO1Rt3/aZ6zhyF69i7GKBT
         Ns7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794513538; x=1795118338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wbsijdun8X2c7X7cqmk6FaBlLT1QuRHEmkc3rgb9sXg=;
        b=rNCsSYfHl0JNfc9zyscNTsYLQo4tnqeC06MGprAhSZPn/chsYsifpr0VAU9ntAmZWx
         EIBHlOxGzTG3qNVxOehuznKZVuOtSYlNiQv8N+L/57JvU3c6+fO7IO3dRGVAfQQK/roB
         e5TKvNMhgncuWOaV8goSyCJSXdyULfshdoVi1HWbk5U2LWq/C0NdAXWofq47hFYbl8bl
         j0mEdBi9ekJ0km0NjcbY0GBOTN5oCxrkjlr6+gZquW/0tXY/hvBBLCLpgb8dv3YuuTSU
         G7zmowQ5V0rRh87M7Fwz+kWgqWi9HY2F/z8khFhuKf+Yw3Y31GqZYomBJvuYCsbTTusp
         gjLw==
X-Forwarded-Encrypted: i=1; AL+hErHfxbDADGxysYZZu1SR9t1I/uH+aZgFHO2kyansYwcq9TlCCSz4JOOgoXLtLpu+lfO1cp2Eu1jiNVSfbg0=@vger.kernel.org
X-Gm-Message-State: APuU4Z89jIeQiCW095nXeCWrMSZIyIO3Ng2dvKxdeXr8G3QZP5q94wD5
	LqzqZh2To5M9zLWC6zaSot6A4y5m/bdwODYRABiq+n++FgIyaipGGvLl
X-Gm-Gg: AYBFou1kzXe6HHFOn+WxQ7KrSWCyarw+s6o5/54BHDU6+Udi4ufK4gC5om39J6gmncL
	71kkqFoAw3G1SR/takPYOde/XL7CscoMVVO3v+Jd2hMzbt9TvhDJ7WlzfdgVJk56yBjtJYVnYIs
	3ZSveyLJCzaMmlBh1SkfT7svUBckVSKAeXiWwdc/LzZ/aLQMDg0cpS4qUg3tU+kBdDgIEArY1YL
	rLs1vrL/X5HvnlcZak8P2W5fT2MoT4yYbeWJXnNc6TsdCOY7DKM6VMNWaWD5b6GbAM5EL7qt0Bk
	z5au4N4N5l1Dsxzri7cu95XzNVgz1KbPsBJEsPzTOvihey8DE5KsU6/7u4ot824Jokmrgsv0zh8
	CnrIpceozhQjx7OpNDYNZ7At+zHvY6SiMlIJk4G3ab/FJ1o/6CNK+EVkkH47DoMnxNTPMO4LDEV
	gJe8tNcQlVjLycS65qNoIWHcKEDYgvfcRAvi8B77k+n8lrAz5ZcRGhS3qZ4nlkYrl7V198yg4k9
	0dB+dDbJ6/VzNMPnlrFQ5/zGasyVsCI50AdlDivZmZ/Qj8Wc76vzPg6kYdD2bI3VXppIOZ3JIdA
	2/pD5SKx
X-Received: by 2002:a05:7301:c017:b0:36a:31b2:8643 with SMTP id 5a478bee46e88-37967dd4caamr165614eec.38.1794513538320;
        Thu, 12 Nov 2026 11:58:58 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm632902eec.16.2026.11.12.11.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 11:58:57 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: macro@orcam.me.uk,
	Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] MIPS: SiByte: Fix missing function prototypes
Date: Thu, 12 Nov 2026 11:57:39 -0800
Message-ID: <20261112195824.298915-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The SB1250 SWARM build reports missing prototypes for platform time
initialization, SoC setup, IRQ and SMP helpers, and both RTC backends.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/mips/include/asm/sibyte/sb1250.h  | 17 +++++++++++++++++
 arch/mips/mm/cerr-sb1.c                |  2 --
 arch/mips/mm/tlbex.c                   |  3 +--
 arch/mips/sibyte/bcm1480/irq.c         |  4 +---
 arch/mips/sibyte/bcm1480/smp.c         |  6 +-----
 arch/mips/sibyte/bcm1480/time.c        |  4 ++--
 arch/mips/sibyte/common/bus_watcher.c  |  2 +-
 arch/mips/sibyte/sb1250/irq.c          |  4 +---
 arch/mips/sibyte/sb1250/smp.c          |  6 +-----
 arch/mips/sibyte/sb1250/time.c         |  4 ++--
 arch/mips/sibyte/swarm/rtc.h           | 15 +++++++++++++++
 arch/mips/sibyte/swarm/rtc_m41t81.c    |  1 +
 arch/mips/sibyte/swarm/rtc_xicor1241.c |  1 +
 arch/mips/sibyte/swarm/setup.c         | 18 ++----------------
 14 files changed, 46 insertions(+), 41 deletions(-)
 create mode 100644 arch/mips/sibyte/swarm/rtc.h

diff --git a/arch/mips/include/asm/sibyte/sb1250.h b/arch/mips/include/asm/sibyte/sb1250.h
index de4b352256c8..ff97e77d4fe7 100644
--- a/arch/mips/include/asm/sibyte/sb1250.h
+++ b/arch/mips/include/asm/sibyte/sb1250.h
@@ -32,9 +32,26 @@ extern unsigned int soc_type;
 extern unsigned int periph_rev;
 extern unsigned int zbbus_mhz;
 
+void sb1_cache_error(void);
+
+#ifdef CONFIG_SIBYTE_BUS_WATCHER
+void check_bus_watcher(void);
+#endif
+
+int sb1250_m3_workaround_needed(void);
+void sb1250_setup(void);
+void sb1250_clockevent_init(void);
+void sb1250_clocksource_init(void);
+void sb1250_mailbox_interrupt(void);
+
 extern void sb1250_mask_irq(int cpu, int irq);
 extern void sb1250_unmask_irq(int cpu, int irq);
 
+void bcm1480_setup(void);
+void sb1480_clockevent_init(void);
+void sb1480_clocksource_init(void);
+void bcm1480_mailbox_interrupt(void);
+
 extern void bcm1480_time_init(void);
 extern void bcm1480_mask_irq(int cpu, int irq);
 extern void bcm1480_unmask_irq(int cpu, int irq);
diff --git a/arch/mips/mm/cerr-sb1.c b/arch/mips/mm/cerr-sb1.c
index a3c02df19f6f..6842244ac85b 100644
--- a/arch/mips/mm/cerr-sb1.c
+++ b/arch/mips/mm/cerr-sb1.c
@@ -158,8 +158,6 @@ static void check_bus_watcher(void)
 		printk("Bus watcher indicates no error\n");
 	}
 }
-#else
-extern void check_bus_watcher(void);
 #endif
 
 asmlinkage void sb1_cache_error(void)
diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index 69ea54bdc0c3..6c7d2117141d 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -37,6 +37,7 @@
 #include <asm/regdef.h>
 #include <asm/uasm.h>
 #include <asm/setup.h>
+#include <asm/sibyte/sb1250.h>
 #include <asm/tlbex.h>
 
 static int mips_xpa_disabled;
@@ -84,8 +85,6 @@ static inline int r4k_250MHZhwbug(void)
 	return 0;
 }
 
-extern int sb1250_m3_workaround_needed(void);
-
 static inline int __maybe_unused bcm1250_m3_war(void)
 {
 	if (IS_ENABLED(CONFIG_SB1_PASS_2_WORKAROUNDS))
diff --git a/arch/mips/sibyte/bcm1480/irq.c b/arch/mips/sibyte/bcm1480/irq.c
index 4c18a2c755d2..ab329a15d690 100644
--- a/arch/mips/sibyte/bcm1480/irq.c
+++ b/arch/mips/sibyte/bcm1480/irq.c
@@ -198,7 +198,7 @@ static struct irq_chip bcm1480_irq_type = {
 #endif
 };
 
-void __init init_bcm1480_irqs(void)
+static void __init init_bcm1480_irqs(void)
 {
 	int i;
 
@@ -303,8 +303,6 @@ void __init arch_init_irq(void)
 	change_c0_status(ST0_IM, imask);
 }
 
-extern void bcm1480_mailbox_interrupt(void);
-
 static inline void dispatch_ip2(void)
 {
 	unsigned long long mask_h, mask_l;
diff --git a/arch/mips/sibyte/bcm1480/smp.c b/arch/mips/sibyte/bcm1480/smp.c
index 5861e50255bf..ea491f45d9ac 100644
--- a/arch/mips/sibyte/bcm1480/smp.c
+++ b/arch/mips/sibyte/bcm1480/smp.c
@@ -46,7 +46,7 @@ static void *mailbox_0_regs[] = {
 /*
  * SMP init and finish on secondary CPUs
  */
-void bcm1480_smp_init(void)
+static void bcm1480_smp_init(void)
 {
 	unsigned int imask = STATUSF_IP4 | STATUSF_IP3 | STATUSF_IP2 |
 		STATUSF_IP1 | STATUSF_IP0;
@@ -83,8 +83,6 @@ static void bcm1480_send_ipi_mask(const struct cpumask *mask,
  */
 static void bcm1480_init_secondary(void)
 {
-	extern void bcm1480_smp_init(void);
-
 	bcm1480_smp_init();
 }
 
@@ -94,8 +92,6 @@ static void bcm1480_init_secondary(void)
  */
 static void bcm1480_smp_finish(void)
 {
-	extern void sb1480_clockevent_init(void);
-
 	sb1480_clockevent_init();
 	local_irq_enable();
 }
diff --git a/arch/mips/sibyte/bcm1480/time.c b/arch/mips/sibyte/bcm1480/time.c
index e6450d79fb4f..42db437af306 100644
--- a/arch/mips/sibyte/bcm1480/time.c
+++ b/arch/mips/sibyte/bcm1480/time.c
@@ -4,8 +4,8 @@
  */
 #include <linux/init.h>
 
-extern void sb1480_clockevent_init(void);
-extern void sb1480_clocksource_init(void);
+#include <asm/time.h>
+#include <asm/sibyte/sb1250.h>
 
 void __init plat_time_init(void)
 {
diff --git a/arch/mips/sibyte/common/bus_watcher.c b/arch/mips/sibyte/common/bus_watcher.c
index a296d2c51841..5df4c82ac2a5 100644
--- a/arch/mips/sibyte/common/bus_watcher.c
+++ b/arch/mips/sibyte/common/bus_watcher.c
@@ -189,7 +189,7 @@ static irqreturn_t sibyte_bw_int(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-int __init sibyte_bus_watcher(void)
+static int __init sibyte_bus_watcher(void)
 {
 	memset(&bw_stats, 0, sizeof(struct bw_stats_struct));
 	bw_stats.status_printed = 1;
diff --git a/arch/mips/sibyte/sb1250/irq.c b/arch/mips/sibyte/sb1250/irq.c
index 57943fe3ac03..8108ead0cea8 100644
--- a/arch/mips/sibyte/sb1250/irq.c
+++ b/arch/mips/sibyte/sb1250/irq.c
@@ -179,7 +179,7 @@ static struct irq_chip sb1250_irq_type = {
 #endif
 };
 
-void __init init_sb1250_irqs(void)
+static void __init init_sb1250_irqs(void)
 {
 	int i;
 
@@ -266,8 +266,6 @@ void __init arch_init_irq(void)
 	change_c0_status(ST0_IM, imask);
 }
 
-extern void sb1250_mailbox_interrupt(void);
-
 static inline void dispatch_ip2(void)
 {
 	unsigned int cpu = smp_processor_id();
diff --git a/arch/mips/sibyte/sb1250/smp.c b/arch/mips/sibyte/sb1250/smp.c
index 7a794234e3d7..950d2e1c0de7 100644
--- a/arch/mips/sibyte/sb1250/smp.c
+++ b/arch/mips/sibyte/sb1250/smp.c
@@ -35,7 +35,7 @@ static void *mailbox_regs[] = {
 /*
  * SMP init and finish on secondary CPUs
  */
-void sb1250_smp_init(void)
+static void sb1250_smp_init(void)
 {
 	unsigned int imask = STATUSF_IP4 | STATUSF_IP3 | STATUSF_IP2 |
 		STATUSF_IP1 | STATUSF_IP0;
@@ -72,8 +72,6 @@ static inline void sb1250_send_ipi_mask(const struct cpumask *mask,
  */
 static void sb1250_init_secondary(void)
 {
-	extern void sb1250_smp_init(void);
-
 	sb1250_smp_init();
 }
 
@@ -83,8 +81,6 @@ static void sb1250_init_secondary(void)
  */
 static void sb1250_smp_finish(void)
 {
-	extern void sb1250_clockevent_init(void);
-
 	sb1250_clockevent_init();
 	local_irq_enable();
 }
diff --git a/arch/mips/sibyte/sb1250/time.c b/arch/mips/sibyte/sb1250/time.c
index 8b63000a4dd5..3f7f64fe5690 100644
--- a/arch/mips/sibyte/sb1250/time.c
+++ b/arch/mips/sibyte/sb1250/time.c
@@ -4,8 +4,8 @@
  */
 #include <linux/init.h>
 
-extern void sb1250_clocksource_init(void);
-extern void sb1250_clockevent_init(void);
+#include <asm/time.h>
+#include <asm/sibyte/sb1250.h>
 
 void __init plat_time_init(void)
 {
diff --git a/arch/mips/sibyte/swarm/rtc.h b/arch/mips/sibyte/swarm/rtc.h
new file mode 100644
index 000000000000..64b8db786575
--- /dev/null
+++ b/arch/mips/sibyte/swarm/rtc.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef _SIBYTE_SWARM_RTC_H
+#define _SIBYTE_SWARM_RTC_H
+
+#include <linux/time64.h>
+
+int xicor_probe(void);
+int xicor_set_time(time64_t t);
+time64_t xicor_get_time(void);
+
+int m41t81_probe(void);
+int m41t81_set_time(time64_t t);
+time64_t m41t81_get_time(void);
+
+#endif /* _SIBYTE_SWARM_RTC_H */
diff --git a/arch/mips/sibyte/swarm/rtc_m41t81.c b/arch/mips/sibyte/swarm/rtc_m41t81.c
index afe1e3460bd4..e70ec1870674 100644
--- a/arch/mips/sibyte/swarm/rtc_m41t81.c
+++ b/arch/mips/sibyte/swarm/rtc_m41t81.c
@@ -17,6 +17,7 @@
 #include <asm/sibyte/sb1250_regs.h>
 #include <asm/sibyte/sb1250_smbus.h>
 
+#include "rtc.h"
 
 /* M41T81 definitions */
 
diff --git a/arch/mips/sibyte/swarm/rtc_xicor1241.c b/arch/mips/sibyte/swarm/rtc_xicor1241.c
index e2164200ceec..5bb2bc6a57d2 100644
--- a/arch/mips/sibyte/swarm/rtc_xicor1241.c
+++ b/arch/mips/sibyte/swarm/rtc_xicor1241.c
@@ -17,6 +17,7 @@
 #include <asm/sibyte/sb1250_regs.h>
 #include <asm/sibyte/sb1250_smbus.h>
 
+#include "rtc.h"
 
 /* Xicor 1241 definitions */
 
diff --git a/arch/mips/sibyte/swarm/setup.c b/arch/mips/sibyte/swarm/setup.c
index 38c90b5e8754..a910961ad967 100644
--- a/arch/mips/sibyte/swarm/setup.c
+++ b/arch/mips/sibyte/swarm/setup.c
@@ -35,28 +35,14 @@
 #include <asm/sibyte/sb1250_genbus.h>
 #include <asm/sibyte/board.h>
 
-#ifdef CONFIG_SIBYTE_BCM1x80
-extern void bcm1480_setup(void);
-#elif defined(CONFIG_SIBYTE_SB1250) || defined(CONFIG_SIBYTE_BCM112X)
-extern void sb1250_setup(void);
-#else
-#error invalid SiByte board configuration
-#endif
-
-extern int xicor_probe(void);
-extern int xicor_set_time(time64_t);
-extern time64_t xicor_get_time(void);
-
-extern int m41t81_probe(void);
-extern int m41t81_set_time(time64_t);
-extern time64_t m41t81_get_time(void);
+#include "rtc.h"
 
 const char *get_system_type(void)
 {
 	return "SiByte " SIBYTE_BOARD_NAME;
 }
 
-int swarm_be_handler(struct pt_regs *regs, int is_fixup)
+static int swarm_be_handler(struct pt_regs *regs, int is_fixup)
 {
 	if (!is_fixup && (regs->cp0_cause & 4)) {
 		/* Data bus error - print PA */
-- 
2.53.0

