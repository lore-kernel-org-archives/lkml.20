Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864905;
	b=GEUiIL0YqO8Mo+xUWf4QgK7gOxi+CMrB6mifu6rKojhaBa6B2rUSkbFNMwsrCrOMorlC
	 R6sJVMCsIEAmwZ37nOag4pgyJ/JZa/OtDA403RZCblla2ljZlYVUS2x4IoQQ/SAUuz6vl
	 O9c3yvJqsdT8dt+MOOBMbMQd0FWY9UBaUBg/zjR+Cong+IcNaI9wy5sOfyw6h9oeOARHO
	 WHWou9yybqVhEQheGFZ2rdLX9BqwSrrvTvIxep3FBn3RvzaCA5T8b7vg2pJrI4UFMRZhx
	 nUIoBO9mWzx370112ehAInhpsvlSEhWDenVxc20J2ZfsCqBLwUenDQTQb0fV2tVaQtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864905;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
	b=TezEREuAAVDxHY2JmHChBy0XqJoxgCRPmkT2jggL5yfnwqgyEl3Mj4Uhu5ZlvOolOUSs
	 bu0KQibLleCAyEsRJ/yyLglJek3vuFL5phNsjoNaQGaONqBt4d9A+o/w0cqMUnHU72LLE
	 0ww0GgnsMT5QA6FP+qcVbaqE5KJfEmCyVSj0AUTnyMa6nvzImcdPWxKiGvhmft03DHz3o
	 7hboR6F1qH8l4x7+Oj+rnn4wvgwJqXEchNcYk0VctiqguDcZgGKPq+MImYPIq53DxEYtK
	 GlitiVaeUUMOHtA82hyH2KbOuTA98jgajtFAQoc1muxji7vkQw8ENO3PCxk1vPnxs4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=SyIEcNnC;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01AA606A894
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:35:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B01AA606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=SyIEcNnC
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cddac941ed1so1869678a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:35:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864904; x=1795469704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
        b=fC5S/DrVjCO7fz3uS1p4TXhfcjwP69kXlTYX9tlpfFjduvxMq0JqcIvDHgzcLQn9aa
         8npwY5V62OJZU8pjmn93TeZ3RjlkOYsTrti6NRkyvz4TLjYLK/Z3KhGXYRNlYvfhdhtd
         ETCGrLJJcXahkC2lu1OaF4CWHAhDPEX/PM7CsUB6cdC4Z1m0szgknCale8cKDZLAZfyt
         GUbtYXkjiH2GnbtuFh4ydqNnNxNnaeIyy5FIdl31nqzzTWD83DUr/x799BDwoF/0Annk
         TKfzpxF60WU+zmRT9DTvpYA33saJPEWH8+4nbz+YFynN3hRE8Q/TwYUs8OVGQyu2k1u0
         qE1w==
X-Forwarded-Encrypted: i=1; AL+hErHh6piT9AnlL63wb/ooAjcsn+FptHZXo/PXJUaDng0lL26ePNio16/O2wE+uuJvIPfK60mLJxPfPAyfoGU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oj9TwTN5ovWRGil8Kl3HQo5IXlPqSjK56VmblN8Kfv5yElvhF
	V/t7+R8ZstmcYQtNFAf8YRppd3QUB5D+rPThQZZe6k3EOMxctHJgjC7NDpnX9d/x54BXOFYla4Q
	s+gwkgdYWrm2723jsLzwl2ih5NBMPh5sOoYNdMZkCWRYZxu72JDepYNkwhKG+UqgY6i6IF8Ju2W
	95Wl+oIaeL2KpeKpBM/qXlQ6l8cNlJBBHpbtry3nViUrk5Mbo8nqonhFCdE4Qf8odDzUa0HXzX7
	uOodFXyju5mW01FUauJ770Y
X-Gm-Gg: AZFdTZf+p3gPqFRj0abS2gcqagRix5Ie0FJ3UpMyC8D25277Gabz7UD57HijR9Ej/M1
	JItapVsYJngpHCrYy5P9zlpmE9UokfQaFN7vzWzbMGNm7Pv32UWhmYFtkD56CV46+9aW/KekBvs
	rJydDzfTKDvxlWMe+ZJsIdZUj5kL6nkGWtSoOuvOBvH3I7EvzelP3BTTflhV+1C8LxP2xBxWT30
	c+uZNlLL2qWPBESwrpxnDSmoP1zoWU5nFPrJu+OhcV9qeSQdA2yk7N1Vc90WWuITant4e6oFhOv
	91gw1qcIMuidHxD5w4hrricPneY7jT1d2pAfp+eXtVoUufMc8gXH+mf0ncFiUA+XJ4OzcxOeSJX
	flV25nXvsFPN2ClswayRQwznkULp7MzyxLAs0ikQTFIvFhdPwmz+EVWxkfSwICfTqv6wnTQ32WT
	9g0TX4TL904mfhhsQCrdHHjd5Rqh4Wze87d409JvarPhI=
X-Received: by 2002:a17:90b:8c6:b0:3b1:b66a:c05 with SMTP id 98e67ed59e1d1-3b1b66a0d23mr6958256a91.14.1794864903835;
        Mon, 16 Nov 2026 13:35:03 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3ab9f198fsm468571a91.0.2026.11.16.13.35.03
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 13:35:03 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91ea0c20af3so71934536d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794864903; x=1795469703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cKpRja5KzmuFV6Ut12Ip5OUUMuzPvD7GprkqoloD8t0=;
        b=SyIEcNnCq7wD5MikYuApfcnbLY7LIyWfduf041o3c3Gcl5kaDPPGj1IY1I1nFbq4pU
         m0NKmJZg5MkXwDgyUcZD39vPZ1pAtH/2yGqndJnoMD0u/efqWVotJziGkvI3nOqcoinA
         ZjshZA9P1F158UWcOPbuV6Xz2g/JRHrgvP/gQ=
X-Forwarded-Encrypted: i=1; AL+hErG9s33er0kkWEiIhGpVtI0TpEyO7hHIyx4C5tdkZw/VQk22iO1Kc4D2EOT8cNlENBNnlL2iZqiZUqQtn7g=@vger.kernel.org
X-Received: by 2002:ac8:5ac2:0:b0:536:2fd8:a4d8 with SMTP id d75a77b69052e-55ac667dfbamr194352331cf.15.1794864902459;
        Mon, 16 Nov 2026 13:35:02 -0800 (PST)
X-Received: by 2002:ac8:5ac2:0:b0:536:2fd8:a4d8 with SMTP id d75a77b69052e-55ac667dfbamr194352011cf.15.1794864902027;
        Mon, 16 Nov 2026 13:35:02 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d34a139f6sm40744171cf.22.2026.11.16.13.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:35:01 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Doug Berger <opendmb@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list),
	Mlody12 mlody12 <kudzo51@gmail.com>
Subject: [PATCH net-next v2 2/4] net: mdio: mdio-bcm-unimac: Define MDIO_OP_SHIFT
Date: Mon, 16 Nov 2026 13:34:47 -0800
Message-Id: <20261116213449.1682731-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116213449.1682731-1-florian.fainelli@broadcom.com>
References: <20261116213449.1682731-1-florian.fainelli@broadcom.com>
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

The MDIO_CMD operation code field starts at bit 26. Define
MDIO_OP_SHIFT for it and use it to build the opcodes instead of open
coding the shift.

While at it, rename MDIO_RD and MDIO_WR to MDIO_RD_C22 and MDIO_WR_C22 to
make it clear that these are the Clause 22 opcodes, in preparation for
adding the Clause 45 ones.

No functional change.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/mdio/mdio-bcm-unimac.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/mdio/mdio-bcm-unimac.c b/drivers/net/mdio/mdio-bcm-unimac.c
index 80fb3b5b52ab..5f79f31220f2 100644
--- a/drivers/net/mdio/mdio-bcm-unimac.c
+++ b/drivers/net/mdio/mdio-bcm-unimac.c
@@ -21,8 +21,9 @@
 #define MDIO_CMD		0x00
 #define  MDIO_START_BUSY	(1 << 29)
 #define  MDIO_READ_FAIL		(1 << 28)
-#define  MDIO_RD		(2 << 26)
-#define  MDIO_WR		(1 << 26)
+#define  MDIO_OP_SHIFT		26
+#define  MDIO_RD_C22		(2 << MDIO_OP_SHIFT)
+#define  MDIO_WR_C22		(1 << MDIO_OP_SHIFT)
 #define  MDIO_PMD_SHIFT		21
 #define  MDIO_PMD_MASK		0x1F
 #define  MDIO_REG_SHIFT		16
@@ -99,7 +100,8 @@ static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
 		return ret;
 
 	/* Prepare the read operation */
-	cmd = MDIO_RD | (phy_id << MDIO_PMD_SHIFT) | (reg << MDIO_REG_SHIFT);
+	cmd = MDIO_RD_C22 | (phy_id << MDIO_PMD_SHIFT) |
+		(reg << MDIO_REG_SHIFT);
 	unimac_mdio_writel(priv, cmd, MDIO_CMD);
 
 	/* Start MDIO transaction */
@@ -139,7 +141,7 @@ static int unimac_mdio_write(struct mii_bus *bus, int phy_id,
 		return ret;
 
 	/* Prepare the write operation */
-	cmd = MDIO_WR | (phy_id << MDIO_PMD_SHIFT) |
+	cmd = MDIO_WR_C22 | (phy_id << MDIO_PMD_SHIFT) |
 		(reg << MDIO_REG_SHIFT) | (0xffff & val);
 	unimac_mdio_writel(priv, cmd, MDIO_CMD);
 
-- 
2.34.1

