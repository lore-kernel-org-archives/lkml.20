Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793057694;
	b=r2Y2CALcM6f492Q6foSMgxSUuczoQl6EXysbKoeguMX1ezW6hC7FP9ESKIOj3DvhmQdl
	 ajZtygsZq/pbSycLVLPWrxFN1y/2/44vHbUxbFt+vdPGaS9vVUNRhVfcKF26B/tQ1vkAu
	 cVrwWwGyU1epsByQx/I9gPxxoMV8nBnAyEj4kplWFbbJyoHQTVr5FTMDMvJjYpjJfUPZS
	 HZAsbx+Wuc5x497hFQw0QXsrRt6CS74p5vWYmEENnMLoTtwY0gu8s5h7raS71kDjPLMt/
	 cBUPrPwK9JcXd6iYyafHItdomCazQ7tBijx+szYCQKm8PLIOlJ2gjWqmMl5s8slXWmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793057694;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=/2cgRjyL1qs26LDTeo+YVxH0zaNcEFNZhUgI6fBXXXQ=;
	b=IDxPVkqIaM8lq4+P22Khy9FMuR8P6cwH7/yEM7Ug+mmDRc76nw9NpM9Wqcm/7MHiWKNp
	 hl1LTdtwAPWagkbTv56OPF3EJnG3kUi70RxZGe5WSd0O+evDMGQlmVgNrY7z5egQAUGK1
	 7EWmtorD723GDNc43A0S4nLpxGhddRDSf1bavVqUx6Gd7Sd6sHvW8vnWq4OvJFo8LiYCe
	 j9E5rTJ2EDR12c4l7hHg62OFeCN85NQyhZFY21oiq9lhXlW/VH+ZQQ9LHAx8RWsMIGoDK
	 80hf3hYi1yD/nnRK+r4hxqT3VhVJWvmGBBaSeiDkqn3uSzTiy0vJvqqVyh/GzmBDaZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PIZn7VYO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AFE606A31E;
	Mon, 26 Oct 2026 23:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PIZn7VYO
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793057694;
	b=PvUU9ZDf1Vunpmf1/0B4zMNRSRd5uG5DrWRreTWD8vgRvh0Ac4/bZMSFbOTThQ67jmHr
	 2OWjvXVNH+I+0vPJZvlXj0Yr1dGUoctm8PXo8O8Y7j5pOrzjA5z7KMAUehLjHZZmsJhRA
	 2VV8j6cNlKV75usI8nqKvN3Rxq14b95wz6bjkM98YFczb/KkI1mbwYgYV9NLenHXXu9i3
	 iy2q7Uxu603FjnC5pYMbK5ky0H5gOOXpVg8wARi+oB91fPZdTrnSOj30E/NE1dhDvihJp
	 pBz4knqbLU3IiItHULQyF9VJSpm0sib6JrFxI8JJOAZrKcQSXOdP+/ygqHIIOHiY3Ng==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793057694;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=/2cgRjyL1qs26LDTeo+YVxH0zaNcEFNZhUgI6fBXXXQ=;
	b=eM9Bfq7XmG9OEAIMxaLSCnfX6/+HhE6s/U60EXWqlYtnDmIp4Kh8LT6+lz4StbtRJYIU
	 y4JspTFn1wy4kiEuWUJ8Fk2o51qiODR0bIBCvzpG/iYfVSu2kyC9enXmY2y0To/uSNsGu
	 nKO+KBvrbZCQEcKtr7JMGNKxkpmMTLo7c4CMni/7PbZgPO5ihPrc6W5uJhzlJBNU+WYIc
	 s4vvIvMICM7ClEjWVQfZcULYTbtlSNvsed8Qd7nZYo/b1zJ0ymAGkDB4mqpup/+HtWgNz
	 D2gdrUZUslyDv7nm684Ff712KIjH1G/a0iS6p9ox5SKajgVPERx7RcceaDz9hiZdf2Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 586BB1F01825;
	Mon, 26 Oct 2026 23:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793057694;
	bh=/2cgRjyL1qs26LDTeo+YVxH0zaNcEFNZhUgI6fBXXXQ=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=PIZn7VYOuBQ09ix3wSahm8GBjM4eC04AzsXuxYexaxXtp0kYdAYel8aLI05PdpPeE
	 CGSrKU+LdogAKGEqrCpinzaZ7VCA0p344VesSytwSESUOR2+0JpyaKUVKQsjfxWW+D
	 TTjpNOyObu7zmoNSt6XAQZHhi0ckf5ioWtjWTshzpIiSornWkh6bIMEj5iVliolBN1
	 DzjPuFtUO4FQAKdXgpYEIGR5toyQy4E96JwO14gIMSXRgmMAjb3u+lixLQ/VvncmLV
	 dK+7tmJabqTqw2+zVMm+S3Yp85Q9FJqQdoBl5iObykmfGia3ilL+Y303axUdyZ0U2Y
	 0/15SA0oJuUUQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A3D2D44EEF;
	Mon, 26 Oct 2026 23:34:52 +0000 (UTC)
From: Cristian Filipescu via B4 Relay <devnull+filipescu.cristian.gmail.com@kernel.org>
Subject: [PATCH v3 0/2] arm64: dts: allwinner: Support Orange Pi 3 LTS
Date: Mon, 26 Oct 2026 23:30:59 +0000
Message-Id: <20261026-sunxi-orangepi-3-lts-v3-0-98fef4f75184@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIALPi32oC/4WOQRKCMAxFr8J0bRwMiODKezgs2lIhDrRMAwwOw
 91t8QAu3//JSzbBxpNhcU824c1CTM4GyE6J0J20rQFqAgtMsbikiMCzXQmcj91IkEE/MeSZqhD
 zQpamEWF19OZF66F91j/mWb2NnqIrTijJBlSw6C5GPdl5hRjGsiOenP8cTy0YJX/uLwgp3FJVV
 hVeURfy0Q6S+rN2g6j3ff8C0SUoP+cAAAA=
X-Change-ID: 20261022-sunxi-orangepi-3-lts-43b92246a8ed
To: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Andre Przywara <andre.przywara@arm.com>, linux-kernel@vger.kernel.org, 
 Cristian Filipescu <filipescu.cristian@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793057459; l=1992;
 i=filipescu.cristian@gmail.com; s=uboot-20261021;
 h=from:subject:message-id;
 bh=ssdCd+cOb3vtsGK2tRgFxcvft6R9+5/9qtV6Fbja4Yg=;
 b=1vCFUDdeBnX3cdyq4w/VMNM8FHwVt4nneYPP6UQr+YeFjWhX4ilKTbVh8tBWcfLau/2MnN2YN
 I//RPwFuqAFDGe6oRRlVHkYTp/Ryr8qdYsa/lzxqWCCsq9pbXb85ZqV
X-Developer-Key: i=filipescu.cristian@gmail.com; a=ed25519;
 pk=o7Ui0tU3x+X/6Pq6PZHmd2KFtOdPWttoPuNFOvdD8t0=
X-Endpoint-Received: by B4 Relay for
 filipescu.cristian@gmail.com/uboot-20261021 with auth_id=1255
X-Original-From: Cristian Filipescu <filipescu.cristian@gmail.com>
Reply-To: filipescu.cristian@gmail.com

Continue Jernej Skrabec's April 2025 series, adding the board compatible
and device tree for the Allwinner H6-based Orange Pi 3 LTS.

Board testing passed SD/eMMC reads, both LEDs at drive strength 10,
and five Ethernet interface cycles plus three MAC driver rebinds.
Each network cycle reached 1 Gbps/full duplex, obtained DHCP and passed
ping; PHY ID and 125 MHz clock-output configuration were read back.
eMMC DDR52 at 50 MHz and HS200 at 150 MHz each passed 768 MiB of direct
reads and 256 MiB of patterned writes with verified readbacks and data
restoration. All reported MMC error counters were zero. Both board DTBs
compile and pass schema checks.

Codex assisted with DTS updates, review analysis and build checks;
Cristian performed the board tests.

---
Changes in v3:
- Keep green as power and red as status, matching Armbian LTS roles;
  default green on and red off without a boot-stage sequence.
- Select drive strength 10 on PL4 and PL7 with per-LED pinctrl states.
- Move PHY reset to the MDIO bus, before discovery and outside detach.
- Specify the YT8531C PHY ID; MAC rebind fails with early autodetection.
- Enable 1.8 V eMMC DDR52 and HS200 after board testing; retain the
  existing H6 maximum frequency of 150 MHz.
- Shorten the descriptions and update validation status.
- Link to v2: https://lore.kernel.org/all/20261022-sunxi-orangepi-3-lts-v2-0-70b899252c6a@gmail.com/

---
Jernej Skrabec (2):
      dt-bindings: arm: sunxi: Add Orange Pi 3 LTS board
      arm64: dts: allwinner: h6: Add Orange Pi 3 LTS

 Documentation/devicetree/bindings/arm/sunxi.yaml   |   5 +
 arch/arm64/boot/dts/allwinner/Makefile             |   1 +
 .../dts/allwinner/sun50i-h6-orangepi-3-lts.dts     | 379 +++++++++++++++++++++
 3 files changed, 385 insertions(+)
---
base-commit: 4403278e4ea2f654f8130a5c03eb8b4516a0f201
change-id: 20261022-sunxi-orangepi-3-lts-43b92246a8ed

Best regards,
--  
Cristian Filipescu <filipescu.cristian@gmail.com>


