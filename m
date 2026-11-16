Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794863499;
	b=pB2FwlI9ic4MJZUpXHmbn8JPpqT85eDgWT3N1MC6LoDOoo4E7Y5kH+vOFuHUwDjklD0i
	 MB1OKjLagwktXGVec1cTX/XqwPCA7bgl2m9GeTwKh5baXJd6xizxoIFHTXDhKCpB0Wn5E
	 LTX+OqjtizUM1hRbKEB7xssLszMvUoeBVeI5Q6VWcXG8Yv88uZgSYwmcU9xyFNv1uFLsF
	 3XXnehljrCHNxrNIsqgVS+WhGuOu2LGmZtBiozC8G+hfr0ek+PI96vfk5YSkUPaWUlFav
	 aQJeelmb/k4T76o8MXH6DA2JdYnMiKSGU1X8AiQdwvt/zbTTOfZ+bIz76QJ2yuoehSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863499;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=/qwDjvPApzytwS/QOytLCoQjnxjw0j8Xmt/Cpr58S4k=;
	b=VcgOdOl0BVh/iPqfbzJGbHHgcn2lc2F4h9k9BlkKUzrCrYSxds5E+ff7WEHWPiAveCGE
	 7E3aZ/zCl9JCs/lqIaDiyhpS6/aGRsjI+AY1iGYpKcgwfJgpztUzmmn3S/Tv7izuDT+Uv
	 gzshwYhFtgZ9vkXN81oys3c34qPOv4sLxWVtVr8wkR/aaL5L+zPrZUjzlqS3m2VPj89zj
	 jZ2OGSpH0j3Qh92t5sMIjHmr68jeuuLLDGj+xrtf+zMSwjjxWkKiKl4wWF5nfcernLbHv
	 Z/Ko8hU23/jGODcKBZGZavMWPZuSMdxOq7WnCMKGoUv6/efyrELh4qk7X0jw2yTDofw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kwiJRvNe;
	arc=none smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD278606A337
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD278606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kwiJRvNe
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67db0791748so2001623d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794863488; x=1795468288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/qwDjvPApzytwS/QOytLCoQjnxjw0j8Xmt/Cpr58S4k=;
        b=kwiJRvNev4471ye1RW9FpIzr3l1WG//BGK063QqcoHv/okw8i+7Ux0RBQKdyxzsqD2
         15geBwdHn+pcgMOdb0O7mhywiWEWLxZKtCiR9VYpcf5YyfDZqJncDmpc0kyzJY8Lohok
         VDKjzSzfZTKdHTQAp7q1Xu4CUyEd22q7/Hl83CqdsOR48JsT4rN25EIYS1Ew0rd2ci9f
         JQdbrZ26kKyYRs30JzV8EwSu8vtekzMFzc7CEeR4O5qRkh4skBQVcIOA6Sigi5D3pR7S
         gzIov3vKf2SDRKuwHApz0B5e4yJiiL5fSg6KtHY9Tdk3dJ3V8DBcc5H+xPz0795pLE87
         q/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794863488; x=1795468288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/qwDjvPApzytwS/QOytLCoQjnxjw0j8Xmt/Cpr58S4k=;
        b=bQ8F8NXRmxg6JpK2pzyBxwvVgWsQe0yCX8sMiPi9C8HuMyNgmXMhgwNYzwAJh81K6u
         oMteiiP7OKi0d/Q8yhmKVzR9cQPIrwupPDbi1ZTia+izUMOOdelja4NldiLC0xX4RK/1
         IK11z0Y9XhQH/ZvrV4OBtX26rJOFfKPXoUnxbUpZxbtEczE8pidVuusCI3Df9CjTHPzV
         SBvoQD5nrkYoEE6AsZsx2ZgBfbT6hlWT3gNEi1Br+ln8SlEe7gcLx7mbPxUXZWR3wfLs
         qRVM0Kf60wLHvzlluheFRxsq4iFzEj8shtvd0PulGUYZtvUR6ABlJbna2E0sV3C/KPy0
         wiCA==
X-Gm-Message-State: APuU4Z/oHLFif0wsxxpGEdQtvTqc+HmKBZ9mqw6e2kPLcBDAM5GemGQ6
	VLuB8UqN9iwbnKs3raVnP9Q2nL5VTjGs9R53F8/17TCXPbXhHuxrvRgk
X-Gm-Gg: AZFdTZd1By8uv5uv6zjZCcVLte4I4AN2cwoXW6nGlLS3arnzsW9vw9C72TsuJrx7IOR
	jgbUSQ4eP8zASbIpplbRN1d8On2ntIXR1c1vVtg9nNO48AGwgbUfp5Vxw+jxpfZIAInUocSW3yW
	J5mRIZsEeV42SU609n+G+oZwFw33gCwMAUkt/+i9M5P//jq+FF9664sKZcDCvjpX5KA5y8soMUJ
	Id1FCdovByG/dTHGLEQ73WMZcsy0082l4hhmZlX73Fcs3nWgRbnt3Cx3J1SsbtpJ4JPSpnRFiS1
	g/rfqSv7axwXvzeneqfShviBpd1kh1mUEmHQriNhvRvYQBPwqwSXh6tJBDmMvI0H1hazjVR1VFt
	BkIbfftwx3+goa7HURgKY/gNNd/0g6gZ4/WbJtRZAgkAeDTaXEFpkZbZ0rhaM3VzLZtREcqsuVS
	NV8xjP//oWb57yo1lgwRmhMCmGBd8xLnFboaPILTfml83SasAOyO8vOFNxubh1uejMq/G5j+6R9
	4Llz4DUBG0pYlxFr1kXe4hKYsJSgum6xdDi1NcxApVe/v6qBXyKttXfNIx1d29Vjq+7tRanOE9O
	GxhtoC/DPVs+ePbQcGJeD3uPvfgY3x9ZdCw7CmLXjdJRa4XF
X-Received: by 2002:a05:690e:150b:b0:679:afc8:9d2a with SMTP id 956f58d0204a3-67d896ab292mr5836269d50.54.1794863487763;
        Mon, 16 Nov 2026 13:11:27 -0800 (PST)
Received: from localhost ([2a03:2880:30ff:71::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a5b3b62sm10848957d50.13.2026.11.16.13.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:11:27 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Mon, 16 Nov 2026 13:11:20 -0800
Subject: [PATCH net-next 2/4] eth: mpnic: add promiscuous and all-multicast
 filters
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
Message-Id: <20261116-mpnic-l2-oot-v1-2-8dc6eb3582b0@gmail.com>
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

Implement IFF_PROMISC and IFF_ALLMULTI with the last TCAM entry, which
matches either every address or only the multicast bit.

Change the default action on TCAM misses to drop frames. With the
device, broadcast and promiscuous entries in place, frames that miss the
TCAM can be dropped instead of delivered to the stack to drop.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 drivers/net/ethernet/meta/mpnic/mpnic_init.c   |  5 +----
 drivers/net/ethernet/meta/mpnic/mpnic_netdev.c | 21 +++++++++++++++++---
 drivers/net/ethernet/meta/mpnic/mpnic_rpc.c    | 27 ++++++++++++++++++++++++++
 drivers/net/ethernet/meta/mpnic/mpnic_rpc.h    |  3 +++
 4 files changed, 49 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_init.c b/drivers/net/ethernet/meta/mpnic/mpnic_init.c
index 889555eb4790..0c2878c18c54 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_init.c
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_init.c
@@ -199,12 +199,9 @@ static void mpnic_txb_init(struct mpnic_dev *mpd)
 
 static void mpnic_rxb_init(struct mpnic_dev *mpd)
 {
-	/* Accept all packets that miss dmac tcam, until l2 filtering is
-	 * implemented.
-	 */
 	mpnic_wr64(mpd, MPNIC_RXB_PORT_CLASS_CFG(0),
 		   FIELD_PREP(MPNIC_RXB_PORT_CLASS_CFG_DEFAULT_L2_ACTION,
-			      MPNIC_L2_ACTION_PASS));
+			      MPNIC_L2_ACTION_DROP));
 	mpnic_wr64(mpd, MPNIC_RXB_PORT_CFG(0),
 		   FIELD_PREP(MPNIC_RXB_PORT_CFG_FCS_STRIP_MODE,
 			      MPNIC_FCS_MODE_STRIP));
diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
index 16611813db55..43547a7d6e5c 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
@@ -12,8 +12,10 @@
 #include "mpnic_netdev.h"
 #include "mpnic_txrx.h"
 
-static void __mpnic_set_rx_mode(struct mpnic_dev *mpd)
+static void __mpnic_set_rx_mode(struct mpnic_dev *mpd,
+				struct netdev_hw_addr_list *mc)
 {
+	bool uc_promisc = false, mc_promisc = false;
 	struct net_device *netdev = mpd->netdev;
 	struct mpnic_mac_addr *mac_addr;
 
@@ -33,6 +35,14 @@ static void __mpnic_set_rx_mode(struct mpnic_dev *mpd)
 		mac_addr->state = MPNIC_TCAM_S_ADD;
 	}
 
+	if (!netdev_hw_addr_list_empty(mc))
+		mc_promisc = true;
+
+	uc_promisc |= netdev->flags & IFF_PROMISC;
+	mc_promisc |= netdev->flags & IFF_ALLMULTI;
+
+	mpnic_promisc_sync(mpd, uc_promisc, mc_promisc);
+
 	mpnic_write_macda(mpd);
 }
 
@@ -43,7 +53,7 @@ static int mpnic_set_rx_mode(struct net_device *netdev,
 	struct mpnic_net *mpn = netdev_priv(netdev);
 
 	if (netif_running(netdev))
-		__mpnic_set_rx_mode(mpn->mpd);
+		__mpnic_set_rx_mode(mpn->mpd, mc);
 
 	return 0;
 }
@@ -54,6 +64,7 @@ static void mpnic_clear_rx_mode(struct mpnic_dev *mpd)
 
 	mac_addr[MPNIC_TCAM_MACDA_BROADCAST_IDX].state = MPNIC_TCAM_S_DELETE;
 	mac_addr[MPNIC_TCAM_MACDA_HOST_ADDR_IDX].state = MPNIC_TCAM_S_DELETE;
+	mac_addr[MPNIC_TCAM_MACDA_PROMISC_IDX].state = MPNIC_TCAM_S_DELETE;
 
 	mpnic_write_macda(mpd);
 }
@@ -79,7 +90,11 @@ static int mpnic_open(struct net_device *netdev)
 
 	mpnic_enable(mpn);
 	mpnic_fill(mpn);
-	__mpnic_set_rx_mode(mpn->mpd);
+
+	netif_addr_lock_bh(netdev);
+	__mpnic_set_rx_mode(mpn->mpd, &netdev->mc);
+	netif_addr_unlock_bh(netdev);
+
 	mpnic_napi_enable(mpn);
 
 	netif_tx_wake_all_queues(netdev);
diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_rpc.c b/drivers/net/ethernet/meta/mpnic/mpnic_rpc.c
index c96aec4de3e4..ebbccf8ec723 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_rpc.c
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_rpc.c
@@ -7,6 +7,33 @@
 #include "mpnic.h"
 #include "mpnic_rpc.h"
 
+void mpnic_promisc_sync(struct mpnic_dev *mpd, bool uc_promisc,
+			bool mc_promisc)
+{
+	struct mpnic_mac_addr *mac_addr;
+
+	mac_addr = &mpd->mac_addr[MPNIC_TCAM_MACDA_PROMISC_IDX];
+	if (uc_promisc) {
+		if (!is_zero_ether_addr(mac_addr->value) ||
+		    mac_addr->state != MPNIC_TCAM_S_VALID) {
+			eth_zero_addr(mac_addr->value);
+			eth_zero_addr(mac_addr->mask);
+			mac_addr->state = MPNIC_TCAM_S_ADD;
+		}
+	} else if (mc_promisc) {
+		if (!is_multicast_ether_addr(mac_addr->value) ||
+		    mac_addr->state != MPNIC_TCAM_S_VALID) {
+			eth_zero_addr(mac_addr->value);
+			eth_zero_addr(mac_addr->mask);
+			mac_addr->value[0] ^= 1;
+			mac_addr->mask[0] ^= 1;
+			mac_addr->state = MPNIC_TCAM_S_ADD;
+		}
+	} else if (mac_addr->state == MPNIC_TCAM_S_VALID) {
+		mac_addr->state = MPNIC_TCAM_S_DELETE;
+	}
+}
+
 static void mpnic_write_macda_entry(struct mpnic_dev *mpd, unsigned int idx,
 				    struct mpnic_mac_addr *mac_addr)
 {
diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_rpc.h b/drivers/net/ethernet/meta/mpnic/mpnic_rpc.h
index f6e4f60180d6..0eec09df7642 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_rpc.h
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_rpc.h
@@ -31,6 +31,7 @@ enum {
 
 #define MPNIC_TCAM_MACDA_BROADCAST_IDX	0
 #define MPNIC_TCAM_MACDA_HOST_ADDR_IDX	(MPNIC_RXB_DMAC_TCAM_CNT - 2)
+#define MPNIC_TCAM_MACDA_PROMISC_IDX	(MPNIC_RXB_DMAC_TCAM_CNT - 1)
 
 struct mpnic_mac_addr {
 	u8 mask[ETH_ALEN];
@@ -38,6 +39,8 @@ struct mpnic_mac_addr {
 	u8 state;
 } __aligned(2);
 
+void mpnic_promisc_sync(struct mpnic_dev *mpd, bool uc_promisc,
+			bool mc_promisc);
 void mpnic_write_macda(struct mpnic_dev *mpd);
 
 #endif /* _MPNIC_RPC_H_ */

-- 
2.52.1

