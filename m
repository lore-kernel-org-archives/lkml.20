Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988477;
	b=iyKHWgmtgGSC1/srqkkxguFPRTZpA4dDAyrcACKZQCZ0K40tMiZouZlqd9KdhEPmGnD3
	 5BrFVNGg/5YYHetOiv/bpmE8ebbbJ8kSNLR5m5+qnr6eAmytA7V6gZRIewdhY+B5R6Gcs
	 l62RyLLVy5zn6wUeRl+i81XPFpXF4pdY4Yj5ZvBCPEh75L4+09F9+AA60c73t7cqHa9Wa
	 O64MeCSz4p0k3AYUJeOhrJxm7+3SrkClH8SO/1CePDlzHfmpdlPZgRBsMeMIyFxJG2pFZ
	 5H7CYXlByBUA9yfycajaLkzFf5v7AwZcDv5rNTJ0yXF3WURN42ZwGNiZ0ToBhJYi3lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Mq52+ZwR7eTTvIHBXK4H6B5GMCr9hytQ2mtezFLcHK0=;
	b=LJy7YdYN/PPn1ta/5pNlPQcDoAMDSG3ZW9WmaRZ01VkGQHRu5jGG9B0j14OgQUTVvm0J
	 CdWyF4EDYnENXWV+kZdjuRnXa/2EYMiPG6xXm6/dBJeYk2WPyfRqIIEpSCiUpABwyHvJg
	 XUTfmOYH4lQQjLqFK7rch1/HJJpbGHtREUwHcbXm8tUnG2igXghFuiYaxi9ow5yo3+dR9
	 CsIXWkGpL2NF1eXQKzfGCM/GDTG9Amo/EO+pr1UAcX49K0rjcNozRO/61bjHQq5m3aaA0
	 ZOpQLiGX+8PjKDB8YQt0YPVku+IydUPjKvTM4Wx9YLGAPAWh7Q6v0uqDwTXL8BzkKoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MPW0ndTN;
	arc=none smtp.remote-ip=209.85.221.71
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D57E606EE95
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D57E606EE95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MPW0ndTN
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48c6a1d4034so926970f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793988476; x=1794593276; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mq52+ZwR7eTTvIHBXK4H6B5GMCr9hytQ2mtezFLcHK0=;
        b=MPW0ndTNFtW7mh4pS9wjy6KqOYPtoSdJcYciPeUOUFUXdPtd2Nu6KTkiwJVmkqt4+a
         UJ7nRUEblhprRa5FwXeMzbg1QYkTNoDa6M2+AC3QBXQQBchL1a8LQ0LScrxE6/IiUJb6
         Jf3UVDKmWY7/7CBAonOFcJ2i1HUKT8Ff9qlEnCmQoxi5mHZU4adLaS4glIheO/YdGkEF
         CD5vytf5aqPYvyCIsP+kpWyVMipg8RWCk4XfXyHwUDuQD9OZCJUC+1jwuF91kVidqQLD
         OwPvxt76aWrPM6tLu0TnVe74J8uAxPLDfW8tVoW8Fu9C/VBwV+LQndFWSIj0/LUwNiCL
         NAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988476; x=1794593276;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mq52+ZwR7eTTvIHBXK4H6B5GMCr9hytQ2mtezFLcHK0=;
        b=oX66gm+OsOgQgm0tvwpD8xA2aFY5yTuTwjLezq8B/ANAD6xnH7+NYAeEFbDhE9E0Cp
         P+rtUdr6StyQCkX0UdhfadCEbXwBSvoucMRG/Y1oeLzlkedDZXY5I/lP6XzMe38Zjza0
         22NoDQdx0azk10nhniEr336e6Z/fC/QWFWrfq5TqbDFn0+jLdZYz/B1JcjsAzjH60BKl
         n+tJ77jZA5/v0HC+hPUtoRN8p/XxQrJB4thVOJlxs7kIUR+vZ23syPI1OZ9Mx5Aokbfs
         iZKO50dPKKF5w1tOPJReuV9MmkWO5y2mOVOWcCpuHTOS5Lhlx9DY1M/ROmwW2yzGxOZm
         bZAg==
X-Forwarded-Encrypted: i=1; AL+hErE7pAAGuzLhf54vprL80nPItpt6K4MaE7NST19+SMso2UOLbYFOseUOrLVV3S9JAVopQtoa5HEniobgcig=@vger.kernel.org
X-Gm-Message-State: APuU4Z++1cgpZSRE3f3CyPs+qkQ2M+rsW3NnRoK+fCvvH7hIqfeeNe/m
	juTVIJDmllAzG7kFYagB30/7LuEAaIBN0ApgdgCr4JraeyJLCU1iXT2n4wm1GQ2BkzGEsFB2HU0
	tgoZy1A65fOkxtfPif32rig==
X-Received: from wrwf7.prod.google.com ([2002:a5d:6647:0:b0:48e:d9d:8364])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:22c1:b0:48d:fbdd:4132 with SMTP id ffacd0b85a97d-492760dbbe7mr7141638f8f.18.1793988475275;
 Fri, 06 Nov 2026 10:07:55 -0800 (PST)
Date: Fri,  6 Nov 2026 18:06:47 +0000
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
Message-ID: <20261106180657.2460376-12-vdonnefort@google.com>
Subject: [PATCH v8 11/21] ring-buffer: Use irqsave for the reader lock in ring_buffer_poll_remote
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Calling rb_wakeups with the reader lock held but interrupts enabled can
lead to a deadlock: the irq_work might run on the same CPU, but will
block when acquiring that very same reader spinlock.

First, rb_wakeups does not even need to be called under the reader lock.
Move the function outside of the reader lock scope.

Second, the reader lock must be acquired with IRQs disabled anyway. Use
the irqsave variant of the spinlock.

Fixes: 2e67fabd8b77 ("ring-buffer: Introduce ring-buffer remotes")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260602171146.2238998-1-vdonnefort%40google.com # patch 8
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/ring_buffer.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 1fd28a72e6ee..4dab77883bd5 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -6902,13 +6902,17 @@ int ring_buffer_poll_remote(struct trace_buffer *buffer, int cpu)
 	struct ring_buffer_per_cpu *cpu_buffer;
 
 	if (cpu != RING_BUFFER_ALL_CPUS) {
+		bool wakeup;
+
 		if (!cpumask_test_cpu(cpu, buffer->cpumask))
 			return -EINVAL;
 
 		cpu_buffer = buffer->buffers[cpu];
 
-		guard(raw_spinlock)(&cpu_buffer->reader_lock);
-		if (rb_read_remote_meta_page(cpu_buffer))
+		scoped_guard(raw_spinlock_irqsave, &cpu_buffer->reader_lock)
+			wakeup = rb_read_remote_meta_page(cpu_buffer);
+
+		if (wakeup)
 			rb_wakeups(buffer, cpu_buffer);
 
 		return 0;
@@ -6923,7 +6927,7 @@ int ring_buffer_poll_remote(struct trace_buffer *buffer, int cpu)
 	for_each_buffer_cpu(buffer, cpu) {
 		cpu_buffer = buffer->buffers[cpu];
 
-		guard(raw_spinlock)(&cpu_buffer->reader_lock);
+		guard(raw_spinlock_irqsave)(&cpu_buffer->reader_lock);
 		rb_read_remote_meta_page(cpu_buffer);
 	}
 
-- 
2.56.0.455.g6c5a503b38-goog

