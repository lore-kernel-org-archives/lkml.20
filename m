Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295A74A4F08;
	Fri, 16 Oct 2026 12:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155304; cv=none; b=fX1IU+yIYWsmdqAyLu3i8mPc5NpH008ecB/DtJTgo2nZwYLJdLlPRll080ZaqZefAC+F0+joggoZnfbHN/8MF2AbbVLDmmBEMkO2ykCzhjicc7TZC6+f+dbBUWCHD/U27OQy9wKuMjgQFv175WU6ZfFrbyaNe/xQ14jUK3WlQ5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155304; c=relaxed/simple;
	bh=Qi17AilogyYjfb7IaUw9hyywG+v6NW/1FEa0Q4Jp+2w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X5xRu5Kc4LTbJuxGWkbHSbgtbwJodeQURkco/ofTPCSFB/xX8DTBIhBKpMKe8MrCLTO8eKrfJOHRHxhgQQDW+X/O1tGpzZMsleU/IcIkSWhnjsLW0PHZcZyvh/VQyxmwkViAcgQ90hJDOkoyyBcfFT9/leU9dt3CH7ui8+YJGPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XneTzLFV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XneTzLFV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4AB4C2BCFB;
	Fri, 16 Oct 2026 12:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792155303;
	bh=Qi17AilogyYjfb7IaUw9hyywG+v6NW/1FEa0Q4Jp+2w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XneTzLFVWLy0MUG2C5l23O357VpuYSAoigTzVAoenOs8plAVoL16WZMZ2GyKbY0T6
	 4tE/c4dal1IykdwZW1Ir4je6EJZLDxDzAmy1iqv5x8jSph+G9mNc1ojkRClhlTz79O
	 b1p6ME+6LN3uoRPIeGt7jjclOAqDB0fMtaJ7heLXyFbm/JabbX7g8aR0vRoPn3HEbr
	 nKf+UVD75c2e4rsXp6O4O1R0hDwp268JVBDBuSmq9effe8RboBHuqyPbwOUlsWgz7+
	 /ZS2eHFAyIAbNUXKqYAQjmKxFMniTQZk2/qTFfbhGDX6xch7O/OFQIqpNdOxu+An9d
	 QKkRCIOEZSvSg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABAD8CCF2C1;
	Fri, 16 Oct 2026 12:55:03 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Date: Fri, 16 Oct 2026 18:23:11 +0530
Subject: [PATCH 1/4] dt-bindings: display: msm: Document Adreno 620 and its
 GMU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-adreno-a620-v1-1-4a7ed6210d7d@brar.si>
References: <20261016-adreno-a620-v1-0-4a7ed6210d7d@brar.si>
In-Reply-To: <20261016-adreno-a620-v1-0-4a7ed6210d7d@brar.si>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ishu Brar <patches@brar.si>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792155300; l=1758;
 i=patches@brar.si; h=from:subject:message-id;
 bh=8eTnNvhKpEjMR4UE06ag4D//fKmp89dOdFVVH07JhJ0=;
 b=lCY1uQGiarE2Uo5RWJbJwgfPoMTT+DEl4959T6O/cuNT8183u47wn9n4TMVRYQOfwUkw0cR+Q
 vd1Jsuf5TvyDJg5SO18Wcgqj2xhStecnYTPm6GiiBjXfRhh32xXlyFK
X-Developer-Key: i=patches@brar.si; a=ed25519;
 pk=Ds+E23E3ntzjPzuBDyVRkOouclcNI5k75R+N42yJtCk=
X-Endpoint-Received: by B4 Relay for patches@brar.si/default with
 auth_id=1189
X-Original-From: Ishu Brar <patches@brar.si>
Reply-To: patches@brar.si

From: Ishu Brar <patches@brar.si>

Add the Adreno 620 found in the Qualcomm SM7250 and its GMU. The GMU
has the same registers, clocks, interrupts and power domains as the
650.2 one. As on the other A6xx parts, the GPU clocks are defined in
the GMU node, so the GPU node has none.

Signed-off-by: Ishu Brar <patches@brar.si>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 2 ++
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 1 +
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 07f0e547b..3478adebd 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -217,6 +217,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,adreno-gmu-620.0
               - qcom,adreno-gmu-650.2
     then:
       properties:
@@ -238,6 +239,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,adreno-gmu-620.0
               - qcom,adreno-gmu-640.1
               - qcom,adreno-gmu-650.2
     then:
diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index c30de7feb..cf015fdee 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -435,6 +435,7 @@ allOf:
               - qcom,adreno-615.0
               - qcom,adreno-618.0
               - qcom,adreno-619.0
+              - qcom,adreno-620.0
               - qcom,adreno-621.0
               - qcom,adreno-623.0
               - qcom,adreno-630.2

-- 
2.56.0


