Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CD846D579
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520968; cv=none; b=jvzDbfisG6i/bJDwI7uoERWURd66c1h3P1ewND5flIMgvxdLceYoLyD+maLUKTlZp0we7Xi09fvlFgIn3Rn1fsZuUoJGrRodjQShGR04hTxC9etzGluoo++cnfp+oye+bHyATaD8N/Rm+D3w7Qo/U4hTAyZebxT5k9euSChBtPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520968; c=relaxed/simple;
	bh=uBWdguZhKLwWAGj+MT+ns1Y+NwJ1sgUA3lnnzSWT8ik=;
	h=Date:Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=bkCaNqxTi/Ih6vfkt6h1c0xx71b6aDo/WUddmLOqP+0EN7Xm8UNLjIiEgX4viQHIiXHf8Sz3G/4pJ6CCAuQT0CPvunRuJUJ9yeRT3oDyOHNDPjDDV2uUQ1MPa+VqTmS2kCDQ/clEgHkZOAR3hNVGp0oIHyYwerDganNFucLTKTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FmLykmem; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FmLykmem"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD6A21F00A3D;
	Fri,  4 Sep 2026 11:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788520967;
	bh=XCJDub5utZU3Jv9WsWOzQRSnYRJS9t/LC5211PDv630=;
	h=Date:From:To:Cc:Subject:References;
	b=FmLykmembCGqCpQwM/uWGAOpk1Foj8dojuRirZbQ9CfDRqgO0d01RVQFwTuEwImSW
	 jNoctT0bbMDHAkoMTShufhXoLTcaSpxeD/LoDeUhvnklz8Wj13hd2vRA9SGBVwf6zx
	 /h5YZh4V/HxI2h8vEzroo7T+6Siv0y4xG5NSTDv+lAD9n5txRjlgbmP8lKy12lQ9Wy
	 873utP5okMPbR4xyaP2FawiozhseEp3GMPHPkilkhu9KLt9BXSCaCOCgwfGxldNifQ
	 MGfju06M6izjzzVyaFEFMdAnwGbCi2RC5z0mamS+XN6zsKHjqaiTKAcWRvbggLjV6D
	 2csJLRTwVwZeg==
Date: Fri, 04 Sep 2026 13:22:44 +0200
Message-ID: <20260904112202.348410055@kernel.org>
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
 "Eric W. Biederman" <ebiederm@xmission.com>
Subject: [patch 6/8] posix-cpu-timers: Use PF_EXITING to indicate exit
References: <20260904112100.683893401@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

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

