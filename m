Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF22351C17
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792315099; cv=none; b=h3Y9qT6uHE7pvoOOUZ9GutObwHetHgjFPmt8nq+zKlnHAqoKqjB3o5YeydlobmybUG5W5KpRLU+MPTWCZdTkG1aOUR2G1forPXgFcW4PO10Aavjfspybuwk93SzNgVWAR7+Qfi7P5IuC4I6iQF5siiUs3+EWbFM/NUkEk1CrBQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792315099; c=relaxed/simple;
	bh=LlB6iypx0SJ2C2sZVr+0cmFUBBfczV79VPZDjZQrLmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rXDmZ2mE4VuCDDkhTIhDZXOAnx7AFL+CJEhtGWg0tXv14q1ofX58T7JOOow0ALozv7CYaTyOjBau8Yo6f6KS6u8JvTwb1ZbxsLNwzChvxLOXiJpRaAC3AYnTglsygUII0oD0UEddkrZmlVFDLh/R8Dci4XfwJjtbOM0nzXqOebc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=LMDOHEWH; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="LMDOHEWH"
DKIM-Signature: a=rsa-sha256; b=LMDOHEWHlECUlXJI1llgEcp/F2fjA7/dr95iT8r+2TNNLOhHSu4MiO3C3bgd6qsZvBd9sUfZaU0sUrRWipddB+IQuYicW8b5X1FjX5mNseACj0XeFrYygC+OExGGgYNGL2H1IwAC1APsKA84S+9RwTyfSi/IWmb1pixDI3uYiYSvM+Z/b0vgXG9hulOWmbOXEgf2T6OXAjtBEt1CxgHtkDjWhjhP/Lejq654NIXl+PKVFEpqC8CitER8/Zf0lbt/szSdl/XbmjwoDcieHj4HmzN9p4IlKuQcCAcq4kVYz/lvkMrHehFb35e8uunWBrFqbHIOTjp4cCD1yMMfvhc2Yg==; s=purelymail3; d=purelymail.com; v=1; bh=LlB6iypx0SJ2C2sZVr+0cmFUBBfczV79VPZDjZQrLmQ=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-kernel@vger.kernel.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 799555268;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 18 Oct 2026 09:18:03 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Sun, 18 Oct 2026 11:17:56 +0200
Subject: [PATCH v3 1/2] dt-bindings: arm: qcom: Document Xiaomi 17 Ultra
 devices
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-nezha-v3-1-7e8c63903290@mentallysanemainliners.org>
References: <20261018-nezha-v3-0-7e8c63903290@mentallysanemainliners.org>
In-Reply-To: <20261018-nezha-v3-0-7e8c63903290@mentallysanemainliners.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792315080; l=1043;
 i=igor.belwon@mentallysanemainliners.org; s=20251104;
 h=from:subject:message-id; bh=LlB6iypx0SJ2C2sZVr+0cmFUBBfczV79VPZDjZQrLmQ=;
 b=ZqMqm6aDLosopjpigBHOdnKupqbnZg/sFLscCnjdwoy1QnVnjZ5V+WyBe63ckIqAaeA8r+rbC
 pF0bUexHLHCB/KqCvg+qAkhwq36aPwD7qUJ5I4F0VRGXi90g2xvvzgj
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=i9++1bbnBwoyc3uhTaetGXS1TbBJoS0mcxT59GrpYh0=

Add compatibles for the Xiaomi 17 Ultra devices, consisting of the
EU model with a smaller capacity battery and the CN model.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

