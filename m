Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0955B4C33E9;
	Wed, 16 Sep 2026 16:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577301; cv=none; b=G+/77Z8z2RvZy4iYvP+8TQ64GFV692p0oNOLD82q6zjsBejQlAf1D6mQ55/Ymf/IETXgqAFtNTcalnsm6PJFPbI1y4ejJDSbXJjRPF/csWJMcn/y6HG10I9AOpB/PY0yYKlqY225PCO4jUaCpYT8/7WbcOqa0ArWOmjyGZQ+0rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577301; c=relaxed/simple;
	bh=qEQ/00s9jMzJJqCbREZ0XlozivMvF6p2avZrdXa704c=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=bGn4EgI7VZx2h+eDS1JScXT8jOW0Zo71xqjXit8iWu3e5tIF5mg0Jh1B2y6mtMXH62RybCPa+eKwgzE1aG3mSSwXGlTRJ20PA3ZRgdpHQJZ4M9x4fRy9Pa2lPmvudj6OsUJ1eOUxZtpWRtwPYoswsbuOXIdc57TBww1ZorNFaWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lBFAyEHN; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=v23mjGaC; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lBFAyEHN";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="v23mjGaC"
Date: Wed, 16 Sep 2026 16:48:05 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789577287;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SohT5+6IXMb619D7S2frStmaxbiOjQpEFlF0hQtBogs=;
	b=lBFAyEHNjn5bwh6269YHZrFoKWLZ0918/jwfIqytC7CGJAcjy0oE8Sa04qIbPieZcHsXBT
	Ru7m/usLG6tcgz2CF5Ye5GlgnZDsYJAYWjmDtwDOD8LB2Bb924sfjFUKFKcuzqvf1uir4+
	pn0rje4WoZOalfdUDEgGMhCETIoeIEznDCxql/h7cz4P8+sjpAksb22AHHIe17z8MBhORY
	G37OLFM1ldh0tgC/ssP3vcJ8d0d5SB2XGGtA73VHHMU62mYoRcq6jd+A5NOE4JbXu+N8cI
	Dygi8plYcTk1IyK8sIioQIgFmZ0vJHnp1hPu4eW750xbWBKZfc5Px/WxKizv9w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789577287;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SohT5+6IXMb619D7S2frStmaxbiOjQpEFlF0hQtBogs=;
	b=v23mjGaCfn6BTo88VC0LhQCbrjeUon+8L8DxcsKIH5aqaJq4TWD5ujdpsfnJqrkfBPo4eV
	439KL1CaSLyUPpDQ==
From: "tip-bot2 for Thomas Gleixner" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/core] posix-cpu-timers: Use PF_EXITING to indicate exit
Cc: Thomas Gleixner <tglx@kernel.org>, Kijo Park <red993688@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260911090541.837831386@kernel.org>
References: <20260911090541.837831386@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178957728550.1720534.12834960102879985398.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     760ad335d600b1d45f05bc5fad59c05d909710be
Gitweb:        https://git.kernel.org/tip/760ad335d600b1d45f05bc5fad59c05d909=
710be
Author:        Thomas Gleixner <tglx@kernel.org>
AuthorDate:    Fri, 11 Sep 2026 11:09:35 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Wed, 16 Sep 2026 18:44:04 +02:00

posix-cpu-timers: Use PF_EXITING to indicate exit

Right now POSIX CPU timers use task::exit_state to check whether a task is
exiting. That works correctly, but exit_state is set later in do_exit() and
too late for allowing to cleanup POSIX timers earlier.

It does not matter in case of exit whether the cutoff is a bit earlier.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Tested-by: Kijo Park <red993688@gmail.com>
Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
Link: https://patch.msgid.link/20260911090541.837831386@kernel.org
---
 kernel/time/posix-cpu-timers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/time/posix-cpu-timers.c b/kernel/time/posix-cpu-timers.c
index e635834..cf4bd1f 100644
--- a/kernel/time/posix-cpu-timers.c
+++ b/kernel/time/posix-cpu-timers.c
@@ -1505,7 +1505,7 @@ void run_posix_cpu_timers(void)
 	 * posix_cpu_timer_del() may fail to lock_task_sighand(tsk) and
 	 * miss timer->it.cpu.firing !=3D 0.
 	 */
-	if (tsk->exit_state)
+	if (tsk->flags & PF_EXITING)
 		return;
=20
 	/*
