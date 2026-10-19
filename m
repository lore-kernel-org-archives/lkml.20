Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143F14F5E1A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792416154; cv=none; b=qlCX33eZ41PX7jzDtWTOJ9fvBPygGgRpCjfeYUDUj6cKKRveafS3m+7VR9Gu+5Pgz58p7NROJ5v4WCBfLwrkSdNuRClS47YCeV/PEhY93SBYZ1PQnxWnu67e7bu9lhjlXQmCtzWGxYoAki3fN8F0N3Nq85EdxGvhp9L0APk+D+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792416154; c=relaxed/simple;
	bh=5Dw4ApFmugf86j9b3TFizFB0Yq2QsSowt3OciC3O4bo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aoQQrzD8+cyEETcKsTyAmdINdIpvcGrlC4Ta0ub5pCYEPqpetm6MdF9J+UIXEW+3j+GF4/Y1dG+nJhwwoSDHbO4jvKfqM+v1F4g0o1Vmg/y/JCJdr5G1DDGGmb+uIcY1VBBS1Kp0+En8so2+ijPIH+0VdUfMtX2h+9hA14J7zwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J5OaEEkn; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J5OaEEkn"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a064fac8cbso576591b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792416151; x=1793020951; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0nLKCvUycnmLTFqHSAdrCkAg3dpCGjBYjq7zy8w3DV4=;
        b=J5OaEEkngpuqFLCKx1MPP+1xzgpmNxmiiFnByZoXAvqYWJegdBe0BJ4IBPZ192dWzA
         1gP9SzT5cwjSjReIv84O42An6dR0VppQ6SY7loETHG543JMuq/zKpK1/528gkmwrfQDJ
         T7qsP3v2H604B4fi6ycMhzIVb0UVwwNQtCJudoPdoI/gZ7yhd9mU2AdWHEt5lHj3R0uh
         KHZtjHDeDpOPI3zmGaLUPka/PCy5O25KgDPkK3kSrtlvI6y3YHTT47M9nekicQTkcXaq
         WN54kBQsxD2KdNet52KBR7t5DUm1pLVMgd7wsnRGND/rQsiS6SAI3aQT0ct4JNn11pnQ
         v3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792416151; x=1793020951;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0nLKCvUycnmLTFqHSAdrCkAg3dpCGjBYjq7zy8w3DV4=;
        b=LOV9VC0aSvruNTiuJfoB7izLXWQ8dWXSggAIax1GWxDUfCGFiUmg7UsmcDe1ArbKE9
         25d99//GLFADo2epbu6fY0Ji+h8oXRW7jQNcGIwTLU8hVaWlVzcipX3RzlgaGGUtV6zL
         1e2iFBSMg6TpzL4HgMXdio7xVGRsk9ZVF8VaIXARjFXuWBhd/q5ctlJb5l8aW0FqK3Cw
         AP93EndnCIb4pkkzsu3txTQ0p7HQbA1lkO/LGO1dIm1WRcsR2RPYkOUdLA0fmcB8UrQr
         2jayR2NsVzw3ReacNNevgWWqcvmY49VVo7jLrzM5PkUEYl5FZbs3wETXpiPjMQ8z+QFr
         J8Tw==
X-Forwarded-Encrypted: i=1; AKwUvByhGyq3R+2poaPpnS+0qsD8v6qu1Ks9ZBpr3XAzmy8kbyl2XphdAHQMhjWebzxqnt2qEBRrfqRKELetdV0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqr8CIrQiwkIy5H9/Qy3xUNxJLD8/FzHucdR0iE3fYUOCCkxhI
	Y/d1EY4Tixoi8R0E5IxNEnJWnfaoQ0Ntf3qMRrs95crrc3HTDqbyInjO
X-Gm-Gg: AYBFou2OlVw2gUBLks6inHYfFMAhUrZU5ByD416KJo4WH92iNHuoJDIeqOZnh6HQUgQ
	1iJCdR7wx5YjQfzJhQNWe5qMYCjV2gKilXknB/BS01qvZE70D6SkRlwWT+RqXaORs5nrFj/EXpK
	aDmdYKziLy89vkPgdMd2uguLlS4GYs0DWBvLEf6OMveCvWYauGvXf8LQowhPIp/HeS1Wqrhdgnt
	4hrTUkJR37XJ/bJwqBzgfk/6PPhAvygxzPIdJp3wAMN6xLnKdyxm6+7CdsGP9LD0gSvRQh5PR1v
	iJQ7A3cz6kKTFHyBXvR3zSpKebHbzzF0RWaeHa83KcwajyDUb+5nAeuVyhBMa8vRmNn9Ja0L9Hf
	WFU3zyiyQORhPmtdL9T9fpV08o6TwE8vTJcyMzTRnVrsfK/fr4aSUaEznPpLQc+rPqHif3Cbpb5
	U5G1tlMztr83afMCsYEcMpQY7tq8OCA89jT8yIhIICP+p+KdRojw0rp86L3TQF+pShVTFf1/mXu
	a8cjg==
X-Received: by 2002:a05:6a00:408d:b0:882:905d:aa05 with SMTP id d2e1a72fcca58-8a04c14e9fbmr6226914b3a.50.1792416151035;
        Mon, 19 Oct 2026 06:22:31 -0700 (PDT)
Received: from [58.206.202.11] ([104.28.215.70])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89fcd67cf30sm3329023b3a.17.2026.10.19.06.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:22:30 -0700 (PDT)
From: Haoran Wang <haoranwangsec@gmail.com>
To: Varun Prakash <varun@chelsio.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, linux-rt-devel@lists.linux.dev, linux-scsi@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, haoranwangsec@gmail.com
Subject: [PATCH] libcxgb: use raw_cpu_ptr() in ppm_get_cpu_entries()
Date: Mon, 19 Oct 2026 21:22:27 +0800
Message-ID: <179241614797.5916.13928836073297916808@whr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

ppm_get_cpu_entries() disables preemption with get_cpu(), reads the
current CPU's pool with per_cpu_ptr(), then acquires spin_lock_bh()
while preemption is still disabled, and finally put_cpu().

    cpu = get_cpu();
    pool = per_cpu_ptr(ppm->pool, cpu);
    spin_lock_bh(&pool->lock);
    put_cpu();

On PREEMPT_RT kernels spin_lock_bh() becomes a sleeping lock
(rt_spin_lock).  get_cpu() raises preempt_count, so acquiring the
lock right after sleeps with preempt_count still positive.  Sleeping
in that state is the scheduling-while-atomic case, which under
CONFIG_DEBUG_ATOMIC_SLEEP reports a BUG and, if the lock is contended,
deadlocks on the spot.  The trigger path is any iSCSI offload I/O
through a Chelsio NIC that reaches ppm_get_cpu_entries().

The preemption disable exists only to stabilize the per-CPU accessor,
the pool is serialized by pool->lock, not by preemption.  Replace
get_cpu() + per_cpu_ptr() + put_cpu() with raw_smp_processor_id() +
raw_cpu_ptr(), which read the current CPU without disabling preemption.

On non-RT kernels spin_lock_bh() does not sleep, so the BUG does not
fire there; the defect is PREEMPT_RT-specific.

With the fix, preempt_count is 0 at spin_lock_bh(), so rt_spin_lock()'s
might_sleep() no longer triggers.

Signed-off-by: Haoran Wang <haoranwangsec@gmail.com>
---
 drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c b/drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c
index 2e3973a32..5f68c5d57 100644
--- a/drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c
+++ b/drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c
@@ -125,10 +125,9 @@ static int ppm_get_cpu_entries(struct cxgbi_ppm *ppm, unsigned int count,
 	if (!ppm->pool)
 		return -EINVAL;
 
-	cpu = get_cpu();
-	pool = per_cpu_ptr(ppm->pool, cpu);
+	cpu = raw_smp_processor_id();
+	pool = raw_cpu_ptr(ppm->pool);
 	spin_lock_bh(&pool->lock);
-	put_cpu();
 
 	i = ppm_find_unused_entries(pool->bmap, ppm->pool_index_max,
 				    pool->next, count, 0);
