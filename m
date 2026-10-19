Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426817;
	b=gZZAnGRKcS3esseFkjP0cdjevZWVC1Yhuc2M421aykzuzid4n/CkbQgloaWw0cIuVGVU
	 vCcmvw3MgiANnOWYsEwBJgPF5bwIFzf6izWZXvW5hf0f37SLdNPdyX0W+I+FREpeZG73P
	 KCXnXQw/L/IW38WcpNSSS8GPLkix0wZT0SJD3SFHcCy2wjq00k4zmdbgaDAVssQ9/XaOM
	 ebyprbRb29Cq0cZyswRSyCVNbbyTGpKh/U7w74rOffkCddEE1xYRd/7fwyj0FEMHteNX7
	 FA9DTkMaV8g/Bdij6lIRlsl9N3aq48gmg3czLwOrqXduprf3PVLrtkZ8llFXuCge1Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wMCaBZ3cPYlo3WgUgRBvzFpHfELTk+gUNHqJ34/c1Vk=;
	b=q2Zz36EjQ40MuVTKAPNYoruSjGPF3Zr0CCoJvWzUCS3HrdRbc7v2kbkdgXIqHAy3Zqdo
	 lU3NfBkJbVszdsIEClPsE0q/IXRij6yGS7//aPNXm50QHlXDFRbM7OD83A//tpIg/EAoW
	 yfnr95mJznNQgWTEOR3R6BniAQYSD9Hhi7VDnAEkiwc7pK85NvkeNTVwJIirr6GLHwbGx
	 RSk5oPXhSwTT5gKMQobPa/KrTSWiIw6FQzKitUUmFjx700aNLYIWWRJ4o2iz4Q1YI6XXM
	 A9UWlM8D4VmN2Rv+31d+zo1VYpP9fFRvp8kUvXLYj3ctJhMGepI6A409T3KK7FUvwZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kBhIyW3T;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D84606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:20:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8D84606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kBhIyW3T
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1875627f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792426815; x=1793031615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wMCaBZ3cPYlo3WgUgRBvzFpHfELTk+gUNHqJ34/c1Vk=;
        b=kBhIyW3TiN0ufg80lIEwriNI8BTYAVYkZeiHdeXGtvzPKYLqGuhXZounou1/JGRAFr
         AbBTU1hsWNGW/w+PDZda+gCxvY7g9SSfox/ScCidEZ2Lf4WfW4m2zvsIOgDQHDT3v+8Q
         /PZscyY0xC9mWd35+C4B6ZiJXjjWDsz0gYbwbhsW0bMk4IAvUgzgQzZFnyMOmACEqVuu
         DMAq67Ram89P9e+ja6jK/Rx5Odo4jEFnOBKPTsFQv5k3kVxRlSuvQB1ogUCSQAjhboSv
         IGykHsrfE+uFlE5ruIts2KUcM+wkdD09vsripNS/1fbFuA+tYY3sGYgKynnTgu3bnOQL
         zr6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426815; x=1793031615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wMCaBZ3cPYlo3WgUgRBvzFpHfELTk+gUNHqJ34/c1Vk=;
        b=sv+phM2hog2X76GXhxuILsYRk9zz47UWc1qcNknJnslp8cQk9g62NZWst3reUyjJ5B
         HQP0Iq7ZQ0evHWVkeB1ZZffem5WRqSksfMsqDBdN05axn8wD8BThCl7gIqlIhWIINNvn
         3pQLbi9t8dgP/dc8m7SQqengf46v/+5BotH7c/N897+6oaOfAcHLX3SuP91ojJ7ukbyJ
         GIQNZGvvp2SmGYtfbamkpYyC88aq6xAfkklFLMvGDyZJbnPt8Jn1yfpq/8HoobTiTbtF
         YGCa7OE24RhGUbdYlmawtwpUP7osjSvEkCGgAxfvK/c0BE1YVvGCTtj7hBMcgdtJVhgb
         z9iw==
X-Forwarded-Encrypted: i=1; AKwUvBzRa5P0wPhv4prYEmkBbWnRGG6/KgRcirotJ7I+Ikpcfvlid7hAHlDIQTZkRsU33LHzjH8Mpe2/bUwXazI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKyB1dzHGrgeTfj4+Ib8OkhQH55p3/8rWbICYZO1uVsQUDAAQ7p
	fZXJKMjpb+Ld+4M3ipb+fSGUvvcRQ0fEofqDVV1jZIKD0OCSuT7EeO0p
X-Gm-Gg: AYBFou2R9RZ+zqmJzYE/Aw8HVF/NTxLq/xRmxLPUOV75zXPq2s/A555282xIl29HxK/
	zwyITGuMhbMvDsfNnSkM30NPRE5Sr3uKnqD5uMthVtpCPdLyIaQctP/Ert/ngahcWHeR9dQz/Dl
	5SeZY8YLEoLtY0uXSExKhFGWTH8qRpLRlWUsqWUe5iQm17iWLHuzJYSMNqcU8L2VN5maLIgTEQf
	7kYxVZhsK8HH1kAeaOeXmGbPWZhgdSWk5k/18SeMjUTCnaDaT9zSAUly8K70IQqnb8eaI63YFRP
	K4sd00G99BtefkJm3ESKDFJqjpYPqiCeDwyS+ULD7rVU8XtcDAIP8hgU+0k4qDZdQcJyB1ZIIQm
	28igsr/ocBarleGZ0s3QDCLJcq8sFbF1fF8sBWMwPps47Ow7DxCu9Qrp4YtJTC+jyxunhI4dhvp
	qZi34zemsn1YHxbZlMQZGvQDYhrT6ZZsLNUHzlHSOhRcaapw8AQoVFNsD8pUfNgk7w98LQtIHKm
	RSkZvKAZ+GKrcTAGs7sBpQ/5amy6hL5+zNfpkXCYV4=
X-Received: by 2002:a05:6000:41c7:b0:48d:f50b:2af8 with SMTP id ffacd0b85a97d-48e07fad0dfmr16383672f8f.46.1792426814532;
        Mon, 19 Oct 2026 09:20:14 -0700 (PDT)
Received: from andreayoga.wind3.hub ([151.76.51.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ec8dfsm25165890f8f.26.2026.10.19.09.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:20:14 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	Bradley Morgan <brads@mainlining.org>,
	Kunwu Chan <kunwu.chan@gmail.com>,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC -rcu/dev] hazptrtorture: Release all deferred hazard pointers before stopping
Date: Mon, 19 Oct 2026 18:20:03 +0200
Message-ID: <20261019162005.12888-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
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

hazptrtorture can hang at shutdown when deferral is enabled, as in the
PREEMPT scenario: the writer stays in ->sync() and kthread_stop() on it
never returns, until kvm.sh kills QEMU:

    [ 1800.899278] hazptr-torture: Stopping hazptr_torture_do_pending task
    [ 1800.899447] hazptr-torture: Stopping hazptr_torture_writer task
    [ 1812.713870] hazptr-torture: rtc: 00000000225df70a ver: 12436 HTWS_SYNC tfle: 0 rta: 12437 rtaf: 0 rtf: 12427 onoff: 48783/48783:48786/48786 3,254:3,280 611671:731494 (HZ=1000) acq: 5720353149 rel: 5720210186 acqirq: 571927 relirq: 714778 reldefer: 714139 relundefer 714114
    [ 1812.713971] hazptr-torture: hazptr_torture_stats is stopping

    Summary: Potential hang (QEMU killed)
    !!! PID 1393523 hung at 1980 vs. 1800 seconds

hazptr_torture_cleanup() stops the do_pending kthread before the writer
and the readers.  Once torture_must_stop(), do_pending makes one last
pass and leaves its loop, but unless stutter_will_wait(), that pass
releases the deferred hazard pointers of a single CPU.

Readers can also still defer after that pass, from the iteration they
are in when torture_must_stop() becomes true.  Stopped readers hold no
hazard pointer, so the writer waits on one of the 25 deferred hazard
pointers above (reldefer - relundefer) that nothing releases.

Keep do_pending running until hazptr_torture_cleanup() stops it, after
the writer and the readers, releasing the deferred hazard pointers of
all CPUs on each pass once torture_must_stop() and once more on exit.
It now also sleeps between those passes, and kthread_stop() wakes it.

This should be safe because readers defer only from their own loop,
which they have left once torture_stop_kthread() returns for them, and
the hazptr_torture_acquire() IPI runs synchronously within that loop.

With this change, a 30-minute PREEMPT run on x86_64 with 8 CPUs ends
with "End of test: SUCCESS" and with as many hazard pointers released
from the pending lists as were deferred (reldefer: 960658 relundefer
960658).

Fixes: f23d7b47ced9 ("hazptrtorture: Add kthread to release deferred hazard pointers")
Assisted-by: LLM
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 kernel/rcu/hazptrtorture.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/kernel/rcu/hazptrtorture.c b/kernel/rcu/hazptrtorture.c
index 7c8b5899fb011..5153720074644 100644
--- a/kernel/rcu/hazptrtorture.c
+++ b/kernel/rcu/hazptrtorture.c
@@ -547,18 +547,25 @@ static int hazptr_torture_do_pending(void *arg)
 	DEFINE_TORTURE_RANDOM(rand);
 
 	VERBOSE_TOROUT_STRING("hazptr_torture_do_pending task started");
-	do {
-		if (stutter_will_wait()) {
+	/*
+	 * Run until hazptr_torture_cleanup() stops this kthread, not just
+	 * until torture_must_stop(): the writer can be waiting in ->sync()
+	 * for a deferred hazard pointer while it is being stopped.
+	 */
+	while (!kthread_should_stop()) {
+		if (torture_must_stop() || stutter_will_wait()) {
 			for_each_possible_cpu(cpu)
 				hazptr_torture_do_one_pending(cpu, &rand);
 		} else {
 			cpu = cpumask_next_wrap(cpu, cpu_possible_mask);
 			hazptr_torture_do_one_pending(cpu, &rand);
 		}
-		if (!torture_must_stop())
-			torture_hrtimeout_ms(kthread_do_pending_ms, USEC_PER_MSEC, &rand);
+		torture_hrtimeout_ms(kthread_do_pending_ms, USEC_PER_MSEC, &rand);
 		// Omit stutter_wait() because this function needs to do cleanup.
-	} while (!torture_must_stop());
+	}
+	/* The readers have stopped, so nothing new can be deferred. */
+	for_each_possible_cpu(cpu)
+		hazptr_torture_do_one_pending(cpu, &rand);
 	torture_kthread_stopping("hazptr_torture_do_pending");
 	return 0;
 }
@@ -773,7 +780,6 @@ hazptr_torture_cleanup(void)
 		return;
 	}
 
-	torture_stop_kthread(hazptr_torture_do_pending, do_pending_task);
 	torture_stop_kthread(hazptr_torture_preempt, preempt_task);
 	torture_stop_kthread(hazptr_torture_writer, writer_task);
 
@@ -785,6 +791,12 @@ hazptr_torture_cleanup(void)
 		reader_tasks = NULL;
 	}
 
+	/*
+	 * Stop do_pending only after the writer and the readers: the writer
+	 * may be waiting on hazard pointers that readers deferred.
+	 */
+	torture_stop_kthread(hazptr_torture_do_pending, do_pending_task);
+
 	torture_stop_kthread(hazptr_torture_stats, stats_task);
 
 	/* Do torture-type-specific cleanup operations.  */

-- 
2.53.0

