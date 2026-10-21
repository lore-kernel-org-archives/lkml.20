Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585567;
	b=BcZbD+SB076ksEZ6ql4sH5WC2Pm22Ef7zi/LMtZf2PBVQR25YQw9YRJxTXI9uicxLJ8k
	 ueW5xPnnAQkblpDMhmPPLpCPl11orhoUxl/NuQu9WWO0AS1pBOdNCjvKCuWNDHNMqXgyQ
	 emk+ZIeAR5TX5vHtSnt+k6SrWoE5sP02PWoAb1IbaFB9ftIMyuykIS+JKA37141icJ73E
	 hfPE9+dRFaD9aV9XJ2t5UTvk9F/8OrW3t/JVC5XmZGDSdOhz3PpeZUEozZO/qg/3AyqOX
	 HXjLkiWXxKP6u+IRbtw0WAUyC9kTLZ3loHSw3cRuO7CDv91+4ZYHVRzFNo2oaNuqvNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=NR/6ReBtZzWPhL7shMo8n0oVFcpdIbC1mfBQJ9hh1jE=;
	b=QSezrza+yoxkMxL+ADIONYsmppDbf+htyg2t3CHh4aTA5TO8SKlHkkz9OAAJ2fcC1yM+
	 xP9iaixHijvFoyhBQVWUvv0chXGaBVrI2y+fFO/F4uNyHyX28lIQi3JwMGYITeIFoavMN
	 HxwPKDdubGWuV2tcDj1JmFWrmnxCV1lFs49oY7/hmF6p30KJ+KZyYbdPUngy+wjjgT4Fn
	 BWrxxt6HNpzXNMKBinpuSShwAukYfUGbwZGjl4eOYLO1p8d5u08ooEBUO629GJhJUWg7h
	 nAArXyUjjif3RQlwH5NN9C1w0RBKxvFllrkgJVW1hSCYMketpUfNqUPVa7G8NU1Xyng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sadrul.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=RDQptoAr;
	arc=none smtp.remote-ip=209.85.160.199
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA8F606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:26:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDA8F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sadrul.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=RDQptoAr
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53380b67cfdso16614081cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792585566; x=1793190366; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NR/6ReBtZzWPhL7shMo8n0oVFcpdIbC1mfBQJ9hh1jE=;
        b=RDQptoAr7ZarafLjdYmo2ZhJs4b25kqadd7r9xdWurdX2lBuxGBC9Un5Wy9mY8DA8s
         S/EMrM1T7nR0PBt/Y0xm8VF9eNGiLRMoVXPt/kGWXFhWAcj7TRw4+Kiu3hHTHKThZw9u
         6yD7HXvvIffk42RgAKcF0R3gIqmN2WrFdmIpZEkWOmcD6+TWDw8mNnyCclW0HuRUq8F+
         HcVbwviKLbVDr5SOr7KfK5TXb7yEjdkwEyhNoQbWuJfo/H4d8WJ+tEbouL/sQx9/Mvdg
         XtTdKWWip+Q0SF0MzPVNw6NXwEN15KIyzfU+5ajNZfiVxrSjsAVximiJRVsT0HvCgQ2/
         4x4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792585566; x=1793190366;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NR/6ReBtZzWPhL7shMo8n0oVFcpdIbC1mfBQJ9hh1jE=;
        b=dFUGGox+N/zuW9SQfau9TBOrEc7BiWb2WMn2KStNiLcwuTA3O6bGbEdVV5A4iJGYuj
         y+uI0+4NyDkTrZia2AaWaoVBT9DOlqbmPDziBEW8NcJBO/Ix2ibXV/3mYpFI9SLQQnnG
         761H7rKTtBFzLtPgus1zlIjJHLdeEom6OAJcrO5CtN8WA6uI2eWDEJzXgPrYfs0Z5rI7
         P8/hPfnvqRWCGFF0YY9JNLKIIid3F5vS1q/u4/MkW2aogn4ZZrHG0Qt0x1TF85HSbm3L
         BwvFakSUgreXwt/gXGePlT3HMPo2DKoRQlT5pZQxeV+FRUV135+9EUwA3KZjPmEo9CxJ
         5zog==
X-Gm-Message-State: AFq9FYJw6G19Qgycmppc9+45sjwntINcakSJ2GP6Bf+rZqlrZ8WXuEPK
	MTS9F5HLNRgu3QNwmSLpxOMjdXqguyMksIIP5i8MRIU2NMRY296N3CsnmTKl6ATGU7VfYo9iUtU
	oZ6z+HC1NSjNVZGH1GhkHOPSFEfYLw+T9BXCwaAz4OdYT/Al0eW38b+4ntPIF0YzKsWRnkrTdKt
	/TlQXMG4K6IxvalmJnANpb/lwE52/iHeL+ZB74JbjoM091
X-Received: from qvbfi13.prod.google.com ([2002:a05:6214:1a4d:b0:91b:88d2:29c0])
 (user=sadrul job=prod-delivery.src-stubby-dispatcher) by 2002:a05:622a:488:b0:535:855e:6e25
 with SMTP id d75a77b69052e-5369b8c7082mr28413131cf.47.1792585565409; Wed, 21
 Oct 2026 05:26:05 -0700 (PDT)
Date: Wed, 21 Oct 2026 12:25:42 +0000
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
Message-ID: <20261021122543.3547778-1-sadrul@google.com>
Subject: [PATCH v2 1/2] fs/epoll: mark epoll_wait tasks TASK_FREEZABLE
From: Sadrul Chowdhury <sadrul@google.com>
To: linux-kernel@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Cc: linux-fsdevel@vger.kernel.org, Pavel Machek <pavel@kernel.org>, 
	linux-pm@vger.kernel.org, John Stultz <jstultz@google.com>, 
	Sadrul Chowdhury <sadrul@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>
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
Acked-by: Rafael J. Wysocki <rafael@kernel.org>
Signed-off-by: Sadrul Chowdhury <sadrul@google.com>
---
v1 -> v2:
- Rebased against current mainline (torvalds/linux.git master).
- Collected Reviewed-by from Jan Kara and Acked-by from Rafael J. Wysocki.

 fs/eventpoll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/eventpoll.c b/fs/eventpoll.c
index f48b829a710f..76906ced2b86 100644
--- a/fs/eventpoll.c
+++ b/fs/eventpoll.c
@@ -2327,7 +2327,7 @@ static int ep_poll(struct eventpoll *ep, struct epoll_event __user *events,
 		 * the same lock on wakeup ep_poll_callback() side, so it
 		 * is safe to avoid an explicit barrier.
 		 */
-		__set_current_state(TASK_INTERRUPTIBLE);
+		__set_current_state(TASK_INTERRUPTIBLE | TASK_FREEZABLE);
 
 		/*
 		 * Do the final check under the lock. ep_start/done_scan()
-- 
2.56.0.212.g129ede20d9-goog

