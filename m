Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC3C4BA9F6
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 18:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788634768; cv=none; b=E11K+uNVDjytE/o1kjoWj4weh6BMT+i10xToOapbdTLJJvS5edEbUvDYoDVGSi4tdd5WZub6grtfnzVAmU+aQwzjvhzc01olhL2NDWRhMoFY2HppS47SusuSFcUgO3tUM72sNRk0mqzsSGm2gV8OPoenh6zZ6V9OBtNUaG34pzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788634768; c=relaxed/simple;
	bh=uBWdguZhKLwWAGj+MT+ns1Y+NwJ1sgUA3lnnzSWT8ik=;
	h=Date:Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=swqHfyqk+alF/mBSLCxFSLi9A0iJTuEDdu22YZGcQHJcFu5yAnpJOiZjw2lcYK1F4lS5DK+vUkWFruvlpH49RDzWAaE5CrNzEVFauwSLr12kMBqQMWHH6gDUCzfHGUznRdRLkR5d1qa0knuB9eCn0Dv6C7jlnANkvu5yIyQaAdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eoQJbQ4Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eoQJbQ4Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E3901F00A3A;
	Sat,  5 Sep 2026 18:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788634767;
	bh=XCJDub5utZU3Jv9WsWOzQRSnYRJS9t/LC5211PDv630=;
	h=Date:From:To:Cc:Subject:References;
	b=eoQJbQ4QpFUEFcQQRExjq58czlcrS1Uk1n1i0CD0PgH9DkJ+0rJjN87Wa6piIOKZI
	 /KOY6dQa35bUw8YbESxYmeZzwXwHZP8V3WRq7PcavpWADe3UCCrW6d++cPf/4wQTqd
	 09lCg4vFkoXWBU1YBzOzHnRO2cUNPf3sTSdavtZ6wrdnQGgdWAGUcVajgL13XdG5cq
	 dzGpVH3YN955EUUwpZxGwPecReP0186QNc3TUQjhoOs60VeBua4dbmM1jonO9vyTkQ
	 GGXUyP3ZyGxkvSD1tLbIfE1FnNPSzwCZqGwlGNQhOeNTiyL+gUQH4Zo6182EbN+pa0
	 cNIhRKJIfI9aw==
Date: Sat, 05 Sep 2026 20:59:24 +0200
Message-ID: <20260905185839.920634857@kernel.org>
User-Agent: quilt/0.69
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: "Cc: Hyunwoo Kim" <imv4bel@gmail.com>,
 Oleg Nesterov <oleg@redhat.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Christian Brauner <brauner@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 John Stultz <jstultz@google.com>,
 Ingo Molnar <mingo@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 "Eric W. Biederman" <ebiederm@xmission.com>
Subject: [patch V2 6/8] posix-cpu-timers: Use PF_EXITING to indicate exit
References: <20260905181551.738186850@kernel.org>
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

