Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794906285;
	b=Cb5ixiqHAfL8ZJ09OxFsysCAULXBT80GA6m8ZZoXRTeEVDiI8e7ddfnJOi+4B8JMMTW6
	 Zn787LoH2er2tB7gCciKEeqe9FEoD3/WrBLBAzsb0LykHsKXFlC5vR63dH5hK0U/PvlWY
	 K0zS+6Duv0hzU39jOAe+mYMc+xfY7g3SIn5DwJir3Uc8B9o2vwYf2yJjYjUmnqHQBc622
	 Ok/XxJ9AFa6P7tMRa64YCvL+as2Qdf10L7kHw3zutmC/8GZMVBMKpw4tCiCWGMfucM6Cm
	 mtFH1DzXXCSYU8bJNqPQJvbgTHXOH1oICkIgCKx7FSpguc4Veqcb+jUVuebEx+FyjuA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906285;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=/KOAVv6apLichQ/OSMK32xkM/AZHKlMXP5BUywmr1vA=;
	b=ylBFteKZ7NshvYHZ3BUQGs8JQuXVByEe2YnJeWncP6KPqnkvQLFHZglvX15mpju49AzS
	 OcNpI0Z+NP0VJppZn77AntkCT+vBH1WbnVjm2SdTAn6XibgSroM+jbwyuEsLfLlMBLYix
	 Hm6Dj0YHTI62z6HQjWvCrdvuYYY42OqL2iuJ3bo95hy84l+YvWwYzrSG34d7OGu3xsTGd
	 qikufPfXFNOQhFcAvToTTl24A4B2rGQ120p1aswXzylNsvZspTzMSo1MESJ+jrHIYC/up
	 784dC4LMLBb1x43OuL+R9KYIwACRI4ZhYkHXjKF1eXPHmsSt/eaUwkG8auWb3tYbYow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AMBDjDnm;
	arc=fail smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BE6606A329;
	Tue, 17 Nov 2026 09:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AMBDjDnm
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794906285;
	b=K5aG3FPo4svlZZxwC3BHNUorlQ/CdodVEFGQMUdxy3h9R3I32DhSC2OiqpjaEdzq5Prz
	 AOejLnA2seTqF2n0xnWwyNhlR9PGADGxMSlVfo1GSo9mNb71Em95XCUSqi3iW9ApeKKG6
	 lm2HW02mRhYilFroIViwKui0JktB9fI1ZhejL4bFgnfKS8JeVCYWPzUjtI0Vzt+ROm1Tf
	 cHWKece80qWVxyGFQpygtId+xGEaxfBHptZ1TJWt2uPWPDBLVkvSj2dB1faxwCEOmlcdm
	 haqQKUkpPBHIx6gAQcnw3rFt5Po/Mkr1axi9Z8C2VqTJv5stlBn1PbfqLICZLVfcIVQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794906285;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=/KOAVv6apLichQ/OSMK32xkM/AZHKlMXP5BUywmr1vA=;
	b=NsNYaV6vSHvrkA7KL47EkwgPRppy8jHHyTaz/9pPtWxkpVs6Q4TrpUrvd3MHU6nmB+8u
	 zuLTd7xN54TXnPPo5iDql/T79q+XTcp3q7ov4GPJ0JeKj++fhVShoUS6h0SWn1s05zKEH
	 QZ51J11BjlrPTVeyZqWFLlmvGR7OQQCySqak1vSbJ/pe7OG2Q/RXnaNCID1MJdt1+V5/C
	 QhsilGgJgdlqIXTm29Q8sjYLKf6VEfKk+xymx5HxwvBszS5/qmI0mEIo+rUJ+0wa1b6Ra
	 QJD2yT4nL8b2g7NGBrAvIk0s6+q3ehZ9gQTMnhsGJhojxvCVmCDzaGOfR4i4/JLZK3g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DF77C1F000C5;
	Tue, 17 Nov 2026 09:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794906285;
	bh=/KOAVv6apLichQ/OSMK32xkM/AZHKlMXP5BUywmr1vA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=AMBDjDnmGFoKp+zjMyV1W6EV12YThZjexefuc2+ebAbaZSkLG0CTZGgvLDB0xpRp4
	 XeBEq3toa9Tp/Jhdma7AkX/gPNXDxWzbyUM3sRQ32bhtuBOlAg2dMz0vx5iuCswYRw
	 lM5OgKr6NcUMfCt5lYss3qy+VL1hZRcLYIfE01Crn6+ldEYf5ghhYZaTBC0tX7trA4
	 InlOu1Nhc2ywucRgLt8yCXv888XtLQU08QWuN+BnemQ3ObR/e1HIHQf4y5n976i2Pj
	 C2LNnu73j5wnQtiVZjwb6wzjwiQctA4LOPQTLeJSIEHA6iNJnNo9gvWmRR7zLT1oNd
	 Y0x7LtEn7er7w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6F6DF4A75E;
	Tue, 17 Nov 2026 09:04:44 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Date: Tue, 17 Nov 2026 17:04:35 +0800
Subject: [PATCH net-next v4 1/2] dt-bindings: net: rockchip-dwmac: Add
 RK3572
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261117-add-board-ok3572-c-net-v4-1-4e9da569395a@qq.com>
References: <20261117-add-board-ok3572-c-net-v4-0-4e9da569395a@qq.com>
In-Reply-To: <20261117-add-board-ok3572-c-net-v4-0-4e9da569395a@qq.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 David Wu <david.wu@rock-chips.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Cunhao Lu <1579567540@qq.com>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew@lunn.ch>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794906282; l=2963;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=nFnIN3lO+XTZBGs+5YkcYP0f6N9wWK6y8Seywzr6SIY=;
 b=9SYat9LnbqGPUNHGpDhwc31lg+NnzZ77J6S1DEukr/EOu1//Vw0YmjkuSvvCcmc8QipZbYxnI
 nPcSmU3Ut6dB42rJvdSt77yYeE3veNyUVKM/ntNNFBiimWPApyTMexl
X-Developer-Key: i=1579567540@qq.com; a=ed25519;
 pk=sUTWrzlIwT4C7ctjNfVZAzzg0G7QUn2XxRGpYsw4RtM=
X-Endpoint-Received: by B4 Relay for 1579567540@qq.com/20261015 with
 auth_id=1177
X-Original-From: Cunhao Lu <1579567540@qq.com>
Reply-To: 1579567540@qq.com
Content-Transfer-Encoding: 7bit

From: Cunhao Lu <1579567540@qq.com>

Add the rockchip,rk3572-gmac compatible with the snps,dwmac-4.20a
fallback and require rockchip,php-grf.

Mark tx_delay and rx_delay as deprecated and disallow them for RK3572
so new designs do not use the legacy delay properties.

Signed-off-by: Cunhao Lu <1579567540@qq.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
Changes in v3:
- Deprecate tx_delay and rx_delay and disallow them for RK3572.

Changes in v2:
- Add RK3572 to the shared Synopsys compatible list for consistency.
---
 Documentation/devicetree/bindings/net/rockchip-dwmac.yaml | 15 +++++++++++++++
 Documentation/devicetree/bindings/net/snps,dwmac.yaml     |  1 +
 2 files changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index e8dda1961ab3..d7b7bb008235 100644
--- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
@@ -27,6 +27,7 @@ select:
           - rockchip,rk3506-gmac
           - rockchip,rk3528-gmac
           - rockchip,rk3568-gmac
+          - rockchip,rk3572-gmac
           - rockchip,rk3576-gmac
           - rockchip,rk3588-gmac
           - rockchip,rv1108-gmac
@@ -54,6 +55,7 @@ properties:
               - rockchip,rk3506-gmac
               - rockchip,rk3528-gmac
               - rockchip,rk3568-gmac
+              - rockchip,rk3572-gmac
               - rockchip,rk3576-gmac
               - rockchip,rk3588-gmac
               - rockchip,rv1126-gmac
@@ -112,6 +114,7 @@ properties:
     minimum: 0
     maximum: 0x7F
     default: 0x30
+    deprecated: true
 
   rx_delay:
     description: Delay value for RXD timing.
@@ -119,6 +122,7 @@ properties:
     minimum: 0
     maximum: 0x7F
     default: 0x10
+    deprecated: true
 
   pcs-handle:
     description:
@@ -141,11 +145,22 @@ required:
 allOf:
   - $ref: snps,dwmac.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3572-gmac
+    then:
+      properties:
+        rx_delay: false
+        tx_delay: false
+
   - if:
       properties:
         compatible:
           contains:
             enum:
+              - rockchip,rk3572-gmac
               - rockchip,rk3576-gmac
               - rockchip,rk3588-gmac
     then:
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 2c4842404bf6..80d3b43e2889 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -94,6 +94,7 @@ properties:
         - rockchip,rk3506-gmac
         - rockchip,rk3528-gmac
         - rockchip,rk3568-gmac
+        - rockchip,rk3572-gmac
         - rockchip,rk3576-gmac
         - rockchip,rk3588-gmac
         - rockchip,rv1108-gmac

-- 
2.34.1


