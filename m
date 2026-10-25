Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792894749;
	b=b9QV6K9Fxaq1eju5o2fNOjLeQJwmtKY6TWhk8AYludSc893OO2gzgoXrFZ/PrUC3SOev
	 SrmTOpS4VDI07S3Uu99l3M5gkVqkwugHGczKvISuMPlq5xnCN6ERc81QcIBpxZRcBzZrX
	 0uwZ8GPxZ6qj289qbLXrnXpaWQoyjKoQcUhqbwJc76qNRdOtGiYhq1aXlcBDDR2EITNPL
	 oQExFeiwCMHincxohOuidyO95j4L/a4VyVyEykI2aNQKkpvrUctmccPLbXGEfAVBd/FsY
	 5i/eJyp59NcW31aiqA2JiaNdf03QtQ/dSx4yTRv7BRoFK0FnxBbQlTtYcLdB5P/vGUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792894749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=q3okMCYlIonzi2nM46q+sdWA0XzhR4Jh1qbkbieycoA=;
	b=RisScdwlzgiFOpKMFTSbeSUi68qQXqwed5nYR+9HEnG9G3FLrY3VS8448JETl9/UUxVE
	 aPaXFd09Bc38f9hggck7kx/TN8/MphOf3GaX8wVjqdyod+6IBRyL32eSIR+LhdpkTa7Fn
	 UOQB2426V6PdGIRSPtBWHpycGddCdTnHoazU9oE/GLep/ElhblsWAN6IQ03toJzSdP032
	 gFDfB2tynM5wAGQDhueAr8pr81z1xcLYDhfyx6oU/vaQXJt0K3oCg/GBhNqUmVPzsEliC
	 ZtDGq7YULeGpDzMGWyc5AEgMgZXXR6kP+gx1vaw0PHJFULQH0Bf26GODrNo3FMWfLEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DybsHMGC;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6DB606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:19:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A6DB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DybsHMGC
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1931ff67a29so4064141c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792894748; x=1793499548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q3okMCYlIonzi2nM46q+sdWA0XzhR4Jh1qbkbieycoA=;
        b=DybsHMGCS9Zp3rKuRWqoLA1fNNYC/obFuXI87s0VVl3Su3fHC7LcCj6ligX1EIQnbR
         aOy96erDhjM3xe3h3PK/sH9VF+/Faqv4RdCfA5tMoeFAyTZv9FafBmf4pnFq13elz/Gv
         OU/V7bkRsCjmdDBTRLAcg6pWhKJgGQIFYDzeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792894748; x=1793499548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q3okMCYlIonzi2nM46q+sdWA0XzhR4Jh1qbkbieycoA=;
        b=VNtueIBPsk49m0oOxaaG19XtkWJrJtw6RVWO9g+syFg/Tt6cmRQnJSJUmB2zf6B0Ec
         vax5yrLCs7+Y05Q0GI5SLGrdpLeQq50plgAnt1bIdW9Mwt4teQ/DU0qVQttoX+Ifin9j
         XIY3dev0FtEcKPyHnNO6vWCmoalNi4e0PhgbeM/A3VyyZlzs768dHzMQChgWNBeZQ2e8
         eQCMRoMNYENI4CLGuhN3cJn82qxW7MtvxwNm4QNVO0HJixZr6zatekv1qEdSbfVqHCIr
         a4n7fqSCG7FvS+GBq9vzx9UKme+9hPtaYYklGHSreJrHq12lipT8PcBEb8Jny7NU+cum
         DT4Q==
X-Forwarded-Encrypted: i=1; AKwUvBy676q1RnoE2oGcPvMMQ3LH9C9V/5CId1Lme9jhxCl5p1W7RpJOA2KLp9rwlH7Vsb9V+W8+PmChKkrN/z8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgkGmIkda/ukd+/RLYG80eUouiqNJ18Bnl3r+YxeBbl550RbKX
	i+44cDPdn5fMMcSJ//zl/DYMwVfr4vABDfKAipo8+ahlN8ggjgppWeO5eVIz1fWtIA==
X-Gm-Gg: AYBFou3saz1NgyjG1w7sj4Iba8H+rqYwmfeRssC+rmGkyk+SkBVyhsivTOibZuq6d43
	kHTLfPqbveHqemwdXxqvGv38jdenohdmqsLOkXLf3lIeBknGMdM4XERVIBTLYSTzSi/rmeihlPE
	TW5kGEwxYv/EPJVhq7Rq8uX/drisy+TRJYK/vEEpfPPAyCbWPJAR8ClDi+/7I9GNXdSaWw7VfSO
	Knfpz8CmEw6BysNCZSbgu46VLr8UlzT2H5ZJzSAVOjAk+RWfL4xjGiSsEnFoyBuzePr92C5mZVa
	0HI4TuHty48nHOIXdISPgIuJA9JAsEDi99Y2lztwKSSyCR10yhwzya0jYN4Ue4REgF024AEH66X
	quPcboc3U3PB/InQzNdKb/aFaogPPRwS+DKuG5/hm7jAeCjPL1a25D/TJSQdLg0t+phvWRHddv3
	sdwQ4iM6tCc/EY0Cze+j6CkA1/wfJmN9ZaXkAq1AK4kLIE9a+uzgIhz26WEjqqQYLnN5pRu/r5y
	EYTCl5yp//IkNlYh7UvHFRMimDNF+VfruwlWV8bhndk9Z4m4VQ/jtzhf9iPiIMWvwjEZh2S0xzo
	XnguZOypP0naiYh9RRixKMa2K7036LlD5Ukg+OGLFJesh+fkfmRs1Sb2aqmaVu6HVlwPOheCSrq
	HwwDtKlW3FdJsmnx8wA==
X-Received: by 2002:a05:701b:4544:20b0:190:f24b:9491 with SMTP id a92af1059eb24-19b5804d78amr2509222c88.12.1792894748124;
        Sat, 24 Oct 2026 19:19:08 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:9f87:66fc:8c85:11bb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee5asm10387242c88.8.2026.10.24.19.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:19:07 -0700 (PDT)
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
Subject: [PATCH v7 10/15] zram: zstd: do not use kvzalloc() for zstd allocations
Date: Sun, 25 Oct 2026 11:18:26 +0900
Message-ID: <20261025021839.1542805-11-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
In-Reply-To: <20261025021839.1542805-1-senozhatsky@chromium.org>
References: <20261025021839.1542805-1-senozhatsky@chromium.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
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
2.56.0.257.gf7497c7d27-goog

