Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331573C0617
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906203; cv=none; b=G3lwYNQoKcUoss24y1AK01SXgbskljcXe/bjhJKle2MlpUd6an4QzUXYZ7eT4sWrb2QQswL6fnM8LT8rtv6USBDg9q/4EJkBh/GM3NLp/PRSUGTj3FrD5/IHxrnkRH8bHfqf6kq9Fo1zKvtIyVQ2wHxXnIVql7qLMS9wvTVMwqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906203; c=relaxed/simple;
	bh=5MAUQStupAgovD6wPUI0MFtK7QXCHHuaAf5lPVm2TNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B1C6+bAPnQbWU2gUEh78oLdgEtdMii5I9wYVN3LLDtVgQyt/UOm5wPLVZ38IO9c7atS8CYlnO+KQjpJxFswB6ke50rFA2+m5tsJFs7an91meK8QwBBFnjYctbdNX8+5DKFTrCdW+tQdNerHz8wjsKn9xBPgAU1yAcjjJ7KCecXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSfV9j+q; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSfV9j+q"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc1b838f9b6so903828a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787906201; x=1788511001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EvIG99rT1UekjN6YxSTUqWfuuX1isp2GGY7WikP8/UU=;
        b=mSfV9j+qDcbihmHdXNOqDAjPttBQKLxsES3C48nusHJoEnFvlZih5D4RNTQQFwbux3
         SpuMROuG4QsOFaLZia1n3jv8ZN6V0rmTT2WCcPqm2o2n7T0K3+b+VE+cHWNCuj2jo1d6
         92dEgdPoWDIDaab8vDyPJnI5COWSEDuFtW7wBBrcFMFx7bmq0+jIPt38yacmSaRLoyZz
         RGsw11J3Mtp3Y9OrRO5FWYcb4nQ8urxzT1GXmrgZLg4a2DMUs9CKPvMq58dOnaCkXli3
         WvEb74nW+j+pnZk823puLt0r26vWrTdpV0fg19tVODiM5NsD1pa7VQG4SAEJFA6HBxFB
         gyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787906201; x=1788511001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EvIG99rT1UekjN6YxSTUqWfuuX1isp2GGY7WikP8/UU=;
        b=FFMgb2zKV0HevucJXuO/vgOo4tTZkjnT4HvgEJEzfrCjSRRyD8YZUeaqduwUdO6nKN
         yESew1g6SnQ3fB/bFO/YhwNn+9sucrttxkZPg9NEcsj/bNGEThSErFdQIKkqi4jSwSlg
         GrpL4gQ244eYNmRte7WJQ5JvyOKncV2mnoYewlfIxqvqJqYC1mdP15BQXgvr/teaYw/Y
         nMPCGuUTguGxe4bS96WRPH0KqhZ6zc10fCh1nTlhdYxSyefTTVIvLmJHscHmmLnpTPbp
         eGDk8CQDlsA4EEsdKCUvLJp2fclwfc2VNnest66F3bv5uRSGRCYKK6SfFtfikieNsuNT
         u0zA==
X-Forwarded-Encrypted: i=1; AHgh+RopjXLgNjoCiPakLjdSwA+EuOm1CRk8P/4u4Oaa9Ig3m2Y68i+xOWEgE113sUcfJKrY6Ps6kf7NgbVkab0=@vger.kernel.org
X-Gm-Message-State: AFuF++nr3/TuvG/1y7TBulzFu1fDAwr7SevjHRDGS0rClYSTv3oAIr8Y
	p7TN45CLVQmf0H2e1bbp4iofPQuo6Kcvv1mNJvAkVmwqGNa/JfwJo/1f
X-Gm-Gg: AR+sD132X12LK9MfGoAylRrdLewQXNfi+/mSPGERXQmBE/zd/6JeurGnA/CloNlTUPr
	UP3VWP/aTDokE6xAfvwjAxxGz+mv+yUAFwYhpbtQ4Y4PvFGueC7Sp2X7x570n7akDrd5dh58bCa
	7c917NdNWDLt1r5sFPXTz0NJjIoqwOjq7oJDyit9dMnmlaH75Um/GW8fYFse4BPrJTD0xHquV+2
	jqKQEWdTixUMytF8QHsG/oDAucHUPzDsq6SYDp24YFBzFugQcdYm1MBhHdlEhevkZO/ScGri370
	Jr71/sdcUSFvwve9Xr6/xP62jEEKlLbeTm4zxtZSfnwqsGhZeV0Ohsdx+yKzgxqf4gCzA+BkLfx
	RqWVFEnXQSdiGTT65ykLxX9SgYhWl3RTuSAUe5VfalyzRG0kCVbktyXG5WqUyoC/MEO6U9LEXFl
	QWuekKmwypIbsOyAufsSdXYJ4zGSOVjlHyuDnL6dGkTIFRA8ju/GU1P7tR5D+3dsDEpnPQ/8jz
X-Received: by 2002:a17:90b:5249:b0:396:40e6:f631 with SMTP id 98e67ed59e1d1-396d0e306e0mr11398342a91.3.1787906201367;
        Fri, 28 Aug 2026 01:36:41 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396db196903sm1630961a91.0.2026.08.28.01.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:36:40 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: peterz@infradead.org,
	mingo@redhat.com
Cc: juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH 2/2] sched/fair: Complete the bail-out list in can_migrate_task()
Date: Fri, 28 Aug 2026 16:36:28 +0800
Message-ID: <20260828083628.1406519-2-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828083628.1406519-1-zhanxusheng@xiaomi.com>
References: <20260828083628.1406519-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

can_migrate_task() decides whether load balancing may move a task off the
busiest runqueue.  A comment at its head summarises the cases in which it
refuses, so that the tests below can be read against it.

The summary lists six cases, but there are eight, and they are not in the
order the tests are made.  Two are absent:
commit 9bcb959d05ee ("sched/fair: Ignore percpu threads for imbalance
pulls") added the kthread_is_per_cpu() test, and
commit 873199d27bb2 ("sched/core: Prioritize migrating eligible tasks in
sched_balance_rq()") added the eligibility test, neither extending the
summary.  Both tests do carry a local comment, so it is only the summary
that is short.

Add the two missing cases and order the list as the tests are made.

Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 kernel/sched/fair.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 6ea87316d162..3587515ecbf6 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10848,10 +10848,12 @@ int can_migrate_task(struct task_struct *p, struct lb_env *env)
 	 * We do not migrate tasks that are:
 	 * 1) delayed dequeued unless we migrate load, or
 	 * 2) target cfs_rq is in throttled hierarchy, or
-	 * 3) cannot be migrated to this CPU due to cpus_ptr, or
-	 * 4) running (obviously), or
-	 * 5) are cache-hot on their current CPU, or
-	 * 6) are blocked on mutexes (if SCHED_PROXY_EXEC is enabled)
+	 * 3) ineligible, while this domain has not failed to balance yet, or
+	 * 4) per-CPU kthreads, or
+	 * 5) blocked on mutexes (if SCHED_PROXY_EXEC is enabled), or
+	 * 6) cannot be migrated to this CPU due to cpus_ptr, or
+	 * 7) running (obviously), or
+	 * 8) are cache-hot on their current CPU
 	 */
 	if ((p->se.sched_delayed) && (env->migration_type != migrate_load))
 		return 0;
-- 
2.43.0

