Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C9B38B122
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161100; cv=none; b=FXjIIzd2dGxr3AC0lZFPBvD63DSYVUsNgkrXHS11hgHtr/aMDA9u5Pq4104EOwbqfRlDIlzwizI4b6aT6ATfgO6zMcPYjhCoaAgAdvTKYHG/C8CcPlTl0+hkKyiSTdCBPXOoL8llFESoUInnVn0BOwatOp6EcbBCpoSibOmV+qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161100; c=relaxed/simple;
	bh=Pnp2pRuN8kXPGCaFLJw9RGXnnLyKdi6wJSNAn2hbtQU=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=fe1kBuVtFlvH2+wXilmhh6N4/Wq9QMtDfMGJQq1MoQ2zrSM+Mut3DgYuUmRFR/laVup8hdEbveZvLBIx/F/ULtNkgkM/E3N+CcNlkGLQGi2p5Zn336uhdkW2qKzrW4XzV/51cqYD4h9u19nQlA17OwOL62mTgMx5o+w+Udodrb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E8N8g9Qu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E8N8g9Qu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF7901F000C8;
	Fri, 16 Oct 2026 14:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792161097;
	bh=KI8VjZN4oQRbQmO9b97IpRUBs9OIKGvri42SUQcpEhU=;
	h=Date:From:To:Cc:Subject:References;
	b=E8N8g9QuD7Fh0aOiS0/SQl0eqq15FgKIknmSYSBTBfVn7k1idxi68+V2FKGnzoFwg
	 NFhiN3QvMrVjzStmUpJJdzFISh/2cMVDsJEvrDUoLuMq176g0jX2j1pnPa2FLYnzPv
	 BLhlbqKKdqKon31/mMyYr3LO0KPTJG5KiTaSpYDlLhHVFvUa3mtcwtyHbWcH15xxIC
	 k0dyl2sLGdOYqLEQeW90oFNgPe6aj70TqmmerChBGpQ/NUcqPZw4AtZvbR0x/9uTl2
	 tvGcqgiDdNn7jsTplvL0mG2bSiF/rA0h0LWA6P2N2RDbwsjXXunTHO1SMPnAtccsrz
	 3wB+KiYd2kB7A==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xHiy9-00000000XoE-0fT1;
	Fri, 16 Oct 2026 10:31:37 -0400
Message-ID: <20261016143136.981392156@kernel.org>
User-Agent: quilt/0.69
Date: Fri, 16 Oct 2026 10:31:29 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Subject: [for-next][PATCH 14/18] tracing: Only report the stacktrace modifier on a real field
References: <20261016143115.392980228@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>

get_hist_field_flags() returns "stacktrace" for any field carrying
HIST_FIELD_FL_STACKTRACE, including the common_stacktrace pseudo-field,
which has no ftrace_event_field behind it. parse_field() no longer takes
the modifier there:

	if (stack_modifier &&
	    (!field || field->filter_type != FILTER_STACKTRACE)) {
		hist_err(tr, HIST_ERR_BAD_FIELD_MODIFIER, errpos(field_str));

so expr_field_str() renders "common_stacktrace.stacktrace", a spelling
that cannot be parsed back.

Report the modifier only when there is a field to report it for.

hist_field_print(), the other caller of get_hist_field_flags(), excludes
HIST_FIELD_FL_STACKTRACE before it calls, so this is confined to
expr_field_str(), whose only key renderer arrives in the next patch.

Link: https://patch.msgid.link/20260914053443.981201-4-donggeunyoo.kernel@gmail.com
Fixes: a5e70ba87ca8 ("tracing: Fix memory corruption from the histogram stacktrace modifier")
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Assisted-by: Claude:claude-fable-5
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/trace_events_hist.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index 91a550411e8a..fdd097abb0d6 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -1725,7 +1725,7 @@ static const char *get_hist_field_flags(struct hist_field *hist_field)
 		flags_str = "percent";
 	else if (hist_field->flags & HIST_FIELD_FL_GRAPH)
 		flags_str = "graph";
-	else if (hist_field->flags & HIST_FIELD_FL_STACKTRACE)
+	else if (hist_field->flags & HIST_FIELD_FL_STACKTRACE && hist_field->field)
 		flags_str = "stacktrace";
 
 	return flags_str;
-- 
2.53.0
