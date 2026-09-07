Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C776551990C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799185; cv=none; b=Hc1UvDQciKvJb8IgqWs6OVxMHFL4rXvDGzlx7x9nM41s+Hkj9F/U5GQseflnZYhpWPGRYeVHobw+8L3wKOOqJNzodf59NimZHk6DeyOTkOEMBbHs92NRkorceKEc1Hvo0OtqZtvdkZ8Tx0KfNQCcMy/ZHSGmCp8JOoghLvQr7r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799185; c=relaxed/simple;
	bh=4NloKFPqZMjUIN1w4xBl3NH3xZG6HQaaJ2E3rDhUMfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KY6XAo4H2S1UBU6soNOhG16bBSpz4HxzyGE7QZZn6IUWxuW6M/nehrqroTnq1nanK+ybnywv31AGohpeDj/FROB27V6XZ2gZ0IAbkqi8H3XyWPnJaH3XRcWtnUDE2kT6NwBdt3sNmHOnolvAusB3xlvkjzf5Eq/9T+fzksdRlPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLa2OTBV; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLa2OTBV"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c15cf78d1a2so351136466b.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 09:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788799182; x=1789403982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uwDD4c2/RUpMOgZpwicrnDhtfhOW9xqP82DMYtNr2GY=;
        b=FLa2OTBVVt2ZchezksgaUcigsLZPMWKdiiEvN4CWrvjcmD4e/e52VomQtmsFXLW0QL
         vCe7y824cw1xH4H0nEtZTQnObBkXkKBNWGXOaOwzBTzNQdIbrqyBtbVFMCkE9TlYCspS
         b4xt6JpMwI6iKzBEfw+ojAdFe7SxhycoVy/iJtDhNKC71WfMatcO+tGroD0FFIvbFJqC
         hKQACDREj1mGvo2TZOzNyetQTizB0sUWbyIRNIeiYPBEhJMMVyrQYhQcVYP+UDCO5Z6j
         ujOL0mrVCy1OVQF7NSm8S67OmsASiIiF9kP9IvgrpW9pNUetk+eDTPZEr+XlT7b4lDEO
         7usw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788799182; x=1789403982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uwDD4c2/RUpMOgZpwicrnDhtfhOW9xqP82DMYtNr2GY=;
        b=BzCr4wwJE2IbLdhLJN7VZ9vbZJj51dm/Tsr48c4exza8+sBSJU5oporxbM41UkYFVi
         aPVDaw/aD6UUvFjqxWVAI8L3bYGro2G6wLAfaiwuuYQ8aKqdTcwgN+UuFQCc0P7aOOH9
         byC4Aqk/foPdZjzShYjz6+2wi++oLHAuF0QI/UZefJxFNWholYQcyS9LGT3Tesum3K86
         NxHaWXJ59GZTK5V/ldH6tEZQG6GcDAbnnTMB3LiY1I8WjX4Cjt+BUUzEp49ibNHKZkk+
         Crf/IEWgVPEaYBB68/uImYR7M6AjZstiK+ICajwOgUwlPIKl7IycJufzvt53Y93XLc58
         Q+yA==
X-Forwarded-Encrypted: i=1; AKwUvBy80sOgEQDY3EVQcB1ordo4026vwA6qZvXDPqaZyYLPrJgK+pVdVDyyWnJACyuCpyNd4mHmWYs4YK+oLsg=@vger.kernel.org
X-Gm-Message-State: AFuF++mb+nDgq05R1hiVy4y2D/pTNA6JNwlh0qxWXrx24rq9LY3CPXva
	Lf1fQrjkiz31xGaSxfBagv2pAgGQrx6DmqTOBqZG0avV4tlbBl2sZ787
X-Gm-Gg: AYBFou0dLtOMXYH2SOI7iIjoMio04oP3QxHi2owJ53E4dI/7gZc30pOaw0Cex48cNSy
	J801m6fwyCqpgkeAmI5DSUzIVapFDorzAmj7XgxPvj2Z1TS3p6rTQ4dEda0gW0b67dsMxqrchSa
	pKUSaklMwhZB/WR5cTM3pLODxWSQb547IzxxmohUdYHpSLFmarVnRED4mUm2Zy/e61dA2CK2Xyb
	DvNxFCyYHB34u9FlfaOlWJDWJLYY1qD+gCgmaXSpfqjpLjfDiucex/9mDKS6p6fhjJp/W0lU0n1
	IqONg6sjAX3TXYX9JvF+0aBHN04d3AI1hKKExjbuF83wI3K+n9LIzhkI+uhO9C63FT2WeGveK2f
	HWR8rtChgxZZfC9Gey0M9c95umv4U1dVvSAMVDvPxw+m9F5yVx17Uwzok+vkwRyQQ0kryZXa//i
	XfNhD8NJJ6fhWsQPQPMR1CdXM4aPRDS2RfG0OPjnIqUEiwVSxcyXcJwIgi
X-Received: by 2002:a17:907:d503:b0:c21:792:8257 with SMTP id a640c23a62f3a-c260c994e17mr930468266b.15.1788799181596;
        Mon, 07 Sep 2026 09:39:41 -0700 (PDT)
Received: from grower.astralinux.ru ([82.22.172.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4a8b89sm483434766b.10.2026.09.07.09.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 09:39:41 -0700 (PDT)
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
	linux-trace-kernel@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 5.15/6.1/6.6 1/2] tracing/mmiotrace: Remove reference to unused per CPU data pointer
Date: Mon,  7 Sep 2026 19:39:18 +0300
Message-ID: <20260907163919.183961-2-alexevgmart@gmail.com>
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

From: Steven Rostedt <rostedt@goodmis.org>

commit 6936298393d8d8bc3cec6b704f6a774162cf9bd3 upstream.

The mmiotracer referenced the per CPU array_buffer->data descriptor but
never actually used it. Remove the references to it.

Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Link: https://lore.kernel.org/20250505212234.696945463@goodmis.org
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Signed-off-by: Alexander Martyniuk <alexevgmart@gmail.com>
---
Backport fix for CVE-2026-80689
 kernel/trace/trace_mmiotrace.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/kernel/trace/trace_mmiotrace.c b/kernel/trace/trace_mmiotrace.c
index c523ce5aa495..74f378fca518 100644
--- a/kernel/trace/trace_mmiotrace.c
+++ b/kernel/trace/trace_mmiotrace.c
@@ -292,7 +292,6 @@ __init static int init_mmio_trace(void)
 device_initcall(init_mmio_trace);
 
 static void __trace_mmiotrace_rw(struct trace_array *tr,
-				struct trace_array_cpu *data,
 				struct mmiotrace_rw *rw)
 {
 	struct trace_event_call *call = &event_mmiotrace_rw;
@@ -318,12 +317,10 @@ static void __trace_mmiotrace_rw(struct trace_array *tr,
 void mmio_trace_rw(struct mmiotrace_rw *rw)
 {
 	struct trace_array *tr = mmio_trace_array;
-	struct trace_array_cpu *data = per_cpu_ptr(tr->array_buffer.data, smp_processor_id());
-	__trace_mmiotrace_rw(tr, data, rw);
+	__trace_mmiotrace_rw(tr, rw);
 }
 
 static void __trace_mmiotrace_map(struct trace_array *tr,
-				struct trace_array_cpu *data,
 				struct mmiotrace_map *map)
 {
 	struct trace_event_call *call = &event_mmiotrace_map;
@@ -349,12 +346,7 @@ static void __trace_mmiotrace_map(struct trace_array *tr,
 void mmio_trace_mapping(struct mmiotrace_map *map)
 {
 	struct trace_array *tr = mmio_trace_array;
-	struct trace_array_cpu *data;
-
-	preempt_disable();
-	data = per_cpu_ptr(tr->array_buffer.data, smp_processor_id());
-	__trace_mmiotrace_map(tr, data, map);
-	preempt_enable();
+	__trace_mmiotrace_map(tr, map);
 }
 
 int mmio_trace_printk(const char *fmt, va_list args)
-- 
2.43.0

