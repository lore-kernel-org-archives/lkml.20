Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213850;
	b=LyfkHT1V+3oZCvNmRHCKgNdZYNDaGWt4m0+tdzEaiiRbd+p0mQ7qCTxWPIUInt0z7DTx
	 vDys+xpix+baRFYvEtM1JE6ZYgVPNYKhsK6O+1XmRie2Rkl+257aroBzAL8MAy7EOFHwq
	 UvvWf0mLPmEofHj0qmxDxsgk9Qi+WJE/6hJ3DvftgdWCxgLX9a6VZ4xmbz8ynBLHYdesa
	 TzG1aHaWNhmYuLyStTTQc0eK/JI2OI5ru2aqYS1rwQ6/cpJSctGR+YwX7/ZMOv7d7py2x
	 fq0mGicic9AB6vkx1pE8EMdfSHIMk3w/JzZ3o3F/utJsUeAfRuSZdEXaicxCk6WFH9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213850;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=A+9HEgI82fvkw3GuUVo/JHWi1Oc2AYjxfBxFnTfliAQ=;
	b=1AyEA8w9AtdIw+dIIXleAak6Nma34mAjT8szhvrakzqpvfjtnFQ08Bo87EK2Ofmk0Ilq
	 +NA8VttmTB1M36AlaPUfz/Rkzi0i1Tm5dkfcD5BMulCk8Ol43bDEdi9YzR5Nrsc7kC5Wb
	 dzRGHtCGdpPIPieUBZmfxzs4IKuCeImeq1oYp2rNzDFlYnmE2mBcwIrZfZSkMdDSiLesM
	 GzW3mm3ReY0+KyypzhzmBKgWvsxKlxLOzLtbutY9/Xg1yRak4HzXgGH4Db4xqITB9W/4x
	 gBhSCx0wefif1jtFly7LptYrDyeiIq2KQaEBR8miZdxFkKDRJ4T/Xfs+Y12RIDCtDsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=RBjIQZXg;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=47gUdV26;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADE56082BC3;
	Mon,  9 Nov 2026 08:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BADE56082BC3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=RBjIQZXg;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=47gUdV26
Date: Mon, 09 Nov 2026 08:44:06 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794213848;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A+9HEgI82fvkw3GuUVo/JHWi1Oc2AYjxfBxFnTfliAQ=;
	b=RBjIQZXgYMGzMIlm70l0nTN6lrYfLn+FgHup66wIoYyVmNeEgRxwo76suSs8EcHvF2913Q
	jp1yD8Hv4WJgdL/Q+vwMvfS6ZTxIiV/fpM8j8UJYyK82x1VDqHzEC8jiwSiFid3PdIL+La
	3SUAcrwEQ65TJDTd/O2ScWf74Y5XULIdx35laJWYQuVXiCdn5p8tNdjmTtDIC2vlHUHy/U
	ysGnZ767lZ0GyVrie0t4Y28qKlxljcWUibyj0ELmesCN9JXklQMzrUN8WrTcMYYTbeQEnP
	rtaXCmFLhEpvwvR0YHOK21AewyrfFNyM+ZRYr09QoGbh6e0ZkC+ms//u8+kG8g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794213848;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A+9HEgI82fvkw3GuUVo/JHWi1Oc2AYjxfBxFnTfliAQ=;
	b=47gUdV26BDgKLaul1pQ2HtzN2NTVHBmwSIk3FUF+aCC3tyk/tOh7OvfTraaUtN/ArLa2sl
	Le74UAg0FQ07E/Cw==
From: "tip-bot2 for Peter Zijlstra" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: sched/core] sched/fair: Extend for_each_sched_entity() with a back-link
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
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
Message-ID: <179421384600.2093942.298349497227223342.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     6e3cae6cb5a098d32e0b07a4e38a5bf9811b2f18
Gitweb:        https://git.kernel.org/tip/6e3cae6cb5a098d32e0b07a4e38a5bf9811=
b2f18
Author:        Peter Zijlstra <peterz@infradead.org>
AuthorDate:    Tue, 29 Sep 2026 10:49:26 +02:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Mon, 09 Nov 2026 09:39:56 +01:00

sched/fair: Extend for_each_sched_entity() with a back-link

Leave a trail of bread crumbs, such that we can find our way back down the
hierarchy. No actual users yet, but split out because its a bit tricky.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
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
