Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015074;
	b=x/mLvK4UdvHRBKRBKg16et43Cohptl3GFweMTMz0UcBy3dbpmt52iGTreP8myo2tbuU7
	 /cHqJDrIjT7sTX9qSYHr9XOs3AIp4UO6Xlomq3B0DaHeanGPJu7xP9dxoFemxN3UQPWeL
	 2bb33nru3GH2EbdxQ/VQo4O1vNZdKPS5WfvAvRIqOOZhNRGs5jErw3ZjzHmTbYO4nYQcs
	 +79EkcWhdK0RRIzOgKAYlOst7fGo/3miAVE6ltx6qjSX4xQ0cwrAnKGG1hzsKLIje4f6F
	 MmIzpY3mha75P6DlcwPs8r0CNdw/yHdlxDbqvsaVKNo6MwXzvQN3Pbm/+aHsID7olUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=vqQ93B36gXOYRk9a5z5qRqknUPXtToTVq9tjvdoga00=;
	b=RnMT7/tojVNz4fRzHV7Yl0fbfgKoAK6i7UYQooK/sbxM7MHpENoUgi/5Yuc2rJ6YIafB
	 bS3vwGH0jor5OE9AZROel5iEeakLkH2y5CKoBT4atqUTmHGYBk2lbd5VVH4HA4ZrGQZKj
	 srx9MI0urG2GJVIH2LhXp0IVfnHYt+Cm90ZVqmalnT0gYBVsKud6Z24haFPLq5+M2uPLQ
	 C7gzPbkPw3MIVLRQaF4/jjoM3rMnZSOrPDkliqHPP2OgYunPaqZglJFMGujH21mJO1ePx
	 qed/bs9G8HGu10TweLwNMT7E+JRXtrcpNY+KJCCkKlrKAwpJj6pAfmL6bE0oPPioNbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=dBLQCQsn;
	arc=none smtp.remote-ip=209.85.221.71
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9308606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9308606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=dBLQCQsn
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48dff112136so1999814f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793015072; x=1793619872; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vqQ93B36gXOYRk9a5z5qRqknUPXtToTVq9tjvdoga00=;
        b=dBLQCQsnw9QEeLnCTADfF2JlUmnePYG1rfvC1dbyn0+Qnwb7lNPJ5VvE4fbwkbP9qW
         fyO714eISPB4J1+EJbPmEJq6u7EvMERW8u38FGIat7JqscrS/8FcpIjxG0u2EffT677R
         P5AhtOVW7+4ZOeD15lw7cC9O6LFHfidvFoL3BGA6HpB662NQ8/3FzARrGQgZOWKJO0Xb
         p7rZhKRdLqEfqbbRfD2PNJyxNb85Atry+4Tq737TfbfmWo7e/Doty5/zAV4+m4uwJWPi
         +4RxOB0i2j7KpMaILc9TS1vmGOFzj6zJrN554GpIAiE0yzaAdEVmDb1yaPUbXPXOn7NA
         K20A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793015072; x=1793619872;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vqQ93B36gXOYRk9a5z5qRqknUPXtToTVq9tjvdoga00=;
        b=K2NV/IfWQlFQ2Dcj1AwxMJYeFqytNnR1+J4+4QcnypGpabgtrYY6SBBqclm5C/ZcsH
         72TKWY7VqW80euy7ti2Y5L/8p4BIy5bqrimYBEQIqlwLw3GNcjrshVSz0hst7zROdJBX
         6c2BP0D5T1PBkXFeMjVSiX3ShqRJBsKpjH3Pkh1A8B6gxsOItkyHIAjkapyob4Rmh0Mr
         kvtbKp/Zo6kxs8AE1UOSDT3zc2NW/AhZOKGdbfDy+P6iQIWm1S9W+9yYnKXGx1cv4mwi
         21/hpXO838LiTn7/sY/IPi5fnhOlGLlo5XiDRni998W5GM3ExMgGVNeXbvZ6Utrg4AdJ
         500w==
X-Forwarded-Encrypted: i=1; AKwUvBzARh3jqlTzYr3y/y0hMWMjlrfwEqz34MzqjjsujEcsYL12rnEb9VpjzVjTgVInOqdCEe7thf51Q20xgMg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEwXqHB3afwvLGjPgu32j91wXxFeofdm0OMazUL0KB0bU6TUGr
	w7ml2kAf3MDXtZvi4o0AUggqne3gogZi0gQwmG/S6TvehBlJZvQlNoPnbyz3ggB2XXz1BspFiXz
	gDXMmkZI39UftFA==
X-Received: from wmcq4.prod.google.com ([2002:a05:600c:c104:b0:4a1:70b0:32e3])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e87:b0:4a1:a2c0:7b73 with SMTP id 5b1f17b1804b1-4a35acaa6c3mr119154455e9.30.1793015071769;
 Mon, 26 Oct 2026 04:44:31 -0700 (PDT)
Date: Mon, 26 Oct 2026 11:44:22 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261026114429.209588-1-jpiecuch@google.com>
Subject: [PATCH v2 0/2] sched: Fix SCX_ENQ_CPU_SELECTED for queued wakeups
From: Kuba Piecuch <jpiecuch@google.com>
To: Tejun Heo <tj@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Kuba Piecuch <jpiecuch@google.com>, David Vernet <void@manifault.com>, 
	Andrea Righi <arighi@nvidia.com>, Changwoo Min <changwoo@igalia.com>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

SCX_ENQ_CPU_SELECTED is meant to tell ops.enqueue() whether
ops.select_cpu() ran for a wakeup. However, wakeups delivered through
the ttwu wakelist never have the flag set, because sched_ttwu_pending()
drops WF_RQ_SELECTED. Schedulers that set SCX_OPS_ALLOW_QUEUED_WAKEUP
therefore cannot tell whether ops.select_cpu() was skipped, and
SCX_EV_SELECT_CPU_FALLBACK is undercounted.

Patch 1 carries WF_RQ_SELECTED across the wakelist the same way
WF_MIGRATED already is. Patch 2 adds a selftest. In a 4-vCPU VM, without
patch 1 the test reports that all of the roughly 100k queued wakeups in
a 2s run had ops.select_cpu() called but SCX_ENQ_CPU_SELECTED clear.
With patch 1 there are none.

Patch 1 changes kernel/sched/core.c and include/linux/sched.h, but only
sched_ext sees the effect. Peter, Tejun: I'll leave it to you to decide
whether the series goes through tip or the sched_ext tree.

The bug was found, and the series was drafted, with the help of an AI
coding agent.

Changes in v2:
- Patch 1: Reword the description to distinguish the wakelist path
  before ->select_task_rq() from the one after it, and fix the
  ttwu_do_activate() name (Andrea). Add Acked-by from Tejun and
  Reviewed-by from Andrea.
- Patch 2: Give each ping-pong task its own two CPUs and dispatch to
  SCX_DSQ_LOCAL. The waker and the wakee then always run on different
  CPUs, so the test no longer depends on tasks spreading out on their
  own (Sashiko). Skip on systems with fewer than four CPUs.

v1: https://lore.kernel.org/r/20261023144811.2230393-1-jpiecuch@google.com

Kuba Piecuch (2):
  sched/core: Preserve WF_RQ_SELECTED across queued wakeups
  selftests/sched_ext: Test SCX_ENQ_CPU_SELECTED with queued wakeups

 include/linux/sched.h                         |   6 +-
 kernel/sched/core.c                           |  10 +-
 tools/testing/selftests/sched_ext/Makefile    |   1 +
 .../sched_ext/enq_cpu_selected.bpf.c          | 111 ++++++++++
 .../selftests/sched_ext/enq_cpu_selected.c    | 194 ++++++++++++++++++
 5 files changed, 319 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/sched_ext/enq_cpu_selected.bpf.c
 create mode 100644 tools/testing/selftests/sched_ext/enq_cpu_selected.c


base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
-- 
2.56.0.257.gf7497c7d27-goog

