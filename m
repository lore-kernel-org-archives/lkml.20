Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576DB3AB262
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792125897; cv=none; b=odAWYUhbpjiXVXmnfAAGlBhFRYMqVcWXBmlvZb+9twX20opSfuiO8tNrgwowfZZtJNAUlPSqv/T6Tkjk++XLp3JTwX8xNl2Hc2N3/6DLRsngVT5+FIAd/DhtGBPc+vvNRhLOAkHuQ8cjPkj2XKzy75BBADVcUa8ZmXSYRiQYcfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792125897; c=relaxed/simple;
	bh=Ox61pttbiBLLWNPmOmvw27Gj/cOcFvo5KaApryfbcGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zz/ku3fEb7vwhnIiDsVEQXq9ZTIyT5iJWCM9KjPelwCvrAyH6GHldA06sFUrPXvjLxoP+EszKswVt5Zus52FodQu+oiYIV5xs6oUV/PXjmV1m5PeutlKaKrNQw1cZkIZ1d+6fLbYRqpQwHxvprUQnEgCaKM4PQ4+UB75p8Plgeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gtwiFSUY; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gtwiFSUY"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e940d5d2beso10544195ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792125896; x=1792730696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJFVSgny9QpsatjBhIUNhY0HvYxuqclO1o6tI9EiK6E=;
        b=gtwiFSUYlRf6MAdln9zF8CFOVSh7A7DThBS3c+Zd/+DEBAwp5UbEAUkqmfUByZB2dW
         F2yw4jE0z4ldGIJVjypa23pFpIWFr/CZnQCeQ/kh9RIhDovf98ksUo+wSaRXW4OJBtpy
         xL6y5UgrRYlic9Lh31qaSwo8DbNWO6pVLBWgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792125896; x=1792730696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GJFVSgny9QpsatjBhIUNhY0HvYxuqclO1o6tI9EiK6E=;
        b=sjSiSQseovfkddeUqByA6DLgxtCyQDhHzqkGI+TIcdM/NotKPlqQsGOVVo8XERzyu0
         i6J92IFr0wJOhxFIOJNQIVgfJLYDu9VvZ+AlkkrM54jx2BcK7CWTGUYVZOjlbNTZREei
         92cps0VVq3KsTg9UvYmDMo/l+1KbxqRUn7mi8yf77SQDUQ9GePcAjRq4msSQppGTXfE8
         ZatDwfVoD9J9gbRF5xUIlqNUDFDwL/gfAeShPvysaYeN7oT5hj/9hSqXlLSq4z+lf2gV
         JeOkruqSCJJfi0tRLvijlRaLYPObyl+bZZp22q4v8Y2T1EZSCRZpq0P9pRU5IlBYFMV1
         UGiw==
X-Forwarded-Encrypted: i=1; AKwUvBxmwXs+msdTtgeH1Kvzb9z3PxT9Alix8WAVcf8uBz6LkEQljz0pJClB/NvwJSBwCG+0FAARvAKJn736opw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHRVIA4Ckh0n1UmOVgdx0UuvHmvMaFMO2OnxmO3M/GAX/21OX2
	O01hDnj+ls3+E5eJQPvHhfjdBfQX5UISYn78s640U+Efz8t8AxasJtRIfguD0TTxiQ==
X-Gm-Gg: AYBFou1HK/VV13P8fD0PodWtOZtcuEQOLI69iYFK1aeN3UQmn1805C38mj5mARx5uaE
	eMcC9+2miUg/45ntche99nZKWM7cgz/leTTx6EaLsC2lRfn22HwYqCWVCzga3SXFVjLKHmqAecw
	rt5ftd07zQiAgIqhDUL3uDO+QLNKrB3JrHSS/orHOtUsj3xW2l07yT9wyPlZa6DYNLoWle7uVm3
	NAx+BgEakcEvMyfPwOa56mQHIkhegf4RrIxUjztSmf4VnKhqEr2LJtWIQ8ck5Eli/eelXD9xDNx
	DUqtknpxKmEwjwbMK8mQqQJS4q980g/tC3TkzD+fVojtZBUKSvXX9tnn6wkukAEUyvoA8PamOjX
	E+6wPpNzhuIvv9YVKVSUGxh/Dm01lHmcKq1BcamJdWrE8rtVGY4lCip7tGkLTXZtbRqzo8+TZiE
	RKKgGe+fF7hyQdBTlgkf43JitH3o0sp2t8Y0uOMuqtYZ5mEbRo+16PxvXLDG8ByPjz0qv9Puf25
	Qt8hwZbyErX3dTOgtbASmG27/Uz4MlzR8L6m7qCjZmAkJ4XWM40BjM1CLS09Ps=
X-Received: by 2002:a17:903:1545:b0:2e9:52dc:4c10 with SMTP id d9443c01a7336-2e952dc4ccamr48301585ad.18.1792125895819;
        Thu, 15 Oct 2026 21:44:55 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:a579:8b87:8304:7ac2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8b1b5esm4137235ad.67.2026.10.15.21.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:44:55 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Barry Song <baohua@kernel.org>,
	Bo Zhang <zhangbo0325@gmail.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v4 07/12] zram: zstd: do not use kvzalloc() for zstd allocations
Date: Fri, 16 Oct 2026 13:44:12 +0900
Message-ID: <20261016044429.1304561-8-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
In-Reply-To: <20261016044429.1304561-1-senozhatsky@chromium.org>
References: <20261016044429.1304561-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a dictionary is configured, zstd allocates all of its memory (C/D
dictionaries, compression and decompression contexts and compression
workspaces) via zstd_custom_alloc().  zstd_custom_alloc() uses
kvzalloc(), which falls back to vmalloc() only when kmalloc() fails,
and kmalloc() rounds such sizes up to a power-of-two number of pages.

For example, on x86_64 with a 110K dictionary, switching from
kvzalloc() to __vmalloc() reduces allocations from:
- CDict (level 3):            512 KB -> 400 KB
- CDict (levels 12+):        2048 KB -> 1552 KB
- DCtx (per-CPU):             128 KB -> 96 KB
- CCtx workspace (level 3):   128 KB -> 84 KB (per-CPU)
- CCtx workspace (level 14+): 1024 KB -> 764 KB (per-CPU)

Use __vmalloc() for allocations larger than PAGE_SIZE (and kzalloc()
for smaller ones), which is also how zram allocates zstd workspaces
when no dictionary is configured.  zstd_custom_free() already uses
kvfree(), which handles both.

Acked-by: Brian Geffon <bgeffon@google.com>
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/backend_zstd.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/block/zram/backend_zstd.c b/drivers/block/zram/backend_zstd.c
index b367049f131d..7a8b5ff186f2 100644
--- a/drivers/block/zram/backend_zstd.c
+++ b/drivers/block/zram/backend_zstd.c
@@ -26,10 +26,17 @@ struct zstd_params {
 /*
  * For C/D dictionaries we need to provide zstd with zstd_custom_mem,
  * which zstd uses internally to allocate/free memory when needed.
+ *
+ * zstd allocations (C/D dictionaries and contexts) are large and
+ * long-lived.  Don't use kvzalloc() for them: when enough physically
+ * contiguous memory is available it serves them from kmalloc(), which
+ * rounds them up to a power-of-two number of pages.
  */
 static void *zstd_custom_alloc(void *opaque, size_t size)
 {
-	return kvzalloc(size, GFP_NOIO | __GFP_NOWARN);
+	if (size <= PAGE_SIZE)
+		return kzalloc(size, GFP_NOIO | __GFP_NOWARN);
+	return __vmalloc(size, GFP_NOIO | __GFP_NOWARN | __GFP_ZERO);
 }
 
 static void zstd_custom_free(void *opaque, void *address)
-- 
2.56.0.176.g3575e65682-goog

