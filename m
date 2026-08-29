Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3643E92B5
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 16:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788019331; cv=none; b=PmjUjAxXR4nRy74jd/WzJkvLPSzcOX2y0WmDmIqIG1qf1YwVrOUruKwFKWqJp++5C8QNZvmFvG/7772CnL/tkX6KjC/xbv4PudXjWG3BvySiflbhPa0zu0Mw++R6X8ymud/XMMnP0RMdb0HVAHEukWcWZcVVPXDs1AnaSPPxdBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788019331; c=relaxed/simple;
	bh=yzDb+syqlRp1iiWqbQ32I4hvml+kDYNoe7IqTIqFl08=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IFsfFzgV2Jl681bNj7qm5PdCJ5k4kZexKPecTfeeFshHmY2RzOO7QPqbISE/mXP+nzYz4wIr4SFbsXETkYp7+MJNdjNwF91fZSd1BhlauXJJAc65FwKPxENth04N87Br6tsKLif7wKp8cG2oxMh8tqks03LQjI1m4z5yLGWRCvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=grrlz.net; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=hooGz6tx; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=RVuO874V; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=grrlz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="hooGz6tx";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="RVuO874V"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1788019317; bh=jyod2vdapIzVT0jrWX2kWlx
	Ck2r1I9RyX4lHKcfNBXo=; b=hooGz6txU1SPyBBENK3UDYSxS52Fn8xH0X/zNMqGlJZg4BhkCn
	XohZZS8aaQiXGSGt9ACCGAandu3iXQP1qiieN379OrG+JeqYuraPkIATyzZrgBFsxRCIvYPoT9O
	IEqQOY0rO/mG5HzjeVVkafy7kWgYO4WbQAfqhov0ozLf8/kurK/UnBosJVdyAx3hJ2+lQhBLEMK
	CHXOfGzP4R44okgDT3BZ173y7MjZ64ibynzERxK3XTe50so1oaaqKCsWQr0IYVayvF5YtMXuPJs
	21P/Sxt5X4NRt6+lFan03CQ8FjIFn0LybuDRqCAONcQZjAPT4STI1oqPntEfijgrrIQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1788019317; bh=jyod2vdapIzVT0jrWX2kWlx
	Ck2r1I9RyX4lHKcfNBXo=; b=RVuO874V/oBxSbOUA+YhXIwAcT7801Uh7NArT0spvycsZSqQx5
	xV2sC2XOdjPlzTcVa+O4WRX9Txw3iQbN1mBw==;
From: Bradley Morgan <include@grrlz.net>
To: Frederic Weisbecker <frederic@kernel.org>,
	Tejun Heo <tj@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org,
	brads@mainlining.org
Subject: [PATCH] kthread: remove worker->task self-assignment
Date: Sat, 29 Aug 2026 16:01:57 +0000
Message-ID: <20260829160157.6814-1-include@grrlz.net>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bradley Morgan <brads@mainlining.org>

All kthread worker users now create their workers with
kthread_create_worker*(), which sets worker->task before the worker
starts. The self-assignment in kthread_worker_fn() is dead code now.

Remove it.

Signed-off-by: Bradley Morgan <brads@mainlining.org>
---
 kernel/kthread.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/kernel/kthread.c b/kernel/kthread.c
index 63beb59b7a3d..18bc702e8d2d 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -987,13 +987,6 @@ int kthread_worker_fn(void *worker_ptr)
 	struct kthread_worker *worker = worker_ptr;
 	struct kthread_work *work;
 
-	/*
-	 * FIXME: Update the check and remove the assignment when all kthread
-	 * worker users are created using kthread_create_worker*() functions.
-	 */
-	WARN_ON(worker->task && worker->task != current);
-	worker->task = current;
-
 	if (worker->flags & KTW_FREEZABLE)
 		set_freezable();
 
-- 
2.47.3

