Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016574;
	b=HRXf64fHDkze0hxNE3+1ux71V/kQRBvliIduRLM91mdYX54v9nfvrD8vsKBgJZ5gsnpM
	 VVepEfMGfNnob02iKcFELS1AvsqcVN2r0w/cXZLDFnulczMOjo1ga+eAiumWS3rCIU1jB
	 TDptdNXSAB9pkqZastu4WBy9q6odIpd5iwo7HUmv79uSNOore0Xzi296bOeTLwKgAc6lu
	 T64BGSQaNYV31BZ+C/yVvHOhb5S2SiPUmUd0hIeLwFcrJVzxlyEz5J8P5qXmOtzT3nyQo
	 q5Vh8Tk1fISq5TDqtje1ba76nrwr5l66P8wiMqLydWDmLBisLCT5UxabxUHITU1o0nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VV14yapuLeyJsZV0KRxSW+/Y2gb4EQh5OYXL6BU/+0I=;
	b=ASI/BD0QJR/EVZr/Ek62jqZkAqtgummn5Fc65RG5la9b4IYKuihquj5Vneiy6GeDQem7
	 PHYb8jKCB+ObRIiOrvm4ualv3EN3f4QiuBPuRjh8p+y/CsUGxYHejQ2lz61T/7KU/pjxc
	 goEIhcTd1Aq/OZtBpvAJpzRtEcOV9G7VNyxVmUUhLTAIguarQ3VxfvIC0Hh0bTEogJtiR
	 mStULd2c6WVE1jqmpewYkeqlcrHy1mjOHgiyZNBeb85XohQJnMzFTfpUhCzywzvWxhBKe
	 Ak0Oy+ONOuhty458NACFQxVP53RHE06Xhis5cG4IOlilX/P+wzII8HKzFs+2pBMx9dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VZ6APpqb;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B7C606A327
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:09:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80B7C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VZ6APpqb
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a214af2076so20400215e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793016573; x=1793621373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VV14yapuLeyJsZV0KRxSW+/Y2gb4EQh5OYXL6BU/+0I=;
        b=VZ6APpqbtbmtTfKFu7n9KE6Svnl7o5+7gdDW2eofGKywyb9cCi+w3wraqOH6jKRHc6
         fGH0wnw93Dd59K1w2V6c191KMj/pv7vhjM3COFjZW85+BkhqCh4rofAspC4c9os7jCJL
         Oe9182Ht099MIMhZ7FGbKrQ4IQ5qFf8hzc1r0iKnv3LQadJGvqfgQ0KC494dAenmMw0P
         mUAVPfkkdIwJ4DoSmYCGnWybC635Vv7zO9hpalpnwJpEoovHBQdnFj74cOZkLAzsfsmh
         sLn1aDWp9uge8Drm78MOyaO7qwOkreYJcFuWPIUieceKUnCgD0SEZTLCe/Bb6uiVLjXY
         saRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793016573; x=1793621373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VV14yapuLeyJsZV0KRxSW+/Y2gb4EQh5OYXL6BU/+0I=;
        b=DLUS/Hr90ts2MBXE5sDm78ySdbxkci4oWUqd1mwqjwU44OMf0d+PTAl/sh9vGQl7K2
         pa0XQFTHklF94eRYTCpHnBhvadvC3BbYjfiCIKRD5q127x24Szn3NC/8ZoEXXHNeABGU
         FKufoubeW+xTupQVuQpxNXhnbm0p/n9YhuLE0O3iUqotz+u2j/2xf8LrbdwwS6t4TgkH
         iZNL/L8D9lrgbOZ4jgipjBxqGYiY54S3mn5FfyRI0fVqIofWqAYsueVJM/FZ51b5wxSj
         WCUPDnMu9BT+YNQP9M4gtPWKbT8u+iAXHDO9JkQsQ8/YbSRYOm2aEHN8/J113fuX8nxX
         GBNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxoOfNg0xIAg8giBN3OgXsFeP9Zt8f3vbKFcIhzaMYODkcb+8TjaXi/HxnuJHTxp8gounU+fmIJDjmUFt0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJh2sX8hwBA91G1wdKS6I1iR1h7M/zi0n+N4hCGhZBjIQl7Zu10
	iA+JVzdCAK1+5R+Gqwi4k91shFkjxMBpIf/9UBq0N1kxWTZc9i7gxlxw
X-Gm-Gg: AYBFou2RCfTjPZlNrOgnAk3AVGyrOYAnkMVnb54Fu8jElE/s3TB0pSmpYI7ntmzPCxb
	LAAwz0IBXy9LBqyFCxkHxhpNAOWiQldSBmfQ23Kc4HicT7vDgjcccIW2G8sEme15OQnrVzAz9Ww
	AH1Ig1OVY5RJKlrzziruHl34NoYkMBE9sUVbvDytJPv4bCctCUkM2Aubduz9SwS7dqnokODEHdI
	XRn+r6qpDLbfkMsIThmTR3eLUgyLjICamre/sLhMct/oUBKWNOzfx1+dyYXxiYAVmknESJZQGDq
	Uuz5LzNeolLiAQxIlWIEZRzWTivBPGEbgP//SQZM3m/cawS5voPPDHGbV/rOODbrFAXXK7xX5ID
	vqzsBNc1lpxtnbdWKycmRlau2gJyqBdUxufpRm8S4iWYb2w2sfWVv8XDBV5bnfOrgYq3YbUCGW9
	aVnvcsdHnBvXs05byqpcKHvfvVgrImSDXK3nDtVJJ/YswzP4YecYPt5ow4wa1F8tpdzULzfDxRx
	dKgBqAGW1f+da/wXRHNZqcenTN3HEjgfLjJ9KKf19Js6e9ZDhCEzGQ9onNGdBDN/14NpbJpnPet
	BvJKXfcYxT4Q4g86oFS+cv4b52Gor4NFO93CjxL/cRbQ2A92m79dtor6X97sUgm10+cndFqhjpH
	RCCMk
X-Received: by 2002:a05:600c:a06:b0:4a2:40:7f35 with SMTP id 5b1f17b1804b1-4a35acaaacfmr122280585e9.31.1793016572849;
        Mon, 26 Oct 2026 05:09:32 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-14-234.xnet.hr. [88.207.14.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a00e1b0sm152200695e9.3.2026.10.26.05.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:09:32 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: andersson@kernel.org,
	abelvesa@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	taniya.das@oss.qualcomm.com,
	ansuelsmth@gmail.com,
	john@phrozen.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Robert Marko <robimarko@gmail.com>
Subject: [PATCH v2 2/4] dt-bindings: clocks: qcom,gcc-ipq8074: Allow CMN PLL bias clocks
Date: Mon, 26 Oct 2026 13:08:13 +0100
Message-ID: <20261026120920.1667982-2-robimarko@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026120920.1667982-1-robimarko@gmail.com>
References: <20261026120920.1667982-1-robimarko@gmail.com>
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

CMN PLL in IPQ8074 provides 2 fixed clocks to the GCC clock controller.
In order to describe this in DTS, allow passing them as the inputs to GCC.

This has a benefit that it avoids doing a global matching by name.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
Changes in v2:
- Keep the existing four-clock form valid with minItems: 4.
- Drop the _clk suffix from the new GCC input names.
- Correct the NSS NoC bias clock description to 461.5 MHz.

 .../devicetree/bindings/clock/qcom,gcc-ipq8074.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
index 00d7df75b3d6..1c9854a5c572 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
@@ -24,18 +24,24 @@ properties:
     const: qcom,gcc-ipq8074
 
   clocks:
+    minItems: 4
     items:
       - description: board XO clock
       - description: sleep clock
       - description: Gen3 QMP PCIe PHY PIPE clock
       - description: Gen2 QMP PCIe PHY PIPE clock
+      - description: 300 MHz bias clock from CMN PLL
+      - description: 461.5 MHz NSS NoC bias clock from CMN PLL
 
   clock-names:
+    minItems: 4
     items:
       - const: xo
       - const: sleep_clk
       - const: pcie0_pipe
       - const: pcie1_pipe
+      - const: bias_pll_cc
+      - const: bias_pll_nss_noc
 
 required:
   - compatible
-- 
2.56.0

