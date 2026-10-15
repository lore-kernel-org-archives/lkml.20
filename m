Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498A44AA004;
	Thu, 15 Oct 2026 08:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792051533; cv=none; b=TQvDEFDCB6X+UvXMGmWoY9a/nnu4zuUBwgFoUDTg6U7utStSCuNnS7y8Aa/wi05Nd+I7XNV+pwIzIgS7iMA6uYSWbiXt+OW23ZmOv6wT08xqiShKVfdP24WPmjwn51f5g+NEaj/ByS6SJCwNJTv5dCpljiiu8vfTAHjAjT0FyUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792051533; c=relaxed/simple;
	bh=bslYpLP0d11JbmV0Y+jWRMWGr02mHicMi8ZKdhlfli4=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=fkyqd5mN+Y55mEqrcWmTPrIeVljYURy/gtSnGlNhbEPAUUJnojKnVw8j4YOq07OG6JamcptIrPjWu66YxbqQqarYLnMmm5MLsu6Y1wI7R8v4WVjRvWJ6Yhc5aumj3CgJ0JRu2qFF4npSF2Di26003OZIP+C2KtsUbp5EBS9so4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LOlUaez+; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IzMGQ1Be; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LOlUaez+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IzMGQ1Be"
Date: Thu, 15 Oct 2026 08:05:28 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792051530;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JHVhCJbcVWz0NYFxkEfRBQCj4EyMBw2XHgbnCkh0UWQ=;
	b=LOlUaez+1SKBGQLCxJv2UZ2zahXaEZwH31E9tndzYpmWh8WdhSmBcBQh/nOQIIRcUU8LS8
	nhYQx8mK4uPRrbKd8v1+9qaQRKz3mhFtasWRuJd57vqJk5IvORekVHgEWvz2+OIPpFOCrC
	12hfvurCooAjZFDB0sy56c7NFeGUqjHgpVqjwTKl7R4NvXcHlfgy7wjv9iNYqeYg/X3/j6
	alfRYuRNb9nrRvD+AQylbxNCOmzSQwYGdr4sX3l4XdtzF+oDLdE0YsZI8gLgMrz57+R3oT
	mhUf+TFU8kuwSjQljpHiIkOE0MTTUdF+j/KcvyNrIN/v0oYz1CzHpQBq8uArIQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792051530;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JHVhCJbcVWz0NYFxkEfRBQCj4EyMBw2XHgbnCkh0UWQ=;
	b=IzMGQ1Beru7ZNmVCAupv/6sTthiNceb70pmIb92Xmt7DGamMEJ7309iwxna4np6Y5SOqYc
	9VgWofXaEYIX8jBg==
From: "tip-bot2 for Elif Topuz" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched/eevdf: Remove redundant RUN_TO_PARITY check
Cc: Elif Topuz <elif.topuz@arm.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261012105001.131311-1-elif.topuz@arm.com>
References: <20261012105001.131311-1-elif.topuz@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179205152866.2666988.14970752689594734036.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     b0f1d7a34d3099973f1ba45d1ce6f36578e510a2
Gitweb:        https://git.kernel.org/tip/b0f1d7a34d3099973f1ba45d1ce6f36578e=
510a2
Author:        Elif Topuz <elif.topuz@arm.com>
AuthorDate:    Mon, 12 Oct 2026 11:50:01 +01:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Tue, 13 Oct 2026 13:51:28 +02:00

sched/eevdf: Remove redundant RUN_TO_PARITY check

update_protect_slice() is only called from wakeup_preempt_fair() when
RUN_TO_PARITY is enabled. Remove RUN_TO_PARITY check inside
update_protect_slice() and use cfs_rq_min_slice() directly.

Signed-off-by: Elif Topuz <elif.topuz@arm.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>
Link: https://patch.msgid.link/20261012105001.131311-1-elif.topuz@arm.com
---
 kernel/sched/fair.c |  9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index a58d513..7bf3193 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1089,13 +1089,8 @@ static inline void set_protect_slice(struct cfs_rq *cf=
s_rq, struct sched_entity=20
 static inline void update_protect_slice(struct cfs_rq *cfs_rq, struct sched_=
entity *se)
 {
 	u64 vruntime =3D min_vruntime(se->vruntime, avg_vruntime(cfs_rq));
-	u64 slice =3D normalized_sysctl_sched_base_slice;
-	u64 vprot;
-
-	if (sched_feat(RUN_TO_PARITY))
-		slice =3D cfs_rq_min_slice(cfs_rq);
-
-	vprot =3D min_vruntime(se->vprot, vruntime + calc_delta_fair(slice, se));
+	u64 slice =3D cfs_rq_min_slice(cfs_rq);
+	u64 vprot =3D min_vruntime(se->vprot, vruntime + calc_delta_fair(slice, se)=
);
=20
 	if (sched_feat(PREEMPT_SHORT) && slice !=3D se->slice)
 		vprot =3D min_vruntime(vprot, ineligible_vruntime(cfs_rq));
