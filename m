Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.212
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489760;
	b=Xgvr1B4O/dP+SAtKW56kpTbNlNyOkshRmeFzpsWGBjOLzEFVRSt96jtKvsQE8XGaa9G6
	 eSMJ30JbjLoYmyO9r1uiX75RMdgVGMhhcdinDDPPo8ldb/WqrpYHyH2Pnva+ZV+RGoqUm
	 05+GNaunWluiPb3au/HTxPvxivD+Kgp+clT4JP33564nfdzqtqEKXmhxRqNA8+pe1Clwt
	 9DbETDDswwakBOIqlgxzVlRxSxKwuh2nI2UFH6eHmfTVrlnzdbVgTGCqErImfg7meNa5l
	 jKiFJ9aVWlk2ZhjSqyrdXEPO/ow8HI7gGsaC6XaUKcCJ6fnPuOWqI4HR+yecOcNx3bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489760;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer;
	bh=hXWl60ZM47k49mNCyZREEqCqJyMP3dxlhN2Msqth25M=;
	b=1iGBGNMPyvcWTjkoDLVHK3s+vQ6e9bsxguaRt29x5L+OTzNDmZbDyqFz4bPi9JGul3wN
	 mFQgBX5Zm1Csrc7L7I7MLC4o+22exZM31VCPn/c/2OZbwlQk7iRojGpsbwiSoWpolfs/d
	 HNtr4J61X4+j7ypnikn2h5wgipRMqXaol8BHxe4OmdWsYRpLf0UlhpLSa+Z1nRIuGyAZp
	 1g+XXFhgnTmNdeu9Hj9haSKHRQIrBOm/heHHYjblB4YTpC83i4HA85rHg1Q9bjoIrCAJ5
	 M0v4E54TmwYD0ED9TxXSrEGOijSLIwot1gYVh9qygB9+7Fj4n1tbH/UAFgivfafZ4xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NXshmdSh;
	arc=none smtp.remote-ip=95.215.58.212
Received: from mta1.migadu.com (out-212.mta1.migadu.com [95.215.58.212])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEE6606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEEE6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NXshmdSh
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=mqDqnlOPqVENCit8mEeE+eXMdsC3agkh5ChP9WL1LDU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792489756; v=1; x=1793094556;
 b=NXshmdShrQBZxZ/dthXxSoCBACjExEw7c+6RLwal40m1vbslO6aTp1teyPYBjCf5wWgrTwO/
 u8ycokgTwMJXeQT7VPcje8HGH9q9VHfc8TsDw/2gfCL3thEa0G/UOE8w4hbb0QHNeuOk07j6QDw
 fi2zIQskuYGjWGaanroxjGjQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a6efb9e73a5e54c0;
	Tue, 20 Oct 2026 09:49:15 +0000
X-Mizu-Trace-ID: a6efb9e73a5e54c0
X-Migadu-Flow: FLOW_OUT
From: Zqiang <qiang.zhang@linux.dev>
To: paulmck@kernel.org,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	urezki@gmail.com,
	boqun@kernel.org
Cc: qiang.zhang@linux.dev,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rcutorture: Fix suspicious rcu_dereference_check() usage for trivial-preempt
Date: Tue, 20 Oct 2026 17:49:07 +0800
Message-Id: <20261020094907.15781-1-qiang.zhang@linux.dev>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Running the trivial-preempt flavor triggers a lockdep "suspicious RCU
usage" warning from rcu_torture_one_read_start():

WARNING: suspicious RCU usage
kernel/rcu/rcutorture.c:2581 suspicious rcu_dereference_check() usage!
...
lockdep_rcu_suspicious
rcu_torture_one_read_start
rcu_torture_one_read
rcu_torture_reader

The trivial-preempt flavor .readlock_held is set to torture_readlock_not_held(),
which check RCU-bh/RCU-sched critical sections. however, it's read lock
just increments current->rcu_trivial_preempt_nesting, it's not also RCU
read critical sections. the rcu_dereference_check() condition is therefore
false, and lockdep report warnings. this commit therefore drop .readlock_held
callback to avoid this lockdep warnings.

Fixes: c6f4e552e1ea ("rcutorture: Add a textbook-style trivial preemptible RCU")
Signed-off-by: Zqiang <qiang.zhang@linux.dev>
---
 kernel/rcu/rcutorture.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
index 92ff197f4789..1bbf8192786a 100644
--- a/kernel/rcu/rcutorture.c
+++ b/kernel/rcu/rcutorture.c
@@ -1164,7 +1164,6 @@ static struct rcu_torture_ops trivial_preempt_ops = {
 	.readlock	= rcu_torture_read_lock_trivial_preempt,
 	.read_delay	= rcu_read_delay,  // just reuse rcu's version.
 	.readunlock	= rcu_torture_read_unlock_trivial_preempt,
-	.readlock_held	= torture_readlock_not_held,
 	.get_gp_seq	= rcu_no_completed,
 	.sync		= synchronize_rcu_trivial_preempt,
 	.exp_sync	= synchronize_rcu_trivial_preempt,
-- 
2.17.1

