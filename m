Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978413;
	b=FZD/0BCWyktKbnQa/Jzu4aAR7QdW5M9Kb6Xk68G1ah2RS1/0RW013Vbnls6o5WYMYLPW
	 BBZfOnb8q/tKdDNrpKz6N5IN/KotdcSUCDOLT3OHHie98O2j/mkH4YAbo6t2TSGtOnU52
	 9QokZgVEluhvHUBeCgTCFjftOMjv+LgrAWeMyMSyiZ6Critccvd/FPfS7WtgHfHJLg3kD
	 TSMRuQPrkFZvO+NepyFp3JK+BsDOXjLOrEQNvKCDKZPNJF1B8shXrSYKMFHAubAsRhcYW
	 32cPWtlXwJ4tiTwgzcqiifAJoBxOWz4g3QreImSTnVRnvBDacEJ3xvEDPWlr0FqtaPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uTux42or8tslpeNsQeZIKjxhj1hCw7fR6WEWeRorK0M=;
	b=Z6RCv5y1JmQHZ9iuXj2gN/L3OGW35nylQtX+kJVBbRemKV0y3dJgol4dnANj2Zw451AH
	 zFb1QwXiJyjyPIkJGqkfvHVRUYusNDRoAUtXgrZYG34FIhKxYy3NhvUBjL35g9xmz33Kz
	 JUn9oapZjXPku9jP+awfKoqkU1jdTgwihRs7B50lkfVn6XyHPOh3jiyuSMA+jJ1LGn8Rs
	 n781DOslskAdy1HdV9PE1bHi2LIIhvxWCPFhrN+W98RFjV1DQSOrhinZhJwYMifTAdzW+
	 ZoMyOq85wcnHyTlpoXwjm+7FSgY8IhfXevl447femGRPviZCDHb913TflrL3c89Sxsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WpY12vZq;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D556082BC9
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75D556082BC9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WpY12vZq
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e4831c028so773840f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793978412; x=1794583212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uTux42or8tslpeNsQeZIKjxhj1hCw7fR6WEWeRorK0M=;
        b=WpY12vZqX9HaWMiktbe3oRxr5j75D0BUxxbxanSa9dzlMNfi2+8Mg4rWPrIlVge5Ed
         tGK1SqzO8ieW+6T3iMtcIdp4nKgjj96tsOMyrToe9zCVb8ki+NOcCYCcQXNGYHNVr6z0
         QhiGqk13/k7qBsoxYxgxw+1/6PhgLo2mMe3OIjNFWir9P9h2+J4i+82WhAz3W58ooJZj
         XzD8hv/kLcr8qOaRrcz/J3cRl74oo+VyEjGiuSoNfliRv/gq9YlpbjNzaTQVzlYWbzPt
         +uQuu/2OJwBgB3s94xOjgse7mY2AqqSlsgZpxu3oft2ZiXTmNw53ngVO+cXRpvQpEfcD
         R6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978412; x=1794583212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uTux42or8tslpeNsQeZIKjxhj1hCw7fR6WEWeRorK0M=;
        b=xX0WyBTX776uL9tVgbqTaSbHyZ46WjWz7Eqjzghi80kVtF4FmEW8CHjtjvKdfraCMg
         GaBqftp4wFAtbdFV33r2Iob7flVBWb1xS/PlaR35JYD6WzGnB3f8I0aNUk8QmA/Sb8n5
         CuBOE0YhAJdFOpDAJDdYre+TPdXKQvXC3YeD+izasAwRXZUsU0Gisn/u3QoaewAlfFNG
         t3mvslMHmRkUS6N1gIznbZTYEMR8D1qlLxO2gYRCksXTy24LKQg2LhlNOoSwEHbVgT6I
         3ISUJzaLR4GjDItTav18LIb1B9WpnldoMckmKkEv/vwuNV4jI14FTUCi9zRE8Y6N1PtJ
         cNSA==
X-Forwarded-Encrypted: i=1; AL+hErHu3RgZMi9OuMuC29ndUbqzSrmYr3Kwh7+ncXzdi6y3tYNJ9dQpUsd0nPELexjihPI/us4Xe48L0SQpkiM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LQgBgD1w6E/eQf83NocUESXsveqiWjsVOfSgAMc23oZA7tF8k
	ZJa1HzYIdlB1pbvNFrErnrxMWPPxiQYevXIMwexBk1I+HaCVKio3WXL9z7SUOL1+MpA=
X-Gm-Gg: AYBFou1wuxHPoPQTv/ucttL95gAfWGZDS+8qZ83nDxLZ6s0lazORaVK585GLBeXMl8e
	Xyfhl3VhdWV0GRSVuXAar7WJhjW3hbBo7qDbS38Qru9BgxdXEi/iAPQo1T+CeeWD8nZfZFTQX/R
	IhcyEoGnstz29AEGmzUGssTSlZ7SIscxx+Z71vU5D2Emc3wIAgghmAXm5Pk4Y6ihNbEq02Njb8U
	cmkxdi8uP4+loqmsIYlQu7ghlmoByxNoMy8LC+g0FOpsbygoq9yn8REjwY1G5U3p4IVHOWm1o9O
	qPpzNuqo7WiE7KfFRoC5DxdWhLqZOfAzCjJbPYHX61fs9p1x/E5Jksc2n3f/mOqr0xutSONRk+F
	glDVGidnH6AScthyEY1l1TkYBfadWkBRR1YmdM1IBX58YPFZsIsuNQ4kvSBUw6p/qbxCwYlTjUo
	W7KGbxsU+yvYkdq4Ui8S4PJlZrv5Uindo+JJBWJKsFfNv7zWAJxicpVbXEd0gfPHOPx3LA+ZumT
	luxoWOYAT19XQjimLLbVFunIxqKo+pRRH27UvpBeX27wIfhxNlBqmyb72XUT+iq3AMIenkVasL0
	nU+KnExWH+YmVnl2M01bT8L7EUfvYf6WCXyJoWXQqsZ/p6c=
X-Received: by 2002:a05:6000:25eb:b0:490:421f:1555 with SMTP id ffacd0b85a97d-49275b1bc23mr5251354f8f.22.1793978411922;
        Fri, 06 Nov 2026 07:20:11 -0800 (PST)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:ed97:32bc:977a:3b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc5e23sm4477405f8f.45.2026.11.06.07.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:20:11 -0800 (PST)
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
Subject: [PATCH 12/20 v3] sched/fair: Support not wakeup case in select_idle_sibling
Date: Fri,  6 Nov 2026 16:19:39 +0100
Message-ID: <20261106151947.3991524-13-vincent.guittot@linaro.org>
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

With push callback mecanism, select_task_rq_fair() can be called for a
task that is already enqueued. Task into account this case when choosing
an idle CPU.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/fair.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index f2a0d2c2bb63..980eda9c935a 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8187,10 +8187,27 @@ static int choose_sched_idle_rq(struct rq *rq, struct task_struct *p)
 	return sched_idle_rq(rq) && !task_has_idle_policy(p);
 }
 
+static int idle_rq_without(struct rq *rq, struct task_struct *p);
+static unsigned int task_running_on_cpu(int cpu, struct task_struct *p);
+
+static int choose_idle_rq_without(struct rq *rq, struct task_struct *p)
+{
+	if (rq->nr_running != 1)
+		return 0;
+
+	if (!task_running_on_cpu(cpu_of(rq), p))
+		return 0;
+
+	return idle_rq_without(rq, p);
+}
+
 static int choose_idle_cpu(int cpu, struct task_struct *p)
 {
+	struct rq *rq = cpu_rq(cpu);
+
 	return available_idle_cpu(cpu) ||
-	       choose_sched_idle_rq(cpu_rq(cpu), p);
+	       choose_sched_idle_rq(rq, p) ||
+	       choose_idle_rq_without(rq, p);
 }
 
 static void
@@ -12968,23 +12985,21 @@ static unsigned int task_running_on_cpu(int cpu, struct task_struct *p)
 }
 
 /**
- * idle_cpu_without - would a given CPU be idle without p ?
+ * idle_rq_without - would a given CPU be idle without p ?
  * @cpu: the processor on which idleness is tested.
  * @p: task which should be ignored.
  *
  * Return: 1 if the CPU would be idle. 0 otherwise.
  */
-static int idle_cpu_without(int cpu, struct task_struct *p)
+static int idle_rq_without(struct rq *rq, struct task_struct *p)
 {
-	struct rq *rq = cpu_rq(cpu);
-
 	if (rq->curr != rq->idle && rq->curr != p)
 		return 0;
 
 	/*
 	 * rq->nr_running can't be used but an updated version without the
 	 * impact of p on cpu must be used instead. The updated nr_running
-	 * be computed and tested before calling idle_cpu_without().
+	 * be computed and tested before calling idle_rq_without().
 	 */
 
 	if (rq->ttwu_pending)
@@ -13027,9 +13042,9 @@ static inline void update_sg_wakeup_stats(struct sched_domain *sd,
 		sgs->sum_nr_running += nr_running;
 
 		/*
-		 * No need to call idle_cpu_without() if nr_running is not 0
+		 * No need to call idle_rq_without() if nr_running is not 0
 		 */
-		if (!nr_running && idle_cpu_without(i, p))
+		if (!nr_running && idle_rq_without(rq, p))
 			sgs->idle_cpus++;
 
 		/* Check if task fits in the CPU */
-- 
2.53.0

