Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C26C35674A
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 06:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792219335; cv=none; b=snXOe8MWwT4ZY77yOPfNn9ujr65++LaNl/kTC8vJbWWuJZsoxeR1By2cVlrmEuNbdjp114/iX06pwZgdccxJMxxSqJkKkbDUnzd5OFveZNZ4Wv4MvRURcEL8DZCmoBreTfqWlqrBf2ZJ3LUOltiTBvL6uXBAr2XbvBampAULBU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792219335; c=relaxed/simple;
	bh=j2R7GbNWnJOgxP3bd4FGE1C0LkoqGVm9JrdFVEAftOQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZA2Q2YM+5EjJPy2t/Nr1vVvF8xB6yhDCH0vkdoh/xpjARZk/kGCVGC0XJTCExr0VXDW4O+wNsqhAa1+hyNx8TqrW2B5sukmvXJMFG91RiK0YCAmH0PJ7sVUETDBhRZDf3fOvDiXNJ9MbUmaIurTtogXvBzm6TvwwU9qBxXOahFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=BmC7A8aT; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="BmC7A8aT"
DKIM-Signature: a=rsa-sha256; b=BmC7A8aT9LrQRkFvHffSu2LSaQtS/DPKbyRK88BEyhLKKz3xm6JGZ8qcr++om/FR5d9VW/oXoLob1hyzbjvZiHX5sXCW8O8/N05Ewah++f0ghMFUPGBpUrspJhWxF1uTJxPLkkJmtVKAKkg1d09+PTb5R+7YVVoKWXZTaVSGUNfgJAXxfPkdAcWXr78HMSYq+AXifI+c74BlhHoIUYoG1X4JGE3ZVBCSzD/CzPQ+hcue6suZ7Z/48T2rT7iYYst8SOo2wjLIWZIOP5EFV1EW12523HG2gVx4eLLk8Blv9ky0bTMWGJ6WLmQt1/UTcyfeHzddptOwVB9RFy4xsWFX3w==; s=purelymail3; d=purelymail.com; v=1; bh=j2R7GbNWnJOgxP3bd4FGE1C0LkoqGVm9JrdFVEAftOQ=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-kernel@vger.kernel.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1782608291;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sat, 17 Oct 2026 06:42:02 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Sat, 17 Oct 2026 08:41:55 +0200
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Document Xiaomi 17 Ultra
 devices
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-nezha-v2-1-44c95e1a9d6a@mentallysanemainliners.org>
References: <20261017-nezha-v2-0-44c95e1a9d6a@mentallysanemainliners.org>
In-Reply-To: <20261017-nezha-v2-0-44c95e1a9d6a@mentallysanemainliners.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792219319; l=973;
 i=igor.belwon@mentallysanemainliners.org; s=20251104;
 h=from:subject:message-id; bh=j2R7GbNWnJOgxP3bd4FGE1C0LkoqGVm9JrdFVEAftOQ=;
 b=Mz7dxsByEbjrbmexEpdK+r6DDyYMsarQyVIJhUYVqIKOpmZMleLjtYcv3uJLJZ8i8QcAXLvIk
 dh+gsEn6Xx5CtZW7Tq0FUj8OH40UQt/JNLcRldshCYOvk13XNRE/Ljz
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=i9++1bbnBwoyc3uhTaetGXS1TbBJoS0mcxT59GrpYh0=

Add compatibles for the Xiaomi 17 Ultra devices, consisting of the
EU model with a smaller capacity battery and the CN model.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..6d9e6a81b419 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -173,6 +173,14 @@ properties:
               - qcom,hawi-mtp
           - const: qcom,hawi
 
+      - description: Xiaomi 17 Ultra
+        items:
+          - enum:
+              - xiaomi,nezha-cn
+              - xiaomi,nezha-eea
+          - const: xiaomi,nezha
+          - const: qcom,kaanapali
+
       - items:
           - enum:
               - qcom,kaanapali-mtp

-- 
2.56.0

