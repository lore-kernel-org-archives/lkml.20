Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0EC396585
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788337243; cv=none; b=mKFjUB/mWzMXnJ9dULfHx8CxUuK5cdMhaow2bDMoHb2wUd28q8UVPzc+C41rqWvg6PQkIg+dOpdG7Wlfv9wfYA8pds9I6tBDCVPOpn/4pWMCbN0fnXgH0m9qHNN0uxy4l2qLRxNjP4QhZCeQVP21q56DPmyAwfwm0+p37yrTghk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788337243; c=relaxed/simple;
	bh=/N08HHB3j4IdAUsjRLdoa6VRu+ufxXx1qoUkqfxRshc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HozthPFgj7Is0tF4o+vR8/lJqmPxLFcgD77hIDJb87AiqZZurse6rD82xaYojEgts2BI0FGDooWs3kYEyn4oN+gGM4bYPYMF5DOKQFPdg+TGcwvn2fdhbRC7x4N+1vre+cXEXsdZEd9kDNZb1y8G1MTj+7D0di9mrY+adxvNvKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahheOvpW; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahheOvpW"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e041ea211so751908a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788337242; x=1788942042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C6stb0h/TUGkigOyr7jwbkqUiojuR7BYoo9mkXkmykw=;
        b=ahheOvpWyyNCJmjy4cMC/I3mgmYr6PqSPX6Gkfwe6kvnydcnn8QB1wrWqIv5QrNToH
         IDV/A0cEpqqh5k7u3munG8xrbbjiMP1gz+IVJR8o1jJwlmDfBDcsnBJ7T8lMDjwtOVCO
         yDr5yHHRTUTL1U4l3vIaYEvjCrSIOu/GXEk90KZAckRxVJQ5TfrLhN+x+I6kLb4C5G3S
         7FFJgLrCr3MVLb/zjUi2u7NVhLhUYqfMrUYW+jaHMIlwSGTojv7H71rOw4+NcA0KaXoF
         YJ/jxNFHSn7CoksHzmeamHcJB1sfXovJPcASX6KFZDSBvhzR5yJOc161nhrzC/6bA5r6
         MsSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788337242; x=1788942042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C6stb0h/TUGkigOyr7jwbkqUiojuR7BYoo9mkXkmykw=;
        b=IwUlpTN9etZnD0yUHM0WmU5LJ2ULshcwDdCOQY6LJAHnueu+OLRoj4uEqqEd0DLiMG
         jBN6C5ItLT+JDDHt5xbeHJ9V+55tRuYs6EAlkB/KU8yhmOwznqyS1mIIV5x+Qgnk7SHY
         FXMQeQyvilq+WI8NjMpfEghYQJVPmnhcp7sFLBSCPFqeqzIco3wlx0KUeyFv3FLNoMS1
         kWfiGmDPT/syJoTFDy94KMBhnVyOgxdpttMVuSJ0Iy3WPbpiRRxHG4ncx6ZOuc4qZZlI
         I+1bRuODN7nFb3760ux7dbcjTKVa4bq2RiSDX5J8fig83UjCeusBuRGXQvkUGw87vT4X
         kclw==
X-Forwarded-Encrypted: i=1; AKwUvByVFwbzXNK2JSAT8PKLVmAYutUtDBpIsMIN0zxBfQA7sXATxy1K4lnhp9k2R1kDd3JUGDMWm4n4C8pJ2ns=@vger.kernel.org
X-Gm-Message-State: AFuF++nVeq5zJBu2jkvAMPHZM9beqaf2OGlUKaY/QBGD6RD1iHRtYtb5
	/FzcpcJ6llHxTDt/vCDbUMLnXSDA61MtXxXFxcSCWoc1WBFWFwJuxbrI
X-Gm-Gg: AYBFou3KqoVEacjbvHBAd9lR1D8vaplfFlpGqOdSJDpfB6Fpcpg8AEdHEGd8LcbSCoT
	FqbojWiMp8NxpXCnI8hGXCukXHqHIhvBsfCFUDs8ZHOq/baJd782oj3/OJTdBQUIDKoZbZxNciz
	R7JwYOBVaWNDsTyQB/Ovkv+WY8XoL/Crsf7uW8sfnk2gFty9XaxZXUN9He6SRqf87yeYo8euY9H
	hgiHAAnMaFsPsD5Heur5bCpi8lTV32Qqm+fHCjGZePNnP095wxeO+cxGzPoH+CaOD7J53Vm7tme
	lvyeRJQxUGZQrV+yFUzqnq57KrnXUShrwVlDkH99ksPuTw3kHRqVrM4xVJKSOEdI2eYasvj5ypu
	4kXVtMswujnIFLbaSdgO/LpNTqitffQSOQSWhr7OK6k2B61Ljgph+/OkhFSo7klpyFYvkvdkRn9
	8uo+G9ll3XgnGV7nxxparQMPLKQyiB7ZUoU1nOPW6bZ6+Xw5THg/GvYTZP6kw3bew9OkoZ2PWfJ
	GPkvcgBcQ4JU+bFEB9KKe3Nlbx7
X-Received: by 2002:a17:90b:3c89:b0:38f:aab1:5148 with SMTP id 98e67ed59e1d1-39aee066dd0mr5075947a91.13.1788337241788;
        Wed, 02 Sep 2026 01:20:41 -0700 (PDT)
Received: from celestia.taila51cc2.ts.net ([2402:1980:9c5:2de5:8b4e:3f3c:b637:4ca5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae3c72584sm4119404a91.17.2026.09.02.01.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:20:41 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Liew Rui Yan <aethernet65535@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] mm/damon/core: allow esz to be set to zero
Date: Wed,  2 Sep 2026 16:20:50 +0800
Message-ID: <20260902082050.19566-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the temporal quota goal tuner determines that the goal has been
achieved (score >= 10000), it sets esz_bp to zero so that the effective
quota (esz) becomes zero.  However, damos_set_effective_quota() clamps
the quota to min_region_sz, preventing the quota from ever reaching
zero.

Fix this by adding a check for zero esz_bp.

Fixes: 8bbde987c2b8 ("mm/damon/core: disallow time-quota setting zero esz")
Cc: <stable@vger.kernel.org> # v7.1.x
Signed-off-by: Liew Rui Yan <aethernet65535@gmail.com>
---

Changes from v1:
- v1: https://lore.kernel.org/damon/20260901105951.106246-1-aethernet65535@gmail.com
- Changed implementation.  The initial solution skipped the
  min_region_sz clamping when esz was already zero.  However, this would
  revert the fix from commit 8bbde987c2b8 and cause a regression.  This
  revision fixes the issue by adding a specific check for a zero esz_bp.
- Changed patch title, original title: fix quota could not be set to
  zero

---
 mm/damon/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/damon/core.c b/mm/damon/core.c
index e13a154aa4b9..8e3ded1a2cf6 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -3133,6 +3133,9 @@ static void damos_set_effective_quota(struct damon_ctx *ctx, struct damos *s)
 	if (quota->sz && quota->sz < esz)
 		esz = quota->sz;
 
+	if (!quota->esz_bp)
+		esz = 0;
+
 	quota->esz = esz;
 }
 
-- 
2.55.0

