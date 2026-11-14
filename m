Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794654570;
	b=g9vkNrEEmTsFZwqwHR/jGTYrdVANTMIzGb+t2ZfgymNyyByWhEAVMEyDEvpzbownAGCO
	 4NVSW14mVExAZxgoA3M8wlaJLqubL3SWbhYrHUQTZBU7VaVMkls8mKgQOYMDN88Kp9afy
	 SbGp6l/MQwWmxnEeXr6E5sh0s2Lac+Vc/Ixp0HiFyNSvsH71bQ6Ys3Xe8soKH4nLeYkIF
	 c1/q0vzRGh7SNCt9s/MwGRTTbauXRLvWDpVcCYqdbBrltELFVvH+V3LYhYkWLfdoaREnD
	 PDaWCRu8Vn3EDg+D8l4guI0jHfXm1Urf1KIEIT1mPgrRySc4bEWPaGIgfGCNt8LHgDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794654570;
	h=DMARC-Filter:Received:Date:From:To:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=3qapxWf2yIBkqfJeykG9TxwANowbwknVU2aeCCZTRJ4=;
	b=Cvq0phJ1CdmkxN0CdyTg/yLjDElhE+q2jWa7DVu7r9fe+/EvmxKxQtILvNJrWj7mHLd/
	 TBLuAsNt5zSHOoa/F+n3jwtkngKvIpAOz9fE8uJNHEFBGadYbT4dWl9DAee2lWCMR/EQe
	 4jiYnFbmQjxEZ9QAgB6km0kPVOSMCzRm+uYp7Isu1OK8Bz82FhKbNbGzLdXxx2ewQvHkx
	 jupWhl8rBjtKIcgH+Voats8eAHdeeAj0rOqoyldhxUcALeBPm2nRyrJDDflblWudx1ixS
	 WlIuw9vttJOmBMLJzt+d/YcEDmy1Ehsp+qJAVj3NSgYLWkU+wDehR7+Ag9Y0v44uXig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9522A606A32D;
	Sat, 14 Nov 2026 11:09:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9522A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSBdK-000000003x3-33On;
	Sat, 14 Nov 2026 11:09:22 +0000
Date: Sat, 14 Nov 2026 11:09:19 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>, Marc Zyngier <maz@kernel.org>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] media: dt-bindings: rockchip: Add RK3568 Video Decoder
 bindings
Message-ID: <90878fc566a9752eb582a82d1324d811ebb324e7.1794654074.git.daniel@makrotopia.org>
References: <cover.1794654074.git.daniel@makrotopia.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1794654074.git.daniel@makrotopia.org>

From: Christian Hewitt <christianshewitt@gmail.com>

The video decoder in RK356X (vdpu346) is described in the same way as
the one in RK3588 (vdpu381). A new compatible is added as the decoder
capabilities are a subset of the vdpu381 capabilities.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Tested-by: Diederik de Haas <diederik@cknow-tech.com> # PineTab2, Quartz64-A, NanoPi R5S
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 Documentation/devicetree/bindings/media/rockchip,vdec.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
index 4f38a0ef29d84..ea5386e84f17e 100644
--- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
@@ -18,6 +18,7 @@ properties:
     oneOf:
       - const: rockchip,rk3288-vdec
       - const: rockchip,rk3399-vdec
+      - const: rockchip,rk3568-vdec
       - const: rockchip,rk3576-vdec
       - const: rockchip,rk3588-vdec
       - items:
@@ -110,6 +111,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - rockchip,rk3568-vdec
               - rockchip,rk3576-vdec
               - rockchip,rk3588-vdec
     then:
-- 
2.56.0
