Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792803036;
	b=4SB7TyFhewND0hED3a0K8bMtaLAcI8yHCZ+Fv+AFVuNnFAsm50HeIBNrDqn8BhUfK1XZ
	 dGXsBfLk7d3eA+n+8zsYbx3aFS2eENSDSTfRxQ/vXgNStCQwvOVZ7eOq/xLzhOs8+pqAp
	 wwWY4es9LZN4MR+egiENH1RusdBuoE0ki86Kw79E8v4MnM6XwqrJIVXuXdhUeSPd+lCsK
	 JHursLpC3S2ztrDammO3U/nHzWOa0OGpbBUmzg/bTpIjk7ka9d5Mqa7BP3nlxabbTVuFf
	 Vy/vtRt1knTtxrl8Z85CJhvf6/j1gYTKuArF3TJrciAyIQ8yx2GctToFkIBnBaLskOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792803036;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject;
	bh=DkwqrmprBsYpLUFFYOYV62XRTkoRaVCiC/x3PeDiK38=;
	b=eB4SGTk8JMKv6v4nGDB6w3XEnJxydC3qKNayUgbMZJFH0r5J+Ssr7nxoUVHG2BVe/BSL
	 jATRW3hro+RrRqmhVZl7zAE2l2Cgi5sALd4SfcLPxKNow1Knrp8m5aK1cm9dZoozKs1v/
	 zVbIES0Q3du2Ys2W6Pz3/mAkLRX1dEtsZngcZj/28QXq4RHiBn1F1eZzfyxwpJMIygODF
	 jwPX5G0uc0lX+JtClTnUIvpwaUwy8bhsRUd5JsAwr07WQCGUNRr7HtQ15gVQ9YjTOSMtQ
	 zsF/RfIa9zuG4XR7Lelw0LwTZAbZeENMdtYG/wwkxNxO45zEZUmUi3B+fdSLU7AvUcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j4VHLH3Z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8D1606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 00:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j4VHLH3Z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1E451F01828;
	Sat, 24 Oct 2026 00:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792803034;
	bh=DkwqrmprBsYpLUFFYOYV62XRTkoRaVCiC/x3PeDiK38=;
	h=Date:From:To:Cc:Subject;
	b=j4VHLH3ZhW4M/7vOKam2fUMP6rFfEvvGvJGyjL5dzaaFhy6HW5OibvXmP0nHzx8QU
	 FlZlhJiQoJHLbazaxCKhX6aRJ4Zcop4Yno5DICYO5I2u5eacRFkIbsNQuB+KDlavWz
	 EnjompkvJ/350iswFEYHqBKh3bVAWWXPcu/Da+M6GLjh8LAdwofYJEamKulZw5fw9y
	 FZlcqoBW7Wze0OOHBBSqRHJTneKOyJlHAIICU/pZ1IN2OwjE1wRwCqLs5H+EFf9bUh
	 pjw3A2fuq05IDs+rYYF0/MpYz2Tdf0Yre76uHzl7NiNvu+JPSD8572oLQX57TvqmXt
	 74jSkI+xMwP+g==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xKPxx-00000004gLR-3QX0;
	Fri, 23 Oct 2026 20:50:33 -0400
Message-ID: <20261024005012.676772644@kernel.org>
User-Agent: quilt/0.69
Date: Fri, 23 Oct 2026 20:50:12 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 0/3] tracing: Last minute updates for 7.4
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace/for-next

Head SHA1: 1fdc4164e488916402badddbb1f51e9380dabb91


Haoran Wang (1):
      tracing: Guard trace_event_get_offsets() against an empty fields list

Kyle Zeng (1):
      tracing: Reject incomplete event filter expressions

Steven Rostedt (1):
      cpuidle: haltpoll: Only define guest_halt_poll_ns tracepoint when used

----
 include/trace/events/power.h                       |  3 +++
 kernel/trace/trace_events.c                        |  4 ++++
 kernel/trace/trace_events_filter.c                 |  6 ++++++
 .../test.d/filter/event-filter-incomplete.tc       | 24 ++++++++++++++++++++++
 4 files changed, 37 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/filter/event-filter-incomplete.tc
