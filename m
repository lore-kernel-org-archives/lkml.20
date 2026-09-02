Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E68481253
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788351996; cv=none; b=Uh56tXh2pfh8u1uh579sYQTwcVOWmy34v8iOZMDqNH44IDnkKlq1OiwEJZSBl8KanHOchWZIbmiQxASr9OQvi3hH8KrPTq9wzUhAUufXH8NQn9DRz/nchtwBWqSl3By3GXBJIH2IhuzMagU/SXnQihPZqpKvrAZvH2t/plsGJlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788351996; c=relaxed/simple;
	bh=O0li168uWk7Sy1LrYk0EVi1WX86awysTPLKEJqeGegw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uQrqJ7H4EJI738BgWYM5H2aGHC968bovIU8n53mCL9VAO9Q6qH1wsifKpbRhjGwvmxFP4j2bdV1VVv6RHMsFhZH8Sg+YDF7yEqeCGJO0UTjQlWgzE191CVUmqjKykKlC/MZTGwBCbL0GDfXC8rLvKxKthLWJyDDFOWRkKbTZlZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ssJ2RR5G; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ssJ2RR5G"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a38098734bso1907000a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788351993; x=1788956793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Za1ZVpoqbeGhlWHdKUB3tZE62Qu9g1p/b329aCWVgzg=;
        b=ssJ2RR5Gr9WJr7XvDAXYRpQOPhx2Gx+RsQliKOgooeiEUQdQwMVVx32CERLh96UsTU
         11EZlr02z0tuP6Kz+M9ja3Q0eFP24qfYGmzwMYUR4lgQxJ8ZB6c7QNFxNFFh6YQwTJmA
         MG34NXzJidfZgnZOKCos0XTZa3ZAm28mgaBBWSVCTKdzU7irE3nAhWpZCKLBlB41mIh/
         uJhOCPIpOG+Cc4L8PKe3dBblcDmeweTU9zZr4WOKIpKy1GO6NYlTne0uO5O4txqg7Tl7
         UGn0s863GpoHdO0hub5keB01LbzUE3gzVXiHS2DgE3k2HGEWSFHstRt28q0vdJfkA3Kx
         MjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788351993; x=1788956793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Za1ZVpoqbeGhlWHdKUB3tZE62Qu9g1p/b329aCWVgzg=;
        b=on1VFnIqWk7ZXYbM2/kuxANdNBzKRBk7RaCFwC5djoLcCZPU3nPpaoskwHS1POcMLp
         Uz7/FwVbmTxwLq69lcrP/RWJpCJlo6Wbcm20cFLcaCbCbx64fyijb4jRd4kAUqSk7ZeK
         ZFvr9LTMYpiTI86tocydmW1DnR5Re/EoYonS9A62I9G+5BCqxgHc1PUXZByBEf0sjtB5
         u4/qMeLsp8xPUaAk2EQjWwt+q2qAbZdyVO9BItj+TqI11m4+eAmAy64kGB86y9BZUBzX
         urGsT4B0/5ZjFcawdW1d4MwR6Bt0l6gHAZzbYBiZHLlVNaFKV1egJqHrvfQZY07+fLro
         1CgA==
X-Forwarded-Encrypted: i=1; AKwUvBx3w4xMYtD5s2Ize/WusoQfZCd4FQLtIgIPNwoXmrrcHdkyc7vRUYeSMXLhfzhUqZUZpygY3ttKY119Jiw=@vger.kernel.org
X-Gm-Message-State: AFuF++lUDRfGRLqWJguhMD2wCUIPklRKkqthCCvJNXywlXoB8fQanvHc
	yk76Jht/T1gHcf2z7J9HH2R/rJDO2GYwaTq50timgxWLH1qNffG/5o0T
X-Gm-Gg: AYBFou2cdjwVR5zrBLeHBJeKKm8BbapRxC9Go3jGSIlsvR29Ss8Qa3TfZINJeyxyorJ
	+Xm6010Cy3kHscNcjkPvN9BVhvmGXi87MilHnGHgHOhY9t4RSyVMOTQ8Mu95mbVjcyyThWBvIvU
	T3Dm4qf9pVwWdVi7IFXdAFxn6OPbZ8MUeXWo+Ydsx1TFZvVVqCZplpyys/WCQqLiU3W+D2oR+ml
	GtNgEQ64bF8qh/+kKNQho7NSMJqFowzLD9iWd/i62CWNt1lI9EO46dHbJD1d+r0J1nYKZtRitRa
	172UQM1YCj0BMP2btESEe6VSKoyWOhQ5wTVVyatgpqzgSV8sPEFL0CD74DTMPexhoESgBPkE1pE
	9uXbU/ra3WpACgp8tasFBnkMSXg2sf+w3jraQWLuWZw8tOZItv49hsVyUXMoNtDgF+plKQ7sIBv
	xJN647Gs7IXtqdJYkUMBia1OvilPLJHckK6a3Mt4ZpqanlsDbvuy+MtN20PaTKU9jib1DVk5U=
X-Received: by 2002:a05:6402:3216:b0:6a4:ae1:333a with SMTP id 4fb4d7f45d1cf-6a682799fb3mr3468677a12.12.1788351992977;
        Wed, 02 Sep 2026 05:26:32 -0700 (PDT)
Received: from grower.astralinux.ru ([82.22.172.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a68a6a636fsm566521a12.8.2026.09.02.05.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 05:26:32 -0700 (PDT)
From: Alexander Martyniuk <alexevgmart@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alexander Martyniuk <alexevgmart@gmail.com>,
	lvc-project@linuxtesting.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@kernel.org>,
	Karol Herbst <karolherbst@gmail.com>,
	Pekka Paalanen <ppaalanen@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	Masami Hiramatsu <mhiramat@kernel.org>
Subject: [PATCH 5.15/6.1/6.6] tracing/mmiotrace: Add NULL check for mmio_trace_array in logging functions
Date: Wed,  2 Sep 2026 15:26:12 +0300
Message-ID: <20260902122613.442176-1-alexevgmart@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>

commit 12b80cdbc54cf615b4717a4e8180063408091ea2 upstream.

mmio_trace_rw() and mmio_trace_mapping() retrieve mmio_trace_array into
tr and pass it to __trace_mmiotrace_rw() and __trace_mmiotrace_map().
If these functions are invoked while mmio_trace_array is NULL (e.g. before
initialization or after disabled), accessing tr->array_buffer.buffer will
result in a NULL pointer dereference crash.

Fix this by adding an explicit NULL check for tr at the beginning of
__trace_mmiotrace_rw() and __trace_mmiotrace_map().

Link: https://patch.msgid.link/178524300062.56416.8362487250709962380.stgit@devnote2
Fixes: f984b51e0779 ("ftrace: add mmiotrace plugin")
Assisted-by: Antigravity:gemini-3.6-flash
Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Alexander Martyniuk <alexevgmart@gmail.com>
---
Backport fix for CVE-2026-80689
 kernel/trace/trace_mmiotrace.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/trace_mmiotrace.c b/kernel/trace/trace_mmiotrace.c
index c523ce5aa495..f03e9f3b8212 100644
--- a/kernel/trace/trace_mmiotrace.c
+++ b/kernel/trace/trace_mmiotrace.c
@@ -296,11 +296,15 @@ static void __trace_mmiotrace_rw(struct trace_array *tr,
 				struct mmiotrace_rw *rw)
 {
 	struct trace_event_call *call = &event_mmiotrace_rw;
-	struct trace_buffer *buffer = tr->array_buffer.buffer;
+	struct trace_buffer *buffer;
 	struct ring_buffer_event *event;
 	struct trace_mmiotrace_rw *entry;
 	unsigned int trace_ctx;
 
+	if (!tr)
+		return;
+
+	buffer = tr->array_buffer.buffer;
 	trace_ctx = tracing_gen_ctx_flags(0);
 	event = trace_buffer_lock_reserve(buffer, TRACE_MMIO_RW,
 					  sizeof(*entry), trace_ctx);
@@ -327,11 +331,15 @@ static void __trace_mmiotrace_map(struct trace_array *tr,
 				struct mmiotrace_map *map)
 {
 	struct trace_event_call *call = &event_mmiotrace_map;
-	struct trace_buffer *buffer = tr->array_buffer.buffer;
+	struct trace_buffer *buffer;
 	struct ring_buffer_event *event;
 	struct trace_mmiotrace_map *entry;
 	unsigned int trace_ctx;
 
+	if (!tr)
+		return;
+
+	buffer = tr->array_buffer.buffer;
 	trace_ctx = tracing_gen_ctx_flags(0);
 	event = trace_buffer_lock_reserve(buffer, TRACE_MMIO_MAP,
 					  sizeof(*entry), trace_ctx);
-- 
2.43.0

