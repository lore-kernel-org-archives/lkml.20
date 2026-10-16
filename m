Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51934AA013
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792156431; cv=none; b=MSXgFBGYniK28joulljXHCDBYPNO0MZkhbZ/E0Ps+hpHh4KFlExlKE5Gl/4cIrOSCvq3hzEiHR8PS+yvjUereK9qD5eWs7AEg3xTID6o7mQwHKg9zzMzSU7U8XR0TjI4M7qkGJYRLCgb8zopRvTpliweUMCPHJehU91GqJpLq5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792156431; c=relaxed/simple;
	bh=L6pjBYO8pyfc74NKRJM+Aw+PuIzrtslIC2/PolNoslI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GpAuZUnd73cqOEc00TyA6qANmvRMyBkFFPq8ZqfPu7PlaUZEKbRX6kpyywtljA4twVct4+U6APxdvxLl94sCAU8HlhvG3oEB/u0/a6ahnZTrzbk5rGlEXUr1Yf646aw5P6Vw2buUmMQRPdxLVV/wUn4kAMQ7LxU4mh2MgpThh28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=a4ifBbNk; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="a4ifBbNk"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cd633ef819bso1101920a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792156428; x=1792761228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bq/LpBxXTW0ASsexzlAoQoBY+9bpCrcejtfW5Dqw6Do=;
        b=a4ifBbNkAEawdS84V8nlEjf8ubgJBdwTaSPkF5gEhBuq/JeoDXIApGNsXddaW3Bgl1
         KQxy/h9wWBmIz7iwPcYtLPREeUXpj/l20ICdsSYMni0oUgcCJ1JL8xDKv65TuRzi3eVT
         UVKtbfbRkdKaIEZ2Vb+vaVoDk9806vENs95866h/qXQhrQr2eVBuPD5kvy0WN8z7VZ5q
         CakBCNGHY3n+5OHY1vGND0NeLKBJksAjh/F39zVg0XlF8u90X59ADemQXjXbCz7q0Lcd
         qBc8jDVSq0MYXMN7DpHKEVMox43kKGTj3AOvje0f+a3xIMX8BxDZG4Iuv1SkGl9RsmOZ
         TJ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792156428; x=1792761228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bq/LpBxXTW0ASsexzlAoQoBY+9bpCrcejtfW5Dqw6Do=;
        b=qZutbjzHmfAkuI40K5cADQ7cg+e8wWSshMZDX66/Qt6H3wom6y/x+jgfWHVoMpo0a6
         UwRFbJwfk5Fxvzq8/4CDw8MDoGgEqk6X6sdIbnVAFYsxOsY+9B9+mSjSpjRbXsyP+7T9
         2iSOPlGZ9bQlJzIIlUZrmxCpKW3gX0D7oZBXm9hi09JPnh5MUU0maxPF2YDP7DIwfB7y
         7GEV99EQqQJKSPz4FqEbvJoTsvUDMO+xSbnwB4cbLsz/nxtV6ve2oPAn386sWfPmGrSL
         alUjEKrHuh2KB7wRp1aIIbAw4ccapVrCGGS/TnpcK9K93c5u6Ey1MtVLaB5qzfZJa0yK
         kzQQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5RcKWTphRWNHIvKD4fOReTHzWidHocxdlVD48r8p1nYOi8SQB8k3/qqt7aEfIoh7+tDh2j9L0Gxzt/B8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJli+tAlojjkypjBLX/XfGc2AokZd/O7cZXgugfYRA1zMWzHAyJ
	YGMPOZzInUARGN4XN7Wwoedc3SN2ijVTguwVfDrnFzNuh47bZnHgAEYczC8W1eTyXFc=
X-Gm-Gg: AYBFou1xOvM5bX/RMQudwe/7t8bAQ1aNNr3cqz9uFCax1XJB5peuFdOLzlgJg3pCjLx
	qgetJ5SIQNhW1GUpVOVd7JQwtus43ulOFWwKwQnxrlKUU8zm4/qiA53wY4emS0AC9kwRJXo+GJB
	ltuv0Eh1DsJ16NFq/4iacrmJba593tsmENkek/4qOKjKKddMtXlYXUrbxGcOXUloKzsEUn4FHge
	dc8bvRJZkg1xgUABWFPO25Zo5pGh8SDH71HgE4YS9PmLUF/A/rusZlhKhv8ixk7z19pe3ccB0le
	TOckW5CA8jyEDIdYeN6ekCNLhWxgij8serlLDNwLJ7Cl04Wsr4hfDYdZAswfVkf5ykeJ8/2MalG
	w18Fb4nOlZK82BzvE5dFR7AvcfDfK/fk52+nrdrkE1hc+iMIuaJvfH6W/fGZun231dJPYzYTgBc
	b4GZRJ4lMsIx8mmCV99BKDlACBfrAI+gZ8gHYkJrI34XLbvre+8p2C0O2bUCLy4KDiH9ZXu2/fv
	Xl2yuRhrEG4QDInpAg=
X-Received: by 2002:a17:90b:134e:b0:3ac:9259:122c with SMTP id 98e67ed59e1d1-3ac9259151cmr5507879a91.40.1792156427018;
        Fri, 16 Oct 2026 06:13:47 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.98])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc487cccdsm4240433a91.8.2026.10.16.06.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 06:13:46 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Dan Williams <djbw@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Muchun Song <muchun.song@linux.dev>,
	linux-mm@kvack.org,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH] mm: warn on unaligned compound zone device ranges
Date: Fri, 16 Oct 2026 21:13:34 +0800
Message-ID: <20261016131334.3419393-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A compound page of order N must start at a PFN aligned to 2^N pages.
Therefore, a range used to initialize compound pages must start on a
compound-page boundary and contain an integral number of compound pages.

Two recent Device DAX bugs were caused by ranges that violated this
invariant, but neither was detected by memmap_init_zone_device().

Warn if the adjusted zone-device range violates this invariant so future
violations are reported when the compound pages are initialized.

Link: https://lore.kernel.org/r/20261016053944.2579541-1-songmuchun@bytedance.com
Link: https://lore.kernel.org/r/20261016054914.2601510-1-songmuchun@bytedance.com
Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/mm_init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 4c17a892924d..01ced0553ce9 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1142,6 +1142,8 @@ void __ref memmap_init_zone_device(struct zone *zone,
 	if (!nr_pages)
 		return;
 
+	VM_WARN_ON(!IS_ALIGNED(start_pfn | nr_pages, pfns_per_compound));
+
 	/*
 	 * Seed the reusable head-page template from the first real struct
 	 * page. The normal page-init and refcount helpers must operate on

base-commit: 63562804f25cb5b6f5e4f5e3a9f0d1c3c6868596
-- 
2.54.0

