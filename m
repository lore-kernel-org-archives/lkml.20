Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794282640;
	b=MxALeZIyGi0MP0UfjpstEIqlJVkGWCiWN4E8zmQb40ka3wtMkgAoV1QoUfr+ssa/PYRv
	 QVBCBz/2Dz/LlNTctCX5Z1nSnlS18Cf8GP2zVJz3OZx1QJ0Q5589NgOe0VI7QbJe9+chg
	 NzS+bb45Xqxu8vfJdiwgRniSzbC6F8RCE8GFshLbl3TMNkTyeecnQpnLS0jfjtkhyR0WD
	 tBnoFWx/uDICvdFByHH3BzysvxwWXQO481eozjggrEzp3JDYZfqN93tRwqA+fkds2sGbz
	 py5WWco0Cdwt4zMHy6THJI7UwlxfR6KUbIi8hOHkX6aSEiPjCi+uttQIeVIqE3c4p5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794282640;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=4vlXeE9enSxQAZM/AVNB/6k7VuHl6mXvqO/NCZEaN1w=;
	b=M3l3tGrv75H3H2TYlt6VsvIR7jc7/qUGRYPNFY3LbHebV6CkDlXesGVxw3HQ9L3HM6Ay
	 C+FFX95Gb7HbvlaGRHzpH11aAeMPSYRx0k3N0fW81YOqRckRjvf71i8UtXwQAlpfmStWx
	 k+ooGR4k3gZKRKv4NU87CUPWvkL+cvMvP2WfNMnjVNKU5fS4AwCqiLRNx4fs0rv/c3d6e
	 2rCgyEg3GaLIbmcDG6Sv7Z1JruoiwuEulOvZm4dfNyRja+VOx81+n2qjkbbLtTpv0pDzY
	 KrNCr2t1aXzoDeuVY95dw5Wdyn0dozvug11rw1eM6dOeAq1darbuOOe/DO3NWU0XTSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=azDNewJy;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD5260A3835
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAD5260A3835
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=azDNewJy
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b0d09df973so1197919a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:50:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794282639; x=1794887439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4vlXeE9enSxQAZM/AVNB/6k7VuHl6mXvqO/NCZEaN1w=;
        b=TwPOyzudztgFFAE/U+la7zDIvXoCOkBDb+ntndWzEWg8U4m7uDH6Ixb0PGP25e619f
         HtomlwuRxHRShWHw5U+IoA1ZNUQqju1rRWkj2h1ois66H0IsSJq72EAZC3iqMpLJaIkf
         WlVi3+R3Is1nyR/jiPv0JBaMvnEjfkoE7EuD1Sok27a46m12FKOttZRsphLGPbzPwBtF
         /GkVylMFQZCbxIDLQGGn4BPGD7Vq4xiOtk4RXWv9XKOcEFCnzFSzVrekAPj0qsQXczdV
         k+SaT5FE1Zhmsgi1eIik+VVEUAxhGrXvnqFSjDe19HnE4ziVTxpK2L0c2HWAOEV1t59o
         9Clg==
X-Forwarded-Encrypted: i=1; AL+hErFa9LWWFfwQe6NxlrRBafGFFOiZMQoQhRxv6BCrTOROqBxJeJ164PWVOkKgzH05eMlb3bQ9nbEC/8kvGeA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+C4iWcVYKdXF373qHSHuyVHzoPVqgxVmIbDw+4YZ6aw1+qAGgv
	3qTCRtNoojQAulVf7mLoXdZ/wb/Zfa5TzSV9p23gUjSn5/xQ9Rt5HQA2clL1k93zYL1S89Y7Apj
	PWIUE2++7lws8YVEZlRwSaufxXCaihXOkB0Q/0FjuZo3LHmIq3VwiUJ/dwWUKVeYQ9f/vHrSOkm
	22hsWy2S81kh2luIrCgwNi85yV4lV3AxddsRn2HrTsxcsceJ5nWVQ45bunvOI6Nk+fn6mS4QJb9
	qRBZ7GaOA9P1PtApE5IRY8l
X-Gm-Gg: AYBFou3tiEHnCR+SmvbhxXZFkbDwPsCCtkewU3Xg6eKFTSpxFuwgDBXgTcuGinuyFiW
	fHuWEzCOOYG5odrNEWhmFUtIQDRNoYmDxX+h3W3hvKPYDvTtxMiK/mmOrsQ0FvBMJQf2RP2jVIP
	T3o9dZFTD/iBQP6smalXBtDOsYaCuUzBd4TzKYmD61mFnEwxyP8Ed78CIp+Zn6MrHF69FKW/9i3
	g8YjzBJVzsSgcZcYzHkCTSri8Jzvho0inZi/kCqQeeBcbA69qkLE9NNxgR+0eU5dv2xORcm3CXl
	b+IoPhY7rdA4RZhpGTuJ9pu5BYCtMZu9ylwL9ct8guMHZ6jJ5ThBJDkW3t7j9PHFYcAzb8fKvup
	Nhsior74A4K3+h1jvwzowvRvabnAClInJJY/0LiU2AiQVlspvGrXXQPiD4wGIt9V8SZraU7Q2W7
	S50lYCO3CD/WMPQPi1xv8smUxD+zNTorSBkyugZJRT
X-Received: by 2002:a17:90b:4d09:b0:3ac:945c:7f69 with SMTP id 98e67ed59e1d1-3b16700e7afmr1587722a91.66.1794282639247;
        Mon, 09 Nov 2026 19:50:39 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b168acb09csm449336a91.0.2026.11.09.19.50.38
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2026 19:50:39 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-537548d4bc0so32295251cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794282638; x=1794887438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4vlXeE9enSxQAZM/AVNB/6k7VuHl6mXvqO/NCZEaN1w=;
        b=azDNewJylkRUjxeooK7T1bYjeweLbDfPPsbnIQRMJ3ewgm3JrVKIIlGAzLsr0oeXZJ
         uErGrNxwSA7AowqNzePwtsRVAowFAQpQUIwn5uY921tQysf6favt8SkpAsf0ilWAMPEF
         d+D5ZDDEaZV+G3lC3Hy4ijPPbidswteVqnTIA=
X-Forwarded-Encrypted: i=1; AL+hErHJGx5amP3zqineFuWlq/uxX7S0ZlV/ZY+A3hGvuIAc0nb6xv6ZcfFRpJcKm9vw62KcpUQ694f0qUMJgbI=@vger.kernel.org
X-Received: by 2002:a05:622a:1f95:b0:536:645f:c901 with SMTP id d75a77b69052e-55528ec3f5bmr20311621cf.67.1794282637686;
        Mon, 09 Nov 2026 19:50:37 -0800 (PST)
X-Received: by 2002:a05:622a:1f95:b0:536:645f:c901 with SMTP id d75a77b69052e-55528ec3f5bmr20311401cf.67.1794282637209;
        Mon, 09 Nov 2026 19:50:37 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550af612dfsm13740951cf.8.2026.11.09.19.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:50:35 -0800 (PST)
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
	Vivien Didelot <vivien.didelot@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v4 5/8] net: dsa: b53: use the correct override register 2 Gbps bit
Date: Mon,  9 Nov 2026 19:50:15 -0800
Message-ID: <20261110035018.2169370-6-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110035018.2169370-1-florian.fainelli@broadcom.com>
References: <20261110035018.2169370-1-florian.fainelli@broadcom.com>
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

The IMP and per-port GMII override registers swap the override-enable and 2
Gbps speed bits. Using the IMP speed bit on a GMII port clears its override
enable and leaves any previous 2 Gbps selection intact. Select the speed
bit alongside the register and enable bit so lower speeds clear the correct
bit and 2 Gbps sets it.

Fixes: b6a8a5477fe9 ("net: dsa: b53: fix resetting speed and pause on forced link")
Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 715a0969eacb..6b4a94a97d66 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -1427,17 +1427,19 @@ static void b53_force_port_config(struct b53_device *dev, int port,
 				  int speed, int duplex,
 				  bool tx_pause, bool rx_pause)
 {
-	u8 reg, val, off;
+	u8 reg, val, off, speed2000;
 
 	/* Override the port settings */
 	if (port == dev->imp_port) {
 		off = B53_PORT_OVERRIDE_CTRL;
 		val = PORT_OVERRIDE_EN;
+		speed2000 = PORT_OVERRIDE_SPEED_2000M;
 	} else if (is5325(dev)) {
 		return;
 	} else {
 		off = B53_GMII_PORT_OVERRIDE_CTRL(port);
 		val = GMII_PO_EN;
+		speed2000 = GMII_PO_SPEED_2000M;
 	}
 
 	b53_read8(dev, B53_CTRL_PAGE, off, &reg);
@@ -1449,11 +1451,12 @@ static void b53_force_port_config(struct b53_device *dev, int port,
 
 	reg &= ~(0x3 << GMII_PO_SPEED_S);
 	if (is5301x(dev) || is58xx(dev))
-		reg &= ~PORT_OVERRIDE_SPEED_2000M;
+		reg &= ~speed2000;
 
 	switch (speed) {
 	case 2000:
-		reg |= PORT_OVERRIDE_SPEED_2000M;
+		if (is5301x(dev) || is58xx(dev))
+			reg |= speed2000;
 		fallthrough;
 	case SPEED_1000:
 		reg |= PORT_OVERRIDE_SPEED_1000M;
-- 
2.53.0

