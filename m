Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD2F4BA1F5
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955912; cv=none; b=F/tRQ0UwVtRuoVYmVUgP8SRgDr84nYg3hflPNuRU7Dbkj7om3MljZpoIbu1tyThumaiKmpuPfe1FoW3TdCIpv43B5iaAEvKaYLvjLSZjz82QTZVKMbXBN1yqHZGqPD4O62ONfxoLkF9/aN+sk+EI7bXyzKie9Q23bOlnin1ifZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955912; c=relaxed/simple;
	bh=Z3OZRU9tUVQEa8ii3OJE37iSt72mrOcOAJir4arnI9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IswZm//bY2lgApTNnRuHZ1kmKf2jWYkfx8ZiOUXAIAscWX1pXh0ud8BsYdquAuq501j7Ih9aD6cJnNAToajpbp4b62P9CB4pmFDAD78B75HZ5wUd2YfQBpCy+LaWzd7FE2j/6saXv/rSNUpm0icgJ+EzF3cJwo2qw9PrBHcyA+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E4VReeLy; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E4VReeLy"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so362815e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790955907; x=1791560707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+I4t9viO/Urz7W8GjoAm6BBP/QuCZzvUO0dNV1Sy8FM=;
        b=E4VReeLycefPNhQ803uS0/gDXk7hq5EYzlHG9ChmZBJ5kWgPTDZfQV9PgBHbKzNRm6
         len2DahbQHHyrgnmSgWpgr90v+RLNBux0apXoL6I7E2E9wPElH2yaA8RMOSz5be5rfDN
         X98kFQENYwbuJKfUqiFjWcL/RnASHt2jXi9Y0fdwN6IwjWuJhw/FidqPWLnXTt0OkIUf
         I8BtnB53Pus7va0tMPxB6KHGZVE3vkuMl2/2h67i1r+rLqO3F8n/pcpubEN9rWMzldbI
         JGp+o30wUkihX7p1HJIUGha+Zheg9FmcR619Zks/mrkHxEa2wyub62N07xqmX+qhAZCr
         ny6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790955907; x=1791560707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+I4t9viO/Urz7W8GjoAm6BBP/QuCZzvUO0dNV1Sy8FM=;
        b=ky5djTuE4Fe1W2zluYL1fxkvv8PqCR0YRO7TS5gg4qU4cYvBu3l2BgMTqKyWijQKyn
         v/T/Gydsb/RcFZNGKccqo+wUyO3p4dP0PElsnyA84GH3MMXdax/lR20HvTepAjPV8TFI
         s1XnTSSpv7fOJBIYi7ewXTalC24HB+iqFHc00m4sBSUEVExQ7EIMsgtQDFoX3kKjaEK3
         m8Z8LCWfMxvMF1xkaN80mdGyp+zuRtrswqiNrctEwV8c6o3DUV9DIL8oGi2rvR6Q2BdI
         wZFY02V8KW+pZDascp+QHPqseZwhRkYnO3+/JB62rC5lVjAhaKenrlzV2HUnnPLxrjhS
         loYA==
X-Forwarded-Encrypted: i=1; AKwUvBxtSj0cZDIIOkE7GIC6ioa+ESVihRo8OXvaG5UA305VEkHSLwDNYGF58NGNsvyzvefV8vePU/8NWuoy1vQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nMDSMT3sfA3wGJ5cwkBBEC9QFRlOsoaa0Sn5nQ1KflK92VBste
	9eUmq/qgplldQBsSDbmTpuZrOaoudYz10ZWcH+fT/Ln4YCVA/CTdo7U79gkYSf1YKbrVjjImRCj
	/WZFL
X-Gm-Gg: AYBFou0sbiKfesKuKaoZzhVCU2+nT2MlvKyUQOXAV4EukGQZqLVnEQdvzvMdQGE7lET
	tFeJAyI3eJWBhttFbz780g0LJnFFYRO+ap++E+nGgHPwF5Sz4lib9pK4b/MPFnWRUNiF17GVQzw
	UzRxw1Jf+zgVDB/o2va0S8OP9QtZRSDQubaIcRVLX7v0xO/H/QH3jKs1LqhLnpIQghdSDLWqD/s
	A82AZ+6Po8OWozFFBzoqNRQI1Y3KZKGETO04sxEA88GWZNqy+Ivd0H5jjpFSj7GbWY77EM7grJp
	FE301xXXKxRUEVCckmquhPxdLDaVQq6HgSoQodsWz/KPba9afXOt8DB2Mw6UqMs0S0I46bJqg0r
	a32stalDcazS22eoB/mGSUIaS15ZLwu4Xrzu5d3Smcvtx80QRxw7h61c8TmSAHsA/xzM52Hy8b8
	dwKdSnxvxj8cQsiUtb3rWVtSEQLiK50vFrF5EJwKdeQmX/2Sj+UOvoc5+35ahkRHhbOMdP3sJVg
	2i5mPlysgQXByDB
X-Received: by 2002:a05:600c:c16e:b0:49f:ffdc:939d with SMTP id 5b1f17b1804b1-4a02755fd8bmr52292735e9.9.1790955907438;
        Fri, 02 Oct 2026 08:45:07 -0700 (PDT)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:718b:4747:291c:e5d8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280bcf0fsm101958045e9.6.2026.10.02.08.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:45:06 -0700 (PDT)
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
Subject: [PATCH 04/18 v2] sched/eevdf: Compare min slice during wake_affine
Date: Fri,  2 Oct 2026 17:44:01 +0200
Message-ID: <20261002154415.2270586-5-vincent.guittot@linaro.org>
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

Add a new level in wake affine where we check on which CPU the task
would most probably run 1st between this and prev CPUs.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/fair.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index ad72b8536d6c..eeac0aaba3cd 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8422,6 +8422,9 @@ static int wake_wide(struct task_struct *p)
  * wake_affine_idle() - only considers 'now', it check if the waking CPU is
  *			cache-affine and is (or	will be) idle.
  *
+ * wake_affine_slice() - only considers 'now', it check if the waking CPU can
+ *			 be preempted becaus using longerslice.
+ *
  * wake_affine_weight() - considers the weight to reflect the average
  *			  scheduling latency of the CPUs. This seems to work
  *			  for the overloaded case.
@@ -8457,6 +8460,20 @@ wake_affine_idle(int this_cpu, int prev_cpu, int sync)
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
@@ -8508,6 +8525,9 @@ static int wake_affine(struct sched_domain *sd, struct task_struct *p,
 	if (sched_feat(WA_IDLE))
 		target = wake_affine_idle(this_cpu, prev_cpu, sync);
 
+	if (sched_feat(PREEMPT_SHORT) && target == nr_cpumask_bits)
+		target = wake_affine_slice(p, this_cpu, prev_cpu);
+
 	if (sched_feat(WA_WEIGHT) && target == nr_cpumask_bits)
 		target = wake_affine_weight(sd, p, this_cpu, prev_cpu, sync);
 
-- 
2.53.0

