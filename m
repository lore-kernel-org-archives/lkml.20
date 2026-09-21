Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12EA247280;
	Mon, 21 Sep 2026 00:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789950403; cv=none; b=aESP0uSQ6xGzZMLg4NE8koaB9Gnaz5VBqv59dYB9uCSOWeZ79s3v1XC1lAizOPGq05b4pTE18QhEQp9OsBv2y+AQg/DJ+LpjuGSyfr/391NylV0R2QdeioJbLa2XOk0maflMBwFTcppLwLjjCc7iyJYWUceyO/iOEjWCFrXaTbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789950403; c=relaxed/simple;
	bh=xE4iQ0PrzGa2C9UPEClrIlu7Uo4/8EFZTS/HoDiSOJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rgH0+liEMVpREqxMrDmS4kSj0SLynNlD5q2lvMVLqxeJwhdFxhOlSyeZvFu0sOAqg79p7ONkQ+EaCS6dDSN420e2i0OPGNZlUCYoCo9a2qcVkj0INRBoQ47MQIegiAJ781qxteqAk9c8EgcNRs5xi87yQ5zVvAP9lla120jXhRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pcL0WDjj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pcL0WDjj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8405BC2BCC7;
	Mon, 21 Sep 2026 00:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789950402;
	bh=xE4iQ0PrzGa2C9UPEClrIlu7Uo4/8EFZTS/HoDiSOJU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pcL0WDjjlOTmxNTeTMmYeqior8sRZ8hh/cp7PPmru5W4RgaygzG/Lo3YngNmzWe+B
	 /4kCoTRskG2Wdc1TALZ7tTKhKwJidCnyx+4jyOW3cDg/6Wh2v2pCNntaHAlF4RAKRU
	 5OCfkMu0EWRGEl13OG7FZpBAV8P9DOqW+OeNyDiL9Ic6eH8yiZTvLfiRuXvFI4V1dQ
	 or/szAhbfpxqBBHRmUEO3jSbEpILrqENxjiwzNxsv3cEuLyMBa46LF1frFWRP8mLfH
	 iyMvwbdC7m6IQ+Iazf7dPRrUQdYl/ADHVKRkzCz4NvXLqiLWlX7SYaBnQSnk5N1NjI
	 I0IVCIm3iiNYw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72D0FC982D8;
	Mon, 21 Sep 2026 00:26:42 +0000 (UTC)
From: Nicolo Giuliani via B4 Relay <devnull+nicolo.giuliani6.studio.unibo.it@kernel.org>
Date: Mon, 21 Sep 2026 02:26:42 +0200
Subject: [PATCH v2 2/3] dt-bindings: arm: marvell: Add Sophos XGS 107w NPU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-send-dt-v2-2-fb6b81002ad7@studio.unibo.it>
References: <20260921-send-dt-v2-0-fb6b81002ad7@studio.unibo.it>
In-Reply-To: <20260921-send-dt-v2-0-fb6b81002ad7@studio.unibo.it>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789950401; l=1394;
 i=nicolo.giuliani6@studio.unibo.it; s=20260919; h=from:subject:message-id;
 bh=lyDMMre6EWQH7CiEprIS9UxuPjln7GFy4OUwneOalSI=;
 b=XH+pUXfYOL6RW3KhZLUS9vw02g1QOZ+Wz32F90LYLT2qMP4KyByADqVmYEIGFa+Qe97WHG1ga
 XawU60uusXPAG7FuzKQHL2L5NiNGzRHI9893tueFqx6qbKkK7RiRPSd
X-Developer-Key: i=nicolo.giuliani6@studio.unibo.it; a=ed25519;
 pk=D652ecdT01GkA1eoFWNFNX85xIg5ZnFwUWyjfestgQw=
X-Endpoint-Received: by B4 Relay for
 nicolo.giuliani6@studio.unibo.it/20260919 with auth_id=1040
X-Original-From: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
Reply-To: nicolo.giuliani6@studio.unibo.it

From: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>

The Sophos XGS 87/107 desktop firewalls combine an AMD x86 host with a
separate network processing unit (NPU). The NPU is a Marvell Armada CN9130
SoC with its own eMMC and SPI NOR flash, connected to the x86 host over
PCIe. It serves the front panel ports through a Marvell 88E6193X switch.

Document the compatible string of the NPU board, with the CN9130 SoC
compatibles as fallbacks.

Assisted-by: LLM
Signed-off-by: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
---
 Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
index 7e77310da6..130128c462 100644
--- a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
+++ b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
@@ -118,6 +118,13 @@ properties:
           - const: marvell,armada-ap807-quad
           - const: marvell,armada-ap807
 
+      - description:
+          Sophos XGS 87/107 network processing unit (Armada CN9130 SoC
+          with an 88E6193X switch)
+        items:
+          - const: sophos,xgs107w-npu
+          - const: marvell,cn9130
+
       - description:
           SolidRun CN9130 SoM based single-board computers
         items:

-- 
2.48.1


