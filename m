Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7CE377A9D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790243118; cv=none; b=s0U9Wx+YufT2Vbk0KQJl2x7Yua0QJ1A2oNRms8qkhFUplXD3VvIeVTPdfr7S6H4FpamdgFcC1w+gUzM9PKTGf4RepR5c+cjNzhNV0wV9o5/VdriNMC6k1w6XX5DUf67V+xsT5B8oH9f1dzzxYL3GIcZKzf2qUkLy4HVp5ZkJYFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790243118; c=relaxed/simple;
	bh=KbG7MSORcq+QQYDxgG+lfNBSewrm4iOswLiKpvrQyw4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=V1wPA4rQJ8dtSXjXFlhEuuIzKdUT6DyboY94omxF/ZK98DoVS+1CxC2X8YQfbnlUUMqH3JBYW8ppUOlexkPOfsYNJdjY2A/iLwtajc/IiLqs4HZ6dqOTdT4cFo51SDNFIA7nmeTaKfQoYLw6IbV5xUxW6jOMDTzVNX23JzAbCWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vamshigajjela.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RRkUtISE; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vamshigajjela.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RRkUtISE"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso1894179a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790243107; x=1790847907; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a1ORu9e5KXPSxUYo3pQ3hTC4q/SUua40wcDZ2hhFAgk=;
        b=RRkUtISENMY5nYwcCCywT3ivl89HX97lBqSPvva3pDO87Ho6JZEALWg/cWzeyLjmw+
         dcSmjGhVTm+yrRer+xyJ2o9NU8v32ySiOkxN1vGFeV2k6sgDjHIX9/gNo7xCMH5QszqZ
         b8/KmG0edBJaUHTB7M+YKmVKLs7oTsyX6yiOvFTfZNJmx7TYkn6dy7M6TDly+UHQKMj2
         4QC/dWz2Leex4uKpKWX45kEpSgL5gfszduNaOx4rqQmgfeHq1HAp86f3V6LqAZ+9QcRW
         QIrHmP6nd1achTeJrrEYaqoUGt/v7QFFXvDtKHbKsokeTUcknUIpEPXPAIDK8dtKPvVE
         O8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790243107; x=1790847907;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a1ORu9e5KXPSxUYo3pQ3hTC4q/SUua40wcDZ2hhFAgk=;
        b=17scA9cL4inqYna27YcpZ+19kkkyeApyeukdKorlLyyIy0Pe3u5mjanU+8zL219z02
         GDNYgelqi1XfQxWEIJl5xe4pnB9z+zKZ6fCHrWDoOri8GEb4V0IYU8TKTiHF3nqT+Zzq
         FgPFc6n9rfvtKfn1Ak8KMrvgW6Yc6829eCunNCxHFU3+pQDVT3BT9TQIPoNvVDS6oKQ4
         ns4ZbBxgZEJkSc3n4UTvIPmZNAtWk2cKYk3JLNBTyiRFHUtY+jVT5J7Hi7qBs+av5ad9
         qIxZ6Ybvsf4a8Y4MDM4R+1pAy+lqKrhr7VzaN4FFIx03HB6MAwGsb7EHSgJg/Z4kAfpz
         UnYA==
X-Forwarded-Encrypted: i=1; AKwUvByC13MHyY1DK5H8+YsJjNyzlnzhmPEjLGOGhnIAsXsTcydBj2e+RNhJ7iXJSpmBGKlAIFoq8Hf5RsStuGg=@vger.kernel.org
X-Gm-Message-State: AFuF++n5/MIM8ZJdFYVaspe8dWfm6OnQiR8iRS1XgMiz0Ivwlussqq98
	2FMne76+vb5PPGIPHs7L5EvBB8HXDs6L6vEUxWpvEsDbHojaf/o5Sfm5QTuBK5dAtP+45qE+Nad
	OeSqrRcFZupNs+Ckhrg+RhS4/aZOymSuzaw==
X-Received: from pjpo4.prod.google.com ([2002:a17:90a:9f84:b0:3a0:3d55:8086])
 (user=vamshigajjela job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:d40f:b0:3a0:42a9:9c81 with SMTP id 98e67ed59e1d1-3a0986ee06cmr1628954a91.17.1790243107143;
 Thu, 24 Sep 2026 02:45:07 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:14:58 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
Message-ID: <20260924094458.228732-1-vamshigajjela@google.com>
Subject: [PATCH] spmi: core: Add generic DebugFS interface for bus inspection
From: vamshi gajjela <vamshigajjela@google.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Jim Wylder <jwylder@google.com>, linux-kernel@vger.kernel.org, 
	vamshi gajjela <vamshigajjela@google.com>
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
 Documentation/ABI/testing/debugfs-spmi |  75 +++++
 MAINTAINERS                            |   1 +
 drivers/spmi/Makefile                  |   1 +
 drivers/spmi/spmi-debugfs.c            | 371 +++++++++++++++++++++++++
 drivers/spmi/spmi.c                    |   7 +
 include/linux/spmi.h                   |  18 ++
 6 files changed, 473 insertions(+)
 create mode 100644 Documentation/ABI/testing/debugfs-spmi
 create mode 100644 drivers/spmi/spmi-debugfs.c

diff --git a/Documentation/ABI/testing/debugfs-spmi b/Documentation/ABI/testing/debugfs-spmi
new file mode 100644
index 000000000000..10ad075b8619
--- /dev/null
+++ b/Documentation/ABI/testing/debugfs-spmi
@@ -0,0 +1,75 @@
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
+		    echo "r <sid> <addr> [len]" > xfer && cat xfer
+		  Reads 1 to 16 bytes starting at <addr> from slave <sid>.
+		  The optional [len] parameter defaults to 1 byte.
+		  Output is formatted as:
+		    0x<addr>: <byte0> <byte1> ...
+		  Reading the file consumes the response; subsequent reads
+		  return EOF (0 bytes) to prevent reading stale data.
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
+		Register Read/Write Long, Zero Write) based on the address
+		and burst length.
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
index 38ac635645ba..23cd6036863b 100644
--- a/drivers/spmi/Makefile
+++ b/drivers/spmi/Makefile
@@ -3,6 +3,7 @@
 # Makefile for kernel SPMI framework.
 #
 obj-$(CONFIG_SPMI)	+= spmi.o spmi-devres.o
+obj-$(CONFIG_DEBUG_FS)	+= spmi-debugfs.o
 
 obj-$(CONFIG_SPMI_APPLE)	+= spmi-apple-controller.o
 obj-$(CONFIG_SPMI_HISI3670)	+= hisi-spmi-controller.o
diff --git a/drivers/spmi/spmi-debugfs.c b/drivers/spmi/spmi-debugfs.c
new file mode 100644
index 000000000000..4b216a0f325e
--- /dev/null
+++ b/drivers/spmi/spmi-debugfs.c
@@ -0,0 +1,371 @@
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
+struct spmi_ctrl_debugfs {
+	struct dentry *dentry;
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
+static int spmi_calc_write_opcode(u16 addr, size_t len, u8 *opc)
+{
+	if (len == 0)
+		return -EINVAL;
+
+	if (addr == 0 && len == 1)
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
+		ret = ctrl->read_cmd(ctrl, SPMI_CMD_READ, sid, 0x0, &dummy, 1);
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
+static ssize_t spmi_debugfs_xfer_read(struct file *file, char __user *user_buf,
+				      size_t count, loff_t *ppos)
+{
+	struct spmi_controller *ctrl = file->private_data;
+	struct spmi_ctrl_debugfs *dbg = ctrl->debugfs;
+	ssize_t ret;
+
+	if (!dbg)
+		return -ENODEV;
+
+	mutex_lock(&dbg->lock);
+	ret = simple_read_from_buffer(user_buf, count, ppos, dbg->xfer_buf, dbg->xfer_len);
+	if (ret > 0 && *ppos >= dbg->xfer_len)
+		dbg->xfer_len = 0;
+	mutex_unlock(&dbg->lock);
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
+	struct spmi_controller *ctrl = file->private_data;
+	struct spmi_ctrl_debugfs *dbg = ctrl->debugfs;
+	struct device *parent = ctrl->dev.parent;
+	unsigned int sid, addr, len;
+	unsigned int cmd_opc, val;
+	char *str, *tok;
+	char kbuf[256];
+	int ret = 0, i;
+	u8 data[16];
+	size_t off;
+	u8 opcode;
+	char type;
+	bool rpm;
+
+	if (!dbg)
+		return -ENODEV;
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
+	mutex_lock(&dbg->lock);
+	dbg->xfer_len = 0;
+
+	if (type == 'r') {
+		tok = spmi_debugfs_next_tok(&str);
+		if (!tok || kstrtouint(tok, 16, &addr)) {
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
+		ret = ctrl->read_cmd(ctrl, opcode, sid, addr, data, len);
+		if (!ret) {
+			off = scnprintf(dbg->xfer_buf, sizeof(dbg->xfer_buf),
+					"0x%04x:", addr);
+
+			for (i = 0; i < len; i++)
+				off += scnprintf(dbg->xfer_buf + off, sizeof(dbg->xfer_buf) - off,
+						 " %02x", data[i]);
+			off += scnprintf(dbg->xfer_buf + off, sizeof(dbg->xfer_buf) - off, "\n");
+			dbg->xfer_len = off;
+		}
+	} else if (type == 'w') {
+		tok = spmi_debugfs_next_tok(&str);
+		if (!tok || kstrtouint(tok, 16, &addr)) {
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
+		ret = spmi_calc_write_opcode(addr, len, &opcode);
+		if (ret)
+			goto out;
+
+		add_taint(TAINT_USER, LOCKDEP_STILL_OK);
+
+		ret = ctrl->write_cmd(ctrl, opcode, sid, addr, data, len);
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
+		ret = ctrl->cmd(ctrl, cmd_opc, sid);
+	}
+
+out:
+	mutex_unlock(&dbg->lock);
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
+	.open		= simple_open,
+	.read		= spmi_debugfs_xfer_read,
+	.write		= spmi_debugfs_xfer_write,
+	.llseek		= default_llseek,
+};
+
+void spmi_controller_debugfs_init(struct spmi_controller *ctrl)
+{
+	struct spmi_ctrl_debugfs *dbg;
+	char name[32];
+
+	if (IS_ERR_OR_NULL(spmi_debugfs_root))
+		return;
+
+	dbg = kzalloc_obj(*dbg, GFP_KERNEL);
+	if (!dbg)
+		return;
+
+	mutex_init(&dbg->lock);
+
+	snprintf(name, sizeof(name), "spmi-%u", ctrl->nr);
+	dbg->dentry = debugfs_create_dir(name, spmi_debugfs_root);
+	if (IS_ERR_OR_NULL(dbg->dentry)) {
+		kfree(dbg);
+		return;
+	}
+
+	debugfs_create_file("name", 0444, dbg->dentry, ctrl, &spmi_debugfs_name_fops);
+	debugfs_create_file("detect", 0444, dbg->dentry, ctrl, &spmi_debugfs_detect_fops);
+	debugfs_create_file("xfer", 0600, dbg->dentry, ctrl, &spmi_debugfs_xfer_fops);
+
+	ctrl->debugfs = dbg;
+}
+
+void spmi_controller_debugfs_remove(struct spmi_controller *ctrl)
+{
+	if (!ctrl->debugfs)
+		return;
+
+	debugfs_remove(ctrl->debugfs->dentry);
+	kfree(ctrl->debugfs);
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
diff --git a/drivers/spmi/spmi.c b/drivers/spmi/spmi.c
index e889b129f3ac..7d2e9a762fb8 100644
--- a/drivers/spmi/spmi.c
+++ b/drivers/spmi/spmi.c
@@ -554,6 +554,8 @@ int spmi_controller_add(struct spmi_controller *ctrl)
 	dev_dbg(&ctrl->dev, "spmi-%d registered: dev:%p\n",
 		ctrl->nr, &ctrl->dev);
 
+	spmi_controller_debugfs_init(ctrl);
+
 	return 0;
 };
 EXPORT_SYMBOL_GPL(spmi_controller_add);
@@ -580,6 +582,8 @@ void spmi_controller_remove(struct spmi_controller *ctrl)
 	if (!ctrl)
 		return;
 
+	spmi_controller_debugfs_remove(ctrl);
+
 	device_for_each_child(&ctrl->dev, NULL, spmi_ctrl_remove_device);
 	device_del(&ctrl->dev);
 }
@@ -603,6 +607,7 @@ EXPORT_SYMBOL_GPL(__spmi_driver_register);
 
 static void __exit spmi_exit(void)
 {
+	spmi_debugfs_exit();
 	bus_unregister(&spmi_bus_type);
 }
 module_exit(spmi_exit);
@@ -615,6 +620,8 @@ static int __init spmi_init(void)
 	if (ret)
 		return ret;
 
+	spmi_debugfs_init();
+
 	is_registered = true;
 	return 0;
 }
diff --git a/include/linux/spmi.h b/include/linux/spmi.h
index 28e8c8bd3944..fcd8b9fc6cbf 100644
--- a/include/linux/spmi.h
+++ b/include/linux/spmi.h
@@ -76,7 +76,10 @@ void spmi_device_remove(struct spmi_device *sdev);
  * @cmd:	sends a non-data command sequence on the SPMI bus.
  * @read_cmd:	sends a register read command sequence on the SPMI bus.
  * @write_cmd:	sends a register write command sequence on the SPMI bus.
+ * @debugfs:	debugfs private data for this controller.
  */
+struct spmi_ctrl_debugfs;
+
 struct spmi_controller {
 	struct device		dev;
 	unsigned int		nr;
@@ -85,6 +88,9 @@ struct spmi_controller {
 			    u8 sid, u16 addr, u8 *buf, size_t len);
 	int	(*write_cmd)(struct spmi_controller *ctrl, u8 opcode,
 			     u8 sid, u16 addr, const u8 *buf, size_t len);
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+	struct spmi_ctrl_debugfs *debugfs;
+#endif
 };
 
 static inline struct spmi_controller *to_spmi_controller(struct device *d)
@@ -186,4 +192,16 @@ int spmi_command_sleep(struct spmi_device *sdev);
 int spmi_command_wakeup(struct spmi_device *sdev);
 int spmi_command_shutdown(struct spmi_device *sdev);
 
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
2.56.0.rc1.310.g51773c2048-goog

