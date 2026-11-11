Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794397469;
	b=0GcWwGfPZvAnUkG4lg2QyA1PMT4cW5xWjf9x247dELUSh1trBQFc1/hZN0judVqzz22Q
	 JcJ+yHpORZb3H6a4kn3oD3BdiHPeSHEJNzbq+Fd6aKV5nxXgWQ790I6gz9CDB7fVfgqYj
	 9Z/T5NTFmafBZphJb56l9AyPwWzpfYmyaYn/9IcuffjP7DfcfJNhJdkCrI3t9oPaNhBr6
	 PWtwbpDm4R4t+iGaPM7EWv6giwciUhibgZyG7VNswZ3PoJ1sbRzHKBCmcP8/JubxEtoDo
	 7zi/11pJr3X3oDcgLWVRXscBcgLC/l2gPHBwpYHGrf2OsVCO8UGeXeqovlP4isVOQeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sVfX95bN/zXEzLp1Fumbc1Ie1QqlTSEYYpXUgtBwO4s=;
	b=gHT+MWfVqEmAkSakAk1KgHEaTU6zj1y9E8kcLepyIzaidpcXBdx4itwNqAfr+pS5uj2h
	 o+O3BO79f+TaLcGUgCabirfuvl1vdz69zvf+M1NCPt5qXNkMlEY/Bm5fojDbxo/3NokOl
	 CzyH6r34QDS2qwT2So+/tZJDCRO19YV/z0cr5iTxOE+PK18I50gb8W91Ru+luK2tynMbK
	 P6dIr2Y2ju16g/N1HJxMk9PVnFyDz+lMsV0lJkh5OzdwKu59LFpE+G6P3iJXYoXGoSQcM
	 z1nltfxVgjIRH6f1hc8YL0esGfA/mVo+FNFuhNc8h8kAqNTgiL+ODk1utAS0CBQaFLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BQMbN2YU;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9C5606A8AE
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:44:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F9C5606A8AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BQMbN2YU
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so18284515e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794397468; x=1795002268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sVfX95bN/zXEzLp1Fumbc1Ie1QqlTSEYYpXUgtBwO4s=;
        b=BQMbN2YUf7K4Tx5g5RkjQg1PZVMECpwsQVYoA9FEB6cWd+OC5rdsZUbOkVj0U3VFIA
         F9Dlbr/2hVY9P1vHO6F4iwa05AuXSPkvxh51AxO1QIIU7eXEaaRdLfopz2KYMgDTQuk4
         T99as3epPptMQDmCvFmZrR8ZLHkYyHPeP9addjAPqJBizez4LBVPx5h60IgR8xbRcdNR
         A3H/sVGKFLu9tdMQKMuuVWmoo8VN+nzHYodGsaGuY/ymojx069ryapE55xuSZiBtws6d
         cCcLbq1yb14CDbEkwx8kfMxBF7qhMz21AhMiOxl1fy1mva/5KcVTzp+lzrcupnLcouZ6
         m0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794397468; x=1795002268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sVfX95bN/zXEzLp1Fumbc1Ie1QqlTSEYYpXUgtBwO4s=;
        b=2DUhEWnCbFaKy2fILyzRhXLvWr8gthj9E6cOSaMMIs8XQwRQfvr+ys/0iumAZnn0Ga
         Gmk6OP7xq9mOD2MTJxtGdHdzg4edsPj0IrA+idZNijQCoQZbouQWyTX2N3NsYnB3yUvs
         xznzv/hQQtjPA0VXrtI1qncw5aCiE2vztwEZxrF9VyJ49CRGdxFFhzbBRj5g3pa73yb/
         G8Lwrdi2GqzmDzZqlNC8rBWCfcpfhADc+a9Ql+w3eDr1rbVX8oHZ6xcCuNweAzEwcxok
         gPKW1LUkoyI90Y/6wa9YSPH51b7IDdxBVnUftKNAPP/wVlCIizZTAD1Nd+l67mpixEnV
         cdyg==
X-Gm-Message-State: APuU4Z/SbVO+Asg3Qfl8Pz8nOL9mvCH4ZPfFny9hLSiHDB5QiWL4IiVK
	Hpvtc9NMJ6+ESi5VU3TJcjl02YHKUSkDGRK1jz0ZieHYSxmGn7REkp+errAsm6Zy2/3qTeEhJCd
	+zGmjdxg=
X-Gm-Gg: AYBFou1EBgtlaFjKQxOSozUHWkhqn2MnqDfvF4OQkLC6IxqU9qK41ALQqTRkNw0q1RQ
	5QgkbR4K+nxPpTFY/+739yFdb7aG7WjOnHacyg5xI9xFYuORRD0yrdCu/D4CrLp5BN0CI/4WF1R
	HV2PxjMBnloaii9Vez2Hctf57hPRKkGyuD0cPqF9FiXZq5OjTIEjYh0RsyUc8yHo6bHR7NRiqkt
	eDSiG0OhqGjKstYFiyBNqlrJ2grt88uBtkUSFieLzcgEuAvpAMsqX+Zt2YMFk0qIxvRLiLYz1/W
	oYrjx2NSkVgrlqmA7DGdmD8lDsfHoUnJ7dK6EtXxGooEfch7HqJ6W2voCW2BLTPO6IyepSfOMe0
	AkAHmwUni4UHvC17bjqUdeVE3QcdOYdm+o9sFDCrwBxTzWrERRTDLKypHU42+S1T2LDoeMyEBuA
	Yd3BL8r29d8yEwW4vQG9SUdUVA6Ksq3jfe+uykhMLCgUZAF0mPNPxSDhc8EjP/i5e+c34Twy6hl
	DZsFQIKpvXOKZm3Eu1iUPhRxK5yFfXiS7Yth/JXJCzOoTEYVSiEYZ1PE7j9nP9ZcQTT/T4F6f07
	jPBwPGf7LDcfDSlVwgsTVSdGt7qsPuZI9iXKuBxx7Ez6/l9aiAQ=
X-Received: by 2002:a05:600c:81c5:b0:4a1:efbe:529c with SMTP id 5b1f17b1804b1-4ba09375bffmr36465135e9.12.1794397467959;
        Wed, 11 Nov 2026 03:44:27 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e354b0sm43238545e9.1.2026.11.11.03.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:44:27 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>
Subject: [PATCH v2 3/4] tick/nohz: Remove tick_nohz_idle_restart_tick()
Date: Wed, 11 Nov 2026 12:43:49 +0100
Message-ID: <20261111114406.346953-4-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111114406.346953-1-marco.crivellari@suse.com>
References: <20261111114406.346953-1-marco.crivellari@suse.com>
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

Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: Thomas Gleixner <tglx@kernel.org>
Suggested-by: Frederic Weisbecker <frederic@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
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
index 0b798dc39511..ed4a02881653 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -1374,23 +1374,6 @@ static void tick_nohz_dyntick_stop(struct tick_sched *ts, ktime_t now)
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

