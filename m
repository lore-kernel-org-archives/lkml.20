Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978398;
	b=F+vCucC1kV5oaw+OienXCoB7kLrJbiTdXL9kLvZz/HPuZQg/p9zXYDqQmKWuwrAxq1ZD
	 f+9g8Fzd/f6rhJxHYsFePCd87QknwBh43h0+oz9TjU//H8GhePa2ohm+Tj5I+sty9Rowe
	 H55t5ESpkem0yWt4NtmVS33QV4c7gA3IPMXsHZwDA5FwhxSL6yqK4FeY8rIYP2rfLZ84e
	 S/zipoYWVN0baLatOnLfFkjQUTqtlLtyswcp6nNO24Wg24X4sqa25E3BURSx7FySQyF8Y
	 Q7kLXxlyarCxpX9UUWc87xLuH7Xg/7Gf0vlbWQVuRb+WqNe3Z3seJ3e0pwmURWHJOrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lQD/JukA7YFLaFe55TCX0scvCEQxeNBxiWugJcrZ3hk=;
	b=bH0Qw6SwYABCUAI/RAEDOw1+J2I34GktYXzev+6Ix6KDjocuqn9FFdhGZ+IA7yEHBWEs
	 ZdPO3OzmCf5K5MUgG07bnRxbRc3yll52I6JBqggwfuVZjdqR5MeTC8U7kH9teFs96+xKe
	 tX+r4wVKk9S4HfQEBd2SLT7+d5rpwTI7gBQ3EOlbtyJtLtmUu5YdnWSx7iblB4NR+oOZt
	 8k2Ra94n9lSvs4x04PPxSHLFYrwkZFigcBTgAkuyBOFvTOF+5rSYIE4u2Fl9V38OZIC0A
	 Lee2ImUEf+XEkzjUHrfPuzEAk/bB47xLSSDBIqfUTBMPbqCMvhClw/eFCl/yeeR4U7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cRp+jICZ;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8908B606D814
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8908B606D814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cRp+jICZ
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso5428965e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793978396; x=1794583196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lQD/JukA7YFLaFe55TCX0scvCEQxeNBxiWugJcrZ3hk=;
        b=cRp+jICZddLUG3WxwpMKj55RPYwFKHSIVGChBaWvHD69EMEPmxvR5HUnetbuB+oWsS
         hXILm/YLbDHT7bm7w6IU06nqn32YkidOnv+DPobYE23Xbw2svrz4sngMunXT5GL+ETgF
         g6dnXybVQ8pk8FPjrcXNIfRKPWd7ggmTquisz8YidcySKFTMMNR9fUH5kBJJTYbXQx8I
         0QgYyC+BasCiy3lGY+DfeN6sGtz+/ZU2gUpvRNxzHn3QBsllJuYelJnsuiq6X+mWb+yH
         T/Dv1Lon+jmszQyT9f4j9ghYjSTrv8ttx45yBOP52+SShuh2jguv6svbiumQbcHe1vx5
         1abw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978396; x=1794583196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lQD/JukA7YFLaFe55TCX0scvCEQxeNBxiWugJcrZ3hk=;
        b=Dcqp8pwykt574Srle2ywB0piEf9w3tCQSFIH5H5DMCJge2DwK0Q5K9LHMHa4mtAE8O
         SkeLe9qOChqaEze47Ov0VnKoD3PROx+C/M2doLm7GGzwsWU2WVOdKqAbFCCEybKuTc4u
         bYwQ+FKneTAO66ZXwHv1FgTBVQho8TbRiL+cjw16YS7FZPhTt5Z0RhnredEmKsd850j3
         R2+wTrhEthh7Wpi1mdfP5ECPClpjrll2kP3ABCRhnGKX2SMreU4YSsAvY7M5v+f2uicu
         YQ51dp03yjSocILV5D5yqrNJviAtK+pzTKTw5Tnvz7dBYRvQmdzZpT77T7+Z7XzQo5w6
         tDog==
X-Forwarded-Encrypted: i=1; AKwUvBx2Wxtfj+u69n8M/C6ctkRQ//nt49Ko1Y6JiuFfg4ApW7Kja2W8ZTXSTDxLf+4SUFCilVoSUm68GBLw0mM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yYMKsglJViGFgTyUEkWIScHiKAL0dOLSjcyUa3kDf8RAt6PbI
	0XNavX6cc6F5bpztQsA3fm6AJhDOBxbKEvRkYEyTFTr+QupxXpYb1ezZjsX3KtDH/Upubv6ltx/
	2Fy8v
X-Gm-Gg: AYBFou3tNaVmlKtpiO06H0ueoWNgxVwEdHMaQtR8q6xYGFYsb8uypA/0OVOEguz4q4p
	q/Nm92V56pQR/pFdFW1KLZYbfEmtOKQ328AoPDmgpHvjRJ0/2mUQZ4rBtkeMpCRIlL/VqGsftAa
	9mwZ9QbnF2NJC8qPRmAJKBO6jRGpzYpLAdzZWZ40wz7Ud1Da1MzS5O/eZ8NQKPlFDD9p9VBIH1g
	TfAlZBI0SlT3H0Mdb/B+zdKNMmslxzNMA81Xt3EyvE2ZMHhjbNkgjMcZ2zJrhkbRSvLe3skjLq+
	9OIJLwWXNDiwLQu1j5HcSWfbRxznB9gXORrqTmLITLy3ddInFA4eF69F0OSAMftkqcm/7It9yUD
	GboHurUUN/HisN4HLMU4LJeMdYh+y51fIByDwXMkGh7Hel/LRjiZqCk4l6JqnH7b4sB8Cg6ACfh
	lpIaGdc+FlWL5daHg4tkVObVDT17oK6aAWdIVeMuT5Qogrbb3hJOIWfGKB2JBdBDz5b+3WX6G+4
	VjFFgvOBC9ak8Q6TifI7pml5DfYrDbgqj8laBgdCtr0HecCYV5/u9CsIIK6WnQoBcEpQYWmnolJ
	LGvB78xeIzfwrkfiMTbpvAoGpcIBZF9/TlP4q56fa+O0pI0=
X-Received: by 2002:a05:600c:6384:b0:4a2:167a:c939 with SMTP id 5b1f17b1804b1-4b6de9739f5mr48102355e9.21.1793978395940;
        Fri, 06 Nov 2026 07:19:55 -0800 (PST)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:ed97:32bc:977a:3b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc5e23sm4477405f8f.45.2026.11.06.07.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:19:55 -0800 (PST)
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
Subject: [PATCH 03/20 v3] sched/eevdf: Reset lag at wakeup when migrating and prev has been idle
Date: Fri,  6 Nov 2026 16:19:30 +0100
Message-ID: <20261106151947.3991524-4-vincent.guittot@linaro.org>
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

When prev CPU entered idle while a task was sleeping, we assume that the
latter received enough running time and the lag can be cleared similarly to
what happens for a negative lag.
While migrating the waking task to a new cpu, Check if prev CPU entered
idle in the meantime.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/fair.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 79f53811274e..945de0215abb 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -932,6 +932,27 @@ bool update_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se)
 static inline unsigned long cfs_rq_load_avg(struct cfs_rq *cfs_rq);
 static unsigned long task_h_load(struct task_struct *p);
 
+static __always_inline
+void entity_clear_lag(struct task_struct *p)
+{
+	struct sched_entity *se;
+	struct cfs_rq *cfs_rq;
+
+	if (READ_ONCE(p->__state) != TASK_WAKING)
+		return;
+
+	se = &p->se;
+	/* Negative lag implies delayed dequeue */
+	if (se->vlag <= 0)
+		return;
+
+	cfs_rq = &task_rq(p)->cfs;
+
+	/* CPU has been idle in between so the lag has been removed */
+	if (se->vlag_seq != READ_ONCE(cfs_rq->idle_seq))
+		se->vlag = 0;
+}
+
 static __always_inline
 void decay_entity_lag(struct cfs_rq *cfs_rq, struct task_struct *p, int flags)
 {
@@ -10049,6 +10070,12 @@ static void migrate_task_rq_fair(struct task_struct *p, int new_cpu)
 	struct sched_entity *se = &p->se;
 
 	if (!task_on_rq_migrating(p)) {
+		/*
+		 * Clear the positive lag of a waking task before migrating to
+		 * the new cpu.
+		 */
+		entity_clear_lag(p);
+
 		remove_entity_load_avg(se);
 
 		/*
-- 
2.53.0

