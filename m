Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D724E06F2
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790062198; cv=none; b=rDjFwlPRkYnYNzNrYJDve9YjIMGXHJlI2Y5eiQvltqeQbSNZMlSZJ6erOTZQl4UvHJle5NcOFc7tQJfTBlbDk/g+1H+7aTMH4jh1awBryig1utxQSC89fEIOLDclIxH6jUtzpY39m6Mb3qeiNJ93jBvhg1TV1+DaDXu5FnZ4y8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790062198; c=relaxed/simple;
	bh=VQ/CNkma9Ihix0mslTlY/lTNmjjM6C9g2YivHyFT1rU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Bb9NPKrA49cP8gQxX8ATYXvWxEDqeT17XzdGDZLxqznI0NbEGRec/VH3b8SFPXUyHAtgXgVLGYW4Vt9dQLZhlLqpQui/+aGwpJ8DV0nI592Yw8Q43jZ3BhJKvTX5UcEotytkhbqRJ9ibmghPAsUmycdDReiizDEXMP7jRiwWQw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DErGZJse; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DErGZJse"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49d156c917cso3344635e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790062195; x=1790666995; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T6uCmfq+y+LNr8epKsVv0t5gG3mshNFczSag6wmrcqY=;
        b=DErGZJseYNCZobjSmbL4blhybrUj5Pxbljoqbk3AgGSLeVhJWwjL5WnF1SW4aZpQXx
         hxPvnuEVbduhYFt4JK6vQjauQaCi3IG/XOKtLWOElHiG4BD/+Ij82HaU6BgynPjebuW2
         a1dQiNZ+LCeMukwddCf6CpjpNrM1EtSwQ1tld9CKKRiGaehXNMb/xSwPZ2Q2on95eAKR
         5Gpr8zlyJkr+70+BJUR9T7VNychdWAAvjS0xfs+KCLfwHU8hewKWO22/U1Odng/Lkrlv
         SZxqK37vDiEOCahcRIDJmllKDkFmEktRGR4nliWJ+sNhf7TmSpbh4KFJD3zsLdGMSVo+
         jtXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790062195; x=1790666995;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T6uCmfq+y+LNr8epKsVv0t5gG3mshNFczSag6wmrcqY=;
        b=dVG1QLGxyBGADih+Z9LoCkvG8Fyr8xmccYeCAp/UNXthAHKSLXGM2kHCp1O837tq8B
         2/aIspq4Sk2b2qbZKPJJjUVtr0KE/nSvTjV0cXJLVMSRwTdFWrEEoaXLKT8l8G2Y0qPS
         UFs7f1dlkNEsU3uS8d01k6zL02GHTk9D4YHFMw1zOPQrJxSAbIUbX8FQ79j7sMRw4+vP
         qlQZYaqmXfMjTvyI/MKz7zc3cy5dfEP0sqm1wndt6CEK0BVaR0GbZMie5A1uLKlCKWtV
         vGTPBdXif68F08KHWwceLWnyLhcxa30nhTpOZ45dsWDT07/dF7c5GU0C94NDSDEdGCft
         P1rA==
X-Forwarded-Encrypted: i=1; AKwUvBxnD5DF72DuDSNAwA6MPvcWNYyzASkxlrOWbShheTAidMZB5HZ8u2riNpIKDfIjXib4iYDQKs99QZdiaY4=@vger.kernel.org
X-Gm-Message-State: AFuF++myh7cnjB3ys12fparKUdJG/J3LYlEEo52PxF7PfLfAD/qtzkct
	7GVd7foLIDKBmeyeFZjbCMwmQWtFpO0tlizTZx3lWdGNKYed2JM+1s5AOnWVAdxh/32ubIvtSWn
	EEyFU4F+ghJ/dHsji4CGTFA==
X-Received: from wmpi42.prod.google.com ([2002:a05:600c:4b2a:b0:49e:8337:33d])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c0d2:10b0:49d:257c:a735 with SMTP id 5b1f17b1804b1-49fd8a61947mr19151065e9.11.1790062195310;
 Tue, 22 Sep 2026 00:29:55 -0700 (PDT)
Date: Tue, 22 Sep 2026 08:29:42 +0100
In-Reply-To: <20260922072944.1281427-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260922072944.1281427-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922072944.1281427-3-vdonnefort@google.com>
Subject: [PATCH 2/4] ring-buffer: Use kvzalloc_objs for remote buffer subbuf_ids
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Creating a remote ring buffer requires allocating an array of bpage. For
large ring buffers, this contiguous allocation is likely to fail with
memory fragmentation.

Switch it to kvzalloc_objs() to use the vmalloc fallback under memory
pressure.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/ring_buffer.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index f9be87c2cc3d..1a158a24b3c8 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -2620,8 +2620,8 @@ rb_allocate_cpu_buffer(struct trace_buffer *buffer, unsigned long nr_pages, int
 		cpu_buffer->remote = buffer->remote;
 		cpu_buffer->meta_page = (struct trace_buffer_meta *)(void *)desc->meta_va;
 		cpu_buffer->nr_pages = nr_pages;
-		cpu_buffer->subbuf_ids = kzalloc_objs(*cpu_buffer->subbuf_ids,
-						      cpu_buffer->nr_pages + 1);
+		cpu_buffer->subbuf_ids = kvzalloc_objs(*cpu_buffer->subbuf_ids,
+						       cpu_buffer->nr_pages + 1);
 		if (!cpu_buffer->subbuf_ids)
 			goto fail_free_reader;
 
@@ -2681,7 +2681,7 @@ rb_allocate_cpu_buffer(struct trace_buffer *buffer, unsigned long nr_pages, int
 	return_ptr(cpu_buffer);
 
  fail_free_reader:
-	kfree(cpu_buffer->subbuf_ids);
+	kvfree(cpu_buffer->subbuf_ids);
 	free_buffer_page(cpu_buffer->reader_page);
 
 	return NULL;
@@ -2694,8 +2694,8 @@ static void rb_free_cpu_buffer(struct ring_buffer_per_cpu *cpu_buffer)
 
 	irq_work_sync(&cpu_buffer->irq_work.work);
 
-	if (cpu_buffer->remote)
-		kfree(cpu_buffer->subbuf_ids);
+	kvfree(cpu_buffer->subbuf_ids);
+	cpu_buffer->subbuf_ids = NULL;
 
 	free_buffer_page(cpu_buffer->reader_page);
 
-- 
2.55.0.1082.g2b9226bbc0-goog

