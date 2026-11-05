Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793901036;
	b=Zmi/qiMsJE5RdKfbN889oeKxvZNsUtYPtiNhva5fYmIEgImWWDUjG72YSfcjuvFZsFAe
	 AuSIbXy1QIQdOXoikz92hHz1RY6MKaivI/QCxSwG3rQOc/dV1TUHkfBbOGa1RLptFxItz
	 hcuAxCLBx2nv7b47CdOuWecH1O3PnHrsD1SzXGp0H5fdagGANReTyIW+vjw7zrywaIv45
	 +hCmeuOfrE8/BiGePEqRWWCLNdZIkObha4ayq0GILCtK82aPVfnAOh5jjA+kCE2KrXRTT
	 y6DaFVArxVa8yDY6D/bBv6GqE1DcuW1mpV80vicMHCE1uYMYXLJt1hhSc5GSI3Tt7LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901036;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/oKxyFlE8NF55gLRR8X32aZCsov7qgh8L2DMbJVvrnI=;
	b=IYb538mW2Vfh17W77SQqh2kDucZri6pE/sO2ycSi/u55dvkVBq8D+G69kTiXScBnCnW9
	 PzoQk7XAi/AIUeD3vtgdODWQQCgcbRKfsB+3ZPYQXMW4+e2FtCcN6LDpVtt6arb0ojWVb
	 uKeTsplKbnwTfXCjoBce1xPa96Q7l5V8kvXK9iua4h93Zs72LZsjmG8/eivxJ8XjjR6Cv
	 waty487LLXs/7UjSa/v1ffMG4D0IrLq8yqDhaVGYgy5GVIfyWowRhiR75CZD5kCylAXcO
	 RrEPS6fQceaNHAtZ0YVFzQHje+h78rAhOuR+NqTcdnx+kiTryEQmD+2GHUOIesX2oTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ffTWI+3M;
	arc=none smtp.remote-ip=91.218.175.101
Received: from mta0.migadu.com (out-101.mta0.migadu.com [91.218.175.101])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C56D606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:50:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C56D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ffTWI+3M
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Cp8CTnHN4cmW6VIwx8ueqqMqNedibQwmmaim2YdoyDI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793901034; v=1; x=1794505834;
 b=ffTWI+3MqU9kkAz7Il/roqCAO8FxgUSWfjeOdYDhXcA/owTZQKd7TBy9/f/Slm3pr+0PdzxD
 3myBE4M2BHQkCx9OsCBAoTTLhbYtbQ4HkgG6r7kP/J3RI8WZaQAeLvk186HbUXSIG88qCVfVm59
 yVYZJ1XNJJyTtYmbl1SKSIWA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 01ec1ce46df10c25;
	Thu, 05 Nov 2026 17:50:34 +0000
X-Mizu-Trace-ID: 01ec1ce46df10c25
X-Migadu-Flow: FLOW_OUT
From: wen.yang@linux.dev
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: Nam Cao <namcao@linutronix.de>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wen Yang <wen.yang@linux.dev>
Subject: [PATCH v8 09/14] rv: Add generic uprobe infrastructure for RV monitors
Date: Fri,  6 Nov 2026 01:49:09 +0800
Message-Id: <21469501d58c0b7efc662226f4c9e9a9d7d32847.1793900349.git.wen.yang@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1793900349.git.wen.yang@linux.dev>
References: <cover.1793900349.git.wen.yang@linux.dev>
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

From: Wen Yang <wen.yang@linux.dev>

Monitors that instrument user-space function boundaries need to register
uprobes and deregister them safely.  Provide a thin wrapper so monitors
share a single implementation of this boilerplate.

struct rv_uprobe embeds struct uprobe_consumer directly, avoiding a
separate heap allocation per probe.  The struct holds an inode reference
(acquired via igrab()) for the probed binary for the full uprobe lifetime,
as uprobe_register() does not take an inode reference.  On unregister,
the inode reference is released with iput() only after
rv_uprobe_unregister_sync().

rv_uprobe_unregister_sync() calls uprobe_unregister_sync(), draining
all in-flight handlers before the containing struct may be freed.

The API provides register, nosync unregister, a global handler barrier
(rv_uprobe_unregister_sync), and an active-state predicate.

Suggested-by: Gabriele Monaco <gmonaco@redhat.com>
Signed-off-by: Wen Yang <wen.yang@linux.dev>
---
 include/rv/rv_uprobe.h      | 35 +++++++++++++++++++++++
 kernel/trace/rv/Kconfig     |  4 +++
 kernel/trace/rv/Makefile    |  1 +
 kernel/trace/rv/rv_uprobe.c | 56 +++++++++++++++++++++++++++++++++++++
 4 files changed, 96 insertions(+)
 create mode 100644 include/rv/rv_uprobe.h
 create mode 100644 kernel/trace/rv/rv_uprobe.c

diff --git a/include/rv/rv_uprobe.h b/include/rv/rv_uprobe.h
new file mode 100644
index 000000000000..b93c2a81bc22
--- /dev/null
+++ b/include/rv/rv_uprobe.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (C) 2026 Wen Yang <wen.yang@linux.dev> */
+/*
+ * Generic uprobe infrastructure for RV monitors.
+ */
+
+#ifndef _RV_UPROBE_H
+#define _RV_UPROBE_H
+
+#include <linux/types.h>
+#include <linux/uprobes.h>
+
+struct inode;
+struct pt_regs;
+
+/*
+ * Free the containing struct only after rv_uprobe_unregister_nosync() +
+ * rv_uprobe_unregister_sync() + iput(p->inode).
+ *
+ * The inode reference does not pin the dentry, so callers that re-resolve the
+ * probed path must hold a struct path: 9p cache=none remints an inode per
+ * lookup.
+ */
+struct rv_uprobe {
+	struct uprobe_consumer	uc;
+	struct uprobe		*uprobe;
+	struct inode		*inode;
+};
+
+bool rv_uprobe_is_registered(const struct rv_uprobe *p);
+int rv_uprobe_register(struct inode *inode, loff_t offset, struct rv_uprobe *p);
+void rv_uprobe_unregister_nosync(struct rv_uprobe *p);
+void rv_uprobe_unregister_sync(void);
+
+#endif /* _RV_UPROBE_H */
diff --git a/kernel/trace/rv/Kconfig b/kernel/trace/rv/Kconfig
index efa930f94ea4..2bc412304293 100644
--- a/kernel/trace/rv/Kconfig
+++ b/kernel/trace/rv/Kconfig
@@ -86,6 +86,10 @@ source "kernel/trace/rv/monitors/nomiss/Kconfig"
 
 # Add new monitors here
 
+config RV_UPROBE
+	bool
+	depends on RV && UPROBES
+
 config RV_REACTORS
 	bool "Runtime verification reactors"
 	default y
diff --git a/kernel/trace/rv/Makefile b/kernel/trace/rv/Makefile
index 4b84b83b942b..8dc14a1819b8 100644
--- a/kernel/trace/rv/Makefile
+++ b/kernel/trace/rv/Makefile
@@ -22,6 +22,7 @@ obj-$(CONFIG_RV_MON_DEADLINE) += monitors/deadline/deadline.o
 obj-$(CONFIG_RV_MON_NOMISS) += monitors/nomiss/nomiss.o
 obj-$(CONFIG_RV_MON_WAKEUP) += monitors/wakeup/wakeup.o
 # Add new monitors here
+obj-$(CONFIG_RV_UPROBE) += rv_uprobe.o
 obj-$(CONFIG_RV_REACTORS) += rv_reactors.o
 obj-$(CONFIG_RV_REACT_PRINTK) += reactor_printk.o
 obj-$(CONFIG_RV_REACT_PANIC) += reactor_panic.o
diff --git a/kernel/trace/rv/rv_uprobe.c b/kernel/trace/rv/rv_uprobe.c
new file mode 100644
index 000000000000..1c7f8466aeed
--- /dev/null
+++ b/kernel/trace/rv/rv_uprobe.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Generic uprobe infrastructure for RV monitors.
+ */
+#include <linux/fs.h>
+#include <linux/uprobes.h>
+#include <rv/rv_uprobe.h>
+
+/*
+ * uprobe_register() takes no inode reference of its own, so grab one here and
+ * drop it only after rv_uprobe_unregister_sync().
+ */
+int rv_uprobe_register(struct inode *inode, loff_t offset, struct rv_uprobe *p)
+{
+	int ret;
+
+	p->inode = igrab(inode);
+	if (!p->inode)
+		return -ESTALE;
+
+	p->uprobe = uprobe_register(inode, offset, 0, &p->uc);
+	if (IS_ERR(p->uprobe)) {
+		ret = PTR_ERR(p->uprobe);
+		p->uprobe = NULL;
+		iput(p->inode);
+		p->inode = NULL;
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(rv_uprobe_register);
+
+bool rv_uprobe_is_registered(const struct rv_uprobe *p)
+{
+	return p && p->uprobe;
+}
+EXPORT_SYMBOL_GPL(rv_uprobe_is_registered);
+
+/* The inode stays held: in-flight handlers may still reach it. */
+void rv_uprobe_unregister_nosync(struct rv_uprobe *p)
+{
+	if (!p || !p->uprobe)
+		return;
+
+	uprobe_unregister_nosync(p->uprobe, &p->uc);
+	p->uprobe = NULL;
+}
+EXPORT_SYMBOL_GPL(rv_uprobe_unregister_nosync);
+
+/* Global barrier over every probe dequeued so far. */
+void rv_uprobe_unregister_sync(void)
+{
+	uprobe_unregister_sync();
+}
+EXPORT_SYMBOL_GPL(rv_uprobe_unregister_sync);
-- 
2.25.1

