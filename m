Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1004DD3B7
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792168266; cv=none; b=VDsD1/QELu0xzJnN09YZ2duPVEl60deaPQIdP2wBizFhWqRySms9WYB7w3R4/wi+0zqTGkvppige1jNPxMfvRNsu1l7LwSlNSLWmSTUzIqqYmucMbmdUIlCORSR9p1OiKKTIh0X7PMqvJkFHYw6mlo95W0QKNYCBhq4Z+5lCNew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792168266; c=relaxed/simple;
	bh=8PlEIPmZgjkl6w6qHkt5ONINZHDm0jtWxlv/u9Tn1Iw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=G4SJNxHrwK9HffoihYY6IY0U2bqwmC1wE1JyC7pQ3eWXy0EASnOzw5xjodJZ1c/C5pEzgTPzWvhlHkwN84hPZfQPCJR3t8VItjRSQbeJxMx+8MCYT7ReA1M4V1q7l/2RD3NCB9GFnMujRB06A7S1GDKXiOClJMc639qvUbs8DiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vamshigajjela.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gKnR0Fze; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vamshigajjela.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gKnR0Fze"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-868db1b2c64so68696b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792168263; x=1792773063; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GjMQKIi62DjNeL1DYeSPzhwvWOgOBSzBAYswWFex/v4=;
        b=gKnR0FzevoJ/BLQoqmWVftQYbH+Y/MAtKIbG+aKhS7SqFIdWEgdNcKxXf/jboEByug
         PrlTZvQGYjME+YKZgdjcjDI3v94fd15MS1eN0I3yb0YdpRvfq594ysTiwDVwtf5lpV7U
         wFleVK3PNm3QYbpX4MTY0VBQTZWteErVU1D+h5Q3cLArSCVj0CcjaXO3C4nLUjMbGtSR
         jDYnfPIp67ldj8kag/MbVhujErG5Pc/5UOJ2fg5bvc3PWoHUkl9QHsLEKLyBQYJ0/bZa
         5GEVRvD7PPxotB9gb3tdC57/5ud4vmx71VRbZMCSjLr3JF0DWVoTBw8HsghFClXQnAqK
         pfxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792168263; x=1792773063;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GjMQKIi62DjNeL1DYeSPzhwvWOgOBSzBAYswWFex/v4=;
        b=Ar6aKym+2+X9QRnTh2pizaVE6i5EyZh9iaykGS+dMWag9OGlr7AMbQD8lH6JjKK+Jr
         kvluWMSLQmTjb1inKZEHo9I8s1ZwcqAXM6GcAvJCUCN8zbQAztGPi9ptPv2tS5WzrWDF
         J/geWtw1sLU4wxkfNoVfm9B/iE36rGvFnXjv3cG0j+P8XZAzs06xQv81/7qDt1yvqRGC
         biHj8k8RC3cU5uBbhfSRJkcjRhy2ZkC6porfnNn/jxfdxn9WaLhjbkI0YeXqQHUpsszB
         Hsb98u1z/ZldeQNmhjVGRSKJwkfJDMYjYUm9jEmlNs3RXIGwtv6ua7xYDbWjRbijRs94
         /1IQ==
X-Forwarded-Encrypted: i=1; AKwUvByiAb2iyJR9/VqDj8YudNcgsPozqko2RpNWYHEuiSiHoR7CJnHuhe1w0TboevD5lvPUYoHLZUmV4TZJwxI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMCgx04WSEwlU0zoZAxf3dsgTF2C0jRG2jhYJlqoG98ODLxD7D
	P0e5wjBRMcKBCRFpJ8LB+KtgyFJx4z1CO5ONhWYn7YtomSjycfisdMWCkuaJor6iJNoCsGhSML2
	sbw6HtS4+G6H9cb3uTfunRn81jhFyF1tLEw==
X-Received: from pffx5.prod.google.com ([2002:aa7:93a5:0:b0:8a0:3dfd:fc5])
 (user=vamshigajjela job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:994:b0:89f:5bc4:fc97 with SMTP id d2e1a72fcca58-8a04cb091c7mr73620b3a.56.1792168263076;
 Fri, 16 Oct 2026 09:31:03 -0700 (PDT)
Date: Fri, 16 Oct 2026 22:00:58 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261016163058.121440-1-vamshigajjela@google.com>
Subject: [PATCH v2] spmi: core: Add generic DebugFS interface for bus inspection
From: vamshi gajjela <vamshigajjela@google.com>
To: sboyd@kernel.org
Cc: abel.vesa@oss.qualcomm.com, jwylder@google.com, 
	linux-kernel@vger.kernel.org, vamshigajjela@google.com
Content-Type: text/plain; charset="UTF-8"

Introduce a generic, controller-agnostic DebugFS interface in the SPMI
core under /sys/kernel/debug/spmi/spmi-<nr>/:
- name: Displays the controller parent device name and OF node.
- detect: Probes the bus for active slave IDs (0x0 to 0xF).
- xfer: Transactional interface supporting register reads, writes,
  and directed command opcodes with automatic opcode selection.

Write and command operations restrict access to root (mode 0600) and
mark the kernel tainted with TAINT_USER. Runtime PM is managed
automatically across transactions.

Detailed interface syntax and parameters are documented in
Documentation/ABI/testing/debugfs-spmi.

Co-developed-by: Jim Wylder <jwylder@google.com>
Signed-off-by: Jim Wylder <jwylder@google.com>
Signed-off-by: vamshi gajjela <vamshigajjela@google.com>
---
Changes in v2:
- Rename spmi.c to spmi-core.c and link spmi-debugfs.o into the composite
  spmi.o module so CONFIG_SPMI=m builds cleanly with CONFIG_DEBUG_FS=y.
- Route DebugFS bus operations through spmi_read_cmd(), spmi_write_cmd(),
  and spmi_cmd() instead of calling controller callbacks directly,
  preserving SPMI tracepoints and core validation.
- Allocate a per-open-file struct spmi_xfer_ctx in open() instead of
  sharing a controller-wide buffer, avoiding races across concurrent file
  descriptors, and store struct dentry *debugfs directly on
  struct spmi_controller.
- Reset *ppos = 0 on register read commands so repeated transactions on
  the same open file descriptor work without manual seeking.
- Restrict SPMI_CMD_ZERO_WRITE at address 0x00 to 7-bit payloads
  (data[0] <= 0x7f) per the MIPI SPMI specification, falling back to
  SPMI_CMD_WRITE for 8-bit values.
- Parse register addresses with kstrtou16() so values above 0xffff are
  rejected instead of silently truncated.
- Update Documentation/ABI/testing/debugfs-spmi to document per-fd xfer
  buffers and 7-bit Zero Write opcode selection.

 Documentation/ABI/testing/debugfs-spmi |  77 +++++
 MAINTAINERS                            |   1 +
 drivers/spmi/Makefile                  |   2 +
 drivers/spmi/{spmi.c => spmi-core.c}   |  18 +-
 drivers/spmi/spmi-debugfs.c            | 380 +++++++++++++++++++++++++
 include/linux/spmi.h                   |  24 ++
 6 files changed, 496 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/ABI/testing/debugfs-spmi
 rename drivers/spmi/{spmi.c => spmi-core.c} (97%)
 create mode 100644 drivers/spmi/spmi-debugfs.c

diff --git a/Documentation/ABI/testing/debugfs-spmi b/Documentation/ABI/testing/debugfs-spmi
new file mode 100644
index 000000000000..ad0246a5306a
--- /dev/null
+++ b/Documentation/ABI/testing/debugfs-spmi
@@ -0,0 +1,77 @@
+What:		/sys/kernel/debug/spmi/spmi-<nr>/name
+Date:		September 2026
+KernelVersion:	7.0
+Contact:	vamshi gajjela <vamshigajjela@google.com>
+Description:
+		Displays the SPMI controller parent device name and
+		associated Device Tree node.
+Users:		Debugging, hardware diagnostics
+
+What:		/sys/kernel/debug/spmi/spmi-<nr>/detect
+Date:		September 2026
+KernelVersion:	7.0
+Contact:	vamshi gajjela <vamshigajjela@google.com>
+Description:
+		Scans the SPMI bus for all 16 possible MIPI SPMI slave IDs
+		(0x0 to 0xF) using standard register reads at offset 0x0.
+		Active slaves are printed in two-digit hexadecimal notation
+		in an i2cdetect-style grid, while unresponsive slaves are
+		represented with "--".
+Users:		Debugging, hardware diagnostics
+
+What:		/sys/kernel/debug/spmi/spmi-<nr>/xfer
+Date:		September 2026
+KernelVersion:	7.0
+Contact:	vamshi gajjela <vamshigajjela@google.com>
+Description:
+		Transactional interface for raw SPMI bus operations:
+
+		- Register Read:
+		    exec 3<> xfer && echo "r <sid> <addr> [len]" >&3 && cat <&3
+		  Reads 1 to 16 bytes starting at <addr> from slave <sid>.
+		  The optional [len] parameter defaults to 1 byte.
+		  Output is formatted as:
+		    0x<addr>: <byte0> <byte1> ...
+		  Each open file descriptor maintains an independent response
+		  buffer. Reading from the same open file descriptor consumes
+		  the response; subsequent reads return EOF (0 bytes) until a
+		  new read command is written.
+
+		- Register Write:
+		    echo "w <sid> <addr> <val...>" > xfer
+		  Writes 1 to 16 bytes starting at <addr> to slave <sid>.
+		  Values are separated by spaces (e.g. "w 0x4 0x8 0x12 0x34"
+		  or "w 4 8 12 34").
+
+		- Command:
+		    echo "c <sid> <opcode>" > xfer
+		  Sends a single SPMI command opcode (e.g. RESET 0x10,
+		  SLEEP 0x11, SHUTDOWN 0x12, WAKEUP 0x13) to slave <sid>.
+
+		Parameter Formatting & Validation:
+		- <sid>: 4-bit Slave Identifier (0x0 to 0xF, supports both
+		  decimal "4" and hexadecimal "0x4").
+		- <addr>: 16-bit register address (0x0000 to 0xFFFF) parsed in
+		  hexadecimal (supports both "0x12" and "12", as well as
+		  "08", "09").
+		- [len]: Number of bytes to read (1 to 16 for 8-bit addresses,
+		  up to 8 bytes for 16-bit extended addresses; default 1).
+		- <val...>: 1 to 16 hexadecimal byte values (0x00 to 0xFF,
+		  up to 8 bytes for 16-bit extended addresses). Values
+		  exceeding 0xFF or payloads exceeding 16 bytes are rejected
+		  with -EINVAL.
+		- <opcode>: 1-byte command opcode parsed in hexadecimal
+		  (0x00 to 0xFF, e.g. "0x10" or "10").
+		- Trailing unrecognized arguments return -EINVAL.
+
+		The interface automatically selects the optimal SPMI opcode
+		(Register Read/Write, Extended Register Read/Write, Extended
+		Register Read/Write Long, or 7-bit Zero Write at address 0x00)
+		based on the address, payload value, and burst length.
+
+		All write and command operations mark the kernel as tainted
+		with TAINT_USER. On failure, the write system call returns a
+		negative errno (e.g. -EIO on bus NACK/timeout, -EINVAL on
+		syntax/range error, -EOPNOTSUPP if the controller lacks the
+		capability).
+Users:		Debugging, hardware bringup, manufacturing test
diff --git a/MAINTAINERS b/MAINTAINERS
index 529c7d7ba113..6ba973aa98de 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24946,6 +24946,7 @@ M:	Stephen Boyd <sboyd@kernel.org>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git
+F:	Documentation/ABI/testing/debugfs-spmi
 F:	Documentation/devicetree/bindings/spmi/
 F:	drivers/spmi/
 F:	include/dt-bindings/spmi/spmi.h
diff --git a/drivers/spmi/Makefile b/drivers/spmi/Makefile
index 38ac635645ba..28737e793a50 100644
--- a/drivers/spmi/Makefile
+++ b/drivers/spmi/Makefile
@@ -3,6 +3,8 @@
 # Makefile for kernel SPMI framework.
 #
 obj-$(CONFIG_SPMI)	+= spmi.o spmi-devres.o
+spmi-y			:= spmi-core.o
+spmi-$(CONFIG_DEBUG_FS)	+= spmi-debugfs.o
 
 obj-$(CONFIG_SPMI_APPLE)	+= spmi-apple-controller.o
 obj-$(CONFIG_SPMI_HISI3670)	+= hisi-spmi-controller.o
diff --git a/drivers/spmi/spmi.c b/drivers/spmi/spmi-core.c
similarity index 97%
rename from drivers/spmi/spmi.c
rename to drivers/spmi/spmi-core.c
index e889b129f3ac..cd6997d193eb 100644
--- a/drivers/spmi/spmi.c
+++ b/drivers/spmi/spmi-core.c
@@ -90,8 +90,7 @@ void spmi_device_remove(struct spmi_device *sdev)
 }
 EXPORT_SYMBOL_GPL(spmi_device_remove);
 
-static inline int
-spmi_cmd(struct spmi_controller *ctrl, u8 opcode, u8 sid)
+int spmi_cmd(struct spmi_controller *ctrl, u8 opcode, u8 sid)
 {
 	int ret;
 
@@ -103,8 +102,8 @@ spmi_cmd(struct spmi_controller *ctrl, u8 opcode, u8 sid)
 	return ret;
 }
 
-static inline int spmi_read_cmd(struct spmi_controller *ctrl, u8 opcode,
-				u8 sid, u16 addr, u8 *buf, size_t len)
+int spmi_read_cmd(struct spmi_controller *ctrl, u8 opcode,
+		  u8 sid, u16 addr, u8 *buf, size_t len)
 {
 	int ret;
 
@@ -117,8 +116,8 @@ static inline int spmi_read_cmd(struct spmi_controller *ctrl, u8 opcode,
 	return ret;
 }
 
-static inline int spmi_write_cmd(struct spmi_controller *ctrl, u8 opcode,
-				 u8 sid, u16 addr, const u8 *buf, size_t len)
+int spmi_write_cmd(struct spmi_controller *ctrl, u8 opcode,
+		   u8 sid, u16 addr, const u8 *buf, size_t len)
 {
 	int ret;
 
@@ -554,6 +553,8 @@ int spmi_controller_add(struct spmi_controller *ctrl)
 	dev_dbg(&ctrl->dev, "spmi-%d registered: dev:%p\n",
 		ctrl->nr, &ctrl->dev);
 
+	spmi_controller_debugfs_init(ctrl);
+
 	return 0;
 };
 EXPORT_SYMBOL_GPL(spmi_controller_add);
@@ -580,6 +581,8 @@ void spmi_controller_remove(struct spmi_controller *ctrl)
 	if (!ctrl)
 		return;
 
+	spmi_controller_debugfs_remove(ctrl);
+
 	device_for_each_child(&ctrl->dev, NULL, spmi_ctrl_remove_device);
 	device_del(&ctrl->dev);
 }
@@ -603,6 +606,7 @@ EXPORT_SYMBOL_GPL(__spmi_driver_register);
 
 static void __exit spmi_exit(void)
 {
+	spmi_debugfs_exit();
 	bus_unregister(&spmi_bus_type);
 }
 module_exit(spmi_exit);
@@ -615,6 +619,8 @@ static int __init spmi_init(void)
 	if (ret)
 		return ret;
 
+	spmi_debugfs_init();
+
 	is_registered = true;
 	return 0;
 }
diff --git a/drivers/spmi/spmi-debugfs.c b/drivers/spmi/spmi-debugfs.c
new file mode 100644
index 000000000000..e205d482e2cb
--- /dev/null
+++ b/drivers/spmi/spmi-debugfs.c
@@ -0,0 +1,380 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * SPMI core DebugFS interface
+ *
+ * Copyright (C) 2026 Google LLC
+ */
+
+#include <linux/debugfs.h>
+#include <linux/seq_file.h>
+#include <linux/uaccess.h>
+#include <linux/slab.h>
+#include <linux/pm_runtime.h>
+#include <linux/spmi.h>
+#include <linux/mutex.h>
+#include <linux/ctype.h>
+#include <linux/string.h>
+#include <linux/of.h>
+#include <linux/panic.h>
+
+struct spmi_xfer_ctx {
+	struct spmi_controller *ctrl;
+	struct mutex lock; /* protects xfer_buf and xfer_len */
+	char xfer_buf[64];
+	size_t xfer_len;
+};
+
+/* Top-level SPMI debugfs directory (/sys/kernel/debug/spmi) */
+static struct dentry *spmi_debugfs_root;
+
+static int spmi_calc_read_opcode(u16 addr, size_t len, u8 *opc)
+{
+	if (len == 0)
+		return -EINVAL;
+
+	if (addr <= 0x1f && len == 1)
+		*opc = SPMI_CMD_READ;
+	else if (addr <= 0xff && len <= 16)
+		*opc = SPMI_CMD_EXT_READ;
+	else if (len <= 8)
+		*opc = SPMI_CMD_EXT_READL;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
+static int spmi_calc_write_opcode(u16 addr, const u8 *data, size_t len, u8 *opc)
+{
+	if (len == 0)
+		return -EINVAL;
+
+	if (addr == 0 && len == 1 && data[0] <= 0x7f)
+		*opc = SPMI_CMD_ZERO_WRITE;
+	else if (addr <= 0x1f && len == 1)
+		*opc = SPMI_CMD_WRITE;
+	else if (addr <= 0xff && len <= 16)
+		*opc = SPMI_CMD_EXT_WRITE;
+	else if (len <= 8)
+		*opc = SPMI_CMD_EXT_WRITEL;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
+static int spmi_debugfs_name_show(struct seq_file *s, void *data)
+{
+	struct spmi_controller *ctrl = s->private;
+	struct device *parent = ctrl->dev.parent;
+
+	if (!parent)
+		return -ENODEV;
+
+	if (dev_of_node(parent))
+		seq_printf(s, "%s (%pOF)\n", dev_name(parent), dev_of_node(parent));
+	else
+		seq_printf(s, "%s\n", dev_name(parent));
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(spmi_debugfs_name);
+
+static int spmi_debugfs_detect_show(struct seq_file *s, void *data)
+{
+	struct spmi_controller *ctrl = s->private;
+	struct device *parent = ctrl->dev.parent;
+	int ret, sid;
+	u8 dummy;
+	bool rpm;
+
+	if (!ctrl->read_cmd)
+		return -EOPNOTSUPP;
+
+	rpm = parent ? pm_runtime_enabled(parent) : false;
+	if (rpm) {
+		ret = pm_runtime_resume_and_get(parent);
+		if (ret < 0)
+			return ret;
+	}
+
+	/*
+	 * MIPI SPMI defines a 4-bit Slave Identifier (SID), allowing a maximum
+	 * of 16 slave devices (0x0 to 0xF) per bus. Format as a single-row grid.
+	 */
+	seq_puts(s, "     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f\n00: ");
+	for (sid = 0; sid < SPMI_MAX_SLAVE_ID; sid++) {
+		ret = spmi_read_cmd(ctrl, SPMI_CMD_READ, sid, 0x0, &dummy, 1);
+		if (ret == 0)
+			seq_printf(s, "%02x ", sid);
+		else
+			seq_puts(s, "-- ");
+	}
+	seq_puts(s, "\n");
+
+	if (rpm) {
+		pm_runtime_mark_last_busy(parent);
+		pm_runtime_put_autosuspend(parent);
+	}
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(spmi_debugfs_detect);
+
+static int spmi_debugfs_xfer_open(struct inode *inode, struct file *file)
+{
+	struct spmi_xfer_ctx *ctx;
+
+	ctx = kzalloc_obj(*ctx, GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->ctrl = inode->i_private;
+	mutex_init(&ctx->lock);
+	file->private_data = ctx;
+
+	return 0;
+}
+
+static int spmi_debugfs_xfer_release(struct inode *inode, struct file *file)
+{
+	struct spmi_xfer_ctx *ctx = file->private_data;
+
+	mutex_destroy(&ctx->lock);
+	kfree(ctx);
+
+	return 0;
+}
+
+static ssize_t spmi_debugfs_xfer_read(struct file *file, char __user *user_buf,
+				      size_t count, loff_t *ppos)
+{
+	struct spmi_xfer_ctx *ctx = file->private_data;
+	ssize_t ret;
+
+	mutex_lock(&ctx->lock);
+	ret = simple_read_from_buffer(user_buf, count, ppos, ctx->xfer_buf, ctx->xfer_len);
+	if (ret > 0 && *ppos >= ctx->xfer_len)
+		ctx->xfer_len = 0;
+	mutex_unlock(&ctx->lock);
+
+	return ret;
+}
+
+static char *spmi_debugfs_next_tok(char **str)
+{
+	char *tok;
+
+	*str = skip_spaces(*str);
+	if (!**str)
+		return NULL;
+
+	tok = *str;
+	while (**str && !isspace(**str))
+		(*str)++;
+
+	if (**str) {
+		**str = '\0';
+		(*str)++;
+	}
+
+	return tok;
+}
+
+static ssize_t spmi_debugfs_xfer_write(struct file *file, const char __user *user_buf,
+				       size_t count, loff_t *ppos)
+{
+	struct spmi_xfer_ctx *ctx = file->private_data;
+	struct spmi_controller *ctrl = ctx->ctrl;
+	struct device *parent = ctrl->dev.parent;
+	unsigned int cmd_opc, val;
+	unsigned int sid, len;
+	char *str, *tok;
+	char kbuf[256];
+	int ret = 0, i;
+	u8 data[16];
+	size_t off;
+	u8 opcode;
+	u16 addr;
+	char type;
+	bool rpm;
+
+	if (count == 0 || count >= sizeof(kbuf))
+		return -EINVAL;
+
+	if (copy_from_user(kbuf, user_buf, count))
+		return -EFAULT;
+	kbuf[count] = '\0';
+
+	str = strim(kbuf);
+	type = tolower(*str);
+	if (type != 'r' && type != 'w' && type != 'c')
+		return -EINVAL;
+	str = skip_spaces(str + 1);
+
+	tok = spmi_debugfs_next_tok(&str);
+	if (!tok || kstrtouint(tok, 0, &sid) || sid >= SPMI_MAX_SLAVE_ID)
+		return -EINVAL;
+
+	rpm = parent ? pm_runtime_enabled(parent) : false;
+	if (rpm) {
+		ret = pm_runtime_resume_and_get(parent);
+		if (ret < 0)
+			return ret;
+	}
+
+	mutex_lock(&ctx->lock);
+	ctx->xfer_len = 0;
+
+	if (type == 'r') {
+		tok = spmi_debugfs_next_tok(&str);
+		if (!tok || kstrtou16(tok, 16, &addr)) {
+			ret = -EINVAL;
+			goto out;
+		}
+
+		len = 1;
+		tok = spmi_debugfs_next_tok(&str);
+		if (tok) {
+			if (kstrtouint(tok, 0, &len) || len == 0 || len > sizeof(data)) {
+				ret = -EINVAL;
+				goto out;
+			}
+			if (spmi_debugfs_next_tok(&str)) {
+				ret = -EINVAL;
+				goto out;
+			}
+		}
+
+		if (!ctrl->read_cmd) {
+			ret = -EOPNOTSUPP;
+			goto out;
+		}
+
+		ret = spmi_calc_read_opcode(addr, len, &opcode);
+		if (ret)
+			goto out;
+
+		ret = spmi_read_cmd(ctrl, opcode, sid, addr, data, len);
+		if (!ret) {
+			off = scnprintf(ctx->xfer_buf, sizeof(ctx->xfer_buf),
+					"0x%04x:", addr);
+
+			for (i = 0; i < len; i++)
+				off += scnprintf(ctx->xfer_buf + off, sizeof(ctx->xfer_buf) - off,
+						 " %02x", data[i]);
+			off += scnprintf(ctx->xfer_buf + off, sizeof(ctx->xfer_buf) - off, "\n");
+			ctx->xfer_len = off;
+			*ppos = 0;
+		}
+	} else if (type == 'w') {
+		tok = spmi_debugfs_next_tok(&str);
+		if (!tok || kstrtou16(tok, 16, &addr)) {
+			ret = -EINVAL;
+			goto out;
+		}
+
+		len = 0;
+		while ((tok = spmi_debugfs_next_tok(&str)) != NULL) {
+			if (len >= sizeof(data) || kstrtouint(tok, 16, &val) || val > 0xff) {
+				ret = -EINVAL;
+				goto out;
+			}
+			data[len++] = val;
+		}
+
+		if (len == 0) {
+			ret = -EINVAL;
+			goto out;
+		}
+
+		if (!ctrl->write_cmd) {
+			ret = -EOPNOTSUPP;
+			goto out;
+		}
+
+		ret = spmi_calc_write_opcode(addr, data, len, &opcode);
+		if (ret)
+			goto out;
+
+		add_taint(TAINT_USER, LOCKDEP_STILL_OK);
+
+		ret = spmi_write_cmd(ctrl, opcode, sid, addr, data, len);
+	} else if (type == 'c') {
+		tok = spmi_debugfs_next_tok(&str);
+		if (!tok || kstrtouint(tok, 16, &cmd_opc) || cmd_opc > 0xff) {
+			ret = -EINVAL;
+			goto out;
+		}
+
+		if (spmi_debugfs_next_tok(&str)) {
+			ret = -EINVAL;
+			goto out;
+		}
+
+		if (!ctrl->cmd) {
+			ret = -EOPNOTSUPP;
+			goto out;
+		}
+
+		add_taint(TAINT_USER, LOCKDEP_STILL_OK);
+
+		ret = spmi_cmd(ctrl, cmd_opc, sid);
+	}
+
+out:
+	mutex_unlock(&ctx->lock);
+
+	if (rpm) {
+		pm_runtime_mark_last_busy(parent);
+		pm_runtime_put_autosuspend(parent);
+	}
+
+	return ret ? ret : count;
+}
+
+static const struct file_operations spmi_debugfs_xfer_fops = {
+	.open		= spmi_debugfs_xfer_open,
+	.release	= spmi_debugfs_xfer_release,
+	.read		= spmi_debugfs_xfer_read,
+	.write		= spmi_debugfs_xfer_write,
+	.llseek		= default_llseek,
+};
+
+void spmi_controller_debugfs_init(struct spmi_controller *ctrl)
+{
+	struct dentry *dentry;
+	char name[32];
+
+	if (IS_ERR_OR_NULL(spmi_debugfs_root))
+		return;
+
+	snprintf(name, sizeof(name), "spmi-%u", ctrl->nr);
+	dentry = debugfs_create_dir(name, spmi_debugfs_root);
+	if (IS_ERR_OR_NULL(dentry))
+		return;
+
+	debugfs_create_file("name", 0444, dentry, ctrl, &spmi_debugfs_name_fops);
+	debugfs_create_file("detect", 0444, dentry, ctrl, &spmi_debugfs_detect_fops);
+	debugfs_create_file("xfer", 0600, dentry, ctrl, &spmi_debugfs_xfer_fops);
+
+	ctrl->debugfs = dentry;
+}
+
+void spmi_controller_debugfs_remove(struct spmi_controller *ctrl)
+{
+	debugfs_remove(ctrl->debugfs);
+	ctrl->debugfs = NULL;
+}
+
+void spmi_debugfs_init(void)
+{
+	if (!spmi_debugfs_root)
+		spmi_debugfs_root = debugfs_create_dir("spmi", NULL);
+}
+
+void spmi_debugfs_exit(void)
+{
+	debugfs_remove(spmi_debugfs_root);
+	spmi_debugfs_root = NULL;
+}
diff --git a/include/linux/spmi.h b/include/linux/spmi.h
index 28e8c8bd3944..237b0b9d4377 100644
--- a/include/linux/spmi.h
+++ b/include/linux/spmi.h
@@ -69,6 +69,8 @@ int spmi_device_add(struct spmi_device *sdev);
 
 void spmi_device_remove(struct spmi_device *sdev);
 
+struct dentry;
+
 /**
  * struct spmi_controller - interface to the SPMI master controller
  * @dev:	Driver model representation of the device.
@@ -76,6 +78,7 @@ void spmi_device_remove(struct spmi_device *sdev);
  * @cmd:	sends a non-data command sequence on the SPMI bus.
  * @read_cmd:	sends a register read command sequence on the SPMI bus.
  * @write_cmd:	sends a register write command sequence on the SPMI bus.
+ * @debugfs:	debugfs dentry for this controller.
  */
 struct spmi_controller {
 	struct device		dev;
@@ -85,6 +88,9 @@ struct spmi_controller {
 			    u8 sid, u16 addr, u8 *buf, size_t len);
 	int	(*write_cmd)(struct spmi_controller *ctrl, u8 opcode,
 			     u8 sid, u16 addr, const u8 *buf, size_t len);
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+	struct dentry		*debugfs;
+#endif
 };
 
 static inline struct spmi_controller *to_spmi_controller(struct device *d)
@@ -186,4 +192,22 @@ int spmi_command_sleep(struct spmi_device *sdev);
 int spmi_command_wakeup(struct spmi_device *sdev);
 int spmi_command_shutdown(struct spmi_device *sdev);
 
+int spmi_cmd(struct spmi_controller *ctrl, u8 opcode, u8 sid);
+int spmi_read_cmd(struct spmi_controller *ctrl, u8 opcode,
+		  u8 sid, u16 addr, u8 *buf, size_t len);
+int spmi_write_cmd(struct spmi_controller *ctrl, u8 opcode,
+		   u8 sid, u16 addr, const u8 *buf, size_t len);
+
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+void spmi_debugfs_init(void);
+void spmi_debugfs_exit(void);
+void spmi_controller_debugfs_init(struct spmi_controller *ctrl);
+void spmi_controller_debugfs_remove(struct spmi_controller *ctrl);
+#else
+static inline void spmi_debugfs_init(void) {}
+static inline void spmi_debugfs_exit(void) {}
+static inline void spmi_controller_debugfs_init(struct spmi_controller *ctrl) {}
+static inline void spmi_controller_debugfs_remove(struct spmi_controller *ctrl) {}
+#endif
+
 #endif
-- 
2.56.0.176.g3575e65682-goog

