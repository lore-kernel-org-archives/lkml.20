Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F15E4A4853
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161100; cv=none; b=ujiFYrREY3Jco13ItKq1gmPKv0xw4+SpjDuGLnUDDCKQ3A5sYEUp+hQnx5T3iv34cRuahvU+6WTjXNzSb5T784nPj92tkWYfzXAy3fm7pcxfLrAVRbg4UVMMQzHS3FVLaV++CQvmoBBF2NAwi1ptkDWKcFbldvqmZvKvSU97DLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161100; c=relaxed/simple;
	bh=r4oaTg8E4aGKqhzXuMlE8LArgqX5CDpRrhe5g0n4cjM=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=FeUQCka7tbRFPmsCXChf0OwC6p8c/T+YAciCqGCuWqZHeRECbdnKt2RSQU91BQzM4mGE920b0zbLab/tCXAZ/zb8DjoI/CrtkAmBnG8ECLFCXSAuOIyrqajpKnqd5KC/IYFZga5tR/dvbDkFvbqA8ixcrLM1fvKqeZTGAPLv+DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CHNXMqwc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CHNXMqwc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B0581F000CF;
	Fri, 16 Oct 2026 14:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792161098;
	bh=Mn+T2Liar6cF+W5BB48YN7SED94gIHstSJFt9HAm0DI=;
	h=Date:From:To:Cc:Subject:References;
	b=CHNXMqwcCPvV5foH0HsU3IxZLCR1N7n3Oa/MCvSN2Sa+6voYfOPlm9LNJKJPeRqv1
	 JK3AuiN1SWBKX7LsNYgNooFRt8Xk0hDqm/naV+G+FJ7Rugjf4PY+pVZQvjMUFQ2Ux8
	 YJnklFI0glk03ARDCml/p/NbSPHqpGi1gXqr6LRn+13q5t4o6JL1MTZAwXxhW2e3Hp
	 sLv1B+J71SSfjwaloVl92Xv3BHcs76Tcfi3xquenp4G3P+SRyhBU2xxO2cbD2zTIGt
	 oB/jQuU+ELEOJrzmS5vsDdkyMVuq8hLldGaXljTRVh0SzNGJkQBW8SBn7Sq9ZqVSmP
	 4PZmUsWxQ5+hw==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xHiy9-00000000XpM-2HSC;
	Fri, 16 Oct 2026 10:31:37 -0400
Message-ID: <20261016143137.374851839@kernel.org>
User-Agent: quilt/0.69
Date: Fri, 16 Oct 2026 10:31:31 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Subject: [for-next][PATCH 16/18] tracing: Clamp the printed end of a histogram bucket at U64_MAX
References: <20261016143115.392980228@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>

A key with the ".buckets=N" modifier is stored as the start of its bucket,
and hist_trigger_print_key() prints the range it covers as start to
start + N - 1. That addition overflows once the start is within N of
U64_MAX:

  # echo 'hist:keys=offset.buckets=10' >> \
      events/syscalls/sys_enter_lseek/trigger
  # ./seeker 5 -1                      # lseek(0, 5) and lseek(0, -1)
  # cat events/syscalls/sys_enter_lseek/hist
  ...
  { offset: ~ 18446744073709551610-3 } hitcount:          1
  { offset: ~ 0-9 } hitcount:          1
  ...

18446744073709551610 + 10 - 1 does not fit in 64 bits, so the range ends
below where it starts.

The bucket does end at U64_MAX: it holds every value hist_field_bucket()
maps onto its start, and there is no value above U64_MAX. Clamp the printed
end there. Printed honestly the group is shorter than the size asked for,
which histogram.rst does not mention, so say it there.

Link: https://patch.msgid.link/20260914132346.2234731-1-donggeunyoo.kernel@gmail.com
Fixes: de9a48a360b7 ("tracing: Add linear buckets to histogram logic")
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Assisted-by: Claude:claude-fable-5
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 Documentation/trace/histogram.rst | 3 +++
 kernel/trace/trace_events_hist.c  | 7 ++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/trace/histogram.rst b/Documentation/trace/histogram.rst
index 340bcb5099e7..97b67f05f5ea 100644
--- a/Documentation/trace/histogram.rst
+++ b/Documentation/trace/histogram.rst
@@ -1943,6 +1943,9 @@ the ".buckets" modifier and specify a size (in this case groups of 10)::
       Entries: 16
       Dropped: 0
 
+Keys are 64-bit, so the group holding the largest values is truncated where
+that range ends and can be smaller than the size asked for.
+
 To save stacktraces, create a synthetic event with a field of type "unsigned long[]"
 or even just "long[]". For example, to see how long a task is blocked in an
 uninterruptible state::
diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index 972804709b14..c150e1130a5f 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -5561,9 +5561,14 @@ static void hist_trigger_print_key(struct seq_file *m,
 				   *(u64 *)(key + key_field->offset));
 		} else if (key_field->flags & HIST_FIELD_FL_BUCKET) {
 			unsigned long buckets = key_field->buckets;
+			u64 end;
+
 			uval = *(u64 *)(key + key_field->offset);
+			end = uval + buckets - 1;
+			if (end < uval)
+				end = U64_MAX;
 			seq_printf(m, "%s: ~ %llu-%llu", field_name,
-				   uval, uval + buckets -1);
+				   uval, end);
 		} else if (key_field->flags & HIST_FIELD_FL_STRING) {
 			seq_printf(m, "%s: %-50s", field_name,
 				   (char *)(key + key_field->offset));
-- 
2.53.0
