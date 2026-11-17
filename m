Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935458;
	b=I6xPCZM9BIy10Gst+KziR5TMIHVf/QK8WiOHiPq6tuVgvcI7jqM310tvLBlzGHP4xPyD
	 AUMzPkjrEsYC2vljzjEpM82tiI6gYGOF4Ioi3rlwH2jegQ9LrzJYfyZlt4LG4saGSRAvc
	 gL2xiXGOSPL0aABjpkOF1LsTQV6mFrG92cx1sYzlIVQ2gy7adgyKktyjEQM28qyTjz++Y
	 d7DiN9PjWEdBsK1S2vUx8kMJhCMhJdec3XRWzAQXE8i5upnbHb4h6dsH4FQ6OiDN+nPjN
	 hxkWJsnTYE0rPIUsjf1/tlda1qvRek1mzP+aTtp9DOhjqYtaUNIl5KiDWZLptHdFxQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935458;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=JmNc++F8vE4a9IoHKn/KXDT7xJ24PmLsfZ2zZRT3i70=;
	b=JCKd/Bbgcw3Mtf7wTb/gBt+rYwNQWyG8QaaFurT9sH5rMtvTEEpgjuESIPWuk7YcxsR6
	 7OEIzySgY/8LRUB5yFSFGmWdWwSQ+trlnw6j3+lLpC25mdW60sqaoeflaiv5+bmfVM3cm
	 dtpHtT+gIS2dVTIkckzKjXOLTXk9aY9dSPhanXSMOIn+ZBVbbKy+cC+mdXyXDyEAIC0lW
	 7tuid6WsUwVlZKoEhQUjC6iFwOgAySM1wJJcIysgQtjQy4jDW/2vYu2tw5ilDGeNZ7t/9
	 d+X0gKyNYN0yZiboRT5HWa/cUUtQAwwLYWYewrDDtGopwEd0qJuQBZlA90R/mV38kHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bkroyspf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81FB606A8A8;
	Tue, 17 Nov 2026 17:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bkroyspf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43CE31F000C5;
	Tue, 17 Nov 2026 17:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794935458;
	bh=JmNc++F8vE4a9IoHKn/KXDT7xJ24PmLsfZ2zZRT3i70=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Bkroyspf+7BX/+OtbLvtIhzPKwPbrp6nkcvDUObeTfiCmVbeylmxlhItG/PV0N1Bd
	 n0AJRS4DKUrHjr1XHcibK3INovrNiWwVXTFpHC+okcM92bRjzhdeyw87GPNGTLRrAj
	 T1GY0lPQC8q1FJYfrMrYvImCnWCQ7225pvGQo2L4pePoZ1bjcysVEyGredm70ChKqd
	 cjIMk5w6UrehPQZyd/ywS5ZQUMFAT8buOy0WBM4ZNGDdb19qJrIu5zQLYzgo/EE9ne
	 G8GbdOuATwCaKtiro5kgt16miTa6GldPs5fgr/VqK2N0pbmBArQWInWmlTTreAxd+I
	 /ND3SFBfxcRxA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 17 Nov 2026 11:10:42 -0600
Subject: [PATCH v2 1/2] dt-bindings: mfd: syscon: Add MSM8996 SAW3
 registers
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
Message-Id: <20261117-dtbs-qcom-v2-1-c0697a0bf016@kernel.org>
References: <20261117-dtbs-qcom-v2-0-c0697a0bf016@kernel.org>
In-Reply-To: <20261117-dtbs-qcom-v2-0-c0697a0bf016@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev

Add a compatible for the MSM8996 SAW3 register bank referenced
through qcom,saw-reg properties. The name is based on the label in .dts
files.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - change compatible name to qcom,msm8996-saw3-cbf
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index dae706ca7642..b9d6ba3393cb 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -110,6 +110,7 @@ properties:
               - qcom,apq8064-mmss-sfpb
               - qcom,apq8064-sps-sic
               - qcom,msm8960-sps-sic
+              - qcom,msm8996-saw3-cbf
               - rockchip,px30-qos
               - rockchip,rk3036-qos
               - rockchip,rk3066-qos

-- 
2.53.0

