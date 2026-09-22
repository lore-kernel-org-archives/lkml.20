Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9E73B27C5
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790048195; cv=none; b=b2V0ilI6bP1NUGToSnotAGWwolZgLGFN5M0dfm9YuK4aflzLjeeLY7Rx/twF1PhZ/jySb4/24JRMuvrBnhaN7FO+S/z4QKruKhq+4TTuR4ZkxVofx3rJxmg5Ulwwv5/Q/owjBQUFlAcq1oV3qY6hV8Dip6fUJA2h1l2pJz2GWuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790048195; c=relaxed/simple;
	bh=mkJuprWMIIS2VO1KTqhXiU2uQTQ3HYE4NPAu/U6qwm8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fdIiMn9DdNcV65QKblYWi8S0Apyy/LId4RlhrsA4xrBKI8ap02n1YlcINwCi+emMm/3ePKPXiwkjckUutLJCmpQb0KADPtLfLvPoIGJecl1hfA/wF1nxxUvrOjMQwRECbMvyTLsnkBMDia0TjgKhZHT+ingB29cRIAS/vpMdw6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E8R6heQ/; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E8R6heQ/"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85a4329731cso2848602b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790048193; x=1790652993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xjaz0tU8TY0TcueO7EZLXNwxMWHUXDu0d5R0jWTxtYk=;
        b=E8R6heQ/YwUjicORhb5YRVzY0bV4BQ2MrDxkbMy7Kp87RMbKqQcxY95K/IbdlkGEsL
         5+4ZIGRWCvY9l8rHxM8T3UL39RadzaqWsuYAsAvhsD0RD12f3fZGoHKFQRcJRzPOMqoU
         zj6P4Gtf80AlHZ6AsU0v8LF0PEj/N2EAQUQfph0C7gi10gSCo5ohsOc4xsi/F6IXp5q3
         VsR5V1UHKYFeNOijCriKGCCIQllE0ZNwISgBE8jv+T5aHowOaTAQx3Wp/BRBk+e79QrH
         Nj+x6He3I1Aw9+Tj+SvyZ/QX+5UdP3F9pIgDl0Je4dWUDBbBLdV22NTL3v8AMRuYiPoV
         4M5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790048193; x=1790652993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xjaz0tU8TY0TcueO7EZLXNwxMWHUXDu0d5R0jWTxtYk=;
        b=knapO3EAnEz1d5QtpVM2sY74BNnQcGQVS+mp4cqdAWDklvsa1WFjYNk0GWw3LQ7P8r
         lDwsepuNioErKsCm32tdvCuHvr0Y2Ic1yK39Xi22vOdUTkcR5shiWZVqtXtMCaK81uqC
         5s4JxrOf+yWbHumBhFU8KcrVETP+K5bkqy9U33rgJZ5rQW+RC50/sM8VHEHgepwpFNW0
         d3YPttcETyo3su0+sY4e2dhMKJbXXKNTweMg1pPf0Kxtz/RcJD9E04K16XaZQtTBp9vy
         ZoEyxmkxVfBD+RoW0V6hPpgrVg7e9U2WEAL1u8TZLrnoPpXYumg8aQnr1qvfYHtnBBi2
         hwBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzrlBjv2/rydG02TAKGquGpjuFa3cd4GAOhMUKQyqshLfEU+JB7F+irXwRajb5uYIgoJMVYrPS0eBc/2Zs=@vger.kernel.org
X-Gm-Message-State: AFuF++kydUPLWRe9+rf25mjJFt6SZ7CZq1BQnNm5RMdOYU5UdlG33Szg
	lgSLoLMKGEI/JgC6Atyg3EYDpSnP63aC3P5r0O2a0zUSB/tc6bVV99As
X-Gm-Gg: AYBFou1TyhUjXSQ8YeBc8QDt7Fuz7carFdV5WNtFAH4m6uq556U/pzOU0UXmmAZvaxU
	75Y7WyFm2H056zjCnutMhKFRfjASTDXyt6g1M2PEAKv6v+klJ5GbxwlUWJmkt7/AA6q9Pzome55
	5++cLKnEvlNWQMKigwpXRgyBUSyN9oVggkezk7hrlu+QHazJlq4to8AXCTcU4N93TCPDxqGEQ3x
	+TzK5fbug70T7mHyV70tRqJUBmn2bD7fCnX7JdSPDFfdnCyMwlAGDpeH9X5UFo1zSgRPXJ91Rzk
	SbHwccy94Haio/7XNPj9V7Clv49pdYUUYT3bvLjx9ARDcFAFRpWVuftkX9JCmpk2jn49bs7EJBD
	HeBY923XilY7/oCrmB8TCj+5qwPBQsBGZBBMk87ALCcbrA2t6n+rsZu3dKhGIS2h/yMSwVh5nFq
	4T5I8GomZ4lIKVbdQ22mj7rB+2O6fIhZGy09Z9ghMPIb16e+nhERd1/wC2D4F+Djo3DZ7cQPNld
	1XwDpomGitZyebsS0ZIibEmT9GHITjJsCBo7y4Xn+W7Gf/bp/9bh6MnX0rlpqY=
X-Received: by 2002:a05:6300:68c9:20b0:3dd:a197:7371 with SMTP id adf61e73a8af0-3dda19774d5mr7923602637.74.1790048192813;
        Mon, 21 Sep 2026 20:36:32 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f2a28cddsm1235667c88.10.2026.09.21.20.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:36:32 -0700 (PDT)
From: Zhijian Han <hanzhijian1991@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	SeongJae Park <sj38.park@gmail.com>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm/damon: fix typos in comments
Date: Tue, 22 Sep 2026 11:36:18 +0800
Message-ID: <20260922033618.2862687-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling errors found by codespell in mm/damon/core.c:

- "widnow" -> "window"
- "makrs" -> "marks"

No functional changes.

Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>
---
 mm/damon/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/damon/core.c b/mm/damon/core.c
index 644daf5a1..c01b7e2a1 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -2328,7 +2328,7 @@ static bool damos_valid_target(struct damon_ctx *c, struct damon_region *r,
  * This function checks if a given region should be skipped or not for the
  * reason.  If only the starting part of the region has previously charged,
  * this function splits the region into two so that the second one covers the
- * area that not charged in the previous charge widnow, and return true.  The
+ * area that not charged in the previous charge window, and return true.  The
  * caller can see the second one on the next iteration of the region walk.
  * Note that this means the caller should use damon_for_each_region() instead
  * of damon_for_each_region_safe().  If damon_for_each_region_safe() is used,
@@ -2486,7 +2486,7 @@ static void damos_walk_call_walk(struct damon_ctx *ctx, struct damon_target *t,
  * This function is called when kdamond finished applying the action of a DAMOS
  * scheme to all regions that eligible for the given &damos->apply_interval_us.
  * If every scheme of @ctx including @s now finished walking for at least one
- * &damos->apply_interval_us, this function makrs the handling of the given
+ * &damos->apply_interval_us, this function marks the handling of the given
  * DAMOS walk request is done, so that damos_walk() can wake up and return.
  */
 static void damos_walk_complete(struct damon_ctx *ctx, struct damos *s)
-- 
2.43.0

