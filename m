Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793718698;
	b=oNJdUgGXd0UUELV4u5Wf60ld6H3J2jVD8zSBf/TILM1vwTgC3CzEmGZDUrGfO83z2l11
	 lVFD/kGBFfpkAXF3Luawq7hKxIEL0EMKgEN2W00zQKwNFwqFDl+hjec4lbbFBiiegol+N
	 e94TPZJDUapqkzKfvnA1FpK/vocW7/0iCth+Oajsji0PNV3LISCKkYtlvGO95NsTGhac2
	 zBdvooE3lNPg9oASbOknDpqzth7EuS/NDBZuq3lCUPt4k9+bysNFkkKpygpaJETe4mN9c
	 zq3b6ukSCIe976YFaaYOCdTtw7SCrXvjRdQM5gyjKGYzpBvGVqKx2maNeV573V1vwjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718698;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4+NonyAXN/54L4B5J1GdAxssGMZv7U7qe2SeN3qFx78=;
	b=pvtBLC1o3cFCd1NVNbfhurEGvYeyKQ06ss2pFT1mbM4YZTOauBoMZKjo5jYQ9SMCHjIC
	 2GMsx2+iGB0IQg1h3fiAbZv8w7CRekh7qddBFQeB3QfMwC2UL8B9fs/XLTPmje+Msu8S0
	 urjPrEucXtkhgWv6Q/CbZj/0T8xILKRA1gHCxnWNFy+odcQXk2bFe88qIwPxm6szUAYT9
	 pVON8dnv0IDhj4J9XR8K7No++c+jkVZKZ4fTUAeHFZJkB6aIqL/V1NIKRA3981CJpLXUC
	 oNzafEAlG8jnWEqPpqKX8zJMhuZ1izm1hp3+hZtB4A21ms28xA3OT4CsooftJpdLEdg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j9gQCSXd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B246606A79D;
	Tue,  3 Nov 2026 15:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j9gQCSXd
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793718698;
	b=2bfMFHZY8qxWH2YV0FfJB/v5znEXofF272T3q4YdYUfvlK0Fg+NhYOIMHdH/nmP1USpd
	 NYMH95U2N00U9y7D/n3Q3VnxZwcJh9Kat7IGDAA74D7aCTMoZxUR0ySVJgf4kvkTaysh5
	 fjjZh08zmMpvAUh3sMR23XpBAyoBewYWbTkv9kE5d/36oBZ5bBYjh8t421TG+sdI8axga
	 marKt1hRmzU558zJ4Hn1YjIac+T7BOpQnAQ89YaR+zNvmglm282V981DvjZJsFx+PaJDF
	 6+WlpPTDBUKxg0nSww113CKw96LVX/inGbCveL4Ir2URl3PmYFJ/uK+IPaz/uqUYkbw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793718698;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4+NonyAXN/54L4B5J1GdAxssGMZv7U7qe2SeN3qFx78=;
	b=AaF/jqFOm/qU42WeDBLJloB+rUZBdJbBHvrFdWYPULwoZn/VOYopXFTEQc/tyoVvGUQe
	 7skXMPA1d5xv7UiqCntMsd3wwKb0YglEwOUpx5dmTWkKg4hsuNUQvEBeFsuVbtpVj2TEO
	 7LtJa6XLn3kQNtMXjmeB5VSN2IUQ82jLAEV/X8dAYVgFv6Ch23pyOtfPJsNTmN96IdO56
	 xKy9kAFpW/6b01WDqCaklVRb9rsPSG5pm3Wl2l/xP/cdBmQFiBmoreIw83ud8WYvvITIR
	 HKYDYI3noQliK3iMMxld6/HPOuxe7+G9Jea3rkHhLcJZcY7rksU48E1C8sPdfq12bwA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 809A81F00919;
	Tue,  3 Nov 2026 15:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793718698;
	bh=4+NonyAXN/54L4B5J1GdAxssGMZv7U7qe2SeN3qFx78=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=j9gQCSXdMNbaZ8cZ/S2FzSxtYkt8ZYZ6xj4khI1hM/ZQSgpzcFrk4Rzecl5gjipzJ
	 38f51C1Duq7NJUwW43iYZ+GP6pp4CXQbAInXqnne4+l9DmhjeeskQDl1qnf2zMRI+e
	 SUXd31l/RwuhBkAsDsyWphKbru+2RhrMihiw27K4xDVG7uwol9clCYbxFMB9l3w/hB
	 r4iVnsOEmaTy8dl31pOSDRHL/RitEaRBD2KX3X8EHktEU1b/kqx3uIRjMROEqBvZ7e
	 i1mg0f0gf6rtHZXNNkPKAg737ibWzUQ7R4kNRI8EZ6Z2akmf2/qFkTrH024lijiWck
	 yaB+3xkL2YnsQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DD59E469CA;
	Tue,  3 Nov 2026 15:11:35 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Tue, 03 Nov 2026 16:11:25 +0100
Subject: [PATCH v2 1/8] dt-bindings: vendor-prefixes: Add GlobalFoundries,
 Inc.
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
Message-Id: <20261103-p8700-dts-v2-1-3ac5d49f2c37@htecgroup.com>
References: <20261103-p8700-dts-v2-0-3ac5d49f2c37@htecgroup.com>
In-Reply-To: <20261103-p8700-dts-v2-0-3ac5d49f2c37@htecgroup.com>
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
 Palmer Dabbelt <palmer@sifive.com>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793718695; l=1355;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=9qjHBKUSAQcCeAu/Qtd3snEiEJmunnX9GsHooFoy87M=;
 b=FQWNfNXPVPyp9HJv9Ro8JIQfGPRSFgeAR5mxjbX3Yj2tWFah2fC2WlJBGPsEWhms7Kehkze/9
 coy1AgxDG2ZAdwB4eu1SQoofaw4GGP2gKwswIauZ/qaGaNSvqUbszk8
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Reply-To: aleksa.paunovic@htecgroup.com
Content-Transfer-Encoding: 7bit

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

GlobalFoundries acquired MIPS. All MIPS RISC-V
compatibles should be labeled with the 'gf' prefix in the future.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373433b1f48118872c46cf7bcfff276..eea7f86ebed0d038c53cd3c22d2dd71514224475 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -668,6 +668,8 @@ patternProperties:
     description: Genexis BV/AB
   "^geniatech,.*":
     description: Geniatech, Inc.
+  "^gf,.*":
+    description: GlobalFoundries, Inc.
   "^giantec,.*":
     description: Giantec Semiconductor, Inc.
   "^giantplus,.*":
@@ -1104,7 +1106,7 @@ patternProperties:
   "^minix,.*":
     description: MINIX Technology Ltd.
   "^mips,.*":
-    description: MIPS Technology (deprecated, use 'mti' or 'img')
+    description: MIPS Technologies Inc. (deprecated, use 'mti', 'img', or 'gf')
     deprecated: true
   "^miramems,.*":
     description: MiraMEMS Sensing Technology Co., Ltd.

-- 
2.43.0


