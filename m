Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792964844;
	b=wpexFOMdNzvRHN3GSaq9svKUUaYodWBtPZR+Wr2Bp4+ElOlbh7F4Cj/CDQADMvjRtXKn
	 myHMPo9gAp4t8WSP4Tgjkaztw7JvDJKKVQ6AF4DQhewhbrp+a2TZ7JZwIspIiAs7+pQvv
	 tlTSfKWjEdZgQUC6FuyyDF1llxsxymVob4KZ3dlSJLWfgyvsx1BswbhIwEi95mlhgTbaR
	 FK5xW1oaJ1XsfitwDlNgEnzaeVDUauyV2jlGqe82oFpyszprsfW0Ra0o8R0YsUgwpw7MI
	 AYPT8+rgs+braDcO00FGlkfI4PZjlMd3ENZJZOlKSbmLjT7VYreri4voVRrezJFAc8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792964844;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=JfDWXsCEAJFPhuJkXSGgQSfwM5n5EYodl5oyNokVT7s=;
	b=cmfU+Kx1ZRR0R7egQjcQ958UsFzsks0ZEkP8dU6CC9DxpQ4eUJkoTPJyyyWW65CvBIew
	 qiNox3HRUnOyDmtXc7TWfHfd0ImnQYFUVq2YawLPxbJqY/2n/z8iO2NT7WxzNCQRFyz5j
	 PxY4UqIZmHv1Rtads6y/LnccX1cZolQQDyBu+BFhUrC2DSOUgYv6qHycTjLz7pw+gr6/y
	 GbUiKc3K80AIS+XqHVucs2s2onTC3XiDLSPJnYYtwB/gKARpTo9iGxAdtvj6dFwom7cU4
	 CVwxizJ8f7/YrrfD6cOaWP8bCGXZUr5HgjthtfRZDv2QIl8SXK0LLI112edGXibrdcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=OaCnGcxa;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=TrlGPf7y;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65857606A335;
	Sun, 25 Oct 2026 21:47:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65857606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=OaCnGcxa;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=TrlGPf7y
Date: Sun, 25 Oct 2026 21:47:19 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792964841;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JfDWXsCEAJFPhuJkXSGgQSfwM5n5EYodl5oyNokVT7s=;
	b=OaCnGcxalwpr4hQ05B4feUybYtXTHqjWZik6uWD0mQhJ+/JBHl7TjTeQsu3vYumwFf3vp3
	Vx9tHGcpvrx+c8a5Svd7L1AaDKuwpwDqthh1/GkkowVjEf+Yv63vk1YP73U8/yM1thpF8L
	rSwZ8YQ6Vghrc4PoWNL4KvrDj08f19tcFNWbhsUWNYGD652JRzCUsiUy6LYmC8A4/sk+jO
	Pvwe0/TCebfHX0YT2ueUwExBmRyR+PzIOHUCjGCn70cbkkplJa7Y5NZaDgrKOxhIqw/gUc
	J2qWAd/whQapTq/Go0Un0dmhj+OgFOA40fi9jj/1cHn3XjtWbK2uw3HoljpVbQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792964841;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JfDWXsCEAJFPhuJkXSGgQSfwM5n5EYodl5oyNokVT7s=;
	b=TrlGPf7yWrC/z0lrCh8QFpM0WxVWwOjBJXCJND56D+ic8SznOA4VZYWokOA1lG4FGSiFKw
	XDZyc3B/IKKIGQBQ==
From: "tip-bot2 for Hui Su" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/urgent] sched/idle: Use hrtimer cleanup class in
 play_idle_precise()
Cc: Hui Su <sh_def@163.com>, Thomas Gleixner <tglx@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To:
 <eccd97b2003a16291817974798cbe98b25b582a0.1792083743.git.sh_def@163.com>
References:
 <eccd97b2003a16291817974798cbe98b25b582a0.1792083743.git.sh_def@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179296483981.4109677.4627894100325642362.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/urgent branch of tip:

Commit-ID:     bd091346971c88fccd44afd2547d28366f824572
Gitweb:        https://git.kernel.org/tip/bd091346971c88fccd44afd2547d28366f8=
24572
Author:        Hui Su <sh_def@163.com>
AuthorDate:    Fri, 16 Oct 2026 10:09:44 +09:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Sun, 25 Oct 2026 22:43:19 +01:00

sched/idle: Use hrtimer cleanup class in play_idle_precise()

Pair on-stack setup with destruction using the hrtimer_on_stack cleanup
class in play_idle_precise().

Keep the cleanup object's scope around timer start and the idle wait. Start
the timer in pinned hard mode, so its callback runs as a hardirq on the
current CPU. The interrupted task observes it.done only after the callback
returns. Since the callback returns HRTIMER_NORESTART, the timer is not
requeued before the cleanup object tears down its on-stack debug object.

Fixes: c1de45ca831a ("sched/idle: Add support for tasks that inject idle")
Signed-off-by: Hui Su <sh_def@163.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/eccd97b2003a16291817974798cbe98b25b582a0.17920=
83743.git.sh_def@163.com
---
 kernel/sched/idle.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index eb73b65..2880e01 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -429,13 +429,17 @@ void play_idle_precise(u64 duration_ns, u64 latency_ns)
 	cpuidle_use_deepest_state(latency_ns);
=20
 	it.done =3D 0;
-	hrtimer_setup_on_stack(&it.timer, idle_inject_timer_fn, CLOCK_MONOTONIC,
-			       HRTIMER_MODE_REL_HARD);
-	hrtimer_start(&it.timer, ns_to_ktime(duration_ns),
-		      HRTIMER_MODE_REL_PINNED_HARD);
+	{
+		CLASS(hrtimer_on_stack, timer)(&it.timer, idle_inject_timer_fn,
+					       CLOCK_MONOTONIC,
+					       HRTIMER_MODE_REL_HARD);
=20
-	while (!READ_ONCE(it.done))
-		do_idle();
+		hrtimer_start(timer, ns_to_ktime(duration_ns),
+			      HRTIMER_MODE_REL_PINNED_HARD);
+
+		while (!READ_ONCE(it.done))
+			do_idle();
+	}
=20
 	cpuidle_use_deepest_state(0);
 	current->flags &=3D ~PF_IDLE;
