Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84BB39CCED
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 23:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790293712; cv=none; b=t1LH6Z0S8kUNGez6vNsXWsWwaMkAarVYg0DqDqemLQ6nJNhbzdxyFqIlNe2fdqSYVQmomNWDPAarC1ZqS3nN7qAI2GQsaPEltzas/VzjWpWmbn3XjH+qiquJLXXzUYKncqTHYNIxp2iZAu/nxZad5zygHb2y/SE61PYG2/zGMN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790293712; c=relaxed/simple;
	bh=hTYJ14te7p3/8tBxHYBWaHZUm0lfhODe827miPf3xkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FKGraM4DXJWZn7pQTLwEYF1gYNC+5FPRmNuBRGH/AVxjjceDAwoJTRbKJg9X1xvePdhk5GBHJaBsPOMT1ZfHa9u9XXu8QvyvAOHQMySCpcgbO3iqXmNeWiCi3EucYwMeOGDl1H2eUdo3DIr8Gka6wTBOmigGGoCqTeDs/SIgO/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qBVFtLBH; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qBVFtLBH"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f7db0so35211366b.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790293709; x=1790898509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hTYJ14te7p3/8tBxHYBWaHZUm0lfhODe827miPf3xkE=;
        b=qBVFtLBHXgfqQCXXcoxj7qkzhAsEivvXU6kw4vyxa1TKK6wRL79uYkcq+a9EAl7nZI
         K0CaNxnX3fg+uHjmPuWaQXbTdOAi96NkVZ7QZ9ZC2X9Ik1W8qGh4vIpa+DxYQprpCug6
         Ex7gB96zEO5fot+yVby4Gor4bw5nNFpOVAcZm3s63cAV2ZmSpNPtJNS70KLVHozKDwqK
         WpJb4tTNMFAap7Rxtdgj+gx4tTB+iLHgXalyO8duI1sN5kVCOuxy+zcsShp0fBN4oX5d
         leZweJz501CDmXn8Dx+dqW0m8I5vAgg9XzoacPCPvUP3euVyoQ65UJOiXYyRRTdCh1X7
         4Ufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790293709; x=1790898509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hTYJ14te7p3/8tBxHYBWaHZUm0lfhODe827miPf3xkE=;
        b=P0W1NsWGqOTApnvItXgi7WyjfN5mH73kYhHIDWuceX2NTfKeKJ1+rfDVX9LWgEk3J0
         afRfjRcLq+Ps1vy/7s3m5guOuz/DYIcSOctJ1Pm2VVh+lJl0g6KRNjgwp9gbIFqvB0+E
         22Rk/JpOvIelrCul5hg4s++QlTIj/dEukeatA4h4OGwoemArbFoPc8cKkfzmxw29MpcQ
         ylZ64A43FFBWC3LHITCAymXjOHPDvmS51lt+lCBRzezaEPet/f58s3wgn8jNiKKG7d42
         rXy77tR5yWMRHfVpmKtXpAiOeN7TiXX0ZF7k8yRiA0WKBvvSMF1Mtn8SugP6jJ6vI7GY
         UBKQ==
X-Forwarded-Encrypted: i=1; AKwUvByDMDrB5m1+GFs3UqMmgeb4iBh+hWLY5ROtuKx28ttnY3VWn0EBAhjN81XFMxf2PpUl98FqS9KWWeqtM6s=@vger.kernel.org
X-Gm-Message-State: AFuF++mfejPFky+oTIlTAaSdhVWxodzswh//+wnYq3RcEOFnHhJuj0ID
	5p24q4PNeGFyF5MEBB2wM1ma7Il28D8CG6CxH0zC7N2n2QLTO+zyaOgJ
X-Gm-Gg: AYBFou02auM7vFpplaIwLqnCXSnH/kF1UselhOdLIBs6Zp4rdl2V5bD0oJMfb0Colq7
	39ujBvkZPaHWpgqi+8d0Du8tm5L0gmi0j8vpE5qPACEBsv6Lbzrs84Us9UOWsdGsaJgeaxUo+UX
	MiNd3Cpen4S2mrQ0bdpdbYzfDuTW1z/Bj9LmdSvARX8GltlAa14AMLH86Cor6HKTsJq6KqJmaS0
	OB4oonnbt/aHji3krsIvuKMohSI0uUWCInsv5gJin+pBPXYtQaj3cAs9l7+D2a08ZBPmGZV/6lS
	yqNqrAw/uH2VHr+sVFb4Z8w20tp8hhPfG71ZqtH9rOSN7TJpIBI92rxJQA5i1ZJOXJQAp5YphIh
	nj6XX8FwD7rAb0Ptx9Bvu5d/tJcLKUImCtfI2RHqUdRPz/fUjECEfZlNAKcIeh4KFxtVHq/kLyT
	2DhRFrbuwZZaAAbPnvONU2M2UxKjxEaCVlO/lEutS1BtUjsZ7QDQ4PG52P/D1ZmMbjL4rAVd4rb
	1HSvnxab5p1td293bzGi+Q27ChM/RQcVtzVZYIKFZCU9aJ4Q7pnS+sY2Xh/StXSWl6dEaO0r2ei
	J4Vddpwx53/1dbEq6mg+
X-Received: by 2002:a17:907:94cc:b0:c1f:e9d9:64d4 with SMTP id a640c23a62f3a-c2ac24747fbmr368025566b.11.1790293708996;
        Thu, 24 Sep 2026 16:48:28 -0700 (PDT)
Received: from localhost.localdomain (31-208-26-100.cust.bredband2.com. [31.208.26.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae757b9c1sm30757766b.33.2026.09.24.16.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:48:28 -0700 (PDT)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Ziyang Huang <hzyitc@outlook.com>
Subject: Re: [RFC PATCH net-next v3 4/5] net: dsa: qca8k: flag QCA8337 internal CPU PHYs for SmartSpeed
Date: Fri, 25 Sep 2026 01:48:14 +0200
Message-ID: <20260924234814.1734-1-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
In-Reply-To: <09d669ff-7aad-4414-880a-21c2e7bf2cd7@lunn.ch>
References: <20260923215858.1653-1-yongzhao.derek@gmail.com> <20260923215858.1653-5-yongzhao.derek@gmail.com> <09d669ff-7aad-4414-880a-21c2e7bf2cd7@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andrew,

The register 0x14 configuration is in patch 5. For a QCA8337 CPU PHY
marked by patch 4, qca8337_soft_reset() clears SmartSpeed enable and
bypass before the software reset. I should have made that relationship
explicit in patch 4.

I have a local read_status change for QCA8337, which I plan to include
in the next RFC. When autonegotiation is enabled, it reads the resolved
speed and duplex from register 0x11, retaining generic link-partner and
master/slave handling. It holds the link down until those values are
valid; forced mode keeps the generic BMCR handling. Local tests that run
the callback and the PHY state machine against a simulated MDIO bus
pass, including a case where 0x11 reports 100 Mb/s while the generic
path resolves 1 Gb/s. W=1 object builds for x86 and arm64 are clean.

I also tested it on RA74 in an OpenWrt backport on Linux 6.18.52, not
the net-next series itself, with the existing CPU SmartSpeed workaround.
On normal 100 and 1000 Mb/s LAN links the reported speed matched 0x11,
including after renegotiating the 100 Mb/s port and after a warm
reboot. These were normal links; I could not force a downshift, so the
downshifted case is only covered by the simulated test.

The existing at803x downshift tunable cannot be reused directly here.
Its setter calls phy_init_hw() after writing 0x14, which would run
qca8337_soft_reset() and clear a requested enable on the flagged CPU
PHY. This shared-port PHY also has no net_device->phydev through which
ethtool can reach it; ethtool on the conduit or wan addresses a
different PHY. I have left tunable support out of this follow-up.

I don't know whether downshift is broken in general or only in
switch-integrated PHYs. My only data point is the RA74 CPU link
failure, and I have no downshift results from user ports or discrete
at803x PHYs. phydev->is_internal is set for every PHY that qca83xx
matches, since they are all switch-internal, including user ports and
QCA8327, so it cannot select just the CPU link. I have not found a
verified erratum for this switch revision.

Thanks,
Yongzhao Chen
