Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93E14570FA
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004178; cv=none; b=MAS73yUh9bebSpZe1q1FARrQuZzEzrnbMmNV/pkLYRwZB+dRwhQ3PTRAekfn4NTyohj4OTjuwlMf9Oiq+MxBNoNv1NcyMTAXPj6qXxBJmUIg+5g1Ehe2QHCN3qCrNRWF36t2N641U4o5Qj4/lmFZMQzqRXWYSKMJEBpXnXD5yQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004178; c=relaxed/simple;
	bh=/y1cxhTfCkNKLF5SlxaguLdy4vHWteMhMy0X//GfzgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TXUFDaj7qGZG/auQo3dTrF7ty1qwcAgw1Nix3ce9mP/epIIlOPHEooNvaj7iZOnZ8iJZMyDu/TQnOWuXnsFK1JDAoMhYoowCSRFNx/ioZS3kDy+aWxGQ1YuixGQQ68x/ODOp1YYwnVIDLZ5dIxWAI5Fq23n7+bXq/ZVUkiRAyZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PTLKxRQf; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PTLKxRQf"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d097b4939so16279775e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790004175; x=1790608975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GkwZJrXCTkJBGFdmK6ATkqCroiAul7HPoyKB4YWO+sY=;
        b=PTLKxRQfzkifKn2vXavywsLkaAiJN+tzi0ay/bwZGG4J46WIVyuLGBRmRZ4JM7CsUm
         jDpfhl6ovvD75zuPP/C9KjuVpSEX5oh62EHVJRCA63erp1l8x7EGiO3GBq3ZWblI7or2
         vF5FnqOuDACAIeOLfQ52YLC9tnzb9qtYIDAz90PS8zsEa8BrTAny0wLUAzCEP1PYTw+u
         dT9wGhWAKdjsv2xIrhAqfpRqI3M9YVmXAm18U7P0Mz9UdgTzPsaRjRQEeXyvHcnpA0D8
         7B3B6QiMe2qY2YTMCVsmJs4ZqtaMw6bfvX/mQBB5kIM4yZN6ZP7c6s27Etm8zlNtIqzV
         HQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004175; x=1790608975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GkwZJrXCTkJBGFdmK6ATkqCroiAul7HPoyKB4YWO+sY=;
        b=zJ02aHUoo7oxhq0OLInU6Vbxj5P/SsYsSFlpphKenu1mEv1i8ATmWMKtnEi9j8X98b
         ubYO06f1KBHwdT891Oyh32t9NCByokNV+Mp7y3WXy12TJznyXK4lboL3sTJOSqpF3Gx6
         RNrp3O5bi8Xtj1vXY2z8SvT35R44q+UnzdMLcPx6VUJ7xDf3JqwXK3sd6BhMqm2/gXkA
         8J4p5Szj06eFg1wCA7f4enxEHr71P9wmsfOWLebQZmeWnxcb0AjRtQwlIh6MHTFF10A/
         5F59D/DXesGrTitKDCvOuwEd255GNfNgAi2WZLLyygePUj/DBtN+vDCrpA7edXnKJ511
         fWLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKtMPALvwKtDuCu3aCCPIkQXQpZCajT0WMW13Ygv9eeE3Heehbj31xWHfUjEK7hhpfbDwaz7hL4/o035A=@vger.kernel.org
X-Gm-Message-State: AFuF++kGBK9jE63ePg3IqX7AAfK0xHgsbFerZOomFZuCkLbLn8v2Dvut
	JFb+6eQp0l50xUbcSJpa+VWkUYt2HYNNCivyXYqr7hPzjEECuztfk0zp/rFAvurHNDA=
X-Gm-Gg: AYBFou0CO1oleU/W4qxaYa7u14U+IlZSZlvjPJFPIx0TsUH6IG5DpIq3gISwCV9DHfh
	NPFOb6SnVaegQajD0SoIk9KPrNN7hKMb0xp3lGJVw9LZiLxf6vkD9wKUSxgJdHq5DplKkiZ8aD7
	88F6GSVyAqNksdFAQjvRh3v3/WWarBneNRHUoIH2j1MRBGWeh+EdSgvg81mGQsYoYwBaaOSwLbS
	Xkl1eMsuRRcTT62wHMEyxGQzrEaquyCF5qNr1BH6ZpO6vz/X9904h0tzsPyvyZcA1zsEnmAFzNj
	+hbJoYKkJFjxBOdRwwuj4oRvwsDODBU4xIgJtL+OtlEv/V8Jb4X0dVx1U0mOGnlSTKgUB1ZbVnB
	VyR9P80BgSt/rr9xqR8y/avXw2gMHfMhJcgakuNcKagR/ROl6ikirFXjLO8UFGfWzLpLp2ip4Aa
	+xoGAcXi/5N7ErsvuUDQsVpvim5pUtyplm0xWmmZLTKBmu3565iXLMg/ODVzQfMDi2bvtBPfVct
	it13V6Zd4O7D9U=
X-Received: by 2002:a05:600c:a14:b0:49d:7f5:4cdd with SMTP id 5b1f17b1804b1-49fc574be1dmr152970115e9.27.1790004175075;
        Mon, 21 Sep 2026 08:22:55 -0700 (PDT)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:df5:e9a4:98b5:65d1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd8bf159sm223745675e9.10.2026.09.21.08.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:22:53 -0700 (PDT)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org
Cc: qyousef@layalina.io,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH 5/8] sched/eevdf: Reset lag when waking up on idle cpu
Date: Mon, 21 Sep 2026 17:22:35 +0200
Message-ID: <20260921152238.3804392-6-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921152238.3804392-1-vincent.guittot@linaro.org>
References: <20260921152238.3804392-1-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When several tasks wake up simultaneously on an idle CPU, their final vlag
will depend of the ordering as the first one will lose its lag but not
the next ones.
Reset the lag when the enqueue happens while no fair task has already been
picked et set as the running task.

As a typical example:
CPU0 is idle
TA with vlag 0ms and TB with vlag 5ms wake up on CPU0 simultaneously.
Depending which grab the lock 1st the behavior will be different:
If TA is enqueued 1st, TB will be enqueued with a positive lag and will
be picked 1st.
But if TB is enqueued 1st, it will loose its positive vlag and both TA and
TB will have 0 vlag when fair will pick a task.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/fair.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 4230954d10d0..739a3af60520 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -900,7 +900,7 @@ static __always_inline
 void decay_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
 {
 	s64 vlag = se->vlag;
-	s64 delta_exec;
+	struct rq *rq;
 
 	WARN_ON_ONCE(se->on_rq);
 
@@ -908,18 +908,25 @@ void decay_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
 	if (vlag <= 0)
 		return;
 
-	if (flags & ENQUEUE_MIGRATED)
-		return;
+	rq = rq_of(cfs_rq);
 
-	/* Compute the sleep time */
-	delta_exec = rq_clock_task(rq_of(cfs_rq)) - se->exec_start;
-	if (unlikely(delta_exec <= 0))
-		return;
+	if (rq->curr == rq->idle) {
+		/* You can't claim any lag when waking on idle CPU */
+		vlag = 0;
+	} else if (!(flags & ENQUEUE_MIGRATED)) {
+		u64 now = rq_clock_task(rq);
+		s64 delta_exec;
 
-	vlag -= calc_delta_fair(delta_exec, se);
+		/* Compute the sleep time */
+		delta_exec = now - se->exec_start;
+		if (unlikely(delta_exec <= 0))
+			return;
 
-	/* vlag can't become negative while sleeping */
-	se->vlag = max(0, vlag);
+		vlag -= calc_delta_fair(delta_exec, se);
+
+		/* vlag can't become neg while sleeping */
+		se->vlag = max(0, vlag);
+	}
 }
 
 /*
-- 
2.53.0

