Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794381591;
	b=IdlCQinT+dGb4RFmEcNTis+6odBTrSfdvVlUxdhGm9EbLvJMZe++4d3pcxMpY3gwkED1
	 ejZe3QLMrT8gBGiCqwXGVfqXsDInppCUA8BLNxvCJvsenZjUsSjaPyHPVtAkEKpvHvcNx
	 r/gq067QuB1kWiyCkimUJTO3Tw7DMru5jIefRV10RbWQxBPiaXlZCzEP/WxdPvwM05EyE
	 oJOZAkaGrGMQ0EF/Mgw+8OX+ttG6H/s655wjHy+Y6l/Mll9KerNjUei8RmliSDfH52ttg
	 mspOi9F9oAk4G9jozUiCxeItjbCzPi5fdBJBqkMVyV31u9ck6gI8Sv0tCtt+mTp4Alg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794381591;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=NdEJkuBPhRTVAo2iRoe4ZVb+LkSD9A9KML9WLzan69c=;
	b=CZ8oOwZorY2DCV+eLllpg7sa8EowvScFTKl2TIQKHPEQQ2SoN+kiW8OqUmJhieiC61rr
	 0LD5G0BQRDcN5uKmPWX24TbRB0kiU5bOOE0Y8s2Os67Z3HFoihrqCghNX/nxwH1Bu56tG
	 w16h55UXgxm7eHRxDmHCSwc7Trq4zlLilnUgyQbiz85Kiy1k+RaZUPI2pj9k3c1cgf+ox
	 FtmE1aqlrIj2K4iR05ueDE+iXVdZyc1YLsrCcI5GSwhNorlwL5qQogDy8UjNKOhKAaDaz
	 A2zK9jQfEvGlI+9IfQ/ztHXjpF81zxE45rifzexfGFVK3Ge6SOAUMXWU8ecw6DC06Pw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A4k0IVxF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6139606A324;
	Wed, 11 Nov 2026 07:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A4k0IVxF
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794381591;
	b=SfGgWfi+OKqa2EqRUqoWilAv4maopIZNuPeyq3J0qRXe/LmhJ7I2yH25Dxi1vOCRRsVR
	 0JSGL0pb1Az4KreRz1j1D73vjFWAq6E7vk0kXNhOsNhjoZYGDB6GpORStexqfp8HxmV7Z
	 FKJPsk7+uXpeDFwYKmWjTpkzD8c/VXk42U+yPj2tpB5c5yLIH6Csv+RSPVV+D1jFhRlKD
	 dr/dfXx0qFcvq1HkoNYdlvsLAnCrtXcnIwhpdUQI4LPq3BR3lxySntwl5R80BCfIlSDpl
	 0fBvtJwXpmRYpOiX1BgARY3HYEyxH/3adOq8kRPzJlpIz2VJ5gnbb+R7LUJzbERvUTQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794381591;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=NdEJkuBPhRTVAo2iRoe4ZVb+LkSD9A9KML9WLzan69c=;
	b=Pzi1SrucX7Dcs07XA2kWA8POdHwFV2Tg4UIQZdx6w5Mzkg0WL5Vd77kx3Xlkhh2xrMc8
	 vmfyRb1HHZWYmdy8mYHncwJWEbZiHDcQ3Q3nqC5kbhMDaL9RUWlYul+d4asmkCp4pZse3
	 Oe8o2hfIyHJbI37VvGC43+Q/+jjgL5D7EpCYZTMnPdOxgGTXgDNfOkkcWjL7ZLVDEoXUl
	 BcftPLjN61n8Jgf7d7K83U3Qyn7p6v14oK3ypYg+y9d7SE/DBa4azYIcfrnOGlyrzN7dV
	 7FJee7x45cxXMACyDV16oU0E2vo859AYrSLqNF9pd4pWeWCgnwg0Mij7AL2dXNfHZHQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 429C61F00A0B;
	Wed, 11 Nov 2026 07:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794381591;
	bh=NdEJkuBPhRTVAo2iRoe4ZVb+LkSD9A9KML9WLzan69c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=A4k0IVxFFKKeE64pwNmbmy6lkoxztmQrmxvKIDsNC4VXNteJjNtDB2Fm6K3GSUh2A
	 rKp2o+6G87ch2kgNfL4nEOZgHmCuyWtT5RdXQeWiTPT207BuEZkeatAONlSLnCa/HQ
	 t4tS5sB1fzI4hlgp8JJ6rFa5wzRLSo2Babn10Zq8Om3bCxjUDcv4YGenLNBP8xYwe7
	 w7Epn0NLiJS1oagnEUmCWgxScNCKGJnrgBpQavnZHh88oI8+3owk3j4D/REf1OZmDr
	 Uo2KOlz6OFosnvugrW+ohEIlEoNJ9jbKJOVMaX6kCAMT/kM0IFrYPRDRjGE0MGv7Ta
	 MfI3c9LFChz/A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C500648E4F;
	Wed, 11 Nov 2026 07:19:49 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Wed, 11 Nov 2026 07:19:50 +0000
Subject: [PATCH v2 2/3] arm64: dts: rockchip: add the SPI NOR flash supply
 on Orange Pi 5
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
Message-Id: <20261111-opi5-dts-v2-2-821f666418a6@gmail.com>
References: <20261111-opi5-dts-v2-0-821f666418a6@gmail.com>
In-Reply-To: <20261111-opi5-dts-v2-0-821f666418a6@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794381589; l=1541;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=9AwdsnGfZOnrDAgXOfqgNderVhk3/vp9FG3EwftKGrU=;
 b=RhOdbp4OjjH909fs+0CrOvJW2bTfSGyvtpLiF19yu7WiUnQ8cYh+GNImj0oVekqQKA3GE9lUE
 u4j/fgevyICCYYIA4NMuLetlWruPnqxKVWCo2WNbX4zeJH+ZiO5riG5
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

Describe the supply on the flash node in rk3588s-orangepi-5.dtsi, where
the node and the regulator are defined. The rail is always-on, so
nothing changes functionally; the flash just gets its real supply
instead of a dummy one. Only the Orange Pi 5 enables the flash: on the
5B and 5 Pro the FSPI M0 pins are used by the eMMC and the controller
stays disabled.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
index 2db6ee95e504..c7d892e4f961 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
@@ -302,6 +302,7 @@ flash@0 {
 		spi-max-frequency = <100000000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <1>;
+		vcc-supply = <&vcc_1v8_s3>;
 	};
 };
 

-- 
2.55.0


