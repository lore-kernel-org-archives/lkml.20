Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE7D1FB1
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 20:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790280997; cv=none; b=P6o9O2cvPL/A5C2szgpoZtTNzSb23onaW+9lP2nko8DtzYfv6CdR5a4duLqHVmWNcm81Wb9hkqWo7goUmJm9OrXzAcxRM8YzLytRcocmCEEtDVw20Da4Yo9MosqoHeR4zAXJ/SDJ3dxebnZCyiWT+7XbPlP+9ubKyhN18JV9XIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790280997; c=relaxed/simple;
	bh=LmbjwTK4tuaONw1jCkYsUmgRPvsp4oLyl3+5bT69KPA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hVVBzraEtIL9eB6gESUjTK4MlKU3D88wDT9Il2Ccb8xaKAhOX8vXUtZ+4QBBVp9P7mc3KBX2OFRNJ3k4WxZMbPQI4xYPigiYrzag0NPIDCfcni9eM0OQojCtw7SyBK/P8OF87w6Buf7fitLrWyvCnxOgzDX4VjStCsXnyrwTBb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lVoCeg34; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lVoCeg34"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so1012115e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790280990; x=1790885790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WT1vJAlJB3UqsXiDI150AgVhKS27Afshhi+pSW9AfhY=;
        b=lVoCeg3431wztc9TcpBQOLG7GJbZRxQ+peAsFNgURU8sHwQ+HS9NmwBf0jwoDKqk0z
         jvrEsRpWmCrwVOXtWEs5tsQd4kqQ1FB931YCPIGDWyXBBNf7PGq03d1/z2Ma3DLLnvSQ
         vRpKRAL75yLqCGKZ9OF/iwErMmxuzOOkmGHMwNPqVZ/mU+KegWyyVIazeYxmhax58BKU
         ukqJwhGO7JEwJECTHSV5gSwU5tzAlK6jcM1/XG5D3p5rEhSNCP/py6b1GzndrOWk4yJD
         XkF6Z6RTRPuZQeBwmYCgKcYBYOzR4YwfV9D87/ce6LnWN+8oBt+6UUD+84M36XU/unaI
         ByIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790280990; x=1790885790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WT1vJAlJB3UqsXiDI150AgVhKS27Afshhi+pSW9AfhY=;
        b=S4XnB/cyCDUSj1ytrKDIMs+l/DPnNJ6uOp9+HEMIkltqMGy3BeO2ZAvo9cMRSJBsAu
         aVCcCgNjcVA8qV1vXXRZfJRt0o2snxuYog2IYic6zU+kWyivtqZL5q7T5DDMmZuOFgFh
         WNRKermMD3ZjxYP9PL+kVcKM/QiB+DN+OI88aNMbop7f2hUOWIkqck1m3rOTWaPmYcXl
         eGGnEvw5HffJhaoO9cPGSrOlz/S2xkZ5ZecxQs8v1/HIiGrlOR7P/9XTV7gQeQZA6omF
         /P0WNgV1O+eTBKcIgfH03ngri6O6utGEIfANzSN3iLD9I3YrOAVuxeTDAnn4PiyRcFPw
         9y7Q==
X-Forwarded-Encrypted: i=1; AKwUvBwrdfH5F4fnME7VojVgP76w8FDf2C2QTSkxyExID2h4Z99BMCAtK8YINf+p/3SYrtw4yfecAjtmMTMu8wo=@vger.kernel.org
X-Gm-Message-State: AFuF++n5iM4f2V5o6MJAsG1u0nvnMbmZugc03nE5Duj6GyZbeASw+lWp
	HVama7Q9D2vp6Ia5INsnMM/BKMqDaYTz9hhY2eBqdLsy/aVBuoUrLTEm
X-Gm-Gg: AYBFou0rbzMxXwWFXiehxzWyuJ7U9V4ZiTSaDTOf0ZpfdgoEZ4KucZUchyBYy9By9N+
	fdXzw7AkvlzeQslEnOGLdaUmrAqIqaxPqyPht4JVpbIofRq/OEHX3ogYEutlSORWiYM64rF0S70
	4+mSMjj3CC8Ypx4N6HLE9hz+XRE9xbM9bCmG8xIadYV5mjVU/6Mh56LtMv0O3ispsEgToCu0IOK
	MLpT1TPHudPRaxFia0Q9qvnH8Cc2J62tGVxGsHzbQyjLNUacgiGji/J6Wfez/Mo4N5ic/18nSU9
	Y/DDWMGwwWOv+0qF+wilWk9BdZlbQnDmNEPkhD1hGSdJYzR59eQmiS7cECjqGcFhyRIBpPD3Wtr
	zxKjDSNQda03znO3ZIbeFFWovatjGDutjUkbfszrnoD2C24KUTu+jNUg2Y3MNgHwiFb9+0i6VNv
	sI0UQQOGtBIawrNzWtJwse4Qp14hD7ZoVf96z0FwZSnpcs4s19A7pCepxENwVbsIEB1esx4B5II
	p8poLfK3mi1cCuJ4PvOnnVBH+z0fsplRe/93ijtAUw8rDXvDQD9krW134BooCQKlBwNfWGF4Hly
	bqzU9y9iIfIb9TJhzQpU+fMXIkGQT8qmgB5XCGrxWqVRoJwpg5IVVhRpcKKbJrJt0QbGef7mWRp
	a5Aj5XnGD7Ar8nw9T3zpK9Q==
X-Received: by 2002:a05:600c:8b5b:b0:49c:f13e:e4d with SMTP id 5b1f17b1804b1-49fe66f17damr60720065e9.10.1790280989870;
        Thu, 24 Sep 2026 13:16:29 -0700 (PDT)
Received: from MBP-von-Karl.localdomain (dynamic-2a02-3100-adbf-6901-3138-76b5-e9f7-b9cf.310.pool.telefonica.de. [2a02:3100:adbf:6901:3138:76b5:e9f7:b9cf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dfa6a7sm144818795e9.12.2026.09.24.13.16.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 24 Sep 2026 13:16:29 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bijan Tabatabai <bijan311@gmail.com>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] mm/damon: preserve quota state when constructing schemes
Date: Thu, 24 Sep 2026 22:16:12 +0200
Message-Id: <20260924201615.4478-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

damon_commit_ctx() first commits the running context's parameters to a
temporary context for validating proposed updates. Constructing the
temporary schemes clears the running schemes' quota state because
damon_new_scheme() initializes the quota passed as a parameter before
copying it to the new scheme. Even an update later rejected with -EINVAL
loses the running quota state.

Initialize the new scheme's copy instead, and add KUnit tests for the
constructor and for accepted and rejected context updates.

In the v1 live test with damo, a scheme with a plain 64 KiB size quota and
a 60-second reset interval uses its quota, and a full "damo tune" with
unchanged parameters then lets it try another 64 KiB within the same
window. With the fix, sz_tried stays at 64 KiB.

KUnit was rerun after the rebase on x86-64 and i386. With only patch 2
applied, the two new tests fail. With the fix, all 46 DAMON KUnit tests
pass on both architectures.

The v1 DAMON selftests showed no new failures (QEMU TCG guest; the
wss_estimation test missed its accuracy bounds with and without the fix).

Changes since v1 [1], following SJ's review [2]:
 - Collect SJ's Reviewed-by for patch 2.
 - Explain the running-context validation in the opening paragraph.
 - Clarify which quota is passed as a parameter and use "commit" for the
   context operation.
 - Point Fixes to commit 60bd24f272d0 ("mm/damon/sysfs: test commit input
   against realistic destination"). Drop the redundant stable version
   comment.
 - Rebase onto mm-new. No changes to the fix or test logic.

The series is based on mm-new at ad8b9fe7a502. On damon/next, patch 2
shares context with the PSI goal test [3] and applies with git am -3.

[1] v1
https://lore.kernel.org/r/20260921003047.12041-1-kmehltretter@gmail.com/

[2] SJ's clarification
https://lore.kernel.org/r/20260922120845.44460-1-sj@kernel.org/

[3] PSI goal tests
https://lore.kernel.org/r/20260921020013.33105-3-kmehltretter@gmail.com/

Karl Mehltretter (2):
  mm/damon/core: preserve the quota passed to damon_new_scheme()
  mm/damon/tests/core-kunit: test preservation of quota state

 mm/damon/core.c             |   6 +-
 mm/damon/tests/core-kunit.h | 107 ++++++++++++++++++++++++++++++++++++
 2 files changed, 110 insertions(+), 3 deletions(-)


base-commit: ad8b9fe7a5021ee745b61d6d33254a69af65efdb
-- 
2.53.0

