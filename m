Received: from mail-oa1-f98.google.com (mail-oa1-f98.google.com [209.85.160.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97865390609
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791922091; cv=none; b=WLHvkm7t1LjkF577T9L5aLo0PUq1O8hbWojD+Gf1iMx7CguSvJVL1JQ7G1m7y5FLHsa+hrTYdAWj6xnbd8qQ7/gRsoQjm5EDG36ga0i1co6ehEiePw35VYgKDxPzrtu588FKqU/cGjPi3k6zVNdUjkVQPL0onZsEV9KfFGNbNtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791922091; c=relaxed/simple;
	bh=lpjZhT6XXWw6XX138SjuWWgMvV1BnmW4k7hdFt8UpY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uwYdDLxpf85XW5HpYBNsCTo8VXKo3X1rCiLyg352UW5lYdU+vLeUUIKkiiu4GaB3uFUqc/x2FmsPeitCwuarVw5d1dRBsb+eEYi+awPISkycMsyKKd7uYdW9sLRHF1WqqFryAuUmEM5RhJUZZVSpcLGosvTEwvqnboNgocK8IL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=OFLrgXD8; arc=none smtp.client-ip=209.85.160.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="OFLrgXD8"
Received: by mail-oa1-f98.google.com with SMTP id 586e51a60fabf-4a69499cefaso1195184fac.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791922087; x=1792526887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3hPRXO6sFueqWIi4s/FdTD+h3BsbEISg9BIgMP6UGWc=;
        b=e39S49GK8ibp73GX84Eoh6r7tDWsK8ur5MJON1lubC7l0kB2jFfL0sAUSm9m/9C6Yx
         Me22WG7hTCj4y3k/I8geYeXXbNCeeuxman7k9aJTyDJRxHoW0D6S3qjAI6IJj2pNrCua
         iO2SJNmy2lVKfw1n26xR7qZOAfi75sFhSGT0sap39HjGkYMO4M7Z9Lw/8sr0v0ffoDI+
         aqhiU72QYI7mBi3g4ds3PkBlNre4QGlkWN/VFj8I9r4cfusQUsl2ag5+T3DnnW7poSvN
         wgozCUexMcN6UEmIHYh4unPtbTgTBnGj/EfJy72yvzwET7F51p4UFXH6w9vieaEWCg/B
         LwHA==
X-Forwarded-Encrypted: i=1; AKwUvBw1yu9TEqXOWjH/hJALWBNoLBIuMUloH0/VXTe9fAzChWotjT5Zck2gIcwRoqE2EufFKB8jdQTyCzQUfYA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwZ2plgChks7ovsHyUKm4kweBUCRdLBji38PxA5ktTgvBSwlNE
	MOkKI79AEOhd2yh2VjorQxmbtjYS9Ne5iYm0dw1GsrMD57LyCyaDk5Tt4wXO4ZNOSzlACURkSKh
	pnJbKIFwSyJFWAZx8hWYeKF5VTjIl5LBS/aEgqzw5BOKe2FzmQZwXdT2XIquScXngFkHVJYay7F
	YFhsr7mvarspNUwNZoZd3KshUBjcnrsqoLsFK99rqIc7sT6hLZKsgFStxhKDCplVID/5lfZ8H8C
	WxUX3Zq2+dJbgXFEEDe5uQHFHHo9mc=
X-Gm-Gg: AYBFou3Bl6TQptk000R3fYd64ymk+YWou22EFi9KrEpdgwx8Byt/Ue2HetfPhOje1ET
	lDztWrr2oAgqwFdBmdy6WVcmsHUpL7SJHe+IfP28kBrsJwsPNg8M/C4jZHbVXUe25by1t9EbbK2
	ZuE0A6cZ1wXcWt7U5DvJgA+BgEm9wk82dgZ0Iw1tkc2QCHSCPENDgU2z/KafgjFUKv84SZFR18D
	xZpkYJH+IHI7lXraF+AtMJWnqFlfPvTfzp3/e1/P2uAd7dzIzQBL11IQkHU3E6Jk+zIfC5CrwDB
	5rxSE0d1PO6r6i75eM7omdJFS3Qy9RRNkimmaTGhfWxLjoABU5iN0sz0MSTtOGQrV8dYr0HqMeN
	BD3Q8aZOTBpNMHbq+0BFMPJLf5LHsRtTE4LJDEElQbOUjiKAVD4ZO7QaR9qZtBoR1TqUAK4ogJ+
	2ngfww3bc8GN3UN+BuBsOezduS+Pr5rXeZiNcTUDNpUY3n
X-Received: by 2002:a05:6870:248c:b0:49e:241:600e with SMTP id 586e51a60fabf-4a2a4b4676amr10074470fac.36.1791922087037;
        Tue, 13 Oct 2026 13:08:07 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-4a6dfbbb573sm23804fac.5.2026.10.13.13.08.06
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Oct 2026 13:08:07 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-14364a88479so149120c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791922085; x=1792526885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3hPRXO6sFueqWIi4s/FdTD+h3BsbEISg9BIgMP6UGWc=;
        b=OFLrgXD8NFLCwhX+2hhCUs1WVkVQMPd/igrBmkZgEfTJkMEyH6+abisl6wMbvBXZIa
         +z7a6YZB7nAYqP61pxpeAwFrGPq5iaG55qAtk1eDEdlSoRBPj/nRD1sd44040yFe4DWU
         GJxqNoBYgDe7S+tgJHVoyU0MzrCstu8bsdUzA=
X-Forwarded-Encrypted: i=1; AKwUvBy+G+eVvVMdTVLBar8bBfH6y7ZHwSNoCBKogwSxcXZt+7vMfBdhwYrP1kfeM+yXDMCESXbamlyFfOLv24U=@vger.kernel.org
X-Received: by 2002:a05:701b:4284:10b0:146:84fd:7b58 with SMTP id a92af1059eb24-16a10f2a74fmr18600553c88.9.1791922084924;
        Tue, 13 Oct 2026 13:08:04 -0700 (PDT)
X-Received: by 2002:a05:701b:4284:10b0:146:84fd:7b58 with SMTP id a92af1059eb24-16a10f2a74fmr18600506c88.9.1791922083973;
        Tue, 13 Oct 2026 13:08:03 -0700 (PDT)
Received: from localhost.localdomain ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6f5csm39526585c88.11.2026.10.13.13.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:08:03 -0700 (PDT)
From: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	vikas.gupta@broadcom.com,
	Bhargava Marreddy <bhargava.marreddy@broadcom.com>,
	Dharmender Garg <dharmender.garg@broadcom.com>,
	Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>,
	Ramakrishna Koduri <ramakrishna.koduri@broadcom.com>
Subject: [PATCH net-next v3 1/5] bnge: factor out per-NQ alloc/free helpers
Date: Wed, 14 Oct 2026 01:36:41 +0530
Message-ID: <20261013200645.1346299-2-bhargava.marreddy@broadcom.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013200645.1346299-1-bhargava.marreddy@broadcom.com>
References: <20261013200645.1346299-1-bhargava.marreddy@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The descriptor array, ring memory, firmware ring and IRQ of an NQ are
allocated and released inside loops over all NQs, and the NQ ring memory
is set up with the completion rings.

Factor the per-NQ parts out into bnge_alloc_nq()/bnge_free_nq(),
bnge_hwrm_nq_alloc()/bnge_hwrm_nq_free() and
bnge_nq_request_irq()/bnge_nq_free_irq() so a single NQ can be created
and destroyed independently of the others. Rename
bnge_{alloc,free}_nq_arrays() to bnge_{alloc,free}_nqs().

The NQ ring_mem setup, ring allocation and fw_ring_id initialization
move into bnge_alloc_nq(), so the NQ ring memory is allocated with the
NQ descriptor arrays rather than with the completion rings. The
fw_ring_id initialization thus moves from bnge_init_nic(), which runs
on every open, to bnge_alloc_core(), which also runs on every open.
The IRQ map index is also set there; the value is unchanged. The
affinity hint is now derived from bnapi->index, which equals the loop
index used before. The error path of bnge_alloc_nqs() now unwinds only
the NQs allocated so far.

Also rename bnge_{alloc,free,init}_nq_tree() to
bnge_{alloc,free,init}_cp_rings(), since they no longer touch the NQ
itself, only the completion rings hanging off it.

One behavioral difference: bnge_hwrm_ring_free() now resets
grp_info[i].nq_fw_ring_id to INVALID_HW_RING_ID for every NQ, not only
for the NQs that had a valid firmware ring ID. Otherwise there is no
functional change.

Signed-off-by: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
Reviewed-by: Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>
Reviewed-by: Ramakrishna Koduri <ramakrishna.koduri@broadcom.com>
---
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  | 284 ++++++++++--------
 .../net/ethernet/broadcom/bnge/bnge_rmem.c    |  10 -
 2 files changed, 163 insertions(+), 131 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index 25f844e6f6d3..8cd0d8bd68c2 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -503,61 +503,89 @@ static int bnge_alloc_cp_desc_arr(struct bnge_cp_ring_info *cpr, int n)
 	return -ENOMEM;
 }
 
-static void bnge_free_nq_arrays(struct bnge_net *bn)
+static void bnge_free_nq(struct bnge_net *bn, struct bnge_napi *bnapi)
 {
-	struct bnge_dev *bd = bn->bd;
-	int i;
+	struct bnge_nq_ring_info *nqr = &bnapi->nq_ring;
 
-	for (i = 0; i < bd->nq_nr_rings; i++) {
-		struct bnge_napi *bnapi = bn->bnapi[i];
+	bnge_free_ring(bn->bd, &nqr->ring_struct.ring_mem);
+	bnge_free_nq_desc_arr(nqr);
+}
+
+static int bnge_alloc_nq(struct bnge_net *bn, struct bnge_napi *bnapi)
+{
+	struct bnge_nq_ring_info *nqr = &bnapi->nq_ring;
+	struct bnge_ring_mem_info *rmem;
+	struct bnge_ring_struct *ring;
+	int rc;
+
+	ring = &nqr->ring_struct;
+	rmem = &ring->ring_mem;
 
-		bnge_free_nq_desc_arr(&bnapi->nq_ring);
+	rc = bnge_alloc_nq_desc_arr(nqr, bn->cp_nr_pages);
+	if (rc)
+		return rc;
+
+	nqr->bnapi = bnapi;
+	rmem->nr_pages = bn->cp_nr_pages;
+	rmem->page_size = HW_CMPD_RING_SIZE;
+	rmem->pg_arr = (void **)nqr->desc_ring;
+	rmem->dma_arr = nqr->desc_mapping;
+	rmem->vmem_size = 0;
+	rmem->flags = BNGE_RMEM_RING_PTE_FLAG;
+	rc = bnge_alloc_ring(bn->bd, rmem);
+	if (rc) {
+		bnge_free_nq_desc_arr(nqr);
+		return rc;
 	}
+
+	ring->fw_ring_id = INVALID_HW_RING_ID_32BIT;
+	ring->map_idx = bnge_aux_get_msix(bn->bd) + bnapi->index;
+	return 0;
 }
 
-static int bnge_alloc_nq_arrays(struct bnge_net *bn)
+static void bnge_free_nqs(struct bnge_net *bn)
+{
+	struct bnge_dev *bd = bn->bd;
+	int i;
+
+	for (i = 0; i < bd->nq_nr_rings; i++)
+		bnge_free_nq(bn, bn->bnapi[i]);
+}
+
+static int bnge_alloc_nqs(struct bnge_net *bn)
 {
 	struct bnge_dev *bd = bn->bd;
 	int i, rc;
 
 	for (i = 0; i < bd->nq_nr_rings; i++) {
-		struct bnge_napi *bnapi = bn->bnapi[i];
-
-		rc = bnge_alloc_nq_desc_arr(&bnapi->nq_ring, bn->cp_nr_pages);
+		rc = bnge_alloc_nq(bn, bn->bnapi[i]);
 		if (rc)
-			goto err_free_nq_arrays;
+			goto err_free_nqs;
 	}
 	return 0;
 
-err_free_nq_arrays:
-	bnge_free_nq_arrays(bn);
+err_free_nqs:
+	while (--i >= 0)
+		bnge_free_nq(bn, bn->bnapi[i]);
 	return rc;
 }
 
-static void bnge_free_nq_tree(struct bnge_net *bn)
+static void bnge_free_cp_rings(struct bnge_net *bn)
 {
 	struct bnge_dev *bd = bn->bd;
 	int i;
 
 	for (i = 0; i < bd->nq_nr_rings; i++) {
-		struct bnge_napi *bnapi = bn->bnapi[i];
-		struct bnge_nq_ring_info *nqr;
-		struct bnge_ring_struct *ring;
+		struct bnge_nq_ring_info *nqr = &bn->bnapi[i]->nq_ring;
 		int j;
 
-		nqr = &bnapi->nq_ring;
-		ring = &nqr->ring_struct;
-
-		bnge_free_ring(bd, &ring->ring_mem);
-
 		if (!nqr->cp_ring_arr)
 			continue;
 
 		for (j = 0; j < nqr->cp_ring_count; j++) {
 			struct bnge_cp_ring_info *cpr = &nqr->cp_ring_arr[j];
 
-			ring = &cpr->ring_struct;
-			bnge_free_ring(bd, &ring->ring_mem);
+			bnge_free_ring(bd, &cpr->ring_struct.ring_mem);
 			bnge_free_cp_desc_arr(cpr);
 		}
 		kfree(nqr->cp_ring_arr);
@@ -594,31 +622,21 @@ static int alloc_one_cp_ring(struct bnge_net *bn,
 	return rc;
 }
 
-static int bnge_alloc_nq_tree(struct bnge_net *bn)
+static int bnge_alloc_cp_rings(struct bnge_net *bn)
 {
 	struct bnge_dev *bd = bn->bd;
-	int i, j, ulp_msix, rc;
+	int i, j, rc;
 	int tcs = 1;
 
-	ulp_msix = bnge_aux_get_msix(bd);
 	for (i = 0, j = 0; i < bd->nq_nr_rings; i++) {
 		bool sh = !!(bd->flags & BNGE_EN_SHARED_CHNL);
 		struct bnge_napi *bnapi = bn->bnapi[i];
 		struct bnge_nq_ring_info *nqr;
 		struct bnge_cp_ring_info *cpr;
-		struct bnge_ring_struct *ring;
 		int cp_count = 0, k;
 		int rx = 0, tx = 0;
 
 		nqr = &bnapi->nq_ring;
-		nqr->bnapi = bnapi;
-		ring = &nqr->ring_struct;
-
-		rc = bnge_alloc_ring(bd, &ring->ring_mem);
-		if (rc)
-			goto err_free_nq_tree;
-
-		ring->map_idx = ulp_msix + i;
 
 		if (i < bd->rx_nr_rings) {
 			cp_count++;
@@ -634,7 +652,7 @@ static int bnge_alloc_nq_tree(struct bnge_net *bn)
 		nqr->cp_ring_arr = kzalloc_objs(*cpr, cp_count);
 		if (!nqr->cp_ring_arr) {
 			rc = -ENOMEM;
-			goto err_free_nq_tree;
+			goto err_free_cp_rings;
 		}
 
 		nqr->cp_ring_count = cp_count;
@@ -643,7 +661,7 @@ static int bnge_alloc_nq_tree(struct bnge_net *bn)
 			cpr = &nqr->cp_ring_arr[k];
 			rc = alloc_one_cp_ring(bn, cpr);
 			if (rc)
-				goto err_free_nq_tree;
+				goto err_free_cp_rings;
 
 			cpr->bnapi = bnapi;
 			cpr->cp_idx = k;
@@ -663,8 +681,8 @@ static int bnge_alloc_nq_tree(struct bnge_net *bn)
 	}
 	return 0;
 
-err_free_nq_tree:
-	bnge_free_nq_tree(bn);
+err_free_cp_rings:
+	bnge_free_cp_rings(bn);
 	return rc;
 }
 
@@ -1200,8 +1218,8 @@ static void bnge_free_core(struct bnge_net *bn)
 	bnge_free_vnic_attributes(bn);
 	bnge_free_tx_rings(bn);
 	bnge_free_rx_rings(bn);
-	bnge_free_nq_tree(bn);
-	bnge_free_nq_arrays(bn);
+	bnge_free_cp_rings(bn);
+	bnge_free_nqs(bn);
 	bnge_free_ring_stats(bn);
 	bnge_free_ring_grps(bn);
 	bnge_free_vnics(bn);
@@ -1232,13 +1250,9 @@ static int bnge_alloc_core(struct bnge_net *bn)
 	bn->bnapi = bnapi;
 	bnapi += arr_size;
 	for (i = 0; i < bd->nq_nr_rings; i++, bnapi += size) {
-		struct bnge_nq_ring_info *nqr;
-
 		bn->bnapi[i] = bnapi;
 		bn->bnapi[i]->index = i;
 		bn->bnapi[i]->bn = bn;
-		nqr = &bn->bnapi[i]->nq_ring;
-		nqr->ring_struct.ring_mem.flags = BNGE_RMEM_RING_PTE_FLAG;
 	}
 
 	bn->rx_ring = kzalloc_objs(struct bnge_rx_ring_info, bd->rx_nr_rings);
@@ -1297,7 +1311,7 @@ static int bnge_alloc_core(struct bnge_net *bn)
 	if (rc)
 		goto err_free_ring_stats;
 
-	rc = bnge_alloc_nq_arrays(bn);
+	rc = bnge_alloc_nqs(bn);
 	if (rc)
 		goto err_free_vnics;
 
@@ -1305,13 +1319,13 @@ static int bnge_alloc_core(struct bnge_net *bn)
 
 	rc = bnge_alloc_rx_rings(bn);
 	if (rc)
-		goto err_free_nq_arrays;
+		goto err_free_nqs;
 
 	rc = bnge_alloc_tx_rings(bn);
 	if (rc)
 		goto err_free_rx_rings;
 
-	rc = bnge_alloc_nq_tree(bn);
+	rc = bnge_alloc_cp_rings(bn);
 	if (rc)
 		goto err_free_tx_rings;
 
@@ -1320,17 +1334,17 @@ static int bnge_alloc_core(struct bnge_net *bn)
 						  BNGE_VNIC_UCAST_FLAG;
 	rc = bnge_alloc_vnic_attributes(bn);
 	if (rc)
-		goto err_free_nq_tree;
+		goto err_free_cp_rings;
 	return 0;
 
-err_free_nq_tree:
-	bnge_free_nq_tree(bn);
+err_free_cp_rings:
+	bnge_free_cp_rings(bn);
 err_free_tx_rings:
 	bnge_free_tx_rings(bn);
 err_free_rx_rings:
 	bnge_free_rx_rings(bn);
-err_free_nq_arrays:
-	bnge_free_nq_arrays(bn);
+err_free_nqs:
+	bnge_free_nqs(bn);
 err_free_vnics:
 	bnge_free_vnics(bn);
 err_free_ring_stats:
@@ -1389,21 +1403,18 @@ static int bnge_cp_num_to_irq_num(struct bnge_net *bn, int n)
 	return nqr->ring_struct.map_idx;
 }
 
-static void bnge_init_nq_tree(struct bnge_net *bn)
+static void bnge_init_cp_rings(struct bnge_net *bn)
 {
 	struct bnge_dev *bd = bn->bd;
 	int i, j;
 
 	for (i = 0; i < bd->nq_nr_rings; i++) {
 		struct bnge_nq_ring_info *nqr = &bn->bnapi[i]->nq_ring;
-		struct bnge_ring_struct *ring = &nqr->ring_struct;
 
-		ring->fw_ring_id = INVALID_HW_RING_ID_32BIT;
 		for (j = 0; j < nqr->cp_ring_count; j++) {
 			struct bnge_cp_ring_info *cpr = &nqr->cp_ring_arr[j];
 
-			ring = &cpr->ring_struct;
-			ring->fw_ring_id = INVALID_HW_RING_ID_32BIT;
+			cpr->ring_struct.fw_ring_id = INVALID_HW_RING_ID_32BIT;
 		}
 	}
 }
@@ -1914,6 +1925,44 @@ static int bnge_hwrm_rx_ring_alloc(struct bnge_net *bn,
 	return 0;
 }
 
+static int bnge_hwrm_nq_alloc(struct bnge_net *bn, struct bnge_napi *bnapi)
+{
+	struct bnge_nq_ring_info *nqr = &bnapi->nq_ring;
+	u32 type = HWRM_RING_ALLOC_NQ;
+	struct bnge_ring_struct *ring;
+	unsigned int vector;
+	u32 map_idx;
+	int rc;
+
+	ring = &nqr->ring_struct;
+	map_idx = ring->map_idx;
+
+	vector = bn->bd->irq_tbl[map_idx].vector;
+	disable_irq_nosync(vector);
+	rc = hwrm_ring_alloc_send_msg(bn, ring, type, map_idx);
+	if (rc) {
+		enable_irq(vector);
+		return rc;
+	}
+	bnge_set_db(bn, &nqr->nq_db, type, map_idx, ring->fw_ring_id);
+	bnge_db_nq(bn, &nqr->nq_db, nqr->nq_raw_cons);
+	enable_irq(vector);
+
+	return 0;
+}
+
+static void bnge_hwrm_nq_free(struct bnge_net *bn, struct bnge_napi *bnapi)
+{
+	struct bnge_ring_struct *ring = &bnapi->nq_ring.ring_struct;
+
+	if (ring->fw_ring_id == INVALID_HW_RING_ID_32BIT)
+		return;
+
+	hwrm_ring_free_send_msg(bn, ring, RING_FREE_REQ_RING_TYPE_NQ,
+				INVALID_HW_RING_ID);
+	ring->fw_ring_id = INVALID_HW_RING_ID_32BIT;
+}
+
 static int bnge_hwrm_ring_alloc(struct bnge_net *bn)
 {
 	struct bnge_dev *bd = bn->bd;
@@ -1923,22 +1972,11 @@ static int bnge_hwrm_ring_alloc(struct bnge_net *bn)
 	agg_rings = !!(bnge_is_agg_reqd(bd));
 	for (i = 0; i < bd->nq_nr_rings; i++) {
 		struct bnge_napi *bnapi = bn->bnapi[i];
-		struct bnge_nq_ring_info *nqr = &bnapi->nq_ring;
-		struct bnge_ring_struct *ring = &nqr->ring_struct;
-		u32 type = HWRM_RING_ALLOC_NQ;
-		u32 map_idx = ring->map_idx;
-		unsigned int vector;
+		struct bnge_ring_struct *ring = &bnapi->nq_ring.ring_struct;
 
-		vector = bd->irq_tbl[map_idx].vector;
-		disable_irq_nosync(vector);
-		rc = hwrm_ring_alloc_send_msg(bn, ring, type, map_idx);
-		if (rc) {
-			enable_irq(vector);
+		rc = bnge_hwrm_nq_alloc(bn, bnapi);
+		if (rc)
 			goto err_out;
-		}
-		bnge_set_db(bn, &nqr->nq_db, type, map_idx, ring->fw_ring_id);
-		bnge_db_nq(bn, &nqr->nq_db, nqr->nq_raw_cons);
-		enable_irq(vector);
 		bn->grp_info[i].nq_fw_ring_id = (u16)ring->fw_ring_id;
 
 		if (!i) {
@@ -2566,23 +2604,14 @@ static void bnge_hwrm_ring_free(struct bnge_net *bn, bool close_path)
 	bnge_disable_int_sync(bn);
 
 	for (i = 0; i < bd->nq_nr_rings; i++) {
-		struct bnge_napi *bnapi = bn->bnapi[i];
-		struct bnge_nq_ring_info *nqr;
-		struct bnge_ring_struct *ring;
+		struct bnge_nq_ring_info *nqr = &bn->bnapi[i]->nq_ring;
 		int j;
 
-		nqr = &bnapi->nq_ring;
 		for (j = 0; j < nqr->cp_ring_count && nqr->cp_ring_arr; j++)
 			bnge_hwrm_cp_ring_free(bn, &nqr->cp_ring_arr[j]);
 
-		ring = &nqr->ring_struct;
-		if (ring->fw_ring_id != INVALID_HW_RING_ID_32BIT) {
-			hwrm_ring_free_send_msg(bn, ring,
-						RING_FREE_REQ_RING_TYPE_NQ,
-						INVALID_HW_RING_ID);
-			ring->fw_ring_id = INVALID_HW_RING_ID_32BIT;
-			bn->grp_info[i].nq_fw_ring_id = INVALID_HW_RING_ID;
-		}
+		bnge_hwrm_nq_free(bn, bn->bnapi[i]);
+		bn->grp_info[i].nq_fw_ring_id = INVALID_HW_RING_ID;
 	}
 }
 
@@ -2627,27 +2656,60 @@ static void bnge_hwrm_resource_free(struct bnge_net *bn, bool close_path)
 	bnge_hwrm_stat_ctx_free(bn);
 }
 
-static void bnge_free_irq(struct bnge_net *bn)
+static void bnge_nq_free_irq(struct bnge_net *bn, struct bnge_napi *bnapi)
+{
+	int map_idx = bnapi->nq_ring.ring_struct.map_idx;
+	struct bnge_irq *irq = &bn->bd->irq_tbl[map_idx];
+
+	if (irq->requested) {
+		if (irq->have_cpumask) {
+			irq_set_affinity_hint(irq->vector, NULL);
+			free_cpumask_var(irq->cpu_mask);
+			irq->have_cpumask = 0;
+		}
+		free_irq(irq->vector, bnapi);
+	}
+
+	irq->requested = 0;
+}
+
+static int bnge_nq_request_irq(struct bnge_net *bn, struct bnge_napi *bnapi)
 {
+	int map_idx = bnapi->nq_ring.ring_struct.map_idx;
 	struct bnge_dev *bd = bn->bd;
 	struct bnge_irq *irq;
-	int i;
+	int rc;
 
-	for (i = 0; i < bd->nq_nr_rings; i++) {
-		int map_idx = bnge_cp_num_to_irq_num(bn, i);
+	irq = &bd->irq_tbl[map_idx];
 
-		irq = &bd->irq_tbl[map_idx];
-		if (irq->requested) {
-			if (irq->have_cpumask) {
-				irq_set_affinity_hint(irq->vector, NULL);
-				free_cpumask_var(irq->cpu_mask);
-				irq->have_cpumask = 0;
-			}
-			free_irq(irq->vector, bn->bnapi[i]);
-		}
+	rc = request_irq(irq->vector, irq->handler, 0, irq->name, bnapi);
+	if (rc)
+		return rc;
+
+	netif_napi_set_irq_locked(&bnapi->napi, irq->vector);
+	irq->requested = 1;
+
+	if (zalloc_cpumask_var(&irq->cpu_mask, GFP_KERNEL)) {
+		int numa_node = dev_to_node(&bd->pdev->dev);
 
-		irq->requested = 0;
+		irq->have_cpumask = 1;
+		cpumask_set_cpu(cpumask_local_spread(bnapi->index, numa_node),
+				irq->cpu_mask);
+		if (irq_set_affinity_hint(irq->vector, irq->cpu_mask))
+			netdev_warn(bn->netdev,
+				    "Set affinity failed, IRQ = %d\n",
+				    irq->vector);
 	}
+	return 0;
+}
+
+static void bnge_free_irq(struct bnge_net *bn)
+{
+	struct bnge_dev *bd = bn->bd;
+	int i;
+
+	for (i = 0; i < bd->nq_nr_rings; i++)
+		bnge_nq_free_irq(bn, bn->bnapi[i]);
 }
 
 static int bnge_request_irq(struct bnge_net *bn)
@@ -2661,29 +2723,9 @@ static int bnge_request_irq(struct bnge_net *bn)
 		return rc;
 	}
 	for (i = 0; i < bd->nq_nr_rings; i++) {
-		int map_idx = bnge_cp_num_to_irq_num(bn, i);
-		struct bnge_irq *irq = &bd->irq_tbl[map_idx];
-
-		rc = request_irq(irq->vector, irq->handler, 0, irq->name,
-				 bn->bnapi[i]);
+		rc = bnge_nq_request_irq(bn, bn->bnapi[i]);
 		if (rc)
 			goto err_free_irq;
-
-		netif_napi_set_irq_locked(&bn->bnapi[i]->napi, irq->vector);
-		irq->requested = 1;
-
-		if (zalloc_cpumask_var(&irq->cpu_mask, GFP_KERNEL)) {
-			int numa_node = dev_to_node(&bd->pdev->dev);
-
-			irq->have_cpumask = 1;
-			cpumask_set_cpu(cpumask_local_spread(i, numa_node),
-					irq->cpu_mask);
-			if (irq_set_affinity_hint(irq->vector, irq->cpu_mask)) {
-				netdev_warn(bn->netdev,
-					    "Set affinity failed, IRQ = %d\n",
-					    irq->vector);
-			}
-		}
 	}
 	return 0;
 
@@ -2830,7 +2872,7 @@ static int bnge_init_nic(struct bnge_net *bn)
 {
 	int rc;
 
-	bnge_init_nq_tree(bn);
+	bnge_init_cp_rings(bn);
 
 	bnge_init_rx_rings(bn);
 	rc = bnge_alloc_rx_ring_pair_bufs(bn);
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_rmem.c b/drivers/net/ethernet/broadcom/bnge/bnge_rmem.c
index b066ee887a09..bbae84b4157e 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_rmem.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_rmem.c
@@ -431,20 +431,10 @@ void bnge_init_ring_struct(struct bnge_net *bn)
 	for (i = 0; i < bd->nq_nr_rings; i++) {
 		struct bnge_napi *bnapi = bn->bnapi[i];
 		struct bnge_ring_mem_info *rmem;
-		struct bnge_nq_ring_info *nqr;
 		struct bnge_rx_ring_info *rxr;
 		struct bnge_tx_ring_info *txr;
 		struct bnge_ring_struct *ring;
 
-		nqr = &bnapi->nq_ring;
-		ring = &nqr->ring_struct;
-		rmem = &ring->ring_mem;
-		rmem->nr_pages = bn->cp_nr_pages;
-		rmem->page_size = HW_CMPD_RING_SIZE;
-		rmem->pg_arr = (void **)nqr->desc_ring;
-		rmem->dma_arr = nqr->desc_mapping;
-		rmem->vmem_size = 0;
-
 		rxr = bnapi->rx_ring;
 		if (!rxr)
 			goto skip_rx;
-- 
2.47.3

