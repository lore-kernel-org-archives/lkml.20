Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251652;
	b=uG645opIzZiHuEisYf675kMfk8+ZGUOXPJdQKcipnVOsEq39XDBcqQSHu6+7VVJTLNRM
	 Bu8PL7J9lDoMN8R2no/1bsfHGh0uAWy2SAoqDOL2RevX4GnAMwCJxNUlK+rFkNx93SlMN
	 cstg7TZFD10Q3ltPAV0qr+zWf2LGcnYmldniijtRpf1+CmDWVu/S6LU4UA6ogFYF3xu19
	 W7dLQOuD/QCMrEicyaftX5pPRgDTampBhUeZkjUevroGoMDfo5GeJIvPwLZKdDIxyCGin
	 tC7o7gJwoIobn6A25rlDUtmV/hfhUBleYoWoLW2og9khaYf5jzgalvllYGd2jlrRnHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=ErFlyO7d0sqqGQYgJkoaNcCcqJHnWtQITfljb/DxVdE=;
	b=yD4fwk+ojYyaX7dIbl8sLjhKri2u7O6w8XuMMDn18SwUhVaRK4ZHgtk/ev3MVfkUzzeK
	 L8btqOuLxos+CkJkuFVqnW/A6HwM4dHk6wew8IOoT5RlD0jTiGZdX9lt3Hu9t6RGdDte/
	 Ihcn2Y6wGXvq/Kb14svQZFlFRVoFw+48Z9CKCaxMBaE2V2NcayWnKM676FOjQqWM/lZeB
	 597QYrSSSAHvmwJLLt8XEjQXIuQg9RjJTyjFEFb1hbZO3mEr7dxfHzjPjo0jgz9/xOm+H
	 Gv7KBhsqdvNYzYXPA9EX3X1vyXedALy2g4f1Q5CYhQAB/aFuQuShJ7KTx16epqzkiXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=ZkGxsUKx;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD281606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:14:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD281606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=ZkGxsUKx
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jNfbR3qN5z1XM5kD;
	Mon,  9 Nov 2026 19:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1794251648; x=1796843649; bh=ErFly
	O7d0sqqGQYgJkoaNcCcqJHnWtQITfljb/DxVdE=; b=ZkGxsUKxYELGq1Bb0cyC3
	4Ta+5Dcth9XPjC9JLECcHcRg2FsgPY6YLoI62rzEErpPA0Yqpy9DgyCT+D/w9Lzw
	JCbhlJ6PbnB7NRBwiDfGXvmhR74DHIRxJz+zt80Q5Aq6LkkoKX6csWXSPnMSbiSS
	WUdmYwnJCeki85YypzM3ad6B0n4ZgtAXTfCqI6I8sMGI7Sk6DaTqlQJqQLAANrVm
	YX0xK0VKHHsaXHat3Ln6lSAz2QWiRAPHO8Ho00DndYbwuxIQbi56z3Gw7c74z099
	6a7g8+GRN3YlnP3KTy2YUAbqToYQjDJAFEx4W1UZVYSgxSn5iaOvCn4u7daBhjEr
	Q==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 3QHf3tpv2L64; Mon,  9 Nov 2026 19:14:08 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jNfbM48fRz1XM0nl;
	Mon,  9 Nov 2026 19:14:07 +0000 (UTC)
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
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 13/14] compiler-context-analysis: Split the RCU assertion tests
Date: Mon,  9 Nov 2026 11:13:21 -0800
Message-ID: <98ba4ccdb72685c19aa260728b28cd54b185f9c4.1794250850.git.bvanassche@acm.org>
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

Split test_rcu_assert_variants() in lib/test_context-analysis.c into
test_rcu_assert(), test_rcu_assert_bh() and test_rcu_assert_sched() such
that each RCU assertion variant is tested independently. Add
test_rcu_assert_reader() to test lockdep_assert_in_rcu_reader().

Cc: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 lib/test_context-analysis.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/lib/test_context-analysis.c b/lib/test_context-analysis.c
index 022891999c9c..048b839bae92 100644
--- a/lib/test_context-analysis.c
+++ b/lib/test_context-analysis.c
@@ -464,18 +464,30 @@ static void __used test_rcu_lock_reentrant(void)
 	rcu_read_unlock();
 }
=20
-static void __used test_rcu_assert_variants(void)
+static void __used test_rcu_assert(void)
 {
 	lockdep_assert_in_rcu_read_lock();
 	wants_rcu_held();
+}
=20
+static void __used test_rcu_assert_bh(void)
+{
 	lockdep_assert_in_rcu_read_lock_bh();
 	wants_rcu_held_bh();
+}
=20
+static void __used test_rcu_assert_sched(void)
+{
 	lockdep_assert_in_rcu_read_lock_sched();
 	wants_rcu_held_sched();
 }
=20
+static void __used test_rcu_assert_reader(void)
+{
+	lockdep_assert_in_rcu_reader();
+	wants_rcu_held();
+}
+
 struct test_srcu_data {
 	struct srcu_struct srcu;
 	long __rcu_guarded *data;
