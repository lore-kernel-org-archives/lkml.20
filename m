Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73981372B57
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789468090; cv=none; b=otk7gud0XR41/U+1VvhQCDNJAxvGoYNvCuKN2mf88Cf/Y63cgVTXaq4Z15H3xzCBG8jnqQCkwePBD6InALaRFOn2jNvSaFJBqoT0mkOecuDRfX3JVRQLEWB6ms1vmuivkFCC0EBeJeSFzi0Iea98Gso9SwaueUjqN/v5LH9L990=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789468090; c=relaxed/simple;
	bh=1/d9/1GHfWEox65oqmtCNUQIlORzo3GAgvRVXrIJF7M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZIszLTtPciYX3mW2iQbvlxLwWXHmR1Lo+IXZOTn5vegs8naDlT3ulyC68N3eGsbqzsO96/gw3A9Xc/a0gHECvVtnPEmaY6VOPcI02mKx2AOXqzQg6KPwaJ05sLLiJMpVZwiJYRhfQFFkM5yXTFD8jrHCWeW3myUXgoQrZZazjJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQs/hOmJ; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQs/hOmJ"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8631d0023daso1789588b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789468087; x=1790072887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I2tI49ctpjTzkTcRuvF4mjqLd2YRMswe7/M8Hsg5gl8=;
        b=UQs/hOmJ9vJpJwO2PGI3yTvz9O9vxBr+LJk16ZFWXhCQxlm1vZUzPuo8gWi5CSDygA
         Aq7Jzhbnm1ykWCLEuNiKTuzbaH5I048CYn53sKs0R1Chl8CAzmumv/1BUUee+/McTRSq
         wR880Q1w1USt8ZZ//EX82qFxOJWKRwZWx7vTaXir1H9HiypPWh2XkabSYAIhrbi31no2
         1WsydXjwbBzsR0YDzxmxAjG/3qe1kxMVojuNhDyqc0LLs/J7l4ZxUBmozVqdLvaMvE1P
         gNmMre7Imbt9S0cExd1xPSOeGoivAvbNm2XIcWqTRwQ4bG5M+hqGZOLVaUC2XZhnFIMY
         lqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789468087; x=1790072887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I2tI49ctpjTzkTcRuvF4mjqLd2YRMswe7/M8Hsg5gl8=;
        b=kCE1FLtIEYEoSFmsZhRqH3x4GcAy7AKxxMnwkmn6YngqAhzkTDFb+R9SHClwqxGYqf
         WXV2tsgCVLqBccgzQ/FDU2/Vnrn+R5cdBrNAhlc+clxbyAEB0AZi4geg9Ov24KHULlqP
         DSs5kEG1rtNuDTLeYUMcsMKRGHJSbFZowi/pHmS98oAmTMCIU2RA09B3uH2HNkScyMZc
         4BaY0cD/y8AqgNnNddJh5Har/4NCyQjDzUMIRzMN4dhaZx0q13ToiBtJ7YOLf1aSfptl
         pMjsxGQOwxcTn1BwEHaZ8Yy5ACycWRP8gd27dJ7aEfzv8HxzrxM3AwPtAAOevKPxva5v
         IuVw==
X-Forwarded-Encrypted: i=1; AKwUvBwDFetWr+Be9rDXsLcMZuWTY8be7ZF4/liBaDxN5wR6GjOwL6i9bsM2A6ryfMUxB6mpchDzynSGPHzoU0M=@vger.kernel.org
X-Gm-Message-State: AFuF++lcLaMAItAgxQu2JpcXu51M1qrYck5vxSGuUpuaLLiF58021fwS
	+HWVSYGFQVIE8PtgM9dFpePHyR2nHXodg1TbXjFEpniiaMIR3SbjMO+T
X-Gm-Gg: AYBFou1keiSkgrAOzOEfEGwMofMTE6q+3PYToGojo5/E8TdpMJ/wpP/ELHuhN6DvR3c
	GMxrbvfay7Hsjbxsp8XxRnI5mhi7V5DLP0lQJGYXgDm1CeM7QlqCNsKa3h7nYVAQSKfatqpyB3h
	soJACc82hVbFgUSXYeEjyet2jCdc88PT6IGb1M8TcX8FByyNMEGtQaUESbA9lm3WSa+8xEWo3W7
	/ukAdIsbre0r35XQAUQIVaCVFvHmQ5h4FLC7Y+uCe04aLXAVy//UORpuuwIb+DfHAL8VnqD7BAd
	atwEu75auW4XlTvZansFBtgDcNPPXChWSyVLUIzZ/4Ilz1VylR0PRpJdpYHtoI7w+luDKw75uVx
	OaycdIJGVh2m/K3ztSgWxKX742wRpdOLMmZVd/+/NJTi4d7fu8+WQD4Yy6W2iJ8j8jkzFa8cYdL
	NLUDO3id7xtBi/EuAI34jfpbgQ/4CglKhtusUR029O8Tra8NvwsXJs/lahXMoYlsaLPwNZ+AAzi
	Pn9oV2jEkgpVzLt0lXXd3g8ikZNHxcqbRp1ER+mQ2sTQJEnIrtTIkHK9sdaZHHFZAptnO4Ii+rK
	59eUmvux2rwaoz1r
X-Received: by 2002:a05:6a21:1014:b0:3d3:ad3c:49a7 with SMTP id adf61e73a8af0-3db4061f373mr16009374637.21.1789468087368;
        Tue, 15 Sep 2026 03:28:07 -0700 (PDT)
Received: from AHUANG12-3ZHH9X.lenovo.com (61-221-208-111.hinet-ip.hinet.net. [61.221.208.111])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c6572ecasm6465344a12.22.2026.09.15.03.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:28:06 -0700 (PDT)
From: "Adrian Huang (Lenovo)" <adrianhuang0701@gmail.com>
To: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	ahuang12@lenovo.com,
	"Adrian Huang (Lenovo)" <adrianhuang0701@gmail.com>
Subject: [PATCH 1/1] mm/damon: fix typos in comments
Date: Tue, 15 Sep 2026 18:27:46 +0800
Message-Id: <20260915102746.647-1-adrianhuang0701@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling mistakes. No functional changes.

Signed-off-by: Adrian Huang (Lenovo) <adrianhuang0701@gmail.com>
---
 mm/damon/core.c     | 6 +++---
 mm/damon/lru_sort.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/damon/core.c b/mm/damon/core.c
index 0c98f7e267d0..981a153619c0 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -2447,7 +2447,7 @@ static bool damos_valid_target(struct damon_ctx *c, struct damon_region *r,
  * This function checks if a given region should be skipped or not for the
  * reason.  If only the starting part of the region has previously charged,
  * this function splits the region into two so that the second one covers the
- * area that not charged in the previous charge widnow, and return true.  The
+ * area that not charged in the previous charge window, and return true.  The
  * caller can see the second one on the next iteration of the region walk.
  * Note that this means the caller should use damon_for_each_region() instead
  * of damon_for_each_region_safe().  If damon_for_each_region_safe() is used,
@@ -2613,7 +2613,7 @@ static void damos_walk_call_walk(struct damon_ctx *ctx, struct damon_target *t,
  * This function is called when kdamond finished applying the action of a DAMOS
  * scheme to all regions that eligible for the given &damos->apply_interval_us.
  * If every scheme of @ctx including @s now finished walking for at least one
- * &damos->apply_interval_us, this function makrs the handling of the given
+ * &damos->apply_interval_us, this function marks the handling of the given
  * DAMOS walk request is done, so that damos_walk() can wake up and return.
  */
 static void damos_walk_complete(struct damon_ctx *ctx, struct damos *s)
@@ -4143,7 +4143,7 @@ static bool damon_find_system_rams_range(unsigned long *start,
  * This function sets the region of @t as requested by @start and @end.  If the
  * values of @start and @end are zero, however, this function finds 'System
  * RAM' resources and sets the region to cover all the resource.  In the latter
- * case, this function saves the start and the end addresseses of the first and
+ * case, this function saves the start and the end addresses of the first and
  * the last resources in @start and @end, respectively.
  *
  * Return: 0 on success, negative error code otherwise.
diff --git a/mm/damon/lru_sort.c b/mm/damon/lru_sort.c
index ad8e86dd3a93..273efa3c913e 100644
--- a/mm/damon/lru_sort.c
+++ b/mm/damon/lru_sort.c
@@ -260,7 +260,7 @@ static int damon_lru_sort_add_filters(struct damos *hot_scheme,
 		return -ENOMEM;
 	damos_add_filter(hot_scheme, filter);
 
-	/* disabllow de-prioritizing young pages */
+	/* disallow de-prioritizing young pages */
 	filter = damos_new_filter(DAMOS_FILTER_TYPE_YOUNG, true, false);
 	if (!filter)
 		return -ENOMEM;
-- 
2.43.0

