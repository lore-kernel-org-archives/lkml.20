Received: from mail-oa1-f98.google.com (mail-oa1-f98.google.com [209.85.160.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B994E06ED
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618208; cv=none; b=FOT2LKZC6lUGxY65QA9YRgB1q+21TrHg8VKkDewTR0gJul1LIpDM+0J17CBkMd3Ur0Tz9w3BKA3n0jONbL8yKHKC4dmSKZf0XX8WFTmxKq5r7uYLrhx+2UorLqvCV3n1eeg3ioLsDFTuA1N2LDLEdoE7oLkrN62i169f+H+2//A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618208; c=relaxed/simple;
	bh=5aQuQm3bDSHDGXMaipi3sPWMnLQu2UOrACug29vYOto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hPFI5HTh9/PwBRn/TIWI/rg2SEX+Xvg7jF1pYvIe71VpeDCkOYnOa/Xx8n3kASOPRHcjwqjO6DIGuA3I0e1/Ijh9Uipa/N1nUywPguJarBaRKhCei5CD1CZr4NUFqehe7PFSNkzBdXrOrGYp2Jbc/VRBG1z3N9/jFGxAmdz1+II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=FX/P9BPV; arc=none smtp.client-ip=209.85.160.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="FX/P9BPV"
Received: by mail-oa1-f98.google.com with SMTP id 586e51a60fabf-483a66818edso190727fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:56:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618206; x=1791223006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rTHP+RKFRTvsoz5ZQC0H2auzr0/LWHqaonCSO4TGaa4=;
        b=g1oQGlNF9g6pk0r2iKgK7A+n97WgBUFPt5SqnpBXxED7d+sGP4HG4nyuQ+RlI+19z/
         ljjgtbRWTlq93m4O7l8wvCos4WKgcmZfwTmtKqn1e1vDNa/1DpteNr5dx8Fg8iXAgs3u
         0kYY5Ypnj1ooqeNCVjqN87FWUwl9iphi1kMi6/dGWqHj2asYBIuNvPItQV+xUL91Zjnn
         L32AS8qDYOva50PxQiWS5vjIDoern202Hn/HGD1iVlPkeBuvIoi9vjHWsiT2K/2fTIld
         vbafADCralZza3SyBrgh/LSfNN3tILzRD5jG4hwNuJiykFzC3EYkZ+8QuEuKpx+L0uzO
         TU5g==
X-Forwarded-Encrypted: i=1; AKwUvBz9PA3ggpcsVSwxmAkAWbY9RgKaR9vh/TIL9vCvN95MTGj6SqXLLp1PwwhZ0Pk5omrMSMhU/F5wmRjhNSw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7MQ56HgBHrUBpgCE8WIcqlpjtf/Wt/g8QYDdpdWChRUVhAI5U
	Esj6qMOzpNPHyNaYngpO8eiWxXrkhJUHEK1GB7IgSlX8O0+K7+Jmn6KMl2xH63S6Voy3a6enBnI
	Hqnjb8HIO9GYqFJTQSCPSl6PzOUhcCweJaVkgF3uYChHsHjY0X211mM4iwG4WdcfB575CeAa2yM
	98PtQpNSM5i/lOKHRdChtngSEmORmdHJaK8do7WCoVUVqKXT865ROu0Pr8dnl1MrYNSSIONzDr5
	tL37ujvl3lWwBuD
X-Gm-Gg: AYBFou0NFrxeQtcdNXlG4xkkUU7Q/FG9JaQGjhqk9N+C8s0yH9c0tH8xYBF9ktUtcho
	gtVlCl7ujg6R2b4K8Jwfhp7Y8IjmygQ6xrAcKJDGcIHMY+ct4tXOQmt6J8j6Mf0fp8qzVgSw4ty
	FS3aAKyF7rEpOAzTjBLyrcYgfSyX9aL695EjMWHIaTLqGhr0SrmKX20Jto9iB8sA85dZK7+aIIx
	MefvMFIiEZQBdc3Bj1V56NOaztG/GlrUudhkumNtgTWx80gSInp/xFTMDBG0OdY1bfAYdXxHFgt
	BmNXrttNZNEq1iCuxU1lNe+n6H9VcT2Pyzk3ghrSDLeBUQEYCkOWrX/pThdSz9h3cBzGdDahQlc
	P2RdcD7usrlxm7VXwprZhiRVj+Z9rScybTwsgFzNHFK1pwgRtshITl2uzltVIQeZJQD2TTbcS1C
	RiN8FaRd7Sj/4a+BB5RR+hC32V7HK7VZKh
X-Received: by 2002:a05:6871:70d5:10b0:492:d8bd:949d with SMTP id 586e51a60fabf-492d8bdc50dmr6563934fac.2.1790618205879;
        Mon, 28 Sep 2026 10:56:45 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-18.dlp.protect.broadcom.com. [144.49.247.18])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-493366b7a72sm1194154fac.14.2026.09.28.10.56.45
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Sep 2026 10:56:45 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3437d0cc8c7so6739058eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790618204; x=1791223004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rTHP+RKFRTvsoz5ZQC0H2auzr0/LWHqaonCSO4TGaa4=;
        b=FX/P9BPVFkbcjNSTF8HxmGGgH57JHq1fn3d0nhL9xhDdLrCbqaAF6lygQfW+rJEL1d
         CLJUqr9CG2zkVWJCBvvlQqjpEsWCkNXP98xRyhzvxAo1xZji/52WJqZ3+G5ALwhIuCMV
         bmX4tGSBmOg/na6LX82hVNNXaV9kqBKYZh51M=
X-Forwarded-Encrypted: i=1; AKwUvBx4DAfZ1SdQXVgXOxn08FQi6pTitPByGpOsAA2tpRJAmAMxQX+Fk5k1SzTA/R6uxRRiO5hCv7NjfTtDzUQ=@vger.kernel.org
X-Received: by 2002:a05:7301:1a02:b0:33e:84c3:a056 with SMTP id 5a478bee46e88-342710ae7bamr9978551eec.17.1790618203893;
        Mon, 28 Sep 2026 10:56:43 -0700 (PDT)
X-Received: by 2002:a05:7301:1a02:b0:33e:84c3:a056 with SMTP id 5a478bee46e88-342710ae7bamr9978508eec.17.1790618203106;
        Mon, 28 Sep 2026 10:56:43 -0700 (PDT)
Received: from vertex.localdomain ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3421dbb2971sm26076069eec.10.2026.09.28.10.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:56:34 -0700 (PDT)
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
Subject: [PATCH v2 5/6] x86/vmware: Add the vmware_record_panic_msg sysctl
Date: Mon, 28 Sep 2026 13:55:39 -0400
Message-ID: <269888613b5dc16d19899b2c87c5ecdfd2610e8d.1790014793.git.zack.rusin@broadcom.com>
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

Allow administrators to disable host log transfer on ordinary guests or
opt in on encrypted guests. Expose the boolean recording policy through
kernel.vmware_record_panic_msg using proc_dobool(), as Joel suggested.
Zero disables recording, nonzero integers enable it, and reads return
0 or 1.

Register the sysctl only after the logger is ready. A registration failure
leaves the internal default in force. Document that disabling the old
post-notifier ordering does not disable this independent logger.

Link: https://lore.kernel.org/r/4e73yd2ofpdzl6rptzvd74no3hnyfblknoq7wzxlw7f3zjbz7c@srfabx6lsusj
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
v2: use bool/proc_dobool as Joel requested; document direct crash entry.
Maaz's v1 Reviewed-by is omitted for renewed review of the changed sysctl.

 Documentation/admin-guide/sysctl/kernel.rst | 20 ++++++++++++++++++++
 arch/x86/kernel/cpu/vmware.c                | 15 +++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index ffea61d448eb..be13c143b8bb 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -1690,6 +1690,26 @@ entry will default to 2 instead of 0.
 = =============================================================
 
 
+vmware_record_panic_msg
+======================
+
+Controls whether panic or fatal-oops kmsg data is written to the host's
+``vmware.log`` before kdump. This setting does not control the separate
+VMware guest-crash event. Writing zero disables recording; writing a
+nonzero integer enables it. Reads return 0 or 1.
+
+= ==============================================================
+0 Do not write kmsg data to ``vmware.log``. This is the default
+  for encrypted guests.
+1 Write kmsg data to ``vmware.log``. This is the default for
+  ordinary guests.
+= ==============================================================
+
+``crash_kexec_post_notifiers=0`` alone does not disable this logger.
+``panic_pre_kdump_postpone=1`` skips early logging but leaves late panic
+logging eligible; set this sysctl to 0 to disable both.
+
+
 warn_limit
 ==========
 
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index ccf8dc84b30e..4b0e5b084c2c 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -33,6 +33,7 @@
 #include <linux/reboot.h>
 #include <linux/sizes.h>
 #include <linux/static_call.h>
+#include <linux/sysctl.h>
 #include <linux/wordpart.h>
 #include <linux/sched/cputime.h>
 #include <asm/div64.h>
@@ -260,6 +261,16 @@ static int vmware_log_rpc(const char *buffer, size_t length)
 static struct page *vmware_panic_page;
 static bool vmware_record_panic_msg;
 
+static const struct ctl_table vmware_panic_sysctls[] = {
+	{
+		.procname	= "vmware_record_panic_msg",
+		.data		= &vmware_record_panic_msg,
+		.maxlen		= sizeof(vmware_record_panic_msg),
+		.mode		= 0644,
+		.proc_handler	= proc_dobool,
+	},
+};
+
 static int vmware_panic_log_notify(struct notifier_block *nb,
 				   unsigned long action, void *data)
 {
@@ -311,6 +322,10 @@ static int __init vmware_panic_log_init(void)
 		vmware_panic_page = NULL;
 	}
 
+	if (vmware_panic_page && IS_ENABLED(CONFIG_SYSCTL) &&
+	    !register_sysctl("kernel", vmware_panic_sysctls))
+		pr_err("failed to register panic log sysctl\n");
+
 	return 0;
 }
 early_initcall(vmware_panic_log_init);
