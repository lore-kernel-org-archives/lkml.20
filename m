Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792513089;
	b=xxmZsLpn5L7doQGg2YXQQfZbKYmuybpdF7uzJzDpjNAk6LDFsSNtjmyV0DmYAW2R0vAU
	 CnK8Ml5tWS84ergRO+c+6WoNBLpL3+Gv+aNOzvTRsjZfTJ68NwDvqxKvRDL82NBUNMpOr
	 UYsMq7Dx6fnmsreGG/D9mAN3FjlcOJXf35sH2KI308vX212KWW7+J5bfjmkL2+4r0aM26
	 HYOC1o5GMgU7vJI9HcSdrTjekT7klCyekGI4Ueg01aV+MHpUmdXPbzJiggXPBUHIklClM
	 962JfxhPrpZsNlfKwjW3K9Icsv2j5otgQ6/f51e+JbdVyao0scN1Oi9rKMT5WXLxlRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=OMrtDF52DVRyWBqun1o7kHIgFlwbKINzimUy1ynikQM=;
	b=V+YHSwiyJtfMIlEkqjs7JSQiQxtGlo/KmEC1A5aRgJoM+9g2hXC60tqe620HiHxbotFl
	 q3/ISR9WMBGvWYeuK4Z3Os4y/94CXpinUF0FDBHcnUvs/zHqxD9A/mv+CpJwwm1tsWnwV
	 Iq+uLZiltLE/9bh3DUUy00ZflJwTV5KtubKGXhPSO0F36KtbugUzOL7od1AY7zlq6kTSY
	 BYtSxHj6Me+AUMs+RjjNeapMcH0Xv8z8Yt11cO46BAxg2wUeVR3XCyjHQiaWLfeoQn5Td
	 EjR3lAMMX/wPZKss6QN0Dqj5OCmXoDt0JpdlR6ajrKFtbYyogULO6ALEQNkMwJ/t2nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nxTIAn+g;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0091606A321
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0091606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nxTIAn+g
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48dfbf48b92so353203f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792513087; x=1793117887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OMrtDF52DVRyWBqun1o7kHIgFlwbKINzimUy1ynikQM=;
        b=nxTIAn+gWEoCRxfSv4s3r/OCACan5178AnO16p/ibUPFBZGxCPyfr6mEcKqGRLp9a4
         w86sMhY382eNKC/quXCGxaH8GFMCo2XU5LLQwRmcqm4etxHmOtXvuEumfHRx6KrHpGYc
         k+9+53z39tGg6DXNGvue1cYLv6CLOigMy8YPcPARBxVq+x3T00i3lmLxiGXuaIqvx9TM
         V2wXNmftQdg+fyXIDP5LI4logy/JI1xm4bxnw1aJirSNf69eSYnmZUjvmYzHyIVjjhTm
         7BCx1jdLdbwNoSsOlcRuMJN+ykw0i9ZVJTba1YXiMmkyzrMnu14nBkzIg26cwkQi/bVZ
         AwlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792513087; x=1793117887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OMrtDF52DVRyWBqun1o7kHIgFlwbKINzimUy1ynikQM=;
        b=tgAblY4cbcanJO9pJayNq8cT0phFta9aVQC1qC1u2J3Ah/kmPpXZlrQs/o3l9L/6ES
         GedrV3UPD+gqn8shap5Ni+3itn2NttyU7UKpPzmNwASFRraZ2FjnvR9TAuuYV1nxSwEg
         dBanN252/dGPHD4bTCzU3bNrUemuXmOy2pHHjVhQhoG50HtSYNmrimzMvq94NB/e9k1z
         pzFriQQy/pry9aixOV3FRNooR8wsozFxAl8YAeYNHgnRqQ0bTZC4P/9fkYKmVJsZkl5V
         RMChz1sMDQxI7Y/c0riS8mydOeT+91mwfeCbEwu5XA5vz0fGcIWD5BuKQH/rbcWys0vt
         IZ3A==
X-Gm-Message-State: AFq9FYI2DPG2chrOAj0GES8aWXfd6ZT3OW5M/eIrjl9imW6wJk4D3l48
	4tEFMTKCeTWRb7qUIHfYO2PHka7wiOkc8bgpuZG+hw2iWnRWhDrDJS+t
X-Gm-Gg: AYBFou3J3X5jUFe8I4YNZJYHk4DxlTTdEy9/M07y4qu3BVjnQVyiS0b5cWyKrqV+i/X
	RGZuvEl73Bsr/9rWH/h5lO+ni25HR2yCuquIX653UaiPtYA8e7rQQTbbqAL2Ar3AAJxP8SEbK/O
	9v+/0DaQ+YXs6vNqiiJ+LM46x+cWYniUuUq3T2i1dvMTp8mh8W+SnSQON/vPwivUUFgLkp/Bp3v
	4sM1D7qwmz4J48GbMGJaUjvjLhMhTT7gRcxxwgGJxa7lotf//FSshDef33jsOBxn+p1urjMzvlK
	xSA+ku9FwCt941xpq7Y6fKy/9TEo+xwzNjFuugR3usFsxlYDeJkoWJTyizDA2nSPO36S2Q1gk9+
	ZJgHPzX4P9dI1oN9gXrjoqpmjehky5/AvEWtZmbwNrMmrQ82GY5JEpPBtlgfOCXoZ0MGqfvHwDy
	4mRhBZhRvDOBgk9CVuF+ZnlepIs8v78+Vg++EXIQQab9kRdGTJf0OJYbpgPuoJlRiFzrbHq47ep
	HOJd5ZuZOYsWN9w2Bi0
X-Received: by 2002:a05:6000:29c9:b0:48d:f14a:9186 with SMTP id ffacd0b85a97d-48e07fba5d1mr14723152f8f.6.1792513087209;
        Tue, 20 Oct 2026 09:18:07 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d818c59sm7604082f8f.30.2026.10.20.09.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:18:06 -0700 (PDT)
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
	Tim Chen <tim.c.chen@linux.intel.com>,
	Chen Yu <yu.c.chen@intel.com>,
	Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	Kayra Cizmeci <kayracizmeci@gmail.com>
Subject: [PATCH] sched/cache: Ignore non-fair current in alb_break_llc()
Date: Tue, 20 Oct 2026 19:17:55 +0300
Message-ID: <20261020161755.55690-1-kayracizmeci@gmail.com>
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

Stopped using task_util() for non-fair tasks. Since the values
of non-fair tasks can be stale.

__active_load_balance_cpu_stop() calls detach_one_task(), that only looks
to cfs_tasks list. So if the rq->curr is not fair, doing a decision
according to it is wrong, since we only migrate tasks that is fair.

Commit f0d243a96f26 ("sched/fair: Avoid creating misfits during
cache-aware balancing") uses cur without checking if the cur is in fair
class or not. Fix this.

Fixes: f0d243a96f26 ("sched/fair: Avoid creating misfits during cache-aware balancing")
Signed-off-by: Kayra Cizmeci <kayracizmeci@gmail.com>
---
 kernel/sched/fair.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 0feec172fd37..6347ae4cb419 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -11016,7 +11016,9 @@ alb_break_llc(struct lb_env *env)
 			return true;
 
 		cur = rcu_dereference_all(env->src_rq->curr);
-		if (cur && cur->sched_class == &fair_sched_class)
+		if (cur && cur->sched_class != &fair_sched_class)
+			cur = NULL;
+		if (cur)
 			util = task_util(cur);
 
 		if (task_misfits_asym_cpu(env, cur) ||
-- 
2.53.0

