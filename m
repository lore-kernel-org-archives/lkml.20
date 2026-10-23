Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792749215;
	b=CA6azY19rQGrYQNVksJuz6wO65yzs/xhDbTSJwGLvJNSIXq/tuiY6XcymtC8swNm6pG2
	 EcbqlfLSq4+g7IWL005SLGs0LQzYa9hxQ5u9NoXcy8nYkaGTUufVaOf1+3bwn0AVVJeNd
	 1aylkzsc0REFbsIXBshxzExYddvFw84NpVQ6Vh8gv1nA2LfEh1u9EPnwOsGM0/xjRhBBN
	 8pyno6QJkcuYl3vm+7gXEjlAC9m3VAxuyl+NhLfOsVSnwpwT30rMV3hLRx6GAMbgEZeKj
	 ftSb1gFvd6Ol0TZ9tqI3e2ZdhsMdCDPAl/jmNqaJn+CrfAxmMFZeofBmW6JJPhlyhoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792749215;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dUrTRiB6a6KjKPKdRXzNwQlX1C6Hobxw+2BixQH+gvY=;
	b=nilhs6Rw0rB1RJsYQY7Wi80st/l6iuBDVGWB9/0h8NnML7QJoK4EquLlKtAhTKNwlLq2
	 MjGwzE4PkNLkuX4M9HKAMU8RAZMx2u3oqt8f0i0ptkpWYYu8SgVADVLLv62LEhDEf9DCT
	 5noP37fXRVWBVPz/Sgglh8aVEI41eMQCrxenG2zzEtrlM54JTkZmE9nbmgGdmZwFUDuBc
	 OgU053zELhgJKCh0DSQjFZB1hteu5Wh+fMQM7IE+YSD7oZRo8XBXih0YCcN3unTn+Mt/T
	 GkCAw4n96qFHu3bHfEWvNfd7A/pIsACogzI4fIcKMc5Ej5N3nMuzOQiNFnR/xAfrcNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I9JlhZVL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA95606A31B;
	Fri, 23 Oct 2026 09:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I9JlhZVL
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792749214;
	b=WPxNbaGYt6HooQ/D+V5Vj0GtEKDWAcmduev7KYfpL+Vd7inAlSBBTi4IoDt7iZ6aPBK1
	 5Xsfg4T++Y4EO9ybeU1TYKaBl5KNVUayOvfm02E2JUfqzHPvCsK8punOGsct6lXBqi0+p
	 QvcjdHKHVqyyDOar3qX1jfbUQZ8V4IfLBTszuX+3lwrAIgjawd1dvh8TlcbIMaxHvqv2P
	 jh8jnW/ixatKDG7jky1/lNpNbLP8sFq9z6EhVX9IckydJw1LjkuXzKiXMSoGc+oE+AUVw
	 Q/oBSOt0gljE308ocWzHLW38i2HSYcMoax4bzlSIS3rSfV4gcfIU6m9yVE5nxB6Op1A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792749214;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dUrTRiB6a6KjKPKdRXzNwQlX1C6Hobxw+2BixQH+gvY=;
	b=ctH7XPZ21UWDFagN9Hz+rZoqgYJQBwvruShEXOiYj4jGux1MnZTFY/dngbDKkK8TB+by
	 IG/2n5QZPpKXQ6+Ml5p4VqCWgu4xFk4+QrwX2/+IGf8IU5bw8gt7wIcl+QoxJWG/+O7gJ
	 Mf4z6oW0UFfqztyXouwUNSfQO/mC9myMhdvXWvz0qYvFgYWrlOzQWLlZIgbIVRpLtZNRT
	 PQCBt6YNnSJp4BW6I7cT3y4ThGE/oyIoDhaDASXR/XXcQeKIOHSAfyoKbzkiAQiNumX8G
	 B3NsG21fMP88X9zRjobkyr1kczW9oIJoZtAxfhzVaIM4f9hZDhzjEdIv016zSsnnKuA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 470151F031E0;
	Fri, 23 Oct 2026 09:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792749214;
	bh=dUrTRiB6a6KjKPKdRXzNwQlX1C6Hobxw+2BixQH+gvY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=I9JlhZVLDq7qpAL/qo8GmwwuwyJeSCYJV/E+ZHSf1hem/vzVKH8hyt1buvY3DtY+F
	 cJlLJPuh46Mrb8FC6XuZZ5ZgHV0pQsjFNEioH9026RiVY2CTqU0K1kCoYPQg624Qpg
	 QxPcQiQeXgxEvnZ06KCBmday1Xctnb6Qp0qqSGMmtc5oTzS5jZ4vNoi82wELnyxXb7
	 dsf6BdkM/KL85kXgQVQSHzzd5PLuAebYwz7r7AbirmF/WqVb9Ooo2JAu1zy29fYkhq
	 Xe6d3I0k2Zo4UUsBN1kwZD3tcorY536LwG7oZoRQilirf82AhZta2AFIMyeZ4x0pJl
	 FYg9yUR4yFVPA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B742B44487;
	Fri, 23 Oct 2026 09:53:33 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Date: Fri, 23 Oct 2026 15:23:31 +0530
Subject: [PATCH v3 1/4] dt-bindings: display: msm: Document Adreno 620 and
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
Message-Id: <20261023-adreno-a620-v3-1-2d1d566e5e13@brar.si>
References: <20261023-adreno-a620-v3-0-2d1d566e5e13@brar.si>
In-Reply-To: <20261023-adreno-a620-v3-0-2d1d566e5e13@brar.si>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792749211; l=1758;
 i=patches@brar.si; h=from:subject:message-id;
 bh=8eTnNvhKpEjMR4UE06ag4D//fKmp89dOdFVVH07JhJ0=;
 b=kYPvnrZqpMRIFJfmX1pY4KuM6AZmzRANev439fURmGYqzUxzVfRBCqpHY0WUM/CkVGGDHmcCM
 kkK4J8YWgLFBFLrif5oqKwEhQHb2TGHR8d8Ulo/tkyDlt7SLtk12o+K
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


