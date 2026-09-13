Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7433EE1C5
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 13:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789306715; cv=none; b=Ezu7VNXjefsXGSCWlfECCCeo427L4T2cRQYU2q3gD7dw0w1EWCs4+KYqziL1NBkhhixbSEl8VEXjve0hSOjalmP8W45ROp/LhuN4vJO/WcdNAoAryNOP4ZczyDVB1ShryUG20fyR3yx6jkOc0Wxmc7bgP5cepAI6hD9BaSKJmRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789306715; c=relaxed/simple;
	bh=Ci44wgDN0GN7PC0pFLwh2qIUZhXRf/cUbP346xyKCR8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XrJv8Ni3/8x641RISGiYXC5EfMPWImcu1UpXXiVei5WUMpaEbaxZe9Jf13owLfMRSibNfST2Oo3zXh6GttO4jeBtospVA+RjGh5KqnRGC9UIGdN/4ieAVyQ+IjZ52YjYomUOorZ0kgECp8qpO0Hqh4LLTzpUnZzahqer1b66lvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3SgTIMf; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3SgTIMf"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f0b20so269783666b.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 06:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789306712; x=1789911512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MNT4kKLCYJ3hMXnGWz3Nru1slAulvkgUfWcgV9YmQ6k=;
        b=X3SgTIMfYgCcgIv8hL3Z5GPOAgQ3VrUzmFd7LHFRZnbcmBtPPPHkPMfAHUI3NuEN+H
         22YFdtG+A+eJQy4/C5UnzTJOgwen2Y02U4OaF2AqZWnizjFuVHGIZ4/a7MmV6qaFkBX9
         lGMdscULSDlDX3BrO7aWFdb4dha6eBHBZdqLgS8lhsbqcTNe97EHrzAoQuB2OSl/ihXU
         FuL91YAZ7vYC2XJlY57l5f3SD2e7X6AdPvVcaWVidyh+mNqaSXi0qexPa3XKuBE12MRw
         hSjK2Rr88ZpxcO7imihnUKiF1DT8aEwWTdHyTif7D1f8HtXcEGO1Lc7fEYrP8tQGXKvg
         d0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789306712; x=1789911512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MNT4kKLCYJ3hMXnGWz3Nru1slAulvkgUfWcgV9YmQ6k=;
        b=NoXIH5BAisgynpy/33tFUpClGChBXEGCY9h11s6WPXPFeabk1UDvavvfzzB/4O/rJz
         KSQp8Iqd3H4UV5vejeGb22Hj5aWuuNUP4ENciO9XfBd75ILcfn/eFkPsNJBnWfcRcsc8
         k+n3FHwovHn2c620hIlY03FFmjR12pk3IP9qam5I7/lvaanYJ9zuqoKbmxTCjm0L5QC0
         yoEwCrEUGe4DV3VozalTUuxIVE8b9PIt9rw5fIwTAiCVTM75wOcJ+D85cIa1/KCRqYoj
         veIKChKL7lCOahnL0JWdGGdQXX2hq2rceQ7oP2BJvOym8IKJmbrmh/v4Szh2ZeB8swZr
         hD9g==
X-Forwarded-Encrypted: i=1; AKwUvBwM4YoqKIfnBme5Gvm5fBnfnoOIVlmmBlCsxa3uxtQH2t1HDaK6D2A27tSMVqLN4kV2A45nH9NuornIfxo=@vger.kernel.org
X-Gm-Message-State: AFuF++mEc3g0jvHAguUonJMgyCxYAcAHaJo06C7K1KiR75fmBPWvdGPy
	ArKUIqMLBuJ9dFa7r4tFjDia5g2y9azrrgmHtCpYlj6hawtMvYtzRErr
X-Gm-Gg: AYBFou0MIZwF3uyCyB4bAHMgo8Fok7z6B8EqYEoIoYxPbpie59WJEe5DVnUJPgCnpTC
	WDsMZtoH7KCkd6OjcXzX42NYNB6/kzsm04HyDA8D2Ed5ypVkpISAEN0QymTql5h2fUD6IcSUX9c
	0eNW1hBB13ANpxBeZ7Ko3vRxUVaO6fVF1qRcVQ4MZO72lpnghLiEYzp+NkYBdVVmfLzeAJUADCn
	AmgMjjuw56wglP9tjjFLGcEbEQqxkmiLa0Vo3Yrp7kzEkEvI6TZPTU9MSPCGbuJ3OA7hGQ8bkeA
	tX4kTxR/sWr0Rtq9bZsxXTwZBkiE+6p7mqNj5pyscnuMDErQQ6e6KyzWXLRGWRHi+V0mPWd8YHh
	FUD05cZBeG6SSxmx3kXWGw6vx4br6tOYsxItl5A+9FvQkt7K5fLNmMt+Nhx28mcKsrH/xLNOAa1
	BbbGlz118NoweE39QGjKgZhysNEWktptPlP8m5JJOQTyOpXTFB6M6P7JDe4xekZywzM9k1FTCyd
	mt1VufMCi0o3pIXfbGNgXZD0SimP7mXaSgvcyyoEgcO0L80x0wFiTVpDvI=
X-Received: by 2002:a17:907:724d:b0:c25:5114:c832 with SMTP id a640c23a62f3a-c29665acdeemr1295728466b.3.1789306711662;
        Sun, 13 Sep 2026 06:38:31 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966021c63sm295852866b.13.2026.09.13.06.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 06:38:31 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH] tracing: Take trace_types_lock when dropping the buffer_meta reference
Date: Sun, 13 Sep 2026 14:38:29 +0100
Message-ID: <20260913133829.15307-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tracing_buffer_meta_open() drops the trace_array reference with
__trace_array_put() when ring_buffer_meta_seq_init() fails, without
holding trace_types_lock. Use trace_array_put() like every other open
error path.

Fixes: 950032ffcee7 ("ring-buffer: Add output of ring buffer meta page")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 kernel/trace/trace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 8658cad53cb5..c8295324ffaa 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -5881,7 +5881,7 @@ static int tracing_buffer_meta_open(struct inode *inode, struct file *filp)
 
 	ret = ring_buffer_meta_seq_init(filp, tr->array_buffer.buffer, cpu);
 	if (ret < 0)
-		__trace_array_put(tr);
+		trace_array_put(tr);
 	return ret;
 }
 
-- 
2.55.0

