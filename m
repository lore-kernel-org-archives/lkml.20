Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AE445DF43
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790629317; cv=none; b=uCdqJ5VfMxz+qSU9PEgo2bYyZFYGh49IaTUQEuxgDypyxXmPpyzEtBhx5LuzTtni2FSSDnCeowavTeP01KcuUdTQrvjzWA0jm8ItlQdflcMh2AGTseukQEVOQi8SUXi2KocrEhz991cLQ0mzBbevgqfqJ/1hKPWUmDWvO9R7gQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790629317; c=relaxed/simple;
	bh=aqVo3BOcv+klIIAlFks9tIXlbtqM31fa2bf5dHDLv70=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=lu+stX1TG75JZRsfKK0IXF+ca0UUlsDEH+w35nztvhNBAMdfkYzDyaumHEqdQaVwZ2p5IPbhuK4ieHaZaLqG2vN2BEWjVtNQl7c7VnG7KSVvq45Z0A+lfTqOpzcQp0Nx6OreYUZDljhrKAk7WiABZnMG6AVVmKE+tmI0bELtSjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Vd8MBCaY; arc=none smtp.client-ip=74.125.82.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Vd8MBCaY"
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1431ba79941so3255696c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790629312; x=1791234112; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:mime-version:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kKWT8inMWguc1Y3h7AS4GY52a3WZwbqDnRuRo++dn+Q=;
        b=Vd8MBCaYSPuA1uABSqU6dS8cHucknv6es+r77+pkLy4pexqWZsCPQKUCKQBWIjUga8
         N8qfNq0v4t9bA8J54UajV7UybY1SYOJEZedmxET+X7m2luNlGOqpeBdC0dCE4c9kdRIq
         VkSvMZ60kwn9R510F6OANf9cvM1Y8slxoAQGt5ebcdxSAmALs/ql8sRcaQxyKOMFPeNM
         UJ7FIvtYdOCg86s0kSdu7QqCpKJU8mclHFW0rJ/gJ9g4o5mLi6g4ivyWWuIq8k3A5CUS
         XmSk/XLfOuLFsE93tbc3QrgtJ8AM1YNxvGp/68vKtA+X84xXZhnd4+7Itf26kZRN9hbR
         K0ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790629312; x=1791234112;
        h=content-type:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kKWT8inMWguc1Y3h7AS4GY52a3WZwbqDnRuRo++dn+Q=;
        b=fxyYvOaaQKOndyaY7MGYbV6BpwoZ+h4jrUb6ROH2dpAN/9uQhvac2/2kFcbODgUIT+
         ITe9xcj7J6YF4Z/6GxQTYtkiaZoMrTpkwBs1TNWFM9JiOITt8a7PBocOgYpo3rQqtqAP
         f+WpzwtX91aO4rwFQu+NtlbQuCFO290XLFDOW2tDyxdk3XJukE7zyLMO5ILzI2ZDlkjl
         tWQGIfCCOjQ8vZbFv1BbGYa1DFxi5l5Waa/UieH4SVXCJHl5Wr0XNdL7c2hVLluKuyrT
         lPzW9d4TlX/lBCKLMW6n9jHNQ2zSw7Di7rwfyLqJt+pEuPcsobXY79DpKtXdjGEMWNnG
         qbOg==
X-Forwarded-Encrypted: i=1; AKwUvBzXjXT81r/kfbxEo1JNu+2SQ2nDFN8fsDdNHQyAN9CkWYqzbCcV6UYJSwVNy5MNTwmNtE5Ivbnu3XrBhpw=@vger.kernel.org
X-Gm-Message-State: AFuF++lw4wyxpkhVowBLh1+/WzrZLpGZQnAbRHM4Ol/uIftVFDa+cUSw
	NdAWXgFmRtKhGNIefJVmNlqOOkSGJJMKe4/G5OVxEf6egqio/trSIdyCW9Mpdk/U8dhjbylTC/M
	hf2r1JXFKZw==
X-Received: from dlbsw8.prod.google.com ([2002:a05:7022:3a88:b0:145:9130:6444])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7023:881:b0:143:297c:276c
 with SMTP id a92af1059eb24-146d03a10e5mr11194611c88.33.1790629310369; Mon, 28
 Sep 2026 14:01:50 -0700 (PDT)
Date: Mon, 28 Sep 2026 14:01:43 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928210144.3925224-1-irogers@google.com>
Subject: [PATCH v1 1/2] perf test: Add per-test timeout support
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Dmitrii Dolgov <9erthalion6@gmail.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When a test hangs in 'perf test', the entire test run hangs and makes it
difficult to inspect output from other tests.

Add a new TEST_TIMEOUT result category and a per-test timeout (default
60 seconds, configurable via '-t'/'--timeout', with 0 to disable). When
'-F' ('--dont-fork') is specified, timeouts are disabled.

To enforce the timeout:
- Place each forked test child into its own process group via
  setpgid(0, 0) in the child and setpgid(pid, pid) in the parent so any
  subprocesses spawned by shell or workload tests can be terminated
  together.
- Arm an ITIMER_REAL periodic timer with a SIGALRM handler (using
  SA_RESTART so /proc status reads in check_if_command_finished() are
  not interrupted by EINTR while poll()/usleep() waits still wake up).
- Check elapsed child runtimes against test_timeout in finish_test() and
  finish_tests_parallel(), sending SIGTERM first and escalating to
  SIGKILL after 1 second if the child process group has not exited.
- Report timed out tests in red ('TIMEOUT!'), track and display them in
  the test summary, and emit '<error message="TIMEOUT" type="timeout">'
  counted under the 'errors' attribute in JUnit XML output.
- Document '-t'/'--timeout' and '-F'/'--dont-fork' in perf-test.txt.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Documentation/perf-test.txt |   7 +-
 tools/perf/tests/builtin-test.c        | 179 ++++++++++++++++++++++---
 tools/perf/tests/tests.h               |   7 +-
 3 files changed, 174 insertions(+), 19 deletions(-)

diff --git a/tools/perf/Documentation/perf-test.txt b/tools/perf/Documentation/perf-test.txt
index 859df74e62ef..16d940e8d221 100644
--- a/tools/perf/Documentation/perf-test.txt
+++ b/tools/perf/Documentation/perf-test.txt
@@ -45,10 +45,15 @@ OPTIONS
 	Run each test the given number of times, by default once. This
 	option can be useful to determine if a test is flaky.
 
+-t::
+--timeout::
+	Timeout for each forked test in seconds, by default 60 seconds. Specify
+	0 to disable the timeout. Ignored when -F/--dont-fork is used.
+
 -F::
 --dont-fork::
 	Do not fork child for each test, run all tests within single process, this
-	sets sequential mode.
+	sets sequential mode and disables the per-test timeout.
 
 --dso::
 	Specify a DSO for the "Symbols" test.
diff --git a/tools/perf/tests/builtin-test.c b/tools/perf/tests/builtin-test.c
index d2f594921e25..451d98d7edad 100644
--- a/tools/perf/tests/builtin-test.c
+++ b/tools/perf/tests/builtin-test.c
@@ -11,8 +11,11 @@
 #include <execinfo.h>
 #endif
 #include <setjmp.h>
+#include <signal.h>
+#include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
+#include <time.h>
 
 #include "util/config.h"
 
@@ -60,6 +63,8 @@ static bool sequential;
 static unsigned int runs_per_test = 1;
 /* Number of lines to include in failure snippet. */
 static unsigned int failure_snippet_lines = 10;
+/* Timeout per test in seconds (0 for no timeout). */
+static unsigned int test_timeout = 60;
 const char *dso_to_test;
 const char *test_objdump_path = "objdump";
 static const char *workload_control;
@@ -330,8 +335,11 @@ struct child_test {
 	struct strbuf err_output;
 	int result;
 	bool done;
+	bool timed_out;
+	bool sigkill_sent;
 	struct timespec start_time;
 	struct timespec end_time;
+	struct timespec timeout_time;
 };
 
 static jmp_buf run_test_jmp_buf;
@@ -359,12 +367,21 @@ static int run_test_child(struct child_process *process)
 	struct child_test *child = container_of(process, struct child_test, process);
 	int err;
 
+	/*
+	 * Place the forked test into its own process group (pgid == pid) so
+	 * that any subprocesses it spawns (e.g. shell tests running via
+	 * system() and their child perf/workload processes) inherit this
+	 * process group. On timeout or interruption, signaling -pid kills the
+	 * entire test process tree without leaving orphaned background
+	 * processes or affecting the parent perf process and other tests.
+	 */
+	setpgid(0, 0);
 	close_parent_fds();
 
 	err = sigsetjmp(run_test_jmp_buf, 1);
 	if (err) {
 		/* Received signal. */
-		err = err > 0 ? -err : -1;
+		err = TEST_FAIL;
 		goto err_out;
 	}
 
@@ -378,20 +395,31 @@ static int run_test_child(struct child_process *process)
 
 	check_leaks();
 err_out:
-	fflush(NULL);
 	for (size_t i = 0; i < ARRAY_SIZE(signals); i++)
 		signal(signals[i], SIG_DFL);
+	if (err == TEST_FAIL) {
+		/*
+		 * Wait for any spawned child processes (such as shell scripts
+		 * running trap cleanup handlers on SIGTERM) to finish before
+		 * exiting.
+		 */
+		while (waitpid(-1, NULL, 0) > 0 || errno == EINTR)
+			;
+	}
+	fflush(NULL);
 	return -err;
 }
 
-#define TEST_RUNNING -3
+#define TEST_RUNNING -4
 
 static struct pollfd *global_pfds;
 static size_t *global_pfd_indices;
 static unsigned int summary_tests_passed;
 static unsigned int summary_subtests_passed;
 static unsigned int summary_tests_skipped;
+static unsigned int summary_tests_timed_out;
 static unsigned int summary_tests_failed;
+static struct strbuf summary_timed_out_tests_buf = STRBUF_INIT;
 static struct strbuf summary_failed_tests_buf = STRBUF_INIT;
 
 static int strbuf_addstr_safe(struct strbuf *sb, const char *s);
@@ -507,6 +535,18 @@ static int print_test_result(struct test_suite *t, int curr_suite, int curr_test
 			color_fprintf(debug_file(), PERF_COLOR_YELLOW, " Skip\n");
 	}
 		break;
+	case TEST_TIMEOUT:
+		summary_tests_timed_out++;
+		if (test_suite__num_test_cases(t) > 1)
+			strbuf_addf_safe(&summary_timed_out_tests_buf, "  %3d.%1d: %s\n",
+				    curr_suite + 1, curr_test_case + 1,
+				    test_description(t, curr_test_case));
+		else
+			strbuf_addf_safe(&summary_timed_out_tests_buf, "  %3d: %s\n",
+				    curr_suite + 1,
+				    test_description(t, curr_test_case));
+		color_fprintf(debug_file(), PERF_COLOR_RED, " TIMEOUT!\n");
+		break;
 	case TEST_FAIL:
 	default:
 		summary_tests_failed++;
@@ -532,7 +572,11 @@ static int print_test_result(struct test_suite *t, int curr_suite, int curr_test
 		strbuf_addf(&junit_xml_buf,
 			    "    <testcase classname=\"%s\" name=\"%s\" time=\"%.2f\">\n",
 			    escaped_class, escaped_test, elapsed);
-		if (result != TEST_OK && result != TEST_SKIP) {
+		if (result == TEST_TIMEOUT) {
+			strbuf_addf(&junit_xml_buf,
+				    "      <error message=\"TIMEOUT\" type=\"timeout\">\n%s\n      </error>\n",
+				    escaped_err);
+		} else if (result != TEST_OK && result != TEST_SKIP) {
 			strbuf_addf(&junit_xml_buf,
 				    "      <failure message=\"FAILED\">\n%s\n      </failure>\n",
 				    escaped_err);
@@ -561,7 +605,7 @@ static int print_test_result(struct test_suite *t, int curr_suite, int curr_test
 
 static const char * const fail_keywords[] = {
 	"error", "fail", "segv", "abort",
-	"signal", "fatal", "panic", "corrupt", NULL
+	"signal", "fatal", "panic", "corrupt", "timeout", NULL
 };
 
 static const char *find_next_keyword(const char *str, size_t max_len, size_t *kw_len)
@@ -748,6 +792,47 @@ static void print_test_failure_snippet(FILE *fp, const char *buf)
 	free(line_lens);
 }
 
+static void cmd_test_alarm_handler(int sig __maybe_unused)
+{
+}
+
+static void check_child_timeout(struct child_test *child, const struct timespec *now)
+{
+	double elapsed;
+	pid_t pid;
+
+	if (!test_timeout || !child || child->done || child->process.finished)
+		return;
+
+	pid = child->process.pid;
+	if (pid <= 0)
+		return;
+
+	if (!child->timed_out) {
+		elapsed = (now->tv_sec - child->start_time.tv_sec) +
+			  (now->tv_nsec - child->start_time.tv_nsec) / 1000000000.0;
+		if (elapsed >= test_timeout) {
+			child->timed_out = true;
+			child->timeout_time = *now;
+			pr_debug3("Timeout (%us) for test %d.%d (pid %d), sending SIGTERM\n",
+				  test_timeout, child->suite_num + 1,
+				  child->test_case_num + 1, pid);
+			kill(-pid, SIGTERM);
+			kill(pid, SIGTERM);
+		}
+	} else if (!child->sigkill_sent) {
+		elapsed = (now->tv_sec - child->timeout_time.tv_sec) +
+			  (now->tv_nsec - child->timeout_time.tv_nsec) / 1000000000.0;
+		if (elapsed >= 1.0) {
+			child->sigkill_sent = true;
+			pr_debug3("Sending SIGKILL to timed out test %d.%d (pid %d)\n",
+				  child->suite_num + 1, child->test_case_num + 1, pid);
+			kill(-pid, SIGKILL);
+			kill(pid, SIGKILL);
+		}
+	}
+}
+
 static void finish_test(struct child_test **child_tests, int running_test, int child_test_num,
 		int width)
 {
@@ -797,6 +882,12 @@ static void finish_test(struct child_test **child_tests, int running_test, int c
 			  .events = POLLIN | POLLERR | POLLHUP | POLLNVAL,
 			},
 		};
+		if (test_timeout > 0) {
+			struct timespec now;
+
+			clock_gettime(CLOCK_MONOTONIC, &now);
+			check_child_timeout(child_test, &now);
+		}
 		if (perf_use_color_default) {
 			int running = 0;
 
@@ -837,10 +928,14 @@ static void finish_test(struct child_test **child_tests, int running_test, int c
 					err_done = false;
 					buf[len] = '\0';
 					strbuf_addstr_safe(&err_output, buf);
+				} else if (pfds[0].revents & (POLLHUP | POLLERR | POLLNVAL)) {
+					close(err);
+					err = -1;
+					child_test->process.err = -1;
 				}
 			}
 		}
-		if (err_done)
+		if (err_done || child_test->timed_out)
 			err_done = check_if_command_finished(&child_test->process);
 	}
 	/* Drain any remaining data from the pipe. */
@@ -859,6 +954,8 @@ static void finish_test(struct child_test **child_tests, int running_test, int c
 	}
 	/* Clean up child process. */
 	ret = finish_command(&child_test->process);
+	if (child_test->timed_out)
+		ret = TEST_TIMEOUT;
 	child_test->process.pid = 0;
 	if (child_test->err_output.len > 0) {
 		struct strbuf merged = STRBUF_INIT;
@@ -872,7 +969,7 @@ static void finish_test(struct child_test **child_tests, int running_test, int c
 	}
 	if (verbose > 1)
 		fprintf(stderr, "%s", err_output.buf);
-	else if (verbose == 1 && ret == TEST_FAIL)
+	else if (verbose == 1 && (ret == TEST_FAIL || ret == TEST_TIMEOUT))
 		print_test_failure_snippet(stderr, err_output.buf);
 
 	clock_gettime(CLOCK_MONOTONIC, &end_time);
@@ -1018,6 +1115,7 @@ static int finish_tests_parallel(struct child_test **child_tests, size_t num_tes
 	while (next_to_print < num_tests) {
 		size_t running_count = 0;
 		size_t p;
+		struct timespec now;
 
 		while (next_to_print < num_tests &&
 		       (!child_tests[next_to_print] || child_tests[next_to_print]->done))
@@ -1027,6 +1125,8 @@ static int finish_tests_parallel(struct child_test **child_tests, size_t num_tes
 			break;
 
 		num_pfds = 0;
+		if (test_timeout > 0)
+			clock_gettime(CLOCK_MONOTONIC, &now);
 
 		for (i = next_to_print; i < num_tests; i++) {
 			struct child_test *child = child_tests[i];
@@ -1034,6 +1134,9 @@ static int finish_tests_parallel(struct child_test **child_tests, size_t num_tes
 			if (!child || child->done)
 				continue;
 
+			if (test_timeout > 0)
+				check_child_timeout(child, &now);
+
 			if (!check_if_command_finished(&child->process))
 				running_count++;
 
@@ -1097,6 +1200,8 @@ static int finish_tests_parallel(struct child_test **child_tests, size_t num_tes
 					child->process.err = -1;
 				}
 				child->result = finish_command(&child->process);
+				if (child->timed_out)
+					child->result = TEST_TIMEOUT;
 				child->process.pid = 0;
 				clock_gettime(CLOCK_MONOTONIC, &child->end_time);
 				child->done = true;
@@ -1141,7 +1246,8 @@ static int finish_tests_parallel(struct child_test **child_tests, size_t num_tes
 
 			if (verbose > 1)
 				fprintf(stderr, "%s", child->err_output.buf);
-			else if (verbose == 1 && child->result == TEST_FAIL)
+			else if (verbose == 1 &&
+				 (child->result == TEST_FAIL || child->result == TEST_TIMEOUT))
 				print_test_failure_snippet(stderr, child->err_output.buf);
 
 			elapsed = (child->end_time.tv_sec - child->start_time.tv_sec) +
@@ -1218,14 +1324,20 @@ static int start_test(struct test_suite *test, int curr_suite, int curr_test_cas
 		(*child)->process.stdout_to_stderr = 1;
 	}
 	(*child)->process.no_exec_cmd = run_test_child;
+	clock_gettime(CLOCK_MONOTONIC, &(*child)->start_time);
+	err = start_command(&(*child)->process);
+	if (err)
+		return err;
+	/*
+	 * Also set the child's process group in the parent to avoid a race if
+	 * the parent signals -pid before the child executes setpgid(0, 0).
+	 */
+	setpgid((*child)->process.pid, (*child)->process.pid);
 	if (sequential || pass == 2) {
-		err = start_command(&(*child)->process);
-		if (err)
-			return err;
 		finish_test(child, /*running_test=*/0, /*child_test_num=*/1, width);
 		return 0;
 	}
-	return start_command(&(*child)->process);
+	return 0;
 }
 
 /* State outside of __cmd_test for the sake of the signal handler. */
@@ -1245,6 +1357,14 @@ static void print_tests_summary(void)
 	pr_info("Passed main tests : %u\n", summary_tests_passed);
 	pr_info("Passed subtests   : %u\n", summary_subtests_passed);
 	pr_info("Skipped tests     : %u\n", summary_tests_skipped);
+	if (summary_tests_timed_out > 0) {
+		color_fprintf(debug_file(), PERF_COLOR_RED, "Timed out tests   : %u\n",
+			      summary_tests_timed_out);
+		pr_info("List of timed out tests:\n");
+		pr_info("%s", summary_timed_out_tests_buf.buf);
+	} else {
+		color_fprintf(debug_file(), PERF_COLOR_GREEN, "Timed out tests   : 0\n");
+	}
 	if (summary_tests_failed > 0) {
 		color_fprintf(debug_file(), PERF_COLOR_RED, "Failed tests      : %u\n",
 			      summary_tests_failed);
@@ -1265,12 +1385,15 @@ static void print_tests_summary(void)
 				unsigned int total = summary_tests_passed +
 						     summary_subtests_passed +
 						     summary_tests_skipped +
+						     summary_tests_timed_out +
 						     summary_tests_failed;
 				fprintf(fp, "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n");
 				fprintf(fp, "<testsuites>\n");
 				fprintf(fp,
-					"  <testsuite name=\"perf-tests\" tests=\"%u\" failures=\"%u\" skipped=\"%u\">\n",
-					total, summary_tests_failed,
+					"  <testsuite name=\"perf-tests\" tests=\"%u\" failures=\"%u\" errors=\"%u\" skipped=\"%u\">\n",
+					total,
+					summary_tests_failed,
+					summary_tests_timed_out,
 					summary_tests_skipped);
 				fprintf(fp, "%s", junit_xml_buf.buf);
 				fprintf(fp, "  </testsuite>\n");
@@ -1288,6 +1411,7 @@ static void print_tests_summary(void)
 		}
 	}
 	strbuf_release(&junit_xml_buf);
+	strbuf_release(&summary_timed_out_tests_buf);
 	strbuf_release(&summary_failed_tests_buf);
 }
 
@@ -1327,12 +1451,27 @@ static int __cmd_test(struct test_suite **suites, int argc, const char *argv[],
 			pr_debug3("Killing %d pid %d\n",
 				  child_test->suite_num + 1,
 				  child_test->process.pid);
+			kill(-child_test->process.pid, err);
 			kill(child_test->process.pid, err);
 		}
 		goto err_out;
 	}
 	signal(SIGINT, cmd_test_sig_handler);
 	signal(SIGTERM, cmd_test_sig_handler);
+	if (!dont_fork && test_timeout > 0) {
+		struct sigaction sa = {
+			.sa_handler = cmd_test_alarm_handler,
+			.sa_flags = SA_RESTART,
+		};
+		struct itimerval timer = {
+			.it_interval = { .tv_sec = 1, .tv_usec = 0 },
+			.it_value = { .tv_sec = 1, .tv_usec = 0 },
+		};
+
+		sigemptyset(&sa.sa_mask);
+		sigaction(SIGALRM, &sa, NULL);
+		setitimer(ITIMER_REAL, &timer, NULL);
+	}
 
 	/*
 	 * In parallel mode pass 1 runs non-exclusive tests in parallel, pass 2
@@ -1430,6 +1569,12 @@ static int __cmd_test(struct test_suite **suites, int argc, const char *argv[],
 		for (size_t x = 0; x < num_tests; x++)
 			finish_test(child_tests, x, num_tests, width);
 	}
+	if (!dont_fork && test_timeout > 0) {
+		struct itimerval timer = {};
+
+		setitimer(ITIMER_REAL, &timer, NULL);
+		signal(SIGALRM, SIG_DFL);
+	}
 	print_tests_summary();
 	free(global_pfds);
 	free(global_pfd_indices);
@@ -1762,6 +1907,8 @@ int cmd_test(int argc, const char **argv)
 		    "Run the tests one after another rather than in parallel"),
 	OPT_UINTEGER('r', "runs-per-test", &runs_per_test,
 		     "Run each test the given number of times, default 1"),
+	OPT_UINTEGER('t', "timeout", &test_timeout,
+		     "Timeout for each test in seconds, default 60s (0 to disable)"),
 	OPT_STRING('w', "workload", &workload, "work", "workload to run for testing, use '--list-workloads' to list the available ones."),
 	OPT_STRING(0, "record-ctl", &workload_control, "fifo:ctl-fifo[,ack-fifo]",
 		   "Write enable to the fifo just before running the workload and disable after, with optional ack from ack-fifo"),
@@ -1824,8 +1971,10 @@ int cmd_test(int argc, const char **argv)
 		return 0;
 	}
 
-	if (dont_fork)
+	if (dont_fork) {
 		sequential = true;
+		test_timeout = 0;
+	}
 
 	symbol_conf.priv_size = sizeof(int);
 	symbol_conf.try_vmlinux_path = true;
diff --git a/tools/perf/tests/tests.h b/tools/perf/tests/tests.h
index 9c96f33483d1..2de66dc2e701 100644
--- a/tools/perf/tests/tests.h
+++ b/tools/perf/tests/tests.h
@@ -6,9 +6,10 @@
 #include "util/debug.h"
 
 enum {
-	TEST_OK   =  0,
-	TEST_FAIL = -1,
-	TEST_SKIP = -2,
+	TEST_OK      =  0,
+	TEST_FAIL    = -1,
+	TEST_SKIP    = -2,
+	TEST_TIMEOUT = -3,
 };
 
 #define TEST_ASSERT_VAL(text, cond)					 \
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

