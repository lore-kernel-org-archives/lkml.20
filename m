Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794863405;
	b=Z2YLogdkKCnXa01rHZhG6Sq1s9ZTh0gVWI0j6KORKJE/03ZXzYODuBfXJ6T4cXpFm2nL
	 5RPf+GLR+9Vtq108g7RbpXQrjx2qygNTbiwzi3YOptC60MFC8cuTOzvXkpfvnhWwVIRPd
	 0z1sLi6or+cyv4JhUvU/7gsYjTf0GBpCu7nmx/pqrvt2siFRZzetClh0NljMeD6X0elX6
	 yWQO+Ga1FOaFfRWHukMtdjMFyMDoaSZmiLQqY9eR41y39oUSGIGGEDKmuwLM1OIRZjVO8
	 MlDc+yNsy/f7AcdF8jQI9aiwIULSj7jVT8R5AShDXt+sbfdFVrhdaA5BSvddPVfGffA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863405;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=PXCXBeY7TIRm27eW0AuKMtAWfK1RCsmR4cnDc7pYKhk=;
	b=gFxFIwJitn3vrGIiBTNVK1CypoCjhtszOBX0mHVxwAIGrygM2ngpyDy2feAMU4tTH6GL
	 FCuAB5uTaXetEHF01v9xGRH9Bio/cEujASn13N1Ud0n9Wk+n20l6uw54k/P/6pJtMzRKG
	 JK3Anq7ejos7cRfZL1uljNAqk5HlOZ5oqWw5hF+z3c38mXXWuaoqVw1kxLVmM7MT9kfZP
	 R5O3Eoem6Z+Rpg4lQ0zBSgPCItTIpDenNbFXPY1KUYBXvUel8N56n8j6feeCy+2LQ6O2k
	 viuEKG446/+Ii9LG1RNNS2mIWvmqmx7opsPYLPozjHkb0TQMe97KosE+leHlLAd3OFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=BYGPn8TX;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9F760A3802
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E9F760A3802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=BYGPn8TX
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so204199a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:10:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794863403; x=1795468203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PXCXBeY7TIRm27eW0AuKMtAWfK1RCsmR4cnDc7pYKhk=;
        b=WtLJUI2s01Yu3bmRcCcY6Y8RtBswmkECLahoOyLyuyumdHQWuf9IdFEaYYElpLawPo
         Fk0paOCIQFDse8lBSOfyhqIx/tYlukGkkBxHPvQU4xpWNQJFBggfe17emQdKDP1xylHj
         6BYGotAqX2qLijYPddx0eP4VjbghmLWz4Ak95osrXLUuz51Mbqd6u+MueE4wBJVN5gRU
         ramPvpJr6Xr/71qcKrOr+DSJRxnqK1z2Z9LCTYsLN4Ywf8MjVPJAJMO/lDiSMlCKm2y6
         lyVAeGfuelvmfGIb/EQfPqd/RvFGAH/GMusWJOuElb8LouRO7zd29X83njiLloEbuPtW
         9FuQ==
X-Forwarded-Encrypted: i=1; AL+hErEtKi7XRLPr03dwgeQZzAgXnYaDJRDXgG/UyzYzW8SoNGCUHDUhomGFZlerpurO5PMPgNp1mGAwx3igCvQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ljT4WsapCzNV7PQKGWjJd37nZKpqlcqH7fcHObX5yeK07GbOS
	wbCt4AkAIrrrp0PBRLZemxzQvR9Zc3U68Rw23U4yXd7TFgg4N40zcWPmluc5f2I8yQ2Oq+EA45j
	kx7+WYTfIfkzIHr7EU2vCQrsbDlIYusaNgw6kVy2S5FBAMJRPGl5jFdZZAEkl3wOu/nUCeyR3qu
	0WRO489gK8slbIFccvNaOrwov4xQ3OFT0rAmtsTr2xwQSKn231gw+nxPrenyMvzy0raNYr0PN14
	9h/HeBEt2OfiRQwAZ+vojPb
X-Gm-Gg: AZFdTZehq8FGKCEPyzIQww59MZ/0FO9yusKbWOG7pjDpBydY1klYm3H7rdoqHvKb9pm
	N9I4vUXeb20w7Jzv4Y3GQWunnOjSDDd7UNUpeLYAk8cHQ8ZF7vDxFoJrewB0ZCOrDRIfMKo83qW
	u8hCsmHj2baf10gwLPmIB2a5T9w0X1NXH71TAdzS725liuHObvl9Vr4d13lYiSpCGP0kb5B6y4H
	z6VJkgt5tUPWZzCZB2BVQsYEtTDAdSoH/DuF8v9xXzjjbQMXHEIn/0bHnuCLVe4cOsp5xEy6Svt
	SuTaKSrn23mqz4YUjacfsSqB4SODwzOIAN83cp0ybW+D8bwBYH9hwwbVeNZyyJ3hrYcZ0eutOS+
	LwbdD/cTw8Q6U/pHxP6tVKDXp0EOGh+KgKMdDTRidxUSpP0/lktSA+XuIJdbTr3F8ejxHKitEEv
	V7cJkjs09ESHO4QY4btQYhksJGJ8VwQeIqbK0gCoblMf8=
X-Received: by 2002:a17:90b:4d06:b0:3b1:bd6d:fcc2 with SMTP id 98e67ed59e1d1-3b3abe7e796mr333342a91.40.1794863403152;
        Mon, 16 Nov 2026 13:10:03 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b2654977sm4934308a91.1.2026.11.16.13.10.02
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 13:10:03 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91eb3a63064so5674106d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794863402; x=1795468202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PXCXBeY7TIRm27eW0AuKMtAWfK1RCsmR4cnDc7pYKhk=;
        b=BYGPn8TXc6cfEtd7rvDLphDtsLl9XvXaiS49ja9gdd7lnQuPdXrElS0SHQsXISXOMl
         J23wuB/nMnGkwfb70lSZRGpqMzFPkXTYjxZNzOQIweTR30Oe1u/EZyE32wVV7uUTLD8+
         cQhXjYBldZwYLquOzi2n2+lAzLQ9e8nv8c0oA=
X-Forwarded-Encrypted: i=1; AL+hErFciBtRw8hCi498hWJn544c97IbJw5I0Pww4IzmqeYh+7kN2855jhved461JkSiY/9x7QJcSsDcwlsswRA=@vger.kernel.org
X-Received: by 2002:a05:6214:f2b:b0:920:fa91:1778 with SMTP id 6a1803df08f44-920fcd29161mr13501546d6.17.1794863401765;
        Mon, 16 Nov 2026 13:10:01 -0800 (PST)
X-Received: by 2002:a05:6214:f2b:b0:920:fa91:1778 with SMTP id 6a1803df08f44-920fcd29161mr13497646d6.17.1794863396537;
        Mon, 16 Nov 2026 13:09:56 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-920fe17eaaesm3601396d6.33.2026.11.16.13.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:09:55 -0800 (PST)
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
Subject: [PATCH net v6 5/8] net: dsa: b53: use the correct override register 2 Gbps bit
Date: Mon, 16 Nov 2026 13:09:39 -0800
Message-ID: <20261116210943.1352656-6-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116210943.1352656-1-florian.fainelli@broadcom.com>
References: <20261116210943.1352656-1-florian.fainelli@broadcom.com>
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
Fixes: 41af38324341 ("net: dsa: b53: restore the NSP IMP port 2 Gbps mode")
Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 64e04c5731a6..d8dafa9e0c44 100644
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

