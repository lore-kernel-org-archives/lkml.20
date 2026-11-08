Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794117271;
	b=gBls76Efnx797s99z3ptq3MWD84yfkjaYxst9+qbekH90J3JnbuxdBqmCeirste0ZWvt
	 4ABC6GwZL3z/vxg8UiP3krT6pp7/nZWuTXiuLQyPmgco0pjE08UCsKnT5XWZ30ftx77/l
	 UsX7qddOuATknejpAujOO9xjW5Ujig9KCXZjcQm0XFnnbYgmds7Qv4hGXvDiLnwepCBZM
	 cEWmq1j9FJhRkpPWg7XT15zGYX0p1RbmsD37Y3GTYBD2lODMnihuHUl3Ou+jdqSNGwZIg
	 I6RiRu9cT9FFjNetZjo7/6wg7bScUKVrep1oXnTguj6vKEglpyPPEeNg5b6vnugRG9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794117271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=jxepNjKduOAr/tzD0TlDbq34lA7HazSTmfh7A7+dM1Q=;
	b=WSekCO1cC9c+OxIDoHQWkzwuZB83WIUOcwiQ0VpjZh9I6nm+ZZ9XRPC+QVpBaLkqJ3RE
	 0kXv5w6KvxrmRV1LN5RlUVS/XBdqeYTrGwmsMmr4GcvQ42l4bo85M+yzzMVrHiooADf8w
	 7beLx/5cZlVH0hGKZYbiJ4FXnBrhAy+xvUKNbwuttMRoo6bAkAuKubsJDrwOoHBTPeGsg
	 +swHHzIYL6eo1/1G3e1ly+TN5CN5BGawuFh0dpUFVr4iEP8IbWLBbU3iq8Qpqd/36u05B
	 FR3RqnXYZ5Bby/f36npqRix/6j3TdqguPpPH/OHh3qjK1IQA/LQINHv72tByVASxthw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mFHfTGb7;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3216606D815
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 05:54:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3216606D815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mFHfTGb7
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so2611685e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 21:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794117269; x=1794722069; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jxepNjKduOAr/tzD0TlDbq34lA7HazSTmfh7A7+dM1Q=;
        b=mFHfTGb7HXk/JHsOJQVhXi9ghEA/0p6EkUqyOE3cY6g9T7eEIKQCTY6J1daG7aFbyJ
         +HWDYm2EYJcJbLAawvVxpd6toIJom1Szstw6eHBDQiFftCxy2kBcgfDTtPp8qkL/E4rx
         FKuPHde8PxcSoQ4JTtL0dR7++LsDmyE2lh/hyBklmx801WcfDEIjGhx3DBQv7hED3nHN
         f9bly/rrNexbf+LLiq5nTSZlW7d8PFkwaGsGfYy9+9NP6buj5zaXaRpE+dblaW2nSwj/
         5yH/iHLcpdj21i1fO2q4pOrblSM/upxAeYofTQzPyRObPVOtsix35xdWVGLX4UR4snGB
         3hZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794117269; x=1794722069;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jxepNjKduOAr/tzD0TlDbq34lA7HazSTmfh7A7+dM1Q=;
        b=tTQpz2engBg7w7Nfd6Dw6EQSjsbgIlSiCimo5wyr5cDNmbiRkLk3BfQxfImhxLKQk7
         JL8aNC5l+H5pbuRU0iCTI5pjjnK4ocdeE4UBc3r+IiZkb2dnorlkcfeOaPnvRvDjNvf1
         S5wBu+9KdCSQaps0zBhFnbxP9+8K6keujGgcvHhGagtrmqLdP4XIAxIezzbPSL5Bk3+W
         kyYumfXfa6E0ydGvX1NSpJJKrdDYMaBc760FP0gtDIKC3OPpXmLjG+AVsGd3NoqsTtJD
         LukDdSN7tlZhxGYsbIb44wkAFhMl2523TjT5eF9jC7cz4jgThAzK6mJVl+BGVFVUTjKL
         ooCg==
X-Forwarded-Encrypted: i=1; AKwUvBzH96Y9O/gohB9RyZYS5lMhpH6qJ0hO+fzVOq1fjyE0BJ1MRi7MYwb4h2Q+Ehrscl7u2Ftb5ogpL57I2jk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rO5q+GauLACs1fZss7QpBsR76FLGSTX1pm8T1+20fWha/SUCT
	cCYwqG7gT+S/LYsCXXxl5sOp8KzShPK5mjwME1tvS3Lsu4BhsntUI1zV
X-Gm-Gg: AYBFou0tLeudkiUfJsnKYznb57osN+ByexDdcB2VQJG439Dy2H8NCvnqbfgruTkJ/ru
	h1YbJk45L7tqTgEyEFA6f+xyXID0qL0GWMPW28yqe86/9Nja51yZfoK0k8OM0A/7qNZUfCl6G1U
	B7/CD+oRSiP7m0t1xXqGbZA9OyoElp/AkR8K/Lc7YRT0n2z2N5oSPxcpOCwuvp2buqnQozPRbsZ
	xzWW3J6jjKTZSp979ZHQBRSm1AEYzNeIFhwkl98xUj/zIKlLtrtL851zzl1O3WsO9BsMx8mjKsR
	FmI6rGrUu9TLMMdRe675kEnquzxyxLPl12/C/uVOF5DlAlNMlcYysvLkZVgYhoZzXIsZvmBEK8U
	iZzMysBCZ2NaiJJfOXOPJYHE0hbQeXj67vZG03bHe9vHq2iGKmUPiCa6I6DvkllffTacUwqdIxk
	2HcgwiLEQLfNMRD8Az9d4C1GczgMi7Gk/hfLaqd4pBIjryEiKI4y4PdPLc5gSptJls5oVyj79te
	wuu7eBbxLXNmZLzYmctm5xPnjHUS6XdtVKH161ZCqZfz0CTtGKyVWdjxqQH9bS0PnSRgV26bdM3
	x7GKJX3k1hHO1dWmWSYRoIa9K3BgJdXKUg/Qk4zW
X-Received: by 2002:a05:600c:19cc:b0:4a3:5d64:df91 with SMTP id 5b1f17b1804b1-4b962395b3dmr11692205e9.18.1794117269227;
        Sat, 07 Nov 2026 21:54:29 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959783fd04sm2113363f8f.47.2026.11.07.21.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 21:54:28 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Sun, 08 Nov 2026 05:54:04 +0000
Subject: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SXR2250P
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-sxr2250p-socinfo-v1-1-06244862f5c6@gmail.com>
References: <20261108-sxr2250p-socinfo-v1-0-06244862f5c6@gmail.com>
In-Reply-To: <20261108-sxr2250p-socinfo-v1-0-06244862f5c6@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794117264; l=685;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=XKUQeh5gIrN4psn3sFGa9/2nrQGmqfi6P81kjp5bAio=;
 b=sJFig5KQLc5oUud0DuW743w/MiO2pHlaJz6/e4NsWJ6WYGo2akIfCeWI9sEH9K8hhZW8NfFDF
 bhcK5nHedXtAVyt3BOHEToyq69vKWd6y8cysrdNLUxXcxQhNPFc9qSN
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the ID for the Qualcomm SXR2250P (Snapdragon XR2+ Gen 2) SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 135297027580..cbcab632e01c 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -288,6 +288,7 @@
 #define QCOM_ID_SM7635			636
 #define QCOM_ID_SM6650			640
 #define QCOM_ID_SM6650P			641
+#define QCOM_ID_SXR2250P		649
 #define QCOM_ID_IPQ5321			650
 #define QCOM_ID_IPQ5424			651
 #define QCOM_ID_QCM6690			657

-- 
2.55.0

