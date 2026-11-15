Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=116.202.128.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794772404;
	b=uXdSvzdlDd8nLUiJnt3DTH0KhJEOcbC7p8d9IbohJM4M4zslV/Bj6vySlUu/ypxLbsta
	 UEEWjE5TlJEVjyKA+VQMLoT2gnePRGF/lekM9N1cbu+mJdSie787GheQvgy85mByBvAje
	 kDE+RZDjQK+c90NK6qkeuYj2gAXJgSaApvbld2FbsyD+hu7+wa1JtrWDTk3CalrVYKd3/
	 CPVEFBSo/lKPO2zvtxcIgUSU8agmf57LFx+fcP1CBrcs1mlGXDKswrMbNChxi4gqFFo3H
	 uD20aeGv+BsqUFK4VJuvsIsyKlgjKIt2lZ6ju690KlHAk+ovrJA67EJFRVJO8OjsQpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794772404;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=z8Udy+gpKS3X/0jkZQA4Y95ag0ehIFXEGZWv/GeBkw8=;
	b=ibmp4/mmoYwhML4Sjh3/tNlGHBvfQYWqQ/f/zLz8B3hZ4zDjUQIWe6+AC5FjZkteCGtk
	 j4/hrSafMX43hoBcS03feu0VqQ0n8iU1SugNzBK/5bO5bbMmBSJ0lV0v/vZyOHVayuo1u
	 RFWrr6YErNKZDK6wt3ajiJxoi9w21IWaWlDMXGYMXyJX0jjZ3t0yvbq7f8ookDah6jnYF
	 15UTIXfCobp7z/t2IYoi0Sg2F6ZAOij0OeY1EU4Yg0sy2w+UDTymFwa97Tsd3zGtbJnD+
	 zWAYoEwSBQX6OzwIlrerIXf/iXa07bTdtu3svuYQL+oQERndCtXtFBO7IP8Th4kNsrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=freeshell.de;
	spf=pass smtp.mailfrom=freeshell.de;
	dkim=pass header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=cZ2PH9iF;
	arc=none smtp.remote-ip=116.202.128.144
Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B393C606A32F;
	Sun, 15 Nov 2026 19:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B393C606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=cZ2PH9iF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1794772326;
	bh=z8Udy+gpKS3X/0jkZQA4Y95ag0ehIFXEGZWv/GeBkw8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cZ2PH9iFTQ+VBRORVMazOMTts1QCCspB2vi1ekqjU7ulTotDrWL0V/vxpVwTyazPf
	 PGGnG1ooq8tKWntpZZsSq+1DfyP0euayW6/VY+pYx1YONH9K7GFlKBMRpZWpse9rmf
	 4dne2atDuWxKvKPkAQJt2ftQ2s9++5mFD3NsX2leEx0nUYDHiCsOoXA109nQoBNnD2
	 +WCk+pY6RoOBAw75TuPS/ktgY9skbEL8aByrzTOlKnbTf764Xc7ImcVyhl+dsj48LI
	 gY4KXZ+aVIBUw94/O+mVKmVppT1vCgBT8Xz5SYhnxPR8osj7pKg/6aYVQSPZUAhrAt
	 E7oE0KQmU29Qw==
Received: from hay.lan (unknown [IPv6:2605:59ca:364f:d400:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 55773B2202E6;
	Sun, 15 Nov 2026 20:52:03 +0100 (CET)
From: E Shattow <e@freeshell.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	E Shattow <e@freeshell.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] riscv: dts: spacemit: k3: use pico-itx 8gb memory configuration
Date: Sun, 15 Nov 2026 11:51:00 -0800
Message-ID: <20261115195112.32120-3-e@freeshell.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115195112.32120-1-e@freeshell.de>
References: <20261115195112.32120-1-e@freeshell.de>
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

The boot loader may override this configuration based on stored ID value
in EEPROM TLV and if it does not then the smallest common sold
configuration of 8gb is the most compatible option.

Signed-off-by: E Shattow <e@freeshell.de>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index dda420900aa2..8d1cd468cf8c 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -25,7 +25,7 @@ chosen {
 
 	memory@100000000 {
 		device_type = "memory";
-		reg = <0x1 0x00000000 0x4 0x00000000>;
+		reg = <0x1 0x00000000 0x2 0x00000000>;
 	};
 
 	reg_aux_vcc3v3: regulator-aux-vcc3v3 {
-- 
2.53.0

