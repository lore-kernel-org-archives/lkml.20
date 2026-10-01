Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC241374A1E
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 02:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790821484; cv=none; b=FjR9ZW5o6e9pn5KoDAp2gPwF0rGqzDEYbTXArH/2+CD3HwX7Yo4c4sGBkKc5/5PcQe6QZHA+m9SL64oAfjjScWivtdhH1ZoxLcXTMOAQZn02XK4Hz5VsJff9qiZCfSHPaIqB4BtFY53rLCIyk3olZs4q3GZkIckqAvzAgxMZWp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790821484; c=relaxed/simple;
	bh=qnoog98K51vnfZCiv1es1iBsnXh8XTJszGX/9tFR+MU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vDhzFdkbBXZ1aoLz5nvuPzGCvOMpBSVWHNpLXKV3FjWhyh/UeqhJS18DeWZqIu5Ob7jkGW6OtkHuHIHrFhRXu9ErXZphNpkLae7tNAzo5DIEDql7IvOcM4qq5/vST5gO7EI+QykQM4QjJRP1+0jzLzdX9Sls1MfoefHvJyz/r10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qgyNjqlw; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qgyNjqlw"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a498cb99b3so1369861a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790821482; x=1791426282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6jXmdp3nNlQhtQhH3DV17YiY+GuFH1S+iQ0jRXOu9EM=;
        b=qgyNjqlwMfriyfG/pXA1yyu4aRLIbYz8YN6PgjmI4+eCNXk0hd3JnMwISvTpp8zrBs
         1ujDQWGXvOzv34wJfa+toML/DJTNHMDQw9/SdW/wYLau+eGvIQxUF8fAGUwQcxQy0SYM
         XJZc25wse2pUF0Yrfbr+k6f0RNS/JWs53+VXXxil7UixRBag2KJwj3Y0T3eAaKKY391K
         2oc5HFiv+ypLpSn/W6ezsPseSDdH1/4u1r3MWFfjCYdD6kmq3QPERUZS3Jlw0wpn58RC
         wMw6H6QbWBCQTWmRBJTzfIrBShWHr+8Lm0sOXIxj3CJo7MaL32CSGuX/fZTlBRH2YbQX
         CBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790821482; x=1791426282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6jXmdp3nNlQhtQhH3DV17YiY+GuFH1S+iQ0jRXOu9EM=;
        b=lBCILyNaBgihFMQqcCYdy28xTX+i5GQRZOpOaNezNPmFVJKQ8hOXfwa/OtyE8eiToH
         +HeJAlLpuZAK5hpfy2zhwlj08TDpy8WkVlbRvNR2wUfJ8+R1ASxRVCTq817oZ5ihgK8i
         e0LdrVd/5ozRYUim/rrpHQQC2ac89bUiCgLgfWw8kVRyiqVLTrtGn70LxnSe8KBWHvZV
         PTLMwHN74g8Io4UVXrfhKbvtdjsb33+PCaAG3nrTjfIAYtbNFQiBmgEthF1zGgj/c5e8
         ODkBNhOj0eO2B1hzeH41X75Ktp+M4t5SQGN6kJbGjsun+D7VM/d+C+hEcHkyTdOPsSN8
         FK+A==
X-Forwarded-Encrypted: i=1; AKwUvBwrXiirYdyQE2pWwUtwXd8C6Rb8NtG2JFe7nA8IsVa75EeuVnS21i+qSQAuZTrk4RnP14rOsT3lay4hfQs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLEyv1B1+MOryhv3cpvJjiZO013dyky+FCN+xeobk+dWTCwRYH
	3XxRupeVI8vXjzmq9ufueR8do2h4IoogOptrgv5AMxffjDEtYvYcg9Zx
X-Gm-Gg: AYBFou0wa8116VSJg8hL1EitF9ds1jVb7t34FYZL4gALVzc6C6Jj4JQTEaKv+HxyqDj
	Pf4ZSJK9swJsbKra8sDnrYq/poyai1qn5i23AunVL5itvYhyIxZSsZ79XagnKYrSWOnIuhf/G/d
	rwIJPxtFM7X0b9m9YRBKnmcWhiED+JnP2iA7q9gxHYJWzASQKeNZ2MnaOdi2zcFo540Kebo7mIG
	XOW8Ftypl6jaAd75YZpGSYICq1Twcb59aH/+5MNgV87BZmltsfe/uj9nS37kYRONMQcBuGj/j87
	lNmK7jVkh03GYh2UPpBS7TRvyGltwfg/nwAOLcmwaFGVxfqImhpWSmmn3YlHmgz5/Ux52pkKrJs
	yavUka7DXhen91+OgJ5zmhNDqF9M7AH/9DjH3iqjb0lFPXUKb2yzv0djz0hwoujhnYdGPj/L0oi
	fdjeTj1m38VcQdJzgfWJL5/dGSXU3DCb9BdKrR1U8tekhoscju9WBrKPiUMBYshA==
X-Received: by 2002:a17:90a:ec8f:b0:3a0:22bd:6ef6 with SMTP id 98e67ed59e1d1-3a4d0f03a1amr1882204a91.2.1790821482200;
        Wed, 30 Sep 2026 19:24:42 -0700 (PDT)
Received: from archlinux ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f43a12c9sm2153230a91.2.2026.09.30.19.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 19:24:41 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v2 2/4] dt-bindings: arm: sunxi: Add Teclast P85T tablet
Date: Thu,  1 Oct 2026 10:24:13 +0800
Message-ID: <20261001022415.913959-3-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001022415.913959-1-iuncuim@gmail.com>
References: <20261001022415.913959-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible for the Teclast P85T tablet, which is based on
the Allwinner A523 SoC.

Assisted-by: OpenCode:DeepSeek-V4.1-Flash
Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index f04db28c6..b9c2268fe 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -933,6 +933,11 @@ properties:
           - const: tbs-biometrics,a711
           - const: allwinner,sun8i-a83t
 
+      - description: Teclast P85T
+        items:
+          - const: teclast,p85t
+          - const: allwinner,sun55i-a523
+
       - description: Topwise A721 Tablet
         items:
           - const: topwise,a721
-- 
2.55.0

