Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794448872;
	b=uZYdO+hgeSEzyCDaotsYZ4tkdMbv0SyYUM6KJQ9NfdrjjUF466SLsevq8Vm++KuVw9KL
	 d2jb0eyAvn+SCw+C4NgFqld3S2OSRPaIzcCeip9EXP3B7rIFF5awd0fNK28EHq5uNaydJ
	 E8tjVjvqn0KFoTFtudNTT1rdYlTy9EV1sc/fAHCZRYHLlIpGzhxpceIb/BT7xutg4zc2N
	 ZnTR0hRW4EdcQEY5BALhq/CitZ14rXlSm3yv0LIJXrc8O2bXFzdysrrlVTOW5Vw02B4RT
	 lxtobZ1WOh8W/yOEuU+cOH6ag+okMkokW4RjHvPOaKFV9agqOeHpuoHYdcRvtSMYUCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794448872;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=DD5cXHejc9AzipRD2mTyljcuDKOHkmSCoSY8IAjL2s8=;
	b=l6lxJh3BCaytkyI9iPeiHSjnKOXpbGSD+zloQ2JLyQY23ws8ZBDv7uD/8u+GZUEbN9Vf
	 KCoYNV28ZmE12zHFDm4C2aIZCd+uejMzCufC+vX1FjUXVLR1YiMHAbaaD4Wuj7hvu9OJz
	 LmvlenXkvvkMoXUljnHJx9iRYVd80vKCw/6YCXkkZveaIQBd5p1FN2w6eKYpvBRzorHRD
	 coKkGk89cgBHorYX4gBafvpk4nSCuJX2WTTZebPgk0+W7pMkE0fg6JhB9rdLHbhhvU9t1
	 5sLME8Tu1BZm7w0jW4/O3ZtJra/YHh3/svkRRUl9hfvm6BnbgZKEoE7OQ9JCJznA/dQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nhalio7Q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D837606A31C;
	Thu, 12 Nov 2026 02:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nhalio7Q
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794448872;
	b=sD16neeCTjscOumWQ9z4wLkMYEdbLB2mBlV8fEwpPN/82hlEsMnDsaG2l7wmxkpNUQvp
	 VFl4EydmIum0WTu8DwESIxFBihGUZwsB5ijjzJYex5a/pt8A2bqRJvoMwfBUAj5QP1kuJ
	 joA/BDmSeNyuu3jJLhGmOFETc7er81L1igRFmEWX5ug/IN/MrRQ/wv9LiwuwhHEkGL+S/
	 rAdiuTMSKII06t1o/CB8IWzZpE5dmMD2xt/UNmvN3JJolZR6Z6M+zneW2QrHeCWWiuXOz
	 lCwN/4GNLtF9R0ZH4lghuSjoqjK5Uw2Y9WQ7FPIB/fg7CI2dR2JjARaSi40cf8ZgJ4w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794448872;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=DD5cXHejc9AzipRD2mTyljcuDKOHkmSCoSY8IAjL2s8=;
	b=RqqmpG0i1QE2ZAHDYnUpUjuQYR1T/QB2fgW3l9A6g7QNIBtfbnKkjqxg21U3XcrH+JLA
	 J5UV1X0yt0JnMYtvzN3jhWHLaB/b/0gFtEjHR5aAHcXmC4t6aGcYsqSvD5u+CYL9nPs77
	 3BOnvPqpUqbBd2WjteXF82qlsfFW5XawIpMP+jKVhQRRR0AnDgnDgqDFPv5bLFM+xm95o
	 IEsFx0FPfMm2yRZFSfoRh0VfxDQoBgDtThv12iAaXs4p/JMg4TK83btJ6JPUIf38yE+bj
	 zCs5B/+JJyFFeoLBwMaFgTxrh3yvqPxWKGQjGN+AIgixvUr7kqgaL9qQp1xhe4B5szw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 577331F00A09;
	Thu, 12 Nov 2026 02:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794448872;
	bh=DD5cXHejc9AzipRD2mTyljcuDKOHkmSCoSY8IAjL2s8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=nhalio7QKfLUQazECxOhkpQyN4F8uCrJc9o7GF9hGbkPcyWRh7FXr5SFAFGXwMcO1
	 2aG0veKH2rZfkq6+9RODPRQXxrAFlXvqxZzOeH4W8IUxjwZOSuGFRLXK22x+EAKCBO
	 A41+Xvm5tCRkI8z2uQgJc/1qRkoyipszbSDyqHNc7kMT9+Tf5HVw50CE+fRK1Q2y6o
	 hLYX/KseIIdgF0nfjNX0AVN67b9Yb5oiiLm7d7/M+Ph45Ys/iie12cpHxYCtXTii/9
	 IX6h05ZH7Z99Vfxd299SAFXeWCMmWJdtbSgkKTnv8tSnjpImi3Mpo4SdIK3XEbRkFR
	 d2eUAvKk1zMLg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D72A649217;
	Thu, 12 Nov 2026 02:01:10 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Date: Thu, 12 Nov 2026 10:01:03 +0800
Subject: [PATCH v8 4/8] dt-bindings: timer: Add UltraRISC DP1000 CLINT
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
Message-Id: <20261112-ultrarisc-dts-v8-4-14fa0834cac4@ultrarisc.com>
References: <20261112-ultrarisc-dts-v8-0-14fa0834cac4@ultrarisc.com>
In-Reply-To: <20261112-ultrarisc-dts-v8-0-14fa0834cac4@ultrarisc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Lunn <andrew@lunn.ch>, 
 Jia Wang <wangjia@ultrarisc.com>, Xincheng Ji <jixincheng@ultrarisc.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794448869; l=964;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=H5nCeqGhgsZIHGD5OQKUEdhmWR2MLVPLwQY1q4JBFrk=;
 b=CpZcEqxP+CaXDO6uRR+QYOwm7M42mzHJ8KMLPDsuerE0jVVwodSbaPnrbS2gw3eKLBqmGG/nU
 rIxlENzoS2XAY3OSzVbpmSzO0Ys7/6OwcVmoZDe3XmFjIEeyJ1GHxdD
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-Endpoint-Received: by B4 Relay for jixincheng@ultrarisc.com/20260922 with
 auth_id=1046
X-Original-From: Xincheng Ji <jixincheng@ultrarisc.com>
Reply-To: jixincheng@ultrarisc.com

From: Jia Wang <wangjia@ultrarisc.com>

Add compatible string for UltraRISC DP1000 CLINT.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 3673836e14de..878f267d089b 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -40,6 +40,7 @@ properties:
               - starfive,jh8100-clint   # StarFive JH8100
               - starfive,jhb100-clint   # StarFive JHB100
               - tenstorrent,blackhole-clint # Tenstorrent Blackhole
+              - ultrarisc,dp1000-clint  # UltraRISC DP1000
           - const: sifive,clint0        # SiFive CLINT v0 IP block
       - items:
           - {}

-- 
2.34.1


