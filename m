Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793692873;
	b=Svt9iKtZpclEE4q3EFBov2qu2QHdyu0+61UasdYsSzd61gaJZ3AD5E5IYgvSBQj7zw1g
	 Fh3UreMhsrcJCmiYvgA7kQyHR7P1tb91wi0Tr+tnvGIBoJ2VeFS/ab0vD8jiyfhuezJQ1
	 Gp4NWRMPIxGKfzmH/hs25Gla3VE5zc6IJeiZfWC06ZBAdn7Qcx0/iIQz/fDqQfN/8orM1
	 HS0M+ky1rz3IvIkFeWWaCzMzJR4nDw59gTIEUwRsS7AXXnOoHu/9AY5NOqv1HmxgfsQTG
	 tIUFGa/nBdqSElqljpa1/bFupAs7P1ygbW+u9kvlAbGp+P1vsDruVloTKqeUwCbxEug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793692873;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SqwVuuFMKCKR73bttjYygSAw+Vd4A3DCZlBKiSiMzKg=;
	b=TPz45nTvCtebIIa3eJ/ikQaOkB/DIATYOU8LZpnyFR4/8sR0TKaVaht8kDqKCL9eScD7
	 JM13AbSW0xSKurDawcpsKRXxq7Td/EN4bsQKQRPVcqzSnp1CtxDTrUkTsVrxTz+Qd2gy2
	 BG+rwunZGyQLBxAyeMajx/HZ0EaZRW9da9biTEQSH0RogvnW31x7QoZhAdePXXnnFqmZw
	 gKjwsNx+YkFW/E7BWcJ9Wcdh6pmg28SjENqugj5wRcD7wMlqyeofXEpoJUCkjDmpWA9wi
	 NOvzvIr/6YpqYnyq2T+J7mdDIeipLczyq/1tbKBx/0+EFACBtq44dEcCE3NOsK8uLGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=mVCtAZLJ;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4286606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4286606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=mVCtAZLJ
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9F11C3F520
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1793692871;
	bh=SqwVuuFMKCKR73bttjYygSAw+Vd4A3DCZlBKiSiMzKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=mVCtAZLJd/tobJKb2UMImx4CICGH+maJJWcHNFNnanib4UQc9pqQMF2zc5UQz92TN
	 GeRbtn8KVUBpQLssP6A5pkfRyLLRt1kul/GnC+/cdxMX0jBBshpstT2kZc6n0MyhIk
	 xsfMz/ryKn8Llzfr9f+m3gTA+dctltYIcaEOwcCqdMu6fKx5BGvwRvr7E/uivE3A3F
	 J4XrSxoeC+XdhGC7b/rqwgZVzIXX5VL9wnoS8Jk2O/dlkr686PYE0fVJ48a/+LCD2F
	 Yr7rKCjanC5cNzXzjlydPHApmx0boT8N2xe4NapwRqQumzdPw5mXzyL5X/XAL1+ppD
	 icJiQZD1fbAcpaVx9h9lWUaJJBkxYWzj4qvq2H1DT/YoKXzYsYnT5I6Zv03hPPe1pM
	 Lo+qt/gYXz/DkKRgIvWt6IdnO2+7R9OOI9J2Gy9jOn2G8dxy47/08W0WqCsk2uAuCO
	 SylYnhQ2ZO7yxrtb9ab8NeYVbQ3zPNKmQwvC1BStw7VEYnfObrvLbCY8wAf/i7r050
	 zhOR7Q9i4R6rjjiGLGR0DYncwV6gUHxHFeUB0ZEXyX4WMMMrke+qvAJ9wPq1MAw4N8
	 YFZ/jjtFV8gwVG827rsiVNMIZMvaO3hn+ci8yANJwSuBi/aPi9SzDd9gHOS0zbgDEk
	 SMRo5fbbKL/t5I80A0qdC3ZI=
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a190c53a3so758643eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:01:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793692870; x=1794297670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SqwVuuFMKCKR73bttjYygSAw+Vd4A3DCZlBKiSiMzKg=;
        b=wt/QPs2KqiNqvjlS6qTKJ94RPtimqd3s/HIddc3lcA1PDerfiP5hvz05uHL7OW1Xvr
         NwUllL7fvHv5ywaJ/9Pqph9MsjF3++SAPm1J6m3pJLgL4EjtnBrihI0AfGmvhs3VLlB8
         KbljTidoejNnBU13Do1mNMXyPzKg6cI8ZfE9KFjaH/rDvi+Tw72+d9huI7qSROR+opr/
         MoOSn2WG7kf/AZCaow3tLbk91PCxuh6reLguQ7CNEQ/i7+L/GYkJO3akBIPydO4MsVad
         C/cKRxhz7gBKNWskTQrrF3ErwYNb5zAWxQVQxUD8Gg8t6bqAcFkKs/S6kBoqdyinBVUP
         hP7Q==
X-Forwarded-Encrypted: i=1; AKwUvBwB2a/PUa2R6KEs/SoBXMkg1u6HE93u+gBbeEf8yZPYi/AlW7qcWUt2ndOHkdvLnEzltoXl5ZBP8xAhNmw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6ueY8pwW4F6urZOxpB1FNMoSegXP+7YaLS+D9LHFHmC8/tUdm
	+tcZ99Tk7s1T7QQoPUumbNAerEQHLAl94wnBU1lIdl20p1LjuglMub0WMxTNtv17Th6mM9yZd+a
	SiyAX39Lacfo0DcZPFgVcRW1T85pHnKnvL/Lrtcf40F4tsAg46ycPMQuyDsqQYSH2NkpqLMrCly
	TkqwKwUQ==
X-Gm-Gg: AYBFou3bKUnX2ct4dyOQshA8X1ynFWDTBjGwE4TUeO2GG3whA7n2dqDag3EHoTViq0h
	8kqFCdIekUKqRUMVZUSkZzTbqD3MReN7kcGKY8mJvnZrtIT4DJ5WJiQ/88rgki72U9lKAOfazF8
	1WgKr/UdxP1MBKcx4EIKqWCjbWhZc4DkpEu+zjlRj18h3zUwj+x+jByA9yFi2AFmzZEEacr9o86
	31CfClq2YaQynJEM8Tn8wXSSV6pdYuA8hdiD1F3msEcekHd4BOQZ8/zM+9dD74Nec6qAYmW1UJH
	r4L5/rLHajhGgmtuZ7CmwSnpu02yEN2HQQXV7HdG1cQmjfL4+lOW4VfID/X+FT7XYgbf/o9UOPy
	WlZvUCYKqQ3r9O2vI4lQCzVmLnjunYzM8/RLb5zYycv+ar+w063usZjr7HvWSrAlOHu8BCL8ufX
	3Sg/uCMpQ2WKk+LJg8XA==
X-Received: by 2002:a05:7300:f587:b0:35a:3b98:b428 with SMTP id 5a478bee46e88-36a424011f5mr16276686eec.12.1793692865036;
        Tue, 03 Nov 2026 00:01:05 -0800 (PST)
X-Received: by 2002:a05:7300:f587:b0:35a:3b98:b428 with SMTP id 5a478bee46e88-36a424011f5mr16276664eec.12.1793692864506;
        Tue, 03 Nov 2026 00:01:04 -0800 (PST)
Received: from Garunix (122-58-163-222-fibre.sparkbb.co.nz. [122.58.163.222])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af4e6sm37885274eec.4.2026.11.03.00.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:01:03 -0800 (PST)
From: Matthew Ruffell <matthew.ruffell@canonical.com>
To: Waiman Long <longman@redhat.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Caron Wills <caron.wills@pulsar.com>,
	Ridong Chen <ridong.chen@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	Jay Vosburgh <jay.vosburgh@canonical.com>
Subject: [PATCH 5/6] cgroup/cpuset: Don't wait for memory migration when cpuset.mems is written with O_NONBLOCK
Date: Tue,  3 Nov 2026 20:59:39 +1300
Message-ID: <20261103075940.110308-6-matthew.ruffell@canonical.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103075940.110308-1-matthew.ruffell@canonical.com>
References: <20261103075940.110308-1-matthew.ruffell@canonical.com>
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

From: Caron Wills <caron.wills@pulsar.com>

Writing cpuset.mems migrates the memory of every task in the cpuset on
the ordered cpuset_migrate_mm_wq, and since commit 3514309e0322
("cpuset: Defer flushing of the cpuset_migrate_mm_wq to task_work") the
writer flushes that workqueue from task_work before returning to
userspace, so that the write appears synchronous (the design of commit
e93ad19d0564 ("cpuset: make mm migration asynchronous")). The writer
therefore sleeps in TASK_UNINTERRUPTIBLE for as long as all queued
migrations take. On a system with isolated CPUs running SCHED_FIFO tasks
that was measured at 2 to 10 minutes (LP: #2165410), and it is unbounded
in principle: a migration blocked behind a starved kworker or a slow
expedited grace period holds up every migration queued after it.

The writer is usually systemd. It applies AllowedMemoryNodes= from PID 1
itself, and since v259 it opens every cgroup v2 attribute file with
O_NONBLOCK precisely to opt into asynchronous semantics wherever the
kernel offers them (src/basic/cgroup-util.c, cg_set_attribute(), citing
the memory.max/memory.high behaviour of commit c8e6002bd611 ("memcg:
introduce non-blocking limit setting option")). While PID 1 is stuck in
the flush, logind cannot create sessions and SSH logins fail.

Honour O_NONBLOCK the same way memcg does: skip the task_work flush when
the file was opened non-blocking and let the migration complete in the
background. Blocking writers keep the synchronous behaviour and the
cgroup.procs attach path is unchanged.

This does not make the migration any faster; it only stops the writer,
in practice init, from being held hostage by it.

Link: https://bugs.launchpad.net/bugs/2165410
Signed-off-by: Caron Wills <caron.wills@pulsar.com>
Signed-off-by: Matthew Ruffell <matthew.ruffell@canonical.com>
---
 kernel/cgroup/cpuset.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 3219f927c35e..439b55a310fe 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -3482,7 +3482,16 @@ ssize_t cpuset_write_resmask(struct kernfs_open_file *of,
 	free_cpuset(trialcs);
 out_unlock:
 	cpuset_update_sd_hk_unlock();
-	if (of_cft(of)->private == FILE_MEMLIST)
+	/*
+	 * Memory migration runs on cpuset_migrate_mm_wq and the writer
+	 * normally waits for it before returning to userspace, so that the
+	 * write appears synchronous. A writer that opened the file with
+	 * O_NONBLOCK asks not to wait: let the migration finish in the
+	 * background, like memory.max and memory.high skip synchronous
+	 * reclaim for non-blocking writers.
+	 */
+	if (of_cft(of)->private == FILE_MEMLIST &&
+	    !(of->file->f_flags & O_NONBLOCK))
 		schedule_flush_migrate_mm();
 	return retval ?: nbytes;
 }
-- 
2.55.0

