Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725451;
	b=LmulbmimKSHiYjexTguoINoMMdKlS2kiRLD/KjU0Dobt6PjHvycBcaGzUs16C5hSTBJ/
	 39jGfUwofCnb9F8YIyzii+wUbaEuFtreyuO/h1JZCAylOpIy45ykWBaGp8rDkBZCapXKL
	 E/2pOmx2C+3n5DvA4cjipAlXqAqqjfkBwaz81zTr8Ch8iVGTI8nHB5vExcs0hpVbp8FEv
	 IcTIqvY7QGnxJepvO3zxqPhm5u8adExvKXB90/jVwK4G2cZxZ9600roN9s6YnPtnMFbQv
	 zWovGEKm1wMTeIj3xc5b2U8txRiVucd4RTjNc9RxCaXnf4r7t+XoMX2GNNmyln3PEQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725451;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=2vph+OuFIOn3SzY2fv1CwAlrQbisuy00yQG7/Va3ANI=;
	b=Q5tTX3KRiRef4LJeI6pK/7npplhhs4l080R0bb/TnELM/ZLLvrX3pH8XmZis8LNf0lQ3
	 YHVNRN59oFd+nz0wR/9GawtvNuuByTFUUfAlmwUS5ZDQwWsN20R/VJZj6+Q50FL8RRdxd
	 Q15whKW0+ZsoLiwbzA9ZKCUdncbvadAs/Vqs5dl6DuTgMDkFQBr/NUwDT5tt0YTBFa+3z
	 KE9t3Lu6TwymtXDnX0jvOoo6L3m9AVGo7puShog2HB7Ifz7chpETxTtIw0iYXJWoONZNV
	 pM0kBzuERWIl1fwLDmDT7slZ0hhfeUi3L0YxF4X+eoeUnrgIWV+ujdFE/qpN6SouAIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=n00XBkRb;
	arc=none smtp.remote-ip=54.204.34.129
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E5B606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25E5B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=n00XBkRb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725430;
	bh=2vph+OuFIOn3SzY2fv1CwAlrQbisuy00yQG7/Va3ANI=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=n00XBkRbUlvDaygpQNGhwAE1CopwAMyIuvGxVZuWCsb1/YrCP7uQQ2DvjgelAKo76
	 Idx7Dr/c81/wQzqgRvPFCxRF78jUQOZI5llP9Fv1q2G6hoQa2OQw9Ln94OImC/vqmR
	 LRUdHJb7sFJ2VREmb7fEPLB9+pWLihIXEMaf/aGs=
X-QQ-mid: esmtpsz11t1792725378t92e44d2c
X-QQ-Originating-IP: CtAhbqwKALyAvtWqn+oIZw26M4DKpk4Gn127AatmzdM=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:16:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10579745703144097967
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
Subject: [PATCH 18/24] gtrace: Add sink-specific buffer alloc/free callbacks
Date: Fri, 23 Oct 2026 11:14:59 +0800
Message-Id: <20261023031505.2020925-19-liangzhen@linux.spacemit.com>
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
X-QQ-XMAILINFO: McfvTdNTSvcBEXcbJiTXGB8OpqQ5svu/GVOZ1mw7j9heLVOc9CyMaMqA
	PhMYPhRtu03MuOrQyUieL3m7hMiYWOyFwplIA/HpXOP4gjntCWUvgJuvdY2iZtFsDpzVNvQ
	SeGiMZ/jJMUQgL7j7r8P3b2Tk7nC9ci7pF5pSds19115EPcVfwNguHdHQnQGyKigWGi2eAr
	/hw1oQGGxz5f8GSujc5llkJSAaouf1hRLw4dpzLOpPiV10CCgc93lzlM6pUlF604bkxlBkh
	PwhSLMZ8xa1yOBIe+CxefUhLakiYoSYLWG65ZyJKHyITf+VRFjrysqcxG5C8ZNVjxWfGDZu
	s4HsD8rfrcHiueI3SAaX0wKYvaj39f38JS3N5Csy3et1Mx4MwHhnunYpLx8pSu8EZDd65dn
	fSssF8pI4jtKoI+PxizFT4QsHYCvVsC8xOs+IhKbwFcfWxp764QWNp3tCjL7wXK+xZVbjMK
	ezzdoAkB+cbJ1ApSvFQeMlGsgDFfe6wnESvT/XK05CQtkOQv3//b/8kD07jlxFCld7hu6t9
	qJtsQsNSYE8v9M5ooZtZqmx5RM9nglLVhA7SCnB498kxmCCINs9QiQ2JQ1Lv1ar8Ycd8ckg
	YKdSTfA4iKyR7qiuAwZQPdJ+7G+olx2FpwV5EGiK/CvaOiUUOIi3PN3NqAm8F00G8ddQT9C
	jLUl9qbr/5NgixNN1dMTSZg9Xv2+LO5n6k1tzmVnz5Ir7Q2Ll+bgnyYd3+KVKr7Xjwy4WF7
	45UT/AgkRg3LYHhcjCQwZKl8mc1MyF4HspE6Qt+PfdN6h5Oyuhbu6JWWkgtuijsXBmaGglS
	Lt3MGMMMucim7t7HBhUzxwOORb36MWV3X83ZKgAE3otQ0VHtVLowMBdAysrpPDxv1HEirTK
	uVaxMG2lrsoQBOFqmePReI8rWWo2pz1+C7f1XOfT5o35rPjhcGeppNHbDAMrlxp+zZWIYlR
	jCNsp/5Bly9CCbIUmXIgaUN+YG/kai6YsIwGwqrrQtKPj2MhmSKThRMmuZfdiJsRDA0TqoY
	jo0YusNr2PwC7ICet3w5O6XEmhQBiMwzbAD7KzDYfvU9LtMy3CJScW1rKFThJad7tCWES6f
	dXmP7w4Oe4oUhEiSZ8Eyb4=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

Extend gtrace_driver with alloc_buf() and free_buf() so a sink can
allocate its own buffer (e.g. an ETR SG table) during perf setup and
release it when the event data is freed. Store the resulting buffer in
gtrace_perf_auxbuf along with the event pid and snapshot mode.

Signed-off-by: Zane Leung <liangzhen@linux.spacemit.com>
---
 drivers/hwtracing/gtrace/gtrace-perf.c | 34 ++++++++++++++++++++++++++
 include/linux/gtrace.h                 | 12 +++++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/hwtracing/gtrace/gtrace-perf.c b/drivers/hwtracing/gtrace/gtrace-perf.c
index 9b874daa807f..e05a833aa6a4 100644
--- a/drivers/hwtracing/gtrace/gtrace-perf.c
+++ b/drivers/hwtracing/gtrace/gtrace-perf.c
@@ -86,6 +86,27 @@ static struct gtrace_path **gtrace_event_cpu_path_ptr(struct gtrace_event_data *
 	return per_cpu_ptr(data->path, cpu);
 }
 
+static void free_sink_buffer(struct gtrace_event_data *event_data)
+{
+	int cpu;
+	cpumask_t *mask = &event_data->mask;
+	struct gtrace_path *path;
+	struct gtrace_component *sink;
+	struct gtrace_driver *sinkdrv;
+
+	if (!event_data->buf.buf)
+		return;
+
+	if (WARN_ON(cpumask_empty(mask)))
+		return;
+
+	cpu = cpumask_first(mask);
+	path = *gtrace_event_cpu_path_ptr(event_data, cpu);
+	sink = gtrace_path_sink(path);
+	sinkdrv = to_gtrace_driver(sink->dev.driver);
+	sinkdrv->free_buf(event_data->buf.buf);
+}
+
 static void free_event_data(struct work_struct *work)
 {
 	struct gtrace_event_data *event_data;
@@ -95,6 +116,7 @@ static void free_event_data(struct work_struct *work)
 
 	event_data = container_of(work, struct gtrace_event_data, work);
 	mask = &event_data->mask;
+	free_sink_buffer(event_data);
 	for_each_cpu(cpu, mask) {
 		path = *gtrace_event_cpu_path_ptr(event_data, cpu);
 		gtrace_destroy_path(path);
@@ -110,6 +132,7 @@ static void *gtrace_setup_aux(struct perf_event *event, void **pages,
 {
 	struct gtrace_event_data *event_data = NULL;
 	struct gtrace_component *sink = NULL;
+	struct gtrace_driver *sinkdrv = NULL;
 	struct page **pagelist;
 	int cpu = event->cpu, i;
 	cpumask_t *mask;
@@ -175,6 +198,17 @@ static void *gtrace_setup_aux(struct perf_event *event, void **pages,
 	event_data->buf.nr_pages = nr_pages;
 	event_data->buf.length = nr_pages * PAGE_SIZE;
 	event_data->buf.pos = 0;
+	event_data->buf.snapshot = overwrite;
+	event_data->buf.pages = pages;
+
+	sinkdrv = to_gtrace_driver(sink->dev.driver);
+	if (sinkdrv && sinkdrv->alloc_buf) {
+		event_data->buf.buf = sinkdrv->alloc_buf(sink, event, pages,
+							 nr_pages, overwrite);
+		if (!event_data->buf.buf)
+			goto err;
+	}
+
 	return event_data;
 err:
 	gtrace_free_aux(event_data);
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index 39ae13701615..a3d125882ec9 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -355,12 +355,18 @@ int gtrace_path_stop(struct gtrace_path *path);
  * @nr_pages: Number of pages of the AUX buffer.
  * @base:     Start address of AUX buffer.
  * @pos:      Position in the AUX buffer to commit traced data.
+ * @snapshot: Is this run in snapshot mode.
+ * @pages:    a handle to the ring buffer.
+ * @buf:      Optional sink-specific buffer.
  */
 struct gtrace_perf_auxbuf {
 	size_t length;
 	int nr_pages;
 	void *base;
 	long pos;
+	bool snapshot;
+	void **pages;
+	void *buf;
 };
 
 int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
@@ -371,6 +377,8 @@ int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
 /**
  * struct gtrace_driver - Representation of a trace driver.
  * @id_table:      Table to match components handled by the driver.
+ * @alloc_buf:     Callback to alloc sink-specific buffer.
+ * @free_buf:      Callback to free sink-specific buffer.
  * @copyto_auxbuf: Callback to copy data into perf AUX buffer. The driver
  *                 reports the PMU specific trace format of the copied data
  *                 via @handle (see PERF_AUX_FLAG_PMU_FORMAT_TYPE_MASK).
@@ -386,6 +394,10 @@ int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
  */
 struct gtrace_driver {
 	const struct gtrace_component_id *id_table;
+	void			*(*alloc_buf)(struct gtrace_component *comp,
+					     struct perf_event *event, void **pages,
+					     int nr_pages, bool overwrite);
+	void			(*free_buf)(void *buf);
 	size_t			(*copyto_auxbuf)(struct gtrace_component *comp,
 						 struct perf_output_handle *handle,
 						 struct gtrace_perf_auxbuf *buf);
-- 
2.34.1

