Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8650E48E0C6
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790055306; cv=none; b=sPm4y+niODITP2YxGPgExY5LM8GFSm/5UctSeduPeFYt5HDzxi43+W2qCLWBExAy76XAw6D3CeQ7ZcHiHps/eep34QiwJrQOtGeOOtL8lpyRUXWdomrN1DCCgr+a7gE+9o6/PEldb2HBOewLb03oRLK6uWVyYV2FJyNkjNVzeKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790055306; c=relaxed/simple;
	bh=0FXsJV1z79oMxRtSOr/aKFhpIItT9GM5SpOVBZoF7BI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SMwQqnBjUfvXLiz3ruiBZjtuTX4ZTh0tBq3p4iKPo8XWZ0lA/mpXQY7PXG9HnHJ0curLJuzTIT1h7X9GAMEwt3xH4pA3DmjJS/CG3XZ39mp/ryWjKAgFP8IbHBupZuH+cSjxbFxfzvmq5MdTRJEuYelrj6quevXuUzOOEJ8gHis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ccXPWX4u; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HmuPoGEw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ccXPWX4u";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HmuPoGEw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790055303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Dwb+61ZiIhZrjnlVPFK1XZrDSM5l5u6qowPzm9WLF0=;
	b=ccXPWX4uvzF6Wa1aba6tsfuJuT0R0Yz+PeoDGBs9Yd3nMnEJWn5g9gXx8wtoK5pLaMzs8C
	IgidwsNpXmtHeNSh3iTId1THLd4OxgJyoL6vzyx0wQoQoUhXoZ/4t7Rny4shBfBWgX8U4l
	4JhrROQypMpzi4FqbG98+fN2Pq422jI=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-r9iqtV6BNiKqDPnvXmS_EQ-1; Tue, 22 Sep 2026 01:35:02 -0400
X-MC-Unique: r9iqtV6BNiKqDPnvXmS_EQ-1
X-Mimecast-MFC-AGG-ID: r9iqtV6BNiKqDPnvXmS_EQ_1790055300
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-5b8c58d7635so1656862e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790055300; x=1790660100; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4Dwb+61ZiIhZrjnlVPFK1XZrDSM5l5u6qowPzm9WLF0=;
        b=HmuPoGEwiPGJ2FRmRWT6BPNruvUycnktFWlmHsR0Dg9urdWrZF++hQvYqP02boMIDR
         O4+3wOTZfs/2V7c/tWede93905W3lE/o3QSQzP95s1Sl85wL+PGi78t4/RtooWHHvGP9
         YpFsAG8Lt9IfnA4bUT4K9ZuKi/7ISkhuj+L4/Z6bcMgqNfPTeh0S2XI4CbigvNfjemSH
         BItJnEQe6LVjwabT6Bf75yHo9xMHyADMKWXuaxPxzm4PIGWtjUmKXjIH5/eJdLnLfBbW
         7kUDS66NvJohbO15z6EQ1PdNobosAZJdAlJ47JXtEQMMviI4bHzxenPRgE7UC0mitIoD
         ErNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790055300; x=1790660100;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Dwb+61ZiIhZrjnlVPFK1XZrDSM5l5u6qowPzm9WLF0=;
        b=RNnubjS3fwSOPu+ajdYgwz3MLrlvOtvOC0yyuituztXCHvh5fZ2ksRmaMikABmIRxu
         bXMe5usH6v2ByaaESo2Md2yq89kex+u0he8umNWw39vWjlJJr/P5SoPl43qYlugjDHG9
         ZYkr2T4UVvNsFPuqKff6C5M6ZgW+rJyfZdW+PVULaqRWoRWnDlxWEx4voQVVr1OdreZl
         G99/Su9yd+v5Hxk7hxXCm7SbHMyT2UikA142ESZy1ujFtNmVaseRyeV8JlxdB6d++Gjw
         Qdm2cD3eTS2z/GNpF31bl2CoxC2vjhLmNNM6NiyUbeqpoWMWGpkUDlL/B3INfx50Av0M
         RkyA==
X-Forwarded-Encrypted: i=1; AKwUvBx8/+bGGrhflKz1U/7lW5u+B3zMfKPWOuxMansxWyeJXhD4TpHdvOtymE+UIegJ3RaBQ/IUZh15PjnlGQs=@vger.kernel.org
X-Gm-Message-State: AFuF++nFuBQx4VlBcxFMfmxGrX6yzcERzPzGBra9vMgi4hlM3v8e5EsI
	XDboSFWnSzDGf6huK1q00U9m+dgUPh3OlBmneo0Rvqdi6zdFU7asgXM0gMD1oF8XXID0jbcWscZ
	CT4dBswHZjVvtry7IUVUSOOEt5tgCffeuXVrUFhCVW27sneB3+I+8hyUEkBn+DaGI
X-Gm-Gg: AYBFou3yq3LC23AXbxVFiCY9JuIaXbJjd34M3cHNRiQuW1WY6D4hnZDWSAO7TY1+oBL
	3EbVTlzr4JSI9qJYfzR0MNhb2LwHEOREI2P2zockeDN/2bGwU1O5vIIVvoIorqCBzZHcmBbfuvM
	PUGF7955Ob4FYqGFO4q3lO3BEx9wa8B2uNEGohtRjDA3XOyt0GlFpLiqS2qQKu3MJOapwIzn/mz
	ulnqkp27WisGH/GR97Sqqyi6Ynq1ag1PJzA9B7pfq+Ftlwwrae1EoEn7aEjgG/VSSeRpbkJozuh
	JrCVHB9hzJzwtc9zdkFqZ9Hl2sKl+G7vodjY8/R0LgChzlSQ93H6a5CkC6nZOX3Em/IoBqrLf4w
	yAm4sGnsV02dsVMuXxlLN
X-Received: by 2002:a05:6512:3a85:b0:5b6:186e:b79d with SMTP id 2adb3069b0e04-5b8c194df51mr4033236e87.57.1790055300381;
        Mon, 21 Sep 2026 22:35:00 -0700 (PDT)
X-Received: by 2002:a05:6512:3a85:b0:5b6:186e:b79d with SMTP id 2adb3069b0e04-5b8c194df51mr4033212e87.57.1790055299969;
        Mon, 21 Sep 2026 22:34:59 -0700 (PDT)
Received: from fedora (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d46e0966sm191742e87.55.2026.09.21.22.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 22:34:58 -0700 (PDT)
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
Subject: [PATCH v14 07/12] mm/hmm: migrate collection in HMM pagewalk - pmd level
Date: Tue, 22 Sep 2026 08:34:16 +0300
Message-ID: <20260922053421.4092027-8-mpenttil@redhat.com>
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

Implement the needed hmm_vma_handle_migrate_prepare_pmd() function
which is mostly carried over from migrate_device.c's
migrate_vma_collect_huge_pmd() function.

With HMM pagewalk based migration, the idea is that
hmm_vma_handle_*() are responsible for faulting,
and the pfn collecting part. hmm_vma_handle_migrate_prepare*()
do the migration decisions (with HMM_PFN_MIGRATE), possibly split
folios, and insert migration ptes/pmds.

HMM pagewalk based migration is enabled in later commit, for now
now hmm_select_migrate() returns 0.

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
 mm/hmm.c | 96 ++++++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 94 insertions(+), 2 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index b3b79d13c797..a1459bd34c04 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -552,8 +552,100 @@ static int hmm_vma_handle_migrate_prepare_pmd(const struct mm_walk *walk,
 					      unsigned long end,
 					      unsigned long *hmm_pfn)
 {
-	// TODO: implement migration entry insertion
-	return 0;
+	struct hmm_vma_walk *hmm_vma_walk = walk->private;
+	struct hmm_range *range = hmm_vma_walk->range;
+	struct migrate_vma *migrate = range->migrate;
+	struct folio *fault_folio = NULL;
+	enum migrate_vma_info minfo;
+	struct folio *folio;
+	unsigned long i;
+	int r = 0;
+
+	// Do we want to migrate at all?
+	minfo = hmm_select_migrate(range);
+	if (!minfo)
+		return r;
+
+	WARN_ON_ONCE(!migrate);
+	HMM_ASSERT_PMD_LOCKED(hmm_vma_walk, true);
+
+	fault_folio = migrate->fault_page ?
+		page_folio(migrate->fault_page) : NULL;
+
+	if (pmd_none(*pmdp))
+		return hmm_pfns_fill(start, end, hmm_vma_walk, 0);
+
+	if (!(hmm_pfn[0] & HMM_PFN_VALID))
+		goto out;
+
+	if (pmd_trans_huge(*pmdp)) {
+		if (!(minfo & MIGRATE_VMA_SELECT_SYSTEM))
+			goto out;
+
+		folio = pmd_folio(*pmdp);
+		if (is_huge_zero_folio(folio))
+			return hmm_pfns_fill(start, end, hmm_vma_walk, 0);
+
+	} else if (!pmd_present(*pmdp)) {
+		const softleaf_t entry = softleaf_from_pmd(*pmdp);
+
+		if (!softleaf_is_device_private(entry))
+			goto out;
+
+		if (!(minfo & MIGRATE_VMA_SELECT_DEVICE_PRIVATE))
+			goto out;
+
+		folio = softleaf_to_folio(entry);
+		if (folio->pgmap->owner != migrate->pgmap_owner)
+			goto out;
+	} else {
+		hmm_vma_walk->last = start;
+		return -EBUSY;
+	}
+
+	folio_get(folio);
+
+	if (folio != fault_folio && unlikely(!folio_trylock(folio))) {
+		folio_put(folio);
+		hmm_pfns_fill(start, end, hmm_vma_walk, HMM_PFN_ERROR);
+		return 0;
+	}
+
+	if (thp_migration_supported() &&
+	    (migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
+	    (IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
+	     IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
+		struct page_vma_mapped_walk pvmw = {
+			.ptl = hmm_vma_walk->ptl,
+			.address = start,
+			.pmd = pmdp,
+			.vma = walk->vma,
+		};
+
+		hmm_pfn[0] |= HMM_PFN_MIGRATE | HMM_PFN_COMPOUND;
+
+		r = set_pmd_migration_entry(&pvmw, folio_page(folio, 0));
+		if (r) {
+			hmm_pfn[0] &= ~(HMM_PFN_MIGRATE | HMM_PFN_COMPOUND);
+			r = -ENOENT;  // fallback
+			goto unlock_out;
+		}
+		for (i = 1, start += PAGE_SIZE; start < end; start += PAGE_SIZE, i++)
+			hmm_pfn[i] &= HMM_PFN_INOUT_FLAGS;
+
+	} else {
+		r = -ENOENT;  // fallback
+		goto unlock_out;
+	}
+
+out:
+	return r;
+
+unlock_out:
+	if (folio != fault_folio)
+		folio_unlock(folio);
+	folio_put(folio);
+	goto out;
 }
 
 /*
-- 
2.55.0

