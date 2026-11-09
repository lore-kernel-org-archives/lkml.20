Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216534;
	b=ogYo6B3gDm87CdZDFF4q/xFMtWlBmaaL0lXKN4odNYbTn4gm/ekYtxCTJoqPPvyOxwbV
	 2BcQ4f4mWAUUssUmUsJKZyEnmCY5n6qZFibVXPqdj+QaHUIL7BiXI3YTd6vapmHepvY20
	 QdrfUb8kNL9BjA1ApaJzcWGcETk67ZECM6jns+Y/ZmRVPN09qkvG4i9MrNJHmNmZVASmH
	 HAVeaiJvtYZSrv8ZxZa1OlMNCIZ6ZmL9KNQ0XykP4rxhbNiGqre5NB5REoatV+RPhusfI
	 yTvlYGS0uu4moFYmw4T8diN08P71x4ei9bNoY4knUCm051e2YzQLh0kLeJF35DdCjUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216534;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=LFzTCblmdLysK8U6H3/HTenINPx1ZIgUr1DidyiNEu8=;
	b=V7CKvdg7FsOSc2Q7fQ3FQAD3i2UCFFBm3hGQACjGNmG+O/hphrWpmytqZXHNCdAr1RUX
	 yC0efCoHpD8dtGply33euSS81xzC6q+WML5AS843fkp/iZkinuKzjJESf2jz4dLypk6RX
	 UkoodsT8is8Igo9X3xYt+zM7cAbVzIxLNjurAbW4wgMpTmbUziCHrxSBUKQ/Vn1EMNstw
	 WNl8/lY2IDl2lusjV4Y3hTGbQ3nh5lJ2sVL0QIQbS0LrensSpC25EoGPEGViacyLsJsvF
	 7qFpt1BgE+gLdAsD4tLj9wBHtIHRV9ODBv+7ozLB+h0c9ntgfyuxHlmKViP8PUb4B2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=j1zOlMAa;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=RMnmYQEu;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB8A606D810;
	Mon,  9 Nov 2026 09:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCB8A606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=j1zOlMAa;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=RMnmYQEu
Date: Mon, 09 Nov 2026 09:28:50 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794216532;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LFzTCblmdLysK8U6H3/HTenINPx1ZIgUr1DidyiNEu8=;
	b=j1zOlMAaEk03nwy4vEObWQoQ6G7OHpM+KsJFGnRp3sa+jYjMqpqq2XhBW49Ce+4DWhfCFB
	/ysMxbL4pTAG/am1fIfvQJ8cjWqvlHZ0xkoc0/54Rr+D/cyLYx9NfbavD5vp0dWFZGxAk1
	99bIpEs/OaWyP5aJqwRZcDwZ/CbLs7qb4UdeSUkt59fsNCQUInljLaeMPSgkhyNk/rtRVi
	8t6YCGiH7f1VFilYsms8VRHp+FxYqZpPzFg5Fj5xLr17AlDZ8Tfxx7SrNo0zmOWHyIbRYb
	9g6Ka/o2V4ib+EnsxPpBe/4/000c6pmnNFVfplfUrhUtGFfOCgfjRhWeHtW+NA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794216532;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LFzTCblmdLysK8U6H3/HTenINPx1ZIgUr1DidyiNEu8=;
	b=RMnmYQEuVZ9dVnVsOWFKrXqgsZ49h8Ol0BkOZDT+OTiY4IAypnclM/d1CTjujEwgT4Xr8M
	zKNwwz6l7hpu/KAw==
From: "tip-bot2 for Peter Zijlstra" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: sched/core] sched/fair: Extend for_each_sched_entity() with a back-link
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260929085320.209298048@infradead.org>
References: <20260929085320.209298048@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179421653064.2093942.9911171783047875948.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     e0aeaebb8a46c2765167f1907e72e6b42797c09f
Gitweb:        https://git.kernel.org/tip/e0aeaebb8a46c2765167f1907e72e6b4279=
7c09f
Author:        Peter Zijlstra <peterz@infradead.org>
AuthorDate:    Tue, 29 Sep 2026 10:49:26 +02:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 09 Nov 2026 10:17:50 +01:00

sched/fair: Extend for_each_sched_entity() with a back-link

Leave a trail of bread crumbs, such that we can find our way back down the
hierarchy. No actual users yet, but split out because its a bit tricky.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>
Link: https://patch.msgid.link/20260929085320.209298048@infradead.org
---
 kernel/sched/fair.c  | 14 +++++++++++---
 kernel/sched/sched.h |  1 +
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index d5f937d..31a583d 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -317,8 +317,13 @@ const struct sched_class fair_sched_class;
 #ifdef CONFIG_FAIR_GROUP_SCHED
=20
 /* Walk up scheduling entities hierarchy */
-#define for_each_sched_entity(se, cfs_rq)				\
-	for (; (se) && ((cfs_rq) =3D cfs_rq_of(se)); (se) =3D (se)->parent)
+#define for_each_sched_entity(se, cfs_rq)					\
+	for (struct sched_entity *_BL =3D NULL;					\
+	     (se) && ((cfs_rq) =3D cfs_rq_of(se), (cfs_rq)->backlink =3D _BL, true)=
;\
+	     (se) =3D (se)->parent, _BL =3D (se))
+
+#define for_each_sched_entity_bl(se, cfs_rq) \
+	for (; ((se) =3D (cfs_rq)->backlink); (cfs_rq) =3D group_cfs_rq(se))
=20
 static inline bool list_add_leaf_cfs_rq(struct cfs_rq *cfs_rq)
 {
@@ -455,6 +460,9 @@ static int se_is_idle(struct sched_entity *se)
 #define for_each_sched_entity(se, cfs_rq) \
 	for (; (se) && ((cfs_rq) =3D cfs_rq_of(se)); (se) =3D NULL)
=20
+#define for_each_sched_entity_bl(se, cfs_rq) \
+	for (; ((se) =3D NULL);)
+
 static inline bool list_add_leaf_cfs_rq(struct cfs_rq *cfs_rq)
 {
 	return true;
@@ -15277,7 +15285,7 @@ static inline void task_tick_core(struct rq *rq, stru=
ct task_struct *curr)
 /*
  * se_fi_update - Update the cfs_rq->zero_vruntime_fi in a CFS hierarchy if =
needed.
  */
-static void se_fi_update(const struct sched_entity *se, unsigned int fi_seq,
+static void se_fi_update(struct sched_entity *se, unsigned int fi_seq,
 			 bool forceidle)
 {
 	struct cfs_rq *cfs_rq;
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index cf5dba1..a993c7d 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -726,6 +726,7 @@ struct cfs_rq {
 	unsigned long		tg_runnable_avg_contrib;
 	long			propagate;
 	long			prop_runnable_sum;
+	struct sched_entity	*backlink;
=20
 	/*
 	 *   h_load =3D weight * f(tg)
