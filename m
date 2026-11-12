Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501510;
	b=luuE4ZFvtfu/ixT/TcbgjO4ARvDsrJ1XQ7c7vIpdqnXm1jFqjoGzMsDk4ZXqmTcAa6if
	 PbB8B1rA9p69QDWim/MA1hXeGPIFBfxtlFYYPmnok2y7GPmrnn1KhvS6KMluepVWD0oBo
	 l4XwpLIBiNXSULwuTx22J5btI4ad4u3V4+OCwXRCC94dPrH4HwE1z70n2jqFU/8hTyk+W
	 /lG1VG33vYtxgyupfGIEez+o8bOwSsTRtf/n7y9EfvS+8PjZDggLWuLglsGsgmWEzPa6N
	 h6GixhPIV1FQLJrc4vH0G1pJOxaJu7NJf3j2oEuNPx+vz/M0r3GULtwvN8WbSytBjKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HL8L4IpUvUUPTtG27BG7kHSmyHJUUDovtBAsyYb2BDU=;
	b=5dYdweBesmqun2yzk4oqrbQU5fSBt1b/i1H5i3yj3C+Up0r97nxaUZhxkYLV/4yTMxHF
	 yqxJ8dz1leW7K6sQR2HHk4rZlNaJ94ySqVonMUQq0npnolzFLy/Yt1ifsfgBPSDDFPp/r
	 IQj75PJ0RCS51pRxchEjvLTW8A7tFGLG9MUkCUJBEDOKCQg1NnGT7WyePgdcgBDR0xjx4
	 ZUWf7aZA68f2pP0lNmdvDyJWsuusSk3m6gReqYn0o8YYv9eGFqpWsfOe82I+gxMCTlegV
	 lxPgxYWQl0f8iptd+t1/rTGn0ZCHbWkpiMF2IoXd/be/3mK2YqyGLKyHVtOLUcR6e/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Wr10mOdd;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4849C606A8B2
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:38:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4849C606A8B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Wr10mOdd
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so152085e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794501509; x=1795106309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HL8L4IpUvUUPTtG27BG7kHSmyHJUUDovtBAsyYb2BDU=;
        b=Wr10mOddlfa/pzhq4PfzcmPk3F38hvDn0shkyN1ZzixzDDSXZORBoW5bD89ZjC1zB3
         vYs3GTWkMCrenY0ddpVxqlKEZZd5PS+Ou7xj3m17vVWb+PHcfBtouUunCVqhgxbzUUw3
         8DL9IIdldtPwhvX9XsuORbitXDNGmPbE3VUK6JO4ymoi97szlEkBCQRQg3cZejqvOpXC
         YJj47AlZU+HWJyc1o0Xdtl93n3sJZWx11pQVq87LjAefe86E59RQoT2RB19mD5pANWqS
         UZkAFYBMLQq8q9/vD1XKOR3MnjVdhkYooqmCH1W0L9hIkcuvW5RE9n5+ixcOihgMwnVM
         SuSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501509; x=1795106309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HL8L4IpUvUUPTtG27BG7kHSmyHJUUDovtBAsyYb2BDU=;
        b=bQVU0AE0RPhbSiI6VNaxf+xYPhasWO8WNxhIq6E/AcT7IYsDlCdJ0O+BNImZOZD+2y
         25bdt4sK8+5vZMFqbgUwivOOaqBsZOO/q7J9nT3bVRe/Dy1AQOiMOcT5JSezO89atJy5
         tEwQ47ZHn4+STEWYj+cy+YxLg9g04+jWpIidO0rpPzkrAz2e0UeHJqz7+yqDXmUlKx1+
         B8D+Nmua1vyzNMPQKCX+IQfCNwuuidh9mnDaoYWc3yzKSQVXwrKqihhGlW7XpYNOKcmL
         eDbWX+msTXtHg0nUZp+ge+pkKffD0DUvQF89zwIEzEVayPatVGbK9X4ZPMZR2paV1XGk
         rKIQ==
X-Gm-Message-State: APuU4Z8VrAG5N0j1zUrUxI96mIfMV0dDzpylqk8OUfKb7UlRvp4K32pA
	ZEbePxP+GeDqPbkpHGR4R/EroZdOdHaWatJw2IVGjnrGnVPLyh7ooCwDJkK4ECJ2Bt1AgFL7+Gv
	2QDJRyMY=
X-Gm-Gg: AYBFou2j5ekBFTyAQZH02zqcwvSh9TC7CL4SxtrR4MJFZL4vuUDa2CmBPL0HBTLFb0V
	wavioUAOYbb61/R+c/3GceNLYpHwpFK435SxrZTtoQZtGWWL9Es6pgtwtNMUwkxmYsUdWSNu8Uk
	GSQbbLEIc9pDrVCHW5S47MQcT6VeK3FAphxf+spWBmNGJRAQpoaBR5bdDM6ztmeYHMT41VAzx0A
	fzkUKo9JQ7DyRMvzLPeLbLiMgV10GmGJSNm0pgXm8vgBJ4gZQsVO0gHiJ8Yk2J9u3sWhCqWRHtm
	vSpGlflXKnE1Ev32SJhUQ9DK8yzj3mGCCy6v+/ewqYx5Y+VcWrKcu6wAvN/lEveqLaa0nxsp83U
	uhdlKwwXLCTUtLy4HC58iCCwQMN/2RJrNgThkElkclaRtzMbq6GdqOQ7o7l1kAFRzHx8+rWeJn1
	SC+UsKxlkClyKwxNe5IQwL4UWGy51GjnLZHouaW4z8PSmVUaRENTMvVTgzd2EK6GkrGyI7RURoW
	Q5pR1/PNlS4HtNEF/I1GcYjkXq78lNxU1j7jtmnEneqoyq+cy0A1GJADCC+k3dxvR3xYf1OiTn0
	Enf7jx6H8FCubQspfMY1Tj4FFGLS4N+pKxEPZrzLIKIBt8GVvdhPbVydd/WgZCqbmA==
X-Received: by 2002:a05:600c:b86:b0:4a3:2f35:38b4 with SMTP id 5b1f17b1804b1-4ba09377b2amr107214675e9.10.1794501508654;
        Thu, 12 Nov 2026 08:38:28 -0800 (PST)
Received: from linux.fritz.box ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm226827f8f.8.2026.11.12.08.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:38:28 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Marcelo Tosatti <mtosatti@redhat.com>
Subject: [PATCH v3 3/5] tick/nohz: Remove tick_nohz_idle_restart_tick()
Date: Thu, 12 Nov 2026 17:38:11 +0100
Message-ID: <20261112163813.524336-4-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112163813.524336-1-marco.crivellari@suse.com>
References: <20261112163813.524336-1-marco.crivellari@suse.com>
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

Polling idle now leaves dynticks idle through tick_nohz_idle_exit()
before cpu_idle_poll(), which restarts the tick where needed.
tick_nohz_idle_restart_tick() has no users left: remove it.

Suggested-by: Frederic Weisbecker <frederic@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
---
 include/linux/tick.h     |  2 --
 kernel/time/tick-sched.c | 17 -----------------
 2 files changed, 19 deletions(-)

diff --git a/include/linux/tick.h b/include/linux/tick.h
index 8bfbb053f4fd..686f7e58738b 100644
--- a/include/linux/tick.h
+++ b/include/linux/tick.h
@@ -130,7 +130,6 @@ extern bool tick_nohz_tick_stopped(void);
 extern bool tick_nohz_tick_stopped_cpu(int cpu);
 extern void tick_nohz_idle_stop_tick(void);
 extern void tick_nohz_idle_retain_tick(void);
-extern void tick_nohz_idle_restart_tick(void);
 extern void tick_nohz_idle_enter(void);
 extern void tick_nohz_idle_exit(void);
 extern void tick_nohz_irq_exit(void);
@@ -145,7 +144,6 @@ static inline int tick_nohz_tick_stopped(void) { return 0; }
 static inline int tick_nohz_tick_stopped_cpu(int cpu) { return 0; }
 static inline void tick_nohz_idle_stop_tick(void) { }
 static inline void tick_nohz_idle_retain_tick(void) { }
-static inline void tick_nohz_idle_restart_tick(void) { }
 static inline void tick_nohz_idle_enter(void) { }
 static inline void tick_nohz_idle_exit(void) { }
 static inline bool tick_nohz_idle_got_tick(void) { return false; }
diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index cb3117453eaa..b4149f40b5f1 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -1372,23 +1372,6 @@ static void tick_nohz_dyntick_stop(struct tick_sched *ts, ktime_t now)
 	kcpustat_dyntick_stop(now, ts->last_tick - TICK_NSEC);
 }
 
-void tick_nohz_idle_restart_tick(void)
-{
-	struct tick_sched *ts = this_cpu_ptr(&tick_cpu_sched);
-
-	if (tick_sched_flag_test(ts, TS_FLAG_STOPPED)) {
-		/*
-		 * Update entrytime here in case the tick restart is due to temporary
-		 * polling on forced broadcast. The tick may be stopped again later within
-		 * the same idle trip. The idle_entrytime was updated recently but make sure
-		 * no tiny amount of idle time is accounted twice.
-		 */
-		ts->idle_entrytime = ktime_get();
-		tick_nohz_dyntick_stop(ts, ts->idle_entrytime);
-		tick_nohz_restart_sched_tick(ts, ts->idle_entrytime);
-	}
-}
-
 static void tick_nohz_idle_update_tick(struct tick_sched *ts, ktime_t now)
 {
 	if (tick_nohz_full_cpu(smp_processor_id()))
-- 
2.56.0

