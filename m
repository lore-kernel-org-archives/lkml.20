Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=43.154.54.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725503;
	b=uwReXFS3r/45PfPnwgnh9Revda5aFj7ip6pIVMHJbqZ7BrFMlkRXO4eKA4myoJMDOcck
	 CXZh+TP7APp7mdZ57MNwchpV8sVY+Jbazy771ALAuNsCOSGfwWwJE/kALiatXGtdlCOK1
	 RHcQNpDUrVi8Kzy32jnsfekF6MCjML+z+F3bJNoIbGFFlw5GjIcTFjr6CqOKNqAj+TdQC
	 PcneMrdGWhQ+/TB0rX3UpG0hBwnkiwr+zfvIsQu+TqznZT/Rb9LEekMieiPpRsK1/YFqE
	 GvlzVSPFjQzhX8wJogGtfnMipzqo0xPiHPmpvic3x+k4+gKyNPEpTGpZLzIFVxtzIQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725503;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-SPAM:X-QQ-RECHKSPAM;
	bh=oXLZiacU0e+xdF1GbNl5vg9UCXrRDx8MgNsU5XfRP5c=;
	b=d6umw+jIG1/cfi8tyx0cJkLSs9FyPJnbbX9DaUeF37ZhOHHPEAKDQ/ekHR6toy6r9+7e
	 KWyRbb9epw7v6HNoU9saGPa+9LH8iiMqiydCdvBf9SmoQAlnlYqG51NzKD5/Tx8h/RMW/
	 o4r56J7pZd9TVVGLpTnpdZx9W0JVhkdvHB8kLqgdY7AAslfEv2uySuqw9VjXOks5gH+x0
	 KO3rrDlxwJWB6jnOVpMSzittwdxiq7UY6XXTJzD+AseZhi/ESKbXdqyl+IMcmoKDz8/Cx
	 dbz7+7fzB2aq0YP/CXKoyhOpPBnRjbTvegkWrWF4Hd31nyb/5hsH/rsOsB/mStevU7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=qbZeYTBA;
	arc=none smtp.remote-ip=43.154.54.12
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.54.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100BA606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 100BA606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=qbZeYTBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725389;
	bh=oXLZiacU0e+xdF1GbNl5vg9UCXrRDx8MgNsU5XfRP5c=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=qbZeYTBAvpdj4fZ7XxE1cD7xjkbcIhYtYCHsqvflaZ0nvZ3zKXqJvuQ6t50lrGw8f
	 GM9UhfV6PwRCw5JG/9WdRzcm+KF8n6hJrZSZ9C0pX+gWa8wUQO1wTeJNpi4JAQiEw5
	 LNVQfYl5v2iIGIuwMKFN6/PAmJ6VZUAigLFAlKjc=
X-QQ-mid: esmtpsz11t1792725385t2fe5d591
X-QQ-Originating-IP: 5/8lHFp5xaGExtC28IZwU5TeoUYCSeZeBIC9S4fSXT0=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:16:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9442057976501502179
EX-QQ-RecipientCnt: 26
From: Zane Leung <liangzhen@linux.spacemit.com>
To: gregkh@linuxfoundation.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	alexander.shishkin@linux.intel.com,
	suzuki.poulose@arm.com,
	mchitale@gmail.com,
	anup@brainfault.org,
	irogers@google.com
Cc: mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	peterz@infradead.org,
	mingo@redhat.com,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	jolsa@kernel.org,
	adrian.hunter@intel.com,
	alex@ghiti.fr,
	atish.patra@linux.dev,
	andrew.jones@oss.qualcomm.com,
	sunilvl@oss.qualcomm.com,
	liangzhen@linux.spacemit.com,
	zhuangqiubin@linux.spacemit.com,
	coresight@lists.linaro.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 20/24] gtrace: Add CoreSight TMC driver support
Date: Fri, 23 Oct 2026 11:15:01 +0800
Message-Id: <20261023031505.2020925-21-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
References: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
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
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MTyvyLqh9yTfI7IgfLYdzTwRq+Ds9JUj3HWWJpBu7OLqzMb75Nxuhrd5
	5UarJovDDd8i5h+NtDOA+gkWFlvBObp2F9S1cSJVjR8jQT372PWMhHxmigGjsdSpIQgNhoX
	yhspHfMoW2A8+tDYFXhhWWjILDZyPqXy1egjcRN5s2VtGvbZJ/ppXiZ+aVNiyx72O1VKZ1U
	6FyS9Zaw3Bx8N8mmQA3vU6T6fC7eEnhntszc0ehlymxh7DilvulZV3gio0JzfoQmHtgGe9A
	Jg9Y5PpcdXLColmj1SIOD1cywbkKDk0CCthhzlVxoOLDi5QkAApTcHIZ08q9AZAxP0aZuGK
	bAtrrSE4TvoeHymoXQZpZVtC7c4AVVXw8kQ9DBxhlna02m/GAtB+s4pvq8MWngiDg2JLiXE
	qT68V4idKKKjtcLQqF+z9bqy9mdCVVEhuO2A6BjUtrauL2yuAPMJW3AiUBJ18Rte2dSlX/w
	QtS8dU2LpYil1teIeKBcLaAHrSgR2+NQHXKf8H0/5yRHyD86dQ+zI4kqE4yDHJMhPzg0EGi
	eCgPc6Y741NM5GlaeGIWd23a3ATKf8JR3qHSFSxKHsjmQw61WszwgXrADoHmdmzsSiEGwo4
	1mpPCUA07Cy3C9ym7DZT4TrOxELTBKTLiq3zK2vR/l+zhgd9uyKgnBw2TYS3YqXbWLfGvfN
	Y31v0Bhdd7wKSrPv2QdBn9GrwYuz2F491TUAnlxR4Q8OyDp03Q2XXZ5BjN7OUMjV/yrf02o
	6gPZCmcw6KZTFaPqqc1DhaulsyMH081wEnho6Sr9NQQqqcQytLBm5/XHG714zwpROiWKz1D
	sQWqcZpZAMCWjZuEt+2yQ0Y56JQwA6ryFsoeh92kBrzgQ4oqq0mm8xnefm837wATfPxho0Q
	YcwszJ6Cso3S3aYKjOpF78Owzritva4XBV8qy+Y2lx/DIX3TJnpr4DZfLUA+BwZ9jRHKVsx
	2L1Qt+u2znbPE2Ev3muUO5phRL53EXr2LR9zhffLqIBBNpQPRvEU9OWVRJgCyO9cW1cbl3H
	MIP4VruNfjlA0GgO2QwScBmJdraAzhd+j71XaC8IyMhZNwphe2ETlL8CbBgTPUuMnsDXXk2
	aLL3+GB+d21KmyLn3RSOl35PP314ZFM4NlhICALu4I8WkqFOGsu/qg=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-SPAM: true
X-QQ-RECHKSPAM: 3

Add CoreSight Trace Memory Controller (TMC) driver as part of the
gtrace framework. ETB and ETF share one driver (ETF additionally
works as a link), while ETR uses system memory and provides perf
buffer alloc/free callbacks.

Signed-off-by: Zane Leung <liangzhen@linux.spacemit.com>
---
 .../hwtracing/coresight/coresight-tmc-etf.c   |    1 -
 drivers/hwtracing/gtrace/Kconfig              |   13 +
 drivers/hwtracing/gtrace/Makefile             |    2 +
 drivers/hwtracing/gtrace/coresight-tmc-core.c | 1111 ++++++++++
 drivers/hwtracing/gtrace/coresight-tmc-etf.c  |  573 +++++
 drivers/hwtracing/gtrace/coresight-tmc-etr.c  | 1888 +++++++++++++++++
 drivers/hwtracing/gtrace/coresight-tmc.h      |  469 ++++
 7 files changed, 4056 insertions(+), 1 deletion(-)
 create mode 100644 drivers/hwtracing/gtrace/coresight-tmc-core.c
 create mode 100644 drivers/hwtracing/gtrace/coresight-tmc-etf.c
 create mode 100644 drivers/hwtracing/gtrace/coresight-tmc-etr.c
 create mode 100644 drivers/hwtracing/gtrace/coresight-tmc.h

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index 8882b1c4cdc0..11082fd249eb 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
@@ -80,7 +80,6 @@ static void tmc_etb_dump_hw(struct tmc_drvdata *drvdata)
 
 	if (lost)
 		coresight_insert_barrier_packet(drvdata->buf);
-	return;
 }
 
 static void __tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/Kconfig
index 081af9c0c670..83ee442ad860 100644
--- a/drivers/hwtracing/gtrace/Kconfig
+++ b/drivers/hwtracing/gtrace/Kconfig
@@ -114,3 +114,16 @@ config CORESIGHT_FUNNEL
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called coresight-funnel.
+
+config CORESIGHT_TMC
+	tristate "CoreSight generic TMC driver"
+	depends on GTRACE_CORESIGHT
+	default y
+	help
+	  This enables support for the CoreSight Trace Memory Controller
+	  (TMC) driver. Depending on its configuration the device can act
+	  as an embedded trace buffer (ETB), an embedded trace FIFO (ETF)
+	  or a trace router (ETR) that stores trace data in system memory.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called coresight-tmc.
diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtrace/Makefile
index d2745c961a75..e995ba8e7fc1 100644
--- a/drivers/hwtracing/gtrace/Makefile
+++ b/drivers/hwtracing/gtrace/Makefile
@@ -13,3 +13,5 @@ obj-$(CONFIG_RVTRACE_FUNNEL) += rvtrace-funnel.o
 obj-$(CONFIG_RVTRACE_ATBBRIDGE) += rvtrace-atbbridge.o
 obj-$(CONFIG_GTRACE_CORESIGHT) += coresight-platform.o
 obj-$(CONFIG_CORESIGHT_FUNNEL) += coresight-funnel.o
+obj-$(CONFIG_CORESIGHT_TMC) += coresight-tmc.o
+coresight-tmc-y := coresight-tmc-core.o coresight-tmc-etf.o coresight-tmc-etr.o
diff --git a/drivers/hwtracing/gtrace/coresight-tmc-core.c b/drivers/hwtracing/gtrace/coresight-tmc-core.c
new file mode 100644
index 000000000000..26572f1d3b6f
--- /dev/null
+++ b/drivers/hwtracing/gtrace/coresight-tmc-core.c
@@ -0,0 +1,1111 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2012, The Linux Foundation. All rights reserved.
+ *
+ * Description: CoreSight Trace Memory Controller driver
+ * Derived from drivers/hwtracing/coresight/coresight-tmc-core.c
+ */
+
+#include <linux/acpi.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/types.h>
+#include <linux/device.h>
+#include <linux/idr.h>
+#include <linux/io.h>
+#include <linux/iommu.h>
+#include <linux/err.h>
+#include <linux/fs.h>
+#include <linux/miscdevice.h>
+#include <linux/mutex.h>
+#include <linux/property.h>
+#include <linux/uaccess.h>
+#include <linux/slab.h>
+#include <linux/dma-mapping.h>
+#include <linux/spinlock.h>
+#include <linux/pm_runtime.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/gtrace.h>
+#include <linux/amba/bus.h>
+#include <linux/platform_device.h>
+
+#include "coresight.h"
+#include "coresight-tmc.h"
+
+int tmc_wait_for_tmcready(struct tmc_drvdata *drvdata)
+{
+	struct gtrace_component *comp = drvdata->comp;
+	struct gtrace_platform_data *pdata = comp->pdata;
+
+	/* Ensure formatter, unformatter and hardware fifo are empty */
+	if (gtrace_poll_bit(pdata, TMC_STS, TMC_STS_TMCREADY_BIT, 1,
+			    pdata->control_poll_timeout_usecs)) {
+		dev_err(&comp->dev,
+			"timeout while waiting for TMC to be Ready\n");
+		return -EBUSY;
+	}
+	return 0;
+}
+
+void tmc_flush_and_stop(struct tmc_drvdata *drvdata)
+{
+	struct gtrace_component *comp = drvdata->comp;
+	struct gtrace_platform_data *pdata = comp->pdata;
+	u32 ffcr;
+
+	ffcr = readl_relaxed(drvdata->base + TMC_FFCR);
+	ffcr |= TMC_FFCR_STOP_ON_FLUSH;
+	writel_relaxed(ffcr, drvdata->base + TMC_FFCR);
+	ffcr |= BIT(TMC_FFCR_FLUSHMAN_BIT);
+	writel_relaxed(ffcr, drvdata->base + TMC_FFCR);
+	/* Ensure flush completes */
+	if (gtrace_poll_bit(pdata, TMC_FFCR, TMC_FFCR_FLUSHMAN_BIT, 0,
+			    pdata->control_poll_timeout_usecs)) {
+		dev_err(&comp->dev,
+		"timeout while waiting for completion of Manual Flush\n");
+	}
+
+	tmc_wait_for_tmcready(drvdata);
+}
+
+void tmc_enable_hw(struct tmc_drvdata *drvdata)
+{
+	writel_relaxed(TMC_CTL_CAPT_EN, drvdata->base + TMC_CTL);
+}
+
+void tmc_disable_hw(struct tmc_drvdata *drvdata)
+{
+	writel_relaxed(0x0, drvdata->base + TMC_CTL);
+}
+
+u32 tmc_get_memwidth_mask(struct tmc_drvdata *drvdata)
+{
+	u32 mask = 0;
+
+	/*
+	 * When moving RRP or an offset address forward, the new values must
+	 * be byte-address aligned to the width of the trace memory databus
+	 * _and_ to a frame boundary (16 byte), whichever is the biggest. For
+	 * example, for 32-bit, 64-bit and 128-bit wide trace memory, the four
+	 * LSBs must be 0s. For 256-bit wide trace memory, the five LSBs must
+	 * be 0s.
+	 */
+	switch (drvdata->memwidth) {
+	case TMC_MEM_INTF_WIDTH_32BITS:
+	case TMC_MEM_INTF_WIDTH_64BITS:
+	case TMC_MEM_INTF_WIDTH_128BITS:
+		mask = GENMASK(31, 4);
+		break;
+	case TMC_MEM_INTF_WIDTH_256BITS:
+		mask = GENMASK(31, 5);
+		break;
+	}
+
+	return mask;
+}
+
+static bool is_tmc_crashdata_valid(struct tmc_drvdata *drvdata)
+{
+	struct tmc_crash_metadata *mdata;
+
+	if (!tmc_has_reserved_buffer(drvdata) ||
+	    !tmc_has_crash_mdata_buffer(drvdata))
+		return false;
+
+	mdata = drvdata->crash_mdata.vaddr;
+
+	/* Check version match */
+	if (mdata->version != CS_CRASHDATA_VERSION)
+		return false;
+
+	/* Check for valid metadata */
+	if (!mdata->valid) {
+		dev_dbg(&drvdata->comp->dev,
+			"Data invalid in tmc crash metadata\n");
+		return false;
+	}
+
+	/*
+	 * Buffer address given by metadata for retrieval of trace data
+	 * from previous boot is expected to be same as the reserved
+	 * trace buffer memory region provided through DTS
+	 */
+	if (drvdata->resrv_buf.paddr != mdata->trace_paddr) {
+		dev_dbg(&drvdata->comp->dev,
+			"Trace buffer address of previous boot invalid\n");
+		return false;
+	}
+
+	/* Check data integrity of metadata */
+	if (mdata->crc32_mdata != find_crash_metadata_crc(mdata)) {
+		dev_err(&drvdata->comp->dev,
+			"CRC mismatch in tmc crash metadata\n");
+		return false;
+	}
+	/* Check data integrity of tracedata */
+	if (mdata->crc32_tdata != find_crash_tracedata_crc(drvdata, mdata)) {
+		dev_err(&drvdata->comp->dev,
+			"CRC mismatch in tmc crash tracedata\n");
+		return false;
+	}
+
+	return true;
+}
+
+static inline ssize_t tmc_get_resvbuf_trace(struct tmc_drvdata *drvdata,
+					  loff_t pos, size_t len, char **bufpp)
+{
+	s64 offset;
+	ssize_t actual = len;
+	struct tmc_resrv_buf *rbuf = &drvdata->resrv_buf;
+
+	if (pos + actual > rbuf->len)
+		actual = rbuf->len - pos;
+	if (actual <= 0)
+		return 0;
+
+	/* Compute the offset from which we read the data */
+	offset = rbuf->offset + pos;
+	if (offset >= rbuf->size)
+		offset -= rbuf->size;
+
+	/* Adjust the length to limit this transaction to end of buffer */
+	actual = (actual < (rbuf->size - offset)) ?
+		actual : rbuf->size - offset;
+
+	*bufpp = (char *)rbuf->vaddr + offset;
+
+	return actual;
+}
+
+static int tmc_prepare_crashdata(struct tmc_drvdata *drvdata)
+{
+	char *bufp;
+	ssize_t len;
+	u32 status, size;
+	u64 rrp, rwp, dba;
+	struct tmc_resrv_buf *rbuf;
+	struct tmc_crash_metadata *mdata;
+
+	mdata = drvdata->crash_mdata.vaddr;
+	rbuf = &drvdata->resrv_buf;
+
+	rrp = mdata->tmc_rrp;
+	rwp = mdata->tmc_rwp;
+	dba = mdata->tmc_dba;
+	status = mdata->tmc_sts;
+	size = mdata->tmc_ram_size << 2;
+
+	/* Sync the buffer pointers */
+	rbuf->offset = rrp - dba;
+	if (status & TMC_STS_FULL)
+		rbuf->len = size;
+	else
+		rbuf->len = rwp - rrp;
+
+	/* Additional sanity checks for validating metadata */
+	if ((rbuf->offset > size) ||
+	    (rbuf->len > size)) {
+		dev_dbg(&drvdata->comp->dev,
+			"Offset and length invalid in tmc crash metadata\n");
+		return -EINVAL;
+	}
+
+	if (status & TMC_STS_FULL) {
+		len = tmc_get_resvbuf_trace(drvdata, 0x0,
+					    CORESIGHT_BARRIER_PKT_SIZE, &bufp);
+		if (len >= CORESIGHT_BARRIER_PKT_SIZE) {
+			coresight_insert_barrier_packet(bufp);
+			/* Recalculate crc */
+			mdata->crc32_tdata = find_crash_tracedata_crc(drvdata,
+								      mdata);
+			mdata->crc32_mdata = find_crash_metadata_crc(mdata);
+		}
+	}
+
+	return 0;
+}
+
+static int tmc_read_prepare(struct tmc_drvdata *drvdata)
+{
+	int ret = 0;
+
+	switch (drvdata->config_type) {
+	case TMC_CONFIG_TYPE_ETB:
+	case TMC_CONFIG_TYPE_ETF:
+		ret = tmc_read_prepare_etb(drvdata);
+		break;
+	case TMC_CONFIG_TYPE_ETR:
+		ret = tmc_read_prepare_etr(drvdata);
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	if (!ret)
+		dev_dbg(&drvdata->comp->dev, "TMC read start\n");
+
+	return ret;
+}
+
+static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
+{
+	int ret = 0;
+
+	switch (drvdata->config_type) {
+	case TMC_CONFIG_TYPE_ETB:
+	case TMC_CONFIG_TYPE_ETF:
+		ret = tmc_read_unprepare_etb(drvdata);
+		break;
+	case TMC_CONFIG_TYPE_ETR:
+		ret = tmc_read_unprepare_etr(drvdata);
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	if (!ret)
+		dev_dbg(&drvdata->comp->dev, "TMC read end\n");
+
+	return ret;
+}
+
+static int tmc_open(struct inode *inode, struct file *file)
+{
+	int ret;
+	struct tmc_drvdata *drvdata = container_of(file->private_data,
+						   struct tmc_drvdata, miscdev);
+
+	ret = tmc_read_prepare(drvdata);
+	if (ret)
+		return ret;
+
+	nonseekable_open(inode, file);
+
+	dev_dbg(&drvdata->comp->dev, "%s: successfully opened\n", __func__);
+	return 0;
+}
+
+static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
+				   char **bufpp)
+{
+	switch (drvdata->config_type) {
+	case TMC_CONFIG_TYPE_ETB:
+	case TMC_CONFIG_TYPE_ETF:
+		return tmc_etb_get_sysfs_trace(drvdata, pos, len, bufpp);
+	case TMC_CONFIG_TYPE_ETR:
+		return tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
+	}
+
+	return -EINVAL;
+}
+
+static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
+			loff_t *ppos)
+{
+	char *bufp;
+	ssize_t actual;
+	struct tmc_drvdata *drvdata = container_of(file->private_data,
+						   struct tmc_drvdata, miscdev);
+	actual = tmc_get_sysfs_trace(drvdata, *ppos, len, &bufp);
+	if (actual <= 0)
+		return 0;
+
+	if (copy_to_user(data, bufp, actual)) {
+		dev_dbg(&drvdata->comp->dev,
+			"%s: copy_to_user failed\n", __func__);
+		return -EFAULT;
+	}
+
+	*ppos += actual;
+	dev_dbg(&drvdata->comp->dev, "%zu bytes copied\n", actual);
+
+	return actual;
+}
+
+static int tmc_release(struct inode *inode, struct file *file)
+{
+	int ret;
+	struct tmc_drvdata *drvdata = container_of(file->private_data,
+						   struct tmc_drvdata, miscdev);
+
+	ret = tmc_read_unprepare(drvdata);
+	if (ret)
+		return ret;
+
+	dev_dbg(&drvdata->comp->dev, "%s: released\n", __func__);
+	return 0;
+}
+
+static const struct file_operations tmc_fops = {
+	.owner		= THIS_MODULE,
+	.open		= tmc_open,
+	.read		= tmc_read,
+	.release	= tmc_release,
+};
+
+static int tmc_crashdata_open(struct inode *inode, struct file *file)
+{
+	int err = 0;
+	unsigned long flags;
+	struct tmc_resrv_buf *rbuf;
+	struct tmc_crash_metadata *mdata;
+	struct tmc_drvdata *drvdata = container_of(file->private_data,
+						   struct tmc_drvdata,
+						   crashdev);
+
+	mdata = drvdata->crash_mdata.vaddr;
+	rbuf = &drvdata->resrv_buf;
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	if (mdata->valid)
+		rbuf->reading = true;
+	else
+		err = -ENOENT;
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+	if (err)
+		goto exit;
+
+	nonseekable_open(inode, file);
+	dev_dbg(&drvdata->comp->dev, "%s: successfully opened\n", __func__);
+exit:
+	return err;
+}
+
+static ssize_t tmc_crashdata_read(struct file *file, char __user *data,
+				  size_t len, loff_t *ppos)
+{
+	char *bufp;
+	ssize_t actual;
+	struct tmc_drvdata *drvdata = container_of(file->private_data,
+						   struct tmc_drvdata,
+						   crashdev);
+
+	actual = tmc_get_resvbuf_trace(drvdata, *ppos, len, &bufp);
+	if (actual <= 0)
+		return 0;
+
+	if (copy_to_user(data, bufp, actual)) {
+		dev_dbg(&drvdata->comp->dev,
+			"%s: copy_to_user failed\n", __func__);
+		return -EFAULT;
+	}
+
+	*ppos += actual;
+	dev_dbg(&drvdata->comp->dev, "%zu bytes copied\n", actual);
+
+	return actual;
+}
+
+static int tmc_crashdata_release(struct inode *inode, struct file *file)
+{
+	unsigned long flags;
+	struct tmc_resrv_buf *rbuf;
+	struct tmc_drvdata *drvdata = container_of(file->private_data,
+						   struct tmc_drvdata,
+						   crashdev);
+
+	rbuf = &drvdata->resrv_buf;
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	rbuf->reading = false;
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
+	dev_dbg(&drvdata->comp->dev, "%s: released\n", __func__);
+	return 0;
+}
+
+static const struct file_operations tmc_crashdata_fops = {
+	.owner		= THIS_MODULE,
+	.open		= tmc_crashdata_open,
+	.read		= tmc_crashdata_read,
+	.release	= tmc_crashdata_release,
+};
+
+static enum tmc_mem_intf_width tmc_get_memwidth(u32 devid)
+{
+	enum tmc_mem_intf_width memwidth;
+
+	/*
+	 * Excerpt from the TRM:
+	 *
+	 * DEVID::MEMWIDTH[10:8]
+	 * 0x2 Memory interface databus is 32 bits wide.
+	 * 0x3 Memory interface databus is 64 bits wide.
+	 * 0x4 Memory interface databus is 128 bits wide.
+	 * 0x5 Memory interface databus is 256 bits wide.
+	 */
+	switch (BMVAL(devid, 8, 10)) {
+	case 0x2:
+		memwidth = TMC_MEM_INTF_WIDTH_32BITS;
+		break;
+	case 0x3:
+		memwidth = TMC_MEM_INTF_WIDTH_64BITS;
+		break;
+	case 0x4:
+		memwidth = TMC_MEM_INTF_WIDTH_128BITS;
+		break;
+	case 0x5:
+		memwidth = TMC_MEM_INTF_WIDTH_256BITS;
+		break;
+	default:
+		memwidth = 0;
+	}
+
+	return memwidth;
+}
+
+static struct attribute *coresight_tmc_mgmt_attrs[] = {
+	gtrace_simple_reg32(rsz, TMC_RSZ),
+	gtrace_simple_reg32(sts, TMC_STS),
+	gtrace_simple_reg64(rrp, TMC_RRP, TMC_RRPHI),
+	gtrace_simple_reg64(rwp, TMC_RWP, TMC_RWPHI),
+	gtrace_simple_reg32(trg, TMC_TRG),
+	gtrace_simple_reg32(ctl, TMC_CTL),
+	gtrace_simple_reg32(ffsr, TMC_FFSR),
+	gtrace_simple_reg32(ffcr, TMC_FFCR),
+	gtrace_simple_reg32(mode, TMC_MODE),
+	gtrace_simple_reg32(pscr, TMC_PSCR),
+	gtrace_simple_reg32(devid, CORESIGHT_DEVID),
+	gtrace_simple_reg64(dba, TMC_DBALO, TMC_DBAHI),
+	gtrace_simple_reg32(axictl, TMC_AXICTL),
+	gtrace_simple_reg32(authstatus, TMC_AUTHSTATUS),
+	NULL,
+};
+
+static ssize_t trigger_cntr_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	struct tmc_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val = drvdata->trigger_cntr;
+
+	return sprintf(buf, "%#lx\n", val);
+}
+
+static ssize_t trigger_cntr_store(struct device *dev,
+			     struct device_attribute *attr,
+			     const char *buf, size_t size)
+{
+	int ret;
+	unsigned long val;
+	struct tmc_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	ret = kstrtoul(buf, 16, &val);
+	if (ret)
+		return ret;
+
+	drvdata->trigger_cntr = val;
+	return size;
+}
+static DEVICE_ATTR_RW(trigger_cntr);
+
+static ssize_t buffer_size_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct tmc_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	return sprintf(buf, "%#x\n", drvdata->size);
+}
+
+static ssize_t buffer_size_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t size)
+{
+	int ret;
+	unsigned long val;
+	struct tmc_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	/* Only permitted for TMC-ETRs */
+	if (drvdata->config_type != TMC_CONFIG_TYPE_ETR)
+		return -EPERM;
+
+	ret = kstrtoul(buf, 0, &val);
+	if (ret)
+		return ret;
+	/* The buffer size should be page aligned */
+	if (val & (PAGE_SIZE - 1))
+		return -EINVAL;
+	drvdata->size = val;
+	return size;
+}
+
+static DEVICE_ATTR_RW(buffer_size);
+
+static ssize_t stop_on_flush_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct tmc_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	return sprintf(buf, "%#x\n", drvdata->stop_on_flush);
+}
+
+static ssize_t stop_on_flush_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t size)
+{
+	int ret;
+	u8 val;
+	struct tmc_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	ret = kstrtou8(buf, 0, &val);
+	if (ret)
+		return ret;
+	if (val)
+		drvdata->stop_on_flush = true;
+	else
+		drvdata->stop_on_flush = false;
+
+	return size;
+}
+
+static DEVICE_ATTR_RW(stop_on_flush);
+
+
+static struct attribute *coresight_tmc_attrs[] = {
+	&dev_attr_trigger_cntr.attr,
+	&dev_attr_buffer_size.attr,
+	&dev_attr_stop_on_flush.attr,
+	NULL,
+};
+
+static const struct attribute_group coresight_tmc_group = {
+	.attrs = coresight_tmc_attrs,
+};
+
+static const struct attribute_group coresight_tmc_mgmt_group = {
+	.attrs = coresight_tmc_mgmt_attrs,
+	.name = "mgmt",
+};
+
+static const struct attribute_group *coresight_etf_groups[] = {
+	&coresight_tmc_group,
+	&coresight_tmc_mgmt_group,
+	NULL,
+};
+
+static const struct attribute_group *coresight_etr_groups[] = {
+	&coresight_etr_group,
+	&coresight_tmc_group,
+	&coresight_tmc_mgmt_group,
+	NULL,
+};
+
+static bool tmc_etr_can_use_sg(struct device *dev)
+{
+	int ret;
+	u8 val_u8;
+
+	/*
+	 * Presence of the property 'arm,scatter-gather' is checked
+	 * on the platform for the feature support, rather than its
+	 * value.
+	 */
+	if (is_of_node(dev->fwnode)) {
+		return fwnode_property_present(dev->fwnode, "arm,scatter-gather");
+	} else if (is_acpi_device_node(dev->fwnode)) {
+		/*
+		 * TMC_DEVID_NOSCAT test in tmc_etr_setup_caps(), has already ensured
+		 * this property is only checked for Coresight SoC 400 TMC configured
+		 * as ETR.
+		 */
+		ret = fwnode_property_read_u8(dev->fwnode, "arm-armhc97c-sg-enable", &val_u8);
+		if (!ret)
+			return !!val_u8;
+
+		if (fwnode_property_present(dev->fwnode, "arm,scatter-gather")) {
+			pr_warn_once("Deprecated ACPI property - arm,scatter-gather\n");
+			return true;
+		}
+	}
+	return false;
+}
+
+static bool tmc_etr_has_non_secure_access(struct tmc_drvdata *drvdata)
+{
+	u32 auth = readl_relaxed(drvdata->base + TMC_AUTHSTATUS);
+
+	return (auth & TMC_AUTH_NSID_MASK) == 0x3;
+}
+
+static const struct amba_id tmc_ids[];
+
+static int of_tmc_get_reserved_resource_by_name(struct device *dev,
+						const char *name,
+						struct resource *res)
+{
+	int rc = -ENODEV;
+
+	rc = of_reserved_mem_region_to_resource_byname(dev->of_node, name, res);
+	if (rc < 0)
+		return rc;
+
+	if (res->start == 0 || resource_size(res) == 0)
+		rc = -ENODEV;
+
+	return rc;
+}
+
+static void tmc_get_reserved_region(struct device *parent)
+{
+	struct tmc_drvdata *drvdata = dev_get_drvdata(parent);
+	struct resource res;
+
+	if (of_tmc_get_reserved_resource_by_name(parent, "tracedata", &res))
+		return;
+
+	drvdata->resrv_buf.vaddr = memremap(res.start,
+						resource_size(&res),
+						MEMREMAP_WC);
+	if (IS_ERR_OR_NULL(drvdata->resrv_buf.vaddr)) {
+		dev_err(parent, "Reserved trace buffer mapping failed\n");
+		return;
+	}
+
+	drvdata->resrv_buf.paddr = res.start;
+	drvdata->resrv_buf.size  = resource_size(&res);
+
+	if (of_tmc_get_reserved_resource_by_name(parent, "metadata", &res))
+		return;
+
+	drvdata->crash_mdata.vaddr = memremap(res.start,
+					       resource_size(&res),
+					       MEMREMAP_WC);
+	if (IS_ERR_OR_NULL(drvdata->crash_mdata.vaddr)) {
+		dev_err(parent, "Metadata memory mapping failed\n");
+		return;
+	}
+
+	drvdata->crash_mdata.paddr = res.start;
+	drvdata->crash_mdata.size  = resource_size(&res);
+}
+
+/* Detect and initialise the capabilities of a TMC ETR */
+static int tmc_etr_setup_caps(struct device *parent, u32 devid,
+			      struct gtrace_platform_data *pdata)
+{
+	int rc;
+	u32 tmc_pid, dma_mask = 0;
+	struct tmc_drvdata *drvdata = dev_get_drvdata(parent);
+	void *dev_caps;
+
+	if (!tmc_etr_has_non_secure_access(drvdata))
+		return -EACCES;
+
+	tmc_pid = coresight_get_pid(pdata);
+	dev_caps = coresight_get_uci_data_from_amba(tmc_ids, tmc_pid);
+
+	/* Set the unadvertised capabilities */
+	tmc_etr_init_caps(drvdata, (u32)(unsigned long)dev_caps);
+
+	if (!(devid & TMC_DEVID_NOSCAT) && tmc_etr_can_use_sg(parent))
+		tmc_etr_set_cap(drvdata, TMC_ETR_SG);
+
+	/* Check if the AXI address width is available */
+	if (devid & TMC_DEVID_AXIAW_VALID)
+		dma_mask = ((devid >> TMC_DEVID_AXIAW_SHIFT) &
+				TMC_DEVID_AXIAW_MASK);
+
+	/*
+	 * Unless specified in the device configuration, ETR uses a 40-bit
+	 * AXI master in place of the embedded SRAM of ETB/ETF.
+	 */
+	switch (dma_mask) {
+	case 32:
+	case 40:
+	case 44:
+	case 48:
+	case 52:
+		dev_info(parent, "Detected dma mask %dbits\n", dma_mask);
+		break;
+	default:
+		dma_mask = 40;
+	}
+
+	rc = dma_set_mask_and_coherent(parent, DMA_BIT_MASK(dma_mask));
+	if (rc)
+		dev_err(parent, "Failed to setup DMA mask: %d\n", rc);
+	return rc;
+}
+
+static u32 tmc_etr_get_default_buffer_size(struct device *dev)
+{
+	u32 size;
+
+	if (fwnode_property_read_u32(dev->fwnode, "arm,buffer-size", &size))
+		size = SZ_1M;
+	return size;
+}
+
+static u32 tmc_etr_get_max_burst_size(struct device *dev)
+{
+	u32 burst_size;
+
+	if (fwnode_property_read_u32(dev->fwnode, "arm,max-burst-size",
+				     &burst_size))
+		return TMC_AXICTL_WR_BURST_16;
+
+	/* Only permissible values are 0 to 15 */
+	if (burst_size > 0xF)
+		burst_size = TMC_AXICTL_WR_BURST_16;
+
+	return burst_size;
+}
+
+static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
+					 const char *name)
+{
+	drvdata->crashdev.name =
+		devm_kasprintf(&drvdata->comp->dev, GFP_KERNEL, "%s_%s", "crash", name);
+	drvdata->crashdev.minor = MISC_DYNAMIC_MINOR;
+	drvdata->crashdev.fops = &tmc_crashdata_fops;
+	if (misc_register(&drvdata->crashdev)) {
+		dev_dbg(&drvdata->comp->dev,
+			"Failed to setup user interface for crashdata\n");
+		drvdata->crashdev.fops = NULL;
+	} else
+		dev_info(&drvdata->comp->dev,
+			"Valid crash tracedata found\n");
+}
+
+static int __tmc_probe(struct device *dev, struct resource *res)
+{
+	int ret = 0;
+	u32 devid;
+	void __iomem *base;
+	struct gtrace_platform_data *pdata = NULL;
+	struct tmc_drvdata *drvdata;
+	struct gtrace_component_id id = {
+		.version = CORESIGHT_COMPONENT_ID_VERSION,
+	};
+	const char *comp_name = NULL;
+
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, drvdata);
+
+	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
+	if (ret)
+		return ret;
+
+	ret = -ENOMEM;
+
+	/* Validity for the resource is already checked by the AMBA core */
+	base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(base)) {
+		ret = PTR_ERR(base);
+		goto out;
+	}
+
+	drvdata->base = base;
+
+	raw_spin_lock_init(&drvdata->spinlock);
+
+	devid = readl_relaxed(drvdata->base + CORESIGHT_DEVID);
+	drvdata->config_type = BMVAL(devid, 6, 7);
+	drvdata->memwidth = tmc_get_memwidth(devid);
+	drvdata->etr_mode = ETR_MODE_AUTO;
+
+	if (drvdata->config_type == TMC_CONFIG_TYPE_ETR) {
+		drvdata->size = tmc_etr_get_default_buffer_size(dev);
+		drvdata->max_burst_size = tmc_etr_get_max_burst_size(dev);
+	} else {
+		drvdata->size = readl_relaxed(drvdata->base + TMC_RSZ) * 4;
+	}
+
+	tmc_get_reserved_region(dev);
+
+	pdata = coresight_get_platform_data(dev);
+	if (IS_ERR(pdata)) {
+		ret = PTR_ERR(pdata);
+		goto out;
+	}
+	pdata->io_mem = true;
+	pdata->base = base;
+
+	switch (drvdata->config_type) {
+	case TMC_CONFIG_TYPE_ETB:
+		pdata->groups = coresight_etf_groups;
+		id.type = GTRACE_CORESIGHT_TMC_ETB;
+		comp_name = "tmc_etb";
+		break;
+	case TMC_CONFIG_TYPE_ETR:
+		pdata->groups = coresight_etr_groups;
+		id.type = GTRACE_CORESIGHT_TMC_ETR;
+		ret = tmc_etr_setup_caps(dev, devid, pdata);
+		if (ret)
+			goto out;
+		idr_init(&drvdata->idr);
+		mutex_init(&drvdata->idr_mutex);
+		comp_name = "tmc_etr";
+		break;
+	case TMC_CONFIG_TYPE_ETF:
+		pdata->is_linksink = true;
+		pdata->groups = coresight_etf_groups;
+		id.type = GTRACE_CORESIGHT_TMC_ETF;
+		comp_name = "tmc_etf";
+		break;
+	default:
+		pr_err("%u: Unsupported TMC config\n", drvdata->config_type);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	coresight_clear_self_claim_tag(pdata);
+
+	drvdata->comp = gtrace_register_component(&id, comp_name, pdata);
+	if (IS_ERR(drvdata->comp)) {
+		ret = PTR_ERR(drvdata->comp);
+		goto out;
+	}
+
+	drvdata->miscdev.name = dev_name(&drvdata->comp->dev);
+	drvdata->miscdev.minor = MISC_DYNAMIC_MINOR;
+	drvdata->miscdev.fops = &tmc_fops;
+	ret = misc_register(&drvdata->miscdev);
+	if (ret) {
+		gtrace_unregister_component(drvdata->comp);
+		goto out;
+	}
+
+out:
+	if (is_tmc_crashdata_valid(drvdata) &&
+	    !tmc_prepare_crashdata(drvdata))
+		register_crash_dev_interface(drvdata, dev_name(&drvdata->comp->dev));
+	return ret;
+}
+
+static int tmc_probe(struct amba_device *adev, const struct amba_id *id)
+{
+	int ret;
+
+	ret = __tmc_probe(&adev->dev, &adev->res);
+	if (!ret)
+		pm_runtime_put(&adev->dev);
+
+	return ret;
+}
+
+static void tmc_shutdown(struct amba_device *adev)
+{
+	unsigned long flags;
+	struct tmc_drvdata *drvdata = amba_get_drvdata(adev);
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+
+	if (gtrace_get_mode(drvdata->comp) == GTRACE_COMPONENT_MODE_DISABLED)
+		goto out;
+
+	if (drvdata->config_type == TMC_CONFIG_TYPE_ETR)
+		tmc_etr_disable_hw(drvdata);
+
+	/*
+	 * We do not care about coresight unregister here unlike remove
+	 * callback which is required for making coresight modular since
+	 * the system is going down after this.
+	 */
+out:
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+}
+
+static void __tmc_remove(struct device *dev)
+{
+	struct tmc_drvdata *drvdata = dev_get_drvdata(dev);
+
+	/*
+	 * Since misc_open() holds a refcount on the f_ops, which is
+	 * etb fops in this case, device is there until last file
+	 * handler to this device is closed.
+	 */
+	misc_deregister(&drvdata->miscdev);
+	if (drvdata->crashdev.fops)
+		misc_deregister(&drvdata->crashdev);
+	gtrace_unregister_component(drvdata->comp);
+}
+
+static void tmc_remove(struct amba_device *adev)
+{
+	__tmc_remove(&adev->dev);
+}
+
+static const struct amba_id tmc_ids[] = {
+	CS_AMBA_ID(0x000bb961),
+	/* Coresight SoC 600 TMC-ETR/ETS */
+	CS_AMBA_ID_DATA(0x000bb9e8, (unsigned long)CORESIGHT_SOC_600_ETR_CAPS),
+	/* Coresight SoC 600 TMC-ETB */
+	CS_AMBA_ID(0x000bb9e9),
+	/* Coresight SoC 600 TMC-ETF */
+	CS_AMBA_ID(0x000bb9ea),
+	{ 0, 0, NULL },
+};
+
+MODULE_DEVICE_TABLE(amba, tmc_ids);
+
+static struct amba_driver tmc_driver = {
+	.drv = {
+		.name   = "coresight-tmc",
+		.suppress_bind_attrs = true,
+	},
+	.probe		= tmc_probe,
+	.shutdown	= tmc_shutdown,
+	.remove		= tmc_remove,
+	.id_table	= tmc_ids,
+};
+
+static int tmc_platform_probe(struct platform_device *pdev)
+{
+	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	int ret = 0;
+
+	pm_runtime_get_noresume(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+
+	ret = __tmc_probe(&pdev->dev, res);
+	pm_runtime_put(&pdev->dev);
+	if (ret)
+		pm_runtime_disable(&pdev->dev);
+
+	return ret;
+}
+
+static void tmc_platform_remove(struct platform_device *pdev)
+{
+	struct tmc_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
+
+	if (WARN_ON(!drvdata))
+		return;
+
+	__tmc_remove(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+}
+
+#ifdef CONFIG_PM
+static int tmc_runtime_suspend(struct device *dev)
+{
+	struct tmc_drvdata *drvdata = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(drvdata->atclk);
+	clk_disable_unprepare(drvdata->pclk);
+
+	return 0;
+}
+
+static int tmc_runtime_resume(struct device *dev)
+{
+	struct tmc_drvdata *drvdata = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(drvdata->pclk);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(drvdata->atclk);
+	if (ret)
+		clk_disable_unprepare(drvdata->pclk);
+
+	return ret;
+}
+#endif
+
+static const struct dev_pm_ops tmc_dev_pm_ops = {
+	SET_RUNTIME_PM_OPS(tmc_runtime_suspend, tmc_runtime_resume, NULL)
+};
+
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id tmc_acpi_ids[] = {
+	{"ARMHC501", 0, 0, 0}, /* ARM CoreSight ETR */
+	{"ARMHC97C", 0, 0, 0}, /* ARM CoreSight SoC-400 TMC, SoC-600 ETF/ETB */
+	{},
+};
+MODULE_DEVICE_TABLE(acpi, tmc_acpi_ids);
+#endif
+
+static struct platform_driver tmc_platform_driver = {
+	.probe	= tmc_platform_probe,
+	.remove = tmc_platform_remove,
+	.driver	= {
+		.name			= "coresight-tmc-platform",
+		.acpi_match_table	= ACPI_PTR(tmc_acpi_ids),
+		.suppress_bind_attrs	= true,
+		.pm			= &tmc_dev_pm_ops,
+	},
+};
+
+static const struct gtrace_component_id tmc_etr_ids[] = {
+	{ .type = GTRACE_CORESIGHT_TMC_ETR,
+	  .version = CORESIGHT_COMPONENT_ID_VERSION, },
+	{},
+};
+
+static struct gtrace_driver tmc_etr_driver = {
+	.id_table = tmc_etr_ids,
+	.setup_sysfs_buf = tmc_etr_setup_sysfs_buf,
+	.alloc_buf = tmc_alloc_etr_buffer,
+	.free_buf = tmc_free_etr_buffer,
+	.copyto_auxbuf = tmc_update_etr_buffer,
+	.start = tmc_enable_etr_sink,
+	.stop = tmc_disable_etr_sink,
+	.driver = {
+		.name = "coresight-tmc-etr"
+	},
+};
+
+static const struct gtrace_component_id tmc_etf_ids[] = {
+	{ .type = GTRACE_CORESIGHT_TMC_ETB,
+	  .version = CORESIGHT_COMPONENT_ID_VERSION, },
+	{ .type = GTRACE_CORESIGHT_TMC_ETF,
+	  .version = CORESIGHT_COMPONENT_ID_VERSION, },
+	{},
+};
+
+static struct gtrace_driver tmc_etf_driver = {
+	.id_table = tmc_etf_ids,
+	.setup_sysfs_buf = tmc_etf_setup_sysfs_buf,
+	.copyto_auxbuf = tmc_update_etf_buffer,
+	.start = tmc_enable_etf,
+	.stop = tmc_disable_etf,
+	.driver = {
+		.name = "coresight-tmc-etf"
+	},
+};
+
+static int __init tmc_init(void)
+{
+	int ret;
+
+	ret = gtrace_register_driver(&tmc_etr_driver);
+	if (ret)
+		return ret;
+
+	ret = gtrace_register_driver(&tmc_etf_driver);
+	if (ret)
+		goto err_etr;
+
+	ret = coresight_init_driver("tmc", &tmc_driver, &tmc_platform_driver);
+	if (ret)
+		goto err_etf;
+
+	return 0;
+
+err_etf:
+	gtrace_unregister_driver(&tmc_etf_driver);
+err_etr:
+	gtrace_unregister_driver(&tmc_etr_driver);
+	return ret;
+}
+
+static void __exit tmc_exit(void)
+{
+	coresight_remove_driver(&tmc_driver, &tmc_platform_driver);
+	gtrace_unregister_driver(&tmc_etf_driver);
+	gtrace_unregister_driver(&tmc_etr_driver);
+}
+module_init(tmc_init);
+module_exit(tmc_exit);
+
+MODULE_AUTHOR("Pratik Patel <pratikp@codeaurora.org>");
+MODULE_AUTHOR("Zane Leung <liangzhen@linux.spacemit.com>");
+MODULE_DESCRIPTION("Arm CoreSight Trace Memory Controller driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/hwtracing/gtrace/coresight-tmc-etf.c b/drivers/hwtracing/gtrace/coresight-tmc-etf.c
new file mode 100644
index 000000000000..cb35a398bf28
--- /dev/null
+++ b/drivers/hwtracing/gtrace/coresight-tmc-etf.c
@@ -0,0 +1,573 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright(C) 2016 Linaro Limited. All rights reserved.
+ * Author: Mathieu Poirier <mathieu.poirier@linaro.org>
+ * Derived from drivers/hwtracing/coresight/coresight-tmc-etf.c
+ */
+
+#include <linux/atomic.h>
+#include <linux/circ_buf.h>
+#include <linux/gtrace.h>
+#include <linux/perf_event.h>
+#include <linux/slab.h>
+#include "coresight.h"
+#include "coresight-tmc.h"
+
+static int __tmc_etb_enable_hw(struct tmc_drvdata *drvdata)
+{
+	int rc = 0;
+	u32 ffcr;
+
+	CS_UNLOCK(drvdata->base);
+
+	/* Wait for TMCSReady bit to be set */
+	rc = tmc_wait_for_tmcready(drvdata);
+	if (rc) {
+		dev_err(&drvdata->comp->dev,
+			"Failed to enable: TMC not ready\n");
+		CS_LOCK(drvdata->base);
+		return rc;
+	}
+
+	writel_relaxed(TMC_MODE_CIRCULAR_BUFFER, drvdata->base + TMC_MODE);
+
+	ffcr = TMC_FFCR_EN_FMT | TMC_FFCR_EN_TI | TMC_FFCR_FON_FLIN |
+		TMC_FFCR_FON_TRIG_EVT | TMC_FFCR_TRIGON_TRIGIN;
+	if (drvdata->stop_on_flush)
+		ffcr |= TMC_FFCR_STOP_ON_FLUSH;
+	writel_relaxed(ffcr, drvdata->base + TMC_FFCR);
+
+	writel_relaxed(drvdata->trigger_cntr, drvdata->base + TMC_TRG);
+	tmc_enable_hw(drvdata);
+
+	CS_LOCK(drvdata->base);
+	return rc;
+}
+
+static int tmc_etb_enable_hw(struct tmc_drvdata *drvdata)
+{
+	int rc = coresight_claim_device(drvdata->comp);
+
+	if (rc)
+		return rc;
+
+	rc = __tmc_etb_enable_hw(drvdata);
+	if (rc)
+		coresight_disclaim_device(drvdata->comp);
+	return rc;
+}
+
+static void tmc_etb_dump_hw(struct tmc_drvdata *drvdata)
+{
+	char *bufp;
+	u32 read_data, lost;
+
+	/* Check if the buffer wrapped around. */
+	lost = readl_relaxed(drvdata->base + TMC_STS) & TMC_STS_FULL;
+	bufp = drvdata->buf;
+	drvdata->len = 0;
+	while (1) {
+		read_data = readl_relaxed(drvdata->base + TMC_RRD);
+		if (read_data == 0xFFFFFFFF)
+			break;
+		memcpy(bufp, &read_data, 4);
+		bufp += 4;
+		drvdata->len += 4;
+	}
+
+	if (lost)
+		coresight_insert_barrier_packet(drvdata->buf);
+	return;
+}
+
+static void __tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
+{
+	CS_UNLOCK(drvdata->base);
+
+	tmc_flush_and_stop(drvdata);
+	/*
+	 * When operating in sysFS mode the content of the buffer needs to be
+	 * read before the TMC is disabled.
+	 */
+	if (gtrace_get_mode(drvdata->comp) == GTRACE_COMPONENT_MODE_SYSFS)
+		tmc_etb_dump_hw(drvdata);
+	tmc_disable_hw(drvdata);
+
+	CS_LOCK(drvdata->base);
+}
+
+static void tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
+{
+	__tmc_etb_disable_hw(drvdata);
+	coresight_disclaim_device(drvdata->comp);
+}
+
+static int __tmc_etf_enable_hw(struct tmc_drvdata *drvdata)
+{
+	int rc = 0;
+
+	CS_UNLOCK(drvdata->base);
+
+	/* Wait for TMCSReady bit to be set */
+	rc = tmc_wait_for_tmcready(drvdata);
+	if (rc) {
+		dev_err(&drvdata->comp->dev,
+			"Failed to enable : TMC is not ready\n");
+		CS_LOCK(drvdata->base);
+		return rc;
+	}
+
+	writel_relaxed(TMC_MODE_HARDWARE_FIFO, drvdata->base + TMC_MODE);
+	writel_relaxed(TMC_FFCR_EN_FMT | TMC_FFCR_EN_TI,
+		       drvdata->base + TMC_FFCR);
+	writel_relaxed(0x0, drvdata->base + TMC_BUFWM);
+	tmc_enable_hw(drvdata);
+
+	CS_LOCK(drvdata->base);
+	return rc;
+}
+
+static int tmc_etf_enable_hw(struct tmc_drvdata *drvdata)
+{
+	int rc = coresight_claim_device(drvdata->comp);
+
+	if (rc)
+		return rc;
+
+	rc = __tmc_etf_enable_hw(drvdata);
+	if (rc)
+		coresight_disclaim_device(drvdata->comp);
+	return rc;
+}
+
+static void tmc_etf_disable_hw(struct tmc_drvdata *drvdata)
+{
+	struct gtrace_component *comp = drvdata->comp;
+
+	CS_UNLOCK(drvdata->base);
+
+	tmc_flush_and_stop(drvdata);
+	tmc_disable_hw(drvdata);
+	coresight_disclaim_device_unlocked(comp);
+	CS_LOCK(drvdata->base);
+}
+
+/*
+ * Return the available trace data in the buffer from @pos, with
+ * a maximum limit of @len, updating the @bufpp on where to
+ * find it.
+ */
+ssize_t tmc_etb_get_sysfs_trace(struct tmc_drvdata *drvdata,
+				loff_t pos, size_t len, char **bufpp)
+{
+	ssize_t actual = len;
+
+	/* Adjust the len to available size @pos */
+	if (pos + actual > drvdata->len)
+		actual = drvdata->len - pos;
+	if (actual > 0)
+		*bufpp = drvdata->buf + pos;
+	return actual;
+}
+
+int tmc_etf_setup_sysfs_buf(struct gtrace_component *comp)
+{
+	int ret = 0;
+	bool used = false;
+	char *buf = NULL;
+	unsigned long flags;
+	struct tmc_drvdata *drvdata = dev_get_drvdata(comp->dev.parent);
+
+	/*
+	 * If we don't have a buffer release the lock and allocate memory.
+	 * Otherwise keep the lock and move along.
+	 */
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	if (!drvdata->buf) {
+		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
+		/* Allocating the memory here while outside of the spinlock */
+		buf = kzalloc(drvdata->size, GFP_KERNEL);
+		if (!buf)
+			return -ENOMEM;
+
+		/* Let's try again */
+		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	}
+
+	if (drvdata->reading) {
+		ret = -EBUSY;
+		goto out;
+	}
+
+	/*
+	 * If drvdata::buf isn't NULL, memory was allocated for a previous
+	 * trace run but wasn't read.  If so simply zero-out the memory.
+	 * Otherwise use the memory allocated above.
+	 *
+	 * The memory is freed when users read the buffer using the
+	 * /dev/xyz.{etf|etb} interface.  See tmc_read_unprepare_etf() for
+	 * details.
+	 */
+	if (drvdata->buf) {
+		memset(drvdata->buf, 0, drvdata->size);
+	} else {
+		used = true;
+		drvdata->buf = buf;
+	}
+out:
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
+	/* Free memory outside the spinlock if need be */
+	if (!used)
+		kfree(buf);
+
+	return ret;
+}
+
+int tmc_enable_etf(struct gtrace_component *comp)
+{
+	int ret = 0;
+	struct gtrace_path *path = comp->path;
+	struct tmc_drvdata *drvdata = dev_get_drvdata(comp->dev.parent);
+
+	if (WARN_ON(!path))
+		return -EINVAL;
+
+	if (drvdata->reading)
+		return -EBUSY;
+
+	drvdata->is_sink = gtrace_path_sink(path);
+	if (drvdata->is_sink)
+		ret = tmc_etb_enable_hw(drvdata);
+	else
+		ret = tmc_etf_enable_hw(drvdata);
+
+	if (!ret)
+		dev_dbg(&comp->dev, "TMC-ETB/ETF enabled\n");
+
+	return ret;
+}
+
+int tmc_disable_etf(struct gtrace_component *comp)
+{
+	struct gtrace_path *path = comp->path;
+	struct tmc_drvdata *drvdata = dev_get_drvdata(comp->dev.parent);
+
+	if (WARN_ON(!path))
+		return -EINVAL;
+
+	if (drvdata->reading)
+		return -EBUSY;
+
+	if (drvdata->is_sink)
+		tmc_etb_disable_hw(drvdata);
+	else
+		tmc_etf_disable_hw(drvdata);
+
+	dev_dbg(&comp->dev, "TMC-ETB/ETF disabled\n");
+	return 0;
+}
+
+unsigned long tmc_update_etf_buffer(struct gtrace_component *comp,
+				    struct perf_output_handle *handle,
+				    struct gtrace_perf_auxbuf *buf)
+{
+	bool lost = false;
+	int i, cur;
+	const u32 *barrier;
+	u32 *buf_ptr;
+	u64 read_ptr, write_ptr;
+	u32 status;
+	unsigned long offset, to_read = 0, flags;
+	struct tmc_drvdata *drvdata = dev_get_drvdata(comp->dev.parent);
+	struct perf_event *event = handle->event;
+
+	/* This shouldn't happen */
+	if (WARN_ON_ONCE(gtrace_get_mode(comp) != GTRACE_COMPONENT_MODE_PERF))
+		return 0;
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+
+	CS_UNLOCK(drvdata->base);
+
+	tmc_flush_and_stop(drvdata);
+
+	read_ptr = tmc_read_rrp(drvdata);
+	write_ptr = tmc_read_rwp(drvdata);
+
+	/*
+	 * Get a hold of the status register and see if a wrap around
+	 * has occurred.  If so adjust things accordingly.
+	 */
+	status = readl_relaxed(drvdata->base + TMC_STS);
+	if (status & TMC_STS_FULL) {
+		lost = true;
+		to_read = drvdata->size;
+	} else {
+		to_read = CIRC_CNT(write_ptr, read_ptr, drvdata->size);
+	}
+
+	/*
+	 * The TMC RAM buffer may be bigger than the space available in the
+	 * perf ring buffer (handle->size).  If so advance the RRP so that we
+	 * get the latest trace data.  In snapshot mode none of that matters
+	 * since we are expected to clobber stale data in favour of the latest
+	 * traces.
+	 */
+	if (!buf->snapshot && to_read > handle->size) {
+		u32 mask = tmc_get_memwidth_mask(drvdata);
+
+		/*
+		 * Make sure the new size is aligned in accordance with the
+		 * requirement explained in function tmc_get_memwidth_mask().
+		 */
+		to_read = handle->size & mask;
+		/* Move the RAM read pointer up */
+		read_ptr = (write_ptr + drvdata->size) - to_read;
+		/* Make sure we are still within our limits */
+		if (read_ptr > (drvdata->size - 1))
+			read_ptr -= drvdata->size;
+		/* Tell the HW */
+		tmc_write_rrp(drvdata, read_ptr);
+		lost = true;
+	}
+
+	/*
+	 * Don't set the TRUNCATED flag in snapshot mode because 1) the
+	 * captured buffer is expected to be truncated and 2) a full buffer
+	 * prevents the event from being re-enabled by the perf core,
+	 * resulting in stale data being send to user space.
+	 */
+	if (!buf->snapshot && lost)
+		perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
+
+	cur = buf->pos / PAGE_SIZE;
+	offset = buf->pos % PAGE_SIZE;
+	barrier = coresight_barrier_pkt;
+
+	/* for every byte to read */
+	for (i = 0; i < to_read; i += 4) {
+		buf_ptr = buf->pages[cur] + offset;
+		*buf_ptr = readl_relaxed(drvdata->base + TMC_RRD);
+
+		if (lost && i < CORESIGHT_BARRIER_PKT_SIZE) {
+			*buf_ptr = *barrier;
+			barrier++;
+		}
+
+		offset += 4;
+		if (offset >= PAGE_SIZE) {
+			offset = 0;
+			cur++;
+			/* wrap around at the end of the buffer */
+			cur &= buf->nr_pages - 1;
+		}
+	}
+
+	/*
+	 * In snapshot mode we simply increment the head by the number of byte
+	 * that were written.  User space will figure out how many bytes to get
+	 * from the AUX buffer based on the position of the head.
+	 */
+	if (buf->snapshot)
+		handle->head += to_read;
+
+	/*
+	 * CS_LOCK() contains mb() so it can ensure visibility of the AUX trace
+	 * data before the aux_head is updated via perf_aux_output_end(), which
+	 * is expected by the perf ring buffer.
+	 */
+	CS_LOCK(drvdata->base);
+
+	/*
+	 * If the event is active, it is triggered during an AUX pause.
+	 * Re-enable the sink so that it is ready when AUX resume is invoked.
+	 */
+	if (!event->hw.state)
+		__tmc_etb_enable_hw(drvdata);
+
+	/* set the GTRACE_FORMAT_CORESIGHT flag */
+	perf_aux_output_flag(handle, PERF_AUX_FLAG_GTRACE_FORMAT_CORESIGHT);
+
+	return to_read;
+}
+
+int tmc_panic_sync_etf(struct gtrace_component *comp)
+{
+	u32 val;
+	struct tmc_crash_metadata *mdata;
+	struct tmc_drvdata *drvdata = dev_get_drvdata(comp->dev.parent);
+
+	mdata = (struct tmc_crash_metadata *)drvdata->crash_mdata.vaddr;
+
+	/* Make sure we have valid reserved memory */
+	if (!tmc_has_reserved_buffer(drvdata) ||
+	    !tmc_has_crash_mdata_buffer(drvdata))
+		return 0;
+
+	tmc_crashdata_set_invalid(drvdata);
+
+	CS_UNLOCK(drvdata->base);
+
+	/* Proceed only if ETF is enabled or configured as sink */
+	val = readl(drvdata->base + TMC_CTL);
+	if (!(val & TMC_CTL_CAPT_EN))
+		goto out;
+	val = readl(drvdata->base + TMC_MODE);
+	if (val != TMC_MODE_CIRCULAR_BUFFER)
+		goto out;
+
+	val = readl(drvdata->base + TMC_FFSR);
+	/* Do manual flush and stop only if its not auto-stopped */
+	if (!(val & TMC_FFSR_FT_STOPPED)) {
+		dev_dbg(&comp->dev,
+			 "%s: Triggering manual flush\n", __func__);
+		tmc_flush_and_stop(drvdata);
+	} else
+		tmc_wait_for_tmcready(drvdata);
+
+	/* Sync registers from hardware to metadata region */
+	mdata->tmc_sts = readl(drvdata->base + TMC_STS);
+	mdata->tmc_mode = readl(drvdata->base + TMC_MODE);
+	mdata->tmc_ffcr = readl(drvdata->base + TMC_FFCR);
+	mdata->tmc_ffsr = readl(drvdata->base + TMC_FFSR);
+
+	/* Sync Internal SRAM to reserved trace buffer region */
+	drvdata->buf = drvdata->resrv_buf.vaddr;
+	tmc_etb_dump_hw(drvdata);
+	/* Store as per RSZ register convention */
+	mdata->tmc_ram_size = drvdata->len >> 2;
+
+	/* Other fields for processing trace buffer reads */
+	mdata->tmc_rrp = 0;
+	mdata->tmc_dba = 0;
+	mdata->tmc_rwp = drvdata->len;
+	mdata->trace_paddr = drvdata->resrv_buf.paddr;
+
+	mdata->version = CS_CRASHDATA_VERSION;
+
+	/*
+	 * Make sure all previous writes are ordered,
+	 * before we mark valid
+	 */
+	smp_wmb();
+	mdata->valid = true;
+	/*
+	 * Below order need to maintained, since crc of metadata
+	 * is dependent on first
+	 */
+	mdata->crc32_tdata = find_crash_tracedata_crc(drvdata, mdata);
+	mdata->crc32_mdata = find_crash_metadata_crc(mdata);
+
+	tmc_disable_hw(drvdata);
+
+	dev_dbg(&comp->dev, "%s: success\n", __func__);
+out:
+	CS_UNLOCK(drvdata->base);
+	return 0;
+}
+
+int tmc_read_prepare_etb(struct tmc_drvdata *drvdata)
+{
+	enum tmc_mode mode;
+	int ret = 0;
+	unsigned long flags;
+
+	/* config types are set a boot time and never change */
+	if (WARN_ON_ONCE(drvdata->config_type != TMC_CONFIG_TYPE_ETB &&
+			 drvdata->config_type != TMC_CONFIG_TYPE_ETF))
+		return -EINVAL;
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+
+	if (drvdata->reading) {
+		ret = -EBUSY;
+		goto out;
+	}
+
+	/* Don't interfere if operated from Perf */
+	if (gtrace_get_mode(drvdata->comp) == GTRACE_COMPONENT_MODE_PERF) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	/* If drvdata::buf is NULL the trace data has been read already */
+	if (drvdata->buf == NULL) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	/* Disable the TMC if need be */
+	if (gtrace_get_mode(drvdata->comp) == GTRACE_COMPONENT_MODE_SYSFS) {
+		/* There is no point in reading a TMC in HW FIFO mode */
+		mode = readl_relaxed(drvdata->base + TMC_MODE);
+		if (mode != TMC_MODE_CIRCULAR_BUFFER) {
+			ret = -EINVAL;
+			goto out;
+		}
+		__tmc_etb_disable_hw(drvdata);
+	}
+
+	drvdata->reading = true;
+out:
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
+	return ret;
+}
+
+int tmc_read_unprepare_etb(struct tmc_drvdata *drvdata)
+{
+	char *buf = NULL;
+	enum tmc_mode mode;
+	unsigned long flags;
+
+	/* config types are set a boot time and never change */
+	if (WARN_ON_ONCE(drvdata->config_type != TMC_CONFIG_TYPE_ETB &&
+			 drvdata->config_type != TMC_CONFIG_TYPE_ETF))
+		return -EINVAL;
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+
+	/* Re-enable the TMC if need be */
+	if (gtrace_get_mode(drvdata->comp) == GTRACE_COMPONENT_MODE_SYSFS) {
+		/* There is no point in reading a TMC in HW FIFO mode */
+		mode = readl_relaxed(drvdata->base + TMC_MODE);
+		if (mode != TMC_MODE_CIRCULAR_BUFFER) {
+			raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+			return -EINVAL;
+		}
+		/*
+		 * The trace run will continue with the same allocated trace
+		 * buffer. As such zero-out the buffer so that we don't end
+		 * up with stale data.
+		 *
+		 * Since the tracer is still enabled drvdata::buf
+		 * can't be NULL.
+		 */
+		memset(drvdata->buf, 0, drvdata->size);
+		/*
+		 * Ignore failures to enable the TMC to make sure, we don't
+		 * leave the TMC in a "reading" state.
+		 */
+		__tmc_etb_enable_hw(drvdata);
+	} else {
+		/*
+		 * The ETB/ETF is not tracing and the buffer was just read.
+		 * As such prepare to free the trace buffer.
+		 */
+		buf = drvdata->buf;
+		drvdata->buf = NULL;
+	}
+
+	drvdata->reading = false;
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
+	/*
+	 * Free allocated memory outside of the spinlock.  There is no need
+	 * to assert the validity of 'buf' since calling kfree(NULL) is safe.
+	 */
+	kfree(buf);
+
+	return 0;
+}
diff --git a/drivers/hwtracing/gtrace/coresight-tmc-etr.c b/drivers/hwtracing/gtrace/coresight-tmc-etr.c
new file mode 100644
index 000000000000..11b7df8ae1b2
--- /dev/null
+++ b/drivers/hwtracing/gtrace/coresight-tmc-etr.c
@@ -0,0 +1,1888 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright(C) 2016 Linaro Limited. All rights reserved.
+ * Author: Mathieu Poirier <mathieu.poirier@linaro.org>
+ * Derived from drivers/hwtracing/coresight/coresight-tmc-etr.c
+ */
+
+#include <linux/atomic.h>
+#include <linux/gtrace.h>
+#include <linux/dma-mapping.h>
+#include <linux/iommu.h>
+#include <linux/idr.h>
+#include <linux/mutex.h>
+#include <linux/refcount.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/vmalloc.h>
+#include "coresight.h"
+#include "coresight-tmc.h"
+
+struct etr_flat_buf {
+	struct device	*dev;
+	dma_addr_t	daddr;
+	void		*vaddr;
+	size_t		size;
+};
+
+struct etr_buf_hw {
+	bool	has_iommu;
+	bool	has_etr_sg;
+	bool	has_catu;
+	bool	has_resrv;
+};
+
+/* Convert the perf index to an offset within the ETR buffer */
+#define PERF_IDX2OFF(idx, buf)		\
+		((idx) % ((unsigned long)(buf)->nr_pages << PAGE_SHIFT))
+
+/* Lower limit for ETR hardware buffer */
+#define TMC_ETR_PERF_MIN_BUF_SIZE	SZ_1M
+
+/*
+ * The TMC ETR SG has a page size of 4K. The SG table contains pointers
+ * to 4KB buffers. However, the OS may use a PAGE_SIZE different from
+ * 4K (i.e, 16KB or 64KB). This implies that a single OS page could
+ * contain more than one SG buffer and tables.
+ *
+ * A table entry has the following format:
+ *
+ * ---Bit31------------Bit4-------Bit1-----Bit0--
+ * |     Address[39:12]    | SBZ |  Entry Type  |
+ * ----------------------------------------------
+ *
+ * Address: Bits [39:12] of a physical page address. Bits [11:0] are
+ *	    always zero.
+ *
+ * Entry type:
+ *	b00 - Reserved.
+ *	b01 - Last entry in the tables, points to 4K page buffer.
+ *	b10 - Normal entry, points to 4K page buffer.
+ *	b11 - Link. The address points to the base of next table.
+ */
+
+typedef u32 sgte_t;
+
+#define ETR_SG_PAGE_SHIFT		12
+#define ETR_SG_PAGE_SIZE		(1UL << ETR_SG_PAGE_SHIFT)
+#define ETR_SG_PAGES_PER_SYSPAGE	(PAGE_SIZE / ETR_SG_PAGE_SIZE)
+#define ETR_SG_PTRS_PER_PAGE		(ETR_SG_PAGE_SIZE / sizeof(sgte_t))
+#define ETR_SG_PTRS_PER_SYSPAGE		(PAGE_SIZE / sizeof(sgte_t))
+
+#define ETR_SG_ET_MASK			0x3
+#define ETR_SG_ET_LAST			0x1
+#define ETR_SG_ET_NORMAL		0x2
+#define ETR_SG_ET_LINK			0x3
+
+#define ETR_SG_ADDR_SHIFT		4
+
+#define ETR_SG_ENTRY(addr, type) \
+	((sgte_t)((((addr) >> ETR_SG_PAGE_SHIFT) << ETR_SG_ADDR_SHIFT) | \
+		((type) & ETR_SG_ET_MASK)))
+
+#define ETR_SG_ADDR(entry) \
+	(((dma_addr_t)(entry) >> ETR_SG_ADDR_SHIFT) << ETR_SG_PAGE_SHIFT)
+#define ETR_SG_ET(entry)		((entry) & ETR_SG_ET_MASK)
+
+/*
+ * struct etr_sg_table : ETR SG Table
+ * @sg_table:		Generic SG Table holding the data/table pages.
+ * @hwaddr:		hwaddress used by the TMC, which is the base
+ *			address of the table.
+ */
+struct etr_sg_table {
+	struct tmc_sg_table	*sg_table;
+	dma_addr_t		hwaddr;
+};
+
+/*
+ * tmc_etr_sg_table_entries: Total number of table entries required to map
+ * @nr_pages system pages.
+ *
+ * We need to map @nr_pages * ETR_SG_PAGES_PER_SYSPAGE data pages.
+ * Each TMC page can map (ETR_SG_PTRS_PER_PAGE - 1) buffer pointers,
+ * with the last entry pointing to another page of table entries.
+ * If we spill over to a new page for mapping 1 entry, we could as
+ * well replace the link entry of the previous page with the last entry.
+ */
+static unsigned long __attribute_const__
+tmc_etr_sg_table_entries(int nr_pages)
+{
+	unsigned long nr_sgpages = nr_pages * ETR_SG_PAGES_PER_SYSPAGE;
+	unsigned long nr_sglinks = nr_sgpages / (ETR_SG_PTRS_PER_PAGE - 1);
+	/*
+	 * If we spill over to a new page for 1 entry, we could as well
+	 * make it the LAST entry in the previous page, skipping the Link
+	 * address.
+	 */
+	if (nr_sglinks && (nr_sgpages % (ETR_SG_PTRS_PER_PAGE - 1) < 2))
+		nr_sglinks--;
+	return nr_sgpages + nr_sglinks;
+}
+
+/*
+ * tmc_pages_get_offset:  Go through all the pages in the tmc_pages
+ * and map the device address @addr to an offset within the virtual
+ * contiguous buffer.
+ */
+static long
+tmc_pages_get_offset(struct tmc_pages *tmc_pages, dma_addr_t addr)
+{
+	int i;
+	dma_addr_t page_start;
+
+	for (i = 0; i < tmc_pages->nr_pages; i++) {
+		page_start = tmc_pages->daddrs[i];
+		if (addr >= page_start && addr < (page_start + PAGE_SIZE))
+			return (long)i * PAGE_SIZE + (addr - page_start);
+	}
+
+	return -EINVAL;
+}
+
+/*
+ * tmc_pages_free : Unmap and free the pages used by tmc_pages.
+ * If the pages were not allocated in tmc_pages_alloc(), we would
+ * simply drop the refcount.
+ */
+static void tmc_pages_free(struct tmc_pages *tmc_pages,
+			   struct device *dev, enum dma_data_direction dir)
+{
+	int i;
+	struct device *real_dev = dev->parent;
+
+	for (i = 0; i < tmc_pages->nr_pages; i++) {
+		if (tmc_pages->daddrs && tmc_pages->daddrs[i])
+			dma_unmap_page(real_dev, tmc_pages->daddrs[i],
+					 PAGE_SIZE, dir);
+		if (tmc_pages->pages && tmc_pages->pages[i])
+			__free_page(tmc_pages->pages[i]);
+	}
+
+	kfree(tmc_pages->pages);
+	kfree(tmc_pages->daddrs);
+	tmc_pages->pages = NULL;
+	tmc_pages->daddrs = NULL;
+	tmc_pages->nr_pages = 0;
+}
+
+/*
+ * tmc_pages_alloc : Allocate and map pages for a given @tmc_pages.
+ * If @pages is not NULL, the list of page virtual addresses are
+ * used as the data pages. The pages are then dma_map'ed for @dev
+ * with dma_direction @dir.
+ *
+ * Returns 0 upon success, else the error number.
+ */
+static int tmc_pages_alloc(struct tmc_pages *tmc_pages,
+			   struct device *dev, int node,
+			   enum dma_data_direction dir, void **pages)
+{
+	int i, nr_pages;
+	dma_addr_t paddr;
+	struct page *page;
+	struct device *real_dev = dev->parent;
+
+	nr_pages = tmc_pages->nr_pages;
+	tmc_pages->daddrs = kzalloc_objs(*tmc_pages->daddrs, nr_pages);
+	if (!tmc_pages->daddrs)
+		return -ENOMEM;
+	tmc_pages->pages = kzalloc_objs(*tmc_pages->pages, nr_pages);
+	if (!tmc_pages->pages) {
+		kfree(tmc_pages->daddrs);
+		tmc_pages->daddrs = NULL;
+		return -ENOMEM;
+	}
+
+	for (i = 0; i < nr_pages; i++) {
+		if (pages && pages[i]) {
+			page = virt_to_page(pages[i]);
+			/* Hold a refcount on the page */
+			get_page(page);
+		} else {
+			page = alloc_pages_node(node,
+						GFP_KERNEL | __GFP_ZERO, 0);
+			if (!page)
+				goto err;
+		}
+		paddr = dma_map_page(real_dev, page, 0, PAGE_SIZE, dir);
+		if (dma_mapping_error(real_dev, paddr))
+			goto err;
+		tmc_pages->daddrs[i] = paddr;
+		tmc_pages->pages[i] = page;
+	}
+	return 0;
+err:
+	tmc_pages_free(tmc_pages, dev, dir);
+	return -ENOMEM;
+}
+
+static long
+tmc_sg_get_data_page_offset(struct tmc_sg_table *sg_table, dma_addr_t addr)
+{
+	return tmc_pages_get_offset(&sg_table->data_pages, addr);
+}
+
+static void tmc_free_table_pages(struct tmc_sg_table *sg_table)
+{
+	if (sg_table->table_vaddr)
+		vunmap(sg_table->table_vaddr);
+	tmc_pages_free(&sg_table->table_pages, sg_table->dev, DMA_TO_DEVICE);
+}
+
+static void tmc_free_data_pages(struct tmc_sg_table *sg_table)
+{
+	if (sg_table->data_vaddr)
+		vunmap(sg_table->data_vaddr);
+	tmc_pages_free(&sg_table->data_pages, sg_table->dev, DMA_FROM_DEVICE);
+}
+
+void tmc_free_sg_table(struct tmc_sg_table *sg_table)
+{
+	tmc_free_table_pages(sg_table);
+	tmc_free_data_pages(sg_table);
+	kfree(sg_table);
+}
+EXPORT_SYMBOL_GPL(tmc_free_sg_table);
+
+/*
+ * Alloc pages for the table. Since this will be used by the device,
+ * allocate the pages closer to the device (i.e, dev_to_node(dev)
+ * rather than the CPU node).
+ */
+static int tmc_alloc_table_pages(struct tmc_sg_table *sg_table)
+{
+	int rc;
+	struct tmc_pages *table_pages = &sg_table->table_pages;
+
+	rc = tmc_pages_alloc(table_pages, sg_table->dev,
+			     dev_to_node(sg_table->dev),
+			     DMA_TO_DEVICE, NULL);
+	if (rc)
+		return rc;
+	sg_table->table_vaddr = vmap(table_pages->pages,
+				     table_pages->nr_pages,
+				     VM_MAP,
+				     PAGE_KERNEL);
+	if (!sg_table->table_vaddr)
+		rc = -ENOMEM;
+	else
+		sg_table->table_daddr = table_pages->daddrs[0];
+	return rc;
+}
+
+static int tmc_alloc_data_pages(struct tmc_sg_table *sg_table, void **pages)
+{
+	int rc;
+
+	/* Allocate data pages on the node requested by the caller */
+	rc = tmc_pages_alloc(&sg_table->data_pages,
+			     sg_table->dev, sg_table->node,
+			     DMA_FROM_DEVICE, pages);
+	if (!rc) {
+		sg_table->data_vaddr = vmap(sg_table->data_pages.pages,
+					    sg_table->data_pages.nr_pages,
+					    VM_MAP,
+					    PAGE_KERNEL);
+		if (!sg_table->data_vaddr)
+			rc = -ENOMEM;
+	}
+	return rc;
+}
+
+/*
+ * tmc_alloc_sg_table: Allocate and setup dma pages for the TMC SG table
+ * and data buffers. TMC writes to the data buffers and reads from the SG
+ * Table pages.
+ *
+ * @dev		- Coresight device to which page should be DMA mapped.
+ * @node	- Numa node for mem allocations
+ * @nr_tpages	- Number of pages for the table entries.
+ * @nr_dpages	- Number of pages for Data buffer.
+ * @pages	- Optional list of virtual address of pages.
+ */
+struct tmc_sg_table *tmc_alloc_sg_table(struct device *dev,
+					int node,
+					int nr_tpages,
+					int nr_dpages,
+					void **pages)
+{
+	long rc;
+	struct tmc_sg_table *sg_table;
+
+	sg_table = kzalloc_obj(*sg_table);
+	if (!sg_table)
+		return ERR_PTR(-ENOMEM);
+	sg_table->data_pages.nr_pages = nr_dpages;
+	sg_table->table_pages.nr_pages = nr_tpages;
+	sg_table->node = node;
+	sg_table->dev = dev;
+
+	rc  = tmc_alloc_data_pages(sg_table, pages);
+	if (!rc)
+		rc = tmc_alloc_table_pages(sg_table);
+	if (rc) {
+		tmc_free_sg_table(sg_table);
+		return ERR_PTR(rc);
+	}
+
+	return sg_table;
+}
+EXPORT_SYMBOL_GPL(tmc_alloc_sg_table);
+
+/*
+ * tmc_sg_table_sync_data_range: Sync the data buffer written
+ * by the device from @offset up to a @size bytes.
+ */
+void tmc_sg_table_sync_data_range(struct tmc_sg_table *table,
+				  u64 offset, u64 size)
+{
+	int i, index, start;
+	int npages = DIV_ROUND_UP(size, PAGE_SIZE);
+	struct device *real_dev = table->dev->parent;
+	struct tmc_pages *data = &table->data_pages;
+
+	start = offset >> PAGE_SHIFT;
+	for (i = start; i < (start + npages); i++) {
+		index = i % data->nr_pages;
+		dma_sync_single_for_cpu(real_dev, data->daddrs[index],
+					PAGE_SIZE, DMA_FROM_DEVICE);
+	}
+}
+EXPORT_SYMBOL_GPL(tmc_sg_table_sync_data_range);
+
+/* tmc_sg_sync_table: Sync the page table */
+void tmc_sg_table_sync_table(struct tmc_sg_table *sg_table)
+{
+	int i;
+	struct device *real_dev = sg_table->dev->parent;
+	struct tmc_pages *table_pages = &sg_table->table_pages;
+
+	for (i = 0; i < table_pages->nr_pages; i++)
+		dma_sync_single_for_device(real_dev, table_pages->daddrs[i],
+					   PAGE_SIZE, DMA_TO_DEVICE);
+}
+EXPORT_SYMBOL_GPL(tmc_sg_table_sync_table);
+
+/*
+ * tmc_sg_table_get_data: Get the buffer pointer for data @offset
+ * in the SG buffer. The @bufpp is updated to point to the buffer.
+ * Returns :
+ *	the length of linear data available at @offset.
+ *	or
+ *	<= 0 if no data is available.
+ */
+ssize_t tmc_sg_table_get_data(struct tmc_sg_table *sg_table,
+			      u64 offset, size_t len, char **bufpp)
+{
+	size_t size;
+	int pg_idx = offset >> PAGE_SHIFT;
+	int pg_offset = offset & (PAGE_SIZE - 1);
+	struct tmc_pages *data_pages = &sg_table->data_pages;
+
+	size = tmc_sg_table_buf_size(sg_table);
+	if (offset >= size)
+		return -EINVAL;
+
+	/* Make sure we don't go beyond the end */
+	len = (len < (size - offset)) ? len : size - offset;
+	/* Respect the page boundaries */
+	len = (len < (PAGE_SIZE - pg_offset)) ? len : (PAGE_SIZE - pg_offset);
+	if (len > 0)
+		*bufpp = page_address(data_pages->pages[pg_idx]) + pg_offset;
+	return len;
+}
+EXPORT_SYMBOL_GPL(tmc_sg_table_get_data);
+
+#ifdef ETR_SG_DEBUG
+/* Map a dma address to virtual address */
+static unsigned long
+tmc_sg_daddr_to_vaddr(struct tmc_sg_table *sg_table,
+		      dma_addr_t addr, bool table)
+{
+	long offset;
+	unsigned long base;
+	struct tmc_pages *tmc_pages;
+
+	if (table) {
+		tmc_pages = &sg_table->table_pages;
+		base = (unsigned long)sg_table->table_vaddr;
+	} else {
+		tmc_pages = &sg_table->data_pages;
+		base = (unsigned long)sg_table->data_vaddr;
+	}
+
+	offset = tmc_pages_get_offset(tmc_pages, addr);
+	if (offset < 0)
+		return 0;
+	return base + offset;
+}
+
+/* Dump the given sg_table */
+static void tmc_etr_sg_table_dump(struct etr_sg_table *etr_table)
+{
+	sgte_t *ptr;
+	int i = 0;
+	dma_addr_t addr;
+	struct tmc_sg_table *sg_table = etr_table->sg_table;
+
+	ptr = (sgte_t *)tmc_sg_daddr_to_vaddr(sg_table,
+					      etr_table->hwaddr, true);
+	while (ptr) {
+		addr = ETR_SG_ADDR(*ptr);
+		switch (ETR_SG_ET(*ptr)) {
+		case ETR_SG_ET_NORMAL:
+			dev_dbg(sg_table->dev,
+				"%05d: %p\t:[N] 0x%llx\n", i, ptr, addr);
+			ptr++;
+			break;
+		case ETR_SG_ET_LINK:
+			dev_dbg(sg_table->dev,
+				"%05d: *** %p\t:{L} 0x%llx ***\n",
+				 i, ptr, addr);
+			ptr = (sgte_t *)tmc_sg_daddr_to_vaddr(sg_table,
+							      addr, true);
+			break;
+		case ETR_SG_ET_LAST:
+			dev_dbg(sg_table->dev,
+				"%05d: ### %p\t:[L] 0x%llx ###\n",
+				 i, ptr, addr);
+			return;
+		default:
+			dev_dbg(sg_table->dev,
+				"%05d: xxx %p\t:[INVALID] 0x%llx xxx\n",
+				 i, ptr, addr);
+			return;
+		}
+		i++;
+	}
+	dev_dbg(sg_table->dev, "******* End of Table *****\n");
+}
+#else
+static void tmc_etr_sg_table_dump(struct etr_sg_table *etr_table) {}
+#endif
+
+/*
+ * Populate the SG Table page table entries from table/data
+ * pages allocated. Each Data page has ETR_SG_PAGES_PER_SYSPAGE SG pages.
+ * So does a Table page. So we keep track of indices of the tables
+ * in each system page and move the pointers accordingly.
+ */
+#define INC_IDX_ROUND(idx, size) ((idx) = ((idx) + 1) % (size))
+static void tmc_etr_sg_table_populate(struct etr_sg_table *etr_table)
+{
+	dma_addr_t paddr;
+	int i, type, nr_entries;
+	int tpidx = 0; /* index to the current system table_page */
+	int sgtidx = 0;	/* index to the sg_table within the current syspage */
+	int sgtentry = 0; /* the entry within the sg_table */
+	int dpidx = 0; /* index to the current system data_page */
+	int spidx = 0; /* index to the SG page within the current data page */
+	sgte_t *ptr; /* pointer to the table entry to fill */
+	struct tmc_sg_table *sg_table = etr_table->sg_table;
+	dma_addr_t *table_daddrs = sg_table->table_pages.daddrs;
+	dma_addr_t *data_daddrs = sg_table->data_pages.daddrs;
+
+	nr_entries = tmc_etr_sg_table_entries(sg_table->data_pages.nr_pages);
+	/*
+	 * Use the contiguous virtual address of the table to update entries.
+	 */
+	ptr = sg_table->table_vaddr;
+	/*
+	 * Fill all the entries, except the last entry to avoid special
+	 * checks within the loop.
+	 */
+	for (i = 0; i < nr_entries - 1; i++) {
+		if (sgtentry == ETR_SG_PTRS_PER_PAGE - 1) {
+			/*
+			 * Last entry in a sg_table page is a link address to
+			 * the next table page. If this sg_table is the last
+			 * one in the system page, it links to the first
+			 * sg_table in the next system page. Otherwise, it
+			 * links to the next sg_table page within the system
+			 * page.
+			 */
+			if (sgtidx == ETR_SG_PAGES_PER_SYSPAGE - 1) {
+				paddr = table_daddrs[tpidx + 1];
+			} else {
+				paddr = table_daddrs[tpidx] +
+					(ETR_SG_PAGE_SIZE * (sgtidx + 1));
+			}
+			type = ETR_SG_ET_LINK;
+		} else {
+			/*
+			 * Update the indices to the data_pages to point to the
+			 * next sg_page in the data buffer.
+			 */
+			type = ETR_SG_ET_NORMAL;
+			paddr = data_daddrs[dpidx] + spidx * ETR_SG_PAGE_SIZE;
+			if (!INC_IDX_ROUND(spidx, ETR_SG_PAGES_PER_SYSPAGE))
+				dpidx++;
+		}
+		*ptr++ = ETR_SG_ENTRY(paddr, type);
+		/*
+		 * Move to the next table pointer, moving the table page index
+		 * if necessary
+		 */
+		if (!INC_IDX_ROUND(sgtentry, ETR_SG_PTRS_PER_PAGE)) {
+			if (!INC_IDX_ROUND(sgtidx, ETR_SG_PAGES_PER_SYSPAGE))
+				tpidx++;
+		}
+	}
+
+	/* Set up the last entry, which is always a data pointer */
+	paddr = data_daddrs[dpidx] + spidx * ETR_SG_PAGE_SIZE;
+	*ptr++ = ETR_SG_ENTRY(paddr, ETR_SG_ET_LAST);
+}
+
+/*
+ * tmc_init_etr_sg_table: Allocate a TMC ETR SG table, data buffer of @size and
+ * populate the table.
+ *
+ * @dev		- Device pointer for the TMC
+ * @node	- NUMA node where the memory should be allocated
+ * @size	- Total size of the data buffer
+ * @pages	- Optional list of page virtual address
+ */
+static struct etr_sg_table *
+tmc_init_etr_sg_table(struct device *dev, int node,
+		      unsigned long size, void **pages)
+{
+	int nr_entries, nr_tpages;
+	int nr_dpages = size >> PAGE_SHIFT;
+	struct tmc_sg_table *sg_table;
+	struct etr_sg_table *etr_table;
+
+	etr_table = kzalloc_obj(*etr_table);
+	if (!etr_table)
+		return ERR_PTR(-ENOMEM);
+	nr_entries = tmc_etr_sg_table_entries(nr_dpages);
+	nr_tpages = DIV_ROUND_UP(nr_entries, ETR_SG_PTRS_PER_SYSPAGE);
+
+	sg_table = tmc_alloc_sg_table(dev, node, nr_tpages, nr_dpages, pages);
+	if (IS_ERR(sg_table)) {
+		kfree(etr_table);
+		return ERR_CAST(sg_table);
+	}
+
+	etr_table->sg_table = sg_table;
+	/* TMC should use table base address for DBA */
+	etr_table->hwaddr = sg_table->table_daddr;
+	tmc_etr_sg_table_populate(etr_table);
+	/* Sync the table pages for the HW */
+	tmc_sg_table_sync_table(sg_table);
+	tmc_etr_sg_table_dump(etr_table);
+
+	return etr_table;
+}
+
+/*
+ * tmc_etr_alloc_flat_buf: Allocate a contiguous DMA buffer.
+ */
+static int tmc_etr_alloc_flat_buf(struct tmc_drvdata *drvdata,
+				  struct etr_buf *etr_buf, int node,
+				  void **pages)
+{
+	struct etr_flat_buf *flat_buf;
+	struct device *real_dev = drvdata->comp->dev.parent;
+
+	/* We cannot reuse existing pages for flat buf */
+	if (pages)
+		return -EINVAL;
+
+	flat_buf = kzalloc_obj(*flat_buf);
+	if (!flat_buf)
+		return -ENOMEM;
+
+	flat_buf->vaddr = dma_alloc_noncoherent(real_dev, etr_buf->size,
+						&flat_buf->daddr,
+						DMA_FROM_DEVICE,
+						GFP_KERNEL | __GFP_NOWARN);
+	if (!flat_buf->vaddr) {
+		kfree(flat_buf);
+		return -ENOMEM;
+	}
+
+	flat_buf->size = etr_buf->size;
+	flat_buf->dev = &drvdata->comp->dev;
+	etr_buf->hwaddr = flat_buf->daddr;
+	etr_buf->mode = ETR_MODE_FLAT;
+	etr_buf->private = flat_buf;
+	return 0;
+}
+
+static void tmc_etr_free_flat_buf(struct etr_buf *etr_buf)
+{
+	struct etr_flat_buf *flat_buf = etr_buf->private;
+
+	if (flat_buf && flat_buf->daddr) {
+		struct device *real_dev = flat_buf->dev->parent;
+
+		dma_free_noncoherent(real_dev, etr_buf->size,
+				     flat_buf->vaddr, flat_buf->daddr,
+				     DMA_FROM_DEVICE);
+	}
+	kfree(flat_buf);
+}
+
+static void tmc_etr_sync_flat_buf(struct etr_buf *etr_buf, u64 rrp, u64 rwp)
+{
+	struct etr_flat_buf *flat_buf = etr_buf->private;
+	struct device *real_dev = flat_buf->dev->parent;
+
+	/*
+	 * Adjust the buffer to point to the beginning of the trace data
+	 * and update the available trace data.
+	 */
+	etr_buf->offset = rrp - etr_buf->hwaddr;
+	if (etr_buf->full)
+		etr_buf->len = etr_buf->size;
+	else
+		etr_buf->len = rwp - rrp;
+
+	/*
+	 * The driver always starts tracing at the beginning of the buffer,
+	 * the only reason why we would get a wrap around is when the buffer
+	 * is full.  Sync the entire buffer in one go for this case.
+	 */
+	if (etr_buf->offset + etr_buf->len > etr_buf->size)
+		dma_sync_single_for_cpu(real_dev, flat_buf->daddr,
+					etr_buf->size, DMA_FROM_DEVICE);
+	else
+		dma_sync_single_for_cpu(real_dev,
+					flat_buf->daddr + etr_buf->offset,
+					etr_buf->len, DMA_FROM_DEVICE);
+}
+
+static ssize_t tmc_etr_get_data_flat_buf(struct etr_buf *etr_buf,
+					 u64 offset, size_t len, char **bufpp)
+{
+	struct etr_flat_buf *flat_buf = etr_buf->private;
+
+	*bufpp = (char *)flat_buf->vaddr + offset;
+	/*
+	 * tmc_etr_buf_get_data already adjusts the length to handle
+	 * buffer wrapping around.
+	 */
+	return len;
+}
+
+static const struct etr_buf_operations etr_flat_buf_ops = {
+	.alloc = tmc_etr_alloc_flat_buf,
+	.free = tmc_etr_free_flat_buf,
+	.sync = tmc_etr_sync_flat_buf,
+	.get_data = tmc_etr_get_data_flat_buf,
+};
+
+/*
+ * tmc_etr_alloc_resrv_buf: Allocate a contiguous DMA buffer from reserved region.
+ */
+static int tmc_etr_alloc_resrv_buf(struct tmc_drvdata *drvdata,
+				  struct etr_buf *etr_buf, int node,
+				  void **pages)
+{
+	struct etr_flat_buf *resrv_buf;
+	struct device *real_dev = drvdata->comp->dev.parent;
+
+	/* We cannot reuse existing pages for resrv buf */
+	if (pages)
+		return -EINVAL;
+
+	resrv_buf = kzalloc_obj(*resrv_buf);
+	if (!resrv_buf)
+		return -ENOMEM;
+
+	resrv_buf->daddr = dma_map_resource(real_dev, drvdata->resrv_buf.paddr,
+					   drvdata->resrv_buf.size,
+					   DMA_FROM_DEVICE, 0);
+	if (dma_mapping_error(real_dev, resrv_buf->daddr)) {
+		dev_err(real_dev, "failed to map source buffer address\n");
+		kfree(resrv_buf);
+		return -ENOMEM;
+	}
+
+	resrv_buf->vaddr = drvdata->resrv_buf.vaddr;
+	resrv_buf->size = etr_buf->size = drvdata->resrv_buf.size;
+	resrv_buf->dev = &drvdata->comp->dev;
+	etr_buf->hwaddr = resrv_buf->daddr;
+	etr_buf->mode = ETR_MODE_RESRV;
+	etr_buf->private = resrv_buf;
+	return 0;
+}
+
+static void tmc_etr_free_resrv_buf(struct etr_buf *etr_buf)
+{
+	struct etr_flat_buf *resrv_buf = etr_buf->private;
+
+	if (resrv_buf && resrv_buf->daddr) {
+		struct device *real_dev = resrv_buf->dev->parent;
+
+		dma_unmap_resource(real_dev, resrv_buf->daddr,
+				resrv_buf->size, DMA_FROM_DEVICE, 0);
+	}
+	kfree(resrv_buf);
+}
+
+static void tmc_etr_sync_resrv_buf(struct etr_buf *etr_buf, u64 rrp, u64 rwp)
+{
+	/*
+	 * Adjust the buffer to point to the beginning of the trace data
+	 * and update the available trace data.
+	 */
+	etr_buf->offset = rrp - etr_buf->hwaddr;
+	if (etr_buf->full)
+		etr_buf->len = etr_buf->size;
+	else
+		etr_buf->len = rwp - rrp;
+}
+
+static const struct etr_buf_operations etr_resrv_buf_ops = {
+	.alloc = tmc_etr_alloc_resrv_buf,
+	.free = tmc_etr_free_resrv_buf,
+	.sync = tmc_etr_sync_resrv_buf,
+	.get_data = tmc_etr_get_data_flat_buf,
+};
+
+/*
+ * tmc_etr_alloc_sg_buf: Allocate an SG buf @etr_buf. Setup the parameters
+ * appropriately.
+ */
+static int tmc_etr_alloc_sg_buf(struct tmc_drvdata *drvdata,
+				struct etr_buf *etr_buf, int node,
+				void **pages)
+{
+	struct etr_sg_table *etr_table;
+	struct device *dev = &drvdata->comp->dev;
+
+	etr_table = tmc_init_etr_sg_table(dev, node,
+					  etr_buf->size, pages);
+	if (IS_ERR(etr_table))
+		return -ENOMEM;
+	etr_buf->hwaddr = etr_table->hwaddr;
+	etr_buf->mode = ETR_MODE_ETR_SG;
+	etr_buf->private = etr_table;
+	return 0;
+}
+
+static void tmc_etr_free_sg_buf(struct etr_buf *etr_buf)
+{
+	struct etr_sg_table *etr_table = etr_buf->private;
+
+	if (etr_table) {
+		tmc_free_sg_table(etr_table->sg_table);
+		kfree(etr_table);
+	}
+}
+
+static ssize_t tmc_etr_get_data_sg_buf(struct etr_buf *etr_buf, u64 offset,
+				       size_t len, char **bufpp)
+{
+	struct etr_sg_table *etr_table = etr_buf->private;
+
+	return tmc_sg_table_get_data(etr_table->sg_table, offset, len, bufpp);
+}
+
+static void tmc_etr_sync_sg_buf(struct etr_buf *etr_buf, u64 rrp, u64 rwp)
+{
+	long r_offset, w_offset;
+	struct etr_sg_table *etr_table = etr_buf->private;
+	struct tmc_sg_table *table = etr_table->sg_table;
+
+	/* Convert hw address to offset in the buffer */
+	r_offset = tmc_sg_get_data_page_offset(table, rrp);
+	if (r_offset < 0) {
+		dev_warn(table->dev,
+			 "Unable to map RRP %llx to offset\n", rrp);
+		etr_buf->len = 0;
+		return;
+	}
+
+	w_offset = tmc_sg_get_data_page_offset(table, rwp);
+	if (w_offset < 0) {
+		dev_warn(table->dev,
+			 "Unable to map RWP %llx to offset\n", rwp);
+		etr_buf->len = 0;
+		return;
+	}
+
+	etr_buf->offset = r_offset;
+	if (etr_buf->full)
+		etr_buf->len = etr_buf->size;
+	else
+		etr_buf->len = ((w_offset < r_offset) ? etr_buf->size : 0) +
+				w_offset - r_offset;
+	tmc_sg_table_sync_data_range(table, r_offset, etr_buf->len);
+}
+
+static const struct etr_buf_operations etr_sg_buf_ops = {
+	.alloc = tmc_etr_alloc_sg_buf,
+	.free = tmc_etr_free_sg_buf,
+	.sync = tmc_etr_sync_sg_buf,
+	.get_data = tmc_etr_get_data_sg_buf,
+};
+
+/*
+ * TMC ETR could be connected to a CATU device, which can provide address
+ * translation service. This is represented by the Output port of the TMC
+ * (ETR) connected to the input port of the CATU.
+ *
+ * Returns	: gtrace_component ptr for the CATU device if a CATU is found.
+ *		: NULL otherwise.
+ */
+struct gtrace_component *
+tmc_etr_get_catu_device(struct tmc_drvdata *drvdata)
+{
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(tmc_etr_get_catu_device);
+
+static const struct etr_buf_operations *etr_buf_ops[] = {
+	[ETR_MODE_FLAT] = &etr_flat_buf_ops,
+	[ETR_MODE_ETR_SG] = &etr_sg_buf_ops,
+	[ETR_MODE_CATU] = NULL,
+	[ETR_MODE_RESRV] = &etr_resrv_buf_ops
+};
+
+void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu)
+{
+	etr_buf_ops[ETR_MODE_CATU] = catu;
+}
+EXPORT_SYMBOL_GPL(tmc_etr_set_catu_ops);
+
+void tmc_etr_remove_catu_ops(void)
+{
+	etr_buf_ops[ETR_MODE_CATU] = NULL;
+}
+EXPORT_SYMBOL_GPL(tmc_etr_remove_catu_ops);
+
+static int tmc_etr_mode_alloc_buf(int mode, struct tmc_drvdata *drvdata, struct etr_buf *etr_buf,
+				  int node, void **pages)
+{
+	int rc = -EINVAL;
+
+	switch (mode) {
+	case ETR_MODE_FLAT:
+	case ETR_MODE_ETR_SG:
+	case ETR_MODE_CATU:
+	case ETR_MODE_RESRV:
+		if (etr_buf_ops[mode] && etr_buf_ops[mode]->alloc)
+			rc = etr_buf_ops[mode]->alloc(drvdata, etr_buf,
+						      node, pages);
+		if (!rc)
+			etr_buf->ops = etr_buf_ops[mode];
+		return rc;
+	default:
+		return -EINVAL;
+	}
+}
+
+static void get_etr_buf_hw(struct device *dev, struct etr_buf_hw *buf_hw)
+{
+	struct tmc_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	buf_hw->has_iommu = iommu_get_domain_for_dev(dev->parent);
+	buf_hw->has_etr_sg = tmc_etr_has_cap(drvdata, TMC_ETR_SG);
+	buf_hw->has_catu = !!tmc_etr_get_catu_device(drvdata);
+	buf_hw->has_resrv = tmc_has_reserved_buffer(drvdata);
+}
+
+static bool etr_can_use_flat_mode(struct etr_buf_hw *buf_hw, ssize_t etr_buf_size)
+{
+	bool has_sg = buf_hw->has_catu || buf_hw->has_etr_sg;
+
+	return !has_sg || buf_hw->has_iommu || etr_buf_size < SZ_1M;
+}
+
+/*
+ * tmc_alloc_etr_buf: Allocate a buffer use by ETR.
+ * @drvdata	: ETR device details.
+ * @size	: size of the requested buffer.
+ * @flags	: Required properties for the buffer.
+ * @node	: Node for memory allocations.
+ * @pages	: An optional list of pages.
+ */
+static struct etr_buf *tmc_alloc_etr_buf(struct tmc_drvdata *drvdata,
+					 ssize_t size, int flags,
+					 int node, void **pages)
+{
+	int rc = -ENOMEM;
+	struct etr_buf *etr_buf;
+	struct etr_buf_hw buf_hw;
+	struct device *dev = &drvdata->comp->dev;
+
+	get_etr_buf_hw(dev, &buf_hw);
+	etr_buf = kzalloc_obj(*etr_buf);
+	if (!etr_buf)
+		return ERR_PTR(-ENOMEM);
+
+	etr_buf->size = size;
+
+	/* If there is user directive for buffer mode, try that first */
+	if (drvdata->etr_mode != ETR_MODE_AUTO)
+		rc = tmc_etr_mode_alloc_buf(drvdata->etr_mode, drvdata,
+					    etr_buf, node, pages);
+
+	/*
+	 * If we have to use an existing list of pages, we cannot reliably
+	 * use a contiguous DMA memory (even if we have an IOMMU). Otherwise,
+	 * we use the contiguous DMA memory if at least one of the following
+	 * conditions is true:
+	 *  a) The ETR cannot use Scatter-Gather.
+	 *  b) we have a backing IOMMU
+	 *  c) The requested memory size is smaller (< 1M).
+	 *
+	 * Fallback to available mechanisms.
+	 *
+	 */
+	if (rc && !pages && etr_can_use_flat_mode(&buf_hw, size))
+		rc = tmc_etr_mode_alloc_buf(ETR_MODE_FLAT, drvdata,
+					    etr_buf, node, pages);
+	if (rc && buf_hw.has_etr_sg)
+		rc = tmc_etr_mode_alloc_buf(ETR_MODE_ETR_SG, drvdata,
+					    etr_buf, node, pages);
+	if (rc && buf_hw.has_catu)
+		rc = tmc_etr_mode_alloc_buf(ETR_MODE_CATU, drvdata,
+					    etr_buf, node, pages);
+	if (rc) {
+		kfree(etr_buf);
+		return ERR_PTR(rc);
+	}
+
+	/*
+	 * Keep a reference to the ETR this buffer has been allocated for
+	 * in order to have access to the IDR in tmc_free_etr_buffer().
+	 */
+	etr_buf->drvdata = drvdata;
+	/* per-thread buffers are not shared and never enter the idr */
+	etr_buf->pid = -1;
+
+	refcount_set(&etr_buf->refcount, 1);
+	dev_dbg(dev, "allocated buffer of size %ldKB in mode %d\n",
+		(unsigned long)size >> 10, etr_buf->mode);
+	return etr_buf;
+}
+
+static void tmc_free_etr_buf(struct etr_buf *etr_buf)
+{
+	WARN_ON(!etr_buf->ops || !etr_buf->ops->free);
+	etr_buf->ops->free(etr_buf);
+	kfree(etr_buf);
+}
+
+/*
+ * tmc_etr_buf_get_data: Get the pointer the trace data at @offset
+ * with a maximum of @len bytes.
+ * Returns: The size of the linear data available @pos, with *bufpp
+ * updated to point to the buffer.
+ */
+static ssize_t tmc_etr_buf_get_data(struct etr_buf *etr_buf,
+				    u64 offset, size_t len, char **bufpp)
+{
+	/* Adjust the length to limit this transaction to end of buffer */
+	len = (len < (etr_buf->size - offset)) ? len : etr_buf->size - offset;
+
+	return etr_buf->ops->get_data(etr_buf, (u64)offset, len, bufpp);
+}
+
+static s64
+tmc_etr_buf_insert_barrier_packet(struct etr_buf *etr_buf, u64 offset)
+{
+	ssize_t len;
+	char *bufp;
+
+	len = tmc_etr_buf_get_data(etr_buf, offset,
+				   CORESIGHT_BARRIER_PKT_SIZE, &bufp);
+	if (WARN_ON(len < 0 || len < CORESIGHT_BARRIER_PKT_SIZE))
+		return -EINVAL;
+	coresight_insert_barrier_packet(bufp);
+	return offset + CORESIGHT_BARRIER_PKT_SIZE;
+}
+
+/*
+ * tmc_sync_etr_buf: Sync the trace buffer availability with drvdata.
+ * Makes sure the trace data is synced to the memory for consumption.
+ * @etr_buf->offset will hold the offset to the beginning of the trace data
+ * within the buffer, with @etr_buf->len bytes to consume.
+ */
+static void tmc_sync_etr_buf(struct tmc_drvdata *drvdata)
+{
+	struct etr_buf *etr_buf = drvdata->etr_buf;
+	u64 rrp, rwp;
+	u32 status;
+
+	rrp = tmc_read_rrp(drvdata);
+	rwp = tmc_read_rwp(drvdata);
+	status = readl_relaxed(drvdata->base + TMC_STS);
+
+	/*
+	 * If there were memory errors in the session, truncate the
+	 * buffer.
+	 */
+	if (WARN_ON_ONCE(status & TMC_STS_MEMERR)) {
+		dev_dbg(&drvdata->comp->dev,
+			"tmc memory error detected, truncating buffer\n");
+		etr_buf->len = 0;
+		etr_buf->full = false;
+		return;
+	}
+
+	etr_buf->full = !!(status & TMC_STS_FULL);
+
+	WARN_ON(!etr_buf->ops || !etr_buf->ops->sync);
+
+	etr_buf->ops->sync(etr_buf, rrp, rwp);
+}
+
+static int __tmc_etr_enable_hw(struct tmc_drvdata *drvdata)
+{
+	u32 axictl, sts, ffcr;
+	struct etr_buf *etr_buf = drvdata->etr_buf;
+	int rc = 0;
+
+	CS_UNLOCK(drvdata->base);
+
+	/* Wait for TMCSReady bit to be set */
+	rc = tmc_wait_for_tmcready(drvdata);
+	if (rc) {
+		dev_err(&drvdata->comp->dev,
+			"Failed to enable : TMC not ready\n");
+		CS_LOCK(drvdata->base);
+		return rc;
+	}
+
+	writel_relaxed(etr_buf->size / 4, drvdata->base + TMC_RSZ);
+	writel_relaxed(TMC_MODE_CIRCULAR_BUFFER, drvdata->base + TMC_MODE);
+
+	axictl = readl_relaxed(drvdata->base + TMC_AXICTL);
+	axictl &= ~TMC_AXICTL_CLEAR_MASK;
+	axictl |= TMC_AXICTL_PROT_CTL_B1;
+	axictl |= TMC_AXICTL_WR_BURST(drvdata->max_burst_size);
+	axictl |= TMC_AXICTL_AXCACHE_OS;
+
+	if (tmc_etr_has_cap(drvdata, TMC_ETR_AXI_ARCACHE)) {
+		axictl &= ~TMC_AXICTL_ARCACHE_MASK;
+		axictl |= TMC_AXICTL_ARCACHE_OS;
+	}
+
+	if (etr_buf->mode == ETR_MODE_ETR_SG)
+		axictl |= TMC_AXICTL_SCT_GAT_MODE;
+
+	writel_relaxed(axictl, drvdata->base + TMC_AXICTL);
+	tmc_write_dba(drvdata, etr_buf->hwaddr);
+	/*
+	 * If the TMC pointers must be programmed before the session,
+	 * we have to set it properly (i.e, RRP/RWP to base address and
+	 * STS to "not full").
+	 */
+	if (tmc_etr_has_cap(drvdata, TMC_ETR_SAVE_RESTORE)) {
+		tmc_write_rrp(drvdata, etr_buf->hwaddr);
+		tmc_write_rwp(drvdata, etr_buf->hwaddr);
+		sts = readl_relaxed(drvdata->base + TMC_STS) & ~TMC_STS_FULL;
+		writel_relaxed(sts, drvdata->base + TMC_STS);
+	}
+
+	ffcr = TMC_FFCR_EN_FMT | TMC_FFCR_EN_TI | TMC_FFCR_FON_FLIN |
+		TMC_FFCR_FON_TRIG_EVT | TMC_FFCR_TRIGON_TRIGIN;
+	if (drvdata->stop_on_flush)
+		ffcr |= TMC_FFCR_STOP_ON_FLUSH;
+	writel_relaxed(ffcr, drvdata->base + TMC_FFCR);
+
+	writel_relaxed(drvdata->trigger_cntr, drvdata->base + TMC_TRG);
+	tmc_enable_hw(drvdata);
+
+	CS_LOCK(drvdata->base);
+	return rc;
+}
+
+static int tmc_etr_enable_hw(struct tmc_drvdata *drvdata,
+			     struct etr_buf *etr_buf)
+{
+	int rc;
+
+	/* Callers should provide an appropriate buffer for use */
+	if (WARN_ON(!etr_buf))
+		return -EINVAL;
+
+	if ((etr_buf->mode == ETR_MODE_ETR_SG) &&
+	    WARN_ON(!tmc_etr_has_cap(drvdata, TMC_ETR_SG)))
+		return -EINVAL;
+
+	if (WARN_ON(drvdata->etr_buf))
+		return -EBUSY;
+
+	rc = coresight_claim_device(drvdata->comp);
+	if (!rc) {
+		drvdata->etr_buf = etr_buf;
+		rc = __tmc_etr_enable_hw(drvdata);
+		if (rc) {
+			drvdata->etr_buf = NULL;
+			coresight_disclaim_device(drvdata->comp);
+		}
+	}
+
+	return rc;
+}
+
+/*
+ * Return the available trace data in the buffer (starts at etr_buf->offset,
+ * limited by etr_buf->len) from @pos, with a maximum limit of @len,
+ * also updating the @bufpp on where to find it. Since the trace data
+ * starts at anywhere in the buffer, depending on the RRP, we adjust the
+ * @len returned to handle buffer wrapping around.
+ *
+ * We are protected here by drvdata->reading != 0, which ensures the
+ * sysfs_buf stays alive.
+ */
+ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
+				loff_t pos, size_t len, char **bufpp)
+{
+	s64 offset;
+	ssize_t actual = len;
+	struct etr_buf *etr_buf = drvdata->sysfs_buf;
+
+	if (pos + actual > etr_buf->len)
+		actual = etr_buf->len - pos;
+	if (actual <= 0)
+		return actual;
+
+	/* Compute the offset from which we read the data */
+	offset = etr_buf->offset + pos;
+	if (offset >= etr_buf->size)
+		offset -= etr_buf->size;
+	return tmc_etr_buf_get_data(etr_buf, offset, actual, bufpp);
+}
+
+static struct etr_buf *
+tmc_etr_alloc_sysfs_buf(struct tmc_drvdata *drvdata)
+{
+	return tmc_alloc_etr_buf(drvdata, drvdata->size,
+				 0, cpu_to_node(0), NULL);
+}
+
+static void
+tmc_etr_free_sysfs_buf(struct etr_buf *buf)
+{
+	if (buf)
+		tmc_free_etr_buf(buf);
+}
+
+static void tmc_etr_sync_sysfs_buf(struct tmc_drvdata *drvdata)
+{
+	struct etr_buf *etr_buf = drvdata->etr_buf;
+
+	if (WARN_ON(drvdata->sysfs_buf != etr_buf)) {
+		tmc_etr_free_sysfs_buf(drvdata->sysfs_buf);
+		drvdata->sysfs_buf = NULL;
+	} else {
+		tmc_sync_etr_buf(drvdata);
+		/*
+		 * Insert barrier packets at the beginning, if there was
+		 * an overflow.
+		 */
+		if (etr_buf->full)
+			tmc_etr_buf_insert_barrier_packet(etr_buf,
+							  etr_buf->offset);
+	}
+	/* Reset the ETR buf used by hardware */
+	drvdata->etr_buf = NULL;
+}
+
+static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
+{
+	CS_UNLOCK(drvdata->base);
+
+	tmc_flush_and_stop(drvdata);
+	/*
+	 * When operating in sysFS mode the content of the buffer needs to be
+	 * read before the TMC is disabled.
+	 */
+	if (gtrace_get_mode(drvdata->comp) == GTRACE_COMPONENT_MODE_SYSFS)
+		tmc_etr_sync_sysfs_buf(drvdata);
+
+	tmc_disable_hw(drvdata);
+
+	CS_LOCK(drvdata->base);
+
+}
+
+void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
+{
+	__tmc_etr_disable_hw(drvdata);
+	coresight_disclaim_device(drvdata->comp);
+}
+
+int tmc_etr_setup_sysfs_buf(struct gtrace_component *comp)
+{
+	int ret = 0;
+	unsigned long flags;
+	struct tmc_drvdata *drvdata = dev_get_drvdata(comp->dev.parent);
+	struct etr_buf *sysfs_buf = NULL, *new_buf = NULL, *free_buf = NULL;
+
+	/*
+	 * If we are enabling the ETR from disabled state, we need to make
+	 * sure we have a buffer with the right size. The etr_buf is not reset
+	 * immediately after we stop the tracing in SYSFS mode as we wait for
+	 * the user to collect the data. We may be able to reuse the existing
+	 * buffer, provided the size matches. Any allocation has to be done
+	 * with the lock released.
+	 */
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+
+	sysfs_buf = READ_ONCE(drvdata->sysfs_buf);
+	if (!sysfs_buf || (sysfs_buf->size != drvdata->size)) {
+		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
+		/* Allocate memory with the locks released */
+		free_buf = new_buf = tmc_etr_alloc_sysfs_buf(drvdata);
+		if (IS_ERR(new_buf))
+			return PTR_ERR(new_buf);
+
+		/* Let's try again */
+		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	}
+
+	if (drvdata->reading) {
+		ret = -EBUSY;
+		goto out;
+	}
+
+	/*
+	 * If we don't have a buffer or it doesn't match the requested size,
+	 * use the buffer allocated above. Otherwise reuse the existing buffer.
+	 */
+	sysfs_buf = READ_ONCE(drvdata->sysfs_buf);
+	if (!sysfs_buf || (new_buf && sysfs_buf->size != new_buf->size)) {
+		free_buf = sysfs_buf;
+		drvdata->sysfs_buf = new_buf;
+	}
+
+out:
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
+	/* Free memory outside the spinlock if need be */
+	if (free_buf)
+		tmc_etr_free_sysfs_buf(free_buf);
+	return ret;
+}
+
+struct etr_buf *tmc_etr_get_buffer(struct gtrace_component *comp)
+{
+	struct gtrace_path *path = comp->path;
+	struct tmc_drvdata *drvdata = dev_get_drvdata(comp->dev.parent);
+	struct etr_buf *etr_buf;
+
+	switch (path->mode) {
+	case GTRACE_COMPONENT_MODE_SYSFS:
+		etr_buf = drvdata->sysfs_buf;
+		break;
+	case GTRACE_COMPONENT_MODE_PERF:
+		etr_buf = drvdata->perf_buf;
+		break;
+	default:
+		return ERR_PTR(-EINVAL);
+	}
+
+	WARN_ON(!etr_buf);
+
+	return etr_buf;
+}
+EXPORT_SYMBOL_GPL(tmc_etr_get_buffer);
+
+/*
+ * alloc_etr_buf: Allocate ETR buffer for use by perf.
+ * Allocate the largest possible size, scaling down the size by half until it
+ * reaches a minimum limit (1M), beyond which we give up.
+ */
+static struct etr_buf *
+alloc_etr_buf(struct tmc_drvdata *drvdata, struct perf_event *event,
+	      int nr_pages, void **pages, bool snapshot)
+{
+	int node;
+	struct etr_buf *etr_buf;
+	ssize_t size;
+
+	node = (event->cpu == -1) ? NUMA_NO_NODE : cpu_to_node(event->cpu);
+
+	/* Use the minimum limit if the required size is smaller */
+	size = (ssize_t)nr_pages << PAGE_SHIFT;
+	size = max_t(ssize_t, size, TMC_ETR_PERF_MIN_BUF_SIZE);
+
+	/*
+	 * Try to allocate the required size for this ETR, if failed scale
+	 * down until we hit the minimum limit.
+	 */
+	do {
+		etr_buf = tmc_alloc_etr_buf(drvdata, size, 0, node, NULL);
+		if (!IS_ERR(etr_buf))
+			return etr_buf;
+		size /= 2;
+	} while (size >= TMC_ETR_PERF_MIN_BUF_SIZE);
+
+	return ERR_PTR(-ENOMEM);
+}
+
+static struct etr_buf *
+get_perf_etr_buf_cpu_wide(struct tmc_drvdata *drvdata,
+			  struct perf_event *event, int nr_pages,
+			  void **pages, bool snapshot)
+{
+	int ret;
+	pid_t pid = task_pid_nr(event->owner);
+	struct etr_buf *etr_buf;
+
+retry:
+	/*
+	 * An gtrace_perf_auxbuf is associated with an event and holds a reference
+	 * to the AUX ring buffer that was created for that event.  In CPU-wide
+	 * N:1 mode multiple events (one per CPU), each with its own AUX ring
+	 * buffer, share a sink.  As such an gtrace_perf_auxbuf is created for each
+	 * event but a single etr_buf associated with the ETR is shared between
+	 * them.  The last event in a trace session will copy the content of the
+	 * etr_buf to its AUX ring buffer.  Ring buffer associated to other
+	 * events are simply not used an freed as events are destoyed.  We still
+	 * need to allocate a ring buffer for each event since we don't know
+	 * which event will be last.
+	 */
+
+	/*
+	 * The first thing to do here is check if an etr_buf has already been
+	 * allocated for this session.  If so it is shared with this event,
+	 * otherwise it is created.
+	 */
+	mutex_lock(&drvdata->idr_mutex);
+	etr_buf = idr_find(&drvdata->idr, pid);
+	if (etr_buf) {
+		refcount_inc(&etr_buf->refcount);
+		mutex_unlock(&drvdata->idr_mutex);
+		return etr_buf;
+	}
+
+	/* If we made it here no buffer has been allocated, do so now. */
+	mutex_unlock(&drvdata->idr_mutex);
+
+	etr_buf = alloc_etr_buf(drvdata, event, nr_pages, pages, snapshot);
+	if (IS_ERR(etr_buf))
+		return etr_buf;
+
+	/* Now that we have a buffer, add it to the IDR. */
+	mutex_lock(&drvdata->idr_mutex);
+	ret = idr_alloc(&drvdata->idr, etr_buf, pid, pid + 1, GFP_KERNEL);
+	mutex_unlock(&drvdata->idr_mutex);
+
+	/* Another event with this session ID has allocated this buffer. */
+	if (ret == -ENOSPC) {
+		tmc_free_etr_buf(etr_buf);
+		goto retry;
+	}
+
+	/* The IDR can't allocate room for a new session, abandon ship. */
+	if (ret == -ENOMEM) {
+		tmc_free_etr_buf(etr_buf);
+		return ERR_PTR(ret);
+	}
+
+	/*
+	 * Keep a reference to the ETR this buffer has been allocated for
+	 * in order to have access to the IDR in tmc_free_etr_buffer().
+	 */
+	etr_buf->drvdata = drvdata;
+	/* cpu-wide buffers are shared and tracked in the idr by session pid */
+	etr_buf->pid = pid;
+
+	return etr_buf;
+}
+
+static struct etr_buf *
+get_perf_etr_buf_per_thread(struct tmc_drvdata *drvdata,
+			    struct perf_event *event, int nr_pages,
+			    void **pages, bool snapshot)
+{
+	/*
+	 * In per-thread mode the etr_buf isn't shared, so just go ahead
+	 * with memory allocation.
+	 */
+	return alloc_etr_buf(drvdata, event, nr_pages, pages, snapshot);
+}
+
+static struct etr_buf *
+get_perf_etr_buf(struct tmc_drvdata *drvdata, struct perf_event *event,
+		 int nr_pages, void **pages, bool snapshot)
+{
+	if (event->cpu == -1)
+		return get_perf_etr_buf_per_thread(drvdata, event, nr_pages,
+						   pages, snapshot);
+
+	return get_perf_etr_buf_cpu_wide(drvdata, event, nr_pages,
+					 pages, snapshot);
+}
+
+void *tmc_alloc_etr_buffer(struct gtrace_component *comp,
+			   struct perf_event *event, void **pages,
+			   int nr_pages, bool snapshot)
+{
+	int node;
+	struct etr_buf *etr_buf;
+	struct tmc_drvdata *drvdata = dev_get_drvdata(comp->dev.parent);
+
+	node = (event->cpu == -1) ? NUMA_NO_NODE : cpu_to_node(event->cpu);
+
+	etr_buf = get_perf_etr_buf(drvdata, event, nr_pages, pages, snapshot);
+	if (IS_ERR(etr_buf))
+		return NULL;
+
+	drvdata->perf_buf = etr_buf;
+
+	return etr_buf;
+}
+
+void tmc_free_etr_buffer(void *config)
+{
+	struct etr_buf *buf = NULL, *etr_buf = config;
+	struct tmc_drvdata *drvdata;
+
+	drvdata = etr_buf->drvdata;
+
+	mutex_lock(&drvdata->idr_mutex);
+	/* If we are not the last one to use the buffer, don't touch it. */
+	if (!refcount_dec_and_test(&etr_buf->refcount)) {
+		mutex_unlock(&drvdata->idr_mutex);
+		return;
+	}
+
+	/* only shared buffers are present in the idr */
+	if (etr_buf->pid != -1) {
+		/* We are the last one, remove from the IDR and free the buffer. */
+		buf = idr_remove(&drvdata->idr, etr_buf->pid);
+
+	}
+	mutex_unlock(&drvdata->idr_mutex);
+
+	/*
+	 * Something went very wrong if the buffer associated with this ID
+	 * is not the same in the IDR.  Leak to avoid use after free.
+	 */
+	if (buf && WARN_ON(buf != etr_buf))
+		return;
+
+	tmc_free_etr_buf(etr_buf);
+	/* Reset perf specific data */
+	drvdata->perf_buf = NULL;
+}
+
+/*
+ * tmc_etr_sync_perf_buffer: Copy the actual trace data from the hardware
+ * buffer to the perf ring buffer.
+ */
+static void tmc_etr_sync_perf_buffer(struct gtrace_perf_auxbuf *etr_perf,
+				     unsigned long head,
+				     unsigned long src_offset,
+				     unsigned long to_copy)
+{
+	long bytes;
+	long pg_idx, pg_offset;
+	char **dst_pages, *src_buf;
+	struct etr_buf *etr_buf = etr_perf->buf;
+
+	head = PERF_IDX2OFF(head, etr_perf);
+	pg_idx = head >> PAGE_SHIFT;
+	pg_offset = head & (PAGE_SIZE - 1);
+	dst_pages = (char **)etr_perf->pages;
+
+	while (to_copy > 0) {
+		/*
+		 * In one iteration, we can copy minimum of :
+		 *  1) what is available in the source buffer,
+		 *  2) what is available in the source buffer, before it
+		 *     wraps around.
+		 *  3) what is available in the destination page.
+		 * in one iteration.
+		 */
+		if (src_offset >= etr_buf->size)
+			src_offset -= etr_buf->size;
+		bytes = tmc_etr_buf_get_data(etr_buf, src_offset, to_copy,
+					     &src_buf);
+		if (WARN_ON_ONCE(bytes <= 0))
+			break;
+		bytes = min(bytes, (long)(PAGE_SIZE - pg_offset));
+
+		memcpy(dst_pages[pg_idx] + pg_offset, src_buf, bytes);
+
+		to_copy -= bytes;
+
+		/* Move destination pointers */
+		pg_offset += bytes;
+		if (pg_offset == PAGE_SIZE) {
+			pg_offset = 0;
+			if (++pg_idx == etr_perf->nr_pages)
+				pg_idx = 0;
+		}
+
+		/* Move source pointers */
+		src_offset += bytes;
+	}
+}
+
+/*
+ * tmc_update_etr_buffer : Update the perf ring buffer with the
+ * available trace data. We use software double buffering at the moment.
+ *
+ * TODO: Add support for reusing the perf ring buffer.
+ */
+unsigned long
+tmc_update_etr_buffer(struct gtrace_component *comp,
+		      struct perf_output_handle *handle,
+		      struct gtrace_perf_auxbuf *etr_perf)
+{
+	bool lost = false;
+	unsigned long offset, size = 0;
+	struct tmc_drvdata *drvdata = dev_get_drvdata(comp->dev.parent);
+	struct etr_buf *etr_buf = etr_perf->buf;
+	struct perf_event *event = handle->event;
+
+	if (WARN_ON(drvdata->perf_buf != etr_buf)) {
+		lost = true;
+		goto out;
+	}
+
+	CS_UNLOCK(drvdata->base);
+
+	tmc_flush_and_stop(drvdata);
+	tmc_sync_etr_buf(drvdata);
+
+	CS_LOCK(drvdata->base);
+
+	lost = etr_buf->full;
+	offset = etr_buf->offset;
+	size = etr_buf->len;
+
+	/*
+	 * The ETR buffer may be bigger than the space available in the
+	 * perf ring buffer (handle->size).  If so advance the offset so that we
+	 * get the latest trace data.  In snapshot mode none of that matters
+	 * since we are expected to clobber stale data in favour of the latest
+	 * traces.
+	 */
+	if (!etr_perf->snapshot && size > handle->size) {
+		u32 mask = tmc_get_memwidth_mask(drvdata);
+
+		/*
+		 * Make sure the new size is aligned in accordance with the
+		 * requirement explained in function tmc_get_memwidth_mask().
+		 */
+		size = handle->size & mask;
+		offset = etr_buf->offset + etr_buf->len - size;
+
+		if (offset >= etr_buf->size)
+			offset -= etr_buf->size;
+		lost = true;
+	}
+
+	/* Insert barrier packets at the beginning, if there was an overflow */
+	if (lost)
+		tmc_etr_buf_insert_barrier_packet(etr_buf, offset);
+	tmc_etr_sync_perf_buffer(etr_perf, handle->head, offset, size);
+
+	/*
+	 * In snapshot mode we simply increment the head by the number of byte
+	 * that were written.  User space will figure out how many bytes to get
+	 * from the AUX buffer based on the position of the head.
+	 */
+	if (etr_perf->snapshot)
+		handle->head += size;
+
+	/*
+	 * Ensure that the AUX trace data is visible before the aux_head
+	 * is updated via perf_aux_output_end(), as expected by the
+	 * perf ring buffer.
+	 */
+	smp_wmb();
+
+	/*
+	 * If the event is active, it is triggered during an AUX pause.
+	 * Re-enable the sink so that it is ready when AUX resume is invoked.
+	 */
+	if (!event->hw.state)
+		__tmc_etr_enable_hw(drvdata);
+
+	/* Reset the ETR buf used by hardware */
+	if (event->hw.state == PERF_HES_STOPPED)
+		drvdata->etr_buf = NULL;
+
+	/* set the GTRACE_FORMAT_CORESIGHT flag */
+	perf_aux_output_flag(handle, PERF_AUX_FLAG_GTRACE_FORMAT_CORESIGHT);
+out:
+	/*
+	 * Don't set the TRUNCATED flag in snapshot mode because 1) the
+	 * captured buffer is expected to be truncated and 2) a full buffer
+	 * prevents the event from being re-enabled by the perf core,
+	 * resulting in stale data being send to user space.
+	 */
+	if (!etr_perf->snapshot && lost)
+		perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
+	return size;
+}
+
+int tmc_enable_etr_sink(struct gtrace_component *comp)
+{
+	struct tmc_drvdata *drvdata = dev_get_drvdata(comp->dev.parent);
+	struct etr_buf *etr_buf;
+	int ret;
+
+	etr_buf = tmc_etr_get_buffer(comp);
+	if (IS_ERR(etr_buf))
+		return PTR_ERR(etr_buf);
+
+	ret = tmc_etr_enable_hw(drvdata, etr_buf);
+	if (!ret)
+		dev_dbg(&comp->dev, "TMC-ETR enabled\n");
+
+	return ret;
+}
+
+int tmc_disable_etr_sink(struct gtrace_component *comp)
+{
+	struct tmc_drvdata *drvdata = dev_get_drvdata(comp->dev.parent);
+
+	if (drvdata->reading)
+		return -EBUSY;
+
+	tmc_etr_disable_hw(drvdata);
+
+	dev_dbg(&comp->dev, "TMC-ETR disabled\n");
+	return 0;
+}
+
+int tmc_panic_sync_etr(struct gtrace_component *comp)
+{
+	u32 val;
+	struct tmc_crash_metadata *mdata;
+	struct tmc_drvdata *drvdata = dev_get_drvdata(comp->dev.parent);
+
+	mdata = (struct tmc_crash_metadata *)drvdata->crash_mdata.vaddr;
+
+	if (!drvdata->etr_buf)
+		return 0;
+
+	/* Being in RESRV mode implies valid reserved memory as well */
+	if (drvdata->etr_buf->mode != ETR_MODE_RESRV)
+		return 0;
+
+	if (!tmc_has_crash_mdata_buffer(drvdata))
+		return 0;
+
+	CS_UNLOCK(drvdata->base);
+
+	/* Proceed only if ETR is enabled */
+	val = readl(drvdata->base + TMC_CTL);
+	if (!(val & TMC_CTL_CAPT_EN))
+		goto out;
+
+	val = readl(drvdata->base + TMC_FFSR);
+	/* Do manual flush and stop only if its not auto-stopped */
+	if (!(val & TMC_FFSR_FT_STOPPED)) {
+		dev_dbg(&comp->dev,
+			 "%s: Triggering manual flush\n", __func__);
+		tmc_flush_and_stop(drvdata);
+	} else
+		tmc_wait_for_tmcready(drvdata);
+
+	/* Sync registers from hardware to metadata region */
+	mdata->tmc_ram_size = readl(drvdata->base + TMC_RSZ);
+	mdata->tmc_sts = readl(drvdata->base + TMC_STS);
+	mdata->tmc_mode = readl(drvdata->base + TMC_MODE);
+	mdata->tmc_ffcr = readl(drvdata->base + TMC_FFCR);
+	mdata->tmc_ffsr = readl(drvdata->base + TMC_FFSR);
+	mdata->tmc_rrp = tmc_read_rrp(drvdata);
+	mdata->tmc_rwp = tmc_read_rwp(drvdata);
+	mdata->tmc_dba = tmc_read_dba(drvdata);
+	mdata->trace_paddr = drvdata->resrv_buf.paddr;
+	mdata->version = CS_CRASHDATA_VERSION;
+
+	/*
+	 * Make sure all previous writes are ordered,
+	 * before we mark valid
+	 */
+	smp_wmb();
+	mdata->valid = true;
+	/*
+	 * Below order need to maintained, since crc of metadata
+	 * is dependent on first
+	 */
+	mdata->crc32_tdata = find_crash_tracedata_crc(drvdata, mdata);
+	mdata->crc32_mdata = find_crash_metadata_crc(mdata);
+
+	tmc_disable_hw(drvdata);
+
+	dev_dbg(&comp->dev, "%s: success\n", __func__);
+out:
+	CS_UNLOCK(drvdata->base);
+
+	return 0;
+}
+
+int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
+{
+	int ret = 0;
+	unsigned long flags;
+
+	/* config types are set a boot time and never change */
+	if (WARN_ON_ONCE(drvdata->config_type != TMC_CONFIG_TYPE_ETR))
+		return -EINVAL;
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	if (drvdata->reading) {
+		ret = -EBUSY;
+		goto out;
+	}
+
+	/*
+	 * We can safely allow reads even if the ETR is operating in PERF mode,
+	 * since the sysfs session is captured in mode specific data.
+	 * If drvdata::sysfs_data is NULL the trace data has been read already.
+	 */
+	if (!drvdata->sysfs_buf) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	/* Disable the TMC if we are trying to read from a running session. */
+	if (gtrace_get_mode(drvdata->comp) == GTRACE_COMPONENT_MODE_SYSFS)
+		__tmc_etr_disable_hw(drvdata);
+
+	drvdata->reading = true;
+out:
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
+	return ret;
+}
+
+int tmc_read_unprepare_etr(struct tmc_drvdata *drvdata)
+{
+	unsigned long flags;
+	struct etr_buf *sysfs_buf = NULL;
+
+	/* config types are set a boot time and never change */
+	if (WARN_ON_ONCE(drvdata->config_type != TMC_CONFIG_TYPE_ETR))
+		return -EINVAL;
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+
+	/* RE-enable the TMC if need be */
+	if (gtrace_get_mode(drvdata->comp) == GTRACE_COMPONENT_MODE_SYSFS) {
+		/*
+		 * The trace run will continue with the same allocated trace
+		 * buffer. Since the tracer is still enabled drvdata::buf can't
+		 * be NULL.
+		 */
+		__tmc_etr_enable_hw(drvdata);
+	} else {
+		/*
+		 * The ETR is not tracing and the buffer was just read.
+		 * As such prepare to free the trace buffer.
+		 */
+		sysfs_buf = drvdata->sysfs_buf;
+		drvdata->sysfs_buf = NULL;
+	}
+
+	drvdata->reading = false;
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
+	/* Free allocated memory out side of the spinlock */
+	if (sysfs_buf)
+		tmc_etr_free_sysfs_buf(sysfs_buf);
+
+	return 0;
+}
+
+static const char *const buf_modes_str[] = {
+	[ETR_MODE_FLAT]		= "flat",
+	[ETR_MODE_ETR_SG]	= "tmc-sg",
+	[ETR_MODE_CATU]		= "catu",
+	[ETR_MODE_RESRV]	= "resrv",
+	[ETR_MODE_AUTO]		= "auto",
+};
+
+static ssize_t buf_modes_available_show(struct device *dev,
+					    struct device_attribute *attr, char *buf)
+{
+	struct etr_buf_hw buf_hw;
+	ssize_t size = 0;
+
+	get_etr_buf_hw(dev, &buf_hw);
+	size += sysfs_emit(buf, "%s ", buf_modes_str[ETR_MODE_AUTO]);
+	size += sysfs_emit_at(buf, size, "%s ", buf_modes_str[ETR_MODE_FLAT]);
+	if (buf_hw.has_etr_sg)
+		size += sysfs_emit_at(buf, size, "%s ", buf_modes_str[ETR_MODE_ETR_SG]);
+
+	if (buf_hw.has_catu)
+		size += sysfs_emit_at(buf, size, "%s ", buf_modes_str[ETR_MODE_CATU]);
+
+	if (buf_hw.has_resrv)
+		size += sysfs_emit_at(buf, size, "%s ", buf_modes_str[ETR_MODE_RESRV]);
+
+	size += sysfs_emit_at(buf, size, "\n");
+	return size;
+}
+static DEVICE_ATTR_RO(buf_modes_available);
+
+static ssize_t buf_mode_preferred_show(struct device *dev,
+					 struct device_attribute *attr, char *buf)
+{
+	struct tmc_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	return sysfs_emit(buf, "%s\n", buf_modes_str[drvdata->etr_mode]);
+}
+
+static int buf_mode_set_resrv(struct tmc_drvdata *drvdata)
+{
+	int err = -EBUSY;
+	unsigned long flags;
+	struct tmc_resrv_buf *rbuf;
+
+	rbuf = &drvdata->resrv_buf;
+
+	/* Ensure there are no active crashdata read sessions */
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	if (!rbuf->reading) {
+		tmc_crashdata_set_invalid(drvdata);
+		rbuf->len = 0;
+		drvdata->etr_mode = ETR_MODE_RESRV;
+		err = 0;
+	}
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+	return err;
+}
+
+static ssize_t buf_mode_preferred_store(struct device *dev,
+					  struct device_attribute *attr,
+					  const char *buf, size_t size)
+{
+	struct tmc_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct etr_buf_hw buf_hw;
+
+	get_etr_buf_hw(dev, &buf_hw);
+	if (sysfs_streq(buf, buf_modes_str[ETR_MODE_FLAT]))
+		drvdata->etr_mode = ETR_MODE_FLAT;
+	else if (sysfs_streq(buf, buf_modes_str[ETR_MODE_ETR_SG]) && buf_hw.has_etr_sg)
+		drvdata->etr_mode = ETR_MODE_ETR_SG;
+	else if (sysfs_streq(buf, buf_modes_str[ETR_MODE_CATU]) && buf_hw.has_catu)
+		drvdata->etr_mode = ETR_MODE_CATU;
+	else if (sysfs_streq(buf, buf_modes_str[ETR_MODE_RESRV]) && buf_hw.has_resrv)
+		return buf_mode_set_resrv(drvdata) ? : size;
+	else if (sysfs_streq(buf, buf_modes_str[ETR_MODE_AUTO]))
+		drvdata->etr_mode = ETR_MODE_AUTO;
+	else
+		return -EINVAL;
+	return size;
+}
+static DEVICE_ATTR_RW(buf_mode_preferred);
+
+static struct attribute *coresight_etr_attrs[] = {
+	&dev_attr_buf_modes_available.attr,
+	&dev_attr_buf_mode_preferred.attr,
+	NULL,
+};
+
+const struct attribute_group coresight_etr_group = {
+	.attrs = coresight_etr_attrs,
+};
diff --git a/drivers/hwtracing/gtrace/coresight-tmc.h b/drivers/hwtracing/gtrace/coresight-tmc.h
new file mode 100644
index 000000000000..78281e04f243
--- /dev/null
+++ b/drivers/hwtracing/gtrace/coresight-tmc.h
@@ -0,0 +1,469 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright(C) 2015 Linaro Limited. All rights reserved.
+ * Author: Mathieu Poirier <mathieu.poirier@linaro.org>
+ * Derived from drivers/hwtracing/coresight/coresight-tmc.h
+ */
+
+#ifndef _CORESIGHT_TMC_H
+#define _CORESIGHT_TMC_H
+
+#include <linux/dma-mapping.h>
+#include <linux/idr.h>
+#include <linux/miscdevice.h>
+#include <linux/mutex.h>
+#include <linux/refcount.h>
+#include <linux/crc32.h>
+
+#define TMC_RSZ			0x004
+#define TMC_STS			0x00c
+#define TMC_RRD			0x010
+#define TMC_RRP			0x014
+#define TMC_RWP			0x018
+#define TMC_TRG			0x01c
+#define TMC_CTL			0x020
+#define TMC_RWD			0x024
+#define TMC_MODE		0x028
+#define TMC_LBUFLEVEL		0x02c
+#define TMC_CBUFLEVEL		0x030
+#define TMC_BUFWM		0x034
+#define TMC_RRPHI		0x038
+#define TMC_RWPHI		0x03c
+#define TMC_AXICTL		0x110
+#define TMC_DBALO		0x118
+#define TMC_DBAHI		0x11c
+#define TMC_FFSR		0x300
+#define TMC_FFCR		0x304
+#define TMC_PSCR		0x308
+#define TMC_ITMISCOP0		0xee0
+#define TMC_ITTRFLIN		0xee8
+#define TMC_ITATBDATA0		0xeec
+#define TMC_ITATBCTR2		0xef0
+#define TMC_ITATBCTR1		0xef4
+#define TMC_ITATBCTR0		0xef8
+#define TMC_AUTHSTATUS		0xfb8
+
+/* register description */
+/* TMC_CTL - 0x020 */
+#define TMC_CTL_CAPT_EN		BIT(0)
+/* TMC_STS - 0x00C */
+#define TMC_STS_TMCREADY_BIT	2
+#define TMC_STS_FULL		BIT(0)
+#define TMC_STS_TRIGGERED	BIT(1)
+#define TMC_STS_MEMERR		BIT(5)
+/*
+ * TMC_AXICTL - 0x110
+ *
+ * TMC AXICTL format for SoC-400
+ *	Bits [0-1]	: ProtCtrlBit0-1
+ *	Bits [2-5]	: CacheCtrlBits 0-3 (AXCACHE)
+ *	Bit  6		: Reserved
+ *	Bit  7		: ScatterGatherMode
+ *	Bits [8-11]	: WrBurstLen
+ *	Bits [12-31]	: Reserved.
+ * TMC AXICTL format for SoC-600, as above except:
+ *	Bits [2-5]	: AXI WCACHE
+ *	Bits [16-19]	: AXI RCACHE
+ *	Bits [20-31]	: Reserved
+ */
+#define TMC_AXICTL_CLEAR_MASK 0xfbf
+#define TMC_AXICTL_ARCACHE_MASK (0xf << 16)
+
+#define TMC_AXICTL_PROT_CTL_B0	BIT(0)
+#define TMC_AXICTL_PROT_CTL_B1	BIT(1)
+#define TMC_AXICTL_SCT_GAT_MODE	BIT(7)
+#define TMC_AXICTL_WR_BURST(v)	(((v) & 0xf) << 8)
+#define TMC_AXICTL_WR_BURST_16	0xf
+/* Write-back Read and Write-allocate */
+#define TMC_AXICTL_AXCACHE_OS	(0xf << 2)
+#define TMC_AXICTL_ARCACHE_OS	(0xf << 16)
+
+/* TMC_FFSR - 0x300 */
+#define TMC_FFSR_FT_STOPPED	BIT(1)
+
+/* TMC_FFCR - 0x304 */
+#define TMC_FFCR_FLUSHMAN_BIT	6
+#define TMC_FFCR_EN_FMT		BIT(0)
+#define TMC_FFCR_EN_TI		BIT(1)
+#define TMC_FFCR_FON_FLIN	BIT(4)
+#define TMC_FFCR_FON_TRIG_EVT	BIT(5)
+#define TMC_FFCR_TRIGON_TRIGIN	BIT(8)
+#define TMC_FFCR_STOP_ON_FLUSH	BIT(12)
+
+
+#define TMC_DEVID_NOSCAT	BIT(24)
+
+#define TMC_DEVID_AXIAW_VALID	BIT(16)
+#define TMC_DEVID_AXIAW_SHIFT	17
+#define TMC_DEVID_AXIAW_MASK	0x7f
+
+#define TMC_AUTH_NSID_MASK	GENMASK(1, 0)
+
+/* Major version 1 Minor version 0 */
+#define CS_CRASHDATA_VERSION	(1 << 16)
+
+enum tmc_config_type {
+	TMC_CONFIG_TYPE_ETB,
+	TMC_CONFIG_TYPE_ETR,
+	TMC_CONFIG_TYPE_ETF,
+};
+
+enum tmc_mode {
+	TMC_MODE_CIRCULAR_BUFFER,
+	TMC_MODE_SOFTWARE_FIFO,
+	TMC_MODE_HARDWARE_FIFO,
+};
+
+enum tmc_mem_intf_width {
+	TMC_MEM_INTF_WIDTH_32BITS	= 1,
+	TMC_MEM_INTF_WIDTH_64BITS	= 2,
+	TMC_MEM_INTF_WIDTH_128BITS	= 4,
+	TMC_MEM_INTF_WIDTH_256BITS	= 8,
+};
+
+/* TMC ETR Capability bit definitions */
+#define TMC_ETR_SG			(0x1U << 0)
+/* ETR has separate read/write cache encodings */
+#define TMC_ETR_AXI_ARCACHE		(0x1U << 1)
+/*
+ * TMC_ETR_SAVE_RESTORE - Values of RRP/RWP/STS.Full are
+ * retained when TMC leaves Disabled state, allowing us to continue
+ * the tracing from a point where we stopped. This also implies that
+ * the RRP/RWP/STS.Full should always be programmed to the correct
+ * value. Unfortunately this is not advertised by the hardware,
+ * so we have to rely on PID of the IP to detect the functionality.
+ */
+#define TMC_ETR_SAVE_RESTORE		(0x1U << 2)
+
+/* Coresight SoC-600 TMC-ETR unadvertised capabilities */
+#define CORESIGHT_SOC_600_ETR_CAPS	\
+	(TMC_ETR_SAVE_RESTORE | TMC_ETR_AXI_ARCACHE)
+
+/* TMC metadata region for ETR and ETF configurations */
+struct tmc_crash_metadata {
+	uint32_t crc32_mdata;	/* crc of metadata */
+	uint32_t crc32_tdata;	/* crc of tracedata */
+	uint32_t version;	/* 31:16 Major version, 15:0 Minor version */
+	uint32_t valid;         /* Indicate if this ETF/ETR was enabled */
+	uint32_t tmc_ram_size;  /* Ram Size register */
+	uint32_t tmc_sts;       /* Status register */
+	uint32_t tmc_mode;	/* Mode register */
+	uint32_t tmc_ffcr;	/* Formatter and flush control register */
+	uint32_t tmc_ffsr;	/* Formatter and flush status register */
+	uint32_t reserved32;
+	uint64_t tmc_rrp;       /* Ram Read pointer register */
+	uint64_t tmc_rwp;       /* Ram Write pointer register */
+	uint64_t tmc_dba;	/* Data buffer address register */
+	uint64_t trace_paddr;	/* Phys address of trace buffer */
+	uint64_t reserved64[3];
+};
+
+enum etr_mode {
+	ETR_MODE_FLAT,		/* Uses contiguous flat buffer */
+	ETR_MODE_ETR_SG,	/* Uses in-built TMC ETR SG mechanism */
+	ETR_MODE_CATU,		/* Use SG mechanism in CATU */
+	ETR_MODE_RESRV,		/* Use reserved region contiguous buffer */
+	ETR_MODE_AUTO,		/* Use the default mechanism */
+};
+
+struct tmc_drvdata;
+struct etr_buf_operations;
+
+/**
+ * struct etr_buf - Details of the buffer used by ETR
+ * drvdata	; The ETR drvdaga this buffer has been allocated for.
+ * @pid		; The PID of the session owner that etr_buf belongs to.
+ * refcount	; Number of sources currently using this etr_buf.
+ * @mode	: Mode of the ETR buffer, contiguous, Scatter Gather etc.
+ * @full	: Trace data overflow
+ * @size	: Size of the buffer.
+ * @hwaddr	: Address to be programmed in the TMC:DBA{LO,HI}
+ * @offset	: Offset of the trace data in the buffer for consumption.
+ * @len		: Available trace data @buf (may round up to the beginning).
+ * @ops		: ETR buffer operations for the mode.
+ * @private	: Backend specific information for the buf
+ */
+struct etr_buf {
+	struct tmc_drvdata		*drvdata;
+	pid_t				pid;
+	refcount_t			refcount;
+	enum etr_mode			mode;
+	bool				full;
+	ssize_t				size;
+	dma_addr_t			hwaddr;
+	unsigned long			offset;
+	s64				len;
+	const struct etr_buf_operations	*ops;
+	void				*private;
+};
+
+/**
+ * @paddr	: Start address of reserved memory region.
+ * @vaddr	: Corresponding CPU virtual address.
+ * @size	: Size of reserved memory region.
+ * @offset	: Offset of the trace data in the buffer for consumption.
+ * @reading	: Flag to indicate if reading is active
+ * @len	: Available trace data @buf (may round up to the beginning).
+ */
+struct tmc_resrv_buf {
+	phys_addr_t     paddr;
+	void		*vaddr;
+	size_t		size;
+	unsigned long	offset;
+	bool		reading;
+	s64		len;
+};
+
+/**
+ * struct tmc_drvdata - specifics associated to an TMC component
+ * @atclk:	optional clock for the core parts of the TMC.
+ * @pclk:	APB clock if present, otherwise NULL
+ * @base:	memory mapped base address for this component.
+ * @comp:	component vitals needed by the framework.
+ * @miscdev:	specifics to handle "/dev/xyz.tmc" entry.
+ * @crashdev:	specifics to handle "/dev/crash_tmc_xyz" entry for reading
+ *		crash tracedata.
+ * @spinlock:	only one at a time pls.
+ * @reading:	buffer's in the reading through "/dev/xyz.tmc" entry
+ * @stop_on_flush: Stop on flush trigger user configuration.
+ * @is_sink:	True if the ETF is configured as a sink.
+ * @buf:	Snapshot of the trace data for ETF/ETB.
+ * @etr_buf:	details of buffer used in TMC-ETR
+ * @len:	size of the available trace for ETF/ETB.
+ * @size:	trace buffer size for this TMC (common for all modes).
+ * @max_burst_size: The maximum burst size that can be initiated by
+ *		TMC-ETR on AXI bus.
+ * @config_type: TMC variant, must be of type @tmc_config_type.
+ * @memwidth:	width of the memory interface databus, in bytes.
+ * @trigger_cntr: amount of words to store after a trigger.
+ * @etr_caps:	Bitmask of capabilities of the TMC ETR, inferred from the
+ *		device configuration register (DEVID)
+ * @etr_mode:	User preferred mode of the ETR device, default auto mode.
+ * @idr:	Holds etr_bufs allocated for this ETR.
+ * @idr_mutex:	Access serialisation for idr.
+ * @sysfs_buf:	SYSFS buffer for ETR.
+ * @perf_buf:	PERF buffer for ETR.
+ * @resrv_buf:  Used by ETR as hardware trace buffer and for trace data
+ *		retention (after crash) only when ETR_MODE_RESRV buffer
+ *		mode is enabled. Used by ETF for trace data retention
+ *		(after crash) by default.
+ * @crash_mdata: Reserved memory for storing tmc crash metadata.
+ *		 Used by ETR/ETF.
+ */
+struct tmc_drvdata {
+	struct clk		*atclk;
+	struct clk		*pclk;
+	void __iomem		*base;
+	struct gtrace_component	*comp;
+	struct miscdevice	miscdev;
+	struct miscdevice	crashdev;
+	raw_spinlock_t		spinlock;
+	bool			reading;
+	bool			stop_on_flush;
+	bool			is_sink;
+	union {
+		char		*buf;		/* TMC ETB */
+		struct etr_buf	*etr_buf;	/* TMC ETR */
+	};
+	u32			len;
+	u32			size;
+	u32			max_burst_size;
+	enum tmc_config_type	config_type;
+	enum tmc_mem_intf_width	memwidth;
+	u32			trigger_cntr;
+	u32			etr_caps;
+	enum etr_mode		etr_mode;
+	struct idr		idr;
+	struct mutex		idr_mutex;
+	struct etr_buf		*sysfs_buf;
+	struct etr_buf		*perf_buf;
+	struct tmc_resrv_buf	resrv_buf;
+	struct tmc_resrv_buf	crash_mdata;
+};
+
+struct etr_buf_operations {
+	int (*alloc)(struct tmc_drvdata *drvdata, struct etr_buf *etr_buf,
+		     int node, void **pages);
+	void (*sync)(struct etr_buf *etr_buf, u64 rrp, u64 rwp);
+	ssize_t (*get_data)(struct etr_buf *etr_buf, u64 offset, size_t len,
+			    char **bufpp);
+	void (*free)(struct etr_buf *etr_buf);
+};
+
+/**
+ * struct tmc_pages - Collection of pages used for SG.
+ * @nr_pages:		Number of pages in the list.
+ * @daddrs:		Array of DMA'able page address.
+ * @pages:		Array pages for the buffer.
+ */
+struct tmc_pages {
+	int nr_pages;
+	dma_addr_t	*daddrs;
+	struct page	**pages;
+};
+
+/*
+ * struct tmc_sg_table - Generic SG table for TMC
+ * @dev:		Device for DMA allocations
+ * @table_vaddr:	Contiguous Virtual address for PageTable
+ * @data_vaddr:		Contiguous Virtual address for Data Buffer
+ * @table_daddr:	DMA address of the PageTable base
+ * @node:		Node for Page allocations
+ * @table_pages:	List of pages & dma address for Table
+ * @data_pages:		List of pages & dma address for Data
+ */
+struct tmc_sg_table {
+	struct device *dev;
+	void *table_vaddr;
+	void *data_vaddr;
+	dma_addr_t table_daddr;
+	int node;
+	struct tmc_pages table_pages;
+	struct tmc_pages data_pages;
+};
+
+/* Generic functions */
+int tmc_wait_for_tmcready(struct tmc_drvdata *drvdata);
+void tmc_flush_and_stop(struct tmc_drvdata *drvdata);
+void tmc_enable_hw(struct tmc_drvdata *drvdata);
+void tmc_disable_hw(struct tmc_drvdata *drvdata);
+u32 tmc_get_memwidth_mask(struct tmc_drvdata *drvdata);
+int tmc_read_prepare_crashdata(struct tmc_drvdata *drvdata);
+
+/* ETB/ETF functions */
+int tmc_read_prepare_etb(struct tmc_drvdata *drvdata);
+int tmc_read_unprepare_etb(struct tmc_drvdata *drvdata);
+int tmc_etf_setup_sysfs_buf(struct gtrace_component *comp);
+unsigned long tmc_update_etf_buffer(struct gtrace_component *comp,
+				    struct perf_output_handle *handle,
+				    struct gtrace_perf_auxbuf *buf);
+int tmc_enable_etf(struct gtrace_component *comp);
+int tmc_disable_etf(struct gtrace_component *comp);
+int tmc_panic_sync_etf(struct gtrace_component *comp);
+
+ssize_t tmc_etb_get_sysfs_trace(struct tmc_drvdata *drvdata,
+				loff_t pos, size_t len, char **bufpp);
+/* ETR functions */
+int tmc_read_prepare_etr(struct tmc_drvdata *drvdata);
+int tmc_read_unprepare_etr(struct tmc_drvdata *drvdata);
+void tmc_etr_disable_hw(struct tmc_drvdata *drvdata);
+int tmc_etr_setup_sysfs_buf(struct gtrace_component *comp);
+void *tmc_alloc_etr_buffer(struct gtrace_component *comp,
+			   struct perf_event *event, void **pages,
+			   int nr_pages, bool snapshot);
+void tmc_free_etr_buffer(void *config);
+unsigned long
+tmc_update_etr_buffer(struct gtrace_component *comp,
+		      struct perf_output_handle *handle,
+		      struct gtrace_perf_auxbuf *buf);
+int tmc_enable_etr_sink(struct gtrace_component *comp);
+int tmc_disable_etr_sink(struct gtrace_component *comp);
+int tmc_panic_sync_etr(struct gtrace_component *comp);
+ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
+				loff_t pos, size_t len, char **bufpp);
+
+
+#define TMC_REG_PAIR(name, lo_off, hi_off)				\
+static inline u64							\
+tmc_read_##name(struct tmc_drvdata *drvdata)				\
+{									\
+	return gtrace_relaxed_read_pair(drvdata->comp->pdata, lo_off, hi_off); \
+}									\
+static inline void							\
+tmc_write_##name(struct tmc_drvdata *drvdata, u64 val)			\
+{									\
+	gtrace_relaxed_write_pair(drvdata->comp->pdata, val, lo_off, hi_off); \
+}
+
+TMC_REG_PAIR(rrp, TMC_RRP, TMC_RRPHI)
+TMC_REG_PAIR(rwp, TMC_RWP, TMC_RWPHI)
+TMC_REG_PAIR(dba, TMC_DBALO, TMC_DBAHI)
+
+/* Initialise the caps from unadvertised static capabilities of the device */
+static inline void tmc_etr_init_caps(struct tmc_drvdata *drvdata, u32 dev_caps)
+{
+	WARN_ON(drvdata->etr_caps);
+	drvdata->etr_caps = dev_caps;
+}
+
+static inline void tmc_etr_set_cap(struct tmc_drvdata *drvdata, u32 cap)
+{
+	drvdata->etr_caps |= cap;
+}
+
+static inline bool tmc_etr_has_cap(struct tmc_drvdata *drvdata, u32 cap)
+{
+	return !!(drvdata->etr_caps & cap);
+}
+
+struct tmc_sg_table *tmc_alloc_sg_table(struct device *dev,
+					int node,
+					int nr_tpages,
+					int nr_dpages,
+					void **pages);
+void tmc_free_sg_table(struct tmc_sg_table *sg_table);
+void tmc_sg_table_sync_table(struct tmc_sg_table *sg_table);
+void tmc_sg_table_sync_data_range(struct tmc_sg_table *table,
+				  u64 offset, u64 size);
+ssize_t tmc_sg_table_get_data(struct tmc_sg_table *sg_table,
+			      u64 offset, size_t len, char **bufpp);
+
+static inline unsigned long
+tmc_sg_table_buf_size(struct tmc_sg_table *sg_table)
+{
+	return (unsigned long)sg_table->data_pages.nr_pages << PAGE_SHIFT;
+}
+
+static inline bool tmc_has_reserved_buffer(struct tmc_drvdata *drvdata)
+{
+	if (drvdata->resrv_buf.vaddr &&
+	    drvdata->resrv_buf.size)
+		return true;
+	return false;
+}
+
+static inline bool tmc_has_crash_mdata_buffer(struct tmc_drvdata *drvdata)
+{
+	if (drvdata->crash_mdata.vaddr &&
+	    drvdata->crash_mdata.size)
+		return true;
+	return false;
+}
+
+static inline void tmc_crashdata_set_invalid(struct tmc_drvdata *drvdata)
+{
+	struct tmc_crash_metadata *mdata;
+
+	mdata = (struct tmc_crash_metadata *)drvdata->crash_mdata.vaddr;
+
+	if (tmc_has_crash_mdata_buffer(drvdata))
+		mdata->valid = false;
+}
+
+static inline uint32_t find_crash_metadata_crc(struct tmc_crash_metadata *md)
+{
+	unsigned long crc_size;
+
+	crc_size = sizeof(struct tmc_crash_metadata) -
+		offsetof(struct tmc_crash_metadata, crc32_tdata);
+	return crc32_le(0, (void *)&md->crc32_tdata, crc_size);
+}
+
+static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
+						struct tmc_crash_metadata *md)
+{
+	unsigned long crc_size;
+
+	/* Take CRC of configured buffer size to keep it simple */
+	crc_size = md->tmc_ram_size << 2;
+	return crc32_le(0, (void *)drvdata->resrv_buf.vaddr, crc_size);
+}
+
+struct gtrace_component *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
+
+void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
+void tmc_etr_remove_catu_ops(void);
+struct etr_buf *tmc_etr_get_buffer(struct gtrace_component *comp);
+extern const struct attribute_group coresight_etr_group;
+
+#endif
-- 
2.34.1

