Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008664;
	b=TEq2W+Hgphxpa/UHDv5lBq7CT/Muporbe6lNyxVRaUy5mTuE4TlNlwMNY/zvxGBRflV5
	 X9WP8H5T2g3+FuRzc0NB2cC3cAlHE3Nf+OxF9j9WazZmIm/RkFX28N35P4M/TurlMrPt9
	 GL1dfsIPKJfTKVOiQOQiLWwpW2IG9DMwt+vx1dYKExhHCIDZDW2DKnMIbpjH/oCuugXmB
	 qA32wGa4s+D+927IusRSUyoOOLOWoeIESbpZzvFXVKJdwRaZTsOKCp+WPjAcHbtcnNwfa
	 YY083TwrJhWRwsq0/blp06XuanbpAsUgeJwp+9cIIbh1Uijh4ywPJ5aeTlT/wWng0RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4L8nH3HZlXfWwZy4DPfohBXHPuRgz3HmlatAZsSpZ98=;
	b=1V4u2M1rJBTFjuWC8ErbAw2hbas6RYlbdKMzRvOqINbX6r9N37SMtcoAtKX2Vr/7lbVm
	 OxzXfnSwqFNNpeSyGhZiEz4CzXNhpeIuRpn6j8s884Mus5tcuvk6pbcZIEinHpZSntz+l
	 Ca3o9V1d5vOKEm+h5KWZem6q60E/xHP1grvdE4ygNS0OrP1U+8ocTsHTRDmoYPaTFYfY8
	 ZVSADZsZT3iSmP7OEzU1I4sTEjwQExdqUGazAyCMzlVJ8Jf6LwVPnpSFli8gDhRAC1EeN
	 mNgombfveEVhO9Q4+7lKF6KEOgZRcg4dqGRgirDsO1rB3lK2dWKS6GkyXU7nMdUQcmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TLqXL2iK;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BADA60A6F53
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:57:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BADA60A6F53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TLqXL2iK
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so22896165e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008663; x=1793613463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4L8nH3HZlXfWwZy4DPfohBXHPuRgz3HmlatAZsSpZ98=;
        b=TLqXL2iKvjwSgi1h3aSaMG8WYQnNJBzAfyFbahhRtBEt/4x2PySNP9/kw4lb4lab0B
         EyTghafYPlE/WX7M4RgCQl+7aAA5BfTNaic0VHql3KXRo3ofqJHbvnUw4QnnaD/GbK/l
         s/eWxX3JY8JXDBZR2LfQTa4X+YqHMkcnxrohzDd+VSaWz/Vd8SQ+C11plgTY0E+AtGJi
         EvJzzhbGKtM0/ruh/YdYpU3AGBmgMNaiKnyp8jCOF4ju13WqHOU/zhmyS1H8E8na86rc
         wrvBUVsnBoznl5fniqVQcbUKXw23y3I/G2phdZCC/yYGI9nnqLUuZmsg3EZkowywV6Wf
         N1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008663; x=1793613463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4L8nH3HZlXfWwZy4DPfohBXHPuRgz3HmlatAZsSpZ98=;
        b=X2XvRNxJpdiO32xz0QYQz47BgMCRPUd0TEORzXG3BtmADLLphYO7GsXxWx8oXshdH0
         btnDmXIErRUJZI/Z72jlnXROnW7gFPlj7t0TkwYDWy9GSDkChOMgRAQnYtaFnpBJfqSk
         /bObUjMx50vXCfcQa4qaziMRzDX3il2gIJNhOX8daIwVeQ3vswcfcgKuj/lm/l1UvLGU
         OMjda5i1ZHcbrqNwXQA0AMEJMBnHg9XLU4rqilDKq/J0Sb0V0gVgP1Yregx0TKv1pNU8
         +ikSTWUn9svlbXqyzDNeQ3+0FoeYGiD7JoaaqJQ1sROPrFOGdKGwQ8Jzhnoz1Vegcw5s
         xCWA==
X-Forwarded-Encrypted: i=1; AKwUvByICJMKqlkMcg3snkrSbWIVG86JSVBh0nPbmqPvNvwkPZMOzMOIVuGoXTYB8O9Bmm1yqgaI+8bt3FPBET8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKqCGR+rqW/u+s2CAP2BDVHMSr9+m8o16ajZ08IISkwFFkFbyp
	wswmB8bn3M6EU5d2APBVbmDH1dtnFXliR8ODyd0dJMeq3aXqhFNSSjcP
X-Gm-Gg: AYBFou1WeUbXnSgjJJYf3vMDty6wx8n+cPcYAmR2SFghinCqFj+bdjFoBlgnX2I7VdP
	1yWC9Gx22vsyKd8HO3g8XIjOugo7ptVh/Djl+lQvsOxfZ7sMEOZV9v4gfhU6xH+XwmK5FNpcG6v
	sIRkYmq45jy6AKSjPJxxuv+lvm1mEFRm4JJxeZI8sIYnVg0R9do/54lbcvUbRaR5GysDKJu51XU
	l2e7TwVToTS1v3FGK4nNuMPrDKNJ9SXKQm/9XzIpJDvAimHryBjrrM3JHxkZsaypgE9qGA6aa+i
	AjDPduekxeS86T1Dl5mnhyf8iwWv7MC9LYWtUn0uV8bKbtiYrmE2UL9ZRG74KkyRMWFegDLsSJd
	gthel+gnaUSoNw03wEtFferJ2bbvh5fWTG4QIamfxI9PcdYV1x0dHiIHZUmMrolBYRdQJ3D6ohe
	H0Rp+glj3dixtWQ6bE3ZeUminKloPT41Ue1OJhm2P45CMA5ubBbQa51m+tX7E2NisXHryO/91wI
	1fi7z479ZAewWbmxZiW8V65+aU3CiVzUq/f9ZKnFX+pTMKI2S/NEuopCTWPqBtYtFbSDOL8aldy
	j+2BrcIQvdGvI/LULUSUivRb2ow33i/OPeEQ6iP1yIXn7e64gAf0H+UTRfFogqXxD6JE7QKqWbT
	8u0Lyuw==
X-Received: by 2002:a05:600c:1391:b0:4a1:fc0a:8b75 with SMTP id 5b1f17b1804b1-4a35ac9f430mr115674445e9.24.1793008662683;
        Mon, 26 Oct 2026 02:57:42 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a35a0cc374sm190382825e9.9.2026.10.26.02.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:42 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/9] arm64: dts: airoha: en7581: add PWM node
Date: Mon, 26 Oct 2026 10:57:12 +0100
Message-ID: <20261026095727.31708-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026095727.31708-1-ansuelsmth@gmail.com>
References: <20261026095727.31708-1-ansuelsmth@gmail.com>
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

Add PWM node to control all status leds generally attached to Vendor
boards.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index 3a4a4fb0eba9..760f0c3e6090 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -509,6 +509,12 @@ en7581_pinctrl: pinctrl {
 				interrupt-controller;
 				#interrupt-cells = <2>;
 			};
+
+			en7581_pwm: pwm {
+				compatible = "airoha,en7581-pwm";
+
+				#pwm-cells = <3>;
+			};
 		};
 
 		i2c0: i2c@1fbf8000 {
-- 
2.55.0

