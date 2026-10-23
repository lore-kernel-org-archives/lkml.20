Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792771819;
	b=fOqOUFAMQue4GcSG5Wl/qk3OGBIzz+FMO2wONVG1/8ScBv2JwYQ1ZkPxqczvr1aLObyM
	 QOdYUd3CtW78ngXNjs/P08aaBgB528fzYy1/2DxtTcxdTx51sjxcjovws2BAXf3rjRSpu
	 UpJAnuse0VLcN53a8gf3JrfCqLyyvTi9R+j4Wtp1YKPCsVg6Sli8O90Wd4mQEzpASoNqC
	 aFz/PgPD7yNuaTHCtmdRmZuvVbFsKcfMvWNBE0HsJ5G+GJRbaISLgyOJELlncKES+VLbT
	 ZjePIlcg4W+h6+132ZtRqrjWO9++qLXmyyCAw3V2UVmCThbEPN5nu2/KsKUDwPtuDUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792771819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pcQjs8ioOVkLcmotAGouT1i8KfpRT9OJ9Yjm+nNsKg8=;
	b=4uPLuZSvurcZVgWOlattKxJMyk9Ky4P9Le+6jKOa9pynA1twHhONnbwUnLWje/LKc1ly
	 cTx4Oza7kaTZi8DDnuvzOJxVxvoFzrNfl/bL1EvZg5pq2AJTtLuI/mj7LqoCkA3kg7MWk
	 R5ZyZQHFdUieho2F1diaGT/C/zKH5LAtl+yx9aQUKrsCX5fMQJI3iOXtFB+esC08Z+7wp
	 moQh5obYVzOBH7fFvhxpWPsaYUMOFtKpdzU+ppDWH7Cz4+kg21VMORZ4DVEoZwYZAzco+
	 K6ZAB7UBLtw5vBjExfnB6DLIZJufwtAnvguwW7zNzsyeWindujPkSsf9h5NSnGI1qDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SinNUfne;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19DC606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:10:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F19DC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SinNUfne
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so838762a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792771818; x=1793376618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pcQjs8ioOVkLcmotAGouT1i8KfpRT9OJ9Yjm+nNsKg8=;
        b=SinNUfne8fOCHSVmIh5Xx2dPH7pb8k+mllUokPaf17/CKj0YT6zwNec9LTC5spQdI6
         l4sMZLSFp6VhQOB9NLC1avoFx/W1E6YOktOqIjOwXCqdlI8OW0I7qFPc7JblUI3k/Cru
         Mcl9covsSLFc7vl5VqhstuQtu+TVS45PdhuH35VBPjwg7fYYu1O4WGxRt986hnE7eK2t
         SUjUA+ekFpls+XE+GihtkvwC5sA4mJkN4EsMIfir4Lj2+qFzw7602Qd1W4JWHxTz/gwc
         illMDhU8t6eGwi6ydscJYGeLpSi8qR+jFKNFs0PulaBcConEgxHksSZS9tLOgPTh+jY4
         OF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792771818; x=1793376618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pcQjs8ioOVkLcmotAGouT1i8KfpRT9OJ9Yjm+nNsKg8=;
        b=qZ04ptwl9cYGdRMq1anzsZ/qKzIomw10K9FauFX5H6AzitswsGX44IRAA6j5hskNCh
         QYGvJd9ZxN/I5iYFXS1ETt3+CT2+HY0d9DsXjL0cR7kZd+ImEhhtla5RYzfi1owtcwvK
         ntaOHByzV/QVYujoNearh00YUHqaGzymMnlcpe1bh1Dlk9bTchWAter5nIzmCR7XePXt
         Vli18XtMeV1WlO4858dhv8beB6w8M8PS1lVlL9+RcbItPBOq7Oz9hFtyMQzJlb1F+pv4
         /JqKYOnG5OTeIMNYhETQjpNCVqtvjmuDh9Btsgk6JeWUXBJt2JYpSzgKy+obqdSBHTXk
         y6fw==
X-Forwarded-Encrypted: i=1; AKwUvBzEF23qbjn2HtNcdFK6qjBczi850ECZPrb3mUusnxUIONV8zLfcPbEBV0nnOSV7tfCIfXbCMPRY4B7968I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcRfF6EzagNSYV/ltPQR2HkzWFLWq33tcI9TPRGZ0rdcDd5YEa
	LNOXv9wXbVYi3hw+NjoLR0co3LoruMyc9cjvPu6VSId/Pa9lmtgZ4frU
X-Gm-Gg: AYBFou2QPbzSRPBdZR/V4MaJIS82TLs5rTDxuGN3hTAFcS/XLbAlcdDydHAG92cgvzG
	RF3sa+oapM2lhpVX1xeVA3XEH/EF5L5QMyJAfqltkbGGV++kgBM7aLaWDWUolz8DfThRuRmLNfx
	S6dU9eb0MnqDXnBX5caQgw1l69YD7Scn/HaiPsTU1It+CbAFEGRFwA+gfpqK+f3daUN4Vp4Noes
	phyax0gn9VsjrupbHcukGxA+0CHmFZTPD2K3r4E9TpGUXaGMcUs8Bwe7J6kccAtc1cqpF+qeJ9Z
	uVg/BsHVZA3MgA9f/V6mVgdJ7nx0892F0F5G4d/4bw9QDarX3TxeXpYWr+bh9f+/YU0+Ag5QiXE
	JepXdFWV4IUMaV3V8kzRxFuOv9WYeE/CQUgtHQOXJiwq1O2OFbQ/c3dc9ZSP9SQIpyvFJCcE4Tj
	1e2umkIpJtwkuKwRizyf/bPfY8fEhKN5DM2Sb4qqD5QQZLcftHgbt5+xLwgqnqcOUNSmhzpPVIk
	8BqDQY32+kgrQuAgvgF9nwqbbmCrc/9rBsfR0Is223ZzaWbrF2WmHl/2QKKPGhGXxkkdkfyDaLG
	poDOiw==
X-Received: by 2002:a17:90b:4b84:b0:3ab:884b:65b4 with SMTP id 98e67ed59e1d1-3adce154993mr2197303a91.59.1792771818170;
        Fri, 23 Oct 2026 09:10:18 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ade31ff0c9sm258584a91.1.2026.10.23.09.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 09:10:17 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Gregory Price <gourry@gourry.net>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Rakie Kim <rakie.kim@sk.com>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH] mm/mempolicy: remove unused mpol_is_preferred_many()
Date: Sat, 24 Oct 2026 01:10:01 +0900
Message-ID: <20261023161003.59086-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit a492abe28bec ("mm: hugetlb: move mpol interpretation out of
dequeue_hugetlb_folio_vma()"), mpol_is_preferred_many() has no callers.

So remove it.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 include/linux/mempolicy.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/include/linux/mempolicy.h b/include/linux/mempolicy.h
index 65c732d440d2..cd8f944209ca 100644
--- a/include/linux/mempolicy.h
+++ b/include/linux/mempolicy.h
@@ -173,11 +173,6 @@ int mpol_misplaced(struct folio *folio, struct vm_fault *vmf,
 					unsigned long addr);
 extern void mpol_put_task_policy(struct task_struct *);
 
-static inline bool mpol_is_preferred_many(struct mempolicy *pol)
-{
-	return  (pol->mode == MPOL_PREFERRED_MANY);
-}
-
 extern bool apply_policy_zone(struct mempolicy *policy, enum zone_type zone);
 
 extern int mempolicy_set_node_perf(unsigned int node,
@@ -298,10 +293,5 @@ static inline void mpol_put_task_policy(struct task_struct *task)
 {
 }
 
-static inline bool mpol_is_preferred_many(struct mempolicy *pol)
-{
-	return  false;
-}
-
 #endif /* CONFIG_NUMA */
 #endif

base-commit: fcec4f4bcc1101dbd7e3aff267856b3bbfe128c6
-- 
2.43.0

