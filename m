Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988481;
	b=2I6j9X1fccw8TNWMwNUegwE3U1QWbyvpQFR5T0/WePP1oOuGS5frZPXx5mW+HCuL2ijt
	 /Iyvni+IfAiXaJLTJRtd8dH8h0RCcQy4kOG2L/ZCLILxEupfbs1uA5/bEJ70coyeDjYfL
	 0cXX8Aprz4ZIVmUyydvxKp6cPfliqn/ybt0Kwplcr/wr7zv9kAxGncFUj7IouumgoM0do
	 opLSPgrOBdN7fhhzj8FmJiDGj+pU8AYDouiwQCC3x7J/kvaYJ4A6jOZ2oZVugCyr7YrTn
	 3QVLGQggqjUzbuYy292R+RiLgrHKq1NWTuob0E7+XnXTPkXH2DvgVkuiM6JuhLopR1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=EIEtPuBp8yGj/o3XjSC3UWWuxltU58Pi1nP2zq/NhpA=;
	b=XTiZDY+eWKNhBntxnaxobZMxFMfu+CDoblCUMiRpmyofoBd7iCzVMdlHlVTBii6hvsoA
	 gtM54RZOgNHFXUajOdFRCzLClNQ4Ny8hrfv6i0JWSvbjyAgKA+0pBmgzj71tkTchChxfx
	 LAEVVj+OLmhmGRe/oxTBdMMhUW1KEgpOcNp6ZAvwwH75CLb8Bd7atYQ3Me+z4NUkLLTF2
	 qwVVdWAlSO4WrA/2hf5YUi8qc8ZIAx/CgKgZuZcJw0BD23zvovt4SHs9HgMIRoZ3uleCP
	 iYvSqn4CEO2JZSogW1njtiBBnQ6VTgtjANtcS4t3DR7kDCXt6UoJih0Qh1IV0bGI2AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ohQlzThz;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122A26082BD8
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:08:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 122A26082BD8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ohQlzThz
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a1fa972b4fso5679275e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793988479; x=1794593279; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EIEtPuBp8yGj/o3XjSC3UWWuxltU58Pi1nP2zq/NhpA=;
        b=ohQlzThzZlPtFpaHeHTo25spt3JoTwtQ7HqzmfzQlsWnANBZgLC7rb/YLL37ow8auq
         tzhtivt2NdEiJ56U0RGSogdRMHA3WRwdH7C3kHOngHlGIzjl2PgPUL7skKFUIrXX29Gt
         DK0iiJNgobkWrR1NSjANEURL9YTqS8U/ijfN4C+gAgLwvmnLp6tZ02KdzC1sebZtgu2i
         c+KGxhBJYDyDT7G+75sbP/zDciWl8rs+t/XNVRiLvYmhhGrcIKsN0xjaS3hGpvfMymlq
         pni+qHPywwpVVP2mAZohwT5MTvncbJAWzXH5eNDSofGo8n5w8y63kvin0dA6qTxTw2pv
         XcPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988479; x=1794593279;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EIEtPuBp8yGj/o3XjSC3UWWuxltU58Pi1nP2zq/NhpA=;
        b=gwLQjEGZkeQviHTaldnha013wYMbYfKwFryKo9fSVoTRQMzJ6WKYJefaQgrnO1sEM2
         WJNxNONuB8vFOkiIpPbyJDm2FZonmHKz8CDi1FGOo8zjLCtiBqpj4vOy2XVZ3Ttyt/uA
         9EbGMT1GEQC2fwrjDsPR+Z11w27UQI5eqqLLu09utUDvF3Kr3il8c57IA4qnwspXfOoK
         KSEfnpenWgCXkjoIbPIYJ8LT9Y0Y9oNaANIWExOxgHAGmBIWNk/mFZdFH5aq59l/85zH
         uVOiNr2GP1cpL1TfYc+sEAYVKVPt6GejOCNjUVzK4j2xnis1Zbo4elBVfzZSjgLUixiQ
         6yNg==
X-Forwarded-Encrypted: i=1; AKwUvBzgQLH6uoZng1trpWJ8HM1sVL8dEec/ib4PANMuvSIDIG8Erq+onXcAXkXPPF63mcZxzzC5z9CnQ5qVALg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/10FGCmb43rViXUFiOSe5MR4lmBqy4ARQBhaBRfgHsVc8cT/fh
	V1ZyOa9A6pPxE54P/fUL6RjEL1MCdi7dwXJaNQW3Wz/LnM6qBJ32uqVzqBkKMEkvCPG+S+Xr2ZC
	hU44EidfjToHk48+03pXFfA==
X-Received: from wrny9.prod.google.com ([2002:adf:ee09:0:b0:48b:9d:e37d])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f4c:b0:4a3:12fb:1ef1 with SMTP id 5b1f17b1804b1-4b6df9bf612mr67318185e9.29.1793988479220;
 Fri, 06 Nov 2026 10:07:59 -0800 (PST)
Date: Fri,  6 Nov 2026 18:06:50 +0000
In-Reply-To: <20261106180657.2460376-1-vdonnefort@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261106180657.2460376-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106180657.2460376-15-vdonnefort@google.com>
Subject: [PATCH v8 14/21] ring-buffer: Add kerneldoc for ring_buffer_poll_remote
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Document ring_buffer_poll_remote().

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/ring_buffer.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 9c707cb751ba..82f0a4654c95 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -6910,6 +6910,17 @@ bool ring_buffer_empty_cpu(struct trace_buffer *buffer, int cpu)
 }
 EXPORT_SYMBOL_GPL(ring_buffer_empty_cpu);
 
+/**
+ * ring_buffer_poll_remote - poll a remote ring buffer for new data
+ * @buffer: The ring buffer
+ * @cpu: The CPU buffer to poll (or RING_BUFFER_ALL_CPUS)
+ *
+ * This function polls the specified remote CPU buffer (or all of them)
+ * by reading its meta page to update the local reader's view. If new
+ * entries are detected, it triggers wakeups for any waiting readers.
+ * Returns:
+ *  0 on success, or -EINVAL if the CPU is not in the buffer's cpumask.
+ */
 int ring_buffer_poll_remote(struct trace_buffer *buffer, int cpu)
 {
 	struct ring_buffer_per_cpu *cpu_buffer;
-- 
2.56.0.455.g6c5a503b38-goog

