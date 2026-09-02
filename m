Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABC13BE141;
	Wed,  2 Sep 2026 08:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788337985; cv=none; b=L2s+ixnP2mavI0cqClXqc4FTFHKdzyewupkHH/FoTIEl+KWiZ0SVl0OMTUi9G2O3ZhC6lVXaz5nGMjPc53OW/a2+AB3emtZAi2PBnGjhUGpfy9UrzomU0wnf0m6BQC6bT2F/oDOxaR1HWKl6wX9KDwxs/YaA39EcAkvz/vQid5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788337985; c=relaxed/simple;
	bh=lHpHC0Pvuqf+vky+xOVT87H/Z/UDzJtNMaw5DMegX6Y=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=NFkBtCE4N4QfHORpZ9mzVaD1vZHDa1ex2mn5VYcu5R+KIu4jBdowa0BOju2vDS/xkNFtYsYWUAJDaesiXpI5l+QUCXp3pT/j4e3GyIHEvL8i3F8JQEag5sA0m07NX6LN1BittYLrQqrJPWJZBwn+Q783CWW1yCyGv93szmhZxNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Ub/JaO3C; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0JnFHmPn; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ub/JaO3C";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0JnFHmPn"
Date: Wed, 02 Sep 2026 08:32:59 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788337981;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iNUSnNCM6r7e/w08yr43o4YXaswY7KPEpReeTo01a98=;
	b=Ub/JaO3CFtEXSgTccmcOvKp7ChH/gl/ZD2OYzO/b42/wgBp2wqnXIFkrY4Bb1Li/o9n4Yx
	RiP61mKrNjJXX7Y8zRUtMrQJPQiFamt69yEc1JVMCZb32lHJHRxDZY9COK3Nclz/Kth6g8
	PCmfl45E9tYCrUXYV2Szx+Ojg5V4vaDJrbfrhJQ9+LUBwjFnSVpVVpVpdylwpBUemlfcnR
	qOoLkDOmLLMu6T2zpA0KfeOC4Rw3bboDxkG27f6s+BFKjmeK9AIUY+sFyc6w3gyoutL4JU
	dr013QXpxqu/KcaH9MbB9QTqhfKeQ7N7OFAjbSWyCcJUZU7MTHGAGLczPkD6LA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788337981;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iNUSnNCM6r7e/w08yr43o4YXaswY7KPEpReeTo01a98=;
	b=0JnFHmPnPKg+WEb3d4XF57N+862AMBkc+hUKhV4f4LINGR/LaIepjK47kS6QhQMmGvNnYc
	FGcD8l3UHHTut8Bg==
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
Message-ID: <178833797985.3717435.7073094429156211175.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     879eaa76e6086ab4aff77a669bfb50b7db03e0b4
Gitweb:        https://git.kernel.org/tip/879eaa76e6086ab4aff77a669bfb50b7db0=
3e0b4
Author:        Vladimir Zapolskiy <vz@kernel.org>
AuthorDate:    Wed, 19 Aug 2026 11:01:58 +03:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 10:28:25 +02:00

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
