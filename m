Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8B43C1D6F;
	Tue, 15 Sep 2026 14:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789482749; cv=none; b=sKLNtxFXkpyEjJk6ycVpkoLnsKMowXmG+MLXoaNoOtFq4fCZeFy4jPEEkYf+yzaRLRBfwTI/HMvCL9KtPTKsBHIHmg514cBqwjD94vvWLddriF731LCjS3Z5c7700/7cMsgBe5+3VprxPEhtB6DVCBHQzTHPbDITqzVxcieEPEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789482749; c=relaxed/simple;
	bh=KgaXJ/pb3DRKR/CJo1jmUo4ceN84s0N8uAZe35ZJPNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GoJ/tNynnc8l1HAtqZRcGH9oez0rwx29hYvvobZACiTfL3b5k/TKqg+D3CDSU396GR8CpsyaSFo44q81b8JIuzqXS1tqSVvCQ20iHcgMZ+tusbBZu3mKGP4YMDbI8qOjEi/+TdqkwgYsAUbZQHJYy+EmvHGtUgIYg+cwVkvbTnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZuqrGNR1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZuqrGNR1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7C43FC2BCB9;
	Tue, 15 Sep 2026 14:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789482748;
	bh=KgaXJ/pb3DRKR/CJo1jmUo4ceN84s0N8uAZe35ZJPNM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZuqrGNR14lj14B4YuML713qY6D79OulPZukIWWjuC7hV1gz1E3z1WLwaCikyadZ/l
	 BQnfp6exgoLDZdhNRpJ8k+w5EhXDDBV+fXrTOA9WqRixvfiiHKGJUtJOAeFxWX4Bai
	 g4pZtcor2Vqtz1OopjVjBbJRSsdYC0uxz8SCc8LGQTwdRxbsV/WHT7xhghGpJz+wMj
	 S/J0O5xJhooIT8V40vohr5w8agBI2APsr/JTo0MyfTATKcWl8Q7oRWXAcSk4rBSjNN
	 fwq0o7/TRwmI1dIXbCoXU5GRF877ftz8J1Kd+GMZoTtFA3GPP17IporfsLqFAY8FJh
	 UCC/P/93ztAYQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E73BC88E7F;
	Tue, 15 Sep 2026 14:32:28 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 15 Sep 2026 16:32:24 +0200
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Add Xiaomi Mi 8 family
 compatibles
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-dipper-v2-1-cbade54919ee@ixit.cz>
References: <20260915-dipper-v2-0-cbade54919ee@ixit.cz>
In-Reply-To: <20260915-dipper-v2-0-cbade54919ee@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1258; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=E/ElkcIutej9yrswGTSuy+VcChc1d40Fq6rbIpw9sXE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqqVb6lhA63Dif0jFEcWy4Ko7/7FSaU6eausaci
 73W7wdSAl6JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaqlW+gAKCRBgAj/E00kg
 ci5/EACrLyyDxMjkJowF5ja2c+QN5lBpUZlSjXM5NWO4wwBUVH15FuecCU9CKPluHP7CYrOGpJY
 Q5InBqEhcg7Hcfzuus9ke3e8YLVk/bOyUFZq7P5Jui4hPMyJzJYk60RHIqJ7ipr0i5HXKMqIL58
 tvgj25rYMnh3846YPDjuJ5Jl1zcJph/ddcB6+UXes6KoBt6oBhDArrw4Bx4N9aOFy3in8dVafkB
 m1AQR2NZJ6q04rlUpAymHW97FArIc59hYzegnRUQA71e2wBAyDRLMDght1fJ/QG+fUYP83sM90I
 u2z5RIH8WB4Cpg5+8cMp4FIRKY8aCJrT14cIIz+A+oakt0QzvfVyMHFvwuzbqT3nBu7gK3iStJ9
 +T0qexR2Z5h0H1A3fzmrOANiLpKFlvpf8+7MpEic8H5Wrh85Hm2GrtHnedDEhCqcvx+ALnm2YKa
 XExCR+52sXiiSoxTeffMs1zktpkYxar2/eEE1GbtAAsSrbLPlyTliKa+BBCkXXzDWv+j/eVoA7D
 HWUPPMY1Mald1Yi/mQ7j/0J4J+aBFKEhHlTLKpg/YwLCpthIXa7OPm/Fim1Zntsxh2E5zHyVKMn
 iZxmQSRfAiQDx88ytkXuBSXdMx+rVlnYoGBPQHoAjT/g8UVZLG71iTNTy9AamdxjjbVuy68ZMRs
 gIxAxrHGKCXCz/A==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

This smartphone codenamed dipper is now supported by this series,
variants such as ursa and equuleus just documented.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862d..c3491630e56d1 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -945,16 +945,25 @@ properties:
           - const: qcom,sdm670
 
       - items:
           - enum:
               - google,bonito-tianma
           - const: google,bonito
           - const: qcom,sdm670
 
+      - description: Xiaomi Mi 8 family
+        items:
+          - enum:
+              - xiaomi,dipper
+              - xiaomi,equuleus
+              - xiaomi,ursa
+          - const: xiaomi,dipper-common
+          - const: qcom,sdm845
+
       - description: Xiaomi Poco F1
         items:
           - enum:
               - xiaomi,beryllium-ebbg
               - xiaomi,beryllium-tianma
           - const: xiaomi,beryllium
           - const: qcom,sdm845
 

-- 
2.55.0


