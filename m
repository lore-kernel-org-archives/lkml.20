Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE20344D8B
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 01:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788659157; cv=none; b=eOfORYgJUw4MSVf0Tq1MpbfR3MPiQiNW0jWCr4Mch01VDqko1qmxzxkBMZ7cZM2zeNuW8rJBKiaskP2TdY6IJ3Z3EXbcUvRBMsco6u4cmrxYjMARS2kEeK+3Rp/4ZyRMP/xYWXFZEVTNzvs9Os5eaZmLD47NJMWiigvSpGhtyLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788659157; c=relaxed/simple;
	bh=iXIi5ivYwA3/PODZ7jihR8WiVsAVQCLsTVUWk7o3wFo=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=n30RO0p9RcFTJN60xo12FYY/ZHHxaQDscgjx3z1iis1XEF8ZhmxGQ9BdrlRJFM6OWudC8w6TjWSBnwuB6D4wgjCssDS07FZu+c+oV5u3I2BQIHEywBa36sDKCdPFKpBkxmRm7jN0RXS5LcyS9USuBy0qlD9QnAMfwiIBRSMYuLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bRoqUzcz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bRoqUzcz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CC231F0155A;
	Sun,  6 Sep 2026 01:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788659148;
	bh=v0XFtH9IENWoRrFdt3w7fuiznldTKGqF/Mu7B67yTtk=;
	h=Date:From:To:Cc:Subject:References;
	b=bRoqUzczdlBUkBAb2oAZuLslGz/Fe/KXZ1LBo6X4wfZpgTkf9Kzo45nYqeABzhh0I
	 D7W2tcFiIEifK8/cCrVG7FnDZuXL6vpJCdLsxRpWg2p5ggpVnap3m2iGXPsAaUxpb6
	 OotChhq25j+kDdaQumLmEIR4fCmZTvb+cCr5jpZeXZGkuGjDvfUJv9bjXlyppaFEY9
	 XrkG+U8TYPjmd7o0EmjRcbPgQf1UCUTQ3p6eyLx8SCIclmV5855JtxP+nQTk3lOtCK
	 KP49GVDJqwKW7DFa0qoT2fENWxHurTMDNNeSZAhAKPxwYPy8Z/CEzldzymyRYnYwIZ
	 SaSwsJiLBSLxg==
Received: from rostedt by gandalf with local (Exim 4.99.4)
	(envelope-from <rostedt@kernel.org>)
	id 1x31yC-00000006PSd-3vT9;
	Sat, 05 Sep 2026 21:46:56 -0400
Message-ID: <20260906014656.800567194@kernel.org>
User-Agent: quilt/0.69
Date: Sat, 05 Sep 2026 21:45:42 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vincent Donnefort <vdonnefort@google.com>
Subject: [for-linus][PATCH 11/12] tracing: Fix comment in tracing_buffers_splice_read()
References: <20260906014531.720267751@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

The comment about returning an error if the read fails on the first
iteration is slightly incorrect. It makes it sound like the only reason it
could fail on a later iteration is if the subbuf order changed. That is
incorrect, it could also fail if the length passed in was not a multiple
of the subbuf size. Fix the comment.

Link: https://lore.kernel.org/all/20260904143527.40e73d36@gandalf.local.home/
Link: https://patch.msgid.link/20260904144902.506862a1@gandalf.local.home
Fixes: dae8dda341d2 ("tracing: Fix subbuf resize races with trace_pipe_raw readers")
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/trace.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index b26c4c277ce5..8658cad53cb5 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -7296,11 +7296,13 @@ ssize_t tracing_buffers_splice_read(struct file *file, loff_t *ppos,
 			r = ring_buffer_read_page(ref->buffer, ref->rpage, len, iter->cpu_file, 1);
 		} else if (!i) {
 			/*
-			 * We failed to read because the length is too small
-			 * or unaligned. If this is the first iteration, it's
-			 * an invalid userspace input. Otherwise, this is due
-			 * to a subbuf order change. Do not report an error
-			 * and just finish the read.
+			 * If this fails to read on the first iteration, it
+			 * means the length was too small and an error should
+			 * be returned to user space. Otherwise, at least
+			 * one sub-buffer was successfully read but this failed
+			 * due to either the length was unaligned or the
+			 * subbuf order changed. Either case, do not report
+			 * an error.
 			 */
 			ret = -EINVAL;
 		}
-- 
2.53.0


