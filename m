Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A52D41D652;
	Fri, 25 Sep 2026 10:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790333648; cv=none; b=GJnfgG+BXqpa8sf12fsVGD8ycrsxxka5AF/zC8AVq9Wbape8Bkq/vlMQDzYr0+xnLple9LVs7Tf0wnZN+4q5fHQ1uMxGhUrD5sC/UXHlBPs6TGq3QYXY7qyhbFai0MJGvA5NEbf86BXHpsKbeoj2tJGZDGkqc7MLeHseYGxbKjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790333648; c=relaxed/simple;
	bh=T1lt3bZWsB02M6i0kvJJk7ePB1qkpOBtDhqX8cLOPOg=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=SaeN7EnXUddtID1hIWa0/QwJgX3RtWeH9xVwiXJOavNQsJOL3hvQX+e0M1mR3ik/jwGPxjSie52snUO6dwsdHG7wniZqY/xLgoY/5CBtI482M5OXRYb6khoNlPdNRQNYogaYfxKjD/ZPY+u0Sq2ipiVoEDS4dsOMMK3B/ZYdQ8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2LUXOyCi; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=N4Fkd0tn; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2LUXOyCi";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="N4Fkd0tn"
Date: Fri, 25 Sep 2026 10:54:03 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790333644;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rA81wtX08A7BN29fNI7DoQWAsdQopHJCKcmiB1C2MKA=;
	b=2LUXOyCiLmqPMtdRbu6sVOX9O1rW1AASaYsyVDAW8GFpsSz7j1h1dOsrSi3f0S8MqZFHWC
	biEwJqix4tYVNoAYlTmKp5xdtseFAu8KhzSaq2tQicDahR4OFAi/d0ooy2jygdNEJyUvi8
	8oru5B6tdx+ZXjZvkxK96uYP3Huli5tAiNgiomHoPgeNJdYFFsc6SXqMHa+4CFOgQeNfGo
	fdr54zzWyLbrZi6hHdjXnTIC4HNno4UQkWkoJt+FuN/Y63ZUyfrnmkMJmnNVEFR3O/P5/o
	b2cnnrAYDgzMCMQYfA8obX2WFeR3nHGk8n9DrsDzroKnhWH8oXxveNZ6Kf/u1Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790333644;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rA81wtX08A7BN29fNI7DoQWAsdQopHJCKcmiB1C2MKA=;
	b=N4Fkd0tnQLcMGuL9LVfTJ9pdDZ+9lTxClVUHMlmwDIPAQSBUY4/yV1EL0nw43V30MVKHXK
	jiyVgTK6dIPooPAA==
From: "tip-bot2 for Vincent Guittot" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched/eevdf: Handle more short slice waking cases
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260921152238.3804392-4-vincent.guittot@linaro.org>
References: <20260921152238.3804392-4-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179033364338.2819794.17721544590591938311.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     d2e0100827578641df2f85546bdb57bb1d8ff55b
Gitweb:        https://git.kernel.org/tip/d2e0100827578641df2f85546bdb57bb1d8=
ff55b
Author:        Vincent Guittot <vincent.guittot@linaro.org>
AuthorDate:    Mon, 21 Sep 2026 17:22:33 +02:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 25 Sep 2026 12:45:59 +02:00

sched/eevdf: Handle more short slice waking cases

Handle better the cases with several short slice tasks waking up
simultaneously.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260921152238.3804392-4-vincent.guittot@linar=
o.org
---
 kernel/sched/fair.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 82155d9..03206e1 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -9836,8 +9836,14 @@ static inline bool set_preempt_buddy(struct cfs_rq *cf=
s_rq, struct sched_entity=20
=20
 static inline bool set_short_buddy(struct cfs_rq *cfs_rq, struct sched_entit=
y *pse)
 {
-	if (cfs_rq->next && cfs_rq->next->slice < pse->slice)
-		return false;
+	if (cfs_rq->next) {
+		if (cfs_rq->next->slice < pse->slice)
+			return false;
+
+		if (cfs_rq->next->slice =3D=3D pse->slice &&
+		    entity_before(cfs_rq->next, pse))
+			return false;
+	}
=20
 	set_next_buddy(cfs_rq, pse);
 	return true;
