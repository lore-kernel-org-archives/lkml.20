Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794549399;
	b=C/7TPvkmaug5sa0VJ0gYLtgoi1yclAiEedWsU9X4/Figjw5dGn8xfTJ9FSOvASjWXb4A
	 JqNn0xpAxAwnKpKiNOtaa6GqR0GWxI+wW6upJmy39LRuh3APxCcHM7/B+CgNg4Guhcll8
	 VP5lzr3EWZwty9+2aSbH7SAsP/Yn6rgQmwNNsxM6pwAEhZlTR8w6MiPaU0xikb5vPmSpf
	 xkNE5rT8qLKBmRrvwdCPlam+xF/15oUdW1MKbAM2/2cmyYOkPwN40HYngWKKJM5uXG9hQ
	 zls+BcZ0wMoR3mHrhiNomoFiUoL27sc48ccahyCYw+P7+SqYlbRUGA1yTFTV1oVQEKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794549399;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=d0ee55NVmB4wkp8GqkvjrVAOKus4qL3ReFL8IStXY8o=;
	b=m43RyGCCPlaCEBrp27/ol0v+HqLyvRAC7BYEIzkd9VLHIqi/m8iR2tBkeKCFzAi1EQRC
	 rpWNtE4EafQVQLZR5JQW4GLrbR4Rz9RIxWutIcrgIZ6vXQkhrB6oSzLZxoKq3JdOxIk3y
	 2Cwz9Gr9pA1Y8Dt/bdlPTL4acHRSQuxXLhNw/XEp9MDKGbeEcndyAvjM1ru6DNf7JoDVV
	 4p41HeFCmkf3WbzvzkYOZfWuMMO2ayxPybhhYFcFVmIiPJTNrWrYTH8jFZehlRr/Od2JQ
	 nHGxMWIKq2/HeAfqmqGC/9q6j16pykhZIGupkkIEk0vzW4ZBs+zyHRwD+mA5f5lwF/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OWnYFKAF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73B2606A31C;
	Fri, 13 Nov 2026 05:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OWnYFKAF
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794549398;
	b=ds37zCrtL2tuLBWUrWdGekleB9Ar6dkSdJVot2JwZoNeSddILKMOKKUe2wuvDVy/tTin
	 WPTrKtK7Zt4clN0/IL+AmNqys1iBNpgZ07MwpDF60tYO76S9ovjDhhPJbl/NxATGWyOxT
	 90F4B5/HzJ+nbTLrgcvtfWnWnFEPCIgmDJPEKe2qBaAWB6/gC7uSrBsqg2se2/8sbSgLH
	 WXMnj4xvPgWcfWQRB1MeX+zhxUwF1eYk7DgmVQBIRNbKNaV+CtJJlCtgltXCLs78MuAYu
	 FG1NFUnOYqOXPZ+Q7nKc3yR2XLz//9h8C2tiSvZ9TPbv8BVIJkdMvOTtA1uQvUeaMVw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794549398;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=d0ee55NVmB4wkp8GqkvjrVAOKus4qL3ReFL8IStXY8o=;
	b=BLZzOS2uf+OPZvXhU0o3mnJ1POnhyzROoC4J4UM94DS8TqeVBHXM1Q/qAmdGAYv4ZSJQ
	 HsBKPlMyBxsOwz8dEQVmbYr0eCm6MpfodJKJfhxqJmYWaWCigdPxS5Gv/dkWMrQ8JmMs5
	 3jHAr9a+evNrlAGn7oE0+qu5Fn1KCY0jgQaiDoOYMBUlVKsPRO2nHyyMFjcIdKmo433bE
	 U6eEn62bQt3b22AmlWRB13br/BJ3zuSh61ZfKV3aRpjIc6dalwqiyREfVrMSm+Zom+fPS
	 XkpgE6lS+bwRnFltSmznP+tfnfcWb1g098ePFyTIxLx5JqRri6vdQ9TJVxEWBsmjQiw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EECBA1F000C5;
	Fri, 13 Nov 2026 05:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794549398;
	bh=d0ee55NVmB4wkp8GqkvjrVAOKus4qL3ReFL8IStXY8o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=OWnYFKAFQzXU494bSAagZRuxgayPEODZdZppOmPaVIviZC4fZhqhKk7uja6VDXU+8
	 r723bvu6ts+37easyWQpJmxKvwP5N0s5xbAc9sroq1Hm4sW1xBVdyDRg4FqsXTeFiS
	 GzFiQqRawWGkPFAeQZXOpBuLtzRsrI67oKjsWGRCiGL1/TzGGRJwcCVVwjg4l7bXx7
	 vkQ8qQSHH/gjxCVgMveMsBpDphD3Q7nV4IOcijd+Ejwi8i1X1OwKj4ytZkw5kzNZhV
	 g3OWGDRAqVsg0QUelpVS5oRejb1QsekLCVOw76xJKQidgbmRd9yFj/7DwrLJ55vNLU
	 4Bp3ZFR9aO6dg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6FCAE475BE;
	Fri, 13 Nov 2026 05:56:37 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Date: Fri, 13 Nov 2026 11:26:34 +0530
Subject: [PATCH v3 1/6] dt-bindings: display/msm: dsi-controller-main: Add
 SM7250
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
Message-Id: <20261113-dpu-sm7250-v3-1-30bdec59d204@brar.si>
References: <20261113-dpu-sm7250-v3-0-30bdec59d204@brar.si>
In-Reply-To: <20261113-dpu-sm7250-v3-0-30bdec59d204@brar.si>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Ishu Brar <patches@brar.si>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794549395; l=1541;
 i=patches@brar.si; h=from:subject:message-id;
 bh=vZLUcoevInvSs4EvlJ6xECEz5Duh8PMGv9TOdJ9WEoQ=;
 b=m/X77svwPXoAQG4XcNWyLRT7xbxd5Fv1Zp2/JMI8sYcoBcQW1LXZ4PXJ8paHqr42+i7ClPsC6
 8Zvgad5jNQjA2MuutElJoFXPpbwpO3W9pQ4r6pcGsZmHu7BDPcbqLMU
X-Developer-Key: i=patches@brar.si; a=ed25519;
 pk=Ds+E23E3ntzjPzuBDyVRkOouclcNI5k75R+N42yJtCk=
X-Endpoint-Received: by B4 Relay for patches@brar.si/default with
 auth_id=1189
X-Original-From: Ishu Brar <patches@brar.si>
Reply-To: patches@brar.si
Content-Transfer-Encoding: 7bit

From: Ishu Brar <patches@brar.si>

The SM7250 DSI controller is the same 6.x hardware as the SM8250 one,
with the same six clocks, so add its compatible next to its SM7150 and
SM8250 siblings in both the compatible list and the six-clock if/then
block. No driver change is needed, the controller is matched through the
generic qcom,mdss-dsi-ctrl fallback.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ishu Brar <patches@brar.si>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index e4fd1cbbd4e0..d447d7cc1a1e 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -39,6 +39,7 @@ properties:
               - qcom,sm6350-dsi-ctrl
               - qcom,sm6375-dsi-ctrl
               - qcom,sm7150-dsi-ctrl
+              - qcom,sm7250-dsi-ctrl
               - qcom,sm8150-dsi-ctrl
               - qcom,sm8250-dsi-ctrl
               - qcom,sm8350-dsi-ctrl
@@ -358,6 +359,7 @@ allOf:
               - qcom,sm6375-dsi-ctrl
               - qcom,sm6150-dsi-ctrl
               - qcom,sm7150-dsi-ctrl
+              - qcom,sm7250-dsi-ctrl
               - qcom,sm8150-dsi-ctrl
               - qcom,sm8250-dsi-ctrl
               - qcom,sm8350-dsi-ctrl

-- 
2.56.1


