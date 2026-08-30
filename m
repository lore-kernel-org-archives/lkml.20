Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240FB17B505
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 06:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788071519; cv=none; b=Zuf1ALwBg7OWRLVdHA+tGcJG5zRmAmlkCdV14bPIf6rBPaTFfvQmaqF/aL59eTMWU9Gly25SS6Ej38UFI1HhV4fWdflV8yr8LRAnc/At+I5zNB9alKCPC2soSdSexHjiQzFq0RTKWiMJGQWS01XwikdeaOOP7zdiupznwX+xHnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788071519; c=relaxed/simple;
	bh=cjGZh6aJzF6tvnNxut3Za7JYORBuyxbP4UJEMgWdxxY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E80PaKVaRReJN5REt60cpYzApr9eoHnNpd93d6Pes3xKNI4BeRYtOd2w8T3+uEktEHLjbC1tBQF0WWfDX2TsgQ64qKBuAVFoPD8Ze9Vo9Jro8xDkPtSp7y7exytmmfq60sxQ/JJaOvIUY2g6XiDeZPrP0ixb4lhYQB0SefqrDCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=od5rlwcp; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="od5rlwcp"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso2620318a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 23:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788071516; x=1788676316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QjCEjlQx+exRVLDUDevoSIURgdv5YYALfDraYMLva0o=;
        b=od5rlwcptFPEN5pd5uSBVUcpYddK3IYfgcdkqMMGwbIumfj6U57F43U3cToR2+RyKy
         KmQBgQVRSXiS7ySop8kGI2SchIzUYkoF77YJ05hVSEKdg5W5d/wMb5RyXhJHV7EhHAYw
         ldnGDXPRJTJVq7rq3aWpGL4PzdowyjMPIZi0cEDYffcc7v8C5f2SOvfiWyV29CRe6SnY
         TdgJKCA8JkNenMI9AaBLxuqdbAr0irdJLdBX+hQCv61YjLKMYo6D62BJaVP99uT1CfPC
         B0uQ1hOTGL5tfCSx1F4QnNlHAeYDirUgCZj59UYcluKYG84RJFhOlJ6ckbmIlVsjtT17
         qiYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788071516; x=1788676316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QjCEjlQx+exRVLDUDevoSIURgdv5YYALfDraYMLva0o=;
        b=dScC70lYmJaRZtlQp4RBZnlKS0T1BxosNkG5AgCXSro3zaLB7HgYktb7jZBLnRAYTE
         bRwaEnJnwAA3yiQLozL10z03Zg7UqBkceBCoJA06LnG5x45dXmXYYFgolcdrzskOXNcQ
         NkYiQ0YymEQaUNmHU7FvovbwlMIIc2O+Rklpu0zuugX9rXQxCJZsgtTqB7d4AdIuLSPj
         au6ruHmMtwxKHvBChLy5iBQloRe3oxaiB1FF3dszsdDg6OmedyyGhxntJOWCwtMK70S+
         tCY7X6wicaoP5kFtP/KotHPeC6lrQg2x6TLdeqQ1odD4C8LRvCinn36hpnDtXsjb5GVx
         bXcw==
X-Forwarded-Encrypted: i=1; AKwUvBw/1RROflYt3b6ai8Q8Ij3/HOOK2l1Ef01TM04WpqXp5ty3UgriaswlRMAAKrpIP6YOHyozA87GA3If2K0=@vger.kernel.org
X-Gm-Message-State: AFuF++lUYSu4jBDDsIs2x1VQQlTFwPoXlOIFHvEW8uaXv24k1MRO1aJO
	URNZ4k//zQuR7Z4gcqAh8zJ0dDguPbD2UgDm2yvUX3Fn4UpaJ4OoXKHk/7kvZw==
X-Gm-Gg: AYBFou2KIjzSJ74flKr20OfKn8aWvNzfn+poRQuWrPh41Cez9qwt45qv1ZpJLtPPi/O
	ZnuQmdnbn167bnZfMleNZpygYqucAOaCgmTWUhXXN9itQYSjhmJDWxHy/WoWma2o283cWpFXqRs
	hq/evHjb451W/Kci9RU1mDARlDBB2XIdSEoFubTs0KoTESMNKECC3PHy2mjwT8xjOjWp7dx2CJ7
	HiQqtpQp6QDwFVCrCwZk4RGgGxu3RHV8jKvDVvOfYGc8k26acv9ZihPOV0qsNuhOTE1/B8lAdJv
	BSbPfeqYDxueDj0sGVrnZIG5MdPRkNedyNAgXq2OX9hWaL+ft7aY22MoPp48zXFLZ7Zc8FsUKwQ
	sq1ed9Kj6uML/V3AfbuQt2Wc0/PbJ1/DaSxvgQ5lufaaiH19FDnpPp4917EMLJ1swvITWkqQmsr
	JDacywsGxIGuGo8zHr4X1nADHDs072hgjApkXoWQ1dGPWQE1l/vzGow2Iv/pxX0b4Ww177JabIB
	kQ3BwxfAXcAg4wu
X-Received: by 2002:a17:90b:55cc:b0:38f:657:6823 with SMTP id 98e67ed59e1d1-398da65a974mr587978a91.8.1788071516309;
        Sat, 29 Aug 2026 23:31:56 -0700 (PDT)
Received: from celestia.taila51cc2.ts.net ([2402:1980:9c5:2de5:8b4e:3f3c:b637:4ca5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396ddc0c703sm10079411a91.9.2026.08.29.23.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 23:31:55 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Liew Rui Yan <aethernet65535@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] mm/damon/core: fix unconditionally skip last region
Date: Sun, 30 Aug 2026 14:31:50 +0800
Message-ID: <20260830063159.6347-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Once quota set, the charge_{target,addr}_from unconditionally skips and
resets at the last region of the tracked target, so the last region can
be skipped even when it has not been processed.

Example:

    1. Target has 2 regions: R1 (0-100 bytes) and R2 (100-200 bytes).
    2. Quota is configured to process only 100 bytes per window.
    3. Window 1: Processes R1 (0-100).  Quota is full.  charge_{target,
       addr}_from is saved at (Target, 100).
    4. Window 2: The loop reaches R2.  Because R2 is
       damon_last_region(t), the old code unconditionally returns true,
       skipping R2 entirely and resetting the charge_{target,addr}_from.

    Result: R2 is permanently skipped even though it has never been
    processed.

However, it is important to note that this is a very minor issue.  This
is because it is triggered only when the previous window saved/kept
charge_{target,addr}_from, and in the next window, all regions except
the last region were skipped by damos_skip_charged_region().

Fix this by only resets the charge_{target,addr}_from when last region
is reached, only skips when it applied or cannot split.

Fixes: 50585192bc2e ("mm/damon/schemes: skip already charged targets and regions")
Cc: <stable@vger.kernel.org> # v5.16.x
Signed-off-by: Liew Rui Yan <aethernet65535@gmail.com>
---

Changes from v1:
- Simplify example in commit message.
- Add clarification regarding the severity of the bug to avoid causing
  users unnecessary afraid.
- Modify the patch code, each time the last region is reached, only
  charge_{target,addr}_from is reset, but the return value depends on
  the situation.
- Modify patch's title from 'mm/damon' to 'mm/damon/core', since it only
  changes core.c.
- v1: https://lore.kernel.org/damon/20260828084737.290024-1-aethernet65535@gmail.com

Changes from RFC v1:
- Minimal fix, only fixes the issue where the last-region is skipped.
- Add an example to the commit message to demonstrate that this error
  occurs very rarely.
- RFC v1: https://lore.kernel.org/damon/20260825124616.5129-1-aethernet65535@gmail.com

---
 mm/damon/core.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/mm/damon/core.c b/mm/damon/core.c
index 644daf5a1656..fb76b530bbc6 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -2342,36 +2342,39 @@ static bool damos_skip_charged_region(struct damon_target *t,
 {
 	struct damos_quota *quota = &s->quota;
 	unsigned long sz_to_skip;
+	bool skip = false;
 
 	/* Skip previously charged regions */
 	if (quota->charge_target_from) {
 		if (t != quota->charge_target_from)
 			return true;
-		if (r == damon_last_region(t)) {
-			quota->charge_target_from = NULL;
-			quota->charge_addr_from = 0;
-			return true;
-		}
 		if (quota->charge_addr_from &&
-				r->ar.end <= quota->charge_addr_from)
-			return true;
+				r->ar.end <= quota->charge_addr_from) {
+			skip = true;
+			goto out;
+		}
 
 		if (quota->charge_addr_from && r->ar.start <
 				quota->charge_addr_from) {
 			sz_to_skip = ALIGN_DOWN(quota->charge_addr_from -
 					r->ar.start, min_region_sz);
 			if (!sz_to_skip) {
-				if (damon_sz_region(r) <= min_region_sz)
-					return true;
+				if (damon_sz_region(r) <= min_region_sz) {
+					skip = true;
+					goto out;
+				}
 				sz_to_skip = min_region_sz;
 			}
 			damon_split_region_at(t, r, sz_to_skip);
-			return true;
+			skip = true;
 		}
+	}
+out:
+	if (r == damon_last_region(t)) {
 		quota->charge_target_from = NULL;
 		quota->charge_addr_from = 0;
 	}
-	return false;
+	return skip;
 }
 
 static void damos_update_stat(struct damos *s,
-- 
2.55.0

