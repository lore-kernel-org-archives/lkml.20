Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED10D364927
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 22:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789771801; cv=none; b=MldcOS+UwEM6GwgO7nil5M4qh/lxdxh4nbDflDhU3UkOFZJcZEKOzszaZmF+L6EUofCTEODqbsxLfZ5cu/9uQNKZjl59Y7AAByjV9DW7/ddfGEgbI47VrHpRNO2trJHoSrpt3/QwIekIxEHYCdY6dtCpLzLk9I5V6qlC+XpqOzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789771801; c=relaxed/simple;
	bh=uw82mll65bTvKzCTwjKzaIYqZeOU3m/+yhAHHPZKu74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qlQn84kM4I2GvFA/VXIP1v3WXgnaa1Vx0wNRm7IjYz6rLGJCqGr/GYm55jOlSPLl6U4VtCYfgBVihFwcgli2AqoJ6JkamF8EOFUo2xiuEznv0JSs6H3XcSyhcQ/FPdj3cbUwZ8rmQ2fLHHEQvOsVaHCDhim42B7KJcml57XT/Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alessandro.zini@siemens.com header.b=Hci2iJwI; arc=none smtp.client-ip=185.136.64.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alessandro.zini@siemens.com header.b="Hci2iJwI"
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2026091822494787a89404da0002073e
        for <linux-kernel@vger.kernel.org>;
        Sat, 19 Sep 2026 00:49:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alessandro.zini@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=4reDCX1VDOlA3cZ+v+SR+ZwaoIZgUjeFcXMbzfav0Y8=;
 b=Hci2iJwImNDDccqgW75zl+AR5BiLMY1fOb8cNROQ82TiNksyM4dYruNLPB0+kz4RYwuCbb
 0r0GBC2M0jaWWPPJM5qnPecFNnsEEbDUL4KcVxGywQpq2cAgpGId4q8GZPg4iYhAxtyNvfCo
 0A36nyuCRF7OaOmv0I3u+q5XttQ9KdL7grZqhfBTkNsYra4k5aDGh+U4cDxfSe7fV8YPJwtC
 NF22jppQF2VccsYtMWFe7HAjzhBlEBIAPwe+vA4fhKviDRT2t8gJeoCkgmkoKhGLsmt78qoX
 l+8rcgDcuQq3M+DNX74fSlnmlJmhlhBy5K7T3dhfXInZmRtlW+6hSAXw==;
From: Alessandro Zini <alessandro.zini@siemens.com>
To: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Ciprian Regus <ciprian.regus@analog.com>,
	Qingfang Deng <qingfang.deng@linux.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alessandro Zini <alessandro.zini@siemens.com>
Subject: [PATCH net-next v3 2/4] dt-bindings: net: adi,ad3306: add reset-gpios property
Date: Sat, 19 Sep 2026 00:49:32 +0200
Message-ID: <20260918224934.51998-3-alessandro.zini@siemens.com>
In-Reply-To: <20260918224934.51998-1-alessandro.zini@siemens.com>
References: <20260918224934.51998-1-alessandro.zini@siemens.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1327013:519-21489:flowmailer

The ADIN1140/AD3306 MAC-PHY has an active-low hardware reset pin, and the
driver binds to the common OA TC6 library which is gaining support for an
optional reset GPIO. As the schema uses "unevaluatedProperties: false", a
board description using the property would otherwise be rejected.

Add the optional reset-gpios property to describe the connection to that
pin.

Signed-off-by: Alessandro Zini <alessandro.zini@siemens.com>
---
Changes in v3:
- New patch, so that a board using reset-gpios with the adi,adin1140 /
  adi,ad3306 compatibles is not rejected by dt_binding_check.
 Documentation/devicetree/bindings/net/adi,ad3306.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/adi,ad3306.yaml b/Documentation/devicetree/bindings/net/adi,ad3306.yaml
index 785d05c995dbb..8eb72562459f2 100644
--- a/Documentation/devicetree/bindings/net/adi,ad3306.yaml
+++ b/Documentation/devicetree/bindings/net/adi,ad3306.yaml
@@ -42,6 +42,11 @@ properties:
     description: Interrupt from the MAC-PHY for receive data available
       and error conditions
 
+  reset-gpios:
+    description:
+      GPIO connected to the active-low RESET_N pin of the MAC-PHY.
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.55.0

