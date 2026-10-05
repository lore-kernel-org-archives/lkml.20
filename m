Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8FE4921B5;
	Mon,  5 Oct 2026 19:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791229691; cv=none; b=nUtKYbrjn7+OvheOFIJ4xnv8I5MwiE5UylTSLPoYKlzAM9iZLIgU2lLe6MDNHWz8Yj8EdFIuGSzTmJtTmX1u44eQScHi4wQ+0sk18zXQ+z6mrwlGXK/7hVlEoQgi8BcF1jFhzK8UJfxLxtHTxD5VOgynT25GqCzspg4dlemIC/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791229691; c=relaxed/simple;
	bh=W/j/m90Ouj/qcxx0Aqz+gSAWJf3JWQRVOketup9FfVY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DL44CKN56Qt1KDEebNyckGciOGKFITcBMPGDk8xWZF74pddi5QPEJuVsHF+dKeqb1aqCzWQV2stsfpD0txUK78vKlGWx+/iX0r1356tLOhWAlOdFzCQFvk5yYegZHBWvYlNrRS6YbF8BYWN4mWrf3mHCrXIFs75vVuMrdRbE2Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gs0ry47v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gs0ry47v"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1CD34C2BCF4;
	Mon,  5 Oct 2026 19:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791229691;
	bh=W/j/m90Ouj/qcxx0Aqz+gSAWJf3JWQRVOketup9FfVY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gs0ry47vW6WniYOOZYL618TU5/0snZLu8NpH9BlfT/S6d8PdIwDk8KqNQEfl2UXMz
	 PKm+qYeD3sjsIvnExwVu3DFRZCb1+esZEWqIxOK848qt9HiScu2s8EV/9FLyGRJFMK
	 53baN1Fc5Y+1oOloLe+t8VbAc0gKmuXI7OfCwXRn8QVNdCfq5SC4rXz6BoNjoaWSYa
	 keqKC6k0Su45tbIk7mMeumN9eZqDn2Iwy5ATpnubGxMT6QjbPAUaVOvjmzoLX7lypd
	 gBMdVVEJojCo+P53m73190O5pGOHT8XFWebwYxKZp5izIK53rPEGri2H7TUZtqlxj7
	 WuenpABmGqLAQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED948CA5FCE;
	Mon,  5 Oct 2026 19:48:10 +0000 (UTC)
From: Nizat Mikayilli via B4 Relay <devnull+nacht.dxdmail.cc@kernel.org>
Date: Mon, 05 Oct 2026 21:47:36 +0200
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Add Samsung Galaxy Tab S9
 Wi-Fi
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-gts9wifi-dts-v2-1-c3ac9b0f9ceb@dxdmail.cc>
References: <20261005-gts9wifi-dts-v2-0-c3ac9b0f9ceb@dxdmail.cc>
In-Reply-To: <20261005-gts9wifi-dts-v2-0-c3ac9b0f9ceb@dxdmail.cc>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nizat Mikayilli <nacht@dxdmail.cc>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791229689; l=798;
 i=nacht@dxdmail.cc; s=20261004; h=from:subject:message-id;
 bh=cEp1GK4/VeofJSL3FA6cERzdBjH/s6XtOf3x9RNVDaU=;
 b=Px7ZlDC4CLolwMwJSJDYlp4JbqYd877UU8HIx6jv/oXYkHs7LQxm+mrl4vMH9xLbavw22QHxk
 Lb/0LXONZ/7BoHmfpTVvFEj3Tv3WDH3VSVBTKUSHtlqsRtly8h2Uvs3
X-Developer-Key: i=nacht@dxdmail.cc; a=ed25519;
 pk=Kay3P3pOJq5klUD+0/I8QX8JGOh0CeQXEwRVv7CMm4k=
X-Endpoint-Received: by B4 Relay for nacht@dxdmail.cc/20261004 with
 auth_id=1111
X-Original-From: Nizat Mikayilli <nacht@dxdmail.cc>
Reply-To: nacht@dxdmail.cc

From: Nizat Mikayilli <nacht@dxdmail.cc>

Document the Samsung Galaxy Tab S9 Wi-Fi (SM-X710), a tablet based on
the SM8550 SoC.

Assisted-by: LLM
Signed-off-by: Nizat Mikayilli <nacht@dxdmail.cc>
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


