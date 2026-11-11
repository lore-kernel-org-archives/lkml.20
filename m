Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794357012;
	b=ARauERvu8gUbKK2jDRPPE3nUKkwXJDNR+4BmihSP10b2AeQn01eYM5mJwg8QNb2d6Y5J
	 463BqY7OF+/WVgIpvY7ecZ8NhJ8pH78xq677aMqJofHVy2UyKtwMflReHHRSVZcIsDmzX
	 zy/fz4XOZt9Ttbhhve/uSHSZNkOYNvIUb4JhAS3K4Nf5AptLgaozXxJjdpcxqJciCj+CW
	 ufaxhPo6AGiQdTfBc4wc8oxUcYUPhtJYO2wrmUKCuDWuEWqb10/roIIXbi9yR68gJqh+O
	 CTe8ZS7n0CDJXKRS+wfEri7246UCKQKnS2vcEZ0VqyE59EHQYo60Mq2A4VF13njrdHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794357012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jPW4ngXyg6cTdezM/57s9UolQe7wlzejSFpNDi23C5U=;
	b=O1mEKfShi9WYjzyMEtMrdnVeDMdaxaQh1y+gQI4mb5OMN2dmIggFfZaTULuoU2sJPDzA
	 ck9vdNSKYq6u8flSoUxGGDF/A2vO6LEVlU6wgA3K2ihrUpXUkHCJYZf+fRmTptn8TdLzQ
	 IgaNd9ky96W0eHe0y4md7+xHlmd40EPbfn6570ZObK+JfSWtIUpky266ILpdtgi+AARHD
	 VtMikG5NeYEZkx7ESExNWNtrBIsUJzXtiCwM+Ih1jDSR2/QnDKSWXF6lOp9RSVqIg4mqa
	 ZrH5zwcP1SehtVtFlh4JvcsH+1HwVAzBaZR3GT/OLck51AAHun63TA2oY9e+/y/k0Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OPwPDdys;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E87606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:30:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24E87606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OPwPDdys
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a07078200fso1116082b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794357010; x=1794961810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jPW4ngXyg6cTdezM/57s9UolQe7wlzejSFpNDi23C5U=;
        b=OPwPDdysdP7qPYtq5WHgl54tlwl5qA9toVgQA4dVp82UWlPZVQqBJgMJJtVUtc+YzH
         3zCFRqsyO5AVa4055y3f2eTmPdudak8BHbJ/7C2/9zQ2GXqKHnQvIqA9DnrDj5a0Gbez
         JrqZj9jfd6BNa0zF09V38QqnVXOf9aYcNLHy0i1dmYPupzFMsBzZoNaA9lhvA6j8ijRQ
         m8Ca5b3uubEKO6DXfMMK12Ry45RrMi+Yl290mjRRWofPcy+ApuslAhudEQZb4DW8Ur+4
         GvFVpvnXjEO61yOWHZ/AXefkXI1d6Lgi2mz3I6CHO3ODxSCMB/oUNEyfTWxrRVuoRWCN
         CmMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794357010; x=1794961810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jPW4ngXyg6cTdezM/57s9UolQe7wlzejSFpNDi23C5U=;
        b=s2w34d3dUgr234lLKbQanP9mCWptrmzvoLe6WUjfEO/pWOKBMqXkEBitGe2niR5DnZ
         jbVIdV43aEbmFTO5MEBwpSM9QHBIbSaHfHoGlxewhP36VUAM9D4fbRUh6CSyhv7/1zR0
         5xwukUWg6LQGbdx1dQhkPFMgV09B2AebObh1tX/tdtRjx2H3098ZL8es/9tIjG4CWjAr
         Kpd+GMrLJ4D63FeLebq+WaQFv6qRQResi0qwE8mR27moAsdU9a/Dx1mSkE9S+ngX3cmz
         oSividh5rhpnLH90TC27KjG8v1surc8QWQNtxLFZiZGnpskh6l17MrgAOilh1KCUFjns
         HmGA==
X-Forwarded-Encrypted: i=1; AL+hErFu7vFHuQlCnn7nJ/9ZYAIYs9UkJ4fgxR5pUCWpv7vR12ahbotQD7UugwZfpK+DrDf8nkMxKgHo1rUpwxE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AuAg+qBDDWVyMEH5YVy/Vk8jWZKnP1zXJ8v7rxCIbdR69jptZ
	4zV2M0+JqV95W3Cu+CdTVnnL76LJr9M98N0leS2rrlUxdepTCIIMkJz1
X-Gm-Gg: AYBFou3d9Gfu7XMt1zb52RC+2mvhEl8xYV4nb5B+2/M/yrzni8Rvy7kHxZG4QHJZI39
	G3IJPl+K116Ow3So76SIpOv7kpMm3mdTx6J9UNEuHdv1d/QiZVWCK/yaG5G4wZE7V0iufXD+mm7
	pEqUBvwoccwOLLzrKDCUc13Vde2xiQe5qmfzR9goHZPP3oF8nDIFDNUXCYwoVGcu1NSn3f4m/Kq
	PTtgCZ48+V2DI2/wbExkNdEm7GgQ3+Ha1d4nns45QA8J3tFsCTBNW4zbwAk3riyz9lUm0i4NDlR
	L88QrlZcbPWxr6gLSWbBms/iYgEL3TYf355nXje3q7mIze+gv5ZkqLseHmTIDjWknnAqCGKLDfO
	aC80XyJY/TBQEXeYTDhH0ytTV39fn6Gdqt1xOfpB/ipcQARbN08XTrqhdHJKRoD6ILWQLLC2MaI
	r6FBLsDaCY6pyhcqYin2CPxOvmAxv1/XJdpXSUZKe/tpGu/2zPctp4aC3EFQSSZsoSB9tsDmHCG
	MuK1Ubmp1p+/vHbFn7ShK48AyGD4MfEoRnOh/BrjBUgi74RmIj6Ndfu1fxsgzviMmfj/fHG62JS
	h49GYo5AqJM/ZEllKAZgrQojqLoC5bO4Pe4Umj2PhdtAF2oP+WtL2Btpcq2ds2Mb9wPTQh1A/FU
	MGr0Rr3sZ8FRsgTuji9uabAZ8sH0v+Z91KTv3G4rfmglFZD6gouejv794UnouoaQ0gitsE536hF
	esXA==
X-Received: by 2002:a17:90b:388b:b0:3b0:b36b:66fc with SMTP id 98e67ed59e1d1-3b182fdf9a3mr671597a91.63.1794357010270;
        Tue, 10 Nov 2026 16:30:10 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17dba5ed0sm1693588a91.17.2026.11.10.16.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 16:30:09 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net] net: ibm: emac: fix fixed-link speed and duplex
Date: Tue, 10 Nov 2026 16:30:08 -0800
Message-ID: <20261111003008.960305-1-rosenp@gmail.com>
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

Since commit d99b408ed8e5 ("net: phy: fixed_phy: remove not needed
initialization of phy_device members"), fixed_phy_register() no longer
copies the fixed-link state into the new phy_device, phylib fills it in
once the PHY state machine runs.

EMAC never attaches or starts the fixed PHY. emac_init_phy() copies
phydev->speed and phydev->duplex right after registering it, so it now
gets SPEED_UNKNOWN and DUPLEX_UNKNOWN and emac_configure() programs the
MAC and RGMII bridge for 10 Mbps half duplex.

On the Meraki MX60, whose EMAC has a 1000 Mbps RGMII fixed-link to a
QCA8327 switch, every transmitted frame reports carrier loss, the
switch CPU port counts FCS errors and nothing is received.

Take the fixed-link parameters from the device tree, in both the
"fixed-link" subnode and the legacy property form.

Fixes: d99b408ed8e5 ("net: phy: fixed_phy: remove not needed initialization of phy_device members")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/ibm/emac/core.c | 36 +++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ibm/emac/core.c b/drivers/net/ethernet/ibm/emac/core.c
index 9fa18ad99f4d..f097b6e49eeb 100644
--- a/drivers/net/ethernet/ibm/emac/core.c
+++ b/drivers/net/ethernet/ibm/emac/core.c
@@ -2696,6 +2696,40 @@ static int emac_dt_phy_probe(struct emac_instance *dev)
 	return res;
 }
 
+/* The fixed PHY is never started, so phylib never fills in its link state.
+ * Take the link parameters straight from the device tree.
+ */
+static void emac_fixed_link_state(struct emac_instance *dev,
+				  struct device_node *np)
+{
+	struct device_node *fixed_link;
+	u32 prop[5];
+
+	dev->phy.autoneg = AUTONEG_DISABLE;
+	dev->phy.advertising = 0;
+
+	fixed_link = of_get_child_by_name(np, "fixed-link");
+	if (fixed_link) {
+		u32 speed = SPEED_UNKNOWN;
+
+		of_property_read_u32(fixed_link, "speed", &speed);
+		dev->phy.speed = speed;
+		dev->phy.duplex = of_property_read_bool(fixed_link, "full-duplex") ?
+				  DUPLEX_FULL : DUPLEX_HALF;
+		dev->phy.pause = of_property_read_bool(fixed_link, "pause");
+		dev->phy.asym_pause = of_property_read_bool(fixed_link,
+							    "asym-pause");
+		of_node_put(fixed_link);
+	} else if (!of_property_read_u32_array(np, "fixed-link", prop,
+					       ARRAY_SIZE(prop))) {
+		/* legacy <phy_id duplex speed pause asym_pause> */
+		dev->phy.duplex = prop[1] ? DUPLEX_FULL : DUPLEX_HALF;
+		dev->phy.speed = prop[2];
+		dev->phy.pause = prop[3];
+		dev->phy.asym_pause = prop[4];
+	}
+}
+
 static int emac_init_phy(struct emac_instance *dev)
 {
 	struct device_node *np = dev->ofdev->dev.of_node;
@@ -2730,7 +2764,7 @@ static int emac_init_phy(struct emac_instance *dev)
 			ndev->phydev = of_phy_find_device(np);
 			if (res || !ndev->phydev)
 				return res ? res : -EINVAL;
-			emac_adjust_link(dev->ndev);
+			emac_fixed_link_state(dev, np);
 			put_device(&ndev->phydev->mdio.dev);
 		}
 		return 0;
-- 
2.56.0

