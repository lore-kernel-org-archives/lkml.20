Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA804F404B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750580; cv=none; b=fuVeSUZpyl4TAb3oR1n9uE4h0//HRAFe2l2VyNkYjP7dmnLojL0GgUZ3mdfqgzOvctY7U/Y8EscCb5U553QTycdwVVSb9sCY8a/8Ru8MRnaYalcoM5KnWPFyxQnU0QeGDyNjKyXpycdLbwRbj94nOxCwaclUJmqAbOUH0e3MeUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750580; c=relaxed/simple;
	bh=0/WwajUfcenToCSvWEXAbxTRyKSAq4K724LifS3zM4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y2PBPDj7BRrYvi6SS3J1f4PMohxDfIJ59aOZGcdFUJ2QALHEymAAtC6tbQRh5GnLsTC3yBhbQLHBCNyNoQjvks+VOrH0eQi/Jda/mtppwjgBSqxZYvNBfRlLKL4BXTrFzI/M9AOlbQS7x+u8jHAAzB+AJLw4eav+qYXp4DYnTF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nvGNbtYS; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nvGNbtYS"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d90ba1d807so12352345ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789750578; x=1790355378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=neVDt5BLYMfRKzGN8kfWno0gbQY9XV/RBxErvToTgFI=;
        b=nvGNbtYSzU493Pk8FC+FC4ehAqfpG3A9qanRe4pPZJ3MKo6H9gsxtmHRVlBpO+aBkO
         9Ed2kaQZ2VyXS7qSk4a8aB9iKrUGBBO8fmmfIexT/z/Umk1/O8oeRMpMKJisAPhVlM8G
         ORbbL56l/cqA6U9lPypTYjNegiahiGHIKKocdO+C+iwnE6TTTRJQ7m/G9GSkKXZeAiKS
         Tni4Nc/eZWVMDEoQjj7P5lUvv7j8Cys1iQqcVCAUxSkOgZg9bcqLPL1rzv+x6EqbvMdO
         2XHHEs8o9q6M21dohFpn5AblGpt5y8C6j6r6yQFGa+1yRu4T4C79w7N3Mb1MGvKeySNI
         jCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750578; x=1790355378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=neVDt5BLYMfRKzGN8kfWno0gbQY9XV/RBxErvToTgFI=;
        b=HaYXseWY1kjDAhtLzCYa3ab29JIl1iOdTAyKbNDdcYZKz14LEbtYndT4IzRjMsJhBn
         7JLJ2EvHxf+3UJLSD3EDI8Kj2zzEqXCgldwdQO89uX+PKSYt7VHg2i9IoVwIbMf3D6no
         U3ORVNwRpbW5x8tNL+Rj6nvs03LnnFaZi6LTza6pBjdc63WmeKzKfKamqo4iAai9MxjC
         gx45QyiWbzIY7jWjZEsOswzVzoQjEOqnCCwdFDYTME1jGTsKzLPtQW2ZJOXlkEIyxtph
         Hbz/HzzttIn2BG6aN4vAYH6YCA2rGQa9X53YS8U1lYk8JUy3aiOrCKCcQQrNHDxSulvZ
         vBaQ==
X-Forwarded-Encrypted: i=1; AKwUvBygdzRiWJ0vsPWPSU81tRrdyj4KMifMARexBdQ6/Uc4r0n9UfuQeayHNRQm1wWhjzXra4VRvP73jPDlhjI=@vger.kernel.org
X-Gm-Message-State: AFuF++nS2p7ZZdtyQCfnrtO9pWbYG58dIz1OqK5E7qt8jpwRI19oP5jS
	/YjtzX1RKXuZ4AXOQ00WJWh1ONRFw01lpykEwasKroeDqbeQs1YN2VrZ
X-Gm-Gg: AYBFou2qfGiVBd9j+kbFz+RTxz/P/6ADoAunXSSfLsLj5ANX/LhSAX1BqU2I4VgL3bt
	LjASqm2we8MRcJkMZr8i0S8/WwFLG545Z8fRv2rNS0vhV2Asyp1chJi7yvjM9G1R5z9Wk3aBVcX
	avcsCPGys+m1vkgls74oY8dzcgvg69LObllJZDTQwJV7ngQ226Nr/Uu+7qL++kTJmEPjivYmqqK
	VxYUJjSdyzvGvNFlgMAQGVe/xZrr2oUg5kljKqyxRVPqH1t5cxnxlKPs1iIwv9+sQ33TSBp5Jb5
	UEMVPQMWsMAUbXaUQl+zoQ1IShG6PBgnmMR/q6W/BE6CoH/NX6X4AkJLj+8UDqPZgIx4npsDVYZ
	GI74SQrsrkyF5iW6OrmlrOJ6nl7E8JqKj79XZQFCOU5EDKlD8Ffm+uaNT1697tOzX7/fVFCUKWm
	0/Ej/Hh4r6bqT8XzH/gP8ASigD/qpVlDjEvGSsCcioz8wkxgikiyZs24ZJWAGUsgwy
X-Received: by 2002:a17:902:e951:b0:2db:7269:38ef with SMTP id d9443c01a7336-2ddb1b77ac2mr79752805ad.14.1789750577966;
        Fri, 18 Sep 2026 09:56:17 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb75bfe10sm11409685ad.64.2026.09.18.09.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:56:17 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>
Cc: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Muchun Song <muchun.song@linux.dev>
Subject: [PATCH 1/2] memcg: remove unused page_memcg_check()
Date: Sat, 19 Sep 2026 01:55:57 +0900
Message-ID: <20260918165601.1014666-2-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918165601.1014666-1-ekffu200098@gmail.com>
References: <20260918165601.1014666-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 90f095b816e2 ("mm/page_owner: use memcg_data snapshot to
avoid TOCTOU in print_page_owner_memcg()"), page_memcg_check() has no
callers.

So remove it.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 include/linux/memcontrol.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 64c183be8cbf..b57a74617b0b 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -498,13 +498,6 @@ static inline struct mem_cgroup *folio_memcg_check(const struct folio *folio)
 	return obj_cgroup_memcg(objcg);
 }
 
-static inline struct mem_cgroup *page_memcg_check(const struct page *page)
-{
-	if (PageTail(page))
-		return NULL;
-	return folio_memcg_check((const struct folio *)page);
-}
-
 static inline struct mem_cgroup *get_mem_cgroup_from_objcg(const struct obj_cgroup *objcg)
 {
 	struct mem_cgroup *memcg;
@@ -1100,11 +1093,6 @@ static inline struct mem_cgroup *folio_memcg_check(const struct folio *folio)
 	return NULL;
 }
 
-static inline struct mem_cgroup *page_memcg_check(const struct page *page)
-{
-	return NULL;
-}
-
 static inline struct mem_cgroup *get_mem_cgroup_from_objcg(const struct obj_cgroup *objcg)
 {
 	return NULL;
-- 
2.43.0

