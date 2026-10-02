Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6543A442FC9
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790930461; cv=none; b=sGzfNck6ppehIaIb9GZaZlFT6SvR31SFUi6qN7zh/6l4aMlVu6kpoDDl6GoXSnNuFDJmpY686Ur8vfPFA25fcauKTchB1YTLr+5POwZPgvj7+qF9ZmvFP1vAmc0jkyUmaz4z8vjt4pVWuGIiGUV3SOH6QNdacHbPgSIPhadJtJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790930461; c=relaxed/simple;
	bh=XGIsPe5VYmFTNDwvI1iPoU75K1/ZEYNX0bKGPikeEIE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pCq6l45ur9EEoJtVgPqfPGLGWw0ooOIsstuszWzwtRgV7b65y79So0tKAdEz+h7T4bgiB2S2U8/gTOcqCDbBvkYqBQBO2obGULofpIpbWg53T3wRg3PjlFVeQssz2iiL3FAlJ7zDWM0xQdQuotDYqFLirfx2qY1P4TY0MBoB/VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Pijqgz60; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Pijqgz60"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b01c4f4daso2101316f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 01:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790930458; x=1791535258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GhEtQbOD3vIkiy+Uh+aMP3dcdjE75yUCtt048jlfAEk=;
        b=Pijqgz60LB2iEJOIlBfCKpq814urkYYZGr0jSz2BpUpnL1HebWRgwGNqmmxdb4VcBg
         fVX9928eD8cLHVLKx6PxvsNDP5Pa1Xv9VJLEAaUfyCmHQOe04VH4Wty1Vbte+C9e72Fd
         YB2TuHv+ZQUbIZuxF0KpEuHvjY2knOMVD1ogZPJ1fd+2O323gYfICEnQSXA0feOexA3O
         mm2eiUPiWvL10jvoXUt8EyI51FttVHB5uFv5CX2Bn/jaoj76c1zPDr887C3xP32miZI1
         lRz7NaMrw8sQMIFdVxg64rUB8Z/rgT2SNZxupsgrbz2ldNagwx5nMQjewfALFg8Gtyrr
         3R6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790930458; x=1791535258;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GhEtQbOD3vIkiy+Uh+aMP3dcdjE75yUCtt048jlfAEk=;
        b=k6275Xe1DcMQCBuPY4Uf32KfCEE9qcVEP587atRL9D1vv7RERRRCC2TCZ5j7znV59e
         UgUYsx2lFHRdZAYg6PmQSweN6Em+TrRO5aWo20sEdEM92g8anrOCKihPHwAtLfi6hX1w
         fS0x2fS6V+vBoqMWrlRzQzziJ8hBEMV6p6FwdNal2a+vUkmVd8uf5wFnPSscvZrL1ixD
         zCbU+UIu2aSl9hUJaSUjh6BpegT73GGJW7Mx3YztdeoDctUiuU31yC9Yx3Gcenr9EDIm
         GxgSvW7U5sjxjcpQgXnEaxDOJr5Ma6NGb2NdRRNXGmLZWtTW1GqSFTcDQH7MNDJG4DOR
         Hd5A==
X-Forwarded-Encrypted: i=1; AKwUvBxTvKAaWAWJ1ocSCxgthC00j9L0OX1eczceEsmPq3ek2wKnb+oRNu+r5sOxesCQpdKERuGn6cZJPzOZXyg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7F77V42f1JChTUSVhxccuoxP7Ve/8XVFNcN3TCo5M89tqVfU5
	fY4Ttb/AaN/mNNHR26SmMZF6wZd5h4pxwq6aC64Sc3CgRoNwrv6BAe7XlXp83jShmxk=
X-Gm-Gg: AYBFou29iT3zE4azS56AntKtscjhUyQPJMyIjdzqtTl9NQloNxtwEWBZ0JDVYuVSS2n
	QaAZmd8Z0gvN7a1QQtR2AQ7r4iUgAKBHHLElxiYZQK5lWZNVQr5SKGMQTgwERjnMn1HED68juUJ
	c2ff2sDlYVxArIPzmLPvkei1BrUeP/Ag/Np2IFMrXlwDvC+b5HiVec4rKPsGTcJv0kJplGor2zq
	h+xtoWo2lu+d9+V7CNGnpO8xa84Uq8Tecl08wVEOizzYTPipJ3nGHakxoJes/0P5FMPku2zVXE6
	Pe9I/E6HCdjyjhS3qAzOpRJrMXiuYS8KSU9ymN46KP9F2K8PnWtf6eVG8kgOcj6EeKiwnX8zkVh
	kT6jBD4D1KAaDhKtrWBSkjcdIBpaHrI0y7l6nIfXNbzUKkmhdd8fc4biPMI9S5f1PurRFBs0O2I
	q+7jTX21F/+TBZrdaDJXr/Cze8p/aoOVQmbLMGfn6Nwdjc2QunXZ9g9oxCWD7R4ocfYA==
X-Received: by 2002:a05:6000:4717:b0:487:7fd:730 with SMTP id ffacd0b85a97d-48b1271cda5mr3589115f8f.13.1790930457545;
        Fri, 02 Oct 2026 01:40:57 -0700 (PDT)
Received: from zovi.suse.cz ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f07cdsm4103624f8f.10.2026.10.02.01.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 01:40:57 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>
Cc: Aaron Tomlin <atomlin@atomlin.com>,
	John Fastabend <john.fastabend@gmail.com>,
	linux-modules@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] module: Add stubs.c for CONFIG_MODULES=n module_put_and_kthread_exit()
Date: Fri,  2 Oct 2026 10:40:38 +0200
Message-ID: <20261002-module-stubs-v2-1-a0d8c6ad1738@suse.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260918-module-stubs-dccefe41dace
Content-Transfer-Encoding: 8bit

Module-related stubs for CONFIG_MODULES=n can normally live in
linux/module.h. This works well when the stub does nothing or simply
returns a constant. However, some non-module implementations may be more
expensive, either because they have a real implementation or because they
require additional dependencies to be pulled into linux/module.h. This
header appears in roughly 15k #include directives across the kernel, so it
should avoid bringing in unnecessary definitions.

Specifically, linux/module.h defines module_put_and_kthread_exit() as an
alias for kthread_exit() when CONFIG_MODULES=n. That in turn requires
linux/kthread.h, even though linux/module.h otherwise has no need for it.
Note that linux/module.h currently doesn't include linux/kthread.h and
requires its users to pick it up through other paths, which is itself not
quite right.

Introduce kernel/module/stubs.c to hold such stubs, built only for
CONFIG_MODULES=n. This mirrors kernel/time/posix-stubs.c, which is used for
CONFIG_POSIX_TIMERS=n.

Define module_put_and_kthread_exit() in both CONFIG_MODULES configurations
to call __module_put_and_kthread_exit() and add a CONFIG_MODULES=n
implementation of that function to kernel/module/stubs.c. Since
__module_put_and_kthread_exit() is now implemented even when
CONFIG_MODULES=n, remove the corresponding '#ifdef CONFIG_MODULES' from the
noreturn_deny BPF list.

Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
kernel/module/stubs.c should also be used for add_taint_module() [1] in the
future.

[1] https://lore.kernel.org/linux-modules/a79a6a06-cc48-4036-882d-95e9b4cc01cf@suse.com/
---
Changes in v2:
- Remove the unnecessary include of internal.h in stubs.c.
- Remove the unnecessary EXPORT_SYMBOL(__module_put_and_kthread_exit) in
  stubs.c.
- Link to v1: https://patch.msgid.link/20260922-module-stubs-v1-1-abe465a24879@suse.com
---
 include/linux/module.h | 9 +++------
 kernel/Makefile        | 2 +-
 kernel/bpf/verifier.c  | 2 --
 kernel/module/Makefile | 4 ++++
 kernel/module/main.c   | 1 +
 kernel/module/stubs.c  | 9 +++++++++
 6 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 96cc98568eea..4c7bd7f9f889 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -658,10 +658,6 @@ static inline bool within_module(unsigned long addr, const struct module *mod)
 /* Search for module by name: must be in a RCU critical section. */
 struct module *find_module(const char *name);
 
-extern void __noreturn __module_put_and_kthread_exit(struct module *mod,
-			long code);
-#define module_put_and_kthread_exit(code) __module_put_and_kthread_exit(THIS_MODULE, code)
-
 #ifdef CONFIG_MODULE_UNLOAD
 int module_refcount(struct module *mod);
 void __symbol_put(const char *symbol);
@@ -850,8 +846,6 @@ static inline int unregister_module_notifier(struct notifier_block *nb)
 	return 0;
 }
 
-#define module_put_and_kthread_exit(code) kthread_exit(code)
-
 static inline void print_modules(void)
 {
 }
@@ -879,6 +873,9 @@ static inline void module_for_each_mod(int(*func)(struct module *mod, void *data
 }
 #endif /* CONFIG_MODULES */
 
+void __noreturn __module_put_and_kthread_exit(struct module *mod, long code);
+#define module_put_and_kthread_exit(code) __module_put_and_kthread_exit(THIS_MODULE, code)
+
 #ifdef CONFIG_SYSFS
 extern struct kset *module_kset;
 extern const struct kobj_type module_ktype;
diff --git a/kernel/Makefile b/kernel/Makefile
index 1e1a31673577..08a94594975d 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -58,7 +58,7 @@ obj-y += liveupdate/
 obj-y += dma/
 obj-y += entry/
 obj-y += unwind/
-obj-$(CONFIG_MODULES) += module/
+obj-y += module/
 
 obj-$(CONFIG_KCMP) += kcmp.o
 obj-$(CONFIG_FREEZER) += freezer.o
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 72a3f5998dd2..be70f10e4968 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -20417,9 +20417,7 @@ BTF_ID(func, __ia32_sys_exit_group)
 BTF_ID(func, __kunit_abort)
 BTF_ID(func, kunit_try_catch_throw)
 #endif
-#ifdef CONFIG_MODULES
 BTF_ID(func, __module_put_and_kthread_exit)
-#endif
 #ifdef CONFIG_X86_64
 BTF_ID(func, __x64_sys_exit)
 BTF_ID(func, __x64_sys_exit_group)
diff --git a/kernel/module/Makefile b/kernel/module/Makefile
index 50ffcc413b54..72fd2972eacf 100644
--- a/kernel/module/Makefile
+++ b/kernel/module/Makefile
@@ -7,6 +7,7 @@
 # and produce insane amounts of uninteresting coverage.
 KCOV_INSTRUMENT_main.o := n
 
+ifeq ($(CONFIG_MODULES),y)
 obj-y += main.o
 obj-y += strict_rwx.o
 obj-y += kmod.o
@@ -23,3 +24,6 @@ obj-$(CONFIG_KGDB_KDB) += kdb.o
 obj-$(CONFIG_MODVERSIONS) += version.o
 obj-$(CONFIG_MODULE_UNLOAD_TAINT_TRACKING) += tracking.o
 obj-$(CONFIG_MODULE_STATS) += stats.o
+else
+obj-y += stubs.o
+endif
diff --git a/kernel/module/main.c b/kernel/module/main.c
index d0e1e0bd2ad0..a8bf803afa81 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -60,6 +60,7 @@
 #include <linux/codetag.h>
 #include <linux/debugfs.h>
 #include <linux/execmem.h>
+#include <linux/kthread.h>
 #include <uapi/linux/module.h>
 #include "internal.h"
 
diff --git a/kernel/module/stubs.c b/kernel/module/stubs.c
new file mode 100644
index 000000000000..1385c87e8169
--- /dev/null
+++ b/kernel/module/stubs.c
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/kthread.h>
+#include <linux/module.h>
+
+void __noreturn __module_put_and_kthread_exit(struct module *mod, long code)
+{
+	kthread_exit(code);
+}

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260918-module-stubs-dccefe41dace
