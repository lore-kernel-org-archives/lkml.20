Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793119131;
	b=ntQ2vY1jBvL2t/W1NNA0k8xEXWJtC2FTuYSI6iEd/5Ix9vi7kFfwJMuP2NLEID35rf62
	 o+rr7/dsPa6472SU6wS8O6uwKfZIR930NJSn5rc3cVW4ycQDkG/aBYmK7H55IQ8vJpTuS
	 8j2EN/A0hGamZhN9rUe3CvjzcpTgoj+6ixs+l0JNiXcQWbZ9ACiShvCaey6xgk0I6xj3W
	 TEtdKBzZPNHJW7ymNLNarl9US4LxFhR6IKL/74RKI1r5CDNzLhbhbqbHy3rGJxQMUWDgW
	 SqViCXYuSajkss892ycEibldG5qQYbdvzQn1bTNwZy28Bj/gOLOnliD4+1w5gweq1Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uR0yAsXbMma6/WfA/RpMNc9+EEy6cOFQycvac3oRjgc=;
	b=tdDCyxZZAMoR8316Rv7IPZ540ZniUf1q3rgYkJCaMC4E53VyXADLSU2W+1MznyS9Q7LJ
	 ID+M41PfrcECt2Uv8F50MNyD8DCv9oTaGl9haDlKEHagSkIx8zT/jRscYaqJv/jYknNRt
	 MME18y2+B/t2Yhe2z92jyjfh3K/obQB0+FraJoQz95XRLVC5RaUHZzye57YFHHM+zUfb7
	 7e+lKQG+co6MiF3wLGbNxzJCOBeyvY+VuxwRAehwzohc+evenhZ5AxQSJBZ5c0OO3NrNp
	 agX50jA80wzsfkTZaJysBUNNGZzAXf9G1JGOolg8dsuj9c1rWXQfmIg6p0RLQuopYAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tQEH+Hzu;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23547606A334
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:38:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23547606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tQEH+Hzu
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a210470b49so257645e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793119129; x=1793723929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uR0yAsXbMma6/WfA/RpMNc9+EEy6cOFQycvac3oRjgc=;
        b=tQEH+HzuZ8N6ABNkR399evROXJyBsW7JyFwK/5y0whEGzrXVyiwkOdg8PC4vVSWUi0
         DAA+etD3fD9ACooMHDluagTnVbrz5zMrGHBVAgFsNCSfwM372WWQPnOfOBicCzpsfCg6
         cqQeG3ALFLk7551NVHYFXSlTBsB24xEOgRXym3d5bsw2BVBsu8un/RIRaHULM+aS1RNy
         6kyRqGDdgHKNIb+GeyZVP1qGlugobcWSv16Fn0BOlobKwpTqKMxUiGEk/czNv8xClRqB
         W4aeIYqjSSVvEBXvpvQRMvXlNcf4jIKlfwVtbdf/P/1ETu/CpN1xNZn7J0kcl6xs/Bpj
         Bpbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119129; x=1793723929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uR0yAsXbMma6/WfA/RpMNc9+EEy6cOFQycvac3oRjgc=;
        b=LlflekqTgmRRnkI/rYK5alabXb+t+4Ur2zwFci+NlBHgOw8vfOEzZtXIuz6YT74Fq/
         sycsXIGg4NCVuLqMYVixyBhuyOU4qzG1xEmwgI95vpwJrwKwxclWF6tuqf+ZN/vK4q/R
         KHLXUg/4XujKsX6ubsrZa9JQqnZCc8CSqe4yTYuoCTsRI0Rzgwi7370tKXqqU7yP8AIu
         3PoyZ64ygbfXKG2jngn/R4q2vDWmkjJeApvbMSp59SOKWj/jLCkPyOfwqaFgqY8be2zP
         J7jNiZDgbGwIokeGnDYgoWXruDw9GI9oEfQ01I1FFndVcudLtfgT4oSLK4BHpROQ0mDh
         J1fQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRslI/bIHvBG7Ro4gRKMwS21+UJB/x2HumOGtsi9KPtB7M0oGG0pxe5XlfV+1vAqsHlxqapvjkg+Dr1/U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQwBA4spa3QTnBKquhxyEqnawFfJEN9YFe14jO1PXXljmdHqft
	EDu2k6nX8xqRNgrJpplE9Dj8PvyQmOeXNfkwDKVAGYG3KsoEIAIs3k1f
X-Gm-Gg: AYBFou2q0CjZm6nvSioYydmntZV2s2qcqPAXcQvRD5MkhLrtWm0swwQe0R24m8gZfPI
	JAwLHTZXBK+6fLVu9I0SQlqOsXOymoUY3HtUFxckxR//1trc7AOEla3PZO+2kkYauEME9yxDVDR
	NqmKD3nWjK9MDPa24dHH1faQiwHLtr5nt5kr9StLICjC/8B6iNw0Fqd9mlj+/Gz1rHO2OpHGt8e
	0oezl7OyQiZAHteZ6w+aQQPA9wlXnUTTq3cKoDKtC/t5hYI1ifplp1jxgnm1mqMSV8G+ngsKTzO
	etkKp88HR1mVVF+aepLSe/DFq/1oz6zWtla71q1ffUUA86u126/S/dEVESf0S1T0xAsjaezd5fI
	LfjmWBoVVw+VQu2As2FcU2A32GEvu1ilXwUi6dS2dF4n+9SPMg5pOb4vV51CErQTTRSFbYt2/zY
	FJD9LiWOqcDVDo9dmnnx61YOiTOHt7Iq/ki1u4Xe9ddXrkje71JCd9JvC81vTEZNwXMFhb3OX4+
	+HefseqZMS6ZZRMlNHBt7LtDn5R4Hq7aVvEClVhQ5U71YHvJi1tvL9iHfihM1rcQb6lzL2REsEk
	j0FCtdFScFjdsziKXtwkoeUZAA==
X-Received: by 2002:a05:600c:19d4:b0:4a2:18d4:f9e0 with SMTP id 5b1f17b1804b1-4a35acbbcaamr197509565e9.25.1793119129109;
        Tue, 27 Oct 2026 09:38:49 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.68.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a92c21df84sm2358195e9.15.2026.10.27.09.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:38:48 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	Gary Guo <gary@garyguo.net>,
	Bradley Morgan <brads@mainlining.org>,
	Kunwu Chan <kunwu.chan@gmail.com>,
	rcu@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH -rcu/dev 1/4] hazptrtorture: Release all deferred hazard pointers before stopping
Date: Tue, 27 Oct 2026 17:38:03 +0100
Message-ID: <20261027163811.2470569-2-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027163811.2470569-1-parri.andrea@gmail.com>
References: <20261027163811.2470569-1-parri.andrea@gmail.com>
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

hazptr_torture_cleanup() stops the do_pending kthread first, then the
writer, then the readers.  Once torture_must_stop(), do_pending makes
one last pass and leaves its loop, but unless stutter_will_wait(), that
pass releases the deferred hazard pointers of a single CPU.

Readers can also still defer after that pass, from the iteration they
are in when torture_must_stop() becomes true.  Readers that have left
their loop hold no hazard pointer, so the writer waits on one of the 25
deferred hazard pointers above (reldefer - relundefer) that nothing
releases.

Stop the readers before do_pending, and do_pending before the writer.
do_pending still leaves its loop at torture_must_stop(), and now
releases the deferred hazard pointers of all CPUs once
torture_kthread_stopping() returns, that is, once
hazptr_torture_cleanup() stops it, after the readers.  The writer can
still wait in ->sync(), but only until then.

This should be safe because readers defer only from their own loop,
which they have left once torture_stop_kthread() returns for them, and
the hazptr_torture_acquire() IPI runs synchronously within that loop.
The readers do not need the writer to stop: they leave their loop at
torture_must_stop(), after at most one stutter_wait().

do_pending keeps the torture_must_stop() check before its sleep.  A
kthread_stop() that comes after that check and before the sleep starts
still delays do_pending's exit by a full kthread_do_pending_ms sleep,
however long that is.  With the readers stopped first, this happens
only if do_pending passed the check before the test began stopping and
had not yet gone to sleep when kthread_stop() came, after all the
readers had stopped.

With this change, a 30-minute PREEMPT run on x86_64 with 8 CPUs ends
with "End of test: SUCCESS" and with as many hazard pointers released
from the pending lists as were deferred (reldefer: 983727 relundefer
983727).

The hang was found with the help of an LLM.

Fixes: f23d7b47ced9 ("hazptrtorture: Add kthread to release deferred hazard pointers")
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 kernel/rcu/hazptrtorture.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/kernel/rcu/hazptrtorture.c b/kernel/rcu/hazptrtorture.c
index 7c8b5899fb011..c46083a8af093 100644
--- a/kernel/rcu/hazptrtorture.c
+++ b/kernel/rcu/hazptrtorture.c
@@ -560,6 +560,9 @@ static int hazptr_torture_do_pending(void *arg)
 		// Omit stutter_wait() because this function needs to do cleanup.
 	} while (!torture_must_stop());
 	torture_kthread_stopping("hazptr_torture_do_pending");
+	/* The readers have stopped, so nothing new can be deferred. */
+	for_each_possible_cpu(cpu)
+		hazptr_torture_do_one_pending(cpu, &rand);
 	return 0;
 }
 
@@ -773,9 +776,7 @@ hazptr_torture_cleanup(void)
 		return;
 	}
 
-	torture_stop_kthread(hazptr_torture_do_pending, do_pending_task);
 	torture_stop_kthread(hazptr_torture_preempt, preempt_task);
-	torture_stop_kthread(hazptr_torture_writer, writer_task);
 
 	if (reader_tasks) {
 		for (i = 0; i < nrealreaders; i++)
@@ -785,6 +786,14 @@ hazptr_torture_cleanup(void)
 		reader_tasks = NULL;
 	}
 
+	/*
+	 * Stop the writer only after do_pending, and do_pending only after
+	 * the readers: the writer may be waiting on hazard pointers that
+	 * readers deferred, which do_pending releases once they stopped.
+	 */
+	torture_stop_kthread(hazptr_torture_do_pending, do_pending_task);
+	torture_stop_kthread(hazptr_torture_writer, writer_task);
+
 	torture_stop_kthread(hazptr_torture_stats, stats_task);
 
 	/* Do torture-type-specific cleanup operations.  */
-- 
2.53.0

