Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242201;
	b=DH0VshRnjiAhX5p8RePHyQH0wntCJrVEe71wmWhuXWBSSuW09wKcq/pZX3SfFyf3Bk1j
	 BEljIa90AlrvHDzKwUs85D42JhkCIgtFaLLLg/oh0tsS65wYV1je/wx7FQp8VBYIQMdsZ
	 WCZi0ZogMPWPKaGA1bgsT4j2bN9Io1ge2yZvs9C25nK7wosokvZn9Rh82qX+hjc9+Gtne
	 aqiw/UBjZ/nRrAgY8OjU7HyjkbWyClX2my9B0Jj6VWfF3CL6aygWgFRUgcEch/e/XUHny
	 ohchSPXi+Dli+VtlUWG9etiMKHSgtDr+aEWoc+54UKmzU7Wc4ewoM0xAVFVM8U1OhGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ErQf4cPvfS+1Yq71iFQrR+o0j0UZEjto9pKX8GV+5D0=;
	b=glLTyvIejHCplIo6ok9GhFPk8FHfyeUoBa6SMvDtLF6IvReOLzlTGKLpIuP6xwkcpvL2
	 MOnCF0kcA/sj7HLFytzMmmStLEZOZz9V1sy5uwBPdoeriukAjZyhkzQrPR6d7YkUyfRpT
	 2SdFAChrASdkphSeefQBh3Z6w6LBdgKdo40VhlAZRRvFXx3v8lhEoLwiKP7o5WDL1iA1W
	 Kd/5JSiF7v/z+Ch2lm3TMu7tGObCdqiHTjupWV+O5ygimrhOPbq2KLhDbQYsp4zGMG36Z
	 XcgENOFhvyMldGTxEGepqc9Whpi8uMNQQAv9Do6xkoc5FYA1E4enRKsVVM4BCsuQFow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cVtAEvv3;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB4C60A3810
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EB4C60A3810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cVtAEvv3
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so9278845e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794242199; x=1794846999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ErQf4cPvfS+1Yq71iFQrR+o0j0UZEjto9pKX8GV+5D0=;
        b=cVtAEvv3EHpbPbOgoAn0iP3dC/fR+li4Mk815i0Xcwl0TvlkhEI1cziWW6UfhAUiYu
         X+o2MTtnGFZTCGJel3c5h0er53GeSp2PVvDzsAOI8Fo/KoH5Yz0nECwOm1BffNkwgwtf
         LyQCIf4Z3LPpwmbOap32xxqebFiDe+QpTsBJivBguqQbCVQjfwVdsRKCV1/hiAUVid1x
         n6rqqKi4yOeawOzAnF/4J8Ig7e27nexZjUiTBBODtRWzkJSYD4Vk/TK8hphqPPnoz/zE
         Ac9Cz15eW38QkpzlaXvSEIKkOeBXmx8Fe/ghGuLgdUXwRGIqCebYdaTAo93DuAN7x3iP
         Dwjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242199; x=1794846999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ErQf4cPvfS+1Yq71iFQrR+o0j0UZEjto9pKX8GV+5D0=;
        b=cLoA7cr27Dbh9BGzI9hoYASEThXe8SXkfo+Az56EpSBqkfvI/EqSt4JsFNTbCe+4K3
         D1a2BMvaxZfGirgcCXeiQ89Ri6/tytXb8qYGMHcQ1RvFDR/P0h6TsjUJn5A3uvR56vDI
         Mgj0838pfMfUb5tocvBAbpC3SK2fM+5y/659yM0s5fSxqjz2ukJJLTvNdn5HBINNfVP5
         RVKLCdd1a4htViBv2CqdiV5gi3CKiUGeYyY54gnctboP1sl3rFJUm/vuNPaWWmkVeWo2
         aZ6prHD3IIVZt19FkkSomRDME4QQoaJbDsQLl0Z+OjoJEB8MwVF1m8zQCwerAUDeAwSA
         8gbg==
X-Forwarded-Encrypted: i=1; AL+hErEFxvXzVyOaLltGI7pwGIsrpxfLIG18NeHmTd+m5CbR+j9DpMbDQnEGekut7xgpwvdrjJLhaekcAmAaxjA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rTl0wN4ScrHLOnUXrlz585jfyx0tKQfDxzLNWar2jItMTyHxk
	dKxvP1ZYBUkW4nfcwhCc9fXIKNAmaNaP0hA8wBnQ+crNZepvNORYATEE
X-Gm-Gg: AYBFou1eoYAodsTq0ZWb1qZauSmOSBo8LE1C42b05ogir+/09R1fcPBTaBwvcIflASV
	iVukWf034GOR7AFH2M8IidKtUjbNG91GPAiUD1Eh8QvigmgKrJKmCCSzXUgSFbTUSHYeZx+SpSw
	0ePcfdCl8KZ6AYncpVBNUtyLsqtaADiQSktaVtnjjdLBmdmLfB5iIqkp4uPf5jzmq5oc4yrsdLs
	IbPYzFsvBUTATetw0Ujlfy+qJGdEh96K68s1d5r4l8pxJsHnZrgfTXn/MHEQKIT9Aj03jE8WLzg
	vROR9o/hQC9zdLCLf8HncAnEsyiaf1C6E/PTDZEIqLINdw/NeRxYFEcpx15h2wmkzVMcvZ1kcZx
	r9vhTEiiHnQueR+Q1Bs1NSpVST5L6QkkfMHwe1aqOec3LY8C2j/sF1evEGR3QvU7DaRx/o2BDwK
	J/SxqSzDZaZ7dOAZv+s+qdjUFIaWxRgbszYElZlUGvGRiYl0zS5KJNjmX764mTs0hnCZSrQPRv6
	i0WYcOn24C5GpG8NkWat8Yj6iWPEs065MlU49mlaQIPjqvC8vo8muA7boFTaxwvyx9KdSxWARxR
	wGruLiZoyTCuVsYemJ9zWe49Iu0nMntmFvLJWm616EUAh58=
X-Received: by 2002:a05:600c:3107:b0:4b6:540d:6317 with SMTP id 5b1f17b1804b1-4b960da5deamr87546205e9.12.1794242199350;
        Mon, 09 Nov 2026 08:36:39 -0800 (PST)
Received: from victus-lab ([193.205.81.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b96cd012e1sm138851295e9.8.2026.11.09.08.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:36:38 -0800 (PST)
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
Subject: [RFC PATCH v7 11/29] sched/rt: Add {alloc/unregister/free}_rt_sched_group
Date: Mon,  9 Nov 2026 17:35:57 +0100
Message-ID: <20261109163616.195264-12-yurand2000@gmail.com>
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

Add allocation and deallocation code for rt-cgroups.

Declare dl_server specific functions (only skeleton, but no
implementation yet), needed by the deadline servers to be called when
trying to schedule.

Initialize a cgroup's active context to that of its parent.

Co-developed-by: Alessio Balsini <a.balsini@sssup.it>
Signed-off-by: Alessio Balsini <a.balsini@sssup.it>
Co-developed-by: Andrea Parri <parri.andrea@gmail.com>
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
Co-developed-by: luca abeni <luca.abeni@santannapisa.it>
Signed-off-by: luca abeni <luca.abeni@santannapisa.it>
Signed-off-by: Yuri Andriaccio <yurand2000@gmail.com>
---
 kernel/sched/rt.c | 156 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 154 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 3ca932ddcf75..e6f018db7579 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -120,24 +120,176 @@ struct dl_bandwidth *dl_bandwidth_write(struct task_group *tg)

 void unregister_rt_sched_group(struct task_group *tg)
 {
+	int i;
+
+	if (!rt_group_sched_enabled())
+		return;
+
+	if (!tg->dl_se || !tg->rt_rq)
+		return;

+	for_each_possible_cpu(i) {
+		if (!tg->dl_se[i] || !tg->rt_rq[i])
+			continue;
+
+		if (tg->dl_se[i]->dl_runtime)
+			dl_init_tg(tg->dl_se[i], 0, tg->dl_se[i]->dl_period);
+	}
 }

 void free_rt_sched_group(struct task_group *tg)
 {
+	int i;
+
 	if (!rt_group_sched_enabled())
 		return;
+
+	if (!tg->dl_se || !tg->rt_rq)
+		return;
+
+	for_each_possible_cpu(i) {
+		if (!tg->dl_se[i] || !tg->rt_rq[i])
+			continue;
+
+		/*
+		 * Shutdown the dl_server and free it
+		 *
+		 * Since the dl timer is going to be cancelled,
+		 * we risk to never decrease the running bw...
+		 * Fix this issue by changing the group runtime
+		 * to 0 immediately before freeing it.
+		 */
+		if (tg->dl_se[i]->dl_runtime)
+			dl_init_tg(tg->dl_se[i], 0, tg->dl_se[i]->dl_period);
+
+		hrtimer_cancel(&tg->dl_se[i]->dl_timer);
+		hrtimer_cancel(&tg->dl_se[i]->inactive_timer);
+		kfree(tg->dl_se[i]);
+
+		/* Free the local per-cpu runqueue */
+		kfree(rq_of_rt_rq(tg->rt_rq[i]));
+	}
+
+	kfree(tg->rt_rq);
+	kfree(tg->dl_se);
 }

+static inline void __rt_rq_free(struct rt_rq **rt_rq)
+{
+	int i;
+
+	for_each_possible_cpu(i) {
+		if (rt_rq[i])
+			kfree(rq_of_rt_rq(rt_rq[i]));
+	}
+
+	kfree(rt_rq);
+}
+
+DEFINE_FREE(rt_rq_free, struct rt_rq **, if (_T) __rt_rq_free(_T))
+
+static inline void __dl_se_free(struct sched_dl_entity **dl_se)
+{
+	int i;
+
+	for_each_possible_cpu(i) {
+		kfree(dl_se[i]);
+	}
+
+	kfree(dl_se);
+}
+
+DEFINE_FREE(dl_se_free, struct sched_dl_entity **, if (_T) __dl_se_free(_T))
+
+static int __alloc_rt_sched_group_data(struct task_group *tg) {
+	/* Instantiate automatic cleanup in event of kalloc fail */
+	struct rt_rq **tg_rt_rq __free(rt_rq_free) = NULL;
+	struct sched_dl_entity **tg_dl_se __free(dl_se_free) = NULL;
+	struct sched_dl_entity *dl_se __free(kfree) = NULL;
+	struct rq *s_rq __free(kfree) = NULL;
+	int i;
+
+	tg_rt_rq = kcalloc(nr_cpu_ids, sizeof(struct rt_rq *), GFP_KERNEL);
+	if (!tg_rt_rq)
+		return 0;
+
+	tg_dl_se = kcalloc(nr_cpu_ids,
+			   sizeof(struct sched_dl_entity *), GFP_KERNEL);
+	if (!tg_dl_se)
+		return 0;
+
+	for_each_possible_cpu(i) {
+		s_rq = kzalloc_node(sizeof(struct rq),
+				    GFP_KERNEL, cpu_to_node(i));
+		if (!s_rq)
+			return 0;
+
+		dl_se = kzalloc_node(sizeof(struct sched_dl_entity),
+				     GFP_KERNEL, cpu_to_node(i));
+		if (!dl_se)
+			return 0;
+
+		tg_rt_rq[i] = &no_free_ptr(s_rq)->rt;
+		tg_dl_se[i] = no_free_ptr(dl_se);
+	}
+
+	tg->rt_rq = no_free_ptr(tg_rt_rq);
+	tg->dl_se = no_free_ptr(tg_dl_se);
+
+	return 1;
+}
+
+static struct task_struct *rt_server_pick(struct sched_dl_entity *dl_se, struct rq_flags *rf);
+
 int alloc_rt_sched_group(struct task_group *tg, struct task_group *parent)
 {
+	struct sched_dl_entity *dl_se;
+	struct rq *s_rq;
+	int i;
+
 	if (!rt_group_sched_enabled())
 		return 1;

+	/* Allocate all necessary resources beforehand */
+	if (!__alloc_rt_sched_group_data(tg))
+		return 0;
+
+	/* Initialize the allocated resources now. */
+	scoped_guard(raw_spinlock_irq, dl_bw_lock_of_tg(parent)) {
+		init_dl_bandwidth(&tg->dl_bandwidth, 0, RUNTIME_INF,
+				  dl_bandwidth_read(parent)->active_context);
+	}
+
+	for_each_possible_cpu(i) {
+		s_rq = rq_of_rt_rq(tg->rt_rq[i]);
+		dl_se = tg->dl_se[i];
+
+		init_rt_rq(&s_rq->rt);
+		s_rq->cpu = i;
+		s_rq->rt.tg = tg;
+
+		init_dl_entity(dl_se);
+		dl_se->dl_runtime = 0;
+		dl_se->dl_deadline = 0;
+		dl_se->dl_period = 0;
+		dl_se->runtime = 0;
+		dl_se->deadline = 0;
+		dl_se->dl_bw = to_ratio(dl_se->dl_period, dl_se->dl_runtime);
+		dl_se->dl_density = to_ratio(dl_se->dl_deadline, dl_se->dl_runtime);
+		dl_se->dl_server = 1;
+		dl_se->dl_bw_attached = 1;
+		dl_server_init(dl_se, &cpu_rq(i)->dl, s_rq, rt_server_pick);
+	}
+
 	return 1;
 }

-#else /* !CONFIG_RT_GROUP_SCHED: */
+static struct task_struct *rt_server_pick(struct sched_dl_entity *dl_se, struct rq_flags *rf)
+{
+	return NULL;
+}
+
+#else /* !CONFIG_RT_GROUP_SCHED */

 void unregister_rt_sched_group(struct task_group *tg) { }

@@ -147,7 +299,7 @@ int alloc_rt_sched_group(struct task_group *tg, struct task_group *parent)
 {
 	return 1;
 }
-#endif /* !CONFIG_RT_GROUP_SCHED */
+#endif /* CONFIG_RT_GROUP_SCHED */

 static inline bool need_pull_rt_task(struct rq *rq, struct task_struct *prev)
 {
--
2.56.0

