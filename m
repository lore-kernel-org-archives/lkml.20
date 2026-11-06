Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988470;
	b=Zwn7ZmL6ymN804OxVHfoU58r/IZHQFp6K/5kC0EflWqYiuaqFEDiiO3bPWmxQNu5YCsO
	 40wbZxGJ2Ge1nzoGudPW3e2DszYjxUeXKHeo5uIdhXo4Zdx4N0UeTB9a/UB4PNqcNIOfz
	 fBf4Q48OqAhL+cQH4Siz6zmzeYVVV/h+G6hpzIjJwx8oLJIArdCMWEc1NhcqLd4LYDa9a
	 svVGYAAaWHR2Ty2FwR89jSNnUnZtkNzdQ7f4bsE8Jpg6wtwlooK4516wmz1scvK3poEOe
	 zXwwje+IqdnU9VbL3JFGaGmR6Ymsq1D+IBDfTZS99hBE/Xc8Qqjq/ZFB8r3K0BlXGrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=eIuOB+R74nHFqJL84M+rPTd8vIKzgwcyRKbdbMo64WU=;
	b=zIL84N8vEeU0LWGILB06vblGss3nB7xNDUjZWBSYJHxdEDM+GjWl/Lc6kISEa7Hg98u1
	 odnrwByasvUX8mI/TSA+9fcqkKCDCD4faxYDMfHQ429q1uNUsK1dHPL2nl6b/vdPEXxIX
	 CVDmvzHUV5SM9j22nKGCghtLgrI9w6YtoOX6H8HEhhZFpuv6TPDZ/DNRtHQxwR9rx9mWr
	 67LR/8Lp6TUvWN5RO1C3aO9tEeA7N5lngfEIeZ3Rn3dXeyFv3G72JbrDy9PdTLhtGON5b
	 3XwA03XCrZXhnU1Oisa2quAqRPZRdsAf35DH5Kq4/+ozS8JXZjHy42GrKoPUlGKOFSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YFMmjH8a;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD6F606A33D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FD6F606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YFMmjH8a
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a210f93860so8166105e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793988468; x=1794593268; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eIuOB+R74nHFqJL84M+rPTd8vIKzgwcyRKbdbMo64WU=;
        b=YFMmjH8aOUAp2cfdMCJDAikey0Sb8xnQQulPm4dQp5tv/KoZAOAxMDDGyAwcMmNYzt
         DJeildY4n5Uzh5rDXcqpi8jFsfC9bHFVXhE0eO5F6lLXmxvVPgUOWWtkN37je8ZwaCW6
         S0c4nfcY29QlFPScNJGHHvjouNrwgSsIo7nsW3Qvwm92cj+2PmYCnh9AiqfjCdBVubIx
         UtCtxnTHPTuacQQ0WCXKIUpMxp4lzkmes/HL4YpS8EJk2KBaC7xwAiSCpYzmJim5rqGt
         UMJ/U1HgbvBOcjET5Hs60gSE8RmxjLwPBMpXjwKwzBc2OcrnR/ZNl8xA6otLMxZADWDQ
         HwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988468; x=1794593268;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eIuOB+R74nHFqJL84M+rPTd8vIKzgwcyRKbdbMo64WU=;
        b=UO2v1fcq1LGn5PCbKfb4NMX4eNzM4leKGVZIKOpYjfqH1h8yuF7R+enuYX2M3HfFZG
         av4o2t4ksf/YDklJwS4NFRtyhk8ZkO2tYa/s3KzHWqirtS1rdeByH69q9My14rKrIX/+
         71bn5Kvymns9jUL6pFz0fx1h2jIbuCutY1cQK3MpfWI1y+giuPD19SFCh3/KnQgEwCIR
         T02XCk2/vSbwodFaxu02SqfplYSNzNei1GtrQRDtKtxVAqBja1ocZ8I8NnxUif8ImC4P
         2DPvRgN3e3VHTqlMfeLTycGbChN9VMtdCpP6WzpvMVGWhGviFnleW43PblBSP4/GCIEl
         9c/g==
X-Forwarded-Encrypted: i=1; AKwUvBwt9HCgAwTNSocu9FmMYBxr1B8eaqVeVoZifNC69F5te5VMEqTU+DXbhiJ6t9zEnT7m4LfROuz7DNChbUU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tTLa2cwFHnxfzbIZ/Z+7gVN/OO2DtpD7TyXTVw0A5u1aL2Bkd
	TcEI4hG3u9bZeF6nRUyZ9YdBWzIq7ZrQfYsPxiYETs6EjKuikCkhV9Nw0VZ65q9GJe+QV+VLNF6
	JxB4zbUxWIS75vcj0/NaxJA==
X-Received: from wmbh3.prod.google.com ([2002:a05:600c:a103:b0:4a1:d8be:ba51])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:609b:b0:4a1:cef3:fb3a with SMTP id 5b1f17b1804b1-4b6ddee327bmr58744495e9.9.1793988468304;
 Fri, 06 Nov 2026 10:07:48 -0800 (PST)
Date: Fri,  6 Nov 2026 18:06:41 +0000
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
Message-ID: <20261106180657.2460376-6-vdonnefort@google.com>
Subject: [PATCH v8 05/21] tracing/remotes: Annotate remote shared fields with READ_ONCE/WRITE_ONCE
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

tracing_on_show(), remote_event_enable_show(), and buffer_size_kb_show()
read remote->tracing_on, evt->enabled, and remote->trace_buffer_size
without holding remote->lock, while the corresponding write and cmdline
functions modify them under the lock.

While this is unlikely to cause issues in practice, annotate the accesses
with READ_ONCE() and WRITE_ONCE() to keep KCSAN happy.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/trace_remote.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index 317ba3124343..a677b093fa07 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -136,7 +136,7 @@ static int trace_remote_enable_tracing(struct trace_remote *remote)
 		return ret;
 	}
 
-	remote->tracing_on = true;
+	WRITE_ONCE(remote->tracing_on, true);
 
 	return 0;
 }
@@ -155,7 +155,7 @@ static int trace_remote_disable_tracing(struct trace_remote *remote)
 		return ret;
 
 	ring_buffer_poll_remote(remote->trace_buffer, RING_BUFFER_ALL_CPUS);
-	remote->tracing_on = false;
+	WRITE_ONCE(remote->tracing_on, false);
 	trace_remote_try_unload(remote);
 
 	return 0;
@@ -250,11 +250,12 @@ tracing_on_write(struct file *filp, const char __user *ubuf, size_t cnt, loff_t
 
 	return cnt;
 }
+
 static int tracing_on_show(struct seq_file *s, void *unused)
 {
 	struct trace_remote *remote = s->private;
 
-	seq_printf(s, "%d\n", remote->tracing_on);
+	seq_printf(s, "%d\n", READ_ONCE(remote->tracing_on));
 
 	return 0;
 }
@@ -281,7 +282,7 @@ static ssize_t buffer_size_kb_write(struct file *filp, const char __user *ubuf,
 	if (trace_remote_loaded(remote))
 		return -EBUSY;
 
-	remote->trace_buffer_size = val;
+	WRITE_ONCE(remote->trace_buffer_size, val);
 
 	return cnt;
 }
@@ -290,7 +291,7 @@ static int buffer_size_kb_show(struct seq_file *s, void *unused)
 {
 	struct trace_remote *remote = s->private;
 
-	seq_printf(s, "%lu (%s)\n", remote->trace_buffer_size >> 10,
+	seq_printf(s, "%lu (%s)\n", READ_ONCE(remote->trace_buffer_size) >> 10,
 		   trace_remote_loaded(remote) ? "loaded" : "unloaded");
 
 	return 0;
@@ -1131,7 +1132,7 @@ trace_remote_enable_event(struct trace_remote *remote, struct remote_event *evt,
 	if (ret)
 		return ret;
 
-	evt->enabled = enable;
+	WRITE_ONCE(evt->enabled, enable);
 
 	return 0;
 }
@@ -1140,7 +1141,7 @@ static int remote_event_enable_show(struct seq_file *s, void *unused)
 {
 	struct remote_event *evt = s->private;
 
-	seq_printf(s, "%d\n", evt->enabled);
+	seq_printf(s, "%d\n", READ_ONCE(evt->enabled));
 
 	return 0;
 }
-- 
2.56.0.455.g6c5a503b38-goog

