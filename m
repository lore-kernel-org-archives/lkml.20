Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D4D481666
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791863550; cv=none; b=f0oLfBNGRy1J3izmSkVEK33AV+dw7PX6OpmmLbqbJl0OWO2o1EYhy5FaH+PQ4d0RTUKYf/ePlTloYMqxkkjPDea63IcnFxjXYd9o7pxQh/4WG1TVIS0qMNPsS9eubV5ohzrrvJQ9gD0nRG0rDplTPI1QP1l5PQWeBWoIx1dw/ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791863550; c=relaxed/simple;
	bh=Nhf4Fe/qy3PS3VDDQcGaRcZTOiLvleV8wg4reUL0kvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MLBIJbfyU9XNoCcsXeR1/VnrS7NQ5YiQMipHetzeU+7t3Cp0ncLx7C4u8WhRlDolfi543pRelaFwZwrZSa0AUSoirwDlOy9aRJDRYhkDsG25CvXM5a3lQNsv4Ds2vFHdIqkAzpjZjz2OkRYAPYPsLVtJJxIj99ijg41UWFdC4X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gy8oAN5k; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gy8oAN5k"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8897e83332fso1817804b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791863548; x=1792468348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RFX4FeTrLTacTalFto0lbFyZ1pMwSeqR4eMyIxwMMBg=;
        b=gy8oAN5kXIXBea/v8BgGyVB4WPB8OXUVowjOkK9F/sGNT9ElSp+D9PUyJZtAm0Z7cn
         pHwfsARu6MTtz/dcJY5sDOCJJw5g+yOAFhGkB8/GHQjlNBRvFYbYqscdJrHuab/k2Q/Z
         Ml0KtfCMi2RVR9LkqZ3ayB4B3GsAfo3siwGs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791863548; x=1792468348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RFX4FeTrLTacTalFto0lbFyZ1pMwSeqR4eMyIxwMMBg=;
        b=WV58jRk2AfkcIzvU5GXNio4fn/K9HfP4V2w0MAA/7Dfpl4JvJkixDLRXxfjUzk4p6g
         bAO1OApxddnScYk5RIP7VmcT2J5FJkRVlle8oYosMeUAyfKncDyibgjduSnD4YFD0pOp
         kXH+9YzXOLXMPt9oWmufKpt1X3MRbmj4YicS3K/zHFTJIRqc2+eMcHTZpuqVMDg32z/N
         XJsT6JcU1jmWCM0pfelBDjWShdoXuqjV7NsO++yzYpZkg+bZoVNnhm5GxEItWV6mN+G0
         Jpr1NNifezjq4r9+5CJnI7AQYdWXt1eDylU4a59X5/2hcePSecfJj2w61CpviLz6GaOR
         70hw==
X-Forwarded-Encrypted: i=1; AKwUvBwJROF1nft/OdLAGrTl3i9pNpGauEg9/InO/z7nmJOGmoQT0nZsGmfFwp+VVHx/FFFu4C/s3voYT7Jz30I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLTqDwe+eZg/p6Q6tEXQ4pU0r1H97gCj19Q3a0lSZbSU1AzMel
	XooJ+APRfudLF3NeuEcibNa8BWeylw2YJI15WNxtdBaLOZJ9cWNC4ybIMPEhp3FH3Q==
X-Gm-Gg: AYBFou24XGToypZsUuxg/YIcQW0HNk3G4KDiHHJvGH6B+qO3RFR0E0orO6jrMt0uf1C
	VfPpCxOMdFl+UwYOJ1kH/2oh4o4sa9tJuB/FUeOIZgUAgJz/qE736lQEzrROSsIZSBXz6HrqD6l
	Cwv6oMFUxQG9IYPNTV5Gv8Vxxv3c+WKjzVil8iBrPdh2CFeJyqyKj4qG8TFA2/LwMvfd/sk8NEc
	h7GCWib6njVlUKICp5+PeeIIHM8K9Mw7bZgfH8IEAKRyuOQ3dL4T9EnjdsGzLbc4kldKzeeMzLO
	fz0CUzde77HaX6g4xjb+y34shpTElW7X6oqlO54L/7R5tx3ZzznmInVTIfZGtYdrRh7lMHBuczh
	2ycuJnkGKZbxW++8FfWiWAPzYqcIp0ARl9xIVj1AUS7UgE123/nHDQGv59hVO+PTtrtPQB1ez25
	UhFKXn8rsJf+1ppg/sGiQVypkGcw/wLJIWV7Bj+ITGAaROPpQAge3u3SP5PprYN3/Aa6GcL7V4h
	bta5mC+syF8WFVU7mN0PKxoN0z2ODo4K0C0U+duHS4aGrNbCHlWXJiV4ejpIA==
X-Received: by 2002:a05:6a00:3d49:b0:891:e380:3d03 with SMTP id d2e1a72fcca58-896a29105e5mr7734654b3a.28.1791863547666;
        Mon, 12 Oct 2026 20:52:27 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:476:d384:7c2e:1579])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c41bbb27sm4326818b3a.40.2026.10.12.20.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 20:52:27 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v3 07/11] zram: zstd: do not use kvzalloc() for zstd allocations
Date: Tue, 13 Oct 2026 12:50:54 +0900
Message-ID: <20261013035201.2809924-8-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
In-Reply-To: <20261013035201.2809924-1-senozhatsky@chromium.org>
References: <20261013035201.2809924-1-senozhatsky@chromium.org>
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
2.56.0.385.gd3acb90ef8-goog

