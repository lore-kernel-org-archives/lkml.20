Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793655326;
	b=iXY+q0QeGnGgc+6RTji3rNa0A2m+HFpPlmT25lCbV3IpfE228B6r88uAzNpWrvpG3x4o
	 rHWbzAbEHKqPX+qrN1K4cE22EUE94JuepJLEgzLbwJLT/ZieJ42iKU7znAGd3YXoxceOp
	 fpyMMP3Vx1cAW46MIE4zJqOseV/KO3jXmW7aef3VPRVaKTT/a/nF0crLkpaKXOiQkri68
	 LLXpAzqOkw/uJscr86cUrTnlogz9U0fxxY2X8JKhhaigLaqu1Y+F4P2G7kso7TWhIucG2
	 8sqC4z8pULEkodtQ7A+pHYA8dtntV4CuTdEihD2MFpZhQc56/so3LEYxqq29E27PeWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793655326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=lgO3v5RlQEcLHRiGwhOuiU/y4Jm5+gR6j8rgw8/evKY=;
	b=O0clVg+nsvomTnH8ONjPhl1N/WsnM+kc2v3NqwwxWSstn0Sl6O+EAoz1BlkWbCor2EWY
	 EoWVtxgoIGzQpmEx4qB/0VnVN6KOedAzeXE1SUIh7ionF4onhrmR6gg0ULwT6m2eiNK8O
	 dRbHpoA9419m7MJSZICEoI/yMNNsIdQtWn30pWMeGo69ybKuBPmY5fihB+JJ4g4uLSasS
	 R+BBFqEqY1RVYUHWuHczPVUVVEel0ckoOBcuqzSp1Z0vU0n8/wJfParBGdn79t4b1jCGZ
	 XlwBi2rl2+R6IQGTkSkqgdo/7jR4zAY8idMWyakVMaYnm2u2BkB21b268cKzZ4+vurQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b="2CE/00Ob";
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0818606D835
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0818606D835
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=2CE/00Ob
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jJQ3d1jhvz1XLkpG;
	Mon,  2 Nov 2026 21:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1793655322; x=1796247323; bh=lgO3v
	5RlQEcLHRiGwhOuiU/y4Jm5+gR6j8rgw8/evKY=; b=2CE/00ObOQLT0qtXZ4ZcD
	LDWVpEuImVI28FD7/rRrzAI92W3ZfyzzmVDuj7s+g8Z7EVuCts6yL4SZejAkkow2
	77Y8oH3fsT/yyznBgazXAoUiTZEyev9xTVpfYq1rTUby/NEJsOntac4nH7IUufiP
	SQoygRlysaauSTQBTkD/cwLfQgEhVjiLvg3nSWZw56muzLf536wNU3/ppfnYv0q7
	u3lnnWfxh9GI/s3yfz/SZnLztHYJVHZxo6ujJwsi14FtGEACEIM5XzlB/qD2hduz
	2UjUJq9M5fkdOD3P6TayqxyTRx4ShbmIv6nwtAaoHILkbPG8EfoQrQ1gY2VC8Mgt
	g==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id ZdG06yrDIFIn; Mon,  2 Nov 2026 21:35:22 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jJQ3Y6BKKz1XLkt9;
	Mon,  2 Nov 2026 21:35:21 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Bart Van Assche <bvanassche@acm.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 06/14] locking/rwsem: Annotate rwsem internal functions with __must_hold()
Date: Mon,  2 Nov 2026 13:34:36 -0800
Message-ID: <7537139adcddb6f743e31b9e3e88240ed27db6b5.1793654853.git.bvanassche@acm.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <cover.1793654853.git.bvanassche@acm.org>
References: <cover.1793654853.git.bvanassche@acm.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Annotate rwsem_del_waiter(), rwsem_mark_wake(), and
rwsem_cond_wake_waiter() with __must_hold(&sem->wait_lock).

rwsem_del_waiter(), rwsem_mark_wake(), and rwsem_cond_wake_waiter()
access members guarded by sem->wait_lock and call functions requiring
sem->wait_lock. Currently, lockdep_assert_held(&sem->wait_lock)
implicitly assumes lock ownership for Clang context analysis. Prepare
for removing the context assumption from lockdep_assert_held() by
explicitly annotating these functions with __must_hold(&sem->wait_lock).

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 kernel/locking/rwsem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/locking/rwsem.c b/kernel/locking/rwsem.c
index b9c180ac1eee..c76a3a712c31 100644
--- a/kernel/locking/rwsem.c
+++ b/kernel/locking/rwsem.c
@@ -392,6 +392,7 @@ bool __rwsem_del_waiter(struct rw_semaphore *sem, str=
uct rwsem_waiter *waiter)
  */
 static inline bool
 rwsem_del_waiter(struct rw_semaphore *sem, struct rwsem_waiter *waiter)
+	__must_hold(&sem->wait_lock)
 {
 	lockdep_assert_held(&sem->wait_lock);
 	if (__rwsem_del_waiter(sem, waiter))
@@ -429,6 +430,7 @@ struct rwsem_waiter *next_waiter(const struct rw_sema=
phore *sem,
 static void rwsem_mark_wake(struct rw_semaphore *sem,
 			    enum rwsem_wake_type wake_type,
 			    struct wake_q_head *wake_q)
+	__must_hold(&sem->wait_lock)
 {
 	struct rwsem_waiter *waiter, *next;
 	long oldcount, woken =3D 0, adjustment =3D 0;
@@ -995,6 +997,7 @@ rwsem_spin_on_owner(struct rw_semaphore *sem)
  */
 static inline void rwsem_cond_wake_waiter(struct rw_semaphore *sem, long=
 count,
 					  struct wake_q_head *wake_q)
+	__must_hold(&sem->wait_lock)
 {
 	enum rwsem_wake_type wake_type;
=20
