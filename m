Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583213DA5C7;
	Wed, 16 Sep 2026 12:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789561395; cv=none; b=AtMjrkLIuGaJUm97bpfvlnAsdwdBdpK243lEONqgmefkFBFTYjsG6IGGonSwdhTi/zmMOm25sV1ye+ir1CEI17uXK9xoEad8rCEzhFp6WIZrIbrOOCe3MvPbtehxy8cnzXK/NP1yYPFQ+Ov6AXHp9wFchGYMNcjjD7yt7UfnT3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789561395; c=relaxed/simple;
	bh=tQ7qakFhmDN+Te/s3eHm+6z3MwJIFjawd2iFkM2A+kg=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=BGhqbG5e2hVeTX85kj9P0AFKYKIPtIUGv91T9MLyy0XhNRcEB3wX9CdleJYhpFACPIbJeerv4XnhoUyutJZ5U9cTTt5duinufR0m5gDXJJcBBLeqmKHlNNLeXkWJBOG/19rydplyBwTLA8pyryCwsLOez07wt1nj5s8Yc62OEHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yxrAc9kd; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/2ONVFON; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yxrAc9kd";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/2ONVFON"
Date: Wed, 16 Sep 2026 12:23:09 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789561391;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gzx+IO2Tqw1NPu5gTKE2UsvPdEUFres1x8tk/CLdpjQ=;
	b=yxrAc9kdiCxAy+t090+0mLPpUH7KhJUg+3HgJa+1VCMRvm8TgV6zvn5iezp+PWMdnI2gRy
	PfeMirEug3CQ3hVs0uiWPjV53cylenwwo0auXKMps4dGUV3WF8j2wzuL91tyQ+6ZVOw2ln
	jjl7YuH3Ci7JdSBRomQMbPUcAwnmgJRqcZqJ+feDMhX+WouFubY3rvaN78WEguTRr2bHKi
	T9EQvYOAWtbKdp4HZdVUR6tttaHLdZdboX62jzF2olw9HDPoWBxN8yUyX26/2lTD734UhZ
	ekUJNCb4Afu62M+fcB8NFC1cfsbWfatt8B5B/w356vLZsAFLUqR4Y8J/V61P4w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789561391;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gzx+IO2Tqw1NPu5gTKE2UsvPdEUFres1x8tk/CLdpjQ=;
	b=/2ONVFONCQbLMYbNNnLYHJWKy9NJjrLeoBWk1PEolaLsliyEstI95Who3ebUBPX+6JGnPN
	CqRJBmKnQlixv/AQ==
From: "tip-bot2 for Peter Zijlstra" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: locking/urgent] futex: Also allocate private hash on vfork()
Cc: Jann Horn <jannh@google.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260911090447.GT788244@noisy.programming.kicks-ass.net>
References: <20260911090447.GT788244@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178956138932.1720534.15117386989280713537.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the locking/urgent branch of tip:

Commit-ID:     b61b6f95d6722ddbbbd09e689fa41b55fd36f9a5
Gitweb:        https://git.kernel.org/tip/b61b6f95d6722ddbbbd09e689fa41b55fd3=
6f9a5
Author:        Peter Zijlstra <peterz@infradead.org>
AuthorDate:    Fri, 11 Sep 2026 11:04:47 +02:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 16 Sep 2026 14:20:41 +02:00

futex: Also allocate private hash on vfork()

As Jann demonstrated, it is entirely feasible to access the mm through vfork(=
).
Therefore we need to allocate a private hash on vfork() as well as any other
CLONE_VM user.

Specifically, it must be avoided to have (private) futex waiters before
allocating the private hash.

Fixes: ee9dce44362b ("futex: Drop CLONE_THREAD requirement for private defaul=
t hash alloc")
Reported-by: Jann Horn <jannh@google.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260911090447.GT788244@noisy.programming.kick=
s-ass.net
---
 kernel/fork.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index a5934a3..5ef4133 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1996,9 +1996,9 @@ static bool need_futex_hash_allocate_default(u64 clone_=
flags)
 {
 	/*
 	 * Allocate a default futex hash for any sibling that will
-	 * share the parent's mm, except vfork.
+	 * share the parent's mm.
 	 */
-	return (clone_flags & (CLONE_VM | CLONE_VFORK)) =3D=3D CLONE_VM;
+	return clone_flags & CLONE_VM;
 }
=20
 /*
