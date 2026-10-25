Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.189.121.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792922549;
	b=BTDF02bTkOdlI6W1MY1ipzxeWfFPZMO21e1yMe9APtfmtlOhqRlZ5/NB3HzHOWSfjQJd
	 Yc6/WBbQQ7aaZl6VOnQeBm63sS7i+x9ggiwG2M++6WMSUAyVp+0fcDCzTcmbz+1gScAAQ
	 jyZu7KYqczhxjoseF6LA6QFLYiuv/5WbcKDkc67jx9d8YiXt27R5mohH9nXKlUo15aYF1
	 2D66BMQhfoHjd5xzNiK/kkp6ZYXa+v9ZfDL6oyI/bTCazaVrA6SZososXAinZRb+oARWZ
	 dzEqZFoZYabY9sEy+xvAzEHIfUH8EYR9rsvRSav5/1/oeXe2te+TWK/vnZHONF9nRfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792922549;
	h=DMARC-Filter:From:DKIM-Signature:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=kvSkFaxAPpYhdiNlAHuz4d3umTmQ7fmdUrka5BfYdyY=;
	b=BXf3Z2yrLL5g5Ys9nX/DNHv9SQR9XIuiqhhbEScZThmic1U7+ZSo3Y7KwSA6w2xaVOKI
	 2d5rAKcAvpOLoKZY6Dki9068a+cPs5D6WUaH4UwMfvb4QRJqaVODkcnhtkZFELc1RbYMQ
	 73ILGB/EsMx5TACnFn03ZVPvMOQmTVrn7jtkFPKIMN5j7wF7luu8zDtKw8BsNbMLg45EV
	 QIbLxo5sXiRMYkviTy1vqsRC+tOUVjyUJNYvrl79/qkRBMGLmfXE9tgZwLQ0zsRSILRrL
	 kq+k/lVgyUnG0unBwbuBxMVpkvcLM4yN01kavwftWVP1ohgpKZxDEc0FdxO8f4Umabw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=itx.no;
	spf=pass smtp.mailfrom=itx.no;
	dkim=pass header.d=itx.no header.i=@itx.no header.a=rsa-sha256 header.s=mx.itx.no header.b=IXjL9e7g;
	arc=none smtp.remote-ip=91.189.121.228
Received: from mx.itxnorge.no (itx-kvm-14.itxnorge.no [91.189.121.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE53606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 10:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EE53606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=itx.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=itx.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=itx.no header.i=@itx.no header.a=rsa-sha256 header.s=mx.itx.no header.b=IXjL9e7g
From: Stian Halseth <stian@itx.no>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=itx.no; s=mx.itx.no;
	t=1792922546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kvSkFaxAPpYhdiNlAHuz4d3umTmQ7fmdUrka5BfYdyY=;
	b=IXjL9e7g31pHbH9WsPrz5Oe9/VdSt5KkOofLgYPfMmEuG1wEMhsiUFlMehd1xQpqJI0gIp
	odyYxO7sUSDZFijXH4lnKXY5i9eG1Q1ZWEP/ra0BlxPP7rUqm286freikrReECaBuLsIQa
	DIatAP1WFU1vdG2v9YiFbU3pauPanDw=
To: Frederic Weisbecker <frederic@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sched/cputime: Don't warn when the tick period starts after idle exit
Date: Sun, 25 Oct 2026 11:02:02 +0100
Message-ID: <20261025100202.2584654-1-stian@itx.no>
In-Reply-To: <bfe9b14a-6e65-41c5-b638-26f6e033788b@molgen.mpg.de>
References: <bfe9b14a-6e65-41c5-b638-26f6e033788b@molgen.mpg.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kcpustat_dyntick_stop() warns if idle ends before the current tick
period has started. It fired once during boot on a Dell XPS 13, in
CPU 0's first idle period, right after the switch from refined-jiffies
to tsc-early.

That can happen. The clocksource switch continues ktime from the last
jiffies update, so ktime falls behind the tick by up to a tick, and the
sched timer that NOHZ arms next on tick_next_period can expire more
than a tick after now. In a KVM guest it was 1.5 ticks ahead after a
switch from jiffies to hpet. An idle period that stops the tick and
exits before it fires then sees ts->last_tick - TICK_NSEC after now.

The tick restart keeps ts->last_tick in that case, so the first tick
covers a period after the idle exit and nothing overlaps, which the
code already handles. Drop the warning.

Fixes: 96a494c9cfd8 ("sched/cputime: Don't account idle time twice after dyntick-idle")
Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
Closes: https://lore.kernel.org/all/bfe9b14a-6e65-41c5-b638-26f6e033788b@molgen.mpg.de/
Signed-off-by: Stian Halseth <stian@itx.no>
---
I could not hit the window in a KVM guest, but instrumented, the guest
showed the sched timer armed 5.9 ms after now at HZ=250 right after a
jiffies -> hpet switch, and tick stops saving a ts->last_tick more than
a tick ahead. The fix boots without warnings there.

 kernel/sched/cputime.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
index 9e0fb8633d823..17f3cbd5d403a 100644
--- a/kernel/sched/cputime.c
+++ b/kernel/sched/cputime.c
@@ -478,7 +478,12 @@ void kcpustat_dyntick_stop(u64 now, u64 tick_start)
 			kc->idle_tick_overlap = 0;
 		}
 		tick_start = max(tick_start, kc->idle_dyntick_entry);
-		if (!WARN_ON_ONCE(now < tick_start))
+		/*
+		 * After a switch from the jiffies clocksource the tick can be
+		 * armed more than a tick ahead, so the period may not have
+		 * started yet.
+		 */
+		if (now > tick_start)
 			kc->idle_tick_overlap += now - tick_start;
 		kcpustat_idle_stop(kc, now);
 		kc->idle_dyntick = false;
-- 
2.43.0

