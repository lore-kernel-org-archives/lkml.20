Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C253B27F9
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792131409; cv=none; b=iWYDGBkMxvkWTQjp7xZWG74FIGZOkxOc4X0qzbL5t2wUC0d9g8Ik4V7778RPIzdCoUS7nQVl2EHUIiytqy/QQyowzbKMhaPZWWRwwEd0BZTIfVnFkMI3HwekGMCW41zoBSodSLndL9GGXPrrP0dDnlIbR7k8F1IcS08CpBEOkPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792131409; c=relaxed/simple;
	bh=vyDeX8k8/sPjBY1Pb3s9Gz8zKDNgwOVVETru05itzdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tc72+S3cLVmlfMRz+dKNccrzfgfofJoCczGOefiCSDU1sDFmXXK9/4W5AE+FRifjsORHBiVJ2m2O4F/FlH25AZ/nrZ2bhc8Kz37+yFwqqy1HFw+u/js3EATJG49XXq5ujCl+mKGJ+uKekEUyjhklUN9Xs4gCO/XPlD/D8fvIY9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rR+IHqfF; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rR+IHqfF"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so54434055e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131403; x=1792736203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E8EDIcpHqc3pxDbfYRG6SRGOamgW/C6wGExJNy1Xs+Q=;
        b=rR+IHqfF5oKozGZoT8adWuepaIQQqOP3n25pt/d5z1elIFbL9W15aedCElGG6bW7Ij
         An312Zi2cl1R9AxihcBHaSFkVmqBvUoJfOv/E5H95avW+/4+3HVvuu/Tde3sevxJGYhJ
         i3QammZV/5N1KkgbbUUdNevwdL7urK0SBiHPLHYpUkoZwOGYTWc92tlQY0mmth618enh
         LlR9kOtqr5DHjGGVh8cxGLumxk3SfDhVbZqLKLRx7xHAuHhxdnIXxMM6+dbL+4NmfvRZ
         eIsGHQslqcRpo5f2Kq6wcETXkDHDzjkDBfVyczBTAouGDVVatc5byuG/XyF6akUQOweZ
         eXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131403; x=1792736203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E8EDIcpHqc3pxDbfYRG6SRGOamgW/C6wGExJNy1Xs+Q=;
        b=LLCx/iTrQRw6hIs1JXt0d8UGBA6z+39KqTmgAUpWVrxP2gGpWWQGR20kk01cMidxae
         ViHY11RIQS7rSjDom3/4AH90FMJrWOY339WDBSyrtiBOWLHNz/es7wqJnL7rsw1HvsvS
         kCLT4edJouPRYw7SCuaxxMYO+95n0nHhXuI2kCogj9K5P9qRnqCw71u6My1QdepFSqxe
         GH7qg9xqGiwkOu3wTGEXJRF7L1y2yxMaZntWxL5NCXSk/0mll5EGudfAPVGrwc2enDkQ
         lakdwjjUnw32ngQyazvrwtzjXwzy/olYS+q6vDfMM5xgRG0snjjz7bKn+pXRR2AFZvvp
         4k5g==
X-Forwarded-Encrypted: i=1; AKwUvByqdL67DujzUDgVfHy8YsXWSlZ9k0F4ZBcK/rjhSXF19CKwaWSjFJr0tTx5EizTRcXqFT1lXlbIBdS94PY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/2mn7PLk+OxCpz99fOX54FROnqdaeRPfoN5zhKWTYwPES6cqq
	JQM/cyOLHAYHZW6sM06DupugcH3n52yEhvANyMpFf0NL4AflpBEJq4z1
X-Gm-Gg: AYBFou2HgSdP3KKfFCvvcI0GYNLNpOLEaPoB7rNqewKBtzZ8oJd+koFlw/+U03rbH39
	QUYZZ34xYM100MpLwK3PDSR5iaIY5+i3N1lR23hgwDYr7kYj2UFa9AVHHg/MDpBhdSMZKD3/Dg0
	GwHhujYMxH27UKEH1V6HWr67aalZb2DP8aZuln1C1Bl0VhHWZWq+7mlz8qobkM8e/Ke7503xtS7
	s7JOQIf5oTfNq4tHvYU/GuNpTs4a2dxRTmLYuB/DfIahbFvtH2aWgVYuxP6YnwadGOWpKWbehr3
	O0w3s2gCf0XUqB0hlyK1eAZRdEQr/y0JXZYt4zfC4Mll1ATjuBie8z4i4OGRyjzNp0DZL/tr4lm
	G99or5FtaAQt6bSYV5LyVMQfJAyhfgYYcgPD1sFnfDJH9965e9M/+swg08Oyguf54YNPmlcOT2d
	pLK1fPIGfmiTvhOpS0P3/sPMfntX2Zq/UjZrtDIbHsxW/CYUYvpgxsW1sFzzYblPsdVkx1VEW4N
	kA1E1J2v6WGJhjZGKed+3o3MvjZckQXrNzrjGgvTDjhbr7KQrm/3sqYQ88=
X-Received: by 2002:a05:600c:608d:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-4a18e48d45cmr464623495e9.16.1792131402801;
        Thu, 15 Oct 2026 23:16:42 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8abfae7sm14985945e9.0.2026.10.15.23.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:16:42 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: mathieu.desnoyers@efficios.com,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] tracing: Hold trace_types_lock when resetting last boot data from readers
Date: Fri, 16 Oct 2026 07:16:35 +0100
Message-ID: <20261016061638.214847-2-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016061638.214847-1-devnexen@gmail.com>
References: <20261016061638.214847-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

update_last_data_if_empty() is called from tracing_open() with O_TRUNC,
tracing_read_pipe() and tracing_buffers_read() without trace_types_lock.
Two readers can both pass the LAST_BOOT test and free module_delta
twice, and a module notifier can update module_delta while it is being
freed.

Take trace_types_lock in those paths and keep the callers that already
hold it on an unlocked variant.

Fixes: 32dc0042528d ("tracing: Reset last-boot buffers when reading out all cpu buffers")
Cc: stable@vger.kernel.org
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 kernel/trace/trace.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index d3ffbed9c44b..cf8663c27ae6 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -3603,6 +3603,7 @@ static int tracing_single_release_tr(struct inode *inode, struct file *file)
 	return single_release(inode, file);
 }
 
+static bool __update_last_data_if_empty(struct trace_array *tr);
 static bool update_last_data_if_empty(struct trace_array *tr);
 
 static int tracing_open(struct inode *inode, struct file *file)
@@ -4697,7 +4698,7 @@ tracing_set_trace_read(struct file *filp, char __user *ubuf,
 int tracer_init(struct tracer *t, struct trace_array *tr)
 {
 	tracing_reset_online_cpus(&tr->array_buffer);
-	update_last_data_if_empty(tr);
+	__update_last_data_if_empty(tr);
 	return t->init(tr);
 }
 
@@ -5371,8 +5372,10 @@ static int tracing_wait_pipe(struct file *filp)
 	return 1;
 }
 
-static bool update_last_data_if_empty(struct trace_array *tr)
+static bool __update_last_data_if_empty(struct trace_array *tr)
 {
+	lockdep_assert_held(&trace_types_lock);
+
 	if (!(tr->flags & TRACE_ARRAY_FL_LAST_BOOT))
 		return false;
 
@@ -5387,6 +5390,16 @@ static bool update_last_data_if_empty(struct trace_array *tr)
 	return true;
 }
 
+static bool update_last_data_if_empty(struct trace_array *tr)
+{
+	/* Avoid the lock on the read path unless this is a last boot buffer */
+	if (!(tr->flags & TRACE_ARRAY_FL_LAST_BOOT))
+		return false;
+
+	guard(mutex)(&trace_types_lock);
+	return __update_last_data_if_empty(tr);
+}
+
 /*
  * Consumer reader.
  */
@@ -6479,7 +6492,7 @@ int tracing_set_clock(struct trace_array *tr, const char *clockstr)
 		ring_buffer_set_clock(tr->snapshot_buffer.buffer, trace_clocks[i].func);
 	tracing_reset_online_cpus(&tr->snapshot_buffer);
 #endif
-	update_last_data_if_empty(tr);
+	__update_last_data_if_empty(tr);
 
 	if (tr->scratch && !(tr->flags & TRACE_ARRAY_FL_LAST_BOOT)) {
 		struct trace_scratch *tscratch = tr->scratch;
-- 
2.55.0

