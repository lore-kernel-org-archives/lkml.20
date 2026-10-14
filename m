Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8537C4EFFD3
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791990187; cv=none; b=lCbht69ZnHHepKgxld0jM4jwKPmpRAdYBLpbclSt2FXfgfoCD0sO9+J9uoBxmdqTTFUFCZXBt2AxmZNKJouSiaFctwex2H6d9PjKljSAdRtMFUV+6+OFSVW2ZkVGFTzb/Trd+W1zPBwdePrOHiKqOAmpYg7caWuIMzM/gyJeZEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791990187; c=relaxed/simple;
	bh=kzyLY7XqpyBj84+ZXwA0iQ5Bjq4IsFL9TLQi2bAdqEI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kHxNGquSCR4XxZT6ry415r3jT6liXNOYesqWtIguUwK4WoEo1B4gCV8eyqgRw9HmGV0ZzU48re26AAnRi6GkD242fbj0QQ2kq1KgP7Tuyv8D7oqu3A2Aaaqb+S4rnNYBm9UlLbLi0R/eD+UlUtQPQfy1DWIlOfFiXVA6X4cR3OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jl+7y5vL; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jl+7y5vL"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48df160bb9cso22942f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791990184; x=1792594984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/ahbcJ7oPWRpovHlA8nmfEou/06RdkuYPRYlN041MHw=;
        b=jl+7y5vLHqurmyHsGTy0vIvA8opvuz3d2bfqczYSpfKTMvQyQuvSzmDL8to8A6fy04
         odxvze3H1diEdc4fvad0c0iKziVemVYuMfxLv1pXVnALBfWUOI4ZouFv0R6/tnHHwPq3
         /938/YtvAx6BDcImlNTx/nwSfpyWX4XCqQwOdmTHNVXgVWBbqk9WF7RqbQxpbpPiIimV
         xmkAyPhER3EOA6Un5HIaEuq6kDWXzmZxNm2FxkRsR1hrfz5ZfZrMKJDvw1hxwHPqnWye
         ln27Bz9uOFnhs6EqTtJTQ/bWzziTnykmimIYQBE2dideOSnOLvzjjlkWvFkCegyKxYv0
         ujIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791990184; x=1792594984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ahbcJ7oPWRpovHlA8nmfEou/06RdkuYPRYlN041MHw=;
        b=O0tzUm0oJ4JldoHa3oX0fi9lreKiJxxNVdQX6NML9EqR70g6TdIR72BGsExErNPHvO
         OgCvYpNM6RP/PgzQ0vytEzcacfyaZv1NNHLYVR1mdx9XOfF5P06EbUQib1tchRaq/7RY
         hDtwjrFC79BVVUDCcDzjHn6yjkO51xHGBT9vut5sqrabMbIRGQQLvWl6D2QKtW3bPs62
         biASyYHEwhrUuqX5hRwagAeEembHzZjbSOSYde8Cty7NvpknAVkyDsOpPeBTdK9KR1ue
         gM7xPklOYq2VQ/8wSHqnAoP5AK03ewRE5fP7W2m7rgkGLKZwv299jB4VFzvLJQoW3mNv
         DvAA==
X-Forwarded-Encrypted: i=1; AKwUvBxIINkPpQwmV7v1YSW8J9VjNeS0FmjS1G9oyfsVGtC/dLd6GUUplRNwu6EOw9zuHCz0UKrCKKjj1z7j2i8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHbwxred17xYgKGTsFKPWe9uC0yeeN+wA2M1qtJJxGaA3M+FiP
	dA9Y4dkTDix6n3KyWos1CTqTa7JeiI6fi6oKA7bFil8aiI+dCmuiWOmV
X-Gm-Gg: AYBFou3e4OulH9ciNoKSUcXm3/tIxxno2oQ2PjHcvUktpwOOJnTfjkmk6KJSzOk2+1w
	dUeoBBHlCMEMMyWtbAViEI4xcreRL5/MSYMbX8pYaRE9gjnT+SqTwDFww++OdMqWQDiw0MGFv3G
	c6MWxM6DuBdFsON1N5prVE+vREZPWXGLxS6jWlCQ/prgTZwy9QX+WOwJv96aDmzQ04qEu0EurpK
	OdjvX0Rs+QePJS2i+fr1LcmDk5c36GCw7EPan9jdChUxTQFJ6dBcwOovi/a6Dvx1FRXIjVnS9/+
	LnXGmWbJuWsAidmAQSUJ2GM00p6vSarqtAF7GzAfh82/QVH+RlYaDtnCg6L5dC1mZP6/9jbldvn
	oRti+0LFA/NOdmtTyFRDz9b4S82sfzD5Je0GhF2nc8OFipanJBhriX2qEvWr6HK5fbiFc0+I+NP
	DAyR7st1ZMff42ci+4B+K8d3xSs1AeFjc8giBIHInD82ToIdwKd7VGvVDhc9bIgnRl5+AIoIuK9
	ZrUr3upI150LrdgLpT1
X-Received: by 2002:a05:6000:178b:b0:48a:f41d:83c with SMTP id ffacd0b85a97d-48dba70364cmr30877141f8f.0.1791990183334;
        Wed, 14 Oct 2026 08:03:03 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de77606fbsm5924614f8f.53.2026.10.14.08.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:03:02 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: peterz@infradead.org,
	vincent.guittot@linaro.org,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Cc: mingo@kernel.org,
	christian.loehle@arm.com,
	elif.topuz@arm.com,
	sh@gentwo.org,
	linux-kernel@vger.kernel.org,
	Kayra Cizmeci <kayracizmeci@gmail.com>
Subject: [PATCH v2] sched/eevdf: Fix vprot across reweighting
Date: Wed, 14 Oct 2026 18:02:50 +0300
Message-ID: <20261014150251.30099-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently in reweighting, while a tasks vruntime changes dead protection
could go alive, or alive protection could decrease, increase and go dead.
Fix it.

Fixes: 80390ead2080 ("sched/fair: Separate se->vlag from se->vprot")
Fixes: bcd74b2ffdd0 ("sched/fair: Only set slice protection at pick time")
Suggested-by: Vincent Guittot <vincent.guittot@linaro.org>
Signed-off-by: Kayra Cizmeci <kayracizmeci@gmail.com>
---
v1: https://lore.kernel.org/lkml/20261003114656.105721-1-kayracizmeci@gmail.com/

Changes v1->v2:
* Throw away the idea of rel_vprot (K Prateek Nayak & Vincent)
* Simplify on_rq path in reweight_eevdf(), as Vincent suggested.
* Reweight the entity locally in enqueue_task_fair()

In my tests (not the same test as the v1 tho)
all of the issues in the base were not present in
the patched version. There were 1 issue or not a issue tho.
In both the base, and the patched version 3 (2 patched) out of 1500
tasks vprot slips more than 5 percent. I tried to reproduce it
but it got back to 0 as I tried. I don't know the cause tho.
And other things aside this was fine. My v1 test wasn't looking
to the on_rq path, so I think that's why I didn't discovered
this in the other tests.

I wanna speak more but, this is getting too bulky.
So so so so... I need to make 1 joke. The joke
is that there is no joke.

kernel/sched/fair.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index b42a0ca2a69e..31e226e8f52c 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4746,12 +4746,15 @@ static void reweight_eevdf(struct cfs_rq *cfs_rq, struct sched_entity *se,
 	update_load_set(&se->h_load, weight);
 
 	if (on_rq) {
-		if (rel_vprot)
-			se->vprot += avruntime;
 		se->deadline += avruntime;
 		se->rel_deadline = 0;
 		se->vruntime = avruntime - se->vlag;
 
+		if (rel_vprot)
+			se->vprot += avruntime;
+		else if (curr)
+			se->vprot = se->vruntime;
+
 		if (!curr)
 			__enqueue_entity(cfs_rq, se);
 		cfs_rq->h_nr_queued++;
@@ -7990,7 +7993,9 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 	int task_new = !(flags & ENQUEUE_WAKEUP);
 	struct sched_entity *se = &p->se;
 	struct cfs_rq *cfs_rq = &rq->cfs;
-	unsigned long weight;
+	unsigned long weight, old_weight;
+	bool live, running;
+	s64 dist;
 
 	if (task_is_throttled(p) && enqueue_throttled_task(p))
 		return;
@@ -8024,8 +8029,24 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 		requeue_delayed_entity(cfs_rq, se);
 
 	weight = enqueue_hierarchy(p, flags);
+	running = task_current_donor(rq, p);
+	live = protect_slice(se) && running;
+
+	if (live) {
+		old_weight = se->h_load.weight;
+		dist = se->vprot - se->vruntime;
+	}
 	reweight_eevdf(cfs_rq, se, weight, false);
 	place_entity(cfs_rq, se, flags | ENQUEUE_QUEUED);
+
+	if (live) {
+		if (weight != old_weight)
+			dist = div64_long(dist * old_weight, weight);
+		se->vprot = se->vruntime + dist;
+	} else if (running) {
+		cancel_protect_slice(se);
+	}
+
 	__enqueue_entity(cfs_rq, se);
 
 	if (!rq_h_nr_queued && rq->cfs.h_nr_queued)
-- 
2.53.0

