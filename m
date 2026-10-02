Received: from mail-pj2-f16.google.com (mail-pj2-f16.google.com [74.125.227.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF8D175A85
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790957153; cv=none; b=gYfOG0c6Jb81ENsewtjNGKzdwQyxW31DHti6ZCJV8V6pHNqaedi2rgem1Sf3ovk95oAji12FdkKZm2Pvqa+6lATP0xiL8/JZrsT5f0C5GDbuPPETrTdE95XpzODngLTXclPKA07tcv0vIALaywJGjCtPZ+HZI/5njrw5e7CEkis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790957153; c=relaxed/simple;
	bh=8kj1ge27OAP5leJ4FvryN39hXECPjn1igBOLFxH7hAg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JBhtgv/MQYhEjPhxOXtyC6F69eXhpZRzgJDzIL7QqHJqsiX3OrVk94ACDBDgDtOnIhu+uhthb6Z/CxrboyKmbrFochIvPZGA4WVB8gHps5I/JG26vtYjLZR4aAWQRPWYY3pRhzkeZVQUQF1Uon7O1Mr/y9ljmFM+TrkCZJpYlqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ixsJzQ1d; arc=none smtp.client-ip=74.125.227.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ixsJzQ1d"
Received: by mail-pj2-f16.google.com with SMTP id 98e67ed59e1d1-3a6f8525bfbso125807a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790957152; x=1791561952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dYBcniAkRiKcrPB14o92qA/kWKzbO5nnV3tEc+XkJmc=;
        b=ixsJzQ1d3+NxQwIL8aeaZL+zXTgScSOR/M8uPbt7+gVQSS/JGCCDiAnR+/VdDiag8B
         21nNm4bQp8/i6Y/siQ4mgm/RJ66O+nMdXHxkp61wUlixaMHqqkVWrBzxHcjqlZHXTa2S
         YQplmfkQnxyqleiMgb7WRKkFq6jLqoTATZ/dhLf4gaxpBMdFEyrNr7Y7BtPsIC9BhL5/
         GwKaz53cuJCXlrw+nbMoOh8b24elA6fN1nCbNlUBP0rszFWqiM0qu9CEyzk0IXgH5y2O
         VjhWv23u+qYslIWYhZQDallDyGvqqQh6pL0Qe2+Bt6sh3ePsGsqE6/lYQvSbrUC/21MA
         ozTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790957152; x=1791561952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dYBcniAkRiKcrPB14o92qA/kWKzbO5nnV3tEc+XkJmc=;
        b=UMW2db7511QBM5fJn+Yt7qhjHvvmQmr8aIwbyQ3+ymJlyK90sKYvKHnZcB4XPW5o0Q
         IklhHLAP9UBJ9vglZIFU9lSFryvBbMwYi+NjQK9xFVdBSaMJwBq1TaKQbslOh5Cq/SWP
         jTgt+uL00QoALseQRqIx1kdTTBPPbNvKl4sRMJsQRyclATV/zT4J8S/DwLJrUGPGWtO9
         JiAQcqxsW/VNjxFdBOKDqeYQ8sg/ChggyPENqIOyhn24mBxpl/Ul/CgRSaHCmCFu+5/Z
         1Ewjfnx2n0ZUY61Gd2sfdJ0Vgu0vIM1t2IbQjRMpltJitwjrfWs7AA1ENfj/zuGcs23+
         lwFw==
X-Forwarded-Encrypted: i=1; AKwUvBzXXRSa+pyOv7FUJYL4/yRYzFtoqN3zi/Gmros+wWsJpcOzfSTqGrhEXsrQV8pxEb4jonGUUpUwnY/K7y4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0DpQwbxU0g0Jh1OyuFTqrloO68VTLTiyXUByzJwJVKzH4d8/g
	WKFzW7Q0fTKgrI9LK8Dn9uZiaCfdCOCxX6vI9YOfHmC3SV84G36vb9oB
X-Gm-Gg: AYBFou1fIpWAJWeCi6eXFa5adfJW8mIWP5YO46kiC2Bnkz595Q+mPtDHeQAE5qd0sCl
	UYUSi467seKiB8aDq2nTkV1qRJrtaicEddl3V1fRxP0A6gQYBriHispNAjbiLMUpd3E8cbPwU7F
	i12CC3oKPu0WvQ4JazKc5Z2+gZQH3bz6oC4Ay6Dk/uSyPhlloMP1Klsv2foI8VFHUOeUPOLRqrf
	IC2sOvT2yRvTl7uoz2hbN/xKnbFjnPDy1T9IJraDHQ91DdllA3eO8s5Pp7O43IloIinFQ3DUI2k
	lmZ3ml0uBIbk6LPazg02I8JJqXWRxc4JUp718yTIX2ohoQWCXNC5rUy2IBJPc34uboawbm1Kmkv
	EL2zdcYL/dDeLkTUpbYIl2dnIlyPk0IjRvJdT9FzJayO+OXOI0Y7tf1zD0jOY+mWH9bWdrNLqGp
	452o7uYERQlEjpI0CP5SH+cnkQWfwQcuxQDz4N5Zhg/p626v/kAi5rBafv1Tiy205OX5WOamt06
	RreBgc65HxO3dkFJVLcn3er
X-Received: by 2002:a17:90b:4b0d:b0:3a2:b0a1:456b with SMTP id 98e67ed59e1d1-3a6cecb1b3bmr1893453a91.47.1790957151371;
        Fri, 02 Oct 2026 09:05:51 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f47cb357sm9375672a91.17.2026.10.02.09.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:05:50 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	"Jose A . Perez de Azpillaga" <azpijr@gmail.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: [PATCH v2 0/3] mm/memory: remove unused vmf_insert_mixed_mkwrite()
Date: Sat,  3 Oct 2026 01:05:31 +0900
Message-ID: <20261002160535.661399-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

Since commit 38607c62b34b ("fs/dax: properly refcount fs dax pages"),
vmf_insert_mixed_mkwrite() has no callers. This series removes it and
the mkwrite handling that only it used.

Patch 1 removes the function.

Patch 2 removes the mkwrite argument, which is then always false. It
also removes the unreachable code in insert_pfn().

Patch 3 merges __vm_insert_mixed() into vmf_insert_mixed().

No functional change.

---
Changes from v1 [1]
- Split into three patches for easier review
- Move the comment about -EBUSY handling above the check in
  __vm_insert_mixed()

[1] https://lore.kernel.org/all/20260929143707.450805-1-ekffu200098@gmail.com/
---

Sang-Heon Jeon (3):
  mm/memory: remove unused vmf_insert_mixed_mkwrite()
  mm/memory: remove the mkwrite argument from __vm_insert_mixed()
  mm/memory: merge __vm_insert_mixed() into vmf_insert_mixed()

 include/linux/mm.h |  2 --
 mm/memory.c        | 81 ++++++++++++++--------------------------------
 2 files changed, 24 insertions(+), 59 deletions(-)


base-commit: 1c2b8d2725f84b43fabe3b3e9628c91db8ca6c65
-- 
2.43.0

