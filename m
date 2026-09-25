Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920C64734CD;
	Fri, 25 Sep 2026 10:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790333654; cv=none; b=qxQ6N9yL81WjBp+qewT6P+NOtvIGiV1yShoDAaAQd0SoP6Z+tBT5q+r4R5KoD1DF6wwzY8ElcxtgBqY92RO8hFiKlRqTVLnNepHubpDkSPQjz3RsEicLixOjRR4AWr7SOwGUUK/+XBt9wLus1AYVRH5YoJKxgFir1x/8GvMTUAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790333654; c=relaxed/simple;
	bh=z8BUPpjvW0mCn1sbQUTOTviYdtuXlfmniX3xkz9nmvg=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=AJeTX5STq8tXbjIXuhccohVWw0MFJVxwo5BnpBUktBHX0RH/GJfbolKkJgnMQ1ytCqg/2qWb6Q6yYtDjSMe3S18F1dpN1aUFk+YfQTZBEb6lvsNpO6DtEDTFfqbZnEh2BVUEia7dZv25gSczY5zTrTxfiVduQbh0rAQe2wFNtDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mVTjhU5B; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=P1YPSZDI; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mVTjhU5B";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="P1YPSZDI"
Date: Fri, 25 Sep 2026 10:54:09 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790333650;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6ZPigdQ3H7+MIo89VmyQiuxyORSGSJokLOLwQ94rBJ4=;
	b=mVTjhU5BllNTT8ABZWA7s9xMFC7TRZIoJsVoh+nU0F5rxKpRnGvNjofksZvPxmsAfJRi1T
	OqQtfCk10+c5vqyQBsna5bJCVDd8zuWK3Yj1xF2HtC5DPjCFhOTY/gZXcn84B/W9LxpvI5
	AW08d5giZvrAG0UTC5s2bkenxtJKaNWgPTXVV8gIjUWb5MPtwCDzbYIFdjjUOB70+kvqSN
	ELikHq7/CyxsifQTzrcguulC8RsHQMXtB11h5zsYtyzmX+vvf7OlnoyT7KQwwQ+qzxN2YR
	Ys1D81JR0iRXQcC7xTsiYHf6BK8O9RxGrgofQr7asW4ORx+K1X48VoiQKHTOZw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790333650;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6ZPigdQ3H7+MIo89VmyQiuxyORSGSJokLOLwQ94rBJ4=;
	b=P1YPSZDIGbY2fPWIkzbgJoZd5K9askK+jUHkygkIA8yS8donco0HphIZ8jSrQzaVf9D3eI
	KlH+lYTdVK6WzEDA==
From: "tip-bot2 for Christian Loehle" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: sched/core] sched/fair: Drop idle recency from slow-path CPU selection
Cc: Christian Loehle <christian.loehle@arm.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260917153915.1563875-2-christian.loehle@arm.com>
References: <20260917153915.1563875-2-christian.loehle@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179033364901.2819794.2754506755194638696.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     abe440b3770fce8eb8ee92a563dfb55a7b9a1c0e
Gitweb:        https://git.kernel.org/tip/abe440b3770fce8eb8ee92a563dfb55a7b9=
a1c0e
Author:        Christian Loehle <christian.loehle@arm.com>
AuthorDate:    Thu, 17 Sep 2026 16:39:14 +01:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 25 Sep 2026 12:45:58 +02:00

sched/fair: Drop idle recency from slow-path CPU selection

The slow-path CPU picker favours the most recently idle CPU as a proxy
for cache warmth.

A more recent idle stamp may make ongoing entry more likely. If entry
cannot be aborted, that CPU must finish entry and then exit, potentially
paying more than an already-resident CPU with the same advertised exit
latency. The advertised worst-case latency covers both cases. idle_stamp
does not timestamp the current CPUIdle entry, so this is only a heuristic.

A recent scheduler-idle transition may also mark a short gap in recurring
task activity, making the CPU likely to be busy again soon.

Drop the timestamp tie-break and retain the first candidate unless a
lower advertised exit latency is found.

Signed-off-by: Christian Loehle <christian.loehle@arm.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>
Link: https://patch.msgid.link/20260917153915.1563875-2-christian.loehle@arm.=
com
---
 kernel/sched/fair.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index a03e7f4..c4d4b55 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8444,7 +8444,6 @@ sched_balance_find_dst_group_cpu(struct sched_group *gr=
oup, struct task_struct *
 {
 	unsigned long load, min_load =3D ULONG_MAX;
 	unsigned int min_exit_latency =3D UINT_MAX;
-	u64 latest_idle_timestamp =3D 0;
 	int least_loaded_cpu =3D this_cpu;
 	int shallowest_idle_cpu =3D -1;
 	int i;
@@ -8466,22 +8465,10 @@ sched_balance_find_dst_group_cpu(struct sched_group *=
group, struct task_struct *
 		if (available_idle_cpu(i)) {
 			struct cpuidle_state *idle =3D idle_get_state(rq);
 			if (idle && idle->exit_latency < min_exit_latency) {
-				/*
-				 * We give priority to a CPU whose idle state
-				 * has the smallest exit latency irrespective
-				 * of any idle timestamp.
-				 */
 				min_exit_latency =3D idle->exit_latency;
-				latest_idle_timestamp =3D rq->idle_stamp;
 				shallowest_idle_cpu =3D i;
 			} else if ((!idle || idle->exit_latency =3D=3D min_exit_latency) &&
-				   rq->idle_stamp > latest_idle_timestamp) {
-				/*
-				 * If equal or no active idle state, then
-				 * the most recently idled CPU might have
-				 * a warmer cache.
-				 */
-				latest_idle_timestamp =3D rq->idle_stamp;
+				   shallowest_idle_cpu =3D=3D -1) {
 				shallowest_idle_cpu =3D i;
 			}
 		} else if (shallowest_idle_cpu =3D=3D -1) {
