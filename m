Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4170A3783AE
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161096; cv=none; b=kgoEHJCgpFKczSXHNzVXhg1jfxSfV/9RAL9MpGl4luNLT6+QFXHKiy1xfeizvcYUcc6L7M9g8xBOSTuaX/UV/LByD3tCSJ5gmPdN/uzhXOn2BUEK1d7jRPVNBw5tJMe4O7x1ZHdVQ5kb/i1RYigH7GT9U75vMwVrUn2xi8vr0+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161096; c=relaxed/simple;
	bh=YEN7lB9SiiTQSb0397ehFYptjSq53i+TTYYMOmXaPFA=;
	h=Message-ID:Date:From:To:Cc:Subject; b=dYUedDK/SuVr512MuaHsJtCagT7jVTZdcvr/oeepHtutp7B6OLrGMMs1TpDrKu1ibD9Ibfl79Q+SwKAWlf0E/7XdJPYwyGoxCE5rl5ywv6tPotDK//SekunEMBT+Cw22O7Nu1bFnK49re3fBtHSSn2Iyd1pKBtBCq9gEhKmsZko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F8F5uqzt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F8F5uqzt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F26A81F000C4;
	Fri, 16 Oct 2026 14:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792161095;
	bh=MQ0kPcwtSoVokNjBeHLy590gY98bUlYQnLSOH6uuz10=;
	h=Date:From:To:Cc:Subject;
	b=F8F5uqztzdES81KTqtUQXeFoe8PVP895LKXQY5cjBEiDA31pGBHTE1u6LvaZ2inwh
	 b5SXCmLhTTo2V5isDKjVGNQQ9oZpG17ZXwjSu1nvlabJRH1DvGSB/viHmmb3H2cRbk
	 aR+F5pG0Kv5DKNzlyX5TPsYSkypFpHqc1aRQIC8WmNJeBrT7+z+P4d4KXS2uBwKv1C
	 w/vmqswP2U7IriEdDnX0fLj7l1OS0SlfbHGkMFvqfehvcxSE+EVwNZess+R0jLND+d
	 Iz7kixyFf+JSJxO3ro2farIj9ux1mogoHMsx3frVRZR8V4HaTj1J6L9SlyqOsj5qmt
	 TT/ygAX4KJG0A==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xHiy6-00000000XgL-0t2c;
	Fri, 16 Oct 2026 10:31:34 -0400
Message-ID: <20261016143115.392980228@kernel.org>
User-Agent: quilt/0.69
Date: Fri, 16 Oct 2026 10:31:15 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 00/18] tracing: Updates for 7.4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace/for-next

Head SHA1: d3e0dfc1ba49a0ab6aeddbb4bcde4bfc0e171a02


Chen Jun (1):
      tracing: Add "within" filter for call-stack-based event filtering

Donggeun Yoo (7):
      tracing: Print the bucket size as unsigned
      tracing: Add the bucket size to expr_field_str()
      tracing: Only report the stacktrace modifier on a real field
      tracing: Unregister field variable histograms when the command fails
      tracing: Clamp the printed end of a histogram bucket at U64_MAX
      tracing: Fix 64-bit and signed histogram fields on 32-bit kernels
      tracing: Print a signed histogram key as signed

Steven Rostedt (1):
      tracnig: Add proper error message for glob use with "within" filter

Thomas Weißschuh (6):
      tracing: Remove duplicate declaration of ftrace_set_clr_event()
      tracing: Stop modifying the input buffer in ftrace_set_clr_event()
      tracing: Split the event string parsing logic into a dedicated function
      tracing: Add a test for ftrace_parse_event_string()
      tracing: Add a filter argument to __ftrace_set_clr_event()
      tracing: Parse filter from boot event string

Vincent Donnefort (3):
      ring-buffer: Rename ring_buffer_size() to ring_buffer_capacity()
      tracing: Rename trace_array::entries to capacity
      tracing: Rename tracing_entries_fops to tracing_capacity_fops

----
 Documentation/admin-guide/kernel-parameters.txt |   9 +-
 Documentation/trace/events.rst                  |  17 ++++
 Documentation/trace/histogram.rst               |   3 +
 include/linux/ring_buffer.h                     |   2 +-
 include/linux/trace_events.h                    |   3 +-
 kernel/trace/Kconfig                            |   8 ++
 kernel/trace/Makefile                           |   1 +
 kernel/trace/ring_buffer.c                      |  13 ++-
 kernel/trace/trace.c                            |  51 +++++-----
 kernel/trace/trace.h                            |  13 ++-
 kernel/trace/trace_boot.c                       |   2 +-
 kernel/trace/trace_events.c                     | 128 +++++++++++++++---------
 kernel/trace/trace_events_filter.c              |  44 +++++++-
 kernel/trace/trace_events_hist.c                |  42 ++++++--
 kernel/trace/trace_events_test.c                | 122 ++++++++++++++++++++++
 kernel/trace/trace_snapshot.c                   |  14 +--
 16 files changed, 365 insertions(+), 107 deletions(-)
 create mode 100644 kernel/trace/trace_events_test.c
