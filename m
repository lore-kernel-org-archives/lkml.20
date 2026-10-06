Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E3933D51A
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326411; cv=none; b=XO3AjUrpMf64dVQEk2tuO6BNzGBKknSF5V5WXgg33z2BE9FM+Lu8dSlPJSSkrVDy6GOkCp7xSGSHdQnAoel3GrmMQoq6GWrhWt7oHazP+vcVWcYeIzcDp4nFEPLrGXACfJLOFBPnEjuH7iCev6DHgB5AAinKfpXId78o3DaOyjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326411; c=relaxed/simple;
	bh=hPOUmV/xGE5eS0kZpd5MJCVPYwrNotNiv1TTrk+TckI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bamR7VQifGHOU+SwWmmv7F1GmCxZGAU4Cp18tGl8CMr3R8b9yy/4DEDDT3CCg7p+XsaVmTNsuL9Zfhs1fKfvJTbrwD070Pkeczf3sE/DfA3jewzeiKwDLkFCxUPHuTReVUNRW1NFCsnihnDaIMFJKSewRkWiLu2VgBo/S5t8J4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=AJx39qsk; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="AJx39qsk"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-455ca262ccbso858278fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791326409; x=1791931209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bMDhGYH4rM/hZGPUiF2V3RD2josdEfJ5uDI1Xaf78dg=;
        b=AJx39qskExIGcEEPyA1S7gUovLD1/9lvzGRuxxNGEQCvkP4boMxmhU/DcwqJkX9NGD
         J3WVyGeqh3EBpMLNczl6mJFHsel61um7gppKrwGleCcaRLWgkfZBpG4mMPrfd5dfeB/V
         yBzuutgPa9qLtUR2P7Nm0bCr+H5dOEucSLzCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326409; x=1791931209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bMDhGYH4rM/hZGPUiF2V3RD2josdEfJ5uDI1Xaf78dg=;
        b=v1qRqiytO+M5M20dZgB/kSbuknrwP0FBQJzORFEpD/clPNxx+wvchlJxr3vu8Ldb2Y
         ZcNLVhZAF9miBEMTQeV4gcYILVtrERXmNK2CvCfVALslYST9eUUCV/IlDUzafex53XD7
         n5VVZsBRV3xDkQAbYwsCfIi7wfQuX4kbj4NutZBGKzD3NBAT5iZcQQI73I+lJ1kjcTMm
         UZDOF5O040vIhmGosGJLljn05jgefpxy3GJ1u38GrT2w3c6Z4V95BWDFUJxW7dn0c+U4
         wOS3pMknMYfq8vwSd7lplv1HG9wV/Pg2YrIRm9fGV90U3Y4nEnuubOnB0DHPWcCS1Q6j
         Lb8Q==
X-Gm-Message-State: AFuF++mkOLyoz4MeXoiQnd+dZVSZvHLfgmcdPQHk7kBH3UuIeg2k/D6Z
	w3jubuaZjJde2lcBBrLlLepL0wAPXAzRFRjsjBlPGisnEYrnMJ83tSJ3cRtaSQCZ1mg=
X-Gm-Gg: AYBFou00EEWUmqyLLh0RMtEIJy0/qR4eTS2XejQgQCIaLv2LEyDwttccdTU1+SmXXcK
	eQ1roEUFZjVTTrj+kssUip1u58T1gTOFZs9FjXOAuALUz+7xCTQ45Dt1Y2bn62zos1yE3FzyrmS
	dYmxgaShwk2FqxjKd3aCyoAMz9YL3XTB7BL+//to117h+xEzPWgSP/b4Y87/GJ/6vpLyAxfxKX6
	v0abv2wYIyJ7tQiQ/xqGRtBViHa50hjFNGeI7hyjdbZswRs/KD8aql8qrafCQ3u+wiQZGXaxEeN
	1emZT/bOOMW0DJmK1awkr97hSsmMzmeKP17ej8bXBbr9zmeVEpzZHzPIJjC3Y8lbtvC1Mcxg1PM
	N4XdTlA7zhXsZv2ijRUL2IEKFudrDeawPiE3d3wJg4rvXgEaNGCjeB/zUcq5FWIPKBfqwrQAiu1
	MzCWlEt7B7P1uslFUGGa7GUE5tX201K++TYTsuDKR/Pwi8yKPqpnpOA8hR9s4hXiHLRPkE0i5dg
	6/emXMnXJ+Bq6D+cNIAXwoteP1fKxcK15c62TneiyIoQHueD8YtoC5/SoJd239rRJ9vaVo/peM=
X-Received: by 2002:a05:6870:6128:b0:494:b0db:4e0d with SMTP id 586e51a60fabf-4a259148369mr477880fac.7.1791326409160;
        Tue, 06 Oct 2026 15:40:09 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a25701702esm689475fac.6.2026.10.06.15.40.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 06 Oct 2026 15:40:08 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: linux-trace-kernel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	outbounddisclosures@openai.com,
	Kyle Zeng <kylebot@openai.com>
Subject: [PATCH] tracing: Restrict perf filters that read kernel strings
Date: Tue,  6 Oct 2026 15:40:05 -0700
Message-ID: <20261006224005.49636-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A task-bound, counting-only syscall tracepoint can be opened without
permission to read raw kernel tracepoint data. Setting exclude_kernel
does not prevent its filter from running: perf_syscall_enter() submits
the saved user-mode registers.

Pointer-string filters use FILTER_PRED_FN_PCHAR by default, which reads
through strncpy_from_kernel_nofault(). For sys_enter_openat, for example,
the filename field comes directly from a syscall argument. An
unprivileged caller can pass a kernel address, install a filter such as
'filename ~ "Linux version*"', and use the event count to test the
contents of kernel memory, even with perf_event_paranoid=2.

Check the compiled filter before installing it and require the same
kernel and raw-tracepoint permissions as access to raw kernel tracepoint
data for FILTER_PRED_FN_PCHAR. Inspect every predicate so that other
events, operators, and boolean expressions cannot bypass the check.
Return the permission error through the existing cleanup path before
publishing the filter.

Keep user-pointer (.ustring) and record-local predicates available under
the existing policy. This leaves tracefs filtering and authorized kernel
string filtering unchanged.

Fixes: 5967bd5c4239 ("tracing: Let filter_assign_type() detect FILTER_PTR_STRING")
Assisted-by: Codex:gpt-6-astra
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
 kernel/trace/trace_events_filter.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/kernel/trace/trace_events_filter.c b/kernel/trace/trace_events_filter.c
index 2b46ca536045..76aca560491b 100644
--- a/kernel/trace/trace_events_filter.c
+++ b/kernel/trace/trace_events_filter.c
@@ -2704,6 +2704,28 @@ static int ftrace_function_set_filter(struct perf_event *event,
 }
 #endif /* CONFIG_FUNCTION_TRACER */
 
+static int ftrace_profile_filter_perm(struct event_filter *filter)
+{
+	struct prog_entry *prog = rcu_dereference_protected(filter->prog,
+						lockdep_is_held(&event_mutex));
+	int i, err;
+
+	for (i = 0; prog[i].pred; i++) {
+		if (prog[i].pred->fn_num != FILTER_PRED_FN_PCHAR)
+			continue;
+
+		/*
+		 * Even a counting filter can reveal kernel string data.
+		 * Require the same access as raw kernel tracepoints.
+		 */
+		err = perf_allow_kernel();
+		if (err)
+			return err;
+		return perf_allow_tracepoint();
+	}
+	return 0;
+}
+
 int ftrace_profile_set_filter(struct perf_event *event, int event_id,
 			      char *filter_str)
 {
@@ -2725,6 +2747,10 @@ int ftrace_profile_set_filter(struct perf_event *event, int event_id,
 	if (err)
 		goto free_filter;
 
+	err = ftrace_profile_filter_perm(filter);
+	if (err)
+		goto free_filter;
+
 	if (ftrace_event_is_function(call))
 		err = ftrace_function_set_filter(event, filter);
 	else

base-commit: fd179f8a05be3ccae366b9b96e176b51fbe54aab
-- 
2.53.0

