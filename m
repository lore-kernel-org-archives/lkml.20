Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864910;
	b=cvnutaKwRUYSwmHuO2I4qfKjqojCpbLRMLmAxN3zrvYBCX5mDQqJmAucfnZnG3cunvpZ
	 xPeSau4AnQ2wHz6yVMFQBCQaTjyTA971XkyT2h2LaP7TpOYuMjjpjUVY97RcSAIu6nnYV
	 a1u+gAGvzb9KgiWQT+ZTLMOWG8xsoEXnBcrgLxsjEV0VugD70xB8tJSmRJLbFB24da01u
	 4Jk7t80ms17HjgTATofrU69MTeRO5vcs4X8+Ygnr/wxxajzbFsl4Vi+uJwwN10pgV8aF8
	 Nub/PIM+bNeQruIqNPjHhnyw154NYKXlu7l8poVWdlsXwtWKZhu5YoJdReWj0GJDHcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864910;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=MUef634+Hi/Fgg3bEDigIW+3XODyCYJ/zUjM8ZRF2oI=;
	b=LEI/7aBDJmvA+ftkl8zdm82VPDBI7PoYej3pnLT3PR2t0EkN1eFIbln5Bbc0r8FekXoV
	 qzRnao6CtAljvsQvomAZrX9h5ffz4iDUJTkK8NbQD7Jyn8LveVXyJzPqsMea8RuwwIRJA
	 hHfYn9L2akjkiTWK0z35rVdaSD2N4oSisRV2NJCpLgFgnA+F5sIjmB+M5BJEXplFknSSR
	 +N86xWvS7W0+gg3NyXkigs9MKIe39FbuiwTGuxL8/pQOXoTGT+IPsZL7H7HEtcdLO8+pF
	 qKIf7qiY+vo5vj1trnc7m/p/mpEBT+cHMiEeDumap8rRIiQuoJe4rKPqBjjDEeBe2Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=MPgdHzXP;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0843D606A336
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:35:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0843D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=MPgdHzXP
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso1907196a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:35:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864908; x=1795469708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MUef634+Hi/Fgg3bEDigIW+3XODyCYJ/zUjM8ZRF2oI=;
        b=zrp177abmFbD3fvILF60BL4oOnKkg/cOyqFJ8LUZwfs4qAALtv4LFvww5n2BB2nDjV
         20iBDjFx9bD9uEc1jmxy9ZHTEBo8Dmy4VLzfFX2t2EOslpSXfko2wk5Yd8Ti9/L5sk2/
         oot+UYDHtkktFcL3l5+2hxJOVoZvwCz6IBnzlG9O94CAcbrXi0RfG85GGv3Ao/gDNZ1R
         c8VRFOzjsiu+4C3XBltStMMs88pVufGN+FHvL6gHmXhO+nx0smBw/iJvZok0jel7I5zk
         JUqbfR7PawsbkqdoJCPwhkOhBS/+3dK95WrfEr2XkoqYGi5h9J9nwo9RpmznSf2SDauN
         foWg==
X-Forwarded-Encrypted: i=1; AL+hErGm1X8wvz/BGA22eKc8ktXp6fSNiGFCq0ukiIyejtOIIzIJBgvlA7HkHRj0dQiwDB3V+rwbS0rYLP3mTUc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9aOLF7HPEEaaAEwpLnB6V++G/enAM+fVKCdi6pGALOOlh7KI/h
	AOBmg6Cu1AaNH62+p3TlH557eWBWdb5PEErdDdZIH4IK4e9xGWgAhLT7tkBPoD5ahxI7Ed7MGur
	VQyHHG8x+flq0WmCk9VRxVS9Z3CLbeP7Ctc5d7LoSUCPIu5f7LHyPLZ2CttqNp3PxLtcEhL31Oy
	XSaTSEeLzZ/7nb8FfHOogUgJDEXMdY/QuYbNmFF4WR6xKWZ0tB8Rb8yHoSWWXpfMbAQNxXZ1VNN
	rrC7zi0f8RdQzX1rVC9GuaW
X-Gm-Gg: AZFdTZc0WZXbJ6lh7VQdw5RSVHQOLjzAPAaD8cCRARSTi/jVt3gmGU2ou9JSnSbxpo5
	Oj4EsymPUxDroUk8eWj+YlAHO34Ys38vehlP6VKpvNHM5THXnpuvVVzROkoCQjBhF76ZcDdZCwE
	zg0s9WBCkCwPuPzUOjR8NW68412xl6WAttJ7taAnFHgw9D8xe+eECb/kZRXdwDrNz+uBI7EGNqB
	8BgBrqTLh5jL5a2jmoT2Tqt32Enbe+/QToePqBCUtzUWWtRsuzoMTPsmU1+jQYym7XLCXvc/OnP
	Q/B8xMZVRQtH7onPwVkGAaE452VEq8rrT0iBgupgIcJ6cfS6AJ+oSrwpy7rzTOhDrziH+DVhqQg
	Laq6xTtY6+BVJgzncOLqwTwVpzwuZzQqUFDqMYRBYUgbDvjzbO/HCmoav20IC57SUDlU5x7FJ3M
	LA91OjtVj9LpM4ABuHiw2NyYWGhUu0/hcZLWkOGHJR
X-Received: by 2002:a17:90b:56cb:b0:3b0:a9de:9880 with SMTP id 98e67ed59e1d1-3b1b0a3c5e9mr10697285a91.33.1794864908049;
        Mon, 16 Nov 2026 13:35:08 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3a2d07d60sm494138a91.2.2026.11.16.13.35.06
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 13:35:08 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5363763b556so76157701cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794864906; x=1795469706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MUef634+Hi/Fgg3bEDigIW+3XODyCYJ/zUjM8ZRF2oI=;
        b=MPgdHzXPSH4Rlvp+TcnOObqGjdGqrAamrexVUMXv0S+68/Ls4HEidRERhx5l1HCJ/p
         ugjlahj+fh/iTQUe1rXtLMJtAxK0zrg1TQRy+oga5eKOJvVTDdum3x3kHeg+C4GyviUO
         QdyLuUWF88JX8ebydjRf0QHhywcdswbljO2Fk=
X-Forwarded-Encrypted: i=1; AL+hErFZJ0GIpRmK+7KAmGlQZSumYujRZavD64fWpaJevimJSB9olSBBrXtTlAvqvSQkNN+bZqi3kF7FrZVHIVU=@vger.kernel.org
X-Received: by 2002:a05:622a:ea18:10b0:55c:2c73:ba86 with SMTP id d75a77b69052e-55c2c73be22mr105400541cf.28.1794864905652;
        Mon, 16 Nov 2026 13:35:05 -0800 (PST)
X-Received: by 2002:a05:622a:ea18:10b0:55c:2c73:ba86 with SMTP id d75a77b69052e-55c2c73be22mr105400291cf.28.1794864905236;
        Mon, 16 Nov 2026 13:35:05 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d34a139f6sm40744171cf.22.2026.11.16.13.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:35:04 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Carlos Soto <carlos.soto@broadcom.com>,
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
Subject: [PATCH net-next v2 3/4] net: mdio: mdio-bcm-unimac: Poll for completion at 1us granularity
Date: Mon, 16 Nov 2026 13:34:48 -0800
Message-Id: <20261116213449.1682731-4-florian.fainelli@broadcom.com>
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

The current polling code unconditionally waits 30us, which was sized for
a ~25us Clause 22 transaction, and then polls MDIO_CMD with a sleep of up
to 2ms between samples.

Adding Clause 45 support means that every access becomes two back to back
transactions (an ADDR cycle followed by a READ/WRITE cycle), so a fixed
delay sized for a single C22 transaction is no longer meaningful, and a
sleep of up to 2ms between samples can add significant latency to each
access when the transaction has not completed at the first sample.

Instead, poll the MDIO_START_BUSY bit every microsecond so that the
completion is noticed as soon as it happens, regardless of the type of
transaction. This turns the wait into a busy wait, which is bounded by a
timeout reduced from 100ms to 1ms: a 64 bit MDIO frame takes about 33us at
the lowest MDIO clock the driver can program from a 250MHz reference clock,
so even a two frame C45 access completes well within that.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Co-developed-by: Carlos Soto <carlos.soto@broadcom.com>
Signed-off-by: Carlos Soto <carlos.soto@broadcom.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/mdio/mdio-bcm-unimac.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/net/mdio/mdio-bcm-unimac.c b/drivers/net/mdio/mdio-bcm-unimac.c
index 5f79f31220f2..df267bb82696 100644
--- a/drivers/net/mdio/mdio-bcm-unimac.c
+++ b/drivers/net/mdio/mdio-bcm-unimac.c
@@ -6,8 +6,8 @@
  */
 
 #include <linux/clk.h>
-#include <linux/delay.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -36,6 +36,13 @@
 #define  MDIO_CLK_DIV_MASK	0x3F
 #define  MDIO_SUPP_PREAMBLE	(1 << 12)
 
+/* A 64 bit MDIO frame takes ~25us at 2.5MHz and ~33us at the lowest MDIO
+ * clock the driver can program from a 250MHz reference clock. A C45 access is
+ * two frames, so a 1ms timeout leaves a wide margin.
+ */
+#define MDIO_POLL_DELAY_US	1
+#define MDIO_POLL_TIMEOUT_US	1000
+
 struct unimac_mdio_priv {
 	struct mii_bus		*mii_bus;
 	void __iomem		*base;
@@ -79,14 +86,14 @@ static int unimac_mdio_poll(void *wait_func_data)
 	struct unimac_mdio_priv *priv = wait_func_data;
 	u32 val;
 
-	/*
-	 * C22 transactions should take ~25 usec, will need to adjust
-	 * if C45 support is added.
+	/* C22 transactions should take ~25 usec, C45 transactions take about
+	 * twice as long since they need an address and a data cycle.
 	 */
-	udelay(30);
-
-	return read_poll_timeout(unimac_mdio_readl, val, !(val & MDIO_START_BUSY),
-				 2000, 100000, false, priv, MDIO_CMD);
+	return read_poll_timeout_atomic(unimac_mdio_readl, val,
+					!(val & MDIO_START_BUSY),
+					MDIO_POLL_DELAY_US,
+					MDIO_POLL_TIMEOUT_US, false, priv,
+					MDIO_CMD);
 }
 
 static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
-- 
2.34.1

