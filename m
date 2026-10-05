Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765C14DC551
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 18:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791226709; cv=none; b=hbjGcOoAsGfUnFdvk3eLYQqr3mG0AkfonN1dScCr3b1dBp8wNREZ97E9Ur3YxG6K9k6TXc6fkRZJRbqVmHd3Twh3RTmZ+hf7Q0vO7J9/eHnBKbtfNTGqxUzMBWsoW4mcaaE7MyhmXJUxFCQx1ApvvHw5P+gsJM13mSygmjPTArI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791226709; c=relaxed/simple;
	bh=8NNhfSpyh9bt6fe86wAxMYT1d0iT3OI6uJeMeqYayIc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ozgfu2zrlqrqGrCHZH5UzD9xXndDqhUZZ3fiRkBJ//WXErXVsdlCyx/IFbKtxhvF6sVTScArydSR7fmzpHOnFB2AVFHNlNsDhDrlCTvro5Yt3SDKoLOjTmPZOAuChoIqclFZoJ6s7ORTJJ3npMpni/354vu7mSDv75xgQob5lZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oZvaxPHh; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oZvaxPHh"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-488811c9ebaso1119011f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 11:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791226707; x=1791831507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GDVSYEG78WTqmDojHAIEfHw4bT2e8W9+9URBp7SfrwA=;
        b=oZvaxPHhH8jy0sGBFxXYw/xBSdBgCDlrfKw3SPOHZqb/3TL7O+etZzL3Ffa/QXgbIc
         gwYaNCEksI44z/awq9YTUiy1zo5pW4NcMSUdVX10BT9TnPQnBFHfCgOnNP15eUcI+TvV
         geB9ZDFirTySE1FT3mHvJbrHksJ4uh2Mc5BUsoacYLTe7vdIyERpOE1NQ9N6H8o7SANp
         0LrdU3TBnueYfvRl1ih3WHVXBd8Zw8wSM2IYPdzjQZn3QGHl5F0bZ/SUZ2ZJ5NsII+u0
         uyyRVsZioczdEHKxABeMHZe/Jn0BrjzQaxcDQllmgT/IN7TqwHZq4vCdyFBjCFUW3J/x
         mZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791226707; x=1791831507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GDVSYEG78WTqmDojHAIEfHw4bT2e8W9+9URBp7SfrwA=;
        b=LrTCgWZnuRdDZhpKbo5jtarlqojniIimLoNUzxp4uEGk2GhqsZGXDFeqPXV2LM9E+A
         zr8qdJw65ZBoTxOk80Rdca4L2K9yCufsSr7l8dJOt0rjOBmRv3vVbY9y/TZWQzp9B5nY
         +2FaEcItNe0zPA7r53dCETUb0UKa5Q1NunHtccg3nhF4xF8vEZpebboU6p0B/aLMiQW8
         yMQyd5AY/YHg+cO+6QSdgX2dchOFM2MMnHt20CpwJ9NXpXsWe/OgVgBoMjbz3TZKm5oR
         ye99Ts055/zYT3hlpK+9f/vV5qvvjDhYrULR/etrqA88xrII4Fgvq6yhdO2IgsOetKQx
         anrg==
X-Forwarded-Encrypted: i=1; AKwUvBx8VLaGngzTpMhaKvSIDq5g9wp8cQniU8cbluNfBXRXUoXOTJq4KhfWcLfvVVhSvnKFVCvEQDNvYhNQp+4=@vger.kernel.org
X-Gm-Message-State: AFuF++mqbeHC281jVQdtEODQsEtqrZPXsUeJsM0fXACS6pR0Pn4eiaJN
	xL/Y85b7oyu4tKDVJ2Z0LybqLbpeyg+qwGJzoMVfu7GkO3/EkJ4bdliG
X-Gm-Gg: AYBFou2MM3XcXW7T5jQ5PalNe10PtmnYYKfDnK33it5RPJT2ORij7VZp0JiNLUkQC6I
	HrIhGIuN58h1TVuJl0PBymcTav1xakKDg4j3i50ygHLOjI59ECq7IHaNmNhwdsQoxaw3GqqyGjj
	5LMuF+L/vc6/PaOuPnsSLePHd8s6kJi5N+oYnyWkYjbsjg/8u700unkXjFaKwohmp0sDSZ1PxnA
	qmTeFya4hCK/Oaskn+st2s9TmTHd3pxYzCUZpB6N3Ikw8fzQu9GipNd6pAjtsQcx+EbiuWpVDYh
	8revLQUextOr/TmrrPVoV7NXtCi1DvDJbpVVTHq/qqPcU8vMeEOsxfGwDbsw0GoPJQ0j3etlUC6
	ORIzzpSwfF6yFggabXe5l4RUXamIadX41YZVsdmE6/bsdzoaOS21dch5djThRQGnmBS4FxC+nBB
	1vJ1gkQ6X2mOYRqTK49cl7DKcurXFBISIHnZFeigfabUDfH0pUtujthd1QrZ2HQYnq4xqKFw6EW
	RDhEzaxqxumx912LFB4yTSt//FtiPF7jpEVcUWI32vvek18oLPxdMNCf+oHsqBm58QCHNVY27d0
	7I4m3LvMf/KlhULcyT2PRL99Gcuho/LgFEqAhlrSEDSXiRQc7h+YcsOL8Sy/WGz0KLnpzOHw2dH
	ygA==
X-Received: by 2002:a05:600c:4e55:b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-4a02756f062mr197219325e9.14.1791226706201;
        Mon, 05 Oct 2026 11:58:26 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b305-2001-39fa-3d24-821a-4eae.310.pool.telefonica.de. [2a02:3100:b305:2001:39fa:3d24:821a:4eae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394e6c5asm281196795e9.2.2026.10.05.11.58.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 05 Oct 2026 11:58:25 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Marco Elver <elver@google.com>,
	Bradley Morgan <brads@mainlining.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	linux-rt-devel@lists.linux.dev,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/6] sched/core: Pause KCOV in __schedule()
Date: Mon,  5 Oct 2026 20:58:01 +0200
Message-Id: <20261005185803.39170-5-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261005185803.39170-1-kmehltretter@gmail.com>
References: <20261005185803.39170-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kernel/sched/ is built without KCOV instrumentation, but it calls code
that is instrumented with KCOV, such as sched_clock(), architecture
CPU-capacity helpers and profile_hits().

During preemption and schedule() calls, these callees can add
nondeterministic scheduler coverage to current.

With CONFIG_KCOV_SELFTEST added to x86_64 defconfig, the interrupt
selftest fails under QEMU, detecting spurious coverage in
arch_scale_cpu_capacity().

Annotating each callee would spread exclusions across architectures.
Pause across __schedule() instead, extending the scheduler exclusion to
its callees.

KCOV_PAUSED remains set while a task is switched out. The guard in its
resumed __schedule() frame restores the prior state.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 kernel/sched/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 87cff2884980..419dd98645bd 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7123,6 +7123,9 @@ static void __sched notrace __schedule(int sched_mode)
 	struct rq *rq;
 	int cpu;
 
+	/* Callees instrumented with KCOV would leak coverage into current. */
+	guard(kcov_pause)();
+
 	/* Trace preemptions consistently with task switches */
 	trace_sched_entry_tp(sched_mode == SM_PREEMPT);
 
-- 
2.53.0

