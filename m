Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792437840;
	b=vn969rirVXlE9tANNeXIRhbUgzM0vDugB97jbx8EWeRfhfAwIH+uFrhvamPaGGgsybni
	 X9/gGzmO55gACGZJGJpFcATMuX/MyacSpJ6bsDmVZ/AtQe/T+BDy5UpyyWkd5Z/cFsyvD
	 RQa4FUHIVVui29+NXL4f9SV/gFFsgQ/soWVnaI6I+FkGDUnvkJx3UF3fUXc9uUx9SsWLo
	 pzfAsEzw8WmA1StLkF9PgsmLW1u/g24o8vW6RqB4ISSSynzyouJTmap50z3vhJAZEt7EO
	 z4oIYn9xYXIyQgOiacjgdWf1T9xuVEc70xLXZqUg6gGSsE44G1sGlmVpZEQ5evdZxAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792437840;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject;
	bh=mnnStGPg4uQa1kneQDAbe7N52BBAyMS/YJfL9Oqp4RU=;
	b=xXh+zf3reD4l7XFjXBjtAIFthQQ6KBlFB+bzIu0w/ScJuUEiesVOuUhyWgSEXqW6f5iC
	 Qo6BeiKRWSmpZdHYyj3SJMzf0zEvLysAdRtpFhNDPJvgcqbhH2vz0QuWQobyuFk7ajRJ5
	 TaVnGqSXHpm1prYWTZUrdYjENQIKAl3IQGhXGoklGbOOKtS1vGUzClnvEBXqlzDkeFGC3
	 k6kIxayUXSda5U3EtvAgCDhpkDpyhoZkCtT/6hhJIK1klBPydvR/yDu9jM+Vu9cfTjoCQ
	 FiBOZ0aFoySr9YD21xyVyioGJPbIKJQGuEQJY7unkR+4F/X3xbuk2iRf19321dh7oTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ji23I/jR";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F4B606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ji23I/jR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D86791F000C4;
	Mon, 19 Oct 2026 19:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792437839;
	bh=mnnStGPg4uQa1kneQDAbe7N52BBAyMS/YJfL9Oqp4RU=;
	h=Date:From:To:Cc:Subject;
	b=ji23I/jRcXL+NbHl1HRfhR9FFWKZjL4xcIqFpLe0LXxANTCZrcxJoTCI00VUPyX3n
	 4DU3Eya2kKHfnAM70ZG/kt7MLn6WyKGbsAQMo6vLZ+jkWbzintTcFoelv029L8Pkl4
	 hRbrAGgSTjJS/yTJ0TmS/jM052Noyzrtf9EWSId7NKdx27sdGstZMYYaxR28ZkznFz
	 uA2AdvUhPMdajAYfrprdyrnQY3D4T1BKksVPXJSGbMS5W9D9Bjxa8CpfHiwPmFEfGe
	 UTsX6BzC7q77LtBHFCeKAhup/J2m9Tvnljr2fWUJGKoemktyTQe8zWxl7Yu73+7fJ2
	 fOqspy9eSiDfA==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xIsxj-00000001eEj-0LQX;
	Mon, 19 Oct 2026 15:23:59 -0400
Message-ID: <20261019192344.004592683@kernel.org>
User-Agent: quilt/0.69
Date: Mon, 19 Oct 2026 15:23:44 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 0/9] tracing: Updates for 7.4
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
ftrace/for-next

Head SHA1: e1f339ff3b83857b93baf8b88186275a413d445e


Aaron Ahmed (1):
      ftrace: Initialize modname and offset in print_rec()

Jose Fernandez (Anthropic) (2):
      ftrace: Do not leak a module's empty page group
      ftrace: Let ftrace_call_adjust() reject a patch site

Steven Rostedt (1):
      ftrace: Have stacktrace option work with func-args

Yun Zhou (1):
      ftrace: Add max field to function profiler stats

pengdonglin (4):
      tracing: Avoid BTF lookup in atomic context
      ftrace: Build trace_btf.c when CONFIG_DEBUG_INFO_BTF is enabled
      fgraph: Enhance funcgraph-retval with BTF-based type-aware output
      tracing: Update funcgraph-retval documentation

----
 Documentation/trace/ftrace.rst       | 96 ++++++++++++++++++++++--------------
 kernel/trace/Kconfig                 |  2 +-
 kernel/trace/Makefile                |  2 +-
 kernel/trace/ftrace.c                | 32 ++++++++++--
 kernel/trace/trace_btf.c             | 86 ++++++++++++++++++++++++++++++++
 kernel/trace/trace_btf.h             | 18 +++++++
 kernel/trace/trace_functions.c       |  5 +-
 kernel/trace/trace_functions_graph.c | 56 ++++++++++++++++-----
 8 files changed, 239 insertions(+), 58 deletions(-)
