Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501512;
	b=FIpMKz9LXjrlvTN1XBOY2KnixmgwDvuYemg4Z8+hfijrAZof/N2+EpS2JsQdhkKte8bH
	 mUHe0ZbmU71GoXkVf5Ic6nEA1rbLyzESOqzcq9Ko0JPm+M2SnLuBqzJAkydc33y8hAVDF
	 GghdSzFg2JrzM2iZcgPAwOBvhUHN4zxnPy08xbuskNeSbHwOpM65j1WH/pzA5uUp3RF8G
	 oHWk1wpBbKFLNJjQzZrqLpym7Q6/sxHMVZYQEJGhDxQ+2ydkqY0T+Nq163T1QA7e/qkML
	 8c4uGKbSphUEyMJc3V4zTvdctj8cxT52vdb1tcldqkZ1BQs3QHnrMHJI9ucvh0nxsQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=haUjdu1WTVujKp4YFXADZSg1hyHI5GFdMi/VVgymMz0=;
	b=VEAR0WtUWiinPWdg3oe4x2BwrXeEO04DWekPFM0nTYzsT5A7BNjdr+72L8+5ZqX4aaD/
	 D6w+4hSY8EcdaQIT/q7wVBt/DZ8P7RkhwbdHEjNvtBwipSEJpfEDsOhCcyH7evq8UP01I
	 /qi3ZEUcxYSo9bRY0QmatloVBjs4Fa/PXyrXcInuQy/TLzy2NN495O4YWJbdaLvAA5i5e
	 xNZmxgoHNEb8ikFEBcZ9v6dD1r8IlHBo7EVeLkCl3mzxTgctIfGDE8I9VXC1jkTTvINbf
	 YtTKdct0EzxzmF+gfOEt0XL/HbxaEwqL7RRDJ54C5YgtVUnT5TD2pAeYV6V+6sYb88Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Bi60AtY2;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E95460A2633
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:38:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E95460A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Bi60AtY2
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so3031793f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794501511; x=1795106311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=haUjdu1WTVujKp4YFXADZSg1hyHI5GFdMi/VVgymMz0=;
        b=Bi60AtY2A3IkJfYSZH6WGIvYksnGMwcrt2Z2Qs8KhmO+rLZm2cS2eyK7bYUUTgMzuc
         kLFi8C1PSHKQyvSTh5efSlBUpupGQ4SUn5wE//7EVkbNz9e8qOMMVjOffliENPaNNTi1
         9BEHMgH0yb962CLprV1M/6pIWqcfBpLL8Dj0HMXVKrg7vjJXXlNpI26Oo5LaC5jomUs+
         5nqezPumU+lPK/8ve/a4a19mOiyvxotAvwZp58L0kHR9nU14qobcwV/8W1eT9MihCmdb
         MEpTH9ZtJX8zur8+iSpfbvG6L55UKfJj9eLXwiTH6Wi0mCrgNY3DTYBHHR2B8ER1oWkp
         JBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501511; x=1795106311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=haUjdu1WTVujKp4YFXADZSg1hyHI5GFdMi/VVgymMz0=;
        b=A1x33MmiJlh+Wit5Q4aL/nuQxxLj8I4j+FJzheu5zOcJA5Vzom10vNyT8O6N1BTGPb
         LapaBRpaLvTtDyPHFymWI7E3qmBTuogKZoTFwLlGBFoqW/JwJGAnhrzIZCLv2I3Y5GdR
         U0KOPQ2M+EhYTDyUztE/iWd+JaupyHs0HXQNxssHvfj+Tn8edwo/uAqgR6UIbejt9JAu
         vQ/2Cu+Vzjslq954um71+eXIWlclDmpkz7stryLRfWIwAznv8TFlQcXvvdRJAVlT9m7T
         0U9ZHdnhaVzuv838gVFedlSCQv42lAwTzzMdrR7osXiLbZjHuR4fUEfm8Vo0zu2dUyBz
         6CfA==
X-Gm-Message-State: APuU4Z8UZradBtn1G5DUjyDHFTsZ93EQ0Qtva+zYCFwxX4aaBqjDN2Dd
	ufpnInU+sV/XCnMdbl+a6xW3pXxl+iwcAGox7f6lWSpWtw670GS0z/0+aQI3WTQnv+teLQWKOIh
	prGeIzrw=
X-Gm-Gg: AYBFou0+HEA2tnAZq0x+U9T1HqWnHTVYiu40366uhMk4TVLkM5NgsIdybMduxbGGpZ9
	Z7uYm8aDjrt4+ibJK9UveRRHyGKM+thU0jxWV/1Y5LZ3TNfCVE1yeEl8ZbGWBAuU65Nw68Bybna
	4j3KIrfXWgJ/l7+8wAny/8903As7mNYfjQ/VtUrZBoi6eVP8L3JlLLr6gKy7syIexP7lWFNY4VN
	N31u9h8sOeQHle7Ha4Qm1tKk00UKRsYASLXdmtLwycqWUPzMak91jdeapSrcPA8lnUR3EYKHMQE
	Preo+9V5XOsMXcH6b0xII3jshRCd/plsHu87TxuLsmXpy+G6Hfs2rM3/ZPzPv9xrUCNTHQsYnTN
	nsYajbktlVeW8Adb2ycKxpNtvrahTqDxqmSVRu9frAOxYLrQDrgGB3fnfpJYiFaPOraqzNzcGEF
	4kG8LTSL6MgseF/+86AQzHmnSGT7lbwFqqYOCEzTIFzvSgJhl8azBJfjS/GfR7ZxdwKzV2kmyXn
	8FNxSjMJTerLhaeyD+38INHBmlhgl0F8Ok3d0RJ89SVmjlNwTffunNjm3YSgdd/MOy25tRaRUTN
	1bKhK0Cbgd8gj92czPsgqU3dU77IT4gReQzz9LjCcdDh
X-Received: by 2002:a05:600c:3f0a:b0:4a1:7d9b:d4ae with SMTP id 5b1f17b1804b1-4ba09379befmr110638405e9.5.1794501510866;
        Thu, 12 Nov 2026 08:38:30 -0800 (PST)
Received: from linux.fritz.box ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm226827f8f.8.2026.11.12.08.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:38:29 -0800 (PST)
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
Subject: [PATCH v3 4/5] tick/nohz: Reset got_idle_tick when entering dynticks idle
Date: Thu, 12 Nov 2026 17:38:12 +0100
Message-ID: <20261112163813.524336-5-marco.crivellari@suse.com>
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

A tick firing after the last tick_nohz_idle_got_tick() and before
tick_nohz_idle_exit() leaves got_idle_tick set, and the next
cpuidle_idle_call() then assumes that a later dynticks idle period was
ended by the tick. Now that the CPU leaves dynticks idle before polling,
this can also happen within a single idle trip when it switches between
cpuidle and polling, e.g. when it polls because the tick broadcast has
expired.

Reset got_idle_tick when entering dynticks idle, so that it only reports
the ticks of the current period.

Suggested-by: Frederic Weisbecker <frederic@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 kernel/time/tick-sched.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index b4149f40b5f1..fb47d5dfbf4e 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -1237,6 +1237,8 @@ void tick_nohz_idle_enter(void)
 	if (tick_sched_flag_test(ts, TS_FLAG_INIDLE))
 		return;
 
+	/* Only report the ticks of this dynticks idle period */
+	ts->got_idle_tick = 0;
 	WARN_ON_ONCE(ts->timer_expires_base);
 	tick_sched_flag_set(ts, TS_FLAG_INIDLE);
 	ts->idle_entrytime = ktime_get();
-- 
2.56.0

