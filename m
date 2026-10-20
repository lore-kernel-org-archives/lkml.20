Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498344;
	b=SHckaO+zeoCtYkhWS7NEI+yusrIhZVI3h/dY37NqvObQ+5lAkox10KHo6p7909y31I/Q
	 0hjbX8naYaUwd5R5RRMw9qeHUki/fRV2v6D2DZmqCFqTxZLzvQ7uHtOoLwLe3U5nTnIaQ
	 rVh6K1eHx2Ys7kHheKalvdX+aDy1yuTPmqd38zpMo/1QMZ9Tdgp6ZpmeiRay6pzgN6KnM
	 1nzE8DA4PZdvz2lixaZ+Fw9iizXHI9eeQO1a3lSr4HNo/DF6vxFiBWLDzpBEBv5MexuIV
	 ThfqJLqVSggnStniVyoKy2YD7tM1yuFzJR7shIKblvEO4fyDyL5rmTbhSR/HPf7tORQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=6XUtngxDYkw/Y7D3ufCXmiJQV0M0BWIAb8OzCueSqgM=;
	b=I0huCpTyuGo+Advv4G8V/UDsayU6HaWH10m9cniOqHHZZSU2WThKEVSZRI8vUtiOnphN
	 YZVtIM98VUm1GzzOOBV7o4d4TTH3necAw9T+IRLRdN2V10iw734RkVAEFzLEPuWZdk4Ig
	 gzIiZbu/Jd47u7PKlNmA1+77/XZNljxcAIWDCL7hNeiauLuSJGFZVf+b8JU0lwbUoUjrC
	 NqLVE0KwuaS0qb1D/c1m8/5xxYWHeFs+Tr091L4JGa7hOPcnFFpJBz0N6fqPX/S7JEFtH
	 ZpjSVHFGjfnVJf+9oWkKqB4uF2OF+BISN6rqZX0BdR7B+pC0r4cQL7ifULdeowwEzWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sadrul.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=mjaxFbC2;
	arc=none smtp.remote-ip=209.85.222.199
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7629E606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:12:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7629E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sadrul.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=mjaxFbC2
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so647350285a.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792498342; x=1793103142; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6XUtngxDYkw/Y7D3ufCXmiJQV0M0BWIAb8OzCueSqgM=;
        b=mjaxFbC2aFXaJQU3N2ZkgNo6hbsXk4tvgk/9++2CdzHgbFIWJdNnUzpPbKu//HVMEb
         85aRBJa1wJ4mNX2qondJxFxk3sI3lglpoQaJQv46lO6gGSuPZOaPWn+bXbpC/H/89F+n
         4pt7tB5QG6W36RYUN+KF+nii7eUeGaGahyFkQRz6Yy6JQLH4FO6PE3gCh9YH8HX3z7PZ
         pFE1crgepOTFWMgXgmE5TV1oXvw4WGcZZBovxpHhPbVhPhS4UNZzEX2rF/VZsOFcVqhd
         ydvsjMkIC4xp/Z0xtZpOyYWS9cfsLEeQBZg+ZmXpqfUBytsoQqF6kSdluw7AQMwYkCCO
         RGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792498342; x=1793103142;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6XUtngxDYkw/Y7D3ufCXmiJQV0M0BWIAb8OzCueSqgM=;
        b=laPMkt/369R6hsAWzTXvmlBaWyNqHMKvuFnMEXmuqco5OMA/x3si3tkSVJzq3suRho
         jDvXJvdK/jDS5W74to+tSPemT3+xfL5hguwBjve0Jxio1EVHYrqvrG4LgiH1yUVkyaiL
         /nAwA2mt7lvqFWpvEkK3M1TZzKZ3uav66jrHlDXZMZlOkf4K0I3PYCQin2zhq4k9Lxc7
         lclS3e32PfoebaW2hv7hXIRuzUONOZcfOuF8O9s7auWb1Gx4Qz9uYCnbvooIYWpCwdJM
         S30objUG3/HJ1msMs3TuX031fnTo2eqJNjje6a45PLQgq6AwZ2is4qa5Z/K6E4l5KVYv
         E7Ng==
X-Gm-Message-State: AFq9FYKy89BL5LThSLWTHrIrbG0C4eLSSdjIae8NG/YMtTv4SirsRn8g
	u0qsMRKHCFHc+2uMgwow04xNuVF1JrZ5LAT89Z3cwv9g221zegETtosAEDH0b8QVLytupER1w5k
	3ZLcK9YwE0UFByUFhhcx3kSi6THNfLvZzQew5/GPHhY/oBmuFaxG7qYC1i57DMn/UiKL0iV75Eg
	Srr5BpvAGuMyiXFgQ7tHhGGkRGl4kqK3wdjR4kOR3RpycU
X-Received: from qvbkh14.prod.google.com ([2002:a05:6214:514e:b0:91b:e0f0:871a])
 (user=sadrul job=prod-delivery.src-stubby-dispatcher) by 2002:a05:620a:2913:b0:93c:c7c6:90b5
 with SMTP id af79cd13be357-93f29b9af28mr1655598185a.9.1792498341848; Tue, 20
 Oct 2026 05:12:21 -0700 (PDT)
Date: Tue, 20 Oct 2026 12:11:58 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020121159.2154649-1-sadrul@google.com>
Subject: [RESEND 1/2] fs/epoll: mark epoll_wait tasks TASK_FREEZABLE
From: Sadrul Chowdhury <sadrul@google.com>
To: linux-kernel@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Cc: linux-fsdevel@vger.kernel.org, Pavel Machek <pavel@kernel.org>, 
	linux-pm@vger.kernel.org, John Stultz <jstultz@google.com>, 
	Sadrul Chowdhury <sadrul@google.com>
Content-Type: text/plain; charset="UTF-8"

During system suspend (freeze_processes) and resume (thaw_processes),
threads blocked in epoll_wait() sleep in TASK_INTERRUPTIBLE. When
try_to_freeze_tasks() executes, it must wake up every sleeping thread
with a synthetic signal so the thread can schedule, run try_to_freeze(),
enter TASK_FROZEN, and sleep again. Upon resume, the freezer wakes them
all up simultaneously, only for each thread to re-enter ep_poll(),
observe no ready I/O events, and call schedule() to go back to sleep.

On systems with numerous event-driven daemons (where hundreds of
threads idle in event loops), this causes a large wakeup stampede and
thousands of redundant context switches per suspend/resume cycle.

An earlier attempt to make epoll_wait() freezable in commit 1c441e921201
("epoll: use freezable blocking call") was reverted in commit
c511851de162 ("Revert "epoll: use freezable blocking call"") due to
reports of userspace corruption (Bugzilla #61781). Under the legacy
freezer design, freezable tasks could wake up prematurely while
hardware and peripheral drivers were still suspended.

With the 2022 core freezer rewrite (commit f5d39b020809 ("freezer,sched:
Rewrite core freezer logic")), the legacy fake-signal mechanism was
replaced with the TASK_FROZEN state. Tasks sleeping in TASK_FREEZABLE
are safely frozen in-place without waking them up, and the scheduler
guarantees they cannot be woken until thaw_processes() explicitly clears
the frozen state.

Mark sleeping tasks in ep_poll() as TASK_FREEZABLE. Benchmarks on an
ARM64 test device demonstrate that combining this with freezable
select/poll reduces thaw latency by 63% (from 20.64 ms down to 7.55 ms
mean at fixed CPU frequency) and reduces context switches during
freeze/thaw by 87%.

Reviewed-by: Jan Kara <jack@suse.cz>
Signed-off-by: Sadrul Chowdhury <sadrul@google.com>
---
 fs/eventpoll.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/eventpoll.c b/fs/eventpoll.c
index 6cbef8b4c2e0..35992f6457bf 100644
--- a/fs/eventpoll.c
+++ b/fs/eventpoll.c
@@ -39,6 +39,7 @@
 #include <linux/rculist.h>
 #include <linux/capability.h>
 #include <net/busy_poll.h>
+#include <linux/freezer.h>
 
 #include <trace/hooks/fs.h>
 
@@ -1987,7 +1988,7 @@ static int ep_poll(struct eventpoll *ep, struct epoll_event __user *events,
 		 * the same lock on wakeup ep_poll_callback() side, so it
 		 * is safe to avoid an explicit barrier.
 		 */
-		__set_current_state(TASK_INTERRUPTIBLE);
+		__set_current_state(TASK_INTERRUPTIBLE | TASK_FREEZABLE);
 
 		/*
 		 * Do the final check under the lock. ep_start/done_scan()
-- 
2.56.0.212.g129ede20d9-goog

