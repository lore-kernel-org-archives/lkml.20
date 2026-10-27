Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793085284;
	b=ijrLs8y2LSTmo7KibHnMbb2DklSO8mCzWw77NHQeAjOYZM8Qpzr8KDaXsuFXf1ZoAZU1
	 Rbktz1gorPPE6dC8SFlcx+4tUUajmfRC8W8CONmQ3frh7FeScyLWzb2D1BvhBCQereNnw
	 wtg9MKdTQsmp4bFFf5ZQNLnDL+PWZgaFLH7go1WcfjQIWx7oRYE4aqNYPDM0if81/yIHv
	 moqSFV38G9pm7OXQfRESHcqDTomeLpZuqnj4CH+dfhMBHxvulUiYmDsjNSsPPtmxlRNAS
	 eMSX6qoE0Gub43+UR8F+v6IROs7qBgfO+Aro+JK+mXe+jNexxJD3QQAfwtr6MTMn84g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793085284;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=QfvBYYc0efq9V22PVvfJIeBpBZhh2Ufu1fAY4WUWrLs=;
	b=lhXVsnLVH2vXOcqX/1rHUMIQn01Tzhq3XSbPzD0bhm4hUDYDT0yc9jSXj2ZWkRZm8rxM
	 NrIehB6sOJcl7p/0CAV1onjLYFPZ+axlniSpVxJv/NYmcdJ4wB2xHz53yinLGDuawySB+
	 /eZuEnMx1pHe92UMXsARpIp6Y/4/3iHB2fIx/EEkriqx51T+kbfJWyDKzfjE08DzbFPlt
	 Uh4Z46OZZkO/7ISG0fKWF0KD+iqH9Ax9Eu57frP7v+NpRvcuVvNQIKpkAMSIf+ETOEGhE
	 UpCdjtOJDp7rvkpgwjXJ5zFsIyTVCYVnJhkxUud76RR5lIURP8tMVnG0nN+2gWNGdMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LBmOBb78;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D889D606A31D;
	Tue, 27 Oct 2026 07:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LBmOBb78
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793085283;
	b=Z6S5zk4K0PzyG+igmbEg1URJEcncJrQxuCQGShw2k0qLtQB/JX5PSCpiw6FggHROqWHJ
	 CEbGIYERuIsxl+9lIuslxbogTUzV1IMrrjEpMslZQMLUruPTBBw82UKd8AJNzM3lpee9C
	 ving1t0NdZqlHpKmB9JROWVfA2UsmI0ZfqAujhWzjW/Wn2UsuWwhB/0+IYuum0Z9se09x
	 S9A1UkRL2xq+mwjSVmADcLVRcIlfDNqe3fB5X4wrg2uKe7n5+hj+3JYW1uekRg9tLCUsq
	 hlxPynjLcyaqTX/AAvJ9nA4BlgeUNyBpMedCeg9zIcZBXOKthXiXxK1ATkglhSuKLqQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793085283;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=QfvBYYc0efq9V22PVvfJIeBpBZhh2Ufu1fAY4WUWrLs=;
	b=M+nlyfM8sB1F6r4ZssIkTtz3Oby+3M/wjej72NEHDJCoaHIwk9m/W1ernI+CuIPEr1pq
	 FwzfgV2BK1LmgXNReHAFQeXLMCXo2HKaBGoKdd35z0HChvCiL2NFLliZyN7C4cu05kx2I
	 B1FVTECWUzQjRkuy+KWfquCgZSZ4g73Tt9hj8YQKQi95CVHNhSaS1+DC12xvm4LnKVG7D
	 Tk/pdHwys8+6y+FThPEj2AeUjX3aJpvSHTk0gQuymJOGzs5E/+7pNW2I4bLr8acj6stj2
	 QrdoWqfN2Gn5oHQ3Ln9oeax+x8UehwbKqSnZdgQRDlVNvk70F64lJflrLty/7jdB1zQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 942F01F01828;
	Tue, 27 Oct 2026 07:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793085283;
	bh=QfvBYYc0efq9V22PVvfJIeBpBZhh2Ufu1fAY4WUWrLs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=LBmOBb78Gg8tJvTp//fgHI9d/Fi4c2PKfhYf7HIHy2Wyiic6t1S3xpgo983Tqg1+4
	 qsgL6H4UEmG+dABsd0o6GZ5e+yOx8ygMtg47OZ1P1ExszGCM89UY6+KIYUER7oXUnS
	 d6rAlxMJJkT3qAYibzLoLR8nrSiREYpWbv3DmVP/FCgvvRFVxo3E41tnywkCg5e5NT
	 /clRY23oUM7VMLkgR2DvuQeFI0kY018SSpAREa6vf+DaZdzsk5AaGzgWvFf4KJBCLV
	 7tpK+v+Ad8NHcyCyvFZgc5upSD7IxZXtgATmwDncQwDKDVwTQTH3D+0jOwBOqg+nNm
	 sSbSkBhvwTRXg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 160AE4500C;
	Tue, 27 Oct 2026 07:14:42 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Date: Tue, 27 Oct 2026 12:44:34 +0530
Subject: [PATCH v4 1/5] dt-bindings: display: msm: Document Adreno 620 and
 its GMU
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
Message-Id: <20261027-adreno-a620-v4-1-b0095e028c76@brar.si>
References: <20261027-adreno-a620-v4-0-b0095e028c76@brar.si>
In-Reply-To: <20261027-adreno-a620-v4-0-b0095e028c76@brar.si>
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
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Ishu Brar <patches@brar.si>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793085280; l=1843;
 i=patches@brar.si; h=from:subject:message-id;
 bh=BP86lVdcm0Y5lpDYZFJH+TzMLk9LJckB/Oop5erD9gk=;
 b=toBJUnKr2/O0EsiPSL5ifVFZ8X4CY1HLOeJNiYnJ211w/LF9cb2wkhYxqhH+uQcvmt7znDnhy
 JU6F9m0Zr+lCHNVXLsc9m/Lc5uRerE80c6W/Rw08Okk6pHTsURuoz7F
X-Developer-Key: i=patches@brar.si; a=ed25519;
 pk=Ds+E23E3ntzjPzuBDyVRkOouclcNI5k75R+N42yJtCk=
X-Endpoint-Received: by B4 Relay for patches@brar.si/default with
 auth_id=1189
X-Original-From: Ishu Brar <patches@brar.si>
Reply-To: patches@brar.si
Content-Transfer-Encoding: 7bit

From: Ishu Brar <patches@brar.si>

Add the Adreno 620 found in the Qualcomm SM7250 and its GMU. The GMU
has the same registers, clocks, interrupts and power domains as the
650.2 one. As on the other A6xx parts, the GPU clocks are defined in
the GMU node, so the GPU node has none.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ishu Brar <patches@brar.si>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 2 ++
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 1 +
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 07f0e547b43c..3478adebde3c 100644
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
index c30de7feb447..cf015fdee841 100644
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


