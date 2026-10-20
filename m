Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506058;
	b=HQh2oSGqB1rJLO+UPSqP7hEs8ke4PvVslNWxcHnNvGrLo+JQ58jMl3xS6YKBtXbf7dmk
	 aZKNNQo7wKJ5dFX/jvOzQvy6LdO5vMeCqlTSYQIrTsTUH7xINql27l9aQ4wtuGDfVe2qF
	 RD96pZhuxWtCjcCvL0cBJWPSmZ0DOokvzuLbsYtVjwjPHaLev2G8TBP407LEPDDtPmL9L
	 3V976h8+SCrtOxa8YW3gH2jZFIkV6PJuVuQdVEJrPiESzWh4KJrSqFpBtBlHzHh5ezAGX
	 wyg7gakInWLZoRTuaaPXC4ddRCOuhMld93snwY4NYynH5qtFIUH2YEKepLnt6yH+4dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506058;
	h=DMARC-Filter:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=jlnB32LCHA0I4qZyo/tYM1nPEXySNpUnvzRunyvEwr8=;
	b=q4pcPQtNDBZnH2tG6wgy11eYaKN92MfR9IVz8na33+ksvSGm0hRkxRRUiYTXz0LhGGeP
	 odG1MrjONp5eygdMvpy53dwUtFBKfKEL1hagY+ZwSLGiR/Tix1QJfzUsTRYZnOs66iu8y
	 nH9HbDJYYBkK4qoa4tHLUk6IJ8nrQ1VFfWYsPFpVacqoFy0xACTv9X2BADau5XI06NIZ/
	 cCbzzNkv2ev9fmBi0s5P5DlrmbzVvjwlz/FZS58jpxVJL0ltZI6HnYb8OHA9rSlv25wOM
	 yLeREgPxW4rJKitnKAnNr0vQbWLwHoEHQaEkkf0rLM9WoHLvPZLlVqrLkItavpWDBIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mentallysanemainliners.org;
	spf=pass smtp.mailfrom=mentallysanemainliners.org;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=fZDhVZdd;
	arc=none smtp.remote-ip=34.202.193.197
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBE5606AA10
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEBE5606AA10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=fZDhVZdd
DKIM-Signature: a=rsa-sha256; b=fZDhVZddI8ceOsbg37CxNvwy7s0P4MyzIL1Ta2ICf18M/0nn8LoEj+MMT5G6R/PLzwNMdT1RZEIjhgdVs1WkfJK1peyFUU6ykPZRiDr6VuKsn3b7qKUIY1FgDuvt3ibD8cOpRCs3MSr4DdRLihhLrNe1TkgOumpUniYn9TICriK+IL0w2pG8S5W9vtpyYHywMjvd/UjzwnF7ucz+Wl2aD9oI55ZwigngTiWOxENgRmbO7pdn5iL1WAV9MKuxUyAZ9V3QtgS8xQSq/djsg1MKzsZTsYMYJKgIYCeewQkP9PCiYeQGI8TCA+fQAOz8/JpqMmkfYCYMwiAoNo6fyyI+zg==; s=purelymail3; d=purelymail.com; v=1; bh=LlB6iypx0SJ2C2sZVr+0cmFUBBfczV79VPZDjZQrLmQ=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-kernel@vger.kernel.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 913581972;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 20 Oct 2026 14:19:40 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Tue, 20 Oct 2026 16:19:14 +0200
Subject: [PATCH v5 1/2] dt-bindings: arm: qcom: Document Xiaomi 17 Ultra
 devices
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
Message-Id: <20261020-nezha-v5-1-04898d6b5f80@mentallysanemainliners.org>
References: <20261020-nezha-v5-0-04898d6b5f80@mentallysanemainliners.org>
In-Reply-To: <20261020-nezha-v5-0-04898d6b5f80@mentallysanemainliners.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792505977; l=1043;
 i=igor.belwon@mentallysanemainliners.org; s=20251104;
 h=from:subject:message-id; bh=LlB6iypx0SJ2C2sZVr+0cmFUBBfczV79VPZDjZQrLmQ=;
 b=8RE9seNC8ZKynL4i1jgbC3wPaJJhVoBvvg7LzPZacv6zSa5EpE34bF3l78kc3TqB60Rdrf4p6
 YS3fvyyWEOgCqzI+i4KlrEQeDunIpS8A4THqgjSt2BWjkPaW2J4ZqmQ
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

