Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492893;
	b=bOuXY4wmJfY4IcVjzSuMsPocr/gIH9O5xqDvixB5kUAeGF3ivQGblNV+FDwfdPxTNWyJ
	 JoJrHSDiXVdFB0GbgUGnbtAFb/pdMPk4+rOlC+91LkiriBhJYyCQSUbUQ4Z6K2Yu283Ci
	 KP00f3qJVRzddz/WqUbp6ueIOmQ6cUJAxREwbODOA16OnvMmPeLB2BZ/DQzH81L0s87fk
	 hb0Y9yNZCtvlGxA9ZAQ3pUGfWJk80xG0AnvI0acbDXo1o6+af54oFgLQ549/n8KRYdzgX
	 fLlMyqyLZFT2vg3B8TKFP4joWOGBpzOJAxKY3JiUvKK9rnKj+Mwg62aHM5ZZnVFxDcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=2NgZMcm3YV115P090O2Igc1vnRf4lJME9jTWUl8BAcE=;
	b=zFM+ezpU6eByvpaXm6KYEYrwlxobRluGOK+/sylGjyUZBRO5nZc2wNfIL/z2fyaIpXsG
	 crKq854yVep6N/30M/QmJOWINLdM0/ml6ufZsv1y5a3d5p2N9crQN1j0pH0eTsrX56Qf3
	 hFOlPjjDZH4TH2axLCNE6zUHweLLKy2XKSZ2cNFZynPUORV9SmXY4pOc7eTzuO+SrnyUx
	 Yd40/ftvK+XvmB9UyJvOvZ/qsJyI4V2Y/hCLy7ExGKKsTy+8SFtWWzSMRh9DhcsM23j83
	 P3rJ3k3zLGYvIoMdTxmdLE3n/ZaQJiaMd2eJCU3+AeE2pmdOhKa+Se815HxDzOm9fPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CFGycgj1;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DAE606A881
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24DAE606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CFGycgj1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4b0a307487aso21027165e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794492891; x=1795097691; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2NgZMcm3YV115P090O2Igc1vnRf4lJME9jTWUl8BAcE=;
        b=CFGycgj1IlceAOceUkm/uCnMak8xVjCBECi5ig8nzuIpJ7Kxg89dym7GLamo3sQQjE
         kXWv8IDd71nqlZLChW0eAlRYbJxki+9XPscO7c2v5fhO90L/zU86OcTWO/k4KOSNwvgC
         9YXmYS1OUsjA4x0Ikj7SOigocjL2kuZ2piXI2QFDqia7fo8/h/6XOjgQYCFmWfXxPXz/
         AlCFmCOg9lDkcpSdMZrh8tFvCZoNjBxyrpOcaBTXOQKDvNfOSyut9IcXcG2zDSauHeIY
         QH2IpPjt0+kzIeZNZV6tiUhq4MUZYq4XQ1B+jQcaOVYPHAEyflqIveT/3p7/5/VFmXx0
         PDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794492891; x=1795097691;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2NgZMcm3YV115P090O2Igc1vnRf4lJME9jTWUl8BAcE=;
        b=jTzl6QN3FQr3EzbC6ITYhuzB6o7hSxR5cPqupRvcSVfuqm0VUo5YKxp5lfL1nulis4
         bkSQCXL2evS7ZlVrrEpfpm8Zsqd0COc3xxM6P5r4urQs+ZNOKCKQtxA9Wooxjkmv0J7G
         F8sxW2r9cfJVTv6XuOA7U32HOxKH3soAnPJcwIGkE0nzFZXBaBMyFg/fLLKXqQFzob4m
         pnlj1sdNMvn6Sy27PVt1B7eq2VmvT1ic3D17d8LuJBtFmUtQft/YEaTF334BpIpDjUQ5
         /2DX0wXkgMrB9brxnQd78ZzRNCEysAhOHAOR/AsEe22PZKSCp6JRKfIyerc8DUq73+qf
         gVwg==
X-Forwarded-Encrypted: i=1; AL+hErFSYXbU6kf0Ud4VetUHfX79SfCb9vbntTVlEgz9DRnGz9obenCBjFY5pzHcyi/LmFqNMkjLOBj3+o9KALY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YEJUiIjbN14ZXLaRYtzcD4mF60cucom89dkt7fQJxsDaEXIbp
	rPw2cr2tRogJSWcYHvZ6c+2C2/ipzqLVwD6ddv0ueesvu+OYo8cC5Z4xWI79ujrK+GPxHLXKn7m
	O1f0Odxifr+Ef/qz1IwbS2Q==
X-Received: from wmmr7.prod.google.com ([2002:a05:600c:4247:b0:4a2:e03:1f55])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e92:b0:4bb:53d5:8263 with SMTP id 5b1f17b1804b1-4bb53d582b3mr17227095e9.8.1794492891300;
 Thu, 12 Nov 2026 06:14:51 -0800 (PST)
Date: Thu, 12 Nov 2026 14:14:33 +0000
In-Reply-To: <20261112141440.3050124-1-vdonnefort@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261112141440.3050124-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261112141440.3050124-3-vdonnefort@google.com>
Subject: [PATCH v1 2/9] ring-buffer: Drop cpus_read_lock() from ring_buffer_poll_remote()
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

ring_buffer_poll_remote() holds cpus_read_lock() while walking
buffer->cpumask. Ring buffers are never freed on CPU hotunplug, and
trace_rb_cpu_prepare() already orders buffer->buffers with the cpumask
update (with rb_cpu_sync()). Drop cpus_read_lock() as it is
unnecessary.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/ring_buffer.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index bd8126f6353b..32d3c47dbdf0 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -6918,8 +6918,6 @@ int ring_buffer_poll_remote(struct trace_buffer *buffer, int cpu)
 		return 0;
 	}
 
-	guard(cpus_read_lock)();
-
 	/*
 	 * Make sure all the ring buffers are up to date before we start reading
 	 * them.
-- 
2.56.0.567.gdb80ae8cd5-goog

