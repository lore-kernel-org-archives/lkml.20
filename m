Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794295175;
	b=UNvPnFkkuaifYLHEvKYxZv08EQcapkcWUgwww5or5W+6505VzPNzYbexJs1RhEBITAIj
	 e8jrfhnHNU+wovZwsgBg3EhymgG+tv3oOXLEzJhNRSus6kwvzNQwhKd6riRXPYSbi8L2l
	 U3K2MvNZ2yU4rv0azRWTcnbb53QEG413lMGSCVe/6wcng9EvmByH9nkkE6PH7MzQX7uSJ
	 ASe8G6QvByxNISBCoYFvgppwdfFBRVNaQkO431PjkOIe3PyZGzdOeeIfobxQMTWqn52+T
	 GKgfs5Ld7kdSk58vS4Rr7Zq0gis1LyIN2S7y/8msMwYa1YnAxuUNZHbFkY8ViGz51/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794295175;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=l/MGsum1F0rKCDJOx0Lnm3h1ZbNpJlCrv461gxecIkM=;
	b=m+q3VdxP1hzDk+M+dAxlhdFtU+g0gpyYYA6Hrv1Gelt9CMdsI8BkWlaNVh8i/0Tpk6g1
	 ZKEqgomUftbuFEx2rU4qJTV3Wwpin4Gw/qNUx4TzZPqwUBBNecszXB8pXrW3T7MId5caF
	 9yuHcCs4i45GgWkJQ56mcKAhJlooFvX80DlY+q+er4uWw7hU2lPx7jFM8t9q+9RUIpNbX
	 99rQA5WkFgXrRtaUd10AuBQOqr+dN2Sweh3RbaL370PlvDQpCYhkVSDFmZJ8SnWJynQad
	 VdxlEPGT9pr5DtC6E95bNbvc+l3KnITCy75IVnhQEAtN9q2gnbLi3dkdNJbz5JOw0Gw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E7duKORq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5074606D637;
	Tue, 10 Nov 2026 07:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E7duKORq
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295174;
	b=JffNNjojs6AAzQv+Dkuo0oURZzZTCYpIDYi26bDDb1N+Q8QEFek8cfRij9mRzzzOvMwd
	 pbX9D+YHJTUVXPPj0jmDckSOWaV7aeuD1gdohvM9S7XH8PPIU6t3kyNiy/enq4AJwyW88
	 PC5aG0qAwmEtgT7URNursmh5lraPfB1Ihq8b2VWYIBoDlWgV7QE9eEXTehmT2ibmZaQSq
	 TjAYKALHeDo298mZlWK8Sm4iAnrA+dOQS7998te1fPSKJ2HnyyBQfxQCgM+h6ihAPHrBs
	 1dtQ3jfvGTuhamCo2LmNZDPNVieOzAyyQ37cRO5h8Y5WbgTurSRF/Jl3v1poYL0AztQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295174;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=l/MGsum1F0rKCDJOx0Lnm3h1ZbNpJlCrv461gxecIkM=;
	b=DNd06CBrazH1OpRJiGvJjX1GwA78xUxB69TTp3do+8lzUkH4VDPhF40QTbeCpeBxw6LE
	 V2cIiR1eiLSYfGqYUwBQy9W3bT2n3Tk2Bp3yls2pW1uGZGjb1rz5BSE+/hEcHPZpBfEth
	 avmSsPqwDB6FtpX/FGWz6+7llEi1o+UHfZweF/UPSf3fNIhvHJ6+DdCyYTDoDllMkkOAU
	 growSy828ipU+BEg9BWNyHJ93PlI1/wUOOafIcmp46YsBZ7yFCWafs3oerOdsfvqAcpoR
	 yVU/0hIAtchXIuzV4ukjFul6+/VARc5obTWRcDcsHy951ob/t0KRt08ZfkZQAVRPfxw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9C1221F008A6;
	Tue, 10 Nov 2026 07:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295174;
	bh=l/MGsum1F0rKCDJOx0Lnm3h1ZbNpJlCrv461gxecIkM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=E7duKORqOOKx/1pINaZ1ddPsckJlu6/qUKibcDIjYKDBKDOzgVbV9m/oQM9WOJpKb
	 /xe+PpxKJAI/ZdfKGpYrtsSRR60rcBOTkw+e02xzo4yKIRwowxbEropR8uH4NVzg3G
	 chdm3nWxg41lFviMRc44OTGCqLATwR6NX1bpmvMaFHqVnVbEKiCbVXtyYCnhmUUu0X
	 eZ75sxoJ4D/aXDASYuKnWDYEFhd/knrldwR2x89vLuO+UJi0wRRrW8eM7nU3FZ3AB7
	 O9p2rA9Iih/s2kjz1tRZQhFP1Nyq9v46inSSpe+xPyk4QIalGdNOkKDvpabG5VohD2
	 FnEeZpPWZXCoA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 314EF489D1;
	Tue, 10 Nov 2026 07:19:33 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:19:34 +0000
Subject: [PATCH 2/3] arm64: dts: rockchip: add the SPI NOR flash supply on
 Orange Pi 5
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
Message-Id: <20261110-opi5-dts-v1-2-582b63d074be@gmail.com>
References: <20261110-opi5-dts-v1-0-582b63d074be@gmail.com>
In-Reply-To: <20261110-opi5-dts-v1-0-582b63d074be@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295172; l=1366;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=mzXbVS79UzYXahnmbISsnP+6U3ALGoRgMaY2cMlZvTQ=;
 b=+FPgB3ZEYjghW5Ml7ddBaHziBdOTRwx38KffnN1n/XyQYZlugjsRp1Tn8qSkcS7LlTNMbG5D3
 sHX9GaaMPVFCq2uVbkcq5X5/X9aktgYP87pGOcMpRcawR8IDn+HxX9g
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The SPI NOR flash on the Orange Pi 5 has no vcc-supply, so spi-nor
falls back to a dummy regulator:

  spi-nor spi5.0: supply vcc not found, using dummy regulator

The flash reports JEDEC ID 20 41 18, an XMC XM25QU128C, which is a
1.8 V part, and it is wired to FSPI M0, whose pins (GPIO2_A0,
GPIO2_D0-D6) are in the 1.8 V eMMC I/O domain. That domain and the
serial flash are fed from VCC_1V8_S3 (RK806 BUCK10), as in Rockchip's
RK3588 reference design; it is also the rail other RK3588 boards with a
1.8 V flash use (e.g. NanoPC-T6).

Describe the supply. The rail is always-on, so nothing changes
functionally; the flash just gets its real supply instead of a dummy
one. Only the Orange Pi 5 enables the flash: on the 5B and 5 Pro the
FSPI M0 pins are used by the eMMC.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
index d76bdf1b5e90..d67c876c8013 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
@@ -33,4 +33,8 @@ &pcie2x1l2 {
 
 &sfc {
 	status = "okay";
+
+	flash@0 {
+		vcc-supply = <&vcc_1v8_s3>;
+	};
 };

-- 
2.55.0


