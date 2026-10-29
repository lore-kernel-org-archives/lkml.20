Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793295092;
	b=nJWGwgVupYbW/1jRhhhfxNGQhilWX8ZmNSTupux4KG1KTz+s2lAR86LMUs/1eJmTBJWd
	 BZtp9iaqY+xZvFDeR04XhMFPS0a0Dzr3ejrhzd5bJihk9SYk7OixXsXezYZKKYBNHon3U
	 ZdqRcQg9VsJd9ACxlDt2jA7greoUInbppihoME31FvelNscaq2Vdybc4IXIpvTiHt48rf
	 h5e5xxgjkYukyHoya1WskVI1OhROTtXyBPwHVM5vfMt8C+RCivHKjlqO95BItlfkDxUVu
	 72+4CetEpiVUXBuOzx/OXn1AO2QHWWiXtdI0oeOu/X823OCRITUjcd0DuKWn72V590w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793295092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=77OMp/0RKdeQKOVvIsvn+1zTLaU1Gb/6YMZNIkI1ZZg=;
	b=RVcGFtT/Ippp6PUJqzQWAr1Knf8SG9Qnmh6UHSI7oZDmdgYBlPPy6suF7lYE/KFtulhs
	 gshnaYdr7QKWq8MHu4IL4fmtzdfsLllcUOq9yFXw660bHu7ZLUqXPF+LsWgic/AeK+g9G
	 LU/wrhPao/yLbyFLp9c90RsZem4TU1amxhVIGkOkXlLj8Vvb8MtQUm69V9nd3CeIBdmS7
	 c6+JHjwylfF0IZl0eNIhKBwrtunonOQi+46Y1yyc29kFEOsEHGyE0L2zVZbnCEGon5uc2
	 VtcpaqraqTts8aVBoVxt4OEh+on/AK/KYduZ7IjeIH5+98KJ/eem2SgDnXhrPP0LMFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tEBc4HTr;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFFC606A325
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:31:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DFFC606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tEBc4HTr
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-156cbe59622so2451704c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793295091; x=1793899891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=77OMp/0RKdeQKOVvIsvn+1zTLaU1Gb/6YMZNIkI1ZZg=;
        b=tEBc4HTrN67zaTaZFfqoEWfgdEhGwrxC/QqC7gVvwYOGZ6D+rLHsTpFCWRU9B6z3Ym
         S1MV/1+EqFbEiTYDPM/kkX9AWG1SEC+z1j/uPji42T2zjT2gm/iWX7lZqq9qbIiRxMye
         eg/CZ0/awlu9bv/vW0Z82RRMwBWy9x2kS/DHd72Bp2ei8sUegaVBkAlJ0PSDjBhtXOB2
         cEKMoZT/tfnEzGAi8GLB3dUEHRw0HKfVAoGQNvSglucv2/vW0ZcNtKtbvM3CZfS3e1qc
         pcK4YlfcLwb8f4H8O+uc/kSVlbQpEuL/qJWR9VU118Ve2sP4qIS3tcNlG86lmLKLd3t7
         gMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793295091; x=1793899891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=77OMp/0RKdeQKOVvIsvn+1zTLaU1Gb/6YMZNIkI1ZZg=;
        b=vI05mOtb5aFInX9uZKWuoJuVqRtB6C3znltqD3oB9zpOOmRDMJKHxgOQbDpzOp0k2j
         ctE7W3R0anZApC/Y0j0jsYjkMUEg0bCP1k+NrVOYYBkfQvm76L61o1AIaNrMYslv5zKh
         uAOP5KI5tCmZU70gV0HQLgeJ1ndBDOuCODrGYJf3t3wfWNeJ6XnAIcdaqtPEX9sp/IWx
         pFIxPRw6ymBEIL/modEwGTa5ou9wBW0u0YVSLu5+V6Zw86wNpcFLG+pRXzjbf7rLHZpO
         EHwbUKWJS6FZU2xI1spMM64GDpvWEaA+Xp1EMASCnqLgFFL53X+aV40sdO0vuE34erNE
         8lUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBQdcWy5PuEs9m3Qoo1mHbQjsfs9KVrTDQU9HZG593HqRljIZq3NxhQpF5uKvEEqBskpkniP9UhePi6LE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhcw3iOQ9GLumfJ5ePR2a41v3KxINiRoJdvVoDYHCCACPvOyFU
	BkunHxvnOmpGZU6fLjN5LZ86eaSEaf43AzQFw+9K48/F6Q8DP/kyuEWJ
X-Gm-Gg: AYBFou3hI80DMpTMkvIlJNm0MZi0Wl6K35xfjYVGMb520VND0+O1xWi4QtL4QDSH+Zm
	C74bFUsZ+WvDT/off7yMiT8eFm7vOCoACqGoEmlQHQE/OiT1TjzWBUWXtY20P4Vd2pZASBjGWmj
	Fu2Og7DJQzQjownaE7fkIzyGLC7tG8I3XHpXpkM4XUJoan0t2VAK4gogs629PK5qQrwJTHHkbFa
	S3KDIVs7NHaB8AVlJo0wNxnIn5TE8cgoHi6wgIgI/NPJZyZZBp+HcEg1jjLtvvilJxSiMQoGgHn
	jBqH/r6pU0EoprGPuMxvEgEhLnhx4zxE9O32btPzcSYW8ZIDxR+hxFBJhIuo5Ghppd8Z8uL49xh
	6CQFLDf63tZ8BZPS6LNAApSDlruvCxccjFTbhU5/FeU4awYO9A+aJRe5bVrB83dnuA2IGAWc9gB
	FPFyxtbLNeX7z/QZlhAjKATkTWCujEdvxusEAMHvPEon32WSW/Ar4xoTMp9PqfAVTxf5w5upkZZ
	JfRfl4elzx+jmyBYj2fbMmDF5L0vp3l8XgW/1boQyw8VqhgJpWlHydX4coNULSheZJQOzJKoVyO
	JR355Rbapd+mvQeTBKxzVcHYKba0oLq/mF/JbXIC0BrAQQ==
X-Received: by 2002:a05:701b:42d1:10b0:1a2:6b9f:f7e1 with SMTP id a92af1059eb24-1a6ced8ff72mr8827239c88.14.1793295090098;
        Thu, 29 Oct 2026 10:31:30 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac0e738445sm228707c88.0.2026.10.29.10.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 10:31:29 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] tracing: Free tracer resources on instance creation failure
Date: Fri, 30 Oct 2026 02:31:27 +0900
Message-ID: <20261029173127.387835-1-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261025165250.65363-1-pocj8ur4in@gmail.com>
References: <20261025165250.65363-1-pocj8ur4in@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Creating a tracefs instance can allocate private tracer nodes, copied
flags and option arrays before trace_array_create_dir() returns. If a
later allocation fails, trace_array_create_systems() frees the trace_array
without releasing those private allocations. The failed instance is never
registered, so normal removal cannot reclaim them.

Free the tracer nodes and option arrays when trace_array_create_dir()
fails, then continue through the existing trace_array cleanup. Share the
option array cleanup with normal instance removal. Earlier failures still
use out_free_tr because the tracer list is not yet initialized there.

Fixes: 428add559b69 ("tracing: Have tracer option be instance specific")
Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
Changes in v2:
  - Add the Fixes tag requested by Masami Hiramatsu.
  - Share option array cleanup between failed creation and normal removal.

 kernel/trace/trace.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 97a058623f94..faa90323809c 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -1456,6 +1456,13 @@ static void free_tracers(struct trace_array *tr)
 	}
 }
 
+static void free_tracer_options(struct trace_array *tr)
+{
+	for (int i = 0; i < tr->nr_topts; i++)
+		kfree(tr->topts[i].topts);
+	kfree(tr->topts);
+}
+
 /**
  * register_tracer - register a tracer with the ftrace system.
  * @type: the plugin for the tracer
@@ -8751,7 +8758,7 @@ trace_array_create_systems(const char *name, const char *systems,
 	if (trace_instance_dir) {
 		ret = trace_array_create_dir(tr);
 		if (ret)
-			goto out_free_tr;
+			goto out_free_tracers;
 	} else
 		__trace_early_add_events(tr);
 
@@ -8761,6 +8768,9 @@ trace_array_create_systems(const char *name, const char *systems,
 
 	return tr;
 
+ out_free_tracers:
+	free_tracers(tr);
+	free_tracer_options(tr);
  out_free_tr:
 	ftrace_free_ftrace_ops(tr);
 	free_trace_buffers(tr);
@@ -8914,10 +8924,7 @@ static int __remove_instance(struct trace_array *tr)
 	if (tr->flags & TRACE_ARRAY_FL_VMALLOC)
 		vfree((void *)tr->range_addr_start);
 
-	for (i = 0; i < tr->nr_topts; i++) {
-		kfree(tr->topts[i].topts);
-	}
-	kfree(tr->topts);
+	free_tracer_options(tr);
 
 	free_cpumask_var(tr->pipe_cpumask);
 	free_cpumask_var(tr->tracing_cpumask);
