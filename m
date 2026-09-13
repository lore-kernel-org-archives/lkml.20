Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6A138333F
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789319849; cv=none; b=ttuQ7pghPcP+q6JLeWHPAc4MOev0iJt8XKaN47guKvHuwk0LK20xFL+8+ApiBqDd/MYMdTF0b8rtwDjkIbeZMrwOivrphaAS1T4Jv3Wx7/XXHw08wfbSJ+l++g/SyYgtssfkBLKgvoYDv+XHPkvp9kMkxOHFs8GelnDj3KYEgAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789319849; c=relaxed/simple;
	bh=shyFsPe6/+8qpbPdileocoW4dxnfkSl2KYeEpR/6IUs=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=DNuTuencmwAki7SwSaGAZkXW29guZJYZj5e64WdHtvKlyHpRLXwRo7/atulUHpGRRkd2CQ17vrNsur3p6JtS3idCXXnj5ibfJe9j/71EReYrrqao8YsZeIctGlYuj4HKcC2MsNu+7VYyGKfYrzpdFDzZQThnac3ZVIGWzINwDW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nJCzminw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nJCzminw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D9701F00899;
	Sun, 13 Sep 2026 17:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789319844;
	bh=rjxp0fEObwYxGRblo6C9NEX7rlxIdttxKlcZc1d/Dps=;
	h=Date:From:To:Cc:Subject:References;
	b=nJCzminwRh4mI57BQ+FvqEb+9enEcIy5Ml9ZLp587+OyANiN2VnoI3sB0apL+nf3C
	 Pg/GnkgX6raGgsiVCWWrQFHPcNNVyLz2CU9XBmSltaGqr3tqaDD3HcCzVURKACdlQo
	 K5QSnJklKMiYsJskX4itEDr9xmP2w9pZHcl53eFVt9QraHc4KVCPOQnZEJ5nBue1Zu
	 7+s7iOlzixqNWbfmWWHUpQKgNBfhdN+rqj3mR46M50e/apQisBXffcGmdiqUYcFJ/3
	 NgYugUF1XrDQ4e4YzEJfsqtqHcxQt05Nbh2lLL0Q44Vu0FttcY0voToDGprTLhD8H6
	 B5+hYfs2zrJmg==
Received: from rostedt by gandalf with local (Exim 4.99.4)
	(envelope-from <rostedt@kernel.org>)
	id 1x5nqs-0000000AQaA-0Ogv;
	Sun, 13 Sep 2026 13:18:50 -0400
Message-ID: <20260913171849.896180781@kernel.org>
User-Agent: quilt/0.69
Date: Sun, 13 Sep 2026 13:18:02 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vincent Donnefort <vdonnefort@google.com>
Subject: [for-linus][PATCH 3/5] tracing/remotes: Account for ring buffer page header in size
 calculation
References: <20260913171759.469375546@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Vincent Donnefort <vdonnefort@google.com>

trace_buffer_desc_size() and trace_remote_alloc_buffer() undercount the
required pages because every ring buffer page contains a header
(BUF_PAGE_HDR_SIZE). Account for that header to ensure allocated remote
ring buffers aren't smaller than requested by the user.

The newly introduced helper __calc_nr_pages_ring_buffer_desc() can
return a value that overflows the descriptor nr_pages field (32 bits).

Link: https://patch.msgid.link/20260911193937.602202-2-vdonnefort@google.com
Fixes: 2e67fabd8b77 ("ring-buffer: Introduce ring-buffer remotes")
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 include/linux/ring_buffer.h | 15 +++++++++++++--
 kernel/trace/trace_remote.c |  2 +-
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/include/linux/ring_buffer.h b/include/linux/ring_buffer.h
index afc7daa6ee7d..11bffb6a142d 100644
--- a/include/linux/ring_buffer.h
+++ b/include/linux/ring_buffer.h
@@ -3,8 +3,9 @@
 #define _LINUX_RING_BUFFER_H
 
 #include <linux/mm.h>
-#include <linux/seq_file.h>
 #include <linux/poll.h>
+#include <linux/ring_buffer_types.h>
+#include <linux/seq_file.h>
 
 #include <uapi/linux/trace_mmap.h>
 
@@ -279,9 +280,19 @@ static inline struct ring_buffer_desc *__first_ring_buffer_desc(struct trace_buf
 	return (struct ring_buffer_desc *)(&desc->__data[0]);
 }
 
+/*
+ * Returns the number of pages for a ring_buffer_desc. The caller must ensure it
+ * does not overflow ring_buffer_desc::nr_page_va.
+ */
+static inline unsigned long __calc_nr_pages_ring_buffer_desc(size_t size)
+{
+	/* Takes into account the reader page */
+	return max(DIV_ROUND_UP(size, PAGE_SIZE - BUF_PAGE_HDR_SIZE), 2UL) + 1;
+}
+
 static inline size_t trace_buffer_desc_size(size_t buffer_size, unsigned int nr_cpus)
 {
-	unsigned int nr_pages = max(DIV_ROUND_UP(buffer_size, PAGE_SIZE), 2UL) + 1;
+	unsigned long nr_pages = __calc_nr_pages_ring_buffer_desc(buffer_size);
 	struct ring_buffer_desc *rbdesc;
 
 	return size_add(offsetof(struct trace_buffer_desc, __data),
diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index 75fa1ffc4c96..c17902e42ef1 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -980,7 +980,7 @@ int trace_remote_alloc_buffer(struct trace_buffer_desc *desc, size_t desc_size,
 			      const struct cpumask *cpumask)
 {
 	size_t min_desc_size = trace_buffer_desc_size(buffer_size, cpumask_weight(cpumask));
-	unsigned int nr_pages = max(DIV_ROUND_UP(buffer_size, PAGE_SIZE), 2UL) + 1;
+	unsigned int nr_pages = __calc_nr_pages_ring_buffer_desc(buffer_size);
 	struct ring_buffer_desc *rb_desc;
 	int cpu, ret = -ENOMEM;
 
-- 
2.53.0
