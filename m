Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29E2345ED4
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 01:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788659053; cv=none; b=e/43Oksw/8NqBKg+1Te7TxvxKuaNMnt62tcc235pSz8vpVJGJ9bzjB/UnG2L3vZ/aXSkPTBonDpxNcyLkL5ECCJJTaKmXPfcYH+JJLrTNHIJWJRsUDguuttE6NCxRSVTDiMSzOPlCAL90Rbx6BCo2co3BNom8tIuQUVS0sEgSnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788659053; c=relaxed/simple;
	bh=iXIi5ivYwA3/PODZ7jihR8WiVsAVQCLsTVUWk7o3wFo=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=kdDbBZUZsU/2xmRImnNV9qaKRjNYnAR2YqupuiE2G0gwNqrqV+Cs6yvnikwkgARFnZBmppzCLK/VIv0uk1p30qs1jJalVF7WGsmQD4aPlC8dO0QhCfW9XSkCC3xfkHJ+PmeSRxFZFzISeqgwL9IfhOH26aUQUuWYPTjxHqxk4GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=doHGs+ij; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="doHGs+ij"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87EC31F00A3A;
	Sun,  6 Sep 2026 01:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788659052;
	bh=v0XFtH9IENWoRrFdt3w7fuiznldTKGqF/Mu7B67yTtk=;
	h=Date:From:To:Cc:Subject:References;
	b=doHGs+ijAVviDQeGtaZSfAfqalwXsZY5nOXfnIcFyQafdBNs5zRKplRb4AlYOOx3F
	 o1BXBbQRI7pC3TugkIRVYFkdZH/ee1xukvaC9yImMeHA7jak+TJL93OWyxUq+b54Bf
	 mor0pd6AWViUSPxwOG4HYH6mZP5LQf3K1UuTciBwU1J4xVz7QB7joIPWoBk9fX9O53
	 ZCJ9LRvxoo4jDXSgiafKBOas5Rhhp3PCm/Z93agUkRHFcmHzYqKagKB0WHzYG2OEmO
	 1hSgwbMeRbrDSsk/SWDf9/c7oBgNbk2bg0yHBby+pcm3k7zwgJjJWIEn3ONIh2uBjZ
	 yOaW21TJPxfEw==
Received: from rostedt by gandalf with local (Exim 4.99.4)
	(envelope-from <rostedt@kernel.org>)
	id 1x2whQ-00000006JDg-2Zva;
	Sat, 05 Sep 2026 16:09:16 -0400
Message-ID: <20260905200916.480703068@kernel.org>
User-Agent: quilt/0.69
Date: Sat, 05 Sep 2026 16:08:38 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vincent Donnefort <vdonnefort@google.com>
Subject: [for-linus][PATCH 11/12] tracing: Fix comment in tracing_buffers_splice_read()
References: <20260905200827.773347757@kernel.org>
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


