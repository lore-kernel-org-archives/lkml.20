Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794203295;
	b=auiqt0RIyp8rvdpDp2cV6EZFWxOExexDACFTd584wVDP3obpremAD9X/gdTHKORzW2Jw
	 /pE1NmBPMoK8BNaBe7Iucr/7V2S7OkJSUmbzhp8yr6mgWLVrviToGIBhaxDkp56vN5ji5
	 Cki2Bm/vreJAj0i6M7dnXAR2qZ8FVQt/w68IJI0cApmfhIrH47qZZ6IBdCPuABRwH/2bb
	 sLzj/6IMWnCA5aAEIxViINII7Z5evH67oL3sEY8IzWkyC0G2vgYY5dlwwgIcIb0wktLZS
	 yZs48HW/h1VKkWD3TFewv8NeneUp4k6uV5C7wtW5dJxCLuNr9kgAG/KFjktveaqyvPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203295;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=gWw97lsSXhpRitO5f1gnEdnOwIiPfae0nOjP6jdEUEo=;
	b=JWZ6FBsDqP0IHDMBQHI9cOFx1Y0kmZaxV3YhPRTX5HJV0lXH+v4C4K50gxg22oFYPqj5
	 lChK7oQ/U+wBDwxoZFMb4oFWwQnI4NH4CfE8fdHnIfRiBUwnh1pjavbkEeI4Nq8XHk/7L
	 N9BgVkX0Gh9RXFFwox58xq9zFPpb+MqWWeghWM9IBCuHrzFqJ8HlmIa4Hx9xnI9VBDSMr
	 tYv3Nk5dnvDMMS4VSAGfpyN9/icCYu+j9+HyUf7OPnYDLwuTE48P/LhddNTIn9FjRg2/e
	 C/zlIB67d3mgiIEBO6CUGzUfQ+7LbVf/b6VWJg1x/IHmz6mRofusxpA8NNxt+cBCicg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=SMj+wkuP;
	arc=none smtp.remote-ip=209.85.160.98
Received: from mail-oa1-f98.google.com (mail-oa1-f98.google.com [209.85.160.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1D1606A337
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:48:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC1D1606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=SMj+wkuP
Received: by mail-oa1-f98.google.com with SMTP id 586e51a60fabf-451a49abd8aso422787fac.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 21:48:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794203294; x=1794808094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gWw97lsSXhpRitO5f1gnEdnOwIiPfae0nOjP6jdEUEo=;
        b=KZ1aFqkt0loMbP237k0AjVQNJy9lGpyE6F8odJvZ6B7dE5hvQqr9mC2SKk1bmXvrfU
         7r6AQgs1M6vSRvJm8Vd2VsNHFnVsrxjSytIxa0O+x2vWLRCO0gswUUYeVbKPmzUsFt3C
         s3MDfjBpbM+kvDPGOk/rZt8ANC/W0oYF/J53xxTqhUyLECSSsEH+tYat1h14k3FEASHd
         1+O0T2CRRI93CuJvLfr7WbX/+6oO+uO/eFqW8PhHCTxHWDaaXMgTU/yTc4LrHFv3In2j
         r0MZFJvvwwxJcwbt7eiUCYqrqDalZLdSiZuR75S8CYQGSKTY0I1JfKoQRorQFAwlQeFY
         Qd+w==
X-Forwarded-Encrypted: i=1; AL+hErH3eI5wY78SI6WU4VmnGwU5qmsqjQfH3A6+z7RZC76SIPEBh3HXcSi4jIMpHR6xT+mSy//g1Nl7+OeWRCg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HAuZ4gaE8vzDh+4RaKt2e07P2xV68Mmfz0/mw/WhuwAkHEKsx
	FCOzuT5KTC3LT6cxNngmD7ZAkG2O1jgI2IYjj9LwslyesH5XS14e6qDK0a9Viv5dJlHO63kZRkx
	X2nzulSspKHsLwVmia6IMdIpwYl5+hmYOPj69ZptuX44iYYipS7xCFR5JLwWpme8HgPqLmlethK
	55c+pPN4o+zDtwfCpQMMfW730GWR8zvVatJTRAiM/MXTe8wOyU1Nfu24uZvpyBJijhoutUYTqj5
	KtwbFnsZyVv0VqS
X-Gm-Gg: AYBFou32FhUiM59xbe0YDxVOertERGtk7BrTzVgTeLUi87B8I9sTK9Okb/AvveIiCrx
	rvsb7fdAE9HFohhysdj3OGUELSVBBtdw5vkXO0mFYj0N4j2Vvdv/+IgIpQDmuc5CKcVt5QXGfaq
	WV+pgf3Cj5En6DHQP/inJlNSvY8R1NaEwm2PQkf7XQzfc/SCugi3emkxCMETLkFDsjIBTXvmjMu
	pVdls5dJy239y+6nXyKqh+fDsHUG7in976HhUuMxkTuk9wlpPgftqdJmHw52lrS1T2OJSaE0WRP
	C1w/tGrpgaFgin1O2jMm+c/95z9osKUTE4NdRpdEM8ikv8b4xmsdJ7OE5yvxjTPMaZRWGULf0Da
	J4cJ3VVISvZ//X8HWFzMURBALR7sIru/q2RPsfuYaYirFiG4TFHjwSh28/95HXUYCw80pxvXcqA
	lXNCM79PdxhVb6kjgDGwej9VMcIS22vQt/
X-Received: by 2002:a05:6870:c2a2:b0:49a:84fb:a67e with SMTP id 586e51a60fabf-4adec02621dmr1966089fac.19.1794203293671;
        Sun, 08 Nov 2026 21:48:13 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-4ade69b94a0sm32252fac.14.2026.11.08.21.48.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Nov 2026 21:48:13 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-154e9d2d94fso414126c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 21:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794203291; x=1794808091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gWw97lsSXhpRitO5f1gnEdnOwIiPfae0nOjP6jdEUEo=;
        b=SMj+wkuPxAbxNy0Qg1AbvPDZZKjgDLTHSyjRXfiNKRCyJTE/pXUwqr425GIdRXlKoA
         Z+SOiP9lXoQYZ83TuNzdF3PgjDxlCc+djPT8DrO1pmxn88biy8imPCxXVK4/34tqdehG
         EQE5mXahetgqu5CIPQLuuZU3pzmhfgN2FFkFk=
X-Forwarded-Encrypted: i=1; AL+hErGNMsQ+noAT5o8vwDLn4i1KtAkP+KC4Lj2EZ5b+aTXCiPpuoQ68WbsqVHatn5oDqjCwu4BqXd8/4cJTOKM=@vger.kernel.org
X-Received: by 2002:a05:7022:b052:20b0:1ae:abd0:e2b6 with SMTP id a92af1059eb24-1b39ff033c5mr5293794c88.38.1794203291142;
        Sun, 08 Nov 2026 21:48:11 -0800 (PST)
X-Received: by 2002:a05:7022:b052:20b0:1ae:abd0:e2b6 with SMTP id a92af1059eb24-1b39ff033c5mr5293760c88.38.1794203290476;
        Sun, 08 Nov 2026 21:48:10 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37314626dsm13745136c88.1.2026.11.08.21.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:48:09 -0800 (PST)
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
Subject: [PATCH v3 4/4] x86/vmware: Report guest crashes after kmsg dumpers
Date: Mon,  9 Nov 2026 00:47:40 -0500
Message-ID: <4dc02120a69e0d4b21f1ea3a12b4aedf6f22e706.1794201807.git.zack.rusin@broadcom.com>
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

VMware accepts a structured guest-crash event, but a host configured with
backdoor.coredumpOnCrash may terminate the VM before the hypercall
returns. Keep this event separate from the log sender, which runs
earlier in panic.

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
v3: Rebase. No code change from v2.

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
index 8c8b6dd7c3e8..ead9f50cf89e 100644
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
