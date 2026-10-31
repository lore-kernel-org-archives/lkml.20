Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=88.99.92.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793443644;
	b=qMCOZ2LnJ4BkmbrlmPRlB+LPF4IbMy+5TuBz89kOFAZhnGbXLFKd6Cv5Hd2DvMinWQmo
	 u+Ie3zMH0JnRbAgiYF+5UclPN05I6H3HqHXMage0p9PzLbKlkBNtu98p5CyAFTNEaMz5N
	 NEY1jUka9dxYHzY4MnTIYCGkUojx5HIj2rjBZsyOZGygadrS76bmcP036/jrILdAaoT5Z
	 Q0YIt3WKQQVjuZd3aFH8OMBnf4u8UQl+mYBrJ+qhB0cCmvreL4Pl3n/8Y/wSOzwsVZSyH
	 11FMk+sOYUcJKwOXpC43M6/Bkb4Lq5iFBkn+HPJgXmRAJvKEa08DV6eRtmmatIaKZ1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793443644;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ro5uBOTlH2ViXG6XGGaXGua1uESFLQo39EqXpXszZIM=;
	b=ZxogGUGLEZwJUOoj2hpcn/X35ZgixdVOvxfrhfkGieK4FFXerx8UQR2zXenBO5VgTAEz
	 I84OwKiCAeFfgjKFMk8jDaXTZjYiFVak25WvTQ4SIzFYBVS3c6JQnje0BqQIbcr7tm9XZ
	 jNYYDi5FgLlcblKdZrIw3Nd4rk+DzJY+ETzy/zdAmoQO1e9O0Z4yfRpcAr2Ro1/GEnbRJ
	 qzFh5B/Y3S3Dpw7uyQfH/OQ7hb6CKqORAwb/Y7iHfrgHgsKkEeSuxfI6rNRsbp87ahAxD
	 f37Aqw3XLSZG5UYOA3y2N11BdYZ2Wdi23SCVraTA/gcvBQlnWi0KOArOUrocmzEDJ7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=rojer.me;
	spf=pass smtp.mailfrom=rojer.me;
	dkim=pass header.d=rojer.me header.i=@rojer.me header.a=rsa-sha256 header.s=main header.b=GueXttvU;
	arc=none smtp.remote-ip=88.99.92.76
Received: from mail1.rojer.cloud (mail1.rojer.cloud [88.99.92.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CC7606A31A;
	Sat, 31 Oct 2026 10:47:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94CC7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rojer.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rojer.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rojer.me header.i=@rojer.me header.a=rsa-sha256 header.s=main header.b=GueXttvU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rojer.me; s=main;
	t=1793443641; bh=7NkSKI/Rjulpx5rqWQnpm7x33f+kOaCiSsh8St9yfw4=;
	h=From:To:Cc:Subject:Date:From;
	b=GueXttvUeTVBqJ6wOeNsJMxLNct64xjTTEFtUbqrjsJXWi7hFb0BePcWNbzy3NfR6
	 5kdmQDSL1qGp7aCsUPsyOc0H2/aPE9wsXIBIWVGoaKuPr4OM6ik5yRFc5tu+cVu3WL
	 0czxJVo9xjlpSqwFkCcKQua/0bUQLbGDDKxHQcAG9DQ5sx50CJJBlYpu6Ld1WHZeEV
	 e0Rpx9EIqaS8rUEMa43sALWmt09tCLqmd8ukEhZv3f9I27ycpTfSw6+roxZjkDN+MB
	 SxVgSnDZEv46tfluY1Zm87tjPmLAMI9RBaJ4HiVpFnlVxZdxZR41+4wqiswsY/xNIB
	 CciKZdSlttgTg==
Received: from nbf.rojer.cloud (unknown [85.98.52.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by mail1.rojer.cloud (Postfix) with ESMTPSA id 3FC1521635;
	Sat, 31 Oct 2026 10:47:20 +0000 (UTC)
From: Deomid rojer Ryabkov <rojer@rojer.me>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jin@mediatomb.cc,
	shawn.lin@rock-chips.com,
	jensenhuang@friendlyarm.com,
	Deomid rojer Ryabkov <rojer@rojer.me>
Subject: [PATCH v2 0/2] arm64: dts: rockchip: NanoPi R2S Plus: fix io-domains, enable SDIO Wi-Fi
Date: Sat, 31 Oct 2026 13:47:12 +0300
Message-ID: <20261031104714.3271017-1-rojer@rojer.me>
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

Patch 1 fixes the VCCIO4/VCCIO6 supplies of the NanoPi R2S Plus, which
were inherited from the NanoPi R2S but are wired differently (see the
schematics referenced in the patch).

Patch 2 enables the M.2 E-key SDIO slot, which FriendlyElec populates
with an optional RTL8822CS (Fn-Link 6222B-SRC) Wi-Fi module.

With these the module works at 50 MHz high-speed. Reaching SDR104 needs
an mmc core fix for the module's CMD11 handling, posted to linux-mmc:
https://lore.kernel.org/linux-mmc/20261030142224.3183407-1-rojer@rojer.me/

Tested on a NanoPi R2S Plus; dtbs_check reports no new warnings.

Changes in v2:
- 2/2: dropped disable-wp from the SDIO node (Shawn).
- 2/2: link to v3 of the mmc series.
- Collected Reviewed-by (Shawn, 2/2).

v1: https://lore.kernel.org/linux-rockchip/20261023235959.2988087-1-rojer@rojer.me/

Deomid rojer Ryabkov (2):
  arm64: dts: rockchip: Fix VCCIO4/VCCIO6 supplies on NanoPi R2S Plus
  arm64: dts: rockchip: Enable SDIO Wi-Fi on NanoPi R2S Plus

 .../dts/rockchip/rk3328-nanopi-r2s-plus.dts   | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)


base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
-- 
2.53.0

