Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0A13822B5
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 10:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790503460; cv=none; b=N+HXbJmT7Cx1aM0reArqTsy3p2MUnw8B/S4jQzYRlZXYTu0nIWwSv3t3j2GauIWzOmahjTm7yKigxJ1X9ZgzMEjBMzOI93aAbPSyF0441WCCeyM4D+2o8SI6fgf2bwerkeW6FWG6yIV6MQAEdeRtcAKIudDA/n9680RuTvCQx9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790503460; c=relaxed/simple;
	bh=wMG+WZeHCxfGYxFJDEJTQwz/5F/+nITu+HXulyIXflA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ARfnxaijHB1EieCAM+i08QGlMYngxeprMUoj74PTSBqTd/TVEtDhqE44HBFzC2FLWvoTIKcYgMEAt1xUnMDrFdXlEVdaUyTKcXMMQeW8DvSHT9p1LCxt7yNP63JduSXTYKj7WsqBpYcoDLMRAPsr8DE+EbecWzb9aIcrOBYcKiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NT0dWUQl; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NT0dWUQl"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a0b0fa2055so1244752a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 03:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790503458; x=1791108258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ITvBuQnNqW1F2T7HCAHKBywausXUCxS/FkshXsi/rvs=;
        b=NT0dWUQlF17kqwPd1AfdV55vToeBIGELqff1hZPvACkv5rxuPKhFwvstbbLgG6316T
         Ii1BN/GqB4an+WC7VyiJuIbEufl2i1MzzO8nOlomu9tYCVgHb3frNCF7lg311BNE9C2Y
         rmLa3JsynlxmVJyHIjX2Hek3uTYeMzxppVWlJpFeKll9a9iQFeO9sV4AVuuhHCyHTjDc
         6hoioXIRcZscTFA2I6Pk2Y3DqKJWn+SWZ4oR30jL76iozoRSSw+1t2x7CVGtOSHbULLw
         BPjjS0LQgy22iK/eVuWioUUXzuOdZ3J1xXqsAwn7KHCuK6bt6QkfdpATFxguJmAP5s1O
         8WGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790503458; x=1791108258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ITvBuQnNqW1F2T7HCAHKBywausXUCxS/FkshXsi/rvs=;
        b=OgKVmsTan/UQX9r6VA2Kri1qKsEDdrWwxS/EyjtBSg+cLv/WSCIlL08VJ1b9HN6BKU
         NVMviHU+XvZYuOVwY6gxkLHQqR9ZIVckrNqKEnkjtNMmCT3oRwrQCaNGNZYntS3HVSSN
         Yl59PBszkdioN4iSaY4CDQNWfY8hNOarxrdqMH2JQ5OE4tfXnKbu58HVWzPS/dOFFArs
         T93IXbMNEQnwZEQTpZ8xQCYD2B7L7Cfg4gVt7i3ht6xT/pGUg5PfUa3xVVHIzVGdWMkf
         vTry1EzQ9YpyL989PjtWm6kJVtbS+pJX7oVG5otFaHis22BviAcXdo/H2whS9aLIGP7g
         5LPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwrgTOWQdR3OPTRnbiFuMyxOleK2TW0gi1GWruCPcwhLWIWeGxP5XuZYjaqfu3hrA01pKj+Xzr2RwdSCIE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJD5J8J8V9NXg8iwCGyHrFnGBzRvgqbZuvASpYgz3pWPu/8aedM
	LKH+AcPh6AIkBCDp36+ot8hiBM8bGZkWhqh4x3WCRDy/0RBBIdqV5Elu
X-Gm-Gg: AYBFou2+9U1sx7Ey+MbbAOLzr5uHfUkCCVzdIp4TWX0iXqbMbCnpA01l7VwToNt7czN
	1JGrA0Ov/dt2+4VNu5BC2C+bVFQZ8lW+sMYtJA5lkV3RYV3bqwQHl7urhfK+DwrvYS2S9bNRvGq
	MvH67Qa4+GJDWKboJHdETlYD4g6bT1Qoloor/UHtOL+8eadV8mc9gm/WgHb5uVXsS6262Yuo4Af
	/DDrfH8H0q5qshYuTaLcVuAfqA72ujtvbzyQ26VnpTqGmJjB7imx0pggkc/mn4cNXOONLDnm6RR
	phu55vLidgK1zc56OndZhEanrsYUSdoDRSZFvkG/UnKbl0CSx5wgkXVWnC6e9QWS+tx32FHHqF6
	T4liDB72RmU1eq/to5P4Zo6zFTQww4tBRTouJA9TBrNwJwbB4bZN0ydh6/IUXKA4C2eYgjSs1tN
	zmWK07jQsdBqtzVFXpw5nM2UUtEJBd3xKUvVo//lzzIKuD+Nd4Qxw7Z800f40qNMbs0lEIh/HS5
	fi46sTtJkH0caVb
X-Received: by 2002:a17:90a:d2cb:b0:3a0:dfb6:aec7 with SMTP id 98e67ed59e1d1-3a0dfb6d466mr3310823a91.67.1790503457660;
        Sun, 27 Sep 2026 03:04:17 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efaeb3sm14239040a91.2.2026.09.27.03.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:04:17 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: dave@stgolabs.net,
	paulmck@kernel.org,
	josh@joshtriplett.org,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	boqun@kernel.org,
	urezki@gmail.com
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH] rcuscale: add srcu_atomic scale type
Date: Sun, 27 Sep 2026 18:03:59 +0800
Message-ID: <20260927100359.3903688-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for scaling atomic SRCU grace periods using
srcu_read_lock_atomic()/srcu_read_unlock_atomic() and
synchronize_srcu_atomic().

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/rcu/rcuscale.c | 47 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/kernel/rcu/rcuscale.c b/kernel/rcu/rcuscale.c
index 5aca31c3c01d..86f1a912ebee 100644
--- a/kernel/rcu/rcuscale.c
+++ b/kernel/rcu/rcuscale.c
@@ -264,6 +264,51 @@ static struct rcu_scale_ops srcu_ops = {
 	.name		= "srcu"
 };
 
+static struct srcu_struct srcu_atomic_ctlp;
+
+static int srcu_scale_atomic_read_lock(void)
+{
+	return srcu_read_lock_atomic(&srcu_atomic_ctlp);
+}
+
+static void srcu_scale_atomic_read_unlock(int idx)
+{
+	srcu_read_unlock_atomic(&srcu_atomic_ctlp, idx);
+}
+
+static void srcu_scale_atomic_synchronize(void)
+{
+	synchronize_srcu_atomic(&srcu_atomic_ctlp);
+}
+
+static void srcu_atomic_scale_init(void)
+{
+	init_srcu_struct_atomic(&srcu_atomic_ctlp);
+}
+
+static void srcu_atomic_scale_cleanup(void)
+{
+	cleanup_srcu_struct(&srcu_atomic_ctlp);
+}
+
+static unsigned long srcu_atomic_scale_completed(void)
+{
+	return srcu_batches_completed(&srcu_atomic_ctlp);
+}
+
+static struct rcu_scale_ops srcu_atomic_ops = {
+	.ptype		= SRCU_FLAVOR,
+	.init		= srcu_atomic_scale_init,
+	.cleanup	= srcu_atomic_scale_cleanup,
+	.readlock	= srcu_scale_atomic_read_lock,
+	.readunlock	= srcu_scale_atomic_read_unlock,
+	.get_gp_seq	= srcu_atomic_scale_completed,
+	.gp_diff	= rcu_seq_diff,
+	.exp_completed	= srcu_atomic_scale_completed,
+	.sync		= srcu_scale_atomic_synchronize,
+	.name		= "srcu_atomic"
+};
+
 static struct srcu_struct srcud;
 
 static void srcu_sync_scale_init(void)
@@ -1176,7 +1221,7 @@ rcu_scale_init(void)
 	long i;
 	long j;
 	static struct rcu_scale_ops *scale_ops[] = {
-		&rcu_ops, &srcu_ops, &srcud_ops,
+		&rcu_ops, &srcu_ops, &srcu_atomic_ops, &srcud_ops,
 		TASKS_OPS TASKS_RUDE_OPS TASKS_TRACING_OPS
 		HAZPTR_SCALE_OPS
 	};
-- 
2.43.0

