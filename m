Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50A8384CEE
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161097; cv=none; b=A4QOHNGNtIq+/sgvyFRPLU3m0NrLgaAuZyMzO5wHl8Wp7rTUrfNadJSBVLuYS0/JlEyzoT6k7Xj/0WulJkWSS8bWWKX9qP5LGoMeyC8IYlsoWlGXpsn/ARd60lIo3DZUrJMFYxRzRmUJ5DvXcsQ2KEWt5IvkMp7APXnDmhwoLxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161097; c=relaxed/simple;
	bh=ZZUvT0kf40eFwL2bFZX1RGzk+Cclft6Ic8iqZtbTDE8=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=W75Yhm08lUKVRRifglA60ixflkueDWn1winJBZHZZn3BQSCsaA5FPpcObS2qH6f02Jo+fKK+8uVcqqwI3Mphf5TSzYqA4HZiEVVIxrpHoqa7RD2/oCB7B6n3FD6uTrYXTDRPiTbMbDuqCx56zbnYrbVfg7iVYLe2WyEmoNBaGso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iEAH2gtK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iEAH2gtK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B52931F000CD;
	Fri, 16 Oct 2026 14:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792161095;
	bh=ysgaNd3mMMb4W83FM40eUqw4uInj8XKndD4voZruT94=;
	h=Date:From:To:Cc:Subject:References;
	b=iEAH2gtKtsq2UjApU2kD9X8SvfMtGQQ7UoOlAzFXIa0iXup7UKZx6HxdFtiGclww0
	 qzgnBVTvPW9cxcYI9ggf6O3kkHRGFaAW0X1MH2T4X0YXOIfotlhJx6p5kyIFVk70bY
	 6qs5kOd9N9Hc4HMBIX60Q7pqwSc8FdzycmwE9t33sIh2U9fVB+CKU5nTvfhKlDxZeG
	 hYlUwSq0OEssYA4NVmjtfI+QeT7dcnBgwtJnVJ2XlQjBy8T+hABKPHMoLxnR9N8Yt4
	 X9GeO1ZEKlu3odU6Zw6OSKnd+FPlh2Ru2iYG6croegXTJO8PWw91PW9ZY/Yaw9zKg4
	 g/zgfObYJFD1A==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xHiy7-00000000Xia-0LvT;
	Fri, 16 Oct 2026 10:31:35 -0400
Message-ID: <20261016143134.889926244@kernel.org>
User-Agent: quilt/0.69
Date: Fri, 16 Oct 2026 10:31:19 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Subject: [for-next][PATCH 04/18] tracing: Stop modifying the input buffer in ftrace_set_clr_event()
References: <20261016143115.392980228@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>

ftrace_set_clr_event() modifies its input buffer during parsing.
Before returning to the caller these modifications are undone.
This is restoration is error prone and was forgotten before.
Upcoming changes will also make it more complicated.

Copy the input argument and modify that copy and drop the
restoration logic.

Also mark the input argument as const.

Link: https://patch.msgid.link/20260908-tracing-cli-event-filter-v2-3-05396a3fb663@linutronix.de
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 include/linux/trace_events.h |  2 +-
 kernel/trace/trace_events.c  | 19 ++++++++-----------
 2 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/include/linux/trace_events.h b/include/linux/trace_events.h
index d0259a515a83..8a396ae51fef 100644
--- a/include/linux/trace_events.h
+++ b/include/linux/trace_events.h
@@ -883,7 +883,7 @@ extern int trace_add_event_call(struct trace_event_call *call);
 extern int trace_remove_event_call(struct trace_event_call *call);
 extern int trace_event_get_offsets(struct trace_event_call *call);
 
-int ftrace_set_clr_event(struct trace_array *tr, char *buf, int set);
+int ftrace_set_clr_event(struct trace_array *tr, const char *buf, int set);
 int trace_set_clr_event(const char *system, const char *event, int set);
 int trace_array_set_clr_event(struct trace_array *tr, const char *system,
 		const char *event, bool enable);
diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
index 1bd227282729..de964dd2878b 100644
--- a/kernel/trace/trace_events.c
+++ b/kernel/trace/trace_events.c
@@ -1443,14 +1443,19 @@ static int __ftrace_set_clr_event(struct trace_array *tr, const char *match,
 	return ret;
 }
 
-int ftrace_set_clr_event(struct trace_array *tr, char *buf, int set)
+int ftrace_set_clr_event(struct trace_array *tr, const char *arg_buf, int set)
 {
 	char *event = NULL, *sub = NULL, *match, *mod;
-	int ret;
+	char *buf;
 
 	if (!tr)
 		return -ENOENT;
 
+	char *dupped_buf __free(kfree) = kstrdup(arg_buf, GFP_KERNEL);
+	if (!dupped_buf)
+		return -ENOMEM;
+	buf = dupped_buf;
+
 	/* Modules events can be appended with :mod:<module> */
 	mod = strstr(buf, ":mod:");
 	if (mod) {
@@ -1487,15 +1492,7 @@ int ftrace_set_clr_event(struct trace_array *tr, char *buf, int set)
 			match = NULL;
 	}
 
-	ret = __ftrace_set_clr_event(tr, match, sub, event, set, mod);
-
-	/* Put back the colon to allow this to be called again */
-	if (buf)
-		*(buf - 1) = ':';
-	if (mod)
-		*(mod - 5) = ':';
-
-	return ret;
+	return __ftrace_set_clr_event(tr, match, sub, event, set, mod);
 }
 
 /**
-- 
2.53.0
