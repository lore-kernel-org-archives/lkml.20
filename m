Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793540135;
	b=gPDAqpBRFnTD7hFA0NTBQiemZjFhZPlZ0h9KUxAuytbPQGwzKcAnLOK/kH2cQPvzc99Y
	 8lc7Vd1UvQtxpWEDcY8NsIyHWq9FHR5NeHIwkjLuSCS9KeTceWxTTF75YpNgJZKanqw4q
	 veadUiG344544zsoezYWGMP//43EUATqWOUJVG1EjbDs9i12QW4CvuUr7qhV4NS/ENLP1
	 LU2Kg4erisXFjBaYxuQmdJi1vPa/Foe9cUcZC7co1t03v8cdw6dQHoIos1qbDe/6LfEGA
	 sjZ3erKM7w7al529fKEuFUGjQ3Q15405ACvrBmZ6spil2F+4ga+uisOiXp785ADNmfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793540135;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4qEGrfial3d8eZGApdMDGhFV5rb/ELjCCG6fHhOpnOQ=;
	b=2Dh1bzANYxHjbSfDIwcMuBwW1oeSi2MQ76ZYW8YOlt88C0sdhoLfEPi5PzpURRln5br1
	 tXLcQQ/a7ozkHnb3jbRF6ezwFafFl17slqwcbzQKcQ3uSJXHe1zjlzLTipeMboFWw0694
	 wjuw6Eq6J0zl9zCR4g28OEfrpZcnILSjL4Oh49G+OlUzVtbEWvlBucEcHcHJgbzKbesz7
	 VL0uqunwOnZ9J6YaHtxZjWae7mi8PfdZWWMtTI7q6yKH3YE/jlpl3VziZtmHkg+tnqAbh
	 xGsw3BGk91CYDOp+TlCRlAYRdoJ+mQUuJ3kbW/urws8r2w3vn1hD/o0xqxgOeRBGW0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ArehMx9K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC51606A325;
	Sun,  1 Nov 2026 13:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ArehMx9K
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793540134;
	b=1VibUrp7guCfLHkf3ibSBskhRcp0O8T0J8RIbovN5oYbhOaEcXB/yyHfp5jP2p4MNKoH
	 FB1PV4Ap8I/Nb3HtRk3nRDtkUMacJ27b7u29Q5zoQEsYzgtKTSCJB4fwjBeSrpTIf8A3r
	 ZIL5Ts92739Kkn5jpD47oJvcyQItCb2kKB/53HkAex2/seB4bnGzEDWMmoyqYGmJI5bjA
	 rF7tS6j637BmoOte5sK1zaoQEZLGkRDz3A1XcxLGWrlI7xBMjwK8mRwGmEvYJSGJUZnU2
	 chWUfb+CF7I8Spffd637e39lAe4pGDrpNx57dMdcuK+sAkiUmBRASH6En/dWuIFVVhQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793540134;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4qEGrfial3d8eZGApdMDGhFV5rb/ELjCCG6fHhOpnOQ=;
	b=vuo63auuB2x5DvHk6/g30bAcXMZFCeN6wyAoOoX7tjOTl+pzTkJAlnUO8wABEHTn94qO
	 mfarDWHnbZBWnNxn2pJU4fCzxYNkO7D2xUmRsBzBMyp/5beNeAC5Ce+H1A6P4KP70YGaU
	 bddKNbC5B2fvT85AJHrAX/Ery0SUJITo4iigJpn3OBJWIlxTsfKKCxzy74LvqQvYIq3PS
	 aAdmHH8VfJi1i0Drt3bJJNc+LEK20fK9tkfEkSN99nKkQ8TSQDBsSoq73XIX7M8Drs1OK
	 J/jP3oQxhM7xS4E0JGi0lIrXlRDaGZNPMODEaDLdJZwolNWnSuyi/QWrC79WuBcQ5eQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8EE0E1F0093A;
	Sun,  1 Nov 2026 13:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793540134;
	bh=4qEGrfial3d8eZGApdMDGhFV5rb/ELjCCG6fHhOpnOQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ArehMx9KPDh6FCXwPjFi42DnEp7zKoh9iyEFpHXV3A/AKKOoht5CBh3vW+XfajY1P
	 fN2r8ktRhfFRMWhlGnLQc71auVvdeeR3/NsHoQa8yXJFiOwy3rF8TJVPvcoXtdhRiI
	 uBuQ9cHGA/YKPw8/rF6SZkH/GL7z1fl0N/D2KL/QD3D7w2X9uNdRTNZkkIzqlamGYI
	 UrPZDEiQDuFVPQFVziGDpNQNREQYqJNBP/UEPeZZMuAFx5UOZN4P44GKjefGY0vD7u
	 tCRcRwuiheyKaICsUrWFlAwAHnSelFFrpfTSU5T8uw5Nl/vd218FOJknQLoBJRshG1
	 YP4yo69vgbt5A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F1ACF460F1;
	Sun,  1 Nov 2026 13:35:32 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Sun, 01 Nov 2026 21:35:31 +0800
Subject: [PATCH 1/2] dt-bindings: timer: add the FU740 CLINT
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
Message-Id: <20261101-b4-sifive-fu740-clint-v1-1-b4821199a733@iscas.ac.cn>
References: <20261101-b4-sifive-fu740-clint-v1-0-b4821199a733@iscas.ac.cn>
In-Reply-To: <20261101-b4-sifive-fu740-clint-v1-0-b4821199a733@iscas.ac.cn>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
 Conor Dooley <conor@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Yao Zi <me@ziyao.cc>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Han Gao <rabenda.cn@gmail.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793540132; l=1006;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=VwCnzE/4MZz2gbGvZGs9P9obrlQjk7zxT+DpHDQL0Gg=;
 b=nICmxnHvq/ap74lRCP7Vd3qaf3i6Oa2kxxw4daKe6HXHkRD+6qk7p3gq2AizwI5a3zXQybX5L
 NEEGeCPbiMwBpYAeRsQnKtZYJGJa1lRSlirw+HfHIg6nwZ8jKxtIKTF
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn
Content-Transfer-Encoding: 7bit

From: Han Gao <gaohan@iscas.ac.cn>

Document the FU740 CLINT compatible.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index d53f52e80d887b40c0d20049d86867c8a5b6fae2..13a8638f6b08e87bff3e37f947b0fe5458ebb38d 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -33,6 +33,7 @@ properties:
               - eswin,eic7700-clint     # ESWIN EIC7700
               - microchip,pic64gx-clint # Microchip PIC64GX
               - sifive,fu540-c000-clint # SiFive FU540
+              - sifive,fu740-c000-clint # SiFive FU740
               - spacemit,k1-clint       # SpacemiT K1
               - starfive,jh7100-clint   # StarFive JH7100
               - starfive,jh7110-clint   # StarFive JH7110

-- 
2.47.3


