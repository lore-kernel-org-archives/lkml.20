Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.59.177.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725444;
	b=UEKzwaKw6qL+qYB7yCEOh2KgDHt+2LD/tcUaEFk42S9JHjY0ELAx5bM74GOlIMeDaXWv
	 eRhYnhFzYK8U4LNyPfX5BAprzI9Uk96zjGbpv+/N/lLuQEZ/64S6oHFJA3pVbHIzZCSLw
	 fuAZtE7/4aOLczPHYYkd8R/xdVN3mn6CVOrNDP4K/Dyie4gjMAVylipxDVL9CH78GQ9bh
	 Mk7rEhoyGY2r64jqA+iXeNkibxCf0BRk4Lq+kTl7jn9pWGWZ3kdrlYwSAXd4dlr/ahf2a
	 +JWkauYtVNuCI3PUQ4kxWTuySsuDXOcK0nEtQeqofya8liG5DuxVptCiMO495m3yZpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725444;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=vWQktdY0FJQ5gIjz1Q30N3BQ8TqP5aQ0k0nFlP9ztcs=;
	b=dhN8o3Qgj9LwdPNd9BMQMZqAF/n9p7pwoYdAnbhvVoBn1NZaLjTv3QLH8RbvCOuKoW7T
	 Ul950mrIUjpXIgRj76afzhS6p9Wix+XkVTtD3TLsMnllkggAkOrZFMefj4DDQwwNEvHel
	 EJPA2+2Vvh2WhHiZny6NVyEfbeDJFX34mxR+Vy1DF27Jclux22/W1zJUIv4ZsAnHjtvDn
	 oS/6TIrOzHO+VjG8MMvhXLmCqnVrzwaRtwZuDeoryNIGxIrzG1ToVNBX9uHKP/0o4tnsR
	 IsPaBWMR6O0kHcgDUTBTvJUPG7KDlJyt/ZSw7hVFPClD/uj4JZgf25OzspqM8iXZ85g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=rYRVP4qu;
	arc=none smtp.remote-ip=52.59.177.22
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46053606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46053606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=rYRVP4qu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725420;
	bh=vWQktdY0FJQ5gIjz1Q30N3BQ8TqP5aQ0k0nFlP9ztcs=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=rYRVP4quJE3P2uRGkPwHjz/RTW3+/xo5s2WSVZIMq6v+NrUJXBqgs4CqA1GDKa7H3
	 a+D9xAVtTCZ1uz/b3PKlp/TtQzk3v7FKoTkuM/EqsUv0sGXzrtH7eyOPxbT7tYB7SO
	 xcxh55ZxKrNOEfzLzuiljQgt4Bt6cZMUZI55G2+4=
X-QQ-mid: esmtpsz11t1792725367t0c5d5bcc
X-QQ-Originating-IP: m8cE/nnKQ7AQSkw7rS498QjHIKtl7CwzZZu0z0jXsao=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:16:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 501167956966261696
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
Subject: [PATCH 15/24] gtrace: Only copy AUX data from the path sink
Date: Fri, 23 Oct 2026 11:14:56 +0800
Message-Id: <20261023031505.2020925-16-liangzhen@linux.spacemit.com>
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
X-QQ-XMAILINFO: NhTe9p7tQP4g8fVX+IpkSR9Me9jTHLd1Sr6v7UKtUTpjDYo3E/qZodCL
	wh85PKn2gjlIUZcHq5JzlRa4qwDZylFaq3iJBSZ70EBeKuWWW9Pji7B3uHzPaSkJMmIqrG7
	91L0SptekZGoTOpMJOYgwninIbRJm2MgKAwEExWsxN5uGt5S0Hux4vv9iUpuKQAmCDCRNXs
	NGakCcJuEBmwLlsZmKJHjQ7lgFuEj29L+k1fWy7Yh9w4YVPEuC9OTyi9rYx1LXC6ypyIz70
	JGz/ws2Ii7Pk46+g7J5JpFiIWQYkjQfJln1Y7XP/mbk0V0qhfDIEvUdlWywBRrjUE5lNv0c
	V4XAV65zOJu+Tq2sfFzTGtuCQS2G/CeKPvIxldn/3eSry+fdpjorBqSzfkhAEG5MKovLeX1
	MRfAm7EXwYZlKnVr1NQPVXE67r7qB6SKpz2Lez8+3uq3lJr4lik0K3P9b6vwLJn4ZAwcLpr
	2gLp6H2WeMtN3meWYCG6fAfobBs43Q6V+dMvEFPxFC0hUYVWpByeS1rrte4HmdPOq2GrGFz
	p8Tt2c/oxu7yDpb94VRJBg/iNE16e6Rm+aZ4nIRKWcMLlDR6O5QUPC920mXEzJ/I/EpK8x+
	hno8VD2KNeBX05Hscl1vyEcUZnyIXQMIPI+G+8qz9MMO+UcuXQUd725D41XOGyYOtQcaTy2
	5OT2z0B/VxXmU+Pawgar//5ww0+/r9iY9KDV8gedydRe6RK46VV1zBi0Y4qIXiqCEmKCAHW
	VUdfSaqli4Y9FFzSEf38yGklMSe6eggbOHGOmU0axu1ojaoNe8QmuYax3ny1mmetK4gIoBL
	/hHY+0Jo9CLs1GaLQvIJbfa5hfPvMsdtVoEnK5O/Wocx16DusN9pvFTzQAZw+YjNw7MhCcl
	3RR3PjiPbXSN8k8G8UfEcMFryCgBKed9yDoqGjbzez0PS3PrFFw14vvZTrf+h8cuBlAZCOj
	Kw4PMv+/mXofuXkonOywodUyM13LAg6YYmyAgJne+++DDWudfIaQX5Fm1Zubs/muuziEuly
	BJbG5aly+fj5HK7Zrsbg4kdhf/c/cKWBDIkZPZK7loOpnfhw39bSDaIFLEDW8o39YyBw0Jr
	6mI422i37TuZ3nor3cRNSxoZf4rVu20bg==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

gtrace_path_copyto_auxbuf() walked the path and copied from the first
component implementing copyto_auxbuf(). For a linksink like ETF used as
a link, this picked the wrong component. Call the sink's callback
directly via gtrace_path_sink() and pass the perf handle so the sink
can set AUX flags itself.

Signed-off-by: Zane Leung <liangzhen@linux.spacemit.com>
---
 drivers/hwtracing/gtrace/gtrace-core.c     | 39 ++++++++++------------
 drivers/hwtracing/gtrace/gtrace-perf.c     | 13 ++------
 drivers/hwtracing/gtrace/rvtrace-ramsink.c | 10 ++++--
 include/linux/gtrace.h                     | 10 +++---
 4 files changed, 34 insertions(+), 38 deletions(-)

diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
index 231d06218d8e..a42b1844da29 100644
--- a/drivers/hwtracing/gtrace/gtrace-core.c
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -806,14 +806,14 @@ int gtrace_path_stop(struct gtrace_path *path)
 EXPORT_SYMBOL_GPL(gtrace_path_stop);
 
 int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
+			      struct perf_output_handle *handle,
 			      struct gtrace_perf_auxbuf *buf,
-			      size_t *bytes_copied, u64 *format)
+			      size_t *bytes_copied)
 {
-	struct gtrace_comp_priv *sink = to_gtrace_comp_priv(gtrace_path_sink(path));
-	const struct gtrace_driver *gtdrv;
-	struct gtrace_component *comp;
-	struct gtrace_path_node *node;
-	int ret = -EOPNOTSUPP;
+	struct gtrace_component *sink = gtrace_path_sink(path);
+	struct gtrace_comp_priv *spriv = to_gtrace_comp_priv(sink);
+	const struct gtrace_driver *sinkdrv = to_gtrace_driver(sink->dev.driver);
+	int ret = 0;
 	unsigned long flags;
 
 	/*
@@ -823,25 +823,20 @@ int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
 	 * sink's lock also stops another path from starting the sink before copy
 	 * completes.
 	 */
-	raw_spin_lock_irqsave(&sink->lock, flags);
-	if (sink->start_count) {
-		*bytes_copied = 0;
-		ret = 0;
-		goto out;
-	}
-
-	list_for_each_entry(node, &path->comp_list, head) {
-		comp = node->comp;
-		gtdrv = to_gtrace_driver(comp->dev.driver);
-		if (!gtdrv || !gtdrv->copyto_auxbuf)
-			continue;
+	raw_spin_lock_irqsave(&spriv->lock, flags);
+	if (!spriv->start_count) {
+		if (!sinkdrv) {
+			ret = -ENODEV;
+			goto out;
+		}
 
-		*bytes_copied = gtdrv->copyto_auxbuf(comp, buf, format);
-		ret = 0;
-		break;
+		if (sinkdrv->copyto_auxbuf) {
+			*bytes_copied = sinkdrv->copyto_auxbuf(sink, handle, buf);
+			ret = 0;
+		}
 	}
 out:
-	raw_spin_unlock_irqrestore(&sink->lock, flags);
+	raw_spin_unlock_irqrestore(&spriv->lock, flags);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(gtrace_path_copyto_auxbuf);
diff --git a/drivers/hwtracing/gtrace/gtrace-perf.c b/drivers/hwtracing/gtrace/gtrace-perf.c
index 604b673a29d5..3c8b620df5a8 100644
--- a/drivers/hwtracing/gtrace/gtrace-perf.c
+++ b/drivers/hwtracing/gtrace/gtrace-perf.c
@@ -243,7 +243,6 @@ static void gtrace_event_stop(struct perf_event *event, int mode)
 {
 	struct gtrace_ctxt *ctxt = this_cpu_ptr(&gtrace_ctxt);
 	struct perf_output_handle *handle = &ctxt->handle;
-	u64 format = PERF_AUX_FLAG_GTRACE_FORMAT_UNKNOWN;
 	struct gtrace_event_data *event_data;
 	int ret, cpu = smp_processor_id();
 	struct gtrace_path *path;
@@ -280,17 +279,11 @@ static void gtrace_event_stop(struct perf_event *event, int mode)
 	if (handle->event && (mode & PERF_EF_UPDATE)) {
 		if (WARN_ON_ONCE(handle->event != event))
 			return;
-		ret = gtrace_path_copyto_auxbuf(path, &event_data->buf, &size, &format);
+		ret = gtrace_path_copyto_auxbuf(path, handle, &event_data->buf, &size);
 		WARN_ON_ONCE(ret);
-		if (READ_ONCE(handle->event)) {
-			/* Tag the AUX data with the source's trace format. */
-			perf_aux_output_flag(handle, format);
-			if (size > handle->size) {
-				size = handle->size;
-				perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
-			}
+		if (READ_ONCE(handle->event))
 			perf_aux_output_end(handle, size);
-		} else
+		else
 			WARN_ON(size);
 	}
 
diff --git a/drivers/hwtracing/gtrace/rvtrace-ramsink.c b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
index 9588c32c5b13..e0826d3f0d60 100644
--- a/drivers/hwtracing/gtrace/rvtrace-ramsink.c
+++ b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
@@ -11,6 +11,7 @@
 #include <linux/minmax.h>
 #include <linux/types.h>
 #include <linux/sizes.h>
+#include <linux/perf_event.h>
 #include <uapi/linux/perf_event.h>
 #include "rvtrace.h"
 
@@ -147,8 +148,8 @@ static void tbuf_to_pbuf_copy(struct trace_buf *src, struct trace_buf *dst, size
 }
 
 static size_t rvtrace_ramsink_copyto_auxbuf(struct gtrace_component *comp,
-					    struct gtrace_perf_auxbuf *buf,
-					    u64 *format)
+					    struct perf_output_handle *handle,
+					    struct gtrace_perf_auxbuf *buf)
 {
 	struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
 	struct trace_buf src, dst;
@@ -181,6 +182,11 @@ static size_t rvtrace_ramsink_copyto_auxbuf(struct gtrace_component *comp,
 		priv->prev_wp = wp;
 	}
 
+	if (bytes > handle->size) {
+		bytes = handle->size;
+		perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
+	}
+
 	tbuf_to_pbuf_copy(&src, &dst, bytes);
 	dev_dbg(&comp->dev, "Copied %zu bytes\n", bytes);
 	return bytes;
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index e9210b0a73b5..39ae13701615 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -13,6 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/types.h>
+#include <linux/perf_event.h>
 
 #define GTRACE_PMU_ATTR_CFG_CONTEXT_SHIFT	1
 #define GTRACE_PMU_ATTR_CFG_SYNCMODE_MASK	GENMASK(3, 2)
@@ -363,15 +364,16 @@ struct gtrace_perf_auxbuf {
 };
 
 int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
+			      struct perf_output_handle *handle,
 			      struct gtrace_perf_auxbuf *buf,
-			      size_t *bytes_copied, u64 *format);
+			      size_t *bytes_copied);
 
 /**
  * struct gtrace_driver - Representation of a trace driver.
  * @id_table:      Table to match components handled by the driver.
  * @copyto_auxbuf: Callback to copy data into perf AUX buffer. The driver
  *                 reports the PMU specific trace format of the copied data
- *                 via @format (see PERF_AUX_FLAG_PMU_FORMAT_TYPE_MASK).
+ *                 via @handle (see PERF_AUX_FLAG_PMU_FORMAT_TYPE_MASK).
  * @start:         Callback to start tracing.
  * @stop:          Callback to stop tracing.
  * @start_port:    Callback to start a specific component port.
@@ -385,8 +387,8 @@ int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
 struct gtrace_driver {
 	const struct gtrace_component_id *id_table;
 	size_t			(*copyto_auxbuf)(struct gtrace_component *comp,
-						 struct gtrace_perf_auxbuf *buf,
-						 u64 *format);
+						 struct perf_output_handle *handle,
+						 struct gtrace_perf_auxbuf *buf);
 	int			(*start)(struct gtrace_component *comp);
 	int			(*stop)(struct gtrace_component *comp);
 	int			(*start_port)(struct gtrace_component *comp,
-- 
2.34.1

