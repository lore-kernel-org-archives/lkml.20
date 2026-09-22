Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF81D48E0C6
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790055300; cv=none; b=fVb7J8Sm6+hAMshNFV7cCNqf1wxdyqFX3PZJ4YHboapv0SJIOrFc/MUbipu6sAoJgQ56T2JKE61N3wZQlQrektyad+4qf9C+CGdpw5MaHaU7rxs77FDdd1byrXVm3fbmaeb1Q/XW1vL/68PRcU/r0FWE5tAgtqQ9XfSROlXkEpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790055300; c=relaxed/simple;
	bh=/85IW+OvTho1athsusF8SuiwgPPvr04BfdSaZRV7Nfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VAMWhAvxkBI3jkFZwhEIIxp1O5spH8QoFEJH6BkwEsa9FSfG+7fUI8NUcDByiJio7iznqMBOpG5nBsb9MpsfgQKFuA70ti3lO9CcS2JNSSr0rh2xi4aSaqhEf7ZmIT6FSwNqoIV0JIwh4+4hHj6U5qSOPwp2kL92VLTflizQEoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dwiJnxNm; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kIz9kijC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dwiJnxNm";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kIz9kijC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790055297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qu0BSxnttTs+uKLg/qx0GDVYgMyi2m2Up9fDq2tLMMQ=;
	b=dwiJnxNmaeeb5e74Yv2dL4KbncwDm25K1/OQuBU8KIMHr3AYIqPJt6oXI/5cAyohe++HKA
	iwXLSUuG6Y0lFsiNQcaERL3JU1oDrHNWJ6NU/v5OuanMYTOTDUfUVZJrL9nvocB/obFQEf
	o4YxVir+WKQcthFDRBrcT0bENZzzmdw=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-JnWxvv8oPyeMkCeXm1vxkA-1; Tue, 22 Sep 2026 01:34:55 -0400
X-MC-Unique: JnWxvv8oPyeMkCeXm1vxkA-1
X-Mimecast-MFC-AGG-ID: JnWxvv8oPyeMkCeXm1vxkA_1790055294
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-5b767214d60so283475e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790055294; x=1790660094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qu0BSxnttTs+uKLg/qx0GDVYgMyi2m2Up9fDq2tLMMQ=;
        b=kIz9kijCWaeGmtCpNPHg+wzGANdVwMLD0UwyjgxC54VVB/iLj1IsOW6RgUBZ7fAMhm
         W+tBRdvgTM+7n16TzbaNTdbm+tKYdZnkkb9OzyIvXZ5/Xckiht48so5zvJGsUNb+mtNI
         8mj4ivfl6gPqRKx7npZAJnC+xAwLajC6zfpBs0hXIS8E2N0CXRB4lWqP5loExlrwQmsr
         5zsDrluMJgQUm+Qks7+bmlhLEYfDRGPdJ2kpqWfs5aeVGMRjVSmO9ccyCWqYffymSbtJ
         qBPsYvU3xdDhz4aZJLCx1Wy9LX1oQWm7XY+qajvRCsbn6fQUV/aZbS05EPITDhvDZcjp
         +cRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790055294; x=1790660094;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qu0BSxnttTs+uKLg/qx0GDVYgMyi2m2Up9fDq2tLMMQ=;
        b=G0bQLu8cbqCxTPZJM3447UanZ4etcdUjACdAABh4TbA/jsuIYAtxsqEggxGPPnSfB5
         SXvg/ut5xlN5NFIGU91Nv8lcmiIRuAd7xZYvY4d6UZm9WLpJ+wj1pSidSG+lBTOEJ5Nm
         MIWy5GUW8ZAJRg7T3g+5jWjq73phSVUrb4HRajmqfpjc8ksTPwCDw0uqm91/HbvY0YfC
         IEv1mMBNr+N1NpAxHbK410o3IVTPwZvSm/R5ieAsM95D0sijCiie5/jcw4uSS73b43Nk
         zEDRWNJ60hh1noRr03hqD/n2R2FfVD+fPV4o9oE+XTLMLU19sWwPUCWrjATTrWTgBVOg
         WO3w==
X-Forwarded-Encrypted: i=1; AKwUvBwW0jemGeVU0rgIbUvE8DAiPQHwz+3xHHGXgqjHCDnnk/9qMif8dKFNqHr+2kqHgU6j1Ye+HdyzkDqN3Mk=@vger.kernel.org
X-Gm-Message-State: AFuF++kCAqvQySFCaVvGJW19t3j6Q3XVaqavPfKlt7d6jCPcd98zYRod
	SgUz1HXqTSsd9tJCF2H43U82N3qm9YxWnWaHsB7sv+BaybzSSbAO9bf+/1Y6+AAFR2Mg6HAxj68
	hZ8iHhmW1FtpbS/H16g4d3WEZGQJE3Wrvl6ZgzMRAXTn6LJ9o0Ft9u4R3/whgfjUa
X-Gm-Gg: AYBFou07DnmyPntAm7Nnk51/Evfbi8tWowAs5u6dEeAo/I3rFCGbK6BKDSWIX4BV58M
	6xGil5Yu20pT6cmbCvrZJNV7rznsQqP8cM1hlkbUWt3iAFgByqnZQc20AvDcz65gTJhntshXuQw
	XOcnwW2y06Vx6VNWaUggsO187QEomEexf3fvnudG6mZJAhonoE0ciaOR1HlxtnhWvemY1OImVJd
	DS7hu+0176EoVoMeqvjE3la6xf0yRQm9O86vzsC8G4EIXhZdTekQXPMmfo+CqcY+sFdiS9huv9X
	/iwj3SAnzja+9BxVFOWJyn4biO1rgYvGAVjyjIGe0e/WQ5Few0A2x2n4J3cfDLFzCfAR7Ur/HAJ
	2DYqQhJd4UBJ150DeYlMI
X-Received: by 2002:a05:6512:aca:b0:5ae:b7c7:5334 with SMTP id 2adb3069b0e04-5b8d28fbc51mr474012e87.17.1790055294082;
        Mon, 21 Sep 2026 22:34:54 -0700 (PDT)
X-Received: by 2002:a05:6512:aca:b0:5ae:b7c7:5334 with SMTP id 2adb3069b0e04-5b8d28fbc51mr474009e87.17.1790055293609;
        Mon, 21 Sep 2026 22:34:53 -0700 (PDT)
Received: from fedora (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d46e0966sm191742e87.55.2026.09.21.22.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 22:34:52 -0700 (PDT)
From: mpenttil@redhat.com
To: linux-mm@kvack.org
Cc: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>,
	David Hildenbrand <david@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Balbir Singh <balbirs@nvidia.com>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH v14 05/12] mm/hmm: implement folio split for migrate needs in HMM pagewalk
Date: Tue, 22 Sep 2026 08:34:14 +0300
Message-ID: <20260922053421.4092027-6-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922053421.4092027-1-mpenttil@redhat.com>
References: <20260922053421.4092027-1-mpenttil@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mika Penttilä <mpenttil@redhat.com>

Implement the helper to split PMD size folios during pagewalk.
Splitting is needed if the start and end addresses are
not PMD aligned, or setting up pmd migration entry fails.

Cc: David Hildenbrand <david@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leonro@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Balbir Singh <balbirs@nvidia.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Suggested-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Mika Penttilä <mpenttil@redhat.com>
---
 mm/hmm.c | 47 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 44 insertions(+), 3 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index 4805c88347e6..e6469ef4ae6a 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -514,10 +514,51 @@ static int hmm_vma_walk_split(pmd_t *pmdp,
 			      unsigned long addr,
 			      struct mm_walk *walk)
 {
-	// TODO : implement split
-	return 0;
-}
+	struct hmm_vma_walk *hmm_vma_walk = walk->private;
+	struct hmm_range *range = hmm_vma_walk->range;
+	struct migrate_vma *migrate = range->migrate;
+	struct folio *folio, *fault_folio;
+	spinlock_t *ptl;
+	int ret = 0;
+
+	HMM_ASSERT_UNLOCKED(hmm_vma_walk);
+
+	fault_folio = (migrate && migrate->fault_page) ?
+		page_folio(migrate->fault_page) : NULL;
+
+	ptl = pmd_lock(walk->mm, pmdp);
+	if (unlikely(!pmd_trans_huge(*pmdp))) {
+		spin_unlock(ptl);
+		goto out;
+	}
 
+	folio = pmd_folio(*pmdp);
+	if (is_huge_zero_folio(folio)) {
+		spin_unlock(ptl);
+		split_huge_pmd(walk->vma, pmdp, addr);
+	} else {
+		folio_get(folio);
+		spin_unlock(ptl);
+
+		if (folio != fault_folio) {
+			if (unlikely(!folio_trylock(folio))) {
+				folio_put(folio);
+				ret = -EBUSY;
+				goto out;
+			}
+		}  else {
+			folio_put(folio);
+		}
+
+		ret = split_folio(folio);
+		if (fault_folio != folio) {
+			folio_unlock(folio);
+			folio_put(folio);
+		}
+	}
+out:
+	return ret;
+}
 #else
 static int hmm_vma_handle_migrate_prepare_pmd(const struct mm_walk *walk,
 					      pmd_t *pmdp,
-- 
2.55.0

