Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792441273;
	b=Whu2mU8KHnmErGaWBu27Aq+BIvoTntjQgjefE0NF1enQITa1K83XZSCmw2VGb9A+dJOf
	 ZUOfIgyEktmKzgusWLkV+eFoHIX2rj4tLCyYfzXhxr+KnDURSFAta0VYRuvgOlo56uFWn
	 jxy+gcOl8NMNhBL5ujjiBXc/66D9jo0B2PGCcKg/6Hgsx+e+gtDaZFucIp4pTtNtN1D0M
	 cxe3Rj/zW3DhEn7c8Bj2Cx/80nzdhHIxX/wSkGL27JmWEraI2XHEhqMmnlXT78o8+Ywsy
	 FtO2TEjceV3r+tnulNuLZj+XRcuq0iwqrdZf7x/UPBlnC81p6vjMgDZlpq/jEJ8T0LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792441273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Qp60Mf+EmK76hkxs4mrmXUaK3x4BafsQ6YlbIOseuEM=;
	b=f0ayyX0T6+l123fsHWahhFBQ3oxRBirqz2IbtoHvzKArkl6fgnAo09EXekIgF71v6ykM
	 KBan8XWp/m3vEj4tjLuKWoap7vYpYza4WuChKah9hvqJgJOIlXDRiSKnNJ5ik98vwwK85
	 rHS14LWpLjPey0GojfdJnyBVUs3ctc1vjWdiZJgIjk5TLhcsPBGbK7/Zo3k6tpO3ELh+e
	 KtwQOMUISKMZ+Hq42qmPs/Y5uiF7iKp3kSw5NGtRicAscklb8V2BJI47ozMitX44MHY3n
	 IHI8peV20eMygX6T70R8kQTCYoAOqX0RfHYBpKs+nPWnInlY4Tl9u4n7biXtEXdCkpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vamshigajjela.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ikwgtn6X;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33093606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33093606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vamshigajjela.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ikwgtn6X
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3aaee1fc104so3845056a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792441272; x=1793046072; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qp60Mf+EmK76hkxs4mrmXUaK3x4BafsQ6YlbIOseuEM=;
        b=ikwgtn6XyErXWVibulUHodqKCtlIve6mUwfiGvVbUIN9MEju5pWeaCvc85phl4AHc0
         IT3QAqVkPjOLGArAZ8Xo8WQubh9T5ZmnR8dAtenJhINLoJ0sOzJNnlcz9SxwE0iHqZuF
         ED0qS01OgSRa0c95XuH4wfpHuxzQ1VZ1qnpw5u5ErVkJ7eTHqPlroO7FxjwHQ4uadxRL
         lcXrW42r0exEIKZJ/jz65ZuXnRvc3uUzcwkEmcpb9bHoN3Bz+xfz8FeGK5P3qG0HSzx4
         0fzqAqazmUccBDW3ZIJI6DWoViaxsy5t71M+h0G99/Wt5yv2aD9gzaXPtyuu6fs+ZGoz
         ww0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792441272; x=1793046072;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qp60Mf+EmK76hkxs4mrmXUaK3x4BafsQ6YlbIOseuEM=;
        b=jVSgF1H65/JMXApcmcv4Z+6TaSZvLBY+NDiq19LI/LcKA0TOrAKu/8iL5ly9Zr6Txd
         upyWQQlgK/gVLTbqBonLj5rcv0pLxVJ/S4rZjGaYVS6Kmm+hDuhbCT8PUJUM9Icjkdwi
         LrsfqA65xq0PQ+igu52DZpCgtCLM3p33UcTvittI68x1pGTJJOLYdj/p40FwSDethi4q
         irEkWKgqcO07m6kciMVIOzY8Ln+fHfJLj9jwajB8nNcWTFzhkf9IbIy9G4/sa1cKev6N
         gQePSEaFj6q4Xk40CDiX2NDPZBaBGj3LBAp/hXycVtnQowF8ij3IpOPQCSOYgiNNcJAs
         dB4g==
X-Forwarded-Encrypted: i=1; AKwUvBxLCCT1ApSlSmk6Y1spuU6f2DmtHBpskPrcqaUFkTOHb5T7SHLwewa9b1Zgk4J0FnzCaboPwPqAhdBC91U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZBthAxcjHS3FL3If0ClgM82neJXBJdVa4ucLDHFLDuThwY4Eq
	5O/hNxjE+GOHJfVghNhMOTet2E2TA1w2l7vQPnkuDoBQUT0mXkBG0K//M1vfV73aYQ5+w9Ua86W
	CtSBmTEnYZ947ZM2DRUKRxNytkAafSpqDzQ==
X-Received: from pjyx16.prod.google.com ([2002:a17:90a:e310:b0:3ac:6f46:2983])
 (user=vamshigajjela job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5112:b0:3ac:b145:8f4 with SMTP id 98e67ed59e1d1-3acef4fda12mr9042472a91.41.1792441272228;
 Mon, 19 Oct 2026 13:21:12 -0700 (PDT)
Date: Tue, 20 Oct 2026 01:51:07 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261019202107.888262-1-vamshigajjela@google.com>
Subject: [PATCH v3] spmi: core: Add generic DebugFS interface for bus inspection
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
Changes in v3:
- Move internal SPMI core command helpers (spmi_cmd(), spmi_read_cmd(),
  spmi_write_cmd()) and DebugFS prototypes out of the public
  include/linux/spmi.h header into a local drivers/spmi/spmi-internal.h
  header.

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
 drivers/spmi/{spmi.c => spmi-core.c}   |  20 +-
 drivers/spmi/spmi-debugfs.c            | 382 +++++++++++++++++++++++++
 drivers/spmi/spmi-internal.h           |  28 ++
 include/linux/spmi.h                   |   6 +
 7 files changed, 510 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/ABI/testing/debugfs-spmi
 rename drivers/spmi/{spmi.c => spmi-core.c} (97%)
 create mode 100644 drivers/spmi/spmi-debugfs.c
 create mode 100644 drivers/spmi/spmi-internal.h

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
index e889b129f3ac..9316f34e56af 100644
--- a/drivers/spmi/spmi.c
+++ b/drivers/spmi/spmi-core.c
@@ -17,6 +17,8 @@
 #define CREATE_TRACE_POINTS
 #include <trace/events/spmi.h>
 
+#include "spmi-internal.h"
+
 static bool is_registered;
 static DEFINE_IDA(ctrl_ida);
 
@@ -90,8 +92,7 @@ void spmi_device_remove(struct spmi_device *sdev)
 }
 EXPORT_SYMBOL_GPL(spmi_device_remove);
 
-static inline int
-spmi_cmd(struct spmi_controller *ctrl, u8 opcode, u8 sid)
+int spmi_cmd(struct spmi_controller *ctrl, u8 opcode, u8 sid)
 {
 	int ret;
 
@@ -103,8 +104,8 @@ spmi_cmd(struct spmi_controller *ctrl, u8 opcode, u8 sid)
 	return ret;
 }
 
-static inline int spmi_read_cmd(struct spmi_controller *ctrl, u8 opcode,
-				u8 sid, u16 addr, u8 *buf, size_t len)
+int spmi_read_cmd(struct spmi_controller *ctrl, u8 opcode,
+		  u8 sid, u16 addr, u8 *buf, size_t len)
 {
 	int ret;
 
@@ -117,8 +118,8 @@ static inline int spmi_read_cmd(struct spmi_controller *ctrl, u8 opcode,
 	return ret;
 }
 
-static inline int spmi_write_cmd(struct spmi_controller *ctrl, u8 opcode,
-				 u8 sid, u16 addr, const u8 *buf, size_t len)
+int spmi_write_cmd(struct spmi_controller *ctrl, u8 opcode,
+		   u8 sid, u16 addr, const u8 *buf, size_t len)
 {
 	int ret;
 
@@ -554,6 +555,8 @@ int spmi_controller_add(struct spmi_controller *ctrl)
 	dev_dbg(&ctrl->dev, "spmi-%d registered: dev:%p\n",
 		ctrl->nr, &ctrl->dev);
 
+	spmi_controller_debugfs_init(ctrl);
+
 	return 0;
 };
 EXPORT_SYMBOL_GPL(spmi_controller_add);
@@ -580,6 +583,8 @@ void spmi_controller_remove(struct spmi_controller *ctrl)
 	if (!ctrl)
 		return;
 
+	spmi_controller_debugfs_remove(ctrl);
+
 	device_for_each_child(&ctrl->dev, NULL, spmi_ctrl_remove_device);
 	device_del(&ctrl->dev);
 }
@@ -603,6 +608,7 @@ EXPORT_SYMBOL_GPL(__spmi_driver_register);
 
 static void __exit spmi_exit(void)
 {
+	spmi_debugfs_exit();
 	bus_unregister(&spmi_bus_type);
 }
 module_exit(spmi_exit);
@@ -615,6 +621,8 @@ static int __init spmi_init(void)
 	if (ret)
 		return ret;
 
+	spmi_debugfs_init();
+
 	is_registered = true;
 	return 0;
 }
diff --git a/drivers/spmi/spmi-debugfs.c b/drivers/spmi/spmi-debugfs.c
new file mode 100644
index 000000000000..3e1c016ea172
--- /dev/null
+++ b/drivers/spmi/spmi-debugfs.c
@@ -0,0 +1,382 @@
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
+#include "spmi-internal.h"
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
index 28e8c8bd3944..4bcc66a2cfbe 100644
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
-- 
2.56.0.176.g3575e65682-goog

