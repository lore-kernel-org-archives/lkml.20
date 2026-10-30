Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793394994;
	b=lcfK81fWu1TeCSSD2TfkE7l5RhJvcL6wxZ0rJRpENjHTdDD1Tm+SRqjsCjo7sdu7YKCP
	 lSdHbWWwqSaXhqW36AjQicL2msv74/ekDZuiwRu7VWC6gbGtn2NuvFgdEMZ4TdRI9tJdq
	 j00Bd47SdEprWYkdhCZ1nkSu10a9VNlZ/BpkaX9y22gI2AgG1UTzrOTJ3FDCi/hKunABX
	 B9oY4/9CNYEyzx9xQFNKzMuS1uwF8ODoYO3nLUHTzQygxbAHY7aJDNJ64j6YqKqgAih14
	 rZQwf3mx/R4QWwtsFXHl1sjQtRp+3EMMogDJI24vIA/vUSqmmbdJRKltXGusBh5CbnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394994;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=zKHpOqN7el/iBi24fQQZSjZZJgwztQp4IyGIqG/dArc=;
	b=1Bvf8ueAbslT1QJTutxFeeazmp/L4HCH2o/Lk4AesZtAvNfySIIFyZ6NajyFoOtlwEey
	 NZ8ZKlPWr7aWT5wZ6y5BTNGxapnKdw48Y+Mk+8Ap49/RMYaBCzGKvjGHKUg/BoaVGG7E2
	 jS/vYRi7JMrGI4Qd3D172iqCPcJKb3Oq1Xe739JGhNJmTO1YTT9IeQZU9m/kXYB38EBrF
	 M+JWyvMQqfCunXS69+dqcLND8t5S7wRtq3k6jxuk4I7M/bkkD2Vu+0OAgmsT1dz46tgd9
	 Eu98XlgIbx1Cj9YcaDY8l9hEu3ks+LzpV7MYvOSwLqx5ZHdHrqTIjw5Ed/z2xrRFccQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=P0PJQoin;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3338960A2637
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:16:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3338960A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=P0PJQoin
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso628030a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:16:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793394993; x=1793999793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zKHpOqN7el/iBi24fQQZSjZZJgwztQp4IyGIqG/dArc=;
        b=mJS++O/gRluYnmCvdd7ahpW55txYAGguCc6PPgPg0np7wAoHU2TasbMh101OT6ogik
         BbbSrEZps2N+01tEOH5BSZ/0CWPlRk60iWBkzbLFfYdMx3WhfIkgZNen5LKNs7z6dNsk
         dolVZ1mB0pPS0gPWWd1XBU2z2q8BBjWQ4NYq4fsaufUHO7Gnj3rTUkOfVOkOUINkkYal
         O1DyE/b39AyK0z21POywIryeATKlOnXO3q1Tkp83AQkqDufBMHOOF3+aGH6SJBs3AFm7
         gScjGCnFBLsYMYeovgBI92YvTPbU7nFiasNs+d6dpjauGbiYQ9PUzHi6jrHZXHb9JXiW
         jAQw==
X-Forwarded-Encrypted: i=1; AKwUvBxdNgQgNmqxsvKVuHKW6eLxUMgq0hA3HlmfSrcNH2AdqINFYtoKLkSSeJqPfIS5DuEjsW4iIjdImpQbADQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXbe1yn+SzcV+dVor09RlK832L4/5fFgb0QHZndKr+r2GVFygw
	HaSJhNJB70sSnuph3cPsE7R4DkjIAf5SIFc9i8sVqdf3bpn1CCtci5Akmrtmbg9XsRrtWI5Je/m
	sOyhgRueRCDoJrwNr9xB41oNjKIebtgq1Yaa/u5U08C3vh1hAYAhAeZlb1IHE4AA2zwMr5fsXAa
	Hehtj1KZvYjRAjXg5dVU9xYZUvLVXIKAvLVPOH36By66be42IPi3Gp32b12o2dEobEEYoeJwxUg
	W6diIuHTT3WMuogXeTyVRaK0PU=
X-Gm-Gg: AYBFou0pmknRcyEVY6f207QWlBGUGXsC7u5fsIEff1OI4SOoxU+IDj2+x54hQEaWvzq
	L/BG4+YH+W2l4mpAov9APmjQz1EEJNbt8Nfr0a6OBxR4+s6i7rG/q6os0cop2osZ2wu1BjtOMZ9
	2vvBPRB04S6A3/Q8gsfD9JG/1BIdrLNurfqrrGvyeVefV/uWjv1/MET214WjwBtVfaFo5S/aM4v
	ROTzc5rz1I0eS+pSc+cfxVvb9CaEuRbJDjzetSxU/zrIYkpZOUeLR1hb8azrSX1zreRgL6Qy9w3
	9K3PWNMU9Mw8ntDcsltwRC0o5ntFvRBEeccwFFKoKVwLUS+OOhYzpUFF3FmL3VmXGmICnP5TcCe
	xe968JAb6hDQprXlimPk5QBP7TtwWja6H0eTGtFOpKU7jYAcUWhBgXoSH2xU9mW6JTxXUe1A7xi
	RVhXzhVs/scolK8f37EGTCUXJiDV5nldYNhqw9y4nF
X-Received: by 2002:a17:90b:2e4f:b0:3ac:8897:7ba4 with SMTP id 98e67ed59e1d1-3ae8957454cmr2817285a91.5.1793394992993;
        Fri, 30 Oct 2026 14:16:32 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae6e874b16sm4783723a91.6.2026.10.30.14.16.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 14:16:32 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so2144947eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793394991; x=1793999791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zKHpOqN7el/iBi24fQQZSjZZJgwztQp4IyGIqG/dArc=;
        b=P0PJQoinqSToZ/QHhM7C7x2+h1Q6FaeqalpppQp136mje+rkZAL83hUzK1iEJhFUvA
         nth0c4/dqrqTQhz5NTy8Ycgd1X/f3MYCfS8YPFQg6Kvp9xLR9kGR9sVA97dd7ylvL3Sw
         eWPnLebQ153toD6YiVyK5Wf+DeqMLDLJ6LZxA=
X-Forwarded-Encrypted: i=1; AKwUvBzumqeWoRtA+SQcM8svNpA6QENrgD05HHPp103L5lTwLMXyOKjfZFA9dt4TuP2la+gbYnEW9YevuaomCoU=@vger.kernel.org
X-Received: by 2002:a05:7301:f8c:b0:36a:18a:e02f with SMTP id 5a478bee46e88-36a423c5c8cmr4398028eec.28.1793394990579;
        Fri, 30 Oct 2026 14:16:30 -0700 (PDT)
X-Received: by 2002:a05:7301:f8c:b0:36a:18a:e02f with SMTP id 5a478bee46e88-36a423c5c8cmr4397976eec.28.1793394989808;
        Fri, 30 Oct 2026 14:16:29 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm13513535eec.16.2026.10.30.14.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:16:28 -0700 (PDT)
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
Subject: [PATCH net v3 5/8] net: dsa: b53: use the correct override register 2 Gbps bit
Date: Fri, 30 Oct 2026 14:16:14 -0700
Message-ID: <20261030211617.288562-6-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030211617.288562-1-florian.fainelli@broadcom.com>
References: <20261030211617.288562-1-florian.fainelli@broadcom.com>
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
 drivers/net/dsa/b53/b53_common.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 378f47e7250c..75033b28100e 100644
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

