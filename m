Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792522456;
	b=2IdU1mOV/SpPby3Q3dhAqHNhrZE3WVCzEh/ABcoLVXD3WDo/8/ZTfs2ATnvqSuHfUCFD
	 tPC3ybTwET8Zqx8QgMn4eetdkPG/eaEZdIkLhWzgzabxD2MINpUyYMGPVwil2L4EVb2mQ
	 zjd5pTpFhTmcTXCbE9NMLnZI5wqMTrfsd8onv5K0P+uML1GIReaeoC+CCfs4EmJrZfNZK
	 ol8Nfs+zNCUD8G/jxQAEXwNazM8gKtiJtqVRSk68ECy8vI8uuh3Zq45YoCMtjDbst8Ero
	 TngbbaORddl7tWceW8rKZARgTZaaOGvzPRfmkNVEuT4eIvzu5rnzWpj0uAOBbVhwzag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792522456;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=pgQtG3vnk+bWjLiiQyxn/AA9Q7BaiyxLmpP3Dp0sSVk=;
	b=FBa5O9ostS9VmVxUAUGxMl3/zYx1xkGPGVAyChmh0Pfvz48bGISIHuhME+VZq+ZzxsNo
	 7dVNIg6EVB2vOcY/WDi+D53Fg9Q4aB3uiVPw9tKMdsUFQAeTVfNO44dxDQapMjtURJycM
	 /uQYq73dPZrBe2vcZnEkQHv0B93rfjMw5L7E5AMwynqvWaDQ/wmfwHjcrfq8QkPy0QjKs
	 ONLP+YGnEfLyMl7wGu6LVJWtmPfdW+ycfJquDq1ShD8OsKNyLnjxoQH8eJcFZEZJZeGmr
	 /iQY22xnFULAJcd/GCuo2CihKmebNz2Phd0NcDCtkRVzztuhkSnc2aGNtP3QPaLvz5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GkUodeA9;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0048606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:54:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0048606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GkUodeA9
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48dfbf48b92so370545f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792522454; x=1793127254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pgQtG3vnk+bWjLiiQyxn/AA9Q7BaiyxLmpP3Dp0sSVk=;
        b=GkUodeA9n4Im8HwoXs1SuuEb0pDdQyTB0NnmRg+K3F9ZT8PIX9Cgq2bXbuw7BC1Oqe
         SfrSe0kQ6uxBHt3Iw/NwZRa6h/So6OvOGFhMuvw/4n5/m0uW1HYrLkvCw4ixcOE/MAnp
         H3NpFXFuVp2GYtz6mUFESNrVsnhU54DKGsaelkWq3ZQyxN+klSgm1CrWCWk+iV4Kmw3t
         LTiJjfnzWPcD5Q1QTq1UZQu234vYsh5qJC01KwTad+2cAIKmCppD7421GBXFBiPRGgd2
         mTX9xwa6/kpvlXyU9+K1W29hMePUdHRQp6yAsD851nINEip9DBlAtTfCHHfPE7Yreg9n
         dzqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792522454; x=1793127254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pgQtG3vnk+bWjLiiQyxn/AA9Q7BaiyxLmpP3Dp0sSVk=;
        b=koHug22YCxrC4ukfyJqyC+wf7GYJ5Zyl5kj414/MllzKMAPv7KfHaqDgVHTfQne9Vs
         oOrMSjVUkpJ4Z1lj3dcGnLyut6rJ2uikSXFsTwkIVBD08nU7P22r19N4T3Uhv3aH0+RG
         /i5A3ncrTnfT9NIUhm/sOlAN5CGXQOj1gNOV1gntz2b5LETn7V0nQG10sZBaKiGTXK5I
         I+bmu4LA63IBGHNZVL3iY0lFRdaTGFpgQFikgArJUPovzAxvlPGcwDx5gvE8oP9JUflH
         nnz5t27ztYU3oaBqZEJ7u4z9S2IHPlc39/0f6O31z6pvWUwrYg/Q11ivq44cgisck2En
         sTgA==
X-Gm-Message-State: AFq9FYLvSFcK1/RAGygzhGT+ksBtFq002/BGb3ZJrl88Ef+WYn7PGIz1
	h6zH3AEtE/BjMX6SaY2bKNizu3vl5L4nTuE5QnZbZ1LzbxchxmIX3Pxs
X-Gm-Gg: AYBFou1UVXmQHG8K6yR5S0bxxz2SXVnQw0NJjCy1ZtDpDTrabltgtY6qol9IqI5pQkw
	xtaZej3BMmlKf4tq895yCHSiPLRNNdKMKJOmRE74fsCJsm2mJ3suWlZSb1qaQ1+eLzgkBKM4pOB
	1qWVgXRpADLESeItmVhrQij068PFx5GeKsnm9GGDfoPwOYkJYP7OzFU0G/mo0erfi6YJ+xWCDtw
	3Ax+R33be6Ul5+J4C8QuBtx07pOFDzHhzIflKwGYnvirsjESRomyF7PziC6Kek59HL65UUyUBLY
	Z13afuqk4TqZ6vG0mYaYDOo8Er3hadHKFpvgMnxElVJTBBxAQqtIh02BHPyLgkEh8EPnWjoUjaM
	6ma7l5POD2WziEX78MAMJlVc2ek9OIPz/+z2/TAmg5+rNSv61Hg6NSawFvz5a2hgEp1jfMz1n8F
	WaZR+e6H48IfOSLGhv6kfTqMhsRprDkCgnEjAPOvd5MF1YRCwiflJEd1yYAQICx0AdkkpChmRGc
	mS7Pj2ecHyxu7LnYIqFSQ==
X-Received: by 2002:a05:600c:3512:b0:4a1:b027:99ef with SMTP id 5b1f17b1804b1-4a1d7601f29mr237231285e9.2.1792522453895;
        Tue, 20 Oct 2026 11:54:13 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fb845dc2sm15895005e9.8.2026.10.20.11.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 11:54:13 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
	Chen Yu <yu.c.chen@intel.com>,
	Tim Chen <tim.c.chen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	Kayra Cizmeci <kayracizmeci@gmail.com>
Subject: [PATCH v2] sched/cache: Ignore non-fair current in alb_break_llc()
Date: Tue, 20 Oct 2026 21:54:01 +0300
Message-ID: <20261020185402.57017-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Commit d6b9afab44e23 ("sched/cache: Fix
checking active load balance by only considering the CFS task")
stopped using task_util() for non-fair cur.

__active_load_balance_cpu_stop() calls detach_one_task(), that only looks
to cfs_tasks list. So if the rq->curr is not fair, doing a decision
according to it is wrong, since we only migrate tasks that is fair.

Commit f0d243a96f26 ("sched/fair: Avoid creating misfits during
cache-aware balancing") passes cur to task_misfits_asym_cpu()
without checking if the cur is in fair class or not. Fix this.

Fixes: f0d243a96f26 ("sched/fair: Avoid creating misfits during cache-aware balancing")
Signed-off-by: Kayra Cizmeci <kayracizmeci@gmail.com>
---
Changes v1->v2:
* Add suggested comment (Tim Chen :>)
* Change the changelog so that it says the issue is passing a
  non-fair cur to task_misfits_asym_cpu()

This versions not compile-tested. Tho only change is this comment,
so it should be fine. Right? ;-).

 kernel/sched/fair.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 0feec172fd37..9d7fd6cec376 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -11016,7 +11016,14 @@ alb_break_llc(struct lb_env *env)
 			return true;
 
 		cur = rcu_dereference_all(env->src_rq->curr);
-		if (cur && cur->sched_class == &fair_sched_class)
+		/*
+		 * Active balance only detaches CFS tasks, so a non-fair
+		 * curr is never migrated. Ignore it and avoid using its
+		 * stale util in the misfit and LLC checks.
+		 */
+		if (cur && cur->sched_class != &fair_sched_class)
+			cur = NULL;
+		if (cur)
 			util = task_util(cur);
 
 		if (task_misfits_asym_cpu(env, cur) ||
-- 
2.53.0

