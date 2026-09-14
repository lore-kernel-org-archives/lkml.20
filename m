Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DA035AC34
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789405130; cv=none; b=p9wPAlEaT3wzkohxf/P0yeJlewJRLEsaXTnGN50E/HXQZj71+3U7sUm7gJwDzn2vREePZ2TTYr/apub5c7LDszOyONIMg68T565S0v8GUnJmgdib31tdOTsrAXgIELGwtUNl54mvsZO1tZ8dOY+CIGngJp9xbqGSpxKkG0HjUW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789405130; c=relaxed/simple;
	bh=wNp5wOIbM4OkByN3NWZoZARJH3K8Lw/flM4b8WOkfCk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kTbaCbexp3er2dZoGSurpNaFrkJ8pswg9DZrrDoYW0GbGQ3Q48WFyOcV6prviRQ4C5zymZNSJAXI5+/Qv+sScJXETqTgRO7j1pb3fxE2mbrd+YP8sabgxjoyqZAdxlczRqtFwOzcZB8zDyYGBslibOLZkL4iE+vNtKYlI3+dWzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D9iQyV5x; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D9iQyV5x"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-486955ae01eso2950061f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789405126; x=1790009926; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dV48M+3JE0VY/bF+CPkH7qMlBx1w6Neo/WMv+TNH3YM=;
        b=D9iQyV5xzPFeDkrW/AT+ttifLfPjTz4Cxi4BnfNUxGL+Xd4z1Y1E4Cb0189o7KtbGU
         eLl5LoVBfiASN6lMK7EkWEHKid2uJai7OUWXNOpLyiopZnnNNB2hBSZz6QYritU1eh78
         vpiMulNv//mkU3umTIFWeHnt/FbEevlrOVAtjU9yzbc9PDQXJsMLi5nuyeAB/GWo0nQW
         iGgGh4Lze9Vv7NXiAFIlVAvmJrQHj0souTaAejma0jp3INO1tPYu+ptII6NblV3e9V+J
         +5BXcw594teKlD/ebsQTVXI7ADBFhnpYOpMILmBRIRTwgixjnq3y62aONYCqUB3+BRg2
         ssxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789405126; x=1790009926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dV48M+3JE0VY/bF+CPkH7qMlBx1w6Neo/WMv+TNH3YM=;
        b=MGClKeCyvzU2gmg1gtv8mZn7h0Nfo0wOf9Rse+Z9s3f3ha6sQc+4eIErGfDuRQKa+H
         J+s3Yn+FRWzu1BOrqbbILzBmtJnYrQuql7wAucDwMPGKsRCkdMrLKxvaf3Rl+QfGVwGq
         /3Clglf6amph3GGdpECpF2y5MZAsV6brZr0Zt9ZMLjh5wPqjDi6VZK1r7gfCyKD8sw1v
         rxz7dgEQXtQA3FQXkPhWSvdUwYjz6RB3zXwHjPP6irs4cM/Me3bRoHFKAR2+FxIHZf4I
         aYlVbSwFVtdBRKgt3l0dq3Tcw3fSM8mbzuguLjd2ylCID6zxrbhJgLvF+Xt5/ogUtjy+
         x7Fw==
X-Forwarded-Encrypted: i=1; AKwUvBwznXpkuBgb7cpuvp8vQyGBbYepmuHenl2wsBCoPItDv+deIY9uN8FZIHab9elxyTwu6qGKmXPVOvybiX0=@vger.kernel.org
X-Gm-Message-State: AFuF++nmeNPIc4u6hYzAA530gKSUVFaLewQLZKy/1YWzkemuQDVsT5oZ
	RGesy+JlCIIuwqDbEvUi5rNV2afp7VaGUDqRoXGuK5OIXLss+HLmE48QOyXwZJLwl2U=
X-Gm-Gg: AYBFou37d3KolMpMdKaSzsOIfmqeghNUskxKUpE9Vm/xLg4gHh1MtAbyxnNVms9FKrv
	Otk6E/rHzqDyyptlBOaN2+O5rBK1uDwweTBoCJXuI0iFuAF/iiELBxWOI7wzza+Cy9xFnwW6MqZ
	pH1gb9SoW9DAFKjQ50ssYBhsgEXm4FwhJ2C/JWCu1e3439XBZeIg/i5q7X/cFJ48r1R9IWP4S+G
	8+Q95196uPbfFkp5LRJfHlq4CfwlMASieSbANXle0GlgfeNihK83Au/HPdewcdUCDrQ/kJfJkUw
	IDzB96qUO1GSehOEK/zFruKXCC9lfwzdgeM2m14mpDKlezm2+hKvXHHSrj4asPKFoN8cPib+m0O
	SH4s69Qk0x7YrLwn9yTeROTgkkBnhQqScNHhLE7cqBf0mgFrJeiFxs5yGVtNxYKxeb7SybIENeu
	J+k7Nl3B5LXOo1yY6OKEQra3YSiu52k2QtDxeGGSaZy5F5WMRe2EMqd16tRIZNmJTsoXwWo363y
	9kvj4eU7gQAQQBHzvJaaRKpUAkyboHsdnqS2185ezO/tm+A0OH60HPQKXujA6o=
X-Received: by 2002:a05:6000:2685:b0:484:4880:449d with SMTP id ffacd0b85a97d-48702aceed7mr5488987f8f.3.1789405126615;
        Mon, 14 Sep 2026 09:58:46 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e81asm29636198f8f.7.2026.09.14.09.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:58:46 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Mon, 14 Sep 2026 17:58:44 +0100
Subject: [PATCH v4 1/2] dt-bindings: sram: Document
 samsung,exynos850-acpm-sram
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-exynos850_sram-v4-1-253871de0f61@linaro.org>
References: <20260914-exynos850_sram-v4-0-253871de0f61@linaro.org>
In-Reply-To: <20260914-exynos850_sram-v4-0-253871de0f61@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3

Document "samsung,exynos850-acpm-sram" which represents an SRAM region used
for ACPM communication on Samsung-based SoCs.

The SRAM is consumed as a whole, is not split up using child nodes and
properties related to this are not required, that is why "mmio-sram"
compatible can't be used for ACPM purposes because it requires child nodes
to be declared, which are not needed and make no sense in case of ACPM.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index b83fc6831947..b9c4d4f3199b 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -43,6 +43,7 @@ properties:
         - qcom,rpm-msg-ram
         - qcom,shikra-imem
         - rockchip,rk3288-pmu-sram
+        - samsung,exynos850-acpm-sram
 
   reg:
     maxItems: 1
@@ -159,6 +160,7 @@ if:
           enum:
             - qcom,rpm-msg-ram
             - rockchip,rk3288-pmu-sram
+            - samsung,exynos850-acpm-sram
 then:
   required:
     - "#address-cells"

-- 
2.51.0

