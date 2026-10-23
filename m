Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725372;
	b=tRFaVPD0hNPE9pAq45/Hobl+a+gxXkc0QY1eU1H6O7swrjlmVEmFRiKxjqyEMROM4zXq
	 ttTFyD0VPDP85pMAQaRm0aWNI9A9+Crrc0LnPWDZRUX2J3Rw4sGox+0IxfQ4pMI8BIUjH
	 wsz1oBuYg7XH/Wwf1+JJQ2ziX0GOQagzt/uvkW2LwEnDr6VjprYVnnMbbjSb+J0yXgLvj
	 +ywslSntmJt2cMh57T02a1JIGZpki61NBwKv1d6FhVNvhJRkPYk/XJKAwWZ6TEEOAZIGg
	 W3PAAsSnfYYHjhZ2dOI+W0FUBJMULgzMUP88498zFP6tD2bC+X38BOyCAnf/P18f0ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725372;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=oZ3dwcZhMUF8cd3C/+STHOota9SSEAdXyuE/D3PhF9Y=;
	b=NnoWQ+FIX1uM2P44OMsYH344kbN3j5HzvrNA766hWt7xA6uXoLQRi250/9AtgRTp4M5P
	 sT96BHdn78S4DkdP3QBA1RjrkqMdoE0CFa4o/PHzVT2iBCeY7kWI3ApWkTrfqPLAlGblI
	 YBssin1ImkeeNIkHuFytuou3ciBMkML6NMgjO8jHoifCoP/EshjHR9gtCuPwzAwucJoYx
	 tp4p4sIBvMB6sctsS0ocv7fMwwLibev1k7IPtvFnEQTFBPi/bBBv3G+YgwoNQnXmRai1E
	 3bI+DqXL2GPhBc7G/Ch1OTZ4CII1Hdf6oENXVMY7x7cgqfDh5ta6S555t8NXY+tIVCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=pYLNT6id;
	arc=none smtp.remote-ip=54.254.200.128
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0B2606A326
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A0B2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=pYLNT6id
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725350;
	bh=oZ3dwcZhMUF8cd3C/+STHOota9SSEAdXyuE/D3PhF9Y=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=pYLNT6id17lXXArqoqQWczlXCvGlrT3zpOyP+CLYzYXFuXCMqjvWiI23Pv/ANzIqJ
	 Z9cVmn6fMf2N6vOF+vZSycaeRLdpHVkxoxVa/CYxTr4dfcaMnYozagG0r+/zzNuomQ
	 mcDlUjEMnrrTQgTMnGt9aDK5xCzkyefo9XZd8sDA=
X-QQ-mid: esmtpsz11t1792725344tb88ffc15
X-QQ-Originating-IP: /x+brBj2aJ9X8jERn5FG65pPzVut3TgkYs594RU+spo=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:15:41 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5361625773672999170
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
Subject: [PATCH 09/24] gtrace: Add port-level start/stop driver callbacks
Date: Fri, 23 Oct 2026 11:14:50 +0800
Message-Id: <20261023031505.2020925-10-liangzhen@linux.spacemit.com>
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
X-QQ-XMAILINFO: NMguc1TmhkUhuA4s9O20oNGcCngL1lqvpgaBhwSA/7Tww5RwCQO4+NP7
	yee8ef8SkReNLzDIZQf/ES5s6wD/AIgFNoFDmYMqxDr05y+t+PI29ziWiDVI1frQDgRwqB0
	tjGU1js7zd4XZ4L4/mAn1ekTGFVv++s3g9yVVrWfH0ObCey5z2l8qwukTMk7Agchlb3UZOs
	M5EAoWKx6jnvCSbOMuxwecLQUcKy5aYLeY3D/1EvOn07iskIGuh1HzzYHzMezT/b10DjchK
	mnFEm8urA4GK33ywpWB879GoVUTDAgyASWxNbIJZssU7dA0H7tYKjkQfM1jFeZ/pLzOVRv4
	l0FnuQQ4+KZRvOb3IH1ptehMN+2aLBsJLF9pt6NsKmvVgRF2HopNKru/vPkz+Ig/4SNMTSf
	InKymtlWj0R0Df1vbXMWFKTTts/3ia4Idxw4Oi+ZDnwTOJm9GDN/Q46sDL/p7Dhko53vSyr
	/SbUUMXqyanuQkthk5iZYEg87ml+BxGF2onjzaMM56wNAhnYmvMZlqsHe7Fv4UIG8NAiHRu
	tzpEeNw1AL1gQrkODT07825eQPQlnfqblGHPxUVSsiV4z2PTPvPf+xFZCAHqIPqgWo9Oll7
	y1Xcbg9jJ0VkuzaY9741MidFIQSKpoGwR5HbkIntP5EVtr6ZtiEK9uUPyiFIKPHzy55VxoW
	/wvXpRhimhZ0MXbeX7y8SuhT65aoObhFEz88PpHEm2xp33RBMRgfylLDynA6+Wq6aFG2JiJ
	F++x6fHhp2pOYrukEk/wfwQehKkc3TCZkxM/LTjcS9toq9/ty6Ppc9mljwkM9UPIc94pOq8
	hxBKU5uO9BeJy2+mbs/qh6k63LyYh/aaxJNBSrLpIEk+Hyqyk8nqhxZOyHWyr8zfm56deqa
	HTKaDPZayJAGd5tSjtSLgOJ+gRkLhXH/djB1890Ha7U7SFNHGOiCZ1dLOx/s/UFZTM5+Yuy
	2uZAB8P9hP4tKvQPJ4mwz7IyVk/7EPg4PbT+Zt27Zu/Rk7F6RyZOUMdprJRmQeN97XqFjOi
	e7BWsKXLpoHHAAoqk2qwzOURaNUenXoPQGfkVkh4PAMVUds4QlA6GMpe3j2UI=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

Add start_port() and stop_port() callbacks to gtrace_driver so
multi-port link components like funnel and replicator can enable a
specific input/output port the first time a path uses it, tracked by
the per-connection src_refcnt/dest_refcnt fields.

Signed-off-by: Zane Leung <liangzhen@linux.spacemit.com>
---
 drivers/hwtracing/gtrace/gtrace-core.c | 66 ++++++++++++++++++++------
 include/linux/gtrace.h                 | 12 +++++
 2 files changed, 64 insertions(+), 14 deletions(-)

diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
index 3f55d8b7302d..231d06218d8e 100644
--- a/drivers/hwtracing/gtrace/gtrace-core.c
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -654,7 +654,9 @@ static void gtrace_release_path_nodes(struct gtrace_path *path)
 }
 
 static int __gtrace_comp_start(struct gtrace_component *comp,
-			       struct gtrace_path *path)
+			       struct gtrace_path *path,
+			       struct gtrace_connection *inconn,
+			       struct gtrace_connection *outconn)
 {
 	struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
 	const struct gtrace_driver *gtdrv = to_gtrace_driver(comp->dev.driver);
@@ -690,6 +692,12 @@ static int __gtrace_comp_start(struct gtrace_component *comp,
 			cpriv->owner = task_pid_nr(path->event->owner);
 	}
 
+	if (gtdrv->start_port) {
+		ret = gtdrv->start_port(comp, inconn, outconn);
+		if (ret)
+			goto out;
+	}
+
 	cpriv->start_count++;
 out:
 	raw_spin_unlock_irqrestore(&cpriv->lock, flags);
@@ -697,7 +705,9 @@ static int __gtrace_comp_start(struct gtrace_component *comp,
 }
 
 static int __gtrace_comp_stop(struct gtrace_component *comp,
-			      struct gtrace_path *path)
+			      struct gtrace_path *path,
+			      struct gtrace_connection *inconn,
+			      struct gtrace_connection *outconn)
 {
 	struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
 	const struct gtrace_driver *gtdrv = to_gtrace_driver(comp->dev.driver);
@@ -715,13 +725,16 @@ static int __gtrace_comp_stop(struct gtrace_component *comp,
 		goto out;
 	}
 
+	if (!gtdrv) {
+		ret = -ENODEV;
+		goto out;
+	}
+
+	if (gtdrv->stop_port)
+		gtdrv->stop_port(comp, inconn, outconn);
+
 	cpriv->start_count--;
 	if (!cpriv->start_count) {
-		if (!gtdrv) {
-			ret = -ENODEV;
-			goto out;
-		}
-
 		if (gtdrv->stop)
 			ret = gtdrv->stop(comp);
 		comp->path = NULL;
@@ -734,19 +747,36 @@ static int __gtrace_comp_stop(struct gtrace_component *comp,
 
 int gtrace_path_start(struct gtrace_path *path)
 {
-	struct gtrace_path_node *node;
+	struct gtrace_path_node *node, *prev;
+	struct gtrace_connection *inconn;
 	int ret = 0;
 
 	list_for_each_entry_reverse(node, &path->comp_list, head) {
-		ret = __gtrace_comp_start(node->comp, path);
+		if (node->comp == gtrace_path_source(path)) {
+			inconn = NULL;
+		} else {
+			prev = list_prev_entry(node, head);
+			inconn = prev->conn;
+		}
+
+		ret = __gtrace_comp_start(node->comp, path, inconn, node->conn);
 		if (ret)
 			break;
 	}
 
 	/* If a component failed to start, stop all the components that were started before it */
-	if (ret)
-		list_for_each_entry_continue(node, &path->comp_list, head)
-			__gtrace_comp_stop(node->comp, path);
+	if (ret) {
+		list_for_each_entry_continue(node, &path->comp_list, head) {
+			if (node->comp == gtrace_path_source(path)) {
+				inconn = NULL;
+			} else {
+				prev = list_prev_entry(node, head);
+				inconn = prev->conn;
+			}
+
+			__gtrace_comp_stop(node->comp, path, inconn, node->conn);
+		}
+	}
 
 	return ret;
 }
@@ -754,11 +784,19 @@ EXPORT_SYMBOL_GPL(gtrace_path_start);
 
 int gtrace_path_stop(struct gtrace_path *path)
 {
-	struct gtrace_path_node *node;
+	struct gtrace_path_node *node, *prev;
+	struct gtrace_connection *inconn;
 	int ret = 0, err;
 
 	list_for_each_entry(node, &path->comp_list, head) {
-		err = __gtrace_comp_stop(node->comp, path);
+		if (node->comp == gtrace_path_source(path)) {
+			inconn = NULL;
+		} else {
+			prev = list_prev_entry(node, head);
+			inconn = prev->conn;
+		}
+
+		err = __gtrace_comp_stop(node->comp, path, inconn, node->conn);
 		if (err && !ret)
 			ret = err;
 	}
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index 4bbe5ac835ec..ee60585ef65c 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -55,9 +55,11 @@ enum gtrace_format {
  * @src_port:    A connection's source port number.
  * @src_fwnode:  Source component's fwnode handle.
  * @src_comp:    Source component's pointer.
+ * @src_refcnt:  Number of paths currently using this connection's source port.
  * @dest_port:   A connection's destination port number.
  * @dest_fwnode: Destination component's fwnode handle.
  * @dest_comp:   Destination component's pointer.
+ * @dest_refcnt: Number of paths currently routing data into the destination port.
  */
 struct gtrace_connection {
 	int src_port;
@@ -66,6 +68,8 @@ struct gtrace_connection {
 	struct fwnode_handle *dest_fwnode;
 	struct gtrace_component *src_comp;
 	struct gtrace_component *dest_comp;
+	u32 src_refcnt;
+	u32 dest_refcnt;
 };
 
 struct gtrace_platform_data;
@@ -363,6 +367,8 @@ int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
  *                 via @format (see PERF_AUX_FLAG_PMU_FORMAT_TYPE_MASK).
  * @start:         Callback to start tracing.
  * @stop:          Callback to stop tracing.
+ * @start_port:    Callback to start a specific component port.
+ * @stop_port:     Callback to stop a specific component port.
  * @probe:         Driver probe() function.
  * @remove:        Driver remove() function.
  * @get_trace_id:  Get/allocate a trace ID.
@@ -376,6 +382,12 @@ struct gtrace_driver {
 						 u64 *format);
 	int			(*start)(struct gtrace_component *comp);
 	int			(*stop)(struct gtrace_component *comp);
+	int			(*start_port)(struct gtrace_component *comp,
+					      struct gtrace_connection *inconn,
+					      struct gtrace_connection *outconn);
+	void			(*stop_port)(struct gtrace_component *comp,
+					     struct gtrace_connection *inconn,
+					     struct gtrace_connection *outconn);
 	int			(*probe)(struct gtrace_component *comp);
 	void			(*remove)(struct gtrace_component *comp);
 	int			(*get_trace_id)(struct gtrace_component *comp,
-- 
2.34.1

