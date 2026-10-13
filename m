Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172EE548575
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791922106; cv=none; b=EqLygeZLaHNJsLzeUjTuUeIO8KZPi8BDvrU0jUHlsb2+qYhcoYVl+D/fympDMxanMeAHyy05qaj6Qgx/nevq0T+hqJ4eU9bYCWSwdoIIifkDfHssTq7jD2hUiVviDgC0OZO3aMOOmhq+3N9+BUHndfXneaYxDuUJgBIESsFZ8gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791922106; c=relaxed/simple;
	bh=HRGi3+8s+xZ0Pv2YLVltUZU5MS3BORmziEe4ICaxj2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HUPTXHaCuVuRHJh8otT9eCBt11Vd/G+jPOiEqlpzTTqRmfpkf9b7YeER+6utyFlte+1u2zZ/HWSgHPt8Bvrpran47U57Br9J9c6j/pA7+Wlvzs0vmzBBlZUJE4X8xC3bDqNR6moUV74UyqV6Aml1huYWnoMd8Lwwyqg933qO7ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=T2mVNeGo; arc=none smtp.client-ip=209.85.216.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="T2mVNeGo"
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so1534751a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791922103; x=1792526903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M2ErZj7OvfiHzwXbTEuEIcm9vf6VpN09VWgyrHzyJFw=;
        b=uupsgH4fUxTPq/MejM9YCWEJJwGs0q9DQsGUJaErkGVkl0DCDHjJxEGuUNgCOaM5z4
         k7UtgOwduT67x30H/KeSGG4UFWpBXkerNp+sAdwCP7KhaoyJyZ5eXCFp/SsUlhWk+BHF
         Rx09r9BvAILcx290THQHDLnu7T6Pzm35zTF479ypxe3WZmCgASDe7IsTK3npIqg9XuWY
         tNd2w/ghAFXV9MaQ7yGKRY2BjyovbSA2LRyWF1PwQD7Lj4VF+aqaOMOEYn6KlKwHmGHB
         KC4ImSJquAYrUu03dG/66q07g9AoLWFw7/rofzYiOx51+3lTf86RZKCmDgSyIhBqBrNc
         lFbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhzq7XedZkdBUcyiSdlq7q3NeVPLev6ZwJC18+jCGDNXDrxGhR3O3vyo2y0Vr9WKV+DAQho7rgJKALXtQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJascO7zhfJsETgxdsQElu+8PC4c25CdqqouV8kVqP6ImMh+9Rp
	tlMf0zg3xxSiuXX8UqQ67D4hEZTKssBaKXSgLa2Ievg8ZpnCJeXNLGoxgAnfqIGZWuEbXwbtctS
	qv+2BeUcz4PzSiJrwPIwTDzW2OQAwMh0/HiqA6UULrkX1N6tbc6zt8/rLARF+RqZv1Fu71yuJDV
	caBurgcPgITl8XtpWxuZoOhNaqVVyVBC3QzLGRydxPZs7qsVK7pJXzEy/Ny+o59OkZfgsssJDVC
	1vRwPtMlZmy6Pfhxg3+43AFpQ==
X-Gm-Gg: AYBFou1VtyMyHFXhzqu6xT3D4IWfbwfox7fGvdLKDIGdidpt38Gc8DZzrPN458bgE2o
	ECWTsZThheYEIXeP+KkNisLdY/x98x8uC5rZOVbxKtCULtGQ3ceBHOJjtKVjtUVAbnmBXGVGyGt
	mMFWe64nxvti0bhwhTaaDJwr10n9CwUJO8rNVmeHiuvqxT6RgNmogUIMGpVeHmCFJ5buCvLWtnb
	c0ACBv2KaVRNCA4wZSU2ANjUeIGZlA/kmTWJzfqkaBqE2lhAMUQtlE27HGkv5CymufCJuaPYLzG
	4ImvgAHS5P7MBdoB7RXD1lvX+Q9Sf9hYJY3Rml/WYhC6ZIiJHGASy3PNxqjTX6uqffYutNNpoIX
	TTCH3b1LHJpT3d7rDIY73jKMV4pJH7ogkMY+FQFlS4RYWD6Af+Sk+kjv4RCmtLQdTcb30tevIWU
	jFONuQjnwDs+ZEKu0sw+PP3hNiDn1fYCEMpRJSdY4LvdOQ
X-Received: by 2002:a17:90b:524f:b0:3a8:c0cd:57f8 with SMTP id 98e67ed59e1d1-3ab3a239c2fmr10577684a91.4.1791922102992;
        Tue, 13 Oct 2026 13:08:22 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ac60395c4fsm310244a91.6.2026.10.13.13.08.22
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Oct 2026 13:08:22 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-147be78cd56so13115406c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791922101; x=1792526901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M2ErZj7OvfiHzwXbTEuEIcm9vf6VpN09VWgyrHzyJFw=;
        b=T2mVNeGoIkhbtajAiAk8t2Yan2lNEPw5td6IHwmTyso52eE0XRx6VgrD59Zdm5k0Uc
         Y7OkFbAOnCW7If826p2Q9fMrnIGhdID563YCgnT+H0xodLs8UNFdfiqRIpcoqq1MuqKC
         AmXRs6F3XjgEUMUwq9GMNoLkJ16uD8NjT6MHc=
X-Forwarded-Encrypted: i=1; AKwUvBy/N8DHfWzXgpl23R27SzNMZDu8wv4sJT84YZzZClfhuA6YvcxpGo6MENwbEWxVg0SfNySE8EUaxz2Urpo=@vger.kernel.org
X-Received: by 2002:a05:701b:4583:10b0:149:cfa4:9b3b with SMTP id a92af1059eb24-16a5b2c7120mr18196181c88.3.1791922101133;
        Tue, 13 Oct 2026 13:08:21 -0700 (PDT)
X-Received: by 2002:a05:701b:4583:10b0:149:cfa4:9b3b with SMTP id a92af1059eb24-16a5b2c7120mr18196156c88.3.1791922100434;
        Tue, 13 Oct 2026 13:08:20 -0700 (PDT)
Received: from localhost.localdomain ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6f5csm39526585c88.11.2026.10.13.13.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:08:19 -0700 (PDT)
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
Subject: [PATCH net-next v3 4/5] bnge: make irq_tbl layout depend on BNGE_FIRST_OPEN_NQ
Date: Wed, 14 Oct 2026 01:36:44 +0530
Message-ID: <20261013200645.1346299-5-bhargava.marreddy@broadcom.com>
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

NQ0 will be created at probe, before the aux (RoCE) device has been
given its MSI-X vectors, and must keep its vector for the lifetime of
the driver. So the probe NQs must come first in irq_tbl, followed by the
aux vectors and then the open NQs, instead of putting all NQs after the
aux vectors.

Describe the irq_tbl layout once, next to BNGE_FIRST_OPEN_NQ, and add
bnge_nq_irq_idx() and bnge_aux_irq_idx() to compute the irq_tbl index of
an NQ and of an aux vector from it. bnge_fill_msix_vecs() uses the
latter to hand the aux device the vectors that follow the probe NQs.

The ring_idx passed to the aux device changes meaning accordingly: it is
the irq_tbl index of the vector, not an index within the aux range. This
matches how NQ rings are created, where the ring index is used as the
logical ID that ties the ring to its doorbell and MSI-X vector. The aux
driver uses the values it is given, so it needs no change. The total
number of vectors is unchanged.

BNGE_FIRST_OPEN_NQ is 0 for now, so the layout is unchanged. No
functional change.

Signed-off-by: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
Reviewed-by: Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>
Reviewed-by: Ramakrishna Koduri <ramakrishna.koduri@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnge/bnge.h     | 19 +++++++++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_auxr.c    |  4 ++--
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  |  2 +-
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge.h b/drivers/net/ethernet/broadcom/bnge/bnge.h
index fdd8bca01440..13452caa9081 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge.h
@@ -241,6 +241,10 @@ struct bnge_dev {
 /* Index of the first NQ created in ndo_open() and destroyed in ndo_stop().
  * NQs below it are created at probe and destroyed at remove. It starts at 0,
  * i.e. all NQs are open NQs, until NQ0 moves to probe.
+ *
+ * Layout of bd->irq_tbl: the NQs created at probe (none yet) come first,
+ * then the aux (RoCE) vectors, then the NQs created in open. The ring_idx
+ * the aux device receives is its irq_tbl index.
  */
 #define BNGE_FIRST_OPEN_NQ	0
 
@@ -290,4 +294,19 @@ static inline void bnge_db_write(struct bnge_dev *bd, struct bnge_db_info *db,
 bool bnge_aux_registered(struct bnge_dev *bd);
 u16 bnge_aux_get_msix(struct bnge_dev *bd);
 
+/* irq_tbl index of the i-th aux vector, also used as its ring_idx */
+static inline int bnge_aux_irq_idx(int i)
+{
+	return BNGE_FIRST_OPEN_NQ + i;
+}
+
+/* irq_tbl index of NQ nq_idx */
+static inline int bnge_nq_irq_idx(struct bnge_dev *bd, int nq_idx)
+{
+	if (nq_idx < BNGE_FIRST_OPEN_NQ)
+		return nq_idx;
+
+	return bnge_aux_get_msix(bd) + nq_idx;
+}
+
 #endif /* _BNGE_H_ */
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_auxr.c b/drivers/net/ethernet/broadcom/bnge/bnge_auxr.c
index 0955b488b6fe..0393bfea7b65 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_auxr.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_auxr.c
@@ -34,9 +34,9 @@ static void bnge_fill_msix_vecs(struct bnge_dev *bd,
 	}
 	num_msix = auxr_dev->auxr_info->msix_requested;
 	for (i = 0; i < num_msix; i++) {
-		info[i].vector = bd->irq_tbl[i].vector;
+		info[i].vector = bd->irq_tbl[bnge_aux_irq_idx(i)].vector;
 		info[i].db_offset = bd->db_offset;
-		info[i].ring_idx = i;
+		info[i].ring_idx = bnge_aux_irq_idx(i);
 	}
 }
 
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index 0d98223cd703..dc6cf3525034 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -539,7 +539,7 @@ static int bnge_alloc_nq(struct bnge_net *bn, struct bnge_napi *bnapi)
 	}
 
 	ring->fw_ring_id = INVALID_HW_RING_ID_32BIT;
-	ring->map_idx = bnge_aux_get_msix(bn->bd) + bnapi->index;
+	ring->map_idx = bnge_nq_irq_idx(bn->bd, bnapi->index);
 	return 0;
 }
 
-- 
2.47.3

