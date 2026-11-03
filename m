Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.25.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738033;
	b=Gf9KxprLyMO5Lbxt6jc/tj5KQH5IDwqc2U2zc+zYlJVQX7kQCaB5rkrPHGCy7UvMWeQw
	 jx1kW8mbOCwh50YpancNfZ+7qU5/EKGV9eo6jOZrnGcKOZRu8KdoNMBLhOAIxCQYMXsAS
	 E6MaDEok1oUyYGRxivx4jl4nqOM3CjvKnrT0ICMmGWClu50IkwJAzD5ZjIZGj4TU3Mcwh
	 cDtkfcLNeXWKO3Ey0hFJRwEOccXSQql/sdla+vSmwJyqZU1aLfvbBCoaMo8b/o5ovJmd5
	 plSxGEURtrhVBwLpbSUNmwF1jlRKphFjJr9v4vQhcY7xYxh3QlYXdjme7e339Zypm+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738033;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:Received:
	 DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MwHtqe686HLLhg33s9GZ+hUKCHbjkbGAfCD5MLRkHsE=;
	b=E0U5/F8iVsldMYowNAg0KusoqJTvUQk7yaReJaRLFCvOIWxX/qM+rXVOcI+fhi49LU4R
	 kWztaqLw4hTpg4sz4ncyIQtOohmw9dF3qGOuVSSvWxBMdM+gDzDeAR5n/oXpcljQ6Tr5B
	 mCseOg/CZK9tDrWCzg1/Y2pcewH3oMMDqte08VyCpgXdI1cY4X7hLmBqGmGD18NjrIRhI
	 pqN6Jmw3HkIlTfblOfXOWA8rDnTOoQDdm1TgBnb1yEiAP290L4IUlxTA30484nJoc6us1
	 xOClvRRMo3k9C3Jf4fo7Snj/D24xSFuBNDmjH+MCoy47LOJOQurv3nyYnWZt5Qjz+2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rnplus.nl;
	spf=pass smtp.mailfrom=rnplus.nl;
	dkim=pass header.d=rnplus.nl header.i=@rnplus.nl header.a=rsa-sha256 header.s=dkim header.b=sKmCYXkY;
	arc=none smtp.remote-ip=178.251.25.70
Received: from mail.rnplus.nl (mail.rnplus.nl [178.251.25.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F37F606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:33:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F37F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rnplus.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rnplus.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rnplus.nl header.i=@rnplus.nl header.a=rsa-sha256 header.s=dkim header.b=sKmCYXkY
Received: from localhost (unknown [127.0.0.1])
	by mail.rnplus.nl (Postfix) with ESMTP id 06F16379784
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:33:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at rnplus.nl
Received: from mail.rnplus.nl ([127.0.0.1])
	by localhost (mail.rnplus.nl [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MOM2VxmsDCSj for <linux-kernel@vger.kernel.org>;
	Tue,  3 Nov 2026 21:33:43 +0100 (CET)
Received: from E595 (unknown [185.10.157.158])
	by mail.rnplus.nl (Postfix) with ESMTPSA id 45CC737963A;
	Tue,  3 Nov 2026 21:33:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rnplus.nl; s=dkim;
	t=1793738020; bh=dZ4MqU5UF2diSUFxnmeqIV/vngMvCegRDFqFTjout1g=;
	h=From:To:Cc:Subject:Date;
	b=sKmCYXkY8tZ6nSXpHUqoJ64JTJxCtzSCMqPqL+GYDRKYpp5zRKtSTeRQXXZlVx5f5
	 ofj5qRnZN0zZjdH0xCRfiXOub5URoOaht+YxgNzLb7sqXuFcveqUBrl7WrSfVbO3zw
	 BfG/42nLc+bVyu2D7RD5aKyDHcixKKtl5VHgxN+Q=
From: Renze Nicolai <renze@rnplus.nl>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Renze Nicolai <renze@rnplus.nl>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] ARM: dts: aspeed: x570d4u: devicetree fixes and cleanups
Date: Tue,  3 Nov 2026 21:33:01 +0100
Message-ID: <20261103203308.54789-1-renze@rnplus.nl>
X-Mailer: git-send-email 2.56.0
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

A handful of independent fixes and cleanups for the ASRock X570D4U
BMC devicetree, found while working on OpenBMC support for the board:

 - Remove the w83773g temperature sensor node, which is only present
   on 10GbE variants of the board and should not be instantiated
   unconditionally.
 - Fix the tachometer channel assignments for FAN4-FAN6, which did
   not match the board's actual PWM wiring and produced incorrect
   fan speed readings.
 - Give the eth0/eth1 MAC address nvmem cells unique node names, since
   they previously both resolved to the same NVMEM cell name once the
   unit address is stripped.
 - Add gpio-line-names entries for a few GPIO lines (NMI, BIOS
   chip-select, LPC reset, hard power-off) that were previously
   unnamed.

Renze Nicolai (4):
  ARM: dts: aspeed: x570d4u: Remove w83773g temperature sensor
  ARM: dts: aspeed: x570d4u: Fix fan tach channel assignments
  ARM: dts: aspeed: x570d4u: Give unique names to MAC address nvmem
    cells
  ARM: dts: aspeed: x570d4u: Add some GPIO line names

 .../dts/aspeed/aspeed-bmc-asrock-x570d4u.dts  | 25 ++++++++-----------
 1 file changed, 10 insertions(+), 15 deletions(-)

-- 
2.56.0

