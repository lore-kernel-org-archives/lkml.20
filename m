Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15804C9573
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788793680; cv=none; b=pugsTk8up5Gdu3G/ghKyBiBLXnWhQQ2LNjWjhsOhQpgWoS06uQE+7PIHvrLa6/xlRcUSQXZfTO7YjfEJ4z052n1S9mMii+ntBaGazMo+5+K5bgW8+isvRTYXmwA0W+a0bPMdNiqayIluRKkG5GW18aBs+wBq5/VwhxZfRyQueBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788793680; c=relaxed/simple;
	bh=K/oPKH1hT2lsIgOTcwhzcOTUD9vSEUwNLjMf0r7CPEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ibsagfhCCk9vYrFZ7fwk/mQ77RHPBB3297FERu0kQI28Guf++turOzo5sKWpyWHw0f27eSuTx7eRcukq3gEu6HjaWaxWkk9dWg5shzjwoxVlhageCPwczX2VcR9JYq17AnOdcsNfXW5mm4HbG7gHnWSNdjuuDVaKRCARifXeKGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGC4zt77; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGC4zt77"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c2569aa5116so699720166b.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788793675; x=1789398475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jzZ6irP1IJm4iTmeFvSaA6y2Zk76xV4+MV1ou0UvxWY=;
        b=mGC4zt77dhQBYFuHFXy7g1FjFOYn2V4PLb2fk0SykPgUbRbSTIdNLq/GrhH58TYvYU
         2XR+479JwR7zr5/osfUPcO5SYt0vww7+JAdCd8LAq7XKE0pq7aPmvte3s8BQgvurY++N
         C+h5NCbH3mYnTePjgnXMxZfOOekGp1jIYJSXTAde6TmjIjVhTxgnHck1uVnFo8irevdQ
         bNVHYeGnpIxVQ48p00fumjgQFH6EzZxgebGgq+IxKg6i/SaRb4unbA/WRJ1Ujyu2jDPt
         9W1Gpc9oiBQciiU0r17ecQztH74+ygJ2U+6DYjxDY46rmUt+NRw+4dLVit98X/UCIl1y
         J+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788793675; x=1789398475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jzZ6irP1IJm4iTmeFvSaA6y2Zk76xV4+MV1ou0UvxWY=;
        b=XOEZjBY3xf6HEjSuJV0YcMXTz6mfE2wiNkzqOLgaf0THqDU0CyJzdTfBIXv/5N+oVt
         jUYVvzKs5y0w/140E5AyKsGyKYYrVkjs+2/6rseaIfarVvdRY6d3g08aWvbfw+mB/jWQ
         Y91eAwYVJXgHBvOa9ioNxU2QNyKMPfnkmMB2ANjriMEsU3KJ/ara42tRPAIGDqczP43y
         V+Y4vWmMRz1r5/HBD+5JInjfbejePWGdOvb6JQXH3cndDZOXb6P2vyWFyeuz6DNeiUqg
         OmJLiQS6ZMYcGo2nPi/jZGMFA8MQbnoenv9LIzE5l0Dmy33zTK9VFZR2UGSQF7ay6sYP
         GdsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcJIC2XU4cRMOKV0aZ3Z+rYkDNdml9CwR4Pu+oGzAXRbMYLRCWL7cb3Qql/MfTO3AvBaAxzx4uzPDO5Cc=@vger.kernel.org
X-Gm-Message-State: AFuF++nNIYrc5DaolxWsoguCmEHLlToxL/y2fdXCeaI8atTMtmd1dwdY
	4YcZ4E7IHL10hVj0cS+00JOM5m+idP+PnBfJ+++nBvuIhPeRKiQPbMkW
X-Gm-Gg: AYBFou3ceqrWdJ9W/pNGuQN298X4Z696SNfMKXjbRIwLFqREuurRbjIG2I//IAhdbqk
	09adMjTRbHj7kk1nlOaBrVamvsfcAwAnbsWDBkneyKGPtVqF49eyNdLdlWQsF8bbHgis7sJjcGQ
	ZBCmhfV1ksZapemHQJjoLVaRx3caHIqL9TI45E+y0NBcrsi64gz4fafvClNw4ZKA0cZkGLTc6sO
	hFHkP14E1Zq/p7MHxeIXczN7vbpH0BGeGIsJ0yD20doxmdrV1OdwuT3DxGYDV1L0d1bQLleQa10
	Kha/PF/GGHVNuzbkIFi+ngMXJCP0Ge4SxYgd4DkDD2FrrTvFPQqR7T5hFgurEth6aFyMdNvu4ig
	uN1F/XAKYROClxZ4UCZWXS6p9puHPbpcOQKfg8/XcTEUD5x91DSSu2st6c6U5Ar0ZH9ZEjW8WlO
	vXtVyC7Ib/kmytGQmNztbyPw+9MNgA27bxLAePwySPH8fyC3ck99/oWZTznRGndvo2KgljG3M=
X-Received: by 2002:a17:907:d501:b0:c26:1f8f:ed53 with SMTP id a640c23a62f3a-c261f8ffdd0mr686260766b.12.1788793675037;
        Mon, 07 Sep 2026 08:07:55 -0700 (PDT)
Received: from grower.astralinux.ru ([82.22.172.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5773c5sm478376566b.40.2026.09.07.08.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:07:54 -0700 (PDT)
From: Alexander Martyniuk <alexevgmart@gmail.com>
To: sashal@kernel.org,
	stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: alexevgmart@gmail.com,
	karolherbst@gmail.com,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	mhiramat@kernel.org,
	mingo@kernel.org,
	nouveau@lists.freedesktop.org,
	ppaalanen@gmail.com,
	rostedt@goodmis.org,
	tglx@linutronix.de
Subject: [PATCH v2 5.10 2/2] tracing/mmiotrace: Add NULL check for mmio_trace_array in logging functions
Date: Mon,  7 Sep 2026 18:07:26 +0300
Message-ID: <20260907150726.168416-3-alexevgmart@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907150726.168416-1-alexevgmart@gmail.com>
References: <20260903-daily-reply-0001-re-mmiotrace-null-check-5.10@kernel.org>
 <20260907150726.168416-1-alexevgmart@gmail.com>
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
index 55ba76bea98b..ce45c5ee5227 100644
--- a/kernel/trace/trace_mmiotrace.c
+++ b/kernel/trace/trace_mmiotrace.c
@@ -297,11 +297,15 @@ static void __trace_mmiotrace_rw(struct trace_array *tr,
 				struct mmiotrace_rw *rw)
 {
 	struct trace_event_call *call = &event_mmiotrace_rw;
-	struct trace_buffer *buffer = tr->array_buffer.buffer;
+	struct trace_buffer *buffer;
 	struct ring_buffer_event *event;
 	struct trace_mmiotrace_rw *entry;
 	int pc = preempt_count();
 
+	if (!tr)
+		return;
+
+	buffer = tr->array_buffer.buffer;
 	event = trace_buffer_lock_reserve(buffer, TRACE_MMIO_RW,
 					  sizeof(*entry), 0, pc);
 	if (!event) {
@@ -325,11 +329,15 @@ static void __trace_mmiotrace_map(struct trace_array *tr,
 				struct mmiotrace_map *map)
 {
 	struct trace_event_call *call = &event_mmiotrace_map;
-	struct trace_buffer *buffer = tr->array_buffer.buffer;
+	struct trace_buffer *buffer;
 	struct ring_buffer_event *event;
 	struct trace_mmiotrace_map *entry;
 	int pc = preempt_count();
 
+	if (!tr)
+		return;
+
+	buffer = tr->array_buffer.buffer;
 	event = trace_buffer_lock_reserve(buffer, TRACE_MMIO_MAP,
 					  sizeof(*entry), 0, pc);
 	if (!event) {
-- 
2.43.0

