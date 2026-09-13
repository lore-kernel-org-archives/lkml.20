Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51664386C0A
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789319848; cv=none; b=I7CMp3GT/oU190A3XigVxtCx64J9qlsQ8Ym+mlVHGZ87ZL+Uj+ocw/Mvn907NA1CKmijKgPRA6ixtMWkrgpSaajvlIwd7FPsh+S0jDFEcSNUtkY/DxRCHCU4krZPVYkzv8QhWh360f18iywW4sSA4+CN4VHRBcQVQDh3KzUZxQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789319848; c=relaxed/simple;
	bh=MUjzs0JwgrAacduebmV4M1RxAHd/0cc3cjIxj/6R2kQ=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=NC8qJjLYni8pamNTh5TZUsp0kv7ixplPuofIZtXFlcwDNBqaHCY+umTZp5UnBEnnHE0orRal0RK9F4Q0EZZ1mMzamaqm0/OhyYdCgYMpdWMPKX3tySL+g9BrgYN+LsJkwwufRtTzf5YkcMblPZTdrFKs7qMyzEaVRHZA2IKsKx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DtdVdDye; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DtdVdDye"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 364DC1F0089B;
	Sun, 13 Sep 2026 17:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789319844;
	bh=b4nohpa6rw6Jtm0z0TblGaxx+Ubk55nsfmnZONif07o=;
	h=Date:From:To:Cc:Subject:References;
	b=DtdVdDyeM/+izgEEtPjtRaGuNjb7f6ysdebkfIbHu4cDxWqr0Wkle+qDEvXp655fP
	 t2NX3YOwMvm2GyUD4Y9mME7SUZZUnhEKUv4VTSG7I7CNDbTveV0ttV98kzPHJUXPFq
	 YJnRbFCxF3j/VdvdEjYCRqSMjza8M8qxZmBtUtpgbmjt0WNU7ewdrEFJaIXQhj/nia
	 NQQLfLZvtgQWXrXq3q77+R9zdn2rrLDWjmAT1M5kg1UIo90gbWMHFIKs4diRwysGpb
	 x79Hj7piBdM9Q52OqqRTFM470RUlM59BbtSrFVc+IXw1GHAvdp0K4/rJWHYeK635mI
	 NW7u8JBjgedjg==
Received: from rostedt by gandalf with local (Exim 4.99.4)
	(envelope-from <rostedt@kernel.org>)
	id 1x5nqs-0000000AQai-1IjW;
	Sun, 13 Sep 2026 13:18:50 -0400
Message-ID: <20260913171850.115977878@kernel.org>
User-Agent: quilt/0.69
Date: Sun, 13 Sep 2026 13:18:03 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vincent Donnefort <vdonnefort@google.com>
Subject: [for-linus][PATCH 4/5] tracing/remotes: Catch nr_page_va overflow in ring_buffer_desc sizing
References: <20260913171759.469375546@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Vincent Donnefort <vdonnefort@google.com>

The number of pages per remote ring buffer is capped by
ring_buffer_desc::nr_page_va (32 bits). A buffer_size large enough to
overflow that field would silently allocate a descriptor smaller than
what was asked for.

Return SIZE_MAX from trace_buffer_desc_size() on nr_page_va overflow.

Link: https://patch.msgid.link/20260911193937.602202-3-vdonnefort@google.com
Fixes: 2e67fabd8b77 ("ring-buffer: Introduce ring-buffer remotes")
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 include/linux/ring_buffer.h | 4 ++++
 kernel/trace/trace_remote.c | 6 +++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/linux/ring_buffer.h b/include/linux/ring_buffer.h
index 11bffb6a142d..eac3e9080c3c 100644
--- a/include/linux/ring_buffer.h
+++ b/include/linux/ring_buffer.h
@@ -295,6 +295,10 @@ static inline size_t trace_buffer_desc_size(size_t buffer_size, unsigned int nr_
 	unsigned long nr_pages = __calc_nr_pages_ring_buffer_desc(buffer_size);
 	struct ring_buffer_desc *rbdesc;
 
+	/* Capped by ring_buffer_desc::nr_page_va */
+	if (nr_pages > UINT_MAX)
+		return SIZE_MAX;
+
 	return size_add(offsetof(struct trace_buffer_desc, __data),
 			size_mul(nr_cpus, struct_size(rbdesc, page_va, nr_pages)));
 }
diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index c17902e42ef1..2d5bc423efca 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -980,9 +980,12 @@ int trace_remote_alloc_buffer(struct trace_buffer_desc *desc, size_t desc_size,
 			      const struct cpumask *cpumask)
 {
 	size_t min_desc_size = trace_buffer_desc_size(buffer_size, cpumask_weight(cpumask));
-	unsigned int nr_pages = __calc_nr_pages_ring_buffer_desc(buffer_size);
 	struct ring_buffer_desc *rb_desc;
 	int cpu, ret = -ENOMEM;
+	unsigned int nr_pages;
+
+	if (min_desc_size == SIZE_MAX)
+		return -E2BIG;
 
 	if (desc_size < min_desc_size)
 		return -EINVAL;
@@ -991,6 +994,7 @@ int trace_remote_alloc_buffer(struct trace_buffer_desc *desc, size_t desc_size,
 	desc->struct_len = min_desc_size;
 
 	rb_desc = __first_ring_buffer_desc(desc);
+	nr_pages = __calc_nr_pages_ring_buffer_desc(buffer_size);
 
 	for_each_cpu(cpu, cpumask) {
 		unsigned int id;
-- 
2.53.0
