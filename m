Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794786654;
	b=0ztz3pKJHSfN7vKHQbETTpEOdeW5AW/ZVBMel1GoR99VY5bVhMJIRd6gIjLHC9dB9HG9
	 27U7lJqLMRJSIyjxR+NqHJXoFO9Rvu+ApR1kFVtk60WIYNEaEPZl/xc+a0zRZTJ70AZw1
	 +boiOgIww067nDoAksIAWoP0Gwwsxda2pMYbKtD+8WhRmP9llxyHDH7mBoOkGa+zypsi9
	 JGDiQoNr3YEYFxcGQMVQZH/+8koL9AAt/uefwF8/c5lBmGz4PN/Qa+7HT67yFfmyOItQn
	 sHQ2WLibe5zMDv0375g/zdVx4R38YUre7Drp5hpxgAT6SmIjA19GEUMZ2vUVTyMnafQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794786654;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=MeqapdHk4YD2xGr4hOW9N3bcaYW9GCT1w2/RAdnybrA=;
	b=yD6BMSTpQggokhooibZsz9vu3Z1+5vf+HKGIMgaCZGa4Q1gjFDzW4eKRyxuUjn2gYmLW
	 rWWF38YOxZ6qM/NapvBLb5K6+jZG9Hz6rDYWApRYSaDyScXolvA38qkM9UBpp6K/r4eNl
	 +zMFzKpzMYXvqJdIVESdgNAOSYeQnIB5jpPpQhQQfjgTO04QTcZV73cuKfRLF71SD5whK
	 jJM9jWl7GWynNyMpl8We9dsuut4XmZwTSPPHUqPPRcqE2soJzR7SAwz/2wnIGjbVlQrVG
	 kqn9w0DbbaJ0bk6dYibqXbfgM29EVACtfVWUyI1RQbLIHRy0qRf1y3VC8D/SbNS0TZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LVbLpaAv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7D6606A31F;
	Sun, 15 Nov 2026 23:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LVbLpaAv
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794786654;
	b=TjTTnwbeMzZjBjYvHsZ9w3nJ5MgKlcCmKzx+wwjzIXEHq+F7JS5W7u6BLeUgGQV1UATe
	 ydd5tDO4tyzcYQBDnM5rhLYVddKz64bxvDw4hK7BLey56n+OMyKJBn5tFj6PPM6ls42tG
	 3wxF49rcFMQzJz0YzssU+EZGqhqvHHdcnMTriS+qmyzLo0efF/+BSogmYO/QNTNklybtb
	 rDW4t3gVlHiUsu68fJoF130gmL/H9LZvgspyfM9EwsXa7Lxqs/7eFoiifscl4c1h6hfVD
	 T0IbioGVVgQol3vXzV6kXmekgdNf4+8FZIaKqEykm1kXuhSzYz3V8CJi8dmaeFQllmA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794786654;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=MeqapdHk4YD2xGr4hOW9N3bcaYW9GCT1w2/RAdnybrA=;
	b=0+rUjt8xHFD8C6OTJHwIdPuLIdUhxHHnNTstGJeo5Llu2rc7efkQkV8+VSWo+N9AJ8I1
	 Xz0wsChD/R0jt1k+OnevGKs43dj5whPd0B0dIcp1yvcjWRMFcz83xKipsMvhgaWx4oloj
	 uoP3g09YmhNMkYuTMVci4c7bM5M3a6EZuxjY4Q8sHcG9gvX+VJYji7jyEz39Ma25STo1C
	 H0X6ndTWZG7N7cl5/IcTusFGkKrnOL6YeQkNcxg6V9WQi1hawm2EnccKMK4NGQtJkon0i
	 JOfqQYoxaULioHHt4XYfT0WcP8VjKK/D8ME9uFmhG7nkTpRQSeSHvaKEj+IBwJbZugw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6F8191F000C5;
	Sun, 15 Nov 2026 23:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794786654;
	bh=MeqapdHk4YD2xGr4hOW9N3bcaYW9GCT1w2/RAdnybrA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=LVbLpaAv3vOHjcBoybyAg45ytK+25ttm5462oXWAnJssqVoW0rc8Z+dItDtGhZw7z
	 /iN+5hU0D9gjwQt/BUNEJR4jisMljQ71jQXOdHNNqn6k1ReRbt1Khd7k38EFKD56ZZ
	 EMvG4lxCbzpb6bHc3NyCsKDcUsKaJUesSpQqg/UavXjrkd5AK80wTm3d8uffXvyrBf
	 XpuPhOp3hRriplbe2BDi06/q/4TP9kuYuGuZ8hp15rJEPVtmCLGfq+Hc4gwl2f6iy7
	 3r1HK3HgoO867AbP9AVpI8pqmgyoruqa3JoDTczDF/1K8toEQBv71iomGQbtAAS7Ig
	 9FbEytRuG46iA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DB1E84A269;
	Sun, 15 Nov 2026 23:50:52 +0000 (UTC)
From: Cristian Filipescu via B4 Relay <devnull+filipescu.cristian.gmail.com@kernel.org>
Date: Sun, 15 Nov 2026 23:50:53 +0000
Subject: [PATCH v4 1/2] dt-bindings: arm: sunxi: Add Orange Pi 3 LTS board
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-sunxi-orangepi-3-lts-v4-1-7749b448a4dd@gmail.com>
References: <20261115-sunxi-orangepi-3-lts-v4-0-7749b448a4dd@gmail.com>
In-Reply-To: <20261115-sunxi-orangepi-3-lts-v4-0-7749b448a4dd@gmail.com>
To: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Andre Przywara <andre.przywara@arm.com>, linux-kernel@vger.kernel.org, 
 Cristian Filipescu <filipescu.cristian@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794786652; l=1216;
 i=filipescu.cristian@gmail.com; s=uboot-20261021;
 h=from:subject:message-id;
 bh=t1m1y0S3cSpYjFuC+gfshCNEaxwz0B7aj0D0DiamZcc=;
 b=6rsviHqfyNvuUfwaeX7usjb8tYKflmvaKH0g0aruXrRgNjB2OftteZxn+Ci8iMie7agptcEWR
 LyvrNUB/VG3AG2ZW3E5Xd8e8trNUMPyhIvRfV9CYe+afaIp5dcx1PNo
X-Developer-Key: i=filipescu.cristian@gmail.com; a=ed25519;
 pk=o7Ui0tU3x+X/6Pq6PZHmd2KFtOdPWttoPuNFOvdD8t0=
X-Endpoint-Received: by B4 Relay for
 filipescu.cristian@gmail.com/uboot-20261021 with auth_id=1255
X-Original-From: Cristian Filipescu <filipescu.cristian@gmail.com>
Reply-To: filipescu.cristian@gmail.com

From: Jernej Skrabec <jernej.skrabec@gmail.com>

The Orange Pi 3 LTS is similar to the Orange Pi 3, with different
Ethernet and wireless hardware. It includes 2 GiB RAM and 8 GiB eMMC.

Add its board compatible to the Allwinner platform binding.

Link: https://lore.kernel.org/linux-sunxi/20250413134318.66681-2-jernej.skrabec@gmail.com/
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Cristian Filipescu <filipescu.cristian@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index f04db28c6..379dc8591 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -1008,6 +1008,11 @@ properties:
           - const: xunlong,orangepi-3
           - const: allwinner,sun50i-h6
 
+      - description: Xunlong OrangePi 3 LTS
+        items:
+          - const: xunlong,orangepi-3-lts
+          - const: allwinner,sun50i-h6
+
       - description: Xunlong OrangePi 4A
         items:
           - const: xunlong,orangepi-4a

-- 
2.47.3


