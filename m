Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978418;
	b=MesxiuKexpZae37Cy790GxxiVa/mnH18fHNyGB1UcUkiUD+NpH6fYMq8xH2hpTUncCMd
	 wMLeT9LFSk/tHJdKQUORKvfGk+4paxjqaNC8kV7aJt2IeLikPYzuNV/BdCA9hYK1V4kzG
	 A1BItu0zNMoi5oJQE+E1JgjLt7rpevhouz4jBNsmWwijA02svjWgi8DowSjAhbqkaaXEp
	 Nr+OPtwWrl/VZwLWIZYiiQqp8N39zqnVKvEdvp1wT9ixwy6iZz8Hc0iiQ+sR0f6Hcxm2P
	 oxmeRPu7HR5Dc9ulR37qhz18xpSxD8k2hlrjgsP2vHKj4HAw0BMm/IhrYYuNlr4PMbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978418;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=43QcRTZ2xbLW2eh4U1VgtQuQohzOHYlTBhBh08gkyrE=;
	b=gcUYmq6fgsMXKxf+glVn5DkMRhLQ2Ho5rQzQ1elkdv3lV4uKHlMJgKjTMqOCyiiB2pU4
	 iLtW1YLPUr3tvlt1EdSG8PVhkdhXTTFm4ZgdgArnYlo6G0dMi0zTP8e/JAV457X8up7qs
	 sqsfZHjQuWDfT7tFQ/jCHLDFwqD+7PsHmm0lbxFye7K+/DaNTX+JUczlo0Wa+Hh/p3aVu
	 9wDdatwiF0Xnl/+3f7rMNLKNfPgqNo0RmCByKseIkwvFJYJ3DuqBz40d4yKXAW3veXnJB
	 E6oGGrn5uKzAzS2K6t/KZv8tO+oBm6IBj0bQZPdAPdkdoOaDUO0v8MuArrCsrmWJBZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=B99UTQcq;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE6B6082BF5
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:20:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FE6B6082BF5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=B99UTQcq
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-492f0a1b685so424544f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793978416; x=1794583216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=43QcRTZ2xbLW2eh4U1VgtQuQohzOHYlTBhBh08gkyrE=;
        b=B99UTQcqb/Kdi3E+lLCDL5A1ROyssp6z47+0gSXIlizQKHFZBVC+1HcElAn+egUcie
         7S2Je9kSBpoGg1OZ+8tzqBRAuzbqDbng+jUFZUb8Yo2++GInPg1triAZc0MYK3A5EAAd
         VJkJYiQa9blT7Du84H3pp9Q1P4YX+gBudoDriFcrXNV9QjEq6EGjurRVnnhxpgIG4eiD
         4lgEncjwl+4mawiOHkdsFyw8vI+G9ij5RuJb8HVwLvxJWfkgKO+eOUloLFCMnEYm4/QX
         tclCGEUpWZCYu+aVjQwrmiZpXyx56WrAtgBYlcWsrKbEcTG6EsZ/TIR2SI8xJseb4/ml
         JKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978416; x=1794583216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=43QcRTZ2xbLW2eh4U1VgtQuQohzOHYlTBhBh08gkyrE=;
        b=fSMpZWHxNWlR+DeqptJDmskilUFWd92dZlUAhPbO6z9rdvnI4XoSVHkNhUZLEwbtus
         po3GYV8FjET+b2acQQPcHSsAjQrmignBF8xrl0AQjljwGBWemMCuEyaso0Tvz8im3Sue
         nvXj37+QL4W2n8WVMGjgH6K3qJDuoEWsqSh3LIITbExnRKMObyBvBG4YfRtsc2QR3euU
         HFUMcWrv6FtOfH7+CwJt1o8qzzeULUoH7oZXVgvqC/oFbxNf4n6arZLGjG954sEAo2JF
         bKlFVbcvSQCu8tHBaJyRQf24mz6X3MZWDQsvWEeNsB8PAhbiw0X1eAMOuX2Jkzvptb80
         9KJQ==
X-Forwarded-Encrypted: i=1; AL+hErHsbO5lrVF6IqBcoMW/Ok7NeqpZWycojYCSIPRSZn/kzNbMsDYthVJdyuUw9f1EfLU845qzunwMqXxyw/c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8baUeEHtjhs+g5+4BTF84hgQSkhjEhKdelgGMaCuh2Pm/9lb7z
	jzRwmj+3w7FfKMrx0YK1lglxrqzWYkEVtmzIUaEBHsABKIcYrhzCEv1vYao0dggtWOI=
X-Gm-Gg: AYBFou1uZRDc8aIk8n3c4oMtHMYtehL49eNjrSpxRuHoaKePTUCEbzU9P13Hj5aEj8n
	B0am79T7jl+rTJiKBI3ZCsaVTZ50/0gCtnsL/1zmDGNbj3swC3Q5B+Siop06D1DOqu9aoIhM5Pl
	yXyclRb7p+xpT7fPC2TQr2Dknitz4HY0iya5v/Mg40T05vcBolAMN4pf99y8T/c33wY9uVGRd3R
	c6fanMhG9g6yzZLpyz5XzpArHvfJ87TnDzFQrVyc/ki/WwoaZR+YpCDbEAZ5BhanWYAm98rI3Q9
	ZtRGf8G9/p5nf+DIX2xdANlJi2l142X/ZlAE4C+nfrd7ltLpDGlpZqnovral3Opjv1VqeeUglFd
	Ja1lvSPJoF0D2J3ENm005pHmo7dCYTO/zP3PwFyeaGu/uVlVsXphKifNNX4VGrDY3/cLXFGB1Bd
	uVEMIXjDTJWq5cyx7Ncth7Ks+zQsfFnQ09eG/JDq6TFFNuIIskQh1QmcVluKSEV1gh9YIA/xaPn
	WaiwzywWHDipR+1BKEYZIW3+XtOf4J/2Px4/2UBozSwktc3FM/9EI3GTdWtlQ+YN06SMgThGL67
	nCUfr3JbGqPEw4fJ+YrjTmLP8ZVccGUrQ+DCN/Woe8ejL4o=
X-Received: by 2002:a05:6000:460c:b0:48e:c84:5be6 with SMTP id ffacd0b85a97d-49275fe4e54mr5481109f8f.14.1793978416458;
        Fri, 06 Nov 2026 07:20:16 -0800 (PST)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:ed97:32bc:977a:3b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc5e23sm4477405f8f.45.2026.11.06.07.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:20:14 -0800 (PST)
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
Subject: [PATCH 14/20 v3] sched/eevdf: Push short slice task that are not picked
Date: Fri,  6 Nov 2026 16:19:41 +0100
Message-ID: <20261106151947.3991524-15-vincent.guittot@linaro.org>
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

Even when set as next buddy, a number of event can prevent short slice
task to be picked. Add the task in the pushable list in case it is not
picked so it get a chance to be pushed on a better CPU.

This can typically happen when several short slice tasks are pushed on the
same CPU at wake up.

If the task is picked, it will be removed from the pushable list before we
queue the callback otherwise we will look for a better CPU.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/fair.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 3923587b66e0..894bee51b99a 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10273,6 +10273,12 @@ static void fair_add_pushable_prev(struct rq *rq, struct task_struct *prev,
 		__fair_add_pushable_task(rq, prev);
 }
 
+static void fair_add_pushable_short(struct rq *rq, struct task_struct *p)
+{
+	if (sched_push_task_enabled() && __check_pushable_fair_task(rq, p))
+		__fair_add_pushable_task(rq, p);
+}
+
 static int active_load_balance_cpu_stop(void *data);
 
 /*
@@ -10723,8 +10729,10 @@ static void wakeup_preempt_fair(struct rq *rq, struct task_struct *p, int wake_f
 preempt:
 	cancel_protect_slice(se);
 
-	if (preempt_action == PREEMPT_WAKEUP_SHORT)
+	if (preempt_action == PREEMPT_WAKEUP_SHORT) {
 		set_short_buddy(cfs_rq, pse);
+		fair_add_pushable_short(rq, p);
+	}
 
 	resched_curr_lazy(rq);
 }
-- 
2.53.0

