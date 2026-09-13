Received: from sm24.hosting.reg.ru (sm24.hosting.reg.ru [31.31.198.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44353B0AE4;
	Sun, 13 Sep 2026 06:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.31.198.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789280778; cv=none; b=LBtKOrZJVvkuXGIU/LJ28mhhlXvTZYKQpUlswGDNzCrCBZrYeMu6DtCE/IA1iJDKuR36YqRQC6MV9dgKzLZFRhw/HOYGH99EYG/ZyBSYnFnrFdzdseCkYW0nc0Wy17OnMXTU99zYfK5d9/kyKFfdnsU490wIALiEEMGjM0R+JuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789280778; c=relaxed/simple;
	bh=Ww/NSbPoNOKjQZHvNtfmmQY89Asgoa3abG2F8ox3NTA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZXaOZL+JlxmME8kOJUIMYt6FKavKif108cq0EDMrKRvyMi+zJQqLw5t7PZMAGu1aHASdNPz088E0AXZet5zJoXIKl//1OTBXQ3kiMRo1HDYNy/Z1ag7x6CMtroyvF/ZsYQJuwxo++ErfbKL2fsVDpBuhhn5Jw6MX6zvkLcL9xPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru; spf=none smtp.mailfrom=minlexx.ru; dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b=mvpMcS6U; arc=none smtp.client-ip=31.31.198.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b="mvpMcS6U"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=minlexx.ru;
	s=dkim; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=XjeGvVaa3X9B0ScNIks/LOjOjPPjZS+X5qEnEXVkQVA=; b=mvpMcS6UrdAQHmfNBkzIPJ+6Fc
	i0/Kq3SpohZD0iAMFxTFU6gQiHxstsqBY+n7s8HRRW/PGor7V/xMMS9YnrOKaKDH0FhR4Qcj9k82r
	5IE1NVCbeWUnpie89oUfBm9IAlx+o2+wceY6eDd/nbB+0Lb+1fze+uncKgg+MkxgyDQQ=;
Received: 
	by sm24.hosting.reg.ru with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(envelope-from <alexeymin@minlexx.ru>)
	id 1x5cu6-0000000Dxg1-1URL;
	Sun, 13 Sep 2026 08:37:30 +0300
From: Alexey Minnekhanov <alexeymin@minlexx.ru>
Date: Sun, 13 Sep 2026 08:36:34 +0300
Subject: [PATCH 2/9] dt-bindings: vendor-prefixes: Add Shenzhen Zhuohong
 Electronic
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-nt36672a-panels-v1-2-ce097402c6ea@minlexx.ru>
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

Shenzhen Zhuohong Electronic Technology Co., Ltd. is a manufacturer
of LCD/IPS displays based in Shenzhen, Mainland China.

Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 86c502d8d1d5f..5bfad23fd6255 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1507,6 +1507,8 @@ patternProperties:
     description: SGX Sensortech
   "^sharp,.*":
     description: Sharp Corporation
+  "^shenchao,.*":
+    description: Shenzhen Zhuohong Electronic Technology Co., Ltd.
   "^shift,.*":
     description: SHIFT GmbH
   "^shimafuji,.*":

-- 
2.55.0

