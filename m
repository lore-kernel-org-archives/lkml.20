Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA9A2517AF
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 01:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788051936; cv=none; b=WLpR5Me9E10uZyw7wEXIgzORDN1RaWgv+OagAigB3jkFYnncWSSCgdzJ21uSc7uU5OfKqXHIaVP2qZP8F1FWbDk6KDbdLoaK018FbiikUxQ8YAM04XNFkMnbaNYSeLI0CCmJHs1uzlMNfazWRM4pv7+RtXntqnOeOMqbWLrEP/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788051936; c=relaxed/simple;
	bh=+WuCrbokaXSxVlDKXL4dQZJUHySugDyiu8vwO0dykRM=;
	h=Message-ID:Date:From:To:Cc:Subject; b=RakpBkyhYk5SMlQcwh9hxipP1mAZF+MAVH1TqTwYIxP0oNMx5nB3VSC+DhIgrEkKSlkGX/z6Y8yCoDvuPU7HCTwMMRHx7UX2mAcD3dJpWRy3ETX59GJpoJs8Pe3LtJsOXfAalSm3HuPkzgD729LnULxm+Rk3ypsuHNUKBYuAcO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AWN6g5zC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AWN6g5zC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC94F1F000E9;
	Sun, 30 Aug 2026 01:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788051934;
	bh=OgnU5kEPdBfyJpRP/+AmW49rFGDbm09zF92cxGAp23E=;
	h=Date:From:To:Cc:Subject;
	b=AWN6g5zCXbnIlFzGe5xARnmAP88rcxOpT9gzxI5IQokClIDkj7m51e6aOr9NdjjWL
	 K1a2xtEIBqKnLxDuHgOzAxjeqEUCN83ijYZDHiHGl46SmrPuHjpMy0iLaqXL31/yaz
	 65nGd8pqmkRbzShvYryzIJ/A78IZSCS/Tz6kd5vLyZl7GPtAQNxIqT1560pex+CNQ5
	 i1C2yJ7kpGCT5LKOjM7rQNgnexS1DvTBVQeEqu+a0mACoyx4npa/qFJtrekVa+xHbt
	 YMT3A47c6JnIUh2xMHoUUeVtWlJoTnHGIBJsHn1rsgToFNpVR7aZHcpnB1TVw0tbuE
	 7iAIriP+Ar/oQ==
Received: from rostedt by gandalf with local (Exim 4.99.4)
	(envelope-from <rostedt@kernel.org>)
	id 1x0U0B-0000000A48V-3ZGO;
	Sat, 29 Aug 2026 21:06:27 -0400
Message-ID: <20260830010531.847108845@kernel.org>
User-Agent: quilt/0.69
Date: Sat, 29 Aug 2026 21:05:31 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vincent Donnefort <vdonnefort@google.com>
Subject: [for-linus][PATCH 0/3] tracing: More fixes for 7.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

More fixes for 7.3:

- Clear user events state on fork in case of alloc failure

  On fork, the child gets a pointer to the parent's user events state. It
  makes a copy of it then updates the child's pointer to it. But if the
  allocation fails, the duplication function leaves the child with a pointer
  to its parent's descriptor. When the child cleans up its data, it will free
  the parent's descriptor while the parent is still using it.

  In the duplication function, set the child's user_event_mm to NULL before
  testing if the allocation succeeded, and when it exits it will not free
  the parent's descriptor.

- Fix retry exhaustion in simple ring buffer reader swap

  simple_ring_buffer_swap_reader_page() starts with retry set to 8 and
  post-decrements it only after a failed link replacement. On the final
  attempt, a successful replacement leaves retry at zero, while a failed
  replacement leaves it at -1.

  But the check for success expects the retry value to be non-zero and exits
  with an error on zero. This is the opposite result. Fix it.

- Fail nicely when the remote swap_reader_page() returns an error

  Currently, if the swap_reader_page() of a remote buffer fails, it triggers
  a WARN_ON_ONCE() and continues normally. Instead, have it exit with an
  error and a pr_warn() print instead of a full WARNING.

  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace/fixes

Head SHA1: 5eab74874d11160725c42ab676ba97a797a362eb


Ivan Immanuel Shaji (2):
      tracing: Fix retry exhaustion in simple ring buffer reader swap
      ring-buffer: Stop remote reader update when page swap fails

Jérémy Jean (1):
      tracing/user_events: Clear copied tracing state before fork duplication

----
 kernel/trace/ring_buffer.c        | 7 +++++--
 kernel/trace/simple_ring_buffer.c | 4 ++--
 kernel/trace/trace_events_user.c  | 3 +++
 3 files changed, 10 insertions(+), 4 deletions(-)
