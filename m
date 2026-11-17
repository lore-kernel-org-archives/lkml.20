Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905322;
	b=OWB+jyHMLoMPG4A/ZSkHNVgc6XxBYCYHMlQhTJcR4daeSI3EC6abM+SB+CDBsiE7Wd0D
	 ZnFFjNMc1gH5Jc7jesA1LL8amkHX99cTWeJwJ5ICkt6BqJfSmorNzHa2v2Tz+Qh9Pj/E0
	 iEZvsT0pBfyc85s/1O7peCVGl8g8sTNrA3Ilqu/i3EzOOY3j+DhdvxT+1uhzVH0Fy9h42
	 BgaEnMEh/u6yHJLvqV4FTLEGW/hf2+ehh5iNg3TSmK8Su8Ujnq7E8+8sqH0VlFYTD/Gnf
	 mXyWVXYxjQWhr5XB2ONtxw1AEKFW4gooS4NRkyeWYINw05jrbVX8aI9BKlQRi8ktFyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905322;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Provags-ID:
	 X-Spam-Flag:UI-OutboundReport;
	bh=P1ClmoZsqJJJpB1373+KjFp+S9/BiM8sayDfKuWge9U=;
	b=2CdoMlfgKTCMn26jmqipk3k5j6BnyrkO0wplB7nOYlfZJtaXfq+sVAPNUkSgMN2Pg7v3
	 ymA3mZgrxhppsRidcPRazVlcGe/3sltMqU/AitgpkROM4fuihyqsYieKl9CLrT3oDOS7P
	 OJ7aU/OP+y+cWOUuAPBAaOb7e5aNCKnK/rm2wg3L57m2QhhGXUSt64CXIIIwOsY2RFOJk
	 OD+yB4I+V80w9tgIIa/3axa3KLG3A0/cNiCHaPLwigTSsXu02I11hHt2DftvcjEJAFoDn
	 8IDzLCNI/NWOSQzCLR1+tRiS0g1ous7kH+kNsf+RhChDRPxebC52uXH3tEC0bcCijyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=jonasjelonek.de;
	spf=pass smtp.mailfrom=jonasjelonek.de;
	dkim=pass header.d=jonasjelonek.de header.i=jonas@jonasjelonek.de header.a=rsa-sha256 header.s=s1-ionos header.b="l6r+CFU/";
	arc=none smtp.remote-ip=212.227.17.10
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55525606A8A8
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55525606A8A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jonasjelonek.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jonasjelonek.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jonasjelonek.de header.i=jonas@jonasjelonek.de header.a=rsa-sha256 header.s=s1-ionos header.b=l6r+CFU/
DKIM2-Signature:  i=1; m=1; t=1794905317;
 mf=PGpvbmFzQGpvbmFzamVsb25lay5kZT4=;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=jonasjelonek.de;
 s=s1-ionos:rsa-sha256:RQ8GGeHBpOB43MwHxZn+1w2y7c7y
   mqdJgGoKVVyEPKoH0Y3IbA7LYuWS+Gdnc9xVQvp1Aoa9ntAQu+KOvjYtfDopDi4rGixT5iNAbKr
   FltZVjdDSANLBhH9JZLZwZLXG6fIWg0zh/OXfmSJbB7u8HXRmyUE2Ymng3XM0DNXyqPqk4sHaEw
   yenp2QPky9Yi7sBar259H4N8r+BLqjwZnTJ8G0E8WWjv509dP+ZnBc0yCA4Uf1cd0rQw4N46Rih
   HrAfaHS/eMx3Iu+X8PIqxxs3V9KStU/onipZg765VtC55Nfj1DtJeOC3LxNh7PkqxugMIb5E8aQ
   MyAzlLkWA1ug1A==;
Message-Instance:  m=1;
 h=sha256:
   GBdWDsheRq8mCFgtA7++7ixj32vPZ8ox+KokO93kgLA=:
   ruHLTqrJ6FvrdfHca1vZQ9opy49MkaA+bRfzrIZf7BU=,
  sha512:
   RFExPx2pEJ1UoBeq0Z3U05JLTrGWQpmXUMU5KN9j3oTDG43G/PDMzxsq9ib6X9yx7DmhhvjyowI/mI+fAK9JAQ==:
   9nnMmCMz+WLgYWtWtngRCg1zUgOLylTSn0isAjNOP5EuiNI2I81oqO9r21TqAks7u1Z0R0yUw+h8rutY10xq+A==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jonasjelonek.de;
	s=s1-ionos; t=1794905279; x=1795510079; i=jonas@jonasjelonek.de;
	bh=P1ClmoZsqJJJpB1373+KjFp+S9/BiM8sayDfKuWge9U=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=l6r+CFU/1U7RmV565vXfxTwfGrxrgrSRbtuTOYCQ80PtVHwpBh3szw7O8ra2P+Ig
	 OZ9P6N7tN52C1Vj2cUIf6PKYoRIQbj3csk6uAT9GdexuWr2mWgW0qXgC8E7e7QNGd
	 DYHDXcNFo+DwJ9nvkvbCNT98aBPFZR2PTdyQPWUBcj7l3OobfTO94Kqe5qLiYq8J/
	 amBC/strsmuN6yxOAzjTmWeKmrdFzKWkVL8UlWljK1M3NdYMbugvM0WAnhmO7RnO9
	 lwVonfv0JinSRqzbLvJqcRieTSpTmgHO2YDLoqKa/WxPeWcxXr4xWxxwmqQMOgH7a
	 JjnureTEN1/NQeX1fQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue108
 [213.165.67.113]) with ESMTPSA (Nemesis) id 1MdNPq-1wuB5T27A8-00c5d7; Tue, 17
 Nov 2026 09:47:59 +0100
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
Subject: [RFC PATCH net-next 0/2] Add Realtek XSGMII interface mode
Date: Tue, 17 Nov 2026 08:47:46 +0000
Message-ID: <20261117084748.2387647-1-jonas@jonasjelonek.de>
X-Mailer: git-send-email 2.53.0
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
X-Provags-ID: V03:K1:XsOEw+7eWlSUf6jt9+H8MZzG3ZlVp0G/nbVmWm2fQBmo8hrxt0F
 ACuZCtIDhAZGo5zFEa2pvbVTdumlMaol29Na3FdM2hS1I3UDLl1jkHCSaaUJNU9MxGZAH5d
 KnDTtxbMQwrgg01QV3e3h5VptyZUmSvjdOnyfZRzzdO8xTZw0OLte881nRVTeELByECDGzn
 XF+Cf1lJt1L4+VRxOlyJQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ur9Ef8TBnto=;Dny9pf0tdX5h8mxiCzEicXxcO26
 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

Hi,

This RFC adds an explicit PHY interface mode for Realtek's proprietary
XSGMII transport. It carries eight 10/100/1000 Mbps ports over one
10.3125 Gbaud SerDes lane. Each logical port remains limited to 1 Gbps;
the aggregate serial rate is not a per-port Ethernet speed.

Motivation
=2D---------

The motivating users are downstream Realtek PCS/PHY drivers for OpenWrt,
including RTL930x/RTL931x switches connected to RTL8218D/E octal PHYs.
Their XSGMII connections currently use phy-mode =3D "usxgmii", with the PC=
S
driver inferring the actual transport from the number of described ports.

Not only is this a misuse of USXGMII mode, covering two very different
modes with a single name. It also starts to fall apart in several cases.
A specific switch being currently worked on uses an RTL8218E PHY but
only with 4 of the 8 ports actually wired and used. The device tree also
only has those 4 ports but the PHY still talks in XSGMII mode to the
switch SoC. This causes a mismatch, the switch SoC using USXGMII
(because of the assumption that 4 ports -> USXGMII, not XSGMII) but the
PHY using XSGMII.

Protocol identity and naming
=2D---------------------------

XSGMII is the name Realtek uses for this interface. Calling it simply
"octal SGMII" would describe its capacity without identifying its
protocol. Existing modes such as QSGMII and PSGMII already distinguish
multiplexed MAC-PHY transports; the PSGMII introduction is an example of
adding the generic mode definitions separately from a driver user [1].

Cisco USGMII is a relevant comparison, but equivalent port capacity does
not establish interoperability. Cisco defines Q-USGMII for four ports
over 5.0 Gb/s and O-USGMII for eight ports over 10.0 Gb/s, using 8b/10b
coding and a packet-control header [2]. Linux already represents the
quad variant as "qusgmii", with its own control-word decoding [3].

Realtek documents XSGMII and O-USGMII as separate RTL8218E interfaces:
XSGMII runs at 10.3125 Gb/s and O-USGMII at 10.0 Gb/s, with different
hardware strap selections [4]. The SDK also distinguishes them in
phy_8218e_macIntfSerdesMode_get() and applies separate initialization
tables. Realtek's O-USGMII is therefore the candidate for comparison
with Cisco's octal USGMII; it is not evidence that XSGMII can be renamed
to USGMII. Compatibility of those O-USGMII implementations would need
separate confirmation.

This proposal retains the vendor's XSGMII name rather than assigning an
existing protocol name to a distinct hardware configuration. It does
not assume a particular XSGMII line encoding merely from the line rate.

Scope and compatibility
=2D----------------------

Patch 1 adds "xsgmii" to the Ethernet controller binding. Patch 2 adds
PHY_INTERFACE_MODE_XSGMII, its string mapping, the eight-port capacity,
per-port speed capabilities, phylink handling and a short interface
description. The enum value is appended before PHY_INTERFACE_MODE_MAX,
preserving existing enum values.

The phylink change classifies XSGMII with the SGMII-like PHY-status
interfaces and uses 1 Gbps as the maximum per-port speed. This generic
classification does not prescribe a Clause 22 register layout or a
control-word decoder for a particular PCS implementation.

There is no in-tree driver conversion in this RFC. The intent is to
establish the interface representation before converting the downstream
Realtek PCS/DSA drivers and the affected DT descriptions. Existing
"usxgmii" and "10g-qxgmii" meanings are unchanged. Real users of this
mode will land once PCS and PHY drivers are submitted

Feedback
=2D----------------------

I would appreciate feedback on:

  - Whether a distinct "xsgmii" mode is the appropriate representation,
    given the differences from USXGMII and O-USGMII.
  - Whether the proposed per-port capabilities and phylink PHY-status
    classification accurately capture the intended generic semantics.
  - Whether introduction of a user of this mode is needed alongside
    adding this new mode, or whether those can be considered separately.

References
=2D---------

[1] 83b5f0253b1e ("net: phy: Introduce PSGMII PHY interface mode")
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/com=
mit/?id=3D83b5f0253b1ef352f4333c4fb2d24eff23045f6b
[2] Cisco USGMII specification, Table 1 and section 2.2.3; downloads:
    https://developer.cisco.com/site/usgmii-usxgmii/
[3] 923454c0368b ("net: phylink: use a dedicated helper to parse usgmii
    control word")
    https://git.kernel.org/linus/923454c0368b8092e9d05c020f50abca577e7290
[4] RTL8218E-CG datasheet, rev. 0.1, sections 6.2, 6.3, 6.6, 7.12 and 7.14=
.
    https://github.com/jameywine/realtek-doc/blob/main/datasheets/RTL8218E=
-CG_Datasheet.pdf

Thanks,
Jonas
=2D--
Jonas Jelonek (2):
  dt-bindings: net: add Realtek XSGMII interface mode
  net: phy: add Realtek XSGMII interface mode

 .../devicetree/bindings/net/ethernet-controller.yaml       | 1 +
 Documentation/networking/phy.rst                           | 7 +++++++
 drivers/net/phy/phy-core.c                                 | 2 ++
 drivers/net/phy/phy_caps.c                                 | 1 +
 drivers/net/phy/phylink.c                                  | 3 +++
 include/linux/phy.h                                        | 4 ++++
 6 files changed, 18 insertions(+)


base-commit: 7ccc5e05043b1bb84326b19a2b05938d8f7a2ae6
=2D-=20
2.53.0
