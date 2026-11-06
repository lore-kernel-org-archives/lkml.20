Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988487;
	b=iWu2EwSuw5xzNBMKjF3wZV+RQoU27dS6w4axeE/3LiGkvns3FCHxAuNyYxT6B2Ud3a9q
	 TnJJdqRJOHy/HLmGeX4V51T1p1FvdLZMyjJR8GBkwPVe77WWXVXV0R2WjKPSeY4SP2ouR
	 r71IsGYrGwyopiapr3lXWFpSsKyfl/AJuk/pcwgLPxyGfFfcrXqHkz/2ueYhECBtIp+pZ
	 M5bzCFszMeZcKRuYQIgGUZm1hJtkWJsIH7EmjS/SH3Zfw6p8nBrv2oavooH9hYgrl3QOW
	 avWf7iW6C2L8qPZ/mksKpmhNxQGMP409Tsqlf2ygghmRHnyMgNhpnAMFgK+/RFRGxEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Zl+gpigK4TKPUO8RmVnclUlHJV6OJa+RYaWqA3VwTyI=;
	b=GiO2YxBkDk/iSvTu0E+W59niyFho7fkRg9VZsBD+u5cQv0BXnqya4oUck9AV3IfrdK0O
	 zZTcltUXG/5tRMoJa1rOIDhbS1i4h4catBFEB3EmIuOXAJTKAV1279FjAloG3tLJuLNRk
	 ZbZa4wsGTdTaR8gxrLhC7BHTNLfskdVgUTXpsMhAX8cXHrnYUIt9+RwBvChBKdHZceCE5
	 0m8Bk7R32Qe3vKZHABOI2tFc95jrh0q+J/8Rhkd6pLxXiY3wsecKJvQsKJp6jEcTrmgbp
	 eRYyinBHOD/tm15vVrEdBThDD009SFl5VTldAKYkkKFsbPwvcg22Ypj0vNnK5kEgh0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GjSIbfXz;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BB0608361D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72BB0608361D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GjSIbfXz
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a027f2e364so7769155e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793988486; x=1794593286; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zl+gpigK4TKPUO8RmVnclUlHJV6OJa+RYaWqA3VwTyI=;
        b=GjSIbfXzJsMlSqklHKIlEk7DJAbpidd7UnU0yQ2bQbtlaYM8gCejJZ7k8XL6RIuczM
         YIfzUs2b9ptyLVY8W6cdud7J3EWOVjMmgGzVfQ9iH9y/QuPQQBzKb4xfoBlCp8+/xiMN
         BLLgRaZYNRjSCtRWjGmzQWss6p5p0tBRC9rZX1Y1bQ9701GqWJRcda+iwmaaxRETTgAU
         4+X+EahV9XcVy/tEuvFHSpZYRNbxopCitQ7KqCUodkH6opxMiUVPCGewE4VldQy6poKE
         TkLO5U1JfnZjPRnmRFulFEX9Tp9LZIT/h+5l86lLGYoy68e0N9Zme2qwcAEFlx0nlRnv
         kS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988486; x=1794593286;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zl+gpigK4TKPUO8RmVnclUlHJV6OJa+RYaWqA3VwTyI=;
        b=oy+nxcluDzpTwmnGGO8Y0V8kkQa78cUQj8oZwaAAuoYbFa+C4UjPFPMErgSeEgxRRp
         txOs3Obv2jU1DsXecMlb5v1sJ752WDtFtNGSrNipI5QwMREBjB0JffqB9jDo2WOMeCc5
         iF9JoYHbegXFjyrSgZqxEULcEg1mAV1LHmTjoaIkmC0cfvNH1KGNAwtUCY+CDJBLS5cm
         pqoMdbAvfYcSu8E82vKh+1BRmJX8uGrwIvjW8rAHxY0d529NEFxJCfvEr4WCqhVFi0dp
         Xp3psXh+pj17p8mNgUm5jVy1lDKGaG4MbwIlG/nIolYpG/2ZWOqRH9/m1Qmyaqx/skPV
         L/zQ==
X-Forwarded-Encrypted: i=1; AKwUvByzJ594VmyWm7V/GeOJQIVbRHAurdM/XhX+ErrNGJgED7dMKu3EgX6SIDdrvhtzjaJKSHUQc5z7Qf8lVqA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+C0xJpIiBH1ou2jBbFm0SBciVDBn8HR0STdrKwJHUll2xgtHO8
	+KBQtR7GhRSan6iMjc6dr5OdKQDne3qaJDpz/8lYjlDC5kAxHE64+irWBtV1PoeCwDwC/AVYw4I
	FrITXw80EX/F06F2vEBKL2g==
X-Received: from wmql8.prod.google.com ([2002:a05:600c:4f08:b0:4b4:3bf9:e68])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b71:b0:4a2:cbe:bec2 with SMTP id 5b1f17b1804b1-4b6dfd98762mr51951225e9.32.1793988485812;
 Fri, 06 Nov 2026 10:08:05 -0800 (PST)
Date: Fri,  6 Nov 2026 18:06:56 +0000
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
Message-ID: <20261106180657.2460376-21-vdonnefort@google.com>
Subject: [PATCH v8 20/21] Documentation: tracing/remotes: Add detailed tracefs layout
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Add a description for each tracefs file available in a trace remote
instance.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 Documentation/trace/remotes.rst | 66 +++++++++++++++++++++++++++++++--
 1 file changed, 62 insertions(+), 4 deletions(-)

diff --git a/Documentation/trace/remotes.rst b/Documentation/trace/remotes.rst
index 1f9d764f69aa..b02ebed4a03f 100644
--- a/Documentation/trace/remotes.rst
+++ b/Documentation/trace/remotes.rst
@@ -19,8 +19,8 @@ for which the host kernel can see and expose to user space.
 
 Register a remote
 =================
-A remote must provide a set of callbacks `struct trace_remote_callbacks` whom
-description can be found below. Those callbacks allows Tracefs to enable and
+A remote must provide a set of callbacks `struct trace_remote_callbacks` whose
+description can be found below. Those callbacks allow Tracefs to enable and
 disable tracing and events, to load and unload a tracing buffer (a set of
 ring-buffers) and to swap a reader page with the head page, which enables
 consuming reading.
@@ -28,8 +28,66 @@ consuming reading.
 .. kernel-doc:: include/linux/trace_remote.h
 
 Once registered, an instance will appear for this remote in the Tracefs
-directory **remotes/**. Buffers can then be read using the usual Tracefs files
-**trace_pipe** and **trace**.
+directory **remotes/**. The files within this directory allow configuring
+and reading the remote buffer (see `The File System` below).
+
+The File System
+===============
+A remote tracing instance is represented by a directory in Tracefs under
+**remotes/**. The layout and files within it are very similar to standard ftrace
+instances. Inside the remote directory, the following files and directories are
+available:
+
+  tracing_on
+	This file allows enabling or disabling the remote tracing.
+
+  buffer_size_kb
+	This file displays and allows changing the size of the per-CPU ring
+	buffers used by the remote. It also shows if the buffer is **loaded** or
+	**unloaded**. To change the size, the remote buffers must be unloaded
+	first. Remote buffers are automatically unloaded when **tracing_on** is
+	off, no one is reading the buffer (either by accessing **trace_pipe** or
+	when **dmesg** is on) and no events remain in the buffer.
+
+  trace
+	Display the human-readable content of the remote buffers. Reading this
+	file is non-consuming. Writing to this file clears the ring buffers.
+
+  trace_pipe
+	Similar to **trace** but reading it consumes the events from the ring
+	buffers (consuming read). It blocks if there are no new events.
+
+  dmesg
+	When enabled, all events from the remote are redirected to the kernel
+	dmesg. This is similar to the **tp_printk** option for in-kernel events.
+	It counts as a reader of the remote buffers and prevents unloading.
+
+  dump_on_panic
+	When enabled, the remote tracing buffer is dumped to the console when a
+	kernel panic occurs.
+
+  poll_ms
+	Modifies the polling interval for the trace_remote.
+
+  per_cpu/
+	This directory contains subdirectories for each possible CPU (e.g.,
+	**cpu0/**, **cpu1/** ...)
+
+  per_cpu/cpuX/trace
+	This is similar to the **trace** file, but it will only display the data
+	specific for the CPU. If written to, it only clears the specific CPU
+	buffer.
+
+  per_cpu/cpuX/trace_pipe
+	This is similar to the **trace_pipe** file, and is a consuming read, but
+	it will only display (and consume) the data specific to the CPU.
+
+  events/
+	This directory contains remote events that can be enabled or disabled.
+
+  events/enable
+	Allows enabling or disabling all the remote events.
+
 
 Declare a remote event
 ======================
-- 
2.56.0.455.g6c5a503b38-goog

