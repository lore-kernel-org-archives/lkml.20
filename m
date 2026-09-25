Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AD147F2ED;
	Fri, 25 Sep 2026 10:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790333652; cv=none; b=OCQWjyywbyZtbZTx1/Q7bFaSvj6hMIcoDYI8Cd3rqgGNJ+47UfuSEiciWcXvu6nMP9C30LufUaRNPU4dK/ULQ/ZCOV3r64sARKZLHmg2uCnv654MZtT8DmNHh3r/T/b0jwCRXluNPtZdiecYk68zsYEYlEaOV870633JrOyAkuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790333652; c=relaxed/simple;
	bh=R0ziVUcuLd2xOGMrKBf7sdrwC6KNrSPuVmFdinVgKus=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=i407z430ZUo9b9j+PmeU8v30PJsi8kz+t7+Vgh1ffycsP4TI0BZ2ppkTB0ksBXQ4mAWT4pyWl3UrRLxfB0zQDC5FvFFFTG/mhnkh3QEqwlh9sfsWZvIlA3ASJ7squnfveT2S4wY86yX/cjUWNwEgS/tP2pYQY6aHxht8JYqzb4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3p6mWR0G; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=V2OObFSe; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3p6mWR0G";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="V2OObFSe"
Date: Fri, 25 Sep 2026 10:54:06 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790333647;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gYXiUGV2HWeYozbX8QRL9Y28oQ/1MlADOs1gQb0JbZc=;
	b=3p6mWR0GqoCLP/vo5KJnPu+FWrM+RkszF4ITOKSk2iKdXLe6fWRpA/CdA4zvlhqFQXL6Vv
	Vt6QUtQUnpTnBT7Bg0darcPLqfTn4gemHImF5uXYZaSBhRt81mHo36ayIFy22Ys2Od5TcU
	Wt0wpha5+JNVlt8NBQKq5XOf/+jgeWQAtLoaU6OFJ6JsPfFmw22xZ1xNLA4sS9l2ulsR49
	aSMQODQpUQ5mpRXrehSTji/flDtRJndbdUWoiHeFKCCSjA0LI9I7gZU7HTna/H4RJDOe7M
	4sZphpDs6pGeGtYelV07fH6rzPr46wCfqBPExDt/Jrm6s7UHpLVPxE43gLSx3A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790333647;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gYXiUGV2HWeYozbX8QRL9Y28oQ/1MlADOs1gQb0JbZc=;
	b=V2OObFSe57b8ForzDUBxeSYeNjUdJRZ57GmC6xdd0JR5tL308lE1CBnV7yeeyC4T3iYR9D
	/sdyMnjN/sGiduAw==
From: "tip-bot2 for Vincent Guittot" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched/eevdf: Ensure that vprot will never go above
 a min slice
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260921152238.3804392-2-vincent.guittot@linaro.org>
References: <20260921152238.3804392-2-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179033364613.2819794.18177332963834046075.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     aae2a33ea66299f39252bc1891bb4f05f631255d
Gitweb:        https://git.kernel.org/tip/aae2a33ea66299f39252bc1891bb4f05f63=
1255d
Author:        Vincent Guittot <vincent.guittot@linaro.org>
AuthorDate:    Mon, 21 Sep 2026 17:22:31 +02:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 25 Sep 2026 12:45:58 +02:00

sched/eevdf: Ensure that vprot will never go above a min slice

ineligible_vruntime() can be after the duration of a min slice but we
want to make sure that current will not run more than a min slice.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260921152238.3804392-2-vincent.guittot@linar=
o.org
---
 kernel/sched/fair.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 2f5c706..0969be2 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1128,10 +1128,9 @@ static inline void set_protect_slice(struct cfs_rq *cf=
s_rq, struct sched_entity=20
=20
 	/* If there are shorter slices than se's one */
 	if (slice !=3D se->slice) {
+		vprot =3D min_vruntime(vprot, se->vruntime + calc_delta_fair(slice, se));
 		if (sched_feat(PREEMPT_SHORT))
 			vprot =3D min_vruntime(vprot, ineligible_vruntime(cfs_rq));
-		else
-			vprot =3D min_vruntime(vprot, se->vruntime + calc_delta_fair(slice, se));
 	}
=20
 	se->vprot =3D vprot;
