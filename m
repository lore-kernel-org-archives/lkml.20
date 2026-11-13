Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559182;
	b=MTy++B4rWgCBFSPWYtxLWMbguPMEMUWyY7y0vfGk110jX9Ho4ZAg0Qjtm7kw5qF6jpld
	 VeXfPhbWbk6bSsh/UEzo0x3/EIbQ1EhUB2c1qaacGzTU4GAGCUbPZx6NCQ/ADFUca7t++
	 oDytdO6lCydU9XNQ6GSoL5jqe5Y3HCTvpm2q8UwOm+HeqvD/205++F+ekdKS53lTB8evb
	 mDQhhJososMIFroo/vb4GccnDjxdiRpSupNDfgqvdK7hA4OX1uX34Wp06vlq+aj+jY/eq
	 U7O11MHsVAWd+pN2Q+F2rWYJNPspH8WAtmjJJZ74xn3HRfqTm24Bixcc8L9du03PSMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ekfFZRepZnQ1N1ZhqbxE6PlLs8pwZY5pduEDrnrEgbc=;
	b=wbHDcflgXGC+VAPcUMFH1/tzgR661kPCeSmm4+ForgcgN4H5RJI0u2siLTjQJp/OnbFg
	 PeR5IFPKop5dz3CRIW67Q8gA4n9IcgSM+ImfaZLOmAYW6ce5HFgyGwY7CuPNUeigDj/jF
	 89fbkiPGDR1O0Rh9vrVCtnfuzU3Smm6i68ONlkTvG7VdRTD/hA+F7XhJNf5T6pN9Hl4Hk
	 FOSPGJqU9PDe9X6DPar720sSxG906E13ggGX8sKt+P2skGvzwX9qjRxR9Dd/76231ZodF
	 csoPbkbVnqiwMpRCSKUYgVf/hezRlp4gxeWMhuPENDv0Z4kBmvLUeAznCCuCYIbeMkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KRgbQHHC;
	arc=none smtp.remote-ip=74.125.227.135
Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAC4606B1CA
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EAC4606B1CA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KRgbQHHC
Received: by mail-pj2-f7.google.com with SMTP id d9443c01a7336-2ed0ee6a700so3471305ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794559182; x=1795163982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ekfFZRepZnQ1N1ZhqbxE6PlLs8pwZY5pduEDrnrEgbc=;
        b=KRgbQHHCQJL9A7Ww7Y9mqmehipOUF03s03WxVM+RhnKNeY1FqWpVeBO2NVXMlxOH8U
         V0kZuvSBZn+SKvaTdu0/DEpCvJIh+SBeiDd+VH7FVQsHNwpU4/m2V07AfiTXzVHza6Od
         HwS26MJI+xEWkGyfoFVdaznQqTDnnxfvKOJLB9aCR9e2NrX5rCquoP//pXWNfWXCOeLL
         QmAgPyVjDk0mEDp2bGoItnzskuZuFlH+G3h8l9+RhDp605Cn8beM5apbOAv/Bm+/nW8C
         Cttelho40WBWbAalaTPS8qxvPxhvtr3na1ua3seB4klIXq+D2xpcHyHKa+LvwxmcwlkG
         5+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559182; x=1795163982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ekfFZRepZnQ1N1ZhqbxE6PlLs8pwZY5pduEDrnrEgbc=;
        b=0PTXFWdHqfgLQuM6Phyi2AtkTV4DwaZSoDQhkdkvk7GOw3f16WATuL/txZPu4fATW1
         WOzvwlPs1tvTt+RcTJCQoKZRRBEGj2VRxJHlFnWy1QclJ8cF0v877cEudXhfN3HJfqUo
         BoDWjxt9ymVIzjuCvLRBa6vBMCGskF/XCFwAACH/DLaDAYqptHVuYRm49diFSJIDQVn0
         RgMFL7AbSRGVP6XyFwuECN6Xl7l48CLJxJH9LgxOac4p8UMV+/2VCvDJJ41mGXOX9m4Z
         EmNqmorjBQo2D81A/KCEcmWkm2G4MCF8lbk0nr/eM/vH/9Q6/1w/qUVc3QyeyDdNp2So
         gKXA==
X-Forwarded-Encrypted: i=1; AL+hErEUBrrFhtwm1y8rdh5Aqqf/Uxm4GU9cp6FLWR0y2tMzzRrzCS1KI2HW7ZTnNx2j9o+EuJOK3jaDTbwBe0g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+V/1WORxr4slHXgjOWKywM/XqHkPfgbQ+7AEUsYqewg9FU25gZ
	KxRRKaGDXeT/0HUjGhUrvc6d9alRj3Z4ilnpR0PhfWZlIbIWUSd4YByo1lAlrcrIvcQy8TfQ
X-Gm-Gg: AYBFou1a7Ya+rltrE41yeDftGJRaFsU2qp8Gtemx9n4QsiYkI8XQx7CzaBJOshfH/2j
	IecQW9lt652M3AtbY173bgGOPSOjxQd+C/AEJQHfuvTps49vM1t/bD5kYWtjfqarCUkkdrbzAch
	08LHvByxLGWCUH57YbpUdvRmWZVULqL2YIAbHpBBuK2eVqzVbp89t0EHJEzIB+ad+ngDhgBdfHN
	VUcdgxn1esi+7cI/7AeXy7VgqMj+RQDXbPEajnrLWPkigwKa9P++flTsQEnvxJQ/u9mI8dPf+Ki
	bz2aZ1YVpdi+II4tCSJJOk+7rruG1Z/3Oz0qvwctufrkQ4Vgexjx/QMpb8gmR0XVcjaIiM145+O
	XJCO0nebQK2H0OCT3zqN+GiYzfTTeKjzSL1zjfplYHy6Hj6Bp/8Og4rSvirADC2caKNH5yJxZKe
	Z/eLG6rHv3QxhTcxj7VoZCG7sjVeVVOfCunIGzSyaOTJNUXojtpVVBfFHHP92wB+zNGXQ5REf9+
	gj/LnCbV7YVq5T2jn0ilR2gJRj7bHnGVHuGxdVLBLjHFTXJSdqegh3hN/u0+HPICMLou+nZeJQT
	oQgcww6vO7dmTEWooaA5ScLNkozWDl8H+gfaawa90A==
X-Received: by 2002:a17:903:3c28:b0:2ed:18cc:d3a4 with SMTP id d9443c01a7336-2ee0dc38effmr16914615ad.46.1794559181651;
        Fri, 13 Nov 2026 00:39:41 -0800 (PST)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75dde9sm6809525ad.22.2026.11.13.00.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:39:37 -0800 (PST)
From: Wandun Chen <chenwandun1@gmail.com>
To: david@kernel.org,
	kas@kernel.org,
	hughd@google.com,
	akpm@linux-foundation.org
Cc: ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] mm/migrate: improve mlock tracking for PTE-mapped large folios
Date: Fri, 13 Nov 2026 16:39:27 +0800
Message-ID: <20261113083927.2727599-1-chenwandun1@gmail.com>
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

From: Wandun Chen <chenwandun@lixiang.com>

Commit ab521b4142aa ("mm/rmap: improve mlock tracking for large folios")
mlocks a large folio when all its pages are added in one rmap operation.
However, when a PTE-mapped large folio is migrated, remove_migration_pte()
restores PTEs individually, passing nr_pages = 1 to the rmap helpers. As a
result, PG_mlocked is not set on the destination folio.

Reclaim can restore mlock in try_to_unmap(), but Mlocked in /proc/meminfo
remains undercounted until that scan occurs.

Restore mlock once the full mapping has been restored in a locked VMA
under one page table lock, rather than waiting for try_to_unmap() to
restore the mlock state.

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>

---
v2 -> v3:
1. Rename nr_ptes to ptes.
2. Collect Reviewed-by tag.
---
 mm/migrate.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 94033c222e04..3c39d309e6bd 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -353,6 +353,7 @@ static bool remove_migration_pte(struct folio *folio,
 {
 	struct rmap_walk_arg *rmap_walk_arg = arg;
 	DEFINE_FOLIO_VMA_WALK(pvmw, rmap_walk_arg->folio, vma, addr, PVMW_SYNC | PVMW_MIGRATION);
+	unsigned long ptes = 0;
 
 	while (page_vma_mapped_walk(&pvmw)) {
 		rmap_t rmap_flags = RMAP_NONE;
@@ -446,9 +447,16 @@ static bool remove_migration_pte(struct folio *folio,
 			else
 				folio_add_file_rmap_pte(folio, new, vma);
 			set_pte_at(vma->vm_mm, pvmw.address, pvmw.pte, pte);
+
+			ptes++;
 		}
-		if (READ_ONCE(vma->vm_flags) & VM_LOCKED)
+		if (READ_ONCE(vma->vm_flags) & VM_LOCKED) {
+			if (folio_test_large(folio) &&
+			    ptes == folio_nr_pages(folio) &&
+			    !(pvmw.flags & PVMW_PGTABLE_CROSSED))
+				mlock_vma_folio(folio, vma);
 			mlock_drain_local();
+		}
 
 		trace_remove_migration_pte(pvmw.address, pte_val(pte),
 					   compound_order(new));
-- 
2.43.0

