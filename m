Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AE148822F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050891; cv=none; b=c24PsFdB7ZB8cHhcuQrILDQ1DoOhD80ZQLsNslk5zj/62FNXSD8Yd+8mFP/gnDbc2miAIf6lgWPR5imaJGJKszPrcd9en0UjMRPTSsIBNhb5l5oSDU/vPdZU3ybmhz2rlXaGsCjnp9laQeeKD78sLZdgGpbV54keo98zdcSxCkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050891; c=relaxed/simple;
	bh=XoYviOluGOh0kAc7Ou8Iyf2cJk4TW8ChouuzVOQrax0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F1Oykj+mjudEoF5alAhadl/9IbZnfF7q1p9OHIul/CeEOvVP1521cQkTQOPMhjug3bU9AUdBXPExcKAmrfwbYpiykzAoYi/VDjRDnDsNEBgMMku6pshvgdSGnepmlUdZW6RMX7HXbf4YSpLvjvV4INTnTUWQmr0sqx/HLN0wdA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TK/FGm0T; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TK/FGm0T"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so56288635e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789050888; x=1789655688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qMHaNRwMVaU/4ShlWKS0ohcj5wLlVwszTrw60OyUR3Y=;
        b=TK/FGm0TnoxfuxAzK7Jk1eTyU4xZelpK/ASmseK2EUKUjgu7OR3+JoiyiuUsh0WBaP
         c1ztFDjYGBTFR3WjPX0+xFLZzi6+XqSuXtf7AdgqMff6AOysWeaaW8bSQke9zZ8p4x0r
         71aUtb7Zor029tilo/1ISFQFjY+q2hYIkaoZedEORm8Dq6DAc5UJf3ZfAKXyUgaunhYx
         U3KjqxQY/9lfZ8g1ib6/eFz1vKtaO2dyCNEkpnv0383GrL4RSb6KB1CE55TaKlN2Y9Ba
         bzegYyTL2ynnrcRi31TccqJn5dqBEcEjkv7Hs+rAyZnMb7S9AoquMMc3WAEkXFzXYsNM
         Gulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789050888; x=1789655688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qMHaNRwMVaU/4ShlWKS0ohcj5wLlVwszTrw60OyUR3Y=;
        b=cEs52PHNQDfnik0im+IW06Ox45rgW/OPuOONv1KKSL/MENtAPUDJZcftyk3RwuaSXb
         MlZBOifBxrGjz0Qa4/tD7KFYyVPIZJvhAZmRLMmocFm9CGIfuAJ5mO/r/zV5H7OF/lLc
         PcADfNME5EWgwQcy2h7Ug6g8oWkH3c5KHdCVQNpK9rzA4w1N7NG851aTpEVZupWUC4iL
         2BDkndCDhXz6Vpzm/m0A5lO2gkCylQGJ+R9a3/xeZmeAYGWNbKrHkQb9hx7fVKOxg5us
         suzfYG41/eOcb4r7zfyAYyL9p/OQ9hfZ7+upE0b0OoIRlH1o/F7ccKmfy7/IARWuodzS
         bwnw==
X-Gm-Message-State: AFuF++mHUcRmNZFy32+0yqZSdiTawUwmr7YTc+b774voQtddtoxiOxe5
	FchHyUg6VJbNc6aX0mcOsEpA593xG3asXnm+OhRHbsk6RTMEH0vn0/Sc
X-Gm-Gg: AYBFou331lOPPEWAi6ZGPO2dkQjZbM9MHFSnhawSgcAnlci+lRB67UXm5hBbW9VA4bF
	+GtpMrSSZ6hqXTQCZ+ht5HlWri4L4LQLRbSdm01KxXrtwstQHnqpz/LOxvweT4EvaOL6IJRH1A4
	wV39Qi/2YJG802VjDgn2cWePBtCzhg1wcqAYC9Antbyfak3P5YuBp4k5wRmHSFLfN32IfPv9DxA
	pZ37phceiLRysj2CLAV77dYWYmSM84RtmX1/xz+brrjb+Da4krWk0tDjSZsMrfCNJ4iYn3Ms2kA
	Od+qvwexM7QsdnzUSm7mm3RzddfBRhznYzqOMrE677GEsYG0LcUPQpRJun1NUY2niaJoFmlw1xF
	kNKTgeCRd6aq89cAac/VA4K6z3pqBfHQicbeCuinfxHomFQ7wi3fTJGy6ClaJ6ME9UPncspJu0y
	XZSM/B360HEYEwpt0HPeuWC9tzsHy1WGge/pwQZMIWV7+fazIL64GTfcumkpRfR+y7kaKy2SSkG
	7uiJFLuV88TMkeYinuFWHU=
X-Received: by 2002:a05:600c:1d0d:b0:49d:99c:3bd9 with SMTP id 5b1f17b1804b1-49d099c3fc9mr271461415e9.33.1789050887625;
        Thu, 10 Sep 2026 07:34:47 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.90.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d1fb02bffsm94977835e9.0.2026.09.10.07.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:34:47 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	Andrea Parri <parri.andrea@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] hrtimer: Use hard expiry when updating timers on the same base
Date: Thu, 10 Sep 2026 16:34:42 +0200
Message-ID: <20260910143442.2018-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rearming a queued timer with nonzero slack can leave the timerqueue out
of order. remove_and_enqueue_same_base() checks the new soft expiry
against its neighbours' hard expiries, then stores the new hard expiry
in the node without requeueing it.

For example, with A at 10 and B at 20, rearming A at 11 with slack 30
passes the neighbour check but leaves A's hard expiry of 41 before B's
20. The same function also caches the soft expiry in base->expires_next
when updating or inserting the first timer, giving next-event selection
an earlier deadline than the queue head's hard expiry.

Set the timer expiry before handling the queue. Use its stored hard
expiry for the in-place ordering check and both updates to
base->expires_next.

The early update is safe because remove_and_enqueue_same_base() runs
with base->cpu_base->lock held. The lock keeps the queue stable while
hrtimer_can_update_in_place() checks the new expiry against both
neighbours. If the check fails, timerqueue_linked_del() removes the node
without comparing expiry values before it is reinserted.

Fixes: eddffab8282e3 ("hrtimer: Keep track of first expiring timer per clock base")
Fixes: 343f2f4dc5425 ("hrtimer: Try to modify timers in place")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
Changes in v3:
- Explain why updating the expiry before handling the queue is safe, as
  requested by Thomas Gleixner.

Changes in v2:
- Set the timer expiry before handling the queue and use the resulting hard
  expiry for the in-place update check, as suggested by Peter Zijlstra.

v2: https://lore.kernel.org/r/20260909102749.7677-1-parri.andrea@gmail.com/
v1: https://lore.kernel.org/r/20260907211134.3854-1-parri.andrea@gmail.com/

 kernel/time/hrtimer.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index 530d61257b9a0..cbf1693c86b38 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -1263,13 +1263,23 @@ remove_and_enqueue_same_base(struct hrtimer *timer, struct hrtimer_clock_base *b
 {
 	bool was_first = false;
 
+	/*
+	 * Updating the sort key while @timer is queued can temporarily
+	 * make the tree inconsistent. This is safe under cpu_base->lock:
+	 * no other queue operation can observe that state.
+	 * hrtimer_can_update_in_place() either confirms that the new expiry
+	 * fits between the neighbours or timerqueue_linked_del() removes the
+	 * timer without consulting the expiry.
+	 */
+	hrtimer_set_expires_range_ns(timer, expires, delta_ns);
+	expires = hrtimer_get_expires(timer);
+
 	/* Remove it from the timer queue if active */
 	if (timer->is_queued) {
 		was_first = !timerqueue_linked_prev(&timer->node);
 
 		/* Try to update in place to avoid the de/enqueue dance */
 		if (hrtimer_can_update_in_place(timer, base, expires)) {
-			hrtimer_set_expires_range_ns(timer, expires, delta_ns);
 			trace_hrtimer_start(timer, mode, true);
 			if (was_first)
 				base->expires_next = expires;
@@ -1280,9 +1290,6 @@ remove_and_enqueue_same_base(struct hrtimer *timer, struct hrtimer_clock_base *b
 		timerqueue_linked_del(&base->active, &timer->node);
 	}
 
-	/* Set the new expiry time */
-	hrtimer_set_expires_range_ns(timer, expires, delta_ns);
-
 	debug_activate(timer, mode, timer->is_queued);
 	base->cpu_base->active_bases |= 1 << base->index;
 
-- 
2.53.0
