Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383F43C1D7D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163055; cv=none; b=cWLzCNbDLBPMKE1qJEql6Gvi1zsYyQGzQQF6zrK4CyGc8L16Vn20ZYxUfctFS2vZZ2rfjVY1y4athrBqCyK01rUZlE9tfV7Jg4jBsCx/ZmN+iXxJHwJGDaQeRAgou9Ugf+/oxR5N4pOgzcsquNTjDHOJqd5Ma8dZe9lIEp5UcTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163055; c=relaxed/simple;
	bh=VZvDGdlNNdgYYB61lf0UbDGH4jrWQ79nNYGpBOyvDyY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VvfKDL4jqQsf/4pQ0seJqvX8m6xCpHum4f2h3zeP80WzG0M86Wu35/T+JKcUsU3ekUp8ZlsIpfFQ4ZnjP7HCmltFod5jeKaIMUv2u8yrgAGcqtF5rtZ5FDR8b4wc9bVXQb+3O2RKyPOQL0+90e7Gyvppxt2Kv8cswMDfUjDz0lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bDNDrWmD; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDNDrWmD"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a16bc7ac85so22635e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792163052; x=1792767852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6wFC+UDbAQTZsmpTr/h3rXNpmFbf/RctCjprJFZS/D8=;
        b=bDNDrWmD+R+E3kMr+2cK7rLE/ZmOJUGymydimaHzKiQRykRWZ4NGT/ScW15k8UzWXj
         T3RJY/FDcczWwU+ZjZusN79MWoh5/tKE5NTuhoQDQgVKqBkz6OI8xRB+U4G8v7D3OfWb
         uHQzkMcevotN13RD4OdxuVWclhqA+Ivy25UVBmi4WrJUQndAjrvK8VmeSicwwGeZHc6m
         qTlaMepOhnxAdVk5XZskiHhpYEq4FAL9lkhu+Kmz5S76xre/8ZgbtDE6IhH8+OOpg2a7
         ZCCrPNjLZGC+HHfcED8bGFtRshKR5cQKzTVof2SJI+atgjvuGiQhZbwIwOm689eBaAhS
         +Y0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792163052; x=1792767852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6wFC+UDbAQTZsmpTr/h3rXNpmFbf/RctCjprJFZS/D8=;
        b=VshuA3ejmUPFrOYtxcXG/F519OXpn5+zW+a4ej7mPXJE9ZF4hXg3znstvLNERsACjt
         203qbVw3FIuMEhGlV/uvhCqhETMphOELhW8SrwRb7eCQsM1U+M7vfA3zCcM4/S/9Gi9M
         q1pxyQVb6OcScSMz1NzgqBarjg3530L1KXO1q6ROIb1TOXFKIaZdElpna8VNdqGdQJfj
         rKci3/rfXPU0MVWNQ/7EBxil0AYTfj1XH0B2nsPmLfio1ye00gHzQ5HsXP93zWnV5pVJ
         w3WsxznNaKg/AzPgGPJGvb3AkEZhVvXiW8W24yr4ZsGgM6RfCHfeW49SLjcuDbZTZvqO
         Vtlw==
X-Forwarded-Encrypted: i=1; AKwUvBwFfvY0pG5nUm1ou0IAX62aPXlT11Vj/Vi1w6NhIHfndFRl75r9BWwBFOMrqdGldMcge9vfEWqq07qKvUE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCWu1HUZQ7RqOlJI3ifuNrNtsdQMjP45A3LKak10kxyl9lClAa
	PfdKwd2sv+pgeibt40kKEEwdUQzMkRHRJhtJxi6Lz1HsXh+6iE3t+9wi
X-Gm-Gg: AYBFou38YRZLrjhjwWJYRbNwDWzzaO6IhdBmH87qMM1+gy7blQBGynt/StCScdeG7Fy
	UKjO2IHku/rvvj9ggzKZ7Fms/lNv19IPmmmPub6iYTzHljemuBvTeXnzEF4Cx58iwyQOmLll22w
	y5so5PKfkKZ7jCffc6PKhfwRPQ4KVAdMcCkMqVaNL0YiCO1IhRUYN1YOzBp9piGpHuD/4SkMNH6
	8RNNAkKHzfdkrpfo4ofu33mAGW8u0hkY2nZ2zvBpgTSsV/NBdBCWr7dv+6rb23yfG/NtSeUaIKd
	eXznxGu09XPF4ecy1oBsIP2zSd3DCfK4W8AcJ3jOU2gMLEG26zoUqOLYrOaXDPcY0daZvkqkAjc
	EKN6uAZWz3uoy6EpTM5DSmVlNhtWmE3YrIFBKAODHeR3RDaayL2OQQ/OAz7RZ8fcgbUOAp4dsrS
	U5NZm7uS9nYed+aEwFgUqmleIce3r/pNNTgXg2TNyNvUhR+BEWHMOwXAdgPrT9QHUMEVF/wVZrF
	P9wRcf1XMwc0meIxiZqPA==
X-Received: by 2002:a05:600c:4e11:b0:4a0:13d8:cd0c with SMTP id 5b1f17b1804b1-4a1d75e6f90mr1486205e9.2.1792163051906;
        Fri, 16 Oct 2026 08:04:11 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ae6d2esm65993715e9.6.2026.10.16.08.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:04:11 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: peterz@infradead.org,
	vincent.guittot@linaro.org,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Cc: christian.loehle@arm.com,
	elif.topuz@arm.com,
	linux-kernel@vger.kernel.org,
	mingo@kernel.org,
	sh@gentwo.org,
	Kayra Cizmeci <kayracizmeci@gmail.com>
Subject: [PATCH v4] sched/eevdf: Fix vprot across reweighting
Date: Fri, 16 Oct 2026 18:04:02 +0300
Message-ID: <20261016150402.6952-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently in reweighting, while a tasks vruntime changes dead protection
could go alive, or alive protection could decrease, increase and go dead.
Fix it in reweight_eevdf(), and just cancel it in the sched_change_end()
path.

Fixes: 80390ead2080 ("sched/fair: Separate se->vlag from se->vprot")
Fixes: bcd74b2ffdd0 ("sched/fair: Only set slice protection at pick time")
Suggested-by: Vincent Guittot <vincent.guittot@linaro.org>
Signed-off-by: Kayra Cizmeci <kayracizmeci@gmail.com>
---

Changes v3->v4:

* Change enqueue_task_fair() block so that instead of extending the protection
in sched_change_end() path just cancel the protection if it is active. (Vincent)

v3: https://lore.kernel.org/lkml/20261016084604.17999-1-kayracizmeci@gmail.com/

Compile tested only.

 kernel/sched/fair.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 0feec172fd37..61266c3a7f2f 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4892,12 +4892,15 @@ static void reweight_eevdf(struct cfs_rq *cfs_rq, struct sched_entity *se,
 	update_load_set(&se->h_load, weight);
 
 	if (on_rq) {
-		if (rel_vprot)
-			se->vprot += avruntime;
 		se->deadline += avruntime;
 		se->rel_deadline = 0;
 		se->vruntime = avruntime - se->vlag;
 
+		if (rel_vprot)
+			se->vprot += avruntime;
+		else if (curr)
+			se->vprot = se->vruntime;
+
 		if (!curr)
 			__enqueue_entity(cfs_rq, se);
 		cfs_rq->h_nr_queued++;
@@ -8202,6 +8205,13 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 	if (!curr) {
 		reweight_eevdf(cfs_rq, se, weight, false);
 		place_entity(cfs_rq, se, flags | ENQUEUE_QUEUED);
+		/*
+		 * This happens in sched_change_end(), while cfs_rq->curr == NULL
+		 * and rq->donor == p. In this case, cancel the protection rather
+		 * than extending it.
+		 */
+		if (task_current_donor(rq, p))
+			cancel_protect_slice(se);
 		__enqueue_entity(cfs_rq, se);
 	}
 
-- 
2.53.0

