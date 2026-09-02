Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C165331EC0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352123; cv=none; b=uOfSgyQctQVUczv2z4zS1DWBHeyYa5AFXaAXqDPPvt6FocsIvAWnHjLw2THB2bQaTl5zIja0LMX9QSmmE0sM0Jg0DSjR1Q+3GZ4ndR2wnszk8Ee3Dugb6Jreg1tR9ES7lZ/Or4w5sCqHpnEyaz+fITILQKR5Vk8mTdf1nJ2zMvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352123; c=relaxed/simple;
	bh=hmh8EjF3HLSYa/gyqj5gS2rSugOb8h1KFM42D3FVfyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kZ96UzkPl2JS6FcTd1AGNbKIn469vvARttKnZ0gilxfTogFo7WEc977A9SgxRUt1imestiheQyJQ8FIXHLkm2cS6J90wy7Kp5S8tunpq7E7nDQ6XZYrQRi4zy2XWxMcSClTA0foXRasRbipPrsal1t5UHkRBGbYVMqlSNKycO5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pPwMJsjt; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pPwMJsjt"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c250a2bc3b3so118742666b.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788352120; x=1788956920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6NzEuOlmG1N6RZ+zTmMfDE2f0Li6dNShSm/jiydeaI8=;
        b=pPwMJsjtchOiCSnZc5BSTQ1TD8eQJI7YEbNsutyuKV0aGRWHQaPRHsoXygmCcD8oZ3
         5QWYzURRSuGsh/bYQQi4gvhxpEHHJzFgjpMNPqti0xkAFvVza4lsXfd39R+/rmu+6B6X
         S95ShdHj0c34pE6ZB4OIBfwMAtz08AbAwri9DHm1ogAQL4tIDjogL1+R9je2t9S5DhPY
         HANJlo3q2bBflzRXKbF666+Qop8In5E2CKc1W4TiMHi54JjlQ2dlouxPT0dwg4XvOsHN
         5r6ugtQJBWGIBVy92grArIkmaAW1NLZwvYvgGnnPI4f+6jLSq6P6uhTOFTWkTiqgpyx9
         yGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788352120; x=1788956920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6NzEuOlmG1N6RZ+zTmMfDE2f0Li6dNShSm/jiydeaI8=;
        b=Heo7qqtpk7JAUrOgv3oyX3OhILCEpxNmo+jX6sIHB5uIDHtXahfu++W5z7PsUe3oEp
         a8RDYE4rJTtQq6fehd1D1fNu2wQ1LkThfN8QF1Ah6+3G0c1guWPo3QdqX9eBKlDoaOKR
         2+AXXsks87ZwXmW01t7fZsdbF3SBPrP2SMruT8RzCA8AxHsF37jGxCjjKcK0wny+Zx1U
         NYfpNkvjP7qgZVNrtNLw+DTzSP5i16ZH0rETevO/18pUlEXXb5VNuEcLRQpt+3BJs1cD
         BVD9oW4bqeGM7b3AMHOm7i0YMeJsplGL1NBQClpcOA5ZQwEXBxm1G3evS/YrU4DKLCJd
         5iDA==
X-Forwarded-Encrypted: i=1; AKwUvBzLTgOpd4ItOzNsj+7bBXWPbp2Hw/IW8Tf+54NdTpCkoPtFUX07fOKFA9KufqtBAZsQAo+dLxkYrJ5TmTE=@vger.kernel.org
X-Gm-Message-State: AFuF++lXnLwPnbwDwqbbkhCWRCP6Y80WiKMjax/2RcW1836dm3UAWDN3
	F2+SWKuOclkFa0cVcUpXguXkBKTuutZ1hpDvjiPTdvhIz2txfkuOUq3AUyjeWwbU
X-Gm-Gg: AYBFou2aNj0coI+EppMe6ZWO9HoFEEJUwi1zvT6eLvQR/rGPwLRuHoDrNKrd6xLt+jA
	DinCSOm5dx5PtY13I8Cucb3viGirMMw62zcTKrRWKf0QvDOcS7dtmUvlTMgff0TTjmEY6xcaEIP
	0b6KqQlslJ20FbedKjN+JJ93l2hTD/kqUtGFiLrCNffl+pYhtoDFW+acYcn1kesBubDQ/ha+7EZ
	Ub1/NjZLp/NhbeBQF0dl5lpvyifI0PXuecHThx3yWeVa1aRqcUqp2njUDK7pxZkVwJjRATrMXeY
	4LxCElw133Z/7snL3rTUhr+oDyG1ukLpKyOZWj7hGh5fYhoTMMHl8NdtmwgmUr8cFlXvLeTGJNQ
	W3yyhEzKOYz7/Ylw/GrMqLZ08BxwOcDr1mn5jlSjDXRBSFj69xCz/RaJv2DP7xJYQNns6K5jW2b
	zML+LDfDtbDVcXDtgp25n9jTy48b1SwkoEeheHtY0E/TdkPU5YyvvrJMasnNHbqmXFtXpiTTs=
X-Received: by 2002:a17:907:7247:b0:c25:c54d:d1a2 with SMTP id a640c23a62f3a-c25d54fe6e3mr285533466b.18.1788352120261;
        Wed, 02 Sep 2026 05:28:40 -0700 (PDT)
Received: from grower.astralinux.ru ([82.22.172.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d03fbb75sm123305866b.49.2026.09.02.05.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 05:28:39 -0700 (PDT)
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
Subject: [PATCH 5.10] tracing/mmiotrace: Add NULL check for mmio_trace_array in logging functions
Date: Wed,  2 Sep 2026 15:28:29 +0300
Message-ID: <20260902122830.447370-1-alexevgmart@gmail.com>
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
index e8ae2d92a678..da63add45faa 100644
--- a/kernel/trace/trace_mmiotrace.c
+++ b/kernel/trace/trace_mmiotrace.c
@@ -298,11 +298,15 @@ static void __trace_mmiotrace_rw(struct trace_array *tr,
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
@@ -328,11 +332,15 @@ static void __trace_mmiotrace_map(struct trace_array *tr,
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

