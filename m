Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB36345EB5
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790760639; cv=none; b=nD5V8tH+eeNlcFRPUq8Hks/WIWjTSnhZzSU1beYiDjC3HTToPVolPfbPqbAhFANROs+BNMYmgNUEzevAZoNhCQ6OfTuQjFsxt7egu8b5m67R0B183DGyq1WcV7EaM/HHEAasBXBVzmoEhfqp/zNzWs12ERuCZfX79QO3kixfqGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790760639; c=relaxed/simple;
	bh=jBOWfAe/37a+DtWsY4pcfCQdJQrauO++5rYgJh/u5TQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OBTcuyoVXnkIkrIt99Pl4GrRpdSeyi25tZM7byPjIKMgVW/43OborxFuhVP1DcIpQErN8YZKDZg+WTaoJR40ABDAotPVRyPDumb/GmqORhW0Lg7iiEfckBbWpgLIzNnasjISDYJYKVmCHVQSQqSoCmQ0nwDPQyuqJGRHuT9U9Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g8j1mJCQ; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g8j1mJCQ"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aaf10bf094so7158027a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790760636; x=1791365436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zhvlpv/etnxxE1xo+vE8I3wMg7dBPdkR6wAnk76hoag=;
        b=g8j1mJCQkDPMu8jxlT2RpqxVoakvYNND34Mf5B0thezLTdpK+bUqARMY6wqsfQ0Qaj
         CHviQ/fH7CWzaXX+nvAnzgz2/Lstfy+voOYLjEB+ekMd/iUSoCXYibbOKhJ2NUc72bhe
         qNHaGF2qPJwx6SQapmV8v6uOKCcBlJcnri9iTubMmlPynFpDPc1TCPsXwOeIvNlyqG8b
         7JGTofqxaC9XvVvoDfuhFyWEM+N30cIRCnKUSHYBg5rTQJm58EnmGgZCABIIGQOwc9Ht
         9pXkeO0N+70uPxt4vWzxmfr4e1FYFNquLaR+KMNYEV8e3N0PeAc5iXlU38z88nnrb2cH
         LORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790760636; x=1791365436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zhvlpv/etnxxE1xo+vE8I3wMg7dBPdkR6wAnk76hoag=;
        b=aT/6oE02wka3dRuBxVkFJYawX4ZbhFF98cYoFIfKmt8GLdnNdQhG/P9VeM1qGvQomf
         xWzrcOTGkeJTwymZp2NGoZlNDQEcWwB5dtp4uwEtBZ6uXOaxW09fgqaR3DaOenjnSNPG
         KlS7hy8xNNB9slzP8KYLgpOBdi/ryO/BynuFP4wzCBgkdbLBmzGnFUXospL3eODXbNP6
         M/Qm50SqqyyisAPuH5djvrsnEmZwizGmhRm13VUe1blGJT5lwvMwzW3ITzMSW8gMQrHd
         9mORBdBk/R2HhcYDmYayophemwMDrt41ApclcQ+OiEKh3IAXQH4lnuuxOuhGfOlQaW08
         DFpg==
X-Forwarded-Encrypted: i=1; AKwUvBwTeEWva4bQiUdaxOJDZ7eQw1bB7a2NGW9SoVZSF7xol/GlOgaKYh41q0HPm5JvxmLe/ChZCUUcSqaa0lI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqenpRfLIrQqmnwFzPpa06COnsRcGi+oZ5ETLIQdRLw+BurANE
	Ahg3x9vsiKE1Cw8VHQxE7fgGKDqSuZqK4nLd1dqykBAAKSk6qpyC0jTV
X-Gm-Gg: AYBFou0KQI3jngTsRRVz+B9FXX5nUwYVTx8vWxkNhsOtBTEzcc9znX2SYUi2ClMsfth
	BENZqHXcuj7j2JLDJWpfHtGon+ySULCFZn+wdO363jRNu1wmp463dZTK2nmwrBl2QcMgM2PLxYX
	w9yUKgPLfrmhCQ1eSKGCJKmI/3xA8GZBesZ4HkUH6wwk1qdpmrxicrDq2by1ulxh6Y6Boawd7Pu
	1xYWwFmOn09zeJjvGfcSZ/t0FCZVM36I+k2KFCoIW1VfcnCVJzQuD6caDbNN7fVvyILlZ8YdA3/
	AFLc1bApyLEQLiMkUCEFXVpy/1jOkbFCZlgKC8AGXF/G4YyZLRQv/U3Cm7hzznq5jGT9fl4Qz+m
	BYktmpm2vxve4i9VDMzyyvHXnTNDUMfLXyjObUywIYCQh44W5Nk+Byt4/zxvzmAbM1vstWcHdFb
	y4BnpH3T/61xUruvnAZwiMmHOzmGHMSZYZWi3zKXfwp1CGQLwEFCyPMiIjQFqTMKLAL9zNw1U1e
	tPr4nysUGs=
X-Received: by 2002:a05:6402:27d0:b0:6ac:68a3:3c30 with SMTP id 4fb4d7f45d1cf-6ae1992b71dmr568888a12.14.1790760636516;
        Wed, 30 Sep 2026 02:30:36 -0700 (PDT)
Received: from localhost.localdomain ([193.107.16.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae1568e8b2sm485221a12.19.2026.09.30.02.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 02:30:36 -0700 (PDT)
From: Dmitry Yashin <dmt.yashin@gmail.com>
Date: Wed, 30 Sep 2026 14:29:04 +0500
Subject: [PATCH 1/4] dt-bindings: arm: rockchip: add Forlinx FET3568-C
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-ok3568-c-v1-1-a0ffd55f5c95@gmail.com>
References: <20260930-ok3568-c-v1-0-a0ffd55f5c95@gmail.com>
In-Reply-To: <20260930-ok3568-c-v1-0-a0ffd55f5c95@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dmitry Yashin <dmt.yashin@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790760632; l=1111;
 i=dmt.yashin@gmail.com; s=20260930; h=from:subject:message-id;
 bh=jBOWfAe/37a+DtWsY4pcfCQdJQrauO++5rYgJh/u5TQ=;
 b=S0YR/mEpWlrZhLop51WlR9UQ85qM7F+MHMXdP7xV2ma/HTK6GtzwTTt6llNqEnCLT+cEvMpYG
 44HTadK8PWmDm3OWjTt7yWUx1aR1NxHfxb7wmEM91MYmPejst8jsK+H
X-Developer-Key: i=dmt.yashin@gmail.com; a=ed25519;
 pk=vBe9jaaOEH5bQEvfzb1tWOlz3AMIcXCu/GL/CdlwJco=

FET3568-C is an System on Module made by Forlinx based on Rockchip RK3568.
This SoM used by OK3568-C Board.

FET3568-C features:
- Rockchip RK3568
- DDR4 1/2/4/8 GB
- eMMC 8/16/32/64 GB
- RK809 PMIC

Add devicetree binding for Forlinx FET3568-C SoM.

Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a799bb843f74..30a6794861cc 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -324,6 +324,13 @@ properties:
           - const: firefly,rk3568-roc-pc
           - const: rockchip,rk3568
 
+      - description: Forlinx FET3568-C SoM
+        items:
+          - enum:
+              - forlinx,ok3568-c
+          - const: forlinx,fet3568-c
+          - const: rockchip,rk3568
+
       - description: Forlinx FET3588-C SoM
         items:
           - enum:

-- 
2.55.0

