Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793319803;
	b=HLBq7VRhWMBeMMsiP2muGWLyI0qmxoyHVcq6GYSEQek7YsHb4Tmjm+TQsazX1sV0O7Y7
	 ZtJnvnicyl57CN/I9qP2Sc/tRWtHWzdO1VC8gOqX7vFFiFAWv6EcJtgOLRMF7YYNSfjm9
	 1AbfPnxrkGiUhFSjSH2rAs2j0M4jeVYSUZHWqDXq8uh4GR1+gzQMLILyToqD9eE1QBDoH
	 K8d82rhG5B76h+/AM1QzfvgJwv5eGq3ToC42aARb8D2n9lb6El/egG/VGYRAvt18W79eZ
	 4ahNqI0C+3uXnyIlM5HShX2WIRG/xOdtc7dnfsWoBHr8G2UGWLGJaDLAYqjvF4AuETg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793319803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+NfimRk2GYnku3/wifGqwhcMFbQKhofA3PCyZ8KRFLg=;
	b=l8IJHuFYA6cvsrudkTzArkuL5V9//ziNMuvgWx5mZMtm3DePICDDs136UL5OzsgCME0F
	 KjO5c//ibH5gRHARvcrJLmeOSX5Et98CUYIuzhDo9rOlCMwhrQSM4wSZXaAcx/HxyaWrB
	 IBKLMrQijJjUXInm1CYh/vmtyWxJTtH5UouFwWKdNpqmM6mxf1KKeuTuORFwJN4acZTy2
	 KRFfG+oTZtBtzoRPGNlcCuFN5wk/rJSanyigF5/vYaYRd+JHsHjqACtXrrJBfIKY1Uwiq
	 uL09G+BQH2D/Ks+jR3DfdAKAl32uhVnLeZaipb33/qAuyb7zS9qYtc/u6Fd0BpXdmaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ypsC157I;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B830F606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B830F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ypsC157I
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c5358fc28so126014f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793319801; x=1793924601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+NfimRk2GYnku3/wifGqwhcMFbQKhofA3PCyZ8KRFLg=;
        b=ypsC157I+v7buErUok30TBiMODRXmt0y64VItSaKUENFC534TAfGzo2OHFZgJmXpwc
         L9kRGPgyzBwdMo/O7Idj5K2oybXz418/96NL6mvw/0f02q4KmR0ACKymwGkg0VR1sK0l
         x0wzJBDeOvbt7evJA5Odgu1gFVbJRNHXAodaadMy/gMC9F5lm+HQCUcxIi2iCXYAbq8/
         k1WnX1L2j/7cClcqb9BTvinAQRSIx8wizdwUQkL5lXW+Rlu5PwBwLPae07RnC1v77LAt
         Td7bjzE/7MQ0RZzXwLBskmvr6E+VWZiCZxQfZVtlenHW992yTqB75FefpYt1zPMJa8T5
         4ZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793319801; x=1793924601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+NfimRk2GYnku3/wifGqwhcMFbQKhofA3PCyZ8KRFLg=;
        b=TdhSehyJq4cghUmZXGfQ74kUDC/1iz4b/Jen9ub3Z0LIwF2T5nJFYXHZ9l/wm3ekpI
         fPjcMNfZnphNwugryesSCJtQFSF+wejFugdtc/Yp17IcebUicpXCqJOTC0xMCAxIugtR
         uy8HwlA/nz3SBI1IsmyDc5J3YbEpiH3qxOW9IyWLameBuGZkUdB5KVvOktfa771FroWc
         XBYSLxH51uazrV5dkZjOKv+4NFOmcoBgTPFK5hCUjWl2RdM8seMJFQ/ehjPN+rxss14K
         p12S/kV95y3oGYy7f5Ui6NRcizhpFwolB01YXtVNWpV271DdpEvVNscABccHEVCDK9e6
         iXLg==
X-Forwarded-Encrypted: i=1; AKwUvBzQil1XqcTv+jk37aENE3SsihWOjzrIpcl/z+1yu6ZcB9HIWFeNoNmk635MOsB6hNFmhFsywo8ZCCgVsgE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNFx7nbLTzzZRlhg0cIqU+epZCqiD75LzSrwnSTGDMtJEHmDss
	0udyyf3X1j/iDVYWeQoCw9onuIykBCbRmIf2ouIAzEGAFnaLqZOXtyxM
X-Gm-Gg: AYBFou0D0Hz3ew8nU+a/OpKtkfSlV/WT1EOjA6gLHrQjoqmCV11JlQLKLBw4Y8uxnk3
	aM//F97JsBSFa+jrbyeiJEIez9Q0rWcOFxLf78IaqQMz8Z87SRXX5UueLj1kgAjaOIf7CbaGkUs
	NwyXgic9FfYzlvXJhTWBap7obx8gFMvBWQBZDnnEiIrfRxHGP7ljg5d66kinHu4lzyMsqNXQf9U
	UKVV78x5QcFIlXhW04Jyf2/pFkXWKpcVxhwl2ruMK4XsMdyZYYStfjTl/Nl19J+PJbse5ckSHIC
	fcQd9aiLq5I4IG1JFcdXkPuRogFIqOLmrzTX6j1jsVR+DBb6u40N+5YueC65rTvsneFQkCP/f0o
	Qg/lk1A4NT7YuBkl4Bw8hxU1yBrhGyd+ZEx0gbGizr0ONExqNG21fFexfH4HxhZbxSL1riwZAYv
	DGZ5xPnVkydf5qfe8lwiN3uqRH2lDIaVSVvfqqoF40UhbSy42SoygmZ7tNlmPihBDhFauEUGz70
	6OH0aSdZhsCT7ZKofAgNaBVfFa1iHItelTCb1Y2KtYIzDJC4TMGorvm0P3sHVWEqC/o8xO+zBSf
	r4JW/zOjcRnfotfGG58RXBkKEBJK64AfItrvVzc9neyFnMc9kQ/q/uhDA4njATeS2xXxFfJ9se1
	zbZCXcMnT4UM1f1MT1dGo1yfAQ/goGb7fzo361DACcv3hp+BsaQRcLXqwSP+T
X-Received: by 2002:a05:6000:2211:b0:48e:6419:ddf2 with SMTP id ffacd0b85a97d-48e6e2e76bcmr1859407f8f.17.1793319800920;
        Thu, 29 Oct 2026 17:23:20 -0700 (PDT)
Received: from SD.cable.virginm.net (cpc117822-heme13-2-0-cust760.9-1.cable.virginm.net. [81.111.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b728ddsm69596f8f.9.2026.10.29.17.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 17:23:20 -0700 (PDT)
From: Prathamesh Deshpande <prathameshdeshpande7@gmail.com>
To: Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Tariq Toukan <tariqt@nvidia.com>,
	Mark Bloch <mbloch@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Prathamesh Deshpande <prathameshdeshpande7@gmail.com>,
	Cosmin Ratiu <cratiu@nvidia.com>,
	Carolina Jubran <cjubran@nvidia.com>,
	Alex Vesker <valex@mellanox.com>,
	Erez Shitrit <erezsh@mellanox.com>,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net/mlx5: IPOIB, Fix QPN lookup race
Date: Fri, 30 Oct 2026 00:22:14 +0000
Message-ID: <20261030002241.8508-1-prathameshdeshpande7@gmail.com>
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

mlx5i_pkey_get_netdev() reads the QPN hash table without ht_lock,
while mlx5i_pkey_del_qpn() removes entries under that lock and then
frees them.

PKEY child interfaces share the parent's RX resources, so RX lookups
can overlap child removal and access a freed entry. A lookup for
another QPN in the same bucket can also be affected.

Hold ht_lock during lookup and save node->netdev before unlocking.

Fixes: 7e7f4780c340 ("net/mlx5e: IPoIB, Use hash-table to map between QPN to child netdev")
Signed-off-by: Prathamesh Deshpande <prathameshdeshpande7@gmail.com>
---
 .../ethernet/mellanox/mlx5/core/ipoib/ipoib_vlan.c   | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/ipoib/ipoib_vlan.c b/drivers/net/ethernet/mellanox/mlx5/core/ipoib/ipoib_vlan.c
index 4120afd097c3..6c24ae8e7662 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/ipoib/ipoib_vlan.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/ipoib/ipoib_vlan.c
@@ -126,13 +126,17 @@ int mlx5i_pkey_del_qpn(struct net_device *netdev, u32 qpn)
 struct net_device *mlx5i_pkey_get_netdev(struct net_device *netdev, u32 qpn)
 {
 	struct mlx5i_priv *ipriv = netdev_priv(netdev);
+	struct mlx5i_pkey_qpn_ht *ht = ipriv->qpn_htbl;
+	struct net_device *result = NULL;
 	struct qpn_to_netdev *node;
 
-	node = mlx5i_find_qpn_to_netdev_node(ipriv->qpn_htbl->buckets, qpn);
-	if (!node)
-		return NULL;
+	spin_lock_bh(&ht->ht_lock);
+	node = mlx5i_find_qpn_to_netdev_node(ht->buckets, qpn);
+	if (node)
+		result = node->netdev;
+	spin_unlock_bh(&ht->ht_lock);
 
-	return node->netdev;
+	return result;
 }
 
 static int mlx5i_pkey_open(struct net_device *netdev);
-- 
2.43.0

