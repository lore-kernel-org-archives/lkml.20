Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D8552E042
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984931; cv=none; b=fo44FhVkZxy15oZXcMEZRqPTwq+H5EW6qK+Lts2fEYAgE+olj1VklqHf2Ly/MhXVBqG+1oSqqALZ/LknD/99M2PtJ0qRh82Zsx/Oo73eXMggMsHPztqkwEq9/2EhjEPDY5E+Ap61EHBtva9Q3IccTQSwoIDEYLWiPygadSIsCog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984931; c=relaxed/simple;
	bh=aB/aUqi9pUDXYoeosi8ibg5RtaOs9N6espCUqkY+dwY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GwDnI1+WVySFp4M6jytjwX7qfxcqR4fw+uyDgINOgMxWE3Nma/G2qAeUqPaadVp1gqO+sQ2ZiQavjqxpk5Lv5sgH/z5Xfftu7+cf5H4qfJFLTbo6OavynY/LeqLU1hv/3weyTTUr3QKeZ/BXt9uZtlTVq30IgDQ1NNeBnse/Ijg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HQMRlJr6; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HQMRlJr6"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c6955a7c3so1141371f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791984922; x=1792589722; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J16Lw6qXYObY2qJP+E/pNTxVqsLsb6thBdxPaIOsqSg=;
        b=HQMRlJr6Z9zh7VxIaE12MzbNPkOCiDhms5BW577NNF7RmnYSoJihb2feyEL/KCHsIO
         ybDuCRa5PaWaegpyKMP2N0P240AoDVIaq4bg+UUAnetnyesra7r0pIKz4RS9BmByRHOu
         9HfI3APT+1ARKtmavbX+HhmAt9FhxuGvp7p3/el6jIPtxDPZApoXE2lFXDsdNNcOjsTr
         mME1SDNj1E/qVcDtu/Xk3AQ6LS5IiDVLGKP4ViJniqvMS1OgO75NsqSSEmeQ7rFc1GfB
         VssGJj/x3ruEF97d221fL95x4aOA8+cPlSQlkOXLkL17Mebp8lR6isEdugc+fOSSCceI
         mA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791984922; x=1792589722;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J16Lw6qXYObY2qJP+E/pNTxVqsLsb6thBdxPaIOsqSg=;
        b=0X837SNmhD51jMZabW/8jGXqKk/fzKKE1UvwUFdleXqY1/UFH3E2JkW8V6Z6stbIkk
         w/MDr3AtLcE2ciZeUrwiFIWbSOmPkCWf4EnmaEz2UeLapqG5k/VbR4PE2F/fyPAtBEvL
         cb5dUVxLmR0WSku/JtpHXH+C4TCon7XkpM4anMts0OVVtsc5ll00d/AifevRsbaSuNFI
         x4LRF4T59Mc5JgM0cV/zdaJ6yGrpyxkrPL2DrP2oIwvnev9uwwD8fFy/7O86JOsr/chB
         VxlU12lALlad62bVeNAl0sWfGem6YQFhQ+cDv1XPs5Wul2lBLaXz69MAxhihrXvuh/Ns
         eE+g==
X-Forwarded-Encrypted: i=1; AKwUvBygelNOP+ubb9vJFlVvYwRTlxT+oiw3vLkw/hkhBlHh8+v55nMW7SRYR/r1WQQ3bO7DU6BXzOORGtzsMB4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBRLDdG27XE54J3jD67wcuF8AilGceXbyDo9nkDjZWL2T7BQMW
	TwAK7GNxGGeJzWvaPBsz/hc+7gyZHgC3xtb6AoD1Q2LXtK6XRWV2MAnbBWVf+lcBAUc=
X-Gm-Gg: AYBFou1eIRQtvcmg7GEo70+K70ZFYttkYt4iqED5NvLVXTCVMP0ADWRWmho3fbVD4Tt
	D5oB8ati+QO1OECQAzvIoqz04f5PtDHBtl5ZueB9LZrc7k8y3egOZfLvRKu+qNIMkfIaR0xjc03
	7MCvYC+QFrOZyRa2I/j+kGnOrod7Qt6HLWV+DZYVHjEzWIKcm+kbnMaeJbgzbDVOD2oDZEPLoj2
	2yxthG1q6mipBayPQokt4BiP3o8TZo/Ci1LC9jXiE0ctOmBoCTlvI2f/Z02ENjN4Pbq78FCR2pB
	JGwUAeRz6URsbS9K1TlX/Hzz02qx6o15KFBu1IgnD/qddFr8FBkqCrt+V2s6MgSOG3sXRN1GdyA
	JhXdIvMwrgkXNCw6ltNk4Kij1H3BiDx7PmmqKPcvRvnL2w/RtEJl47agaZdZMjm1iqY5tTCuJyl
	5Wuv+KoMyiixAzwPUM2WhAYlQVvyHwgstzGQN40ON3GXZkYTMiRTjCO9AZpLOGu6paLMq9ikzkq
	MBW9SN4xFtUfeDLVbRQ5uGcnPidT8K/EVTeEWc2RBbYWslF8AYU6HPRdLAAzJVMwseD06ZhvJls
	GIq7fQ==
X-Received: by 2002:a05:600c:154c:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4a18e4a9159mr339549795e9.19.1791984921673;
        Wed, 14 Oct 2026 06:35:21 -0700 (PDT)
Received: from zovi.suse.cz (dynamic-2a00-1028-838d-271e-8e3b-4aff-fe4c-a100.ipv6.o2.cz. [2a00:1028:838d:271e:8e3b:4aff:fe4c:a100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48defca3fd0sm1778176f8f.15.2026.10.14.06.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:35:21 -0700 (PDT)
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
Subject: [PATCH v3] module: Add stubs.c for CONFIG_MODULES=n module_put_and_kthread_exit()
Date: Wed, 14 Oct 2026 15:34:10 +0200
Message-ID: <20261014-module-stubs-v3-1-319f2a7d4a55@suse.com>
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
Reviewed-by: Aaron Tomlin <atomlin@atomlin.com>
---
kernel/module/stubs.c should also be used for add_taint_module() [1] in the
future.

[1] https://lore.kernel.org/linux-modules/a79a6a06-cc48-4036-882d-95e9b4cc01cf@suse.com/
---
Changes in v3:
- Mark __module_put_and_kthread_exit() as __retain so it can always be
  referenced by the BPF noreturn_deny set.
- Link to v2: https://patch.msgid.link/20261002-module-stubs-v2-1-a0d8c6ad1738@suse.com

Changes in v2:
- Remove the unnecessary include of internal.h in stubs.c.
- Remove the unnecessary EXPORT_SYMBOL(__module_put_and_kthread_exit) in
  stubs.c.
- Link to v1: https://patch.msgid.link/20260922-module-stubs-v1-1-abe465a24879@suse.com
---
 include/linux/module.h |  9 +++------
 kernel/Makefile        |  2 +-
 kernel/bpf/verifier.c  |  2 --
 kernel/module/Makefile |  4 ++++
 kernel/module/main.c   |  1 +
 kernel/module/stubs.c  | 16 ++++++++++++++++
 6 files changed, 25 insertions(+), 9 deletions(-)

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
index 000000000000..290a93eb1eb0
--- /dev/null
+++ b/kernel/module/stubs.c
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/compiler_types.h>
+#include <linux/kthread.h>
+#include <linux/module.h>
+
+/*
+ * Implementation of __module_put_and_kthread_exit() for CONFIG_MODULES=n.
+ * Retain the function even when it has no callers, so it can be referenced by
+ * the BPF noreturn_deny set.
+ */
+void __noreturn __retain __module_put_and_kthread_exit(struct module *mod,
+						       long code)
+{
+	kthread_exit(code);
+}

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260918-module-stubs-dccefe41dace
