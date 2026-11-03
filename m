Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742013;
	b=AR7gt7hIJqTBAvZH7P1KnrYDOoU9lKdGo7nIkVae4qQizlvhGMafT6zRCJO4tW++ybg1
	 VqGL/MB1XrZw2MtYMxFC3bA2hZiFy3+ulQDXs6ae+zJOi+dKsjvLy9mLAygLE2oRLAgjF
	 eerQ8WtNuvImqAlGLCZbkFRtyhBjFs6coh0b5tq8EPHBmkF/HaBSgIHRcsjB9p5ZK9mYW
	 EnKy3eWaEiaHqb3pMmMUZdxUIywUVE/ZTAUbt4KEyWB34jgP2gYdPHCGz+VpIfmVmBLuK
	 Q9pu9sDJoAlSTitLZzIRbfwrJWdWpjdBMCOk+ID/BLOHPmjabqn/rfmFptM/3SVl9Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
	b=VBBRrBZLUcSKUoP/bBR/EeVCj9KZ5Vwj8eaOyj5yNnSKtShtc9lWIc47Ti3jvMG1bPOR
	 98jRyKZ9THk+lS0Ey4yi/QlEdkW568lFrMAlvP7Rv9ZMXnMN2LwnjajHkjFYhaVw5yh6p
	 vae5Oq13mDfoTKv2XARkdHmk5ytUvGzUSbPhcu93iurkUD31WkrI1iuS5r1enkzCOBYao
	 fK5cdnXFgUeRcLUV6lYG18Rh7Zuy0i5jTju815ZRsled8G+JjtitGGCBhCXfhJtbUzjWk
	 yMxNadFoxTCWfQx0FYbXNxgFabqOh4GT0CnyVg6m1j3OC5mZW01zyRxiJB2WZ5X4fsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n7mZ+KIh;
	arc=none smtp.remote-ip=209.85.167.179
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DD1606D81F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67DD1606D81F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n7mZ+KIh
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-55e02e89f78so28464b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742011; x=1794346811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=n7mZ+KIhd+iy36BqqT4I/trh5SfXup7BgaSb8QuJIUIPwWf7lxWDj4Z+WbNHY78DQc
         irK3EeE7y6ZgGlOtHE3LcU4gj/hKxxZAOU9jgYSgCDlZGqVhIDDHrj285wEHJX2uiyOW
         RSZR7A02MEvSdHpGz33tXN8I0BxQ3EpcMfvy1FgS3Yi8LL9mtaA7RWE41s/s869lxHNA
         ZE3B1fmfQ+8a5UnNBfSbIrO4KBFCIBpYdll+fObbs5nval6qmwji91gAt7ZLQTqLQjit
         5CoXmefAcBkTHFz9iXjjSHfAiRvvqLzZpC1nCDvkpfneg3HweCDM3Z+JQSdZIcJg3gpw
         pRBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742011; x=1794346811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=PlQVqqD8RmokZXL2G/w7r5WuUTGvF4FD90EnM+ZwV8B6b7eS+Ebbplt9RtdfnzmXmY
         pAbgo/xnRYYZlyNIErtYJltgzXeDldYE5nNHYXsyjW0I4DswciYIz4x411qx0TlORWSG
         qK3bfMjJxU4UY5RJkcv4RqqFvj2shiXDwDeJziT53EZTlMbVFtbfNRggv8qtrglriSCC
         OK2IZH4rhu9KUOKZG+1os7UQxVF03RB8yZwmYR8/xN2BB5d2VTX2ClJBbjPYsFwL1RsY
         k6HHPB/zpEYjI0XS+OXeJ8ufZDoUowOztbSFagxlJqRa3qNJNBrJWwGPQeWDD5rdN1V3
         bUAA==
X-Gm-Message-State: APuU4Z+m8fdp4tUg8INeRPW730/+yosZ/4NLRcPBIYqN8sZlZghBhzg1
	xQbr2Kb9hNz0MXJ+gR8vgwQkL71ugmIJpG8Q04BjQgg3cegD9LhZIUY4
X-Gm-Gg: AYBFou10jmYYS2zduKzAj6exF7elsuhxfpqHZ8SLMjn/HZPjxZ75ZE04EvGZIqHpJ82
	U/j4+TwxaP4xJnkp678BQPd/sDpG6N8ICduuoYXTXvQc+EVfHd5BdeeUtjXzrofnJyvtXfxB7TL
	mqZV1igvFDTx4ecg/tSM8WZ2yyp8fJGIl2kGwS3sSxF6uipcOtPPtRhdva78cHXwgdE/HTv5mvX
	qMmeAPctkHWrVaQyF03DMOrcnrdum47qh8ACi9nziAjKDGkQszc0wfj19eovxq3JmdGzaISR3nJ
	71sWUopLBgRYkG6OlscIVGmIv27YSUiYZYsbNpeADnTCtJ/lKaI7IXN8Sypa2fMwJ0ePp+4R9x2
	3IFa1O9mW12fNSUNe2UY54yPxErlP8F462JSLSdoYCKtsLxIisXLCZGe4iMc9oMZYDlen1onwW4
	pSm1PuhZPPCYdHuWg8LAInc9Ef3o1Tu+wyaZ6vcRiualqbPoPpbcJRLp5hTE9S2q+Bwlt7SmM/M
	boWRK3vipqfA6VxXbclGTdfXTOtoGw6cXVUwzXvrRHPU2LBF+ZKWLJnwZXgRpDtENda1DY7DzOr
	r2EisWK4nlrU1dl1axknOnJnfZKIm5S/yn32tlF+f0T0NjShtH8zEcX+N5chaWXQmi5zp23Oo8o
	mz76lRPfiMLat/PgCrFpUaZzh5/neWduCdeXd+5CM/NNPocyfCQVtCgFu3JjbmQxrRpGLsGJzJ8
	4laF3vrc5LdDNhlo7uTGmOxup75H8zqMQDvtXydDaKJpT9gWwd6dF2
X-Received: by 2002:a05:6808:2507:b0:4d6:90d4:6bb with SMTP id 5614622812f47-5640dd9d63emr10403938b6e.45.1793742011356;
        Tue, 03 Nov 2026 13:40:11 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:39:59 -0700
Subject: [PATCH v7 06/12] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner H616
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
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-6-c9e248d685c1@gmail.com>
References: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
In-Reply-To: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

The H616 UART has 256-byte transmit and receive FIFOs, but its DesignWare
component parameter register does not report the FIFO depth. Its optional
register layout also differs from the generic DesignWare integration.

Add a specific compatible to identify this fixed configuration, retaining
snps,dw-apb-uart as a fallback.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index e2ca126d58ba..fc1289073241 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -60,6 +60,7 @@ properties:
           - const: renesas,rzn1-uart
       - items:
           - enum:
+              - allwinner,sun50i-h616-uart
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart

-- 
2.53.0

