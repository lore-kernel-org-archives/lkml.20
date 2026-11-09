Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242219;
	b=Qen5CVwU8Mb2JYuxgs8avpjQ1gUOjKzFNd1jGS4rhyMhD8wwI/vV+sbeEWA9YIZrMTpA
	 LbR1cc3N9yVj/U5mdznN24zaI8Vwa9vTc+YQj5s5IVvDBg7l+snO6gwAtlJz7+FhxRNGI
	 CHVuG3I8fJdzdtFBDMsjYs6hMhgytzvS9vCfccmRW2o6JCmGcomQ0ArTZGR/D/3dQanv+
	 FMX/PLCLlIfwo38dt7ZY926uyabzeCEGvIJktKotmd12JfohHVowDkGH3ggSlNV5WKSQA
	 EDgaZ9uKOI+mJYYkzB7fPN99U8+9POXZHhTZ2DZDOnKD1JkiJW1yiC0RjwYjQ3+7dVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JLlaKTPbLeb3/gH7AJPm/GuRoGA7hDQrgsFi/3akh7M=;
	b=v1OPZUbBGvezqF0G4QzjJfVASJTtq8LUvEHIMFdUMZUiOBRlIxtcuaiY5E7PG6OLweVf
	 doLh8AQroe/3O9p/Wn4uGZCZrURV+JC6oBrf3W2RMUzYwMRgEHAJ3Nyx7o2NENrYADOac
	 8G/wWJZvVzkRdo9UqNdrsZ2UXVL4elEPtcYT1sOVldskaNb6K8L5P5xx+KNHG/8Rz+E7e
	 zvtvANAKZSET/t7OBiQDu1wNtG+apxD3hGb2h4u22c5mnc62dslc6UN3gI+hP9HmeuxPE
	 nRxZX3vONIyjq5tyLe4B9YbIQiMGP5fhncDaY8AQlkjLALaakbeo2AquVnLqMA9L7gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vqUgHQ2v;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B91C606EE95
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B91C606EE95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vqUgHQ2v
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so11212335e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794242217; x=1794847017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JLlaKTPbLeb3/gH7AJPm/GuRoGA7hDQrgsFi/3akh7M=;
        b=vqUgHQ2vNCQ5nG+Dlu0E31TLu6AgQHG414t4NmyiyEfkjDF7U5c79e0+Pj0Hkj1kMX
         mnl6fj7xBdzbvHhkFCASOv8y/2gqCw68E4KFwSKvwAjgGIIBAkfimEfo+3MJaZKbUjdP
         1FEMUTrhzP96MzqZl0N97/ESBaTdzSJPabdO3/Phz15TUiaXihp9f2QSE67hK1Z+Zars
         lfNTj0FEaGuVVAntOkWK+wvqEHzwHRJcJtSfWXpaVQcieItV5pNMiLizhdmE0PUjUg8y
         71M0TvQab3uLzEfbQ1dGj8eWeIGZ8a8nhnhfICm9BIPgGHjLam10mI7NraAC73aSxoKQ
         M4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242217; x=1794847017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JLlaKTPbLeb3/gH7AJPm/GuRoGA7hDQrgsFi/3akh7M=;
        b=vatmMww3lVlm6+UnrZf3spTy+fkjwH0OC1uFhoVt459XdWUukf1AxCZWh09Ja98svw
         tehSjg1WadpSmNmyJpSHf6Iyp8K/J/KlbcPTcik6d4+eg74s1hxv/j4YR09LjZzUpRNn
         1yAvlCi+maTIr/TKQhGKeWQiXhLNtpQq0QnpVpDfCgPjbFJudz76xz8Nj1FFImfdIDIY
         oMv9Z+v9qnw+htY/jPCldmwwLheL57sD+SHOT1ds+P3K3yI3eRlGMVULCuHEGi0nI+tz
         yUm7OJ7XEIwn6NQKh7UwZtpJujHHZf3WBqnp21bjQdcq78Nizuop/OmD3es5sziGupzZ
         JhPQ==
X-Forwarded-Encrypted: i=1; AL+hErEdrN0r4U36ghI/PrmMXHjjcGvgyhBPmAtrgVkfOnhLdd/SlgRzZgdo2CoqmtMRaCHHGaIwHPelowkbt5s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UBZ+ODAqVgex9PbDOja8cNMrxZ8OL1b2zhCfmJY1grUVGuu7K
	ZRHFrlvJIxkYv8RR5GYfQ3iKCljLhekxMAb2Um8tS74YhFuE1HZFMkZt
X-Gm-Gg: AYBFou34DLsD7hICspiDibsETqiVqcPm957RWMIv/luLGYj4/5Veu7ZLauq/R0u1zwk
	sx2tvCnCIl7yVnODB3oHzfHUylrF3MgMPGzLEdAG8TCn0CFkUIwXtErEvq5b8KO2Eug+PuuKpZv
	RT4vqiVrPWww3DUP1cHifm2QBmg3bE3gyC/NhIbMrLDuxgRirynlhGvxYOnczjcO6Sp/o0ZI+lX
	i3z8JE0U+SAewAU7ODffQhww70OG98jb6OFyyV36CnyAscZOet6odrDs1/IcamehVKCuC2MyaH5
	A8lBmxOqi1UjDrTvDbzDi0gUmDmSk3shxXaWXvD4FiBtFUJvC68zPe7DLzUHwsM6nmL8uH3uuLl
	kyPcOiwa5Fp/OW5BeExDfgSPkTk7cKWQwewbV76tmg/9YV+CDZ/B46QG0J9Heo+sB48sYY1D3AZ
	qsuZmVat+Y0g4tE4FbHml68IMR2sPF1Mf9M+ICOyhoq1vnNMk3xY5acpa68n5xogTFyEiYWF2Gv
	lmOPKZSpu5TF/W7IBJ1ptMxBrYh2Ft3j2vmTcmsBBDCqFNCfdspMgDJNEjnvV/aocxkHxP8LyVR
	VLvupH3UNO/aWOxBAll2DxMfBw==
X-Received: by 2002:a05:600c:3e0a:b0:4a7:d9b1:b684 with SMTP id 5b1f17b1804b1-4b94d762e54mr87248405e9.2.1794242217597;
        Mon, 09 Nov 2026 08:36:57 -0800 (PST)
Received: from victus-lab ([193.205.81.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b96cd012e1sm138851295e9.8.2026.11.09.08.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:36:57 -0800 (PST)
From: Yuri Andriaccio <yurand2000@gmail.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
Cc: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Yuri Andriaccio <yuri.andriaccio@santannapisa.it>
Subject: [RFC PATCH v7 22/29] sched/rt: Try pull task on empty server pick.
Date: Mon,  9 Nov 2026 17:36:08 +0100
Message-ID: <20261109163616.195264-23-yurand2000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109163616.195264-1-yurand2000@gmail.com>
References: <20261109163616.195264-1-yurand2000@gmail.com>
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

Try to pull task on a server with an empty runqueue before returning NULL (and
thus shutting down).

---

When all the servers of a cgroup are throttled, work is pending, and any one of
the servers is replenished, it may happen that the runqueue is empty and thus
the replenished server is immediately shut down.

The server may try to pull a task so that the cgroup could consume its
allocated runtime as soon as it is replenished.

Signed-off-by: Yuri Andriaccio <yurand2000@gmail.com>
---
 kernel/sched/deadline.c |  8 ++++++++
 kernel/sched/rt.c       | 13 +++++++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 64df71ab370d..219493427e0b 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -2910,6 +2910,14 @@ static struct task_struct *__pick_task_dl(struct rq *rq, struct rq_flags *rf)
 
 	if (dl_server(dl_se)) {
 		p = dl_se->server_pick_task(dl_se, rf);
+
+		/*
+		 * server_pick_task may drop the runqueue lock, so check if
+		 * something has shifted.
+		 */
+		if (pick_next_dl_entity(dl_rq) != dl_se)
+			goto again;
+
 		if (!p) {
 			dl_server_stop(dl_se);
 			goto again;
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 9d95cf5fd520..839977b05d53 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -286,14 +286,23 @@ int alloc_rt_sched_group(struct task_group *tg, struct task_group *parent)
 }
 
 static struct sched_rt_entity *pick_next_rt_entity(struct rt_rq *rt_rq);
+static void pull_rt_task(struct rq *);
 
 static struct task_struct *rt_server_pick(struct sched_dl_entity *dl_se, struct rq_flags *rf)
 {
 	struct rt_rq *rt_rq = &dl_se->my_q->rt;
+	struct rq *global_rq = global_rq_of_rt_rq(rt_rq);
 	struct task_struct *p;
 
-	if (!sched_rt_runnable(dl_se->my_q))
-		return NULL;
+	if (!sched_rt_runnable(dl_se->my_q)) {
+		rq_unpin_lock(global_rq, rf);
+		pull_rt_task(rq_of_rt_rq(rt_rq));
+		update_rq_clock(global_rq);
+		rq_repin_lock(global_rq, rf);
+
+		if (!sched_rt_runnable(dl_se->my_q))
+			return NULL;
+	}
 
 	p = rt_task_of(pick_next_rt_entity(rt_rq));
 
-- 
2.56.0

