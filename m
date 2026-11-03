Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.25.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738034;
	b=y7jUSaEJr4Tb3V5xcOFp5ci2yU/Qal5p0wCFtNOvwzH1on+M24pPsBhW5tzZsam3cMEe
	 WTmEe2Eh4xtsiQUxoAKvFM/86GN7afPaLy/jr+GLICayUz88V2AfQ/M16okJi8rm7XVef
	 dhdYynPM4he1G26oaTqBkxLih5bBDI0Bhz1vRCyHX2MUQ09SEfJhq+MqFsrMhXH01f30L
	 plwVKNAeRkuMB3RcosyXGAZfVLeqV1XAVPIz3vTOrpI+rT/yRPWG/hCC3tmzlPU89GS5R
	 QXDatFJ1Q3+QtB1Ks1GV6cEtK3ADql0gRdkj/6f9UQ7kOgioJDdLVSrvY5Tuvz1BxKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738034;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:Received:
	 DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=sjUVdGPpRThFzw+FQF/UnfYCE/2vePJvLFuHafbyQjw=;
	b=M4mQqNq5VHHgLTrg/42AfVI/lTGiHEVL00rF6g0MdOmjOuVaKAJB4Bc9Twaj3c2c090d
	 0ecCZlTqn8MUnY72oJeOb19cyqfiydqNqgy5MocRbR9kh0Tj7/VTzKLU03fpFjEJzAUug
	 SEDTFecEkcNjuHkcZsBFizjigIl4jBPX6Pq7n9hAN2OGauXZC9l4nmydzM+d14XIZGSOF
	 nejVhcnis8qRXntDq41+brATSq8o4gP6LpmhBorp8M6Fh1sMR0Lde+uVS4HOBdBKxsKib
	 6gBasW2zDh5a8Xlf4vhOgVFpEnN0/iD5vHF5FaavIR+IUdBsm0uZu8FkPqbLLDmpWhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rnplus.nl;
	spf=pass smtp.mailfrom=rnplus.nl;
	dkim=pass header.d=rnplus.nl header.i=@rnplus.nl header.a=rsa-sha256 header.s=dkim header.b=AuN1mweB;
	arc=none smtp.remote-ip=178.251.25.70
Received: from mail.rnplus.nl (mail.rnplus.nl [178.251.25.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F46A606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:33:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F46A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rnplus.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rnplus.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rnplus.nl header.i=@rnplus.nl header.a=rsa-sha256 header.s=dkim header.b=AuN1mweB
Received: from localhost (unknown [127.0.0.1])
	by mail.rnplus.nl (Postfix) with ESMTP id 58C6B379785
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:33:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at rnplus.nl
Received: from mail.rnplus.nl ([127.0.0.1])
	by localhost (mail.rnplus.nl [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qC3Dklo0_NDn for <linux-kernel@vger.kernel.org>;
	Tue,  3 Nov 2026 21:33:45 +0100 (CET)
Received: from E595 (unknown [185.10.157.158])
	by mail.rnplus.nl (Postfix) with ESMTPSA id 39F5D379778;
	Tue,  3 Nov 2026 21:33:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rnplus.nl; s=dkim;
	t=1793738021; bh=wpaK3xlqbSy7BwAovXZxHl0KmlkJ7DTAtEtWwvx+axY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AuN1mweBZv9JootaBzdqVRAZ/Om8mJXHR958XTAd+PULHJt+HCJeSpSt1YajYhV2h
	 VAflSQKXHqyu6Ycur0aJVXHSLmoSw/hGACXo05pMP3QHJNzX9E22lrU0mCcEbc9gFR
	 z1BYcz6rIdWCMgSDe4Wg0lLYoHYFLQ0aKMO0bFhM=
From: Renze Nicolai <renze@rnplus.nl>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Renze Nicolai <renze@rnplus.nl>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] ARM: dts: aspeed: x570d4u: Remove w83773g temperature sensor
Date: Tue,  3 Nov 2026 21:33:02 +0100
Message-ID: <20261103203308.54789-2-renze@rnplus.nl>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103203308.54789-1-renze@rnplus.nl>
References: <20261103203308.54789-1-renze@rnplus.nl>
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

The w83773g temperature sensor is only available on variants
of the X570D4U with 10GBit ethernet and should only be loaded
after checking the board variant information in the FRU EEPROM.

Signed-off-by: Renze Nicolai <renze@rnplus.nl>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
index e61a6cb43438..7d27833b761d 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
@@ -164,11 +164,6 @@ &i2c0 {
 &i2c1 {
 	/* Hardware monitoring SMBus */
 	status = "okay";
-
-	w83773g@4c {
-		compatible = "nuvoton,w83773g";
-		reg = <0x4c>;
-	};
 };
 
 &i2c2 {
-- 
2.56.0

