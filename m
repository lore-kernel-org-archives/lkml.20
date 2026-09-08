Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA69581244
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 18:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788890874; cv=none; b=sMjd6anR/LBQkz4Kj51TACFjGu7w+rOgMdwCHJ4bQ7T72hm8iG2rEcvXPfl3MO5qJp7JWzIbnJ6CFD1Fr7rauVO10hdUC9kVE9pieZhCGZsExY+By3QNA8Qof7EvQXvSgMXbJLNE36DOnnoS3eFISx7CNMfW4G5mWrt30nLM5KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788890874; c=relaxed/simple;
	bh=OTLibMJN8TSomAcVsMbXDk3Gt+WGTUspXK8ZV+K+zOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OwLcKk3GNqweFkYAWt17IjohysI63+lRcKT8ar9SgCfEkiGbVcokK9EKwzsTMkZqGYRJmMwlmLLY3ygQL0anR6ktUdBXcD5vYGgiz+oJml5WTtHm8gKR1T4DxE63ZsZYHzAc/MDM9532kZ2Wu0VUagH67GrVxfbgX02nVl3LM3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=KwEQqq3D; arc=none smtp.client-ip=209.85.216.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="KwEQqq3D"
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-395cf2535acso4929561a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:07:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788890862; x=1789495662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X96+zYCvaN6SOrdHaZFaRkSOvwWaLyxQvweykkN1/zc=;
        b=IDRNOMqamUR31B7CTfUtcQ+Rf7fRB/xLPKB58c9cynyeTn/94K8fe4D/D3Qdph4mp+
         jzlDUf1iy/YfOOBBeGY5QjkP5iXzTiLfgP82hV5DtV7mwI+aG6s+0JZQpXONPv84zpmy
         IyC4A1Gz2NIz6rJ/djU9SPiBXQPeV7t0cP7eYczLzmFW3z0v9SsqFxabcktni43jfqVd
         Feu+BXfBoyAL46dC0aFUTv1s87wEB7LYvOspi5BpE0kYrm0qNJ0jx9D6JOGnDZM4d82U
         EsfRRGzwcFdKjENLJ7bPZnmWQ2yMrtoxZ5iVsAfkqSEZy2lDN768uhqmV3VLOqzSWnUe
         4Fhg==
X-Forwarded-Encrypted: i=1; AKwUvBw8i1dFFs4IkL4+u+suxe4rZb6sDaSHI8R0P9wY6WLD6yNAH3SlQr2aWVcPWO0oWvFRTJv6lUmbowKocI0=@vger.kernel.org
X-Gm-Message-State: AFuF++lJ0wmOBAaF1oKMrBcDRuajbt+kw/PYOZQjuGAtoGyUAMXV+S+o
	lK1C5KEqMPS5zOphLHwmoJSMmyIinxbabCzYbLvkDSELHCFRVl2Y45R+VDmIEDtnF9VPr8P0CM/
	h7luAmDuGOTe6zAsgZ51Q6Pem4rf3nesOQk7TNMH/xi6BlNSrOEQHsjzrKbDBu/YqHeyQz292uG
	9Kqo8QT8wT41ksn4zGrtpgtAvZT5weUDZu2+6Ipbrr0DuNlk7ESY91eOmhucCHEgFoF4KUOnohf
	tdH8jX4SgOlzpIF
X-Gm-Gg: AYBFou1LIQbfc0xPGYeims/yvANA9o6ZrBbvUb/IOr2cQjwO7uNdZOC9IXFVDKDunTF
	zps8azvZb8NXaLG/lFj69i5FGIiovi5csBC2FFTGN5AFfdm7ivw9YGRdDMfMyBEX2Q5khjZptbj
	vXmEBkOmdXMRkVrgh7/RpvrXwOMxUdA1T6pdu1B+/cQp0EIf3hmNC+6U94ovYZLq5FDQmyavlgj
	YIm9H/z8uxwman9RalwpyPK/r0sixwWf1akZ/cuPintj/GLqLhNesElY5yf5OVmYFLk7PN1uv6z
	rAs/rrzQaBosMeEJ4lrHlOwcrA9rbIjwq39FlGlT/tfQc6s+tJsfqZFA8wq4B3zyB6bwS6btVk4
	IeJeKoulLscAxom7awTT4RX6nblBaLOB8yzCG4RS0eS8SkaVTfGk6nGoe2cjv6B231+Ulhxduns
	QsOJvQOqMCu11gnD4YwnerMwlSeZIjrQ==
X-Received: by 2002:a17:90b:4b06:b0:398:9bd3:d6d6 with SMTP id 98e67ed59e1d1-39b8bf67006mr6773956a91.16.1788890861670;
        Tue, 08 Sep 2026 11:07:41 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-2.dlp.protect.broadcom.com. [144.49.247.2])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39b1600a403sm10364272a91.4.2026.09.08.11.07.39
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Sep 2026 11:07:41 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-66e63e9b6feso2122622d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788890858; x=1789495658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X96+zYCvaN6SOrdHaZFaRkSOvwWaLyxQvweykkN1/zc=;
        b=KwEQqq3DNLTzwafG3ph6aAbagTqUpyYqHtDBwqxGcMnjWQn5+I8N4A4hBXch13P1ZZ
         dyF26qhFaedjBNU7Pts46CFWNaDNI7jreO2z74c8O7UgmEUEsIvsytHA6TYKKTQbvmYa
         UJ2OVtgQBuUubMxID68aJ9VrsLEIDJ4CKjd80=
X-Forwarded-Encrypted: i=1; AKwUvBzAUab55HDgU6zXHWIqxTqbU1uI3uuqkz+fnQVgf6zyPZPwfdQW3tucBIFx+Hc04XAOttUajGOED/1Fe8k=@vger.kernel.org
X-Received: by 2002:a05:690e:418d:b0:671:4d2:804e with SMTP id 956f58d0204a3-67104d28276mr98598d50.36.1788890858272;
        Tue, 08 Sep 2026 11:07:38 -0700 (PDT)
X-Received: by 2002:a05:690e:418d:b0:671:4d2:804e with SMTP id 956f58d0204a3-67104d28276mr98573d50.36.1788890857670;
        Tue, 08 Sep 2026 11:07:37 -0700 (PDT)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9106412e038sm27114866d6.20.2026.09.08.11.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:07:34 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	x86@kernel.org,
	Petr Mladek <pmladek@suse.com>,
	Joel Granados <joel.granados@kernel.org>,
	Baoquan He <baoquan.he@linux.dev>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Dave Young <ruirui.yang@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Bo Gan <bo.gan@broadcom.com>,
	Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>,
	kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v1 3/4] x86/vmware: Report guest crashes after kmsg dumpers
Date: Tue,  8 Sep 2026 14:07:15 -0400
Message-ID: <8243a70e3bc282e3fbc1b507f40b889cb7e74305.1788414671.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788414671.git.zack.rusin@broadcom.com>
References: <cover.1788414671.git.zack.rusin@broadcom.com>
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
returns. Sending the event from a panic notifier could prevent later kmsg
dumpers and a loaded crash kernel from running.

Register a second panic-only kmsg dumper with late_initcall_sync(). Kmsg
dumpers run in registration order, placing the report after the early
VMware logger and built-in dumpers registered by then. This leaves no
report before the late initcall, but avoids losing dump output to a
terminating host.

Skip the event when a crash kernel is loaded. The earlier logger can still
write panic text to vmware.log before __crash_kexec(). If kdump later
fails, no structured event is sent; issuing it first could prevent kdump
from running at all.

Issue the event at most once. With CONFIG_PRINTK=n, install a late
INT_MIN panic notifier. An unexpected dumper registration failure with
printk enabled leaves reporting disabled because a notifier fallback
would overtake working dumpers.

Link: https://lore.kernel.org/r/20260309235250.2611115-4-alexey.makhalov@broadcom.com
Co-developed-by: Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>
Signed-off-by: Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>
Co-developed-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 arch/x86/include/asm/vmware.h |  1 +
 arch/x86/kernel/cpu/vmware.c  | 63 +++++++++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+)

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
index 3848811550e9..c21fc835537f 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -22,10 +22,14 @@
  */
 
 #include <linux/dmi.h>
+#include <linux/atomic.h>
+#include <linux/crash_core.h>
 #include <linux/init.h>
 #include <linux/export.h>
 #include <linux/kmsg_dump.h>
+#include <linux/limits.h>
 #include <linux/mm.h>
+#include <linux/panic_notifier.h>
 #include <linux/clocksource.h>
 #include <linux/cpu.h>
 #include <linux/efi.h>
@@ -323,6 +327,65 @@ static int __init vmware_panic_log_init(void)
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
-- 
2.53.0

