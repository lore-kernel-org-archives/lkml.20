Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDA1446C19;
	Thu, 15 Oct 2026 21:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792099510; cv=none; b=XZ+TeE/AsCAguC3oYg0X1kxNhAHxiZsOsJEGIEQ4S5VpGkyksdTwylaDu9gxh44arc10lUy18dRhQG1ux/GT6RjflSu2nxaimJPdjsHqWER/Ry4FPrVxKgo2giud9hZfjN759+cp+RRh960r7QFjg6L3HT2E3bZmL4EwwE/930I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792099510; c=relaxed/simple;
	bh=peQrH3nrPLx1lE/mILd2HGtwCvUjK6FyPhiuWR+heqs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ofw9ZANtEa6pWkVr/syrl+WOkRCrzcygJ86QoeU9HHf41PEJcpirkuR7jjmClLusWb8gwOjJA12qyuphyAB+VW8wu1lIPE7FiMcfSAKfv/B8k7kOscbdZ+ump2cprhHW1K8fOIjUzSY58AL4PFcZR0VKtm2a/tmG8LNN3iFtIew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LRASmd6o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LRASmd6o"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4923C2BCFB;
	Thu, 15 Oct 2026 21:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792099509;
	bh=peQrH3nrPLx1lE/mILd2HGtwCvUjK6FyPhiuWR+heqs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LRASmd6oQBP4Z5lfFAYCrv89vpuLMBR/M5MZ5cGZcgiOMGiBgOMlY3aZ/VSN2n/oO
	 nmsaajPhEZUV4uhzONSBBQVhW2tEr8ccxqgdNkoVJIvjQQcbCHcwrHaD/2GzH19EEP
	 niBFNL4lbBAqWXsjerxMB6RbiKV2vz/WhBv5bW6CWNFWsWO4aBb+e4m/pfByb+N1bR
	 haehTRQ0SLP8XNStxTg6LoadjigUA6rLdb0ASWcPZ1owpWI49twGJLYmmnAiVh5QEj
	 QvvoEl0Idk/rS6tlHdT3Q/nCC6vx4XTah9bpRUANicmhRMQ23PIlec8+WVzl6+CG7R
	 +f0VEg3gC1dEQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B465ACC6B38;
	Thu, 15 Oct 2026 21:25:09 +0000 (UTC)
From: George Neacsu via B4 Relay <devnull+geocausa.gmail.com@kernel.org>
Date: Thu, 15 Oct 2026 22:25:09 +0100
Subject: [PATCH RFC 1/2] dt-bindings: media: sony,imx681: Allow a C-PHY bus
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-imx681-x1e-v1-1-fd22f5f3b0c5@gmail.com>
References: <20261015-imx681-x1e-v1-0-fd22f5f3b0c5@gmail.com>
In-Reply-To: <20261015-imx681-x1e-v1-0-fd22f5f3b0c5@gmail.com>
To: Sergey Lebedev <lsa.uz@pm.me>, 
 Andre Gilerson <andre.gilerson@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 German Pablo Lindo <germanpapulindez@gmail.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 George Neacsu <geocausa@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792099508; l=2232;
 i=geocausa@gmail.com; s=20261015; h=from:subject:message-id;
 bh=kOFZyF2sftuWkEwjRC1kUSRJpQArgwBXcX+9V+TFh00=;
 b=GlVhz2vLlBxWU8P/XA69q8ENPtQ/nBkpo2eu7ffi/jd12L2Xm7Ky1FS+lq6kB5gS+7WCgoDmN
 /ZAZa5vxgcfCq68pFkfJPMvNdiVl5ievvf+7YyR/DZALTPNYWt6GP3L
X-Developer-Key: i=geocausa@gmail.com; a=ed25519;
 pk=KyQk/iWbxsikewDBh0SwlHI51RvAqahD3loqmRp9DVI=
X-Endpoint-Received: by B4 Relay for geocausa@gmail.com/20261015 with
 auth_id=1199
X-Original-From: George Neacsu <geocausa@gmail.com>
Reply-To: geocausa@gmail.com

From: George Neacsu <geocausa@gmail.com>

On the Surface Pro 11 with a Snapdragon X Elite, the IMX681 reaches the
CAMSS CSIPHY over one MIPI C-PHY trio rather than over the two D-PHY
lanes of the Intel model. Let bus-type select C-PHY, and with it a single
data lane, keeping two D-PHY lanes as the default.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: George Neacsu <geocausa@gmail.com>
---
 .../devicetree/bindings/media/i2c/sony,imx681.yaml | 26 ++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml
index 62e7eae..51256a7 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml
@@ -14,8 +14,8 @@ description:
   The Sony IMX681 is a CMOS active pixel image sensor with a square pixel
   array, used as the user-facing camera on several Microsoft Surface devices.
   It operates from analog 2.8 V, digital 1.05 V and interface 1.8 V supplies,
-  is programmable over I2C, and outputs 10-bit Bayer data over a two-lane
-  MIPI CSI-2 D-PHY interface.
+  is programmable over I2C, and outputs 10-bit Bayer data over MIPI CSI-2,
+  either on two D-PHY lanes or on one C-PHY trio.
 
 allOf:
   - $ref: /schemas/media/video-interface-devices.yaml#
@@ -54,7 +54,14 @@ properties:
         unevaluatedProperties: false
 
         properties:
+          bus-type:
+            enum:
+              - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+              - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+            default: 4
+
           data-lanes:
+            minItems: 1
             items:
               - const: 1
               - const: 2
@@ -63,6 +70,21 @@ properties:
           - data-lanes
           - link-frequencies
 
+        if:
+          properties:
+            bus-type:
+              const: 1
+          required:
+            - bus-type
+        then:
+          properties:
+            data-lanes:
+              maxItems: 1
+        else:
+          properties:
+            data-lanes:
+              minItems: 2
+
     required:
       - endpoint
 

-- 
2.53.0


