Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.160.32.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792437806;
	b=Cn5sWAA7oPokfmZNlxrpYA/bFohF58mF8Vyg45Kb+fS0hrIph/FLclEostSil7L1OyD+
	 H4TgfQvGsZNNN4GUiJib7U5sxGmqjpl6iqAXlx6aDIsfzaD48OwO5/O+8IpzaSwiRwdXr
	 ACXOWxKt215eLecaZThQS253wTxA/rNS4N6Z8H9b9sQtGrenHAfdaSCcoIgEZ++YaHoy3
	 ThG5TokaZddyY/Fdd4AXiGYa04tbffnHXCXyLSINPj3jIjMDdrw2egXAD+9Q2pW6oqEoT
	 GxnVp4e7Bu7O/J6UtbAiqHImpAlpZSFcf90ZMeG8QJT+7XVitQTIkJru3HGYmM4CYpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792437806;
	h=DMARC-Filter:Received:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:Received:DKIM-Signature:Received-SPF:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-PPP-Vhost;
	bh=6y4bY/nWKsQ0dtsbCN7wJWBo0nm0F/zcZorgUH+8wwE=;
	b=efYq2aqfeauRnuwOzHMpk0oVjDak6VECvaDTdE0TIVOYSSoBJPxzMLOIrnL5SnVCKAfj
	 lRcmH2qOGKtYwwraKRFq5Qyz5GfsBiUozkUAQQ6+QejnPwP/+UM/3pfdiUyVv5pPVA06+
	 a8Y1Gl5sLfFXZ4Xla5L5W6dZXQ0heQ0xI8MR2okb1vGbeg3RUMPPCPc/X4WO8pFC1BseO
	 3PMTvoHmkqW5XmYwqBk96PNh33jTw/ArOxf+K/ATu1VUlzI1Pg0Ne6EkhvshEHaUD+T+b
	 ZMHqYI5OjwBkoEwPSQCTeSy2hFB2o/cM593Mp3rdBZNlgSuKLn44T4kiC2FVPfVfDgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gluon.es;
	spf=pass smtp.mailfrom=gluon.es;
	dkim=pass header.d=gluon.es header.i=@gluon.es header.a=rsa-sha256 header.s=default header.b=imJ+2XdX;
	arc=none smtp.remote-ip=217.160.32.16
Received: from nimiomail.com (nimiomail.com [217.160.32.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B81606A31A;
	Mon, 19 Oct 2026 19:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8B81606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gluon.es
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gluon.es
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gluon.es header.i=@gluon.es header.a=rsa-sha256 header.s=default header.b=imJ+2XdX
Received: from nimiomail.com (localhost.localdomain [127.0.0.1])
	by nimiomail.com (Postfix) with ESMTP id 7BD5D81E92;
	Mon, 19 Oct 2026 21:23:07 +0200 (CEST)
X-Spam-Flag: NO
X-Spam-Score: -3.101
X-Spam-Level:
Authentication-Results: nimiomail.com (amavis) (amavisd-new);
	dkim=pass (2048-bit key) header.d=gluon.es
Received: from nimiomail.com ([127.0.0.1])
	by nimiomail.com (nimiomail.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QNRt1Oecl74P; Mon, 19 Oct 2026 21:23:01 +0200 (CEST)
Received: from DESKTOP-2QFDG0H.tail76f4b.ts.net (21.red-2-139-241.staticip.rima-tde.net [2.139.241.21])
	by nimiomail.com (Postfix) with ESMTPSA id C5E4480709;
	Mon, 19 Oct 2026 21:23:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gluon.es; s=default;
	t=1792437781; bh=6y4bY/nWKsQ0dtsbCN7wJWBo0nm0F/zcZorgUH+8wwE=;
	h=From:To:Subject;
	b=imJ+2XdXhn0VS2WDx9HTbQrvF9s9vLdmSHICMY9UBHFRsfxRUFl3is6TQZOrLeSp4
	 boSvYr2/YnsU9kXbZD5m6sYIt9iEqY/fc/Iu14+7MPPg+BgGND6W6fP0efV36xZDCi
	 N1UqX79wvhq04drJ9cFJv6uaQJtEZyHZWQeKOkXiYGqe7zgc1xN0H83UaWhErrfZBa
	 hyquBUhwYGn99RQGQpYKdh4d2aNQ3HvICvv5pBlXsD/oFUiPy+lfpamfmxuzDNIyLq
	 votil1L+QVBQPxk26c6sliKTVZqcn979IOip1LggJD4fDKEJvEzHE2OaVeOD0TQVBB
	 L6Z71IEsougrA==
Authentication-Results: nimiomail.com;
	spf=pass (sender IP is 2.139.241.21) smtp.mailfrom=info@gluon.es smtp.helo=DESKTOP-2QFDG0H.tail76f4b.ts.net
Received-SPF: pass (nimiomail.com: connection is authenticated)
From: Miguel Jesus Seron Gonzalez <info@gluon.es>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dongjin Kim <tobetter@gmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: odroid-m1: use rgmii-id for gmac0
Date: Mon, 19 Oct 2026 21:22:54 +0200
Message-ID: <20261019192254.6933-1-info@gluon.es>
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
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <179243778132.1150629.14231437258711705057@nimiomail.com>
X-PPP-Vhost: gluon.es

The gmac0 node uses phy-mode "rgmii" with the MAC delays
tx_delay = <0x4f> and rx_delay = <0x2d>. On some boards this TX delay
does not work at 1000 Mbit/s. Dongjin Kim reported iperf3 throughput
below 200 Mbit/s on REV 1.0 20220613 boards. On a REV 1.0 20211112
board, TX from the board stalls completely in iperf3 and ping loss
grows with frame size (5% at 56 bytes, 20% at 1472 bytes), while RX is
unaffected. Other boards work with the current value, so it seems to
be marginal rather than wrong everywhere.

Instead of tuning the MAC TX delay again, switch to phy-mode
"rgmii-id", so that the RTL8211F PHY adds both RGMII delays, and drop
the MAC delay properties, as suggested by Chukun Pan. Dongjin
confirmed in the same thread that rgmii-id works.

With this change, on the REV 1.0 20211112 board at 1000 Mbit/s full
duplex, there were 3 retransmitted TCP segments out of 24929 (0.012%)
over almost four hours, no RX/TX errors and no ping loss.

Fixes: fd3583267703 ("arm64: dts: rockchip: Add Hardkernel ODROID-M1 board")
Link: https://lore.kernel.org/r/20250819075522.2238643-1-tobetter@gmail.com
Suggested-by: Chukun Pan <amadeus@jmu.edu.cn>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Miguel Jesus Seron Gonzalez <info@gluon.es>
---

Notes:
    Sent as a standalone patch because Home Assistant OS needs an upstream
    reference for the same change. Dongjin confirmed in the v2 thread that
    rgmii-id works. Dongjin, if you would rather send your own version,
    I'll withdraw this one.
    
    The debugging, the changelog and the patch were prepared with the help
    of Claude (Anthropic). I reviewed all of it, and the test results above
    are from my own board.

 arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts b/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts
index 442a2bc43..a3cd21aa0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts
@@ -200,7 +200,7 @@ &gmac0 {
 	assigned-clock-rates = <0>, <125000000>;
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy0>;
-	phy-mode = "rgmii";
+	phy-mode = "rgmii-id";
 	phy-supply = <&vcc3v3_sys>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&gmac0_miim
@@ -209,9 +209,6 @@ &gmac0_rx_bus2
 		     &gmac0_rgmii_clk
 		     &gmac0_rgmii_bus>;
 	status = "okay";
-
-	tx_delay = <0x4f>;
-	rx_delay = <0x2d>;
 };
 
 &gpu {

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.53.0

