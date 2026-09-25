Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE5048F852
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331812; cv=none; b=XrliZKZTioPxCGElEXqHdsUJCNwEgb2WHZ4mSaz5Xgn1MlGO5+zBy8dTcukIupBfk46YFN1RKa1VbsugW1HMiLZevDgPN0QXM3FisrIl2PI94jJy69fGj3REN5V8dkAf1R2GDjI63XKshGXtMs4GZVVO4g0wUAbxb8RkIy8/GCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331812; c=relaxed/simple;
	bh=MBRyibfvDf/Py7MpP73OQiUn2PZ8UHR5370Z0nD0sTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tYb+lRgdP+TsfzZJj0WZeFCMojcpQBzo4CD/GcEW79/1zG/mDhpzpXHw8ABg16jidPQtajodLnQIUDks1Bo0H5RRwn+m3+kXEyJKxGzwSCzx2o2vOiM8nxF9y/+QF5lQNmwrU/K6/cAO+1Tuc7Q/Vn50b62A6A/ozUEiJCpY2Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k2r3XmLO; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k2r3XmLO"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3115c4451c8so598439eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 03:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790331810; x=1790936610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2rf8mqYluqsuf+/zf3poc+EXWv6a5aUIZ3aQ4ijS49M=;
        b=k2r3XmLOM181vK026K5oNTmOk3H1Az8SxcLJ2WHfaNQ/H1aO+EDn53KVvIo46Uof7j
         Yzq1pnX2BHn0wmichVJVRf8rfyHN5Ln3N8oSa5/fiRdmoeX5vGOvii/MZ5V7U92a8ph/
         geUZHMe0sSVpbiyWu2Q4iApBRAWiN+ihJBXQ8ErSJUCr81VFuxxjmeHmgEt/o0dB5knT
         rCfjsuNCPUQcyn30gj70bJ5EeZuQPbGu7PAaTAqwh5HHDwyfomi5lz6wi7mbsW0CkQQj
         wC5OcFTRjjNGo/6riDKDf3gAAKx9bTQVuqPo7AwhQPaRNNNAqbmGM+IWLGaET4qx88a+
         nPAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331810; x=1790936610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2rf8mqYluqsuf+/zf3poc+EXWv6a5aUIZ3aQ4ijS49M=;
        b=pHUvh4PKSUKqwwrBWTCj5hWzJsweY6bPsvxFqp4K/B7rcBATsr4jdPYIGXnlZBAuCC
         iqUTKxYBoebT4CDMFw8j7IPzK/S32X6uBhY+hPVek8N1EBISNY0aDzzglLrx5K/Yy8ba
         C2BU1rLotzstFC8/BPSeFHoDJuvGCcb3R3VZ6vq2y+d7GGHwQFWtVwZausH1wl/P5iqY
         3ifnZLuR78PjVRuPiWAMK8iHrRrdoGrRfOW9HgYiZ+o+P8JJB/7/JTFC8zWqU2ca7iOB
         uGuw0Hhi2rbFMyeGfQ8NygpCtw1W1t3KAdmzK4TKCRULjvbh6IYPYTtoBxnPDV6Wnqic
         42Pg==
X-Forwarded-Encrypted: i=1; AKwUvByn3KdE8j3j5W9hqJDRRRbL9UafWykK1REAvUmApRiPRkinZvTA1rGnWkYiAcvqPb+9drjCppUBLQHy8Cs=@vger.kernel.org
X-Gm-Message-State: AFuF++lesIcaZUuvzSuBJow/7bZ/W2pNSc48ZCG5A1nY3wg9FFFetOpK
	ZX8Grc8VjcDzd4DTojhFmaSbkRDbF23xCTwO/XBPFuB+QJTFJBJy9QaA
X-Gm-Gg: AYBFou33VwYYXbWUl53ro2xX/kfXbXj9l2PNIspqW3jVX6lookWtxCxUbOmkljV+Snd
	1xMRJcZFN76+PBi+zN4HtFJvRn1Zb5RINQzmN6e3aFz2ZvdzY38rWqlwP44dDnTRefquzBLQRhc
	FEYHe+7QOlHEfZX8mvkAqFxPSsiu1fYFLME8JeNOejf9DeB+xSPlDEtMZpF6KJL8ZSRVGvBK5uA
	/5OdyFo1RMOCckXQWgCV4tdoOD++SPifw1gqo6T5oUIxhcSyLARmI/niZBOEu7TjsDpZSsZW3ha
	ECGq7/tmHBHKVR05QOfYb3nrmWqi0TMAvg/C4vDd2SSx9VnWK7Dj1I+t4kgj9lRkM/lbGB3O57x
	+f10WX2mB8znGRQxGU9WoxYzXk3GLXPn9CYCh78Dvw6289XagxrWre69AunHyLvzaMo41I6uLzn
	VZsoKMHeuoE4DtSp/eL/tpoO6XkW5uU6uklWZv29KhxwnhWNJTP2YkUhBoj6M5Nn0zDKv2mBq5g
	fyJcpY7XkaRbjs+eOZHiTcM68RmqOMWZF78lm4Lz+8NTyd8FUFAvVjEaShIvs0cNvNLYRaNbRu2
	H3camesI8KTTCw4bDqw+x4Gd8DZGIi/cM1sB6e73pcNWQETvoQSwiz5tbGzzwnykqAhYS27EeA=
	=
X-Received: by 2002:a05:7300:b094:b0:33f:ddda:6076 with SMTP id 5a478bee46e88-3416630800amr1737855eec.6.1790331809483;
        Fri, 25 Sep 2026 03:23:29 -0700 (PDT)
Received: from FT6N242TWK ([223.181.117.176])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341463ec3ecsm5927610eec.31.2026.09.25.03.23.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 25 Sep 2026 03:23:29 -0700 (PDT)
From: shashank <jain.sm@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] bitmap: test bitmap_parselist() with a group size close to UINT_MAX
Date: Fri, 25 Sep 2026 15:53:07 +0530
Message-ID: <20260925102307.49513-7-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925102307.49513-1-jain.sm@gmail.com>
References: <20260925102307.49513-1-jain.sm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bitmap_parselist() cases where the group size makes start +
group_len overflow an unsigned int.  Before "bitmap: bitmap_parselist():
don't wrap around on a huge group size" the region walk wrapped around
and also set bit 0.

Assisted-by: LLM
Signed-off-by: shashank <jain.sm@gmail.com>
---
 lib/test_bitmap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/test_bitmap.c b/lib/test_bitmap.c
index f316a82840f5..ba09d057f47f 100644
--- a/lib/test_bitmap.c
+++ b/lib/test_bitmap.c
@@ -502,6 +502,8 @@ static const struct test_bitmap_parselist parselist_tests[] __initconst = {
 	{0, "0-N:1/3,1-N:1/3,2-N:1/3",		&exp1[8 * step], 32, 0},
 	{0, "0-31:1/3,1-31:1/3,2-31:1/3",	&exp1[8 * step], 32, 0},
 	{0, "1-10:8/12,8-31:24/29,0-31:0/3",	&exp1[9 * step], 32, 0},
+	{0, "1-1:1/4294967295",			&exp1[1 * step], 32, 0},
+	{0, "15-15:1/4294967281",		&exp1[13 * step], 32, 0},
 
 	{0,	  "all",		&exp1[8 * step], 32, 0},
 	{0,	  "0, 1, all,  ",	&exp1[8 * step], 32, 0},
-- 
2.43.0

