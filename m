Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EA44BB27E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004182; cv=none; b=qbd8HRwGXOh9R7RJp6saunBub2cnuQfwY3boGopF4AhOx7mi0qWWxxsn8JbJpiEZPayrCgjxsxNzRvUiFvR4/IixOEEvVWKq0QmRtz5YsE6dFuJ27e+L9YbBSAhfDh68T9xOXZw5xUbmoD8dWm0Uf+fVWvp+g19DFymV/d7koFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004182; c=relaxed/simple;
	bh=UMlJjVG9gzwcasVi4RDqGJGopy523m6VNfnWtI/sYW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m+3845v6rnEJzJX0FIS5+X+JGHCgziwOxlHg9m7ywKuZ7cmz3q6WEJOyA18YoQuR6/bPtApel6T/6xACIBkdQkDvwEkHgcEY2LHui6iI2DxDzCojr8DvdPRjNXMj9d0sL0qJioEAcaGyjAGOdnuF/HzPQLzHIcV/qLtvkVQhhS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L5zp1BWm; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L5zp1BWm"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d097b4939so16280395e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790004179; x=1790608979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fa7koBn9vHguCbWn4P865SMrYtBgXn6RCiTJC302GpY=;
        b=L5zp1BWmtoOxqIogUABT4G/HwdgIFWFpJ/W/AyfvMJ4cHdvtqluzyt4sBkOKsb5wPx
         D/b8y00m+eEDeeevhn51TUIbs3wWnNDeqsHitELT+FJSNAIQMv135xLzBKNpZAI2Nhaf
         QJK7tRRlvjiKIlpfSEw8kgC5+rzGsLqaevhWznbPpFf1jAlrUZFt0B8Eizcjf/jeDCTw
         o3s7kjmrU5HVI0AHInTjKWMP402c6Ce6dy/NBD5ob6kvCYsbYiE5MAbKk6087jTfA8C6
         rXo79xVnzajh7IeRIbOOylIjN229BYzX0WM0Os4M/HRQd0aCi/WE0aUKr/+s89HUgFQM
         CAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004179; x=1790608979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fa7koBn9vHguCbWn4P865SMrYtBgXn6RCiTJC302GpY=;
        b=gtzDeeom1LUMyZYmJC83lBa+O2qdZIyOlTE+9HEr7AO8/FomifPdEVKjm9LjsJOsUz
         K6lWJNrchYPR6JOM7ygKSXAXJLYqbISHupvMF6m58kdJgDfRw+7sontvbxk0mCcnX9OX
         ZS6L9i2O4ACThDnkTXt9qjrPl8sGhnVysGwtc/dQkn/rh1KghekK46xEOh3wnd0id2S+
         4D2IXdxxUoXEq2Q0gDDJyUkqEembGKPM99zRZU9ANoSM/ZR4CUZRlbtgs6UlQzYANSjS
         rASk3CYu3qQICkrVHGbuPyv3mnKyw6BXO2drkU7X9rDuLkhbzJM9mgeFPETv6NTlxtRU
         XUxw==
X-Forwarded-Encrypted: i=1; AKwUvBxWrXiYDYB/ObVAKxHgA9HAipzbbq+737TrVM6HpkCSntnAacFuDj4Jl4cVSt071+QeIPVUhmX/gl72TD8=@vger.kernel.org
X-Gm-Message-State: AFuF++kLaie8qu4UznnWGTMagenqpH+FjaFOC/7+B1JFiU6jTP3AjRc2
	6ooA/xe+Pui3OdgJDeaeIiMtpYAN9sVcCAXvfy4fTSIoda2GNd9lisYz5ofqzhe9/E8=
X-Gm-Gg: AYBFou3vfvnemOfC49ZAw4lSqWiX2CUa1Q4yweqP9aMoiFSNinLs2ZXigYDFQBMuilQ
	emLAvtdk4KwQiyhMvRf1xEK9T6JXtFTgSUxsotYS+92FEb5ed6me5X+VV2Cvmu98mR0PbJl3PxN
	C9rb7WNUfh912hcaMIONxYqfpZaF20V9a98AP34No/jbfaTBtk00bt+zmNn6x4umMKI2+9qMJ6t
	BCtPXlIL8C/9dWDWRM2aWn4WNfq5ofvva/ENK4kzT48Y7VwfNiBJzh/H5gBgnqktF6Vr7ydWMNq
	O1hWbBkaHa8xGS+v3lgSmb9eGooU4hvQzZLZxjBMY0D5OXI6dbZKcOhn2I8zoIMdDld1rBfN6+w
	L+CoB+jJbavxqTHIIET5fsjbU42OeCtKjqrfi5AcMGIzztwmYDVljb7fqsxu3L1GuBKzuyGqn5W
	YAEcikbuGro73iuVyaNP8/vfPAPsMgcu8EtvB6qx5u9WUwkO2vv5eJm+EdJm2AU78rVAyNTQ9Nc
	odE2WCzCdgXsps=
X-Received: by 2002:a05:600c:4f09:b0:49e:8418:3858 with SMTP id 5b1f17b1804b1-49fc56b84c3mr151695145e9.9.1790004178652;
        Mon, 21 Sep 2026 08:22:58 -0700 (PDT)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:df5:e9a4:98b5:65d1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd8bf159sm223745675e9.10.2026.09.21.08.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:22:58 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Cc: qyousef@layalina.io,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH 7/8] sched/eevdf: Compare min slice during wake_affine
Date: Mon, 21 Sep 2026 17:22:37 +0200
Message-ID: <20260921152238.3804392-8-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921152238.3804392-1-vincent.guittot@linaro.org>
References: <20260921152238.3804392-1-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new level in wake affine where we check on which CPU the task
would most probably run 1st between this and prev CPUs.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/fair.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index a01a88dde811..452da94289fe 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8402,6 +8402,9 @@ static int wake_wide(struct task_struct *p)
  * wake_affine_idle() - only considers 'now', it check if the waking CPU is
  *			cache-affine and is (or	will be) idle.
  *
+ * wake_affine_slice() - only considers 'now', it check if the waking CPU can
+ *			 be preempted because using longer slice.
+ *
  * wake_affine_weight() - considers the weight to reflect the average
  *			  scheduling latency of the CPUs. This seems to work
  *			  for the overloaded case.
@@ -8437,6 +8440,20 @@ wake_affine_idle(int this_cpu, int prev_cpu, int sync)
 	return nr_cpumask_bits;
 }
 
+static int
+wake_affine_slice(struct task_struct *p, int this_cpu, int prev_cpu)
+{
+	struct sched_entity *se = &p->se;
+
+	if (se->slice < get_rq_min_slice(cpu_rq(prev_cpu)))
+		return prev_cpu;
+
+	if (se->slice < get_rq_min_slice(cpu_rq(this_cpu)))
+		return this_cpu;
+
+	return nr_cpumask_bits;
+}
+
 static int
 wake_affine_weight(struct sched_domain *sd, struct task_struct *p,
 		   int this_cpu, int prev_cpu, int sync)
@@ -8488,6 +8505,9 @@ static int wake_affine(struct sched_domain *sd, struct task_struct *p,
 	if (sched_feat(WA_IDLE))
 		target = wake_affine_idle(this_cpu, prev_cpu, sync);
 
+	if (sched_feat(PREEMPT_SHORT) && target == nr_cpumask_bits)
+		target = wake_affine_slice(p, this_cpu, prev_cpu);
+
 	if (sched_feat(WA_WEIGHT) && target == nr_cpumask_bits)
 		target = wake_affine_weight(sd, p, this_cpu, prev_cpu, sync);
 
-- 
2.53.0

