Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3E3483802
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787843364; cv=none; b=AaU272nWPN+qdFyMz9y69xBgS6yoper3GkYO4O9rzRURPvT4pr9Jh6eTJhAhE2EsS5PRFRN0UMfVI41K0ihMY96WbM7S+wLdvyvK2gEEhpVACR3FbP4DcuFWUmAymsmD5TAeSbIH1FlD9jh0tppstvWiwHPrFBq5d4mvzi1RQtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787843364; c=relaxed/simple;
	bh=OFfObwRBXIHOvI4LdvtiG46WwRoIkgzrfsSSovgvQn8=;
	h=Message-ID:Date:From:To:Cc:Subject; b=jzYdqUbXLoj5jfXt0hbGemW4LoIVZJcZGZDQSS0bLqA7r/Ja2Ttavkt1lDstfw9hsX+QEt3+brdqMn1gVtV1GZc9esYoyGI0RUZBeRSQNj33D77OtOJ1lKDtWRYvNj8vHUsUlGI9dBNgH48C+5DRAMvLUr6HMG2l9fUnE3fCnOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aitMdB5C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aitMdB5C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 040A81F000E9;
	Thu, 27 Aug 2026 15:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787843363;
	bh=eCdtUk7RLmbBubBv6zkfj5+w/LKqzc9f9kKtKK3Q8A8=;
	h=Date:From:To:Cc:Subject;
	b=aitMdB5ChfaunqVoMR/JT1f28cQMSJfdjM2ng5OkPuajydfPXBH30+UCTjlz27L2O
	 JEYWGSDuy+vFYfo8bh7BJErR0lAiW2iSpze3AzL0XtbryAngotPBwfnXLsvtr14MTJ
	 xETWLhjuOZY7wz+xqPiRPxzayDVc8LQHZ27d1RKgvyHNybkgARY+nfksrYkK28Zkz6
	 9v+WRSOusRf9aCobqfHiCCA+XrPnhL56SuDcpE3GiXdQHBUFinp8Fkph47NLob2UD2
	 t1NbuGfGkl5OfWfN9nhs1OF5H57bnGgrHUb7mrw1fPsdRDPBcB4MklY2/0HHJ1XvFL
	 Wurj1CSVhrpTQ==
Received: from rostedt by gandalf with local (Exim 4.99.4)
	(envelope-from <rostedt@kernel.org>)
	id 1wzbk2-00000008PE2-2ugd;
	Thu, 27 Aug 2026 11:10:10 -0400
Message-ID: <20260827150949.304280511@kernel.org>
User-Agent: quilt/0.69
Date: Thu, 27 Aug 2026 11:09:49 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Deepanshu Kartikey <kartikey406@gmail.com>,
 Haotian Zhang <vulab@iscas.ac.cn>,
 Hui Su <sh_def@163.com>,
 Vincent Donnefort <vdonnefort@google.com>
Subject: [for-linus][PATCH 0/7] tracing: Fixes for v7.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tracing fixes for v7.3:

- Fix error output of boot instance creation failure

  Currently if a boot instance creation fails, instead of printing out the
  name of the instance that failed, it prints "(null)". That is because it
  prints "cur_str" that had already been processed by strsep(). Print the
  saved name instead.

  While at it, print the error code of the failure.

- Fix use-after-free for same named historgrams

  Histograms can be named so that they can be used in multiple events. But
  if the named histogram has a variable attached, the second event that uses
  the named histogram which duplicates it and needs to free the original
  after duplication leaves the old variable in place and still visible. If
  another histogram uses than variable, it will use the stale one which will
  try to reference the freed duplicate histogram and crash the kernel.

  Free the duplicate variables along with the duplicated histogram data.

- Check return value of kthread_run() in event self test

  The events self tests uses a kthread for testing but does not check if it
  succeeded in creating a kthread. If the kthread creation were to fail, the
  code will still try to call kthread_stop() on the error returned.

- Fix race between reading trace_pipe and updating subbuffer size

  If a user is reading the trace_pipe file at the same time they update the
  ring buffer sub-buffer size, can cause the trace_pipe read to read stale
  data. Add trace_access_lock() around updating the ring buffer sub-buffer
  size.

- Fix eventfs_inode on failure path in creation of the events directory

  In the creation of the "events" directory, if after allocating the
  eventfs_inode a failure is detected, it calls cleanup_ei() which calls
  free_ei(). The free_ei() will test if eventfs_inode being freed has no
  children. It is a bug if it does. But on the failure case of the creation
  of the "events" directory, the children lists have not yet been
  initialized and the free will trigger a warning because list_empty() on an
  uninitialized list returns false.

  Move the initialization into init_ei() where it makes more sense and makes
  sure that a created eventfs_inode has its lists initialized upon creation.

- Check return value of kthread_run() in ftrace direct sample code

  The sample code that shows how to use the ftrace direct calls does not
  test the return of kthread_run() to see if it succeeds. Return a failure
  if the kthread_run() doesn't succeed.



  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace/fixes

Head SHA1: 6727b7618f49401acf373fa3ec5712e2ec52e5cf


Deepanshu Kartikey (2):
      tracing: Fix use-after-free in trace_pipe read on sub-buffer order change
      eventfs: Initialize ei->children and ei->list in init_ei()

Haotian Zhang (2):
      samples/ftrace: Fix kthread_stop() on ERR_PTR in ftrace-direct-modify
      samples/ftrace: Fix kthread_stop() on ERR_PTR in ftrace-direct-multi-modify

Hui Su (2):
      tracing: Fix use-after-free with same-name named triggers
      tracing: Fix crash passing ERR_PTR to kthread_stop()

Vincent Donnefort (1):
      tracing: Fix logged instance name on creation failure

----
 fs/tracefs/event_inode.c                    |  7 ++-----
 kernel/trace/trace.c                        |  6 +++++-
 kernel/trace/trace_events.c                 |  2 ++
 kernel/trace/trace_events_hist.c            |  4 +++-
 samples/ftrace/ftrace-direct-modify.c       | 12 +++++++++---
 samples/ftrace/ftrace-direct-multi-modify.c | 12 +++++++++---
 6 files changed, 30 insertions(+), 13 deletions(-)
