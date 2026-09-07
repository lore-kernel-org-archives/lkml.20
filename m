Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EB551E450
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799191; cv=none; b=EMokVQzSgSQvcIOQFg7EqcQ7MD5RZilWmkVypCtBc4MqbTI7+sLaKwta+SyxpMNtq1m4NsuXGc/Fn34jsIe42HaZFwuzn4/ZDecSe7QgCEYzwYKzJY/EWx4v9rnN5ovDHDgQPz6mOyVIso7fzsy39AHLhiwX07HIZJs8KfD/sMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799191; c=relaxed/simple;
	bh=MxzCzsvL83HzKCDT6SQt/ioA0uxeZnY3WDoDY7NPz+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=txdt2uqvTA0Cqoh9eXANwsITGZzPu4mRqQDabdpa39+RUzJom4tLMUrAjOp+k8XrArCUXW5ANYxBonNu6vdZFKslKIcwtfGUQpcDtARPcC8BLQNKvj7BlwcGDOmr/CwuO2VDdPFhIvdtWwIpwk+BWO5JbrbkRHC8SyOMicM85HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YVQBrwmj; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVQBrwmj"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c2533d83e3bso629061866b.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 09:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788799185; x=1789403985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K7XIr1AmkuFOmy/+HyKoEnCMODUMBbTqPPqgFxN3piQ=;
        b=YVQBrwmj1wZHbs+Fl3a+jZ57MCfTxoAoyFOXlh0TPAwuDIXkHnv4am5sjAW1De19x+
         BArfdxwFNT22gCZ5km+8bKZ3W6exXWz32lACEtMoe+rTRpZB0bSjeZ4Fyesym1Hw1Vf6
         rjmNniKwG7O6Abkp9H5qEXLZj9z3/5L6r5Wvbip+X79+xcrfT2/fOq2BcIDqfcxUEGXR
         VuVfQc4IS+bHm47koo5cbGFJGDUeh81au66qFluwpMV0cx1hwuQJSl9ucGXOdQvhXApP
         QS/kWY0Kf4vXlK1uulL6v5jSI6TPvybEZlrK+RoDtaJM+GK8DE0HWm15F/NH20W4kTkU
         M7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788799185; x=1789403985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K7XIr1AmkuFOmy/+HyKoEnCMODUMBbTqPPqgFxN3piQ=;
        b=CR8Z5nfJ0gb+2iiQ3HKXd25CsdpXnTtlRfiRb52K3SD2qlcts8jhWRyJ8jjnlys37a
         dX7xWhuY962f84CPJOkc32LyTVPVXjcYtedyLbUN+Jb5XRktLQWNWUwAf5AtOKGIlFhU
         h/BUPKUuTwBGU59pG+/3b0903nTtipJ87fJEDGsJj8JRuzV+SGS3THsUDDKwrjgTSM8i
         7QjxvJi7oylvOSkHfF3Xqc5Ewf4HB1tiMycnhPiyeZ5nmD/tEbyQXxqZcWH4ok0MU4z9
         XK7HWRfVvCoD1o5N0IVe0MBsLQRzinuFhpCN8qdmqJcSFzNGPxVKp+BT4ui2+mvXlFWr
         ur2A==
X-Forwarded-Encrypted: i=1; AKwUvBy/Gp3iLLC4i7E1/RLVY9Zn4cFo6GHZNocriSXgxgNmgfzH29Ie2cW9t8Kaw2ey5QmKDRKqj1h4HcCK3So=@vger.kernel.org
X-Gm-Message-State: AFuF++mcesGO+JDYt9iokJnbQ8h3UGoAtGAeurq/aLMxvbavjX4TW5Sq
	klyEGvRPMFR+7spYscStWd3fYpS3FxMovrsQx1eS2sULhsOmtFCwX4NW
X-Gm-Gg: AYBFou00ou30kNcIHFKh1VvZLTVsTlUR2UDif07youYgxE6FGG8eCufyGg15zNU4HBV
	jfVIyLBCBZ0baXCIzwfse0qwvn3r+UuOW8nd0oCClZZ1pQpdlxnGzl3sepx4ZUX/iW69RxBFVv9
	YwZDiXQ3+CIa1lRGOYG6i6dexCEi5Y6Dm8L7a+VBdChC1OkJ1xSPA49TwtbtS70AuZcbwZJXF9m
	+/vL4TMh/G1ojFnYqPqn7CEVoxIoehrYzmGO/2A4flAklXj3tmaagJ/smHvo1lXtiWpfDbSQVWf
	/cmNW3Hl7AsBd/gwqWNKKd/4Lz4dfSzSusmW4wnhyXrk3uMOlZDWnRoNfiQPhh8MQKR77ZwCTU+
	d0oorruH/NICKjQNoCKVwgz2U9OUHGWrKG0QJf+abUgfJec8i8CBZZoeWzRt/ejVY7IT01AaXnx
	7W60JtzvkrsSiKJX/IJrS340H354VD7LF6+Yeogdq9JiEajKUiUNV1T2k5FnaIQffVaGH6Ocg=
X-Received: by 2002:a17:907:9492:b0:c25:ed6e:7edf with SMTP id a640c23a62f3a-c260cbd2e65mr1707997666b.11.1788799185034;
        Mon, 07 Sep 2026 09:39:45 -0700 (PDT)
Received: from grower.astralinux.ru ([82.22.172.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4a8b89sm483434766b.10.2026.09.07.09.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 09:39:44 -0700 (PDT)
From: Alexander Martyniuk <alexevgmart@gmail.com>
To: alexevgmart@gmail.com,
	stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: karolherbst@gmail.com,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	mhiramat@kernel.org,
	mingo@kernel.org,
	nouveau@lists.freedesktop.org,
	ppaalanen@gmail.com,
	rostedt@goodmis.org,
	tglx@linutronix.de,
	Ingo Molnar <mingo@elte.hu>,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH v2 5.15/6.1/6.6 2/2] tracing/mmiotrace: Add NULL check for mmio_trace_array in logging functions
Date: Mon,  7 Sep 2026 19:39:19 +0300
Message-ID: <20260907163919.183961-3-alexevgmart@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907163919.183961-1-alexevgmart@gmail.com>
References: <20260902122613.442176-1-alexevgmart@gmail.com>
 <20260907163919.183961-1-alexevgmart@gmail.com>
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
index 74f378fca518..f4ebf7d9cc25 100644
--- a/kernel/trace/trace_mmiotrace.c
+++ b/kernel/trace/trace_mmiotrace.c
@@ -295,11 +295,15 @@ static void __trace_mmiotrace_rw(struct trace_array *tr,
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
@@ -324,11 +328,15 @@ static void __trace_mmiotrace_map(struct trace_array *tr,
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

