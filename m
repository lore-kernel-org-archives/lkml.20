Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793655333;
	b=A7mNPoS7QQkoLiP9yU8DzLoNHhUUqjKct1jRqB0b9hrV1ZT4Txn9dmPIVyLiWOHdYwXr
	 //LJBhL9g2t7JmQeaKriTLSZmCOWV9xc/rKvBw9u2QSXfYOlwKjS03nh4PaIJkzROm7+X
	 f/PssnWKyDxpKVySKNP0H37zLUHS+DCCsoQ6nCyYtGgUxQMBf5zRzrT7Tn13zmkyp6AHs
	 AIk09CJ074uBtf2NUiUvg8+6DNUHD+GgCFfKBavz5G2MvjCgAr+Tll+wDSmu1Vqg4l6kb
	 VkgNNPvZrzOXJ6PSojH+IL++m2ppFh8iloYp1JXhL2nOHHmCpbjK5M3bag1Uc/besWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793655333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=ErFlyO7d0sqqGQYgJkoaNcCcqJHnWtQITfljb/DxVdE=;
	b=j2+WVOkxhpFocwLxRTqvbeqRXkTdumiga/sk2iqSoJC+yyUaWXYMl9DL92Du65TyfVja
	 oYBmuUsPxxnjsTzV6AlHaOVa2Eh26pmbAJu4Ua0CTS7kxd5IV1KXsIaOVgR+c+oSpYR7l
	 sZAyT5j85o30vPoYJqldoO7bkqRxOlKJiZ4jAEECSA1k0tg/0zrNBXFjxdV+sni048vpN
	 pOF6xzCIv9QEwREhJGrd9M9FjFHo2xusbKXuo6hTN4yo517aipH+RSPVmmeiJ69gwznnF
	 HTPEinvvPohbO0E2cg/7laEbNnOPoZlU3MUpCwOx68r3jszdeDNqMRv5ZYLZZXL227w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=aIjRWWnT;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47496082BEE
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A47496082BEE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=aIjRWWnT
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jJQ3m1sZmz1XLksZ;
	Mon,  2 Nov 2026 21:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1793655329; x=1796247330; bh=ErFly
	O7d0sqqGQYgJkoaNcCcqJHnWtQITfljb/DxVdE=; b=aIjRWWnTVRN2cYpZVaV0X
	eH4xAsH/D3e0Cga++VB6LhT8sK2IL53HSKHT8Ts2N6YPlwJv+TkEiUTNmS9fkoDQ
	7VFJEPDrAPBd3D5MPrD8q4/qh/hal0R+A6mjmQr377zqT9PUTPBS5YevbxsGPsBt
	izklwjZOW7zWHgmCfOJyPgbbsEsaY6G/92C/mWwf1GuGjVPkHO1OAjq6q+iDHM5W
	GdD4r3Wjch7K8cMe1vJglw/WXMNLG/AndUeH/Y/gaNduy8o7z1TTfHofW2/xnAqZ
	OJ+40+NLPSZ02qCunyVxWcGroRsB9SXXN0VT1YH87N+icMGK6uUfkAWN5bPqzh0n
	w==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id QeZBUWot7vPR; Mon,  2 Nov 2026 21:35:29 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jJQ3j153xz1XLkrq;
	Mon,  2 Nov 2026 21:35:29 +0000 (UTC)
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
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 13/14] compiler-context-analysis: Split the RCU assertion tests
Date: Mon,  2 Nov 2026 13:34:43 -0800
Message-ID: <b9b665851b8ea1573fdda22d4b31dcb8b623cf89.1793654853.git.bvanassche@acm.org>
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
