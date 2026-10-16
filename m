Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FED2E1EE0
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792165048; cv=none; b=snH1yLVwMm0nFuG37ffjaRwX35rm1HD6jpRcDUqcxZXLbO1kZcpVYgE2mjZCfaV+9zX9OWORsgr+qYY3fETHdYLPbNWMQnFt/4AbumJTVljcPNK8Md17jIIbXVKnnxErGBmhJOaznJnc4bGypy2KuvLNjhvvQpu6KBWeuWAin6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792165048; c=relaxed/simple;
	bh=BJljsUnJkQPM+3MvegPkrzhVCtf8iEAM8qv3cJIBz6g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jpdgvePE6WeTP7oPi+FzaYe/YN0hKjjYPLvDXlG+4fzpdIstu/slk3YAr/hhu70KnNB+/jw0x9wAJEZoj2P4BcSs3u+YFoUbKmuH1zsBIl7VLBpSYH6HV5DirBY3UGMTSqGtVfIbd1+iWgb7unEWZyuOII+foRl9IoXfCO4/rE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kqWIGIif; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kqWIGIif"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a16aaf1f90so38345e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792165045; x=1792769845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zFUIOg51HqJDlG6OjR8blFoL3tMPaN2H3D9y20x5MRc=;
        b=kqWIGIifkRV/VZyhgGc2rOLABdSmnzo5vZ2YS3LT0zy7jWffgovHG5Y62UpsGZIz6S
         SzrrgHktncRbmAhmNDvL5HlOaCxCPyZNyUD6br8qmVTE1SSrd/PD/3zGyvsyeq/JcwYT
         Uz67kXHMZwCMgA9TH/lEFeRd9S6ZcgkZZjYmCwAEfIBSbGkxQC9GoQsIj91HncaQkin9
         G5cL/f0Sm1IclLUQL4gOGuZFNJSbTpaYNHpgzVw6Qy9VtptlyN/Kd8Kfv0p0prkrbhyu
         AKCu8BXZMPZBMU/Rsro01XV/8N8I7W7oWmA5IwsX9XGwZY7d+zWNHy+2VWs0qGWbW634
         QGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792165045; x=1792769845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zFUIOg51HqJDlG6OjR8blFoL3tMPaN2H3D9y20x5MRc=;
        b=YPNZiSZ8klZBlGd3PLxLRm3/HLJJpHU6tPg/AMtLDG2/4MtgibadV+ptPp0LU2BWsp
         VSu3lTdiHy9/dq1LfKREcnR9jMi3Xafcr14tKIfKtJTj/j5gyjwbl2oSSEfVzX1aF0B8
         4pLsUivQQ6h483HrJhBeBwS8z3xXnlEOsVv1CDOADZ/3Lx3lYFPNbTu6iOFIpd2bwO6x
         pG7vm9G2o0AelA7eYmIdP3KJLfv6qpPA1D/qMyAtLGhtoKBrQ6KKBn5sIuglR3Qlsvtv
         wmRphPiVr8iM4Dl2IgBiBOs1ZLWFXaRmnlwNRWkMUIWskhcvSPLXc+HvJJ0IEjaImm2x
         X6qQ==
X-Forwarded-Encrypted: i=1; AKwUvBxSqiIx9O6977UJLgpYILAqy/B1AjyaBOHiiPWdx0IScXgA6QNOxkc9H1HRCSlxUS81F14qaenhYpdMcA0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3GgmQ6tiljazIPT1DlMilzwjHtQJMYx7nek7onurrVUSc7KYg
	JbW9OJqMLCtlCwRq9o3cAQJjPdXgeoYanQmAJtkKtEzdcnAsvEfbjTU3
X-Gm-Gg: AYBFou2geRlvXurNA0jGse4AxmgARSPT/GvRz+g+PhsJ23qvMWN9Wm4tnKd+2PuQTPs
	5a+XPszDMnNg1XKFNdtXlhkQPI5vNxobe+Kyofk0G0hoZISsuK4yybh1T4y6PezJKo4qXnQcSXj
	MZNsAQ9bgBbOa6+ie6E5Ov1ZEjdSZjDpl5I+DHnShl+i6ksXMLrzbKc6UIkX1cYVyM05ir7Su2g
	MEI71aAGmH1Iq9GLCgfFi7AyEBHT4kdm2izfVjQKtSFmViHZq8YPTYXTciUF/NOImShjUMULFid
	9EYE8YnmP0yK77IQSRBa0spJMkgw8VNUXamK1bPI6x3vY+bbn+ZWJFZ6EHmfLEeSmmIGYY8z+tH
	2eb/iFBdOGcj6a0zhzASTYdFsJyEzffSbV8Iwpz7y7kps7dkLZnRkF+PNJ8l+LyTumgl9mcbZ/F
	mKz/3l7PSzlgkviKlHYXTDTET4QJJ36Y4kXmcUVz5mjAXvakTGXWmPfFJVaYKc+N0GlYHR0dGNJ
	SpDPFmfznGcRQLtypUM
X-Received: by 2002:a05:600c:4e11:b0:4a1:8dc1:7a4e with SMTP id 5b1f17b1804b1-4a1d75e3dd9mr3891085e9.2.1792165045261;
        Fri, 16 Oct 2026 08:37:25 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f9c41sm6154082f8f.38.2026.10.16.08.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:37:24 -0700 (PDT)
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
Subject: [PATCH v5] sched/eevdf: Fix vprot across reweighting
Date: Fri, 16 Oct 2026 18:37:20 +0300
Message-ID: <20261016153721.7843-1-kayracizmeci@gmail.com>
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
Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>
Signed-off-by: Kayra Cizmeci <kayracizmeci@gmail.com>
---
Changes v4->v5:
* Use Vincent's comment
* Grab Tags

v4: https://lore.kernel.org/lkml/20261016150402.6952-1-kayracizmeci@gmail.com/

Not tested.

 kernel/sched/fair.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 0feec172fd37..fd8902813c9f 100644
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
@@ -8202,6 +8205,14 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 	if (!curr) {
 		reweight_eevdf(cfs_rq, se, weight, false);
 		place_entity(cfs_rq, se, flags | ENQUEUE_QUEUED);
+		/*
+		 * During a sched_change pattern, current is dequeued and
+		 * cfs_rq->curr becomes NULL while rq->donor == p. As all
+		 * properties can change, cancel slice protection which is
+		 * not reliable anymore.
+		 */
+		if (task_current_donor(rq, p))
+			cancel_protect_slice(se);
 		__enqueue_entity(cfs_rq, se);
 	}
 
-- 
2.53.0

