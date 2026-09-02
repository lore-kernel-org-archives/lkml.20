Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2223E639D;
	Wed,  2 Sep 2026 08:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788337986; cv=none; b=Js/mcA+ITG7oFKlOKZl7zUusAfFgd9OBd6o37aj1cao8taWx20NULgtIMK1JaA5Ecx+mXQtU9Sps/ohElZzStDsS29GJTmniqV77CSB9HQ5NK3x5THdVrMQHzDy7LXNxbLRWIStPlsqhyQWoBrABSkKyB1BI6owTXkDoxW09Lo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788337986; c=relaxed/simple;
	bh=vYqONu6CrX5q97aKRbKyLj/ormOuETk3I9y2AwKm7DY=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=hEFwlba7cmIgoTwLm6wm1r7LLKoFfEbeDf+3jT22+wQ/Bml5ZAR3CeHHIdLISYj+mwKS8HaVxqrg74gEj29zy1w8S+7JuV8SDpDGRIah2lodyCHmqfs77J2l5rPE4zNzkXAC59zCfmkFP54khBC0hDYM9h1eLLcvJRcrHSljROQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kEZecbxJ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Rj2N0C+y; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kEZecbxJ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Rj2N0C+y"
Date: Wed, 02 Sep 2026 08:33:01 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788337982;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M1nKwUI5byVeehL+5mtTHgH+xEviINdaxRc799ND1bM=;
	b=kEZecbxJP365KhJSE3klfPSjSXABypIwcA7aHW70IpwEy+6G56q1F7E0dospaxEEogphvr
	OtOPnpeAM/G0hL/j6j5ogGS3mHuv6XnL1HBBm2UFkdx4VZzWNCdlmPELEahTUl37TsNOgU
	G1iSETyLfilzbeuAUkaA/LbgXkacFOCg+yDvnApwYlCBADvVBgw25UeqPtETCvlaxFKN2M
	YE7m2Q2wgbHAzj6khpB4obBsJFXpIWV6imfD8YtRK32W3D10A/DTE96HnF1MoaGNA+HF/X
	89McNGIfvbs+mOG8bxeFIdMaQvQynJlz/DFA3ODGlbuk+uoz6OSoD2wSzvbPpA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788337982;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M1nKwUI5byVeehL+5mtTHgH+xEviINdaxRc799ND1bM=;
	b=Rj2N0C+yIOh9OXiD+O92IHjcq5lGkh5D0TJyA2QiP9Qb9phtKj33Ixzr+MY4rw58/3kBDw
	gjPorsbx/0PNF3DA==
From: "tip-bot2 for Liang Hao" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched/deadline: check start_dl_timer expiry with
 ktime_before()
Cc: Liang Hao <haohlliang@gmail.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260816032643.44969-1-haohlliang@gmail.com>
References: <20260816032643.44969-1-haohlliang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178833798138.3717435.18023684512809336597.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     f549101187c875c2016072cadcb909d228532ae8
Gitweb:        https://git.kernel.org/tip/f549101187c875c2016072cadcb909d2285=
32ae8
Author:        Liang Hao <haohlliang@gmail.com>
AuthorDate:    Sun, 16 Aug 2026 11:26:43 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 10:28:24 +02:00

sched/deadline: check start_dl_timer expiry with ktime_before()

Replace ktime_us_delta() < 0 with ktime_before() so the past-expiry
test uses the same resolution as act/now.

Signed-off-by: Liang Hao <haohlliang@gmail.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Acked-by: Juri Lelli <juri.lelli@redhat.com>
Link: https://patch.msgid.link/20260816032643.44969-1-haohlliang@gmail.com
---
 kernel/sched/deadline.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 0663c00..de6a361 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1097,7 +1097,7 @@ static int start_dl_timer(struct sched_dl_entity *dl_se)
 	 * chosen as the deadline is too small, don't even try to
 	 * start the timer in the past!
 	 */
-	if (ktime_us_delta(act, now) < 0)
+	if (ktime_before(act, now))
 		return 0;
=20
 	/*
