Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793392662;
	b=sJhAlefNZ+PIiRvUIL4giGw+D5t+IbngzzlvBgqo2nxfGvFSJFRyxObKZw697whBDV6I
	 TNRbRR3sj03VbgaRost3ffYxKsHe1QuRoxThBKCmNE2T7wig3jnQ4l/mY94Vo0VO3lWmC
	 Hs/wI4PeE4GkLMf7Xuy3KMDPuuBit/eEyMzv+g+imSFmNwQ/xiiH/8a9DVuhKsjBsPaqf
	 2pUbG+yiC0mRuomnWPLM3Xv8upzB5oSX5TcMckyeOYAhROfsXT0dRxubligKLVlsFvCUa
	 7b0qr4odofbe0DFIVpG6nTyIpeRKa/7IU2z7J+E+QV/f6FheFtNBI2ZwtyFreBX402A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793392662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Q4l1IdgKE9e9Rw6KLjh8EhRZJBjvLGRhYmbt9KgTwiI=;
	b=I97uQrRtkJGRSpABL9xlP+QDT5xjNaVLGe15FuB29VssQQBkBI3XqZKbuJdw5kU+rD6K
	 oHNkj/rQLig6qma2GMrhx/PXTNTa5N8VHFpou5xbQNmGcPfBQITm9zpFxItrSt4ZYmpSr
	 ZxLa4kX+Gi/isY7RalBK+dFQ3TXhimJj27AbqvMG9YaFWnIVLdgcGZAgOWAqbFsrMFNxa
	 AQXLI1clqZg+KtIZGX4+A4yDmeaxAHwAm4oiwOAEfj6fAp9PHGebojN8pwic2ZQcZynwO
	 Rw9l0agMn35RZljh8ZaPpZF6w9tFgTGcdhTtfApZ3UMEFst0QgHzINiCgiFtOG465+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vamshigajjela.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Kv0JDKRI;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9649606A323
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:37:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9649606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vamshigajjela.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Kv0JDKRI
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a0619b1fe5so875160b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793392661; x=1793997461; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q4l1IdgKE9e9Rw6KLjh8EhRZJBjvLGRhYmbt9KgTwiI=;
        b=Kv0JDKRIGVIdgbAARW+BARzIEMrjztfEFWgmbDYA3ia6HlUtR+Vg9vZZWuVAtRZdYk
         miI8e5ddCzdPd0MJ1V1I2sutlsWOiGMNkBvVWvwssjLXj+TM4b2VphR7AhCohkHzpuNH
         jJfx4Ack/7856HdZh7IZx//l8akXPjqamaUOGGZkDz9bDD7tv1pd2jJdAyMkVw4fcccO
         uJcR010Vn6moq8oYk8OpUwfHmzHzWvW/Eslw9xkSy+8znvUzk6yloI/aGhIQB3S8chU8
         v3yJWO4nusuJ0tIFwkZnDRwaP8s8X6AJJWo2RyZIaIGSzuSyO7MoTd2Zb3WmXWS8Rk4c
         aPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793392661; x=1793997461;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q4l1IdgKE9e9Rw6KLjh8EhRZJBjvLGRhYmbt9KgTwiI=;
        b=uovz5jZQd984OuQJh6A01o0xFWc2G5LOBYyXIyYCi3J6rmVV+588AjiZ5chY1T2ni2
         addsM4aPT/VScOityHYOtH903Lld+wgyWCj0kU40Xe8EhZAtMCKDkFlJzh6Gi9zK4175
         FUM+p2gmqs9QSVf/C5CC++6VEqRjEsG85AFW7I1iuvT9ObwV/Do9KMsX+/RAlgmadnRn
         zp+N+BoTokFjgBcw0HxfmJ8yX9R+haHMM97niMjuJeqB7f1b9MnCqX1JoYw3Syw3h0j5
         2bU8k27wMzFW2T/B3ytutPhg3z10S2JnOr/wc8HCYgtWo+/UBz16s8j4xGP5OoS7bUe+
         FOmA==
X-Forwarded-Encrypted: i=1; AKwUvBxdSOHUhiEkpDDd2qMl0HlEpNyaFJmao+qUmYOpTxe8n6uYH4qL3m3nQNHSeYz+AD+Fj15oNzY+xMAJsU8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUjlCd+nBa2VOIE8tUat4bTG7kNQrhUznfJwcbXoNYbQmPcKQb
	RVa2bjz8ZjmRKfo4HoAD0ZgZcoFoSWOirOgcIOXKdQPKwKoFmzLYS8j5Q9rVFemAZmicG2XMNL/
	465UjaqOez04LWIIOUkjyPpAMrqE/IYmsBw==
X-Received: from pfle16.prod.google.com ([2002:aa7:9210:0:b0:8a0:e479:9889])
 (user=vamshigajjela job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6300:49:b0:3e1:de28:8ebc with SMTP id adf61e73a8af0-3e9289d8c84mr2689437637.49.1793392660725;
 Fri, 30 Oct 2026 13:37:40 -0700 (PDT)
Date: Sat, 31 Oct 2026 02:07:28 +0530
In-Reply-To: <20261030203728.3784902-1-vamshigajjela@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030203728.3784902-1-vamshigajjela@google.com>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261030203728.3784902-3-vamshigajjela@google.com>
Subject: [PATCH v5 2/2] spmi: Add generic DebugFS interface for bus inspection
From: vamshi gajjela <vamshigajjela@google.com>
To: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Jim Wylder <jwylder@google.com>, linux-kernel@vger.kernel.org, 
	Vamshi Gajjela <vamshigajjela@google.com>
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
 drivers/spmi/spmi-debugfs.c            | 331 +++++++++++++++++++++++++
 drivers/spmi/spmi-internal.h           |  28 +++
 include/linux/spmi.h                   |   6 +
 7 files changed, 449 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/ABI/testing/debugfs-spmi
 create mode 100644 drivers/spmi/spmi-debugfs.c
 create mode 100644 drivers/spmi/spmi-internal.h

diff --git a/Documentation/ABI/testing/debugfs-spmi b/Documentation/ABI/testing/debugfs-spmi
new file mode 100644
index 000000000000..98423d81d408
--- /dev/null
+++ b/Documentation/ABI/testing/debugfs-spmi
@@ -0,0 +1,68 @@
+What:		/sys/kernel/debug/spmi/spmi-<nr>/name
+Date:		October 2026
+KernelVersion:	7.5
+Contact:	vamshi gajjela <vamshigajjela@google.com>
+Description:
+		Displays the SPMI controller parent device name and
+		associated Device Tree node.
+Users:		Debugging, hardware diagnostics
+
+What:		/sys/kernel/debug/spmi/spmi-<nr>/xfer
+Date:		October 2026
+KernelVersion:	7.5
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
index 000000000000..09fef94fb80d
--- /dev/null
+++ b/drivers/spmi/spmi-debugfs.c
@@ -0,0 +1,331 @@
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
+
+	dentry = debugfs_create_dir(dev_name(&ctrl->dev), spmi_debugfs_root);
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
+}
+
+void spmi_debugfs_init(void)
+{
+	spmi_debugfs_root = debugfs_create_dir("spmi", NULL);
+}
+
+void spmi_debugfs_exit(void)
+{
+	debugfs_remove(spmi_debugfs_root);
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

