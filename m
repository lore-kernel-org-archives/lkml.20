Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D390347A894;
	Thu, 15 Oct 2026 06:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792045244; cv=none; b=VMmqKbFUX293YJe/pso6Y/1Q+dytfnyBOpLdilLDQDJJgNHAINS4y59P/UcAbTFBUgiA1Peu1AEfRo5cmGLLaXuz6a7aixSk/1gHg2XybtqcwNUrz3K4QYEvqojfHHfDh1imFdtjvAp7jBIG9DArhQ3E5cFgOStCRLfScyxmlLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792045244; c=relaxed/simple;
	bh=K/ZOGxcAPck/oG8zMA0EHFOK3zkvQ+pfWnaxGgZcJ98=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=csy4YpBO70hOMKkdH1YvWGbe+7fxKvUozU3mPaB5zAyTpsDwCs2GownW1FKFJL+IkWfbrTk/7mCDaeBsV8N44DWST3ZZPaAoue10Bv1kjYkpdhCHgbx7WC+2JuWuWarZXKl8RvcLopP7idT4CQF7xI/umRQQ4wFdabMnXM9MkXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rFzXQPBX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rFzXQPBX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54369C2BCC7;
	Thu, 15 Oct 2026 06:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792045244;
	bh=K/ZOGxcAPck/oG8zMA0EHFOK3zkvQ+pfWnaxGgZcJ98=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=rFzXQPBXFY4zndnk7XfS8qNqGkAt5+Ut+o1LN7YYlyYAmvzOSSOaY3G5wTk+Y6AH6
	 rZU8/K+zvA5oS7+6OTMsUpLmrhDdQ9OdpOoW5MwSrVM5Na3OsnINbgQM8B0+dOQt/x
	 UCGgeyW/F8eolh3PfSPp7lRZto8PtViBDa/ivq6fB42rDBIrZDoKudFUExnTGJI8tJ
	 eecM3GBChV4/N+sKoA1ZVOsaPHAQBIQKO1NvlEXS4QP1MfcKBKJpHcCADkjaDr92Vc
	 UAHaoX0ttANF0J4+MoKX+kk51HT5F1DPuaJT3ZD8NFJMLT0b8cc+5ZPCdAxVf3rKg4
	 2OD26N5m29SYQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D86CC6B34;
	Thu, 15 Oct 2026 06:20:44 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Date: Thu, 15 Oct 2026 11:50:40 +0530
Subject: [PATCH] dt-bindings: nvmem: qfprom: Add SM7250 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-qfprom-sm7250-v1-1-2401e54253ad@brar.si>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSQqEQAxA0atI1l2QlFPjVRoXDlHT4FRREcS7W
 +ryLf4/QNkJK2TBAY43URkHD/oEUHXF0LKR2hss2oSQYjM3kxt7o31qYzTfKEyIEJmKGnwzOW5
 kf36//LWu5Z+r5Z7AeV5GCKsucQAAAA==
X-Change-ID: 20261015-qfprom-sm7250-84361100e1ad
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ishu Brar <patches@brar.si>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792045241; l=1040;
 i=patches@brar.si; h=from:subject:message-id;
 bh=Js+mOiFMtKojVlFfFjDoASGr/TjMDscmI+GpAAhGGTg=;
 b=sRr5cyL40sr6YpjGeoZpyOQONA6bSYMeVLFmVA+zvDrgLSonGrhZsSfJyMyaySe+WOBlmnLkU
 GE6GYNH4RRLBwoGI4fctMgU+gJcneV614LqWx80R6Q1uJ7nMWdC6n1a
X-Developer-Key: i=patches@brar.si; a=ed25519;
 pk=Ds+E23E3ntzjPzuBDyVRkOouclcNI5k75R+N42yJtCk=
X-Endpoint-Received: by B4 Relay for patches@brar.si/default with
 auth_id=1189
X-Original-From: Ishu Brar <patches@brar.si>
Reply-To: patches@brar.si

From: Ishu Brar <patches@brar.si>

Document the qcom,sm7250-qfprom compatible for the fuse block on the
Qualcomm SM7250 SoC. It holds the GPU speed-bin value that selects the
Adreno 620 operating points.

Signed-off-by: Ishu Brar <patches@brar.si>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index bc0a0898b..3877b46ff 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -57,6 +57,7 @@ properties:
           - qcom,sm6115-qfprom
           - qcom,sm6350-qfprom
           - qcom,sm6375-qfprom
+          - qcom,sm7250-qfprom
           - qcom,sm8150-qfprom
           - qcom,sm8250-qfprom
           - qcom,sm8450-qfprom

---
base-commit: f5672a3dff0291d6a45eb0c258b9d2baeb4dc577
change-id: 20261015-qfprom-sm7250-84361100e1ad

Best regards,
--  
Ishu Brar <patches@brar.si>


