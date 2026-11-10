Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794295053;
	b=zTlgmFbQbvhWALucPjiXIKJUkS9D9lCAH60z9jAv5gdD0+eknCEPfGjR6Yl+li1r4YjY
	 DmJMGWZujQjnS+/YslCbNFpevDt/anVinldMupTB0fy5n03IoSHFOKjS8uheYqrWMIjYL
	 vz7XUImom2WHlUZl22AyvoB4rNdfRxaWbqBzZOGdvC8CXMlfuWbwqcqKfD4LOuzxNkWT0
	 FJTRvREI6pbWkBIREaB6pG0IwfkDS5/BlvReC8KnqBT4xPtC8xLDJdTagfd68qVxX5YoL
	 fH9mgI0TvCGyKUG+QO97yrXFEwy0spMXOVKuIHMB64MU24ItHdvHxaqX6cpiIvu+UHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794295053;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CRzHgqSJ6wnWT7aGMz6+06OqkwIsCJsoPRU6TVLW0Ic=;
	b=WFYX570e8fJDkog8gtTMOx6ps3v4QrxXMgy0yBzAzxN4yuC9v3xK/zjHkZSXOmIctafQ
	 WaXkAHkRSHjumIyT3pznTKm7xpfP2cHzmHLhfOZ8KgTw5N5It1cHRgFsI6aSglnDYEnYf
	 /lELl6tzmIUGgl0wlULfsOjjmS0nTXVdkGsVthEH2ne6MTo9P673cT4gBWMK2HloYWTa5
	 5exxtOE9ZA/NQcxvyrbLXSNOEI7uUndRip0Q5HtR8poEB+roLM4WOJaQ2v196IGjCdUmC
	 iBDmMBJf/pzkiQQvP0DxwBNxwrzd1+WGVMlv81CmJzD5cHfFRbGL9a/gVgiTCBhrdNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dj75bwQv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE11606A339;
	Tue, 10 Nov 2026 07:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dj75bwQv
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295053;
	b=zf6ToK3nbaqIQY3YhOXq4eDfLM674YZUsrWmJjDYZb68nkVXaiXkVdgbB3Oa7i2Owktu
	 Ig5XA3XytjqYdtxq2LBc5iwMEXBR5BE4At1XTToQjk5nriDZe0zkls9rednCmJoiCj2Yr
	 aSK3xfeby/c5Gpefr3ibODhvLsw5irJTBbnsJFU6oQPLTD4v+jSHwzjx/eGncFpr/fg5r
	 NmMfVTtayRaizyBPP4TX1Qq4yQTg1wsuKzHO6mYg2dyrv7+/hGIgNhcSp2KCnkjeHZ1Ls
	 Q6OcLKYV6wT66qpdbQn8SmRk/DVBA5ZKIpFgdgd06y7OSoWwtHkzeUtVZMUMoViANqQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295053;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CRzHgqSJ6wnWT7aGMz6+06OqkwIsCJsoPRU6TVLW0Ic=;
	b=mWHQwrCU+Ya5XCNmEzq2D30eB5p22e+d0tVWkrD14xqTc4mVtaiR8VRZA3+pNt5n8NwO
	 HlcsDQxkSPwbgoGAKYi1BOH92yvEu57iBPCsvhBIR6vq2hYHLjFVzGNJMSdjehWAdSrSI
	 n0yLMRakZNWA5qDNY65FWfGPbEIIBiR7qzq9Z6yfI7rKvH1tm35hD1l2DNtiiFWde9r52
	 o4x2T9MJKzj/rPbVQ4RgEaN1CcZv4kiGn8WGZDNMu/L300nP7Ggp4LOF9ExpJ68T8Ww96
	 3o6hCFkzMuCAlH7LisKTe5ubFgOxXema93oE2n4k/qFGknvpjxuEsJOZ8GxUnk/tktQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CFF701F008A1;
	Tue, 10 Nov 2026 07:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295053;
	bh=CRzHgqSJ6wnWT7aGMz6+06OqkwIsCJsoPRU6TVLW0Ic=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Dj75bwQvsSVgiDwgcG0P/1Vxm5fJKdifj1ppB3E+GqKJIJs6LJWPndJjod8FNXZP8
	 hmdTpbemOCT8DFslAKgYpWqC98Z2QMaD1xi/7TkKpWogcDZdWaV6LVgCYPOu3Yiz0y
	 f2FOG37aqOuniQoCNpvz/gmmaLA7g/G+SkKk0rhDBiUG2S0JxQzQHos8Hug3M4sBOW
	 AEClr+kWistUSUEy6MLo8qCmU2Kn2ZCqHO57fJTrBIXYSNp24fNgkuzjJ0DKEyGNI0
	 g61vR6sHKKuD88nL4boqt+ynzFMTvqcw0Rbey2XImaeFOX5a4Eji/ZU5E939lwY5Bf
	 hFMJvkvCdM3sw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 590E948978;
	Tue, 10 Nov 2026 07:17:31 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:17:31 +0000
Subject: [PATCH 1/5] dt-bindings: media: rockchip,rk3568-vepu: Add the
 reset lines
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
Message-Id: <20261110-hantro-robust-v1-1-6b6269c05bfa@gmail.com>
References: <20261110-hantro-robust-v1-0-6b6269c05bfa@gmail.com>
In-Reply-To: <20261110-hantro-robust-v1-0-6b6269c05bfa@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295050; l=1139;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=ugbiMmzavaBp42/wsrF8NeFbBYCV92Ge5prcqLnmtpY=;
 b=+9fz2/3wGBnPFV8f0UkHTfdqh2NhGskFForb8xFWq6PP+8OsHBmC22wvyPsEXzicgB+a8locc
 r5PxOzmt8YzBcujcPrRYHo0lo2XyiDoJHlI5/rJQI0aTvshFNe/pdX5
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The VEPU121 encoder cores of the RK3588 each have their own AXI and AHB
reset lines in the CRU (SRST_A_JPEG_ENCODERx and SRST_H_JPEG_ENCODERx).
They are needed to recover a core that is stuck on the bus, which its
registers can't stop.

Describe them as optional, so that existing device trees stay valid.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 .../devicetree/bindings/media/rockchip,rk3568-vepu.yaml        | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
index d246f5d38427..e9fda4373f0f 100644
--- a/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
@@ -32,6 +32,16 @@ properties:
       - const: aclk
       - const: hclk
 
+  resets:
+    items:
+      - description: AXI reset line
+      - description: AHB reset line
+
+  reset-names:
+    items:
+      - const: axi
+      - const: ahb
+
   power-domains:
     maxItems: 1
 

-- 
2.55.0


