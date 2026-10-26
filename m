Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793048836;
	b=jg7pIq1rSm0+cFIFrzIUoFBWIPh/Rgx3BikOAMSlyeExW5tnWSWK8kiv1O7OxbKLz82p
	 qKsaryTxqaaao4FLQ9o1dDVp075Cp3UNEhN2mSaJOWLf8/L9tW4ShkB3a4Gg7rENQAKj2
	 UeRU+QGFo4uwhQMmtVAypL7MiQ+T56Ha1dTJRjJFGAiqUfVxMu1xrGWgvA3KwqvdguCSL
	 LAmFuUx4eOHc9X073n2AGRw8YUs2qMpWwZuJPuqCK61oFJPFyqSq5NuJ5nAJTJ/4gGbdy
	 XZidoVZkfG1TYp2sVCKhbSlgDWBAJ/ccmwTQUuwf4W8GB7hEpwJM8urNdV8hdbhkc9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793048836;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=HopYss4iDrkEwjdJIVLLh7fS7trael+HjQMhbwq1Pqk=;
	b=AvNUd2SF7PmbuYqBdDWX0zcKIPyq6iLNz7BraBCTLuJWBVGcM2BilIKfvBsggyr8POIU
	 0JxQ2U2nhGH5RugFq+br+45pIpDbS4cmLHxbzr8v5MWBy7XLqc7BocX9z308BPy9sa6hQ
	 MDGNvV4DIG1mWd4LNtS1mdtJLm2R2q6P166Q/kKXR3qqYW+7YciKraI0Pf38gEqX4qQLT
	 GU/3wftcHOSoIC7CuNVlv+1aj/1DzueTv7MKm55MrYT+rUsTP7zZm5chc/DRLKKWsLF75
	 k5TDN7nD1bVarDS5aC7Y1ZJV5jXSh06j2orzyarjunMP7dGhBadm+aNfYupQOIoHtZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=SJRh6S2c;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5192C606A33B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5192C606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=SJRh6S2c
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so1415567a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:07:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793048836; x=1793653636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HopYss4iDrkEwjdJIVLLh7fS7trael+HjQMhbwq1Pqk=;
        b=YSv1CJypd9Fx5sXt13lzwMGribS6eJ8j3jKQK0HBJu8xMnc6vB9Cb9fCjymRZpYLWu
         Q1v+DGtdZaEczfP8yk+fKichqzw8WVVphIC1ELMtiYYbcWTFHyIWkSIwMkJJbt0xx65C
         +dQ2V6GMrx7oNYILAu74kl8WepNQ8YIMMuCnQrmpw3y9X0WBi3Il1dr8a99/YrE/DqJM
         oiC3dzhycJ7cmHxBHCrIOIOPerLEqK9zZoXRcincd0F+FSH4tmj+rIkD0xjIyPqi7flR
         Ou5WoV+g3x8h4mv90BTzp0JM7us86c+KDcD/RgKMsLMq4qAu+NpmkZTBgMZfFOP7Rd+h
         P5IA==
X-Forwarded-Encrypted: i=1; AKwUvBwPlvywdLvLKFwOcgDidQFJuwZhKB0nrcdmNr7df3SBicE95QMeb8Qr3hKdRuOPBJ7NuaY/qX3R+p5IBqw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbOZBfpyLIwTZQ7BmnKJcM7T2riTrXddBYztohwnDX2x1HKP8L
	IHRjlvpdMci7mpH92+SM6xKVIupaRjUHWQoUKVr4eAeJI8kDwsLhUDyb7rPm32iSXet+6cqurvm
	DgaSju/JV+3ALYw2bvXA45R47cdMh+s88B3zDRxlFiWytACl+dyTsTKmg+w42EnKiaX5B8juNwu
	H+8Fae0PkossvdpsUYDTejDEzUCwVl2+Sa2gd784ElK2B+Qsnou8pZ+JXWZANHh7vrylmhzHnTY
	mTq+eGdd2NWBQCTAtMNE8r2mkY=
X-Gm-Gg: AYBFou1fOr33tNA5q3vcooN0NxXhK9zc1mMY7Fvd84nNRLeIa5JhEj2VPOWYVozAB1R
	0SXJV6zkL+4TqjH2YkDAwcEXCzqNJlljmH/8eqIE0fvooHaBR8GC/DTuiy03dpd0D7LGDuZEMiS
	eEJQXKRCToAkCpX/cx2ls/n85n6Oo/S+W/wo1MZWBd5bIywDQU7uBg5mFtbWy6J3fl5DMxcZV1J
	DzKp6A150X62G/ujds63nkqVczvYeJoqMx/1DRxr/D8rR5nr5kh74Kj353ESAK6IDgwg5w8rsZV
	vYBbzqmgwOawyKPRKjz7ZVBIPHGehoJ+n50NFzhxFM/eNlVusKwPStSF1mRR9z6uw7nrj5Qb1VV
	nAbP3MFGvrLXrjK7hHByI7lOTrARExLdko014sYXYJTzMiTug+GUeLI5CumnZAcVe20foi8GMCA
	GvkcvqVmsNg8ba5hQ/JxRLMCqtSKAKRHvk9vsgO3HjFe0=
X-Received: by 2002:a17:90a:d2c6:b0:3ac:38dc:6b9e with SMTP id 98e67ed59e1d1-3adeaface55mr6990311a91.25.1793048835619;
        Mon, 26 Oct 2026 14:07:15 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae406dc8fbsm487751a91.1.2026.10.26.14.07.15
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 14:07:15 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d02df2bf09so24445085ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793048834; x=1793653634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HopYss4iDrkEwjdJIVLLh7fS7trael+HjQMhbwq1Pqk=;
        b=SJRh6S2cYRVKQDfoPYcPgm1hfL5n4fLOHKLqgD5DsBOiII3fQZvUUPaYnsX6bOyNr4
         qfJiOjFTXgisrCn7WmKUhtHiPg9pF2NhuCLarP8Ka2XsqhOtgFyXPNZ1kwacc9TDxmfE
         7o4uKfDVLbz+BX/DvpWcd9Y9R++elYMW45bIo=
X-Forwarded-Encrypted: i=1; AKwUvBxVHwLJoZ4thT7TGHOlJNFfq/625jQDHMeTzWcHnqqWKKVma3H5Uto+ZZ+FOgmnGamKfvBDDyyDU4uXHeA=@vger.kernel.org
X-Received: by 2002:a17:903:fa8:b0:2e9:5eee:e078 with SMTP id d9443c01a7336-2ea9c0f39c7mr56116105ad.3.1793048833750;
        Mon, 26 Oct 2026 14:07:13 -0700 (PDT)
X-Received: by 2002:a17:903:fa8:b0:2e9:5eee:e078 with SMTP id d9443c01a7336-2ea9c0f39c7mr56115955ad.3.1793048833405;
        Mon, 26 Oct 2026 14:07:13 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6ce5d92sm808245ad.75.2026.10.26.14.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:07:11 -0700 (PDT)
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
	Jon Mason <jon.mason@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v3 1/2] net: ethernet: bgmac: preserve forced 2.5 Gbps link speed
Date: Mon, 26 Oct 2026 13:37:41 -0700
Message-ID: <20261026203742.3198673-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026203742.3198673-1-florian.fainelli@broadcom.com>
References: <20261026203742.3198673-1-florian.fainelli@broadcom.com>
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
index b3a92ae95de3..ec879c203bc5 100644
--- a/drivers/net/ethernet/broadcom/bgmac.c
+++ b/drivers/net/ethernet/broadcom/bgmac.c
@@ -1417,11 +1417,15 @@ void bgmac_adjust_link(struct net_device *net_dev)
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
2.53.0

