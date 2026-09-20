Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50B837A841
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789897492; cv=none; b=HCqYrKkKGtvqx0tG0hVjlqkGY6s9AVrrHVDv7l+mWf1/ecjg0R8bCHdnIs7svDtpX9MnKZQ047gua4CvFf/dCe7d/rW8+B8C8vFW5WaKmcE0ATH2SWp8416OnFLVlgL+JOkjTK4h7FLRXK0g0aYswxMHql7O0zlgBzBOJcj6hU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789897492; c=relaxed/simple;
	bh=T2KQqAnVSWz0MxV45Urzs7KbCahM/HobArXztqOi74c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UoEO26xf4jGFGG/Jr2kbdBvScHsbNxff3RQVC0jYPOPBVFwF2uDuM3IKsRcIsJmLbhrnd6obwXLHQ9VW2H0VKw3KzUd/7VzU1v+loi4qwFpJu2kDib3m6hZXwGv9nldjryo9HgrJPDcbGnfXySeMfcozb5Zu1ghFn7go15eYuh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UiBqh2sm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UiBqh2sm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 820131F000FF;
	Sun, 20 Sep 2026 09:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789897491;
	bh=HbmzutEmxKmVJ4ZnCX9hHRLnfThfAApAJ61JlYz8Mn0=;
	h=Date:From:To:Cc:Subject;
	b=UiBqh2smzq2kmg2xKTaMkJUyV93aUFEj74/zPqL/v8eyMlCiTmTsLUBA3t42psJvQ
	 u6Y/MUuSa/EI0SQVzMUKoV5mX+fjvmXq1JuF3uZ+oMWvw+hP01Syl03WRATt75US14
	 2TKkP1eHa8e2uqm/xuc7yKwnvA6yPfjPE3EfXO2m9hCxqAgB+6UbAtbWPKDHzlQ/q3
	 2Yc8AH1wh4UQimy9BpiCHFdPxsgHPIIwBfAA1u76TpYSHmYCGvAkydtkWJztCgLymO
	 zMtr70/897cQwVkHJgL7+OImJ0L7i3N7pH1fwSpeDXGqsvD4ARiOHSjbB8/sJCwkPT
	 5f0A9ZmHcmsAw==
Date: Sun, 20 Sep 2026 11:44:45 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Tejun Heo <tj@kernel.org>, Valentin Schneider <vschneid@redhat.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: [GIT PULL] scheduler fix
Message-ID: <aq-rDdJ7JlxW7gMZ@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest sched/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-urgent-2026-09-20

for you to fetch changes up to fe3c73d7bc769e7afc252f867a3421fe168b898d:

Scheduler fix:

 - Avoid false positive migration warning for proxy donors
   (Andrea Righi)

 Thanks,

	Ingo

------------------>
Andrea Righi (1):
      sched/core: Avoid false migration warning for proxy donors


 kernel/sched/core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)
