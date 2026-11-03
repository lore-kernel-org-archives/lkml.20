Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793667604;
	b=Pbr7zgXCqOJXjqwBU1jaQ82UUq8Tdp7czxaTQCwkTxTN5p/zQBts2oUC4S9B5tpxT2Bn
	 yQBQxQ++HAX/PqJb78t7qgkxltFeHuLWYE4/kwEla7Ag1GMi2BHU6wPIlsyHJbBSBrDJB
	 CuCBOAxxLI5EvGnWLd776nViJdrOg3HxCQgtPvUhnq+dwUcMJUbwBd8LsV57fCXT2R+sT
	 AQ675HsaGuqt4OcQOgVaY9fyddeJm5uFcCeJRBG/yUcZzf4MXdE77mAgdHj49xsXEKLY8
	 p4IXW4JwZrAKwa6io2WAl293RQVeJJf+0CIMMl4ds1cn3FaqY6ZIcB2GFGM2X1Qwk/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793667604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ow8urj6o62V4zz5bSltcE8hPg48W+Ammz/KGj7RuoNQ=;
	b=juTniqBf5nOkWwraBWtuaNXPmTFKL8qRJdTAdCXiPbWCii3XeNXAdThL08VXMOjsZzIn
	 wbqUnKjOkQ/f+v5uBmz4ocEAvSBrkraCdNTuYwpHd1GK8WcbNAiKMfEjiR/MFCSIsZnEi
	 81D3zusZP/3Z4BGNVcPUWyXvu9jVEYCja9O51tOVRANCUMHj8+6r0wz+lGZjrNYsqAeFz
	 8VeiIfWgsR6b1/XebymVEvuss6QHGarmrRQ4Gair5x/d5zPKkMqagLeMbLWPkd2fLOa9d
	 aVy4tIltBGlwSbTiwHW/pKJNQ58/UXxbdsIzknylE6sChHM0SDHY56zjMpC02EmoeHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jU0EXx2Z;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5638B606A332
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:00:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5638B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jU0EXx2Z
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso1849490f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1793667601; x=1794272401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ow8urj6o62V4zz5bSltcE8hPg48W+Ammz/KGj7RuoNQ=;
        b=jU0EXx2ZywDvg9B89/OR8tJVL69qu8V37rXm+C+4w0pmu89MxOUdk0gSxkqGRpQsyw
         q4up3dsAmm9nTw7pcTI7kVdvX9CO1H8JkCbQzfmiou5i9b2ny5gr88VmYBneGr6yDTFo
         FOCkRLMFVdZWIirEpJ3v03aAolWwTq5yZ2cCiKW6pKeMi1Ldk5doV6wnber75/X9qJmO
         KqV4utDvHDYuGVcZJkoMIzcv+H9SpRQGeb3LYCpP0yy22BIm2B5nIkg6M+nWPdDiYxuL
         Dtu4CGcrERuvJV3wnSsdo+fcZbCFlIm4fl8eoM8ihUj2JfM7qAJj1KT6E9QNoE9M+exR
         Ir5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793667601; x=1794272401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ow8urj6o62V4zz5bSltcE8hPg48W+Ammz/KGj7RuoNQ=;
        b=rVLt+wMrp9xog4lnBr7okt6i0g+kJGopyZn0FI1mHvmEO25OkMtamJwDUUPHpL/ugb
         R/ERZ42BOMorp5YaO9+yCAJM+nsV53XkkSL2BGL64MXVFBbYPFovNwf5E+WOcbYy9PqS
         G4BXlFxxBDHszMYcSQj5tmbYv7cgmSmHOoA1pw9kgyxUPAzE0tViiPOzJ/8Hkx4xNYvX
         mSvAkXJmyVl0+J6Qu/JL/gymVe29dFa7P22/YcEaNlzUJ1tKZ7WXUnqo7nsrtJYPg8Dw
         iktsbAFXXlrEvRpoTHFECEGFYlVfLvAdAOpHwAJbSeJWHEDNGZKS+JPVw5X/gFz7zYkm
         4Vug==
X-Forwarded-Encrypted: i=1; AKwUvBxWTWpKooyhscpIaozq0i4G8vAAsLnHhNX39Kk27/hJpKagaPxQuC/bDcdd0fU7tBSpt8rWLi8E2wAm6z4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BxsVHSHN24FT5RMUOYwxxLGdk2DQUe6iz7y07pVWGwzCOTBj0
	PmDcd00hRHTOi88jeti902A6HsRbQOdtz8PQzA6vtbM/402uJ5oVCSbOKyxw4MGzEtA=
X-Gm-Gg: AYBFou2nVF+DfrafpJG0ZJQlA6qkvKiOk6a6+UgWOOJmQrFVhxtzXW4wOG0g9SZoxxC
	m+zJjKuBRsr9Y/dVrpWvX4X6Xz/JKx/kRiWAuC926khXnDANq5Y4AhTZTFIg2At08mfc1fxT8dl
	8Ad/erj0XwLpCOj0kvLxw9y/Hu21Sh9vMMQ8jUG5yIYzssFJWkKGbyzjsElfDYZKVUP5Qf6kIFy
	iQJ8Yt8mmtXuk6EGWL6jyhapcWVCoTz91U6BEUvSnP0CdZyHgUUsEdPXAY4lTneH49TXUvC3SQC
	FSmWtpkwkUC7YEKhTc6ktRpVWKAQgh5rxh4cWhtHhSGj2xkfe4TfFXNTSLPVovQCEshr6im8LEs
	ddrAlfsNvTClRxEhwfb7N+MtCbQbtapHIQybFdEeFoJo/zyOik29yuOugghbuNm88irHxCzDUWy
	X8RUUH09QNOJpvEUOoxqtgIXAvJ4Xw/Or5dfSTb+SlaejK7Jh1XZy7XbuUYZDWagf13iIUNuKkw
	SlKbOJraYYECmDXI6FUTP/ZBN5gDrMWYolrq1pPAxK9l0UQWayIsZz7n6u5EZzD139x1j/xHs1V
	AiqCVxhhbb/kGXQw3a+C7pc3+2Y2kTE/hc/76uHlXyniBt3gYjkYHPVFBH99BV70m04Ix52boLZ
	w3Q==
X-Received: by 2002:a05:6000:4311:b0:48e:75a1:1e38 with SMTP id ffacd0b85a97d-48e75a11e48mr19173159f8f.56.1793667601185;
        Mon, 02 Nov 2026 17:00:01 -0800 (PST)
Received: from aerith (host86-128-182-179.range86-128.btcentralplus.com. [86.128.182.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9eaeesm22351872f8f.49.2026.11.02.16.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 16:59:59 -0800 (PST)
From: Qais Yousef <qyousef@layalina.io>
To: Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Christian Loehle <christian.loehle@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Stultz <jstultz@google.com>,
	linux-kernel@vger.kernel.org,
	Qais Yousef <qyousef@layalina.io>
Subject: [PATCH v5 0/4] Fix uclamp race against non atomic static key enable
Date: Tue,  3 Nov 2026 00:59:49 +0000
Message-ID: <20261103005953.56271-1-qyousef@layalina.io>
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

The latest version contains additional fixes to another related problem
exposed by this series. Fair and RT throttling were partially dequeuing
tasks when they are throttled without updating uclamp accounting. Patch
3 is marked as RFC as it partially reverts an old patch and rework it so
that RT usage of updating rq->nr_running is more consistent with the
other classes. Patch 4 then simply ensures that uclamp accounting is
updated as we update nr_running which is the source of truth when tasks
has moved in or out of the rq.

The series as a whole is no longer suitable for LTS though and I am not
sure it is worth more cycles given the low severity of the problem.
I kept the fixes tag on patch 1, but we can drop it and defer to folks
to pick it up if they are impacted by the race condition. Or keep it,
knowing that there will be a new (fairly harmless) warning appearing due
to the throttling path dequeueing without updating uclamp accounting.

I don't have a preference, but will err on dropping Fixes tag if no
clear voting comes up.

The series was tested with the test case below and I did check RT
nr_running accounting works correctly. But didn't check group RT or fair
throttling cases yet. I'd appreciate help in testing under these
scenarios.

In patch 3 I'd appreciate more eyes on inc/dec_rt_tasks() and removal of
rt_queued and its implication on some of the helper functions.

Changes since v4:
	- Fix problems in fair/RT throttling logic that were exposed by
	  the original fix.

Changes since v3:
	- Fix Sashiko report about force_idle paths where
	  rq->nr_running is not 0 highlighted by Christian
	- Update patch 1 commit message to reflect jump_label call
	  sites on the same CPU might not be updated atomically too

Changes since v2:
	- Use uclamp_rq_is_idle() instead of scanning buckets to detect
	  imbalance
	- Do some cleanup on accessing the flag as an additional patch

Changes since v1:
	- Fix kernel test robot report due to missing static inline in dummy
	  definition of init_uclamp_rq()

Tested with the patch below to force imbalance via sched_feat. I could see the
warning appearing and frequencies spiking during imbalance. Correct behavior is
restored when sched_feat is disabled where the idle entry reset fixes things
up.

I had a mix of uclamp_max mainly used in the system via schedqosd.

	diff --git a/kernel/sched/core.c b/kernel/sched/core.c
	index a2035d66270b9..14f9f1e419e02 100644
	--- a/kernel/sched/core.c
	+++ b/kernel/sched/core.c
	@@ -1889,6 +1889,11 @@ static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, int flags
		for_each_clamp_id(clamp_id)
			uclamp_rq_inc_id(rq, p, clamp_id);

	+       if (sched_feat(UCLAMP_IMBALANCED)) {
	+               for_each_clamp_id(clamp_id)
	+                       uclamp_rq_inc_id(rq, p, clamp_id);
	+       }
	+
		/* Reset clamp idle holding when there is one RUNNABLE task */
		if (uclamp_rq_is_idle(rq))
			uclamp_rq_clear_idle(rq);
	diff --git a/kernel/sched/features.h b/kernel/sched/features.h
	index 8f0dee8fc4755..b59e532500fd9 100644
	--- a/kernel/sched/features.h
	+++ b/kernel/sched/features.h
	@@ -142,3 +142,5 @@ SCHED_FEAT(LATENCY_WARN, false)
	  */
	 SCHED_FEAT(NI_RANDOM, true)
	 SCHED_FEAT(NI_RATE, true)
	+
	+SCHED_FEAT(UCLAMP_IMBALANCED, false)
	diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
	index 84301fc49e699..dbc3f5e1a7e01 100644
	--- a/kernel/sched/idle.c
	+++ b/kernel/sched/idle.c
	@@ -519,7 +519,7 @@ static void set_next_task_idle(struct rq *rq, struct task_struct *next, enum snt
		 * are still queued.
		 */
		if (uclamp_is_used() &&
	-           !rq->nr_running && unlikely(!uclamp_rq_is_idle(rq)))
	+           !rq->nr_running && unlikely(WARN_ON(!uclamp_rq_is_idle(rq))))
			init_uclamp_rq(rq);
	 }

Qais Yousef (4):
  sched/uclamp: Fix race condition leading to imbalanced uclamp_rq
  sched/uclamp: Use wrappers instead of open coding UCLAMP_FLAG_IDLE
  Revert "sched/rt: Substract number of tasks of throttled queues from
    rq->nr_running"
  sched/uclamp: Move uclamp_rq_{inc, dec}() from core.c

 kernel/sched/core.c    | 49 +++++++++---------------
 kernel/sched/ext/ext.c |  6 +--
 kernel/sched/fair.c    |  6 +--
 kernel/sched/idle.c    | 19 ++++++++++
 kernel/sched/rt.c      | 86 +++++++++---------------------------------
 kernel/sched/sched.h   | 27 +++++++++----
 6 files changed, 76 insertions(+), 117 deletions(-)

-- 
2.53.0

