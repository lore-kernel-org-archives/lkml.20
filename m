Received: from mail-yx1-f99.google.com (mail-yx1-f99.google.com [74.125.224.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5C047ECCC
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 12:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791202722; cv=none; b=G1E2MCc0Y+mHqQP8GIxmpqGQoqdMRnlJHl1cPg7+sC2gk+l5xitQ6YOmfJ4VG936sUGf2FFRm6bqLGxWBRJq8GcvDYyFleDF6uEUxsy0JhO11+YQ+7dMdQY/xkMkwVEHSScGvAX9xS6qfrjV5hYKZPkTcVl6X9YVlOn0+gL+Pn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791202722; c=relaxed/simple;
	bh=/LIJEt6ejiM4yERzOT0rN7VVwt8hL8mUZVByIZk08+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VSoKNp7BWgEVi4a9VmZQ1/TfgYgPTV1HZtW+mMYOytzSWT2+Amtkb6ZYMV8+UZx4dGI+GdeNPD/WY/WWwQbQSbMcm+AL4NIlvQ1aGgtFcufqUKxgbl+kL58w/7WIVgjzjbOfvs/Al3HUxjGmX2OU1wrPWghausEKf2RrjwZJFuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=SCaHe6Rc; arc=none smtp.client-ip=74.125.224.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="SCaHe6Rc"
Received: by mail-yx1-f99.google.com with SMTP id 956f58d0204a3-6714595153cso894984d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 05:18:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791202719; x=1791807519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W16N+IdCORWhF5gZqUbJpJO3Io4bveWZ57iIEGn649w=;
        b=pHuIaG48/Ni1dm1dpT2WLB3Ql+u+OouJYm9G7ZEdPu4Q0rps33zWhmRU/uhIShsvEM
         /K1vUOWnRmsu8FzQncrZT6iw0/Z0EYbU9ubfxJ0kiD720mf8gLpSBSISZI+VzuxnDXA3
         gPhljVkG92EYwNSd8lYNu+PS/QvXYfNnMFYPIovGWdZXGlCPKm1AyUaC+1vOkW9u2Wh9
         3VlZ4P5nrESyCeu+gIwNcBEd+G2WRu2GEQEOf45M4lS73/yIBADxNIobPDQp0GDh8qlX
         Cl/Z1pAh8zk0sNPHKuKJf1ZkmhOCFQIAXeF41CS/iTPhxHRiEv45tdkIG2Gk9FQhqqdr
         VV1A==
X-Forwarded-Encrypted: i=1; AKwUvBzMAVNogksgYegThHZuTGD682jj+L2OmmJEz4AP4aoR6wl0q5sju7z7DTtCXpR4GbEszXftfw8UbhztVzc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJxmHXeEw9PLmyV2dn4voWvmpqSzYh38QdNgSSlc2tSM1UKvpo
	4t66pgoqMDQPWGwm5Bdqc+ckm6nsFsEnPVwuefoLZkDYM2xcJ2JqGnBALPp6H8FLk1RG5fABpSB
	6PtE9V9PjXoJE6R2PdX1OjA0iMxbdWSZGVXawSzlv1GVGlIKmxbvfEt2RC6FdFW1yZeL/730ET1
	+uHbGpLdnqg5itpT71Pceq+GgvFPKdYyD2y5k3IOQ+NckhCcvs9ocZlE0ggcYFdfC4s1lzVeB78
	UvmjOFLDFi9limGACMon/pjVA==
X-Gm-Gg: AYBFou0u4lVck/QIFhWiypNQB/ADpmwLPegTfeDQG4lSvkrBUASC1XV3MSZMvZUZFz1
	vKOcVGUlJYZwG5O6zUKGxqARHevpnjWeN+XGXsh4S3dWaxy+IHCmryFx8ET42Y8Z4nN8uj+nJaJ
	MMaoxisaY0g4X02shaGo70qaeRJRa6hqHw1Gee4N3BoO7o9VD7b3liCGmm59jBS8u64408wwLJr
	Bdh57pMA5e7x5cG4c0WYW2SxE5+k96ZzZWkCrfBQsiDD3x6/hKpleqfLoRsUhNtDAxsfjrYEWww
	j+vW/g1rGyYzw8K8F6UOpptstHPnkltXG/RLsUam+C9eMDsnhPtzoJMEqwAImvOwxuzZgXRFm+T
	hD/QptjtSpOfMddlrt5YDq+995Yjd63CqWsb0iprxqkL6CPWSj3Na+qH5jFlC6P4KybgYGna51p
	MHkB0o4gxpV9hHUaD9f2N3R0xvmSZALE3tn+8FRPp69XwJ
X-Received: by 2002:a05:690e:1c4:b0:675:449d:3d68 with SMTP id 956f58d0204a3-677ac1a8545mr2818761d50.31.1791202719525;
        Mon, 05 Oct 2026 05:18:39 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-677c1ae866fsm1282979d50.11.2026.10.05.05.18.38
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2026 05:18:39 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3282d5302ffso2361880eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 05:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791202718; x=1791807518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W16N+IdCORWhF5gZqUbJpJO3Io4bveWZ57iIEGn649w=;
        b=SCaHe6RcFeIw21SZFCyPxxrbckzaIQ6AjbHwhlyzc4dAlRG79SMUPhusUd/7OM0Ydl
         4VYVyvd12Xpqfpb0Punuv6/ZepK9t4uV5UpzMMcnKKkynJN+OLsOUzB6v/TNLl3JoC0X
         wk5ECw2KKhC4GtqR+IH1MnE1LeqiCP7U9NRT4=
X-Forwarded-Encrypted: i=1; AKwUvByjLvR+uAor9t4bUddoXEUkNGZWU15gi/VCUcwS7TGCUTZNXqlYouHE0FpiyFuyqhWMFf2qLtTd44YMn4g=@vger.kernel.org
X-Received: by 2002:a05:693c:894b:20b0:351:2f0a:cb2a with SMTP id 5a478bee46e88-3512f0acda4mr3139205eec.2.1791202717981;
        Mon, 05 Oct 2026 05:18:37 -0700 (PDT)
X-Received: by 2002:a05:693c:894b:20b0:351:2f0a:cb2a with SMTP id 5a478bee46e88-3512f0acda4mr3139181eec.2.1791202717100;
        Mon, 05 Oct 2026 05:18:37 -0700 (PDT)
Received: from localhost.localdomain ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351272ceb02sm25687542eec.25.2026.10.05.05.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:18:36 -0700 (PDT)
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
Subject: [PATCH net 1/4] bnge: fix NULL deref in bnge_alloc_core() on failure
Date: Mon,  5 Oct 2026 17:47:01 +0530
Message-ID: <20261005121704.227866-2-bhargava.marreddy@broadcom.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005121704.227866-1-bhargava.marreddy@broadcom.com>
References: <20261005121704.227866-1-bhargava.marreddy@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

bnge_alloc_core() previously jumped to a single error label that called
bnge_free_core() to unwind. However, bnge_free_core() assumes a fully
initialized state and dereferences rx/tx ring arrays unconditionally.
If ring allocations fail early, this causes a near-NULL dereference.

Introduce a standard goto ladder to unwind only the resources that were
successfully allocated, preventing NULL dereferences.

Fixes: 0259379037ca ("bng_en: Add initial support for RX and TX rings")
Signed-off-by: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
Reviewed-by: Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>
Reviewed-by: Ramakrishna Koduri <ramakrishna.koduri@broadcom.com>
---
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  | 46 ++++++++++++++-----
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index a4288f0258f8..bf101eded3bf 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -1243,7 +1243,7 @@ static int bnge_alloc_core(struct bnge_net *bn)
 
 	bn->rx_ring = kzalloc_objs(struct bnge_rx_ring_info, bd->rx_nr_rings);
 	if (!bn->rx_ring)
-		goto err_free_core;
+		goto err_free_bnapi;
 
 	for (i = 0; i < bd->rx_nr_rings; i++) {
 		struct bnge_rx_ring_info *rxr = &bn->rx_ring[i];
@@ -1258,12 +1258,12 @@ static int bnge_alloc_core(struct bnge_net *bn)
 
 	bn->tx_ring = kzalloc_objs(struct bnge_tx_ring_info, bd->tx_nr_rings);
 	if (!bn->tx_ring)
-		goto err_free_core;
+		goto err_free_rx_ring;
 
 	bn->tx_ring_map = kcalloc(bd->tx_nr_rings, sizeof(u16),
 				  GFP_KERNEL);
 	if (!bn->tx_ring_map)
-		goto err_free_core;
+		goto err_free_tx_ring;
 
 	if (bd->flags & BNGE_EN_SHARED_CHNL)
 		j = 0;
@@ -1289,42 +1289,64 @@ static int bnge_alloc_core(struct bnge_net *bn)
 
 	rc = bnge_alloc_ring_stats(bn);
 	if (rc)
-		goto err_free_core;
+		goto err_free_tx_ring_map;
 
 	bnge_init_stats(bn);
 
 	rc = bnge_alloc_vnics(bn);
 	if (rc)
-		goto err_free_core;
+		goto err_free_ring_stats;
 
 	rc = bnge_alloc_nq_arrays(bn);
 	if (rc)
-		goto err_free_core;
+		goto err_free_vnics;
 
 	bnge_init_ring_struct(bn);
 
 	rc = bnge_alloc_rx_rings(bn);
 	if (rc)
-		goto err_free_core;
+		goto err_free_nq_arrays;
 
 	rc = bnge_alloc_tx_rings(bn);
 	if (rc)
-		goto err_free_core;
+		goto err_free_rx_rings;
 
 	rc = bnge_alloc_nq_tree(bn);
 	if (rc)
-		goto err_free_core;
+		goto err_free_tx_rings;
 
 	bn->vnic_info[BNGE_VNIC_DEFAULT].flags |= BNGE_VNIC_RSS_FLAG |
 						  BNGE_VNIC_MCAST_FLAG |
 						  BNGE_VNIC_UCAST_FLAG;
 	rc = bnge_alloc_vnic_attributes(bn);
 	if (rc)
-		goto err_free_core;
+		goto err_free_nq_tree;
 	return 0;
 
-err_free_core:
-	bnge_free_core(bn);
+err_free_nq_tree:
+	bnge_free_nq_tree(bn);
+err_free_tx_rings:
+	bnge_free_tx_rings(bn);
+err_free_rx_rings:
+	bnge_free_rx_rings(bn);
+err_free_nq_arrays:
+	bnge_free_nq_arrays(bn);
+err_free_vnics:
+	bnge_free_vnics(bn);
+err_free_ring_stats:
+	bnge_free_ring_stats(bn);
+err_free_tx_ring_map:
+	kfree(bn->tx_ring_map);
+	bn->tx_ring_map = NULL;
+err_free_tx_ring:
+	kfree(bn->tx_ring);
+	bn->tx_ring = NULL;
+err_free_rx_ring:
+	kfree(bn->rx_ring);
+	bn->rx_ring = NULL;
+err_free_bnapi:
+	kfree(bn->bnapi);
+	bn->bnapi = NULL;
 	return rc;
 }
 
-- 
2.47.3

