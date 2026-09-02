Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CB83B3C0E;
	Wed,  2 Sep 2026 07:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788335704; cv=none; b=A7ZjjeCPJaKEzgUwr3Uz0KScagkI9hnYKixdPDLJ2e8BKas3Yo8xDttw1vO4RiG/HUZ79PMPpphtglIfDOLdZFkYlQda4zeS7DfaBebVuttlXu8w9ZcSPjDKGUiNPzGIBc5U22DWm06oiTKWit8VPOCSR6uuQ3GRngD+WssoSjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788335704; c=relaxed/simple;
	bh=iNDcgQEDIj+1PmMRxvaIq0Tps19ha/Ep6qFkuqBaNMg=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=IdeMQr8K8dL+JlMcJxN/dfLAk4VYlz/hix7Pf/rB5qeNfKYuQSPxs5lUWnv48i4h96xbxte5brBhHAw08kBepsDkwpHgyleaB+pVBcycxsIgaUbmFAw/6RtPr5ntxXpxHoyucULHDFyFB0/2Yi5rSO19PlCBFOJ6TeKDzu9HPhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WNE8D5cP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sMZ9tfIa; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WNE8D5cP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sMZ9tfIa"
Date: Wed, 02 Sep 2026 07:54:59 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788335700;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OR98pv2Md6hdhvb7eFDRVjkQUkQ8a+RphlpVaRUFtVc=;
	b=WNE8D5cPMpsRVO+mKCZbD3qfAEbLvPzt5R8Uy3QAzE5Lbfe87Y3cgtN/ZmIEJfOou1pQB4
	r5OUcVJZByzrYKQC6yN8E6kaESOXFFjA9eJUdouA+1YggBDBd43EixTDcRgjWpooJX+eAe
	OdzrIDJbYl8gYFLy5BLm1LivOF9vkPio/llJU1UBw7QV2sNMz8dg3+MoOTeAclBL/Qodd3
	dtEjWP6CskuH9okZY+934GfSbjZ3rxNVk3jJNqltj1IA8yPuYzdIiTk/RHBhJ4NuZe7Tk3
	mpqpRVw+aOfWN3rNc9Zbmt5cyW6mhW64Fg9HJYt+Cu1D2pjq/W+ZQo8ZQHdwJQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788335700;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OR98pv2Md6hdhvb7eFDRVjkQUkQ8a+RphlpVaRUFtVc=;
	b=sMZ9tfIas6PII+pYjh4Lohq7OBkKI8zRYELtFSo+yvIX4A8p1in1HFKTR+BCbtTqxEOMzB
	w0qMualYJgFmkSCA==
From: "tip-bot2 for John Stultz" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched: Switch rq->next_class in proxy_reset_donor()
Cc: John Stultz <jstultz@google.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260807035232.1881495-6-jstultz@google.com>
References: <20260807035232.1881495-6-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178833569927.3717435.12896690519813514136.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     1f880513859336b1d4f9731d3a67d22d0b3b6aad
Gitweb:        https://git.kernel.org/tip/1f880513859336b1d4f9731d3a67d22d0b3=
b6aad
Author:        John Stultz <jstultz@google.com>
AuthorDate:    Fri, 07 Aug 2026 03:52:11=20
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 09:37:21 +02:00

sched: Switch rq->next_class in proxy_reset_donor()

Similar to commit 04f80f8b12a0 ("sched: Switch rq->next_class on
proxy_resched_idle()"), we should also set the rq->next_class
when we call proxy_reset_donor().

Fixes: f13beb010e4a ("sched: Have try_to_wake_up() handle return-migration fo=
r PROXY_WAKING case")
Signed-off-by: John Stultz <jstultz@google.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260807035232.1881495-6-jstultz@google.com
---
 kernel/sched/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 0e6306d..f80b607 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3766,6 +3766,7 @@ static inline void proxy_reset_donor(struct rq *rq)
 	WARN_ON_ONCE(rq->donor =3D=3D rq->curr);
=20
 	put_prev_set_next_task(rq, rq->donor, rq->curr);
+	rq->next_class =3D rq->curr->sched_class;
 	rq_set_donor(rq, rq->curr);
 	zap_balance_callbacks(rq);
 	resched_curr(rq);
