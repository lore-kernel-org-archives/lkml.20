Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794203289;
	b=iol+95llx/nMk/RYPmBHDMYOTGWFQqzcH4VVEFfT8EljgcWior3C/b+YY4e7AQ9ky1+j
	 SDXgcStz81ttUJ9WM1TtXAlN4QRERIACxvpXkRjJt4yBzGuDO2JznXU8SczpOvFYSQItP
	 UoS9WxthVFPdjvfiWtCKyxOPpwbCbH6iOX7/mBJZh5/YjQ5muOcqH/8j0Q9mUKko7CpGL
	 UamQUZA88KqdJIJA0DEE15lJEkqjexu8Lroqb7Tq0vlbVZBBajYAoGRPOmXam3JLmiXNy
	 cYY/9SIlDIFltkPju2VbDAusXyw56/yJVvKxU8Uk5VbnNPRjDM0s7PkeFneXEz15KdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203289;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=JGC1OZer+fxOvlxCzlIKJtRbCmUbw0UPR8fUshisWB0=;
	b=vl484E+sj26uySAjc1QHX8jPO/R6KYdnnWot2OJhLj+TUL343hbKCpKbiJ6BVDubMzdo
	 UJxdp2EMdzU+Hrnh2tvKJY7EGUc6kGcxoDTByDK++fxED6sFpthdkC7a3L33hsXn5IBdP
	 9lwh3/U9gHUu8xHDwmBtYRW4+GFqiyif8pn4RidDAYOMmD3tgtzbWj1p7IhMasCNZqQgn
	 rS1SqGKPqUsd4bxENwSWic2pjqFGmGP2VKfm8LEpAumHy3Nl83je2Y6DVNguVX5l/vkMn
	 e+BJLQ7V9UAAD0UAT3Hh505EGHFRxfjrE5lnwfQ8YPEcByQ3btRszNYXurW5ZZeZOwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UvGnY4Mj;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBFE606D802
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:48:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDBFE606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UvGnY4Mj
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b0b3754f57so246048a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 21:48:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794203288; x=1794808088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JGC1OZer+fxOvlxCzlIKJtRbCmUbw0UPR8fUshisWB0=;
        b=XEvRwSn7y2ne0JbdTQm8o3SmfTuGclBncbTAwGvqthihlUfnhBpm/tadby0MBJdrda
         CsDpfotq2b5TqzGHYoq7bluWcBgndN6zaouy6vSyiEtQbYJbfRoNwD4ss48Ihp0r8g0w
         5S9oCESUhzINWFAm7PZAPot6G6hxwaz8MTD2hocIVmEkQ1Fzwytllb3ABBUhoTyNb+h2
         WxtPaOhKkJkzXNuTnIRRkGnwgoos1d2vSB3Wf2YlRF829DoAIykd0+QaUIqfvIxu1yHc
         ZOQ+eOlDf8S8SF1WLp2I/Gb8iJOkUCgol/PGI7qIdovcBV2IuYFaKa0G/7v9gNuZvF+i
         wWtQ==
X-Forwarded-Encrypted: i=1; AL+hErGhgsy877U2LGHjSK58cWwuFTARmUdrRFpdALnKyvNth46ngNhOq58mF/x9/hwFz5JTdugjCg2oIdwqT0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IDEnHZ8tRVt5nomUzX64kPaD+eIeLMpDdzdkhgb/wI/SD+gDY
	FjLdCyCO2weDQmMWrHXqCTlDi2eNNuwJv4rD09b4Xap1npgBGNBnaK6hrLqpD3a/Nv05yXbpt/R
	UDVma6hkThCR/o/RUokpUuAtmDaibpygUgJIwFZboVv5cupSa/haXg0YNYYNvlklYxwgE1jxl75
	sPh38m6ERgmJGNOFyxUQQxKCOha6n/eW4oHtfDbFixmfnhjS45qJpVuwMKI5PFVz29vefSwC4ID
	14ZV03gUuqhHBZ/
X-Gm-Gg: AYBFou3cR493T31Wj6apTIxwm+rUYaLDjrFkhN99nqDh/+SY5HwdkvCRnuemCD/sKiy
	lkduqHNxMBDitpauHsK9y6plTW/oTUzij/Y2KVXaBYhttDOYOBUOHhR3JbPSbwYZz54NcLoMXX9
	9f5honj9hId3uNefAhPLdfaTHiXwmgBEQ/sC6n8LlxjSSN3cFWz/L+PY4hSFbqu8I+Ihh73lgrF
	78AkzOE7Hm5EXyIS4G5LJ3x5UqqyDIROdrURdLLpJ/J2fJ6sshpfUJhK64Ms6qewemZ52oGFG5N
	fL35aMTZrK7aeGCGH8RnpC1LgXsPzqcqFRrX+IlRB61wXCBCkpvanRl8kvUysQI4UZWIH5MrvhR
	J7gQSYSFICwkKPN60AQ4NnfIDx2ySnaP5zb7sgkRhx2IDu7lqBtWaV+uf/1t5rs55FBkEoeor8b
	wjR86bp5DTNP+rst4NOJSq8LYL+OtPfq2G
X-Received: by 2002:a17:90b:4c84:b0:3ac:1c76:61c3 with SMTP id 98e67ed59e1d1-3b12d3589d0mr2641023a91.27.1794203288136;
        Sun, 08 Nov 2026 21:48:08 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b127953188sm3048341a91.7.2026.11.08.21.48.07
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Nov 2026 21:48:08 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a71dd190b0so2292335c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 21:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794203286; x=1794808086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JGC1OZer+fxOvlxCzlIKJtRbCmUbw0UPR8fUshisWB0=;
        b=UvGnY4MjLynlK25mSf+k6MbC/Z6xgq6t+6Zfnx2aHIz4uaY3WKApFVIlgT0lGLdwDY
         /p0g/PFPtvYmwdUHKGhJ6yMJS8T7KPHdFnPTmqG71BOCj0YuXnRDJ7UtX4Q/Lec4jeWf
         j00lhCCbXjC7ZAIX15UgoI29/i9jXUgWYj2Zo=
X-Forwarded-Encrypted: i=1; AL+hErFOmtcZZBd3idqu5aJZwsbTlfLd/Q9395C9sgHlQKN+fL6LQcsILrey5DgcKBtTUci8CMc3vsRaUR1771c=@vger.kernel.org
X-Received: by 2002:a05:701a:844d:20b0:153:21e5:4328 with SMTP id a92af1059eb24-1b39fe9a93dmr4799602c88.17.1794203286110;
        Sun, 08 Nov 2026 21:48:06 -0800 (PST)
X-Received: by 2002:a05:701a:844d:20b0:153:21e5:4328 with SMTP id a92af1059eb24-1b39fe9a93dmr4799565c88.17.1794203285441;
        Sun, 08 Nov 2026 21:48:05 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37314626dsm13745136c88.1.2026.11.08.21.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:48:04 -0800 (PST)
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
Subject: [PATCH v3 3/4] x86/vmware: Add the vmware_record_panic_msg sysctl
Date: Mon,  9 Nov 2026 00:47:39 -0500
Message-ID: <abaa78b64a6f975bae42d8ef523062e55554a28e.1794201807.git.zack.rusin@broadcom.com>
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

Allow administrators to disable host log transfer on ordinary guests or
opt in on encrypted guests. Expose the boolean recording policy through
kernel.vmware_record_panic_msg using proc_dobool(), as Joel suggested.
Zero disables recording, nonzero integers enable it, and reads return
0 or 1.

Register the sysctl only after the logger is ready. A registration failure
leaves the internal default in force. Document that the log is sent
before kdump, and that disable_panic_notifiers_platform_list also skips
it.

Link: https://lore.kernel.org/r/4e73yd2ofpdzl6rptzvd74no3hnyfblknoq7wzxlw7f3zjbz7c@srfabx6lsusj
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
v3: Document the platform list ordering and the disable switch, and fix
the short section-title underline reported by Sashiko. No code change
from v2.

 Documentation/admin-guide/sysctl/kernel.rst | 20 ++++++++++++++++++++
 arch/x86/kernel/cpu/vmware.c                | 15 +++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index 608055d7ccc4..be2d5aa52362 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -1680,6 +1680,26 @@ entry will default to 2 instead of 0.
 = =============================================================
 
 
+vmware_record_panic_msg
+=======================
+
+Controls whether kmsg data is written to the host's ``vmware.log`` on
+panic. This setting does not control the separate VMware guest-crash
+event. Writing zero disables recording; writing a nonzero integer
+enables it. Reads return 0 or 1.
+
+= ==============================================================
+0 Do not write kmsg data to ``vmware.log``. This is the default
+  for encrypted guests.
+1 Write kmsg data to ``vmware.log``. This is the default for
+  ordinary guests.
+= ==============================================================
+
+The data is written by a platform panic notifier: early in panic,
+before kdump, and also when a fatal oops enters kdump without a panic.
+Setting ``disable_panic_notifiers_platform_list`` skips it as well.
+
+
 warn_limit
 ==========
 
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 0c6f7248a665..8c8b6dd7c3e8 100644
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
