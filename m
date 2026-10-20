Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498350;
	b=Ef3Pc6ibtIo66yiegjyT1GplBBsopoXM2/T7Dab91f+fAkszijOMDmFRIFuGCxxGmcpu
	 BjSnkd0EJGCaWQD8K7f93dfvZhmTJRE5chHZWhltv08uvwzAH3oCkjKTzzGAY8VKU2dMY
	 xyATk3j7oOi70AkmH9RsW6oio3Fbs0MNxKOxBr55z2wp7hz5vYZSKSH/fpK4gxQllxvdv
	 JuGQl0lWdAoJ5UcndY5nek0I7kqfRjWkBz5USd/x5Re2IjdOzFMf4S+c2bgAHvcEbicwq
	 Guix7LDzaUoB1bM14A0tNwC9z53qwfvRvLyeSw7+J67A/nJ9IAn2vWs0U4mCIN3oZtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=15y+rjAagndMWGwtM7jZ3FI/6ZLw41O6Mm1RADPXVig=;
	b=5ioMloTeQzGuPdtKeoZ6+ZFSuuLzqbtT4WEWAxYG/S1GUJIVLknkjRv9Dc+7/OEZaxHf
	 cW6VrDqu7YeRDUPRB5WNFNuHz1TJ2GiCsh/culfguV2Mf3OCy11nC+G7czsSm71FMX/mK
	 S+E1y5urNRF12ROYjSh4q+IxlC7Jf8ayhdNtAc3rGgOIe+Bf2270p8At5Kerd7IamQgvB
	 fDIO0OS0+As/C/19c1f0w2gX+1UicIq0KFXWvJT9iUiDOxN9ceQh7FGrQ/V4w7m/VfAUP
	 cC5Ci0NqlOENc4FOoeylu2ZnolI6Y6WdNT1DkOc+aOiFenIbwEpL22jP9Fy2Cvqg9Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sadrul.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=PAKoiuvQ;
	arc=none smtp.remote-ip=74.125.224.72
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A3D606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:12:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97A3D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sadrul.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=PAKoiuvQ
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-675706e468dso3927930d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792498349; x=1793103149; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=15y+rjAagndMWGwtM7jZ3FI/6ZLw41O6Mm1RADPXVig=;
        b=PAKoiuvQQkkjHkOs6RfgGQJ+nnDlik4X7i6u61dIqwoIw8wnmSwygTSoMCH/cnLbEC
         PnAbGc5ep7OxEwUw1jUbJqyGNK7UnX6q9jAugMXaNpfYmdLbCE0by9Gg4oRjZjffIOhy
         nDIZ3BsJ8Jkf/atrremfB07vYT36J8ZhyCjeB4A6GsW/fOOvLyDYI8oUV5OeG7TqxBdy
         DLAMR4kt3sp7Gw/8NBWv2KmFezzjD6nO9xiDrYGDxUO6g/F8cDIE1CqAxxj5xVBMMQI8
         Jn6ZyOCxm9dKCksnIl4lXV/J5p6KCBt/XDOPLunLv1bbHwRIn1VHsFl3RoLUmM7046lU
         gCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792498349; x=1793103149;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=15y+rjAagndMWGwtM7jZ3FI/6ZLw41O6Mm1RADPXVig=;
        b=O2F+BYJhzU4UuUN16vh5famjwHPPB8oJBiAbC8zWn1BqTqxYqnYvD+3+hAaJPkc2ij
         He/+NJ+ZzYCEUHRr41xNyhxz6X2DwbJzLkmDWdughx4MXISqs7WM/LI4caHC1QmY7jnL
         SaW3Qt88Dt55BXrbRvVuIrysUNx8GstThMZjjr+HCxGdL4DPldwtw9yPCcAcNa4GOV+k
         25Skgnd/12tmhGGnxc+epL+2mWX5JQoBW/2tbb4RUY2NltTdQ5heOEkVqU0XbvK/ZtkP
         X+QmrJGMNkkhKvhyUA2m98xNyBp+8Ob59PGkoSTNK4mlZCSbCfGwZ6+mOLCUZI4H+g2A
         Lw0w==
X-Gm-Message-State: AFq9FYJwLrHAlNjFMrJ+R1M55/3M8XRs7vHBB03HXgao6eUR7w+SUyVa
	q0p0adyacZoS9zVeJGawdL7iULcsfFsq3FFuKOwjLQKz8E5G9cc+0OyxROqbJzfxGX2tdl1Qt4E
	mShi0WAXI4Bdz2rSi5hVAk60uEHjaplHlUKE5McFi50SgE9QdvIjJEWbZB0SQJrHpCwwovzI9Ko
	aSQLeUE2CsDyDZDvS+NOJOKFxnuslNh6GmhKA0inOnFoz3
X-Received: from yxrc11.prod.google.com ([2002:a53:c80b:0:b0:679:5b49:e5a2])
 (user=sadrul job=prod-delivery.src-stubby-dispatcher) by 2002:a05:690e:128e:b0:677:d251:ccc6
 with SMTP id 956f58d0204a3-679f88d3ecdmr739083d50.71.1792498349203; Tue, 20
 Oct 2026 05:12:29 -0700 (PDT)
Date: Tue, 20 Oct 2026 12:11:59 +0000
In-Reply-To: <20261020121159.2154649-1-sadrul@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020121159.2154649-1-sadrul@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020121159.2154649-2-sadrul@google.com>
Subject: [RESEND 2/2] fs/select: mark select and poll tasks TASK_FREEZABLE
From: Sadrul Chowdhury <sadrul@google.com>
To: linux-kernel@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Cc: linux-fsdevel@vger.kernel.org, Pavel Machek <pavel@kernel.org>, 
	linux-pm@vger.kernel.org, John Stultz <jstultz@google.com>, 
	Sadrul Chowdhury <sadrul@google.com>
Content-Type: text/plain; charset="UTF-8"

Similar to epoll_wait(), threads sleeping in do_select() and do_poll()
sleep in TASK_INTERRUPTIBLE via poll_schedule_timeout(). During system
suspend and resume, these threads are woken up by the freezer solely to
transition to TASK_FROZEN, and woken again upon thaw only to re-evaluate
file descriptors with no pending activity and sleep again.

A previous attempt to make select() and poll() freezable in commit
9745cdb36da8 ("select: use freezable blocking call") was reverted in
commit 59612d187912 ("Revert "select: use freezable blocking call"")
alongside the epoll revert due to issues caused by the legacy freezer
architecture.

Following the freezer overhaul in commit f5d39b020809 ("freezer,sched:
Rewrite core freezer logic"), tasks in TASK_FREEZABLE are safely frozen
in-place into TASK_FROZEN without running userspace code or experiencing
premature wakeups before resume completes.

Pass TASK_FREEZABLE to poll_schedule_timeout() in do_select() and
do_poll() (TASK_INTERRUPTIBLE | TASK_FREEZABLE) so that polling threads
remain asleep undisturbed across suspend/resume cycles.

Reviewed-by: Jan Kara <jack@suse.cz>
Signed-off-by: Sadrul Chowdhury <sadrul@google.com>
---
 fs/select.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/select.c b/fs/select.c
index 8943f20e8300..5cbbe86135bc 100644
--- a/fs/select.c
+++ b/fs/select.c
@@ -601,7 +601,7 @@ static noinline_for_stack int do_select(int n, fd_set_bits *fds, struct timespec
 			to = &expire;
 		}
 
-		if (!poll_schedule_timeout(&table, TASK_INTERRUPTIBLE,
+		if (!poll_schedule_timeout(&table, TASK_INTERRUPTIBLE | TASK_FREEZABLE,
 					   to, slack))
 			timed_out = 1;
 	}
@@ -961,7 +961,7 @@ static int do_poll(struct poll_list *list, struct poll_wqueues *wait,
 			to = &expire;
 		}
 
-		if (!poll_schedule_timeout(wait, TASK_INTERRUPTIBLE, to, slack))
+		if (!poll_schedule_timeout(wait, TASK_INTERRUPTIBLE | TASK_FREEZABLE, to, slack))
 			timed_out = 1;
 	}
 	return count;
-- 
2.56.0.212.g129ede20d9-goog

