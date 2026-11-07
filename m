Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794030771;
	b=erIuwyT00ntL9JJrsN6XWR09CUo+1mKHthNjilbhb1izXGXiK2Dtu9r2a4AtvVPFmJc3
	 1CWPxPJ9XfwA+OY+lUqrVr5eltA2oy8TuHrG7iGfLaXhJncOMto030P1+Ab68GU8TsF+6
	 Z4Kd/kR2lD1OrjVGxwNqOwTYfIgMcKUiJSHeNurPGR44ojImL855cfZG0JuO3GK8a+Ru8
	 AWz5wr1Mms8zZQqjis1VblauhN28AehldsGisq8BW2AZE18Te/427k8EmaYQdn8Ur0P0s
	 jO6wvmUkEOLNXtD+xZexWfcbtA49HfS8oAY4skFkJ4gEwfN1XLq42WoxUFvDjjn89gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794030771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=EQX2zW/SJRxcCHgqz3pH4mbePZY/P8DRvidJCaOkct4=;
	b=N1ScJCHelHaEFSGME7QLnQyfiiKgCwqmpVgzKNMfhkH/mb14e3zLwm5ZOSHO3nHe+fWV
	 R4gVCbu46W2zx8S4P5vXUCjYtIcX+PsUT+n4EMeu1d0alHMcMdKo8TU/zHjmyTckhOJED
	 8B//aS3ObPYzLdZtzZdEGHYfIImvdUy6a3khnbYO2nEcfLL6ofRZQ56gXX2hqb3mzlDKP
	 oNMuyZIX9x3zE6eDE5jCeVOeuykDJLGwOj7+BqbVTsuY/kdrsLmb5gSHpB724X/tLX5c4
	 91aa6p9kmjGt+m9Mowdzo7T2sOeeKcNFNDakqJfKy8LrT0AG8Lo7tGRrDTViVhrtwHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y13YGM3T;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C502606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 05:52:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C502606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y13YGM3T
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ed2bfe3252so4688885ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 21:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794030770; x=1794635570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EQX2zW/SJRxcCHgqz3pH4mbePZY/P8DRvidJCaOkct4=;
        b=y13YGM3TjnQSoT5N9eVPyGygJSa5jYGjpORjqRVHk6AXP0qdLDY652+1N7y8PusINL
         tXE/HOPcD/iYM8S9ni+g7g8hKGnKEzhUberC3SBnCLrRxb2Fz4CH8z7MRz9aYQeqM0D6
         ggJAqtf9yOHvuByJc+8NUa8xswtUipuU4ydY30W2+eQDkjioAuAogFR/hcPjnOpNxRE5
         AOpq4QpM6mlf3T+y3b8s3EN10p2tX+vXSn9LGCMqiU4qzmGP+wxXOXDysunKXF3WuB7v
         DKqdb7Wr2LspnKIGvxuRNIoeXN9JI5z71iAvXkB9ewTnKvnk+VfELbZagf0WS1QWGI5L
         sN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794030770; x=1794635570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EQX2zW/SJRxcCHgqz3pH4mbePZY/P8DRvidJCaOkct4=;
        b=SQRU0/MBRKXEjGOFdCgWOju+xgCashWbePv32yZljCVWwuT2uvIDRg7RK3NaguYPBr
         4OLe+Mw8VYzrA7m/zhdLW4FzAMWHVAcYruDD/mHGlUMZkUX6FWAujHRo3suIPJnZE8UU
         8SbV8nktvlDKqDl6m0cn6avz6OyFDwQ5X+u/14UJow7PSM5F+NKXm6Hy4I0MjGp5w8ik
         gHxMm49Gy79zqBaathqmcIb3uyLK/If6lLtOwY/sf9yLYn5gmPc3dc/VHxv9jEDnCSKc
         E9rS9uWiJEtQS3vcJbD6fe5nfQG2iUeg1u17x3EfedxoGSWv+RN96DPICGDc6d919uwD
         oVKw==
X-Forwarded-Encrypted: i=1; AL+hErEX2PFAnyomyNdbxjveDoLIRMYFSYOv9s00hXHvD78Q6viwEvCfDoeKdVK8DiKAFz7UpwnMtPTNnZuzvbQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FVfu1QjhVBFBTJaHXB0r7L9z71nNAwVEM6+bJTUvRgfh/KGHW
	phLZ5pZS7jNcfHMWYzEBXrT6SJ6nF1JnvM9Egc6npioo1Q2xXllk1vsv
X-Gm-Gg: AYBFou2BXr85gngN7ASV/+VoVqRnODT11AzuENdehZW8hHx9LG279/dSZnb27g/VEXy
	RQF+UucKJxGcCy7vMM5uIJ8cGZSV6KJ6EiZBZLJtqj0ta9ZfMBdW2uDQofaNqA/VOQ4bEonyHU2
	3ug+h08L1gqN4QtRnLQon16mvfCWlBotvs8QKe0k8jNTnKfXJm/1jrSSrAEZU10Bk3RVJPz/iMZ
	flxmefk6nGBv8OxQe8JxF4D6ny+MsPseB7A1PCcCHW/Pb7jvW153RYZ5T+1Vvvo570jLitCrB0+
	zczx6cz++UDsdrSIyZXzvyrMsWPSFaeAOTM9I5ny3CovJamq7Tb4KjW47zya94Fc7We3HTQd92Q
	FFnr8cJ5tXp+8tHeY+6Bv8sQhaQf1PZn8o6IfsAVGyK9ja8ratHJgYpld4KuLsyjQ+QrsUaiuvG
	kMUeeR9BcejLOvgBqOAIfOHHBjbEtJ/CVm0oP1kDDlhzFhdv44zwTM04ptl9hrT+Ud2aFgfY18d
	RaZbVFFfKZFQ+1Xua2SwFI6jqOjyNulJnMJarnuVYKUMtuZiu+gpVyuYUqiwP9T4NclvBr7Ah0s
	TJcDRjCJFeChU3HdB2pkED8IjXYOBxNWlwjFRb1xW+s3JFBpQYRoWe7VW9SMY/Z3Z0AVrA==
X-Received: by 2002:a17:902:830c:b0:2ed:21fb:e75f with SMTP id d9443c01a7336-2ed41c62132mr36730435ad.48.1794030769567;
        Fri, 06 Nov 2026 21:52:49 -0800 (PST)
Received: from lipengfei28-ThinkStation-P368.mioffice.cn ([2408:8607:1b00:8:a1a:7bc2:20ba:a479])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d8949fsm11189465ad.62.2026.11.06.21.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 21:52:47 -0800 (PST)
From: Li Pengfei <ljdlns1987@gmail.com>
X-Google-Original-From: Li Pengfei <lipengfei28@xiaomi.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: mathieu.desnoyers@efficios.com,
	mark.rutland@arm.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhangbo56@xiaomi.com,
	lipengfei28@xiaomi.com,
	lkp@intel.com
Subject: [PATCH v8 5/5] selftests/ftrace: Add a stackmap basic functionality test
Date: Sat,  7 Nov 2026 13:51:39 +0800
Message-Id: <20261107055139.3138633-6-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261107055139.3138633-1-lipengfei28@xiaomi.com>
References: <20261107055139.3138633-1-lipengfei28@xiaomi.com>
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

From: Pengfei Li <lipengfei28@xiaomi.com>

Check that stacks are deduplicated, that a reset succeeds while tracing
runs and clears the map but not the ring buffer, that the statistics
match the map, and that free waits for open readers and the next map
continues the generation.

Assisted-by: LLM
Signed-off-by: Pengfei Li <lipengfei28@xiaomi.com>
---
 .../ftrace/test.d/ftrace/stackmap-basic.tc    | 222 ++++++++++++++++++
 1 file changed, 222 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/ftrace/stackmap-basic.tc

diff --git a/tools/testing/selftests/ftrace/test.d/ftrace/stackmap-basic.tc b/tools/testing/selftests/ftrace/test.d/ftrace/stackmap-basic.tc
new file mode 100644
index 000000000000..f5d1ebd8728e
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/ftrace/stackmap-basic.tc
@@ -0,0 +1,222 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: ftrace - stackmap basic functionality
+# requires: stack_map stack_map_stat options/stackmap options/stacktrace events/sched/sched_switch/enable
+
+# Check deduplication, that reset clears the map but not the ring buffer,
+# that the statistics match the map, and the free and generation rules.
+
+fail() {
+    echo "FAIL: $1"
+    exit_fail
+}
+
+records() { awk '/^stack_id / { n++ } END { print n + 0 }' stack_map; }
+hits() { awk '/^stack_id / { s += $6 } END { print s + 0 }' stack_map; }
+max_ref() { awk '/^stack_id / { if ($6 > m) m = $6 } END { print m + 0 }' stack_map; }
+first_gen() { awk '/^stack_id / { print $4; exit }' stack_map; }
+stat_val() { awk -v k="$1:" '$1 == k { print $2 }' stack_map_stat; }
+
+wait_for_worker_stopped() {
+    tries=0
+    while [ "$tries" -lt 100 ]; do
+        state=
+        if state=$(awk '/^State:/ { print $2 }' "/proc/$worker/status" \
+                2>/dev/null); then
+            case "$state" in
+            T|t)
+                return 0
+                ;;
+            esac
+        else
+            return 1
+        fi
+        sleep 0.01
+        tries=$((tries + 1))
+    done
+    return 1
+}
+
+worker=
+free_pid=
+
+cleanup() {
+    exec 3<&- 2>/dev/null || :
+    [ -z "$free_pid" ] || wait "$free_pid" 2>/dev/null || :
+    disable_tracing 2>/dev/null || :
+    if [ -n "$worker" ]; then
+        kill -CONT "$worker" 2>/dev/null || :
+        kill "$worker" 2>/dev/null || :
+        wait "$worker" 2>/dev/null || :
+    fi
+    echo 0 > events/sched/sched_switch/filter 2>/dev/null || :
+    echo 0 > events/sched/sched_switch/enable 2>/dev/null || :
+    echo 0 > options/stackmap 2>/dev/null || :
+    echo 0 > options/stacktrace 2>/dev/null || :
+    echo free > stack_map 2>/dev/null || :
+}
+trap cleanup EXIT
+
+disable_tracing
+clear_trace
+echo 0 > stack_map || fail "initial stackmap reset failed"
+
+echo 1 > options/stackmap
+echo 1 > options/stacktrace
+echo 1 > events/sched/sched_switch/enable
+
+# A sleeping loop: a busy loop on an idle CPU is rarely switched out.
+(while :; do sleep 0.01; done) &
+worker=$!
+echo "prev_pid == $worker || next_pid == $worker" > \
+    events/sched/sched_switch/filter || fail "could not filter sched_switch workload"
+
+enable_tracing
+sleep 1
+
+# While the writer runs, reset only has to succeed. With it stopped and
+# tracing off, reset must leave the map empty.
+i=0
+while [ "$i" -lt 5 ]; do
+    tries=0
+    pre_hits=0
+    while [ "$tries" -lt 1000 ]; do
+        pre_hits=$(hits)
+        [ "$pre_hits" -ge 8 ] && break
+        sleep 0.01
+        tries=$((tries + 1))
+    done
+    [ "$pre_hits" -ge 8 ] ||
+        fail "active writer did not reach 8 hits before reset (got $pre_hits)"
+
+    echo 0 > stack_map || fail "stackmap reset failed with active writer"
+
+    kill -STOP "$worker" || fail "could not stop reset workload"
+    wait_for_worker_stopped ||
+        fail "reset workload did not enter the stopped state"
+    disable_tracing
+
+    echo 0 > stack_map || fail "stopped-writer verification reset failed"
+    n=$(records)
+    [ "$n" -eq 0 ] || fail "stopped-writer reset left $n records"
+    n=$(stat_val entries)
+    [ "$n" -eq 0 ] || fail "stopped-writer reset left stat entries $n"
+
+    kill -CONT "$worker" || fail "could not resume reset workload"
+    enable_tracing
+    i=$((i + 1))
+done
+
+# Reset leaves old cookies in the buffer; drop them.
+clear_trace
+
+# Wait until some record is hit twice, i.e. reused.
+i=0
+while [ "$i" -lt 100 ]; do
+    [ "$(max_ref)" -ge 2 ] && break
+    sleep 0.1
+    i=$((i + 1))
+done
+
+kill -STOP "$worker" || fail "could not stop final reset workload"
+wait_for_worker_stopped ||
+    fail "final reset workload did not enter the stopped state"
+disable_tracing
+
+entries=$(records)
+[ "$entries" -gt 0 ] || fail "stackmap did not refill after active-writer reset"
+ref=$(max_ref)
+[ "$ref" -ge 2 ] || fail "no record reused after reset ($entries records, max ref $ref)"
+
+# Nothing records now, so every stored stack and every hit is counted.
+n=$(stat_val entries)
+[ "$n" -eq "$entries" ] || fail "stat entries $n, stack_map has $entries records"
+n=$(stat_val successes)
+[ "$n" -eq "$(hits)" ] || fail "stat successes $n, stack_map has $(hits) hits"
+n=$(stat_val generation)
+[ "$n" -eq "$(first_gen)" ] || fail "stat generation $n, stack_map has $(first_gen)"
+
+kill -CONT "$worker" 2>/dev/null || :
+kill "$worker" 2>/dev/null || :
+wait "$worker" 2>/dev/null || :
+worker=
+# Without the filter, this shell's own sleeps produce the switches below.
+echo 0 > events/sched/sched_switch/filter
+
+# Stop the event before inspecting the fixed buffer and map contents.
+echo 0 > events/sched/sched_switch/enable
+trace_pairs=$(sed -n \
+    's/.*<stack_id \([0-9][0-9]*\) gen \([0-9][0-9]*\)>.*/\1:\2/p' \
+    trace | sort -u)
+[ -n "$trace_pairs" ] ||
+    fail "trace has no <stack_id N gen G> events after active-writer reset"
+
+# Every cookie left in the trace must match a current stack_map record.
+for pair in $trace_pairs; do
+    id=${pair%%:*}
+    gen=${pair##*:}
+    grep -q "^stack_id $id gen $gen " stack_map ||
+        fail "trace cookie id $id gen $gen has no current stack_map record"
+done
+
+# Reset clears the map only; the cookies in the ring buffer stay.
+gen=$(first_gen)
+before_records=$(grep "<stack_id" trace || true)
+echo 0 > stack_map || fail "stopped reset failed"
+[ "$(records)" -eq 0 ] || fail "reset did not clear the map"
+after_records=$(grep "<stack_id" trace || true)
+[ "$after_records" = "$before_records" ] || fail "reset changed the trace buffer records"
+gen=$((gen + 1))
+
+# Trace until the map holds a record, for up to 10 s.
+refill() {
+    echo 1 > events/sched/sched_switch/enable
+    enable_tracing
+    i=0
+    while [ "$(records)" -eq 0 ] && [ "$i" -lt 100 ]; do
+        sleep 0.1
+        i=$((i + 1))
+    done
+    disable_tracing
+    echo 0 > events/sched/sched_switch/enable
+}
+
+# free is refused while the option is enabled.
+if echo free > stack_map 2>/dev/null; then
+    fail "free accepted while options/stackmap is enabled"
+fi
+
+# Disabling keeps the map, so the trace can still be resolved.
+refill
+echo 0 > options/stackmap
+[ "$(records)" -gt 0 ] || fail "map released by disabling the option"
+[ "$(first_gen)" -eq "$gen" ] || fail "generation is $(first_gen) after reset (expected $gen)"
+
+# free waits for a reader that opened the map, which still reads it.
+exec 3< stack_map
+(exec 3<&-; echo free > stack_map) &
+free_pid=$!
+# The waiting writer sleeps killable (D); an exited one is a zombie (Z).
+i=0
+st=
+while [ "$i" -lt 100 ]; do
+    st=$(awk '/^State:/ { print $2 }' "/proc/$free_pid/status" 2>/dev/null)
+    [ "$st" = D ] && break
+    sleep 0.1
+    i=$((i + 1))
+done
+[ "$st" = D ] || fail "free is not blocked on the open reader (state '$st')"
+[ "$(records)" -eq 0 ] || fail "a new reader still sees the map during free"
+grep -q '^stack_id ' <&3 || fail "the open reader lost the map"
+exec 3<&-
+wait "$free_pid" || fail "free failed after the reader closed"
+free_pid=
+[ "$(records)" -eq 0 ] || fail "stack_map still has records after free"
+[ -z "$(cat stack_map_stat)" ] || fail "stack_map_stat not empty after free"
+
+# Re-enabling allocates a map that continues the generation.
+echo 1 > options/stackmap
+refill
+[ "$(records)" -gt 0 ] || fail "new map has no records"
+[ "$(first_gen)" -eq $((gen + 1)) ] ||
+    fail "generation after free is $(first_gen) (expected $((gen + 1)))"
-- 
2.34.1

