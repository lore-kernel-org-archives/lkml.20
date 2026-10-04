Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66C83C3C09;
	Sun,  4 Oct 2026 16:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791132458; cv=none; b=GSdJOzeYj8QSRfzjYNZNNlz4eWpxlB7uy1J9AExPwOj877HV882dsllLV3+7LLdwVuqguF2BuOLkImFg50X+gIMN9crKQ5Q91fI3/FJqJrL3n8tlhFxJ1w0m1Dg5k4ly1faReoWCbBLctpZ96343ekrKnWGadXsV/ofgswGSDLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791132458; c=relaxed/simple;
	bh=OZb/BIdFTJQ+thizs1gxgZ+eSTU59sR2Lu9JcP3xA7g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p6sYOzIxTYrl3vEndlKhh7pb+W+v4Qad1sHdqAuAxGV+/1I+3amEu2bUtN+NivQH7SqNG7xqLkYdOhJaS3hGQvMbKDaLkDcBy2oyn/M/ACVVUHwz0ZRnweaZQ8OFw+u2njFGe0F/l6cwV+ujml+NALu/RzWIPWipeEXeYN6Ligs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=luNyvRBH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="luNyvRBH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5A8F2C4AF61;
	Sun,  4 Oct 2026 16:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791132458;
	bh=OZb/BIdFTJQ+thizs1gxgZ+eSTU59sR2Lu9JcP3xA7g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=luNyvRBHSXKef22yrDHoPdo3o6ccT2VXpdnMnCHm7j75kUA2fL+QYMeyy4FMacUf9
	 ZJ2M6fyny5oxV8qr/UzsEI0rMb8SWqqM3V011w68j16Q6b5HWDJUpGt2rJRq5CexeG
	 6RDfszrHsUPWiOu2440pCR4aOp3TIiWnemCvKnsSWAcBKorsGksOEJB9DOqo0WNq93
	 jsynIQ8CEwyv/7GA16PkFBiugTyLD7mcyTomadmjlo2x/YVfWKFdSALmuqI/+nux3q
	 A4Dq1x6c8fo+d3F9IVHwaAz1fNH7Z0ZnSHsgvwhQHKLLf1iU+Q1bAzRbMhgKjwPl52
	 q8Sir2QqGPKdQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39379CA5FF0;
	Sun,  4 Oct 2026 16:47:38 +0000 (UTC)
From: nacht20-de via B4 Relay <devnull+nacht.dxdmail.cc@kernel.org>
Date: Sun, 04 Oct 2026 18:47:21 +0200
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add Samsung Galaxy Tab S9
 Wi-Fi
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-gts9wifi-dts-v1-1-1f0d7dd47e4a@dxdmail.cc>
References: <20261004-gts9wifi-dts-v1-0-1f0d7dd47e4a@dxdmail.cc>
In-Reply-To: <20261004-gts9wifi-dts-v1-0-1f0d7dd47e4a@dxdmail.cc>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nacht20-de <nacht@dxdmail.cc>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791132457; l=793;
 i=nacht@dxdmail.cc; s=20261004; h=from:subject:message-id;
 bh=dhb9/CYWJRP1ErIsELAmuFRlF70WvgeelXRbRrXljkU=;
 b=RBruufLvwrH74bfWhOgOf+gIJvxy87vGe1TbY8g9xOxe1Xj8XfeJMy5+CBA7mbtOdMWVTrf5k
 mZo5UoHXZSpBHYn1K/F3Sm5nB901ufJxHD5uoeHoCOe5zJt5Vl0Q3RO
X-Developer-Key: i=nacht@dxdmail.cc; a=ed25519;
 pk=Kay3P3pOJq5klUD+0/I8QX8JGOh0CeQXEwRVv7CMm4k=
X-Endpoint-Received: by B4 Relay for nacht@dxdmail.cc/20261004 with
 auth_id=1111
X-Original-From: nacht20-de <nacht@dxdmail.cc>
Reply-To: nacht@dxdmail.cc

From: nacht20-de <nacht@dxdmail.cc>

Document the Samsung Galaxy Tab S9 Wi-Fi (SM-X710), a tablet based on
the SM8550 SoC.

Assisted-by: LLM
Signed-off-by: nacht20-de <nacht@dxdmail.cc>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..5e560f523d32 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1173,6 +1173,7 @@ properties:
               - qcom,sm8550-hdk
               - qcom,sm8550-mtp
               - qcom,sm8550-qrd
+              - samsung,gts9wifi
               - samsung,q5q
               - sony,pdx234
           - const: qcom,sm8550

-- 
2.55.0


