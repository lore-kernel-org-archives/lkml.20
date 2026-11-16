Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794830134;
	b=quhPba7OYM1GY47bsgQ6TOc+WeA2rnSbRAe67NcSRktsIFjX0kebgSfA7zlkedOJa+/B
	 W3H9maMqxEMnT87k5Oz6+16Remv/ZvbmOJiPYIUnjw3NNy+cf9tN+1XvYKvS0ZQO4c429
	 zIB2UGYwnXHvx4PF/Tz4eLOcovEPdkABEqyVD1uE5QOINNnV9CNNhOO0WVmKQXRT3/uV2
	 DrgS5eReFOite7W9xVwg2LbopA9PJglRqNP8rf6NQ4bI10DAXNS6UIRU4lyOhgmxHH6i7
	 5eebXhVcdvMueV7A/GqJpmLA1N1x/EMCNUB8FWi/dwrBE0zU7JMScRFb6fL6U67rLfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830134;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=nRcfcPqfetT5jsi4BrjqJuRmHpuTHA7ybDz4X2ZZ5WM=;
	b=y6GzJ4HFfSqxbP3NJx6MfcZQKtNmI6RDztHPrJ6pGjdB345K8RQ5pnnppTVtcgmkFZHX
	 ZydKGBBipHasf92ZgOu8GZFgslZcA3AV22h2XPvEJ6jPy7f2+KrC9SO+OuAi1IHirugbr
	 uqPN9CO0D2tHNJ8rBl2NxHPeK6Qi8tfn4iWYy9INcr1v6u6oCwPNWn0HcwNIT5U4h0iWL
	 /CgKv3q+lubOU9Ttf6YS14BGH4vBCQMM4svTTlOb0kEAAahr32FEt1GiXzsjTJEhQFpaf
	 j4OMQi74gmCgF3h5wResYS+yZsdD0PdWQON4GGRBg4FV2S/67+QW+BmeP2UocL2Rb6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Umfh6l6S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D51606A89D;
	Mon, 16 Nov 2026 11:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Umfh6l6S
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794830133;
	b=dEqk9UHzScEThq2FYl8jVbJy7yDcYMJEYMJfSJQipKbOwESrEcuA2xNVSyTbmVa7fmQ3
	 UaJ8vOYnupqiH91V1GpuTYaX/gv6pszfFmAURVfjgoy5TSp70LHEbKTfIPxSrak+memH+
	 ECG3bB514JtZDKyAb/m2tHU7OUI4K/hhGrS7SwimzOWy2Znu5m5V6OjFsfE4F+LCufK5a
	 0jHL8e4Md4v59U7NzHVAgPAgoQOeyRiK6G5iRqPkPlrh+j16b23YmaI8OXOBQJN7Nm0Bv
	 /4BnIgZFqx7CDQDNakjqrY3gmUFLjFPQwBgL4EYE8MPDaps9UHaLl/1Hmx87exU+MJw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794830133;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=nRcfcPqfetT5jsi4BrjqJuRmHpuTHA7ybDz4X2ZZ5WM=;
	b=BiNxOPjJ7NzkEnqAtzPj6IEdEKu2cREe44GiI2AHp2UAFj3IV4fbWZHBMu7XyZB8kgz2
	 /s6fNMjvY6wv/aTTgEvzcHOqaqwSNyhZIk66burcTu/tJBSpBptWxgOzP+kgYF0O1sR1+
	 pNbi6qa0xdZqiTVCtTw1EcQYOb5Nku9oH5Xh3N9I8MzsVqfuCzOBaZrS3sf8oJuMmB0nA
	 Nd0HJ/Do2SoHiqQ6rS4C4+7jNrjrH2e+7yEHMDemLoXutoNTf7eOUQMSOBY+az9vaic/5
	 Z5tQcun21hNBAu9EinEsF+xpMENmGFIejjFmD8hGX39K9Kb12vYk/6Fa8W0c35nVVrQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D14A21F000D4;
	Mon, 16 Nov 2026 11:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794830133;
	bh=nRcfcPqfetT5jsi4BrjqJuRmHpuTHA7ybDz4X2ZZ5WM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Umfh6l6Sefa2wtszH/GKJ8z2gcKxpK2261KlfpcQCNAfu71UQ4rDMW7fqVQP6W5LM
	 zQ6utfpxWIL6iIxFB/ud7+y8ctAmHlz4my59T4gANH1+zsq4gdW8+JaAaAwciGgkSv
	 VbbYCphzh5Zghn6h00rnMddBr2Nf6k/wRE38Gq9Yr3nj9pQVHJTmbkAGkwNzts3Weq
	 TYpGzZmFKFMYcowRpW/tkrIHQ86SzK5/Q0Y0IQUbakk176xcBcDUEIsFLgVu4jptiZ
	 hPEywfp5nrEc5joS2qjKbjGYtSVVSnQqPtAYXlCIsuhrZJbbYV5zz1bz7A3xx/OWTs
	 N6v3RDPiXn8cQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5A33B4A466;
	Mon, 16 Nov 2026 11:55:31 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Mon, 16 Nov 2026 12:55:14 +0100
Subject: [PATCH v3 7/8] MAINTAINERS: Add entry for MIPS RISC-V SoC support
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
Message-Id: <20261116-p8700-dts-v3-7-ec5d4b7de39f@htecgroup.com>
References: <20261116-p8700-dts-v3-0-ec5d4b7de39f@htecgroup.com>
In-Reply-To: <20261116-p8700-dts-v3-0-ec5d4b7de39f@htecgroup.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Inochi Amaoto <inochiama@outlook.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Joel Stanley <joel@jms.id.au>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794830124; l=854;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=vb61DMpqL5a39NmtlZJUf76Y1KgC0WwgwIwdSxwuzoQ=;
 b=HLSKtg/bptyTUBFjrFU6X/ri6p+ErLOY6x04krRt8MeXvHr5BqJa/qcZumgbU7yE57ZHwcorc
 qqqPV8Q09V7B96H7++yRVnj9OwvwNJRDuKvXXJhRtz9xlkcslYqb6vH
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Reply-To: aleksa.paunovic@htecgroup.com
Content-Transfer-Encoding: 7bit

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Add a MAINTAINERS entry covering the MIPS RISC-V devicetree sources
and the board binding.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c2414447892c24d58595059ca27b18775919ac12..a00f1a801be3c532c33918e673c7977d9de91823 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23542,6 +23542,13 @@ F:	drivers/spi/spi-mpfs.c
 F:	drivers/usb/musb/mpfs.c
 F:	include/soc/microchip/mpfs.h
 
+RISC-V MIPS SoC SUPPORT
+M:	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
+L:	linux-riscv@lists.infradead.org
+S:	Supported
+F:	Documentation/devicetree/bindings/riscv/mips.yaml
+F:	arch/riscv/boot/dts/mips/
+
 RISC-V MISC SOC SUPPORT
 M:	Conor Dooley <conor@kernel.org>
 L:	linux-riscv@lists.infradead.org

-- 
2.43.0


