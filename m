Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB944B203D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886945; cv=none; b=Y3ZD3Ga3Fc5YPelOeruh/fi12wxVgyzTNIobcocDJuBVvFKJtvK4lch19ivqvtfv/W15O2bPR02FE2Ocj9Hlismf21T7idB03uoShiN0qLq1I1Tx958meBkIsQuNeiRNgA9FJTUKwFg3GLknNijKtTybQE/8TghuF5k29pUWSOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886945; c=relaxed/simple;
	bh=N1Xc7iRJCL8xK52U3E2xf+99h/Nvqa1jFoAcp8xf1KQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=C5CjvL4TyZQmr0RM/H4WwvwR8AvJU4L+of4aTRY4WwUrFaFQrSFqq+/PDdgNtsUMzhJ0P3LI7JxtyoTBu8qdt/KfnhbrnMfo+OWMgF/AefAJCU/p/nDEQnS0VVNMrwV3LcyyUjObHpxp0adiFwV8kyLqPx5Au+npqgu9q2J/aHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CeUZZpSH; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CeUZZpSH"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a17574b5easo21622925e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791886943; x=1792491743; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lzZOzCHmRQkt/K2BSsAPDeJWnc3SgPPj3hLhIMFZqEM=;
        b=CeUZZpSHMGfISlNjxOFdpAmxrYyULAB6hEiXbhwKz0gtYhG2ND75f5cVop+8Rhi6B1
         D2F06B8T/kqWgXFY6pUmDXIWMYJa8hdxb2rXz3xwLj4XPEgaAXm6IqGlrBUVmgs6JzWW
         UEcLY2raP73SN6daKnN5ad43Ik+/k217EuL4ioVTFgS+IVPZLO1PFshLr7D/tTFPre8R
         d0ar7g4UM/6+xZMldrIcfrng/nT9ITMxL0ICOYXFlnY1q+Rpa6wMVffsofuE4Xh78rEV
         ygPrFQFUJ4TzZTQUxQh91BA/xwBz2B/mse1RFH93fYy4+nWrZE+YIPpMqH3EKltSi2Vy
         6gQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886943; x=1792491743;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lzZOzCHmRQkt/K2BSsAPDeJWnc3SgPPj3hLhIMFZqEM=;
        b=uloX4O/ctF6NMtF9uezJvCu3YhCjNKfdUCTS10zBf6bM3zgCWEmJKkHfP/JtPl+LtA
         QNfYcU9jpY9IXuZ/YCW2K2XTe91bop8oEwcWAyRERA8LiycAvLvpTqyWucTlRXNDyv+h
         rzt8OE89c9+ex2Tb2G+g+M6az3dHejPBrppuQU/evHHdAiamtbQ7cLW5/LCR3NPm+GBr
         4onK5iXSbm5rbNpOKSAtIyeNNsBQ+Q/RbjmG3Wb7OagRp+y/Bz7b9hv8w8Q6pggEsmTx
         zjBQ1crnmi5C55pqSq+fiwuOYgwEuxk+87c8Jl3N/unSvAlR1eq0o73S+STZ3KpuIhPA
         OGjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxSttcs9zlr1f0J0nBgZuR5yiHJtfhR4xkWPNypx7guYhxLrbInw/SOH2rYB1FLGkyv+5/uV13r/l3nFLA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4e++1Ynvc83ERPcy3r4tvZMj6K5jrOcT07A8/eOPOY/FCLUff
	1BKjEdebJXqg6OMQVB0VSAOinwqICFEE+DcZm/K1foFPpzjAl/XZCK1pWBVEDpywNjqeevPd2Uy
	5n4N/dbqu1HWosZl6eSyivg==
X-Received: from wrth8.prod.google.com ([2002:a5d:5048:0:b0:485:97bb:77ba])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:821a:b0:4a1:74a1:7ecc with SMTP id 5b1f17b1804b1-4a18e446ef5mr197195765e9.1.1791886942488;
 Tue, 13 Oct 2026 03:22:22 -0700 (PDT)
Date: Tue, 13 Oct 2026 11:20:47 +0100
In-Reply-To: <20261013102047.1488347-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261013102047.1488347-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013102047.1488347-3-vdonnefort@google.com>
Subject: [PATCH v2 2/2] ring-buffer: Use subbuf_order in available memory estimation
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

To avoid failing in the middle of an allocation of a ring-buffer,
__rb_allocate_pages() looks at the available memory estimation with
si_mem_available(). Use the subbuffer order with this estimation to fail
early if necessary for ring-buffers with an order > 0.

Fixes: f9b94daa542a ("ring-buffer: Set new size of the ring buffer sub page")
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/ring_buffer.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index b3a30a0413a5..63001ab1eef2 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -2440,6 +2440,7 @@ static int __rb_allocate_pages(struct ring_buffer_per_cpu *cpu_buffer,
 			       unsigned long nr_pages, struct list_head *pages)
 {
 	struct trace_buffer *buffer = cpu_buffer->buffer;
+	unsigned int subbuf_order = buffer->subbuf_order;
 	struct ring_buffer_cpu_meta *meta = NULL;
 	struct buffer_page *bpage, *tmp;
 	struct ring_buffer_desc *desc = NULL;
@@ -2461,7 +2462,7 @@ static int __rb_allocate_pages(struct ring_buffer_per_cpu *cpu_buffer,
 		 * not going to succeed.
 		 */
 		i = si_mem_available();
-		if (i < nr_pages)
+		if (i < (nr_pages << subbuf_order))
 			return -ENOMEM;
 
 		user_thread = current->mm != NULL;
@@ -2514,12 +2515,11 @@ static int __rb_allocate_pages(struct ring_buffer_per_cpu *cpu_buffer,
 			bpage->id = i + 1;
 			cpu_buffer->subbuf_ids[i + 1] = bpage;
 		} else {
-			bpage->page = alloc_cpu_data(cpu_buffer->cpu,
-						     cpu_buffer->buffer->subbuf_order);
+			bpage->page = alloc_cpu_data(cpu_buffer->cpu, subbuf_order);
 			if (!bpage->page)
 				goto free_pages;
 		}
-		bpage->order = cpu_buffer->buffer->subbuf_order;
+		bpage->order = subbuf_order;
 
 		if (user_thread && fatal_signal_pending(current))
 			goto free_pages;
-- 
2.56.0.385.gd3acb90ef8-goog

