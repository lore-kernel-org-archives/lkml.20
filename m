Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315070;
	b=W7JlK2fm7nkFrvPnDjCnMzvvIwIVo46m+EQMapKcRIYg4BBRJgsuJY7q5qyvBDaJAfZR
	 T4S3kxQBZMSwwQ3yTrFimMCLcnkaNIHjqR5i9pfevRbuJ4/9SUlQwlvJ4aPWQY4Q0iUyS
	 3iBsJHxJqGvr28JRAkJukhHx7frrRwOGQiRD4x/4sKiCr+WWdb2utdefKV84zFEYFbl9i
	 TryUEixtBvFeJHJWSQDeXVUizJGdS2J9tJtSZZbo+ytKB2cGTwwiNyvx115dw0IV33WuD
	 y+dWt+H1CMJkr01KLe1Sh1hJSCCeZ4hKSbB0ldZEhLsEkwenIvolS086A+maGQrg3uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315070;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uiX2+KfbHdVEaimIsqCTOjf8NSRl8J5NyXmT1fSHCP4=;
	b=OR3EgYPl+T8LvTQrWD223sOKI1+/QaXAGBAy9TbGHEofHLefu+N74m+kWjeMUdDUJ+zW
	 tXZXl6WyW2oH6lTXlHpKA5gxgnoXko12t/Ql9bu6WAJPIPa9oW467foZEjo/slD9QrRoz
	 iaz3gJBg0X9A1NTXTcCNak+BuzK6hk6KSFcjGgvZcpRg/f/3tdhoLCniVgBYiIVrZG5x5
	 mvn+3p654Hb7KucdnBjefHkfgV9RmR2B9WOI/Ka7vHUhWCG7tyzuj4lSjSnpc+EPqnpKD
	 Uje7mP++jJCKZzNN0mdHxBBHuCy22eRkEAbMncv7mtmOEoKmti1reOVMl1AYkCeVIFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LxAXxpMW;
	arc=none smtp.remote-ip=91.218.175.137
Received: from mta0.migadu.com (out-137.mta0.migadu.com [91.218.175.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C734C60A2613
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C734C60A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LxAXxpMW
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZZIvINl33gHb4CRuKTL8hmDAGvZ37dC3WvaTtAr/R6c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794315067; v=1; x=1794919867;
 b=LxAXxpMWIPDPvka+wv4RqEo4c7SMasgwW1xzSDKCZPJcajKfxUqXdfrfEfZHjEuYxupEZX1N
 6p2fg7nfZPRsoolIsUto+0xsV7fye91wRngSYdqP2ohFUZJtDgDlOgFZ9Lv54pYK+Zb4TBS7qyj
 AcH+ijkIWRJwBvwPislEEtZ0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e07a28e4e753e370;
	Tue, 10 Nov 2026 12:51:07 +0000
X-Mizu-Trace-ID: e07a28e4e753e370
X-Migadu-Flow: FLOW_OUT
From: Tao Cui <cui.tao@linux.dev>
To: tj@kernel.org
Cc: void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	liwanwu@kylinos.cn,
	devnexen@gmail.com,
	zhaomengmeng@kylinos.cn,
	emil@etsalapatis.com,
	yphbchou0911@gmail.com,
	mingo@redhat.com,
	sched-ext@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	cui.tao@linux.dev,
	Tao Cui <cuitao@kylinos.cn>
Subject: [PATCH 4/9] tools/sched_ext: scx_pair: Don't attach after an interrupted initialization
Date: Tue, 10 Nov 2026 20:49:56 +0800
Message-ID: <20261110125001.4167503-5-cui.tao@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110125001.4167503-1-cui.tao@linux.dev>
References: <20261110125001.4167503-1-cui.tao@linux.dev>
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

From: Tao Cui <cuitao@kylinos.cn>

The cgrp_q_arr initialization loop checks exit_req and breaks early so
that Ctrl-C doesn't make the user wait through all MAX_CGRPS iterations
- but the break falls straight into SCX_OPS_ATTACH(). Attaching with
part of the inner queue maps missing lets ops.cgroup_init() hand out
slots for cgroups whose inner map was never created, and the first task
in such a cgroup aborts the scheduler with an scx_bpf_error(). On a busy
system the 4096-iteration loop takes long enough that hitting it with
Ctrl-C is likely, so the intended responsive interrupt turns into a
scheduler crash dump.

Exit cleanly when interrupted mid-initialization instead of attaching.

Fixes: f0262b102c7c ("tools/sched_ext: add scx_pair scheduler")
Signed-off-by: Tao Cui <cuitao@kylinos.cn>
---
 tools/sched_ext/scx_pair.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tools/sched_ext/scx_pair.c b/tools/sched_ext/scx_pair.c
index 00f595b58f97..35c8a1a07f56 100644
--- a/tools/sched_ext/scx_pair.c
+++ b/tools/sched_ext/scx_pair.c
@@ -161,8 +161,17 @@ int main(int argc, char **argv)
 	printf("\n");
 
 	/*
-	 * Fully initialized, attach and run.
+	 * Fully initialized, attach and run. An interrupt during the
+	 * initialization loop leaves the tail of cgrp_q_arr without inner
+	 * maps; attaching in that state lets ops.cgroup_init() hand out
+	 * uninitialized slots and abort the scheduler on the first cgroup
+	 * task.
 	 */
+	if (exit_req) {
+		scx_pair__destroy(skel);
+		return 1;
+	}
+
 	link = SCX_OPS_ATTACH(skel, pair_ops, scx_pair);
 
 	while (!exit_req && !UEI_EXITED(skel, uei)) {
-- 
2.53.0

base-commit: 5b740a72b55c4267ba4d8010f17dde26b26f52d3
