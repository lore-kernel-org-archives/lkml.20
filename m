Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20063DDDCC
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792295524; cv=none; b=tcdQVsgLKyWdt1hLgHS0NOr/nXK/2AFDAQ87eJAHXXuNKTyJMKJMjlnd0CYGi8JdrmhaRAo0iVoPfdhhxFqwl73NCbCEg9syD/dOEqdTIzRdZEM9TZuNpjnPVYFtcxJbeWtpv1f0U3eemir8YZJyikH217wZ8I2/b41BAXg2CoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792295524; c=relaxed/simple;
	bh=Ox61pttbiBLLWNPmOmvw27Gj/cOcFvo5KaApryfbcGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Znwt2RTAcjG0rg1RUJaORFxv0y7PWp9IlO9M5RpqDvoNLwBh9g+JFD0JecIWzQty91QQfJSa/dxwSKuJqmnRQ+ZFMtwFF8vtBP+VwPEgF85E2CsLOpzIoaCbVvxMu6Zn5SXdgBLpjo6wuNJuObpAsEJnslyhv+YFOykcdndQb5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=j2WK1GIj; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="j2WK1GIj"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ab98332238so855396a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 20:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792295521; x=1792900321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJFVSgny9QpsatjBhIUNhY0HvYxuqclO1o6tI9EiK6E=;
        b=j2WK1GIj+SrQYaHBfDJ0nHVKXXYtNOKXq8q9eho4ZVx6ogIq+8eEA+Eix6izXs5DxH
         +1Knntzoc++fZJTW8fRe2mPZIwgYi3ouRIj2L7JtzSDE+ps5Iv3ZO3r4FDaCY0Iql7wH
         2TKmoQ0AnGGf1uz3/veevh+aqCo3EDDdk79MA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792295521; x=1792900321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GJFVSgny9QpsatjBhIUNhY0HvYxuqclO1o6tI9EiK6E=;
        b=TdNV8/XBNe4Ftt1APuywXlkgZjuKP0eAO+PONJSSWJO3QpkNyb6l64SAwDIJi5K/dZ
         AzGeBro4+x6fTP38+NZ/gwNJ1vkqR/33RQSB+JvDOkBH1KNd7dzgY+rrRA0bO4XYhcwI
         LeI1L3tSHcKXkCssediM+PGUBOZl0mKQK4ybSFOv60XjCmib95CNAIqX+XPi3AziKDWN
         mxnZ2e4Oac/icepgRwTCf1x5HdeXFVmQJwUUwMosecsXV51GYxHusXyWXUMrKft2duTt
         vNuc003gxRx8AuIdBiUKOIKOFdFIIji4fuyULNst6IpvUKW3YvrOdM6t4pUg3IfBoMaZ
         0M4w==
X-Forwarded-Encrypted: i=1; AKwUvBxVvIIIw1tTsw1jHA8cIZ/DisUbkOkaNYYKdogC3rYjowg/PDKRdoLA7oOxPm7ZzZu8UFFD3EdUVifSFS0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLA/tlKe0OBSzwcQb4iNs6oMRg83Tn203d09pQHCI4Mnp9kpj6K
	RHLHEQGZM3awU3lwzKJLUHxpmKHeyRcO7P3W7vWY5VUNevZIvlGkzHPTAQzoAcjpSQ==
X-Gm-Gg: AYBFou3hc8ClZNzMUTZnp7QIBkaRiFCoFoQ4Hox49acILPomLNwh3PdpH2ozNU5XMat
	BGez/8xW0wzLwc48mFyjID38Yq4/qW4RvdJfytJ6xEHWJiytzhXsE3fTHbjT8NzUIRfkfjkZCtl
	lmSLBLFHIdDx34sUQvPjNwylUo18Giq3necNBanc2dPGhHfNGgBKY8XwLS1AKyj1eJX8PhwSiEH
	VoRFqWZdTUg+ScvjNSX5qAlDvUH+kxCvZ5evGbijUehNynU/XNO9FGggIPNQedJzgf8rMlYnuUS
	dadQt6ZJs7IjKPDKor7vvfwY2G6zWgf6tc0f0m7eurzTsTEb1G0K8jVc088miu0ngq37uH4eI5C
	7yM0VdOj86cND9HN18YjjhIWJu2GwcFZDfMSzIrNOJ4PhFquAEQeozt69gnYnNm6i+ml03wJLtC
	D61yTJNmucj5BTInnsKtrOd5aQDI1fuTzDfwei2alRlW6MyecrtYc3vEHyXqdYYqgUXFihfTak7
	RTaI1dj1XLvWlcZAV58R0KJWPKTV8F7f6oke5VnAozv0fm5yzXEZ3wRrtZyUdR0Gux7ytCxJZP6
	H+cCNkczeh4qeYQlY9Rp8sZ2dpXBbWqLoVbH49/sS0DUfKcxs3pZ98IJqRyi/TgCcA==
X-Received: by 2002:a17:90b:380b:b0:39e:59a0:46b5 with SMTP id 98e67ed59e1d1-3acef14451fmr3787204a91.24.1792295520991;
        Sat, 17 Oct 2026 20:52:00 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:4569:b311:f3ea:5f8d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad25d5d1b4sm253024a91.16.2026.10.17.20.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 20:51:59 -0700 (PDT)
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
Subject: [PATCH v5 07/13] zram: zstd: do not use kvzalloc() for zstd allocations
Date: Sun, 18 Oct 2026 12:51:09 +0900
Message-ID: <20261018035125.3120704-8-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
In-Reply-To: <20261018035125.3120704-1-senozhatsky@chromium.org>
References: <20261018035125.3120704-1-senozhatsky@chromium.org>
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

