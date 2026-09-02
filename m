Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275532D59E8;
	Wed,  2 Sep 2026 07:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788335685; cv=none; b=liKdVuZOJri24zQNbnaBfurtCCth+7DNu8iU+PzYuskEyNpwaVDb71YscNiUJ4J32aJXxnotRTPPMPEnBV4PGE1OqxHVQgQhBcARhLK4nB9m9bwK4+ByK9YHfMLSssbna9es5QEh8XghAM5aNM8RyE4EdA6oSiFzuIvllxfOUuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788335685; c=relaxed/simple;
	bh=wqylVY9pAKpN/3sbd26H91VqUUWGWsxsH3a0HEHrwuI=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=sjz59J+tKnnxBk3+Th2UW5/gKLSI6h17N6o7IIrZ6zuVjbLI1jx0ibv0tXTJNbC53B66tEjlBOMzMxTgpbRmfXDOo2EnRH8E1sw4GuymLwyqCFRrkNRXgAEWSlcrVMxda34ZoOgYCJ/x2S6H8kNR1Pk/mTYh6M7cW6RhKugk8x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=S6DPHg3e; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pYVxPld9; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="S6DPHg3e";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pYVxPld9"
Date: Wed, 02 Sep 2026 07:54:40 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788335682;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T2mwFbaJiBJSeom/sRNm9GubPK9erBu9XfgTNazEAK0=;
	b=S6DPHg3exEgAAA+V7bCFXtEbvW6xnVU2ggQRVLoH+VnhjRdyiP396Zd1f8qFU8HvdfLomq
	I9VV94KCqj48S6mKD8l5B8d+4JOqaeae8GRaJ1L8teJG+yyoA+NgLxmJIOOZ2ly+Y/JRtV
	MrdAdVJejdBm2s4NKLObsh8I1axvpAv2vvRMvbWCktM/mYnhc2K511cb918PvZ9p3YcfQE
	Z46aRdo7Eq8Gq9oeONC5UuVAtKB+0cbwKLxOUnS7q/LE6nDx8enpTSqvqGnZMDvHzpLW4q
	Mf8m7pzJMM9ujq8TeeYFNBgwZm0zWGewZWy1lrxVMhPIZkPG/VbzWP8r1ydcqQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788335682;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T2mwFbaJiBJSeom/sRNm9GubPK9erBu9XfgTNazEAK0=;
	b=pYVxPld9uCYJ45lvPnqi3FInc91X+y4gEndTaFJ4kgYd/muiPV8cLFXah0GaGewlgmGJPw
	UkYCUhU0IKGEBSDA==
From: "tip-bot2 for Vladimir Zapolskiy" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched: Remove unneeded function type cast in
 do_balance_callbacks()
Cc: Vladimir Zapolskiy <vz@kernel.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260819080159.105433-1-vz@kernel.org>
References: <20260819080159.105433-1-vz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178833568076.3717435.11504795729616784241.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     4248f68fe26da7b741d3b9c6a88a3c5b685377f9
Gitweb:        https://git.kernel.org/tip/4248f68fe26da7b741d3b9c6a88a3c5b685=
377f9
Author:        Vladimir Zapolskiy <vz@kernel.org>
AuthorDate:    Wed, 19 Aug 2026 11:01:58 +03:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 09:37:25 +02:00

sched: Remove unneeded function type cast in do_balance_callbacks()

It's a trivial and non-functional change, the removed explicit function
type cast does not convert the function type of struct balance_callback
member (*func), and the cast can be removed.

Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260819080159.105433-1-vz@kernel.org
---
 kernel/sched/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 4e97766..545f494 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5143,7 +5143,7 @@ static void do_balance_callbacks(struct rq *rq, struct =
balance_callback *head)
 	lockdep_assert_rq_held(rq);
=20
 	while (head) {
-		func =3D (void (*)(struct rq *))head->func;
+		func =3D head->func;
 		next =3D head->next;
 		head->next =3D NULL;
 		head =3D next;
