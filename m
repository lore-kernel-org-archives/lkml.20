Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B2248822F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788281606; cv=none; b=VuAzwXni+6nCeHtVfNTPT8qtLczUHZNemkcrNZX39sp6gHye13ChUt54eeW4JGH13grHvZZYp5d/YOAXgkVdMRiVloPtN7f5V2ABkPPkH8hGh1ZFEDMUcDjx0osxVgRZSBHN6fdkmdIG4St3E4bnR9/fJCC/cFl1gPmvC/Zwg4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788281606; c=relaxed/simple;
	bh=ieq1tmnfAwHtzMDTV4UQmd5L2vCbFmxGWkFzfCoz/3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qbAu/4YOKqZ6HgABVGMa9H6ChXqzuCRN/uT1zaeDYjlFcDLBlZLhuyIaLdiT/A2psCZWDRFqRVOWJyuRJkrZIRVyf23JtiNRQR88qiHpKhEIjY95LKz1fDqzXGY/PQkyQvvqUzW/Q8bf+hdZwpGsm9U96FCZ078dOBF8B2VkGWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kOq+wPx7; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOq+wPx7"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d6f9e2f681so50747135ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788281605; x=1788886405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c76z+PrPPREZ6S8eX0Uy0ClqkcdAnrOnB8Elz/LsQjk=;
        b=kOq+wPx72a5X81Bq7DQ6/nlziKJAWmLwVqRxudALmuuBs5mivLCklZBOQtP7i8hmvz
         MPYMQ09PvD7+Qi4qc65ynj5nHIfI1pnmakFM1JLbfsXQCvnBYEjC9nX9qHjxX1nhangU
         vF0FSyJ+L9JoWpOlH7HZrBqy0bIg4tuRdII0clIw2f52c5k4c7rWWZJL3D/qBdbYEyVJ
         3dGIO5tzLl2jPY+tw2liek3IjEzakOZiIfNz0DfOsDAcCA3sXTYMSmO2Lg8bj5r7Vtj/
         tAk63GRgiTt2qHDLdtZ/FQ2eQPzY+YFzC4sL69OqsFBkr2HWCCskKmsOL5Fui9I8UD2w
         4/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788281605; x=1788886405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c76z+PrPPREZ6S8eX0Uy0ClqkcdAnrOnB8Elz/LsQjk=;
        b=eDa5TX7jMv8yyiwwVY1LesatDtouRtmVyPBnfUDXOOasdRYG45sRjkvY1Mmo93sWe1
         T5iY2qz3ncH6oV+5GYOjexJBWlftwRurn7kc0taA2EYjOobvaBq6IDGMVNpfD4deui+x
         PY4yHJLd8R7PrtsnBfPwkVOF/AFT5YTSLhtB0Q8m9oOQdPJb26fnoOpVwbFGHQDGD0nR
         ZlBcDkfSkaVvRnB9tAE1a8N8RegK/vb9SnirbmSXIrXTm+o5NzLJFHq0OaVcp9e1B4HO
         JGtSU/Enyyivcse/rPRlV4fI/wGc3VgL5H45XmCHRF2AU0Uk0bxiyOZmpWK9xbQpmAzF
         6CRQ==
X-Gm-Message-State: AFuF++kqBli2/jG6pvh/8JEA9N6/xuIlEbmXeejbswZJcq4SnJh2LLOr
	CC7bNjk2nzQ2kvxqwbfxQujOHtce8zdIoQp4Ei9GjXwLPSqLsZF9gpDS
X-Gm-Gg: AYBFou3uY5rn0Rp0mLVYWlWFeL3g6xncnVtyywhUURft7lFzOyaLcyVI6GHZqKE1E4s
	cCAg27Ea0HejsLBO2jitKJpqBpewFJvTIbiOrF7JPFDs10R8ApJsDV84FinVzFZQVID87yQKgfv
	mFkPMyJC9dqqQjKiSQNbqm7AKS/StBzSBNxJ999CBa+Qxp7GzuE3kAMMCjUILM9YaKM1Jy8mmTR
	nGoDYQhzh9lhooRoryXf0shfseqGwrrABzRcW1ckvQBjo3jZl/ir6Wb9TKLsTMbpYK4EKr1qxOs
	1zi3EFGe79jBlHUQYokDSvKCZfwz6bSPveb8yo3KroNL+kPaices8ISKRfbq4e+MYA7PhmWSCdy
	h/eJ1HGB25EA5rqzxCkqsN2NwAvYJB8fZXmWtotNXijplmILM1Qv38jfZrB+uUotPyRFf3SPRWH
	/SHwJxEAI3jFXu4WnKNbY04mRE4co7M+VrXWXcI2UHqiIHjiw7urNDmWs=
X-Received: by 2002:a17:903:3d0f:b0:2d8:d4ce:7e3b with SMTP id d9443c01a7336-2d95d5fc28amr90581935ad.16.1788281604498;
        Tue, 01 Sep 2026 09:53:24 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd357efbsm1762325ad.4.2026.09.01.09.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 09:53:23 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 2/4] percpu: remove unnecessary initialization in pcpu_build_alloc_info()
Date: Wed,  2 Sep 2026 01:53:02 +0900
Message-ID: <20260901165307.1026248-3-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901165307.1026248-1-ekffu200098@gmail.com>
References: <20260901165307.1026248-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pcpu_build_alloc_info() initializes nr_groups to 1 and unconditionally
sets it to the number of groups. Nothing uses it in between, so the
initialization has no effect.

Remove unnecessary initialization.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 mm/percpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/percpu.c b/mm/percpu.c
index 5700385fe6a4..f222b43cc90a 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -2817,7 +2817,7 @@ static struct pcpu_alloc_info * __init __flatten pcpu_build_alloc_info(
 	static int group_cnt[NR_CPUS] __initdata;
 	static struct cpumask mask __initdata;
 	const size_t static_size = __per_cpu_end - __per_cpu_start;
-	int nr_groups = 1, nr_units = 0;
+	int nr_groups, nr_units = 0;
 	size_t size_sum, min_unit_size, alloc_size;
 	int upa, max_upa, best_upa;	/* units_per_alloc */
 	int last_allocs, group, unit;
-- 
2.43.0

