Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4D536F901
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161515; cv=none; b=jDZwZOMTX/dxB7mvnPDsLFuvFd/wTFzxH6UCtpAv71jYscnZBFIKiQQMfbDUWMzv/Vrfo570xkie21qpzEETDbQ2qh/jzSiAoGQ8zj90x/mR+oF3MHS8eOAyP29dMMRerLetOH7jGhWZZq7gccUvYzAKXSEHwNPKI4XRFT57M5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161515; c=relaxed/simple;
	bh=A9/CTtLXPAMUxIYV6URIzmuV9rHKPxyUydDb49cbIJk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=p7kND9mJBEnkVaaljuLyIfBtvdi9T8T491O4bE85tS8vSxkeWtYLfzk+KLMOCnXsgvTPrXPC+7d+JyIH3Qjg3iVuwWOFBghpvUdXh13qi4j5T7LC0CdcX7T7xc59yS5pmJizmQTwpdG4AZU7lzuDSl7UCZzjezmEN7mlV/WnaP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ixlArInJ; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ixlArInJ"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35c76e9614aso5002921eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792161513; x=1792766313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VzZTNMyuwZMv2FtdIQag5FG4n3GogIS30Eq+umwptRE=;
        b=ixlArInJbrAxyOuibEZuXPLys45RuwwSEtdiNuVboRvxGhdqnadbesz7pQImu7Vnwp
         f3stqaAGN4xpO/9f+VLo46xfXnodFwTxPi1Uf4cQK6DeswxvENGCig9n9/BxZ0h09b1S
         81ZwZu6m1b8hRpEAkVJNBQWzlFbNHEBOSvrjdZ1oC3n87HrltWYn2sE+EYQ3fbQYm1oJ
         Lb9By1nuKls0auOuLPh8CjuMOrOtCMSV9ih4mkLCZoSfVuitvfja/g+J4p86KE/tPsq6
         TNWNhxPU0iEOcXJ9d1gpFtYMFIJlM5aOVfgWaKfxpi/JhX+g1pz4mpCqGuP0q4cZu8/t
         5/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161513; x=1792766313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VzZTNMyuwZMv2FtdIQag5FG4n3GogIS30Eq+umwptRE=;
        b=qsrIrEcpBxLtCX1ujSR0NHoLccUWHNdiZhDBtcqmB9xYqlPEIkBeKFBr4lm6vyzZn9
         SdWF1VlvXq0pGIfUGrNNBKODDNsCi/+AcifuDrUf7b+9AuUrSPPS+jP9VlY8/lgU2UuG
         TqY0Gvn+CmQ7rPp4yY3Ns0Aw83GRvUap/CEule3P7+W/ZXeWgIOiV/LMcdoHlhQxpmZz
         NFNUd4dvcD7tsjj2WdUsvsVMzLizuM/fbu2NDV7qehQLiKZSOWKjEzWXttksmkPDpDMk
         WuCSt0RxTw9SiOYeOMuKdFTaPp7654cng+Jvq2yPqhX1O2olWtdTTxP4vubVTyMkKRRR
         0NWA==
X-Forwarded-Encrypted: i=1; AKwUvBwIQHQT1H1Un4K+uE/LxbDzkWY4gI75TOfcmyi8e3tbjvSJJuAfkUF60dxbCdhDLS6P4IVXofVp62b9S4E=@vger.kernel.org
X-Gm-Message-State: AFq9FYI04zfu6FxHTvfYk+5HTZLNP9BreLdIjKShxaO21HawPlsbm2Or
	Aehn1HfQaCpqnlrqVqiv3LU/Xt45RdoBQ46scp2BmjXREtb4E2f7kYrg
X-Gm-Gg: AYBFou3PnvgXoETc3BN/aULipKX6/nT+GHSQsn5cfUu1njzODDfORPciuyj7UN6/6nS
	3OyApJPTQWHcJFd7+J69UmbL6YtQb4g4nEtnVFX/YpcbI7hLQ5ZGtEtws2qgdza7U1piYL39Qdc
	G5c6WnnhUvMjroxmHUFIrFBIFWsxZyudHcpU5k0q6MbOeM4KAT/pDtclTUx4XxLN4mnpItcMliN
	u+vLMtmIwRyu56O/S+tIE2R/92rMc9FamUAD34W+QPLx54iG/7ZhbWHSR3ash/yCty8Rv5gtOsQ
	CLR3UT3RH+Ka+pEOXPaY5vHTTTvPGKMdkwuBF8URa3CWg6vZsbbqXRDdbdenzL+YrXVRo73WRNi
	Ygwq0RdyIWw/9MDdNY1iGiiZgqskfbMsvlt/yIIzzEH0v0iX2LpZz+Vh/Hj5cr4P+7ApdQM9Dh1
	qBRVDoC6586ot4az/tNf7W6NYUYQGeS0RLjx4XorEgkxlEXU4BUH09dBJjgLS8kGeXuWPPA3m4x
	U3qvb/wxHs/yUkXFlOVRJyS6LTfeIhtSo7lnC+e2rux+lsE+3jHr86D/mMnM3Rcq5/GGXYkvtCG
	TvEHpXxXfXRlhgpABA==
X-Received: by 2002:a05:7300:7aa4:b0:35e:43fa:eea3 with SMTP id 5a478bee46e88-361a137072dmr28441eec.8.1792161497077;
        Fri, 16 Oct 2026 07:38:17 -0700 (PDT)
Received: from AHUANG12-3ZHH9X.lenovo.com (61-221-208-111.hinet-ip.hinet.net. [61.221.208.111])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081ea7e5csm7069382eec.15.2026.10.16.07.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:38:16 -0700 (PDT)
From: "Adrian Huang (Lenovo)" <adrianhuang0701@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	ahuang12@lenovo.com,
	"Adrian Huang (Lenovo)" <adrianhuang0701@gmail.com>
Subject: [PATCH 1/1] mm/damon/core: Remove unnecessary zero-initialization in damon_new_ctx()
Date: Fri, 16 Oct 2026 22:37:33 +0800
Message-Id: <20261016143733.320-1-adrianhuang0701@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

damon_new_ctx() allocates the context structure using kzalloc(),
which already initializes all fields to zero.

The explicit initialization of passed_sample_intervals,
next_aggregation_sis, and next_ops_update_sis is therefore redundant.
In addition, they are later initialized by kdamond_init_ctx() before use.

Remove the unnecessary assignments to simplify the code.

Signed-off-by: Adrian Huang (Lenovo) <adrianhuang0701@gmail.com>
---
 mm/damon/core.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/mm/damon/core.c b/mm/damon/core.c
index b63e60ef8990..74e6022ca137 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -918,11 +918,6 @@ struct damon_ctx *damon_new_ctx(void)
 	ctx->attrs.aggr_interval = 100 * 1000;
 	ctx->attrs.ops_update_interval = 60 * 1000 * 1000;
 
-	ctx->passed_sample_intervals = 0;
-	/* These will be set from kdamond_init_ctx() */
-	ctx->next_aggregation_sis = 0;
-	ctx->next_ops_update_sis = 0;
-
 	mutex_init(&ctx->kdamond_lock);
 	INIT_LIST_HEAD(&ctx->call_controls);
 	mutex_init(&ctx->call_controls_lock);
-- 
2.53.0

