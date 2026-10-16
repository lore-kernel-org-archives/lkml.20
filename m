Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A833BCD3A
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140378; cv=none; b=JxLechpbXt8/a67NrO2Uw6XRX3Z/HCpdtmerZckB7G7Oouuyxq0D7IyNWr8zdrjy6BLvalWnLBRvURCGt/N/cTpdtpRbOvGxrTBnYtDT2hKtPFxpyUwVoO0CryNFSOmue+k1fHHZ/SXZoBOurqFF8EMmfbByH9PfmG0RwMMB+pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140378; c=relaxed/simple;
	bh=ndwKFKlXsiFZYAT37Cthhyw2jMhE3k/vfTAKsWqKGc8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TFBCYBb2HYWpAuAtguCX0WLkx6t1v8NNwd9oMa8SM+ovzL7o/drULl4unju5mVD60xZ6lowCJK3zlmk7MZuEkGIwKY/5180wz7RuYwieYOpXqbiePDa1uVKLJV54ndkszMKiCamstwMc+YLcP/Gs8i0nV/Ag3k5ogRJE5++bFCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HUGu5Cfg; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUGu5Cfg"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1a873d9aeso3864705e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792140370; x=1792745170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O2adjDNLNWI63/jdrtDAFBdKCBJ0z+fXBWDzoqHianQ=;
        b=HUGu5Cfg3IVNGd0OH2j4N14Nrverur84yOT2pbalDKjl82+9z/9lXDMwoe3Cv9WW9k
         K1jsY+pIpP9g58sj01oBuEF9y8sSLQmAAl7AJ7Y5SPgKjY5Smgf9A5y+VunHikGN3Z6c
         OSo4hCrQmCF0krhFf5EwR7WJQy9n8Ovf2GzctL4pJLbQaJ0qDAnBV1PEP4gy+jg9U8NL
         Mrab3HoR+S/7WgElM/3D12+tXSL85NVvWzsfAAlIdAOErXiRYkbk6NQq/o4doGPt/AGN
         wkypiMs/FxQB+eCqgUx87pT3/05wtFYvKkjS+yYlFN96ik3ukTjWlJPcZIgSU84TmcAv
         UQvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140370; x=1792745170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O2adjDNLNWI63/jdrtDAFBdKCBJ0z+fXBWDzoqHianQ=;
        b=BiyHPdLWHtqLYU90P9wYCgT5kiXgNt5YSgqXMxFLNdNWXrz42C0/UR+4IJz1rk0tN0
         NLgr0cEKFQA0bqSRL4y70UhwaSjLxxf7PlDm9fJcm6mbYPvOZzhRv/nNpMOUvDy0hhLe
         ZQCJiH3RyiqjJIG2gzGuVRLa8yXoFkXFEauHcXcCq2ah1/+FBi1S1k76L0jK1aWXXWUl
         kJVV4p4HNeYooRI+5CM6YKmVDvq7v4IF+bydnFHIVMuMh4GjGGO1ZffnHSUToXUSDP+a
         tEuFhXK5c+V7ej1k7JcLjfL9KajKXtA1AWd2QAaNLqM+lOSnJ3URioMPkHQh0MCCJJ5U
         kiBA==
X-Forwarded-Encrypted: i=1; AKwUvBy28WKqUHvSb/KDAJ/ck3zLa9jaDA+QHCfp0LHiGC10HID2OAVSAQ/jyy5r402TdDCmWlLBYVUwRmUuGyk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbv8I5f3gS0+1fBYyy8D3KOBnHZRnHEn8PLLgCvbnu3ecrjWI1
	SoflPUQD7OUe7cYODH+EyJWeGopb995Jgzd/z/nf7Bp3HwcOGQDalGzv
X-Gm-Gg: AYBFou2QDHj0Ub8HOdcYYQyEEmKnoxu5gKOt0PnIoQ8uSZHf2ic9+MuTXE4NBSp9aFG
	+0w4vZ5mQLSRjxtdbn1on/kYGsfo4wR7bOh7Kf7kmO+Rpy4UvUGEGs1770QIMc8KVJ51kZpEA3v
	zHucJh5D8glAwiJyF8JFTNj2TbX0FD5lAK2nRGE24N9TEhacCYX2QryHp1y5+2fboRW69LR/vqt
	kBIa6Cnw3XLvxYO0UnztISP+MyIdo+IH2kyxU7RIi8EKVN67BattS3HJGG0h8+tb+TY2c9GohOr
	QoM+4u9MwvaKuwhF7LZB8kh9mU9qcnT4yFtd8YfeSSNPgn1Z+zYXTq3YjW4vyc7BSyg+Kkrz9cT
	yIN/IqYJB3783XFT/280/wr0JegVxc4Yn6nk58ZIOibAEtVwQPT/Zw33ag+g9aUvitPr5Kj594f
	4UiqeXAN7Xed91G60LtrTCFZvg1Ip1P692bBvGwuHA/vbvJFLh1Ied9gs50Lfldh0aBk6oWuQb6
	NYanhLID4LQMh816vhU
X-Received: by 2002:a05:600c:1912:b0:4a0:1e9f:64f6 with SMTP id 5b1f17b1804b1-4a18e3ef211mr410973825e9.0.1792140369387;
        Fri, 16 Oct 2026 01:46:09 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cc642573sm27286595e9.2.2026.10.16.01.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:46:08 -0700 (PDT)
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
Subject: [PATCH v3] sched/eevdf: Fix vprot across reweighting
Date: Fri, 16 Oct 2026 11:46:04 +0300
Message-ID: <20261016084604.17999-1-kayracizmeci@gmail.com>
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
Fix it.

Fixes: 80390ead2080 ("sched/fair: Separate se->vlag from se->vprot")
Fixes: bcd74b2ffdd0 ("sched/fair: Only set slice protection at pick time")
Suggested-by: Vincent Guittot <vincent.guittot@linaro.org>
Signed-off-by: Kayra Cizmeci <kayracizmeci@gmail.com>
---

Changes v2->v3:
* Rebase and move the enqueue_task_fair() block to if (!curr) block.


Not tested at all :-(. But I think
This should'a cover the shced_change_begin() path same,
since curr == NULL, so we always enter if (!curr) block.

 kernel/sched/fair.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 0feec172fd37..4593d0122d66 100644
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
@@ -8155,8 +8158,9 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 	int task_new = !(flags & ENQUEUE_WAKEUP);
 	struct sched_entity *se = &p->se;
 	struct cfs_rq *cfs_rq = &rq->cfs;
-	unsigned long weight;
-	bool curr;
+	unsigned long weight, old_weight;
+	bool curr, live, running;
+	s64 dist;
 
 	if (task_is_throttled(p) && enqueue_throttled_task(p))
 		return;
@@ -8200,8 +8204,24 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 	weight = enqueue_hierarchy(p, flags);
 
 	if (!curr) {
+		running = task_current_donor(rq, p);
+		live = running && protect_slice(se);
+
+		if (live) {
+			old_weight = se->h_load.weight;
+			dist = se->vprot - se->vruntime;
+		}
 		reweight_eevdf(cfs_rq, se, weight, false);
 		place_entity(cfs_rq, se, flags | ENQUEUE_QUEUED);
+
+		if (live) {
+			if (weight != old_weight)
+				dist = div64_long(dist * old_weight, weight);
+			se->vprot = se->vruntime + dist;
+		} else if (running) {
+			cancel_protect_slice(se);
+		}
+
 		__enqueue_entity(cfs_rq, se);
 	}
 
-- 
2.53.0

