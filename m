Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794254012;
	b=mjArpN8qwar9xGcPkKAwlHM93VRRZ+2K1OqRYrKEoQZAwBDZz55XcQY1TpPr+vTHYhGx
	 7HviPBrM6tIPUs6N722GhRC+j/BthoO8Fwk+B4IYeDBEQoWnLPqfMIaPGipdZ0S//0hn3
	 kk4ecez7CylZ7oN7NOrjaLVBdoO28ZfYCwrmrWiKJzIfc0Q1LFWBKC+4bqPgnh2vRglp3
	 Y56yF6S7++mmsxZIbxDd4pFJ70LdAv7qZZ6m7c4PGaGD7l7FBaisSQIOWq6V9SZ+Kkfse
	 ixoeX70eqFaGa2uYLVvM7PQt5VC1FxFVcu16TuiUN4aVduBF78h9tgl6nniqO3yuTEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254012;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=hjj/EMzuTmKp06neVP6zlhf+ebbxBLmzqzLv4Sh8BCo=;
	b=gdwxf//1TJ9eu7uqz32ne0MfqUfrW+AB1sYLuhr/maXC4OIERkyt13M/ughV3eQDtEbL
	 lwEOz98lYHluoheSFuzaKhKKTIT2DeVkJ+0eV4rZhwlEM77AHr86V9L6HJtF2+xWjMLbd
	 cuexwaylZ2YlGq2iXhDCTbE09C3JqKL+F6yClXz19Qgh7+l+aOh6bMcOD2IZt8SPzU6eM
	 JqGR1vgoqT7VrhcrDSRZSKx7p2MyC46frkjcg8etKnwR7G70Ok8/be0am1+iqru4VVafn
	 giEiwe4r8xsMULd79tUoQEVxHuXS8fhuEB8IJ8dMD8Qi/hK4QLTl5yYGOyEiIh/tlTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=PMTDnAwl;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=I21p2Mxq;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF4B60A260B;
	Mon,  9 Nov 2026 19:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BF4B60A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=PMTDnAwl;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=I21p2Mxq
Date: Mon, 09 Nov 2026 19:53:24 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794254005;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hjj/EMzuTmKp06neVP6zlhf+ebbxBLmzqzLv4Sh8BCo=;
	b=PMTDnAwl2ZjgRoKTdhx+0dXiVLJgxL6AOJs+4RtSPHSvpG3xLWMGlBRuaqZZMjPFk0clQY
	t/WPorZpgkSf53YeyeXSN7CKmhjb3kodI/QrFaUFrBjLxnzoKokIjTvbXKmQU7G6cUN6/0
	yGYF5moYQCob7YhHBAjQ3WDgjgoAeC6sSHZKLcmes43sNVIqDWxPXed4DzgWiohzT6Mu/z
	hYGQh0femjmwgP0hpslvP1i51YIPjwoTd04v1fHPbCgeDp0KN3e93eOnzufZcrmiRAF5QP
	xvxkYmRQXHxkXP14zU+x44z7H95Ioxbzf+6stvEsSPcerm/3ehgKjbHBOV8jVA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794254005;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hjj/EMzuTmKp06neVP6zlhf+ebbxBLmzqzLv4Sh8BCo=;
	b=I21p2MxqNtx7fkvZeTJio0aT/Bho2K/4R9xrxkOZm4aq1wnMH2eqDmmLMy1KVwf5m6mjn0
	JdnbAZzsgoCtqkAg==
From: "tip-bot2 for Avi Weiss" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/core] hrtimer: Refresh softirq deadline after clock
 changes in low-res mode
Cc: Avi Weiss <thnkslprpt@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261101172344.426489-1-thnkslprpt@gmail.com>
References: <20261101172344.426489-1-thnkslprpt@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179425400414.2093942.2996330616399718402.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     84a9b8de48d91d2624474360911f6bf71bf7d77e
Gitweb:        https://git.kernel.org/tip/84a9b8de48d91d2624474360911f6bf71bf=
7d77e
Author:        Avi Weiss <thnkslprpt@gmail.com>
AuthorDate:    Sun, 01 Nov 2026 19:23:44 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 09 Nov 2026 20:50:03 +01:00

hrtimer: Refresh softirq deadline after clock changes in low-res mode

In periodic low-resolution mode, hrtimer_run_queues() updates the clock
base offsets at each tick but does not refresh softirq_expires_next.
When CLOCK_REALTIME is moved forward, an expired soft hrtimer can
therefore remain pending until the old monotonic deadline is reached.

Reevaluate the next expiry when hrtimer_update_base() observes a new
clock-was-set sequence, before checking whether to raise HRTIMER_SOFTIRQ.

Fixes: 5da70160462e ("hrtimer: Implement support for softirq based hrtimers")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
Link: https://patch.msgid.link/20261101172344.426489-1-thnkslprpt@gmail.com
---
 kernel/time/hrtimer.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index 6d7a0d8..d48ffa4 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -2293,6 +2293,7 @@ void hrtimer_run_queues(void)
 	struct hrtimer_cpu_base *cpu_base =3D this_cpu_ptr(&hrtimer_bases);
 	unsigned long flags;
 	ktime_t now;
+	unsigned int seq;
=20
 	if (hrtimer_hres_active(cpu_base))
 		return;
@@ -2310,7 +2311,10 @@ void hrtimer_run_queues(void)
 	}
=20
 	raw_spin_lock_irqsave(&cpu_base->lock, flags);
+	seq =3D cpu_base->clock_was_set_seq;
 	now =3D hrtimer_update_base(cpu_base);
+	if (seq !=3D cpu_base->clock_was_set_seq)
+		hrtimer_update_next_event(cpu_base);
=20
 	if (!ktime_before(now, cpu_base->softirq_expires_next)) {
 		cpu_base->softirq_expires_next =3D KTIME_MAX;
