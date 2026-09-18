Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791444E780B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738168; cv=none; b=W2txOZb1ZvCwpkOKCRS6HQpG0+iSeKem9X0w+ka5o2j7Rs0Qquo21sELZwNZOTvs/cf2ik47I/GYUDWJABmP1aFS3TPGC/xaZ2A9gfyoG77fKOZmnpVbLwqcOeqKqy/UVINMUsP/4vTOMAEBTLuSgzyntW3dOuxPu4HM3F44FgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738168; c=relaxed/simple;
	bh=trSYWdSz2Jh7WFbtwdzT45kbd6d/ubXAcRDKUnC9Kbk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h9x1LM099n1RlaWEW4Dupbgv23prgno3wQ6jLNwwBQx0eyfnpO7LuYBpMeB3/m4R4Yw8kNhB1S3UIHy8C5s0F49QOnFxXhsQJbQlQf4mTjVceAd/O/+UMDTfRKFCdWia396Hs44H7f4bNGXW2o0j81FrQ8m2nqdEpUZshP8NthE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PBBxt5yV; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PBBxt5yV"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2ddaa08c890so6399845ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738166; x=1790342966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e1v3SBN4q5X7Oo8ybPt1jiEUVGf7ZfgcLqZLzcZoRAc=;
        b=PBBxt5yVYlEWg7c+fNeEQdOXzuTwOwEL0B9lhuoPrpwkV5HxT6FRzKRxGmeG8gjkn2
         PxaqKkrBzf/gBWkZqA/s7xBd0UCU6aT52JxIZq67S5tA2+kUnis0g8UJ/GUcSIAP9F+c
         cL4Gs+RrRMBpTYDLkpciyRkxPfn4TG72WXCu2pHVCMWIBaxkLrSWaosHR2txv7airLiZ
         hvMkPpkiEXvSmnc9BzZEVR3PEgB5LCA7Iyuhcf59I0yVWpUGZXOFUKsePtstGmh8R/VX
         FFRcaG5sAZrjZan1C95efsqmuj5VyAa0UuUn5QZoHud8APkPDsuyRCU0Oq8gKojrvyTj
         q3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738166; x=1790342966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e1v3SBN4q5X7Oo8ybPt1jiEUVGf7ZfgcLqZLzcZoRAc=;
        b=AipX6SnRXeCOrbpSx9sCt6C6KAZ65t7KmMePiMsxcF4mfg5EnhjZgom6G9S5IgBVuO
         2nFfKhW+8YCTmOdd20hUjvkW51K4FXzTQnED/2UP2KsRoMrNPIC8mUWgNwCNBq9rls+l
         c2pU4C0ca7QB9rOEWy4BtBYjjhOSCS+Q+APAN2KmBxhWUe6QI40DWvp1CYUbQEOBcuP7
         ESXyBazl96a0zL2c5MjQngF4wADHxfAzI5ZwqVodxUTc9AooXI9XHDhkcmbXQEiWc9b3
         P0J9q55iqGnzbQGHJRM0djd56yWxNieXpmW0GzEfuNLMgz9obX+H7gBfsDgpq5DDbxSE
         SNLw==
X-Forwarded-Encrypted: i=1; AKwUvBzVxLa83L25aq+otyukKvOtg4oZ3asMzo0nBHUvzEy4tDy81abF4lPWpxeB+mL9dJig4hzilGvBBhmgqlw=@vger.kernel.org
X-Gm-Message-State: AFuF++mHmhSietKUK3vKBs4G+If+5UQ1Na9vucKWKBuKu2F1IvQwpu3x
	vtpsMHDOUtnSAK35yczxkL/gxcsV5znJ17Jg8dN548AJFGcFnlvFNjo7
X-Gm-Gg: AYBFou24EZrC+7+GOx8cuPUFqY9RW0hhVqZOtWomNSuxoI66ig8VEl5FRi48ie+o4MU
	ZPqJtKq6UFN7HD+y29fmCKeGUKyVOSXjGAhgzzR5YA8Kqd9c+9MGA0q5l4fBaGf8sTsz2uABiXX
	twrpybfoNHiOWoV335YKeWhWir4SHpLtehb9AcmrATcMZkGbfGL9cc5Pvw4jCxXBn2fhSkCpEc9
	rBpck4YgYM68Krv3nI3nbz7y/8hmGfBgO1Hc8YKRaqWjiqVp0olVdpjw2X7shzPPypmzG6sQ7Bt
	Um/jIy469kF4WIEWoRJaKBBzJP0dJyXoU2KrvBe+w4xfL4VnHENKDVRTqN2ztu0FfV876l3eG6o
	dXWgxYrEtn0HsBhlaRFQE7Qfz4VyEWv0adcK+iPfivCcV4MY1S+7He4pxuG9bx8OLS/e1qVBCLT
	XEzpGYuFO+kJK0lIXs9A8Y0W0L0uBHDwF/Mmr6KBb85f2PoZeOChIp4mSnKKHaXcIr0Y7ebTjk1
	anGZ1R9g/A=
X-Received: by 2002:a17:903:1b4e:b0:2d8:d4cc:be68 with SMTP id d9443c01a7336-2ddb1c15709mr45248245ad.21.1789738165472;
        Fri, 18 Sep 2026 06:29:25 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb73db1c5sm7879315ad.4.2026.09.18.06.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:29:24 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: peterz@infradead.org,
	mingo@redhat.com
Cc: hannes@cmpxchg.org,
	surenb@google.com,
	jstultz@google.com,
	connoro@google.com,
	metin.kaya@arm.com,
	sh_def@163.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH] sched/core: Account PSI IRQ time to the execution context
Date: Fri, 18 Sep 2026 21:29:15 +0800
Message-ID: <20260918132915.1236312-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

psi_account_irqtime() has two callers which share rq->psi_irq_time, and
they disagree about the context: __schedule() passes the outgoing rq->curr,
sched_tick() passes rq->donor.  Under proxy execution the donor is blocked
on a mutex while rq->curr burns the CPU.

The tick charges PSI_IRQ_FULL to the donor's cgroup and advances the
timestamp, so the call from __schedule() then finds delta <= 0 and charges
nothing.  The delta is not counted twice, it lands on the wrong cgroup.

Pass rq->curr, which is what the call read before commit af0c8b2bf67b
("sched: Split scheduler and execution contexts") renamed curr to donor
across sched_tick().  Without CONFIG_SCHED_PROXY_EXEC the two rq members
are a union, so this only changes anything where that option is set, and
it depends on EXPERT.

Fixes: af0c8b2bf67b ("sched: Split scheduler and execution contexts")
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
Built and booted on x86_64 with CONFIG_SCHED_PROXY_EXEC=y, PSI and
IRQ_TIME_ACCOUNTING enabled, under x86_debug.config and panic_on_warn.
I did not construct a case where donor and curr differ.
 kernel/sched/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 7885ff76e69f..2b48ae0ab372 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5791,7 +5791,7 @@ void sched_tick(void)
 	curr = rq->curr;
 	donor = rq->donor;
 
-	psi_account_irqtime(rq, donor, NULL);
+	psi_account_irqtime(rq, curr, NULL);
 
 	update_rq_clock(rq);
 	hw_pressure = arch_scale_hw_pressure(cpu_of(rq));

base-commit: 5dd1818b15d98d4a20806cd00b1b40320b06004f
-- 
2.43.0

