Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D82348594D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792392166; cv=none; b=kZlsrsws9iYO10oq/HeWZiJ5kU/ExwximfcfrUduuuUrWjHf6uZMD58ouI40bQk8uhqL0C5+cdf+cmaGXVASH4ayObas5wZNrQgTxqhljOzD9Q1LxotI7KSTYpV6MMTbjsIypERiGwnupLznCn5L9QPa7qCiACiOsMW1JwxXQnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792392166; c=relaxed/simple;
	bh=QIHyivvelQsG5goLcwTZfY2CtoiPNubYt+UKx+e9SPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BzavkQrORiJeHvFJ5c2vKIciY6ADBvTc9m69mQl5vcsp2eb0kZ2lWE1crd+v/EtGGAFMeZC6KyMbJz5mxVonMXXvukr8A9t1L36HK5nrdfm3hmHDAlkP6W2VjVSbU3WOuflIZRIhJoHoEgsZukqJCg8i0ttauYCdGyQf3ecOu5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STyHjCmU; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STyHjCmU"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a070755c8cso113574b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792392165; x=1792996965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vBI495sTrHPugfVjBEVGuxFJ+6JlCnqJ4Bwn59THMd4=;
        b=STyHjCmUI8Sq80l2tcrDAnicEQQ7oAaNMqvcYqa7Q0sA2kQSmbJ9TCkBYr8H3igf9V
         spmeHe1l7oyw9UAtm3f2oCn8hUxArOGBpgUetWu68UVACxeCFOScfkcgWt3ral5QrW9L
         p65Gn6LM4HHi3S07bukO7LavM+a/5Ni7SXTy1XUPG7zMpuY311WFqATXc7fHTguDJuI5
         oetQxFhJVVI07AUTbv1WjuCOW9avx+KtvmaFY4kotQa4qzxC2U20X/WtsYvU/Px6P65N
         TyJQk6n83q8xiGl5f2jFldpxTWwcaQZUA4MO5fM6dA9fULgJI6jkTD7Kr7H4h0K+jq3O
         DjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792392165; x=1792996965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vBI495sTrHPugfVjBEVGuxFJ+6JlCnqJ4Bwn59THMd4=;
        b=OgBDArL1Wx0Bw0jsCV15X7DQp1iscLT5VuBprMcq+TrRDbjBC4nnf8dokG3W3tOa/D
         UYrqb2s0eLt7O5ef4r/8mbmXYIIomsKUnrYyUc2J89NjcJWJhoCUJZzOdOlQZR05BHmd
         09hvEtzre/Nqk+Ez50XxdjG8xXq21nCeL/pTbaMcpz4UrAAOmPEM1ZPy0PkJlSxkzPMP
         SEfxQl9IAT7vfQQw7xVrdcojmcSa0SmMRrHJoVQtC9EUdMaLmR90og0AastRNOfHgx98
         Dm6cZaYVGnvjZDW5GGLqS74GmSEoHTR6PmeSYGiwfqSShM3xhXIcEFPPWqQZ/VQB1N6s
         qj1A==
X-Forwarded-Encrypted: i=1; AKwUvByZuvCGEQ9wb/VWGp/OZ8yfe5RplnX7WZFov/NzyLkedY27zGt+jwuEWkeNmyTPt3P+swMndQuLtyTrnxo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKja0VxtY4kVe812fW8LpTCW3/mWCKMR4qliQ7tgUAYOmndvubc
	PHvDbgvM5cn0AntToQExD3BophO9lEUMgBwTmwXVO7Xe7Arl+mq3WdZ9
X-Gm-Gg: AYBFou05qQmx68vaPfGXFEhmdaZkXhxYVMzbAnWI/4egMyfwrfziXgu2ErdVQNCwrX1
	6r6rp3ICfuAuMPpugvzrtw08FgyWkuolh2Vz0ivHx5vS+Lsgdqm1n+hPPEkM5Dq4SQnoayufuim
	V2U989smuDJM4sRHI5prsmgXD+4E+7qrgIh7GvdwiLyuzlVQGVLrOP9JTM8koeyUookB3pVpezT
	GGDry3i9bGa297R3oMDbHPOBr39e45QyXGZHECdHtZ92De9FZFw3yKuu+q7ud1A2Wjz1qpA/+1f
	6jSy2o4iJZBzA+53016Pnt0aM10POjLdjMgagoW43/60a2cX8lmUjrKV0/FmbUrpKcaNvy5wFvd
	CnOSpT6nTIj6PwAbAv3DBkvx/ldCGSYtUO/HC7GSSd5CS0LCmEix27FQEJl7E2yikt9Ew2NpvRB
	T10GOx/hSnHDhtPqvJiHhXIh7Pvz0DEu1Y3csfGBX3MgTzpgL9VL8fPrxL6yAzis++z6sgm5h3i
	wjZP1SDo+WmFzKUzj6CoedrEnEhz0/DNDo8rmRBCVffYrUACeI1I6l0RHV9pvmzw/Wcm70=
X-Received: by 2002:a05:6a21:482:b0:3e1:bce3:c3cb with SMTP id adf61e73a8af0-3e225fd83dcmr5763850637.44.1792392164732;
        Sun, 18 Oct 2026 23:42:44 -0700 (PDT)
Received: from localhost.localdomain ([240e:46d:2100:3fed:6938:3f14:63eb:c479])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd654a3a592sm3688960a12.30.2026.10.18.23.42.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 18 Oct 2026 23:42:44 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	gourry@gourry.net,
	tj@kernel.org,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	shakeel.butt@linux.dev,
	roman.gushchin@linux.dev,
	yu.c.chen@intel.com,
	zhao1.liu@intel.com,
	tim.c.chen@linux.intel.com,
	lizhe.67@bytedance.com
Cc: bpf@vger.kernel.org,
	linux-mm@kvack.org,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yafang Shao <laoar.shao@gmail.com>
Subject: [RFC PATCH v3 bpf-next 2/5] sched: use static_branch_likely() for the NUMA balancing tick check
Date: Mon, 19 Oct 2026 14:41:54 +0800
Message-ID: <20261019064157.29885-3-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261019064157.29885-1-laoar.shao@gmail.com>
References: <20261019064157.29885-1-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

task_tick_fair() checks sched_numa_balancing on every tick. The
static_branch_unlikely() annotation reserves the nop for the disabled case,
so the default configuration (NUMA_BALANCING_DEFAULT_ENABLED=y) pays a
taken jump per tick. Flip the polarity to static_branch_likely() so that
the fast path matches the default.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
---
 kernel/sched/fair.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 973647ad6c2d..71dc47d6114d 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -15351,7 +15351,7 @@ static void task_tick_fair(struct rq *rq, struct task_struct *curr, int queued)
 	if (queued)
 		return;
 
-	if (static_branch_unlikely(&sched_numa_balancing))
+	if (static_branch_likely(&sched_numa_balancing))
 		task_tick_numa(rq, curr);
 
 	task_tick_cache(rq, curr);
-- 
2.52.0

