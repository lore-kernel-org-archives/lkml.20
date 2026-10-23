Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=43.155.65.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725500;
	b=HNI3dguam8PzbUPY44fFHJxBI8XbIPUwzMaFZENH+uAyHaPJG+KxxOpk0bx7LA8h5TAA
	 9dOqeGPbXgaScTMk4rQzFsmJd64qY1BXb3hi9jECqJ9YRVRWBjs8HnpixdOGwTdINnD1k
	 19K7btPuOfuQKviXKuigIDMdemfG1+D+asJkP91mAUq71AMM2VTzWfOfXnepAXoRg7X1F
	 WN2ufsv+6ERRCCDDYLC463As468Xhh0BMbq928Ek6aPD1crQoHJ8vYwe0CiArf8FMRCTw
	 69cYU44/7WpH7V75vJT5VIXnwtbkAzjWwlc7Oa0W06oBfaYUx8XHvMrszkhgEsLYKfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725500;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-SPAM:X-QQ-RECHKSPAM;
	bh=x1t2wRyiMsCX+S9SSJc8zl8w/ipVR+PJvncysloZdQU=;
	b=TnJ2zPQ+0MoFhUQ+fCJE9ESZ3W2yyQZg37DG6V40I1XUfkPoRD0/nGjNP5zBoToGH8BD
	 jcoIHlTCBXoeUsF8+HpZW+nwLe561RoAzIkv+nM2H4qFHVapP2pgUZSdEHlyglY5NJtG4
	 QCCCNAUabbxK56zBh5qkSKmeod/uXadYGDmqoSn+kORHhEa1fC7l2uwuMaRRHQoJ7Dlx8
	 wVQemF0fF/Cyv2FlhC3yj6grdHYZkh0u5r8x0edTMmE3kQ2FZeGaCWjI+fkphm+61YC2p
	 fP7r217LETs6iToLF8PCdY68+L7eIb1XNVeOPaLkfE7K5r9TbpbyhH0iNkrzQTVKlUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=mUonnEwr;
	arc=none smtp.remote-ip=43.155.65.254
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CB7606A320
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:18:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94CB7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=mUonnEwr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725404;
	bh=x1t2wRyiMsCX+S9SSJc8zl8w/ipVR+PJvncysloZdQU=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=mUonnEwrXCxfdaLp0UMs4wXS7FXE4uODysKpFB8Y6nzy+JrfsCz7fmki6AgfBBuzN
	 i/hcS+kjmlwlRy3Z5MgMXGy78xZhFRc1auZwJNd8A3HSrbD7UZlxAHqWGLV/Ia9CS5
	 ax9jvWsbLew861jOP9yi/TQqL0IhPmtkS7U7y9co=
X-QQ-mid: esmtpsz11t1792725400t34e7458c
X-QQ-Originating-IP: pccNKTx+mVIUzlajMI0DmeGUtOZ1T9bK+j8NVvvvReI=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:16:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15986341407937940342
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
Subject: [PATCH 24/24] perf tools: gtrace: Add AUX trace decoder and branch sample synthesis
Date: Fri, 23 Oct 2026 11:15:05 +0800
Message-Id: <20261023031505.2020925-25-liangzhen@linux.spacemit.com>
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
X-QQ-XMAILINFO: Mar6wY6FU0bjTDBxhqJsfNAd1nSgktqnErSFlucuTxS90P/I1PIMlvHS
	Zq7fVp2VArhzX+EkfCTxFqq7yyN21/J5jP9C0NqKkstuQIdng7bYQ/7r8EA6ukNUA1E/28C
	JI0Ic38Xvpu4G4Cp0H0q+RJ0BOXdVMmiY0JPON/Gm7ZBwxfP/z0Zw+ZEIvQsMYbWsqSw+Pv
	QqVeERpyljFlfDvGlKFdyxnwPD5u2xyUYYVU60ZsxcKG1gbuefNAul2B8lWA2L65eGpr9vX
	HCzXTwuS8d0OZQC7F5WDXc7aoCw/ZU08bT673k/EG8QhBrZCoCFur6MpsPFbdyJedp9yMZq
	HKGvMreyLtnOptrYoCnNBdBvGWqEJl3WgjGWZtwtOgCkgY/eJMa2dAR0oQDbCFlZ1gM5/BR
	aUVqyFmJ8WmOcFYfB+LBcvxQajRgagUyTuLzAn7dvyErvB7lNjkTk0kWGc+/3/ptSlGFQfa
	3JjyotIz4XDkb2WApcCUToT1IyZbSG3UMmwds2JS2lVcw0BUfA+/FeMK68Lp2srH/NVxrfm
	p0qDKXLEwQpWy41/zMt3IEvDtvmhqzU9MLWdUj+ULG8ceqpT/HizYHXsePmxxXKobtG9Ciq
	fngk94nQ9dtQiK9Nbibn9AGEcl3yrwYmYVN63mfkAAbnvCr6aexqadTLeyKjusTpbBodRpb
	0jsf/mEo6UR3nU9pv+8m6bklSFSNFCAxAyozYUJuDVymWLrR5l8FAwxbTtazS/ToLduLlP4
	AaJY6ufdLerSpDJpnAaT9nSb8NDjMQ8wpn684F3Vvmj0VHXr/z6Cq0ukRs/6ufnNCmCh6Jw
	9MZRT8TyOc6igNmYCXnwDqnxspJS2/EmIKcrWuSDpsX6BdDy5Nexb3Cvh1+MnZVudXNJWoP
	hFQYl4nBkfZSe6y2k/UOKejpaVYkF10bg8s5PT/rlHOhplHAvaZ9Pe1lYlVPzoH9R9bqv6b
	GMatdeH3fVxiN/tazw7Vm9qMS4nnyiV2dU3zQe5QQETTQNmxt+c6l0YMYftXq/99Zlqd22I
	FRL/9XqhVLe1DMjmYE3LFTSVKkbU8LsLUVQnfWcetzzI+6b4SLUbs/UyjZvmVnlWB15chRQ
	i00mHAPWYR59dHUvscxOt4IZCWaDLL2PXMY7Ctxn8CVRg5yRkLAbFHqRW4ZoS6IHw4r3GBv
	AKWT
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-SPAM: true
X-QQ-RECHKSPAM: 3

Implement the gtrace auxtrace decoder: queue AUX buffers, run timeless or
timestamped decoding, and synthesize branch samples from decoded trace
packets.  Support machine-mode instruction access via new '-m/--firmware'
and '--firmware-base' options.
---
 tools/perf/builtin-script.c      |    4 +
 tools/perf/util/gtrace-decoder.c | 1206 +++++++++++++++++++++++++++++-
 tools/perf/util/symbol_conf.h    |    2 +
 3 files changed, 1197 insertions(+), 15 deletions(-)

diff --git a/tools/perf/builtin-script.c b/tools/perf/builtin-script.c
index ad8ca08ceb5f..d1173c80b6fa 100644
--- a/tools/perf/builtin-script.c
+++ b/tools/perf/builtin-script.c
@@ -4088,6 +4088,10 @@ int cmd_script(int argc, const char **argv)
 		   "file", "vmlinux pathname"),
 	OPT_STRING(0, "kallsyms", &symbol_conf.kallsyms_name,
 		   "file", "kallsyms pathname"),
+	OPT_STRING('m', "firmware", &symbol_conf.firmware_name,
+		   "file", "machine mode firmware binary pathname"),
+	OPT_STRING(0, "firmware-base", &symbol_conf.firmware_base,
+		   "address", "base address for machine mode firmware (e.g., 0x100000000)"),
 	OPT_BOOLEAN('G', "hide-call-graph", &no_callchain,
 		    "When printing symbols do not display call chain"),
 	OPT_CALLBACK(0, "symfs", NULL, "directory[,layout]", SYMFS_HELP,
diff --git a/tools/perf/util/gtrace-decoder.c b/tools/perf/util/gtrace-decoder.c
index d70cb7cd399f..b2973f7ad3fe 100644
--- a/tools/perf/util/gtrace-decoder.c
+++ b/tools/perf/util/gtrace-decoder.c
@@ -13,6 +13,24 @@
 #include "session.h"
 #include "gtrace.h"
 #include "debug.h"
+#include "color.h"
+#include <linux/bitfield.h>
+#include "intlist.h"
+#include "machine.h"
+#include "map.h"
+#include "thread.h"
+#include "thread_map.h"
+#include "thread-stack.h"
+#include "util.h"
+#include "dso.h"
+#include "maps.h"
+#include "symbol.h"
+#include "addr_location.h"
+#include "util/synthetic-events.h"
+#include <fcntl.h>
+#include <unistd.h>
+#include "rvtrace-decoder/rvtrace-decoder.h"
+#include "../../arch/riscv/include/asm/insn.h"
 
 struct gtrace_decoder {
 	struct auxtrace auxtrace;
@@ -22,31 +40,242 @@ struct gtrace_decoder {
 	u32 pmu_type;
 	int num_cpu;
 	u64 **metadata;
+	struct auxtrace_queues queues;
+	struct auxtrace_heap heap;
+	struct itrace_synth_opts synth_opts;
+	struct dso *firmware_dso;
+	struct maps *firmware_maps;
+	bool timeless_decoding;
+	bool per_thread_decoding;
+	bool data_queued;
+	u64 latest_kernel_timestamp;
+	u64 branches_sample_type;
+	u64 branches_id;
 };
 
-static int gtrace_process_event(struct perf_session *session __maybe_unused,
-				 union perf_event *event __maybe_unused,
-				 struct perf_sample *sample __maybe_unused,
-				 const struct perf_tool *tool __maybe_unused)
+enum coresight_format {
+	UNSET,
+	FORMATTED,
+	UNFORMATTED
+};
+
+struct gtrace_queue {
+	struct gtrace_decoder *ptr;
+	struct thread *thread;
+	struct rvtrace_decoder *decoder;
+	struct auxtrace_buffer *buffer;
+	union perf_event *event_buf;
+	unsigned int queue_nr;
+	u64 offset;
+	enum coresight_format cs_format;
+};
+
+static int gtrace_process_timeless_queues(struct gtrace_decoder *ptr,
+					  pid_t tid);
+static int gtrace_process_timestamped_queues(struct gtrace_decoder *ptr);
+
+static int gtrace_process_itrace_start(struct gtrace_decoder *ptr,
+				       union perf_event *event)
 {
+	struct thread *th;
+
+	if (ptr->timeless_decoding)
+		return 0;
+
+	/*
+	 * Add the tid/pid to the log so that we can get a match when
+	 * we get a contextID from the decoder.
+	 */
+	th = machine__findnew_thread(ptr->machine,
+				     event->itrace_start.pid,
+				     event->itrace_start.tid);
+	if (!th)
+		return -ENOMEM;
+
+	thread__put(th);
+
 	return 0;
 }
 
-static int gtrace_process_auxtrace_event(struct perf_session *session __maybe_unused,
-					  union perf_event *event __maybe_unused,
-					  const struct perf_tool *tool __maybe_unused)
+static int gtrace_process_switch_cpu_wide(struct gtrace_decoder *ptr,
+					  union perf_event *event)
 {
+	struct thread *th;
+	bool out = event->header.misc & PERF_RECORD_MISC_SWITCH_OUT;
+
+	if (ptr->timeless_decoding)
+		return 0;
+
+	if (!out)
+		return 0;
+
+	th = machine__findnew_thread(&ptr->session->machines.host,
+				     event->context_switch.next_prev_pid,
+				     event->context_switch.next_prev_tid);
+
+	if (!th)
+		return -ENOMEM;
+
+	thread__put(th);
+
 	return 0;
 }
 
-static int gtrace_flush(struct perf_session *session __maybe_unused,
-			 const struct perf_tool *tool __maybe_unused)
+static int gtrace_process_event(struct perf_session *session,
+				 union perf_event *event,
+				 struct perf_sample *sample,
+				 const struct perf_tool *tool)
 {
+	struct gtrace_decoder *ptr = container_of(session->auxtrace, struct gtrace_decoder,
+					    auxtrace);
+	if (dump_trace)
+		return 0;
+
+	if (!tool->ordered_events) {
+		pr_err("GTRACE requires ordered events\n");
+		return -EINVAL;
+	}
+
+	switch (event->header.type) {
+	case PERF_RECORD_EXIT:
+		if (ptr->per_thread_decoding && ptr->timeless_decoding)
+			return gtrace_process_timeless_queues(ptr, event->fork.tid);
+		break;
+
+	case PERF_RECORD_ITRACE_START:
+		return gtrace_process_itrace_start(ptr, event);
+
+	case PERF_RECORD_SWITCH_CPU_WIDE:
+		return gtrace_process_switch_cpu_wide(ptr, event);
+
+	case PERF_RECORD_AUX:
+		if (sample->time && (sample->time != (u64)-1))
+			ptr->latest_kernel_timestamp = sample->time;
+		break;
+
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static void gtrace_dump_event(struct gtrace_queue *gtraceq,
+			      struct auxtrace_buffer *buffer)
+{
+	int ret;
+	const char *color = PERF_COLOR_BLUE;
+	struct rvtrace_decoder *decoder = gtraceq->decoder;
+
+	color_fprintf(stdout, color,
+		      ". ... Trace Encoder Trace data: size %#zx bytes\n",
+		      buffer->size);
+
+	ret = decoder->decode(gtraceq->decoder, RVTRACE_DECODE_MSG,
+			      buffer->data, buffer->size);
+	if (ret)
+		color_fprintf(stdout, color, " Bad packet!\n");
+}
+
+static void dump_queued_data(struct gtrace_decoder *ptr,
+			     struct perf_record_auxtrace *event)
+{
+	struct auxtrace_buffer *buf;
+	unsigned int i;
+	/*
+	 * Find all buffers with same reference in the queues and dump them.
+	 * This is because the queues can contain multiple entries of the same
+	 * buffer that were split on aux records.
+	 */
+	for (i = 0; i < ptr->queues.nr_queues; ++i)
+		list_for_each_entry(buf, &ptr->queues.queue_array[i].head, list)
+			if (buf->reference == event->reference)
+				gtrace_dump_event(ptr->queues.queue_array[i].priv, buf);
+}
+
+static int gtrace_process_auxtrace_event(struct perf_session *session,
+					 union perf_event *event,
+					 const struct perf_tool *tool __maybe_unused)
+{
+	struct gtrace_decoder *ptr = container_of(session->auxtrace, struct gtrace_decoder,
+					    auxtrace);
+
+	if (!ptr->data_queued) {
+		struct auxtrace_buffer *buffer;
+		off_t  data_offset;
+		int fd = perf_data__fd(session->data);
+		bool is_pipe = perf_data__is_pipe(session->data);
+		int err;
+		int idx = event->auxtrace.idx;
+
+		if (is_pipe)
+			data_offset = 0;
+		else {
+			data_offset = lseek(fd, 0, SEEK_CUR);
+			if (data_offset == -1)
+				return -errno;
+		}
+
+		err = auxtrace_queues__add_event(&ptr->queues, session,
+						 event, data_offset, &buffer);
+		if (err)
+			return err;
+
+		if (dump_trace)
+			if (auxtrace_buffer__get_data(buffer, fd)) {
+				gtrace_dump_event(ptr->queues.queue_array[idx].priv, buffer);
+				auxtrace_buffer__put_data(buffer);
+			}
+	} else if (dump_trace)
+		dump_queued_data(ptr, &event->auxtrace);
+
 	return 0;
 }
 
-static void gtrace_free_events(struct perf_session *session __maybe_unused)
+static int gtrace_flush(struct perf_session *session,
+			 const struct perf_tool *tool)
 {
+	struct gtrace_decoder *ptr = container_of(session->auxtrace, struct gtrace_decoder,
+					    auxtrace);
+	if (dump_trace)
+		return 0;
+
+	if (!tool->ordered_events)
+		return -EINVAL;
+
+	if (ptr->timeless_decoding)
+		return gtrace_process_timeless_queues(ptr, -1);
+
+	return gtrace_process_timestamped_queues(ptr);
+}
+
+static void gtrace_free_queue(void *priv)
+{
+	struct gtrace_queue *gtraceq = priv;
+
+	if (!gtraceq)
+		return;
+
+	if (gtraceq->decoder)
+		rvtrace_decoder_free(gtraceq->decoder);
+	thread__zput(gtraceq->thread);
+	zfree(&gtraceq->event_buf);
+	free(gtraceq);
+}
+
+static void gtrace_free_events(struct perf_session *session)
+{
+	unsigned int i;
+	struct gtrace_decoder *ptr = container_of(session->auxtrace, struct gtrace_decoder,
+					    auxtrace);
+	struct auxtrace_queues *queues = &ptr->queues;
+
+	for (i = 0; i < queues->nr_queues; i++) {
+		gtrace_free_queue(queues->queue_array[i].priv);
+		queues->queue_array[i].priv = NULL;
+	}
+
+	auxtrace_queues__free(queues);
 }
 
 static void gtrace_free(struct perf_session *session)
@@ -54,6 +283,7 @@ static void gtrace_free(struct perf_session *session)
 	struct gtrace_decoder *ptr = container_of(session->auxtrace, struct gtrace_decoder,
 					    auxtrace);
 
+	gtrace_free_events(session);
 	session->auxtrace = NULL;
 	for (int i = 0; i < ptr->num_cpu; i++)
 		zfree(&ptr->metadata[i]);
@@ -70,6 +300,643 @@ static bool gtrace_evsel_is_auxtrace(struct perf_session *session,
 	return evsel->core.attr.type == ptr->pmu_type;
 }
 
+static void gtrace_set_thread(struct gtrace_queue *gtraceq,
+			      pid_t tid)
+{
+	struct gtrace_decoder *ptr = gtraceq->ptr;
+
+	if (tid != -1) {
+		thread__zput(gtraceq->thread);
+		gtraceq->thread = machine__find_thread(ptr->machine, -1, tid);
+	}
+
+	/* Couldn't find a known thread */
+	if (!gtraceq->thread)
+		gtraceq->thread = machine__idle_thread(ptr->machine);
+}
+
+/*
+ * Register firmware ELF PT_LOAD segments as maps in the machine's kernel maps,
+ * so that perf script can resolve symbols for M-mode (machine mode) samples.
+ *
+ * base is the absolute physical load address of the firmware (from --firmware-base).
+ * p_paddr in the ELF is the relative address within the firmware image.
+ *
+ *   map->start = base + p_paddr
+ *   map->end   = base + p_paddr + p_memsz
+ *   map->pgoff = p_offset
+ *
+ * map__map_ip(paddr) = paddr - start + pgoff = p_offset + (paddr - base - p_paddr)
+ */
+static int gtrace_register_firmware_maps(struct gtrace_decoder *ptr,
+					 struct dso *dso, u64 base)
+{
+	Elf64_Ehdr ehdr;
+	Elf64_Phdr phdr;
+	int fd, i, ret = 0;
+	const char *filename = dso__long_name(dso);
+
+	fd = open(filename, O_RDONLY);
+	if (fd < 0)
+		return -1;
+
+	if (pread(fd, &ehdr, sizeof(ehdr), 0) != sizeof(ehdr)) {
+		ret = -1;
+		goto out;
+	}
+
+	for (i = 0; i < ehdr.e_phnum; i++) {
+		struct map *map;
+
+		if (pread(fd, &phdr, sizeof(phdr),
+			  ehdr.e_phoff + (u64)i * ehdr.e_phentsize) != sizeof(phdr))
+			continue;
+
+		if (phdr.p_type != PT_LOAD || phdr.p_memsz == 0)
+			continue;
+
+		map = map__new2(base + phdr.p_paddr, dso);
+		if (!map) {
+			ret = -ENOMEM;
+			goto out;
+		}
+
+		map__set_end(map, base + phdr.p_paddr + phdr.p_memsz);
+		map__set_pgoff(map, phdr.p_offset);
+
+		pr_debug("gtrace: machine code map [%#"PRIx64"-%#"PRIx64"] pgoff=%#"PRIx64" %s\n",
+			 base + phdr.p_paddr, base + phdr.p_paddr + phdr.p_memsz,
+			 (u64)phdr.p_offset, dso__long_name(dso));
+
+		ret = maps__insert(ptr->firmware_maps, map);
+		map__put(map);
+		if (ret)
+			goto out;
+	}
+out:
+	close(fd);
+	return ret;
+}
+
+static int gtrace_insert_map_cb(struct map *map, void *data)
+{
+	struct maps *kmaps = data;
+
+	maps__insert(kmaps, map);
+	return 0;
+}
+
+static u32 gtrace_machine_mode_access(struct gtrace_queue *gtraceq, u64 address,
+				       size_t size, u8 *buffer)
+{
+	struct machine *machine = gtraceq->ptr->machine;
+	struct map *map;
+	struct dso *dso;
+	u64 offset;
+	int len;
+
+	if (!gtraceq->ptr->firmware_dso) {
+		ui__warning_once("RISC-V Trace: Machine mode code binary not provided.\n"
+				 "              Failed to read address 0x%lx.\n"
+				 "              Use option '-m /path/to/firmware --firmware-base 0xBASE'\n"
+				 "              to specify the binary and its base address.\n",
+				 address);
+		return 0;
+	}
+
+	map = maps__find(gtraceq->ptr->firmware_maps, address);
+	if (!map)
+		return 0;
+
+	/*
+	 * Insert firmware maps into kernel maps for symbol resolution.
+	 * Re-insert if kcore loading has removed them (kcore calls
+	 * maps__remove_maps which clears all non-kernel maps).
+	 */
+	if (!maps__find(machine__kernel_maps(machine), address)) {
+		maps__for_each_map(gtraceq->ptr->firmware_maps,
+				   gtrace_insert_map_cb,
+				   machine__kernel_maps(machine));
+		map__load(map);
+	}
+
+	dso = map__dso(map);
+	offset = map__map_ip(map, address);
+	len = dso__data_read_offset(dso, machine, offset, buffer, size);
+	map__put(map);
+	return len > 0 ? len : 0;
+}
+
+static u32 gtrace_mem_access(void *data, u64 address, enum riscv_privilege_mode prv,
+			     int context, size_t size, u8 *buffer)
+{
+	u8 cpumode;
+	u64 offset;
+	int len;
+	struct machine *machine;
+	struct addr_location al;
+	struct dso *dso;
+	int ret = 0;
+	struct gtrace_queue *gtraceq = data;
+
+	if (!gtraceq)
+		goto out;
+
+	addr_location__init(&al);
+
+	/* If the riscv_privilege_mode is machine mode, access physical address by /dev/mem */
+	if (prv == RISCV_PRIV_MACHINE_MODE)
+		return gtrace_machine_mode_access(gtraceq, address, size, buffer);
+
+	machine = gtraceq->ptr->machine;
+	if (address >= machine__kernel_start(machine))
+		cpumode = PERF_RECORD_MISC_KERNEL;
+	else
+		cpumode = PERF_RECORD_MISC_USER;
+
+	if (thread__tid(gtraceq->thread) != context)
+		gtrace_set_thread(gtraceq, context);
+
+	if (!thread__find_map(gtraceq->thread, cpumode, address, &al))
+		goto out;
+
+	dso = map__dso(al.map);
+	if (!dso)
+		goto out;
+
+	if (dso__data(dso)->status == DSO_DATA_STATUS_ERROR &&
+	    dso__data_status_seen(dso, DSO_DATA_STATUS_SEEN_ITRACE))
+		goto out;
+
+	offset = map__map_ip(al.map, address);
+
+	map__load(al.map);
+
+	len = dso__data_read_offset(dso, machine, offset, buffer, size);
+	if (len <= 0) {
+		ui__warning_once("GTRACE: Missing DSO. Use 'perf archive' or debuginfod to export data from the traced system.\n"
+				 "                     Enable CONFIG_PROC_KCORE or use option '-k /path/to/vmlinux' for kernel symbols.\n");
+		if (!dso__auxtrace_warned(dso)) {
+			pr_err("RISC-V Trace: Debug data not found for address %#"PRIx64" in %s\n",
+				address,
+				dso__long_name(dso) ? dso__long_name(dso) : "Unknown");
+			dso__set_auxtrace_warned(dso);
+		}
+		goto out;
+	}
+	ret = len;
+out:
+	addr_location__exit(&al);
+	return ret;
+}
+
+static u8 gtrace_cpu_mode(enum riscv_privilege_mode prv)
+{
+	u8 cpumode;
+
+	switch (prv) {
+	case RISCV_PRIV_USER_MODE:
+		cpumode = PERF_RECORD_MISC_USER;
+		break;
+	case RISCV_PRIV_SUPERVISOR_MODE:
+	case RISCV_PRIV_MACHINE_MODE:
+	default:
+		cpumode = PERF_RECORD_MISC_KERNEL;
+		break;
+	}
+	return cpumode;
+}
+
+static void gtrace_synth_copy_insn(struct gtrace_queue *gtraceq,
+				   struct rvtrace_packet *packet,
+				   struct perf_sample *sample)
+{
+	int ret;
+	u32 insn;
+
+	ret = gtrace_mem_access(gtraceq, sample->ip, packet->prv, packet->context,
+				sizeof(insn), (u8 *)&insn);
+	if (!ret)
+		return;
+
+	sample->insn_len = ((insn & __INSN_LENGTH_MASK) == __INSN_LENGTH_GE_32) ? 4 : 2;
+	memcpy(sample->insn, &insn, sample->insn_len);
+}
+
+static inline u64 gtrace_resolve_sample_time(struct gtrace_queue *gtraceq,
+					     struct rvtrace_packet *packet)
+{
+	struct gtrace_decoder *ptr = gtraceq->ptr;
+
+	if (!ptr->timeless_decoding)
+		return packet->timestamp;
+	else
+		return ptr->latest_kernel_timestamp;
+}
+
+static int gtrace_synth_branch_sample(struct gtrace_queue *gtraceq,
+				      struct rvtrace_packet *packet)
+{
+	int ret = 0;
+	struct gtrace_decoder *ptr = gtraceq->ptr;
+	struct perf_sample sample;
+	union perf_event *event = gtraceq->event_buf;
+
+	perf_sample__init(&sample, /*all=*/true);
+	event->sample.header.type = PERF_RECORD_SAMPLE;
+	event->sample.header.misc = gtrace_cpu_mode(packet->prv);
+	event->sample.header.size = sizeof(struct perf_event_header);
+
+	if (thread__tid(gtraceq->thread) != packet->context)
+		gtrace_set_thread(gtraceq, packet->context);
+
+	/* Set time field based on rvtrace auxtrace config. */
+	sample.time = gtrace_resolve_sample_time(gtraceq, packet);
+
+	sample.ip = packet->start_addr;
+	sample.pid = thread__pid(gtraceq->thread);
+	sample.tid = thread__tid(gtraceq->thread);
+	sample.addr = packet->end_addr;
+	sample.insn_cnt = packet->insn_cnt;
+	sample.id = gtraceq->ptr->branches_id;
+	sample.stream_id = gtraceq->ptr->branches_id;
+	sample.period = 1;
+	sample.cpu = packet->cpu;
+	sample.flags = 0;
+	sample.cpumode = event->sample.header.misc;
+
+	gtrace_synth_copy_insn(gtraceq, packet, &sample);
+
+	ret = perf_session__deliver_synth_event(ptr->session, event, &sample);
+	if (ret)
+		pr_err(
+		"RISC-V Trace: failed to deliver instruction event, error %d\n",
+		ret);
+	perf_sample__exit(&sample);
+
+	return ret;
+}
+
+static int gtrace_synth_events(struct gtrace_decoder *ptr,
+			       struct perf_session *session)
+{
+	struct evlist *evlist = session->evlist;
+	struct evsel *evsel;
+	struct perf_event_attr attr;
+	bool found = false;
+	u64 id;
+	int err;
+
+	evlist__for_each_entry(evlist, evsel) {
+		if (evsel->core.attr.type == ptr->pmu_type) {
+			found = true;
+			break;
+		}
+	}
+
+	if (!found) {
+		pr_debug("No selected events with RISC-V Trace data\n");
+		return 0;
+	}
+
+	memset(&attr, 0, sizeof(struct perf_event_attr));
+	attr.size = sizeof(struct perf_event_attr);
+	attr.type = PERF_TYPE_HARDWARE;
+	attr.sample_type = evsel->core.attr.sample_type & PERF_SAMPLE_MASK;
+	attr.sample_type |= PERF_SAMPLE_IP | PERF_SAMPLE_TID |
+			    PERF_SAMPLE_PERIOD;
+	if (ptr->timeless_decoding)
+		attr.sample_type &= ~(u64)PERF_SAMPLE_TIME;
+	else
+		attr.sample_type |= PERF_SAMPLE_TIME;
+
+	attr.exclude_user = evsel->core.attr.exclude_user;
+	attr.exclude_kernel = evsel->core.attr.exclude_kernel;
+	attr.exclude_hv = evsel->core.attr.exclude_hv;
+	attr.exclude_host = evsel->core.attr.exclude_host;
+	attr.exclude_guest = evsel->core.attr.exclude_guest;
+	attr.sample_id_all = evsel->core.attr.sample_id_all;
+	attr.read_format = evsel->core.attr.read_format;
+
+	/* create new id val to be a fixed offset from evsel id */
+	id = evsel->core.id[0] + 1000000000;
+	if (!id)
+		id = 1;
+
+	if (ptr->synth_opts.branches) {
+		attr.config = PERF_COUNT_HW_BRANCH_INSTRUCTIONS;
+		attr.sample_period = 1;
+		attr.sample_type |= PERF_SAMPLE_ADDR;
+
+		err = perf_session__deliver_synth_attr_event(session, &attr, id);
+		if (err)
+			return err;
+		ptr->branches_sample_type = attr.sample_type;
+		ptr->branches_id = id;
+		id += 1;
+		attr.sample_type &= ~(u64)PERF_SAMPLE_ADDR;
+	}
+
+	return 0;
+}
+
+static int gtrace_process_queue(struct gtrace_queue *gtraceq)
+{
+	struct rvtrace_packet_buffer *packet_buffer = &gtraceq->decoder->packet_buffer;
+
+	for (int i = 0; i < packet_buffer->size; i++) {
+		struct rvtrace_packet packet = packet_buffer->packets[i];
+
+		if (packet.sample_type == RVTRACE_RANGE)
+			gtrace_synth_branch_sample(gtraceq, &packet);
+		else if (packet.sample_type == RVTRACE_LOSS)
+			fprintf(stdout, "RISC-V Trace: FIFO overrun, messages lost\n");
+		else if (packet.sample_type == RVTRACE_ERROR)
+			fprintf(stdout, "RISC-V Trace: Packet data parsing error\n");
+	}
+
+	return 0;
+}
+
+static int gtrace_get_trace(struct gtrace_queue *gtraceq)
+{
+	struct auxtrace_buffer *aux_buffer = gtraceq->buffer;
+	struct auxtrace_buffer *old_buffer = aux_buffer;
+	struct auxtrace_queue *queue;
+
+	queue = &gtraceq->ptr->queues.queue_array[gtraceq->queue_nr];
+
+	aux_buffer = auxtrace_buffer__next(queue, aux_buffer);
+
+	/* If no more data, drop the previous auxtrace_buffer and return */
+	if (!aux_buffer) {
+		if (old_buffer)
+			auxtrace_buffer__drop_data(old_buffer);
+		return 0;
+	}
+
+	gtraceq->buffer = aux_buffer;
+
+	/* If the aux_buffer doesn't have data associated, try to load it */
+	if (!aux_buffer->data) {
+		/* get the file desc associated with the perf data file */
+		int fd = perf_data__fd(gtraceq->ptr->session->data);
+
+		aux_buffer->data = auxtrace_buffer__get_data(aux_buffer, fd);
+		if (!aux_buffer->data)
+			return -ENOMEM;
+	}
+
+	/* If valid, drop the previous buffer */
+	if (old_buffer)
+		auxtrace_buffer__drop_data(old_buffer);
+
+	return aux_buffer->size;
+}
+
+/*
+ * gtrace_get_data_block: Fetch a block from the auxtrace_buffer queue
+ *                         if need be.
+ * Returns:     < 0     if error
+ *              = 0     if no more auxtrace_buffer to read
+ *              > 0     if the current buffer isn't empty yet
+ */
+static int gtrace_get_data_block(struct gtrace_queue *gtraceq)
+{
+	int ret;
+
+	ret = gtrace_get_trace(gtraceq);
+	if (ret <= 0)
+		return ret;
+
+	/*
+	 * We cannot assume consecutive blocks in the data file
+	 * are contiguous, reset the decoder to force re-sync.
+	 */
+	ret = rvtrace_decoder_reset(gtraceq->decoder);
+	if (ret)
+		return ret;
+
+	return gtraceq->buffer->size;
+}
+
+static int gtrace_run_timeless_decoder(struct gtrace_queue *gtraceq)
+{
+	struct rvtrace_decoder *decoder = gtraceq->decoder;
+	int ret;
+
+	while (1) {
+		ret = gtrace_get_data_block(gtraceq);
+		if (ret < 0)
+			return ret;
+
+		if (ret == 0)
+			break;
+
+		ret = decoder->decode(decoder, RVTRACE_DECODE_INSN,
+				      gtraceq->buffer->data,
+				      gtraceq->buffer->size);
+		if (ret)
+			return ret;
+
+		ret = gtrace_process_queue(gtraceq);
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
+static int gtrace_process_timeless_queues(struct gtrace_decoder *ptr,
+					  pid_t tid)
+{
+	unsigned int i;
+	struct auxtrace_queues *queues = &ptr->queues;
+
+	for (i = 0; i < queues->nr_queues; i++) {
+		struct auxtrace_queue *queue = &ptr->queues.queue_array[i];
+		struct gtrace_queue *gtraceq = queue->priv;
+
+		if (gtraceq && ((tid == -1) || (queue->tid == tid))) {
+			gtrace_set_thread(gtraceq, queue->tid);
+			gtrace_run_timeless_decoder(gtraceq);
+		}
+	}
+
+	return 0;
+}
+
+static u64 gtrace_queue_get_timestamp(struct gtrace_queue *gtraceq)
+{
+	struct rvtrace_packet_buffer *packet_buffer = &gtraceq->decoder->packet_buffer;
+
+	for (int i = 0; i < packet_buffer->size; i++) {
+		struct rvtrace_packet packet = packet_buffer->packets[i];
+
+		if (packet.sample_type == RVTRACE_RANGE)
+			return packet.timestamp;
+	}
+
+	return 0;
+}
+
+static int gtrace_queue_first_timestamp(struct gtrace_decoder *ptr,
+					struct gtrace_queue *gtraceq,
+					unsigned int queue_nr)
+{
+	struct rvtrace_decoder *decoder = gtraceq->decoder;
+	u64 timestamp = 0;
+	int ret;
+
+	/* Decode the first segment of data until a timestamp is found,
+	 * then add it to the heap for sorting by time across multiple
+	 * queues.
+	 */
+	while (1) {
+		/*
+		 * Fetch an aux_buffer from this gtraceq. Bail if no more
+		 * blocks or an error has been encountered.
+		 */
+		ret = gtrace_get_data_block(gtraceq);
+		if (ret <= 0)
+			goto out;
+
+		ret = decoder->decode(decoder, RVTRACE_DECODE_INSN,
+				      gtraceq->buffer->data,
+				      gtraceq->buffer->size);
+		if (ret)
+			goto out;
+
+		timestamp = gtrace_queue_get_timestamp(gtraceq);
+
+		/* We found a timestamp, no need to continue. */
+		if (timestamp)
+			break;
+	}
+
+	/* We have a timestamp and add it to the min heap */
+	ret = auxtrace_heap__add(&ptr->heap, queue_nr, timestamp);
+out:
+	return ret;
+}
+
+static int gtrace_process_timestamped_queues(struct gtrace_decoder *ptr)
+{
+	int ret = 0;
+	unsigned int queue_nr, i;
+	struct auxtrace_queue *queue;
+	struct gtrace_queue *gtraceq;
+
+	/* First, find the first timestamp for each queue and add it to the heap. */
+	for (i = 0; i < ptr->queues.nr_queues; i++) {
+		queue = &ptr->queues.queue_array[i];
+		gtraceq = queue->priv;
+		if (!gtraceq)
+			continue;
+
+		gtrace_set_thread(gtraceq, queue->tid);
+
+		ret = gtrace_queue_first_timestamp(ptr, gtraceq, i);
+		if (ret)
+			return ret;
+	}
+
+	/* Process queues in the heap in timestamp order */
+	while (1) {
+		if (!ptr->heap.heap_cnt)
+			break;
+
+		/* Take the entry at the top of the min heap */
+		queue_nr = ptr->heap.heap_array[0].queue_nr;
+		queue = &ptr->queues.queue_array[queue_nr];
+		gtraceq = queue->priv;
+
+		/*
+		 * Remove the top entry from the heap since we are about
+		 * to process it.
+		 */
+		auxtrace_heap__pop(&ptr->heap);
+
+		/*
+		 * Packets associated with this timestamp are already in
+		 * the gtraceq->packet_buffer, so process them.
+		 */
+		ret = gtrace_process_queue(gtraceq);
+		if (ret)
+			return ret;
+
+		/*
+		 * Packets for this timestamp have been processed, time to
+		 * move on to the next timestamp, find the next timestamp
+		 * for this gtraceq.
+		 */
+		ret = gtrace_queue_first_timestamp(ptr, gtraceq, queue_nr);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static struct gtrace_queue *gtrace_alloc_queue(struct gtrace_decoder *ptr,
+					       unsigned int queue_nr)
+{
+	struct gtrace_queue *gtraceq;
+
+	gtraceq = zalloc(sizeof(*gtraceq));
+	if (!gtraceq)
+		return NULL;
+
+	gtraceq->event_buf = malloc(PERF_SAMPLE_MAX_SIZE);
+	if (!gtraceq->event_buf)
+		goto out_free;
+
+	gtraceq->ptr = ptr;
+	gtraceq->queue_nr = queue_nr;
+	gtraceq->offset = 0;
+
+	return gtraceq;
+
+out_free:
+	zfree(&gtraceq->event_buf);
+	free(gtraceq);
+
+	return NULL;
+
+}
+
+static int gtrace_setup_queue(struct gtrace_decoder *ptr,
+			      struct auxtrace_queue *queue,
+			      unsigned int queue_nr)
+{
+	struct gtrace_queue *gtraceq = queue->priv;
+
+	if (gtraceq)
+		return 0;
+
+	gtraceq = gtrace_alloc_queue(ptr, queue_nr);
+	if (!gtraceq)
+		return -ENOMEM;
+
+	queue->priv = gtraceq;
+	queue->cpu = queue_nr;
+
+	return 0;
+}
+
+static void gtrace_setup_timeless_decoding(struct gtrace_decoder *ptr)
+{
+	u64 *metadata = ptr->metadata[0];
+
+	/* Override timeless mode with user input from --itrace=Z */
+	if (ptr->synth_opts.timeless_decoding) {
+		ptr->timeless_decoding = true;
+		return;
+	}
+
+	ptr->timeless_decoding = metadata[RVTRACE_ENCODER_TIMESTAMP];
+}
+
 static const char * const gtrace_global_header_fmts[] = {
 	[GTRACE_PMU_TYPE_CPUS]		    = "	    PMU type/num cpus	    %llx\n",
 };
@@ -99,6 +966,251 @@ static void gtrace_print_auxtrace_info(u64 *val, int num_cpu)
 	}
 }
 
+static struct gtrace_queue *gtrace_get_queue(struct gtrace_decoder *ptr, int cpu)
+{
+	if (ptr->per_thread_decoding)
+		return ptr->queues.queue_array[0].priv;
+
+	if (cpu < 0 || cpu >= (int)ptr->queues.nr_queues)
+		return NULL;
+
+	return ptr->queues.queue_array[cpu].priv;
+}
+
+/**
+ * Puts a fragment of an auxtrace buffer into the auxtrace queues based
+ * on the bounds of aux_event, if it matches with the buffer that's at
+ * file_offset.
+ *
+ * Normally, whole auxtrace buffers would be added to the queue. But we
+ * want to reset the decoder for every PERF_RECORD_AUX event, and the decoder
+ * is reset across each buffer, so splitting the buffers up in advance has
+ * the same effect.
+ */
+static int gtrace_queue_aux_fragment(struct perf_session *session, off_t file_offset, size_t sz,
+				     struct perf_record_aux *aux_event, struct perf_sample *sample)
+{
+	int err;
+	char buf[PERF_SAMPLE_MAX_SIZE];
+	union perf_event *auxtrace_event_union;
+	struct perf_record_auxtrace *auxtrace_event;
+	union perf_event auxtrace_fragment;
+	__u64 aux_offset, aux_size;
+	enum coresight_format cs_format;
+
+	struct gtrace_decoder *ptr = container_of(session->auxtrace, struct gtrace_decoder,
+					    auxtrace);
+
+	/*
+	 * There should be a PERF_RECORD_AUXTRACE event at the file_offset that we got
+	 * from looping through the auxtrace index.
+	 */
+	err = perf_session__peek_event(session, file_offset, buf,
+				       PERF_SAMPLE_MAX_SIZE, &auxtrace_event_union, NULL);
+	if (err)
+		return err;
+	auxtrace_event = &auxtrace_event_union->auxtrace;
+	if (auxtrace_event->header.type != PERF_RECORD_AUXTRACE)
+		return -EINVAL;
+
+	if (auxtrace_event->header.size < sizeof(struct perf_record_auxtrace) ||
+		auxtrace_event->header.size != sz) {
+		return -EINVAL;
+	}
+
+	/*
+	 * Compare only TIDs if auxtrace CPU is -1, and CPUs if auxtrace CPU is not -1.
+	 * Return 'not found' if mismatch.
+	 */
+	if (auxtrace_event->cpu == (__u32) -1) {
+		ptr->per_thread_decoding = true;
+		if (auxtrace_event->tid != sample->tid)
+			return 1;
+	} else if (auxtrace_event->cpu != sample->cpu) {
+		if (ptr->per_thread_decoding) {
+			/*
+			 * Found a per-cpu buffer after a per-thread one was
+			 * already found
+			 */
+			pr_err("GTRACE: Inconsistent per-thread/per-cpu mode.\n");
+			return -EINVAL;
+		}
+		return 1;
+	}
+
+	if (aux_event->flags & PERF_AUX_FLAG_OVERWRITE) {
+		/*
+		 * Clamp size in snapshot mode. The buffer size is clamped in
+		 * __auxtrace_mmap__read() for snapshots, so the aux record size doesn't reflect
+		 * the buffer size.
+		 */
+		aux_size = min(aux_event->aux_size, auxtrace_event->size);
+
+		/*
+		 * In this mode, the head also points to the end of the buffer so aux_offset
+		 * needs to have the size subtracted so it points to the beginning as in normal mode
+		 */
+		aux_offset = aux_event->aux_offset - aux_size;
+	} else {
+		aux_size = aux_event->aux_size;
+		aux_offset = aux_event->aux_offset;
+	}
+
+	if (aux_offset >= auxtrace_event->offset &&
+	    aux_offset + aux_size <= auxtrace_event->offset + auxtrace_event->size) {
+		struct gtrace_queue *gtraceq = gtrace_get_queue(ptr, auxtrace_event->cpu);
+
+		if (!gtraceq)
+			return -EINVAL;
+
+		/*
+		 * If this AUX event was inside this buffer somewhere, create a new auxtrace event
+		 * based on the sizes of the aux event, and queue that fragment.
+		 */
+		auxtrace_fragment.auxtrace = *auxtrace_event;
+		auxtrace_fragment.auxtrace.size = aux_size;
+		auxtrace_fragment.auxtrace.offset = aux_offset;
+		auxtrace_fragment.auxtrace.idx = gtraceq->queue_nr;
+		file_offset += aux_offset - auxtrace_event->offset + auxtrace_event->header.size;
+
+		pr_debug3("GTRACE: Queue buffer size: %#"PRI_lx64" offset: %#"PRI_lx64
+			  " tid: %d cpu: %d\n", aux_size, aux_offset, sample->tid, sample->cpu);
+		err = auxtrace_queues__add_event(&ptr->queues, session, &auxtrace_fragment,
+						 file_offset, NULL);
+		if (err)
+			return err;
+
+		cs_format = (aux_event->flags & PERF_AUX_FLAG_GTRACE_FORMAT_CORESIGHT) ?
+					FORMATTED : UNFORMATTED;
+		if (gtraceq->cs_format != UNSET && cs_format != gtraceq->cs_format) {
+			pr_err("GTRACE: mixed coresight formatted and unformatted trace not supported\n");
+			return -EINVAL;
+		}
+		gtraceq->cs_format = cs_format;
+		return 0;
+	}
+
+	/* Wasn't inside this buffer, but there were no parse errors. 1 == 'not found' */
+	return 1;
+}
+
+static int gtrace_queue_aux_records_cb(struct perf_session *session, union perf_event *event,
+				       u64 offset __maybe_unused, void *data __maybe_unused)
+{
+	struct perf_sample sample;
+	int ret;
+	struct auxtrace_index_entry *ent;
+	struct auxtrace_index *auxtrace_index;
+	struct evsel *evsel;
+	size_t i;
+
+	/* Don't care about any other events, we're only queuing buffers for AUX events */
+	if (event->header.type != PERF_RECORD_AUX)
+		return 0;
+
+	if (event->header.size < sizeof(struct perf_record_aux))
+		return -EINVAL;
+
+	/* Truncated Aux records can have 0 size and shouldn't result in anything being queued. */
+	if (!event->aux.aux_size)
+		return 0;
+
+	/*
+	 * Parse the sample, we need the sample_id_all data that comes after the event so that the
+	 * CPU or PID can be matched to an AUXTRACE buffer's CPU or PID.
+	 */
+	evsel = evlist__event2evsel(session->evlist, event);
+	if (!evsel)
+		return -EINVAL;
+	perf_sample__init(&sample, /*all=*/false);
+	ret = evsel__parse_sample(evsel, event, &sample);
+	if (ret)
+		goto out;
+
+	/*
+	 * Loop through the auxtrace index to find the buffer that matches up with this aux event.
+	 */
+	list_for_each_entry(auxtrace_index, &session->auxtrace_index, list) {
+		for (i = 0; i < auxtrace_index->nr; i++) {
+			ent = &auxtrace_index->entries[i];
+			ret = gtrace_queue_aux_fragment(session, ent->file_offset,
+							ent->sz, &event->aux, &sample);
+			/*
+			 * Stop search on error or successful values. Continue search on
+			 * 1 ('not found')
+			 */
+			if (ret != 1)
+				goto out;
+		}
+	}
+
+	/*
+	 * Couldn't find the buffer corresponding to this aux record, something went wrong. Warn but
+	 * don't exit with an error because it will still be possible to decode other aux records.
+	 */
+	pr_err("CS ETM: Couldn't find auxtrace buffer for aux_offset: %#"PRI_lx64
+	       " tid: %d cpu: %d\n", event->aux.aux_offset, sample.tid, sample.cpu);
+	ret = 0;
+out:
+	perf_sample__exit(&sample);
+	return ret;
+
+}
+
+static int gtrace_queue_aux_records(struct perf_session *session)
+{
+	struct auxtrace_index *index = list_first_entry_or_null(&session->auxtrace_index,
+								struct auxtrace_index, list);
+
+	if (index && index->nr > 0)
+		return perf_session__peek_events(session, session->header.data_offset,
+						 session->header.data_size,
+						 gtrace_queue_aux_records_cb, NULL);
+
+	return 0;
+}
+
+static int gtrace_create_queue_decoder(struct gtrace_queue *gtraceq)
+{
+	struct gtrace_decoder *ptr = gtraceq->ptr;
+	struct rvtrace_decoder_params params;
+
+	params.data = gtraceq;
+	params.mem_access = gtrace_mem_access;
+	params.coresight_formatted = gtraceq->cs_format == FORMATTED;
+	params.format = ptr->metadata[gtraceq->queue_nr][RVTRACE_ENCODER_FORMAT];
+	params.srcbits = ptr->metadata[gtraceq->queue_nr][RVTRACE_ENCODER_SRCBITS];
+	gtraceq->decoder = rvtrace_decoder_new(&params);
+	if (!gtraceq->decoder)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int gtrace_create_decoders(struct gtrace_decoder *ptr)
+{
+	struct auxtrace_queues *queues = &ptr->queues;
+
+	for (unsigned int i = 0; i < queues->nr_queues; i++) {
+		bool empty = list_empty(&queues->queue_array[i].head);
+		struct gtrace_queue *gtraceq = queues->queue_array[i].priv;
+		int ret;
+
+		/*
+		 * Don't create decoders for empty queues, mainly because
+		 * q->format is unknown for empty queues.
+		 */
+		assert(empty || gtraceq->cs_format != UNSET);
+		if (empty)
+			continue;
+
+		ret = gtrace_create_queue_decoder(gtraceq);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
 int gtrace__process_auxtrace_info(union perf_event *event,
 				   struct perf_session *session)
 {
@@ -106,7 +1218,7 @@ int gtrace__process_auxtrace_info(union perf_event *event,
 	struct gtrace_decoder *ptr;
 	u64 *priv;
 	u64 **metadata;
-	int num_cpu;
+	int num_cpu, max_cpu = 0;
 	int priv_size;
 	int err;
 	int i;
@@ -115,7 +1227,6 @@ int gtrace__process_auxtrace_info(union perf_event *event,
 	num_cpu = priv[GTRACE_PMU_TYPE_CPUS] & 0xffffffff;
 	if (dump_trace)
 		gtrace_print_auxtrace_info(priv, num_cpu);
-
 	priv_size = auxtrace_info->header.size - sizeof(struct perf_event_header) -
 		    INFO_HEADER_SIZE - GTRACE_HEADER_SIZE;
 	if (num_cpu <= 0 || priv_size <= 0 ||
@@ -126,7 +1237,7 @@ int gtrace__process_auxtrace_info(union perf_event *event,
 	if (!metadata)
 		return -ENOMEM;
 
-	i = GTRACE_HEADER_SIZE;
+	i = GTRACE_HEADER_MAX;
 
 	for (int j = 0; j < num_cpu; j++) {
 		metadata[j] = zalloc(sizeof(*metadata[j]) * RVTRACE_ENCODER_PRIV_MAX);
@@ -137,6 +1248,9 @@ int gtrace__process_auxtrace_info(union perf_event *event,
 
 		for (int k = 0; k < RVTRACE_ENCODER_PRIV_MAX; k++)
 			metadata[j][k] = priv[i + k];
+
+		if ((int)metadata[j][RVTRACE_ENCODER_CPU] > max_cpu)
+			max_cpu = metadata[j][RVTRACE_ENCODER_CPU];
 		i += RVTRACE_ENCODER_PRIV_MAX;
 	}
 
@@ -146,6 +1260,26 @@ int gtrace__process_auxtrace_info(union perf_event *event,
 		goto err_free_metadata;
 	}
 
+	err = auxtrace_queues__init_nr(&ptr->queues, max_cpu + 1);
+	if (err)
+		goto err_free_metadata;
+
+	for (unsigned int j = 0; j < ptr->queues.nr_queues; ++j) {
+		err = gtrace_setup_queue(ptr, &ptr->queues.queue_array[j], j);
+		if (err)
+			goto err_free_queues;
+	}
+
+	if (session->itrace_synth_opts->set) {
+		ptr->synth_opts = *session->itrace_synth_opts;
+	} else {
+		itrace_synth_opts__set_default(&ptr->synth_opts,
+				session->itrace_synth_opts->default_no_sample);
+		ptr->synth_opts.callchain = false;
+		ptr->synth_opts.thread_stack = session->itrace_synth_opts->thread_stack;
+	}
+
+
 	ptr->session = session;
 	ptr->machine = &session->machines.host;
 	ptr->auxtrace_type = auxtrace_info->type;
@@ -161,10 +1295,52 @@ int gtrace__process_auxtrace_info(union perf_event *event,
 	ptr->auxtrace.evsel_is_auxtrace = gtrace_evsel_is_auxtrace;
 	session->auxtrace = &ptr->auxtrace;
 
-	return 0;
+	gtrace_setup_timeless_decoding(ptr);
+
+	/* Load firmware binary if specified */
+	if (symbol_conf.firmware_name) {
+		u64 base_addr = 0;
+
+		if (symbol_conf.firmware_base)
+			base_addr = strtoull(symbol_conf.firmware_base, NULL, 0);
+
+		ptr->firmware_dso = dso__new(symbol_conf.firmware_name);
+		if (ptr->firmware_dso) {
+			ptr->firmware_maps = maps__new(ptr->machine);
+			if (!ptr->firmware_maps ||
+				gtrace_register_firmware_maps(ptr,
+							      ptr->firmware_dso,
+							      base_addr) < 0) {
+				pr_err("Failed to register machine code maps: %s\n",
+					symbol_conf.firmware_name);
+				dso__put(ptr->firmware_dso);
+				ptr->firmware_dso = NULL;
+				maps__put(ptr->firmware_maps);
+				ptr->firmware_maps = NULL;
+			}
+		}
+	}
 
+	err = gtrace_synth_events(ptr, session);
+	if (err)
+		goto err_free_queues;
+
+	err = gtrace_queue_aux_records(session);
+	if (err)
+		goto err_free_queues;
+
+	err = gtrace_create_decoders(ptr);
+	if (err)
+		goto err_free_queues;
+
+	ptr->data_queued = ptr->queues.populated;
+	return 0;
+err_free_queues:
+	auxtrace_queues__free(&ptr->queues);
+	session->auxtrace = NULL;
 err_free_metadata:
 	for (int j = 0; j < num_cpu; j++)
-		zfree(&metadata);
+		zfree(&metadata[j]);
+	zfree(&metadata);
 	return err;
 }
diff --git a/tools/perf/util/symbol_conf.h b/tools/perf/util/symbol_conf.h
index 0dee5aa6a534..83fc134ea8ac 100644
--- a/tools/perf/util/symbol_conf.h
+++ b/tools/perf/util/symbol_conf.h
@@ -72,6 +72,8 @@ struct symbol_conf {
 			prefer_latency;
 	const char	*vmlinux_name,
 			*kallsyms_name,
+			*firmware_name,
+			*firmware_base,
 			*source_prefix,
 			*field_sep,
 			*graph_function;
-- 
2.34.1

