Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978429;
	b=BEWsP5GaXTy5kXWW6Vw9gtDHO5vXUz3J2O3HGWielPp1bnl/SHLVkATKtZAnLwicbQpV
	 vGqgSjL8nySqDvMe1duGlhqk/efeCd0M6iAHCBcF6KoIVpmxZjR3R3iDcvSjenDlYrEc/
	 YZOCoVTjv3aUfzqXDy9Bqn5uENKKEJF0yOCAnv3fMvrS+JealxBv3ubk4w1Ea1xx/yrwg
	 /weFSMrAWLavOwhbbiulbI6GcL7P/4OLCZGlGiZXRWdiLeaxtzXfK9+1UF6HHH3zAtjrF
	 PrCDPIV3OsS6pNzDm2gQEYTpEHuaAdQHAm5yTeOF02DUhhBuEEtA6cDyAqqmPEuQyfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ST6MD8nmbeHSATr23Q5RjwDAfq9V48NFRR4Gq9s30TE=;
	b=v+7yTJGuBeTVWkFt9rrrXoAIm3T9qgkwhGSceO9LdUBiG3nbEdgjpZY4QuDJ8RW3mHHn
	 ARpO5GdbAFGY76aaLu8MZrhdplI0fz7wvxPCi06zqWM0IUjC0aS0bwPi/qg4lkEzXM4my
	 skjyi5vTwmCjG7J+/hgZ0goYWCVnG0tcoLzWL0+DvbLMxBWI9evboCENTcnXKEau0suho
	 DTwfADkFehnJPPwDK9GOyd2qehsnUtrWf6p+U8qQUKUyVuKBfKw0x/pnzd14jAp/Z2YNk
	 LmxDESw4lC8PB71LIfXvDVaPeOYnHiHz0WyB7HJHaNpoxzhc/hmMPJjlbwfno0FeBcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aXw0r6OX;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FB260A261C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:20:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26FB260A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aXw0r6OX
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so7306755e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793978427; x=1794583227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ST6MD8nmbeHSATr23Q5RjwDAfq9V48NFRR4Gq9s30TE=;
        b=aXw0r6OXQRTTv0UHqcjPdCYBL30ITSlQSZzInGtGmJSzA+Masknl3jfpwmA9IUYIHH
         yGlQctaAIT1B+4dBWWeabeO5T89Qg1+5PrXLNU3TljBJCLAf3U9kfQgsmjlKzaEhQCqL
         GoJFbxOXVgTG2PhbK/bTe0P2Ynk5C3jCr1txGD/IT2WygaGs9r2TH58zv1m6M61ge35X
         tl43/F9xzc0lqTdIdgbOoxedwGWHzi4lRRwfcEEcyP2iTknWaOsgaPFA15KQh1Edxlk2
         wayXRgAKdBCJo/L4iWIkOXclNgi3kbKISDzZAEcdm9dABG1cim69qpuTa/9NN48Ea1RE
         BMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978427; x=1794583227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ST6MD8nmbeHSATr23Q5RjwDAfq9V48NFRR4Gq9s30TE=;
        b=rpJ2gGp9+B7bYmT7Do/5FNfsqbLz0XVwdNnCpF/K5Pr8bJco50w2mlX2XDe+d2I/Io
         QKjqpUw9FIXQlnrzkfzmejRM/EZZXRok3A4cIJlCQ7PWI6LYWLCPtYBLqCY7Zdku0TXp
         dUnVzdxgqRP94gybdN8z2RxQxqIE+/4mqnhSvVkyoORFyj3Lops5qKjVDDzVXT+VNaz4
         YzMD35w5h8gUDGq+ekQrhbHNqygNqDsz11RfgJg4bSJ0rpQnhP24DbxN6ZzREWxUwTkp
         ALlb6AL4wqS2jw+EJrosVuW/jXCgV9wfS9BJZV3WKL2BqEBFM1XNz6zKTK0PCoiUagEP
         3zbQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8ur8vUGMN9Wym/1+GodOwizxFWEi9pXpdWXqqlZvzgUwvt2q3+gglTPk81xE8yg2osEmTsd9Pa5q2e+Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oeKtZvgW4jC563Hp8x46bUhdtDHPsXgXb7nZTslvNUXhvbuhc
	H/e9eYGZ84NBFZ1GFLZfVULd46uLrIbTjDxxXUcRUHHVAZ1EFPC402ySIqG2z2A3uno=
X-Gm-Gg: AYBFou08G+uPqiDd3mbMaCTgGJACLf0JBP0+oBbfEq0Y2SFe4FcVIOXaTUvufxrdMss
	EpJMtWauT6w7kDBXf28a4thyW4WZBVIkplnOvQkkCgKbtEvNzLTfvvyMxGCbjvyUV2FI2mJ2FVF
	Fr69TLuWVwoKtXTdNj4Tz+KbxwM9Lh6DERTQcu54Pi3Ug5HNC5HV3tAUgLy1rExSTZqJnnrmjRc
	7kYlJKjZHQdXNTFxc/QsLYyNcIYD/SiDPvFY6P7j7QO55Eq07vUtnF7ZEV69AlpJroxuGTC9mZL
	yNHijJNo9imouHDJQXSkTALSVLTIzmjXOhEZ/J/BDlobMEXPPts0knsrHlNYiMglwMCzJPpTtBK
	KWwT6GOR7ckM7lnYfQw6+jc58c7uWXfy1Ep4icj0ZvDnNaBGkpZL9Vz7Gf6iy5Rm+EMB07HZNee
	M4WmS4Dy8QiW54Na/nifOmwfBwFRs9ZeXnZdswUREVDRAl3BqZa1uKzfkLYIaId0XlfnP4KMh/3
	HWdiXX7RUJrWfq25ex1A/Ke4u+jRMh6gtkz+XPsAhO6Xo5IDmCgEvbnkzIlcxW3gh5juY2YjSah
	zWgVsLRMtXyI0mz2d/A8VWgwWgeKuppVgefwua/cC19XUiA=
X-Received: by 2002:a05:600c:3111:b0:4b1:2026:6b41 with SMTP id 5b1f17b1804b1-4b6dff87640mr49109825e9.30.1793978427419;
        Fri, 06 Nov 2026 07:20:27 -0800 (PST)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:ed97:32bc:977a:3b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc5e23sm4477405f8f.45.2026.11.06.07.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:20:25 -0800 (PST)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	lukasz.luba@arm.com,
	rafael@kernel.org,
	linux-pm@vger.kernel.org,
	tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	sched-ext@lists.linux.dev
Cc: qyousef@layalina.io,
	christian.loehle@arm.com,
	pierre.gondois@arm.com,
	sshegde@linux.ibm.com,
	kayracizmeci@gmail.com,
	tim.c.chen@linux.intel.com,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH 20/20 v3] sched/fair: Fix tasks stacking on same idle CPU
Date: Fri,  6 Nov 2026 16:19:47 +0100
Message-ID: <20261106151947.3991524-21-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106151947.3991524-1-vincent.guittot@linaro.org>
References: <20261106151947.3991524-1-vincent.guittot@linaro.org>
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

When tasks wake up simultaneously, they can easily stack on the same idle
CPU but only one will run immediately. For others, a different CPU might
finally be a better choice. Take advantage of the push callback to try to
find another CPU for those tasks which lost the fight and haven't been
picked.

Call also sched_class->wakeup_preempt for the higher class so fair can be
prepared of handling several tasks stacked on the CPU. Other class returns
immadiately.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/core.c |  1 +
 kernel/sched/fair.c | 16 ++++++++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index a1a3aa45ecf6..ef4cbcca2437 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2311,6 +2311,7 @@ void wakeup_preempt(struct rq *rq, struct task_struct *p, int flags)
 		rq->next_class->wakeup_preempt(rq, p, flags);
 		resched_curr(rq);
 		rq->next_class = p->sched_class;
+		rq->next_class->wakeup_preempt(rq, p, flags);
 	}
 
 	/*
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index da9c4416f1b5..262626455497 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10649,10 +10649,22 @@ static void wakeup_preempt_fair(struct rq *rq, struct task_struct *p, int wake_f
 	/*
 	 * XXX Getting preempted by higher class, try and find idle CPU?
 	 */
-	if (p->sched_class != &fair_sched_class ||
-	    donor->sched_class != &fair_sched_class)
+	if (p->sched_class != &fair_sched_class)
 		return;
 
+	if (donor->sched_class != &fair_sched_class) {
+		/*
+		 * When rq is idle, several tasks can select this rq at wakeup
+		 * without knowing others did the same. Give another chance to
+		 * select another rq if not picked.
+		 */
+		if (sched_class_above(&fair_sched_class, donor->sched_class) &&
+		    entity_eligible(cfs_rq, pse))
+			fair_add_pushable_short(rq, p);
+
+		return;
+	}
+
 	if (unlikely(se == pse))
 		return;
 
-- 
2.53.0

