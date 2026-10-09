Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74ED471D16
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791529957; cv=none; b=d1i88U4u+Gan3BSRDD1kcvJoGstl3NiaeMAPCF1hgr2kZk3LSoyL2ZJHGgH3PdIiwLPkKck2zafYUxuLWJlyhfoovl6Lt4SRklDsluecdoDRPpCsJfknPyr/KL3u1YarWUlQ6hLx6HNJez3mBlCmcZufI6q/Y7vDducw/+oZzsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791529957; c=relaxed/simple;
	bh=Nhf4Fe/qy3PS3VDDQcGaRcZTOiLvleV8wg4reUL0kvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kDSvMCOc3EMHtADhylc4M6mus1e7r6+rZI3lQQfDk2mAEp/9wlF5vCkahDNjRXHeZ9ypguB0UKjgd3/CAD98O5YBXMFFP7nmsl22asmrorO6fbzXHsM3ey4j/5EFNM+Gcu8Uc+l5Od1r6HiYsu2FogzLRmCIaMXx5jgKPnuZ8yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=At7BkxiL; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="At7BkxiL"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3a813079a55so940226a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791529955; x=1792134755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RFX4FeTrLTacTalFto0lbFyZ1pMwSeqR4eMyIxwMMBg=;
        b=At7BkxiLnVVab81ItgwScLheSYyslZbhoYIUQKGxG48/61aTupGRVkmhDpNaQLPSyh
         WdVVYU6tSTM7fkgKR1jOBVmOuAU6Bi7l4Ac/a0fCbs2+pJHesC9/u1ATKEr/AaVI2L3b
         2PuWG9UEwfygGW7NpoV4iVrapemnxnvD+ljUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791529955; x=1792134755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RFX4FeTrLTacTalFto0lbFyZ1pMwSeqR4eMyIxwMMBg=;
        b=x9DS5gxKqp+DlGVLgjUj56oce1fbqcVNV16A8cyMygBnYgfdgAKwKrDDsLl6Z7xX+9
         nzzY6vBVziJ273HA3am+BJ0x43CCeF4Air72c4fwv0GQtp4b7BXxOA9wVoZ96sV5JGnm
         oO4t1lSZeBB8+Z1Lhvlox7l7h+JDMYw2GiwEoon2kcIbUnsb4iy63nOtyB68ZmBWruGd
         jD02yQcE+DzpJ8uilQ7EEFJMqftU4Kk3NAlt9nxp/l2L/hII7yGaA7NXZxbdYnj5gWXQ
         pXqn9NyJLRvnr9i5DoLVBPceUQh40JvWuJImfdEbk0Y0sinhfTjyhb94vB6lJH7Obu09
         Tmtw==
X-Forwarded-Encrypted: i=1; AKwUvBw5Ae5w6XNHDHTNQanmvua+E7fODIKWwRLbbiPbf+GBVoUY+INyHkRb72vraIGEfF+WHknEZQVGA6G+HJg=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5LTDvbno1/u0PaUjfqL2HaeO6RTjIyewRhNZqacy6AMbRhi/m
	vn0zkgAHI93ahwofnFvX8cLbquCmAEt1KmJNneoQ1JOlCIH+yxjRoL/g4ddvFtxYonqnrkRl6/U
	3oIM=
X-Gm-Gg: AYBFou3+p7kuWylk0BaCEODeNGETE262EeD2wue3wr34SrswxN7cAT73ACTeN+nLzZZ
	IeD+uS6ukyScHLAJ7qOsQtcQB8sELAMmJfjRrsXf5668CJ54ZDjNGpQ7PWqWpeW+bIyH4JbTpMm
	bDdhi8HqMGMt4bHD6xL8ykHUbFJtKqV3XzQKFHHKBMg1/NaagAXOEZ2SJBfqfm5BaDRkXjnYWwd
	ppCuxnDTVGdvZofIOBvbJIATrTEEbHryHMKwrgfkcGUCeA74QilIsQ6z+TJH+Eu93Xu09C31bOG
	iGAcKJWwWkP/OrC8UmlNYp17x1AmC3pfG6D6UfsBPc0CB0qFAy6JKfj77VKQMkulshYxKAaZPJ2
	RoSXjZdzXFMkeujks1TWlXiAkRDggV2mBeHeltGBNfGWCIal2eX4AYYBVcBQ/AHQo8iAjELM+Dq
	mlITVr8uPFsd2H42DqyUWgmR7L4uklEtQ0ez7QQTj1TeUYBKWaPhyOUd+2/c2lBAGD8IeFEYV+l
	aZKy3gTZo9vZbG6MXuw2YGgmh83P7dxA5P5mkUYiZ+8UctWAduk6u/82igGExg=
X-Received: by 2002:a17:90a:c106:b0:3a7:ada8:c18f with SMTP id 98e67ed59e1d1-3ab36d57457mr889295a91.24.1791529955221;
        Fri, 09 Oct 2026 00:12:35 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:383b:5817:8167:5051])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b19a2sm4483535ad.46.2026.10.09.00.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:12:33 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v2 07/11] zram: zstd: do not use kvzalloc() for zstd allocations
Date: Fri,  9 Oct 2026 16:11:30 +0900
Message-ID: <20261009071157.3730698-8-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
In-Reply-To: <20261009071157.3730698-1-senozhatsky@chromium.org>
References: <20261009071157.3730698-1-senozhatsky@chromium.org>
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

