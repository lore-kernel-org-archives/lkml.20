Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47703285CB9;
	Sun,  6 Sep 2026 00:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788655281; cv=none; b=Gd6FEPFY7V/x0iGb8ryQ+UaS9fYP62IjPlO5UIM+aB5fCVgV/ZvCLwxi6MF66hF0iecl7lJ6Lg2mh99Sxd2Z1zm9bphWGQDotkCgIFDx8tYDPT78cys6E/6JGNnBoCkxC55qV1DRBlpJV8UiyReiZXG3w6qlIo6vjx3081qtH8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788655281; c=relaxed/simple;
	bh=R9E+R6qXmCFU2Z/KrS9QkutGPc4GxBvPP/CoWoUgCes=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q0E2PrmRHy08qtTQgfJNVzs9lPFY6XEG4Q5v0WaUOA4aGfLP0Vwd+nvigh1Y6BpMTZCKnlOBvjBd/grUJo2zlhQIbDj7hxLK7IheTLwpEYIMCBF9hzI9qnsVBO9lvKyxTAqKHqFzNkF77duKDTVPVSLSt6rFfAOu5YhCGTNQxuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HlL/YCcd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HlL/YCcd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CE2AEC2BCF7;
	Sun,  6 Sep 2026 00:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788655280;
	bh=R9E+R6qXmCFU2Z/KrS9QkutGPc4GxBvPP/CoWoUgCes=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HlL/YCcdJV/cJ1wAah+fElb4g04LIjSJIENLEKBBRs29lmHYt11yxydrbouBY09gu
	 eJVWOdsVu/wfRfgxLZmdaKzOBn0LpJOAzaA4mhBX+FD/EEAdYtMdvMpY6dwbnflX7r
	 RWToBWGRs7tMJmV18d2TA/y9VB/1c+jzc9+kEVgqfLCM9TnR9acruo2vYkXFi3dM02
	 Anav0BtGHnEiWCl9XtVmEnShmxCNF4vI33jWTnol7X1MJxo77OLjKnpe9CpyefVBt2
	 He+t6Gopzonh8JO/kRDlyDtPgh3mLz3D9Axg8WU7KJeSGf68bY5Tk+UWk2B7PNNxI2
	 au+FAI+AFUr3Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD42FC624DB;
	Sun,  6 Sep 2026 00:41:20 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 06 Sep 2026 02:41:12 +0200
Subject: [PATCH RFC 1/4] dt-bindings: soc: google: Add modemsmem
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-modemsmem-v1-1-a3634b553841@ixit.cz>
References: <20260906-modemsmem-v1-0-a3634b553841@ixit.cz>
In-Reply-To: <20260906-modemsmem-v1-0-a3634b553841@ixit.cz>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Acayan <mailingradian@gmail.com>, Petr Vorel <petr.vorel@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1760; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=vqaYf4qSxGlGwj04FourVUrqHojhUtgjS5zVQccHpxU=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqnLavH8A1eT79EINjEArRKcRlMijgu1WDfsr/l
 PXO/RGsN6+JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCapy2rwAKCRBgAj/E00kg
 cqEwEACaYUWLxuCN0WmfEkHeuzUtEYFxhSebcWiC3rAFJNtiTWEMJOpLJPvI2xSpMlWbaaVKQ/7
 4FBN4yDGqD9+zDP9zHQorsTu8V1IdIKthqOiRVFWnWLbiqwvDOsdr70QmaXcRxsNqOu5b89ZoDU
 2XarvvPy7itht6d1CyiRsMqCw36oNz6EhnoVUZMGqDrJjQC+m78k8/NfYSXo3feMKDetN9XBvp3
 tX5HGdaKQw869WQl9yMy/yB0FGJbTdDziArffSdKe+iImHEcQYilrk/IMYFNdIk7s735nrcHzFs
 KoUm0uHjcD32fIBcaucvw+rT6hcfS3qRRAo3ceDcfQ9ASGXOJBH19mj2Wmsc9pCFrVhOHDXeezT
 LeMPlYlLMnxmUHW0NyDzzsLWEIPhBB6NKUcrniRhG4U9aFbnJ3t+3TOSbkrWVQ/GpAz6oZmndnc
 y6tjkNS95T5ztKmtiElpD7hYI9hc4i2qaJ9fW0WPd1g4oabwFveYdYou3ViipzxObnsprMA8z9J
 4wdIY9yT8WqcJigRGPA4EL2Pk9TCVgIPs6WnOo8rwzwB10XGBUw7ClTPaXpPD/Aiuqbn+WFq/3a
 lHYXV1Y0yFFR5/wxI1stjh0AeVVcHNHYb8VHHAyrNcv4R+lSPNE2oVZxi66DdVmY5WyUgd9tK19
 BrBsfxiVhNgEQtQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

The modem firmware on Google Pixel 3 - 5a devices expects the application
processor to publish SoC platform information in a vendor-defined SMEM
item before the modem boots.

Assisted-by: LLM
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../bindings/soc/google/google,modemsmem.yaml      | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/google/google,modemsmem.yaml b/Documentation/devicetree/bindings/soc/google/google,modemsmem.yaml
new file mode 100644
index 0000000000000..a5214a8093ba0
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/google/google,modemsmem.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/google/google,modemsmem.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Modem Shared Memory
+
+maintainers:
+  - Richard Acayan <mailingradian@gmail.com>
+
+description:
+  The modem firmware on Google Pixel devices (Pixel 3 through Pixel 5a)
+  expects the application processor to publish SoC information (platform
+  type and revision) in a vendor-defined Qualcomm Shared Memory (SMEM)
+  item before the modem boots.
+
+properties:
+  compatible:
+    const: google,modemsmem
+
+  qcom,smem-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Identifier of the SMEM item the SoC information is written to. Google
+      firmware uses the first vendor-reserved item.
+
+required:
+  - compatible
+  - qcom,smem-id
+
+additionalProperties: false
+
+examples:
+  - |
+    modemsmem {
+        compatible = "google,modemsmem";
+        qcom,smem-id = <134>;
+    };

-- 
2.55.0


