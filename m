Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793279644;
	b=yARmsYbIwtqura+8bBh/6VLaY4sjQEUlX+uWZdZvdKYGmthzHVaYC5TuC8TjLr4/li5t
	 xPLzJm8o435c/xFNyJOPBD+7LyKghszKXb/5dPoCA7LZ/c32Op6h81eEXj0qqSj/v49Md
	 Uu56X7JFe39MHW+HVMKVAxcU+OubyLQIPHb7R8eIPFMUAYfWdgXwiKdczHgRvSpimTLkX
	 N0wHDVd5f7lepsrPkQQ7Iq2K0k72oUlPzCZZ/fRc54zaERLL0Ph3UKhXLn6C1Vpddbove
	 ciuFR6ud04W0Ip07o+PuvO9gXSJf894OhnYy5zhyKGl4wvgAyKMHnakXB1O910CXcOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793279644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ckvuzdfjXHf10D8YI4apO4+DtjGRRHZeYojqaLKwY3o=;
	b=aumjuaUeM+cxsLVrUxcdEsKqTBuouYE/J1ZGtYb7UwsQKb0DOWpWBG5ald3lSIET2Wnb
	 JsLUMcu8c5wgjUXXtGHa9g01dsBWiwHg6xu7dYx7u2KhvoY7CWeTft76AL7WFWZLidDCB
	 oXoTMS7r3A5cuiQvfsdj9e2gEYGQMloaVxKUCaVBlx3V8VNj+d1eAGeJeusqFVL+y+In7
	 h6oE1ivcsF6XPn4atE8kYXQFHag1noBohBPDKUXdWYD156aaErW1EUQuarLQ6ihJ+h0W3
	 oa7hHDOQLRgS8Ktp/LiJMKxJd8UQ+HbZQTWGKBziwtFbUVPyWuoM0Mj3FMjYxD92aVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YTjcJxeh;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F02606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:14:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59F02606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YTjcJxeh
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so20011515e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1793279643; x=1793884443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ckvuzdfjXHf10D8YI4apO4+DtjGRRHZeYojqaLKwY3o=;
        b=YTjcJxeha9nKIeCMEFP9ZFJQV9jcumjKOb1TTjvf32EA9VlV/3AzJOyVKLrCo6/IPH
         6/4HFjtyJMD0SRi+QyV7RPPlpYxligMg7lA/hufZLW9Ntmh5sTNkuvC78chODdPcq5vV
         CMPPlfwBkld2NUJeS2VV1cs59oqzdRHZvoqUnV8T5XEsh3m1Q+jZjwqy3MpVn1gJFO6h
         L/sHlxX3oQDzUONzqDRpQeWcKUrCMZAditSI2VedOkXDhjoj2eU+cxMvj8A9p0zxdAne
         qpjLNvBW023Yp+lkMuNDFhBs5KxGdZVGLR/6xK0R8mbhhYBGDixu3RteCSnXXhY3qKho
         xRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793279643; x=1793884443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ckvuzdfjXHf10D8YI4apO4+DtjGRRHZeYojqaLKwY3o=;
        b=PGL/FmIN6kpWDkeQWvqx1OS/yat3PsWeWLWZarxsSGmTX4F6axTxfcYo1TzN6AkzqP
         yuE4xcrdCPgj2dDt+Yiu82o/yWEh8KvS/9nviVrMWK8yIdD3gs6luZYe81LAceo1yDEu
         9NynnAW5zJ75wHv9O0U/x0AKQJrSbWRlErfNXA4bm5iroRBHHYBrIkyq4Jx64npl72Dk
         FXGpqAlImcyq9HO12M0qTZMDHqN64i2Q+qoUQ0RGgV7H0ce/vg+tPKYXRCy+Q8XNYbGQ
         Jzr0CAaE52zgAcgwij3N+h1cc7u0/Wr4+4GllPFDkNuBPrNMFYUOqzXSF6/71ekEdNQH
         hgHw==
X-Forwarded-Encrypted: i=1; AKwUvBwTzyrrtn+M/i9clP2YvOxmS0FhMMkSAT0beDuZ+h3KZ0E29vzNfnp8wMcHRKWRMbtprCnnCMoQvbH4TEQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCV5f45eAvkfFucegS5y6ervu+cUdE4vV3bYEFMafdsgTjbfrC
	MwG7dHcRqaxUbX5aiD5z/zB1y9QqGGBiQfYq2c4TqIb3jPEJVwsxUxRS1Q9BYw/i86Q9Voj1OTm
	G1nv95PE=
X-Gm-Gg: AYBFou1BCPIMwYMv87JQ9An6eiawSivMXbbGTGKoq6VDqEBOgq/VcLGH8rgeKi2vb5j
	X0b4lsodiLdDpoWAViPEHwM8a+RkVM/641jqoNiJ/IHFv+1LDJpfDJNI15iRZleqB2RabfCPMe0
	6Qx9d4AURjLJa8Jjx0wybZBoES7vBSmMGa0l21H2GO/O36zCVLM34mMAMXfAKZzfs2j1aA4fnN8
	7Q2eZNN+ER8qpcx85tnZOW+ltLnVJ6rky91CefnTsPbBoNtEvwmR1yXUBfH/up09UX6TsnpcZs3
	hzmMyIzTgmqLz3gTDukjxgxmRuAdLAe6tELNNN+Ohlr09pvTT97iDmgp/2hTsd73IzvHuuVELWJ
	3Sl1wBbAyuqSjkku1/ivHBfg3sehYw2QpNN8UfxmEzKucmUCRP2i1aw6Mvri2vbZMuyKI9fqrTB
	EtzCU6cuUdX2ClcKpZgsAfk457PXEiwpWy3HSKr5kQn21+o3MZphoOe8QptsF8p5193irTeJoxE
	jm5AShaifszNEcdLZiInSoOq2x1wB7CrUlpj52/EHZn3OvYxbK5sa2Rkd+V6d97+tzTln1iapRY
	o7re46M9J26wEwZAuz7JcPgtq8i9oMxdSHtIIxViM5LtkrxOQhM1OjKPmAnMzDtbZnSecJL53ub
	Of7cg2ooBrfVPU/b9q77in4M=
X-Received: by 2002:a05:600c:154a:b0:4a7:6bc7:f778 with SMTP id 5b1f17b1804b1-4a9679bbac5mr126732275e9.30.1793279642727;
        Thu, 29 Oct 2026 06:14:02 -0700 (PDT)
Received: from aerith (host86-128-182-179.range86-128.btcentralplus.com. [86.128.182.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f7f52e2sm76637805e9.9.2026.10.29.06.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:14:02 -0700 (PDT)
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
Subject: [PATCH v4 0/2] Fix uclamp race against non atomic static key enable
Date: Thu, 29 Oct 2026 13:13:52 +0000
Message-ID: <20261029131354.11030-1-qyousef@layalina.io>
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

Qais Yousef (2):
  sched/uclamp: Fix race condition leading to imbalanced uclamp_rq
  sched/uclamp: Use wrappers instead of open coding UCLAMP_FLAG_IDLE

 kernel/sched/core.c  | 16 ++++++++--------
 kernel/sched/idle.c  | 19 +++++++++++++++++++
 kernel/sched/sched.h | 13 +++++++++++++
 3 files changed, 40 insertions(+), 8 deletions(-)

-- 
2.53.0

