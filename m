Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1C747CC80
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790111779; cv=none; b=RS/xwODwQtQtMxgJTmxkDmxOvf+w5cTv1vzd7WYOMj0jLsbC5xCNW81TnfOWZq8GjD8/JaE22ZDQqkAYUe1Lo/ysbeXOrB13ALIC6zu0CQ0QMXwtbL9yQD0ICEYwI+JMcZqwWpkwCVvXnUkzw7B5XzaRFNMRAIaucj+iJs/SriI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790111779; c=relaxed/simple;
	bh=TLJk0N+b1Cxg9zC7rPm5TxKSYvZpe4azzB5UFBUX11k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Myp6s/dKtI7KgvUs+rwnoMH2sSfveEKM19TuI2/CFzIlFN2dUrRdBLgpL9ulqQp14D4quK/15SeDsAYZlv/K6TYU54YD1C7F4s+KLpe2YKU8rZm+7nWNoq0Pn1+/VlwStM2FFdGI/8eQuhkgHwHhonkew+jhrX/gHqYp5ZARdJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sadrul.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h03wOeaf; arc=none smtp.client-ip=209.85.160.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sadrul.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h03wOeaf"
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-532e0dd7d9bso7038401cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790111773; x=1790716573; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e9G06dGCMcRjyhNtUUD0HRcun57ApXXJRKub9jsBEOs=;
        b=h03wOeafhlrn+rdlqhYDDFCQG97h5EZjHUWKD/com00ZE1I3NtkabmD6menGoI5gT7
         XkCN3xNhbTKfdN7LwgmQI3fxFSBzkPfxbW3NTMQbEgF62kN++CwWuQYO0CXd9ZV48yhs
         pardCnrYAu1s2lQfvSP0GmCwRtWfteowu+BF1y1FnJYcuJpzKPBc8OxImXDRhnyDV0yK
         dW/piiDDM8i8tR2NgVYnhcu0CSnpIX7tYQntfuzY9KirZ/i8XrRK+gNTf6WLPBtF/Z98
         RHl7SNiFmzJwofrc8bNYrueKPOaxi8ATVRwTdiP66esdMWiBDxXZzITDZkXQX72Ux6TV
         7uXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790111773; x=1790716573;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e9G06dGCMcRjyhNtUUD0HRcun57ApXXJRKub9jsBEOs=;
        b=1h3Qafr5uYy7kn65NYx5i7KfuMGa7FrtjHidCboLjoMBqS7v8hLcO1CGiTuOAhkgKo
         DQX5b8nV/gDnQ+efeyCFxNojyGHWThVzx8WrwwScY54vAGOP227pdw8Jz9I1HadS6OIw
         2rU1t2FGNV2Mfg2YGiwKRiOZj5M2DFEgyJDhIxfNn3Ed36Ud6cUjqE4hyMgJ5GnrJcbs
         HbyZz4HMW8Fmpa6/DomcHTqK9sHjGZ2+rS4C8HZB4/EOv+hct55p494Wrb0QBzxq+3z6
         wu8WjjNtM2hh5aJqT09jd4Q8H1bp3JLHVb89ts/aB2qSsArc6fC2L0Bli0ruSj4vqhNK
         cKhQ==
X-Gm-Message-State: AFuF++nGOFG3FdNQEJClgRDeNduArGWkQSzP3ZkQRFjwE6lL3Jy6FgZW
	jOrtKAA/1JbYnd/TfbEBL1+8d97OgumwbBjJuu6cRSH0NcRr+bJ6drSrfFjdY7cj8L1YRKwnor0
	g40DITgQ+uT0+HJF1KE9jGzuQEGWx1mtMWFQzpZI8j0k5Xmr2o9urYtP9idJxu7Prq8XgsBZUBa
	FNZD+EiQKhgJqWoU72G0/h8hCQt7/182id39aeDARHSQS9
X-Received: from qtbk6-n2.prod.google.com ([2002:a05:622b:46:20b0:532:c925:c324])
 (user=sadrul job=prod-delivery.src-stubby-dispatcher) by 2002:ac8:5a05:0:b0:530:e429:ea81
 with SMTP id d75a77b69052e-532eac768c4mr13514581cf.11.1790111772911; Tue, 22
 Sep 2026 14:16:12 -0700 (PDT)
Date: Tue, 22 Sep 2026 21:15:59 +0000
In-Reply-To: <20260922211559.3633398-1-sadrul@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260922211559.3633398-1-sadrul@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922211559.3633398-2-sadrul@google.com>
Subject: [PATCH 2/2] fs/select: mark select and poll tasks TASK_FREEZABLE
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
2.55.0.1082.g2b9226bbc0-goog

