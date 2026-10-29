Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793241418;
	b=O1WHWnssThadoEOxGuNLTNSbdKHHKgsuwxcCrUIMljhnegohTAgty64PXhvHJtmvTGy2
	 GpSj9qMm6iKeHIy4W1DNirV25IZ1okI97eoN7vHuAhYU5Mq4L9KEspAgOtHNzDlGVAw6p
	 DNU41R4GsmJtI1HbP0+llcWhiVTt/gl6WXaNFrivFnsEwW+t3xWnYiMMA0u9QcUSbCNcB
	 2+Nhsy54Ru1oxkmrdyokRs9kf3l+tO7e5ol1itzRKxQn8oG5MJc5PQD89Q0Ek9pfCPKFI
	 +iMgUxt/lnuoIMhjcy2MJCn8rhMElFi8AP3DxrM3u8N3ORGZvA5eqUQ29nXEuigMJWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793241418;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6MwRSY6bnwtZaheS//l1SzdFB6X3vt6g8Gfnj0RCoX4=;
	b=m/pT68+snsmou/O+cTIa+QQDOrD7BsboL1yCLGakslLMb/ykTrquO26zrnhnJsof2Ln1
	 WcEMJFciO2pKRcaTEhYylN9mtlReHAdDeCofSRl8RImj4YA5D5GgHw7IvYhcpjLTOSkby
	 9Dw6S6D8zuBWobTA5BG67c1V4/UvJ6v72xRYYJl5fz9QXyfqdGVvJwA+NiyT24iLclIdi
	 5nfo2GVWNZNgqFOIEXuo/1RmL/dbpyViQDSG+hTx49dLSFQz/HYCoGGTtScWsllrWT2P6
	 Tj5oTy1SSD1NXVrNuQb/a9s0/EfqSRqwissaBZg5/DtJzhy9i+JwNTaN2PDbz7zzCSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oD2WrMlL;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784BD606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 784BD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oD2WrMlL
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso787695a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793241418; x=1793846218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6MwRSY6bnwtZaheS//l1SzdFB6X3vt6g8Gfnj0RCoX4=;
        b=oD2WrMlLgmRdvHZcH7tlMsqnvwCJW+xzcK02xu2nSHjfW1ffR2Cuhccgf+ZLkT3/ap
         Wal6uiDl/vF2o3rv0gcE9BK0f2JwnPQYu2wMzSv0ugMh4fkps1mHReEAjeep8vrpxbmE
         lS8XbKawxjgW6TdKFBagmi8DZd8Mz+X7BSfQdSXO5x2eVbxlVIChKFSO/EgaJyrEWuSh
         pN7Dfzm2aC3vgo5/uhJs6sUiemZUvjIYRJ9Cy/+7PIVOSTEGRc2v7uNRt1Xt/ml/THxN
         LgM7lR684/Hz0jFpSPwFVOUn1Zo3azidWgCB05yw4CWw2GPRuwYDjzncDiljAwW7kH6+
         Wj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793241418; x=1793846218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6MwRSY6bnwtZaheS//l1SzdFB6X3vt6g8Gfnj0RCoX4=;
        b=RxHPpNic2cYSnUnJ0NL7gJz16qoTunTcK6KkKu6gxV7dqqYngtxeTDIzKR6s7juAO6
         ygqU/cB9KdPL4FhAijG40GK0DJPZ8DoJfjzqg1lXVpvx4N1SVeHYUE/iFuhQNliniTFC
         I7vjvYYCJex3RoxtZy8qpCljccDOBBnlymo1HEME2tnBJJ57AU3G9SONDghxhvF1IRqz
         vTI9pnOVCbQf+W+6ODHzgseaO5023UMZSgZ4X+X0G1iw0/oIEzB11RkxGsouO1g8cS5c
         B68JabkzPkGyn70gdTuuGiQO8gMjPN/u5qkgBmUJuZ+5KgTwl6D3S99HrmKBe8OSZk0e
         KUfA==
X-Forwarded-Encrypted: i=1; AKwUvBxlqZ+4cxqeF2KiL3kKT0h9MrQYOwXNzpL7d8Qoq6XLFH3BtusU1IW1zMqmLfvX5IOLrFt/A3mTfqzV1bQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjvt9uJRG78SbVZ/hATvfu0LcB79m7NXM3uvJYHltN4NUWFCoq
	zTTfIfuelNKvEOrflvEQKmeFX5N5d8lVXjRz4IS2dQItkgzVW/xXPnLL
X-Gm-Gg: AYBFou0AR+uZeQ6jdTecmKmcyYcW25G6Hem9lEQb3cteWA7Vp2/kweRm8RyRQv6BvrO
	ppYI191ssF303r8LdHNXQgJSugu/15YEPZ4ahCaM1sEdpswFJB09tEui4OHdrAw9FD9Cw6sHUnp
	eih7GgCc5hKrtfO+48RkBC5jY0sofeAIzKEa7SZtAhtVnWHyJSVWVBJ2gk0oYj+2KQ4XgHXlkHz
	0KCFC+mlPBJcAu9ca5+GnhSHGSd78GOgVuHblLCl/Q3pI55zOWLT8gkm4hLik7dMYso4RcDnYoU
	daPe/gY+e9kZ52g4atgnUGE/ee3fPSGpsKbBc/eR1QGU+UFFRDvI4lLIP65ptIBQvFkmcEPEO2c
	/nAG7I9u3ZOUQMPgy6+DrlJwe4IQlawxGpOxDmMVuScfD6esUxK6CtuO6CdSMVqwDu6xxOt7yQg
	4rb6vrg0xvPikwNsY0Fntc9KqxPNNdWAgbgA0857fCiZa2lQEPq0SNc9I+9vYzwaV5XrYH2ueaf
	6C4zp1NLPYpWB6OOot9CADe9zPfTvB41UwfRJ5OgFCqcxjI23mNxPnj3V5xeVCd0eQtpdTbAF3/
	ZYHm/8eOI57HVkUo8ixjYWpfKA4p0JZumUx7DS3itlumlA==
X-Received: by 2002:a17:90a:d603:b0:3ae:3f20:7056 with SMTP id 98e67ed59e1d1-3ae581d39c6mr3152541a91.31.1793241417716;
        Wed, 28 Oct 2026 19:36:57 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5797f6aasm2762010a91.2.2026.10.28.19.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 19:36:57 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: peterz@infradead.org,
	mingo@redhat.com
Cc: tim.c.chen@linux.intel.com,
	yu.c.chen@intel.com,
	kayracizmeci@gmail.com,
	kprateek.nayak@amd.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH] sched/cache: Check reduced capacity before alb_break_llc()
Date: Thu, 29 Oct 2026 10:36:50 +0800
Message-ID: <20261029023650.3404429-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

need_active_balance() moves the only CFS task off a CPU whose capacity
is reduced, for example by IRQ load, to an idle CPU with more.
alb_break_llc() runs first and refuses to move a lone task off its
preferred LLC, so if no other CPU in that LLC is idle the task stays on
the reduced CPU.  Like asym packing, which was moved ahead of
alb_break_llc() for the same reason, this is a performance case that
cache locality should not override.

With two LLCs of two CPUs, the other CPU of the task's LLC busy and 60%
of the task's CPU spent in a hardirq, a CPU-bound two-thread process
stayed there for 20 seconds at 38% of its normal throughput.  With this
change it moves to the idle LLC within a second, as it does with cache
aware scheduling disabled.

Fixes: 714059f79ff0 ("sched/cache: Handle moving single tasks to/from their preferred LLC")
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 kernel/sched/fair.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index cfc982205b98..e313c6d212c6 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -13585,12 +13585,6 @@ static int need_active_balance(struct lb_env *env)
 	if (asym_active_balance(env))
 		return 1;
 
-	if (alb_break_llc(env))
-		return 0;
-
-	if (imbalanced_active_balance(env))
-		return 1;
-
 	/*
 	 * The dst_cpu is idle and the src_cpu CPU has only 1 CFS task.
 	 * It's worth migrating the task if the src_cpu's capacity is reduced
@@ -13604,6 +13598,12 @@ static int need_active_balance(struct lb_env *env)
 			return 1;
 	}
 
+	if (alb_break_llc(env))
+		return 0;
+
+	if (imbalanced_active_balance(env))
+		return 1;
+
 	if (env->migration_type == migrate_misfit ||
 	    env->migration_type == migrate_llc_task)
 		return 1;

base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
-- 
2.43.0

