Received: from sm24.hosting.reg.ru (sm24.hosting.reg.ru [31.31.198.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51BF50391A;
	Thu, 17 Sep 2026 16:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.31.198.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789663463; cv=none; b=YqLhPIFRHCCN7Hc0Qh8BL7oAb4WQQAopYqp209kbcvpJKf2ot4BSsrKgNWDE6x68Y+pJ82AjtFduPU+U0DH04FJrDXg4gEzyNDJfZRn5+ZmBajO267fbee3Zpk3Dtvt+jYFjU4o5wR53jo4WBLF4D7medK+6jsrPozDcYZ9ygVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789663463; c=relaxed/simple;
	bh=rhyIzjZzSdyv44zczMGBcMKVPk3p363Cfcs3OyJUJls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AGKrLjcNK5nJ38Aqj+SxEPHsUH/mKg/ieL24/p1Ceb2D1d5IFk/NwOrP/9fGe0tqcZyRXb7lzwbBIUoCGZh366j5PzEzijCoQl1MEGLMbNLKnATbboJq8lKc1h4PeR1aX8zLwTqcJ2mrWVp3TXPmCGMTOCTcV7WtisAJBbf2Brc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru; spf=none smtp.mailfrom=minlexx.ru; dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b=Rqe9AszC; arc=none smtp.client-ip=31.31.198.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b="Rqe9AszC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=minlexx.ru;
	s=dkim; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=k3Dw7OeMuO6OJ1hfSNZ0QpnTkMfkoclywwZPUBVIdp4=; b=Rqe9AszCZwvvVKRNSZIKbGD1xO
	AH80I6dGRWiqwI0r8MU8IjAp6NznBIj25lOrQsmqdH4toGEIIDnySQ3nEFyw0qsFakHfbHhPmkpZZ
	iDymkucNa3A7iTX5UCKBRXs5Dvi/gqUK8UMx9gSMrRq2dafkh2u7qsK0VpGe772rNjy0=;
Received: 
	by sm24.hosting.reg.ru with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(envelope-from <alexeymin@minlexx.ru>)
	id 1x7FDU-0000000Bw3I-3a9R;
	Thu, 17 Sep 2026 19:44:13 +0300
From: Alexey Minnekhanov <alexeymin@minlexx.ru>
Date: Thu, 17 Sep 2026 19:43:04 +0300
Subject: [PATCH v2 2/9] dt-bindings: vendor-prefixes: Add Shen Chao
 Optoelectronics
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-nt36672a-panels-v2-2-f8de8be5b86f@minlexx.ru>
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

Shen Chao Optoelectronics Co., Ltd. is a manufacturer of LCD
displays based in Shenzhen. According to description in [1],
the company specializes in the design, R&D, testing, and
manufacturing of TFT-LCD liquid crystal display panels. Its
products are widely used in the 3C electronic display field,
covering a full range of display products including LCD monitors,
laptops, and mobile phones.

[1] https://www.qcc.com/firm/5b0330df7040fba496dbb0bd5723f6be.html

Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>

---
v2: correct company name, expand description, add a link
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index bc87d5e9fdd2b..0e011b6679847 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1509,6 +1509,8 @@ patternProperties:
     description: SGX Sensortech
   "^sharp,.*":
     description: Sharp Corporation
+  "^shenchao,.*":
+    description: Shen Chao Optoelectronics (Shenzhen) Co., Ltd.
   "^shift,.*":
     description: SHIFT GmbH
   "^shimafuji,.*":

-- 
2.55.0

