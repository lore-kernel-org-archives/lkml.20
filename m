Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6063C2BA2
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791327147; cv=none; b=H20c8n00+Rl2HPG9g5zwKMn94JKwC8uOJSU+8woFzsItwOgAkE7GyFVwm9kwiVNRx8rqPhMLBPt/nu76Ff43iqGkkko0oqHsBO4woxInyds9XnPMD4d/dR6aZUwo4qLYsYg9SZSZ0ygbeVrbXPvgAGPJaCmnHUwgvmOmJzxTMeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791327147; c=relaxed/simple;
	bh=pFTkUMk/rZ+bcDA0dNreWXqO/ymmW56hA2wPC8A0SUM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PF9mKqeDn3f/iop9xPCagdw2uZmeESRd6wgSo/5xE8NfriuP34W/Qvmtt26tr+dVeSdYnVlNut61Eo1HX0HNzi2LC5ahsInTQGnp1prgA1643lpWXYzO/mQE657x5xB8IUUpDRdnaEIO9sGGmZdg701GBCP59av1AXf7y7HNRsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=YL6mqHpm; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="YL6mqHpm"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4b1ba286f6bso777535b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791327146; x=1791931946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VPdIVaXesRNcKlAXCOjj3AwAY0KkqhBFBWxij3ZELec=;
        b=YL6mqHpmX4aG5+DNtHousP20Pjlc6wbtx1gI7gJPTK86sQP2MU9IYWvbR5TzILUcxR
         xstCH/8TKMLQJooOYRMaUIvvZ+VFkEajsIBlguMw6lDRfzezQaWz4D8sDtOG/idVu9bk
         JpbK09nO9q7NL27sKorCCbdphnvARRa5dcJoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791327146; x=1791931946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VPdIVaXesRNcKlAXCOjj3AwAY0KkqhBFBWxij3ZELec=;
        b=sHhPO+COhxZ6b9D6oKmljY7EpWeCU8glM8BbZnv+3Wx4+Q6G6JwPlgndEP+AQW8VE0
         STlfGQlG4H6VbDgL1flP/y+LyoBjZvgsfTmbXP+4ltvjj5J3ePHFhL4zPDFbLRJZkAgl
         ivfKSBrPtYFe7ErYP3iKqIiGMTWhMIRm2UOOUb4FlGbZUT6lptsqAp2BeKPxe3AjdCG6
         7mKF4MJ1hfmTCiDy9a2ySEqxX7jaaL1N/XQUVlu5VUJjc7R33AzU/9j389JVV9bJhW6z
         Ju48W/GF4t6p8wyTXDoY5Xp1ECSkDKH9LmuLZg+XEMMbRIuH6q5fKEjPuR6YUH+Ku8UA
         KdGQ==
X-Gm-Message-State: AFuF++n4xYpxbCwwNRS7ScZEJRLLhWX4Kef8+eeLJQhFa+kv9YmekMBp
	lEfecC3ouVTzNf0q6mnfAk/UsTJ08SJvOJJYTEo60jo7GBv9/ONevG1QRq0IUYDvRfo=
X-Gm-Gg: AYBFou3jgnTX0DTIxK5J6HFn9lp22qXtcwvS6ClIn1kcVpb6N6r/PALoV+5t/zRBc6b
	+s7pT2r+Chiu08XZ8fpYCvhXn4gV6IaGug3+elaAab7Kw2OGWyb6wtmeRkCZItlExskYCmYiX0k
	3F/mXo65HoX3anOyihpGaaeDho5eregGESBnqfwHe3lWq3d+ieGNzJfseurPgth7csXjpoqjuJA
	UPW5usiNLdjDGAOTStp0dRMnvDq5Vl0Xq1sgLjZPb9cQc1rvF3kq93ExXXC6UTdHtAt3Oeze7Qj
	BVen0qXPKcn70sblRbOIFVA4aO9Nte2pogkCoZJ7yvUYbPUl8autUH7KzFobtk4hxdNDRbNBtTr
	FlTJYeyYKaSjtHgR5J7XKW8lFhbQhV+8dvZ5VJ+ReNgyq/OO4q47yzv7bzsU+uT2oiGmRiGNTfW
	iRBFLqYjqDaNFygOUcpS0I/aAktqFiZ4d8MaV8YVWm4+QkLF9svssCdTwelXvEGt8dqOWIoUpaD
	ZBOFe0DWRDLHDK5zZltHfccmxxZGO59imw9Hwg+bBn3AmTY8aJTF/3XHQE1/V+NhLrZOgsiLRg=
X-Received: by 2002:a05:6808:3c47:b0:495:ce6d:7d48 with SMTP id 5614622812f47-4fc44b3f7cbmr587506b6e.9.1791327145807;
        Tue, 06 Oct 2026 15:52:25 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4fc49a71636sm583940b6e.16.2026.10.06.15.52.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 06 Oct 2026 15:52:25 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: linux-trace-kernel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	outbounddisclosures@openai.com,
	Kyle Zeng <kylebot@openai.com>,
	stable@vger.kernel.org
Subject: [PATCH] tracing: Validate user addresses in faultable buffer copies
Date: Tue,  6 Oct 2026 15:52:21 -0700
Message-ID: <20261006225221.54513-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syscall entry tracing runs before the syscall implementation validates
its arguments. For a size-bearing user argument,
syscall_copy_user_array() passes the register-supplied pointer directly
to __copy_from_user(), which assumes the user address has already been
checked. On x86-64 this can copy mapped kernel memory into the raw event.
An unprivileged task can open a task-bound sys_enter_write perf event at
perf_event_paranoid=2 and disclose that memory with a write() that even
fails with EBADF.

Use copy_from_user() for each actual array pointer. Use it in the default
trace_user_fault_read() path as well: the original syscall-array tracing
implementation used that path, and the helper is documented to use
copy_from_user(). Keep the existing length limits and per-argument fault
handling, so valid user data is recorded as before and failed copies do
not contribute bytes to the event.

Fixes: b4f7624cfc94 ("tracing: Have system call events record user array data")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-6-astra
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
 kernel/trace/trace.c          | 2 +-
 kernel/trace/trace_syscalls.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index e4a490d3d08c..07acbc44d99c 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -6263,7 +6263,7 @@ char *trace_user_fault_read(struct trace_user_buf_info *tinfo,
 		if (copy_func) {
 			ret = copy_func(buffer, ptr, size, data);
 		} else {
-			ret = __copy_from_user(buffer, ptr, size);
+			ret = copy_from_user(buffer, ptr, size);
 		}
 
 		preempt_disable_notrace();
diff --git a/kernel/trace/trace_syscalls.c b/kernel/trace/trace_syscalls.c
index e35744049e3f..d9190fdc030d 100644
--- a/kernel/trace/trace_syscalls.c
+++ b/kernel/trace/trace_syscalls.c
@@ -683,7 +683,7 @@ static int syscall_copy_user_array(char *buf, const char __user *ptr,
 
 	for (int i = 0; i < args->uargs; i++, buf += SYSCALL_FAULT_ARG_SZ) {
 		ptr = (char __user *)args->ptr_array[i];
-		ret = __copy_from_user(buf, ptr, size);
+		ret = copy_from_user(buf, ptr, size);
 		args->read[i] = ret ? -1 : size;
 	}
 	return 0;
-- 
2.53.0

