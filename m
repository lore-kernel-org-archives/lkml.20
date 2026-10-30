Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793336411;
	b=0V6h/kedK5JpC8j7cgtMoh3rcGfggScAURh5WV8ouFygFz9d1XDJzyU+gw1G+63hQ8z+
	 ZQwm8g8JvwmdRSBIn89n4LYrjgglVuOouEFsJX2JAHu3J+5rn1VwADYryd9e5qE3876f3
	 8pkPGkajRNiBS4mbc3y8TiH8Yycrtc2FlhwNM6fKJrnabMP/Le37xRB9PnBCt03eDgBjs
	 JJWze6E8bjoe6CbJpt0jodlyggi/p+LZQJvXa95FxOm88XCj1FfTeRtBB/g+Q3GD11EAp
	 Fgzdod3J7sVWllX9hvy1FFJm3q56qO8YUHWbNpFJopfCydzS8IpR62Z96CBQCqqtS7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793336411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=+xRXZB+7Aeq9ndLbZL6oSLnuHN71aEPSOPaXHCLhQmE=;
	b=p2UYArDwD+7aOgBPinhY5vHdMWwq0K0pwbbsbLgT/ultff6xlSSAU6nQhyEm38Wk86R7
	 76D+yKAl/eF74YfBd/kvrVbqyMqR1NZddZqrIjgqvgm/8HPFJGLPG6w84UPQOsbStS9v1
	 NkiP6ZUWYppIjz8QQG17BzcENgs3QdYSz7n8Tsc4dWpBTE2x9yMLrXiR0G0zlhL+l+h65
	 etXD+uf0snXQukJfCM56F8eQ6GRSFCGWkdn/0tC++pVMiJBZzselPtw4XJMKwjTGOKe4J
	 U8tjtv1a7BH8xjQ53bQ0ixV6CBkFMZ+XNOx5ygqsEVcfVd1c5/UWefVZD65PYdhRapw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vamshigajjela.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=da8kTMeT;
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B8F606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4B8F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vamshigajjela.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=da8kTMeT
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd67466211bso185879a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793336410; x=1793941210; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+xRXZB+7Aeq9ndLbZL6oSLnuHN71aEPSOPaXHCLhQmE=;
        b=da8kTMeTapav6aEmt4n9hikUnfbSeCs5Xi3pZ/Y0d4fRjbRY3unKs4L0NAOe5mBYBU
         rhEGzJNV4f3yKqhz6QsGD2mEQtUto0SW1m/Een1BkdvcbOl1/rPHC65FMcBA4F5hDhxI
         RopkBeqF5p0hjOJ37eQ5pm177q6bJibXCgWMkjtW3SFzlfSeo11gcQT3y0yZsqrgtUbp
         dF/DCkjsi9gpBSgTVab7NVTGeF8gbfnrObUwzbdg5aW+LlV09sKIh6LHhZ2Jbn4N4ODi
         hHxtneqGDAzvXzisJOqydCQ3Vuxva9AciCYEa9+FUEMpaSkMmIBEfgGYYdbbpJ798Drw
         VszQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793336410; x=1793941210;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+xRXZB+7Aeq9ndLbZL6oSLnuHN71aEPSOPaXHCLhQmE=;
        b=kBUww7X5iquszUhsfHiAKzYDtSyKpaOncb2lH/iuc8DIeyliGjY7184xyHHdAZUrG+
         gSH+EcxFnHfp+9DUAfTSysVS3fw6oNXmO7YMRIDHao6CEON1SmnyxWNCtHdhIskHT1Od
         ZrbBU6ixRTYXWYX3tySYvuIsQlDT1Y2NeRhI5E87COjKX223OkhsXc0jDMzkalcPIXVS
         d2y9cijWVY49+GsnXe3DnEI1dl2aQsBU3DDrSMiM/OlUhazWth2Htn9unIuAA5F2cdoJ
         5nB8IlmYyI961SgTjpZFod3ufbHzzrWh0sZXs9aLeJiC2LvbmKj1yflTYUscT9hK3BkR
         2Hug==
X-Forwarded-Encrypted: i=1; AKwUvBz/tjy0Yn6nsYQ8JPQc+K8URJwj0mGQnes60U3fyk6iJ6CvFOUSnr8jN3H2TtYQDL0BdF2HrPaKy++B4Xo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQCGzn+t/RT78B/c7mQYTVQF81gutiLrtd9ZdnSpXD39/xsUW2
	Wjk2kxJNiiNJhoQvDA2HHggu1l4kVy3iOo61CApe895TFgP31MGeVt4wQvMW6V6P8m6ns1yINvj
	d45pkWjKXUheY5lEVay/qMjoI+KUyU/XcAw==
X-Received: from pfnz17.prod.google.com ([2002:aa7:85d1:0:b0:88e:7f97:e965])
 (user=vamshigajjela job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:2006:b0:3e2:3392:5419 with SMTP id adf61e73a8af0-3e928e00f92mr838255637.56.1793336409799;
 Thu, 29 Oct 2026 22:00:09 -0700 (PDT)
Date: Fri, 30 Oct 2026 10:29:47 +0530
In-Reply-To: <20261030045947.3049598-1-vamshigajjela@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030045947.3049598-1-vamshigajjela@google.com>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261030045947.3049598-3-vamshigajjela@google.com>
Subject: [PATCH v4 2/2] spmi: core: Add generic DebugFS interface for bus inspection
From: vamshi gajjela <vamshigajjela@google.com>
To: sboyd@kernel.org, abelvesa@kernel.org
Cc: abel.vesa@oss.qualcomm.com, jwylder@google.com, 
	linux-kernel@vger.kernel.org, vamshigajjela@google.com
Content-Type: text/plain; charset="UTF-8"

From: Vamshi Gajjela <vamshigajjela@google.com>

Introduce a generic, controller-agnostic DebugFS interface in the SPMI
core under /sys/kernel/debug/spmi/spmi-<nr>/:
- name: Displays the controller parent device name and OF node.
- xfer: Transactional interface supporting register reads, writes,
  and directed command opcodes with automatic opcode selection.

Because raw writes and commands to PMICs can damage hardware and bypass
client drivers and their regmap caches, write ('w') and command ('c')
operations are disabled by default behind SPMI_ALLOW_WRITE_DEBUGFS. When
enabled, they restrict access to root (mode 0600) and mark the kernel
tainted with TAINT_USER.

Detailed interface syntax and parameters are documented in
Documentation/ABI/testing/debugfs-spmi.

Co-developed-by: Jim Wylder <jwylder@google.com>
Signed-off-by: Jim Wylder <jwylder@google.com>
Signed-off-by: Vamshi Gajjela <vamshigajjela@google.com>
---
 Documentation/ABI/testing/debugfs-spmi |  68 +++++
 MAINTAINERS                            |   1 +
 drivers/spmi/Makefile                  |   1 +
 drivers/spmi/spmi-core.c               |  20 +-
 drivers/spmi/spmi-debugfs.c            | 341 +++++++++++++++++++++++++
 drivers/spmi/spmi-internal.h           |  28 ++
 include/linux/spmi.h                   |   6 +
 7 files changed, 459 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/ABI/testing/debugfs-spmi
 create mode 100644 drivers/spmi/spmi-debugfs.c
 create mode 100644 drivers/spmi/spmi-internal.h

diff --git a/Documentation/ABI/testing/debugfs-spmi b/Documentation/ABI/testing/debugfs-spmi
new file mode 100644
index 000000000000..6a0bff9027a4
--- /dev/null
+++ b/Documentation/ABI/testing/debugfs-spmi
@@ -0,0 +1,68 @@
+What:		/sys/kernel/debug/spmi/spmi-<nr>/name
+Date:		October 2026
+KernelVersion:	7.4
+Contact:	vamshi gajjela <vamshigajjela@google.com>
+Description:
+		Displays the SPMI controller parent device name and
+		associated Device Tree node.
+Users:		Debugging, hardware diagnostics
+
+What:		/sys/kernel/debug/spmi/spmi-<nr>/xfer
+Date:		October 2026
+KernelVersion:	7.4
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
+		- Register Write (requires SPMI_ALLOW_WRITE_DEBUGFS):
+		    echo "w <sid> <addr> <val...>" > xfer
+		  Writes 1 to 16 bytes starting at <addr> to slave <sid>.
+		  Values are separated by spaces (e.g. "w 0x4 0x8 0x12 0x34"
+		  or "w 4 8 12 34"). Disabled by default (-EOPNOTSUPP) unless
+		  SPMI_ALLOW_WRITE_DEBUGFS is defined at compile time.
+
+		- Command (requires SPMI_ALLOW_WRITE_DEBUGFS):
+		    echo "c <sid> <opcode>" > xfer
+		  Sends a single SPMI command opcode (e.g. RESET 0x10,
+		  SLEEP 0x11, SHUTDOWN 0x12, WAKEUP 0x13) to slave <sid>.
+		  Disabled by default (-EOPNOTSUPP) unless
+		  SPMI_ALLOW_WRITE_DEBUGFS is defined at compile time.
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
+		syntax/range error, -EOPNOTSUPP if disabled or unsupported by
+		the controller).
+Users:		Debugging, hardware bringup, manufacturing test
diff --git a/MAINTAINERS b/MAINTAINERS
index eaeb60c1e1c2..aa9328b4d1c8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25848,6 +25848,7 @@ M:	Abel Vesa <abelvesa@kernel.org>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git
+F:	Documentation/ABI/testing/debugfs-spmi
 F:	Documentation/devicetree/bindings/spmi/
 F:	drivers/spmi/
 F:	include/dt-bindings/spmi/spmi.h
diff --git a/drivers/spmi/Makefile b/drivers/spmi/Makefile
index 190d560f692e..28737e793a50 100644
--- a/drivers/spmi/Makefile
+++ b/drivers/spmi/Makefile
@@ -4,6 +4,7 @@
 #
 obj-$(CONFIG_SPMI)	+= spmi.o spmi-devres.o
 spmi-y			:= spmi-core.o
+spmi-$(CONFIG_DEBUG_FS)	+= spmi-debugfs.o
 
 obj-$(CONFIG_SPMI_APPLE)	+= spmi-apple-controller.o
 obj-$(CONFIG_SPMI_HISI3670)	+= hisi-spmi-controller.o
diff --git a/drivers/spmi/spmi-core.c b/drivers/spmi/spmi-core.c
index ec97f12046f5..c498bf84f38e 100644
--- a/drivers/spmi/spmi-core.c
+++ b/drivers/spmi/spmi-core.c
@@ -17,6 +17,8 @@
 #define CREATE_TRACE_POINTS
 #include <trace/events/spmi.h>
 
+#include "spmi-internal.h"
+
 static bool is_registered;
 static DEFINE_IDA(ctrl_ida);
 static DEFINE_IDA(spmi_subdevice_ida);
@@ -114,8 +116,7 @@ void spmi_subdevice_remove(struct spmi_subdevice *sub_sdev)
 }
 EXPORT_SYMBOL_NS_GPL(spmi_subdevice_remove, "SPMI");
 
-static inline int
-spmi_cmd(struct spmi_controller *ctrl, u8 opcode, u8 sid)
+int spmi_cmd(struct spmi_controller *ctrl, u8 opcode, u8 sid)
 {
 	int ret;
 
@@ -127,8 +128,8 @@ spmi_cmd(struct spmi_controller *ctrl, u8 opcode, u8 sid)
 	return ret;
 }
 
-static inline int spmi_read_cmd(struct spmi_controller *ctrl, u8 opcode,
-				u8 sid, u16 addr, u8 *buf, size_t len)
+int spmi_read_cmd(struct spmi_controller *ctrl, u8 opcode,
+		  u8 sid, u16 addr, u8 *buf, size_t len)
 {
 	int ret;
 
@@ -141,8 +142,8 @@ static inline int spmi_read_cmd(struct spmi_controller *ctrl, u8 opcode,
 	return ret;
 }
 
-static inline int spmi_write_cmd(struct spmi_controller *ctrl, u8 opcode,
-				 u8 sid, u16 addr, const u8 *buf, size_t len)
+int spmi_write_cmd(struct spmi_controller *ctrl, u8 opcode,
+		   u8 sid, u16 addr, const u8 *buf, size_t len)
 {
 	int ret;
 
@@ -653,6 +654,8 @@ int spmi_controller_add(struct spmi_controller *ctrl)
 	dev_dbg(&ctrl->dev, "spmi-%d registered: dev:%p\n",
 		ctrl->nr, &ctrl->dev);
 
+	spmi_controller_debugfs_init(ctrl);
+
 	return 0;
 };
 EXPORT_SYMBOL_GPL(spmi_controller_add);
@@ -679,6 +682,8 @@ void spmi_controller_remove(struct spmi_controller *ctrl)
 	if (!ctrl)
 		return;
 
+	spmi_controller_debugfs_remove(ctrl);
+
 	device_for_each_child(&ctrl->dev, NULL, spmi_ctrl_remove_device);
 	device_del(&ctrl->dev);
 }
@@ -702,6 +707,7 @@ EXPORT_SYMBOL_GPL(__spmi_driver_register);
 
 static void __exit spmi_exit(void)
 {
+	spmi_debugfs_exit();
 	bus_unregister(&spmi_bus_type);
 }
 module_exit(spmi_exit);
@@ -714,6 +720,8 @@ static int __init spmi_init(void)
 	if (ret)
 		return ret;
 
+	spmi_debugfs_init();
+
 	is_registered = true;
 	return 0;
 }
diff --git a/drivers/spmi/spmi-debugfs.c b/drivers/spmi/spmi-debugfs.c
new file mode 100644
index 000000000000..9826b5a8137c
--- /dev/null
+++ b/drivers/spmi/spmi-debugfs.c
@@ -0,0 +1,341 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * SPMI core DebugFS interface
+ *
+ * Copyright (C) 2026 Google LLC
+ */
+
+#include <linux/ctype.h>
+#include <linux/debugfs.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/panic.h>
+#include <linux/seq_file.h>
+#include <linux/slab.h>
+#include <linux/spmi.h>
+#include <linux/string.h>
+#include <linux/uaccess.h>
+
+#include "spmi-internal.h"
+
+/*
+ * Raw writes and commands to PMICs can damage hardware and bypass
+ * client drivers. Keep them disabled by default.
+ */
+#undef SPMI_ALLOW_WRITE_DEBUGFS
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
+#ifdef SPMI_ALLOW_WRITE_DEBUGFS
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
+#endif
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
+static int spmi_debugfs_xfer_open(struct inode *inode, struct file *file)
+{
+	struct spmi_xfer_ctx *ctx;
+
+	ctx = kzalloc_obj(*ctx);
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
+	unsigned int sid, len;
+	char *str, *tok;
+	char kbuf[256];
+	int ret = 0, i;
+	u8 data[16];
+	size_t off;
+	u8 opcode;
+	u16 addr;
+	char type;
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
+#ifdef SPMI_ALLOW_WRITE_DEBUGFS
+	} else if (type == 'w') {
+		unsigned int val;
+
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
+		unsigned int cmd_opc;
+
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
+#else
+	} else {
+		ret = -EOPNOTSUPP;
+#endif
+	}
+
+out:
+	mutex_unlock(&ctx->lock);
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
diff --git a/drivers/spmi/spmi-internal.h b/drivers/spmi/spmi-internal.h
new file mode 100644
index 000000000000..6c2ae35200a8
--- /dev/null
+++ b/drivers/spmi/spmi-internal.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 Google LLC
+ */
+#ifndef _SPMI_INTERNAL_H
+#define _SPMI_INTERNAL_H
+
+#include <linux/spmi.h>
+
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
+#endif /* _SPMI_INTERNAL_H */
diff --git a/include/linux/spmi.h b/include/linux/spmi.h
index 4daebc980501..7dd62db255a4 100644
--- a/include/linux/spmi.h
+++ b/include/linux/spmi.h
@@ -85,6 +85,8 @@ void spmi_subdevice_remove(struct spmi_subdevice *sdev);
 struct spmi_subdevice *devm_spmi_subdevice_alloc_and_add(struct device *dev,
 							 struct spmi_device *sparent);
 
+struct dentry;
+
 /**
  * struct spmi_controller - interface to the SPMI master controller
  * @dev:	Driver model representation of the device.
@@ -92,6 +94,7 @@ struct spmi_subdevice *devm_spmi_subdevice_alloc_and_add(struct device *dev,
  * @cmd:	sends a non-data command sequence on the SPMI bus.
  * @read_cmd:	sends a register read command sequence on the SPMI bus.
  * @write_cmd:	sends a register write command sequence on the SPMI bus.
+ * @debugfs:	debugfs dentry for this controller.
  * @priv:	array of private data.
  */
 struct spmi_controller {
@@ -102,6 +105,9 @@ struct spmi_controller {
 			    u8 sid, u16 addr, u8 *buf, size_t len);
 	int	(*write_cmd)(struct spmi_controller *ctrl, u8 opcode,
 			     u8 sid, u16 addr, const u8 *buf, size_t len);
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+	struct dentry		*debugfs;
+#endif
 	u8	priv[];
 };
 
-- 
2.56.0.317.g454f8302e1-goog

