Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426028;
	b=NNBaqNzXNJ50Qc3GNtePcb8uStFfZEl8vvzVtEDUPtFMmKaoi0cFXMZD3R9I3DpdFZ3F
	 imrfFmzSMPi2Sb7DoMwJMf43liOTVC8dToD7d1q51ZIjAovSVIvJrCtfV+RTbuQpOiIBO
	 S8A8dmljcFAx+/tOgVftUl6ud7W8sm9FjGZOp7UmRuBlBnaOcZZdioa5kQLe1oI0r6D04
	 Yh22nOm4SdVCcfiF3UDbuJQmNECPvivap2fZw4ZSz30rcSVLteirb+YjizhBwCLOC9QD5
	 ksTTsbAQ515LTeUnTyg9nAlGd/ASVTEC445CJJHSJaM9BIUYC+FZzRseFXnp9vdqEQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426028;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=WbtZfz6Ubs4QUtks6beIlGcmS0Vsf5BKmpwpM07CG88=;
	b=vGqj2hEgM+tU0xgHCgT+LfpfZrKF9OlWhwBySbIn+XDLy+lLK8Dny0Qe+dUzsjkgrSPB
	 QnRXQaQvU73yflkpz8p5f4LYTGvR28yM+f8mecYyd3IBXFBqp9qjVJGNoPaeEnuO8bfug
	 kxm/hVrlIebjbC5cz0aH+0hKRqJCL6C2oMkO1HyBn9+LgPIxSAKEM7mfKbi6y8c9OPLkc
	 E81pJYYIcz46sKljeiH102xaVcRce65S7IBhYb1jau184hzUtc5pREZ/vUQf+BeQJGaqv
	 Dhc/PrRWDAafw6/IEflEg4RSgh8yYaXVXmdM2lBR/lqV8ItLqZDWR81kq7stzjL1spQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="f/31b13/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219B760A2633;
	Wed, 11 Nov 2026 19:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f/31b13/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 716FE1F00A12;
	Wed, 11 Nov 2026 19:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794426027;
	bh=WbtZfz6Ubs4QUtks6beIlGcmS0Vsf5BKmpwpM07CG88=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=f/31b13/R2FZtZ3q3vCquxU8orHm4wVVI0X8E56yMA3CQEIc+kH7d4A0NUK9BNxaS
	 QoeIb4qVIykPid6hoIlw4UTfIHgg0A6XTriG4KKnEncXHo9C9G0X4h30g92n/MVFNE
	 sqDEHs42KCSQ9zwuaYmcTvbC1sJwb46q/jBmh0B01mNxKGxgKGVD8ba7fntVJ7eCU6
	 4xqrSQfWK/pEaVkiAh9H8DGXvLG/sP4ajzc7ZmAibipos1cXcct+uw+3aF53CIZVpE
	 zmEKG2a9i6Ab3bUVAL3YZT6Ae83y5yad01tNTdsmh4p8S4O/omJy/HpI8OCB6pHGpm
	 9c8QNMonOI7HQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 13:40:11 -0600
Subject: [PATCH 01/12] dt-bindings: mfd: syscon: Add HiSilicon register
 bank compatibles
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
Message-Id: <20261111-dtbs-hisi-v1-1-6c9f5f80716c@kernel.org>
References: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
In-Reply-To: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guodong Xu <guodong.xu@linux.dev>, 
 Wei Xu <xuwei5@hisilicon.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev

Several HiSilicon syscon blocks are missing specific compatibles. Add
compatibles for the Hi6220 media NOC ADE, HIP06/HIP07 SerDes control,
and HIP07 DSA CPLD register banks accessed through syscon references.
The names are based on the label names in the .dts files.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index dae706ca7642..1e2a46ac2e3a 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -69,8 +69,12 @@ properties:
               - fsl,vf610-anatop
               - fsl,vf610-mscm-cpucfg
               - hisilicon,dsa-subctrl
+              - hisilicon,hi6220-medianoc-ade
               - hisilicon,hi6220-sramctrl
               - hisilicon,hip04-ppe
+              - hisilicon,hip06-serdes-ctrl
+              - hisilicon,hip07-dsa-cpld
+              - hisilicon,hip07-serdes-ctrl
               - hisilicon,pcie-sas-subctrl
               - hisilicon,peri-subctrl
               - hpe,gxp-sysreg

-- 
2.53.0

