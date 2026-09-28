Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8594E9C16
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618218; cv=none; b=rzD+Q/OrfricIGBdPWyG8pGc6ud5429AjxHlLd1CsWkyoOJfbkCbDk8opPRARvaIbHMZCzuWBgj/kuBmZs/CrmkgQMrZ37WqU4XOdP43E/Mu/qpU5En0p8Z/bXJSOV4psCqJ7h4QFB+Gj3haQelEtCAb8QVNF1WbN8m14S94jT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618218; c=relaxed/simple;
	bh=CBv00AL3BTLNsUFe9tB6GyqcDTTDzgpUZMK43TlrJOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mgP0e5NvR90/uxNy5sHhgS55izLfsi9bdus/Hzw2XVhfUI2IK4U0HrFDxuyau2CSQgwHZLPh6XIRc0b2xNESwrzUm6CNaIjbwFZ34mJwP/3JuF61Ylr7nFsHq0DZusAo7YQRvbQ1u6oWUEaBYWlRTsdTx0vpAT+OK3YS3XTTPvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Oc/tatWx; arc=none smtp.client-ip=209.85.215.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Oc/tatWx"
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cc4b62d118aso860095a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:56:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618217; x=1791223017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yiEqvVPcujwO0jzo0ebX90rTLmO4XRBVQ6+xmjHfKA0=;
        b=B0VHW/8UvBhIGIuMxrrMC84B0WFLXKddGIetOuHEp6WIzr+p6KrJVOxH5iBC2FKT7u
         sFOHztJ2yEjEjoAjrRPfUE9GgW6qRlHeFwLxdSzBNnTxpyb2US6J//Lzp4DJbvk4wceW
         UnoozZU2Zt0GA8g/yuyxNjTLN7QAZEHnEuVfCWcaynA57OrbHZxpTHnvRE7+9Zjw2k6D
         MnIc1xvcavbMJhjontAhU+WTf2GuCAMglASywi8fRAcpWCph49eHap2a7ANBQ2tMp0cC
         Mz+k1u3YH6QmolKSY81HAgMlue76qHMAqnvq5S4XNpdOsPTna/DhCtqkgmMoneJlRIiL
         EtGA==
X-Forwarded-Encrypted: i=1; AKwUvBxmVHi83RoPHmGWq8dATbMXUKtirW3mUh62RPCtgwgTro2oHN+I1n7U+yBuuvvfnnh2QUFWkZONXIjL87U=@vger.kernel.org
X-Gm-Message-State: AFuF++l4gESUi4qQZQFUkgf+ukOY114jOKq5/MNaqwIcaNIRXFAW8/zr
	05ONhG947G8P/f70iOEiNNmKEuudeRCJVHknwtey9vCIFUsnhVlF5SlrCyxXmVE0Ax4vl9aXdm9
	xv3RNb5G5XBZ5eY+41HqxdKN+rRszCWF10SJXX78Mi/pdV5KCtxm7cEw6+1oMs1XEB3i8hRl+WO
	PjfyfsNqQk447xasboCo8b42Dr+Aan6DmIsW3v1hwr7b3VlYz9KDV4eeVhX8yK2PhILnjQfAxJS
	qN6npp7m73TjAIm
X-Gm-Gg: AYBFou1CO7uk0vjxdtRPF8QSe0/hhqhLinD3VCbEjSrbRRf0JPUgoWQSVcOyX+TVAXV
	8e+v3FqCcv4YOoKoy1U60mfYfEl9HOo+IGHHHWB3SR8vZO5QgqO7iEsAFHYyLa6FNZM8OJQ05LA
	B2WoI6cN4VzSskIXBJlf1Tn7diqw0RYNv1dRekLFW8QSP8iqbiQaNmB5v9lNzW1ebQEzfnNLKM1
	YjdM6aluhoQzX9gCwATvWRixmy7KeGhN1hw2dtzAPRfHGHRdnCHCARYn/xXO7OwGUncNJXCVx2+
	601WHnb60uYObq5f0kmGJRFuUzPbtIXHf336vvUFstOjbLvpJ+AfDqH0xf/Sh0BrRrD6+0XEE0X
	SKu51jeDsGZwj0O4mdLLM34UvnQjomLSWpl9PzTpT+9janH61rtTPHuj1w6C1rHR4U9YPaOoJPM
	flaQTvM74GTzYr2eMmoMaWGnjocQ3PSgkz
X-Received: by 2002:a05:6a21:2982:b0:3dd:a007:cb2f with SMTP id adf61e73a8af0-3de26db6ea9mr9343197637.43.1790618216765;
        Mon, 28 Sep 2026 10:56:56 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cc78774027csm6477117a12.3.2026.09.28.10.56.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Sep 2026 10:56:56 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-349ffa249bdso1656043eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790618215; x=1791223015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yiEqvVPcujwO0jzo0ebX90rTLmO4XRBVQ6+xmjHfKA0=;
        b=Oc/tatWxDnvlwMpr0nV24f0byzWRqxZ+SCKVdgbWpwgQptPJyrC71TCd3FaQd3Jrvu
         XJ2TkJZ+XBIpSBgDy0aq1cddLdYldvaznSEh4M54z9f23wFw0HOC+8Z44maH+d1ovlUy
         55itRhw8LsAi7JpUkp0ajfXhIp7rDJ7NwvdNU=
X-Forwarded-Encrypted: i=1; AKwUvBxWtXkcWRxza1claD4+t0sqbtyTZLt2BN30uHvYMuMzrme9D5dDyMyCH7a5sjz91S5wYBZfDsmsRNeVhMM=@vger.kernel.org
X-Received: by 2002:a05:7300:561c:b0:33c:343a:1045 with SMTP id 5a478bee46e88-342702bf61dmr9331311eec.10.1790618214836;
        Mon, 28 Sep 2026 10:56:54 -0700 (PDT)
X-Received: by 2002:a05:7300:561c:b0:33c:343a:1045 with SMTP id 5a478bee46e88-342702bf61dmr9331262eec.10.1790618214131;
        Mon, 28 Sep 2026 10:56:54 -0700 (PDT)
Received: from vertex.localdomain ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3421dbb2971sm26076069eec.10.2026.09.28.10.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:56:46 -0700 (PDT)
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
	Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH v2 6/6] x86/vmware: Report guest crashes after kmsg dumpers
Date: Mon, 28 Sep 2026 13:55:40 -0400
Message-ID: <996d3ceefd98ed9a7c40508e6f62039ba5a15325.1790014793.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790014793.git.zack.rusin@broadcom.com>
References: <cover.1790014793.git.zack.rusin@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

VMware accepts a structured guest-crash event, but a host configured with
backdoor.coredumpOnCrash may terminate the VM before the hypercall
returns. Keep this event separate from the pre-kdump log sender.

Register a panic-only kmsg dumper with late_initcall_sync(), after built-in
dumpers registered by then. Skip the event while a crash kernel is loaded
so the host cannot terminate the guest before kdump saves its vmcore.

Issue the event at most once. With CONFIG_PRINTK=n, use a late INT_MIN
panic notifier. An unexpected dumper registration failure with printk
enabled leaves reporting disabled rather than overtaking working dumpers.

Link: https://lore.kernel.org/r/20260309235250.2611115-4-alexey.makhalov@broadcom.com
Co-developed-by: Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>
Signed-off-by: Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>
Co-developed-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
v2: keep the terminating event separate from the pre-kdump logger.
Maaz's v1 Reviewed-by is omitted for renewed review of the new ordering.

 arch/x86/include/asm/vmware.h |  1 +
 arch/x86/kernel/cpu/vmware.c  | 62 +++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
index 598d4cd448ec..ea2ce5272a00 100644
--- a/arch/x86/include/asm/vmware.h
+++ b/arch/x86/include/asm/vmware.h
@@ -61,6 +61,7 @@
 #define VMWARE_CMD_GETHZ		45
 #define VMWARE_CMD_GETVCPU_INFO		68
 #define VMWARE_CMD_STEALCLOCK		91
+#define VMWARE_CMD_REPORTGUESTCRASH	102
 /*
  * Hypercall command mask:
  *   bits [6:0] command, range [0, 127]
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 4b0e5b084c2c..70553da771c9 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -22,9 +22,12 @@
  */
 
 #include <linux/dmi.h>
+#include <linux/atomic.h>
+#include <linux/crash_core.h>
 #include <linux/init.h>
 #include <linux/export.h>
 #include <linux/kmsg_dump.h>
+#include <linux/limits.h>
 #include <linux/mm.h>
 #include <linux/panic_notifier.h>
 #include <linux/clocksource.h>
@@ -330,6 +333,65 @@ static int __init vmware_panic_log_init(void)
 }
 early_initcall(vmware_panic_log_init);
 
+static atomic_t vmware_crash_reported = ATOMIC_INIT(0);
+
+static void vmware_report_guest_crash(void)
+{
+	if (kexec_crash_loaded())
+		return;
+	if (atomic_xchg(&vmware_crash_reported, 1))
+		return;
+
+	vmware_hypercall1(VMWARE_CMD_REPORTGUESTCRASH, 0);
+}
+
+static void vmware_crash_report_dump(struct kmsg_dumper *dumper,
+				     struct kmsg_dump_detail *detail)
+{
+	vmware_report_guest_crash();
+}
+
+static struct kmsg_dumper vmware_crash_report_dumper = {
+	.dump = vmware_crash_report_dump,
+	.max_reason = KMSG_DUMP_PANIC,
+};
+
+static int vmware_crash_report_notify(struct notifier_block *nb,
+				      unsigned long action, void *data)
+{
+	vmware_report_guest_crash();
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block vmware_crash_report_nb = {
+	.notifier_call = vmware_crash_report_notify,
+	.priority = INT_MIN,
+};
+
+static int __init vmware_crash_report_init(void)
+{
+	int ret;
+
+	if (!hypervisor_is_type(X86_HYPER_VMWARE))
+		return 0;
+
+	ret = kmsg_dump_register(&vmware_crash_report_dumper);
+	if (!ret)
+		return 0;
+	if (IS_ENABLED(CONFIG_PRINTK)) {
+		pr_err("failed to register crash report dumper: %d\n", ret);
+		return 0;
+	}
+
+	ret = atomic_notifier_chain_register(&panic_notifier_list,
+					     &vmware_crash_report_nb);
+	if (ret)
+		pr_err("failed to register crash report notifier: %d\n", ret);
+
+	return 0;
+}
+late_initcall_sync(vmware_crash_report_init);
+
 #ifdef CONFIG_PARAVIRT
 static struct cyc2ns_data vmware_cyc2ns __ro_after_init;
 static bool vmw_sched_clock __initdata = true;
