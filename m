Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0CD49505D
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 16:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791392371; cv=none; b=s9H3JbkBkFCyugX63nptPfCduM90Z51rGT2+gUbdDQ9wcLdmcrIKp/VxILkzL3bEDL+cYPnRdx2d4QI2yFYJ0A4JmKdXWVHu/2gKc2E2HWR1gFCAKs0EAa8UpCiW2Ol/i+7Jei6x3rELBcSjHwC2Kv4jc036rXDTA2cXS7Fcll4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791392371; c=relaxed/simple;
	bh=3Y4nSIKQIMHtksHP4TKmqeOEV26YVlYf6CD4ZN6MqNA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cZUEIj3UZyXmMCuCh0KD/SpEHNntNjrjAse+kpr9XFjtLVr3bjMowL//aeK4cjBuFA76y5sDErytbagpR8JGcHlXpbt8Ap4DlgjZ6esM0dib7HsAJkWumr6dc7H3Jnpd2jzkgvxSlDag0eYGqOrBCXaFroahHTvw8i1uV1Ug4Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Su3V+hY7; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Su3V+hY7"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so17765955e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791392368; x=1791997168; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wY0HKhs5xhI+kbPGubJTNM/4f9SJfPTvcRyxFTTWKz4=;
        b=Su3V+hY7eIMTDQR/2oJKBjKRSXm4kMCBMF0VnZgiUj0QnDjPur6Hpbe23flDbx/9lz
         pUz000smWFW1rf8Si3X5A8LJUqzMqcrsPohmsDCT1dvND/taGhqMgqck5BZmCb25SigL
         oZSQPny9f0Z8oJjZSpetKNsT1SJWfMcIEv3JG8CXVOaArTIRlJ1tkYnB03GpMQokEK47
         JWjal6yabomkOlqtfTGhXndRcZpwLoVC87ojH9aYG9HMx4jfdcBovTyCAT0iJCrWShiS
         di2ON1jiBgru9KoMQidtbbAa9ecHI0/0Xd9Vvp8ZVG2x0M+GdVQvNX2zlMxreDc6Y3uF
         J8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791392368; x=1791997168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wY0HKhs5xhI+kbPGubJTNM/4f9SJfPTvcRyxFTTWKz4=;
        b=NfaxMBN+vEZMjRcvZNQRAvArbBbb0ZcvCdpMv8GsVDI+S5KfDdpo7nX2L+GVMRljGc
         EcEC/owdM1ekNA/6+gleCA3alDEtIVujokIPEc+GFyUhLA5L4uFalh/pkOj64ODk/B31
         COv4BYv7bWMgRaCoA6qZ6DhpjON9r1kR41hTSByXp2Ph93TK1w8dyuYgKnRTBi0l56yX
         B5M/wfA01EoiiokqAVKWj4NbJl4SyF6cQZKt41KP/RNWFWkyKUaOk6bLVZD8QlcaIR14
         69jeEwZeAlYJeFMRA/oqGOOVlQDYkrEBjSkk9HVndK9R+uUwSsA4vgCy4X+VGLqDMvVo
         lloQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYO8d9bhj9IDLkWx+vARPE+8bL5cqow+LUJ0mR4JS7DuJPbk4cK6GK6/P/qcgbkNVqQvojRo8U8l6Qt3M=@vger.kernel.org
X-Gm-Message-State: AFuF++mDk4ph5AYy6XbN2UJqZuq+5FRtkVElqxLv2oEE7MekaPntL5uD
	FQantGHTP+HTTHxdsiEqcp0I1gy5w/fb4x2fbB1P4+V/Vf+UlciKPK1y
X-Gm-Gg: AYBFou0GxFh4rMpRnOBf2fRJh3bO2hY+dlXxdNwMPHg6RnLJcT6h1wO+hseTG0kMp07
	CK36jPLhpHwdRLuiADQ1hEH8pwRNX4UqwmmmrntmZM3NT6f42831gd1py34oRaJ8O0gRLQH/j9D
	2+H7x4gA9juG3udLrjAMYbDCOAUPBQjbnQjDXuoI1ZLzCFJXcnY4uPRKfsLR9m66Wa+K4NGRiv+
	oCAV1DKhB0DmRZBtdl0QeCDaaYdR3L0MIIKZ2oh5pH0Vf5gVyruOO8Lf3rmlsaTt+Dy4HVdyHrc
	eq3UU/yVHBvoR+gJ6MEGdpR7i6sflsgqaTFb1fCFyXcCSy4pBB9o6caGtlmd3O0IKkKhYiwXC0R
	7/OlhyODzC9B91ozURVw+DHkph4z0m+9xQ4HXWTlcLdBwrDPc4+EUDbx1h3iFCiWPCbcc5nTjXp
	u2GBfiP8k57rxpxdX2mZTwJW4vYU5lxAqRBssHaUMUXJIHSfKIxvHeRcVqNoZ5ix60hSRTWejny
	Mpg34zahgBPjXRdnOx3XzOFOJI=
X-Received: by 2002:a05:600c:8b54:b0:4a1:7d3d:10a4 with SMTP id 5b1f17b1804b1-4a18042a44dmr46613435e9.17.1791392368350;
        Wed, 07 Oct 2026 09:59:28 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1843d198csm4682525e9.7.2026.10.07.09.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 09:59:27 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Wed, 07 Oct 2026 18:59:20 +0200
Subject: [PATCH 1/3] dt-bindings: arm: qcom: add 'qcom,ipq0518' compatible
 for TP-Link Archer AX55 v1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-tplink-ax55-v1-ipq0518-v1-1-0ef058756596@gmail.com>
References: <20261007-tplink-ax55-v1-ipq0518-v1-0-0ef058756596@gmail.com>
In-Reply-To: <20261007-tplink-ax55-v1-ipq0518-v1-0-0ef058756596@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

The TP-Link Archer AX55 v1 board is based on the IPQ0518 SoC, so add a
new 'qcom,ipq0518' compatible string for that.

Since the SoC is a trimmed down version of IPQ5018, keep the 'qcom,ipq5018'
compatible string as a fallback.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..2a8af3402814 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -94,6 +94,12 @@ properties:
               - qcom,glymur-qcb
           - const: qcom,glymur
 
+      - items:
+          - enum:
+              - tplink,archer-ax55-v1
+          - const: qcom,ipq0518
+          - const: qcom,ipq5018
+
       - items:
           - enum:
               - 8dev,jalapeno
@@ -112,7 +118,6 @@ properties:
       - items:
           - enum:
               - qcom,ipq5018-rdp432-c2
-              - tplink,archer-ax55-v1
           - const: qcom,ipq5018
 
       - items:

-- 
2.55.0

