Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BD447C107
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 12:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791202888; cv=none; b=qRjQEcKKseky7rEs0wn2nXDBx/yszZBash7H5sFNppPnUByt8ByFtRIl7R2IL0QyRIoyH7BviZjmaNT26pgpPMFPzxzv77Fwlj8J7sEV2MN5ifKC8makpnQttLaVuBLrjxY68mKtkyiZXb61FRAQhYDwwPZA6BkLFd+9GEl4UWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791202888; c=relaxed/simple;
	bh=cjmbppIMXyRMAGCgsAgIdXMu/Hehztl+4Vbc76WLIMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kvhf6k+Iotbkd2KXMKPtNMuN4wj+OBqSH+UPSYli/DW1lquyQ7uVVEWwWcqQlzp33GYQfRpXopsRKbhOs9/Xed4InXebDvPAwMbkRx4o0sEkD1lEENxvE9qFdfFg3GJe88j16soN+GXADDNsAKV+sQquaeAyoRVmriqOx9q5F28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e2hkHvHl; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e2hkHvHl"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39dacf053eeso709816a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 05:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791202880; x=1791807680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lBooGZSw2IxfoAxzLlFw+KVKnhFoUqum4OQR7iUI4RU=;
        b=e2hkHvHl0vUm51qQH+a7mHpxLyTGWKdQSNkc/d7byN5c8B+WbynWAb1iZ7/nuBOF1H
         +cJFL8/zbqXxS3wKuHJipAUGaYfnUNu6bQvmjWfDQikjmVNOJH9gu/ME5gROC1y6K10J
         oTIctDeqgrtH/08eFMHYz5xoUDi2m2bcBeP14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791202880; x=1791807680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lBooGZSw2IxfoAxzLlFw+KVKnhFoUqum4OQR7iUI4RU=;
        b=WrEwT9UK8KjO5XufBF2jgPMH+eYDsmqLSfJ+1Rdru8WKAvdb0B9ulgWQXyCoFom2b6
         ePgvBHFZWZ/xT0uLC0shOq9HgGzK2jIebFXsp90ChsiXlMo1nA1Oz+125qSsiP1ry+h2
         V7zMtc71r+sXPTzHWi4wIaIbi6wU2OFsTsGhUAIO4Jenl93J+SddnbkDsvKB2t/3sVe5
         PTb4wvtYVBggDZMIoVwiFK2Udp1+P2vEF3gJf1Xbkoj/LSYwbxXBCvkTQ4kIXeCblFY9
         042c136Grozb7q2uaSsFkGVxImBvCMc43ugkg+SzdjyYLXMTa4QvO+y18WXTUabX6nHi
         y3qQ==
X-Forwarded-Encrypted: i=1; AKwUvBynSd4PDD2XmTjPpyu+Kf5IQ3wvv3T3eXbtt8XUl02q+1lbMUeG6jKTr6DjojrDjFtHYoS1pR9Ux35kDOQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxVx+uns1snHnygmxEP+owWbKimi0cq5yBWGeNWgV+M0+iyzIj
	UqtEGnBfW/BnugW+WkFA2SVoDsFyCwuKbf4skOmC9zUAjNLr0ZlSaxz40U/vdg1iJQ==
X-Gm-Gg: AYBFou0gnMh7Kzoo1W0+ybtBiVhbcmtUsmfTJD31a2rUwpbIXMfWaYlOGgB8kykj+LN
	QZSocGhFUGsAZ2N9+svMzpte3W5Bdw/x7Wu4XEcOeRLZZB2G2UeXGIkUAEwI6UorWHwHf3ybHwK
	5AT9E4JF/tbPS8VrNFpDi5ieLYOSaWM2WJdLF/LO3fnivOMJMJGUVaSKvus5fax4Q8h1HubacDY
	u0R7J3iUrnlB/8FyIbAkXhbcujXM8Ixvfc+bMkNLrKizEC+gs3i+tZSq8JnlECCpyo18rxtTGNN
	AKI27VQVd2g0v8dXVzXXINqF5jb5u6ur1iaPT3WwxriKiqYTSHhwl4UbGAybuIkem7yOcNQyqM5
	/zKPM123VlqwmOfACbXmlh40jFkIDSIS+LVjHydjDX24uUuUvkhBao/LYdPoeZNz2EYzpeeC2Dx
	6PRzWLcnzZs2WF6/uIG7GJdmL/zGzN9vlGNHRA1O/62kXjCjnU6HZ+5oKxlxmCINRonoB+UiThr
	ENo0Bzm6HR//rAs0r1xYeBZYleYoNb3M01OIMdYIxSpX4+vKO9dHbpBIcjmItk=
X-Received: by 2002:a17:90a:fc45:b0:3a4:945e:bc33 with SMTP id 98e67ed59e1d1-3a6ce82bf0dmr6782414a91.47.1791202879907;
        Mon, 05 Oct 2026 05:21:19 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:9211:ddf0:3c6a:bf9e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7e4b00de6sm3342997a91.1.2026.10.05.05.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:21:18 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH 07/10] zram: zstd: do not use kvzalloc() for zstd allocations
Date: Mon,  5 Oct 2026 21:20:22 +0900
Message-ID: <20261005122036.718976-8-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20261005122036.718976-1-senozhatsky@chromium.org>
References: <20261005122036.718976-1-senozhatsky@chromium.org>
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
2.56.0.rc1.315.gc6ed9934b7-goog

