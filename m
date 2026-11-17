Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.72.192.75
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905385;
	b=bS+BqW6gyYd05b62paQhIe3VoBjtKw/dgGh+4vuO7K1jPBY3MGjzzJrEWx5j2xILXsJW
	 KSJKSCTgwj6UxTQ68lwxhDvJXTG5eWJXSpbvGRKyxctr6EdeVPaz8UzW+IUEJRGM/SM6d
	 QpGxeIyL8O4s7q4dD5ebYSW1CgXyRkYVJ49+dudbfkwTuMra4EfMexSoNCvqmyusi3Bdh
	 QIzq3qxb4qJG4Tys/9K5h/Y7XPBfd0vIA5hePTGcWOCh2dgkbuj+lzrAQnBXjb+k/1s12
	 6+ZuKZXrEnkx0Rhp468RyHL1oAmZMcbpSyq58yT5QWD8VZX19xP5VpsM3nGZvhd8SCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905385;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=dDphXepmTf/DSdA6L5iPJVxN4NKPCh9r42nuQhCZVoM=;
	b=QofH6aVJlsGInyb1DRBqrw2of/V3EZ4kvZoNYZTBiokOPSGWYIW/ZBhN5imVZRCufxbp
	 uUdTaSs2WQqPS37go9id1/7/Tm0Wl2IgCrwjZvV1cvANsvgxs1YTZiSMJHC3NeoTy/k9c
	 OZ0jo01awcm96chYV6ySe8QltAm2acVkeG8Hu8CGx10A9TYgw0uGUN+4tmEbqM3+mVG6q
	 ITKX8wGfceJBwtjd1RFGi9IX3F2q+qMoR1Gy1kCIQLF2qi7zBusUxj98cB7ANxS7583Ea
	 VY7Z9MtrustIFWKVyFm2c2cFQoc/9PDaLUezVDlr8gzbi6fVC4wxH/FbhqgcsSPXeCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=jonasjelonek.de;
	spf=pass smtp.mailfrom=jonasjelonek.de;
	dkim=pass header.d=jonasjelonek.de header.i=jonas@jonasjelonek.de header.a=rsa-sha256 header.s=s1-ionos header.b=hWPvmLjd;
	arc=none smtp.remote-ip=217.72.192.75
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867BF606A337
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 867BF606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jonasjelonek.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jonasjelonek.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jonasjelonek.de header.i=jonas@jonasjelonek.de header.a=rsa-sha256 header.s=s1-ionos header.b=hWPvmLjd
DKIM2-Signature:  i=1; m=1; t=1794905382;
 mf=PGpvbmFzQGpvbmFzamVsb25lay5kZT4=;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=jonasjelonek.de;
 s=s1-ionos:rsa-sha256:SCBN/npnGybKi3k+0/V9vTOhVtth
   6dQee8E9LBiUFJDAzJo/lHBnoW4rIxB41Lnw376dGRDBrYS/YHUyR1y1+TNutKAuYC6sOktVssN
   9bFjqPRlUoCo6wRT666S78WgDQlYPS17a/civwwfxrpzZsgcB3doSMaE9uRDsbPW0+0KulxH+9o
   pCrf3H+43lCCYHw7PTyvydiiqXpfjR5SxGOH02jnswxPQwEecoIsbtkirpiXUCghUdhnhpukokS
   sVt+9CcBA1nmzVe6hQHM6JDP1qdTt+B2Sj38Bk/s+IHJhay9iy6YVE5/Z1Kq5LdwgSNl2myKv2o
   5PqjYBZaUcw14Q==;
Message-Instance:  m=1;
 h=sha256:
   6jSxRpdrKNFVuIJ1JFQ1jjEIC0YmNnOqBgkrA5Q5wEo=:
   5S00Mf9YRv4dtSRWDlxv3uk7E45ViznI6QfTF+tEijk=,
  sha512:
   EkuheOQNW+OQ3I1aJQ8tRMsfu+y1ZJUgykHrq+dE6SV60J1vpMMAC+hZgLy1nWfYCC7DNGvYWkHfq5X8zI5soQ==:
   KvRlFwS9eEU7srxHQ848tEa/sX1K6k+NT2fJBt0+NcJn9Joh4Av1HHpHC3TvJ2egsdpa0os18PxoaCbkagH2Ng==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jonasjelonek.de;
	s=s1-ionos; t=1794905281; x=1795510081; i=jonas@jonasjelonek.de;
	bh=dDphXepmTf/DSdA6L5iPJVxN4NKPCh9r42nuQhCZVoM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=hWPvmLjd7hsKZd+j618UV+7+A+G8R9K4bQSyHSsFqDr/f6ApXd52M/69gvKeLktx
	 c670jf3vGb6qNW16aMWdc8Wol9sd9cw/BKbs0RSH/D3CqErQ4/Zt1l8xVE6X2U0wS
	 J22cuJbv2tTIltjmBs7PZQ+1Ehjl4Wsx/r5UZUSH8D4qN3WBnr+FG6Zwaugnrex7L
	 R2CVEQ7Zbb//miw46JqpaxKoHNIwSm4k++f1eyxO973KJBcHKmtqsXlTEE5CACQNP
	 7xUSEuP0/0URcePIF4/But8rFMWLor3I424CnUl0OQTZs2CohZfCb/crfuf/MdZKH
	 uvUGeNiXkMSZe219+g==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue108
 [213.165.67.113]) with ESMTPSA (Nemesis) id 1N4yyQ-1wSmJg3WMe-013gdd; Tue, 17
 Nov 2026 09:48:01 +0100
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
Subject: [RFC PATCH net-next 1/2] dt-bindings: net: add Realtek XSGMII interface mode
Date: Tue, 17 Nov 2026 08:47:47 +0000
Message-ID: <20261117084748.2387647-2-jonas@jonasjelonek.de>
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
X-Provags-ID: V03:K1:rBcdlKiuMzWqqMqMx3j3k1snq8RgXxY6R4WvEE8/UO5VKiSjYP1
 kS6Umd45dbsyGH+W3/UcgT0Hil1paPtJxYU/jlIi8d/PQHBxzcF5PCO7ymy7oiMBN5UoLwH
 8D1XkIYZ7C/VXGmlU3dHlYtJlv+nxBYeOc7+EAz9ALRgJIK0JENs37LIWpF6xyypYizIvI4
 8ohxmgdGuEbPp+NSz3daA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:k/KB5u+1Fqk=;LvhFHHapjoWbfsknFWLvmzbcCdh
 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
 DFw==

Add xsgmii to the supported MAC-PHY connection types. Realtek's
proprietary XSGMII interface carries eight 10/100/1000 Mbps ports over a
single 10.3125 Gbaud SerDes lane and is distinct from USXGMII and
10G-QXGMII.

Signed-off-by: Jonas Jelonek <jonas@jonasjelonek.de>
=2D--
 Documentation/devicetree/bindings/net/ethernet-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yam=
l b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
index 30b2a335116e..e9406ddd0fc0 100644
=2D-- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
@@ -45,6 +45,7 @@ properties:
       - psgmii
       - qsgmii
       - qusgmii
+      - xsgmii
       - tbi
       - rev-mii
       - rmii
=2D-=20
2.53.0

