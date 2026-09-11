Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C34470E89
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117781; cv=none; b=Cu0ZaJUsEynv1Glue9bCj0e/mH2hbUOTPXFLC8xHvPxYFzV2eECRNNT1yir83XDoSGzQvbkRQsXLXdQ9bDnvFghbdyDZn+ogGNX4+KNxlbdvh5baKZ5zJrrJ7/5n5ewSqsv6ZpJUGN30xbbd7kC2nBwkgIl4YDF7H7h1JbZuJp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117781; c=relaxed/simple;
	bh=5MrLB0uAfP+d6jR2t6NW+aCJnrOlVn60Y7Q7dohJAMc=;
	h=Date:Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=q3NzksuzhwQBYmhabMbaCgHekTrZH1MHr7lAYGx6PcvSM/Kt/+aIVEzerelcpqBHhUUoEYk6J/DXfEAmnnKUA3vCV9hwHnsDexDemR0uXOn/JaMz/ZjOGkGbpLfIGGrEs2XBtqgU5NO7TE/57xsNTXXH1/TUFavNP4Ize9Na6uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LJH2seDf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LJH2seDf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB83E1F000FF;
	Fri, 11 Sep 2026 09:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789117778;
	bh=c6xHCf36WHvvV+TWe2mOYGMYiRzbov/w+alKhm5ehp0=;
	h=Date:From:To:Cc:Subject:References;
	b=LJH2seDfgy6z5+cEK9Wgab2y019dHmi1dYf/ZTTWhcjiyXnraOz1owLjA/k9hPE/z
	 njPs1N0vaj3qqUjb/LQ2As5nRO1qElKOfXz4KT2BbEmcaWdibCIRGOQG4G9mD6T9so
	 3lvDNO/5k2h61LM8CJlCTWYcWbwe281j0+N5Wi8toF9Oj+HjbfpjjadGDwWSdbHjUZ
	 uLXEfUXEPTl6Qm3xzWb73E5dZ2jEEds30PmZoPgEpteYU2E7cDwdZNtoodD4QPCktD
	 Vf2A5cFMJGBNUUIALw1btb69yjiGeyY+RRd1z8UUKhptHzUALbxirQTisj5jrkvS9h
	 TwDjZ7yLpfOkA==
Date: Fri, 11 Sep 2026 11:09:35 +0200
Message-ID: <20260911090541.837831386@kernel.org>
User-Agent: quilt/0.69
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Hyunwoo Kim <imv4bel@gmail.com>,
 Oleg Nesterov <oleg@redhat.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Christian Brauner <brauner@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 John Stultz <jstultz@google.com>,
 Ingo Molnar <mingo@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Alan Stern <stern@rowland.harvard.edu>
Subject: [patch V3 6/8] posix-cpu-timers: Use PF_EXITING to indicate exit
References: <20260911090341.949101445@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Thomas Gleixner <tglx@kernel.org>

Right now POSIX CPU timers use task::exit_state to check whether a task is
exiting. That works correctly, but exit_state is set later in do_exit() and
too late for allowing to cleanup POSIX timers earlier.

It does not matter in case of exit whether the cutoff is a bit earlier.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>

---
 kernel/time/posix-cpu-timers.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
--- a/kernel/time/posix-cpu-timers.c
+++ b/kernel/time/posix-cpu-timers.c
@@ -1505,7 +1505,7 @@ void run_posix_cpu_timers(void)
 	 * posix_cpu_timer_del() may fail to lock_task_sighand(tsk) and
 	 * miss timer->it.cpu.firing != 0.
 	 */
-	if (tsk->exit_state)
+	if (tsk->flags & PF_EXITING)
 		return;
 
 	/*



