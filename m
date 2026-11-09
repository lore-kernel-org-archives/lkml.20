Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251649;
	b=1KWPtGw4eIr5AjmUupQ7+BG7A6E5d6qn1+BeWbkle2ETdIy5piFFPdld8OOFili2fwyG
	 WHIkOYUAncY2TEJc2FYYa1P6vh/4KSnS3GcbvWZqd+GENs1YD3h+4BdpLCepaGu6TJHLH
	 j+4bCcBcM1ODH+aEryJoTS9SQaDs79zCaI3COPv/zJeMnNflBl3TzWic6EzgH0oLg5yWm
	 wDsBdzVocdXyLGHNnWH2sazmyAhSpq66yzwEWsPllkAfRuQ6hMubT/pFkO8jHu15mk3ml
	 e8bbE1sljChQGUTHGfqjWmby8R+rDBoB5DHSXJpAjOW/bEJbNElZh0T2vvQXS4PynXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=0I8W1d2G6/KzYcV4ulxynyiemt5/Op8/vS8B26QwxKw=;
	b=CYRWW3sGmjQ144Kg/1NqJFiKGuNlXisvx5xO6QASiA8cxg275sTEQCJLbaI7ECvm+WI7
	 Ex5GGa0U7+amfm32n+a6yczpmTFhfJTQaSPic77Ucon93NdZmCroRu8G5s/uWctfklnTo
	 CwvvlzdjkjkM5C0mj1xNK7RyeeVQ1OxqA7Zl2/HlBpttr8WSzE8zdGIgIi6/5Wjy8IYCA
	 4ps8dqyO6zOXhK5gls9ac9IqEJW41GCA7RRvQ3QxtR5+zp4Df9j3wFHg3qv5uozG6eroq
	 7tTKT0IeT/9ql6oZAgiRDJmv/tBndXMNWgXOAegIyWeRzeesqj6TwnoQV8De9E7mEUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=1sFT7eHf;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A5B606A338
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61A5B606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=1sFT7eHf
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jNfbN6snkz1XLwXN;
	Mon,  9 Nov 2026 19:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1794251646; x=1796843647; bh=0I8W1
	d2G6/KzYcV4ulxynyiemt5/Op8/vS8B26QwxKw=; b=1sFT7eHfUj/P7Upelg1a4
	jI0y65NWKydI33okuqbROOjdHj/5wevrbxJAF6EPfszyN1lttAWUTWfuxyQwxVIy
	rqWgNfIrXMVO8d4RCzq94Kexsw18MlaZnA8Gpp+C+fFfNKewKeH/OConMcovbQYn
	PTs9BDNhsSgzWHEAanH5L0z46f4Z8PNMwHidy6O2rJEcRFtWX9e4Gv5oWkQLKkDd
	fCf/5vBoR/SqOtOgpUvIrPgBikoPdwdUL+Uzq/Q7+d2lVRdzGv03BskP34hoQClj
	VjR2p9X2em3qQiDa2akUYT92kVDE4OUShNyVWaZSdn5iQ4xREHf5oG4nk3Mhz5l+
	Q==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id VzAg19NLyI08; Mon,  9 Nov 2026 19:14:06 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jNfbK2ssXz1XM5kD;
	Mon,  9 Nov 2026 19:14:05 +0000 (UTC)
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
Subject: [PATCH v2 11/14] futex: Verify exit_mutex ownership in futex_exit_recursive()
Date: Mon,  9 Nov 2026 11:13:19 -0800
Message-ID: <21b696a77eb6a926b0b7e3dc0519b927f4177a6b.1794250850.git.bvanassche@acm.org>
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

futex_exit_recursive() unlocks tsk->futex.exit_mutex if the futex state
is FUTEX_STATE_EXITING. It uses __assume_ctx_lock() to inform Clang's
context analysis that this mutex is held. However, __assume_ctx_lock()
does not verify that assumption. Convert the __assume_ctx_lock() call
into a lockdep_assume_ctx_held() call such that the lock ownership
assumption is also verified at runtime by lockdep.

Cc: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 kernel/futex/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index a240638f69e5..4e5aa0160dd2 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -1503,7 +1503,7 @@ void futex_exit_recursive(struct task_struct *tsk)
 {
 	/* If the state is FUTEX_STATE_EXITING then futex_exit_mutex is held */
 	if (tsk->futex.state =3D=3D FUTEX_STATE_EXITING) {
-		__assume_ctx_lock(&tsk->futex.exit_mutex);
+		lockdep_assume_ctx_held(&tsk->futex.exit_mutex);
 		mutex_unlock(&tsk->futex.exit_mutex);
 	}
 	tsk->futex.state =3D FUTEX_STATE_DEAD;
