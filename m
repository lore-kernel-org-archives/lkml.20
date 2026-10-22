Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792697990;
	b=N/ICGNMlyQSyAGMA9ULRbkBG8G+qp7C8jR+DyjrRer/GXY+jWRXXggwjl9Ue4QDbMwpp
	 EGtHOo6fEm334Wl0nSC3slt2UbC3SCVJ7q3jtBR4JSn7bvmBFLYxXHHPdn7NL5+FSrREs
	 Sq6sX5UMAgqzZYw8Q6gM4QD3emVJjlckwR6T6k6TKaZAtuZ/4tSD9rp4dFPRV+DUi9toH
	 n+iyVr5LGhuh0+yZsWPBMFVmoh664sjsdyIEBdV21+a7E8r2FnglxUJj2PwGBS47Ndw+S
	 YEMvWi37DAtu6JrfbAPxXEMzo/6QwNXHg4xxF6lFrL6wpYOcDNJCt6lzcNs7JHpDAbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792697990;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Stat-Signature:X-Rspamd-Server:X-Rspamd-Queue-Id:X-Spam-Status:
	 X-Session-Marker:X-Session-ID:DKIM-Signature:X-HE-Tag:X-HE-Meta;
	bh=84oPn/1DzKyrYik5POoJOGSmwXIfTEl8rAG9I8F9rV0=;
	b=He60XobVtxGJhRUx6vOkPIKZkfTeu/mJ9f2Ql0hJSlopzXfsiJRSQCbkJfncqCbWDQhW
	 yTJqM3CNW9EryI0H1oUXGMlyxtZozBuFfcCONm70m6IeVTZQfKajJSMggcXYDUuZIlXfF
	 9WQ1roNvReb5+6/6VRDT9WbP/61+2jwWgUDqyhfsGcx2RmzjK2J8fPgCR4+6IeV6QBICi
	 M2OGt9K+/ZHRxQSwvm2k+lX9Yx/09VLv+FAJKNMgcvShTw5TUd4ELuoO4rqCWFCGhBQqd
	 pwnNBDx2xiTz/v1n9sKK3BtzcIf2oI5XBTonRYCMmv3WLzT5ot3nnOptaqJ4YxRmC+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goodmis.org;
	spf=pass smtp.mailfrom=goodmis.org;
	dkim=pass header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=K6DKij9M;
	arc=none smtp.remote-ip=216.40.44.15
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC4C606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AC4C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=K6DKij9M
Received: from omf14.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id F3F6C801A3;
	Thu, 22 Oct 2026 19:39:47 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf14.hostedemail.com (Postfix) with ESMTPA id BE5B933;
	Thu, 22 Oct 2026 19:39:45 +0000 (UTC)
Date: Thu, 22 Oct 2026 15:39:44 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Mark Rutland <mark.rutland@arm.com>, Andrew Morton
 <akpm@linux-foundation.org>, Aaron Ahmed <aarnahmd@amazon.com>, "Jose
 Fernandez (Anthropic)" <jose.fernandez@linux.dev>, Yun Zhou
 <yun.zhou@windriver.com>, pengdonglin <pengdonglin@xiaomi.com>
Subject: [GIT PULL] ftrace: Updates for v7.4
Message-ID: <20261022153944.4e66e8c0@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: nu4pb7rbp4yfmi4m79zk796cak44icma
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: BE5B933
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19gmJBnaKg0H6ziGjo3MNPsxH2uZrpWCjU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=84oPn/1DzKyrYik5POoJOGSmwXIfTEl8rAG9I8F9rV0=; b=K6DKij9MRKs+a8kpPG29t7s7G9F1SFpRsx38jX8lNWqIe1k7gV85von4OBim23hV1jT07QzZy2KLD/EBoCxazAG+i1FaF8UiKERiTwocfoPdMV8eJj65oA9bnZR1UW7KFKzlG8gwKSbM/i5aXvT3oeortFAYXBu8gcBR28iMdTM=
X-HE-Tag: 1792697985-841281
X-HE-Meta: U2FsdGVkX1+z6ETAFyAfpLGlduXbQLD2PrfesbPkBJazzlXuBPOfMHsASOgtXM3p1JyXvC3rmiypYX5m0FX6/3H9gEipR5AHkWZW80sjyZddzazrctivqQoxWuF9bFk3imNfr0ujrQQzoZruupDLC1bizifsH4nVDljsbiZVmUw3pnUPClBpvTWMkXXw6oZPZNyOBjn/wrVVavwk2rQUo1xL+cpIsuLqmLYhKcXkeGM+GwzGQ5S2G8TIqPwfJNizydcdCGNVsKK17eSho8y7YmLr4P2Y3ElaGx20vDNz1W75PetZx4L1T/4Z0S9JrFhw1Mj4oWAuWXwxilRTnee+9HW2gF4ODv3m


Linus,

[
  Note, there's a slight conflict with Masami's probes pull request as they
  both touch code in kernel/trace/trace_btf.h where one touches a parameter
  in a prototype and the other adds a new prototype near that location.
  It should be a trivial fix up.
]

ftrace updates for v7.4:

- Have the stacktrace option work with func-args

  The func_stack_trace option has it's own ftrace handler and so does the
  func-args option. When they are both set, neither would run. The function
  tracer itself would error out.

  Allow the stacktrace and function args to work together.

- Avoid BTF lookup in atomic context

  The ftrace_dump() can call function graph tracing output from an atomic
  context (like an NMI watchdog going off). The BTF lookup is not safe to
  call from atomic context. Have btf_find_func_proto() return if in atomic
  context.

- Build trace_btf.c when CONFIG_DEBUG_INFO_BTF is enabled

  New code is depending on trace_btf.c but that only gets built when
  BPF_SYSCALL is also enabled. As the new code doesn't depend on that, have
  trace_btf.c get built with just DEBUG_INFO_BTF set.

- Have function graph return values have BTF processing

  Have the return values printed by the function graph tracer use BTF to
  print the values in better format. For example, if it's a char, short,
  signed or unsigned, print according to the value defined by BTF.

- Add a "max" field to the function profiler stats

  The function profiler shows all the functions run in the kernel, the
  number of times they are called, and the total time they took up. Also add
  a "max" field which holds the longest time a function ran for.

- Fix memory leak in module with all skipped functions

  On module load, the ftrace entries are recorded to keep track of what
  functions can be traced or not. Some functions may be skipped for various
  reasons (some defined by the architecture). If all functions in the module
  are skipped, its data page is not freed and can leak. Catch this case and
  free the empty page.

- Allow architectures to reject functions from being traced

  Allow architectures to skip a function address by returning zero from
  ftrace_call_adjust().

- Initialize modname and offset in print_rec()

  The variables modname and offset are initialized by kallsyms_lookup().
  If that fails, the values are not set, but the code continues to print
  other information. The modname and offset are used later, but if the
  kallsyms_lookup() failed, they will not be set.

  If a module is being loaded and unloaded at the same time as reading
  the available_filter_functions file, it can cause a fault due to the
  lookup failing and modname and offset being used uninitialized.


Please pull the latest trace-ftrace-v7.4 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace-ftrace-v7.4

Tag SHA1: 653342b1940a468bfb7104867950db0d5c92a5d8
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
---------------------------
