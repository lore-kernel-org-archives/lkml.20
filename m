Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBC03E025C
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 23:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790895751; cv=none; b=e0KQQclea19baNYGw/wazPbfNosQ4l5D+ulrJ4PSjfB+IN6hNt5g0H37mpEt4rq6QjpIrMYb1gOgln7ZwpXLxZ5oxHxtut3/qJDj7pAzYfl88YSUBmf/VeZRzpcP8g5RGWYNJtLGpmN7RQs3D2kb/rMmViIL/izRuApvuD2rpxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790895751; c=relaxed/simple;
	bh=2hxCyGIIFZrpnqWkOYsvhguw8H2Qg+YNXPdELMwGRDE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ER6xMto0+khx5GxX2StJDbwy4YewUnQ7yW9Ib/663RJv/mPDsHc5E1SfSpzOAm1rhrYlHfbt1ZS/9y4xJ9+7G0ftz/YVY0fGuP+1VIwnUc3bD778wYwht5cMpbk/4n4jrnT3upZzOxmQGdyi5ZtjppqgvZJKLwXamC04ID807mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--praan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T8vWB4Do; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--praan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T8vWB4Do"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc7ce00b8c6so2551550a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 16:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790895748; x=1791500548; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k8F9ZHqeV4+Z5fO5QHVYcnZdLetqeRUwTS9gfMM8Hnc=;
        b=T8vWB4Doh/7fZEBm0tEv6FHkW1enQtIDIqtYU6A7ZgF4a5izlqjO4APHzDLP6r3Kbz
         lm5hsyp7jDZff6RKrp8R42dG4WIhvlNPh0Vm6SB9xRH2eHcvYEcDpNISgDxBsttiC2bo
         A0UGv8F5JUQp8OnKuMem/y15B8XFcEqJT7DvW98yUfPCxq/FpvZTtwQ2jLSN+tWaUCz7
         ZVYDXfpVJbeA0/BLOndWCh+xFqmR+n5v+JFwIJEieiQZKrJ6OQF2X361ZFuEWJPPBpjL
         RXvThPszuJvd88OGgD1RWqW9R1ulDaMFfTB3H5PTXwbHHgGIDDxEWn5Ts0utQPjVBh+0
         V4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790895748; x=1791500548;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k8F9ZHqeV4+Z5fO5QHVYcnZdLetqeRUwTS9gfMM8Hnc=;
        b=tGIYNHLBp4DduDqT5PbUsyZL8ctB3OE9l/IRiq6oUICusWhzVoBh4e3rcNfzN/ae1K
         BJBm96sJ8Zv3OIpXHIzg5vep86qYA+8U+6qjYGhELCzTm1CW6kyPqpua+GrCzdWYFRUs
         SYsRTi96jtxiQbK4crYlTt0h1Yhq1tZ0ULRi9wHNhoMECrXN0ucrcxUjNAQECMmKcdi7
         kQ4/jO7vyXytYIUqnIzBeZ5eKvU4Gu7VbMOUYsMRTeqlxtbQn7R0C3CrimKzdOSNyyJ5
         iTF4/upj98xKw6ACHvgVhod8vZxrft6jwdiGLqVVk9iT3o9Ym13h8VDYDIf5j+7W98Z/
         P25w==
X-Forwarded-Encrypted: i=1; AKwUvByrHsWQAO1PeJ3z97+HfQFxBdl0IHI/sMa1uyCB3Ea92ue0SBJ0W5MNAb+F2JYPDhIXM1pCp0AiuqrBW14=@vger.kernel.org
X-Gm-Message-State: AFuF++nla6sA9W3pfu6HzPd8ig0L870dPDIvYo0ik268V8NpOug7+dbV
	unMITzkTe41A0LGFSLlpT2yx2Jkzct50O/t3bZG27jNhOMqy/95MUOfO50y7AHR4RErYdAepva6
	GUw==
X-Received: from pgdf25.prod.google.com ([2002:a05:6a02:5159:b0:cc7:cc85:4188])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:734c:b0:3d3:adbf:777c
 with SMTP id adf61e73a8af0-3e0bcf0ac46mr763907637.24.1790895748097; Thu, 01
 Oct 2026 16:02:28 -0700 (PDT)
Date: Thu,  1 Oct 2026 23:02:16 +0000
In-Reply-To: <20261001230219.818128-1-praan@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261001230219.818128-1-praan@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001230219.818128-3-praan@google.com>
Subject: [RFC PATCH 2/5] iommupt: Implement refcounting logic for Leaf entries
From: Pranjal Shrivastava <praan@google.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>
Cc: Mostafa Saleh <smostafa@google.com>, Daniel Mentz <danielmentz@google.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Logan Odell <loganodell@google.com>, iommu@lists.linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"

Implement a lockless state machine using the ioptdesc's __page_refcount
field. During an unmap, the driver executes atomic_sub_return() when
clearing a leaf PTE. If the refcount drops to the baseline state (1),
the directory is completely empty and its pointer is stored to the
domain's reclaim_list Xarray.

To protect against a concurrent background Shrinker pruning a directory
while a map thread is actively populating it, the map thread must acquire
a reference using atomic_inc_not_zero() before installing a new leaf.
If the acquisition fails, the page has been marked dead (0) by the
Shrinker. The map thread cleanly returns -EAGAIN, forcing the walker to
loop and re-allocate a fresh directory.

Only non-DMA domains are queued: DMA API unmaps can run in IRQ context
and the reclaim_list lock is not IRQ safe.

Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/generic_pt/iommu_pt.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/iommu/generic_pt/iommu_pt.h b/drivers/iommu/generic_pt/iommu_pt.h
index 07ec2b3ab986..c3d09b746eec 100644
--- a/drivers/iommu/generic_pt/iommu_pt.h
+++ b/drivers/iommu/generic_pt/iommu_pt.h
@@ -621,6 +621,13 @@ static int __map_range_leaf(struct pt_range *range, void *arg,
 			PT_WARN_ON(compute_best_pgsize(&pts, oa) !=
 				   leaf_pgsize_lg2);
 		}
+
+		/* If refcount = 0, shrinker killed the page, retry map */
+		if (!atomic_inc_not_zero(&virt_to_ioptdesc(pts.table)->__page_refcount)) {
+			ret = -EAGAIN;
+			break;
+		}
+
 		pt_install_leaf_entry(&pts, oa, leaf_pgsize_lg2, &map->attrs);
 
 		oa += log2_to_int(leaf_pgsize_lg2);
@@ -754,6 +761,11 @@ static __always_inline int __do_map_single_page(struct pt_range *range,
 	if (pts.level == 0) {
 		if (pts.type != PT_ENTRY_EMPTY)
 			return -EADDRINUSE;
+
+		/* If refcount = 0, shrinker killed the page, retry map */
+		if (!atomic_inc_not_zero(&virt_to_ioptdesc(pts.table)->__page_refcount))
+			return -EAGAIN;
+
 		pt_install_leaf_entry(&pts, map->oa, PAGE_SHIFT,
 				      &map->attrs);
 		/* No flush, not used when incoherent */
@@ -1087,6 +1099,20 @@ static __maybe_unused int __unmap_range(struct pt_range *range, void *arg,
 			 */
 			num_contig_lg2 = pt_entry_num_contig_lg2(&pts);
 			pt_clear_entries(&pts, num_contig_lg2);
+
+			/* Drop refcount and add to reclaim_list for the last ref */
+			/*
+			 * DMA API unmaps can run in IRQ context and the reclaim_list
+			 * lock is not IRQ safe, so only queue for non-DMA domains.
+			 */
+			if (atomic_dec_return(&virt_to_ioptdesc(pts.table)->__page_refcount) == 1 &&
+			    !iommu_is_dma_domain(&iommu_from_common(range->common)->domain)) {
+				struct pt_iommu *iommu = iommu_from_common(range->common);
+
+				xa_store(&iommu->domain.reclaim_list, range->va,
+					 virt_to_ioptdesc(pts.table), GFP_ATOMIC);
+			}
+
 			gather_add_leaf(&unmap->pending, &pts);
 			num_oas += log2_to_int(num_contig_lg2);
 			if (pts.index < flush_start_index)
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

