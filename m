Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C954447140A;
	Tue, 29 Sep 2026 19:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790708747; cv=none; b=MTAn8j3ci9tMe8oy4mx9appNyc66iokoCFzAnouZIR7OIo5punkW4VrS94EvHHbih1rbBjiSQtb0kp0JsWMPBox8kK57m54659lUlHKLuPR+iHdtYGX9epaMh1PfchLGIK+GeSfDNf8qlINGrz3iIB7xs+69MS/ueCrG2Wk8eDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790708747; c=relaxed/simple;
	bh=cpfvN2aoFa1AWl6Rbv9Bxi34ciAS8IrBPftTU6gEE7I=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Gv5nxf75t8p2yAVRo+CwnZ5YxrTgTXiEskfts6OjyWrYIR0G5NQX4IxROMFdG4kfEJXzEQVGxWLIfCaE0YCEYv5+d/nxdPcHdN3UH/K6usNZcjL3vo+JDEW0gGCwvGU7fatzbx3jH8Am2r8ybcCZk7S0z39MabkwWIhgnUnwazc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wF4onK+2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sSVq/8TZ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wF4onK+2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sSVq/8TZ"
Date: Tue, 29 Sep 2026 19:05:42 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790708744;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7bfdVKeuSvGdaKx2wwrxg7SgcU+gZtoIw3QMzo2MfcI=;
	b=wF4onK+2u7z9iWV5bfIEIGR2RIkgjvD2NcH7O0PjMiHCa/ZGsls96DNdQmFTxDZU8OUSE8
	hEOZQsJYbNJVgBG0WfRmt6YuDgYvTTeLBku5lKNNi2oRFvjjlX1CYE6QjHltTpXVdpGEqf
	Tc9+Sri6SQLhBFatvAUOIPf66IOA/5wz61CigPuyqe9Wokcyn/yB4vtHsqhf4rGDmSekai
	QI1bgdnsq3z9RO2lSu2rq9E0CQpGKedGMzAy8JU1DSG26cWR2xwh2N/NdGxMSCvLEDZlgq
	wke1jgSl2aaOgfCUEdNSJlMDb3YIQwfUU9PMjrNkTnRlbc4TxpLRQqAUCColMA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790708744;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7bfdVKeuSvGdaKx2wwrxg7SgcU+gZtoIw3QMzo2MfcI=;
	b=sSVq/8TZg9+lpVyakc1Bm/N9LltrTdSEj/cjY0W1GDCCgtIZcrvo2ASzEMxkvsjC0EtXH7
	m1AFdw5tb9e3kHDA==
From: "tip-bot2 for Paul E. McKenney" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/core] aio: Use accessor for hrtimer_sleeper ->task field
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 "Christian Brauner (Amutable)" <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260919001428.3133388-2-paulmck@kernel.org>
References: <20260919001428.3133388-2-paulmck@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179070874246.3910103.4428021546581083490.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     cefc1a24ace53c9b26f5adee1f60a439cc0d53a4
Gitweb:        https://git.kernel.org/tip/cefc1a24ace53c9b26f5adee1f60a439cc0=
d53a4
Author:        Paul E. McKenney <paulmck@kernel.org>
AuthorDate:    Fri, 18 Sep 2026 17:14:18 -07:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Tue, 29 Sep 2026 21:02:51 +02:00

aio: Use accessor for hrtimer_sleeper ->task field

The hrtimer_sleeper structure's ->task field is used as a flag to indicate
that the associated hrtimer has expired.  This means that the hrtimer
handler can be storing to this field while other code is loading from it
to check for expiry.  Note that additional races appear for hrtimers that
can be restarted, which could be argued to be a user error.  However, that
is no reason to let the compiler introduce additional confusion, and to
this end, the hrtimer_sleeper_task_get() was introduced, use of which also
has the benefit of avoiding open-code access to hrtimer_sleeper innards.

KCSAN located this issue.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Christian Brauner (Amutable) <brauner@kernel.org>
Acked-by: Jan Kara <jack@suse.cz>
Link: https://patch.msgid.link/20260919001428.3133388-2-paulmck@kernel.org
---
 fs/aio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/aio.c b/fs/aio.c
index d78acc6..8130d9e 100644
--- a/fs/aio.c
+++ b/fs/aio.c
@@ -1402,7 +1402,7 @@ static long read_events(struct kioctx *ctx, long min_nr=
, long nr,
 		w.min_nr =3D min_nr - ret;
=20
 		ret2 =3D prepare_to_wait_event(&ctx->wait, &w.w, TASK_INTERRUPTIBLE);
-		if (!ret2 && !t.task)
+		if (!ret2 && !hrtimer_sleeper_task_get(&t))
 			ret2 =3D -ETIME;
=20
 		if (aio_read_events(ctx, min_nr, nr, event, &ret) || ret2)
