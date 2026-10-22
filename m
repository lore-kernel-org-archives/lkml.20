Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792703478;
	b=B8fx+xEraX0SZXvnUDOtqTHF9xw+Aiy7Eu0WRgNa6da90VlA4XH+fhD/Wtyxqzt/09UZ
	 sdVENP/BVWX9eM3mkF1oHDvuPmeV/zdhA2KA6rOUHGlQd+G79mf/NyVOuXAjeb/Cs4UCD
	 eTGzZDfQm2KaIbX4bckPFagN/s+Ki/hjsseztHmClDAVM1wTcuouzGXazsLnVX0PN7veF
	 AsTSlqoYuVDqjZVkFwIvIQInQd0N5G+d2lspNLG/Y6HEB6ntKKJaf8s1BSKfQDuRL/D8z
	 sLKWmnUvrqjBP23RY/2Iwo8iZdLr9TubTXVHE36kH7LBebGIAG140LPb7NpwjRsr36A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792703478;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Jr5rPi7GIbeiqhpTp8DgZlKeEnkXJuQx6KaG0JPkgb8=;
	b=rg2TSBlOVH2UiUDacxsnub0ThLJD2sUGzeS6TOu50qzh3owpyvTF8Ewr3Id48vIbyDFG
	 g4+O4WrCNPJ9I4XPgyB1E21fJFNJBhfqBT5ni9GFUjTrOC+caTgYIAUqS2LOCVwK3vxyU
	 nUD90Kgkt11DvujWYOvY2Dwwosy1VwVPkbVjjALwsV2Y8IyIcjt3/1k+IPUGqUhb6fJRj
	 qtg7XkC1sWjHj9ZaQMhcwzTWOAsFZgsTKtqYtSA/Guv0OcZ91fnJkImWci7XmopC2ywKr
	 vTKTbPlGxGJ+twxT6JHQp8gBwugY01SU56SLyq8s7e4+xij75A+qOLuQfYzHYAS/fBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=fICpr8b9;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60147606A328
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60147606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=fICpr8b9
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so185635a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:11:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792703477; x=1793308277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jr5rPi7GIbeiqhpTp8DgZlKeEnkXJuQx6KaG0JPkgb8=;
        b=a+lYPAClmN/JVpe2JDZcab0aWx1GLvxvSEzhZ0fVnx4//c2J2hNZZ7PjTWHY+yiJf8
         19mPXWeACEuJ5Jf76d2yUNX2tPxEAbTHqbou2VcejD4u22plwBgx4cjVdMxSFDkX7mYs
         FO8/aAOaZPsWMpJGFQ67v9D+nCcY0fsZRpiCzqAegUybqma4JLBLqhRmGDBM7840XAt1
         PcL1GdFs8lqqfXvcN6cFFVb4YY7MWmN8QfG+7EF0fFzMO/jgiQNDRJyQEjEvHDz/GYRi
         AWYYBcYreqJLLoVfIyfJajRh9t+vAJn+hsNyPCWtI08z+Nx88KadutRz4NBLIAVIYx+m
         Fa3g==
X-Forwarded-Encrypted: i=1; AKwUvByFhB4j9ZrrwUcVHycRuIhI9oA8GX3TGEdHzetDHrJe3yEW3IyIpefBaCD4IGiXmvenEfBSP/07erSAOgQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZOsMtg2QgIPftUbUpGYAZQj9x4QEJtcl2yPwFCVegOTdMTsc5
	lwL21UPiCPgAkg5JY6PHPgmjr1l+op8ow3V42/CyRrJ9LNP6wOLvJv4JelkHKpMogSN0U8eUuAA
	rnqPyCNsmwe3+vlscyi0LjFVuTsMMfU2Bb8NStpAtQ1VsVGcC5E9eidXTkuZMmzrNRucXkNtkCz
	zRqKAyiYq08bix79E+BARINWPhJsm6+PhXaa+S8kLLu6NPPHMmXEsjuwiJcxXouYnImm8tBgdTw
	LVGmwFj219fyMQfiGd1OrMX
X-Gm-Gg: AYBFou3ogvSvKAwth47ym0j7ByF95leWtG/z03gGsNctl3D+7wXZPMvQnBV/BFJMHil
	mwojTh3ZdRe7OsT0TGZEkCPo1RvgxuWY6HchYI4mjelzapah4IhIOOUSTSOdqNxfdvEUxHaGqOD
	bYuY/eSOH3/NjYvJ4AYPE99hGMPkfETNwlgYkZAmU2aakJMqu8B+5sVMFeAIRUF72kG5TweKzOr
	a9KlI0cCR3LYLkfRMSBGdFjMDfoqniCC+E7Op1kgl3+RpNx9u8nmDJunM02rTzitPkD69vB87kg
	KlKy6lSkQIqDDNQl3Mydiy+GuZ0Wu3EZhiqmHeGSTDj7TLajXNT66IYVzxWPPKZu1xAo+kTgLmz
	aeUPm60pXf7FrjveMyEruBAdwc5CDWMP8ZQLC6R76BHdOMo5HTIY+wAoH0nTaJeTEzFUEncnVQ3
	Y9wYa9efaMkzrc8Wcle4HGP1roTo6fBhW/2DQb0vPR/gE=
X-Received: by 2002:a17:90b:4a82:b0:3ac:adce:60af with SMTP id 98e67ed59e1d1-3adcdfaabd9mr134811a91.16.1792703476742;
        Thu, 22 Oct 2026 14:11:16 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ada48e65fesm2806375a91.4.2026.10.22.14.11.15
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Oct 2026 14:11:16 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-535252004e9so4368471cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792703474; x=1793308274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jr5rPi7GIbeiqhpTp8DgZlKeEnkXJuQx6KaG0JPkgb8=;
        b=fICpr8b98arY9j4CeUVUbMjpFnr42tgtuY4Tlq4yHpAs8fUSx/lDkTkckAGvJkfF2M
         jpoyy8EHA3X4Y5mAcdB1eQyHn3MzhHKmhzxEPWNfjrg1Q4o9KN60Ob2nCvsdn5L/j2Jw
         u25KmX6fDeU+hMrS/Puw5PfRMxsYWG+KHXKFA=
X-Forwarded-Encrypted: i=1; AKwUvBzeZzE8p44IhnUYhVgpnTdh/fek+KsbIninOVsR5zhHI/Ya+piVnzZUwZEpz6LQe0TCHPC0sETuyZw/3yQ=@vger.kernel.org
X-Received: by 2002:a05:622a:647:b0:536:64f4:45e with SMTP id d75a77b69052e-536c259a058mr2372991cf.50.1792703474518;
        Thu, 22 Oct 2026 14:11:14 -0700 (PDT)
X-Received: by 2002:a05:622a:647:b0:536:64f4:45e with SMTP id d75a77b69052e-536c259a058mr2372651cf.50.1792703474145;
        Thu, 22 Oct 2026 14:11:14 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c396afa91sm2472036d6.11.2026.10.22.14.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 14:11:13 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v2 1/2] net: ethernet: bgmac: preserve forced 2.5 Gbps link speed
Date: Thu, 22 Oct 2026 14:11:03 -0700
Message-Id: <20261022211104.2091128-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261022211104.2091128-1-florian.fainelli@broadcom.com>
References: <20261022211104.2091128-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Northstar and Northstar Plus use a 2.5 Gbps internal link between the
AMAC and the switch.  BGMAC_FEAT_FORCE_SPEED_2500 makes bgmac_miiconfig()
configure that speed, but bgmac_adjust_link() subsequently replaces it
with the synthetic fixed PHY's 1 Gbps speed.

Use the forced speed when processing link changes so the MAC remains at
2.5 Gbps.  Together with configuring the switch IMP port for its 2 Gbps
mode, this eliminates the output queue discards that caused approximately
1000 TCP retransmissions per second during an iperf3 transmit test.

Fixes: f6a95a24957a ("net: ethernet: bgmac: Add platform device support")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/ethernet/broadcom/bgmac.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bgmac.c b/drivers/net/ethernet/broadcom/bgmac.c
index 3e9c57196a39..11487ff48e0d 100644
--- a/drivers/net/ethernet/broadcom/bgmac.c
+++ b/drivers/net/ethernet/broadcom/bgmac.c
@@ -1415,11 +1415,15 @@ void bgmac_adjust_link(struct net_device *net_dev)
 {
 	struct bgmac *bgmac = netdev_priv(net_dev);
 	struct phy_device *phy_dev = net_dev->phydev;
+	int speed = phy_dev->speed;
 	bool update = false;
 
+	if (bgmac->feature_flags & BGMAC_FEAT_FORCE_SPEED_2500)
+		speed = SPEED_2500;
+
 	if (phy_dev->link) {
-		if (phy_dev->speed != bgmac->mac_speed) {
-			bgmac->mac_speed = phy_dev->speed;
+		if (speed != bgmac->mac_speed) {
+			bgmac->mac_speed = speed;
 			update = true;
 		}
 
-- 
2.34.1

