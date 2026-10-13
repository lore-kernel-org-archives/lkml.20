Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7DF51FCBC
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791910816; cv=none; b=tFsRl+mnnF6MvA1bfILxTUBRjuIgUP7TW+iAM6hEsmViyE5scVWnljYBGVFlx9a4b5VPwccn+H6dPKvaJe92Jj41/BNCq90QKugATpy1qe2qxR/ADGH4dQ0LQ+1uYYZb4QGmr7vZkeh3IOOGT5HPnr9Kq62KMRdR3ZlgfXdLOaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791910816; c=relaxed/simple;
	bh=s6xm5xGCBjDdmzPSVyNR3aQ8ZEGeMfYGDHFgVN1bRvs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=keLTUGuuPw6Zg/gfF/7V5mjEvp4ukYongz3Ezei5VXHoZ3lC96TdQsbXlL3lWUmG3fphPPOXO2ScYgZglbYlZxB2ArPcQZjrMDnOSpJBw7LEBOxjSMsp+e1SQRyj70HK+Hg7+XKwA1/MJZ7P/h3t1oW7xY+1zUuXe0d1QL2PqUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QsaloKXl; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QsaloKXl"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4f9b643b13aso2707724b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791910814; x=1792515614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bwxVaq2ksRwIQCdDWrzJYHR4z+d7pSrUOkNdZaCLjGQ=;
        b=QsaloKXlobidaf5O9YM6zCDdKnLqdrYNtbhITPbjkACAOvUVnf5bu2E8E3gHJ+ehUc
         GNRCjZ6dKOygjHNP6VvuWut1733ajd4ZyEp6uxpFqiJ48gipHBsBH9Yfa+su3I416bGX
         TWBm7p7qX3JlGgSmymkZ9Xi7L1Olz82DYgEu6one2pEU1V5PbytRRU4KzFUu0HuoxaVj
         E0gNSCgoBZidmZQSxbpvwA+kYxKWL/g8/RRyiuE3v7Lck1QJFjrT4MToOPg2Ow4pLg8E
         6UK3GEDSdc82jFhd9qTZOisibjdMet60tMaqGd9vLJ5qf4IjCGaInQjjpdYW69LR59H1
         bJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791910814; x=1792515614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bwxVaq2ksRwIQCdDWrzJYHR4z+d7pSrUOkNdZaCLjGQ=;
        b=q+cHzZmTevCfUslaojqFa5XO+Gk7XS1UrANAoKuOdisKSHnPiZakD9bMU8n3uRQ1Oc
         06W9m6Xf8sfATsdPjKABlSQW5seCF2N5bAVSY6Acj0xgTptkkyXDL7Ml8ctwtu3neI9Y
         YZ2r5lCvTJ4YXFsYMIUiSXoCxCLj+huqNWd4XI1BoUDEdM4zn3BUvu1umHs/jB/XEjd1
         4YAuaZ+3XzLQwBrXN4/AFs/WkjOE7YQMXMCeXS24s2tuci+YiT6s5XwRvRnrP6HGbHSd
         TXdIUu1BF1RwegWxQmAJbMF1sGo0oqfhxnlra+8+fCxGqWSVV3L1h38NjvM6BBBjF048
         ZdOA==
X-Forwarded-Encrypted: i=1; AKwUvBxSUH6T6bzSug5+x8/lJjLC25Tsca3If4qZMgSrmNg0gXVKoL9vnb9bJ+qYOtY9Nt2LShTWJQtKcEIUmEg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1jWs106c4nQKwFpewvRkgpVlubmB9g7DZjgWuo9qeyx2SB0ad
	9MKlMX3kc0sm+7T0Oniiye+XH04/jjr864s/Q62S/1aSXz4LIW5tNEgc
X-Gm-Gg: AYBFou2Dz/Hz3NO2PGHFVauPR/8/KhzkDVrQFROei7FWqZynH2pvLvKgQ4Pn8zQ3IPv
	EtnlwdIbZoHicTTBlBNuQY1QWlryb5nfOB/31A2omGRijwAqk1v3WZ6+K6thb9WWyAu+9IgzglK
	Br/RD/DeCeGjEqE4VTYfl2fz13532F1VDKWAZTG2NMRSl+EVzSt9YKCO/cbiGcp4Ytgdux2G1I2
	abxpxUDfUtk/oyqmGdR/nRD4W63UflsDh82KTG2p8OkK4awM/dOlkMYHHDKWi6PdJGoykQ2CREC
	35v/oMYJSaFh9sHpCbHaPpEBto2YC7Wz1a7+/v1zKmgy9I7cbhlPk7iU1C9a1DRYMR144gjwpN/
	TmMERFiHD1UeAGO4X+bacmh033CyaO/gKixFn7ngbGC0JYYUj3Un24WsvtRMyNDkcBHZylwycXm
	zY/5Wz93K9NkM15iimzyq2NkpTufshAN87T0hmNWOUlukPjJfLANKUi1oUjottLjDxv4GuYsVON
	XLnURtZDnrCnO7KkfLd3Au6/lTeBOZLa2Mnw9Qn6+Rciac1lTlchHTNGvfM8yCuNgE=
X-Received: by 2002:a05:6808:130f:b0:4c1:5614:acab with SMTP id 5614622812f47-50c532f8aa4mr11754186b6e.37.1791910813978;
        Tue, 13 Oct 2026 10:00:13 -0700 (PDT)
Received: from 1u1g-b650-0212.nvidia.com ([72.25.70.131])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-50c0c5fe916sm15298147b6e.1.2026.10.13.10.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:00:13 -0700 (PDT)
From: samarth.colleges@gmail.com
To: Jason Gunthorpe <jgg@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH] iommupt: report the whole contiguous group in read_and_clear_dirty
Date: Tue, 13 Oct 2026 09:58:14 -0700
Message-ID: <20261013165814.3092559-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Samarth Narang <samarth.colleges@gmail.com>

The record_dirty() function computes the reported dirty length of a contiguous
(multi-item) leaf group as:

	end_index = log2_set_mod_max_t(unsigned int, pts->index, num_contig_lg2);
	end_index = min(end_index, pts->end_index);
	dirty_len = (end_index - index) * log2_to_int(pt_table_item_lg2sz(pts));

Here, log2_set_mod_max_t() sets the low num_contig_lg2 bits of the index to all
ones, i.e. it returns the *inclusive* last index of the contiguous group.
However, pts->end_index is an *exclusive* bound, this can be seen from the
definition of pt_range_to_end_index() which returns of the form "index + 1".
Also, the iterator stops on index >= end_index. Therefore, subtracting an
inclusive end from an exclusive bound will yield one less item than the actual
length of the contiguous group.

For IOMMU dirty tracking used by VFIO/iommufd live migration this silently
drops the last page of a contiguous dirty mapping from the migration
bitmap.

This patch makes end_index exclusive to match pts->end_index and the span cleared by
pt_entry_make_write_clean(). Also, the same length is passed to
iommu_iotlb_gather_add_range() so this fix would correct that as well.

Fixes: 4a00f9434891 ("iommupt: Add read_and_clear_dirty op")
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
 drivers/iommu/generic_pt/iommu_pt.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/generic_pt/iommu_pt.h b/drivers/iommu/generic_pt/iommu_pt.h
--- a/drivers/iommu/generic_pt/iommu_pt.h
+++ b/drivers/iommu/generic_pt/iommu_pt.h
@@ -248,7 +248,7 @@ static void record_dirty(struct pt_state *pts,
 	if (num_contig_lg2 != ilog2(1)) {
 		unsigned int index = pts->index;
 		unsigned int end_index = log2_set_mod_max_t(
-			unsigned int, pts->index, num_contig_lg2);
+			unsigned int, pts->index, num_contig_lg2) + 1;
 
 		/* Adjust for being contained inside a contiguous page */
 		end_index = min(end_index, pts->end_index);

