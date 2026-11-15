Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794774013;
	b=ApnW6c3bges9K2aNLYIBX1EtrUlmlmRrhGtU9J2uZ2YT1g2vA6hLDLBSeBNMcb0wePnB
	 K+DskWn54ylviEV9ROsBLbiscvCrwrMS27ILkTav7jtRa2R3OiaWQGcoWjzvikC6u4pFS
	 Yfkk5gZ12pWimKTKQqrxt2QLxyO2TQBax3tNnrReqC1O/DCZ5CVVwPIv0kRSF8K/JeQPI
	 THwbx7oWsNxMEdNTJ26vr4/dzJ1k3wUXzUOeDaFnOPh4gAzmBpJonoVRclJAcxZ2qDndG
	 uekNbE+9rzOvp1ogKRY0mRaYo00gWopYcgXsUMqglOE8lbxDH3hZYYP28sUV+OrhERQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794774013;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=szeO4VeAdWkCCLjacsOb9qnHlxTo+SxJLNWdu8R2EX4=;
	b=FsAV8yTUOd55DKpkcWIkqkTApaBohy/9dNw1NrmvNejCXCfLVhSRSGh+kIe7rI481ljZ
	 6UXdeWBA//BuGhrRWGYq/S8N+DooBrlnVuR0QWQu/8jBMSkGsXO8UN0BYrsnBC2ME5SOX
	 7GQT3UoHdp3uUYRSV4CxPOeYLyC+H2Mzmg1FjJJGQ8jWW1EmdON9z8CEYeQpifxsp/ssX
	 rVFkaCMKFaiyHbSqTJ2FaopRycEtnZCRn0D5FDkNk8CthXdpr9MN/7KfORnMJ+CBU8maq
	 aE7Xxi1A3lscNGEcWqc9+DorSgzm+6SlBezw7Q4WFe4IR1+wIqgZRYyqs8IobDU3oEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fvfV8uQI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B8C606A8B6;
	Sun, 15 Nov 2026 20:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fvfV8uQI
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794774013;
	b=mMNxE3P8fePkLvp8ozqnTu8vlYWrSUDDtUSnLXetaY6YWl0EqKYzT66rhg4rjbV952W9
	 05s/4CpAAlvp3uI5bSLFaalGTdMzKoFidJ9lKmTcJv7fh0yaN488S7JFTI84qdzGTknGF
	 I/lXE3GSCoP0xoy3IEbVLOtwNpnR9+eppEgKC1G2qAOF9BahuhBDEc17Gr5GVuRqHjMzc
	 gfWoDa4prGCsxhKlvv2/51RpWtmAl6M/Tjm1ofh6hmS+KYhIVAVPZapWFxu+onEZFngL3
	 92D1TlQ4kNYOx85wEYOkw0LsESXlfvw7TIcuoAq1VVl1+DBngYElUaXK28bTLeaXC5A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794774013;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=szeO4VeAdWkCCLjacsOb9qnHlxTo+SxJLNWdu8R2EX4=;
	b=TklTog/pYYnnjJsgr04uGlUSnPFHK4E8AyPMuB8p/aNgBp7X+WWbkH8Tyg+kgqaVqB3M
	 uHvaJ57eWXkTMqJxrIYDi4r39E22LO8QZz1OM4TgquWNnZMo0IqCUvA6zqqn67WQGye3+
	 ZP7l2jROox1hEBKvfIZSpDUDpwdIKxizNCExLZKpjLAersyeuslLYCdkvlMExF7z8a+7C
	 alJX1W7aX0AZrIXctowCpDQi1xP/oeYaRfqtt3ISZtS3kFMSDLpGXyhjGsQ/BRUPI6kSh
	 SFcrv0lqz3w7Gcp5oqH+qWG3w4fCZeg7wkoz11lc0OP84U5p4aKiQHv+aEgmKq0tdRg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5C63E1F00925;
	Sun, 15 Nov 2026 20:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794774012;
	bh=szeO4VeAdWkCCLjacsOb9qnHlxTo+SxJLNWdu8R2EX4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=fvfV8uQI31Bjsb7GxsjhovBdqrs9rZEoU8dMDHih0zwDBM/RvUli0oqLq2JmuL/fn
	 Vy/XoXGDuvO0xwK056+LAJJQO3WEBnkiWtnrWG/0DgAlfT5cIPLcL8Slr+tcT4699x
	 Cw++FOMHoLaCjoDimthmK4oHrf9Lmazj2r7UrlzwU14gIzY/dwgw3JlrJFq+Q5P2Aa
	 1YELUKlNCTX1SmfaLy+yOkzn9xrfosFHxI/aiK9GGc6ul4TMy39G3t4UB0jhzM7PZl
	 V66uFvYx7s0pGCGiR90EHjdp6NbMbffUP9RddBtidCpXqgwYjBsHPKnY6uHN70lKpE
	 mOGZgWrHt4+HA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BC0A34A1BF;
	Sun, 15 Nov 2026 20:20:10 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 16 Nov 2026 01:50:15 +0530
Subject: [PATCH 07/11] dt-bindings: arm: qcom: Document Molokai and the
 Motorola Signature
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
Message-Id: <20261116-molokai-soc-v1-7-3b2ee920fa3b@yahoo.com>
References: <20261116-molokai-soc-v1-0-3b2ee920fa3b@yahoo.com>
In-Reply-To: <20261116-molokai-soc-v1-0-3b2ee920fa3b@yahoo.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794774008; l=885;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=GYfXo+CXYC3o0Pr/nDNcwG1FYQjn+4S2Xg+okvclwzA=;
 b=c7/9CXS+d+MpenZOq01sku6PSpUF7YnH77IMKmILs4kbzzI1bL2ePAsnZz9EW92zx3h4QNpLR
 3LlVoFmpZy2DJHXGyVu2oaww7nWmM278i5wbnE1j50RnEFG8xdkgUvM
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Document the Qualcomm Molokai (SM8845) SoC and the Motorola Signature
(vantage) phone based on it.

An LLM was used to help write this commit message.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7ffa4f69987f..6993bbffef9e 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -241,6 +241,11 @@ properties:
               - nothing,asteroids
           - const: qcom,milos
 
+      - items:
+          - enum:
+              - motorola,vantage
+          - const: qcom,molokai
+
       - items:
           - enum:
               - microsoft,dempsey

-- 
2.56.0


