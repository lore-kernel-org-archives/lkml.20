Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793670772;
	b=Ii8AQ8jYs2Id3IfhcUkXDIStgeCREdGJoVoKdTHlllnMWAooYNDvljTQxmyRjsuLHtih
	 fIqfVsxhCsAMXZe44P93/WpuCu9Jxm8UJbR0NYVZAnVBQxDSFTKLx1j6TRagCF3vgGdX5
	 FRHRXhp/AxtNTqSFRYvZpG/7cdCmZU7ttMRn1keFFRczN3m8Ce6fvGTW5sM/Rxg7RfaSb
	 eyT+vg+oJkVGBdJbs3nkmXGCz3H3+Ye5jCeC0wBgISItPsM4wZMlZHVItCCLDJDAS9Sua
	 GrpAiZYiNs/1Xo5/R3FFtB44mhMHtVfaiv2z7y2obwVHtyWrPryTUzXSi0fgeThs3nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793670772;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=cK3dJ0rNIB+mrELhNWs3cKMy8uumY3Vdzy3BuldPAKU=;
	b=F9h+5NwTAhMGoCpy+C3btWQpKfcZz/UxvYxli1BXUlnjuNG/6kqNvieZvQw68Znf3kL1
	 B7HTxIhqEOhzcfx9TdtaKS1N3IedeEPGAQ4vkmGLuPRu1DZZRT5c1Z3xDQGZx172ys5YZ
	 A3NuQSI3hRPZpYPW8EmyzRtRgotBHpsLhNpAk8iCQ2aQKXWoZqGRscMqBJSvN8ugTQcci
	 q+RY3hNW3rBS95FYVBU6lFpcTP77tiNstZ3p9EQ41gxu2pVYbinR2s5eiLvImblSGcHaB
	 NGYJjuA7QNJe+fV+hllSjfUcBJH4yVgY+zkp95k20jdOxCStlHQhyrq03V1URZ8f83A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oSlhd+Ri;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD33606A33A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oSlhd+Ri
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21C1C1F00A15;
	Tue,  3 Nov 2026 01:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793670772;
	bh=cK3dJ0rNIB+mrELhNWs3cKMy8uumY3Vdzy3BuldPAKU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oSlhd+RiBVbGSflebXoROD4KW5kiV6LYpltNmobSjBcfYZLpdz5DplrQAPHbBSYi1
	 sO0dtCj7UFbSoetW1kDbQ+kiDDdl6GUsBPhsDRJSvXsjOgBzgey6p61dY06j9qQ97o
	 XRZ5DD38FvtkHTR4NJ5i+OK7OSGsMpfuN8SDSosd6chN401VqIC8GLkZCU7fBPlRgM
	 Fhis6DjpLhLqw45HnQdAiDkEufKA+htS2DLHsbLnFceeN3uFgxCf5XqgqhSZtUrSOe
	 WxyvkmfyuUeQL4FAJZdP2I7DetmenTqw7HrbJZrZxoKUJAWbpGHhNhIVQVRLchpSde
	 yh/DJYKPjKSUA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Chuck Wolber <chuck@wolber.net>,
	Dmitry Vyukov <dvyukov@google.com>,
	kasan-dev@googlegroups.com,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Oberparleiter <oberpar@linux.ibm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Subject: [PATCH v2 03/20] coverage: add a common debugfs interface
Date: Mon,  2 Nov 2026 20:52:21 -0500
Message-ID: <20261103015238.3780910-4-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103015238.3780910-1-sashal@kernel.org>
References: <20261103015238.3780910-1-sashal@kernel.org>
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

Each coverage implementation creates its own top-level debugfs entry
with its own conventions: /sys/kernel/debug/gcov/ and
/sys/kernel/debug/kcov. Give them a common root,
/sys/kernel/debug/coverage/, which contains:

  backend  name of the selected code coverage measurement implementation
  reset    write to reset all coverage data of that implementation
  gcov     symlink to ../gcov when gcov is enabled
  kcov     symlink to ../kcov when KCOV is enabled

backend and reset are only present when a code coverage measurement
implementation is selected, so a kernel with only KCOV just has the kcov
symlink. The data formats are defined by the respective toolchains and
stay implementation specific. The existing paths are kept as they are,
since lcov, distribution tooling and syzkaller rely on them; the gcov
reset file now shares its implementation with the common one.

The common reset never touches KCOV, whose coverage buffers are owned
by the tasks that set them up.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 MAINTAINERS                |  8 +++++
 kernel/coverage/Makefile   |  1 +
 kernel/coverage/core.c     | 71 ++++++++++++++++++++++++++++++++++++++
 kernel/coverage/coverage.h | 22 ++++++++++++
 kernel/coverage/gcov/fs.c  | 21 ++++++++---
 kernel/coverage/kcov.c     |  3 ++
 6 files changed, 122 insertions(+), 4 deletions(-)
 create mode 100644 kernel/coverage/core.c
 create mode 100644 kernel/coverage/coverage.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 79de9a6964152..01bdf404bfde8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6632,6 +6632,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/coda.yaml
 F:	drivers/media/platform/chips-media/coda
 
+CODE COVERAGE
+M:	Sasha Levin <sashal@kernel.org>
+S:	Maintained
+F:	kernel/coverage/Kconfig
+F:	kernel/coverage/Makefile
+F:	kernel/coverage/core.c
+F:	kernel/coverage/coverage.h
+
 CODE OF CONDUCT
 M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 S:	Supported
diff --git a/kernel/coverage/Makefile b/kernel/coverage/Makefile
index a4cd8cc18d9bc..881fada442bd1 100644
--- a/kernel/coverage/Makefile
+++ b/kernel/coverage/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
+obj-$(or $(CONFIG_COVERAGE_KERNEL),$(CONFIG_KCOV)) += core.o
 obj-$(CONFIG_GCOV_KERNEL) += gcov/
 obj-$(CONFIG_KCOV) += kcov.o
 
diff --git a/kernel/coverage/core.c b/kernel/coverage/core.c
new file mode 100644
index 0000000000000..f90dd78fce557
--- /dev/null
+++ b/kernel/coverage/core.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Common debugfs interface of the kernel's code coverage implementations.
+ *
+ * /sys/kernel/debug/coverage/ is the root for all of them. The selected
+ * code coverage measurement implementation registers itself as the
+ * backend, which provides the "backend" and "reset" files.
+ */
+
+#include <linux/bug.h>
+#include <linux/debugfs.h>
+#include <linux/fs.h>
+#include <linux/init.h>
+#include <linux/seq_file.h>
+
+#include "coverage.h"
+
+static struct dentry *coverage_root;
+static const struct coverage_backend *coverage_backend;
+
+struct dentry *coverage_debugfs_root(void)
+{
+	return coverage_root;
+}
+
+static int backend_show(struct seq_file *m, void *unused)
+{
+	seq_puts(m, coverage_backend->name);
+	if (coverage_backend->features)
+		seq_printf(m, " %s", coverage_backend->features);
+	seq_putc(m, '\n');
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(backend);
+
+static ssize_t reset_write(struct file *file, const char __user *buf,
+			   size_t len, loff_t *pos)
+{
+	coverage_backend->reset();
+	return len;
+}
+
+/* Allow reads so that a recursive copy of the directory doesn't fail. */
+static ssize_t reset_read(struct file *file, char __user *buf, size_t len,
+			  loff_t *pos)
+{
+	return 0;
+}
+
+static const struct file_operations reset_fops = {
+	.write	= reset_write,
+	.read	= reset_read,
+	.llseek	= noop_llseek,
+};
+
+void __init coverage_register_backend(const struct coverage_backend *backend)
+{
+	if (WARN_ON(coverage_backend))
+		return;
+
+	coverage_backend = backend;
+	debugfs_create_file("backend", 0444, coverage_root, NULL, &backend_fops);
+	debugfs_create_file("reset", 0600, coverage_root, NULL, &reset_fops);
+}
+
+static int __init coverage_init(void)
+{
+	coverage_root = debugfs_create_dir("coverage", NULL);
+	return 0;
+}
+fs_initcall(coverage_init);
diff --git a/kernel/coverage/coverage.h b/kernel/coverage/coverage.h
new file mode 100644
index 0000000000000..1b7e3ce25b686
--- /dev/null
+++ b/kernel/coverage/coverage.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _KERNEL_COVERAGE_H
+#define _KERNEL_COVERAGE_H
+
+struct dentry;
+
+/**
+ * struct coverage_backend - code coverage measurement implementation
+ * @name: name reported by /sys/kernel/debug/coverage/backend
+ * @features: optional space separated list of enabled features
+ * @reset: reset all coverage data collected so far
+ */
+struct coverage_backend {
+	const char *name;
+	const char *features;
+	void (*reset)(void);
+};
+
+struct dentry *coverage_debugfs_root(void);
+void coverage_register_backend(const struct coverage_backend *backend);
+
+#endif /* _KERNEL_COVERAGE_H */
diff --git a/kernel/coverage/gcov/fs.c b/kernel/coverage/gcov/fs.c
index 764918570de13..a761cfb837414 100644
--- a/kernel/coverage/gcov/fs.c
+++ b/kernel/coverage/gcov/fs.c
@@ -28,6 +28,7 @@
 #include <linux/seq_file.h>
 #include <linux/mm.h>
 #include "gcov.h"
+#include "../coverage.h"
 
 /**
  * struct gcov_node - represents a debugfs entry
@@ -628,11 +629,10 @@ static struct gcov_node *get_child_by_name(struct gcov_node *parent,
 }
 
 /*
- * write() implementation for reset file. Reset all profiling data to zero
- * and remove nodes for which all associated object files are unloaded.
+ * Reset all profiling data to zero and remove nodes for which all associated
+ * object files are unloaded.
  */
-static ssize_t reset_write(struct file *file, const char __user *addr,
-			   size_t len, loff_t *pos)
+static void gcov_reset_all(void)
 {
 	struct gcov_node *node;
 
@@ -648,7 +648,13 @@ static ssize_t reset_write(struct file *file, const char __user *addr,
 		}
 	}
 	mutex_unlock(&node_lock);
+}
 
+/* write() implementation for reset file. */
+static ssize_t reset_write(struct file *file, const char __user *addr,
+			   size_t len, loff_t *pos)
+{
+	gcov_reset_all();
 	return len;
 }
 
@@ -859,6 +865,11 @@ void gcov_event(enum gcov_action action, struct gcov_info *info)
 	mutex_unlock(&node_lock);
 }
 
+static const struct coverage_backend gcov_backend = {
+	.name	= "gcov",
+	.reset	= gcov_reset_all,
+};
+
 /* Create debugfs entries. */
 static __init int gcov_fs_init(void)
 {
@@ -874,6 +885,8 @@ static __init int gcov_fs_init(void)
 	 */
 	debugfs_create_file("reset", 0600, root_node.dentry, NULL,
 			    &gcov_reset_fops);
+	debugfs_create_symlink("gcov", coverage_debugfs_root(), "../gcov");
+	coverage_register_backend(&gcov_backend);
 	/* Replay previous events to get our fs hierarchy up-to-date. */
 	gcov_enable_events();
 	return 0;
diff --git a/kernel/coverage/kcov.c b/kernel/coverage/kcov.c
index 9402227bd7ba8..54071af990eec 100644
--- a/kernel/coverage/kcov.c
+++ b/kernel/coverage/kcov.c
@@ -27,6 +27,8 @@
 #include <linux/log2.h>
 #include <asm/setup.h>
 
+#include "coverage.h"
+
 #define kcov_debug(fmt, ...) pr_debug("%s: " fmt, __func__, ##__VA_ARGS__)
 
 /* Number of 64-bit words written per one comparison: */
@@ -1180,6 +1182,7 @@ static int __init kcov_init(void)
 	 * use of debugfs_create_file_unsafe() is actually safe here.
 	 */
 	debugfs_create_file_unsafe("kcov", 0600, NULL, NULL, &kcov_fops);
+	debugfs_create_symlink("kcov", coverage_debugfs_root(), "../kcov");
 
 #ifdef CONFIG_KCOV_SELFTEST
 	selftest();
-- 
2.53.0

