Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793900988;
	b=rTK/NORuVebDZnFZuvE2hLJaKQVnbtb6zB5/RO+sN0wgdGPJKFDCw/L2mPlKKyzUy33D
	 uGItanIU9Gz0yMaUIQbSey33Fy8wlpX6ntx3XYBfvS8qknVTuAiwQmwuIBhq9+VD8MJo9
	 ojTwh4k2fEE7HIl7yGzWPtvHmsfrb/14NS5GOmtxERn0Z0902VQwIim/ZGDQMxtN5vn3N
	 qi8w9jytWxNho2L/vduy7bveatxD+Ldm7RuquqZ+rNqdFVZXR55K8nsjj3Grp1juEvP7x
	 1zGcIvUYyg++KiAxeGy0aKf8d2sQFF0pzlKRrBeCrwsJ2Z63g9QEP5F2Df6mKRzobtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900988;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dnK/Tm/4wkJTyNg1jK03IlcW3x3/3lnDRSiEsyedFAk=;
	b=qswt3MZEAOTXxO+K+aYszxToWRZKEHEpZobc5vVY2vOg948pG6LqyplODmCdf8C+1Hsk
	 WAhzD4KK2bwdpjsmTk36SZnd5L0Uld2kRZv19K45YAeyNa2uxPNA8xrpJeF5Xdr1FcVNy
	 Z4xPCtrW8YGVgeiqHJv8ayjkk8ms7cwYaxqBubLDxDv3tl9rJqdxl5FmgMUE/GQdofhPk
	 OxJbV+fw4E1ikugn3a7qJ28NK90pncYAiceD5d4D/vuQXJxVvNom+7wyEOp120iln4VL4
	 a1/4hL4NtpoZWkZdVfJvKrgAmiwfuZZFGyJo/FbzR9FYUlkO5+0WO3TGEO0hnCabs2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CeGkOSEt;
	arc=none smtp.remote-ip=95.215.58.193
Received: from mta1.migadu.com (out-193.mta1.migadu.com [95.215.58.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2903D606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:49:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2903D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CeGkOSEt
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=gAyB8okB+g9+e5siJkWroAwDqROGKqgj8SPkBEwK97M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793900985; v=1; x=1794505785;
 b=CeGkOSEttQu0YBDi2v9OFSlYmnBEFvBPNCJZBXPHzYWkW8XQLj7mp2zOXDDFJmRYWLw1lXca
 +CPcTJixOCZgwl5rxhTuRELSWtTU+HPsRNOWDemkNiFH6gJdTjQWCeEubHJa8+Njh8KoRs3Xx6D
 wUGeDPtd545iCeMdlj7ymETY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id d3082846755200bd;
	Thu, 05 Nov 2026 17:49:45 +0000
X-Mizu-Trace-ID: d3082846755200bd
X-Migadu-Flow: FLOW_OUT
From: wen.yang@linux.dev
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: Nam Cao <namcao@linutronix.de>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wen Yang <wen.yang@linux.dev>,
	sashiko-bot <sashiko-bot@kernel.org>
Subject: [PATCH v8 02/14] rv: Fix ha_monitor timer and invariant underflow
Date: Fri,  6 Nov 2026 01:49:02 +0800
Message-Id: <f373c9fd1652b4c5789fddd83a18b9e6e350c588.1793900349.git.wen.yang@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1793900349.git.wen.yang@linux.dev>
References: <cover.1793900349.git.wen.yang@linux.dev>
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

From: Wen Yang <wen.yang@linux.dev>

ha_start_timer_ns() and ha_start_timer_jiffy() compute the remaining
budget as expire - passed.  Once the elapsed time passed exceeds the
budget expire (e.g. a state transition after the invariant should have
fired, before the timer callback ran), the unsigned subtraction
underflows to a huge value and the timer is scheduled far into the
future instead of expiring immediately, so the monitor stops enforcing
the budget.

ha_check_invariant_ns() computes store >= time_ns - expire_ns, which
underflows when the system uptime is still below expire_ns (a monitor
armed early in boot with a large budget), reporting a false violation.

Clamp the timer remainder to 0 (fire immediately) when passed >= expire,
and rewrite the invariant check as store + expire_ns >= time_ns so
neither side can underflow.  Both timer flavours (jiffy and hrtimer) are
fixed.

Fixes: f5587d1b6ec9 ("rv: Add Hybrid Automata monitor type")
Fixes: ab2900ae252b ("rv: Simplify hybrid automata monitors's clock variables")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Reviewed-by: Gabriele Monaco <gmonaco@redhat.com>
Signed-off-by: Wen Yang <wen.yang@linux.dev>
---
 include/rv/ha_monitor.h | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/include/rv/ha_monitor.h b/include/rv/ha_monitor.h
index 93ac99ff7f1d..ebb7f91e3447 100644
--- a/include/rv/ha_monitor.h
+++ b/include/rv/ha_monitor.h
@@ -351,7 +351,11 @@ static inline void ha_reset_clk_ns(struct ha_monitor *ha_mon, enum envs env, u64
 static inline bool ha_check_invariant_ns(struct ha_monitor *ha_mon, enum envs env,
 					 u64 time_ns, u64 expire_ns)
 {
-	return READ_ONCE(ha_mon->env_store[env]) >= time_ns - expire_ns;
+	/*
+	 * Compare as store + expire >= time to avoid underflow when the
+	 * system uptime is still below expire_ns (early boot, large budget).
+	 */
+	return READ_ONCE(ha_mon->env_store[env]) + expire_ns >= time_ns;
 }
 /*
  * ha_invariant_passed_ns - prepare the invariant and return the time since reset
@@ -410,6 +414,17 @@ static inline void ha_inv_to_guard(struct ha_monitor *ha_mon, enum envs env,
 	WRITE_ONCE(ha_mon->env_store[env], READ_ONCE(ha_mon->env_store[env]) - value);
 }
 
+/*
+ * ha_time_left - time left before expire, 0 once it already passed
+ *
+ * A plain expire - passed underflows and would arm the timer far in the
+ * future.  Unit-agnostic: callers pass ns or jiffies consistently.
+ */
+static inline u64 ha_time_left(u64 passed, u64 expire)
+{
+	return passed < expire ? expire - passed : 0;
+}
+
 #if HA_TIMER_TYPE == HA_TIMER_WHEEL
 /*
  * Helper functions to handle the monitor timer.
@@ -439,15 +454,17 @@ static inline void ha_start_timer_jiffy(struct ha_monitor *ha_mon, enum envs env
 {
 	u64 passed = ha_invariant_passed_jiffy(ha_mon, env, time_ns);
 
-	mod_timer(&ha_mon->timer, get_jiffies_64() + expire - passed);
+	mod_timer(&ha_mon->timer,
+		  get_jiffies_64() + ha_time_left(passed, expire));
 }
 static inline void ha_start_timer_ns(struct ha_monitor *ha_mon, enum envs env,
 				     u64 expire, u64 time_ns)
 {
 	u64 passed = ha_invariant_passed_ns(ha_mon, env, time_ns);
+	u64 delay = ha_time_left(passed, expire);
 
 	ha_start_timer_jiffy(ha_mon, ENV_MAX_STORED,
-			     nsecs_to_jiffies(expire - passed + TICK_NSEC - 1), time_ns);
+			     nsecs_to_jiffies(delay + TICK_NSEC - 1), time_ns);
 }
 /*
  * ha_cancel_timer - Cancel the timer
@@ -494,7 +511,8 @@ static inline void ha_start_timer_ns(struct ha_monitor *ha_mon, enum envs env,
 
 	if (RV_MON_TYPE == RV_MON_PER_CPU)
 		mode |= HRTIMER_MODE_PINNED;
-	hrtimer_start(&ha_mon->hrtimer, ns_to_ktime(expire - passed), mode);
+	hrtimer_start(&ha_mon->hrtimer,
+		      ns_to_ktime(ha_time_left(passed, expire)), mode);
 }
 static inline void ha_start_timer_jiffy(struct ha_monitor *ha_mon, enum envs env,
 					u64 expire, u64 time_ns)
@@ -502,7 +520,8 @@ static inline void ha_start_timer_jiffy(struct ha_monitor *ha_mon, enum envs env
 	u64 passed = ha_invariant_passed_jiffy(ha_mon, env, time_ns);
 
 	ha_start_timer_ns(ha_mon, ENV_MAX_STORED,
-			  jiffies_to_nsecs(expire - passed), time_ns);
+			  jiffies_to_nsecs(ha_time_left(passed, expire)),
+			  time_ns);
 }
 /*
  * ha_cancel_timer - Cancel the timer
-- 
2.25.1

