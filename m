Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935461;
	b=bRleyEb8aWRERiJmWW3KgQrdJxc5dh44G2EdRDrX92sg2StZ5d4NodRmwRMicvxvH4pg
	 RWgEadCsJ6JFXPntMBg3Tmn0eGnWS/6ZcvTuaI0s8ghW9A9/96ZAhzyqmPrLhfxZ5k6nZ
	 CoT34Q8fenyntELQawa7iMQ7kWrVWUhwVSXrKJSRr0KZbTXuIlJVymmqdbXD6UOup+Irj
	 vkHZFlTLhzKfC13hexipoEQS4YdeBXHiocyEoFkAYgJyF91b6l+GvFVawDHWsf85NPnTo
	 xIMww3PYzyg0eC6s78aZgJbjT+ynqL9Fwcp8FB2vMJPiQV7qbKzu1Mp4500arDirbgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935461;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=eI2wUSUodDzxO+Et7HJfnYDoyJyME+AVvchb7DzTbeM=;
	b=EzjuglfORmQnkNigWgzXMLyMxpETTCDvUU8Ja81agNimv7B6RfmNYk1Lik9spAcuCQiG
	 B/YwPEMrn1faXQOkyExod2U07u8IxsQHT84jXNDdoWAzM1VREv3gMRgZ8FLLwPxtx5C3g
	 f18LyykCiFT//sDHna0u930nOlc7PSaVI19Rz1kgU6OW0/j6KEgi1zwyhvcvpviwo2T8/
	 KsKPp+uvV4/vwyEJ5iPfMrZUEWbTbuXo2sx3oFCU9yr3XmuQfA12qj1aftk1A0NTEKHuE
	 hCpZCsqkKbTPJ/zZ6AqdX8HLxg+/hd6bMk0kHpDP998Mxpoh+eqKK3qoHkcIgkqAmQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XJV4YJiP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B38B60A2609;
	Tue, 17 Nov 2026 17:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XJV4YJiP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7438A1F000C6;
	Tue, 17 Nov 2026 17:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794935460;
	bh=eI2wUSUodDzxO+Et7HJfnYDoyJyME+AVvchb7DzTbeM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XJV4YJiP0W9dFkKLCkrcC21O8sBLDcLEdwLvZZyMI568EUUUM3ZPMNw/2urNlZO3+
	 zXgV65VtNDllucAmuhzfAZgtIHIpIzJmLwOixWYbwXrcObYJuQzGXvlUi78Ql1UQgb
	 AlTTHWyP5rzolKy/E7alXLhTDQBEJH71jW/GozT0qAAJBs85+rv1uE2wYgH1+KiwRC
	 Jv71WZi+TC/vuL/IGBBsVvOCrfD/5f7+RwXzG2030gwo6ka7Uv980nf1SgNq90BrDP
	 UUFb5O/ezO4c2ualp9aHBvrziY6LNw+n9UZccutmkPeOQpZWss/x01zrE4aDcNdAuN
	 q8rSNj9aeguvg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 17 Nov 2026 11:10:43 -0600
Subject: [PATCH v2 2/2] arm64: dts: qcom: Add MSM8996 SAW3 syscon
 compatible
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
Message-Id: <20261117-dtbs-qcom-v2-2-c0697a0bf016@kernel.org>
References: <20261117-dtbs-qcom-v2-0-c0697a0bf016@kernel.org>
In-Reply-To: <20261117-dtbs-qcom-v2-0-c0697a0bf016@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev

'syscon' nodes are required to have specific compatibles. Add
"qcom,msm8996-saw3-cbf" compatible to the MSM8996 SAW3 syscon block.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Change compatible to "qcom,msm8996-saw3-cbf"
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 8873ad68e557..a75347a2d4f8 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3803,7 +3803,7 @@ frame@98c0000 {
 		};
 
 		saw3: syscon@9a10000 {
-			compatible = "syscon";
+			compatible = "qcom,msm8996-saw3-cbf", "syscon";
 			reg = <0x09a10000 0x1000>;
 		};
 

-- 
2.53.0

