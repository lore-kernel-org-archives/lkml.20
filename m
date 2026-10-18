Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F592E8DE3
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792314775; cv=none; b=muAHr6kSrrMlgeFaL5jutSRKS71SEZ3DD9zT1cQP8D/fygmS2Hho/UcO5wXar4Cra4l4xDi5vvHgvi6X6nQ/M8YZb9VzWetftWSOaDBOi2Xs4Ntj4x3co2Oa2AnJwyli480P5iGu4Rnnk1dUgd7oOPGLWc8BZfSXfw7bj9DpYSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792314775; c=relaxed/simple;
	bh=D+jr44b1I0oi43pEMxVbL2xczbwYbhhUHplduqw7Ja8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fqagUkFdb51Cg0eFdaCLfvN0UwnKFhh0vKR8DEtlsYE4RlLOUZT7e7ZF5ddbZlyWIqSXdesBJ7LZ3ZgQTxN+bW61ocmlCd0vba1rJLCnqk3RAKgo7s7MQWRmeb5z2lA5XGq7WKXE41rYMQ7omNEuMYtgyMqzIEdjsGQI6tWQrhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VWGDNyP2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VWGDNyP2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53C5B1F000C4;
	Sun, 18 Oct 2026 09:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792314774;
	bh=U6crjmm2AQND887m1JJC159faJG+pP6xvjj//VVdHQ8=;
	h=Date:From:To:Cc:Subject;
	b=VWGDNyP2q6ZS2OZiM6lx5aZY92PZBLVvAGijVYuWA+eaRML8g5uBH66WBay99p7sC
	 JbzRKJA65IOk/ahYgNkWaGs6RBmvlZgaactZht9J8Bq/NKwIVBYFwL1mPgzxthjKzr
	 ipTeDE/DlK3V0XatYKCPIXS7C8mdfwUjscK8Vi9ST9iTEaeHMQBgtEc6Ikzl8IC/rX
	 dP8KnsP3jCsv3j/2ulLOikur5fGmOH1BZ6RoSNFC3Z+SUTW9QErTWS6xkPRR5GPAv2
	 vTt/QPKl4LPePAXiIlQZ/jSuOCKa7wxwBhjVrYfQY9UkrQcNgbEh8CX07KP9U2HM9b
	 k9SFXAHUOYwuQ==
Date: Sun, 18 Oct 2026 11:12:49 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>
Subject: [GIT PULL] locking fixes
Message-ID: <atSNkdiR-oSd-QEu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest locking/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking-urgent-2026-10-18

for you to fetch changes up to 7cbaa0f4579f48e92639c6abb761fdef8fbade47:

Locking fixes:

 - Fix FUT_OFF_MMSHARED futex hashing bug that can cause
   missed wakeups or spurious wakeups on futex-waiting
   tasks (Jann Horn)

 - Fix lockdep context tracking bug in the deferred hrtimer
   rearming entry code, which causes a lockdep chain leak
   that will eventually turn lockdep off (Mikhail Gavrilov)

 Thanks,

	Ingo

------------------>
Jann Horn (1):
      futex: Fix mm reuse handling for FUT_OFF_MMSHARED

Mikhail Gavrilov (1):
      entry: Account the deferred hrtimer rearm as hardirq context for lockdep


 include/linux/futex.h            | 19 ++++++++-------
 include/linux/futex_types.h      |  2 ++
 include/linux/irq-entry-common.h | 23 ++++++++++++++++--
 kernel/futex/core.c              | 51 ++++++++++++++++++++++------------------
 4 files changed, 62 insertions(+), 33 deletions(-)
