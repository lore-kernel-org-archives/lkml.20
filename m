Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794496408;
	b=jfAasqOl+Hqah8dxASTN7z6TlJwM/Hwus/DEgLmT8lS8ke41Q8cQFVAYheZWFkfeK6V6
	 B0pl5zDsdEnZ7+zwytIlFFrJ8257iVqYSvXH0pKIRrjPDt+ecd9OyXzqSeKCQEWuHbfR1
	 JqFVBREeffagWFQ6W2XuabS+QLK4rWNH/7gAdufBoqIQERQyfXJE4NCeOUqEubfHbWoeC
	 0M2XveHLCsJZMFudHuPpuGX3VEAX5BIfqNaQJD2EcYrw4hffjP/ql4cje0Z8xCNs5lMQq
	 Ot2U9vaFcHWgtVKYmO6pEaNc+GHRVk62TT510F8nJrW/dB9N0kSYmpH+TTgsvVRRMvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496408;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=JQbdPYCtgf+mZVsh4EgiPcZ0AL/VdRiVcT7T0GlFqyI=;
	b=UHV9FVe2wboAsfxHF6JtTUuYAzjHcuIjyc1hgDFn6XtSfr6IW++ICfZCnJI+UR6ZlYJU
	 TUazZP3Sc3xrBC9cjn1Aans/NkiC0oodep1pHLz0D1lLPs65m37UlJkMiJndXy1Vw8HW3
	 HbNck+nA5hf8j0jrGUGoIEKI7dw6ASNKBAOffnJOthInK640rnzNVT0VeY3uClKO79ZvH
	 U+ItVZivX0xJBnq76jMLdglcFgBRLpcn3z/JL+BT4oYfNih4Ha6PUCB+XDogtLrHp00ic
	 8hw+/58SDsmhu6eYwVSG1I6mGTsVJ3KrenMH82qwXetUSd47Z9M1MdRsyCjVYc3K1FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=JgLJYFbv;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A35606A31C;
	Thu, 12 Nov 2026 15:13:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46A35606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=JgLJYFbv
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id F0BB523134;
	Thu, 12 Nov 2026 16:13:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794496406;
	bh=JQbdPYCtgf+mZVsh4EgiPcZ0AL/VdRiVcT7T0GlFqyI=; h=From:To:Subject;
	b=JgLJYFbve/m3/xZLADbX68tj9p6tN3kaqRE+2XXZFlzio6oBrxgjfQJOcc4cZCQCr
	 wX13LtTTHbG2j3bDauFYe4hD35NHmX7178S2rnzN0Io68BF8+3JT8Ar4V+eDRXySAR
	 1mMvwzvhDpkdWp3WHsrINugZDaelG+2V9m+Hu3+0WN+066sY++QxrizQywXhZDlPJk
	 8vYHnmJ8bdJcdlhGTjeFN2LUMUc1fmGMUajzb6ijCuXpt1EZ+lYkGPilkINnYcuIF4
	 ynnRBohRM5m2zz2zhR0yWAY2agCNPaoZwRo4RBH4OaBre8N6pZQpNBAdlsG6AGydqu
	 9XL9PFoMmdkjw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] arm64: dts: ti: Add SPI aliases to Toradex Verdin and Aquila SoMs
Date: Thu, 12 Nov 2026 16:13:13 +0100
Message-ID: <20261112151317.178959-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Toradex SoM families (Verdin, Aquila) define the interfaces available
to the carrier board and their numbering, SPI_1, SPI_2 and so on, as
part of the family pinout. The Linux SPI bus number is instead assigned
dynamically, so the bus number in sysfs and the spidev device name
depend on probe order and on which other SPI controllers a given
carrier board enables.

Add spiN aliases to the SoM dtsi files so the Linux bus number follows
the family interface numbering, zero-based like the existing
serial and can aliases: SPI_1 is spi0, SPI_2 is spi1. SPI controllers
that are not part of the family pinout, such as the one connecting only
the on-module TPM, get no alias.

Francesco Dolcini (3):
  arm64: dts: ti: k3-am62-verdin: Add SPI alias
  arm64: dts: ti: k3-am62p-verdin: Add SPI alias
  arm64: dts: ti: k3-am69-aquila: Add SPI aliases

 arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi  | 1 +
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi | 1 +
 arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi  | 2 ++
 3 files changed, 4 insertions(+)

-- 
2.47.3

