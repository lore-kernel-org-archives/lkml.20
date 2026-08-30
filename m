Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A81A29D270;
	Sun, 30 Aug 2026 06:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788072279; cv=none; b=lEpLd3/t17jyWJ9RUzUMLm2ib209pAlSIFho0PkfiTP4+jtDRC7EpvqZyGr3Gxg91rqlhI0xklGKoi+ulkkx3UxRCr+LLHBrrpK6evfKAJnmuYCswrstNKcBEyAzlvFYDvXXmMBgGLQKnyKDSApt7azWdfSfZcRtwk6bkozVyn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788072279; c=relaxed/simple;
	bh=wCts4sdDJV4LcG/hVyHgS9SMWXlrQicF3dXwlBrqCLo=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=d7PKYKwEv/PCksMMvS2je+4GJ3KCM26E/W3LyMgY8F5JGCGtEUYUBh7wzb13/1IjSeujgKCqbcRLb76Tjxd3FJJs3lsbX7+nTVRv9CZrM43rJjliWviWUzdWT5a+89z6hIhDKuXaqrqVWBl90RSmBDR852OyuSd+NUUzyJ0y0ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aKw/cWQ6; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=x4UEoV87; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aKw/cWQ6";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="x4UEoV87"
Date: Sun, 30 Aug 2026 06:44:28 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788072270;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eKMZmThYI8he7sa33f2vOLbjVzJUZ008S518GjzNJUU=;
	b=aKw/cWQ6v7HUZWoO5buIp2UvlbFycyeBFmiNkGK8rRkt/tPFISAB6ZAAr4VNINMxd5nk1W
	/CaaBB9oHjM6jKS5v8alZXfUk5R9810Yo8xXOJCnr+OCY4vneDeKQuWe3XnBYqalTqTuo0
	sYxgsJ+ouJ2RwBP2jC3FeWW+I+kuNtY62NlxkP+J3RLXE/OSCJofdxoU82pU7S6vWcit5j
	ZOnNLoxCh9FbBdBI/G8CtwLTWtoydC7HJIdwCeojT24VZBwPTlaF0DXyT98Y6LkTicSv9a
	T+rJk3I12ntO6RbfUVZ7Atbi4X3CZBk9ajaoyLAtq39J3ZGTCC8YER9vyhPO8Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788072270;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eKMZmThYI8he7sa33f2vOLbjVzJUZ008S518GjzNJUU=;
	b=x4UEoV87kANsqzM/bcXEy4OSVMgvon3qFyUmNjBnBImMEKU0vz1QdS/jDNegul9kFdxy4F
	/lPJgTw/Iw6Y4lCQ==
From: "tip-bot2 for Boqun Feng" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: locking/urgent] preempt: Remove hardirq_disable_count()
Cc: Boqun Feng <boqun@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260827194835.38968-1-boqun@kernel.org>
References: <20260827194835.38968-1-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178807226837.3717435.13118505329115040369.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the locking/urgent branch of tip:

Commit-ID:     95a5037ec202adb579f532afb6b35680001b564e
Gitweb:        https://git.kernel.org/tip/95a5037ec202adb579f532afb6b35680001=
b564e
Author:        Boqun Feng <boqun@kernel.org>
AuthorDate:    Thu, 27 Aug 2026 12:48:35 -07:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Sun, 30 Aug 2026 08:39:04 +02:00

preempt: Remove hardirq_disable_count()

It turns out the previous usage of hardirq_disable_count() in
__irq_exit_rcu() would cause softirq pending issues. Without that usage,
hardirq_disable_count() doesn't need to exist, so remove it.

Signed-off-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20260827194835.38968-1-boqun@kernel.org
---
 include/linux/preempt.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/preempt.h b/include/linux/preempt.h
index 8299657..6d2fedb 100644
--- a/include/linux/preempt.h
+++ b/include/linux/preempt.h
@@ -168,7 +168,6 @@ static __always_inline unsigned char interrupt_context_le=
vel(void)
 #define in_softirq()		(softirq_count())
 #define in_interrupt()		(irq_count())
=20
-#define hardirq_disable_count()	((preempt_count() & HARDIRQ_DISABLE_MASK) >>=
 HARDIRQ_DISABLE_SHIFT)
 #define hardirq_disable_enter()	__preempt_count_add_return(HARDIRQ_DISABLE_O=
FFSET)
 #define hardirq_disable_exit()	__preempt_count_sub_return(HARDIRQ_DISABLE_OF=
FSET)
=20
