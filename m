Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905402;
	b=dp+NEOLl4ovWqBZ2onQRBn4Os9AB7SsNsjk+yN3tBXlWCTUMcDRetLB2d6jUssRLWm3n
	 oh+0ZxKAq1O7BUawIGeQr7Pf90pIgOeermlCS8pVKaQJcFVIsSUipMxwEWF6Kb5nEfW7P
	 q2T/Lu0x8X1vYw8yeITfIqCiPBHr8vbsHvPglT8zdsATuVnk+ish0JMt2ugqvaH2dyBe9
	 begdOb9e4gp77RYs7wFCy/EhEmVadyNu4DIPFvOod1QU/Yd3OcJLmeCdsAsh7UCiDbVY3
	 1CgBxP9XZ8KK9/okIo+270zPV19s7Yo4Pb3KzIKnqfht6HP53MjKGsjLiM9nKjEZt9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905402;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=E/RFP3wsLpPNC+geMO+1/yPZx+YppweJwf0WP+dI9gc=;
	b=5UZB551leW4F2WMx7FeOsiB0JVrh8vLZFH324Lm3sOTML1sMtEiR4T0rZaSu6jvTXjBX
	 3c30uvaklMjqh1I4wUIvgDiYiQxjb8q3vmG34WwMTWEQtsmBsKHLwozcaG1eeM/sM32W/
	 vkR8F3t3tFpqtLCDU1W/OB8dNPPZqQYHNlfdLjwbrtcytukRqb0o9QXmmZFru2E/UPM8y
	 7CYbOkEy2m3akCSACzF6Uj+SOy8LKy60yIFkgEV6uTgHD212JEFwaEQ3+YFDSvYW7K61B
	 YOSTNAvf4y9P3uxdEoyH/ndiyudxyOAkOsAivTcpOdpbLFwQYdExDIl3F9jtvI4qHaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=jonasjelonek.de;
	spf=pass smtp.mailfrom=jonasjelonek.de;
	dkim=pass header.d=jonasjelonek.de header.i=jonas@jonasjelonek.de header.a=rsa-sha256 header.s=s1-ionos header.b=vqrld4rA;
	arc=none smtp.remote-ip=212.227.17.13
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449F9606A889
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:49:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 449F9606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jonasjelonek.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jonasjelonek.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jonasjelonek.de header.i=jonas@jonasjelonek.de header.a=rsa-sha256 header.s=s1-ionos header.b=vqrld4rA
DKIM2-Signature:  i=1; m=1; t=1794905381;
 mf=PGpvbmFzQGpvbmFzamVsb25lay5kZT4=;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=jonasjelonek.de;
 s=s1-ionos:rsa-sha256:IPeQ0mGHX+yzstr/I6w7m9wHTbFX
   sZWKto/cRorCosJjq5irK2OoB4bSyWIKg8ZXI7PmMa7NihwMeqlFEDnDXYBb5FiYSO1kWcTZ4tm
   w9dWfYMU5sRlDukYLvdkAG5Yix+i+Sd3Yfcj58Gml4W/Z7LJHDJVqZlnFZgGFA9y0arqR1oriVE
   f/sppPwPWMdVCR5dwbPyTvATVm6puEB3hgGMS687Cr16EiCVz1STqmDFqng+0pPsOG3Kjgb8YDx
   BAV15/R/PneFCbdO2kf8ZBri7ZuX/i5e8k2ES2B3bXhDNqmoX5OKztGnwJForcUZaej1vcUz56n
   aq3SyHsLEH1U1g==;
Message-Instance:  m=1;
 h=sha256:
   aFN7WPqU9k+V5anpWemxAEZ9Ygd345uxr3sVYkqCkdg=:
   mgQEqV6Qa+9ciGJucJIqoAeYrahEWEFblmyXCxYmFlE=,
  sha512:
   n4a9BFIYm7gxL9pSeyeaxDA0lvLkhcB9gQDzPemaV1ZHtB9k5nb7uClNF0Kmf+hWWZHhXNLDEM0GUnpFDNfZTA==:
   HkD1caWtXrhOC5szqlQD6TcqIwrUB8T45F4MVt0GhgmCh3ApWNMm8lHh2UO1tcM3Y6ARDGM1yraWxyIXmw8EJg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jonasjelonek.de;
	s=s1-ionos; t=1794905283; x=1795510083; i=jonas@jonasjelonek.de;
	bh=E/RFP3wsLpPNC+geMO+1/yPZx+YppweJwf0WP+dI9gc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=vqrld4rAE89GSKJyeJMXrapjoZmgWR5Ww16UIULWl0V+V+c1rjXKvDNZD6dqd5bg
	 aIJWTZvWiIDZC3yEeZ0yaG/WedJVhg0MCnZP/JquFhcBQJxxAmuuzxU6pPakqy7Ue
	 3h+ImmSxPoaLgr6gIG0VKuV3p17GJjgxl25v8JHG0Tzrv1QYxXYChQkoD6VZkwUUc
	 W6u94C3ZDG7S3BSGN5k7jcSNY/xuHzOPSN0nm25ZtWHYuli4HdNEe7T0/euMmK42l
	 xZByYfft/Tve5l0bPF2afVm1gR7rq6IRtV6t+iVl2ybe0NQNhtqqgBmV+oX9p5BiB
	 W2AMRG5Qs6lBBJA85g==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue108
 [213.165.67.113]) with ESMTPSA (Nemesis) id 1Mate1-1wsoZt4BdD-00Zcms; Tue, 17
 Nov 2026 09:48:03 +0100
From: Jonas Jelonek <jonas@jonasjelonek.de>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Jonas Jelonek <jonas@jonasjelonek.de>
Subject: [RFC PATCH net-next 2/2] net: phy: add Realtek XSGMII interface mode
Date: Tue, 17 Nov 2026 08:47:48 +0000
Message-ID: <20261117084748.2387647-3-jonas@jonasjelonek.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117084748.2387647-1-jonas@jonasjelonek.de>
References: <20261117084748.2387647-1-jonas@jonasjelonek.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fyTWJNMXZOGI2apJLpiMdC1QqQowHr0FYkXcz+aRyO2S4BcvyG5
 OsH4l0LJQ6iPPP3C/S/mieZn9v/CYqSMWsPC7mECQ3qFqKhPi3mRLWci9itI4fpprmedrme
 +eC8gZvfP+8oUE+QEXI0SzXL6t9835RMBYgiC/dplSEzBkTQV/kSqv3UwK8KKNriP5v4uuz
 mR27H2Pbp4N/UQ04NgTLg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8HrvPPkEzUk=;h0anzsgWv8oLWxkLTEWZjVpzFpl
 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
 OVg==

Introduce PHY_INTERFACE_MODE_XSGMII for Realtek's proprietary eight-port
MAC-PHY interface. Append the enum value before PHY_INTERFACE_MODE_MAX
and provide the xsgmii string mapping.

Report eight carried ports and per-port 10/100/1000 Mbps capabilities.
Handle XSGMII as a PHY-status interface in phylink, accepting in-band
status and limiting the maximum per-port speed to 1 Gbps.

Document that XSGMII's transport capacity is independent of the number
of enabled ports. A dedicated mode distinguishes it from USXGMII and
10G-QXGMII without inferring the wire protocol from the active port count.

Signed-off-by: Jonas Jelonek <jonas@jonasjelonek.de>
=2D--
 Documentation/networking/phy.rst | 7 +++++++
 drivers/net/phy/phy-core.c       | 2 ++
 drivers/net/phy/phy_caps.c       | 1 +
 drivers/net/phy/phylink.c        | 3 +++
 include/linux/phy.h              | 4 ++++
 5 files changed, 17 insertions(+)

diff --git a/Documentation/networking/phy.rst b/Documentation/networking/p=
hy.rst
index d53067ab1a61..675787c4ab52 100644
=2D-- a/Documentation/networking/phy.rst
+++ b/Documentation/networking/phy.rst
@@ -327,6 +327,13 @@ Some of the interface modes are described below:
     This is the Penta SGMII mode, it is similar to QSGMII but it combines=
 5
     SGMII lines into a single link compared to 4 on QSGMII.
=20
+``PHY_INTERFACE_MODE_XSGMII``
+    This is Realtek's proprietary eight-port MAC-PHY interface. A single
+    SerDes lane operating at 10.3125 Gbaud carries eight ports, each supp=
orting
+    speeds of 10Mbps, 100Mbps and 1Gbps. The interface describes the tran=
sport
+    capacity, independently of how many ports are enabled. It is distinct
+    from USXGMII and 10G-QXGMII.
+
 ``PHY_INTERFACE_MODE_10G_QXGMII``
     Represents the 10G-QXGMII PHY-MAC interface as defined by the Cisco U=
SXGMII
     Multiport Copper Interface document. It supports 4 ports over a 10.31=
25 GHz
diff --git a/drivers/net/phy/phy-core.c b/drivers/net/phy/phy-core.c
index d7a4a977fc8a..2dd36fa18e2c 100644
=2D-- a/drivers/net/phy/phy-core.c
+++ b/drivers/net/phy/phy-core.c
@@ -201,6 +201,8 @@ int phy_interface_num_ports(phy_interface_t interface)
 		return 4;
 	case PHY_INTERFACE_MODE_PSGMII:
 		return 5;
+	case PHY_INTERFACE_MODE_XSGMII:
+		return 8;
 	case PHY_INTERFACE_MODE_MAX:
 		WARN_ONCE(1, "PHY_INTERFACE_MODE_MAX isn't a valid interface mode");
 		return 0;
diff --git a/drivers/net/phy/phy_caps.c b/drivers/net/phy/phy_caps.c
index 558e4df4d63c..0de12c42c47b 100644
=2D-- a/drivers/net/phy/phy_caps.c
+++ b/drivers/net/phy/phy_caps.c
@@ -313,6 +313,7 @@ unsigned long phy_caps_from_interface(phy_interface_t =
interface)
 	case PHY_INTERFACE_MODE_QUSGMII:
 	case PHY_INTERFACE_MODE_SGMII:
 	case PHY_INTERFACE_MODE_GMII:
+	case PHY_INTERFACE_MODE_XSGMII:
 		link_caps |=3D BIT(LINK_CAPA_1000HD) | BIT(LINK_CAPA_1000FD);
 		fallthrough;
=20
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index e885da1c2831..0028b543c788 100644
=2D-- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -263,6 +263,7 @@ static int phylink_interface_max_speed(phy_interface_t=
 interface)
 	case PHY_INTERFACE_MODE_PSGMII:
 	case PHY_INTERFACE_MODE_QSGMII:
 	case PHY_INTERFACE_MODE_QUSGMII:
+	case PHY_INTERFACE_MODE_XSGMII:
 	case PHY_INTERFACE_MODE_SGMII:
 	case PHY_INTERFACE_MODE_GMII:
 		return SPEED_1000;
@@ -812,6 +813,7 @@ static int phylink_parse_mode(struct phylink *pl,
 		case PHY_INTERFACE_MODE_PSGMII:
 		case PHY_INTERFACE_MODE_QSGMII:
 		case PHY_INTERFACE_MODE_QUSGMII:
+		case PHY_INTERFACE_MODE_XSGMII:
 		case PHY_INTERFACE_MODE_RGMII:
 		case PHY_INTERFACE_MODE_RGMII_ID:
 		case PHY_INTERFACE_MODE_RGMII_RXID:
@@ -1046,6 +1048,7 @@ static enum inband_type phylink_get_inband_type(phy_=
interface_t interface)
 	case PHY_INTERFACE_MODE_PSGMII:
 	case PHY_INTERFACE_MODE_QSGMII:
 	case PHY_INTERFACE_MODE_QUSGMII:
+	case PHY_INTERFACE_MODE_XSGMII:
 	case PHY_INTERFACE_MODE_USXGMII:
 	case PHY_INTERFACE_MODE_10G_QXGMII:
 		/* These protocols are designed for use with a PHY which
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 21afc2082b17..ffff2a6313d3 100644
=2D-- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -107,6 +107,7 @@ extern const int phy_basic_ports_array[3];
  * @PHY_INTERFACE_MODE_LAUI: 50 Gigabit Attachment Unit Interface
  * @PHY_INTERFACE_MODE_100GBASEP: 100GBase-P - with Clause 134 FEC
  * @PHY_INTERFACE_MODE_MIILITE: MII-Lite - MII without RXER TXER CRS COL
+ * @PHY_INTERFACE_MODE_XSGMII: Realtek proprietary eight-port SGMII over =
10G
  * @PHY_INTERFACE_MODE_MAX: Book keeping
  *
  * Describes the interface between the MAC and PHY.
@@ -152,6 +153,7 @@ typedef enum {
 	PHY_INTERFACE_MODE_LAUI,
 	PHY_INTERFACE_MODE_100GBASEP,
 	PHY_INTERFACE_MODE_MIILITE,
+	PHY_INTERFACE_MODE_XSGMII,
 	PHY_INTERFACE_MODE_MAX,
 } phy_interface_t;
=20
@@ -286,6 +288,8 @@ static inline const char *phy_modes(phy_interface_t in=
terface)
 		return "100gbase-p";
 	case PHY_INTERFACE_MODE_MIILITE:
 		return "mii-lite";
+	case PHY_INTERFACE_MODE_XSGMII:
+		return "xsgmii";
 	default:
 		return "unknown";
 	}
=2D-=20
2.53.0

