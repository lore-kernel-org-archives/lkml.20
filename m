Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793051880;
	b=vwShZRHuEniFWHqXmWwbqBzD+GS2gQ3f78A8wyyphmLedQmgbw9Jt0duYnf1GR62ihkm
	 oc12O4lCizH0YgRi1tlN99eeUdV9+8KxtS7RSwCy1orbzGSDfjfZ/z/HxgEaA+QnMI5oZ
	 PsW76diog6S7xj/UFwqnBKluOBvhsFg5201pkHytCvWFgrj+/aN+LWJPKK/cr0utQiGk5
	 xD4ABK6NHCkqCh8b97pKB2k3RYIDr8wXSwrNq5nFm4C1qM6lEsrZULXhB2TWWmcth10LV
	 6u1fnkQ3zs5p/ruQDDi5P+IfKp5LlzD4CbMQpfQI1lx5U/mlXW/TaO5k9cUGIQhF2nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793051880;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Date:
	 Subject:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=GMPgA3EBxmbirXr7ioFEKqqBpPi8WSoOiSXXleNvfNw=;
	b=yP5LldYGZzl/EKFMGqukkI9LUcJbAoZgShKVRpQC/RqxkPW9CX33GYLo2EctJjZchtyk
	 0wkHF6IByR/nikX1TXP0jnOoZl21AJTJj2Hi3kF2d7X4BY0precDaIs/qITHwbEpajG31
	 sJ8+FSytAbOhrESWaJuw4w13wbWJDuLUi/artwj/NJLvAmyn2rFf1GsksmSZei6fNSOEL
	 Kx0aVnxavuGdMrlNuV7XVIQpkPrCaEK1+YVYzNg/eLIwbK60CN7Sk831x7vy0fMG/sJmd
	 PzCo8DdkGgu8MDkayV/YAmzmOqhAgm2syBw7ucM+RbWfm27mfsKu0quTmA7XCYqFMUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=tkn9Y4FK;
	arc=none smtp.remote-ip=185.70.43.172
Received: from mail-43172.protonmail.ch (mail-43172.protonmail.ch [185.70.43.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2904606A320;
	Mon, 26 Oct 2026 21:57:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2904606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=tkn9Y4FK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1793051877; x=1793311077;
	bh=GMPgA3EBxmbirXr7ioFEKqqBpPi8WSoOiSXXleNvfNw=;
	h=From:To:Cc:Date:Subject:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=tkn9Y4FKFi8kckoT3QItqsbKbJ3gq4xQoSZL7RSrig9nHxDNF8yiE+KjoK/Lt0VXU
	 /bz9tdFjDf3O9EBZBQYQxFMbFxNe88VdMI9VPegrTL0V0WpVDhuxvCMsQZ02gm1+nH
	 APxqgo+lJ5FbwIxpyT/v4gSRdowBT3bdOJQLV0PJmvEhxTGYcx+eKJ7AaD08c0flX2
	 0wteMDMbQipX/mWWvAKDN3tPcwfKA7pE/VaD+kTKHpSv7GqzShWOBDksBtFY9e+Qit
	 Q4q/u+IcfXVYQ4bmBTwTBycdjLgGfNuXhgh24ySVU8ccTT/pVzHAqyDr1pSujtpMVL
	 E3eWqWAthg/GQ==
X-Pm-Submission-Id: 4jD6tm1dNZz2ScNH
From: Michael McAllister <me@michaelmcallister.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 26 Oct 2026 21:46:23 +0000
Subject:
 [PATCH v2 1/2] dt-bindings: display: msm: sm6115-mdss: Add missing AHB clock
Message-ID: <179305118391.93309.11849204023910016023.sm6115-mdss-ahb-v2-1@michaelmcallister.org>
In-Reply-To: <179305118390.93309.15055947565850813746.sm6115-mdss-ahb-v2-0@michaelmcallister.org>
References: <cover.1792852079.git.me@michaelmcallister.org> <179305118390.93309.15055947565850813746.sm6115-mdss-ahb-v2-0@michaelmcallister.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

MDSS register access requires the AHB clock supplied by DISPCC, in
addition to the GCC bus clocks and the MDP core clock already listed.
The DPU child also uses this clock, but MDSS needs it before the child
resumes so that it can access its own registers.

Add the missing clock to the end of the list and update the example.
Keep the existing three-clock descriptions valid for compatibility with
older device trees.

Fixes: b93bdff44a85 ("dt-bindings: display/msm: add support for SM6115")
Signed-off-by: Michael McAllister <me@michaelmcallister.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v2:
- Remove the blank line between commit trailers.
- Add the received Reviewed-by tag.

 .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml    | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
index 309de1953..d4fac93d9 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
@@ -21,10 +21,12 @@ properties:
     const: qcom,sm6115-mdss
 
   clocks:
+    minItems: 3
     items:
       - description: Display AHB clock from gcc
       - description: Display AXI clock
       - description: Display core clock
+      - description: Display AHB clock from dispcc
 
   iommus:
     maxItems: 2
@@ -92,7 +94,8 @@ examples:
         power-domains = <&dispcc MDSS_GDSC>;
         clocks = <&gcc GCC_DISP_AHB_CLK>,
                  <&gcc GCC_DISP_HF_AXI_CLK>,
-                 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+                 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                 <&dispcc DISP_CC_MDSS_AHB_CLK>;
 
         interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
         interrupt-controller;
