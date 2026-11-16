Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794863494;
	b=4AybdH1hAv+8ztScVCYJ+krJcfPmQ4gexjuZL919OvhPtsrIVAudhn8hex84qNVidQXq
	 oNbzxygvwUBfbtDAdZtugP62O15bGP0+ZH1mE/rKIROXW7SqARMQ04toSUdBN8HVLrQdh
	 QvqtR3BoXCsNB8Gw29baaF/kHf0hFwS5iX8879GTzU0AC9o8ueBiknVHAgfr2J3WbxAvy
	 MjcCWy2PV/sCzzRKmJ/mMhqQMuJlsdlB02AW1yaRpR7GFv+Yi22c1lac0B5aeh2i9VPjh
	 lmt1cMXgXfgOFbmxtzi5vdX34emEtrKTxUBNJIfnSf2KSm6PIIfOeZ+DL2rBD+H/5Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=Z52BU7HtmZawPJBBPIAaMHYjxufxKr1lQvwtfvfNBJ4=;
	b=LazFgcWIduDsS9elC8sUpgfta+rgW9zN5MTCCyK1rngJ10Gu3L/j9QREZ989EJIZqJjx
	 QaWyGR2HhqhyijsozwjWfTq3nrWX+sGGxIXOQrFvA8CV/31rI31HmZkxVGLhAQ5SC6T9G
	 1dc1sAslINH/lfzm90Ungub0uxePOkRkiDGmbx2lgpRWftKT8m7TtLh1zriu2pprA899I
	 C7J3HpB51x7b4+CymhlZXsiHhjGM6T1DNXnsXvMxZhJdaMY9fiSEi86PZECMfauJC6QzG
	 xsPTx+laXO1w1OSx2KDKsJi/h2e7cEShqqQyi/T8TlcxwIgcpnm6K6veIbrWQ4fdOdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WH7jMt1b;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AC3606A889
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:11:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4AC3606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WH7jMt1b
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b335eeb340so30003427b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794863490; x=1795468290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z52BU7HtmZawPJBBPIAaMHYjxufxKr1lQvwtfvfNBJ4=;
        b=WH7jMt1bPFZVCeRRjIX5Il0nBOKog9UGD1qDR2Quf1mbzlN6NNK/2zwQi+UsTBhoUT
         hVF/4jlLPElfHMc51sPneNlkQ0HPn/wvoRG6g5Tm/KlCljq06FEhxkli6gcUDUeyWigW
         vffseN85eCMhY517KPB3jY0r+SJNGl7kculkQOMqp/VYgwWsBR45/qZoGjBt4OauPqAL
         YmXICyFXYmHH9CtSylptaAwMxmRIp2oXfKWiIv+K8LpTZLvDnoYvdszZpli/+Bgu+EMF
         gZfsqet4s+obHx7vdMg+RK3z1OcOg25P5VGV1KFqZ2M+N+zuUrqKQbpqYuZHZsMDMOHM
         J5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794863490; x=1795468290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z52BU7HtmZawPJBBPIAaMHYjxufxKr1lQvwtfvfNBJ4=;
        b=PV/8fYPKDIOuAX3+70AVVzQYBR0zANjrctIgzsf9c8hFvjkU+QfvudjDRh1mfms59C
         y3g4DY6eK4fekDP49jA8mf0IPJ24bdz3UPl+EoCi+O7yQT7uulbPOOsFHyvWI2ogGtrf
         Gi/BOD3pSfgEg1wijokP+II8m+ik63PHrVoeeySBaYiHlob91uIKhWAOBkM2p3vEDIXu
         yEMr5i0x6c5VcBZbO++rCXEiFGejtSIsw3CCRAV2aNWfwuK2HGSdqz9wrrwQ5ILFqP1q
         JML1vOMb+79XTt/bmQiojmaeYufKNPND6fFY0zXsmRQF2+2G36707+2nqQ0ZCZBeft43
         Sbsw==
X-Gm-Message-State: APuU4Z/zpFgbgDK4jtEWf4cmUrSgTUBdUsNcQRKFDiqNxZEXaRtouOB5
	WDP6ybtx/pestflusgowW2ANitPF1FVDIQryqrcjdBqpiLYM5WUlbg1g
X-Gm-Gg: AZFdTZfd036FlWGA4sc1xkUump7T4WTx0XbEvVJP+F8T10wBx6V5l4Y44jKOroofJDz
	3iL5Id2229lPtVueI48yc2YNkW+T1j4DZMC35lor9YNFxKK7bPb/2A6aWhkyTc8IxLAaOflV/SH
	EKq+mRFiJ+4l261FFyp3PJEzwEEHNKlSUE93K0JRpuew+BPBkMsIC2nV9ATe0cGGM2if+eAuVnr
	F4g+d3qNrhoRAblZoIAVvv7sUDaKBe0sqbHEKJ+D0WanmsXSJuyh1hWo5C3uFCpLj2KQC5lK3v7
	FIlKUKGLaea4meFKbEhoygV7VEMek7djLHa2wuFYbm+WHwsgtLflnXIp64lBqyTKnSdyavASmSz
	1SFOIxlPqGwQ8LE/L4vpVd3yIUd/nF0oyHWYw2gkDRAw3K4VSPy6B61YHQuIlO+11UtysuEWgML
	TEaPVnCOtvzn9ByvKOpW991tawt3mCFfQKKL9o+/VFoVdG6mDeWl8T7IJAv6U80hRMtYou8ufHG
	hw8sM52SRz/OOzGdFb/PZ+XycYIKYkNNndufPEnfIubE0nKC6NHEcs/xIuvLDPbxDIf/hFYW/jb
	zfkilERA5R1nbViowNOi4hWxzw==
X-Received: by 2002:a05:690c:6d82:b0:8b4:c3e4:9c4f with SMTP id 00721157ae682-8b4c3e4b54amr27268797b3.30.1794863490019;
        Mon, 16 Nov 2026 13:11:30 -0800 (PST)
Received: from localhost ([2a03:2880:30ff:5::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4ec3079fbsm8698197b3.41.2026.11.16.13.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:11:29 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Mon, 16 Nov 2026 13:11:21 -0800
Subject: [PATCH net-next 3/4] eth: mpnic: sync unicast and multicast
 address lists
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-mpnic-l2-oot-v1-3-8dc6eb3582b0@gmail.com>
References: <20261116-mpnic-l2-oot-v1-0-8dc6eb3582b0@gmail.com>
In-Reply-To: <20261116-mpnic-l2-oot-v1-0-8dc6eb3582b0@gmail.com>
To: Alexander Duyck <alexanderduyck@fb.com>, 
 Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>, 
 Mohsin Bashir <mohsin.bashr@gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 Daniel Zahka <daniel.zahka@gmail.com>
X-Mailer: b4 0.13.0

Add the secondary unicast and multicast addresses to the MACDA TCAM.
Advertise IFF_UNICAST_FLT so we don't need to use promiscuous mode to
handle extra unicast addresses.

When the unicast or multicast list outgrows the table, fall back to
promiscuous or all-multicast mode respectively.

Track the number of users of a HW filter, because the same address can
be used in the dev->uc and dev->mc lists.

Allow a filter slot pending deletion to be reused during
mpnic_macda_sync(). Document this transition in the state machine
comment.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 drivers/net/ethernet/meta/mpnic/mpnic_netdev.c | 38 ++++++++++++++--
 drivers/net/ethernet/meta/mpnic/mpnic_rpc.c    | 60 ++++++++++++++++++++++++++
 drivers/net/ethernet/meta/mpnic/mpnic_rpc.h    |  5 +++
 3 files changed, 100 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
index 43547a7d6e5c..c01e276c4a74 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
@@ -12,12 +12,30 @@
 #include "mpnic_netdev.h"
 #include "mpnic_txrx.h"
 
+static int mpnic_addr_sync(struct net_device *netdev,
+			   const unsigned char *addr)
+{
+	struct mpnic_net *mpn = netdev_priv(netdev);
+
+	return mpnic_macda_sync(mpn->mpd, addr);
+}
+
+static int mpnic_addr_unsync(struct net_device *netdev,
+			     const unsigned char *addr)
+{
+	struct mpnic_net *mpn = netdev_priv(netdev);
+
+	return mpnic_macda_unsync(mpn->mpd, addr);
+}
+
 static void __mpnic_set_rx_mode(struct mpnic_dev *mpd,
+				struct netdev_hw_addr_list *uc,
 				struct netdev_hw_addr_list *mc)
 {
 	bool uc_promisc = false, mc_promisc = false;
 	struct net_device *netdev = mpd->netdev;
 	struct mpnic_mac_addr *mac_addr;
+	int err;
 
 	mac_addr = &mpd->mac_addr[MPNIC_TCAM_MACDA_HOST_ADDR_IDX];
 	if (!ether_addr_equal(mac_addr->value, netdev->dev_addr) ||
@@ -35,7 +53,14 @@ static void __mpnic_set_rx_mode(struct mpnic_dev *mpd,
 		mac_addr->state = MPNIC_TCAM_S_ADD;
 	}
 
-	if (!netdev_hw_addr_list_empty(mc))
+	err = __hw_addr_sync_dev(uc, netdev, mpnic_addr_sync,
+				 mpnic_addr_unsync);
+	if (err == -ENOSPC)
+		uc_promisc = true;
+
+	err = __hw_addr_sync_dev(mc, netdev, mpnic_addr_sync,
+				 mpnic_addr_unsync);
+	if (err == -ENOSPC)
 		mc_promisc = true;
 
 	uc_promisc |= netdev->flags & IFF_PROMISC;
@@ -53,7 +78,7 @@ static int mpnic_set_rx_mode(struct net_device *netdev,
 	struct mpnic_net *mpn = netdev_priv(netdev);
 
 	if (netif_running(netdev))
-		__mpnic_set_rx_mode(mpn->mpd, mc);
+		__mpnic_set_rx_mode(mpn->mpd, uc, mc);
 
 	return 0;
 }
@@ -61,6 +86,12 @@ static int mpnic_set_rx_mode(struct net_device *netdev,
 static void mpnic_clear_rx_mode(struct mpnic_dev *mpd)
 {
 	struct mpnic_mac_addr *mac_addr = mpd->mac_addr;
+	struct net_device *netdev = mpd->netdev;
+
+	netif_addr_lock_bh(netdev);
+	__dev_uc_unsync(netdev, mpnic_addr_unsync);
+	__dev_mc_unsync(netdev, mpnic_addr_unsync);
+	netif_addr_unlock_bh(netdev);
 
 	mac_addr[MPNIC_TCAM_MACDA_BROADCAST_IDX].state = MPNIC_TCAM_S_DELETE;
 	mac_addr[MPNIC_TCAM_MACDA_HOST_ADDR_IDX].state = MPNIC_TCAM_S_DELETE;
@@ -92,7 +123,7 @@ static int mpnic_open(struct net_device *netdev)
 	mpnic_fill(mpn);
 
 	netif_addr_lock_bh(netdev);
-	__mpnic_set_rx_mode(mpn->mpd, &netdev->mc);
+	__mpnic_set_rx_mode(mpn->mpd, &netdev->uc, &netdev->mc);
 	netif_addr_unlock_bh(netdev);
 
 	mpnic_napi_enable(mpn);
@@ -366,6 +397,7 @@ struct net_device *mpnic_netdev_alloc(struct mpnic_dev *mpd)
 	netdev->netdev_ops = &mpnic_netdev_ops;
 	netdev->stat_ops = &mpnic_stat_ops;
 	netdev->request_ops_lock = true;
+	netdev->priv_flags |= IFF_UNICAST_FLT;
 
 	mpn = netdev_priv(netdev);
 	mpn->netdev = netdev;
diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_rpc.c b/drivers/net/ethernet/meta/mpnic/mpnic_rpc.c
index ebbccf8ec723..509a63c271cd 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_rpc.c
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_rpc.c
@@ -7,6 +7,66 @@
 #include "mpnic.h"
 #include "mpnic_rpc.h"
 
+static bool mpnic_macda_free(struct mpnic_mac_addr *mac_addr)
+{
+	return mac_addr->state == MPNIC_TCAM_S_DISABLED ||
+	       mac_addr->state == MPNIC_TCAM_S_DELETE;
+}
+
+int mpnic_macda_sync(struct mpnic_dev *mpd, const u8 *addr)
+{
+	struct mpnic_mac_addr *avail_addr = NULL;
+	unsigned int i;
+
+	for (i = MPNIC_TCAM_MACDA_BROADCAST_IDX + 1;
+	     i < MPNIC_TCAM_MACDA_HOST_ADDR_IDX; i++) {
+		struct mpnic_mac_addr *mac_addr = &mpd->mac_addr[i];
+
+		if (mac_addr->state != MPNIC_TCAM_S_DISABLED &&
+		    ether_addr_equal(mac_addr->value, addr)) {
+			avail_addr = mac_addr;
+			break;
+		}
+
+		if (!avail_addr && mpnic_macda_free(mac_addr))
+			avail_addr = mac_addr;
+	}
+
+	if (!avail_addr)
+		return -ENOSPC;
+
+	if (mpnic_macda_free(avail_addr)) {
+		ether_addr_copy(avail_addr->value, addr);
+		eth_broadcast_addr(avail_addr->mask);
+		avail_addr->state = MPNIC_TCAM_S_ADD;
+	}
+
+	avail_addr->users++;
+
+	return 0;
+}
+
+int mpnic_macda_unsync(struct mpnic_dev *mpd, const u8 *addr)
+{
+	unsigned int i;
+
+	for (i = MPNIC_TCAM_MACDA_BROADCAST_IDX + 1;
+	     i < MPNIC_TCAM_MACDA_HOST_ADDR_IDX; i++) {
+		struct mpnic_mac_addr *mac_addr = &mpd->mac_addr[i];
+
+		if (mpnic_macda_free(mac_addr) ||
+		    !ether_addr_equal(mac_addr->value, addr))
+			continue;
+
+		if (!--mac_addr->users)
+			mac_addr->state = MPNIC_TCAM_S_DELETE;
+
+		return 0;
+	}
+
+	return -ENOENT;
+}
+
 void mpnic_promisc_sync(struct mpnic_dev *mpd, bool uc_promisc,
 			bool mc_promisc)
 {
diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_rpc.h b/drivers/net/ethernet/meta/mpnic/mpnic_rpc.h
index 0eec09df7642..8ed507daaf6f 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_rpc.h
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_rpc.h
@@ -21,6 +21,8 @@ struct mpnic_dev;
  *
  *  Valid     1	-> Delete     3
  *  Delete    3	-> Disabled   0
+ *
+ *  Delete    3	-> Add	      2
  */
 enum {
 	MPNIC_TCAM_S_DISABLED	= 0,
@@ -37,8 +39,11 @@ struct mpnic_mac_addr {
 	u8 mask[ETH_ALEN];
 	u8 value[ETH_ALEN];
 	u8 state;
+	u8 users;
 } __aligned(2);
 
+int mpnic_macda_sync(struct mpnic_dev *mpd, const u8 *addr);
+int mpnic_macda_unsync(struct mpnic_dev *mpd, const u8 *addr);
 void mpnic_promisc_sync(struct mpnic_dev *mpd, bool uc_promisc,
 			bool mc_promisc);
 void mpnic_write_macda(struct mpnic_dev *mpd);

-- 
2.52.1

