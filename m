Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B2A49B1E5
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 18:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790187182; cv=none; b=q/tZQKWYWHcnC5wpZyE5FUjA+4xSepjFpg5NTtv+9c3JrU5nA80W2rqofER/UFtNVihnOP1UXpbNnJME7kp2W4B21dnHVTwQWIVAcxo6NVNDLboCBD72W+WrXQyQvctLv6ZTO6hNRu5DxctUHgKCCA1y1SFB/31hnSMQsufxmbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790187182; c=relaxed/simple;
	bh=iT6AIO3TWyMclKnHI0XpdeyTiqsSKBsOrIJNRIGDRFM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=i7rRpc+A7QJrZ87NzP6mSSFbWeppkdP1Gxqvt2r8aaDcDNj6mjpzsY7NxMNbzz2OG3d6TDkuhJcR3wUDE34AL/i0Go9LYr5pNcizCQtn9xJxpnlMUYNbrbB1KhJK5Ak/EcqQj0UDvC48/CuhvBzVt0GrYV1STP+D+a/gFP3vxUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bN4KmUQX; arc=none smtp.client-ip=74.125.82.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bN4KmUQX"
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-143826c4a13so1168694c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790187177; x=1790791977; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vhLzj8CHSgnPZEQaoqsxZs/Q7iBTiQNebqxNpexBaOA=;
        b=bN4KmUQXDolot861HRjGA6K8ntEtK4JSHrfikehkcyYocUyqJf+G/SdKv3QjApuP1Y
         puPfM2eZZFTa0n8p1AwEm2+GGr4fZR7YMgkJQQl40uBqt6bka2oY1qc3iGUgcEIasJYu
         hUkTFq5iLgKZD3zEjyNmE283g7njW6DXpec/fWJ8QvD9WAiyUzr+Tsj2b6NQWvejb3CB
         AISfMLsssJUyf+PTVrAt1OkXXfbh9ZAB+ryXwsRaXuSdWqPkRi0xdECAnYGEoeo9qoI1
         fhsMJirBtgyRZ+1EB4g0f9shsK/ixovIvNyIZdv2ar2oYSw5b6KKTq9bkTjKrevNUcIq
         Zo7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790187177; x=1790791977;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vhLzj8CHSgnPZEQaoqsxZs/Q7iBTiQNebqxNpexBaOA=;
        b=edBuig62Md7NZBAj4aziGhlToKcyk4eS9spM1leYYInLpzuBofGHUUPzIwvD6Xfpbc
         YG9KJNuHfzQ4A36oAtZYQcJDR52uT/Rj3PUUpn6OQuvuv41T7EQXlQJ6CmuOvsY1qGwn
         TcbJ/CcAp2hmsxl6bpP5LheVGg2wN0XHYnRaEcbqurI0lwOZ2TEXVprAxZ1YEoC9Ua2o
         sQAqPY9qYAKhPM5+YRf6VnMN2k3uvq4YhJm6Iszlatge8DJ/dWedE6K1DMOlDUNtN7yr
         twF93Jbe84q4aAO5OTnmfkSBWCjViL/mj4rz0/IOOIa5rr117dZXmXr6OtGj99t2gp3w
         yflQ==
X-Forwarded-Encrypted: i=1; AKwUvBy20NLEXpAxdDibDHUzdVm3fwF4kW9i4k7HtSx0x4TN3hW/Vg8fNksTkm9XqUvu+V80WJi0SqmKZhM5BXI=@vger.kernel.org
X-Gm-Message-State: AFuF++kCtmH/nDK81Jh5n1QpRXhVfHQwHHd/fKC5fMSuvQwsqP2k++Qa
	B3i+saUxpArLhtwJeErpmyy2FxoAHFsE7jVz5N8C+A4r6h7gU/TmyFQiELB5uhtZg6FymSFWDAa
	iFdXR/JF7mA==
X-Received: from dlan17-n2.prod.google.com ([2002:a05:7022:eb51:20b0:144:cf85:b103])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2304:b0:130:6c8f:5a87
 with SMTP id a92af1059eb24-144f914402fmr3425597c88.13.1790187176387; Wed, 23
 Sep 2026 11:12:56 -0700 (PDT)
Date: Wed, 23 Sep 2026 11:11:29 -0700
In-Reply-To: <20260923181213.3032038-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1789966896.git.irogers@google.com> <20260923181213.3032038-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
Message-ID: <20260923181213.3032038-7-irogers@google.com>
Subject: [PATCH v3 06/49] perf python: Clean up pylint warnings in twatch.py
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, alice.mei.rogers@gmail.com, 
	namhyung@kernel.org
Cc: adrian.hunter@intel.com, dapeng1.mi@linux.intel.com, 
	james.clark@linaro.org, leo.yan@linux.dev, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"

Clean up pylint warnings in twatch.py so that it passes pylint without
warning suppression comments:
- Convert tab indentation to 4 spaces (W0311: bad-indentation).
- Remove unnecessary trailing semicolon (W0301: unnecessary-semicolon)
  after evsel.open().
- Convert floating multi-line string comments to '#' comments (W0105:
  pointless-string-statement).

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/python/twatch.py | 80 ++++++++++++++++++-------------------
 1 file changed, 39 insertions(+), 41 deletions(-)

diff --git a/tools/perf/python/twatch.py b/tools/perf/python/twatch.py
index 04f3db29b9bc..ad35b1620781 100755
--- a/tools/perf/python/twatch.py
+++ b/tools/perf/python/twatch.py
@@ -9,53 +9,51 @@
 import perf
 
 def main(context_switch = 0, thread = -1):
-	cpus = perf.cpu_map()
-	threads = perf.thread_map(thread)
-	evsel = perf.evsel(type	  = perf.TYPE_SOFTWARE,
-			   config = perf.COUNT_SW_DUMMY,
-			   task = 1, comm = 1, mmap = 0, freq = 0,
-			   wakeup_events = 1, watermark = 1,
-			   sample_id_all = 1, context_switch = context_switch,
-			   sample_type = perf.SAMPLE_PERIOD | perf.SAMPLE_TID | perf.SAMPLE_CPU)
-
-	"""What we want are just the PERF_RECORD_ lifetime events for threads,
-	 using the default, PERF_TYPE_HARDWARE + PERF_COUNT_HW_CYCLES & freq=1
-	 (the default), makes perf reenable irq_vectors:local_timer_entry, when
-	 disabling nohz, not good for some use cases where all we want is to get
-	 threads comes and goes... So use (perf.TYPE_SOFTWARE, perf_COUNT_SW_DUMMY,
-	 freq=0) instead."""
-
-	evsel.open(cpus = cpus, threads = threads);
-	evlist = perf.evlist(cpus, threads)
-	evlist.add(evsel)
-	evlist.mmap()
-	while True:
-		evlist.poll(timeout = -1)
-		for cpu in cpus:
-			event = evlist.read_on_cpu(cpu)
-			if not event:
-				continue
-			print("cpu: {0}, pid: {1}, tid: {2} {3}".format(event.sample_cpu,
+    cpus = perf.cpu_map()
+    threads = perf.thread_map(thread)
+    evsel = perf.evsel(type	  = perf.TYPE_SOFTWARE,
+               config = perf.COUNT_SW_DUMMY,
+               task = 1, comm = 1, mmap = 0, freq = 0,
+               wakeup_events = 1, watermark = 1,
+               sample_id_all = 1, context_switch = context_switch,
+               sample_type = perf.SAMPLE_PERIOD | perf.SAMPLE_TID | perf.SAMPLE_CPU)
+
+    # What we want are just the PERF_RECORD_ lifetime events for threads,
+    # using the default, PERF_TYPE_HARDWARE + PERF_COUNT_HW_CYCLES & freq=1
+    # (the default), makes perf reenable irq_vectors:local_timer_entry, when
+    # disabling nohz, not good for some use cases where all we want is to get
+    # threads comes and goes... So use (perf.TYPE_SOFTWARE, perf_COUNT_SW_DUMMY,
+    # freq=0) instead.
+
+    evsel.open(cpus = cpus, threads = threads)
+    evlist = perf.evlist(cpus, threads)
+    evlist.add(evsel)
+    evlist.mmap()
+    while True:
+        evlist.poll(timeout = -1)
+        for cpu in cpus:
+            event = evlist.read_on_cpu(cpu)
+            if not event:
+                continue
+            print("cpu: {0}, pid: {1}, tid: {2} {3}".format(event.sample_cpu,
                                                                         event.sample_pid,
                                                                         event.sample_tid,
                                                                         event))
 
 if __name__ == '__main__':
-    """
-	To test the PERF_RECORD_SWITCH record, pick a pid and replace
-	in the following line.
+    #     To test the PERF_RECORD_SWITCH record, pick a pid and replace
+    # in the following line.
 
-	Example output:
+    # Example output:
 
-cpu: 3, pid: 31463, tid: 31593 { type: context_switch, next_prev_pid: 31463, next_prev_tid: 31593, switch_out: 1 }
-cpu: 1, pid: 31463, tid: 31489 { type: context_switch, next_prev_pid: 31463, next_prev_tid: 31489, switch_out: 1 }
-cpu: 2, pid: 31463, tid: 31496 { type: context_switch, next_prev_pid: 31463, next_prev_tid: 31496, switch_out: 1 }
-cpu: 3, pid: 31463, tid: 31491 { type: context_switch, next_prev_pid: 31463, next_prev_tid: 31491, switch_out: 0 }
+    # cpu: 3, pid: 31463, tid: 31593 { type: context_switch, next_prev_pid: 31463, next_prev_tid: 31593, switch_out: 1 }
+    # cpu: 1, pid: 31463, tid: 31489 { type: context_switch, next_prev_pid: 31463, next_prev_tid: 31489, switch_out: 1 }
+    # cpu: 2, pid: 31463, tid: 31496 { type: context_switch, next_prev_pid: 31463, next_prev_tid: 31496, switch_out: 1 }
+    # cpu: 3, pid: 31463, tid: 31491 { type: context_switch, next_prev_pid: 31463, next_prev_tid: 31491, switch_out: 0 }
+    #
+    # It is possible as well to use event.misc & perf.PERF_RECORD_MISC_SWITCH_OUT
+    # to figure out if this is a context switch in or out of the monitored threads.
 
-	It is possible as well to use event.misc & perf.PERF_RECORD_MISC_SWITCH_OUT
-	to figure out if this is a context switch in or out of the monitored threads.
-
-	If bored, please add command line option parsing support for these options :-)
-    """
-    # main(context_switch = 1, thread = 31463)
+    # If bored, please add command line option parsing support for these options :-)
+    #     # main(context_switch = 1, thread = 31463)
     main()
-- 
2.56.0.rc1.310.g51773c2048-goog

