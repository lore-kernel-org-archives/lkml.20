Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2143F54C6;
	Wed, 26 Aug 2026 12:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787747952; cv=pass; b=ehgZln36OcBBnkMGWla0kjMg2DkDzrdMFhX8ohJ0NKPaEJwT/U8S9rdiUk/bHIGXjNiyqkoKwzcjpkmt0X0oq1fo8FmeIXQ8+f/20xDQm8b67bVjGgLBZ/hUTQIpY+zdvdRrKNBZfPWnPOCtKSMKZ/8elncfopVGrBCR5rN4zbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787747952; c=relaxed/simple;
	bh=K07CTtsP7rjK3nUj1Am0jhzMKzh6xKoaJKQiQuXGOBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rHbYtd1n7MvfcAssrg2C8VacNZ76lm4Cm6pFdTvF8tYuF5IdBdo1sQrqny1TC59NZK9Wmh96pWwBCkyK5lKGMd9o37z9WznmbROzfHsMgLnUeyOTX/m5CWgIiZhFx0RPcMIOGaN7opDMOIw8zALmEORf+OP5fgmbR5et/vRT0ko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=julien.massot@collabora.com header.b=NQ3E2wep; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=julien.massot@collabora.com header.b="NQ3E2wep"
ARC-Seal: i=1; a=rsa-sha256; t=1787747930; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Q+5jNcULq0cLXM7KsedXTxLDCdnQ850rDn7Q4ZFfg8L5U2SJXri1O8+/qp1+tUI9i5mGVAjI0U5ldQ6kdAEO1B5qc6duS9MT0NDu5zTkGHRrqVWSjmRBqSjAWjXs06wqNY0Tf63kl+5fCu9DBrewtRL3LGqG8/rrfiyi1c57B0Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787747930; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=S1coMZ97bVtUDCS1vnxrIC2clN3y0sXn945jJXZbbsk=; 
	b=D869j1qRA97jKIUWhXaJeXNWr6nKfMnVYTadbDncHyIEtvj0rZ/GFgPsYEoxqjG3Pqj81C8kSF7lhnC9Er1CtENWO5RENLjuOWxW/J9kLKLYB1pmNbwfI4arvW90oWoBgan2UozY9TVQQCHq5ljEt6XlyXXzqdLTe89x5Dwaj2o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=julien.massot@collabora.com;
	dmarc=pass header.from=<julien.massot@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787747930;
	s=zohomail; d=collabora.com; i=julien.massot@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=S1coMZ97bVtUDCS1vnxrIC2clN3y0sXn945jJXZbbsk=;
	b=NQ3E2wephT+lTo+hSI1Fy7F+qRg0wY1rk+MupzUbkXlm4fRj8kbJilLM+UIxJ6JE
	P8bCF5t/Sf9e5uNAyJDMprdA6vaEbyaSZBVaCStJq0DiLXJzoyQyQr7iMFOs3NdHSBD
	3or9deRSGiTfMJhtQSmyUK49DK/ENKZz8mys7fLo=
Received: by mx.zohomail.com with SMTPS id 1787747927438124.99498758344873;
	Wed, 26 Aug 2026 05:38:47 -0700 (PDT)
From: Julien Massot <julien.massot@collabora.com>
Date: Wed, 26 Aug 2026 14:38:35 +0200
Subject: [PATCH 1/2] dt-bindings: phy: mediatek,xsphy: add optional
 repeater phys property
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-mtk-usb2-repeater-usb2-v1-1-e8e48e2fd6d8@collabora.com>
References: <20260826-mtk-usb2-repeater-usb2-v1-0-e8e48e2fd6d8@collabora.com>
In-Reply-To: <20260826-mtk-usb2-repeater-usb2-v1-0-e8e48e2fd6d8@collabora.com>
To: kernel@collabora.com, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.3
X-ZohoMailClient: External

USB2 PHY ports may be connected to an external eUSB2 repeater chip.
Add an optional phys property to the port sub-node to allow referencing
it, following the same pattern used by the Synopsys eUSB2 PHY binding.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
index edeb32a97978..e779e21a725b 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
@@ -109,6 +109,11 @@ patternProperties:
                 - PHY_TYPE_USB2
                 - PHY_TYPE_USB3
 
+      phys:
+        description:
+          eUSB2 repeater PHY connected between this port and the USB connector.
+        maxItems: 1
+
       # The following optional vendor properties are only for debug or HQA test
       mediatek,eye-src:
         description:

-- 
2.55.0

