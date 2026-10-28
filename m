Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793153125;
	b=T3OnVrPo1vlRbSq9Bitg3RjPc5p6+Ea3ydnXtJgH0hsFEBJSebw4PpdPDQ7QbEinoeg8
	 fmHj2yHc39gAIEgs0meoUxFEBkfSsvjv7Tb384GJZWyydeQrTvXu0ZWVFeC8R5Gz3vWzy
	 Nix6bFHgXLptVM24GGOJ06rx63K6Cq9sxJ+iTMa1HMer5qoXnKf9jxxWhqzOJfYJ7Gvj/
	 eo7n2xj1e1HqTDbJL3DOmjTwKR2aep3nKZjT9YEop1Z/QXZFU18cgUamQPkWyEW6hwL8H
	 53q7HPH99vTkAfKhMa8VIgFRNR1KghoKnZR8t9q5wRLnr5B/iAsujj1uVVN+1OWQr2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793153125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v0ZejxDlEv3QVlq6pfef28jG+0w+X8uWfGMFvWJum3o=;
	b=vBPigcmbOSTVIjYwjVIqp8NTfs6DKJyPdDrnMIOK4MbgbT1eoRMfYJf/Naxa1VTFAVXg
	 u3Hv5ye46sLYNhHQq241VGkuUzspiLlTpcIUvEKgEF/wS+NgfHM3RJ15oNp9zIOYSKZ4F
	 hB2hGhkZi6twMO+z8XzsHTglI4q61xbG2zr4YKs69/8UAlGu6LnQAtpQ3V1dN3msMypuL
	 PZJMcWoZKF4uSuTBvC7zXbE3VsQWM6rWODXBh20bppIxo9V7vchiKmVGxI77wtZOhO3EN
	 iznwObg2aifYRrou9aIT+vwhHA8MlzJfDBlA4Hy3PlUmQuup0tfSCCUvKfaEirRZn+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XNoQGiSe;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622C4606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:05:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 622C4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XNoQGiSe
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so3388065e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1793153123; x=1793757923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v0ZejxDlEv3QVlq6pfef28jG+0w+X8uWfGMFvWJum3o=;
        b=XNoQGiSeN4Kekj/X2ahpOmaO5uEXCrSaenzYxO5TWNPVQeko2cU7L8aS6jDDw6G2dP
         EEcqbENmePxAVisooWdHhnQ2dl+cd3FCEoYRQ/tjZPia1wm6jDVAmPPcBUS2xcOE1PaM
         Bilkmh3SZ0r4mtP5waGv8EBRtcFz3mYN+dvC93PemUP0HOTaTCWhjvXICksB7Gu+K5vp
         9P/SHOa7LN72QWG2rquA+/7IN2sRTRnrfRzmSXP0g/Yf1dGaqKmn/w46AocWDV04bjGv
         pNgf4kCIsUBoocAmbtK4QdO/kqCB+diQqrIcYjWtcRVtfyr19uNmwjPxU4LHINMUn4fN
         dkWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793153123; x=1793757923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v0ZejxDlEv3QVlq6pfef28jG+0w+X8uWfGMFvWJum3o=;
        b=P41ddsu0Wt9uZA6QHn6eqarvK/8csSdfR/X9IatTlkm/Rt0u1g1+qd3Kd2tRs0Hqp4
         9YaQJSKXaD4GurncXLMg0YPcMkTBFu73dx3xQp+ysnPg9MkXHFBFFqp2rHJ5oBp5KVH1
         SFOJPqN87vu4ePv3gW3uD8J8v0tDLdZ3mN6UyhZ8TulMLUDKRmTV8z8b/zjXXm1PbYuW
         2Mb+Sjkh+eKkEFE5pm4n9dqmCkpQe2QLldDutKDi5bl70YbZBcJk3FQlrP4JYnhYiD3Y
         3duFRjTUtdZR19ESDcZDIcWGDGgHeR+bpv4HsAj6RRAKrAFyc6xacPjRDnkuNkBfyn/Z
         mz0Q==
X-Forwarded-Encrypted: i=1; AKwUvBztwOBKrJHgw68YTsgH9lSFZWC4rNm6PonVeKM7bG+Adi9P/NhIqAV2zKr3PV12XpYbHpREP8dF8RJyQxU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvAkLyZp272E2SKNf53CBCZm6OTIjb2nOhwOtAiYzrNc7ePEBs
	5bbWKarVVu+DFP082VjH+Tck5+rjEWWytjYdVWD4LkU1BXE9oBRJ3tQn2S1TtfDG4NE=
X-Gm-Gg: AYBFou2v5NPOmZ0wwGOJdBmVTyBn4SB/CRQK3uv+MW+rYUKJjGRNpb2TDAlMoNf98FI
	ljFFMdmWvR3Z3pOCMC0udUmwiLt5TKIaA9vfDsEpErot1msJAp1iPZtIMiIIN9OFyIgiyZ4oCSX
	7SiDFPUI7hy4KfJXsfiF9/ceS9hcQR7aNU6toE/5zLTJedkRcO8p2vbCpNa7BT6pIpGIWJMKMC7
	ywSQ2OgfECvwQSklRBTOC71qtNafBp1dPbxuMAOZFuHDFYadRKwO/IBtRBIy6t6aYFlm3h2t2Ii
	8TIwwtl62gkHeOtqO5YSXEY719ioQ5aV68o7eVl9aWVR4ZxU0WmTytJ2WN8YSz1X14cT35uUxLa
	0C6rVXBkfzvnRchgsp65dR14sK5vjgcjRV+cBzVMKoBH7UfSeR/PPkvS7s2UvQyhNYk4+WDh+mO
	L13U+92oTewZCfYA0AgbLgaPUHgTzXtQqaP6VQnvxDsr10A58Fxhz1uPePwz/s/S9Gv27YUcQKs
	nPC7wSFVf81ZovgUWKiaHG1hg5qvAAL9Cl7bs/HU12JCFAPm63oHhHe0czk/sI3TIEWWHZQnD5/
	p73kKXJNWt7ELKAVBnF206U0cENOMRE5QcnPTAsrwrZghaxkxdto+NSpOVxAfq3EzhvJXMrDIuZ
	rvw==
X-Received: by 2002:a05:600c:3c98:b0:4a1:f9e6:f418 with SMTP id 5b1f17b1804b1-4a967ba6b5amr13337155e9.34.1793153122451;
        Tue, 27 Oct 2026 19:05:22 -0700 (PDT)
Received: from aerith (host86-128-182-179.range86-128.btcentralplus.com. [86.128.182.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97cebf858sm10101395e9.12.2026.10.27.19.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:05:21 -0700 (PDT)
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
Subject: [PATCH v3 0/2] Fix uclamp race against non atomic static key enable
Date: Wed, 28 Oct 2026 02:05:10 +0000
Message-ID: <20261028020512.10245-1-qyousef@layalina.io>
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
	index c6780358a7975..d3e73ba88f22b 100644
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
		if (rq->uclamp_flags & UCLAMP_FLAG_IDLE)
			rq->uclamp_flags &= ~UCLAMP_FLAG_IDLE;
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
	index 950e2885bba63..cb31b3c9df23c 100644
	--- a/kernel/sched/idle.c
	+++ b/kernel/sched/idle.c
	@@ -516,7 +516,7 @@ static void set_next_task_idle(struct rq *rq, struct task_struct *next, enum snt
		 * everything should work as expected.
		*/
		if (uclamp_is_used()) {
	-               if (unlikely(uclamp_is_imbalanced(rq)))
	+               if (unlikely(WARN_ON(uclamp_is_imbalanced(rq))))
				init_uclamp_rq(rq);
		}
	 }

Qais Yousef (2):
  sched/uclamp: Fix race condition leading to imbalanced uclamp_rq
  sched/uclamp: Use wrappers instead of open coding UCLAMP_FLAG_IDLE

 kernel/sched/core.c  | 16 ++++++++--------
 kernel/sched/idle.c  | 17 +++++++++++++++++
 kernel/sched/sched.h | 13 +++++++++++++
 3 files changed, 38 insertions(+), 8 deletions(-)

-- 
2.53.0

