Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794256640;
	b=pHSJCsNmcB8yLLG1Waprl/xhB85Mb40X/CSBuueVbJa8ulnkzA/BvWc5k8rIkbjVaXGK
	 lZayp6KCDhJmpcdzjrxTUMFr6RweOrv8RmjbQp8/KhdovEnM7kn3a+DjHGGXogVeMhjhQ
	 2UAczfpsFaMiJWW8peGbjUO5WPyoJzbGl3mQatoiP4WmPLb2RdnH9y2wblNXGN9xBB9Am
	 TwvEqCHRcsjy8U848fdGGNB2c5deDRnn0Ftim854BwHunxZvJ7DwkE6S1cE9SbAyqfCCV
	 PGf4vsNeRIqSDOc8JGHtRSlGbkA/lDJ/j/27BQtmaZ5nvNkXTDadsz5bWD9NQNNqP7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794256640;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=qvOtAbv0QfyHUrDp1aq48tDo8bWXkNREmKBOalVwHmc=;
	b=k3RwcBBbsoA7TaTnVhHpE/ngfZqLtxdfGmc15hTmQkYyt0ezwquc/AiG8wTvF2Z6C7IV
	 SR2vWNk2D0SkF66CZA1D1jgF9gl8eIPLOMuw++ckRvJdBQq0pVvrEiCUWkAie89nJfNi2
	 lmlhdyiaczq5iUZXpS+iyh6rDfqMWGmacrt1OvC1kN5/2OF99LUkAogqy75Gy5rO7sELE
	 xYg0hyXeB3ixrE4twTWhLsr2pglsnBqZ545D1VRb/nHBcI/lqTNxR64E6saY48Qm0fjKS
	 ueOvugWIi7nQ5+EZpTvI47FhtVhFVCt2CB6VhUqoCbtI1hiip3IbWFSpj3b84i+dWCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ypGfgrIf;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="aRMS/gtd";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350CE606A31C;
	Mon,  9 Nov 2026 20:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 350CE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ypGfgrIf;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=aRMS/gtd
Date: Mon, 09 Nov 2026 20:37:15 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794256637;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qvOtAbv0QfyHUrDp1aq48tDo8bWXkNREmKBOalVwHmc=;
	b=ypGfgrIfW2JEl+gjsUiNyoHGTXmdotDRl60dKZ8iVJrJnvfkoUjBS3igJigVCrd3yODWzX
	InGkEUOvFI5OzvjJek+HgxJXZpZCAvBrn/mP8tD49gDdxrTUZ7eEEeksYjD+VYfYGFYF+e
	ePdTp5GEBt+Q98NzzZpLdN9l/EHw8PY/6IFOxPCJCrdXk76d8Jxj1YznMoKocN4zRqnHs/
	43vnQAzqcaBQ0ShR+lme88C1S4ow48Nf3RQa5EILzZmlhUL7PUifywZTNAuo6FwkTQvW4M
	YfdY63VmHtD2GoKvaAcx47/NCBkoOlYSdiewD0EgR2rlNuozoTrbd7cjA7fQ+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794256637;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qvOtAbv0QfyHUrDp1aq48tDo8bWXkNREmKBOalVwHmc=;
	b=aRMS/gtdyNfScsPrAFVsDvdcHoYJ7lhU3GrkKdQFHJxUCjdc3rXwUUFNnPJp2Vh47xcbis
	nCGRJOp/omsD6kDQ==
From: "tip-bot2 for Avi Weiss" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/core] alarmtimer: Trace the requested expiry when
 starting an alarm
Cc: Avi Weiss <thnkslprpt@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261101192401.858702-2-thnkslprpt@gmail.com>
References: <20261101192401.858702-2-thnkslprpt@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179425663587.2093942.7486072361332355619.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     0359ecff58853a491dd0f09792fea8e87235ae06
Gitweb:        https://git.kernel.org/tip/0359ecff58853a491dd0f09792fea8e8723=
5ae06
Author:        Avi Weiss <thnkslprpt@gmail.com>
AuthorDate:    Sun, 01 Nov 2026 21:24:02 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 09 Nov 2026 21:31:47 +01:00

alarmtimer: Trace the requested expiry when starting an alarm

alarm_start_timer() traces alarm->node.expires before updating it,
so alarmtimer_start reports the previous deadline on rearm.

Move the tracepoint after assigning the new expiry time.

Fixes: 183d00b72713 ("alarmtimer: Provide alarm_start_timer()")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20261101192401.858702-2-thnkslprpt@gmail.com
---
 kernel/time/alarmtimer.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/time/alarmtimer.c b/kernel/time/alarmtimer.c
index 33c35f1..ecf8c89 100644
--- a/kernel/time/alarmtimer.c
+++ b/kernel/time/alarmtimer.c
@@ -344,10 +344,9 @@ bool alarm_start_timer(struct alarm *alarm, ktime_t expi=
res, bool relative)
 	if (relative)
 		expires =3D ktime_add_safe(expires, base->get_ktime());
=20
-	trace_alarmtimer_start(alarm, base->get_ktime());
-
 	guard(spinlock_irqsave)(&base->lock);
 	alarm->node.expires =3D expires;
+	trace_alarmtimer_start(alarm, base->get_ktime());
 	alarmtimer_enqueue(base, alarm);
 	if (!hrtimer_start_range_ns_user(&alarm->timer, expires, 0, HRTIMER_MODE_AB=
S)) {
 		alarmtimer_dequeue(base, alarm);
