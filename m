Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336EF4C7558
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955930; cv=none; b=d4FwifUqW8iYTI94P1UsKzCsIPviRqNCVuIzrPsvyo1QVCzSgwZ7s1gNXmShXdPLYKJgsmN5QNi3FSDtJdNdqDOW0X4clZ71eqboA/4DUlAkxS1VZA9rdiw/YvD3SbVy2WkAPSZNjME9KZB755V+CBvmlgRIduAHQ1LmVcY5Ui4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955930; c=relaxed/simple;
	bh=l/sMIazjd6/XZe5VjWiBFYnMVb+KTN/KyoP8XpNG3fo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ms3xalh/4L8+ZvzwKtiVWT51TbyfZTDZXt4UM/hVYJNxlS62G/xQEBWuee8ir/vDyBaQY+nNd9/N7wef2dZG2ckI/0stMSutTWhLiI++KhNchOHavNkTpbXYwUMqtDyJBrz1wG+VMANurZgGULVJpTkCfIZoNfH9cvydJa6dkSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IUdb4g03; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IUdb4g03"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso180415e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790955920; x=1791560720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xi089Mm6/ZAPKnWvbv/ns1gYplgqzCAMNfNdfYd/S2Q=;
        b=IUdb4g03RuWTxrtJLxM/bDoMCLLUOOqbwtTLKYAhpsPktItG0e1dzQgSQGylRPng3L
         sMO7a4WAnRDi1TWZ2Rv6iwfocyS4+5LZ/5TqcLiMv6Kn1YQKH0lLZsZcYGQxeseCbMKa
         nww7oaYt1e2xexmnaL7cZcENEkPZO/crvwLOKqkD2q4BMT7wQp1ZY2bVuounASXyIh3B
         reT358caz5YIKnKg/vqGCd7farQ///r6xaaGXurLXCPbtrV4IgwoF1XsRD4mPAA1wAJ2
         mfNQIoMw5cgulVnHoxn0QNTHwz6rXxBBPKnm3UHu0LReHc73WGzDUHt70ioqFhmsHgPf
         CF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790955920; x=1791560720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xi089Mm6/ZAPKnWvbv/ns1gYplgqzCAMNfNdfYd/S2Q=;
        b=XBNYzW3yX13oiK2WAAuNmmyzraE/IV+xqakoPRKHgJF8PQq2w8w+UN7yJpXmR4gYlD
         b/v/I96nvBiquTeFk4k208tRgK5Jl7DsYFQgcQY6hnx7Se8gvNw+n5nTDMWd7iw2SmoT
         +yoMdeo3bSY5EKenfriKxu4hraVb8u17FaSwpIIm/Yt0V+Xh4Z3JcPR/EqtV/CvIRQey
         mHPNfJc2daox9JAi5wUuCA/Yw7gcTuH0C9tQDwWkXVd7mNjA3SiF/hEzDF5bEoXocLaF
         TjBBIi00eYnFu69t8wKWLKO0xZKkRbzeZxVuSOOwITc4tZflVL2290q4g0PVsVIEp8O2
         i1Cw==
X-Forwarded-Encrypted: i=1; AKwUvBzZgIxDAk8DBcg87PiOuNiiheiX7Kiq/xVrUquXIqFMS866v906E8eRk93KKBa/dkXPKdItIDkoR5FeayA=@vger.kernel.org
X-Gm-Message-State: AFuF++mu32gdUdor3Ccwq34lU63tKY3Ep7Hzbl7no2KK6nmyV4VIJyFM
	Ki1ZpgntKl222+a+xbiKW6Mt+dgmPlKI20hUonUlZCP3oGNI8+ExzLrP6HIYUuXC1Sg=
X-Gm-Gg: AYBFou2XyxbmCnInZqG3uwnXsZUkok8g9PVEWAVT0UeyVz33cPf97nOfHx9uegwBnPO
	0in2FNd/Ojv5BKNLgoulRbNfKdhoP7JnfPePuBkG6Lnn6yFCuTwKgmp25xywKX6xsZTttBRx1f9
	kMtnV/qeSZzKvv1ek+4y9UfSL+z+B4V2hYvQvzRKSyH4j6tfphN5KJQihU/Iem/GM+AAjHnxGPE
	mvNHgrDUH2lwmNI70gI0hqEUURQhF+xtzleMh1j1IIxpO28VS7nY4ahEZpmzlc9Rw8lA3vbR/cg
	BZYM2R1emvj9BNmMsizeXYI2F4lDin5vYqGZ5zK4eaGkeIJXL8cBMNeYbnGIqHLFS/65hdSFMv0
	rnzJ1Epb0QM9tte36Qo3O3AfuF3EXUh5e81pM5dcGQR5MOzggkHcTJvbPlu3qmZYEMdIW9dkJOF
	3qbwpl3SXhtdf6Wkps5vgDMQDDL4xJCY+HOxB7JAR76BP3qsLwMlhxXdlS3edIM5VcWOfId6Mud
	TrFgZcDuZls0LuZ
X-Received: by 2002:a05:600c:8710:b0:49f:ce73:5e96 with SMTP id 5b1f17b1804b1-4a02759555dmr49483355e9.34.1790955920408;
        Fri, 02 Oct 2026 08:45:20 -0700 (PDT)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:718b:4747:291c:e5d8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280bcf0fsm101958045e9.6.2026.10.02.08.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:45:19 -0700 (PDT)
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
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH 12/18 v2] sched/eevdf: Try to push short slice task on a better CPU
Date: Fri,  2 Oct 2026 17:44:09 +0200
Message-ID: <20261002154415.2270586-13-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002154415.2270586-1-vincent.guittot@linaro.org>
References: <20261002154415.2270586-1-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a task is put back in the runnable list, we check if we should try to
push on a better CPU, i.e. when fair is preempted by a higher class or the
task is preempted by another fair task.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/fair.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 38eb80dbd1a4..186f10173eed 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -9826,11 +9826,34 @@ static bool __check_pushable_fair_task(struct rq *rq, struct task_struct *p)
 	return true;
 }
 
+static bool check_pushable_short_task(struct rq *rq, struct task_struct *p)
+{
+	struct sched_entity *pse = &p->se;
+	struct cfs_rq *cfs_rq = &rq->cfs;
+
+	if (cfs_rq->h_nr_runnable <= 1)
+		return false;
+
+	if (!entity_eligible(cfs_rq, pse))
+		return false;
+
+	if (pse->slice < cfs_rq_max_slice(cfs_rq))
+		return true;
+
+	return false;
+}
+
 static bool fair_check_pushable_task(struct rq *rq, struct task_struct *p, struct task_struct *next)
 {
 	if (!__check_pushable_fair_task(rq, p))
 		return false;
 
+	if (next && next->sched_class != p->sched_class)
+		return true;
+
+	if (check_pushable_short_task(rq, p))
+		return true;
+
 	return false;
 }
 
-- 
2.53.0

