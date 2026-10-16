Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9784F582BAC;
	Fri, 16 Oct 2026 17:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792172315; cv=none; b=SYdlitMsOwiuQjVdqhFU0HfocrRCYkcbctE1lwP+dYAdPwOz8DHMm0tEtMML6X5F6HhA73beIf7ou9l14n4qZBVzgCBeRLhAwd7Oe8so8t1LBfDP7unl7OXnjoXPkqpbvPwuJgUMDlo+N1LIY/IARCXkjZSWSUtqRl6K02lxiqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792172315; c=relaxed/simple;
	bh=TrdLOVS+kkSe+xLM9w5zf9ng53kF2srwRIVlxkVKxM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h1tbS4lQLxjl3gkUfALXDv1K3eKaXAR4ROE4T921dtl9rnYu5O3GtsHY5WGEXINAiLhLBX/cMKdqFMEN1Mm737F1mTRR0GmMjwITAjGEGFgvaFPos6EOXU5E4i6xTFX9Ha1gQjIK4DVdfnZvxrwGQJxFXtVWTi4drbDClBsu0cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fG/csMht; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fG/csMht"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2AB4CC2BCF5;
	Fri, 16 Oct 2026 17:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792172315;
	bh=TrdLOVS+kkSe+xLM9w5zf9ng53kF2srwRIVlxkVKxM0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fG/csMhtlu4aqlfvGeqRKZY08vqqbldFtip+rbr6sVETFg7hXjViEhqo+/gbeiH2L
	 l3jTFsp8fnwIFBr5qbm0wVg6E9F9FgnryW3xI7gEPSRY9mMkjW6Hw1/3UAC3dRXISv
	 HCN7NoKNfMoYofMN+kyvyBZn7pmIWqbhgo8UKftsR9h71UuppOfr9CUF2jedLEctJp
	 TTkqWxFwE62uBJmbAW1gF2bwcDwhX+yN4ghT2SLgOxpiDQFkbChcVZEFl3EVo3nHb3
	 dh8SX0Rmm2tZi6ZDMxUqVm+LZ1j9Tiltjxaj0Xuqntb3uRsoFPHDKbyKkMyLbQSOjJ
	 2oQFmcjccDjWg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07CEACCF2C0;
	Fri, 16 Oct 2026 17:38:35 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 16 Oct 2026 19:38:33 +0200
Subject: [PATCH v6 1/3] dt-bindings: media: i2c: dongwoon,dw9714: Document
 DW9714A and V variant
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-dw9714v-v6-1-ae730c77bfb1@ixit.cz>
References: <20261016-dw9714v-v6-0-ae730c77bfb1@ixit.cz>
In-Reply-To: <20261016-dw9714v-v6-0-ae730c77bfb1@ixit.cz>
To: Alexander Martinz <amartinz@shiftphones.com>, 
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2393; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=MctnB/YBUlKBkfY6HkmVWzrj67EeGRulizfUpQ/8RY4=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBq0mEZGjzQWm7pugnXYSI5t0cbILpmJn+9vJA3W
 R63z150G0uJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCatJhGQAKCRBgAj/E00kg
 cmWfEACTrD1sgz/x20f4cXVOD3STWfIkCm9s5xY0nI37DBv3FzXuyc5S/UNE3ZALSxd/roBdQ0Q
 c+r6fZwSD2riug2apE77jEvd45JSGybE3foTFqNa5rlhyQFqA2syY3z5wv++Rst4LdBEvHYOUZW
 aQEq7i0esNHlhqp1t65jVUz9Qk/PCw8zDB8HNq6z5++yrXkrx4W07/Z4501CajECA/yAExLAXfG
 QE9DauqxDkKTjjlBTUYWHl8LeINukM1ZUcSKG7O1ss7ta9/7pSYVmdzrk4MBE1J8Ik7Ude8hWPk
 xKokM0Ejt3Ma7WYkF6ctNH8tFAZOoMoeNgQXl0YexV247oslIoNBjnDPlk7LwDdca6Ztx73Duvo
 m5Y4GMKFIlgkjgsUNDwd1XUTb8ShFU7u2AuexVH+DUgMlubQWQrvK3GhdVYGWYBeR0FmjW5PFm9
 vZNL/dzycDNnlBgNJnUuu4Y8SNMDuv8L3ddhyZQ8nMw56rewz7wLUCWFVefXtIZKhxh/CPxYcY/
 97euTOFzJk7BwTWZWgMIBAn+vdrqUi+bJL2UMZzbRXHvj3Y5aSJG/6vHdKRNv/o4HIFHiiVHCHl
 88nxJG3Y1PHWP9mp7ytLcFL3ofzFLTIOMk5/aQlu7JQ7FwzlBSuAQ/U78yQzXMQT6mIRkydBzqM
 LgCDmvrGcgZGxyA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

DW9714A is a successor of DW9714 and DW9714V is a successor of DW9714A.

All three are compatible in their normal mode: a 10-bit DAC with the same
Direct/LSC/DLC slew rate control. DW9714V additionally has an "advanced
mode", which exposes Smart Actuator Control (SAC2/SAC3/SAC3.5/SLSC) and
soft start/landing. Out of reset the DW9714V comes up in normal mode
with ringing control disabled, i.e. behaving as a plain DW9714,
so nothing has to be configured for it to work today.

Should SAC support be added later, it is board data rather than a userspace
knob: the mode and the vibration period (SAC_CFG/PRESC/SACT) have to match
the mechanical tVIB of the actuator and lens assembly of the given camera
module. Those properties are left out until there is driver support and
measured values.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../devicetree/bindings/media/i2c/dongwoon,dw9714.yaml     | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml
index 66229a3dc05d6..7c2769e6c4880 100644
--- a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml
@@ -5,22 +5,30 @@ $id: http://devicetree.org/schemas/media/i2c/dongwoon,dw9714.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Dongwoon Anatech DW9714 camera voice coil lens driver
 
 maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
 
 description:
-  DW9174 is a 10-bit DAC with current sink capability. It is intended for
-  driving voice coil lenses in camera modules.
+  10-bit DAC with current sink capability. It is intended for driving
+  voice coil lenses in camera modules.
 
 properties:
   compatible:
-    const: dongwoon,dw9714
+    oneOf:
+      - items:
+          - const: dongwoon,dw9714v
+          - const: dongwoon,dw9714a
+          - const: dongwoon,dw9714
+      - items:
+          - const: dongwoon,dw9714a
+          - const: dongwoon,dw9714
+      - const: dongwoon,dw9714
 
   reg:
     maxItems: 1
 
   powerdown-gpios:
     description:
       XSD pin for shutdown (active low)
 

-- 
2.55.0


