Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825993;
	b=g4OROlFJ7x9GXX/8eYNhR2eX2PkixgApHubV3wa9SUygZ7cmn10xEDOFREIFxyDJmKGS
	 u3d0hkzbcJc/vKXDAOJ0EvGYvOpDpjpSGdeRMihSafHaWLrE305JOQGnvSCRdztSbpRW2
	 2a49+9WWl3Z1kg1ZS20Qst0W5LJA6pig5Zc/9xbC8afgxQfcpB0zqtSQOoG8Od1tMyxkD
	 d0WcY/6484cTxwocSATw8jf+Fw2tf2V6OIHKGl/7bYDEysUSmapylNwyZMxZALmFtcLV0
	 7RtcZH3MPnRs/gCLnFCM8pDfnOUX/nKHDRe5ExAqc8MImxNQ11Zu43EoWoVw5aph84w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=71mJGJZNH6cogPzlP4IDLPHHrA5MvoABWmVXrE7uP/E=;
	b=2bzgIPNc92umpu5Sn8QUTl9BDsPn8yljnfFLa4BKQU3mhAAjFdE05b5RUzFSrmTnFU9B
	 oHvUhdmGxjHRkv5mii5JPjgTVAmEXo8Y4sdK4IlBrFnemHUbzy5/D6JcrfZD6xgSkcQ2J
	 UW/vO+nErwsrpcYSIWNnaB44W0cAeSkg4aCxlHVtVehcApc0hAA4lic1lif1CseeQzMab
	 W37hBcqmUosRB9BJm8aj5WTa5XlGgW3+CBI9kspj9qirAq6VjnAkCoEOtPolQWazlKRHV
	 aSQT906L3mbRLVTu91T8AR87IBcAGUD0sjxIw+y0miTd1S8CW7odJ4iwYT5UmlqVUHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NmXgZieE;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC3F60E7515
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:59:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BC3F60E7515
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NmXgZieE
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso2043551eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793825992; x=1794430792; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=71mJGJZNH6cogPzlP4IDLPHHrA5MvoABWmVXrE7uP/E=;
        b=NmXgZieEPu9xzhYc1SSPkZ41Vz12oOSCYrzihpXJzXFeyT6qcRvksFlU86WEEcNKlh
         aokgrX5/OrW0+MpCgA4rCSkvCKh9hiVloVNm8XBuSMRtZoRjHPv249M05BV10pydIxyJ
         vhjRe2AZEKJLpRPeve5SY+jT1efSyk28hXkM4PLST8+pZCKVbsIU5+OcHUXVhw3NdX58
         vGH7fB5fNEpddsF05r+BLxCGDinO2wRLlmVYDOWEuO7kWDSIljK4edKXwhvQlZTp6DJg
         cCmqKgn9dpY+Qa2sMa93hVT4aT38csX3D/b2zP/1E5jURlcYPeUuO71FnDojwMVojkaJ
         G4CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825992; x=1794430792;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=71mJGJZNH6cogPzlP4IDLPHHrA5MvoABWmVXrE7uP/E=;
        b=SP4IOHZT1XbKDs8lWb4UEOyvTVxY4q4lw48cKnWlHPLvMyp3nG7uFBaGb2wV1ksBHs
         kx2avU2ZdXpDVMs5mF/yGTqpeiuMZRc/lXH+dz367pgyUJTfmT00ZOtK/9nfsRQ7kWAV
         ugyiJ3n+8U6G4yW4l+zbgI7EKG7rQSb/vuL757chw+UVdWb6zbezBDOX1E05JE/KWeL7
         A3CSmDety/yMkHiov6WNnDrWcXSrze0fTrVYXHg7Owv08KjDsJ+dNHrcm8xO9F5EsfmC
         8VfrtgfsiZqeMBF4L0ClWSfQJ6H6Ks8NuMFkhMidJ2qNn/zmFRZcCWU7XFc0xijP49xs
         Cy5A==
X-Forwarded-Encrypted: i=1; AKwUvBw6ze8/8kMkV71GaOpCk2Oyd3G5E9Cedwk76hcqeDo80rxnpboTNLVWXvZvOh0xmExLuDQMewnMZs02YL0=@vger.kernel.org
X-Gm-Message-State: APuU4Z82HC3giQ6tI1jNT4OmQzrte81HWXoVqIi1MQHkafrmGUqE4/wp
	H0s0RafWUynmC8omz34JMBPh9sMZOw0NqUYeo1K0ExBelDvZCf2+b4Bv8xkrxrjNmuDZFEfbYNE
	pBB4k8hkD+g==
X-Received: from dybgk1.prod.google.com ([2002:a05:7301:181:b0:351:1da6:c2e7])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:3a94:b0:34d:2c1a:9892
 with SMTP id 5a478bee46e88-36a424988b7mr24518883eec.40.1793825991963; Wed, 04
 Nov 2026 12:59:51 -0800 (PST)
Date: Wed,  4 Nov 2026 12:59:05 -0800
In-Reply-To: <20261104205909.2078411-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261104205909.2078411-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261104205909.2078411-16-irogers@google.com>
Subject: [PATCH v9 15/19] perf intel-tpebs: Fix race in tpebs_stop() and
 tpebs_cmd.out fd handling
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

In tpebs_stop(), read tpebs_reader_thread into a local variable before
releasing tpebs_mtx to call pthread_join().

Transfer ownership of tpebs_cmd.out to __sample_reader() by passing it as
the thread argument and setting tpebs_cmd.out = -1 in
evsel__tpebs_open() so tpebs_stop() does not double-close the fd closed
by perf_session__delete(). Also reset tpebs_cmd.pid = 0 and tpebs_cmd.out = -1 and return early if
start_command() fails in evsel__tpebs_start_perf_record(), as
start_command() closes the pipe internally and may leave cmd->pid = -1
on error, and join tpebs_reader_thread on error in evsel__tpebs_open()
if it was already started.

Include <pthread.h>, <signal.h>, <stdint.h>, <stdlib.h>, <string.h>, and
<unistd.h> explicitly.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/intel-tpebs.c | 51 ++++++++++++++++++++++++++++++-----
 1 file changed, 44 insertions(+), 7 deletions(-)

diff --git a/tools/perf/util/intel-tpebs.c b/tools/perf/util/intel-tpebs.c
index 7c0b8b15bd10..47c939fc2058 100644
--- a/tools/perf/util/intel-tpebs.c
+++ b/tools/perf/util/intel-tpebs.c
@@ -27,6 +27,12 @@
 #include <errno.h>
 #include <poll.h>
 #include <math.h>
+#include <pthread.h>
+#include <signal.h>
+#include <stdint.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
 
 #define PERF_DATA		"-"
 
@@ -120,10 +126,15 @@ static int evsel__tpebs_start_perf_record(struct evsel *evsel)
 	tpebs_cmd.out = -1;
 	ret = start_command(&tpebs_cmd);
 	zfree(&tpebs_cmd.argv);
+	if (ret) {
+		tpebs_cmd.pid = 0;
+		tpebs_cmd.out = -1;
+		return ret;
+	}
 	list_for_each_entry(t, &tpebs_results, nd)
 		t->started = true;
 
-	return ret;
+	return 0;
 }
 
 static bool is_child_pid(pid_t parent, pid_t child)
@@ -220,13 +231,13 @@ static int process_sample_event(const struct perf_tool *tool __maybe_unused,
 	return 0;
 }
 
-static void *__sample_reader(void *arg __maybe_unused)
+static void *__sample_reader(void *arg)
 {
 	struct perf_session *session;
 	struct perf_data data = {
 		.mode = PERF_DATA_MODE_READ,
 		.path = PERF_DATA,
-		.file.fd = tpebs_cmd.out,
+		.file.fd = (int)(intptr_t)arg,
 	};
 	struct perf_tool tool;
 
@@ -236,8 +247,10 @@ static void *__sample_reader(void *arg __maybe_unused)
 	tool.attr = perf_event__process_attr;
 
 	session = perf_session__new(&data, &tool);
-	if (IS_ERR(session))
+	if (IS_ERR(session)) {
+		close(data.file.fd);
 		return NULL;
+	}
 	perf_session__process_events(session);
 	perf_session__delete(session);
 
@@ -331,12 +344,19 @@ static int tpebs_stop(void) __must_hold(tpebs_mtx_get())
 	/* Like tpebs_start, we should only run tpebs_end once. */
 	if (tpebs_cmd.pid != 0) {
 		pid_t actual_pid = tpebs_cmd.pid;
+		pthread_t reader_thread;
 
 		tpebs_stopping = true;
 		tpebs_send_record_cmd(EVLIST_CTL_CMD_STOP_TAG);
+		/*
+		 * tpebs_results is empty when stopping; clear pid so
+		 * process_sample_event() ignores any late samples while
+		 * draining the pipe.
+		 */
 		tpebs_cmd.pid = 0;
+		reader_thread = tpebs_reader_thread;
 		mutex_unlock(tpebs_mtx_get());
-		pthread_join(tpebs_reader_thread, NULL);
+		pthread_join(reader_thread, NULL);
 		mutex_lock(tpebs_mtx_get());
 		if (control_fd[0] >= 0) {
 			close(control_fd[0]);
@@ -515,6 +535,7 @@ int evsel__tpebs_open(struct evsel *evsel)
 	int ret;
 	bool tpebs_empty;
 	bool started_process = false;
+	bool started_thread = false;
 
 	/* We should only run tpebs_start when tpebs_recording is enabled. */
 	if (!tpebs_recording)
@@ -567,12 +588,15 @@ int evsel__tpebs_open(struct evsel *evsel)
 			goto out;
 
 		if (pthread_create(&tpebs_reader_thread, /*attr=*/NULL, __sample_reader,
-				   /*arg=*/NULL)) {
+				   (void *)(intptr_t)tpebs_cmd.out)) {
 			kill(tpebs_cmd.pid, SIGTERM);
 			pr_err("Could not create thread to process sample data.\n");
 			ret = -1;
 			goto out;
 		}
+		/* __sample_reader now owns and closes the output fd. */
+		tpebs_cmd.out = -1;
+		started_thread = true;
 		ret = tpebs_send_record_cmd(EVLIST_CTL_CMD_ENABLE_TAG);
 	}
 out:
@@ -586,9 +610,22 @@ int evsel__tpebs_open(struct evsel *evsel)
 
 		if (started_process) {
 			if (tpebs_cmd.pid > 0) {
-				kill(tpebs_cmd.pid, SIGTERM);
+				pid_t actual_pid = tpebs_cmd.pid;
+
+				tpebs_stopping = true;
+				kill(actual_pid, SIGTERM);
+				tpebs_cmd.pid = 0;
+				if (started_thread) {
+					pthread_t reader_thread = tpebs_reader_thread;
+
+					mutex_unlock(tpebs_mtx_get());
+					pthread_join(reader_thread, NULL);
+					mutex_lock(tpebs_mtx_get());
+				}
+				tpebs_cmd.pid = actual_pid;
 				finish_command(&tpebs_cmd);
 				tpebs_cmd.pid = 0;
+				tpebs_stopping = false;
 			}
 			if (tpebs_cmd.out >= 0) {
 				close(tpebs_cmd.out);
-- 
2.56.0.455.g6c5a503b38-goog

