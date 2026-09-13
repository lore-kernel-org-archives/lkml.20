Received: from sm24.hosting.reg.ru (sm24.hosting.reg.ru [31.31.198.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F7030E0CC;
	Sun, 13 Sep 2026 06:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.31.198.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789279843; cv=none; b=XRSDyM7yOv+j+1JaOz9z+0G16xBFLg/WT5dCGSpdPjUU9bamtnq16Z3HMtQZ2qXAFY5UYPSc5lzgFB6sMP+A+tuiNQxTLUE+pQKTlwr76NIIHFc+2aHDu2h4ThWjZFzjsiTklOrL3h0B+4Q10vT5bD2A9lmm4ANyO40O0SBoxII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789279843; c=relaxed/simple;
	bh=/wNkRgAtqJX/KY+25EYdyLTmARdOigg/VkH9BOr92ls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BiiwYb09f0iYY8O3QMufAFC4C6PsnBS7Bb0Wfw6t/qrZZPltrrD+RGqp8XP2/boK1iWUMRLSgBA8h51w4PzHUmjiBubXUiFE7tIiC/HcHqkIe+vv0dh3x9qpsVSamlHLIjIw1OC+AiU5duYBDYtIcCvTUFfMQM1xNXz0ONKn2ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru; spf=none smtp.mailfrom=minlexx.ru; dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b=usmHR4Gq; arc=none smtp.client-ip=31.31.198.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b="usmHR4Gq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=minlexx.ru;
	s=dkim; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=IsAidF4NXA+x5ypB+3I1fDPQq92j+t4wyvEEv1LxLZM=; b=usmHR4GqZadbysCR5ocAUaLh3H
	v5wO4HIEoaKQag72j2lP4/3fjPD3c1gi6GwNZpatlhPf7D8UfEfMdUT49oTEAFP4rwSOzo+bpnCjA
	VS2j0Z8jzwVESyL1ybJGvJ1fpZbVwzNyVavgDZiJ4T+s4HpW//YH78o1hL9G/Jh7wixg=;
Received: 
	by sm24.hosting.reg.ru with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(envelope-from <alexeymin@minlexx.ru>)
	id 1x5cu4-0000000Dxg1-2J9j;
	Sun, 13 Sep 2026 08:37:26 +0300
From: Alexey Minnekhanov <alexeymin@minlexx.ru>
Date: Sun, 13 Sep 2026 08:36:33 +0300
Subject: [PATCH 1/9] dt-bindings: vendor-prefixes: Add Shenzhen TXD
 Technology Co., Ltd.
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-nt36672a-panels-v1-1-ce097402c6ea@minlexx.ru>
References: <20260913-nt36672a-panels-v1-0-ce097402c6ea@minlexx.ru>
In-Reply-To: <20260913-nt36672a-panels-v1-0-ce097402c6ea@minlexx.ru>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: David Heidelberg <david@ixit.cz>, Joel Selvaraj <foss@joelselvaraj.com>, 
 Chintan Patel <chintanlike@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 phone-devel@vger.kernel.org, Alexey Minnekhanov <alexeymin@minlexx.ru>
X-Mailer: b4 0.16.0

Add prefix for Shenzhen TXD Technology Co., Ltd., manufacturer of
medium sized LCD and camera modules for mobile phones, tablets and
automotive.

[1] https://en.txdkj.com/

Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba20029693734..86c502d8d1d5f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1771,6 +1771,8 @@ patternProperties:
     description: Turing Machines, Inc.
   "^tuxedo,.*":
     description: TUXEDO Computers GmbH
+  "^txd,.*":
+    description: Shenzhen TXD Technology Co., Ltd.
   "^tyan,.*":
     description: Tyan Computer Corporation
   "^tyhx,.*":

-- 
2.55.0

