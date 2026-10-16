Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8FE4DDB5C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157566; cv=none; b=m7LNBD4ovOmGjm8tU4+Bqc0gJDr4zvKNuAB0K5wMiR3cm0F476jzfVcBfIPRTYTDAsrx9xOApZK7YkryttdXadRl2BYcQ+BGzCBXWfqn/4JPYoKmW0OSdvJHt+Nw8/WEF+X+xa+hDYpcY9C7R2CGTmzxgfmvcm+BhRmYW5iDL/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157566; c=relaxed/simple;
	bh=seqx6jrt5DmfjVjk34RPPbEpcO4BJPmMclnelFc7c4c=;
	h=Message-ID:Date:From:To:Cc:Subject; b=ccSIHU1wKeFxsxmIs9whpMYvqw5AgplY6B85r+jrGYJsbBvN6dcbfzdGJegMUJFGYHD+SB7/EJpK7AwrWjTcmNrM7QmCei5I9+Qd5FEEofU1Q0SrqY61EC1E086nZByXjJRqt5k0Rdj1+gO7kq12SQHR7/Pf5e12cJyv6/Kglwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZfHYjIne; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZfHYjIne"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EED81F000C4;
	Fri, 16 Oct 2026 13:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792157565;
	bh=pC3oOnMfQl976IX1CIwISGmOGR1m/9YVQyK/md/wZgM=;
	h=Date:From:To:Cc:Subject;
	b=ZfHYjIneUUTzDkr3PbBHnIAz653bWpKFAh7KEuue21Iiphc47ybbSTM4ZXdYNL64m
	 rfLXGHDPwj6zsszLfNqc8QOoTT415f0RmCRIVOppOKxBHHuhoKhcPaFwVG57+R8Ztg
	 wsYZOGbgpSOkP4SdpK7a6pajxagVVTUqrCyzm2AOQ7hXxgNztUhwPCZQVLV5yGqth3
	 hSJRVFpiuI54FjWfJsYyd/6T9a28dPdKfYJzyT1QRPNNFF4L1luPMJ6S8UMnO3PmHL
	 7g2erfnJx7K0y8fvXe6RDXplP8cTVnzjUM3hZoajbqlpW62QLv1yNxp5F8guM8Kngi
	 r5cQFzXIPLfTg==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xHi3A-00000000WTr-2Sxg;
	Fri, 16 Oct 2026 09:32:44 -0400
Message-ID: <20261016133218.800011513@kernel.org>
User-Agent: quilt/0.69
Date: Fri, 16 Oct 2026 09:32:18 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Hao Ge <hao.ge@linux.dev>,
 Taeyang Lee <0wn@theori.io>
Subject: [for-linus][PATCH 0/3] tracing: More fixes for v7.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>


tracing fixes for v7.3:

- Fix a crash in print_graph_function_event()

  When a tracer does not define static or default flags the
  tr->current_trace_flags is set to NULL. If the ring buffer is
  not cleared when switching tracers, the previous tracers events
  could be read. The function_graph entries will dereference the
  tr->current_trace_flags and cause a crash.

  Set the tr->current_trace_flags to a empty set of flags to prevent
  it from being NULL.

- Separate tracing filter predicate count from allocation

  The amount allocated for the predicate program is the number of predicates
  defined plus two for adding "true" and "false" at the end. The nr_preds is
  incremented by two to accommodate the booleans but is then used as the
  limit check for number of predicates. This is incorrect as it is now two
  higher than what is expected.

  Use a separate variable for the size of the predicate array.

- Fix the filter operator stack check

  The operator stack increments the pointer and then writes the content onto
  the stack. The check for overflow compared the current pointer to see if
  it was greater than the stack size before doing so. This is an off by 2
  error as the write will be at the size - 1 and the compare is done before
  the increment. Adjust the check accordingly.

  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace/fixes

Head SHA1: c47a7b11bcb3d45e29723afcf6336866476b1d08


Hao Ge (1):
      tracing: Fix crash in print_graph_function_event()

Taeyang Lee (2):
      tracing: Keep the predicate limit separate from program capacity
      tracing: Check operator stack capacity before pushing

----
 kernel/trace/trace.c               | 20 ++++++++++++++++++--
 kernel/trace/trace_events_filter.c |  9 ++++-----
 2 files changed, 22 insertions(+), 7 deletions(-)
