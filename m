Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9468443E08F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788290295; cv=none; b=XUV+UIS/YvQy571AdaUg6wkWyrRlSDwU2cfp2MPZLLeW6mAyoraZ5wrpct+/VVCjn3SzTmRqlWncKu2cUYohMfBIedHjloTdWInZsrpqbIA1dPxdji1kMsOxnDxnEDVGZGoGtYQrXo6hluzKeG9PJCZDRoWejdgoygQeM66fgnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788290295; c=relaxed/simple;
	bh=N/tCHeYqR6Ax1LGbE9004IWszWIiHPljP/W/diJ1iHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KphNzHRkevM1fg2iS4yA+AVO6MBPRkQT8FB8YA/AeB3ztkhzWM8vOKoU9T6REq5ko8VoccaDmObj9J81dqIEQk57750B5zHeRN1W/VO36ug4ZwdyVtonsU6J6y/qNo3FfpuMolYJ8sqg1eI8J8LKL75HtlqoB4iWEngSN9214uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=LyYJhfKb; arc=none smtp.client-ip=209.85.214.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="LyYJhfKb"
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2d91518a63fso1477625ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788290293; x=1788895093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XV4iTp1dLb8Uvgeqz0AL8wZ3RxxmiSYklSPq0glGVL4=;
        b=qSYqYU0CWQqM8zlFGaLWm/2C1Kii+F3tnhw1SDLZI4cGxyx9OUW0YiyhjK93otfgR8
         oYjrmx/O80Rh7tUqLDk1YSDakhNeOPBQCpoUBz5MSwClgS3omwPDBm+RZ9mkl0MQfk8n
         Rcbzw5AoHuhCF/IBb9BRX/qsjLV5NTjkgEeuSZkdFyVequBcJYMLOeCx+cuTpsw0jkWY
         RgIZxqeS1IyUC+iu1xxES+TV4R9iGPbmfwslJlhcmRg9NBgG+JgSWXw7YCkjSr7yKlUu
         KnM81O2CmLW4/su3CuN8JqLvhemvGfONvG0wyU3jDdN2epGrWJbwXXh5w8z0TN768v98
         sVaQ==
X-Forwarded-Encrypted: i=1; AHgh+RqRXN32Tsn2iKV5L/ZdtKlZw/e1oerq1kTUPdMUvVYXJxJet9IbSs/Bx1ftqagOjMzT6uRGYP6o9MMPSuw=@vger.kernel.org
X-Gm-Message-State: AFuF++ntReK5XDd9SwxLiQsS8U/WaaUWjPWsacz719kF2gFwRtfBjeIq
	Q79qZ1olE7TlNgjn1WJLT0aJ4oZC+MIkNyh2m+j/Khp2ds3+XrZusTXxEmiEOWQCy0EUOutQwIt
	W55/+ISkz42EmMkwqGUmFlBLl8BbLKwFPGfVUmeDnf3b1uTQYWhJavWn+ZGfD03QH1nEnChQCG+
	VsdK6gE/H+vxto/qHICA7KeGyMjmwaflXfsi3MVYMM9DbGp1qUtcr0eNUSyY+m+Zp/+Qtg7jqxZ
	WelHvBO4/v2i2TR3270K265qg==
X-Gm-Gg: AYBFou27jSWcYKEqW+bzteMcH+HK4h2v4ueSLWGaooBT5rX6XuuTXz3oCNNbRshc9Y9
	JVxkBZndB0iWjXL2ePfKe47DONI6Pij4q/90hZSstEpiGdVCElzF0hJUKHsT9l3s8Byfi6yRLzK
	MwST0Ygn056S61wcPjKEAngTHNAvjdjpflywSXFP2AKx8UTnB3zTVYDvq8th6oC1NVGcDt510ke
	bMh3p50nz9qN/qvZMe4EniMZj2PRbeXIir5tOF7i3WiUy2Wwd859x7YQH3MXaijkmqnxkC7pETG
	sP2IUfpBTf8cmQvYUjo6ZB2xDoegXLeF279fwQF5ZJjTMXE/3UUgTgsfGC0X92q8qVe173aj+/f
	nDUzxJbYssdckT8dQ+JmrARSQJBifRrJVvPOhgDKjDww2OjqkTUzBvxkY990BY8Aac/zwPNincq
	dnnWTtwfLJqdu9eEntTuQqvEYll7RVS44hg5sSEZUl3g==
X-Received: by 2002:a17:902:d483:b0:2d7:4b42:9352 with SMTP id d9443c01a7336-2d74dca231amr539687305ad.3.1788290292796;
        Tue, 01 Sep 2026 12:18:12 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2dadd43929dsm310825ad.26.2026.09.01.12.18.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Sep 2026 12:18:12 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so236029a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788290291; x=1788895091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XV4iTp1dLb8Uvgeqz0AL8wZ3RxxmiSYklSPq0glGVL4=;
        b=LyYJhfKbu5pbUiGpoFvfMMEDQS5cMYyptd42JFZY6boLz0XaZZBLH84dG59aaxtWHE
         KQAq2WSNbqJU2I9RvOqJdT7vLrb+jNWDW28TuBJdPI0tEnVncTfyqSUukQj67KHZBJ5G
         RFG+ABRI9yU9A7YBtVIIlZhOJbWDFoXYeH0i0=
X-Forwarded-Encrypted: i=1; AKwUvByiC4V95ciswa9oIGZsCyMymna9bWR0NUeZGeG33PqDVntrjGho6wvxod/pjRrcteEKdPtY4+YqNUzySWI=@vger.kernel.org
X-Received: by 2002:a17:90b:1811:b0:398:e86b:ce14 with SMTP id 98e67ed59e1d1-398e86bcf08mr22289975a91.20.1788290290921;
        Tue, 01 Sep 2026 12:18:10 -0700 (PDT)
X-Received: by 2002:a17:90b:1811:b0:398:e86b:ce14 with SMTP id 98e67ed59e1d1-398e86bcf08mr22289890a91.20.1788290290346;
        Tue, 01 Sep 2026 12:18:10 -0700 (PDT)
Received: from localhost.localdomain ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07b79cf9sm186440eec.18.2026.09.01.12.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:18:09 -0700 (PDT)
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
	Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>
Subject: [PATCH net-next 1/7] bnge: Extract bnapi allocation and cleanup into helpers
Date: Wed,  2 Sep 2026 00:47:22 +0530
Message-ID: <20260901191728.643212-2-bhargava.marreddy@broadcom.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260901191728.643212-1-bhargava.marreddy@broadcom.com>
References: <20260901191728.643212-1-bhargava.marreddy@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Factor bn->bnapi allocation and free logic out of bnge_{alloc,free}_core()
into new bnge_{alloc,free}_bnapi_mem() helpers.

This is a pure refactor with no functional changes, preparing the driver to
move bnapi allocation out of the open/close path.

Signed-off-by: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
Reviewed-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>
---
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  | 29 +++++++++++++++----
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index a4288f0258f8..dbadbf76a3a9 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -1195,6 +1195,12 @@ static int bnge_init_ring_grps(struct bnge_net *bn)
 	return 0;
 }
 
+static void bnge_free_bnapi_mem(struct bnge_net *bn)
+{
+	kfree(bn->bnapi);
+	bn->bnapi = NULL;
+}
+
 static void bnge_free_core(struct bnge_net *bn)
 {
 	bnge_free_vnic_attributes(bn);
@@ -1211,15 +1217,13 @@ static void bnge_free_core(struct bnge_net *bn)
 	bn->tx_ring = NULL;
 	kfree(bn->rx_ring);
 	bn->rx_ring = NULL;
-	kfree(bn->bnapi);
-	bn->bnapi = NULL;
+	bnge_free_bnapi_mem(bn);
 }
 
-static int bnge_alloc_core(struct bnge_net *bn)
+static int bnge_alloc_bnapi_mem(struct bnge_net *bn)
 {
 	struct bnge_dev *bd = bn->bd;
-	int i, j, size, arr_size;
-	int rc = -ENOMEM;
+	int i, size, arr_size;
 	void *bnapi;
 
 	arr_size = L1_CACHE_ALIGN(sizeof(struct bnge_napi *) *
@@ -1227,7 +1231,7 @@ static int bnge_alloc_core(struct bnge_net *bn)
 	size = L1_CACHE_ALIGN(sizeof(struct bnge_napi));
 	bnapi = kzalloc(arr_size + size * bd->nq_nr_rings, GFP_KERNEL);
 	if (!bnapi)
-		return rc;
+		return -ENOMEM;
 
 	bn->bnapi = bnapi;
 	bnapi += arr_size;
@@ -1241,6 +1245,19 @@ static int bnge_alloc_core(struct bnge_net *bn)
 		nqr->ring_struct.ring_mem.flags = BNGE_RMEM_RING_PTE_FLAG;
 	}
 
+	return 0;
+}
+
+static int bnge_alloc_core(struct bnge_net *bn)
+{
+	struct bnge_dev *bd = bn->bd;
+	int i, j, rc;
+
+	rc = bnge_alloc_bnapi_mem(bn);
+	if (rc)
+		return rc;
+
+	rc = -ENOMEM;
 	bn->rx_ring = kzalloc_objs(struct bnge_rx_ring_info, bd->rx_nr_rings);
 	if (!bn->rx_ring)
 		goto err_free_core;
-- 
2.47.3

