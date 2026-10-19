Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792438427;
	b=VnS2rb+c+cZ8w+LLaCKJYtu6erMq4fHPSyOoN26gpYTPVllEPEpSiqZvbZaeYMdI8KR4
	 juQFsObjx1wky/lfazRbamh9ZEPD62OIG+pXYcsu6Hd6mzpAEDTBkOEuqhnul2EciDQcL
	 3g9u3hSM1nS21vkuGv3C4EEMwJQFTkwrmub8zv5ReXXwpODGUP5zQAloVV+sT2RBCj50C
	 Z8Y1D98MRPh8idgkUbmSVCm/gSV40pDLJxVKJqp5M5PhBWFHvUWv9SKX8hQZpO8lJUWpm
	 juwTW4ZVTIYP+Q2WM2vk3CBf9oY5+KworSHQYfM8KU5RuKgHB7bCHN2rMY8J6kIsa7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792438427;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=gAtViOdv37PLOUKX3chl6um0ADk8ZF0SeGet8qfmBLo=;
	b=kkW/8CiHnbzWf89tagrf/IAcqeEHSreXJUFkisMklogKt8sqGmNcxXSwWxnT18/+RcKm
	 PohQ+a7MikyQPrQ674OdYF9Y9tvuJTyFpujxOnZd3xr4tjPAdj2bWII1jgLsR9d0dQGCb
	 730uIwfBcoPIBwX9sMwpQXyepuw/yjhmiKEm7aIk2IB2t7gKviNV4lSgTnBDaKOaPIs22
	 Fvc/csMpJNWMnhLgGJDELPhQF2ksaTa6QSQ3ROnwPBZJXEWSzzuQidxYpKorXdRFHKy0r
	 0jTrGd9UQ0/WRLA8vX6eMKDhVtwgabXNT3QyYtRJ5j+6zXI9fapnNoXXf7i8Xbm/S4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A2LeYLmc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC92C606A320
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A2LeYLmc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8916A1F000C9;
	Mon, 19 Oct 2026 19:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792438426;
	bh=gAtViOdv37PLOUKX3chl6um0ADk8ZF0SeGet8qfmBLo=;
	h=Date:From:To:Cc:Subject:References;
	b=A2LeYLmcxxfKS1X5iysPLgVbs57SzRpl/s0D5O5dlnzwjZYO5MKYZsFUsZFlIVSKy
	 hGqsH4ir5d4yNywiP+KPx4wp4CZKCpHCMgZedvaahbA9BjWrQi1B9w0ksAuX+wuMia
	 8voJDfETEI++7PSOTxyUwEDsccio8JB9nnQX4kLA+JbeATXJwXyLq2H2cacMvroWo7
	 QKgzSZcDI/ntNjybcV68+hli6T+nRIcM1W+GTxgZeVxbhI1HNuKo4I6xBxaW1RxaFX
	 QYm/ytXfA64aGUz5C8h6azvH8VyMIG1CeCvwImf6zeVVzUnLkDJBFs6zq09uFrUWJe
	 Tf2tze9S2k8vg==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xIt7B-00000001egE-3pJQ;
	Mon, 19 Oct 2026 15:33:45 -0400
Message-ID: <20261019193345.715879178@kernel.org>
User-Agent: quilt/0.69
Date: Mon, 19 Oct 2026 15:33:34 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vincent Donnefort <vdonnefort@google.com>
Subject: [for-next][PATCH 4/5] ring-buffer: Remove unnecessary cpumask_test_cpu
References: <20261019193330.365764549@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Vincent Donnefort <vdonnefort@google.com>

for_each_buffer_cpu() already iterates over buffer->cpumask. Remove the
unnecessary cpumask_test_cpu() found in ring_buffer_subbuf_order_set().

Link: https://patch.msgid.link/20260916152813.105082-3-vdonnefort@google.com
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/ring_buffer.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 15e3b9938e0f..0068bd185945 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -7486,10 +7486,6 @@ int ring_buffer_subbuf_order_set(struct trace_buffer *buffer, int order)
 
 	/* Make sure all new buffers are allocated, before deleting the old ones */
 	for_each_buffer_cpu(buffer, cpu) {
-
-		if (!cpumask_test_cpu(cpu, buffer->cpumask))
-			continue;
-
 		cpu_buffer = buffer->buffers[cpu];
 
 		/* Update the number of pages to match the new size */
@@ -7516,9 +7512,6 @@ int ring_buffer_subbuf_order_set(struct trace_buffer *buffer, int order)
 		struct list_head old_pages;
 		unsigned long flags;
 
-		if (!cpumask_test_cpu(cpu, buffer->cpumask))
-			continue;
-
 		cpu_buffer = buffer->buffers[cpu];
 
 		raw_spin_lock_irqsave(&cpu_buffer->reader_lock, flags);
-- 
2.53.0
