Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793656070;
	b=46YPGTQeBGwzk3uQEP68BiG5v8e0FfYzer9a5c/Ty9zdewaj7Tm5u/FNp/XStKYM33fK
	 eQ9mNkTjxXGXsxEsEQ1Y9QMQM0kSZpuft3RtiG5I6+oOKyX4HGekYtCT50Rgo0Pz5RYav
	 GArA98YHD24Y+JOQgyPF6UnbSsT4OpwgUWfCM6M3kLJ35+cbI6chku61D9d9teX4oxHlk
	 qCgTcgtus++B1ygicy2sAIaw4fSATVYcCxzgnJQrcXf8Orh2GdIDIAR9G0aNfPm1RNGDp
	 +NWsJ/eESCddLpZVjkwbCheFJQZQG8lr7bvVI0pZeZmJ80AAFhtgy/obHVcZs3nDFzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793656070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cd5wWNullUB7y6awi0QqpF0THbdju3RxqFPzvSH65a0=;
	b=HBElAmJG2+LNtFRHlYzGC+j1a6IDs710kAg2olyU9wgwgYrB+PCE00yoplnEAy7O6FgR
	 dlQqYztSFTgvpJQCuTmPRE1SQJjBONXZkxRjN/9YxUTgM5mcwdunw09X5fSOwxawEDEcN
	 glX/hwE/KsGFf5gfRBPWq+4pzYt1KNcby8ycyM07f7BBf79YcoovNM4HSWXBY62s/ciiB
	 R3Dn1pr3qgP1cOQjCRotHNE9Y4dfvdm3T4VOjZBrJ6jTGkG0W2gmnAw+MLcPxY9Hom5Tw
	 UE+c536eESW3jjt671hXQN3DtO6cTsrZ6J3O1K8kp3VA2sP5TiAekpXdlYE9QzTC6LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="BVJr3/NB";
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9850606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:47:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9850606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BVJr3/NB
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a06c60065fso2437617b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793656069; x=1794260869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cd5wWNullUB7y6awi0QqpF0THbdju3RxqFPzvSH65a0=;
        b=BVJr3/NBC9SuLuasSslZeQLV+Y+8lCvDd/W53fZu/MgVJTrlXnrW5EoruW/yd2ALUp
         J64A7sfkFWWV4id6iyFgzXRTu+T1uWvyQrvUv9FOSyBW2lncIgzJD6NhSL0/w7gBMo3z
         CqxKvaehsA1+7tfDZDtGz5UWK3NO2pjOhPc6zFyJxL/B3NR+g9MxXXpugQxbHFD/MgCP
         KuzUXbkvODwj38V+VdDywQjBK6zFLUP6nSDIe2Q3JEkNs/t+EjDvFygVhAhs5I1TyYsD
         Z9dhvBs5Ui/NiYCXzxZ8kPkxTvjdqEO/sVEl2nSD0KaaTleYovwRt0RknSgm1QDxRP+P
         gwSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793656069; x=1794260869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cd5wWNullUB7y6awi0QqpF0THbdju3RxqFPzvSH65a0=;
        b=2IsoY2K3/15aKCLSV345LmSSSYtShpNNGjRDhtUV+b8tpreIIZqoR23ZZjlXEoCwPO
         beYU/noPBj7C8NAzmDD0NdOPqj6FtxzuhLiRr8TD+Yylaa88l4bANdLsnw7xR6QYu5CH
         +CjZ22ppQFNAHEzN8AoxUl0jgGwlOlxmH0mJCOUicNAgPijIFXdTVEsf28ggB2xmDeaj
         CCVmNB7QN0M3jfFpt9Vx7eXtePRrsO7sGGTFextyD9rSJ0Bvkyshyg+xbkQMYnVot/M4
         6HJ+GSqifKegycUmg68lfgOZp16+xtGlF3eaNXSFWO4srKq3BTFKxN0ZfCkRkf5yUege
         J7eA==
X-Forwarded-Encrypted: i=1; AKwUvBwnu9VJO3yCBIEtvAu/w1mcgs6AGsmQ2dLKgRScXMxSfHtjozvH0fd3eR8MpLXEICNvMU+DNC8hbmFz5JY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YmTpGHNggTOrRkM0BJQcwfwdj39cK5GVcTmAzOgSdJEQ1zsbv
	wgiRn1wMy5BpEglHBJ9aaY9JZZEFaAV6Tff7UoKIT3XpviV5kT/N8Td8T2SZfw==
X-Gm-Gg: AYBFou3CrjtD8RCYMMvIOsv30ALsKqwI+dTO5Z7BHymsoRPRPzMdUPOLcs47mZqwnOT
	qAvCrQVT+Lq6qz9qipOMMEzts1//ewt9iTOnWgPOPt3Gw5ZbGprVNQnIS2qrpoo8FZNf8UZzshG
	c4X12IfasmDqpEWwMoDyu7t8Cm1aZLXnLRJDJ2c0OOsRrZ1aYcyK9CYtBZzeMTuHoBd4kywdAdH
	/E32l1YXUgaYBs9uKQzOBZC79KfV+cvDrTwsGsULPrtzCVXtXDC1IT2IG6U724lRTtKR8nTMiUQ
	vRoNdc4821NPToX8vfM4gs07pVhVwT9QdvwzzhOSgZ3z7Mu5mykSrPze8ODsVcCt4nuQByuUgqB
	ey6ATNB7tyFw0r7bz2pSbDhynQfqAimUSkTYVxM0r6sr2VZkfBOUS76+X98i3n3AZr0o0z6nai+
	mMoUTJ6V5fou1iurZF+1J/EOaeBPD5KF8rE4LhbIqQhK8pEutdObjnutfeOQ/o5FJDd5KpqyyYG
	GnUY6YN3JVtp7dpeg6AynPtgkt4PnJH8TSoujbrZOdEut6iMXA5E3YYCZO816mfhlmGl50JMlCp
	Max4AiN4lIHBDmqeMFJsxt9SzfoVNcsivVKT9m5TNT7IU8309akSAwZMWpqT81m6x/z1Uk+042N
	W6tbem7GAM8PccVpXuzgaysxA86vF30DcLyaaB46CbpVacxnQVGBDocaboLSgJhmPFtSm9pdonL
	aHaw==
X-Received: by 2002:a17:90b:1644:b0:3ac:17c:6e85 with SMTP id 98e67ed59e1d1-3ae897c94ddmr9363563a91.47.1793656069127;
        Mon, 02 Nov 2026 13:47:49 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6b3493sm990553a91.13.2026.11.02.13.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 13:47:48 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net] net: bgmac: keep the maximum RX frame within one RX buffer
Date: Mon,  2 Nov 2026 13:47:46 -0800
Message-ID: <20261102214746.9274-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Each RX descriptor holds at most BGMAC_RX_MAX_FRAME_SIZE (1536) bytes of
frame data. The MAC, however, is programmed to accept up to
32 + ETHER_MAX_LEN = 1550 bytes in bgmac_chip_init(), and up to
32 + mtu = 1564 bytes after bgmac_change_mtu(). max_mtu is set to
BGMAC_RX_MAX_FRAME_SIZE - ETH_FCS_LEN, which leaves out the Ethernet
header and any VLAN tag, so a frame at max_mtu does not fit in one buffer
either.

The DMA engine is the same dma64 engine used by b43 and brcmsmac, which
continue a frame that does not fit into the next descriptor's buffer.
bgmac_dma_rx_read() does not handle that: it consumes only the first
descriptor and parses the continuation buffer as a new frame, taking its
RX header from frame data the sender controls.

Program UMAC_MAX_FRAME_LEN from the MTU plus a VLAN tagged Ethernet header
and the FCS, as bcmgenet does for the same UniMAC register, and limit
max_mtu so that the resulting frame fits in one RX buffer. At the default
MTU of 1500 this gives 1522 bytes. A DSA conduit carrying a 4 byte
Broadcom tag (MTU 1504) gives 1526 bytes. max_mtu drops from 1532 to 1514.

bgmac_chip_init() runs on every ndo_open and used to reset the limit to
the fixed default. Use the current MTU instead.

bgmac_change_mtu() also never updated net_dev->mtu. When a driver
provides ndo_change_mtu, the core leaves that to the driver, so the MTU
seen by the stack never changed. Set it.

Only compile tested. Not tested on hardware. Found with a review on a
different commit by Sashiko.

Fixes: dd4544f05469 ("bgmac: driver for GBit MAC core on BCMA bus")
Fixes: 752e5fcc2e77 ("bgmac: reduce max frame size to support just MTU 1500")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/broadcom/bgmac.c | 15 +++++++++++----
 drivers/net/ethernet/broadcom/bgmac.h |  6 ++++--
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bgmac.c b/drivers/net/ethernet/broadcom/bgmac.c
index 669eb7ce7d40..f29568a4190a 100644
--- a/drivers/net/ethernet/broadcom/bgmac.c
+++ b/drivers/net/ethernet/broadcom/bgmac.c
@@ -1110,6 +1110,13 @@ static void bgmac_enable(struct bgmac *bgmac)
 	}
 }
 
+/* The MAC counts the FCS in the maximum frame length. */
+static void bgmac_set_max_frame_len(struct bgmac *bgmac, int mtu)
+{
+	bgmac_umac_write(bgmac, UMAC_MAX_FRAME_LEN,
+			 mtu + VLAN_ETH_HLEN + ETH_FCS_LEN);
+}
+
 /* http://bcm-v4.sipsolutions.net/mac-gbit/gmac/chipinit */
 static void bgmac_chip_init(struct bgmac *bgmac)
 {
@@ -1131,7 +1138,7 @@ static void bgmac_chip_init(struct bgmac *bgmac)
 	else
 		bgmac_umac_cmd_maskset(bgmac, ~CMD_LCL_LOOP_EN, 0, false);
 
-	bgmac_umac_write(bgmac, UMAC_MAX_FRAME_LEN, 32 + ETHER_MAX_LEN);
+	bgmac_set_max_frame_len(bgmac, bgmac->net_dev->mtu);
 
 	bgmac_chip_intrs_on(bgmac);
 
@@ -1267,7 +1274,8 @@ static int bgmac_change_mtu(struct net_device *net_dev, int mtu)
 {
 	struct bgmac *bgmac = netdev_priv(net_dev);
 
-	bgmac_umac_write(bgmac, UMAC_MAX_FRAME_LEN, 32 + mtu);
+	bgmac_set_max_frame_len(bgmac, mtu);
+	WRITE_ONCE(net_dev->mtu, mtu);
 	return 0;
 }
 
@@ -1555,8 +1563,7 @@ int bgmac_enet_probe(struct bgmac *bgmac)
 	net_dev->hw_features = net_dev->features;
 	net_dev->vlan_features = net_dev->features;
 
-	/* Omit FCS from max MTU size */
-	net_dev->max_mtu = BGMAC_RX_MAX_FRAME_SIZE - ETH_FCS_LEN;
+	net_dev->max_mtu = BGMAC_RX_MAX_MTU;
 
 	bgmac->in_init = false;
 
diff --git a/drivers/net/ethernet/broadcom/bgmac.h b/drivers/net/ethernet/broadcom/bgmac.h
index 6fee9a41839c..ace65789289f 100644
--- a/drivers/net/ethernet/broadcom/bgmac.h
+++ b/drivers/net/ethernet/broadcom/bgmac.h
@@ -2,6 +2,7 @@
 #ifndef _BGMAC_H
 #define _BGMAC_H
 
+#include <linux/if_vlan.h>
 #include <linux/netdevice.h>
 
 #include "unimac.h"
@@ -330,6 +331,9 @@
 						 BGMAC_RX_FRAME_OFFSET)
 #define BGMAC_RX_MAX_FRAME_SIZE			1536
 #define BGMAC_RX_BUF_SIZE			(BGMAC_RX_FRAME_OFFSET + BGMAC_RX_MAX_FRAME_SIZE)
+/* Largest MTU whose VLAN tagged frames, FCS included, fit in one RX buffer */
+#define BGMAC_RX_MAX_MTU			(BGMAC_RX_MAX_FRAME_SIZE - VLAN_ETH_HLEN - \
+						 ETH_FCS_LEN)
 #define BGMAC_RX_ALLOC_SIZE			(SKB_DATA_ALIGN(BGMAC_RX_BUF_SIZE + BGMAC_RX_BUF_OFFSET) + \
 						 SKB_DATA_ALIGN(sizeof(struct skb_shared_info)))
 
@@ -363,8 +367,6 @@
 #define BGMAC_CHIPCTL_7_IF_TYPE_MII		0x00000040
 #define BGMAC_CHIPCTL_7_IF_TYPE_RGMII		0x00000080
 
-#define ETHER_MAX_LEN	(ETH_FRAME_LEN + ETH_FCS_LEN)
-
 /* Feature Flags */
 #define BGMAC_FEAT_TX_MASK_SETUP	BIT(0)
 #define BGMAC_FEAT_RX_MASK_SETUP	BIT(1)
-- 
2.56.0

