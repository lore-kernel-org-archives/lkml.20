Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793655330;
	b=REnCmnnSOq4GCjadf/Etf2nykDy+qEovGIdwhfqjRiS0R7tKvERTkmdkPdLiU2c/A0Pn
	 Vs6jgLHTvcGnrrrkVn6xPURJQa66lMmoogy9V0FWuYvvnWBkFtn2IjQvGKXE2RvG+IvkT
	 sPn7PDx9FLJ1fOZc6XfMYXrHcjnXIAJOPL7y0YdxZTpc3PywTcTnXUZaymZ3yw5bBgr6x
	 EOg7GR7F/CJDholB9pAW5vZZ5/Rp00Xqwj5MhX/1sGI4N+8bP8J/fZUYCDPE6MJ5ocPcu
	 Ua0ccQTX1zc0589cHHUVOfJcBzr8bNRisRCZIslvG3amzHIITjJLS2ieSkVXIsJ5VUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793655330;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=0I8W1d2G6/KzYcV4ulxynyiemt5/Op8/vS8B26QwxKw=;
	b=ftomoRqsLS7zkH7I3RzR67XShR9EIypa4urTfUoODhcOskeljrkiEC4TYPzWFQjHd/CN
	 GvToNnvIUntdpt3YO33D1M4jFay4cK/Egc09L00pZ1GnhEcvytv4MqmT24g6pql2IPBkX
	 uX10V6QeZtoea6DkAInbsc8kuonOA/XwD+7fEuUue4+lS+NsFRi/bDEDZ6tQ96paMlQOn
	 knYyIP67WktXud/X8EYUj67LP6F1v8V/+chc2oML+Wh83NKtu9THRLWbAcqmEBUBrGazJ
	 DJc3EdTgdR6qaj7WCh1LTYEo0/OTj0e65o/PPOI5zvq3027NXTxE3oDbQfWx4cgwpqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=LcUKpiLr;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774BF606EEB4
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:35:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 774BF606EEB4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=LcUKpiLr
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jJQ3k1jVlz1XLkq5;
	Mon,  2 Nov 2026 21:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1793655327; x=1796247328; bh=0I8W1
	d2G6/KzYcV4ulxynyiemt5/Op8/vS8B26QwxKw=; b=LcUKpiLrVvBtI0Uwr9hDZ
	fcMNqUv6GCCxBDU64JUutebymR1tZSOZRaKvCRGW1txoafY3O5SVBZNTQzuWgpLx
	es6BPmq4E5lcP52FFRYD+AXA2IqGRCptJdPmrpNyNGf+7+tAW6m+cxCajYhQleHc
	vM6xdiJgv2D5LlBVRo4U99b8SjYV8TbMf3+eW4jT0aOSDxPVP8GTieFS9aN1HMRk
	uH/QOzoRRhoACMJtR7OKW3dwOrt5MnVOjVnBkMoY6YX/ynM7xXLrVPOzaIaFnv9Z
	ooAEQyByPqPzfOPQxe7OtupcwcEqLzO/7XaRMbAOFFz01yfrhHPJw8EI0/LqBf2G
	w==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id bjyCdIPK7PUf; Mon,  2 Nov 2026 21:35:27 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jJQ3g0rw2z1XLksM;
	Mon,  2 Nov 2026 21:35:27 +0000 (UTC)
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
Subject: [PATCH 11/14] futex: Verify exit_mutex ownership in futex_exit_recursive()
Date: Mon,  2 Nov 2026 13:34:41 -0800
Message-ID: <41ecca27e4ebb241ea200347a0e19dc0f5d03ee8.1793654853.git.bvanassche@acm.org>
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
