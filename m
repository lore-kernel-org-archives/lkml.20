Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84A945D1B1;
	Tue, 29 Sep 2026 19:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790708739; cv=none; b=XaQppJyGaaXpg0fyWzg6cSBxYi6FCqxhSJ8scjvcm5R8Avy1Wq3vcrm8q3I4OHPfwYsy0qev+5ugG1788Z13O+VFlb7Qhcqz7N8W+ngWg/+YQFudf0kKTAMaqpxoGF/7vcLu+Lr0e31GxdUpKHmYpOhTG//ObqBnxFAjrxp22Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790708739; c=relaxed/simple;
	bh=9wmopXUliL8YINpbVk80JsYzMHW7p/y5ieG+XCItp6E=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=UltA/TNOc7HakHEoPsRkWzG1BHubvyKr8AJ4gR39EKqAP0RjP6+7isHgx6vc20iHvYC7370D7Vyj0eUaUS+IfBBZo6W2OA5eFZeVIfw2ll4v8P1vZNaA7bunbB1VHiRPd9rPC1rRMTlUO6AlsLBr0Oy8vK6FeaNGdDT2zM1OXEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ynycAJ8b; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=K6VMtPze; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ynycAJ8b";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="K6VMtPze"
Date: Tue, 29 Sep 2026 19:05:34 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790708736;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ViPsXVUs0HAlgDm5wZBY+vhLFnRBRxODFdDRnbvq8n8=;
	b=ynycAJ8bGbPhhtJ8Jg3bVHm7Q61F+ohQdQr2otf4SxhuEk4epxaVNfA7m7RG/Wr8RW1tnB
	J7AIWVLXb5y2eGhG/O48Tu8l2Giv/0rzVUD+i62Hckqrk5wcnC53AbUSjhOINR8jhDjfv0
	xd1cofcg8aJaszvy9QMQfvT4zPCjzk2NuC8dli+G4UZ8j+DXygzV7s/c6O25w61R7lcLmn
	UPwqm6EPzkn+H9VNWIHlBrstcske0o/3EOBxCCKeZRjb4eOJWpNhiDaOxY25LJJr9vUHgD
	i415fJWgTw+g3p9m9Ov37RUG+GIqs46Rw+97j7l8CYYohORajcjWzKD+T0ydSQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790708736;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ViPsXVUs0HAlgDm5wZBY+vhLFnRBRxODFdDRnbvq8n8=;
	b=K6VMtPzenZYS7OW1vdUONUIsN2Ytk/eglYU9SLOfvOO88fjAQrJKQa/UIg+cbgJZZvXxGl
	8+A+2gdI7rfCy9Cg==
From: "tip-bot2 for Paul E. McKenney" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: timers/core] net: pktgen: Use accessor for hrtimer_sleeper ->task field
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260919001428.3133388-7-paulmck@kernel.org>
References: <20260919001428.3133388-7-paulmck@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179070873482.3910103.12992480149295638269.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     3990d196954a06cf9fb1bb4efd142d57c30a8e21
Gitweb:        https://git.kernel.org/tip/3990d196954a06cf9fb1bb4efd142d57c30=
a8e21
Author:        Paul E. McKenney <paulmck@kernel.org>
AuthorDate:    Fri, 18 Sep 2026 17:14:23 -07:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Tue, 29 Sep 2026 21:02:52 +02:00

net: pktgen: Use accessor for hrtimer_sleeper ->task field

The hrtimer_sleeper structure's ->task field is used as a flag to indicate
that the associated hrtimer has expired.  This means that the hrtimer
handler can be storing to this field while other code is loading from it
to check for expiry.  Note that additional races appear for hrtimers that
can be restarted, which could be argued to be a user error.  However, that
is no reason to let the compiler introduce additional confusion, and to
this end, the hrtimer_sleeper_task_get() was introduced, use of which also
has the benefit of avoiding open-code access to hrtimer_sleeper innards.

Therefore, apply this accessor to the pktgen spin() function.

KCSAN located this issue.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20260919001428.3133388-7-paulmck@kernel.org
---
 net/core/pktgen.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/core/pktgen.c b/net/core/pktgen.c
index 7f81aed..784d839 100644
--- a/net/core/pktgen.c
+++ b/net/core/pktgen.c
@@ -2346,11 +2346,11 @@ static void spin(struct pktgen_dev *pkt_dev, ktime_t =
spin_until)
 			set_current_state(TASK_INTERRUPTIBLE);
 			hrtimer_sleeper_start_expires(&t, HRTIMER_MODE_ABS);
=20
-			if (likely(t.task))
+			if (likely(hrtimer_sleeper_task_get(&t)))
 				schedule();
=20
 			hrtimer_cancel(&t.timer);
-		} while (t.task && pkt_dev->running && !signal_pending(current));
+		} while (hrtimer_sleeper_task_get(&t) && pkt_dev->running && !signal_pendi=
ng(current));
 		__set_current_state(TASK_RUNNING);
 		end_time =3D ktime_get();
 	}
