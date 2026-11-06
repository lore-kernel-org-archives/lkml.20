Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988487;
	b=GKkhkM27gB3tAl+/+GeDX/bUL9GMI6GNQ41t3D5UpfXIHrNFeASyBQqFXzyYWEmxtER+
	 7fAVWGCaizhfWuxh0uWZYO/YrIgy6IeY1QsROKe+rvdQT//RROHBCn104ToVcWULvNlYv
	 BlELTe4gwPkZVilk1bKbqtRiEkZStniyHiTBsLzJKuoBan+SUkL76oRxIJMeKApApuJS6
	 gm43Bbp1vsyGdeqSSQA1GImfWWc4rLJOSbzuh13MitSlIv0UAEEWj8m2cEnccT04Zww77
	 fC0t1F5ahi11jChX5XqPgBumkKI4Dp+VhCV5rD7f8BRG6h5xa2wX+DjVFTl9nGE/xmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=qecdV8eTNCl493bY7vGgQbKVbShINe6rlolLmOc6oQI=;
	b=34780y6kh3GGJUWZzb7NlcaovGlUTfAHCyTvuIN3HS6JR2kPJbA/S3++g1bYmdlS8KSX
	 f0Txl0frUG/Q3CFniavnyh1AGqXuduW9irRvltyxUMqyP3mLRNw9ncFXYDAMmOGXrc4gN
	 eyuoMle08w0Doo11nKo10z4E87R44bS6w8pd5ZP+bdgHiyHSCRa7kb8/r9ndw9c5SZ+yV
	 UOBg25UkzPmsL1FWSXludc0OXI5pNBgF5NceWe5Y7h8GmJY5OhPgkLgAJL0JrOy+o92Qp
	 /OKatE4y1oMiRjXxRmrLap1/eRe0tKKoUFshXdy3XNGyyb7glMs0P5XOttzbQlgohzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e6Is+m+z;
	arc=none smtp.remote-ip=209.85.221.71
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F7A6082BEB
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:08:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63F7A6082BEB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e6Is+m+z
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e011829easo653309f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793988481; x=1794593281; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qecdV8eTNCl493bY7vGgQbKVbShINe6rlolLmOc6oQI=;
        b=e6Is+m+zM4gsRbuAZ0y0CF9pa3Srdf4jC9H0RbcgGSSLkfImjQuKUVX3qkNKrU9YIg
         zKBz9ij5fTBUgy8jMmyDTdW7aycc2J/z05iIdwJmpyaUpZA9Uw3TpNjH5caoE85m0piA
         KMnYs2HJDK+LWq/9XGZQPwd5cVu7XpbBo0ydli7yKvWcffWJtJKfjoIn5zZ6NPXcSRQn
         XcCchuoE4vb8JNP+VinpVHZaVvHHeW8qVAFSZYliVFmlxoIquDbJYH/uXDJBzTWDll43
         fsyQFvYnq6Zf4Le+gAx4fb1a2Usx/8odmjWn4kV201nePeq+/kkjLLn2XTvvkNBkBrmA
         omDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988481; x=1794593281;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qecdV8eTNCl493bY7vGgQbKVbShINe6rlolLmOc6oQI=;
        b=18WroX9wtXUvm+BIEbCkDhFA22CggjuKRNrm5Jy44iZ6DUcDakyWzV6ftTUCHJaE2o
         akT4vYqsYxYtPWxtfKaJZCzQcZUqbfU4SVswPdmc4aVxoRyHT8eGLkBbfTF6++hxLKdp
         j5GDw5YZ6iopSar26Gf6vkhWRo65bBTmKz7MFfJ8TEWQVIvVorT5RD3jVHbKneBkdiZx
         Cy+5SEQzl4N3fUKk6wicSbu1KG+CxzOPjhiAqI2fI2XQ6PG5Yk5IrE+8XwBKNvrMJ68E
         OHbUE77gYJHY0dgGdjgBThgZ4oEs3CA0ChJDuwdVy65EGcIN1k2eub2iInHEOOFPwiVn
         5Qtw==
X-Forwarded-Encrypted: i=1; AL+hErH/u4knON0OlbK6XHm1rTo//lpLjqyfMMea1PO47s/bKg1f/lN0gJHpOwP1WNWPfEOC4ViU4VPdleB4r30=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vHVYaHCRBsR3Go4v1aQuXMgABIMOObAQkcPv8QV9prglha6Ga
	xqErBkDMB2cXQvrmFCPPSVD2Dvj0I78pqJJ9j34fZ9wzKhy1YJZiat+sXpcHZdFTeUW2d9TjgeS
	aOoPHKcKb/lrCpADwD1YlIg==
X-Received: from wroc13.prod.google.com ([2002:adf:ed8d:0:b0:48e:7f1d:d017])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:310a:b0:48e:5444:a1d3 with SMTP id ffacd0b85a97d-4927e553b25mr5552552f8f.11.1793988480221;
 Fri, 06 Nov 2026 10:08:00 -0800 (PST)
Date: Fri,  6 Nov 2026 18:06:51 +0000
In-Reply-To: <20261106180657.2460376-1-vdonnefort@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261106180657.2460376-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106180657.2460376-16-vdonnefort@google.com>
Subject: [PATCH v8 15/21] tracing/remotes: Use ring_buffer_capacity() in trace_remote_has_cpu()
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

trace_remote_has_cpu() calls ring_buffer_poll_remote() only to check if
a CPU is in the trace_buffer cpumask, needlessly polling the meta-page
and waking up readers. Use ring_buffer_capacity() instead to check CPU
membership without taking reader_lock or triggering wakeups.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/trace_remote.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index 3dbb4912dbd6..276bf94e837b 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -351,7 +351,7 @@ static bool trace_remote_has_cpu(struct trace_remote *remote, int cpu)
 	if (cpu == RING_BUFFER_ALL_CPUS)
 		return true;
 
-	return ring_buffer_poll_remote(remote->trace_buffer, cpu) == 0;
+	return ring_buffer_capacity(remote->trace_buffer, cpu) > 0;
 }
 
 static void __free_ring_buffer_iter(struct trace_remote_iterator *iter, int cpu)
-- 
2.56.0.455.g6c5a503b38-goog

