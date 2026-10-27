Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793132571;
	b=0rhfxk1EY5uQHykEuMZsoh8uDMPv6qP9c2OdDMHFDAv/UBu/XrTDXWlG0syJ2wd9ncFs
	 ceWWRBa80befm5/6MRQ99Kln6mRNu+b6NngGLfVPVwZdaRsbItpRlYP8KuqRRQACj4yDu
	 oUUlDzC0gu7k/xxvaVwTb5ahtL4Qs3m7W/haKFwZzCH/RaUWTwZedZqp+LqRLMtZGtAAd
	 ZmEMbYc5vvZjR09zFwpVGiogEW8C44AXp1Zkld5NNKpP/lK++cE+RrSSrf34UoMzi645p
	 4q7qTSuYHmOmyQvlBzOq2vc4laM9bN8cfLaTQpDURvLpv36ORnwLGQblxX+Wl1HOuwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793132571;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=IKgbuad+wGOIwvgFCVy9jcp0cWcfp4Y+GDQZJZCqkEs=;
	b=5lnWPXt65Ey0tZY3J4aiqf1dj03ECCJo8+rhWbLQYChGYb7sbagbjHw/uyObYtUOH0Zz
	 ze9DdMRJYloblqodoWPZT9ZGVRMSNxnSiBupCr/Nrr8hNeBtJg0yOdBRo6S4/kEVcTfVl
	 dZWb3dI6bJWpXwbfIJ+rw68887LhdK/sEiRih4lhOO9W98bNSDzEHNYg8aCtSce3ybbA5
	 /oI3ieg/AHq+L14V8J+mTetkyCI/xV2etoIXwqs3mUBKjjwe2LZ77Fo8zUPAnh4/JDpnh
	 WTYDROxYNXzhck/g6zmtbldjSYHwKJf0U7zQYNsydZKqAA85U9Lg21s0PajLWc04DwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="JE8SbHr/";
	arc=none smtp.remote-ip=209.85.222.225
Received: from mail-qk1-f225.google.com (mail-qk1-f225.google.com [209.85.222.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09BA606E327
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:22:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B09BA606E327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=JE8SbHr/
Received: by mail-qk1-f225.google.com with SMTP id af79cd13be357-93ead211f14so28405585a.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:22:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793132570; x=1793737370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IKgbuad+wGOIwvgFCVy9jcp0cWcfp4Y+GDQZJZCqkEs=;
        b=MricyvK3QFDOiMmrw5UuPEqXH/KqLIeKhezPj91Mzo3MK8z18LjizQT2lQz+J9DAxl
         3cIgvMTU2pJI1GHDexNQCGO2vL13N74y2zuHwnDB8ADw0Y942pVz5/Ym6gCDcUR2fG2r
         rI7t29Y91bRw6LqkoNzNc+h9UnoTocuDTQVQ/td1PFQSpCvvBdc+VOlr6ZT2g37KaNWt
         tEqJ94U9ZipXdQqFeobmbyslR4mI9KTZCwf6vTFpm++RYUV751ifIW7RpQZmzLbSWbqC
         PwvYP/L5NH+Rax1iNgK6ISzghh/5JRIZqppz5ygrLzYfIiAjptoUNSIk7lkzF2i+JifI
         Po1A==
X-Forwarded-Encrypted: i=1; AKwUvBwRcY5eajpzTQu/fn5CX2lnTfZXchUd0jsumauaCFU485Ep+AZTinJT2+ZvrA8JwXLuPeUkz6RMbPgXZVQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZeHF4nkBN0DPKlw7IK4QTS1hu5S7sf8rBS5mgI9g3cl+HadiI
	dVCAdCobuFqg/G2S0EWRN4IoDuaWz8gNzs+0JEfPk6pnQrsQ0vpu++PdlCIhqVUnLTzbphuvbhT
	b86Duz2dEHtxpmMIQbp2mXhEO+KhKAMZd4hXcPw3/awLYnE9jUd4TFTlwLl1rivRKqkni7duEd8
	iPm50Twfoc2C4HYNjS/BJvZIFlJkshT8Gx6Z+41tG1IUC6vJxg+5L2wTPolwjWtAgIZrlSl8hUF
	0t2X7lEKYLa1IjkiWtD+NBa6NQ=
X-Gm-Gg: AYBFou373BcQfpK+Jyh7iJOcHFb2xlKFDNw4JKDY0JpWWjgdf0zuPVUZa6gR+4eLT6T
	SN+k6imsBsxwM3sX10L096hhngJt/wc9v6Fx9ZNX7JUnBLa/SIyt/Dp90Ey/lK6UQzWFjdIXULu
	ch/ITJsLO7I21mtAFer/toiZPkl1iRCf+7dyhpuhfQNJuWKDTey+mJQr3aGFSXLcaD2Sbt4XY1y
	VI0kTaiYJjpfQNJ9Z8M5bZBmhC7hpNwH1mFcS19hYB/cebZxp5Wof3buJ/D+7rhXM686prTDXPq
	A1VfKwBC54ylPAdhQ48aXq18+Sc3M6WsGhZDoxR4QKOiUz1/RD2aPmD8dSpAJvKCltJdbwi4NtB
	K39GMHf1fwSNlOx05e39J8F32ntgweIw0pVJp36Ap6oa4BnXUShwcPUjhAsH8B4bDqlBDwWeEjD
	RjJxkV+l81f0BU6xJkbjUS+ysE7sR86AFR80bJ0N3FR+g=
X-Received: by 2002:a05:620a:450c:b0:93e:c173:f68d with SMTP id af79cd13be357-94408d46179mr7250285a.33.1793132569465;
        Tue, 27 Oct 2026 13:22:49 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-940f06613cesm166074685a.6.2026.10.27.13.22.48
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 13:22:49 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac7a4ba546so1017207a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793132567; x=1793737367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IKgbuad+wGOIwvgFCVy9jcp0cWcfp4Y+GDQZJZCqkEs=;
        b=JE8SbHr/4WgLicaiSWgBEr2mAyfaMI5mT7inwSN80QMaLJpSK8nJVlr/aqctWU7jTX
         N+LpxV3V13avMfItGLYgcDof7pwOmsXOVtiS2GifY72Gugyyu2upR6WD1eGBKxxS6x7I
         hlEpzpOyUSyAmhbiyL9YNdkqaxWbPX8rJZzAk=
X-Forwarded-Encrypted: i=1; AKwUvByXdqbV1MCngHyl2vrMSTRdDlBfaHVLhwNwNdcsyhFFMeyxm3ppT3VFtvXlgEVQKXynDZzCNKnPsZICWZg=@vger.kernel.org
X-Received: by 2002:a17:90b:5146:b0:3ae:3d82:5d88 with SMTP id 98e67ed59e1d1-3ae57bb8a75mr111143a91.0.1793132567451;
        Tue, 27 Oct 2026 13:22:47 -0700 (PDT)
X-Received: by 2002:a17:90b:5146:b0:3ae:3d82:5d88 with SMTP id 98e67ed59e1d1-3ae57bb8a75mr111126a91.0.1793132566969;
        Tue, 27 Oct 2026 13:22:46 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae55d1650csm275486a91.1.2026.10.27.13.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 13:22:46 -0700 (PDT)
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
	Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net 5/5] net: dsa: b53: use the correct override register 2 Gbps bit
Date: Tue, 27 Oct 2026 13:22:30 -0700
Message-ID: <20261027202230.3539646-6-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027202230.3539646-1-florian.fainelli@broadcom.com>
References: <20261027202230.3539646-1-florian.fainelli@broadcom.com>
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
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index b8a7b380bac8..7bbbfcd611e1 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -1370,17 +1370,19 @@ static void b53_force_port_config(struct b53_device *dev, int port,
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
@@ -1392,11 +1394,11 @@ static void b53_force_port_config(struct b53_device *dev, int port,
 
 	reg &= ~(0x3 << GMII_PO_SPEED_S);
 	if (is5301x(dev) || is58xx(dev))
-		reg &= ~PORT_OVERRIDE_SPEED_2000M;
+		reg &= ~speed2000;
 
 	switch (speed) {
 	case 2000:
-		reg |= PORT_OVERRIDE_SPEED_2000M;
+		reg |= speed2000;
 		fallthrough;
 	case SPEED_1000:
 		reg |= PORT_OVERRIDE_SPEED_1000M;
-- 
2.53.0

