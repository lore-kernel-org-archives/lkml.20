Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C21148CD5F
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 12:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788612435; cv=none; b=V/oENlD9hxiXmnxUV/ML5P3lHTnW+KfbY3SyXSBZx27BZAosO57Rl5X8mMY66AksyAMReV/oOx4iQ58pccBN/ZufKrrdsJ8n3swiIL1aRKXY9llGV9ZVJYKP2VGkMYnq/r3XvnGhgTGtQGVTScKdMkT1TLWUL7PMkYiHaqe6ZQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788612435; c=relaxed/simple;
	bh=HyoJEb4h13ThEffr3wFJxPnbY3zePrqVNCcnR3fUkBw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R3M2hA4qFYfQ/yB7r2DPZBtd5tOo1RNRtwhu3ZythkcMtYWkHGC1w1ceHwGdPnCnLkcF2JGrIDEx06vSm8IYhJ0zCxbGvvYjC7M1qpTwHQJ9i1p68f9vFwl+1MAXT1w9zr7kKLkU8dl+bmlCFcBzLm36sJF9hC5vLdJtkEiaMCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X17bLVH7; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X17bLVH7"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-398b3c37877so1850202a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 05:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788612434; x=1789217234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ziQh4+EYTP4FJ/w1XHqXZYM290fo3MHX7d8c+O4yS34=;
        b=X17bLVH7WVrqODMy+02A+TUtTwt2J2Bo+uqELrP3nNUbkV73PLYnrnwYGroRsXW9S0
         ms+sYNruxZcapn0tjYm7CppdMGMFavJ8ZCOSeMVx4fbP60+sf9vXnvdx5aZsH0k4rQTx
         qMQSn/wb/e9BXVCIHnhOq0kN+3B5UZj5Ei4vvyHqQhOubo53g3mrGYnfd8pi1TPq98Ez
         3dh2TSr7LQufCDqthExLQINWzlivFzJINcd6Ig4Uz6fnF/fmUWyiofN80dLRvx4WXm+q
         cykNgB6cQQwkceQYG3al/WhJRHrdTq/RcNvTS/O9GJ307gHiTRl0+ypKJxjy5NhyekK/
         56Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788612434; x=1789217234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ziQh4+EYTP4FJ/w1XHqXZYM290fo3MHX7d8c+O4yS34=;
        b=hjAAO2qhcNm9om0qbYEbsDRJlubthuiunRkLIWKk5Q9+IZ/gQq7c3Cekg2cIaa9im6
         ncd0w0fFAepn7HfCoXYfsqpbVrYNrRAChfucglnSM4jsm3Fd2CKhSmWhrqN+fIpoArq2
         16nqDyhcGgqvL9skM2ZncCTPK1tevOfMtnz5wEw4TIKQHsSw/Hgx83DH1Z9QOX0VTP/I
         Y6/GXqqJVRttgxfc0uW2HDhECdjRVSMQQpT1quTdsRIW/POl+8gvYyZlCllHgGGMOF1c
         tU/1NJevLew7HrNDsk0N8V0R0RNajhzFEskurCxLfVeiXr+zojD4PQG6lzucwIRxnTh7
         V5jQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1EqOCHtotxlDDDr/6IVte23VwaoJOTxXIsSheSjr0tSy2iMaLlQ32o5ZUCSUJNkFBOgBGUBZHBWLdfSw=@vger.kernel.org
X-Gm-Message-State: AFuF++lD907+kWLthfRpnoL9E+6tKx2jbvacfGOxe16ZLlQ85l6hXzmH
	UBAB7zTQfvrXwP0CdPHLRQ6YZIFhQEPYQwuBRmKFaf54PcmWQ4dsw1277ypJeg==
X-Gm-Gg: AYBFou3POXAzWaPYa4jy6bHsJLnt/TNt8oFCRcIL9gzcN7tChtOjJxcK8iqK9xaQtKX
	qHH5dZ+02gzTiKQ2bWzmreQ7BCmhXArMiqizN/7FgO8grxGieSlowv62m0tQi7Fs5vPbjkjfS0B
	7hz6Nhv2tiWSLgWgpHLZruB65YhyA6f8dW4nl0dzErb38V01xe7AOQ/qjcGAA/OwIQFkuAFrbGv
	JkhEoyhG+K6gROOF7prAt8MqemcECPkCnA4MOyZ93jgzew3PDqdfYrGoQDMbAzonHcL/QgaTx8I
	EPlKLtRCHG6iyxQ05Or4hWrQybkBAnLVUesWN7xyS/BwXgrHqh1AGQKZsLX2BVT4B/Wf+wTAWFH
	isLhOv0GEH1//ThN6MxV3803e/uXlPtrWVXyoMG0sJYEM1261a6tTRvLFwmMM8cQ+M78dP9d7Xa
	kE1ADrWRs2b/lH54cAygSWzZuXV2xyQ7FaFXpqYBhCjdu6b1YmIbD6lzMSxXIY34lGqg==
X-Received: by 2002:a17:90b:534e:b0:398:ba0e:96f6 with SMTP id 98e67ed59e1d1-39b2624f0f4mr18020789a91.23.1788612433720;
        Sat, 05 Sep 2026 05:47:13 -0700 (PDT)
Received: from celestia.taila51cc2.ts.net ([115.164.90.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260cd15asm9929306a91.4.2026.09.05.05.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:47:12 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Liew Rui Yan <aethernet65535@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] mm/damon/core: allow esz to be set to zero
Date: Sat,  5 Sep 2026 20:44:58 +0800
Message-ID: <20260905124706.3398-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the temporal quota goal tuner determines that the goal has been
achieved (score >= 10000), it sets esz_bp to zero so that the esz
becomes zero.  However, damos_set_effective_quota() clamps the esz to
min_region_sz when quota->ms is set.

This is a minor issue, the main problem is that it doesn't match the
description in the documentation, which state that if the goal has
already been [over-]achieved, the quota will be set to zero.

Fix this by set quota (esz) as minimum as possible.

Fixes: 8bbde987c2b8 ("mm/damon/core: disallow time-quota setting zero esz")
Cc: <stable@vger.kernel.org> # v7.1.x
Signed-off-by: Liew Rui Yan <aethernet65535@gmail.com>
---

Changes from v2:
- v2: https://lore.kernel.org/damon/20260902082050.19566-1-aethernet65535@gmail.com
- Changed implementation, more general implementation provided by SJ. [1]

[1] https://lore.kernel.org/damon/20260902150301.88535-1-sj@kernel.org

Changes from v1:
- v1: https://lore.kernel.org/damon/20260901105951.106246-1-aethernet65535@gmail.com
- Changed implementation.  The initial solution skipped the
  min_region_sz clamping when esz was already zero.  However, this would
  revert the fix from commit 8bbde987c2b8 and cause a regression.  This
  revision fixes the issue by adding a specific check for a zero esz_bp.
- Changed patch title, original title: fix quota could not be set to
  zero

---
 mm/damon/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/mm/damon/core.c b/mm/damon/core.c
index 644daf5a1656..2b294fb46648 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -3091,6 +3091,7 @@ static void damos_set_effective_quota(struct damon_ctx *ctx, struct damos *s)
 	struct damos_quota *quota = &s->quota;
 	unsigned long throughput;
 	unsigned long esz = ULONG_MAX;
+	unsigned long esz_time;
 
 	if (!quota->ms && list_empty(&quota->goals)) {
 		quota->esz = quota->sz;
@@ -3111,8 +3112,8 @@ static void damos_set_effective_quota(struct damon_ctx *ctx, struct damos *s)
 					1000000, quota->total_charged_ns);
 		else
 			throughput = PAGE_SIZE * 1024;
-		esz = min(throughput * quota->ms, esz);
-		esz = max(ctx->min_region_sz, esz);
+		esz_time = max(throughput * quota->ms, ctx->min_region_sz);
+		esz = min(esz_time, esz);
 	}
 
 	if (quota->sz && quota->sz < esz)
-- 
2.55.0

