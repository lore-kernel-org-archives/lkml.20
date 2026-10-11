Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5292D781B
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 05:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791695996; cv=none; b=mUMMwCOVE05cFl3lH6P0ODPqX812LC5G8bBQL4XyAYOkaoROD8odDe3rvuH5Syb3UAxfKIIXMz/j1YPNiCV2/O5GGFpjnyI83OL93DDOg6mFXql2lJ7vVWpx0dCA7aRAXiqB5r9HknMO1llr8Ww7bnuFRrZp4FzybSUmYVtKNZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791695996; c=relaxed/simple;
	bh=tG89sWYyAbOnaq6ywWnvzI8gk/YxHYUmNEMgUrfR6BM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FxN+8xbG9hnHWS8p1jGwTaz+XITXN8BQmuKFYXojgy5ts3hNBFH4LWYmduKmF1vs7BI5YPq+n43adQLZYQHsoTOonL8u8rVLrqLE2m/9jl/iuGokgEMSihmo0PnQWKIvtaBubO5YTQv/gPx51KN2rTuSqxSVDFn/KDl7DZI1u0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UFFk2P7J; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UFFk2P7J"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-141395927feso1659022c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 22:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791695994; x=1792300794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rjWHSnWSNtYL8KmLIAR/JgMym2NLB8gm5KijyHaQy+o=;
        b=UFFk2P7JVP1IOcxUlYKw8b2Lg89vGQL5oU0gdSgpyRshFee0foEZzfTPwAYWxvN6S0
         dedAF3qLWl5NoNqusgyHTNiu3VlyAi14VlGSW9uaTu0Zqt4B+hP8HjKKOUVsbXx8YcYW
         YIpqbP58QEaurW7PqL3ihRlABWzpEu6o3A0CdEU0xgfV+30FZOYTYikhFOVAGb9fAi8H
         j8qpYQ8/PQ6bP7tlcHSOe3jBf8ob/aSn2WbPfHWlAmGhNE0TKJNXIraZKilvI31c3mg3
         kUbJX5rFHmnGIIRdi2Y2s9NdRyaiCqxl7RNOIJAZvUoyrlzr9NVhsLoxLjgFwB+SQmCj
         OK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791695994; x=1792300794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rjWHSnWSNtYL8KmLIAR/JgMym2NLB8gm5KijyHaQy+o=;
        b=LHVejQqAmdnNhDuY8Q2rtoZnCyuv0QbfZKja+UPMNCdYiwrwNr5o6RMjkaRXgvXJkr
         eSLqWJ+9tfeGhGjHyevel/3hPFKxVkfrmXt4Gbs5jJMQbd8UjckrGcREqQqAeT8MZUtR
         AYoFkG6pLvt462aJIE13brC+Cy2ikHYDNK4kuQSx9ReN44nXcShVbeYkmKlKTXVaoF9v
         5G+Yo1asvjb8r699PSsBmaPPErqkYpDX2yi1+Wzp59Fr1FeUKcSf7vy83nLAbAC/SV24
         0ml6kcIpQgw/0x2p9LnJKFSzkiBi5E2GXmru7SL6kLowqwBPT8SxWzrD8Mc3rpgBFEZ9
         3cGg==
X-Forwarded-Encrypted: i=1; AKwUvBzjeq2uYQ9rnvKkubYkyMdg/MCen3buAekKMBo0dNEUM9AJb1Xv9/yf07iKDolhy0OY1TVhyPLLuWCCtho=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRXqxpFB9BRUG5LrF4GL9Jz9Fipdc3MIy+qUD3+4+Y3RkucHrI
	eirdy44UwcrnoL9VQA6z2UJ1DEwSLUrb64IfEe/dKSOY81Wk4UuvlSNf
X-Gm-Gg: AYBFou1XjNPRwLhQZbh5bYCOyXkV0AXtBaDBok2Jd6pRJNmjv+qo9yfe3vVsfW2IAlI
	XJuW0SNZAd8OzjuPnuF/dBSaaAIbG8DW7tE9Fdm6NKuAYQTUj2E4gGaE5t8RRKcgF7lMGPvJfjj
	obm6BRWIt8cBMuHoIMjx9dRK7Unh5eIBadyveGwVBUCN8IoknGzId19Oh8u06caohogP3iK9i+F
	vciZumpERhysMhZ7oHr8h+RDV1dbVtnes7pRB4J1c3yewsPZI6NTJewNb92YG8Tvfg/WddowdCG
	TKQ7ygZxbpWSnMMNgwQ4+u2aoqROZ30l8PNzFYYDg6EIB8Cs4UQLFX3eUmakAnCfvURiSTbxbQP
	b1OB1a5Kz/PespJGyavTQ3+vVuDtVh24ptUe8dr/80+tbNGp8zL2KnQPjiBU3n/o83NIQNDBgM5
	8nIVMq18MCN10Xjr3fr8q6FWnWzCXbJLx2wmU9URzPnMjQfEX/TQRKZbb+Q/ZeSUSE5y70JXOms
	YGbO1x5z8+MMk89JIbJxK9Dkoc/OQAJe/SVBQTXQZZ387mxGc6SlSKFVLLh385SjdVFl6Di5O6e
	mNsk2rQ9fLLnvYawHZqkBan7oXUPaYNtqpsRHdQLnmMAEf2RIqWbEmd3zof0GkhNLMd9GLjrZN8
	g6/hcGyfaYAj/1WM3hCWZ9kx6tYNY3reV0O7WtlHX+NPzPmaGJQLkZ5M=
X-Received: by 2002:a05:7022:b058:20b0:166:37d2:3b72 with SMTP id a92af1059eb24-16a5fc9170cmr8838969c88.27.1791695993887;
        Sat, 10 Oct 2026 22:19:53 -0700 (PDT)
Received: from FT6N242TWK ([223.181.119.248])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becf08sm20673698c88.5.2026.10.10.22.19.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 22:19:53 -0700 (PDT)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	John Stultz <jstultz@google.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Todd Poynor <toddpoynor@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 1/3] alarmtimer: Reset the expiry time in alarm_init()
Date: Sun, 11 Oct 2026 10:49:41 +0530
Message-ID: <20261011051943.60520-2-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261011051943.60520-1-jain.sm@gmail.com>
References: <20261011051943.60520-1-jain.sm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

timerfd_gettime() on a CLOCK_REALTIME_ALARM or CLOCK_BOOTTIME_ALARM
timerfd keeps reporting the remaining time of the previous setting
after the timer has been disarmed:

	struct itimerspec arm = { .it_value.tv_sec = 100 };
	struct itimerspec disarm = { }, cur;

	fd = timerfd_create(CLOCK_BOOTTIME_ALARM, 0);
	timerfd_settime(fd, 0, &arm, NULL);
	timerfd_settime(fd, 0, &disarm, NULL);
	timerfd_gettime(fd, &cur);

leaves 99.99... seconds in cur.it_value, and the value counts down
until the old expiry time has passed. The same value is returned as
old_value by the next timerfd_settime() and shown as it_value in
/proc/<pid>/fdinfo/<fd>. A zero it_value is how timerfd_gettime()
tells user space that a timer is disarmed, and the timerfds on the
hrtimer based clocks report zero here.

timerfd_setup() initializes the timer again on every
timerfd_settime(). For the hrtimer based clocks hrtimer_setup() clears
the expiry time, so timerfd_get_remaining() finds an expiry time in
the past for a disarmed timer and returns 0. alarm_init() does not
touch alarm->node.expires, timerqueue_init() only clears the rbtree
node, and alarm_expires_remaining() computes the remaining time from
the expiry time of the previous setting.

Reset the expiry time in alarm_init(), like hrtimer_setup() does for
a hrtimer. The other callers of alarm_init() start the alarm, which
sets the expiry time, before anything reads it.

Tested in qemu with a program doing the above for both alarm clocks
(the VM has an RTC, which timerfd does not need for these clocks):
it_value, old_value and fdinfo are zero after the disarm with this
change.

Fixes: 11ffa9d6065f ("timerfd: Add alarm timers")
Assisted-by: LLM
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
---
Prepared with Claude Code (Anthropic), model Claude Opus 5.5
(claude-opus-5-5).

 kernel/time/alarmtimer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/time/alarmtimer.c b/kernel/time/alarmtimer.c
index ea5be5870e..d6dc6e8272 100644
--- a/kernel/time/alarmtimer.c
+++ b/kernel/time/alarmtimer.c
@@ -316,6 +316,7 @@ __alarm_init(struct alarm *alarm, enum alarmtimer_type type,
 	     void (*function)(struct alarm *, ktime_t))
 {
 	timerqueue_init(&alarm->node);
+	alarm->node.expires = 0;
 	alarm->function = function;
 	alarm->type = type;
 	alarm->state = ALARMTIMER_STATE_INACTIVE;
-- 
2.43.0

