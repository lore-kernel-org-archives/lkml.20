Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251644;
	b=PfO8wXqd5ofmMvMy9ePz8hAthL8IzRTletZxawBVYwrU3Ei4Jy5u7mMNn2jCA1eJmsLa
	 uWb3DeLi2hzeAi8msOzDLgNMvNxTfP6E27WFvbJhy92GpIg2m2dxild1wZvw4a4lB0jeA
	 zRd2o1MxzhUQeqEqux0HuTDWGTDfvCxKIN/9x5T1Nq66Op7ZnOfMVpRNo7p8oyPCuZpC2
	 LCZYjDZKDSR+UI/KpjT3xuPywZeSAnEqUPUHGSlLzkHNJR5mDFLJzA0BMSAgPpL7wcKyM
	 Myk4zqHvJSKAuOeFt4QFxK1HdSShCwe4AaXUsEJtr4VudvjjYfO0pwswz5x6FoflyXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=p7L8EeHoJJ6a6twYhlPG73o0InImnBwcD/4WxplVNu4=;
	b=qNfKN4QFJx0bFjJYeUJgAmmAEoR3mOeR+4Ux4bnqkiGSa9nDSoj6wdOSEIpZy2iHRUCm
	 qlYUKH1nlRd5LYMK1xNm7LeaJOBLw+aj5MLKuZxfUhvV5CjYMJCyD4cTQ16QjkHLKbJkU
	 zXOqfr5xvl6Y9FRg9nCWCdigAt+g+9tO5TL2lqcndOVgjVTJMscp9507D1WJ7HBMXEIFv
	 EqVQEcXhYNwrgvy0KCtkTeGzFI0DQCJBV+WXPb2zaZcBq5wjTtfD9t2534KkspK31wIHn
	 AcKE6X8nnTb+wy85WraL4OC3hUG9tovFjrYn+uqKuFbYXe3CIFJkUOHdZgv7A88fglw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=krXrxQTE;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24006606A339
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24006606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=krXrxQTE
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jNfbH5FKsz1XLyhl;
	Mon,  9 Nov 2026 19:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1794251639; x=1796843640; bh=p7L8E
	eHoJJ6a6twYhlPG73o0InImnBwcD/4WxplVNu4=; b=krXrxQTEI94Vlm8J/lId8
	9Ajdy9whFO1/SIJYKa3xO+BVeC9lfyb49W9TpKk2Cm/jWUTSSL0re+w6JiYY7C2C
	INsEBPtzhPkiBskyRfHWiNfOfXQnKUXMi7k0ldk+8hRWXEJOi/3qmNlfiOG43Um5
	2MIgN1YezGBvr4Iv3arNgWPYFnZrHd0bpy0RDXKLTe19QGXLKX6UWz89hwMo0dqG
	ZqUool0YMcfL5hKQ5wDGQHl3vwH+bPk476IccOLAEyfs3ACbuOmNyyM4SQulFXCM
	/eMnrCH6dNyBL8EJvZrW9YqqGrQ8w2/f2y9zpQMGDsSiMCaqQEXp6P2LVIOeiJGu
	A==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id MCvI2-2TrOcR; Mon,  9 Nov 2026 19:13:59 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jNfbB5gcSz1XM6JF;
	Mon,  9 Nov 2026 19:13:58 +0000 (UTC)
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
	Thomas Gleixner <tglx@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2 05/14] futex: Annotate __attach_to_pi_owner() and fixup_pi_*owner()
Date: Mon,  9 Nov 2026 11:13:13 -0800
Message-ID: <d91f131d57afdcd20a58034d39362e04a4387f05.1794250850.git.bvanassche@acm.org>
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

Annotate __attach_to_pi_owner() with __must_hold(&p->pi_lock) and
annotate fixup_pi_state_owner() and fixup_pi_owner() with
__must_hold(q->lock_ptr).

__attach_to_pi_owner() modifies p->futex.pi_state_list and attaches a
new pi_state to owner task p, which requires holding p->pi_lock.
Enforce this requirement at compile time with __must_hold(&p->pi_lock).

__fixup_pi_state_owner() requires holding q->lock_ptr. Its caller
fixup_pi_state_owner() and outer caller fixup_pi_owner() must both be
called with the hash bucket lock held. Currently,
lockdep_assert_held(q->lock_ptr) in fixup_pi_state_owner() implicitly
assumes lock ownership for Clang context analysis. Prepare for removing
the context assumption from lockdep_assert_held() by annotating both
fixup_pi_state_owner() and fixup_pi_owner() with
__must_hold(q->lock_ptr).

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 kernel/futex/futex.h | 3 ++-
 kernel/futex/pi.c    | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/kernel/futex/futex.h b/kernel/futex/futex.h
index f00f0863ed44..3e162837e9d2 100644
--- a/kernel/futex/futex.h
+++ b/kernel/futex/futex.h
@@ -394,7 +394,8 @@ extern int futex_lock_pi_atomic(u32 __user *uaddr, st=
ruct futex_hash_bucket *hb,
 extern int refill_pi_state_cache(void);
 extern void get_pi_state(struct futex_pi_state *pi_state);
 extern void put_pi_state(struct futex_pi_state *pi_state);
-extern int fixup_pi_owner(u32 __user *uaddr, struct futex_q *q, int lock=
ed);
+extern int fixup_pi_owner(u32 __user *uaddr, struct futex_q *q, int lock=
ed)
+	__must_hold(q->lock_ptr);
=20
 /*
  * Express the locking dependencies for lockdep:
diff --git a/kernel/futex/pi.c b/kernel/futex/pi.c
index 98f1b962e59a..e0310776b484 100644
--- a/kernel/futex/pi.c
+++ b/kernel/futex/pi.c
@@ -420,6 +420,7 @@ static int handle_exit_race(u32 __user *uaddr, u32 uv=
al)
=20
 static void __attach_to_pi_owner(struct task_struct *p, union futex_key =
*key,
 				 struct futex_pi_state **ps)
+	__must_hold(&p->pi_lock)
 {
 	/*
 	 * No existing pi state. First waiter. [2]
@@ -912,6 +913,7 @@ static int __fixup_pi_state_owner(u32 __user *uaddr, =
struct futex_q *q,
=20
 static int fixup_pi_state_owner(u32 __user *uaddr, struct futex_q *q,
 				struct task_struct *argowner)
+	__must_hold(q->lock_ptr)
 {
 	struct futex_pi_state *pi_state =3D q->pi_state;
 	int ret;
@@ -940,6 +942,7 @@ static int fixup_pi_state_owner(u32 __user *uaddr, st=
ruct futex_q *q,
  *  - <0 - on error (-EFAULT)
  */
 int fixup_pi_owner(u32 __user *uaddr, struct futex_q *q, int locked)
+	__must_hold(q->lock_ptr)
 {
 	if (locked) {
 		/*
