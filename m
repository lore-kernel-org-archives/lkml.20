Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978399;
	b=k3QCXxaSaMNXhHjO4IWhd+5YS3pFUvuDXdw8WOcxg4P0nhPJYFKQDdD1FNGDOk2uOX2j
	 zR7FMO8Ex4UHowBJAEHl3HABkxne3repGEkvpPsXIozBRV+9Jj1rNjUaTxTgViPN3vHlG
	 yY4kdJ/76yJHAo0N9uONiV1sE/fixi3yr4gUUF5GTlpa7keAFL2h9PnMBeBMFUznU0CFE
	 fi+ZCHgFFktQlbmhTPpCB2WCFWT+CyHiBQsdTvlWbipAoPm9EIM8KmgaJzB4eAQH9K+jf
	 kuTxfuMgIcCMCKk9FGs6DJfKDrTloq8MIBQ6B8WtIOidW2WnyUSD+6g5TSxeL89r97g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iQOQ14MU4M2V3E3LBaEma6rT5obzfuyFx7uEPZEbprw=;
	b=r/SEJmlfkXaVywK5EaYm67Swji7f3BJ8ArnbHDViVK2q1AfTISTwhz8erkPt+vh2lmIJ
	 80ilQiTPNnV39I6HWrIpSP2hV0jUg3XWNWYa8y1HpT0ofpKMGyJUpBXHJFr0s/0SL+ow7
	 L41neLl8EDH0ttqzl6exDu3NT4FO5GbkusS/J/75VIOaqEAOP5A4zLu6+xqLS11kH2YXd
	 y609HXlAxgRI+CEBi4PIxh00SFIuMN+YpVUL2l5zzUwhlF7xr1gNi9xH4Hi83auqsSBPq
	 AgFI3XIY36uVJLBtV6BBTSanIgL5ajSlrgr6hUjLL+kbDFMvGEr7oGGO0E1kA7Q6oMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RnAnz9Lx;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB53606D803
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:19:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AB53606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RnAnz9Lx
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so5934595e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793978397; x=1794583197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iQOQ14MU4M2V3E3LBaEma6rT5obzfuyFx7uEPZEbprw=;
        b=RnAnz9LxQMnGYZ9dxhc9AiUSIU9JQZyo3E1EEKZQR++1OmdLkecZqS9etqzBSTGnSB
         nIWvW+zhuPVl+83PpQsfRKtRHknZKnHWNiYnjqpUcEwzONYm60t0L8hQkPhgEbVgCjaF
         cJ2VK5cuMt+fOiOS7yG8QNj45+gTD5v8Z7YkdYgnQ9FsULO46z2Rs86x0LDMNvTHa/hO
         3BttJYMZr2eJ5Kdqz0jNi5N984hZz0e1k2A2pwmKJqR28Xkc8Dyt77OiUmGOMryuUQaH
         O5jTBzsgULOPAnzy+9x8nVNOJwdYOJDxahpxNHg0QBNGlSCKZVaM1Mv3DWfKexBr/x2F
         Hn/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978397; x=1794583197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iQOQ14MU4M2V3E3LBaEma6rT5obzfuyFx7uEPZEbprw=;
        b=EIA2XHPZNKlxfdl3b8V4YNcxwQd19tiXkd/Ny1rbhRfbylU+H0ZibDRXuBjvZMvKCL
         mCeqkadODx4I2HqdjiYC0o6DuCE5wHRBABUNf8IPoSE3XvTe8Oa2PKVLcGxeEuZJY23J
         3Syjh+azN1wzShpEiY2s8pp+k1nBhiASzPvTPg+sbPHc/ZYR+HQ/hk6ZuZ5oUmDvxs1e
         4abg/pmbFJRL3+sak1PWU1vEaXIX0nhGVp9SnAV4wsNVyv6ZXW5Wv96/8MgbfiejHO3J
         B21qnF8bzpeEf189E06oqvjzrvaI0OO8ilk8tAGZ/CPEYzW/lIPQLRl90sN0rzzL3NE2
         oEsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzIOHXmkeJ+82IaK5ITkWdBTiwQsfgbdNQl39/l7OMhr/nnd+YfX2ClvxpPWuI3sWQuelDSR0ooGglaxpA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mxk01vATql/kYVk03RSVVJQOPSXmC+vqwsXEVoxBWsPyw0DSr
	DWnVj5wwQ9Q1urH5FlIywZ/puelvLu6ikmDY1k7eKB1uK+VkZIypCY66Gaumibm4IjI=
X-Gm-Gg: AYBFou3h7pPr/6JXH8VvnAeHFqmS18xdTJcyt8TTBMZNLtkYIuTBMc2kGUWIw+logGR
	dGusvR5/g9c5MtN5gNwMLz+JMijJOkvLGNUNJEg/RkYKc/L5Hzye05HkH1ASJHaAD0tlKRXRzXN
	5o7sPGxGYEfzU7CDJzjv9AgeZrrLyNLpsL0v6UKNy2V9KRbwxg3WRy02NNH8af0kAR+pCERxGPM
	RXJy87N9zRCOG0f27lBlw2hdIiGQo/S/x+MY8m5aocsk0JQwLkpnQTx9SqUpTPCnNA0P9CPjlA/
	ZQKHtzMawAmpoUwREmL+MqfXQ1pEvTmGV5AxKuz3V36Tm6GCU/y9GDYPyTXe+10/zvCaLrwp7Re
	BERCXhZqr/7EcATsK+NrWVTtmvA/hV8JvIagZIJG9BaO/oxIzA/Bs8fbBdsUB1iayXlokYr1QCA
	iqTMNIvdOP813jfVDOgpie1aQ5Ru7glzSLffMenLkm74NmISkGu7Cmw4PUgQ2VoUuh7jKj5L/Jl
	EM43d3efE1dOALK/tsrQGMENc1WzmpjIU/aBWOABHs47xxdI0VtDO3RMQKkbunDe3ynGr5XykBi
	lrjCJHDI1biufE9rq1S7XvphvSCC65JZJtqUFB5UdSvRgCc=
X-Received: by 2002:a05:600c:3d05:b0:4a2:883:4adb with SMTP id 5b1f17b1804b1-4b6dfba86fbmr52101995e9.22.1793978396996;
        Fri, 06 Nov 2026 07:19:56 -0800 (PST)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:ed97:32bc:977a:3b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc5e23sm4477405f8f.45.2026.11.06.07.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:19:56 -0800 (PST)
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
Subject: [PATCH 04/20 v3] sched/eevdf: Reset lag when waking up on idle cpu
Date: Fri,  6 Nov 2026 16:19:31 +0100
Message-ID: <20261106151947.3991524-5-vincent.guittot@linaro.org>
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

When several tasks wake up simultaneously on an idle CPU but their prev
CPUs were not idle, their final vlag will depend on the enqueue ordering
as the first one will lose its lag but not the next ones.

Reset the lag during the enqueue if no fair task has already been picked
and set as the running task.

As a typical example:
- CPU0 is idle
- TA with vlag 0ms and TB with vlag 5ms wake up on CPU0 simultaneously.

Depending which task grabs the lock 1st, the behavior will be different:
 - If TA is enqueued 1st, TB will be enqueued with a positive lag and will
be picked 1st.
 - If TB is enqueued 1st, it will lose its positive vlag and both TA and
TB will have 0 vlag when eevdf picks next task.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/fair.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 945de0215abb..6ce4162a7703 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -967,6 +967,14 @@ void decay_entity_lag(struct cfs_rq *cfs_rq, struct task_struct *p, int flags)
 	if (vlag <= 0)
 		return;
 
+	rq = rq_of(cfs_rq);
+
+	/* You can't claim any lag when waking on idle CPU */
+	if (rq->curr == rq->idle) {
+		se->vlag = 0;
+		return;
+	}
+
 	/* No fast access to prev rq task clock */
 	if (flags & ENQUEUE_MIGRATED)
 		return;
@@ -977,8 +985,6 @@ void decay_entity_lag(struct cfs_rq *cfs_rq, struct task_struct *p, int flags)
 		return;
 	}
 
-	rq = rq_of(cfs_rq);
-
 	/* Compute sleep time */
 	delta_exec = rq_clock_task(rq) - se->exec_start;
 	if (unlikely(delta_exec <= 0))
-- 
2.53.0

