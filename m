Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3FC52BE47
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071247; cv=none; b=uMT93aMm6IoC428uDlkMRMCA0PLkt6VYlfRYm7wva3i7gurajnj3wvCI3jXu/WdZJRICKVPQ6WMCFv0JfWElWkL18tITQ9fPCh2NRHY7mbU5S855XI8GJdEmU+r2AZnDx+yJFUZBBK1lisIlj/IrxSQLWvCWtNhmKCOrlg6wJkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071247; c=relaxed/simple;
	bh=TaOsUr2dpn0sQHypzahBAyc2BuPZjwXT+FJEInw4u/I=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=BObMhenmiETNvt/SsnMeIuf0vG/F5rh1XDFEqik48anApZ7qfmZdyKLWVKtryNJEtvVOR6qsT/C/4goEw0eiVgTYxboTQP7UuiG9uoUbPT+vOXCipGsqNWZc/vrtp7KLURMB/QyzFI3Seop9XCk8X/jF4axpY1BH7PRRtBWJfr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fXM+vZYO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fXM+vZYO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D811F000CD;
	Thu, 15 Oct 2026 13:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792071245;
	bh=TBMBrWbKc7RCkTp3j7de0FHJysWxpgVsRuC/VAu4rys=;
	h=Date:From:To:Cc:Subject:References;
	b=fXM+vZYOgWV/72KqgyeD6L2mch/Jej5YjMZ/kGM1O4OzgutRG0HfXuj3VuV7znQ8f
	 XjFNga+0VhBrLcFSeAFDzVc5GBO0Iinjot0oKMfonsU+7aFkZgmSJuQTzJmmu+rgA6
	 TY/mNNvHIrl5KtvNQTRujvWydqX9siTJ8Rjqsm9wkv/WBpJy70PA2rkRO4hJvILObZ
	 ZS/2ADFjLby1X2VaJrAQjLvlGNGoDXEZfK83raVNamLhDul+cTcMKPgoiGWOt64GY2
	 j1/AJy3rWgPi2eVQAIt+0Ofp2xB5NunM7P4EoB7zOcNfSzEc4KQLL3DVvaPOIQMBh/
	 2CJ2CrboBtL4g==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xHLau-00000000MhF-3vTo;
	Thu, 15 Oct 2026 09:34:04 -0400
Message-ID: <20261015133404.751345301@kernel.org>
User-Agent: quilt/0.69
Date: Thu, 15 Oct 2026 09:33:24 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vincent Donnefort <vdonnefort@google.com>
Subject: [for-linus][PATCH 14/16] ring-buffer: Skip si_mem_available() for persistent and remote
 buffers
References: <20261015133310.731003448@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Vincent Donnefort <vdonnefort@google.com>

Persistent and remote buffer memory is pre-allocated by the time
__rb_allocate_pages() is called. Skip si_mem_available() to avoid
wrongly failing the allocation under memory pressure.

For the same reason, unset user_thread.

Link: https://patch.msgid.link/20261013102047.1488347-2-vdonnefort@google.com
Fixes: be68d63a139b ("ring-buffer: Add ring_buffer_alloc_range()")
Fixes: 2e67fabd8b77 ("ring-buffer: Introduce ring-buffer remotes")
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/ring_buffer.c | 41 +++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index e2b721d0707f..cbf67183c2e7 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -2445,20 +2445,30 @@ static int __rb_allocate_pages(struct ring_buffer_per_cpu *cpu_buffer,
 	struct trace_buffer *buffer = cpu_buffer->buffer;
 	struct ring_buffer_cpu_meta *meta = NULL;
 	struct buffer_page *bpage, *tmp;
-	bool user_thread = current->mm != NULL;
 	struct ring_buffer_desc *desc = NULL;
+	bool user_thread = false;
 	long i;
 
-	/*
-	 * Check if the available memory is there first.
-	 * Note, si_mem_available() only gives us a rough estimate of available
-	 * memory. It may not be accurate. But we don't care, we just want
-	 * to prevent doing any allocation when it is obvious that it is
-	 * not going to succeed.
-	 */
-	i = si_mem_available();
-	if (i < nr_pages)
-		return -ENOMEM;
+	if (buffer->range_addr_start) {
+		meta = rb_range_meta(buffer, nr_pages, cpu_buffer->cpu);
+	} else if (buffer->remote) {
+		desc = ring_buffer_desc(buffer->remote->desc, cpu_buffer->cpu);
+		if (!desc || WARN_ON(desc->nr_page_va != (nr_pages + 1)))
+			return -EINVAL;
+	} else {
+		/*
+		 * Check if the available memory is there first.
+		 * Note, si_mem_available() only gives us a rough estimate of available
+		 * memory. It may not be accurate. But we don't care, we just want
+		 * to prevent doing any allocation when it is obvious that it is
+		 * not going to succeed.
+		 */
+		i = si_mem_available();
+		if (i < nr_pages)
+			return -ENOMEM;
+
+		user_thread = current->mm != NULL;
+	}
 
 	/*
 	 * If a user thread allocates too much, and si_mem_available()
@@ -2472,15 +2482,6 @@ static int __rb_allocate_pages(struct ring_buffer_per_cpu *cpu_buffer,
 	if (user_thread)
 		set_current_oom_origin();
 
-	if (buffer->range_addr_start)
-		meta = rb_range_meta(buffer, nr_pages, cpu_buffer->cpu);
-
-	if (buffer->remote) {
-		desc = ring_buffer_desc(buffer->remote->desc, cpu_buffer->cpu);
-		if (!desc || WARN_ON(desc->nr_page_va != (nr_pages + 1)))
-			return -EINVAL;
-	}
-
 	for (i = 0; i < nr_pages; i++) {
 
 		bpage = alloc_cpu_page(cpu_buffer->cpu);
-- 
2.53.0
