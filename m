Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793294634;
	b=ZGv568cNFG8DbChKKyS6i2hSgsdv/i5qq8Y9iHylThtzKZSjpBjLMWIYLT2IhBC5Rkp1
	 4V0EkN6S6pzajThlNE7YQ21jsAlpEChJviXYUmIjKWE40KIYTwYLU0pCbZve9JMBWTWlZ
	 y/IuWJKO1mnpe4/vZUtzN389LcdtzbGCj4czVohfAUIKCmRh4amGpXw5LCGcbNlAkQ3hf
	 t+2CYcbcZDjyAm19iNkeozcb7YyzTjgAoy1NYlTNrZ5/3OyRYOkv9MsTtnLv+tq6aIOfp
	 YVK9YWB0R61/pah7izgyCsq/pVQ9mmpXOKyxqRkXc96ZXG2NeYPp5BnlJsPS00mXpXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793294634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tY6q0/ZAtlO7c/3kJ3SDz18C60kPr8B6rEIMfU8K4HE=;
	b=k7YBmufqmi3GbWEpAF3M14Ox7U9k4SuHcKjxLFFlUZm6eWEQvePU47L4oRTNvNkRGts6
	 DLHRu1Py/+wtWo7op1t6hJgwILT5z0Wmh6CYg7kIqKjO7SMgPQ4icLd+9GxmhS+LwQ5WP
	 kZeD74dC/voaIQT5SZZqzma7pd+ORapjzd8Q2v1vtL8FBtCuA+saxOSJGHQPMpDxj3V5g
	 bDU8w+fii/aec3x/r9PauibApcFCx+XVRLggiqRyK/YDY+M+X4h4vhy/dDkY1eZ0pBt2j
	 4eKLyvTMQ1nW9i+UvPUfdCDf6uaqJ62cUQqb+/KfliQS21BCOt5IkuVLxBv2I9bI5QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EWkixhna;
	arc=none smtp.remote-ip=209.85.222.50
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEE0606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DEE0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EWkixhna
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9907fa1d2d1so661814241.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793294633; x=1793899433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tY6q0/ZAtlO7c/3kJ3SDz18C60kPr8B6rEIMfU8K4HE=;
        b=EWkixhnao3nJnRtwfw5EvZLa6enZDMvgknCDeByS3I9hy/SdvyMvoA2P9cllkqLply
         1XlZsFMNi0c/ls38lTcr37I89CK+eijbwVcFLtRlvmCEY0vZ6dTBXHHOQ3DlCOYfehs2
         LI3OF3r1aPcqt2ZAf0uptkab2Z1Ubn+/e96z11gKW45GYHqMxStfxNUXBPswI+eYbPeU
         g8mNILrVf3D/La6CLwHJ8OVmTQz6uy2DDtpyt+Hq/q/i3j03NAohGUvh23TJaz3coT6n
         JSz9zVce6jaoHYFrjS4KxdtvNqdWP5/9sX14MgIgM8gFf6oObOIrRn/3IgxGr6vBL2r9
         2pYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793294633; x=1793899433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tY6q0/ZAtlO7c/3kJ3SDz18C60kPr8B6rEIMfU8K4HE=;
        b=Etwb20WoRLrfsczId7iUl3Fijh5ikRXT0NPJu8X3dRE5W5beYeZYuPGQiiS8IBvWBY
         k/BpJmkdgZYSLuiWpOV/3ldcrsqBjLhdgB+BOe333EJ9+4zWiJd2nigea2mRzrXzyghx
         qvVhwH884LhO5Db66xtnZaOiFLMIgZLwWcUMToDHEZmchIA/cY0I0x1C/LxBfozy8GaG
         M+BUIx0LCwyrqbBNxsahVgxXswQb1Gq0UPodkTwS7IglDpR1JLCjxsOA0gBlFqqTw0OU
         dunEVYogyOmuT/G/H2vUmPbD3MM4aJiblUuWpNOiygWMnJ9gy4WIm59YVzTflmCgETkT
         CRXw==
X-Forwarded-Encrypted: i=1; AKwUvBzz/Xp9cHs3xHwFJeS9xQn3JUrNkXmyCe5qe3mPnwUYdiJQCIGIYRcLalZiUUlMTIILzsb7kuR9NlTXOBw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgme9PkXgVhyDprlCrUMJ4jaqD3jjF6zj9e7sVd8j1obeT6CVe
	U8QBVa44BEnxpmPuDiWkVOoa+Rvt6+VoBePttC/KAdvRIWYXKpqKbkjM
X-Gm-Gg: AYBFou3fzOh2kNQDYsJfRxPYTT/9XkymNppMwuk8txOEn2nKyraUu5ZXrc0TlWDnAzO
	sOjcFPSAf46w4j4mlh3+dhLhXbkdUIdDbpwbyiDkrkoIJUFQaLS/FTaPJhhXzOlZU1TbFxvdlhM
	1c22jJ6B6GHkZtzcID/Qq3Gch6g1kjXGdr7mOWEA5lr9WBPPf6h4Knl09zjFwnWJi89sgmdsmEw
	EKUSjzXKVorwnBBJd12fc6fe4nViomOoPGSEQL2q7i8J48zirrY4aTWmXRN4mMb154Gxss+LXQw
	HfAKLC5FS+PAAMmoHJ1mOT+Hm1HWowmSH0FjEacqDXeWp0T3FWHwe7oFxPYIwhUIc/3ns5oo56h
	jym58BvRNhVPLYTDXQ+Hb8Y8rvbWhq8a7a1Vjph8/Mg4ojVMD0CSRyP4Wmc1c2XM6932UBx0wt3
	IgDiFMYrlYb9koDKAc3UZKnWqULGdpmrL0FIKCyhCaZY7EHLn8uu1twHwnxYENiB5Ub141ndUA9
	ZleclucR6cz8926cfCAR7CjtuVGvsGlr0fHyZhpGB+/Sys17OtbiMjcLPXoZrDyxA7W/3Tk/h9P
	iOQcD8hK/ctAP0I/fKRJIeZRhVArRxiY7rp01A21zMCDzmE0R6wu/hlRUt7KoZQUuO+UE8XC+0L
	Z+74sn5vCjh4jt2Pme0mBs9Ac0Mmox5HMrIOw
X-Received: by 2002:a05:6102:1626:b0:7cc:2bb7:131d with SMTP id ada2fe7eead31-7d03a4eabe3mr2727809137.9.1793294633099;
        Thu, 29 Oct 2026 10:23:53 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cea3d32a48sm9907357137.9.2026.10.29.10.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 10:23:52 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Xu Rao <raoxu@uniontech.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: phy: document Allwinner A733 USB-2.0 PHY
Date: Thu, 29 Oct 2026 14:23:24 -0300
Message-ID: <20261029172325.3425046-2-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029172325.3425046-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261029172325.3425046-1-vinicius.eduardo.pedrosa@gmail.com>
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

The USB 2.0 PHY in the Allwinner A733 works with the D1 settings of
the sun4i-usb driver. Add its compatible with the D1 fallback, as was
done for the A523.

It gets its own compatible because the driver has to clear SIDDQ
before releasing the PHY reset on this SoC.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 .../devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
index 580c3296a18d..da4ad6fb3531 100644
--- a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
@@ -23,6 +23,7 @@ properties:
           - enum:
               - allwinner,sun50i-a100-usb-phy
               - allwinner,sun55i-a523-usb-phy
+              - allwinner,sun60i-a733-usb-phy
           - const: allwinner,sun20i-d1-usb-phy
 
   reg:
-- 
2.43.0

