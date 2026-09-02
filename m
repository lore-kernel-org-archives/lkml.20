Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3900836B93B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788337131; cv=none; b=dxWw4m7V36jF3zWT1F9irSUPMi7TsqqeEUbnfyZzg4DDiCi9qhXoalISqKUihvQ2e0fvF1OcSI5Pv6lmwmH8bXTijtSOusESkQOLqfGjZT5+0mERHLDqLNihV4T/svzqD4r7Vf6ONPrzlPDWo+m++1sJhkOgS6AFi8dAz3PoVl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788337131; c=relaxed/simple;
	bh=A6rLcvnK3adoCDStrd8do6BJqgmVpZd7sCs1Tc7EqNI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mV5vn1iP/zcmQTsQS5gT4bQ+LYriLJOMWuSdUzm0XvISmHHey/YM4vt5IK4SfHwyxtKX0MVlfOsuaBFGQjvTqe6uraSHUtHoMgCUS00L4C4oxpBTOUHFIDCjUHgfZ3BLA6A6Ou2QXJ4lpbRdf7nMt2+tiJ+NCpqoI9bin8Nmpm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/Xcjl7o; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/Xcjl7o"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-ca80d708489so583623a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788337129; x=1788941929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QPGyS0AHVOfUWMfJXbkr/UK6bKLRAGXdQYLecgn4LSo=;
        b=i/Xcjl7oV5+XunKAVg9beHrtwDxee4Yx7xNAuw5KERErJwjzQ0rJwhYMxg9QIG8OSS
         KOWCE8A7sIiEdYEL9u21HmXhq6qD0ZKWgoaI+dMwJwsGmdNf+1aHUKPEBByVNRqVSL8N
         fGeiDxiISOR4jWPzT8/YTxwP3MuukXZnVkFT/NvVvs34gPsrlTtlFPbm+bPkcfvUeWUh
         Kh/RvtR1ktKHOZSxLCbSi/vUAnlJHdHaNaPbuDUxtA6RrUbT2e0ayJj8iRvJb1u1aKQB
         E5ISWzewdCEjjuM1MA3+fn6sS9GdybIikz6hcFLhuWfBGHcEngphGaLS5jlYVvVJNPoH
         JtLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788337129; x=1788941929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QPGyS0AHVOfUWMfJXbkr/UK6bKLRAGXdQYLecgn4LSo=;
        b=E/OkwogSdZ+vhTkap9fjrVb0JRkS8ZT0lZ5/mtTzKANCIiw5anKZJDF7g7s35YQ7KB
         vGdl1Eeatdm9w1YJtJKxo1AYtVoUpBHOi1QZTfi0T899wUEgxViCszA7fyDpLIFb8+CR
         RSz0W5AG4SlWIFquIM+hadfaj1V2oJc1UsFCrqEQ5GiNwWuNxtAXHdV/CB/7DRkw60uF
         dK0yg4725o10wTzgCWWg5JakmLUj2HH4p1gga5ZEZgQk3Y946t9GDwi+7nszaoMIkDtf
         Cb3nMqcWeWkXO/xq/VbKN3HpZzBq57Gag6Y1ni7gffccziruoO+w5l28HD0e5skwc3xF
         H09g==
X-Forwarded-Encrypted: i=1; AKwUvBwH8J30Pp1iejI9uFJNZwOWjDMs2TnXipGLmZBfV+vfz3JIEjZETKixEutint/GIRO2xJlnNdCMOhShw+Q=@vger.kernel.org
X-Gm-Message-State: AFuF++klJ+LTYaw4SmTb2dGf7QincF4KegQGQ8l1vM5TIc/KL9YHrJk4
	kIBqJzCLlrPpunetbOoMy5hGf55k8y/MrYgLXd+f1Bj0xzntjoafEEio
X-Gm-Gg: AYBFou3vcKqoDJFMqbsPJKZBNxmSu0xsNLnCcDsv/R04W4TFxS7ki8RMgMHDEZnLZJV
	ydvyOE6iCQYOuuQMElfe3uXtKaAAAFmmwT45h/51sZIa9vxq1BVTyUSWFN7pVjpuu03zbY5m0RQ
	9WSuQe3qhgqUCUJgq1XzAL3bcwX25SXWTyppRmBBiLL3A448jyhFpeDl183nbEqYKiqEeCfkeW9
	TgWYqx5yOCtE7p59H1UfLi+yj6iIYhXpYt9w5IO2Y+xfKPEv9JXATMX8ixMjah5O+R4aB911uTS
	LelrCSWHNY46arTSvxd2cLZIiIt4UJVgjGVPLtCCJfv9LC4P1kewvWuWLmu3Cb50qEcMput960p
	84ZRzvurP6nvJxTCgUFok2eU5cynXqWPVsxGg53n91z9JqHp9D57WHOYAgmPewwP3VPeOGCcoRB
	E18IAvUJjogDhQKSYxGCGC9Sr3wZipLuYFV5I1fRHNzQ05JusMjU7Szz/VxKfrn9/bgGfYZAXdF
	BhAop414H/C2poH
X-Received: by 2002:a17:90b:2f84:b0:398:9bd3:d6d1 with SMTP id 98e67ed59e1d1-39af64e0adbmr1153860a91.11.1788337129220;
        Wed, 02 Sep 2026 01:18:49 -0700 (PDT)
Received: from celestia.taila51cc2.ts.net ([2402:1980:9c5:2de5:8b4e:3f3c:b637:4ca5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d75b540sm10430157a91.10.2026.09.02.01.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:18:48 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Liew Rui Yan <aethernet65535@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] mm/damon/core: fix false positive in
Date: Wed,  2 Sep 2026 16:18:25 +0800
Message-ID: <20260902081825.18931-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When setting goal_tuner to 'temporal', if the goal is achieved,
quota->esz_bp will be set to zero.  In this case, damos_quota_is_full()
will always return true, even if no regions have been tried to apply at
all.  This causes qt_exceeds to increase unexpectedly.

Fix it by:

- Returning false in damos_quota_is_full() when quota->charged_sz is
  zero.
- Adding an early exit in damon_do_apply_schemes() for schemes with zero
  esz.

Fixes: c7ec7d5f6b3d ("mm/damon/core: handle <min_region_sz remaining quota as empty")
Cc: <stable@vger.kernel.org> # v7.2.x
Signed-off-by: Liew Rui Yan <aethernet65535@gmail.com>
---

Changes from v1:
- v1: https://lore.kernel.org/damon/20260901105925.106186-1-aethernet65535@gmail.com
- Changed the check in damos_quota_is_full() from '!quota->esz' to
  '!quota->charged_sz', because the former is an upper bound, while the
  latter represents the actual quota usage.
- Added an early exit in damon_do_apply_schemes() to prevent a scheme
  with zero esz from being evaluated by damos_quota_is_full().
- Changed patch title, original title: always return false when esz is
  zero

---
 mm/damon/core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/mm/damon/core.c b/mm/damon/core.c
index 8e3ded1a2cf6..de78ad56c8b3 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -2560,6 +2560,8 @@ static bool damos_quota_is_full(struct damos_quota *quota,
 {
 	if (!damos_quota_is_set(quota))
 		return false;
+	if (!quota->charged_sz)
+		return false;
 	if (quota->charged_sz >= quota->esz)
 		return true;
 	/*
@@ -2666,6 +2668,9 @@ static void damon_do_apply_schemes(struct damon_ctx *c,
 		if (!s->wmarks.activated)
 			continue;
 
+		if (!quota->esz)
+			continue;
+
 		/* Check the quota */
 		if (damos_quota_is_full(quota, c->min_region_sz))
 			continue;
-- 
2.55.0

