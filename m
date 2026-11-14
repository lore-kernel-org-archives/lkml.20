Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794681403;
	b=x4ymJhJ4Zc/55UiHS7mkTGLmCgnDjebm1LD82LxjisdrXpk4H0XyyLH2xOl67X5I0a4I
	 jfCi1BTJSpApcjYL8e0V8OfFKm74gP5zdpDvUzJHneVCk9laSw44LxnLjidNm5AzMs4b0
	 O+XdPB+6/VvhwKSkXSBVQf8xQ61oNXdpSAZcydUm5SDQSQCh3GmRk23iO+MqCShokA/YM
	 uJQc27dLIBq6MdhC8T5W/+peglk/Wysn0lKkOddNDOAIFfgIUd+Bh/32XFng5tOQGSjQM
	 deS1WCtEe+YowBthiY8zJw3xUWSbO83WyJPfKe6+zGiDE+pfsa0q8bq0WIdzOc9dIiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794681403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2V2xBQvmo7ss6uvRVL8EHtUlkPPaUKe2Ps9ruTZ9eXk=;
	b=NJhpUpgH41Q3iNnLN34WYD1DCLtrRrIF2WSlFoPRowyjK/WSBbPGhxdkJvyvmmgS3MAs
	 PNy/qfO7MkKuQptGkmK5ih5XV4cp5tBptReU4F/UZBHcpUft4TWZiOktFFtG0qr0szJnx
	 +iLnVr93QkhyNFMaVXANtO5BFr659vi//IwBkC06cSmSku3XWb+Ua55N2mDX/GOhHQYXu
	 P8zVdFsY3Xo9dvjzljQyOgY5UuE0SvcQm+H4DKi2lR2qwZH0t3R87yljkg2l8E0c/+1ii
	 8WIU2or4kVVdAG3fohE3RslwsFOvtGUSDa9XcfjteVPyk6fuPGFnHhIsslFZ3wqEDtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R41vpFJi;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B15606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 18:36:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85B15606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R41vpFJi
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb66245c51so339685e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794681401; x=1795286201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2V2xBQvmo7ss6uvRVL8EHtUlkPPaUKe2Ps9ruTZ9eXk=;
        b=R41vpFJiQdc0PDk8ieweZXHgdHHtgMZivH9PPi3Y3b2UmwppVpZh8WXRIZ7FOU9h9S
         lvYE9Shrnax+jyFWUq685uqrvXFBhroGBCsW8TRobUasuUKVfjn1Q90PLw17McKqKS7Y
         l0nhH0PB2BuG1euDgpD9e1q4mi/iRSIUDakUKeKEBOqN2VJP/HnFYb6RkzKj49bVg5QB
         MfzvMV1FtOUs+xF3DMvfAYTGkMMY2Qw2Zab9N+F01k4TkByIbYsMGpFIvEUeDRjOGR6X
         1V+mKMqHsoa85mA3SJsIRME7mdN6sKhOkGV8hWDehbzi/gKExqkAFDS5g13Ovc+bKZ7b
         NDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794681401; x=1795286201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2V2xBQvmo7ss6uvRVL8EHtUlkPPaUKe2Ps9ruTZ9eXk=;
        b=hKaIwn2mtMe9sZHll5yegZc1UKsCU3TMzgiRPSuR0Pv4g0yjpzGDWwirR609dmXLZA
         nzDsVdKaFv5hbXCQ4lfSmRqksDTV8GN5WJcf/S6Xm9G/1xk0EXnCqi0a60734e/Ii3rj
         KV8f7YZeq/+VvQPVCdzP0vV+5sxrrf3NeF3JP2omtxLDMPmjPbG3J89+mU6z6QnCBn0o
         UtBChXOmOka4Of4AZjeI5u1yyDkoybLPDLnN3e7gEqvn6qNw3FLe5VIiFvK3xG+CR+Fd
         +S36JpUzZg703j1hBWRqaBrgbc7ZTSaVMDRkpfjoqyYuRw3SDmUk7XI8F8hTEh5Pqoya
         YxCA==
X-Forwarded-Encrypted: i=1; AL+hErEU6WYmYHAjypqpfrkqq5thm0XkA8til+AKAEcg3cENalo52H6fULaSyh75UfCf08XQfPP97uGXBUZ3gc8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hIPtXaY1jsDBqmrxHyi5fkRHzjWHNUP5tLHP1QstkxdMLJxa+
	LHhNIWvlAnnuKeiRVrEIOgwbBDAIXgyr7vzn2U3YbvYnVAA2mm2ebVEb
X-Gm-Gg: AYBFou2KljPRYBaZWU+FoN3TA6+hzgzgOo/bPF2lHThly8d+jVUpa8fLAtFwTKmqD7+
	kc34I1AFqvRq49SvjF9oh+XcN3stQbPE1X3fxHXj7MkHY++Iw37ruJ8zkLzqpC6VO2VupIbH14A
	JmE5b0xAn6mdBawyKGipLjbZL8gCiqmES9c42rX7kFTVb28+mJ+KOJk5/umUDHRdrIX6KqMk1kj
	n7mMQPjETXXJ/sVle02NxnLfqojYKkq7vMLbuuCBdGJxkHDlJgKH+eGISzDCVE+qvsy96HcZEQg
	R64eIEbUHquKqiuLVJwd1crZvRChX+NpZ61VASmrAuFCwG9M0NS5GkKuK444vXAsuc1q326Atz5
	gRRUw6FtSuwuwVA+VRx+FR4OaDRIEBoQ01RbJnaIbo0zio3oiXMCvxu6uvDE+JdoPsM7Ql0Wfyi
	WZrdKYjK/2g+stMYTZ9hopHliod9I+i+57D6KWC/WD1MLx943LMzlx70po5TjE7Fr/fKZLHZIQ2
	/fMYl488aQ78ihDhoNNm6m6daoNNa96OyZL9Ki/R6W0VhR/BJHTjz5OINs6koaswGWhtSrI9y7e
	Gi0FrzPvFjW/oabYRT7r7/4ey+W/fkAfbnsYtcB6fONTQnNoZk8=
X-Received: by 2002:a05:600d:8654:20b0:4a0:13d8:cd0c with SMTP id 5b1f17b1804b1-4bb55a40159mr100887715e9.2.1794681400654;
        Sat, 14 Nov 2026 10:36:40 -0800 (PST)
Received: from lima-kdev.local ([88.243.154.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2adf53sm256300075e9.15.2026.11.14.10.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 10:36:40 -0800 (PST)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: corbet@lwn.net,
	peterz@infradead.org,
	mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kayra Cizmeci <kayracizmeci@gmail.com>
Subject: [PATCH] sched/docs: Rewrite sched-eevdf.rst
Date: Sat, 14 Nov 2026 21:36:17 +0300
Message-ID: <20261114183618.56111-1-kayracizmeci@gmail.com>
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

The current sched-eevdf.rst doesn't explain most of
the concepts in EEVDF.

Describe the concepts (V, vruntime, deadline, eligibility,
lag, etc.).

Signed-off-by: Kayra Cizmeci <kayracizmeci@gmail.com>
---
Hi!

I tried to rewrite this whole sched-eevdf.rst thing.

The current sched-eevdf.rst doesn't explain most of the concepts as
the commit says too.

There are some other little issues too, like the second link shows a
random reply instead of the cover letter.

Hope I did not miss anything :-).

 Documentation/scheduler/sched-eevdf.rst | 194 +++++++++++++++++++-----
 1 file changed, 155 insertions(+), 39 deletions(-)

diff --git a/Documentation/scheduler/sched-eevdf.rst b/Documentation/scheduler/sched-eevdf.rst
index 83efe7c0a30d..5c74e3b5672a 100644
--- a/Documentation/scheduler/sched-eevdf.rst
+++ b/Documentation/scheduler/sched-eevdf.rst
@@ -1,43 +1,159 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ===============
 EEVDF Scheduler
 ===============
 
-The "Earliest Eligible Virtual Deadline First" (EEVDF) was first introduced
-in a scientific publication in 1995 [1]. The Linux kernel began
-transitioning to EEVDF in version 6.6 (as a new option in 2024), moving
-away from the earlier Completely Fair Scheduler (CFS) in favor of a version
-of EEVDF proposed by Peter Zijlstra in 2023 [2-4]. More information
-regarding CFS can be found in
-Documentation/scheduler/sched-design-CFS.rst.
-
-Similarly to CFS, EEVDF aims to distribute CPU time equally among all
-runnable tasks with the same priority. To do so, it assigns a virtual run
-time to each task, creating a "lag" value that can be used to determine
-whether a task has received its fair share of CPU time. In this way, a task
-with a positive lag is owed CPU time, while a negative lag means the task
-has exceeded its portion. EEVDF picks tasks with lag greater or equal to
-zero and calculates a virtual deadline (VD) for each, selecting the task
-with the earliest VD to execute next. It's important to note that this
-allows latency-sensitive tasks with shorter time slices to be prioritized,
-which helps with their responsiveness.
-
-There are ongoing discussions on how to manage lag, especially for sleeping
-tasks; but at the time of writing EEVDF uses a "decaying" mechanism based
-on virtual run time (VRT). This prevents tasks from exploiting the system
-by sleeping briefly to reset their negative lag: when a task sleeps, it
-remains on the run queue but marked for "deferred dequeue," allowing its
-lag to decay over VRT. Hence, long-sleeping tasks eventually have their lag
-reset. Finally, tasks can preempt others if their VD is earlier, and tasks
-can request specific time slices using the new sched_setattr() system call,
-which further facilitates the job of latency-sensitive applications.
-
-REFERENCES
-==========
-
-[1] https://citeseerx.ist.psu.edu/document?repid=rep1&type=pdf&doi=805acf7726282721504c8f00575d91ebfd750564
-
-[2] https://lore.kernel.org/lkml/a79014e6-ea83-b316-1e12-2ae056bda6fa@linux.vnet.ibm.com/
-
-[3] https://lwn.net/Articles/969062/
-
-[4] https://lwn.net/Articles/925371/
+Earliest Eligible Virtual Deadline First, or EEVDF for short, was
+first introduced in a scientific article that was written by Ion Stoica
+and Hussein Abdel-Wahab in 1995 [1]_.
+
+Then Peter Zijlstra suggested it as a replacement for CFS
+(Completely Fair Scheduler) [2]_. First parts of it got merged into Linux in 6.6.
+
+Our objective is to select the task with the earliest
+deadline from the tasks that are eligible.
+
+
+Core Basics
+============
+
+Every task has its own *weight*, derived from its nice value.
+
+The bigger the *weight*, the slower the *vruntime* increases.
+The slower the *vruntime* increases, the easier it is for a task to be eligible.
+
+
+Formula for virtual runtime is::
+
+   (delta * NICE_0_LOAD) / weight
+
+*delta* is calculated by this formula::
+
+    now - exec_start
+
+*exec_start* is the last time that we accounted the task.
+
+And every runqueue has its own average virtual runtime. We'll call it *V*.
+
+Formula for *V* is::
+
+     Sum(weight * vruntime) / Sum(weight)
+
+
+Eligibility
+~~~~~~~~~~~~
+
+For a task to be considered eligible, its vruntime must be smaller than or
+equal to *V*.
+
+
+Deadline
+~~~~~~~~~~~~
+
+Deadline is like a point on vruntime. We calculate it by::
+
+    vruntime + ((slice * NICE_0_LOAD) / weight)
+
+*slice* is usually equal to sysctl_sched_base_slice,
+which is 0.70 ms by default. It's the time the task requested to run.
+
+However, a task doesn't have to run exactly as its *slice* says.
+It can get preempted, it can sleep, etc.
+But we will reschedule when the task's *vruntime* gets equal to its *deadline*,
+or passes it. Or at least when we realize it did.
+
+Examples
+~~~~~~~~
+
+==== ====== ======== ========
+Task weight vruntime deadline
+==== ====== ======== ========
+TA    1     7        8
+TB    2     5        10
+TC    3     6        9
+==== ====== ======== ========
+
+Here, *V* is equal to 5.83.
+
+The only task that is eligible is TB. It has the farthest deadline
+but the other competitors T{A,C} are not eligible, so TB gets picked.
+
+Sleep Handling
+==============
+
+The problem with sleeping tasks is that their runqueue's *V* continues to increase/decrease
+while they are sleeping. Normally, sleeping tasks leave the runqueue, so we need
+to save their *vruntime*'s position relative to *V* in order to place them correctly.
+
+(Delayed Dequeue is an exception to that, as explained below.)
+
+We call that *lag*::
+
+    V - vruntime
+
+Example:
+
+==== ====== ========
+Task weight vruntime
+==== ====== ========
+TA    1     1
+TB    1     3
+==== ====== ========
+
+Right now, *V* is 2, TA's *lag* is 1, TB's *lag* is -1.
+
+Now let's say TB sleeps and in the meantime TA's *vruntime* gets to 12.
+If we try to place TB with::
+
+    V - lag
+
+It equals 13, so *V* gets to 12.5. So now TB's *lag* is -0.5 instead of -1.
+
+So to fix this, we use a formula while placing lag::
+
+    ((Sum(weight) + weight) * lag) / Sum(weight)
+
+
+Here, *weight* is our own weight, and Sum(weight) is the sum of all of the tasks weights in the runqueue,
+in our case both are equal to 1.
+
+Now let's try the same case with this formula:
+
+*lag* equals -2, *vruntime* of TB equals 14, so now *V* equals 13
+and both TB's lag and TA's *lag* are correct.
+
+Delayed Dequeue
+~~~~~~~~~~~~~~~~
+
+Negative *lag* means that the task is in debt to its runqueue.
+We don't want to carry a task's negative *lag* until eternity.
+
+Because while a task sleeps, the other tasks in the runqueue work.
+And if the task were not sleeping its *lag* would increase since
+it was paying its debt by not working.
+
+Sleep is similar to this, the only problem is that normally while sleeping
+we wouldn't be on the runqueue. Since we are sleeping and we don't want
+to be chosen. So our debt wouldn't be paid.
+
+With Delayed Dequeue, if a task has a negative lag and if it's going to sleep,
+we don't immediately dequeue it.
+
+It stays in the runqueue, as if it's not sleeping. However, because it has negative lag
+it's not eligible.
+
+A delayed dequeue of a task can end in 2 ways:
+
+1. When the task's debt is paid fully, (*lag* >= 0) it becomes eligible. So it can get picked.
+   When a delayed task gets picked, we really remove it from the runqueue.
+
+2. If the delayed task wakes up before it gets picked, we just clear the delayed
+   status and the task stays in the runqueue.
+
+
+References
+============
+
+.. [1] https://citeseerx.ist.psu.edu/document?repid=rep1&type=pdf&doi=805acf7726282721504c8f00575d91ebfd750564
+.. [2] https://lore.kernel.org/lkml/20230328092622.062917921@infradead.org/
-- 
2.53.0

