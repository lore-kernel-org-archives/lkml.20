Received: from mail-dl2-f40.google.com (mail-dl2-f40.google.com [74.125.229.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E323F380FF2
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790739202; cv=none; b=Ste/GEfRUrHvzoTLk/tc0wM69PdEpftOW/GfCU8sWsDP75mwAyu448rwOh7l2JKzgs8c6GeMp4FohxSOPDuQRJiFirxQ/4A+thqkhj5PMqAGr2pNmC6hqhYRGAf3WoV+bK9dVVWpkioMnNjHsv64QZREZDMsBIQU+rJop9SLcvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790739202; c=relaxed/simple;
	bh=TJLOSsXrUic9FAQ3aWSz7VKwUFuzOGeQo+r0jZdR/wU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NoqDVhkdwLnO1e8vYf7s6kaEq3RCiFsrIf7/3DymeVif8dq1R9AReeIbvNttGkxzhNiuIgkFwF/EMRUViumUNHAq8QY8m7EJ7C9lMr7BRx9snbm/WzUnKezv41+EGIArOeZRf4TzdVcSFAZzCef+WN6lnW4xiLb3QacgGfslHH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nus/85k7; arc=none smtp.client-ip=74.125.229.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nus/85k7"
Received: by mail-dl2-f40.google.com with SMTP id a92af1059eb24-14beee9ff79so474240c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790739190; x=1791343990; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z5k7G2kLkYevUaZy+2ENCxK2AUYKBP2e2jNeXEWSJH8=;
        b=Nus/85k7++99Hd8LqeYeVFZXzfazaASjrKjIxKCjcyHjniKVf3nwiI2Cv2wEX+OYwj
         3WRzNoudiPwNtZCKOGSKwB/7Ly2BDgnWq3Du+BAgXDjha7HJYY2C2gh3nRMFDbHKtfOe
         VRgXSyrchESXPcH14cJD4JliOQ7C4zqWGXzPWCfCJPhe4Zl4RkF+qDPWZ3BYkJT+ulsn
         JBd4P24NuJKBudFXnm0af9vNNUlaSlhMpj5oTKc9hyXVjD+eGwM4z0qFlUaeEvJf+OR0
         YY/PHvK4vzKnuLk8oK6OKaT49N72ryi3cCuRKpA0o++4mGdPxDOthanSa/WgQRvVF4zg
         XSeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790739190; x=1791343990;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z5k7G2kLkYevUaZy+2ENCxK2AUYKBP2e2jNeXEWSJH8=;
        b=tpuQjbvfxNNsdrvcPavTwCQHgfEvUG7QXuxPp0W5nEBXLnkKgnD90r1qhJK17b1c+c
         b9e/i1ChyATrjtR8WmXLVwkI/02mZLEpz0BDjOhXOElAZEK9qRQj1BlgRGguu7ehbjIc
         rPpcozDIDXdotsPXVlXNFJAYLjSwK7U4OBetH8lGvSHQmu/XxHBLnmwGYiCt6IFR02yn
         V+iAUsLw3gTkxWyeWssxWcHYJJOlbadiwtjMGD59exSQV9wWdHxN48dNZYGv3FOnW3Tm
         My6aMUFbCtuw8/3BRB6iNC+ZhDSw1LkfECqhxAlLMrxAkR7Y0oCy9+fGZ/KAQ7t33ZYq
         TYBQ==
X-Gm-Message-State: AFuF++mpU1b2iePPbi8bk/T8fUp8GJpIVQgAQ+JnXHJC9BjwPr8UoXNR
	DXLAwDLcFHdgKM8JjO3+MGyPxtUlMvSjA7Vs8Mls9IsDmgVXmZi1vbPi9hVL+w==
X-Gm-Gg: AYBFou1MhtHTB32MBNktReP8UJEYUxH2/P7Lp4K9O2OOYFo68uT0fbQEjb9wiE8JiDh
	ykn7FnLlDZwx4aX2BoJkie+hUdW2ExpVFXgq7LaSSnbmAE/SxYIpSHfXiiSZNBB/FA2jlE7kv8g
	UbgRIeTzxR14vb49ibVlAMR0WZETl2rcAmCXOEcgkscvllCLGcmKcaMn0vwJLpv9LzwH92gazGt
	X6jq9uXW9tK5mDjTd/fyoYykZaWVJIbS4h4ACd+OHunXu71eg1pYCJsQGYzuu+QGKD0MW7UmEdO
	+doUCgAnj1UBA6D4tQEVfnMs2BE+zkaIX+r03WyaNW+zrjdtdF/DRGgcB7SOIbr14F266PtXsNV
	2OpWkJSLsmCeryhQR6b/SALKacgpodgqZA1uXpr4CC92OeRr9Nx3Jy+ZaInPeZfVrH0/HDh0vAA
	If7DKT+Nc00hhBPcSLPPY6QUNoEU8N/E+Pz8CyyhwDmAbInNJYzIVsf8GPnMk45stMvJhRn7Evd
	YehUM7QMp8v1qzICpxt8q0QpoYSzpL+tAdVZXc23SQFcPQGVjmk7FqRrVxGKKh4mT9BXzLJfJsf
	qGsHcIzJnocpTm9szWMBZ8FEgWjZQTgQrQCrMJE=
X-Received: by 2002:a05:701b:280a:b0:143:271a:308 with SMTP id a92af1059eb24-14c9fdbf774mr1394103c88.46.1790739190026;
        Tue, 29 Sep 2026 20:33:10 -0700 (PDT)
Received: from cp-amitesh-Precision-5690.. ([2402:e280:411f:685:bb4e:8bc5:3754:5034])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf5b3ea3csm162933eec.23.2026.09.29.20.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 20:33:09 -0700 (PDT)
From: Amitesh Singh <singh.amitesh@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	andrew@lunn.ch,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	Amitesh Singh <singh.amitesh@gmail.com>
Subject: [PATCH v2] net: dsa: push hwaccel VLAN tag into payload in dsa_user_xmit()
Date: Wed, 30 Sep 2026 09:02:39 +0530
Message-ID: <20260930033239.57093-1-singh.amitesh@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When a socket buffer has a hardware-accelerated VLAN tag (skb->vlan_tci
set), the conduit NIC inserts the 802.1Q header after whatever the DSA
tagger prepends, producing the wrong on-wire ordering:

  [tagger header][802.1Q VID]

instead of the correct:

  [802.1Q VID][tagger header]    (for taggers that follow the VLAN)
  [tagger header][802.1Q VID]    (for taggers that precede the VLAN — broken)

This affects any platform where tx-vlan-offload is enabled or fixed:on
and cannot be disabled (e.g. imx-dwmac). tag_rtl8_4 and tag_sja1105
both carried open-coded workarounds for this; rather than let each new
tagger rediscover the problem, handle it once in dsa_user_xmit() before
the skb is handed to any tagger.

__vlan_hwaccel_push_inside() frees the skb internally on allocation
failure, so returning NETDEV_TX_OK on NULL is correct. Remove the
now-redundant per-tagger copies from tag_rtl8_4.c and tag_sja1105.c.

Note: tag_lan9303.c is unaffected. Its xmit path never inspects
skb->vlan_tci — it always writes its own fixed [8100 | port_index]
header regardless. The skb_vlan_tag_present() call in lan9303_rcv is
on the RX path, which this change does not touch.

Signed-off-by: Amitesh Singh <singh.amitesh@gmail.com>
---
 net/dsa/tag_sja1105.c | 10 ----------
 net/dsa/user.c        | 13 +++++++++++++
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/net/dsa/tag_sja1105.c b/net/dsa/tag_sja1105.c
index bfe1f746f55b..57bb9360f9d2 100644
--- a/net/dsa/tag_sja1105.c
+++ b/net/dsa/tag_sja1105.c
@@ -244,16 +244,6 @@ static struct sk_buff *sja1105_pvid_tag_control_pkt(struct dsa_port *dp,
 	__be16 xmit_tpid = htons(sja1105_xmit_tpid(dp));
 	struct vlan_ethhdr *hdr;
 
-	/* If VLAN tag is in hwaccel area, move it to the payload
-	 * to deal with both cases uniformly and to ensure that
-	 * the VLANs are added in the right order.
-	 */
-	if (unlikely(skb_vlan_tag_present(skb))) {
-		skb = __vlan_hwaccel_push_inside(skb);
-		if (!skb)
-			return NULL;
-	}
-
 	hdr = skb_vlan_eth_hdr(skb);
 
 	/* If skb is already VLAN-tagged, leave that VLAN ID in place */
diff --git a/net/dsa/user.c b/net/dsa/user.c
index 041f9060c8ef..7c178634228c 100644
--- a/net/dsa/user.c
+++ b/net/dsa/user.c
@@ -20,6 +20,7 @@
 #include <net/tc_act/tc_mirred.h>
 #include <linux/if_bridge.h>
 #include <linux/if_hsr.h>
+#include <linux/if_vlan.h>
 #include <net/dcbnl.h>
 #include <linux/netpoll.h>
 #include <linux/string.h>
@@ -935,6 +936,18 @@ static netdev_tx_t dsa_user_xmit(struct sk_buff *skb, struct net_device *dev)
 	if (dev->needed_tailroom)
 		eth_skb_pad(skb);
 
+	/* If the conduit NIC has tx-vlan-offload enabled (or it is fixed:on and
+	 * cannot be turned off, e.g. imx-dwmac), it will insert the 802.1Q
+	 * header *after* whatever the tagger prepends, producing the wrong
+	 * on-wire ordering. Materialise any hwaccel VLAN tag into the payload
+	 * here, once, before handing the skb to the tagger.
+	 */
+	if (skb_vlan_tag_present(skb)) {
+		skb = __vlan_hwaccel_push_inside(skb);
+		if (!skb)
+			return NETDEV_TX_OK;
+	}
+
 	/* Transmit function may have to reallocate the original SKB,
 	 * in which case it must have freed it. Taggers will drop the
 	 * passed skb on error.
-- 
2.43.0

