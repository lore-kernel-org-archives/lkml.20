Received: from sm24.hosting.reg.ru (sm24.hosting.reg.ru [31.31.198.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FB23909A6;
	Thu, 17 Sep 2026 16:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.31.198.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789663461; cv=none; b=jCSdrAOj1yRK0EdYv0QlQ2G1Y5yrdHwMiQIHvNGpAQMhazQmHCrA6BkWvHcYSIEYbqnTOwb4uUvhYfaJ3129/BH5wy+ZlLuzxgi+TAIi5RGlriHIC4qiTi2UWCM4OvpTTUrtKZAkqYs7ty03bLDY8XL4EqLLEbvYHXg8WDlhtAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789663461; c=relaxed/simple;
	bh=iuCGv5i9sUK5NfEpPCkUnnl7p/aLhogUpELLxhLNOQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rkcf3M5Lz1vMYvZAbYUY+jErSLy8bv7zHAibbsz9NWj0ycj5pvINwPegF/05YZnzureY5VUQIsqt7fBwS3+UhRqjgEYuqat0KBm08wZlSGne4C77vynFnWAHX4Xh1PUK9Prq5Hwzp+JVPsQqb8pAVL4WbEZ0Y++v/WpsC5IZON8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru; spf=none smtp.mailfrom=minlexx.ru; dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b=Ut4txk8u; arc=none smtp.client-ip=31.31.198.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b="Ut4txk8u"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=minlexx.ru;
	s=dkim; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=U7BxfyRDz/VeeNHxihWp+UO2gt3YHWP+ESOrM0F5a9U=; b=Ut4txk8u5/u8JhDrZLrAg+qTcW
	dLXZJQDB/KoHbjHvmhwFQVo82gctpYBJUgr19E402ie2czgd/i7BAA5QvDk81ZYIle73a2XD5tzPW
	TVomQ9PE/3PzIrw9cSftTxsoHvbxXrxTRjEzYlXg+GRwKFMiyHbggq+S713hKK5uBWt8=;
Received: 
	by sm24.hosting.reg.ru with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(envelope-from <alexeymin@minlexx.ru>)
	id 1x7FDT-0000000Bw3I-2fsT;
	Thu, 17 Sep 2026 19:44:08 +0300
From: Alexey Minnekhanov <alexeymin@minlexx.ru>
Date: Thu, 17 Sep 2026 19:43:03 +0300
Subject: [PATCH v2 1/9] dt-bindings: vendor-prefixes: Add Shenzhen TXD
 Technology Co., Ltd.
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-nt36672a-panels-v2-1-f8de8be5b86f@minlexx.ru>
References: <20260917-nt36672a-panels-v2-0-f8de8be5b86f@minlexx.ru>
In-Reply-To: <20260917-nt36672a-panels-v2-0-f8de8be5b86f@minlexx.ru>
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
v2: prefix changed from "txd" to "txdkj"
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 4a5cf436eb143..bc87d5e9fdd2b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1773,6 +1773,8 @@ patternProperties:
     description: Turing Machines, Inc.
   "^tuxedo,.*":
     description: TUXEDO Computers GmbH
+  "^txdkj,.*":
+    description: Shenzhen TXD Technology Co., Ltd.
   "^tyan,.*":
     description: Tyan Computer Corporation
   "^tyhx,.*":

-- 
2.55.0

