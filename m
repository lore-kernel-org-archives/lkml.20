Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0FB2EEE96
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 05:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788066857; cv=none; b=tNyu/5KqBJYl9MuG+vEjl3i6wfzZpfoNDKZKGAv4j5Wrf49iPPqM0KtcObxxoqxW6lpy1qU3bDq+GYcvzfqfWEmlGqVLya25MXmHhEe8QOjUy4gTCTaoy8mxMaRQTDVRNQOmwcbFqLkLOnCphom2oQoYpV6eXK5CGtK67Zm3Sqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788066857; c=relaxed/simple;
	bh=r0ftD7HCIBo2WTmrRLgxokYhFEMjbae70/mAgw1rVsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uQtZ5AxU7z0QfEwO9QiH7XTBkvFz0Ri7sOE3LIJZztAlzzRMJ9z+jvvVWosLQCCKXRt+wF11MgrNcHcBs48dyCWZSBUltGtMhVpMbxPthXa8X9YvcdokcgGvJV33AuZSRm7ZgG+g6vKT32wZ9+MFrLZandqnwhvtUuHpZKZYiHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=IKU5gWHY; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="IKU5gWHY"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d6f55a7089so23377145ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 22:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1788066855; x=1788671655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4psP7AFDz+Kluf5IGgOzZSSfstXE1tXapxgbnPUwWEA=;
        b=IKU5gWHYrbIXn/IYvCIEbY/rBJO8rez+0YNiIlUaszyAUICiJuMiqtKCfD+HP89Go9
         ekj40NW+alqcrW2qOhknnoakvIDorZAUksm76XogQa3fPKI2xtPxCrz5Vf8/Ylg9ZkKp
         t64v0h2KfMuEMDhgTk720tmyZ+/LsCt+FsSUHPB7WDxRuLMCb6ShystOJECGhyrccm15
         dPeNuZ8rCuLuzjAD9SgyrKr9J9c/uWeJd+KZweZ56HhHRskRia5xwZVjxQt2fsIjFmD3
         4t6PdGZ6rYfJ2bpOKdPY4MB6sHDn+Mj7ZmAY0LUrkosWKLl5BDCWQoFi5ybm7c1+DtvC
         mH5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788066855; x=1788671655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4psP7AFDz+Kluf5IGgOzZSSfstXE1tXapxgbnPUwWEA=;
        b=n00oFz7xTBf4LVnrVQrdvEDSo9/YCaOZoQhVq4Y6PDVJbSMNlo23RqBbSTGTQyCGaF
         KhTgjlhL8Svaomx2zlXyYCYwSjg77VAnsT/o2L1OGndWe2E/0idHqGtOatQPvLWAeAbu
         FboeMko6h0nRw+zpgzUo+PyggmihXirq/VHrtt8fIE/QBuxobf+y0yys9E0LqTWgZb7l
         pZEAdRQs5QK7tKqcjRFAT0PHtqvc0OJlpJyRTI5j1r623NgWtzpwPDIChoHiBSlr9fys
         dKc7xa02TP2Zl9xdVBdvOIRpfIM4on2TSXchsooZZ4EgGpFRsvezTvsf1/xduo6IbvNN
         XTDg==
X-Forwarded-Encrypted: i=1; AKwUvBzMLGoH4UhxOXqWUt2XeYNcAOO+H3SmZQ3YQcfWXpAo3j5pCcbwTpsZrF/FG/YOLJP6wcwE+yfpC8xzNVk=@vger.kernel.org
X-Gm-Message-State: AFuF++kRwqIvmTd/DQPyorLJdBURBAhahCTNpj32XU7tLgc18K+SvvSW
	H9rGlX9CdGEYCOvPP8NyFFS9/YN3qu75vu/5LRcujdM7uO1eZSt3MJiVHawO5Z38pMU=
X-Gm-Gg: AYBFou1WbO8cX+ZGW/dg2+YSZ2I3EvWyUXPlbrEw4bevdYw8G1+jGQZcet63t9HiHxR
	b3dYdMZsGcbNiby+nBfEwY5W/Q5JxGFpcxzsgGxlCMmCvKdHOn8u2udC6DuvmHbjznBI4ah6WAB
	7wI9qVQUfS+5RwKzS407sUqcjX3dWepA9ay8SgTFNHbJoXiUkxLQiRkcvOnd+F77ySfimhoQUdS
	dHioCf6tn8/FxfvgOHuZo2EPCWeD6wHg/hzdhADXLzukiIUsVAsxRzgzhEmmodHf0yjDtigOwi8
	9ZHComQO+Ix26NhmuTDMv5EKnhW7bId2lGOCJl8IXdmsttL/x+MJ9udD956ARCOM/KPIflW4dMe
	RrTx7Qjdghxwlo/oNLtMwHWMoxKpZX4en+r4xPdghPMUGChwsD1NUXCebDl8Ec02tElpb51N6fF
	0nynx5YWeQzKW6v78GVPK+yQRG+1r8A6ng0Yv3/wQsR+FeuS3LCbBQLyj105xbtZSSyAnvID52W
	tMnt7/vcGxPKGsZP36E32vKITW+8MgKCqha
X-Received: by 2002:a17:90b:2e4f:b0:398:9bd5:490e with SMTP id 98e67ed59e1d1-3989bd54c43mr16185087a91.21.1788066855436;
        Sat, 29 Aug 2026 22:14:15 -0700 (PDT)
Received: from MBP-Krishna-Iyer.civet-hops.ts.net ([2601:645:c68a:b830:d101:1d:112c:715e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa37fa5sm22595810eec.29.2026.08.29.22.14.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 29 Aug 2026 22:14:15 -0700 (PDT)
From: Krishna Iyer <kiyer@crusoe.ai>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Krishna Iyer <kiyer@crusoe.ai>
Subject: [PATCH 6/6] mm/damon/stat: support aging_flush
Date: Sat, 29 Aug 2026 22:14:07 -0700
Message-ID: <20260830051407.50008-7-kiyer@crusoe.ai>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260830051407.50008-1-kiyer@crusoe.ai>
References: <20260830051407.50008-1-kiyer@crusoe.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let DAMON_STAT users opt in to flush-assisted access bit clearing via a
module parameter of the same name as the monitoring context option.
The parameter is applied when the monitoring context is built, i.e., at
enable time.  Defaults to off (current behavior).

Intended for virtualization hosts backing guest memory with hugetlb
pages, where non-flushing aging pins the observed access rate to the
TLB-refill rate (see the aging_flush core patch for details).  Such
deployments can set damon_stat.aging_flush=1 on the kernel command
line.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Krishna Iyer <kiyer@crusoe.ai>
---
 mm/damon/stat.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/mm/damon/stat.c b/mm/damon/stat.c
index b05b68f73e10..e093383ba406 100644
--- a/mm/damon/stat.c
+++ b/mm/damon/stat.c
@@ -47,6 +47,11 @@ module_param(aggr_interval_us, ulong, 0400);
 MODULE_PARM_DESC(aggr_interval_us,
 		"Current tuned aggregation interval in microseconds");
 
+static bool aging_flush __read_mostly;
+module_param(aging_flush, bool, 0600);
+MODULE_PARM_DESC(aging_flush,
+		"Flush TLBs when clearing access bits (applied at enable time)");
+
 static struct damon_ctx *damon_stat_context;
 
 static unsigned long damon_stat_last_refresh_jiffies;
@@ -178,6 +183,7 @@ static struct damon_ctx *damon_stat_build_ctx(void)
 
 	if (damon_select_ops(ctx, DAMON_OPS_PADDR))
 		goto free_out;
+	ctx->aging_flush = aging_flush;
 
 	target = damon_new_target();
 	if (!target)
-- 
2.54.0

