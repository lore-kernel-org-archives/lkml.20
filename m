Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95E13E9C1C
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 11:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790421258; cv=none; b=gscpSHDcjhvvz2rQmqKPw/c91cNdsd8+YbrYzRc2PvLp0KSlxl11SmvcBo39WrFbFtzQ83wPCcRYvbLiIYR36sAKIXZHKBWO/L83Rhf+rsNwQIk/YOhjBsbGhujhcx4CvqsRWvFIp++e9XtTTbUi6gnf5CSaS28LDQr0RI0ttBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790421258; c=relaxed/simple;
	bh=YO2kZkuN9Wn9il4HncAirPWtGBtRzMVQT7LXKgb7xW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MX2BFQVnSBNL7/RNV++Y1OP11DcwanwHYL5ggpUJekTmAtisUcqAInpZDv4w4E5QoQchhs0zOAWmqzwH2G3wrUMLQ3lrQ8szD6uH/eWN58TNWLXoz92Re2RZ00hfs3dHOEbMLRuSOjvNgirJ56ORohKPG9ikIFX8XNJBelI9nCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gYyX5l/m; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gYyX5l/m"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2dd1dcdcf95so7655045ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 04:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790421257; x=1791026057; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wB4iIPD9s85NH4nmWfiMXw0s7RZqmki7HNYdJPxvluo=;
        b=gYyX5l/mQtQO61wNwDe9fCB54ModJExiMPDC24cLluhdK+qtclirh0ZlpNYQypDORK
         SmPJ6orUGh7imugMc8JuBe3KwuWNAxiMEhhRUt4aOe78IVdUKhwFAOpo1BWuLW5BEy+B
         d/CurSlFq2/CfOVIPBI6X8rb0wS5uaBM9EPa4kybmNyXlVbQDJ8O6joVkfFrUpSF0vh0
         PMB9cezlqKKynGh8exwgzqHHL1nm6973cMlaVv6Apdi9ZfFeOLWjd+Vm+IiHqyBfMnr4
         ig79Rf4RCq34jJJ/S7Aol/isWnBxRtek4U8vKaxXK1bU87m43BnO5L+F8GtMXc8d37i9
         dPxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790421257; x=1791026057;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wB4iIPD9s85NH4nmWfiMXw0s7RZqmki7HNYdJPxvluo=;
        b=HTT9F2dGAfoQjXKGC6VgMktMqvJgYpyw7ztyUu/VT5HYAV4S9fFmJbzx/CmjoGL676
         64X6MAyte8M6VN1CWIauZhQgAfqHkNkVuhSxK1iNjwCb+kGbxDM/pP9U/KUf9jQEcL6W
         1t5e0JlWfql6OWkEpNn9IfGpjUpFvUtWrD/sCFfR1yfZzWd9deXdnGqcbfgNCytEdiLe
         wD0ZaJwWH78EGnfqim86Y3vn+rBANopvabEXDjgnOMO6DyYTmwySs7TjTdR7rUDfHyQO
         JtgY4Bt9zXkQdTbQpMjhPf7IS3iLiCs1TasEspoRBwCaMNT2BN0dis5WP+7Zbl8ouuMq
         Df+A==
X-Forwarded-Encrypted: i=1; AKwUvBw1YEDVNVBScZhJxk1Q/LaufeHpgY9i7NUS1OUy3sF6vJBrYHJ+Jpj3JuMp28lgFjyC0m4izXSg+a4Bfdk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWbn/rXeVhmqaMGfFnjuwVmf4cA+lYgkC8WMXqLovtF7I3v2bt
	YZQ4Pd1qbvE7X4vN4UyHElOAoqDwrJTn5jNYZSLct/MFVsCNhPlkAf1C3MbR5OIC
X-Gm-Gg: AYBFou3YF09BdyDMwtVC6U9MNYHjN4+5MySZQG3DJUYHlWZ7NbcFNsu5EcXpmt27MPC
	T5XqLCRwJ7U3y3eZ88g0l1J3y1Eah/Lu/WwUoc33RbXt1di34cC0dqHpEhSeM6yxZSVDQhlYl5D
	8H/8lS5Q8t9uHkxuVlDB9fCmLbF3Rz56NgBlRw4dXAEsjGj8RhpPo1CsRXbY8PEYM0I5nSfE7F1
	kz6y8297uCFZBKtROj75GbOOBtafvr5eE9+YbUdGRegki/t+e5Rj085z/me18/33/qfRttL4tp+
	xhpnWH2Ay27QfHW1+YhPaIwwiLSDfaYldU6fasI51/alzeSHmNka9QTtaGRTTdK4v+iTZOEY1P/
	xo+BEMCHd/WQ/C8d7eq9mkBfhjJGue3Oili/TYrla19nThHCFvUWWcfKnEs2VOPyrFkRhHRLbDe
	SMo9KIsHbjYi4SutLJ9PnYJYyQuHbzRlpH+sdl/dKB3poTHUg8F8ksfYcNpuEjQ31gP9yl4V1yI
	mjOBi9BahQ6LXWrmquwqBRmTvo7SPM=
X-Received: by 2002:a17:902:bd47:b0:2df:8f81:e5ad with SMTP id d9443c01a7336-2df8f81e8efmr23449745ad.25.1790421257028;
        Sat, 26 Sep 2026 04:14:17 -0700 (PDT)
Received: from localhost.localdomain ([104.28.254.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dfa60bfb1csm7247365ad.48.2026.09.26.04.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 04:14:16 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sat, 26 Sep 2026 19:13:59 +0800
Subject: [PATCH 1/3] dt-bindings: reset: mediatek: add MT7629 TOPRGU reset
 indices
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-b4-mt7629-toprgu-v1-1-c124bf9ac273@gmail.com>
References: <20260926-b4-mt7629-toprgu-v1-0-c124bf9ac273@gmail.com>
In-Reply-To: <20260926-b4-mt7629-toprgu-v1-0-c124bf9ac273@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3

Define all seven reset IDs documented in the MT7629 TOPRGU SWSYSRST
register: INFRA, ETHDMA, DDRPHY, INFRA_AO, CONN, APMIXED and CONN_MCU.
Use their register bit positions as reset IDs.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 include/dt-bindings/reset/mt7629-resets.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/dt-bindings/reset/mt7629-resets.h b/include/dt-bindings/reset/mt7629-resets.h
index 6bb85734f68d..828919eee298 100644
--- a/include/dt-bindings/reset/mt7629-resets.h
+++ b/include/dt-bindings/reset/mt7629-resets.h
@@ -53,6 +53,15 @@
 #define MT7629_PCIE0_USER_RST			30
 #define MT7629_PCIE0_PIPE_RST			31
 
+/* TOPRGU resets */
+#define MT7629_TOPRGU_INFRA_SW_RST		0
+#define MT7629_TOPRGU_ETHDMA_SW_RST		1
+#define MT7629_TOPRGU_DDRPHY_SW_RST		6
+#define MT7629_TOPRGU_INFRA_AO_SW_RST		8
+#define MT7629_TOPRGU_CONN_SW_RST		9
+#define MT7629_TOPRGU_APMIXED_SW_RST		10
+#define MT7629_TOPRGU_CONN_MCU_SW_RST		12
+
 /* SSUSB Subsystem resets */
 #define MT7629_SSUSB_PHY_PWR_RST		3
 #define MT7629_SSUSB_MAC_PWR_RST		4

-- 
2.55.0

