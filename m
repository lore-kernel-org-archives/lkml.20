Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792834093;
	b=BxuMdwSb9MnTgIU8ZR1wjmXlYVTEibhzLZluutSE3/f1rbkbHt1Qgc1GvOuGpmKg5f9+
	 16t2W9zOtG5UsPvrEoN+xuhUnx7RftR1+Io4jkzSttQKIcDNemKdehUWtDcU3qfQna1aU
	 //cJMtpd2rPxfhuCs5bjIA3V6YQ5l+owzvsbHUqcaY6JKL9Vmrdm/D0qb/6HekqmOVFx6
	 RSUKh6cJnKW1LuGE9c6mdpvdnlVUt6X5h4e42u58ggbhd07Iv/XkgeSEAX/bEuQz9TmoP
	 KmJrC9HmQ/5/03YinhuwKbVqpmq9yzD8nkFZVhzziMvJmLUVogiFQ2p1GvBElbjRlgg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792834093;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=DD5cXHejc9AzipRD2mTyljcuDKOHkmSCoSY8IAjL2s8=;
	b=f8q1SYh7//SkxmxzJ/7bDN4zioppr20oHg8DZ0YDnO/AqFPyTHPrGcKeu5R+1JUIHMoB
	 TccqlVSwvsN8r9IKGlRwTmBsAfbmZoyP+w0m1G5qgjNf9owvkBUEHvk4CtZ286CPDdeLD
	 DqzRwWF4KJI/Io3PTNVW85ileN7pMUpgB41HUrIeqLheptzKjEzjcy/duC/kae3+DHTZg
	 f2w9jnxMDOoZqjQIdroNCU2oF5XbZ8ZoO2aoO1Xh2VgR5aC1xv1YhmdfVBTO5oZLbMZsN
	 EsPyCPI+NbbmVUAc3bNZd09rVE+l79Ah0oceLvN0bxK2Rpi7PAozhiV9Ve4kamzcV1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RyMB54W1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642FA606AC14;
	Sat, 24 Oct 2026 09:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RyMB54W1
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792834093;
	b=Yxab4qHM2d9yXMvDgpitlqdoZxa4kVNEImb8R+grD6Fcg9FGTkvUNguwBOohzL9MRPyx
	 IM9ocA+ec1/jaX/rtzMBb3Zags2OxRHF4m9niBOFtl1JnkoFxT7qoaBSY7cyMTm9gQ37J
	 mnUT//E4SVvPV41j3MUf0KVMWqJbig/9pIK4EIA3cqkuMoJDiPvSY+cXm3l+4axE2KE9H
	 z/lEEj22ZXB4rYN15tD4vEw9Yv3gpcwcykPfbkTe45q/NfqOjd8FJs/WdW7+AQYLXJP2W
	 mvDsoqjeJuZmICiUJgIehMemg5E1XVMULEsqQfBNx4RCHSOiMLJtiY7rN8PvJ/krV8A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792834093;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=DD5cXHejc9AzipRD2mTyljcuDKOHkmSCoSY8IAjL2s8=;
	b=Qu/JpBxLj+mo1AeMLV1aAz7/cOxjT3/EyNtddCqQIs/u/3OmHWZ8ej+Us88y+VFZZpP3
	 rpHIQL5rsv9rTCPv0DuJJJZmPEC3lrHjLZbbHDZp9BkNaKkOuY5mzoYNIcqnPRGtk2bc7
	 OEYz3x9rMh26JvTcRdX2eJe5VgWhhuiglSzWQpvt7cMTAA4g1Bw9UCIdr4NubitU5CDna
	 VSLyE1kI7bQeLsEZPngmHgl4PsXF7dllZNqJr9G0qOlzXzJuyZz9JUwRfc7pVSqquTOLK
	 REJW63jWHbClzJAKD5WcSGgHeaSFMfWJWS5mm0kbW1h1UIUrso6IbIkA7C7aIlQi8EA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 445A61F031E1;
	Sat, 24 Oct 2026 09:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792834092;
	bh=DD5cXHejc9AzipRD2mTyljcuDKOHkmSCoSY8IAjL2s8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=RyMB54W1giMnzm34xEfrOPKPCVkcpW02nzq2JwVsSV8gYnEA4ZWNPpeuNU1wapjmV
	 UeJyh8JpOeDC7+lEIwAh08SEs5jGc+KcovMMonuJDRO884xw5Ev7J/kpGEfHxv9xoM
	 DTAmWpCEcIQOvCb5Q9iwsX1KGqL/0MyJx/5EUYl5DEpqij4uWaai8P0ruvKjgxCujP
	 94vczpML34RiDO20juYvN7A0VRDNinsCHgkR68e0YGkZQsv9tiZe/GR7wvfoqGneRp
	 Wmv0lrGW1Ge8w1GmXcm7smKgQ74i3zpw1GFco1rQNvVFaMMaa9LJ7OjyRfSXH/e5nB
	 feTqe3kuoi95Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C1BD744787;
	Sat, 24 Oct 2026 09:28:10 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Date: Sat, 24 Oct 2026 17:27:54 +0800
Subject: [PATCH v6 4/7] dt-bindings: timer: Add UltraRISC DP1000 CLINT
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
Message-Id: <20261024-ultrarisc-dts-v6-4-c62994d8a114@ultrarisc.com>
References: <20261024-ultrarisc-dts-v6-0-c62994d8a114@ultrarisc.com>
In-Reply-To: <20261024-ultrarisc-dts-v6-0-c62994d8a114@ultrarisc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792834086; l=964;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=H5nCeqGhgsZIHGD5OQKUEdhmWR2MLVPLwQY1q4JBFrk=;
 b=1bzvBBc2iIDzQR3MOWa2Gg0lJhA/UHzmiTgEugQ+JxjboDo1JWgdtxyst6L8/XUUKGHs5GrmO
 D04X0p9hEe1B5S/XyVGTvWM7wfC9NZMQ1Mq2zpMAv1kZBYCt0dM+SXi
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


