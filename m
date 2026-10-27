Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793132568;
	b=AVrSmB7KI7tlSgPIxTLiNr1KLK2/a7uUrl2hoiO6Y5iKYgQQEl9DtPtpKBe6ResWDLsW
	 hFH54KVgN5KWTJPNRuCobN72vDCgsGxzL8bwQ4lLd1RP6gktEr+v4Afsclm+baBVHmPSI
	 FSGDY/8jLD9CVGdO1AnUGTCWutl3yBuerjCl/IAUmlf13LlW0kfz3GaozBqm+roSZ1anV
	 E1D0CGJLWios0F2jjlVpsTWg/f22LFcFStqF8Q4AhNjUYs5sVPmJLBNnuVtTL1saM+Pou
	 NDcpXuYQ4iWWA/U5yDqi2Jj4JVq3iPO37mmcTlrrcEoAJvzd5ijRcjbC8m7MS0N5xaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793132568;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=A1z57LQ4iJ82Q3o0NAIzq1pzrjN6qyO1yQuZ6UD77pU=;
	b=fBZhwavJfuApZzJmpdN6bLqDIVymc5lkHTARDp6dAHcjUAPdfsTKKyTbrvp4tAuSOEk3
	 HV6Mx/WzSn0O039eooBdlmm121OHTVfY+YR/GIx4nlUN/24yDPJaUh5iGwIahRMqlJ7Ey
	 Et8xHd/3Hmk+Syn7AqwPYu3qVJUW23IG48hgq6xp44s1rVnlF+RL8w0PToF/RsbTXFZau
	 /s0qyYABD+iV/7GeWSg2IVh7aBI2FAtDWkis0kOiWCorMFj5iluW9s+UqxNmLohxpfpXn
	 f0RsGsCZDqyrqxI6VISFySJceqJX1uRwmhegCcgShsZdWEWenC7EHDTGWQuMCi6Gkbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=e2UIeYQf;
	arc=none smtp.remote-ip=209.85.214.228
Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8CF606D73A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B8CF606D73A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=e2UIeYQf
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2e940d5d2beso798055ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793132568; x=1793737368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A1z57LQ4iJ82Q3o0NAIzq1pzrjN6qyO1yQuZ6UD77pU=;
        b=wiPGkzik+/lcNr0wdevkkOlCqAIH29MXz+6vkehtNoHtVk7D8KDt+mej/Xl4v41XAk
         I5MItJyBOKbKrTHlgWDIMdhuPj/qR+iz06BzLksHl5eEi33iP3ymwRd8+hgpdCxaqn4o
         zDMggq+462pkkcg1iHEzE6bJRu221D2vWkt4NN1+AFCx6QrS/EGO1ipYCmEYgHP6LxnS
         bKVEf/ly/QlB2UI0miYwYutSR3Jf2Gcba+QSxymRW6OwS/TFyOBQrFGDAd84/qMnVqR3
         ySiOUAbM0TNYoYjyWsVXDDDhAcBpF/BTctg2pXIGp3xJWr+SkdWX+KvgkSZulmNLWbSp
         TUsg==
X-Forwarded-Encrypted: i=1; AKwUvBwF3yK2G1zhDrjbpG2UD2FsWgpgjHaj1/1YisiHmXADFmTFu0H6dXG5wkD81lok98AkaLvqEPYqVIPyEP0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSCPZ/nZgq+QVD67Uee8DKCe03Tql5jMBwnVf9rm1kek7GtuDV
	iCkEMZVk+V+9ySwXSBrLb38BsfdLOVXoEM6zeoDoDrJ7PGZWPj6d330R+jGlt6gk1HELRxF/CoT
	JcPEPuYmvH0VZINq2OQBYnsb1h4+11zmky5XksNTTJeLx7aO2cLj1Vg5JYdd1BlL0v2JMGtmb5o
	CiNJg2qPq9X/sUdBljTa0BU0mp4LiRaVnjOlXxTTr/KQOgiWXwYkNjHe763WgAdeZbsD1a/e+aO
	lOcHpmWIWbj2qDPc+dt4D5C
X-Gm-Gg: AYBFou1znGBeqUTdozkDNq03IbSrO3bATI98KmtpX/doDbSF6l5/hXRsh6uqQI+/l8a
	DTrWYZNgEjdRYyE0E4nCsgCL2pxbrZdqBqEMSW0UaXBN77Ys/LkhjUQl0kTz8BL869d+xdNjK5t
	oIvUC6rZa3y4QjRvV1ypiSrnnZ0H0ZOeroHYlQlDUX8BVPNRhiqhDudyBq2qHUR+JQDTdosQQz2
	DcsULXw9Sg/KY8cJwIKpYIUszqIq1VwMaQMjh4NKR32ssM8wlqujY9L3FenePrMvoBUCgN9nd0w
	yXSDfb+yoaq4+7kTxYzbOvYeNebMYbXLz9MFGAIGiTnzpx+sI+ZGu49zd8kDoWcZVb646wptXuv
	V80Q2sqHxV6TgWS5cE/H3qYdYGKbhVSS0Xt3sD8GSaG1G0KCh3Imf2KlN62EKpv4NuW4z/Y4IEb
	kvxEmYuEMOtM9mwW3TXbZqC8OmYAOJpEiO57rrpjet
X-Received: by 2002:a17:90b:3d90:b0:3ab:be66:ddb6 with SMTP id 98e67ed59e1d1-3ae580ae5edmr126934a91.20.1793132567663;
        Tue, 27 Oct 2026 13:22:47 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae55d611b4sm140654a91.1.2026.10.27.13.22.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 13:22:47 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd68bf391e1so188140a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793132566; x=1793737366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A1z57LQ4iJ82Q3o0NAIzq1pzrjN6qyO1yQuZ6UD77pU=;
        b=e2UIeYQfpzS6nvef3KCq/0QHzUPB2h7NqR8+iQhIQ8fBhETTrDUpUKfLFQlsWFFp/+
         /8x7RiaXGPKZriWbQ+Q1RLNmuqHeZXepG8FQRdzHwp/eQEebBYEfRWKm6tjRO7CakI/j
         xB3Xjae4RCvYDGXVPSL36DyF42h37ME1p24tg=
X-Forwarded-Encrypted: i=1; AKwUvBwWdKaDHSC4Y8OzoHBgdzpR6U4kxOarhYObwAoaBfKi4//riQYpjKzCz7KLsTrXQz57cQISSCMqYJSFgH4=@vger.kernel.org
X-Received: by 2002:a17:90b:4fc1:b0:3ac:ffb8:1809 with SMTP id 98e67ed59e1d1-3ae58155cc9mr115437a91.39.1793132565611;
        Tue, 27 Oct 2026 13:22:45 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc1:b0:3ac:ffb8:1809 with SMTP id 98e67ed59e1d1-3ae58155cc9mr115421a91.39.1793132565199;
        Tue, 27 Oct 2026 13:22:45 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae55d1650csm275486a91.1.2026.10.27.13.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 13:22:43 -0700 (PDT)
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
Subject: [PATCH net 4/5] net: dsa: b53: reject conflicting mirror destinations
Date: Tue, 27 Oct 2026 13:22:29 -0700
Message-ID: <20261027202230.3539646-5-florian.fainelli@broadcom.com>
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

The mirror capture control register selects one destination for all
ingress and egress mirror sources. Adding a rule for a different capture
port currently overwrites that field and silently redirects all existing
mirror rules.

Read the capture control before changing any source masks and reject a
different destination while mirroring is enabled. Return an extack which
describes the hardware limitation, and propagate a failed capture-control
read rather than making the decision from uninitialized data.

Clear the capture-port field when the final source is removed so a later
rule can select a new destination.

Fixes: ed3af5fd08eb ("net: dsa: b53: Add support for port mirroring")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 0871a10d8cbc..b8a7b380bac8 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -2543,7 +2543,19 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
 		   struct netlink_ext_ack *extack)
 {
 	struct b53_device *dev = ds->priv;
-	u16 reg, loc;
+	u16 reg, loc, cap_ctl;
+	int ret;
+
+	ret = b53_read16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, &cap_ctl);
+	if (ret)
+		return ret;
+
+	if ((cap_ctl & MIRROR_EN) &&
+	    (cap_ctl & CAP_PORT_MASK) != mirror->to_local_port) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Only one mirroring destination is supported");
+		return -EOPNOTSUPP;
+	}
 
 	if (ingress)
 		loc = B53_IG_MIR_CTL;
@@ -2554,11 +2566,10 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
 	reg |= BIT(port);
 	b53_write16(dev, B53_MGMT_PAGE, loc, reg);
 
-	b53_read16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, &reg);
-	reg &= ~CAP_PORT_MASK;
-	reg |= mirror->to_local_port;
-	reg |= MIRROR_EN;
-	b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, reg);
+	cap_ctl &= ~CAP_PORT_MASK;
+	cap_ctl |= mirror->to_local_port;
+	cap_ctl |= MIRROR_EN;
+	b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, cap_ctl);
 
 	return 0;
 }
@@ -2595,10 +2606,8 @@ void b53_mirror_del(struct dsa_switch *ds, int port,
 
 	b53_read16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, &reg);
 	/* Both no longer have ports, let's disable mirroring */
-	if (loc_disable && other_loc_disable) {
-		reg &= ~MIRROR_EN;
-		reg &= ~mirror->to_local_port;
-	}
+	if (loc_disable && other_loc_disable)
+		reg &= ~(MIRROR_EN | CAP_PORT_MASK);
 	b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, reg);
 }
 EXPORT_SYMBOL(b53_mirror_del);
-- 
2.53.0

