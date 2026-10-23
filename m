Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792766909;
	b=kfiImkELDKjVk2J52hETFaooiobKOthp59+JHUYIc3VbqULa9QwpEFfQEo+QOLnxRJNE
	 WmOdiy4rkz2J1uI9mJfYEMwNTXb1TdQznin97iriScaEfHcTP6MwYKemhczVNv2v8YJtd
	 GLNkFnotnqFnH6YAcQe+X4/swmDCcNtJ/sAU44/625XLsIvKtKLSJR4q88T1WyajSpPIF
	 SR55YQRqpfXeZiamdu6t3k3AOIGTb4URr/paJXoiY4WQPPZavLQlsxKDmujxo6Wd5unyk
	 xOM4LdAEwG0RlRifWJ2yIHP0SCPtKF0Z0JYY2XLKm7EMLDlc9t5IjacAHWi5jLiCZvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792766909;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=nVhDQqSmSQk8KmRrLiX/9SHg/WhJQ9Znl0xClin8EXU=;
	b=aDDYXPsy0URmFM5RHhlleNBhMOBkojJcdxl7XuWhKyDJQ1nPcO8dEAhpOK5+vi+tHN0Y
	 bu7rA3oD00WbMKauhalNnTIFkMab7PtoppXe1jLhL6/6ddZB+dIiKyy56FkD7TDpQ6DO9
	 Xpkt8bV0iO32VoNvWtbWu4dVVeBYZ2cCEdxlAlBiCnq/U4MZZ4LO61DUU7rBf8QuMILwx
	 pM47lHXC8DLz+9/rj87rF72Uj2OIH1kC/BjAb2mxecM3xhAgh7C1cinYIma3BZNSutUZg
	 JMIHbZ31dNf65FG7QXSm/pIhLkxUz1twu1dAynqDSmTsyVJpPCv+CX9jTwry0Ma1Ivw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=bnd2Ab+b;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7713606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:48:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7713606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=bnd2Ab+b
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a20fd059ddso7619685e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792766907; x=1793371707; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nVhDQqSmSQk8KmRrLiX/9SHg/WhJQ9Znl0xClin8EXU=;
        b=bnd2Ab+bfI5uaEHbKwsW/rFHoNlhV8X8rUUyOafVRhWEJwnvDgyQf6bhLP30RcIXq/
         LS5La3b1oGsSZ5LGC3q0DumDdbffzp0AwPTi2gsSgQqUTODLeIlHsDf4iG0WzxlGwSu5
         sCrqrOrMiEApLFb2KL9RcIKrnHULHtvfaTYJCHalaFXk37x9C8zhM3j3ukgYBcWVlF/8
         9gHeeNHTYLGf5k+umTkh739tttTul8oQgFpiMTbxpBQogIfq//kf4vLIvxVAd7wc1HBQ
         D6NoDqbeo9S37nxSTf/LVFQc18RxYb4IQEU7Pr0AqyvMkdAhQNrJHWwGirzUI3rxKdFY
         iTzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792766907; x=1793371707;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nVhDQqSmSQk8KmRrLiX/9SHg/WhJQ9Znl0xClin8EXU=;
        b=MHNJ6edImVB9HPgXD7W63ftHmP3VENqEMxq5+A/uCNoKDXKGHadNI5AAaxD1NxfNyq
         I/rzp8I9pORGVM8RXHfrdUBLBOK+xOTgq+vOtFc025Sh3BNlahLlft0nZNviDd7RkcTC
         yAT6anmQImiuZcP0VvjiJP9WwGLF7INcD5KWvdY8mn4QV9dR2Eku229RGs3SwYEo+T+K
         CcU7zOTgDsF59bFwdNKs8AkFsD1ps58AOX2KSUk2zLrotNLsHbWT2h3bMsuvWC8gKzxw
         XEzOT1nOC8JT1t0wCX0Q8N1yYAV8FR1Z7wEfjFItcFGfau6z8o5A31YCuvFdouLPlbvS
         L8oA==
X-Forwarded-Encrypted: i=1; AKwUvBxVioAwXE3c+40SOOyc49pDJUr4+XqWTw714zOclKPA5sfZEApUWIM3GnVT95gcHd0YesL6PStzzASgVYs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOUjdIIgD0oDSJCzPOOkpODXXiLmWwARWUVplcBfn2X/paKXjN
	N9kutf2t6auObtM6rmqhtAf71lFOt0DgbRDs5vdQLn2WxX7VEv6wrnnvIMbXRO3iUmCCcWHpUwv
	drrW+Xm+biZPEjQ==
X-Received: from wmcq4.prod.google.com ([2002:a05:600c:c104:b0:4a1:dfb3:2e66])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4eca:b0:4a2:10aa:271e with SMTP id 5b1f17b1804b1-4a2df9b4c54mr5707975e9.14.1792766906962;
 Fri, 23 Oct 2026 07:48:26 -0700 (PDT)
Date: Fri, 23 Oct 2026 14:48:03 +0000
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
Message-ID: <20261023144811.2230393-1-jpiecuch@google.com>
Subject: [PATCH 0/2] sched: Fix SCX_ENQ_CPU_SELECTED for queued wakeups
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
patch 1 the test reports that all of the roughly 110k queued wakeups in
a 2s run had ops.select_cpu() called but SCX_ENQ_CPU_SELECTED clear.
With patch 1 there are none.

Patch 1 changes kernel/sched/core.c and include/linux/sched.h, but only
sched_ext sees the effect. Peter, Tejun: I'll leave it to you to decide
whether the series goes through tip or the sched_ext tree.

The bug was found, and the series was drafted, with the help of an AI
coding agent.

Kuba Piecuch (2):
  sched/core: Preserve WF_RQ_SELECTED across queued wakeups
  selftests/sched_ext: Test SCX_ENQ_CPU_SELECTED with queued wakeups

 include/linux/sched.h                         |   6 +-
 kernel/sched/core.c                           |  10 +-
 tools/testing/selftests/sched_ext/Makefile    |   1 +
 .../sched_ext/enq_cpu_selected.bpf.c          | 107 +++++++++++++
 .../selftests/sched_ext/enq_cpu_selected.c    | 149 ++++++++++++++++++
 5 files changed, 270 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/sched_ext/enq_cpu_selected.bpf.c
 create mode 100644 tools/testing/selftests/sched_ext/enq_cpu_selected.c


base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
-- 
2.56.0.257.gf7497c7d27-goog

