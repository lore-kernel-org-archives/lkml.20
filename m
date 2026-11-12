Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794515212;
	b=Np7mc+fKLbcyphXqTRHp1L19CAciGTbUXZR7fywe0UDzAQWaS3QeCbb0UVQHHY0swPXk
	 R8ON4MKvQxssgE4RCcaVOMOb6KC1CYr3QzggvaI9Q5ultTz+uZ9c7a2AL/lHcSM8Dvs0L
	 HWzuCnKMOnPdEUSF8y/RCCxZOWrlCGPRAbc0FzIV5MuFNQwsle7Rd0ululBsi/UxmJ1D5
	 HzP1vywSYSUfht8h/jbGLDOfBFXM1TeExy2LmAQY0AFTIyIIJDt1BgOwgh7kLe5UfegbF
	 C5N7GdxUdTMqsw5GlnGEGQCv6sWXbOum7/s8+ANAMu9OoGL4aMEMVq1n7CDWDeLiSfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794515212;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=BDf8OygF/dNvy9+88N2N3Xr+MCVnZBo3k5Rcl6UxDmI=;
	b=Pr+kIsxF7NICXSkOecTTRn55vsuFiDdvSK/Q7FuiMEVoACZkuun7DqvExCU/aABR0w8r
	 rX2ZVCBksPk2LlW7rWTJl+EkvYTy3c2f2x5V3VW+4suaZ6aPUvKUjFNSY53TS28zEFSpF
	 WLg47k3Ny/vSPuUj0qe6B6xO3Y/gNoQKdJ5oG/1zmi96TG3HF76qWPBg7dRr74vMadBLA
	 NH2p+KhReGowiTLH4c2Zo12BcnDxEYUR2QGYXIFIDKFgB+jccldSFhLObAYUaWAcW4brE
	 R4Y5xc5vOwIGucXe4FtIWSb5VM1g1J1Gqa3/v2sNokgtdBnzfodq/b97L4BOW6WPFZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JNYup9jA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CB0606A323;
	Thu, 12 Nov 2026 20:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JNYup9jA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB581F000C4;
	Thu, 12 Nov 2026 20:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794515211;
	bh=BDf8OygF/dNvy9+88N2N3Xr+MCVnZBo3k5Rcl6UxDmI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JNYup9jAI1fu8/7HSZ1BgBaAkraPgMy5dodRwdAq0Ch6+d+aAwSug1P2q2c5MkHWB
	 /gU4nI5p+AeNj78DLjys5hHQymvkkVAGRbF1hddkfTPHQCZ697MCxohASRPJ+/SYF3
	 kUvg6quzBxddqnq7ed9xmrl5tA/U0Y+MIJ+CJYTWh2XYx/uaWDAoDONZ9sjfA6/qQB
	 gKA0RI8iaWGdkr9QjR5ODE8B1CeW1drewvpnnAiW1k5KzDXGADAXmPYqOq7B9SknrG
	 gS12LxTe19y5JeBbqTdSEs9DcY//0MsGGZdmO+u5UVZ2qvD7ImGVF87zRnkKSSsYcq
	 2YQFlAochq2tA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 12 Nov 2026 14:26:39 -0600
Subject: [PATCH 1/2] dt-bindings: mfd: syscon: Add MSM8996 SAW3 registers
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
Message-Id: <20261112-dtbs-qcom-v1-1-1978370c7cad@kernel.org>
References: <20261112-dtbs-qcom-v1-0-1978370c7cad@kernel.org>
In-Reply-To: <20261112-dtbs-qcom-v1-0-1978370c7cad@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.16-dev

Add a compatible for the MSM8996 SAW3 register bank referenced
through qcom,saw-reg properties. The name is based on the label in .dts
files.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index dae706ca7642..132a3374d14f 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -110,6 +110,7 @@ properties:
               - qcom,apq8064-mmss-sfpb
               - qcom,apq8064-sps-sic
               - qcom,msm8960-sps-sic
+              - qcom,msm8996-saw3
               - rockchip,px30-qos
               - rockchip,rk3036-qos
               - rockchip,rk3066-qos

-- 
2.53.0

