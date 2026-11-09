Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242184;
	b=mCEy9Ms8uoldNqTEFG7z3njnMSeLC0qkstF2yBPqme2nGrJkI5pgyACGfJgSCiS71y04
	 pFS86HTN5BuE1h5CBETogwwUzBrhwBeADZbzJ3EaN1tXGL0iKxVjPsOblsrs9gpi5YD+0
	 9VaPpIa3mhVHKmvJRDjiVWoAVQn7xFTU9ijYHWFMxg6UnSrGyMVksOT8GEzga9qOESIHw
	 h19Dx1DReuxLlQJPMIk+SJwtLdoisRw2Whoy7JSneiNw2wgaDIgMb5K9CLwfWuJ8tz6rA
	 38vKcIbjDIGyWRbftgh92cz3WrpUtISqGnCgwupVaFelYN3UlJgWlWaEZLlVa/qfXqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SpFA5SgbZJhb9ponpVrLzGNwdHqcbHvWyklpgw1Qw5A=;
	b=qYO5jQEb6MWPc2Ev6nmJRS+D99q1KN5x5s9Fd5CC3pJcP3efwEqcMjrgl72dkY0Hp88k
	 PZanvwRcBdVmjS9ML4J+TW2WEU+uZVdMXGqrGC7SuUwwXbw5T3F61Iy6hnoU7UKXonU1V
	 YITp65wlRpDm6jHay+STKFoAKiU8eE9VQkoA4pSaWyFv2S/qyuv953VZ4biYoq6BNpDYK
	 pGi7dJwiEFtLQBzH7v6c18J5znx7qH/vPiWNVNp66ytwE6P1iucZiAuNjgcB0/kNuuOGb
	 mPt1tg9i/i0RbMKMkoOION9m8K2/zsKrmnaVcf32wrXuve1BiqtKx1IvhEl7MDWZqXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E5SJX+2f;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAD0606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFAD0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E5SJX+2f
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a208d93758so11586995e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794242182; x=1794846982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SpFA5SgbZJhb9ponpVrLzGNwdHqcbHvWyklpgw1Qw5A=;
        b=E5SJX+2ff3/h5onmzPB9GjihmE2+6WLp9hzZVK2hbtsAvbPrD7WJIJTpgNbLJycJ8t
         j3MBBCvHxsQRvltiTSiGyf2ajMBRLmuTAL22CUZZwLOaxn4TZ48N7ieg8yc+jN2O0Ci9
         pYl4B4s/t5Erxyx56M0KuaEX7NOLFw5AM9xLQplgrFcFJhLrCDsCtSgmTZPh6ohVOkuR
         XgQZYDizOplKlNqjDfoKwuGZRxaixXGBP+l+RpiVefC6J04bHRAULMt9HLSe7PwH2Yxe
         H4rAgut2QvQB/qiGo8/cHuI+O/uxgunk0Rj4846WBCQrEKIchLyZRmSY9fmigmL+VGDm
         chUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242182; x=1794846982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SpFA5SgbZJhb9ponpVrLzGNwdHqcbHvWyklpgw1Qw5A=;
        b=JVDIg+2Wix+UtIzjcmGCAwwww7uiOTCv7cgpFa019kXdtOb6En7xfNmtlVW6Zh2K+s
         VU5euNQOPpeCHtxxF5vC5RFj4ytl3DxRTf/T4vy+QHYhROFGA6mNY6nL2YwY7m2FEiDi
         AU/8LZgCxFgtNc6gL2bNaGzi3vXOZ0ZfOLrKbQPnO+lGabxB7li7avgbka4vkJQyPEFV
         TzT5GA9p6P44UkC9F/BAQZ2e/WwWOjtLjzF2PAwtGiP1iL0K1+alq34t4cc21YUcfyb6
         gZCwAkCwHbvc3qtGHYkgDD/UmL2L3/IYW7fuZf/0UYbr1XHLywpN+yh4y9zQ2tnP12CS
         ZV6g==
X-Forwarded-Encrypted: i=1; AL+hErHYWpQ+azJfHjvvlN6porwiX1NY+xXXC710q83kAnRzi7SJk0ntxX3TuSc/6lul71I6FaIaMrAMP8qETS4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JPnR2e7SuyAee734cJaJXDMl5IPLeWSm/TKOW+FssS0Pj74vf
	AVdMIjQDojXwgrH+U4GK5JHzMCOEW6G1ec21SB43yYNJC/tdbbjAEA+U
X-Gm-Gg: AYBFou0W+ZDndDbC4ZOLS8hDVnIuLhs9sokdUzs5KN4h8Vf4bEg+OI+dntkWXtZFsVz
	5r/nL9GBzLHbJ1H1ZYtqcsm6hisbQoY4Nslszl/WttosX1r0eznFuDB7X7fES+IY1+/DPzfuXPz
	3VTGU6uTM0Ek6JgIhgNZ1Xb9DAqq5K4zuQV63D/eFJJ9Za+FsAm8zwcisAyYInKZRTsSBldfsZD
	Bc9hbNTgfGq7Ey2mYId9rB0tRexcz66DuEwP5T4BwZzvAowhR96gusyWPV95au7cBmaSGIAwvsh
	j2kWbQAhQ/XbnPTkyqk9YZAk4daAWxWrNTJDir6jtAAOo6Pz5kYmSYxJZd0O1Gbojyn0BiowvGg
	aRkT8E5KdHNUXOTMggDnaQc24KfjP+2qvKySIo2vof94fmgPZWy9ibuHwUs73vpuSLnqDGLMi+w
	6yNQTc/G54z6FH1YJX8EyyhnmBBkirk1j+fURlLPi4WFAOnzTpu2agYUmqIN9pFZ5YS6IclF3gG
	cc7OgFWvlOYgkQ2gYipzweYmSyBQeoCP61zE/jIIUo+t76LVh6Iaz9QfMRgXq0VjLeeQQNXm0O0
	EM0tEoIdq4yZjrZR9dDjot9t2xnbrFn7h80iUBs6td6AgXk=
X-Received: by 2002:a05:600c:8712:b0:4b1:2026:6b41 with SMTP id 5b1f17b1804b1-4b963c9de56mr86531255e9.30.1794242182232;
        Mon, 09 Nov 2026 08:36:22 -0800 (PST)
Received: from victus-lab ([193.205.81.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b96cd012e1sm138851295e9.8.2026.11.09.08.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:36:21 -0800 (PST)
From: Yuri Andriaccio <yurand2000@gmail.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
Cc: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Yuri Andriaccio <yuri.andriaccio@santannapisa.it>
Subject: [RFC PATCH v7 01/29] sched/deadline: Introduce dl_freq_invariant flag for fair/ext servers
Date: Mon,  9 Nov 2026 17:35:47 +0100
Message-ID: <20261109163616.195264-2-yurand2000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109163616.195264-1-yurand2000@gmail.com>
References: <20261109163616.195264-1-yurand2000@gmail.com>
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

The fair/ext servers are by design frequency and capacity invariant, i.e. their
maximum allowed runtime is fixed, regardless of the frequency the CPU is
running. (See also https://lore.kernel.org/all/20250702021440.2594736-1-kuyo.chang@mediatek.com/)

This inevitably broke non-fair dl_servers, which would want to instead scale
their execution time to be consistent with CBS and GRUB-PA.

The newly added flag allows deadline servers to adopt the frequency invariance
behaviour as fair/ext servers.

Signed-off-by: Yuri Andriaccio <yurand2000@gmail.com>
---
 include/linux/sched.h   | 4 ++++
 kernel/sched/deadline.c | 5 ++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 1c93da75226e..b78ca828f694 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -706,6 +706,9 @@ struct sched_dl_entity {
 	 * contributes to the root domain's total_bw. Only meaningful for server
 	 * entities (@dl_server == 1). Allows toggling the reservation on/off
 	 * without losing the configured @dl_runtime/@dl_period.
+	 *
+	 * @dl_freq_invariant tells if this server's runtime must NOT be scaled
+	 * by the CPU's frequency and capacity.
 	 */
 	unsigned int			dl_throttled      : 1;
 	unsigned int			dl_yielded        : 1;
@@ -718,6 +721,7 @@ struct sched_dl_entity {
 	unsigned int			dl_defer_running  : 1;
 	unsigned int			dl_defer_idle     : 1;
 	unsigned int			dl_bw_attached    : 1;
+	unsigned int			dl_freq_invariant : 1;

 	/*
 	 * Bandwidth enforcement timer. Each -deadline task has its
diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index c0ebdcde5fe5..57c7a8802d8e 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1432,7 +1432,7 @@ static void update_curr_dl_se(struct rq *rq, struct sched_dl_entity *dl_se, s64
 		return;

 	scaled_delta_exec = delta_exec;
-	if (!dl_server(dl_se))
+	if (!dl_server(dl_se) || !dl_se->dl_freq_invariant)
 		scaled_delta_exec = dl_scaled_delta_exec(rq, dl_se, delta_exec);

 	dl_se->runtime -= scaled_delta_exec;
@@ -1862,6 +1862,7 @@ void sched_init_dl_servers(void)

 		dl_se->dl_server = 1;
 		dl_se->dl_defer = 1;
+		dl_se->dl_freq_invariant = 1;
 		setup_new_dl_entity(dl_se);

 #ifdef CONFIG_SCHED_CLASS_EXT
@@ -1873,6 +1874,7 @@ void sched_init_dl_servers(void)

 		dl_se->dl_server = 1;
 		dl_se->dl_defer = 1;
+		dl_se->dl_freq_invariant = 1;
 		setup_new_dl_entity(dl_se);

 		/*
@@ -3957,6 +3959,7 @@ static void __dl_clear_params(struct sched_dl_entity *dl_se)
 	dl_se->dl_defer			= 0;
 	dl_se->dl_defer_running		= 0;
 	dl_se->dl_defer_armed		= 0;
+	dl_se->dl_freq_invariant	= 0;

 #ifdef CONFIG_RT_MUTEXES
 	dl_se->pi_se			= dl_se;
--
2.56.0

