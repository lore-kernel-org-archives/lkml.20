Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796072;
	b=eDFxkmrHCefyyP4abJnGSzfPnzpO8FXhnXr2StG3ClsRSlbrv9olide4WRyvCRZez1NV
	 P5o2PXk6KiTNpSuQ2R4Xg7rXZ8M+/P4nF/K+SI6wJN39vYhlVAl4rEHgeUh8hWON9D4hY
	 ZjtYVwLE8YWGY0sAtSkIyrrLXFzSKu8OGhMvNZRW96l5sjl75tfrpN7iRlqJNyr+DDTyF
	 EpyvfHjbGYTi0afLCOpZwyAPC5h5r5sj30OLQuS30HWvTw/XxgLBRKRByObPFeLt5QTTw
	 /4l660AjMzPKnFa/mOZSQtrItxfaBVSYHCGMRs8bYtWjrdFCzWsKZExsoGuMRx9m0ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=r9XftG2jwlbcBtOX2yP07gVRNuCDOaQXXTj9pUzF7Hk=;
	b=v270X2lvB4dnOaAamf62f7W5+1XgJbgXFqLosYghiChHFHe2xQD3fUkPMrmo6wMYq1F7
	 jKwnrYZPzowAWkcG7R5I30CUKNL7Dy4EtqwGsaccd+PJznyvfy7jktUAHvqjY658p987h
	 SVqJ5k39ovdGxhPvDnFsVbftS6l2Xw4idp76oIV0ulUfrzVDNLuFNbquP27fXTg6fWGV7
	 uwLVQe6qp8YPtn7++arD94BRU9MQIiHDrJEzovBIRm6eRbFiEf8ND1tfRbLAt53uxpcL6
	 Y5Q46nvZ0x648AzAtkI1sLpa0F35s0sGJucZBSxHd0eyfuQGjYiP5uOJ4zL2GWdvsfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q38I+c12;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F93606D801
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9F93606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q38I+c12
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a208d93758so6646185e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793796070; x=1794400870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r9XftG2jwlbcBtOX2yP07gVRNuCDOaQXXTj9pUzF7Hk=;
        b=q38I+c12QN5Ff+QPekoyCZn8Kf0bFBhgnEHmqjpngz0F8BLwabeeCpMCt0d2t0ExEK
         IIofZDdHxQW+naBfyhbdhYK4a/oei6+W8Vynnxok+eQ9HpPBqE7ihesgtaQ+tjplk673
         MMDI95NW48fGyQP6eSOCzqkyvWhMLoUWJ9YjztVGahHBD6IwKzKcofVlRRIlE++lAYHS
         94BvzjIFU5XXzYsdyRVRIFyMuZVvDoYbigyDOPljOu79AeUlhfDNw1bYKukXsOHUdB26
         hCz+l1jYWxVeCFTr8o4yrFY2ElhgnvTIKUSc4t1F/qX1ibKvgvElAEDu7o+eipJgNqea
         G24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796070; x=1794400870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r9XftG2jwlbcBtOX2yP07gVRNuCDOaQXXTj9pUzF7Hk=;
        b=Z7qwHlwB61wUGEglfd4Za/zPzpqGXMBCj9aALuFsQ5k6hsH5SkZIQvURdtJbe2RhKj
         1gG5NBddKFpOZNeP8t8p24b2Zc+ZFGt4PJFKuuyjS9i8s6aWeie6FrfS9xGektewOECk
         0A211d8qfvPZTwKuLXX7QuaVy2O3SmYVVVBSKwuwZoUIpQxzM1VzZ4JQyapgx+Ic09PQ
         cGzWdZb5qPphSKX3+mIeZTlPTJxGXNBerhEsbA2xwc0ayDbD/QOJ58xwdURyo6W39H4C
         V/rQJLDa0tyh+mkb5Vs5cnhFdr3Y1NPnhr17/P7ax+GpdWj8LBLEMqXcdkL585rD+lJG
         MhGw==
X-Forwarded-Encrypted: i=1; AKwUvBzc0cTunN6YWwtXDRD5VlNyIayZlom+USUoSje2o0SQyR9KJKM6lI5B3xlHlukfD7A+iUZjXeeEaMLOrVY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qwxjvoijfGBDwD93vLO/+gR+l1MGvBbcYySPJNBQmy0jToAGY
	BjJH8WXvw6L+T8muRtmPz9uJw+XU4Ks4LsgZ9JXF6sIWBAAsVRVvscsLSoMiQA==
X-Gm-Gg: AYBFou00RKCPdEf6spPeuXDZ5rZZGj3+BygE+o9nNyNXrM3c1ArHLO/YfDXAIh77uqJ
	KTxPWDu3DFBO7wbxyOiUImFGqxSFpGXjwhgewj5Vxqwr541pPlpjOQQN8gBeMwD9LbTHkNNzVq/
	FlQGXEZOTArDCPtgjTP4WfLqoHJHW17tvF8EJgGJhvpuBr23qKGQ1ehn9V1N97e61MhxTGqZ7XJ
	VNxGEGsAwXjzJq3NSca7233BRI1IelNViM3a4lo6W65t582uKP0iM4hfnC4Fsjd5RkOIHrvOtNU
	0ogvr/Mz/iIVJ6KvnDj6f9ePpeIbsV1fpnBhpjkXIEbH/hWC5rkHiC0dpS7CL9DUFWqMTARFTdI
	vwjhkFWaA6mHIe3zfmnXtFX1XKmJP3WG9ZSOJUv4v/TvAz9Ym+ZLetKwIG15FIgTI/uE7hF4gwB
	UOiVFTIVlFfgBRkPSPCb0CHoZGKzW2ebHQkO8NAAlRBkcONdgdS+Ds36XOf2yJVWVJwoKBUOf0w
	nWpd5z+ZAD+xpRou7xNvJ7GrVhW58LydehbhpLwF5CnDeAWXU3YVg+rMe/ube3GAGQCWxleI0yU
	mYBlErZo0EkJLdSXK40JvNXPKBORkna7ypPsyhWXRvUVE4fBVQ==
X-Received: by 2002:a05:600c:4752:b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4ac18e5d4d0mr385065305e9.29.1793796070249;
        Wed, 04 Nov 2026 04:41:10 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm46347145e9.3.2026.11.04.04.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:41:09 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 1/7] ASoC: dt-bindings: maxim,max98088: Document #sound-dai-cells property
Date: Wed,  4 Nov 2026 14:40:51 +0200
Message-ID: <20261104124057.240288-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104124057.240288-1-clamor95@gmail.com>
References: <20261104124057.240288-1-clamor95@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Maxim MAX98088 codec provides two DAI cells.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/sound/maxim,max98088.yaml         | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/maxim,max98088.yaml b/Documentation/devicetree/bindings/sound/maxim,max98088.yaml
index e4a2967e1e818..4d33fd705cf8e 100644
--- a/Documentation/devicetree/bindings/sound/maxim,max98088.yaml
+++ b/Documentation/devicetree/bindings/sound/maxim,max98088.yaml
@@ -9,6 +9,9 @@ title: MAX98088 audio CODEC
 maintainers:
   - Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -26,11 +29,14 @@ properties:
     items:
       - const: mclk
 
+  '#sound-dai-cells':
+    const: 1
+
 required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.53.0

