Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792852128;
	b=sfp7Dhwc4922lArQTNKle9/09OP9K7uWtbBs5MSsD2gFsU/VxE8+BjhIt1sETFkK41ob
	 +vQ4m0NktBcteBG9qmzDB0v3PMhVsg+rEwLiQ72x7AUtjyOxofWyjAcWLclX9TdiCQphx
	 wBoUuj0lAX9eFqkIVdgj06dqpdzu07/giAdu17jlaKkeunanHqyH2uSg3X9g3AoyBr/N0
	 HdT34120BGAw/w2I5VHX37PVbzzZHgBid/r7ysQP2tQ1uNLfN6TN7hwFpFr+li3DyE9HC
	 XsMLF/cAM7BdTAtrDs9hHpvzfj6Pdx8nXMYAZQ31iNmLeif5LnEv5Dv1GpMSp566byg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792852128;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Date:
	 Subject:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=zh9RMhEB4nxkzrKhtN4Kf6FgQMlP7iI79irVGvGVleY=;
	b=epYnW63LMN6GNjbKkKw2j7g2hmK/S4bJAZ9HyntzoLvkee2yR74N2sXuB021zmWw5Th3
	 XtDXJu32AETVO/xOy/7g8iTGXnR1j5fqX2REdG+S69Xiy3sbKYdTnUO8a+I5B3DFFBRaB
	 sd/Cq6oRANi0lE/H3WQHIefhrbnzH8tO4XLWYZAZCjCU+3ZNlDSBBS86YM7cZMoNU7fnH
	 GcUEt0BTXwQm54SnNfpmbtPVvDjl7E4gANDWetOkX0QjqvNjzoYOG8nYmy2URkj03mstY
	 B55ci/giFyQgqxLQrv51HmhxKSNeQ7bsQRCu20sUJTzYEchIvVaTbmFnzAjmE0y33Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=aeDj+9yR;
	arc=none smtp.remote-ip=79.135.106.111
Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C632606A325;
	Sat, 24 Oct 2026 14:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C632606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=aeDj+9yR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1792852125; x=1793111325;
	bh=zh9RMhEB4nxkzrKhtN4Kf6FgQMlP7iI79irVGvGVleY=;
	h=From:To:Cc:Date:Subject:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=aeDj+9yR9fw1b2/ES2myr5vsyqdBEy7wvcystlGt2MW1yBKufj6Ubtrw/1JzuatyM
	 M9iNy09iuy6G7aUM8/vn7dkwhbXE/b2Gss8d962+nCZrnJQUrj9p/TcqUENfLZpavc
	 IyHA0qi8bgdVVer4cCJ8WdMtKTjSIvKcyj1uqV+w1GRVe3U/stI06adYN060HedwHJ
	 Yje1p9vhf7tv1pJtE7NMPAlCkQkDR0kZRDpXLoI5m+WPm88Bns3Ef4eZvazLMSar1y
	 v1+j4XdCyaXlDKwhoPQDeowkHrKaN4FxdjzHe90nOKZma9E+mbVRNORB1Q8v1gk+SS
	 Ku0ItHe37Qvyw==
X-Pm-Submission-Id: 4jBj1P5CVNz1DDnZ
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
Date: Sat, 24 Oct 2026 15:27:59 +0100
Subject:
 [PATCH 1/2] dt-bindings: display: msm: sm6115-mdss: Add missing AHB clock
Message-ID: <5326d23102e89b492767862fc7ae027f3eec2205.1792852079.git.me@michaelmcallister.org>
In-Reply-To: <cover.1792852079.git.me@michaelmcallister.org>
References: <cover.1792852079.git.me@michaelmcallister.org>
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
---
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
