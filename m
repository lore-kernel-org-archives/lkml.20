Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEECA3B3BF2
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520941; cv=none; b=UprdUlBRawBPsYfR0r8PWh8vAFTbyFXllNNcCO1gXOJXWQ0QwMnPGo/WUV1bpvFqFuWPEFTTyW5Kv/XsdnFzpT0rxAuyCrQSl6Bb5I0fEXxQkKAoWhVJVi4fTu/ASa56LMMr2pNVZp17toi/HaDAqUyUfCBUy+h+jOocW5uZO60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520941; c=relaxed/simple;
	bh=wGfnsgjxq6Qr50w5mAQwczabeGNWOLFizrzsi3Zry24=;
	h=Date:Message-ID:From:To:Cc:Subject; b=DT1Aw0td/imP8oCsdkzl+lSpRGiu/7gKP2DCbKSVQ3PB/cVKuc9OTG9/XIdBqpHFCYVs6XuYEVoEcmIPLQUh7ZGB1b9ajv/eMNkjPQJu/5SU0odnwaRjLQem9p488h8DeqVA1KORY/booX5JkwaJVp493SB7xMXtS3aCbznRH34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GPaGJ4bM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GPaGJ4bM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C89D1F00A3F;
	Fri,  4 Sep 2026 11:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788520940;
	bh=LgjK4siUtTym00EFs0eol48dYUfeBw/Fpq3o47gcf7U=;
	h=Date:From:To:Cc:Subject;
	b=GPaGJ4bMKjIC+uUvpZZMI4EvlhxnC7VzUBeJVy1ormYtZl/cxkGiMvd3u68ErdeOX
	 eAGWErMt0aoalpnvnQOaEZNkss+v9NZ9XypHDTmHjb4feXaltqJ6xkMlEBTZsx6v5i
	 E5IcEHJW+eeuw4oYBweOejfRiV30XlcpK+oDbyL/zQpHIZkaV0BECGtCgaGbOq06Xe
	 Muzy9sKIRvb4jm6orbwnEoMyM/D1AufqukBuRcWEwtiM9GdaGXvKlhjShsDsqEdPy2
	 GsVgWH3YtGj7R4wUH+NDt9UIeGVkjdbzeBD9+qb2uJaTY/VIhLiFFBb2KXrzsX6E1R
	 3zLtKy7sfg4IA==
Date: Fri, 04 Sep 2026 13:22:17 +0200
Message-ID: <20260904112100.683893401@kernel.org>
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
Subject: [patch 0/8] exec/exit: POSIX timer related bugfixes and related
 cleanups
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Recent findings from Hyunwoo unearthed two bugs in handling POSIX timers on
exec().

The relevant patches, reports and discussions can be found here:

   https://patch.msgid.link/aok1rdkBgZsynHZB@v4bel
   https://patch.msgid.link/ao7Q8miiuLAPVnWv@v4bel

TLDR:

Both problems are related to non-leader exec(). POSIX CPU timers which are
targeted at tasks hold a pid reference of the target task, which is used to
look up the task in the related POSIX timer operations.

The non-leader exec() switches the TID of the old and the new leader, which
obviously invalidates these references for pid_task(PIDTYPE_PID) lookups.

This causes UAFs due to the resulting list corruptions or premature freeing
without removing the underlying POSIX CPU timers from the involved tasks.

The first issue which corrupts the signal pending list is solved by:

    - Preventing the queueing of per task signals on a task which has
      PF_EXITING set.

    - Protecting the unlocked setting of PF_EXITING in exit_signals() with
      sighand lock.

    - Flushing all per task signals right in exit_signals()

The second issue which keeps the POSIX CPU timers queued on the new leader
is solved by:

    - Moving the exec related POSIX timer cleanup right after de_thread()
      which ensures that the timers queued in new_leader::posix_cputimers
      are removed before the underlying POSIX timers are deleted.

After looking deeper at the exit() handling it turned out that the POSIX
timer cleanups can be done early in do_exit() instead of delaying them
until release_task().

The reason for this late cleanup is that POSIX CPU timers can be created,
rearmed and deleted as long as a task is visible, i.e. the pid is hashed
and sighand is not NULL. This allows to retrieve information from the timer
up to the point where the task is gone for real and that can't be changed
easily as that'd be a user visible change.

But once PF_EXITING is set on a task the task does not longer expire POSIX
CPU timers. So it makes no sense that the timers stay queued in
task::posix_cputimers after that point.

The only thing which needs to be prevented is that timers are requeued on
task::posix_cputimers once PF_EXITING is set or requeued on
signal::posix_cputimers when PF_EXITING is set and signal::live is zero,
which indicates that the thread group is dead.

With that solved the timers can be dequeued from task::posix_cputimer
pending when a task exits and from signal::posix_cputimer pending once the
threadgroup reaches the dead state, i.e. signal::live goes to zero.

The series applies on 7.3-rc1 and is avalaible from git:

    git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git posix-timers

Thanks,

	tglx
---
 fs/exec.c                      |   18 ++++---
 include/linux/posix-timers.h   |   39 ++--------------
 include/linux/sched/task.h     |    1 
 kernel/exit.c                  |   24 +++------
 kernel/signal.c                |   70 ++++++++++++++++------------
 kernel/time/posix-cpu-timers.c |   99 +++++++++++++++++++++++++++++++++++++----
 kernel/time/posix-timers.c     |   26 ++++++++--
 kernel/time/posix-timers.h     |    3 +
 8 files changed, 179 insertions(+), 101 deletions(-)
