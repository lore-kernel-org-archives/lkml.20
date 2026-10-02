Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347EB387346
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945149; cv=none; b=rPvQzHgdwhF9sfFaU5C+H5SWgUzVi9n1kZr5cBGE6T1E5qEV0rL8Bq8BEg/SplJETinL+MceUjfahCFB4zQT+727tlYljvPzSwmQWhsCpzP7NKvkZ7RVVuRs7dj9lYMlSnSl2ioOtNP8WJy+xNCZZ+a2GmB+dX54NWrCASACMEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945149; c=relaxed/simple;
	bh=6o9z390FSaXvtvYhDMYQXh3e4g3IXqp/50zPZ8SIe88=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hp2/AkxX9GFwaVndqHg92dhdQ82/s6zFcAyIPRpQjdjRr9mQrJCzVIimhOAGQ2x2tUGqzqKWCKxte169EiF9LnPSSXKg/5QLGvvuWJmcou04cwWqlCvZkgXXxDFlGZ0yZaJt2672iF8UR/O0cVACYI7yaWL2BO7jV1Dsh+SNlaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Kvf4PQ/2; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Kvf4PQ/2"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hx7ml42xBzMl31;
	Fri, 02 Oct 2026 14:45:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1790945143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=st2DE0l2eDcABWROMrXPJiQnFfgtYr1s5dyIvrcpjGg=;
	b=Kvf4PQ/28f8mxMjw2r6fLebF5wlWIqxvdefcUAhMZu8SlT94ra2cxxWNDjbnfP12bk+Tr2
	5MarOrhydAtqi9b/axVM7GrupGrROrADPXRJ/3A0JVQ6DgJaYjDAG1ujALXztCTf42xwHk
	T0yLZ6jbh6ZEbk1CTMQf6SsWTuZuJT/QA2tjN+xJRvvYbIsfQSvUAE6TvtcdIOnegRF5ht
	mzQoU6rL3qoadxqRJQZtlrBZRQhI4C3zJpseUHn8pqG9zZSzwYJUbxTTZHGC3id7tBLRLu
	7BNVXePV48MlA5BI7qXld4lN7DjR8XNBs8k5v3Qb1klvM+3uhwd60AmFFWlwQw==
From: Tor Vic <torvic9@mailbox.org>
To: peterz@infradead.org,
	mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	kprateek.nayak@amd.com
Cc: linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/2] sched/fair: Remove tunable scaling
Date: Fri,  2 Oct 2026 14:45:36 +0200
Message-ID: <20261002124538.79658-1-torvic9@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 634eb3598d433251138
X-MBO-RS-META: zoscx7q6dbzrtbqgsn84w8c4duznsozb

This series removes the scaling of tunables, which was introduced around
Linux 2.6.33.

I split this into two separate patches:

The first removes the "none" and "linear" scaling which are likely not used much
and have limited usefulness, as one can always set sched_base_slice through
debugfs.
It keeps the logarithmic scaling which is already the default.

The second removes the entire scaling mecanism and sets a fixed sched_base_slice
of 2 milliseconds, a value which has been chosen somewhat arbitrarily.

Currently, the base_slice multiplied by the log2 factor can take the values of
0.7 (1 CPU), 1.4 (2-3 CPUs), 2.1 (4-7 CPUs) and 2.8 msecs (8+ CPUs), so it seems
that the new value of 2 msecs is a sane default, which I also use on my consumer
x86_64 machines.
However I'll leave that open for discussion. Note that the base_slice value has
changed quite often over the years, lastly in 2025 [1].

The series applies to 7.3-rc5, and is build- and boot tested on a measly 2C/4T
Skylake machine. I marked it as RFC because I don't know whether these changes
are actually wanted by the sched people - and because I'm not a developer.
It does however remove quite a lot of code.

[1] commit 2ae891b826958b60919ea21c727f77bcd6ffcc2c

Tor Vic (2):
  sched/fair: Remove the 'none' and 'linear' scaling of tunables
  sched/fair: Remove sched_base_slice scaling altogether

 include/linux/sched/sysctl.h |  7 ----
 kernel/sched/core.c          |  1 -
 kernel/sched/debug.c         | 52 ------------------------
 kernel/sched/fair.c          | 79 ++----------------------------------
 kernel/sched/sched.h         |  5 ---
 5 files changed, 3 insertions(+), 141 deletions(-)

-- 
2.55.0

