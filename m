Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74EB46D2DD
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161099; cv=none; b=F3E8oLmZmYt6EJwE6O4ylkAYycOqUt9PrytdoXMA6b6lxmdBEmku5AOwYaWDHvnW32ZHcyFKtu5AH80BgLtr6Akaca1lQGA6Ec61C7l7lijpe/tHvO9sA2412L9MAMvuB5fMSl2R/B4HwqpfREHwbUXXioFmj553tx59ve/D0dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161099; c=relaxed/simple;
	bh=3dYbVtpQkIYyGCb519wQbyJueGavU1bMAKOkCHmu9+Q=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=FpBUgLnD4X5jFmVE2T4LQX7/ooXw5RNaSABqq0gNJ6sqLtzlDn8xizMT+HsMXJcvToLeqPxBrDSmQ7gUYJzio6HRg1+nmASsqo8A3MEz5w9K0U5ohJMdhfrVVkxgCAWFBzRoam55JttFhXjuyUQ8EJwdviRTQf6rrrOa5L/IhZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EnsRqtxR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EnsRqtxR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D5481F000CA;
	Fri, 16 Oct 2026 14:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792161097;
	bh=ZbhsZaeqD68CSsEweLoSIfx0A9UZoXTVADvM7jl89Lo=;
	h=Date:From:To:Cc:Subject:References;
	b=EnsRqtxRKLqToqnZYYA7BTSljstHQ0rI6hhu0SfdbQNmP1fi/brTNN2561/8dag+X
	 u6T9Y3BICdIZW3A8k3RjHLT2QPArGfdF9okmJggK+igm/EjtUQeNA4QHOIL85GjSBJ
	 rQGOeTk2HCLn9asNQpDqgaSbd65mysqTzfhNsqRHq3Biyp+9nSkatvk7gkR6q0Qx07
	 y6lSpELLsCsdlBH0CLjed9jBhmr0yJ7ydxwuVuxSB7yoCxZE8N7eFWLfJAVfYuI6p3
	 lxjUBsEvXVgkuvQqRNQxPgaes7FkP09sAYn0MYRRYNXnzcZ479WUZlpwk69A+SFfv+
	 +FBZXFfouvNUA==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xHiy8-00000000Xn5-3CgV;
	Fri, 16 Oct 2026 10:31:36 -0400
Message-ID: <20261016143136.575045263@kernel.org>
User-Agent: quilt/0.69
Date: Fri, 16 Oct 2026 10:31:27 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Subject: [for-next][PATCH 12/18] tracing: Print the bucket size as unsigned
References: <20261016143115.392980228@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>

A key's bucket size reads back negative once it exceeds LONG_MAX:

  # echo 'hist:keys=next_pid.buckets=18446744073709551615' > trigger
  # cat trigger
  hist:keys=next_pid.buckets=-1:vals=hitcount:...

parse_field() takes the size with kstrtoul() and rejects only zero, so the
whole unsigned long range is accepted and stored, but hist_field_print()
renders it with %ld.

Print it with %lu.

Link: https://patch.msgid.link/20260914053443.981201-2-donggeunyoo.kernel@gmail.com
Fixes: de9a48a360b7 ("tracing: Add linear buckets to histogram logic")
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Assisted-by: Claude:claude-fable-5
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/trace_events_hist.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index 8af97fd4ee2d..a3eae5c1344a 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -6200,7 +6200,7 @@ static void hist_field_print(struct seq_file *m, struct hist_field *hist_field)
 		}
 	}
 	if (hist_field->buckets)
-		seq_printf(m, "=%ld", hist_field->buckets);
+		seq_printf(m, "=%lu", hist_field->buckets);
 }
 
 static int event_hist_trigger_print(struct seq_file *m,
-- 
2.53.0
