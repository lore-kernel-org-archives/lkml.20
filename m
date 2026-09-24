Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D7747ECE5
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251942; cv=none; b=lTt5/fdC7gZiKGX57vzKqP+zc+iSaZvKY5UoppjuiiEAmoE/MS03o0AN4WOAmoIXYgl1wVZXc8Qw8kIjMajam8zcJrXnTPUFQvC6+nDvF7YBnbdTVU6uzCiUwYfwslUqgAdTCtN7C6a9CLr0/oFjPI4it8SyeYD4sWwIlFQ51lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251942; c=relaxed/simple;
	bh=Qvr7eXQ3NWfUVqdKtiwoS3u8+Df8jK7avVWzaj4WhvU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uLE2BM1qspay7Sq61GDA4FjJOJH1tw/ynyQvDwZVqwCmPl1oM9K/fRZKDlC9rBstsyaq4ZOyEf+IhaShT/7a1NPdSEeq4HFFQ3tBrx5hO3OEDokAVucm9z++HOPq968BxC25d4kjm85ZCZ5LiBkM5ePn62ZCTbA6gX2AFHZqYJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ml6OPEV/; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ml6OPEV/"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39b910bdf2eso1026464a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790251940; x=1790856740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aLACE0GNZPWJehfzsjTU7gRpeFaJMRTm2IGBABnx0DQ=;
        b=Ml6OPEV/tBT2h9H2JfBNw8UljYaBdj5eMcfhTQ0HA/5Kzd9+xIlaIha1x5GVePZF1Z
         +en33qf70EmYQrnBvsSQNm+ZqhrsUc19kaR7pMmFLIlRpumI0OaGeo6rVT918RhsZB87
         vzxVxMcRjtS48MEqN+5xyWzdjRPi6IT8M72dovSt6o5lxd7ghA2UldO1WQdOH7oyYYmE
         Qu3TDLPPV6lGnBtLra5FHU3GTzIsRdujoWWS96VDFd/iTQX7qNR6Ow7s3fZbfriIzVIk
         /BFZ4av7TgYUC0AHHPH6kU1j4vUUxejcSdsG1T//ZsIGasqVxMSChc+BNc6CAFl1zc75
         nqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251940; x=1790856740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aLACE0GNZPWJehfzsjTU7gRpeFaJMRTm2IGBABnx0DQ=;
        b=Lg20UVd6cf1EGBvnRUaLBOt20leTmUqrzU5W+PItes4Ij4Hvmh+xWNF/EZm2F5EFVZ
         e1GsABtm/mTiJg7lfKI3ctRyNp0UosRq5kPhncUkAfcArxwRFY+CYOtXG7wNc28f7Ckx
         S255ZySQ9G3DFrrJs0NI5gL9zbnNgpR0hve9Z3FvLxw57RUuDyUzRNC8See9uMSwfw9V
         Di320bAsbQIWhe/ZSHjHdKJZZ8bhtHiBrX/21mVuXjun5tBvA2TLyTsB4/xJbmn6j8Dl
         v+d1zhnM2UBK+Jk0BggAbNSRMjMKThanV0qxpXhalFfC2n066QiqiEqFcA+W0BNYI7Pu
         H78g==
X-Forwarded-Encrypted: i=1; AKwUvByou2bbsETY5TB0XVC77Cnz2z2x9R/DPF/ELU8z9F9H8mK8/uswNDc3WaUXpqMZ+bIeKaiZA4Is5yqruNY=@vger.kernel.org
X-Gm-Message-State: AFuF++mOW4K+M+tu8FEVNZb9wcZl16Gdrl1qKEYpU4NUEFkTPWHANRUm
	lDfvbvG3M9NTMHinWBuxrbOy4FIAOSSqOmvYIE4i+vBfuMlNmqCdKUg4
X-Gm-Gg: AYBFou2TJxiYw0gtFRpKfcDdE4I5w5d9T9CsmrNUTK19TLFeEEVyjspOGQ0RsyZN6m7
	cpykxjtAWx8VHb+Naa26IyDwTmhzIBhu8U5z9WGwn1KtPKDoROuZPENacZxDq5Qk38Al6NXmSWX
	QFqxL6bOhLNShINIg8zoEGRu/W/uqLu8mrbzd2RV1JVxOnU6F4AdSKuaON3MlZJ0xwmSifjexUw
	QdFt7f0QjP2T6QoshcVXG+F/VKQqbmoIkEGXMekmZCK0YKRR21knQeIjM5k2ixGRgbjaGCEtbB2
	ZiJ2aP/HiBUVK4o+uOj7qTUpsDjENWmGUYbJ77RDDUr4lvajymkwdu1N+Oxa4jzR5yxJapKv2W4
	7uwq1FStk6FfYDYLmcxS5WVkh3g6ENMu7/qpfkIRdR4CCkEpXmE8SbyJXp4+zZxclhE1/02r+XA
	PSe1NudaFaY1nO7Gk8dcgGHoyZAy22BVUXGpJ17XJtyAN4+Y7BIDSkicNSAuG+7vMw57DaGbVw5
	uEVbQGM2JQEsEw3E3CRaQ==
X-Received: by 2002:a17:90b:3812:b0:39e:6c6a:209b with SMTP id 98e67ed59e1d1-3a098aab9afmr1797964a91.60.1790251940252;
        Thu, 24 Sep 2026 05:12:20 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a09773a515sm5059493a91.15.2026.09.24.05.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:12:19 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	John Stultz <jstultz@google.com>,
	Connor O'Brien <connoro@google.com>,
	Metin Kaya <metin.kaya@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sched/deadline: Compare against the donor in prio_changed_dl()
Date: Thu, 24 Sep 2026 20:12:12 +0800
Message-ID: <20260924121213.106673-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

prio_changed_dl() dispatches on task_current_donor(), so the else branch
asks whether p should preempt the current scheduling context.  Under proxy
execution that is rq->donor; rq->curr may be a mutex owner running on the
donor's parameters.

commit af0c8b2bf67b ("sched: Split scheduler and execution contexts")
converted the identical branch of prio_changed_rt() to rq->donor, but in
deadline.c converted only the dispatch condition.

No behavioural change intended.  The donor is picked as the
earliest-deadline entity, so the donor test implies the curr test and the
current code only adds reschedules.  That ordering comes from the pick,
not from here.

Fixes: af0c8b2bf67b ("sched: Split scheduler and execution contexts")
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---

Built with CONFIG_SCHED_PROXY_EXEC=y and =n; with =n the two rq members
are an anonymous union and build_policy.o is byte-identical.

Two more sites in deadline.c were left behind by the same commit, both a
few lines below an rq->donor based update_curr() call:

	dl_server_timer():
		if (!dl_task(dl_se->rq->curr) ||
		    dl_entity_preempt(dl_se, &dl_se->rq->curr->dl))

	dl_server_start():
		if (!dl_task(dl_se->rq->curr) ||
		    dl_entity_preempt(dl_se, &rq->curr->dl))

I left them out because that area is being reworked around dl_rq->curr;
say the word and I will send them too.
 kernel/sched/deadline.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index de6a361a87c7..2a5e562fcb69 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -3631,8 +3631,8 @@ static void prio_changed_dl(struct rq *rq, struct task_struct *p, u64 old_deadli
 		 *
 		 * Otherwise, if p was given an earlier deadline, reschedule.
 		 */
-		if (!dl_task(rq->curr) ||
-		    dl_time_before(p->dl.deadline, rq->curr->dl.deadline))
+		if (!dl_task(rq->donor) ||
+		    dl_time_before(p->dl.deadline, rq->donor->dl.deadline))
 			resched_curr(rq);
 	}
 }

base-commit: a9b3c7570564de40acb0998ab85c89d546b2122f
-- 
2.43.0

