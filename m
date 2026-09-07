Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9905B4ADD88
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788793675; cv=none; b=Y/hKvGFcu5mWbTvN3xaN7m0cH/KiO3jS9QQ8Io1lKJH0Cy6w7f5IyXwbtgfpp8SlyKQ0LJYxHDzaYGDHnfugtADscL3xaEUBQ+qbrIcvFKTR9RbUSIXHbr3sA7xl2zl5jLrjSLdiMDkUj70Dm++Imh3NAhZb8OQfClvw0oFXUYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788793675; c=relaxed/simple;
	bh=QIW325cnNhaMcdbwLES3qKrrKOmDydBwFAQQk6R+p10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YmCuYgA7guH55AOIFNkxqgPTMTN/IUVSrkd9UPZWob5aMvXU4g/dW1v6W+uxb62RlMFI/Y0oGmm62Egq6SEXNiX3e+WxxtpND09lPW1BTi9yrLutAmCFWp1+y/kYc0eeuYzyHP1j69xG1uotwBW9jsIrUtRoJPr1d/jX4mHCrQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iPQjYbIy; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iPQjYbIy"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c253425b253so523820966b.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788793672; x=1789398472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t0UFyMkj4yYcM7C9qagjMJD0/AtaB8gajsJEK2CwTCQ=;
        b=iPQjYbIyxf73OTYkMOoCUR6O/68sStd2SWgDycwrJOfwuz85JadFOBl44GBZ4sgaER
         DsPpT8R7dRjdthk3/ndAbKTvFSxvd+fIb8uYmgc2b/ghM17vWBibG7H+xaAm9+BlIZcV
         uqO/0dfl94FIE19W4eGFq3QkxJnRSUTvTb2DAmy0OGQPkaLBxqk+coyzID1lqQ7vjOLY
         0dYGoFlO0pIqT29rT038tAtbEMKSLVypSFipfJMYIIWl9iOFguhu/Ie86HUP0/aH8OpM
         54rEeXIxOXIB4zXDPor8Uuuqp1q7OpFPnl9MT1fG0IQDV+IK4wB/AxypEAZlqka4fsSB
         9Tcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788793672; x=1789398472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t0UFyMkj4yYcM7C9qagjMJD0/AtaB8gajsJEK2CwTCQ=;
        b=bULjxVUqvsBYAOyxm38752MWKZeqVzKI6cSfrov6i4EEcaH7S2XnaQyjNvof4lAnnb
         CN0LRQcVirEzXfW/a5toPBQqMndV002xaoPPWXJ4huLGTgoUM5gxj9tsTC1EsMmDYUgN
         ir+V/RKp+rRJc6jH7vAvYrIyxAHk8lXm4ln6jTRhy3Kp9iukCPDw9mMd6uS0PKK85qrf
         wcY9qEGZOqAw4FuurXtDHFIEK6u8suw8uyzFB02oiqfn/AGEp3QoHoJJjvSpHQLW7qOz
         L8u1X5UWTFp2pDwZC15KVtyHvzWGtxbhAtHzOehJ/NMD7C1ehgKmpNhBOdlWnRBXegNX
         Fo6g==
X-Forwarded-Encrypted: i=1; AKwUvByhsCYuDz/roCVvDVYfalB4QumClIR+y3rwJQALrqK/WUCvlLBPTzKSFXKccZ3bHzuzR98nOXQaXI2zjYw=@vger.kernel.org
X-Gm-Message-State: AFuF++kibYuCrO09C7fzYItEVKkVlz9EFiUUbWQp/KUDSuoG/Rki7DpI
	T+Jbvk7idjAMgUd/k9hsOrz40pOvJEZJgaRXuAiKl/8OzZYjU4W9uxBp
X-Gm-Gg: AYBFou2w2WYdEUttVxl+sb2A4egan8QWMZK4Sle1nBNzxne4Dw8MNnrJXBmVyADxagz
	Va8a37ngQjFO3pnIWlbvYdEiz1XiEuUt3Aq6uvspmz0xY7oNFRXV9qL0EE84HtYfmerbhcsXfYX
	iiRgleq9Zf+zWTXaLqmeIlhunF4dd0LXoicDnkKwz19L2ClXLyZNTQZEPF/Vf0w+Q9gDVvqkBtU
	IGiWjqPcxPxg3s3rhRkJOw9RSctgrNcO2+5GkHygNEpWg6+ltHTPwKgq23Y2kGl0iBoYeUvA0C/
	0Waa3wClzEsTMCdTnjFztWAdRGilJ574RfhZa3NyekZyDNW/ISU4yOG4+O7U6EbwHr38X4GZM4j
	7F9Mf/K1SumX+zJQ51fhAkC2bNusUbGmOkhJXLs6M5a2o/1VVNlFdh7dYx2VUrRA4u64RXZAr3V
	OZi2A74WAoU7kquZDLV1XtQmGh56wIUnAjVKQQ7e7waqZlWfAp8xkETTfB
X-Received: by 2002:a17:907:3d44:b0:c27:420b:7c90 with SMTP id a640c23a62f3a-c27420ba0camr424931166b.48.1788793671549;
        Mon, 07 Sep 2026 08:07:51 -0700 (PDT)
Received: from grower.astralinux.ru ([82.22.172.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5773c5sm478376566b.40.2026.09.07.08.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:07:51 -0700 (PDT)
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
	tglx@linutronix.de,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 5.10 1/2] tracing/mmiotrace: Remove reference to unused per CPU data pointer
Date: Mon,  7 Sep 2026 18:07:25 +0300
Message-ID: <20260907150726.168416-2-alexevgmart@gmail.com>
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
index e8ae2d92a678..55ba76bea98b 100644
--- a/kernel/trace/trace_mmiotrace.c
+++ b/kernel/trace/trace_mmiotrace.c
@@ -294,7 +294,6 @@ __init static int init_mmio_trace(void)
 device_initcall(init_mmio_trace);
 
 static void __trace_mmiotrace_rw(struct trace_array *tr,
-				struct trace_array_cpu *data,
 				struct mmiotrace_rw *rw)
 {
 	struct trace_event_call *call = &event_mmiotrace_rw;
@@ -319,12 +318,10 @@ static void __trace_mmiotrace_rw(struct trace_array *tr,
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

