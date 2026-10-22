Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792648802;
	b=TupreJ1uBHg4tSjokLQEpjeZJqQ6B0RSpECY34x5OACsSTjlCBfpL/IMCODZyjh0Cbxi
	 Ci9rXrWt75ovNbKQxYLW25PiPSXl/9lfghsL5+vSnGznVrh6qccmuM7oMp4Wx7VG2A3y2
	 t21lGIat3fMmX3AWbN+czeMZHScBYgI2cRnAhcgl1Rxb/eQvukPd5N3Wt9zfLberla1qz
	 rwl5CnRxOE8S7ffWp92sC0HkYoz5Y2rPWDLzSNz5f5V/jx6LYKzqa0Vb5tpoInIvdyqNE
	 pt0KEM/z7syc9kBAtk4iM0mC0nlREX1pNbF0M6rROdP2nmPZnUxO5NQB8crakskEOeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792648802;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=MeqapdHk4YD2xGr4hOW9N3bcaYW9GCT1w2/RAdnybrA=;
	b=yiutlZpz4R+0fXEGZ9wS61t97n00Q9c8NJh4UTWgDZGb7+Jt/PvPVgcKTqIzBaE+hm1z
	 iEiGuT73E+lE7T8OvraRBcmI4isE8A7DB/m4pC4LGnJh+jbDj+ATDNqbSRMvSgYf7URES
	 j7ESBAe6z0X6j2U0h9sqnrx8hh9t7Im3XNSCjlSse3RMbSlp90ZQVzOfeJt0LcNLatGp2
	 uu7ONxS0NVyz21QKz7wkj4nTttEXHxVatAoax0nmJ+EifOf7kC4GE5rjg1XwhdsLrnRAW
	 5YMTVkk52ebLry/YhfWPZpn2Ylq5Ym2QBtF+LIcNM4E9sLIMXXty/viF578smpcmEog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D7gHWThi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF4A606A321;
	Thu, 22 Oct 2026 06:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D7gHWThi
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792648801;
	b=t0+HXvW1enGLhrNMI8H3FIVpA7LIW6CbbEAu+52VmnmNP8nVLtwoYmiO24viQANFl5LN
	 regG4uGIEQLpCKgXy6mQlwoE3Vu5jTeMBjX34JR1JjG3pXscwIPfKCt7mQgZPRTQ/TCx4
	 KihSiV0VMHu85jve/5veL+uBFNNDyA5mzQ/nejbvg2zyvTl7QgJm8uM7DF19NNbpgPGUT
	 sFRDdVoXjo36uPsumsjqszlzvsHvJoPtZbU/Qz2AFik070nHYCORGYKpArTzPwvVdH3tv
	 MHPSyfVmPK6has/a6JEkFWBiHbn7aLtYFzOOob742z/T3EGCI3aKsmrssLuMBh+N2Pw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792648801;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=MeqapdHk4YD2xGr4hOW9N3bcaYW9GCT1w2/RAdnybrA=;
	b=CSj4Msff2qKt+2kByJuif5JD8ZoNzEheY1vPHe9R/y+nRfwSTdBTZXNu6dq0n339h6be
	 buvv7HLf/8XjbJLhipPUxN6+vbiPc1nWfUn2AGYHyS4WSh+Pn0VigvpjScbfMJjEWyEuJ
	 TWKgdcb0P3TkuEN0W3KsjQTvJWmgor8bXnjw+iYXPOI+RfBYf2+5ieI4x1FZnLDSDT5Eo
	 +WYMI4xK3l1g1ScQJqAGfb6lHRsDDzADiIlgh7FVXk+B6UnzVG1wMl5wY8jZOUFpCZ12K
	 JACz4TXB1urKxSegdzfL/RTrwrLdkrJ9X+pcFtu3XnbYZs5uXBID7Iea998AbMn4HOg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 534741F000C5;
	Thu, 22 Oct 2026 06:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792648801;
	bh=MeqapdHk4YD2xGr4hOW9N3bcaYW9GCT1w2/RAdnybrA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=D7gHWThiEHCRJAE//0ZvO03APeE4eSO5khBSioNjs1viOKLDlXNM97D0Y1jmC3J4p
	 WioHP9neImsHWpo9CAheLRo2SwFxOzxA/fO4oZEuCftV07nyEJIWc6a527LqJzlqTM
	 5xEPLeiwP7LtMeLHloODGF9EKKVPkmeJlen0UytIHe+8NjGxQoSUV2x/+DpBpon5pn
	 Tme/+kHV/bWmGSq5KA1cy9bCpnESU5Jn0EkdGJde/1EG2QN2lQ67teAumBPeGiEzNm
	 IsLfrB3rPAmp4Lm6Se4cygPTykusGusKu3Fz+yEigxAFg4WLstvshs//kiLwE6kbKL
	 cw57PqaNvk47A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D3EED43511;
	Thu, 22 Oct 2026 05:59:59 +0000 (UTC)
From: Cristian Filipescu via B4 Relay <devnull+filipescu.cristian.gmail.com@kernel.org>
Date: Thu, 22 Oct 2026 05:56:05 +0000
Subject: [PATCH v2 1/2] dt-bindings: arm: sunxi: Add Orange Pi 3 LTS board
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
Message-Id: <20261022-sunxi-orangepi-3-lts-v2-1-70b899252c6a@gmail.com>
References: <20261022-sunxi-orangepi-3-lts-v2-0-70b899252c6a@gmail.com>
In-Reply-To: <20261022-sunxi-orangepi-3-lts-v2-0-70b899252c6a@gmail.com>
To: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Andre Przywara <andre.przywara@arm.com>, linux-kernel@vger.kernel.org, 
 Cristian Filipescu <filipescu.cristian@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792648566; l=1216;
 i=filipescu.cristian@gmail.com; s=uboot-20261021;
 h=from:subject:message-id;
 bh=t1m1y0S3cSpYjFuC+gfshCNEaxwz0B7aj0D0DiamZcc=;
 b=NWyMN/fe371QAzlJ1JPV7CAU54/0FpQa+6JvwFD18AVO1jIku23xr3877+2ePpVjxPcLhTRRK
 oe1NGAEHDtYBG0jb7MHbjrFSrvv3pTpNGaeaVmYgXqdDDDpuY/Hvvea
X-Developer-Key: i=filipescu.cristian@gmail.com; a=ed25519;
 pk=o7Ui0tU3x+X/6Pq6PZHmd2KFtOdPWttoPuNFOvdD8t0=
X-Endpoint-Received: by B4 Relay for
 filipescu.cristian@gmail.com/uboot-20261021 with auth_id=1255
X-Original-From: Cristian Filipescu <filipescu.cristian@gmail.com>
Reply-To: filipescu.cristian@gmail.com

From: Jernej Skrabec <jernej.skrabec@gmail.com>

The Orange Pi 3 LTS is similar to the Orange Pi 3, with different
Ethernet and wireless hardware. It includes 2 GiB RAM and 8 GiB eMMC.

Add its board compatible to the Allwinner platform binding.

Link: https://lore.kernel.org/linux-sunxi/20250413134318.66681-2-jernej.skrabec@gmail.com/
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Cristian Filipescu <filipescu.cristian@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index f04db28c6..379dc8591 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -1008,6 +1008,11 @@ properties:
           - const: xunlong,orangepi-3
           - const: allwinner,sun50i-h6
 
+      - description: Xunlong OrangePi 3 LTS
+        items:
+          - const: xunlong,orangepi-3-lts
+          - const: allwinner,sun50i-h6
+
       - description: Xunlong OrangePi 4A
         items:
           - const: xunlong,orangepi-4a

-- 
2.47.3


