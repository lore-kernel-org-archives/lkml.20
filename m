Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A139C407597
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831640; cv=none; b=gX2DY4YcEHPQb5wrKCL0niNmwGroK0tSwK+DMB3sl1mmKCFJNDZl/mqvh3eSJKGiCJ8z3z2Ty1D90JcBzGOGni8LHzVRJNL3LtIdIUEiHfBBc41RBFlC8LFKjXuYSGqeIIgRY6Ssvi3xI+QhXgyrfs/vcyv5Wck3SjtCJr0mwXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831640; c=relaxed/simple;
	bh=rJPTMEBy2shR5ZoKicnY8w0nqjeXXPAnXH5prItTUeE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pOLNFbEy5wpdnnhUJirO4GPSdiquOLGG/4JW+rZiPZ/oVJvDNqJo1QIr0AFyJEc9q8JYGLf1OELPLcuzBHKJHSEnQAcN9XyVuCgmTaNryFl1VlXf1gF6haads6D0DLEYva96O8dkVyvprl8ebCEogKo4L62teLxlVyxZJ+q4YEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g2+E/Gk2; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g2+E/Gk2"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48dd3367198so74423f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791831633; x=1792436433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yv71HJ18bn/Nr8ubxLzrZtu+HTgD415t2TF7X2BKrBI=;
        b=g2+E/Gk2Ms44+P1t2WkqMQuDN23m1wAHiuPS/uCvQ/lDG7OD5RM8HeYJAU584CK6l7
         otziYINK+FgRS9OEBLqvEvIdnAHcQr/u/AYN4n8kdXgKXdQjnZKEMfTDFEgF1ZHbG6zf
         4GFQE+NE0Ei8qtMQYNOYgmtIkxWXynInl2HptoUhPAPj7W6BLtSFJ1DQtYsIIJhjBmzw
         LFLbsAZk7fEPbe0RMFrfvOYH6gFe6/vnf2w53Vke5rpHqjz3BjXWBN1W7jJ+zaBBQ4Lf
         XMKie+FPgTcTs3v58XHbSuwIAuyAOkdge5qba7auSAq6SyhDKO71fe0bu8l34pZso0me
         VEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791831633; x=1792436433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yv71HJ18bn/Nr8ubxLzrZtu+HTgD415t2TF7X2BKrBI=;
        b=hby/umZp0yjLsOYqIK/Tqxkwq3qAnRxfe6mBG71SGJ10Kroz9A4NqedpiYqFetMTiD
         3Ej6QyFP6MN5+aMa8DiGqeKcarCEZJmkpDsCZ6JAVERGazbTQKVBBM22oQJY0BIScOcf
         b2xTG7h7cWCUuiNikbz5jGt9ta7HHLFSSJPLk0IZ224bLDWhoggRyhXvOMJNNciFw0PJ
         qhPOi0+p49lUv9cBl86c5S49G3bLmXfPkasDgsZxswdbWgGct6vvHaIeNt8hupYnQSTO
         uxhF5IKeRA/BSfO2ety1AJcRVmpOeW2JyQOfHJmbv2bDYKg8JE4lWGDJSnii4Yqbrclv
         SU9w==
X-Forwarded-Encrypted: i=1; AKwUvBy9hSyQe4gJFOf0EUPoflAz+VPuS1+1fNC4gRptPqEx92jpjyDYJoqylVmzzBvKKQI2dqnQrWQ4piaSG5k=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/SLaLSc9Nrl2ShMuDnx8pdxXg3G/j+DrfghMRp3F/KF5gXLfo
	mOaTBiTibcKQ3ad7xRV5+OcpU1S1mMuUtYFGy5H7emgs0p5ECjXHht3g
X-Gm-Gg: AYBFou1kK+WfBzLs/EkMXMgqGvVZZBa0Kddo171qxZnkG8wO1T3oB1GSuf2E9ZsMQCP
	vq13u13kpSGMhaEic7OHjcoySm6RLKOvfR3QfWPaauoQS3w0jlS4Tuqs8YolBTRYNhwRrSrgcBO
	UX7qaLhSG/ApsloTnU3TDaUvNMKn8kfgVYC26bWdFUKyPx1uahYZ+i1RjgOOfTvKCE9u0vi4Zpx
	QfjIy2QMfURyGpCl+uvrAx6G/VzXbsj8MC1GzK39f6XXp2RssgwXxkRBuphCrl92h0sFPFSDyQf
	lv9sVQjz1sfgk4FriVBRbEKRziMv8dA0Gz4PIdHDl4MjSwcDDywiVJ3UqxUrC937XZYHQKEZByp
	uPhYnfCtc5rrLLyRTSfzAm8LxAt/HS0/ULrP/ZE1njWMkK4WZV+MEj3vQjcj4/XFiqH9Uf5r6Uy
	WMQnN5osykphz1XP8xF4GQE2s66aRS7wstN5OfKhP0mr/pG6ZzmmmwAL949R3EPyX/oNnnh2Dwz
	gaokpeDY1PXSshCiPGZ
X-Received: by 2002:a05:600c:8b02:b0:4a0:1973:f05a with SMTP id 5b1f17b1804b1-4a18e47e19fmr215130525e9.2.1791831632058;
        Mon, 12 Oct 2026 12:00:32 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19c8244edsm138819025e9.2.2026.10.12.12.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 12:00:31 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: kayracizmeci@gmail.com,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Cc: christian.loehle@arm.com,
	elif.topuz@arm.com,
	linux-kernel@vger.kernel.org,
	mingo@kernel.org,
	sh@gentwo.org
Subject: Re: [PATCH] sched/eevdf: Fix vprot across reweighting
Date: Mon, 12 Oct 2026 22:00:26 +0300
Message-ID: <20261012190027.9442-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012150121.6516-1-kayracizmeci@gmail.com>
References: <20261012150121.6516-1-kayracizmeci@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> I send one mail, one more to reply comes. Ah.. I love it tho :-)

> > Before 819224e506bc ("sched/fair: Remove dead code on
> > enqueue_task_fair()"), the reweight_eevdf() was not called for curr so
> > the false was always true. If we can finally have enqueue curr then we
> > should skip this case

> Yeah. The beast I created kills me. Pretty nice.

> On sched_change_begin(), cfs_rq->curr is set to NULL. So while entering enqueue_task_fair(), curr is false.
> on_rq is false too. But the tasks weight is changed and vprot never gets touched so it got wrong. Then on set_next_task_fair(),
> the task is curr again.

Would something like this works?

This diff was coded in the middle of the night, so there might be some little issues about it.
Not even 1% tested. But it should 100% work since I'm too smart, right? Right? :-)

(Also, I'll test it tomorrow. Normally I was going to test this, but I lost my test script. And tbh
I'm too tired to make it right now. I mean normally I wouldn't test it, since I'm too smart and this
is 100% correct. And because of this 'dead' code removal patch, there could be some extra handy issues.
Ah... I wanna swear so bad. But, I'll be a good and kind. Goodnight, good morning, good afternoon and good-whatever.)


diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index b42a0ca2a69e..1bea7b7e9cb3 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4731,7 +4731,7 @@ static void reweight_eevdf(struct cfs_rq *cfs_rq, struct sched_entity *se,
 		se->vlag = entity_lag(cfs_rq, se, avruntime);
 		se->deadline -= avruntime;
 		se->rel_deadline = 1;
-		if (curr && protect_slice(se)) {
+		if (curr) {
 			se->vprot -= avruntime;
 			rel_vprot = true;
 		}
@@ -7990,7 +7990,9 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 	int task_new = !(flags & ENQUEUE_WAKEUP);
 	struct sched_entity *se = &p->se;
 	struct cfs_rq *cfs_rq = &rq->cfs;
-	unsigned long weight;
+	unsigned long weight, old_weight;
+	bool live;
+	u64 dist;
 
 	if (task_is_throttled(p) && enqueue_throttled_task(p))
 		return;
@@ -8024,8 +8026,23 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 		requeue_delayed_entity(cfs_rq, se);
 
 	weight = enqueue_hierarchy(p, flags);
+	live = protect_slice(se);
+
+	if (live) {
+		old_weight = se->h_load.weight;
+		dist = se->vprot - se->vruntime;
+	}
 	reweight_eevdf(cfs_rq, se, weight, false);
 	place_entity(cfs_rq, se, flags | ENQUEUE_QUEUED);
+	if (!live)
+		cancel_protect_slice(se);
+	else {
+		if (weight != old_weight)
+			dist = div64_long(dist * old_weight, weight);
+
+		se->vprot = se->vruntime + dist;
+	}
+
 	__enqueue_entity(cfs_rq, se);
 
 	if (!rq_h_nr_queued && rq->cfs.h_nr_queued)
