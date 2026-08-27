Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0573FBB4E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787821524; cv=none; b=Gj9VrGWXxp4ohyMsk+9d3ANwda+WhCcX/ysNCZvYbPCY2NFWk90wdUaXSrsUVJhubSFDOzbzYzWUda64zMWvAnUwqhP5gBTUem3vHBQSuA79gWYIMXwBa7wmwL0fZzjBXsIXYRVSvUJIRF7adTh/8zRnC5QUc6vER7bxtz7t+wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787821524; c=relaxed/simple;
	bh=oN8YLZgjM7glwBTvFfgUO69SKZnq8TcdnbKsMa/7Cy0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=njKDIiptr+HMxoK6+tTjg0L4Cs1t9RatMlnUDIFY2gf5X3Zcd5/2Cresp34zPWhTQ2moz89Yyc+IJs/YSNE1WuiUU6LFrnIFihJbb+E3mGkmbUl0/XAWFUsGVnkYks4APM7pJSb4yjmVERE6ge+bwwmq6HfxwnFQ42MVaxY958Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-396bf83d458so54366a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:05:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787821514; x=1788426314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=La9AuFLCROXXxoi0dY8Uwszt2DZMaT/nI3rGCZbvoXI=;
        b=BSTfIUdRSLvki9GRX0pSrTCwsKw9UIRLJAQCBjCbuamynQvC2ewDbcCLwgz7khGf75
         XUB7AwAVh0E6b8GrFoO8jZXCzbJcygFrCD146v/jThlp8w9kvtiJQuRxs1kXvYHaUwhV
         Mgz7FP+PadQRM7U9+BdtbZWOqwvHMSeVirzRIFxeianH61WEo9J7sDCkrzmuV4Up6+HN
         Oh/vinq4ojHqphwvJKGErN6BIL47pJ0iMfT0rYUWCXPooYgfgSQ+WTEELXdU42PkZ4yC
         QOWVqN0shjNFNrq6raCw2Ga1S68h7V6BHfTThyTnP/GqorW9BzCZvfi7yVi25LDBxgoK
         ZxFg==
X-Forwarded-Encrypted: i=1; AHgh+RrmUeeOUvkASQFBfxys7Bkt8cZxh+6nqavHkZQrIkRA1PG8WE2Ch9Qvt84wGw68KC3qVubEQ7+1eYC+5r0=@vger.kernel.org
X-Gm-Message-State: AFuF++kVcPwud77//4qItAp3xWXvU9iacfWj0T2FN3PgqpDi5X+d/0AA
	JAtvX+oTEr3kibBm0ISGG/kNSuvumDAk31+E+oJHmIpwKuCN5Kn6iEpG
X-Gm-Gg: AR+sD122WLeqGt4t1HhPC+oTcXQuEWutiFCUmM9PJIfsMfEu3Dc6bF5jSdTIODxnbxD
	IH9DTq/GIOEmgSRDW9bgPPM15G5QAbTkNeJuPfNo9EIHVbUWOeR/EqxtXrzQ2LlErsXuvq6UhZx
	jGeti1Vtnz4qLV5K35M9gCD9z76n08fh5DTvuw9g9wqN4GNxnXp2UgCiV+OqMdso+ejqc8GREF3
	Z/+BS+XuhZLQdcBzdqxsCI3Zu05sBMWNOCt+v7BUZD+M/E7hJFOAjBhsA0XIxgrx4d4ScdiqE0O
	2hKlB7XL3aZ9qk1vEei5sltoF+MYs1jT0LHB5yWy5DxmczK18UFd1xCqUVm8WR7vJWAaurGUuzl
	zSNvdaZvO1UxVROT21coF171Q3YhEjD8aAqw+WorX9rp4WVDPOw+05WaodRbPfZUY2AibRcam0K
	JOTxnooJfFs0S9+PRiJwrOpagY0xXh7f/vvCVjTk+TKTyU1q2k1x6hXNhKcl3ZkkyDJ8rB3SXHG
	24nW+zFyNdtpwC36RL9
X-Received: by 2002:a17:90b:4c4c:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-3966d43edbamr26043983a91.4.1787821514469;
        Thu, 27 Aug 2026 02:05:14 -0700 (PDT)
Received: from kylin-XiaoXinPro-16-AHP9.. ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0d81682sm1950678a91.7.2026.08.27.02.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 02:05:13 -0700 (PDT)
From: Xueqin Luo <luoxueqin@kylinos.cn>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org,
	christian.loehle@arm.com
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xueqin Luo <luoxueqin@kylinos.cn>
Subject: [PATCH] cpuidle: teo: Do not return a disabled idle state
Date: Thu, 27 Aug 2026 17:05:05 +0800
Message-ID: <20260827090505.3703860-1-luoxueqin@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If idle state 0 is disabled and none of the enabled idle states satisfies
the PM QoS latency constraint, constraint_idx in teo_select() stays at its
initial value of 0, because the loop that updates it starts at state 1,
and so the candidate state index is capped at state 0, which is disabled,
and that state is returned to the caller.

The cpuidle core does not validate the returned state index against the
per-state disable flags, so the CPU ends up entering the disabled state 0.

Address this by falling back to the shallowest enabled idle state, found
by the same loop that computes the candidate, whenever the state selected
by the latency constraint check turns out to be disabled.

Note that if none of the enabled idle states meets the latency constraint,
choosing the shallowest enabled one is the least intrusive option, and it
is also consistent with the behavior of the menu governor.

Fixes: c410a9a142f1 ("cpuidle: teo: Change the main idle state selection logic")
Signed-off-by: Xueqin Luo <luoxueqin@kylinos.cn>
---
 drivers/cpuidle/governors/teo.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/cpuidle/governors/teo.c b/drivers/cpuidle/governors/teo.c
index ac43b9b013b3..b4b14c86b2a9 100644
--- a/drivers/cpuidle/governors/teo.c
+++ b/drivers/cpuidle/governors/teo.c
@@ -433,6 +433,14 @@ static int teo_select(struct cpuidle_driver *drv, struct cpuidle_device *dev,
 	if (idx > constraint_idx)
 		idx = constraint_idx;
 
+	/*
+	 * If the state selected above is disabled, which is only possible if
+	 * it is state 0 (all of the enabled states violate the latency
+	 * constraint in that case), fall back to the shallowest enabled one.
+	 */
+	if (dev->states_usage[idx].disable)
+		idx = idx0;
+
 	/*
 	 * If the tick has not been stopped and either the candidate state is
 	 * state 0 or its target residency is low enough, there is basically
-- 
2.43.0

