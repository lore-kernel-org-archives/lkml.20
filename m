Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793655325;
	b=1mVM5vigdtFVmPImOOj2M11q1znPUNFUDWcW2N3VROVg/vet5g4AaPGniYfmL2fQIgxu
	 /cjJ0qV0BBjajD6XlzXHSPrW9CDXCxF6WeIgvFQoj4x7URTy3W7g531li75o71D7/+9bh
	 NuQu6QC+OtRR/KnPNRK6P1JD212eH+M3EOU5ofV6nQGhCjLfeTkrvTK+K4No7m5zk/ARw
	 q8zIcwnrwOq1F3DaKPI1pE8vDWqrwgRZ83VgPFIRZC3VHTpqmhoIS+1bJZ9R0yxl7xv9Y
	 nsrFta/eZ1XmZXgVuIwYgMAIQrppe68PAJGYLRmTdmNPvutbViGTaIUNgtN6QjGxPgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793655325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=p7L8EeHoJJ6a6twYhlPG73o0InImnBwcD/4WxplVNu4=;
	b=hpnHzwy5zqvLZqFN7srQ0FEB60GeV0bcN8BM7wgCBXxpHyoOA4ELSDwErvo+9MfxvnMR
	 hvPArRGSuXgBCaTyqF4GVGS4FqyOyKjcdTxxTcMBK4i7ZilXv0FuDrkZDDhH4hKpeu+nC
	 1p9ANVIpLKd3Q8f4kOt3zRVshrnGibQvjVahPBSZTuX7dUaodEJJd2CxBNOOM3nprihD+
	 FYiEUakXwzUP+CbGYVgctG1IRYnHvOvRFHJy3UgzXLwyZU/RVyjXdPBgxLhK1dcrsjZko
	 M2OVGk00Kc6mWlQuAn3DXWP/XqailqT019b4qwtiUg+CcHy7ZsCLVkzG1NOxCPyOWxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=oXNzFG31;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D89606D836
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84D89606D836
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=oXNzFG31
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jJQ3d1sfMz1XLkpH;
	Mon,  2 Nov 2026 21:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1793655321; x=1796247322; bh=p7L8E
	eHoJJ6a6twYhlPG73o0InImnBwcD/4WxplVNu4=; b=oXNzFG31mvf1TNa25kcdv
	SScvs41YbdWnQBSNg25zwHjeivpCsiQPL5WI7sNwg7fi2uQmXn6gumg21CODlW7g
	l3IZy9Ul97XvFBJ1LT5fgn3D2SFA95ECOJyzxqTNydL3u1rVLV0WidImBLg1x8jO
	WC9+72ycpyQTCjbtbmXISNOogVWsGGVZSx++6KxCXVjCH33Lg7tekF3lCnl+HJyc
	ZpSs/LADll53ULl/9SEoYOWk7QYXzoiXdf52wRfBPoFeUTZ3Q3ca5gIejvv1oHr2
	zb/MkSEbK9R/mZFAgg7z4kny/Wp+1FFLPQEhCjH8KKupdkVD/5Wwg+A5XzScTk6x
	A==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id Q5lQShYvacNW; Mon,  2 Nov 2026 21:35:21 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jJQ3X6rNCz1XLksM;
	Mon,  2 Nov 2026 21:35:20 +0000 (UTC)
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
	Thomas Gleixner <tglx@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 05/14] futex: Annotate __attach_to_pi_owner() and fixup_pi_*owner()
Date: Mon,  2 Nov 2026 13:34:35 -0800
Message-ID: <589a735a8b917f1e55226dad5ab57a6fb7c2ee37.1793654853.git.bvanassche@acm.org>
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
