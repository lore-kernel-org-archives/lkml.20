Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604584;
	b=oUFYBX3TEP0LC7ijIbtgL4e0OLYC32P5RcQhVuZVQhWATWT+toN2a6riLtXS4ix12UQK
	 SarzBaiPvWS6odVFY+OUx3OYTZDGUDHIhfREmibaho0I1/NNXQOSzDOxGlk9k9lP2UPSX
	 2/WFqANWw07T8Wyt8w41Q9mAXloKh5kf9djiPjm6zvP1pPXS5OdvjhTGZIfHexjvBtWEf
	 EBntjSKb3CIvN6DrIaJ5lHcc8Q++k3NRP7vYu6HBGJbcG99axhqcRkZdatzxtW+MZmiGw
	 F+vMtTX/mxLkoyqeL6WUqdwPjilj88eH8pyszqNpM7JkPBIsQ7Yk5bqCjBGsls5X6aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604584;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=REMqjhcT8PUofM8kCe064WG9qt5BO/yjjbQ0zdHompI=;
	b=hJSRyR1uBlkjqoAxONM1e4oJIXJ6MgZNr+IhGSrvHqU0MYbQohgDAYmznW6QKq1flQn2
	 pwAWTzfCi0tWaUQTwHJROqNbQD+4Y90RRvg0h2HPjPOr/eJuT0cUMVNxPy69xTU3I6HnV
	 5VkyBvaTXzjKgGEs4AEQ2qLwGwkZ+nPbLiF2ODKbJehJGBcHn58c6u8f1Viu99ITJwjQp
	 lXXFCXZK8IPUi8BaeQuQHYygXhHp494x+lK7xTMpZUi/tdKy8FYLpkenFiXXMArIRa1zc
	 em1apMwG8vFVw1YpO9c8fsXyK+dfJhcpPQMDel7tkuqvQZGJiNo4uunuGA7ZnPD+foA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=F65JNHJs;
	arc=none smtp.remote-ip=209.85.161.99
Received: from mail-oo1-f99.google.com (mail-oo1-f99.google.com [209.85.161.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5522606A894
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:16:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5522606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=F65JNHJs
Received: by mail-oo1-f99.google.com with SMTP id 006d021491bc7-717034b331dso1596026eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:16:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794604583; x=1795209383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=REMqjhcT8PUofM8kCe064WG9qt5BO/yjjbQ0zdHompI=;
        b=GqAZd939Z+joS09HztV64gIk+TPvDCF+UjC0NhuGYqjQsxGTqu3Kjyh4EOQByjRhFL
         bJBrTfXBF1P57cfiJpJpiaf+pfU/rOLuxzMKiF5Jndwvmo+v5Y/eItDXXMuIADvbpIb+
         BF7sFcyEkpvqz03hQXFVj85WTlqhrTjDXCkpT5pbiWWvwQWjkR8U4O4e98HhycMZxQUe
         Sc9ZM0jztNQVc4tBjAfzMcXNA0C1lwh/TFqoiiS3eB7PKLrHUd/lYBOXcG5PRbAxvgHW
         Q0TwDtQ1hBsVfr7oNJPkyj6g+zljpiXnKv/M1Pv6xh1D29ideZ+kE98zvcaSqe9Cgbyz
         Fjig==
X-Forwarded-Encrypted: i=1; AL+hErFrh4cp6JiL0W/Q4WGsF3JIbYdX6wsSrTpmx6C2QMRV1rwsV+e48DkUL6AteOciEs/KRvqmukP9qqBsQvU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ka3mc+OgjNGd43G+E+epjjVzTjxYEGI0xrLWxhTCfs6Vp+2Ri
	KoJvqX7YuV1OrHn+six+AiI2sPoosnK0CgFSFqaL+KKei2ZuXj6f37a+g+tbij2Bgq/uaEVVn2K
	RIIQNDRavCvIeeHzbaEiuJSySLkrFYplQuk/d70ld4Fhhbp96foeUDOdoU4Y0qfX+5MyNEW66NC
	MftgNeoZcx7ydb9mtkSvjG/Z35nyKoux2fHhaSi8r/AXPnkfFU5lF/QpY7UI4gGWuh9TiguuW1O
	RUwPA60/HZmpmxEBdIxEAYG
X-Gm-Gg: AYBFou1YhPWsVPBm7lWPXDWdXXyBOTxTR/Czta5X5QCeEYSVHGfBLzW9GL39XqgEhvM
	aWIBxOhMPyfmHKNT6MWU4VKBr5j9MiiwuppvJdaWvIo/+01q/tlSuaLLpg2fGJqT39M8+HsLKeD
	rROtTc9xyAyU3mOVqn3Kel78MsdGEcVdNRHHNTwXy7QFH1d2jPLf1my83fYiDa6RyLONjO4/isF
	bic/kFPNPD6yN0FBhIgw2az0eo+1+u/zY/nioNObsTh1PaUNgaZ889HiNRpO2LY5Sw6LcWXRti/
	dWaEJrc4ysgTjMM1b77g1c9k1XhuTRzVgIwgY8BZNjePcAFbYJ3PHfw8Q0ETlHcRlT16Q5FR/+H
	nKcL70kFgouet4Gp2Ns+F/Gv6BmL7c+Df5tHgCS1yusnYunWv2emXq6L5sais8xjStrq4IAwkrq
	KzaEVolbAEuQDtbjF6nOQek4HGRhD8YOZm2Ojka61b
X-Received: by 2002:a05:6820:f00a:b0:708:d449:478d with SMTP id 006d021491bc7-71ab51a788emr2425730eaf.74.1794604582786;
        Fri, 13 Nov 2026 13:16:22 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 006d021491bc7-71ab419f7dasm107352eaf.21.2026.11.13.13.16.22
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 13:16:22 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f6f4fe531so268728185a.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794604582; x=1795209382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=REMqjhcT8PUofM8kCe064WG9qt5BO/yjjbQ0zdHompI=;
        b=F65JNHJsuKoNa+DxTouGa3jnTj32muWjNhCNJjr4ZxYGTsYPbYZE9s4LpEU25Z1+W4
         wy717nLY0e9Yvv7QdMdhAp1XJ1mH3TUvkOJYS6ro8n1zb/2nDNS9g2Eq8quFYDrM/8LY
         wrohySFVFeIhyYAUusQQK2eZ86Wvzpg6jEeYU=
X-Forwarded-Encrypted: i=1; AL+hErG/kasYQ1AQKrBZ2SVKtAmpxndvPDbo/6CXzcqz+LZYtcKwYVd3q9OlLDiukta2Win4rw0hgVZu2ITF0p0=@vger.kernel.org
X-Received: by 2002:a05:620a:6cc5:b0:93f:16d4:3bf0 with SMTP id af79cd13be357-9494bb53433mr686917185a.42.1794604581799;
        Fri, 13 Nov 2026 13:16:21 -0800 (PST)
X-Received: by 2002:a05:620a:6cc5:b0:93f:16d4:3bf0 with SMTP id af79cd13be357-9494bb53433mr686912685a.42.1794604581301;
        Fri, 13 Nov 2026 13:16:21 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8f92bbsm273474385a.40.2026.11.13.13.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:16:19 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Carlos Soto <carlos.soto@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list),
	Mlody12 mlody12 <kudzo51@gmail.com>
Subject: [PATCH net-next 2/3] net: mdio: mdio-bcm-unimac: Poll for completion at 1us granularity
Date: Fri, 13 Nov 2026 13:15:53 -0800
Message-Id: <20261113211554.2058181-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113211554.2058181-1-florian.fainelli@broadcom.com>
References: <20261113211554.2058181-1-florian.fainelli@broadcom.com>
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

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
Co-developed-by: Carlos Soto <carlos.soto@broadcom.com>
Signed-off-by: Carlos Soto <carlos.soto@broadcom.com>
---
 drivers/net/mdio/mdio-bcm-unimac.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/net/mdio/mdio-bcm-unimac.c b/drivers/net/mdio/mdio-bcm-unimac.c
index 6df824aba75e..15a9880c3573 100644
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

