Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794289018;
	b=UX86EFstMCpbvYWoFSLOa3dOS/F8ZX0JCYQpvU9CfOKMGGiZk++aO/mASkgDC6mrKbGU
	 pL2D8U8ZjxvBWEBNeZP3UqIx0Qyzr3qEz9id4bsN1GTx9jjsw5OTRomvmPz9JI1d81805
	 CL0BS6htKWx9d1Rh3x+PsOehCQ3aPe9nStzPDJilHoGX2+dn8smqeJjukNz1LEQEBW93f
	 xf2UOXB8UeZVx2EglqgT7Iut4TDgccbmTshFE/XLMn74TsiiwVB2Ezzb0HvWFAC5Q53J2
	 +vjpWmI9sLod5UCrEvoBVkZRHE4YQU8nj7T1iZHrKjRAr02TsnXh5eUeVf1Ym3Q3Vnw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289018;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=16wVqdPDZIuHoW9AEJTC3axaVHxMIkstnwglYRMIniw=;
	b=UaqqKfE+xptKcvqVUveXSNucxWKqS8ptCBOMm3fNOXUP9xT7qK7TXPlldnJd3iFF5UWp
	 LrWcMbAzWbuznEbWAgC84lWPT3s2zV1ozktagnp9RBUcg5WO5kphSZhKfQkhMtzSH3c74
	 TQKL0SAxHmgsXTH4dhLVJfyXTAVq/wWE/r4YcDFtPZnUEp2hOLOReVY7o9qemu84EhnRm
	 pEFsvmXVDjFCHklxKDvRbDKSpznAYNYa2kfPUzIfRQiqrPYybVXSHvJqNg/MtEctJAY+e
	 L3W8FxwDXzMGkiN03qgSgypDfRfn5q6stYgc9EFtMtwmUUzlW4XDWrHMC9vlM6GN9MA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XWz6yvhc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A91606A325;
	Tue, 10 Nov 2026 05:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XWz6yvhc
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794289018;
	b=UydpI176BEuwjy53HWkVx48lUKN3/8BZM2/2Sxxto0VI4xydFWiaZ4Usvj7BXI2nQxRe
	 gDOI9xz3jK45Unrludt/3HIlLQ+6Ph2fyGrQZyXswtaUOWCV6TwVXiomiQmM3kL2KqnNE
	 bsWDBQkjRUWEFHjYUirLUg776s/vDKyYaaBTSny0QIvrwe19ai8L3sRP+w+Lrd1eJ1l2e
	 Bgpcq5PK1l7mFu4/IYRioUqtbR0kyauur2jg9WRihSg5VkoGVWcyxkzhHiab5TtfQSe4b
	 jcHWozxHr2ffxWJZGY3dPXq6zxGvw6kI22b8bJfb8YYIac8bjUTuFI6Pm9mtfWH3UDQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794289018;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=16wVqdPDZIuHoW9AEJTC3axaVHxMIkstnwglYRMIniw=;
	b=oKK1jUvpzVRVrOVUfRoJdi43mF3ZkqVbXO4EdLiX/lSAehu1KXZzSKBVfyB+WLsw0Tug
	 2RTzZn0yG3BNZh1dbjsqzPj6aC1D/7UkxWk70n+avnUjYKfjmYH99UKyGr0yyGDVTrg10
	 jxkUJB1CJvWWq6s3SLFH1MNuPfTjhyK6VnIVVEp1OQYa2wQBeDFyClhFozYIxw784M3cB
	 sEWXq5ZczKRiXrKvwQkMkgZWYM0IFWZdFqpWTI7+WjaMIzukCwPvkPXLplstnKhtaizaY
	 2yJ5+iLZICAWrqNJgSFpsjtviDszRU2h7Iv3VScjB//cekLPtmw05xYqaDxu5g2t+FA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 268751F008A2;
	Tue, 10 Nov 2026 05:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794289018;
	bh=16wVqdPDZIuHoW9AEJTC3axaVHxMIkstnwglYRMIniw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=XWz6yvhcRB1KhBJJzH0dW0hof+vzQG1mMkBiHCGS35uBsr61j29rhetSr/qYEUZro
	 OdFEyfpRGMwe5OoZy1eyHKsl8ZimlYLRMqGBeApMlEFJ9KS83ax/TZ3GBqWKhH6sgh
	 6O5SBKQbAINs2/uJgKiXaysuEwcEvmXoFPRTKxE1r/i8JNaM+qbVgZrb8JVRH7/+Zw
	 sqy1Z3neUIdOT+sDrLMOH6teELiFbHni56kd1MpYXOlDy7IAQrL8N+hdPCjjKg+8Gy
	 TrAyzDH++lmOVotjDettjkLLZBLhqQFM8Bh+5gMlTGG+qRItuVI7limOX2kI0U0Hmd
	 v1lH8jlpPXq5g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A48B1488A3;
	Tue, 10 Nov 2026 05:36:56 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 05:36:56 +0000
Subject: [PATCH 2/8] arm64: dts: allwinner: orangepi-zero2: Let the PHY add
 the RX delay
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
Message-Id: <20261110-h616-zero2-dt-v1-2-05506d760f21@gmail.com>
References: <20261110-h616-zero2-dt-v1-0-05506d760f21@gmail.com>
In-Reply-To: <20261110-h616-zero2-dt-v1-0-05506d760f21@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794289015; l=1923;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=hgTnawt6aimtaYNRLXqSLgWoRIBtKR4Hz80cKcd5MZQ=;
 b=8iTkh1En9vvXHawv7Uw7jL6daF1+oTzNlIVXcn7sATdE79v+2H7vAN6ntZaXx7g6Iua0tox1D
 yTLbsbAw8zPDsTNNW57X/v93BE+MX1E0cXO5wpVySkJvcBJFG/Lst9g
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The Orange Pi Zero2 describes its RTL8211F link as "rgmii", with the
whole RX clock delay (3100 ps, the maximum the H616 EMAC syscon can
add) inserted by the MAC. With "rgmii" the Realtek PHY driver also
clears the PHY's own RX delay bit, so RX sampling relies on the MAC
delay alone and sits at the edge of the window.

On the board this shows up as intermittent boots with a dead receive
path, after cold and warm resets alike: the link comes up at
1000/full and frames are transmitted and seen by the peer, but nothing
is ever received and the EMAC raises no RX interrupt. All EMAC clock,
pinmux, drive strength and syscon registers are the same on good and
bad boots. On a bad boot, setting the PHY RX delay bit and clearing
the syscon RX delay restores reception at once, without a link reset.

Use "rgmii-rxid" (RX delay in the PHY, none in the MAC), as the Orange
Pi Zero3 with the same PHY already does, and as the vendor BSP does.
The 700 ps MAC TX delay is kept. With this change 10 of 10 cold boots
had a working receive path.

Fixes: 5a378f9f2b15 ("arm64: dts: allwinner: h616: Add OrangePi Zero 2 board support")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
index f2e3300e078a..1fdf2d3c1a87 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
@@ -18,9 +18,9 @@ &cpu0 {
 };
 
 &emac0 {
-	allwinner,rx-delay-ps = <3100>;
 	allwinner,tx-delay-ps = <700>;
-	phy-mode = "rgmii";
+	/* RX delay is added by the PHY, TX delay by the EMAC */
+	phy-mode = "rgmii-rxid";
 	phy-supply = <&reg_dcdce>;
 };
 

-- 
2.55.0


