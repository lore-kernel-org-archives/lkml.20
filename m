Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F243E4107
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789894486; cv=none; b=hyqfjkL4A/O1zNc1cntu9USM1RJ9uVnP0ZFzKHc2nlo7u+E3pzfJah4O4ltXahEAAx6zZwU/WLrGZ+IFsVlTfhReYCdsrGC4k6r3vrpeTwvBKwsuQDHModS1I+0qcpVZeK7u5muuu5rARouNeF+dWh+hOHkUyHaJsRlBjqi2tuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789894486; c=relaxed/simple;
	bh=07bxeldFXNcwHkJCOY/pr4GAXZvVcdC70ibY51lQxw0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZvxoijlD5tqTRO8GWDLc1n43E05bsSDonczm2xJitDLb8hu1WBzyQRbPwS+hSVSwCNa0ouzuGSZC9XqSWqP36pBjjdO7arv48QhN7hcIWc2AZVFFw85qZqG8kEMr3or2SPQfzC7ftWTXHeoCOUUa/DJgUoPm9VUA5uFRBrQ4Xeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lVGpseYN; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lVGpseYN"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea50dc3so1363262a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 01:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789894484; x=1790499284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PNzFp6ZFnRAw/B8A6FR6yybdeCPLPEZTUh6sIRvROXA=;
        b=lVGpseYNDoHET0qhk90MrLeFeM7Ny+l6otrVF48PW82FfgVCh0cZUKRbFSQwNmDXFH
         hskh2DQrK0/b0ge2XP2UaQVuMnzRjy1E9uC3LOzbXyOTnOH9jq5NuxVcDumDoQ8MFSsX
         skJovq+acrDYXeVUMTq5He1wTSmmmXz9qh6vEDO2+1oPBdvaUttVYrDUhtMsm/GTTAoS
         T67J//x9FV+7yGdCBtv4mQEFdbaxZqu9j4UX+a4pKBd42KcbDj2ogPYilqNyZI+oHPus
         Pbsu/oYti/tfXmt8+Iy/PApNykF+lgvNnN6e2ymvtXKLqPBKHHU7E7Bw01EwFfNK/ZWg
         47NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789894484; x=1790499284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PNzFp6ZFnRAw/B8A6FR6yybdeCPLPEZTUh6sIRvROXA=;
        b=HuUCwRwozniITnkIc/7xDtyR5pgy/JES05dEETVIr8D9egXJ3Ivzoq7CWEj5cpdTi8
         3oyfCdNHOXh2DiUMd30aVm2OdNrshM6YTD+c/bn1ssWnLCQ5C3z2snMabbWlVTHnyz+/
         sMBA6dHJcjNvHbclvuvNbsoq50cwF2aH7UyCdW6oAUgG3lT73VwYfaJkJsybljGi2UgX
         saqA0jV2A/P/Q8/hhMEGmueVsB8PN6MZXemXWREMAkwau/qqA+05AfAjTKvqpXnwBy5D
         3uhaR8NQiUiMQutAuBmx61jr+vHw3zeuZ3vAJgY0VXBxSHCjFH1D3pkIUZuYDtRWiWqm
         tGIA==
X-Gm-Message-State: AFuF++mbTQXlF18aiCJ0d1ciZl2CEIqz4BCXvcoD1URMj47FOOAcwb3W
	XqgVQBwQlO4etsbiXdp5Bp0+aWwSIMXzFC5UVgZinz7BBu2NKH2gX3gv
X-Gm-Gg: AYBFou3L0WhuG2OkEmOfg8xabt2gOmlrActc0b+9ZET9QN98DsVVZ9mx/CWGPRG9GiX
	K1ZShLdQZlpsfqNHyc7+BrnAk01Pgte39Ao1n6Bf0Lp6/C6+vwATiIVKhvnSxK84x1pQJ9SWMGb
	mAUGYu+WgMGtdo1FXfWyrWVck+2ilMiHNpHnw/4/9/gRbwOaohNsBG9g2/T8jb9dxGpKpOa2ZyI
	Q7vqTiiCzrwRsuxxl2HfQDm9MQCjLVPmXtJ2kQ4+rQGvtrA8XODYjG672shtYf9H1xerVDrezxU
	UsxaP5ssRv9ABFFhJmrGozZv24TizrctbwFseV95rZzMOXN5hErbAeSmerv3ztMU8ttuLI72u4u
	Ajg2nZS/nZcdYnq/8kK4BEM9vPfUNY2G5eM0pwcWh0k5r1z/judKVXo7C9cS6SwLThNRdSBugC8
	JpYY9wU2sK96XVovnoRMBuNXLNLhNWl15Gqo8aHIKX6w739tuiFPbG6ucBD5J+H5qmXzuCudd2U
	f/b07zNO51SVnupRw==
X-Received: by 2002:a17:90a:d884:b0:39e:6a7e:ee16 with SMTP id 98e67ed59e1d1-39e6a7eef52mr6862714a91.34.1789894484076;
        Sun, 20 Sep 2026 01:54:44 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c3145dasm8285167a91.4.2026.09.20.01.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 01:54:43 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: anna-maria@linutronix.de,
	frederic@kernel.org,
	mingo@kernel.org,
	tglx@kernel.org
Cc: linux-kernel@vger.kernel.org,
	paulmck@kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH] timers/nohz: Annotate lockless accesses to got_idle_tick
Date: Sun, 20 Sep 2026 16:54:34 +0800
Message-ID: <20260920085434.2918331-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tick_sched_do_timer(), called from the tick interrupt handler, sets
ts->got_idle_tick when a tick fires while the CPU is idle.  The idle
path reads and clears it via tick_nohz_idle_got_tick() to detect
whether the tick handler has run.

The flag is accessed locklessly from hardirq and task context.  A
concurrent set can be overwritten by the clear.

Use READ_ONCE() and WRITE_ONCE() to annotate the lockless accesses.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/time/tick-sched.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index 6c3fea386713..c0ab32e543b3 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -269,7 +269,7 @@ static void tick_sched_do_timer(struct tick_sched *ts, ktime_t now)
 	}
 
 	if (tick_sched_flag_test(ts, TS_FLAG_INIDLE))
-		ts->got_idle_tick = 1;
+		WRITE_ONCE(ts->got_idle_tick, 1);
 }
 
 static void tick_sched_handle(struct tick_sched *ts, struct pt_regs *regs)
@@ -1248,8 +1248,8 @@ bool tick_nohz_idle_got_tick(void)
 {
 	struct tick_sched *ts = this_cpu_ptr(&tick_cpu_sched);
 
-	if (ts->got_idle_tick) {
-		ts->got_idle_tick = 0;
+	if (READ_ONCE(ts->got_idle_tick)) {
+		WRITE_ONCE(ts->got_idle_tick, 0);
 		return true;
 	}
 	return false;
-- 
2.43.0

