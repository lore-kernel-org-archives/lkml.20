Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251644;
	b=c6BEe5d+CAKAwBgx3UGIXOkiCeg9464MfzN3EHVyrULkbiopkaAdQg6ZQCygq+THHwzZ
	 SajlCAZbpFraeCPwvVhorhrxjA2mfkjakv1w505S2A54EjN+Cyyww3EUcpWDA+y+fehQ4
	 zGoyKobVQIAGTrGXtkUohkSKQ0vQJi/SAWtHFA9hPd8uPFv4ZB5fpzX33fvL4h/vFj5uM
	 HuHmxIgIl8qcAQS2H66iamosWsR9tRSxvUd1LyyWKjoYeC+BGa5564GUB4DGKKuqeiNJY
	 PtdwzpXs51QOzwhgy0VMWznbAqRk+0914BtcrdACmRiZoFJgMjDIjdhrzUfqCtw0HDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=lgO3v5RlQEcLHRiGwhOuiU/y4Jm5+gR6j8rgw8/evKY=;
	b=QGlPRvz27zKULk1XJTE+ltiGJAnKcdyYJMy01an32wv2V9E3HCPzsaTLvztvPLG971rW
	 YOP0/KIcwlov2H0T3TB5i68KwTV/GqJLe/8uPWs7B7KuDxHLBW9I5Oti9xqQG2IwLng9O
	 j/RLIiRIkHE/XPhoDv9erpJCysPGBfbePZcEcqJNecIRPOaL6zmkNToMVge9tlctyy92f
	 9c3+LpTdQY110vtYmgb7ZVeo5nuOT3kDQF3wp/9YCx3CbjM9vQx2S7DrfcOMhLibmtqs4
	 Pq30Ulzq8rjnZ8jc/C5L6fERULYPaTFLWGhQSoqB+eu5DgU33DLzsyfild6ijC1Mk7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=vk6jIdHe;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4087B60A260B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:14:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4087B60A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=vk6jIdHe
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jNfbH6Sd1z1XM6JF;
	Mon,  9 Nov 2026 19:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1794251640; x=1796843641; bh=lgO3v
	5RlQEcLHRiGwhOuiU/y4Jm5+gR6j8rgw8/evKY=; b=vk6jIdHeOpdg6/XUv9meW
	e+asMhTQ4UA5L//SHKIuxiWs9rc1S+C17/dl/kDkRHTMDHJksIa0w6cHI3Ebebfs
	FaSLOjYfhIo6+15R4C1VrAt/hzlefcQXn/gODlhbfzq8RRipVNS6JNw3zkINfjBz
	dOTIH7GYZPN2qVJsV5USY+D9Nfq10kfmAjmmzIvwWI/ObOSEMwJdS4UL3lcUejIp
	ZKOPuU36ot9+YosKiwh83PZzeQinr6OmYfbx1YNVHmJ81YW4j4hbiG/K7iNFlaIO
	ghYN1P2/RS28p5cJJp/2Z+iBvlqjLDBJDN4qT1JBaqgyYPqASHP9QsrUmz4UvQIX
	A==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id fYaRKRKaMK0U; Mon,  9 Nov 2026 19:14:00 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jNfbC5cGGz1XM4Tn;
	Mon,  9 Nov 2026 19:13:59 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Bart Van Assche <bvanassche@acm.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2 06/14] locking/rwsem: Annotate rwsem internal functions with __must_hold()
Date: Mon,  9 Nov 2026 11:13:14 -0800
Message-ID: <b71d72daebe303f97ac7250f4c78e33020395451.1794250850.git.bvanassche@acm.org>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
In-Reply-To: <cover.1794250850.git.bvanassche@acm.org>
References: <cover.1794250850.git.bvanassche@acm.org>
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
