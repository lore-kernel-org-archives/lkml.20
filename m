Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794203279;
	b=gzMOrYaWSJ4I3ylb7uc/BCY8p4BAAPghtAYYLZ2P/0mQCmuSpq7XG4IcJn88ntu95I9p
	 vLZeQuuA5ePrvBfZfIU0smUAyzVs1N2RfXphdOe9wAqOpjXBwFadf4YcVRorQ6VcN3sE7
	 5M7ps+aCTGcKfx03q4XMbTo8NJgX3y1kGKunoOd+jJsqb8pO1uc3XpOwUMZcVQL4NCUpY
	 pfrPwpG2YOfLh24wjod6ufzPQIOETAtN0dXWl1f4dGFZ3GWsNqIf8oLdSv/mm3FK85zXi
	 zqZdTG6eABDXEleHKUfwUkpYy66n36XJJv5+la4sJ5U+WWWqu1pbKwYHXr41e0prSfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203279;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=yEI9QPdZb9fIemVNbuPAWIjNG/F4NymByZojuYSSaiw=;
	b=E0JPda1U6jZZ+V7PxwBRX8p92ahcuLUm3GzY8sbtxipb38n3CAB3s3V73H4jBGZliOQy
	 p02Env0Rx/gEAm5WtFTec04ockeKxFNNvRL1AiQPGFgSZWkxw7qewf5NNkR788uPq7uau
	 B/K8wfW2wz0CC12Rwi7MNg7UOP/WLI6rzVZoXUmZkvwAg+YUrEd4rUeshcbUCwA5EBRyb
	 +Z2BSI0ZH/EjYAkdO8UMDE+kAQGtuOvp85fOiVbwooS7mzEB10AgiNBEOv88QS6d8EPpI
	 vgQd0HinirhFYO8jRQEFeGPG2/0NqcW2BL961EpptNW2WKvMXwA/1hNAfvjGyKx2hag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=K2viZ5Hx;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1968E606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1968E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=K2viZ5Hx
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so273789a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 21:47:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794203278; x=1794808078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yEI9QPdZb9fIemVNbuPAWIjNG/F4NymByZojuYSSaiw=;
        b=zpiOmEcTJ9RItHoxi9cT46Kir+iQBCDpYsXuKcrj5+iY0vSaeLDtJiNnACYK1g3PSV
         gbVyf7y6G7deDIh2A8kXyBwjirp4UUf68JEJoUCdzOzhGVpBD17YqwPLjK78QO/3gsmd
         u+fU5rNkbPfHYu6L+rX6vpoZ5eykmSannboeqxpBeAwzGBVbFzjo+lC/2qkuuHkljA4G
         t3zmLAlRxjTX41URIm+ZS3Ji7ftbXmsXULdyHTMYL4KlmFHmQsxudQt7LmKpBWav3H0F
         3FhTC9dZM9QSumO1Upalxgn3OL0Papv1Ll9uIwd7JnfDogBpmdZ6MjItn2TO74SdZ00w
         AXtQ==
X-Forwarded-Encrypted: i=1; AL+hErF4xUFvECR+nD74VZX2vYI66fK7+3xUFCaMI/aCwRn0no8O/U9dAcolB91ZuN84YVJ719X38ROaQC3SUR0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rdPN67GeJhsoJJ9YgkDtMQXJuo5YzOWCiL2C/pTqMdQsXN8uR
	Ec4UkmdTGCM96FIH7KhIAZd/Ei2bhrHaaqOkzMNgTbtjlVJFs9C52je068jvemP/4sSXuJTmxIO
	qZnh+UfFtcfmdcwV070fD4UiScHhWT+YXlQ4a2G3Ns4ZcUJXONKp+DAM4R6N5F1o4cd2b2ppsL9
	uucZDBJULoSwVgyQF31rStlpg+GQ4tIj/5n7v9xXeimvknqGPwiVhFPOwz2NCT2fbteYLl0K8yv
	KliEEHoT48QYHOO
X-Gm-Gg: AYBFou3h2dM70Ppw/YB/JqWbJTN3eLGEgUvpupsSSFdE4Ac0X29vZ7qPx45xjCnOLlg
	JCt9X268fgBmREBQdriWZcKPXuQ4ts/P1VDTmyMthjb7R7B1lQoQtRcMkMH9JSV8g+D+1i/YuD6
	/l3y39tQCvhoznzmm5+Lk1hL/Cmj6/OK9DjJiXaHW/Nos8MsDyvuiAeut8V7Op6NJ5QTQwPQ9Nv
	adIL8IByblex2pDGmnD3/Qr6wiYsPbdTdoFZDQnokkeoR8ByeEMQRG2CDxX08FL21NerWbwe8o+
	ies4yTMYyYINXVo9vwVkOY2kuPr3lokLtATCBqPBm8yigCrIOEnRU2O/XpMplixJ2d+1CWssNzt
	TbFjW8pabHlyFViQ1tW4P18U1/Hk3hxbpqfvjw2utXuPSzdXIl4aY/Utny/akkq+U8jbS+LrUnR
	+YRhg+D91UIEqTX+miW/eVqV29wQVddhwc
X-Received: by 2002:a17:90b:2248:b0:3ad:5c64:c7a0 with SMTP id 98e67ed59e1d1-3b12d522b2amr2637451a91.38.1794203278341;
        Sun, 08 Nov 2026 21:47:58 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b127728964sm2915368a91.1.2026.11.08.21.47.57
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Nov 2026 21:47:58 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b25dc2aa8bso1437956c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 21:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794203276; x=1794808076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yEI9QPdZb9fIemVNbuPAWIjNG/F4NymByZojuYSSaiw=;
        b=K2viZ5HxePjPs4p3PelrdZ0UL65mfes8fGwNPssYafXEoTXfxiGbint8A6PVA2PRhi
         Tb2LDaurdd6KGGDoikxxZutM0g7LMGVRHQwFiYish+Eun9Ha75HiyvKSO49tb7rNF+Uo
         Ff7ADZi/0VYR5GCkLwO5bEt8UP+oqHycbtxBU=
X-Forwarded-Encrypted: i=1; AL+hErHKvrPkFPS2ira5bL4inuqGFU8Wim+7gEbComVUScRHLE3Gzl0W1V4hFNs8IfC/gqU8+AF/efXbou/O/tM=@vger.kernel.org
X-Received: by 2002:a05:7022:29b:b0:143:8860:afa1 with SMTP id a92af1059eb24-1b39fee1560mr4997715c88.46.1794203276143;
        Sun, 08 Nov 2026 21:47:56 -0800 (PST)
X-Received: by 2002:a05:7022:29b:b0:143:8860:afa1 with SMTP id a92af1059eb24-1b39fee1560mr4997658c88.46.1794203275273;
        Sun, 08 Nov 2026 21:47:55 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37314626dsm13745136c88.1.2026.11.08.21.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:47:54 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Dave Young <ruirui.yang@linux.dev>
Cc: Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	x86@kernel.org,
	Joel Granados <joel.granados@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Bo Gan <bo.gan@broadcom.com>,
	Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>,
	kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	Michael Kelley <mhklinux@outlook.com>,
	Ian Forbes <ian.forbes@broadcom.com>,
	Bradley Morgan <brads@mainlining.org>
Subject: [PATCH v3 1/4] panic: Add a platform panic notifier list
Date: Mon,  9 Nov 2026 00:47:37 -0500
Message-ID: <42090fa4453561ebc35f35cc563ec79933eebe75.1794201807.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794201807.git.zack.rusin@broadcom.com>
References: <cover.1794201807.git.zack.rusin@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Some platforms set crash_kexec_post_notifiers so their crash handlers
run before kdump. That also runs every other panic notifier and kmsg
dumper before the crash kernel.

Add panic_notifiers_platform_list for platform callbacks that need to
run early and are safe while other CPUs are still running. Call it
from vpanic() before kdump and before stopping the other CPUs,
independently of crash_kexec_post_notifiers.

Also call it from __crash_kexec() after saving the registers, since a
fatal oops can enter kdump without panic(). Run the list at most once,
including when a callback panics.

Add disable_panic_notifiers_platform_list to skip these callbacks
when debugging panic or kdump failures.

Suggested-by: Petr Mladek <pmladek@suse.com>
Link: https://lore.kernel.org/r/ateYxCu63pRY9EGq@pathway.suse.cz
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
v3: New. Replaces v2 patches 1-3 (pre-kdump list, crash-core call and
panic_pre_kdump_postpone) with the platform list Petr suggested: one
early call in vpanic(), one in __crash_kexec(), a shared guard and a
disable switch. The guard is a plain bool, because calls are
serialized, normally by panic_cpu.

 .../admin-guide/kernel-parameters.txt         | 12 +++++
 include/linux/panic_notifier.h                |  3 ++
 kernel/crash_core.c                           |  3 ++
 kernel/panic.c                                | 50 +++++++++++++++++++
 4 files changed, 68 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 0b3c140babd9..85ddcad397bf 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1308,6 +1308,18 @@ Kernel parameters
 			MTRR settings.  This parameter disables that behavior,
 			possibly causing your machine to run very slowly.
 
+	disable_panic_notifiers_platform_list=
+			[KNL] Skip the platform panic notifiers. They
+			normally run early in panic(), before kdump, and on
+			crash paths that enter kdump without panic().
+			Intended for debugging panic and kdump failures.
+			Skipping them may lose platform crash handling,
+			such as a copy of the kernel log on the hypervisor.
+			Format: <bool>
+			Default: 0
+			Writable at runtime via
+			/sys/module/kernel/parameters/disable_panic_notifiers_platform_list.
+
 	disable_timer_pin_1 [X86,EARLY]
 			Disable PIN 1 of APIC timer
 			Can be useful to work around chipset bugs.
diff --git a/include/linux/panic_notifier.h b/include/linux/panic_notifier.h
index 41e32483d7a7..1eaf1ffba0bc 100644
--- a/include/linux/panic_notifier.h
+++ b/include/linux/panic_notifier.h
@@ -6,6 +6,9 @@
 #include <linux/types.h>
 
 extern struct atomic_notifier_head panic_notifier_list;
+extern struct atomic_notifier_head panic_notifiers_platform_list;
+
+void panic_notify_platform(void);
 
 extern bool crash_kexec_post_notifiers;
 
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index d0bd2d0cf899..10b4384294c2 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -23,6 +23,7 @@
 #include <linux/objtool.h>
 #include <linux/delay.h>
 #include <linux/panic.h>
+#include <linux/panic_notifier.h>
 
 #include <asm/page.h>
 #include <asm/sections.h>
@@ -139,6 +140,8 @@ void __noclone __crash_kexec(struct pt_regs *regs)
 			struct pt_regs fixed_regs;
 
 			crash_setup_regs(&fixed_regs, regs);
+			/* For crash paths that bypass panic() */
+			panic_notify_platform();
 			crash_save_vmcoreinfo();
 			machine_crash_shutdown(&fixed_regs);
 			crash_cma_clear_pending_dma();
diff --git a/kernel/panic.c b/kernel/panic.c
index 574ee5a12f92..99af1da9d9a5 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -62,6 +62,7 @@ static int pause_on_oops;
 static int pause_on_oops_flag;
 static DEFINE_SPINLOCK(pause_on_oops_lock);
 bool crash_kexec_post_notifiers;
+static bool disable_panic_notifiers_platform_list;
 int panic_on_warn __read_mostly;
 unsigned long panic_on_taint;
 bool panic_on_taint_nousertaint = false;
@@ -82,6 +83,10 @@ ATOMIC_NOTIFIER_HEAD(panic_notifier_list);
 
 EXPORT_SYMBOL(panic_notifier_list);
 
+struct atomic_notifier_head panic_notifiers_platform_list =
+	ATOMIC_NOTIFIER_INIT(panic_notifiers_platform_list);
+EXPORT_SYMBOL_GPL(panic_notifiers_platform_list);
+
 static void panic_print_deprecated(void)
 {
 	pr_info_once("Kernel: The 'panic_print' parameter is now deprecated. Please use 'panic_sys_info' and 'panic_console_replay' instead.\n");
@@ -577,6 +582,46 @@ static void panic_other_cpus_shutdown(bool crash_kexec)
 
 void __weak arch_do_panic(void) {}
 
+/**
+ * panic_notify_platform - run early platform crash callbacks
+ *
+ * panic_notifiers_platform_list is for platform callbacks that need to
+ * run during a crash without requiring crash_kexec_post_notifiers.
+ *
+ * vpanic() calls this before kdump and before stopping the other CPUs.
+ * __crash_kexec() also calls it for crash paths that bypass panic().
+ * Calls must be serialized across CPUs, normally by panic_cpu.
+ *
+ * The list runs at most once, even if a callback panics. Setting
+ * disable_panic_notifiers_platform_list skips the call without marking
+ * the list as run, so a call made after the switch is cleared can still
+ * run it.
+ *
+ * Callbacks receive a notifier value of 0 and NULL data. They must
+ * return NOTIFY_DONE; NOTIFY_STOP would skip the callbacks after them.
+ *
+ * Context: Callbacks run with interrupts disabled, possibly in NMI
+ * context or with the kexec lock held. Other CPUs may still be running.
+ * Callbacks must limit their work and must not sleep, allocate memory,
+ * take locks, wait for other CPUs or invoke kexec.
+ */
+void panic_notify_platform(void)
+{
+	static bool done;
+	unsigned long flags;
+
+	if (READ_ONCE(disable_panic_notifiers_platform_list))
+		return;
+
+	local_irq_save(flags);
+	if (!done) {
+		done = true;
+		atomic_notifier_call_chain(&panic_notifiers_platform_list,
+					   0, NULL);
+	}
+	local_irq_restore(flags);
+}
+
 /**
  * vpanic - halt the system
  * @fmt: The text string to print
@@ -669,6 +714,9 @@ void vpanic(const char *fmt, va_list args)
 	 */
 	kgdb_panic(buf);
 
+	/* Before kdump and before stopping the other CPUs */
+	panic_notify_platform();
+
 	/*
 	 * If we have crashed and we have a crash kernel loaded let it handle
 	 * everything else.
@@ -1217,6 +1265,8 @@ core_param(panic, panic_timeout, int, 0644);
 core_param(pause_on_oops, pause_on_oops, int, 0644);
 core_param(panic_on_warn, panic_on_warn, int, 0644);
 core_param(crash_kexec_post_notifiers, crash_kexec_post_notifiers, bool, 0644);
+core_param(disable_panic_notifiers_platform_list,
+	   disable_panic_notifiers_platform_list, bool, 0644);
 core_param(panic_console_replay, panic_console_replay, bool, 0644);
 
 static int panic_print_set(const char *val, const struct kernel_param *kp)
