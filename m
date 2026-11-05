Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911952;
	b=c/16jFdO4KxcuI6hS+aN4y/LH8Xs2BuMCbOJqPHDe2YaHe+eWK8TQBOovXVKfH+4MP83
	 NRB5ow/oLdlOwVKjp4MV9satUinMYi3II+n4m+pgdcfCwCX40a/EIr7H1ZtOKckNvD2mF
	 Nj1EkjqAr10ZAKWZoJYJYdVrN9M4xWA5u5giPWIsLY8hIgOJPHE4l3jfUZpgq1eTeWubq
	 TaiEpcfJlqbgEVVadD0j8aKp7x3+Rg0qw2UgBlSNNIzB9U6F8lFr8pOuCMVcpf/CKvXqb
	 svwMkfzCRTI+3/FJz2gAlMrDQI5KO/H7mOMdXQn9MyGI1rBko4DVVCLHKMy/eyVVAtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=ZsGYkHSaF8D1INVVG7IqcJD0MRHplG6cSUzvau3umEk=;
	b=xRR+zWbBJVnLKHoHHWzwPcZzoZnlKX+ZgVlIu/hGUnxQ+ELs23RmxqxFS7pYdSwMa/ex
	 VU2FXhO0n0Edkq7oE9bVteyFttX2gErXxJ4HQB+AKxW3KtTCXHtPvYcsKghXNs/YrExef
	 N5Np7TMMyFV7b2fkZNBTidwJeW2VsT0U3vjQO0gJJmxebpIafKjw2RqZmOuc+/+k4Q756
	 N+3xyt1BW1zHhUDorHevj2obMrSNwfC6s2e9IdKQuEKcTvNnCpiVOXQl+2VDXEXL7x4cS
	 GaMXk2Q70cjIBS/hao4hEF8MBBAaREuB3GUvPHsBebeQYkpKBmhpKve+OByFjyHHxbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oiI0U3KS;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC71F606D829
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:52:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC71F606D829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oiI0U3KS
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-843cf077f10so9727a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911951; x=1794516751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZsGYkHSaF8D1INVVG7IqcJD0MRHplG6cSUzvau3umEk=;
        b=oiI0U3KSmCl5sRBZUwtFDePkiUrIoQmVmZ13H5QCiPiAm1OjSVuBtrsUOoyUH1NiDP
         2PDIPcsXMAbo3IUxDfzkeBPWvvtvxg2WWdUwYaUZcYHnL+sdVPpU0eeQCAM91SGw5vZa
         OXuT254k3dNSl6rVoJk0PuH4kTpkYA4TZ89sCV0cZVCCSMU3k/9vLxOAGaZtqKo0x2Rt
         c3DUorYK3VtrLLGzRDn9WADGXMDtWPCuqqhHvAZ3eYcyQdSSabbmag5XSDKaLWbvr9ja
         Waa+dfKp8Rfnexs6b9yjhsQLRgzLuKpCJIbY14v7HGPlZajDYdkGqKjXrEMjIC/2kvkP
         gnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911951; x=1794516751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZsGYkHSaF8D1INVVG7IqcJD0MRHplG6cSUzvau3umEk=;
        b=McHVaPO9NAIBKuAhQWKN/C3yqjRiSHo51mQb5tflfkEZCWEFL+TiZbBIh8uwnl5j6g
         V8fx8uzaSkitMeDzdch/rpLlAYLrID8uI9XKRXfitCk6sK2JW+8gJ5/sKsVtzsXlIu7w
         2vIg442D2xrjMoyhhFvX5HvQ4KQq6TM4lXOOf+vK2r4FkBXEDJtWsA1lE8+YveA/EUhu
         dekvCak/Zm9M91v+T/KFMidC8iKsJ4x/IgFVPnoZuUA8deAAUlcLol0uB5PpX7gyynim
         0OVxcRQgqdbyb/9lm8dibzeUzDj3T+0M8dIBp/1zuLnNMUaw8g4zqKo+9MVLj7YCBY/e
         pGMg==
X-Gm-Message-State: APuU4Z9g2lG2HJuUL6ZUBfgRC0OjHowBE72WAQou24YIjh7fEgb1L5Ej
	4y/HWBRlOg34oTFwsfjqlWvDvuFtKtfj3cmeKTPrsIdb0l39bMt/2X2k
X-Gm-Gg: AYBFou3Ys0JD+qKydCk1MvYPQXkOXuyS4l+zQH10xmLSzTFKrdlqLybdiXZ3zDR4ggX
	7N6k96FXakouRytdtsvzBmmEAoj+dnZ/ercjusnebFVgMNIXr2Gt5BFiy3E8rn6dg0utzqXf1UF
	FXkisXoowHp9oUzOSNh3DElKSHlxz5tpadROE2MWFQ6h/edWv5oDKPyJQVB1x26quBGNVqSEvPa
	AWktAy2Yao+BYkiaDouQYDSunT3bpmUUmuHxEeEJN8aelMJWmJbAB/vkWsD1BBzb5P1KzNugj54
	U3pSJVkVGi7eBzmAIbcDl8J5T3FivcvPza8lqdz6BQCzqW5lvmwwaKpQyONHv91BZsb+2cZfPsD
	8ofNZCQM8jZn/5CYn7XyilCWujy6KlLn2jjVm3SR068mPMx+qF0N6oIr9xGV0rByqMgixVyWAno
	UsOtosEn12IImvemINp49u43ojv3+HtxgRTgyWChbWtI+cyNTyBGPvYwwwku8ijGVYQOzvpFe14
	kcG7k9mZJJqvuUd2hDJSCkO9ytjJ2fsGcy/gQaXpFXZmePGgDUZ1Jg+E9gVzbu0kxXnOiFZpLqG
	PSBxp7hCYRIC6Tmm3RyuulyXTduaXhxPtqJ6HhCqL14Iap53JJBOV9y0rSoJC5NUxcsPvzR7Iis
	e2gbnWbLIHAOj0dxVGMVkRzO+WdBVtHlmYnYVIkHa+tOik93UVN9u4JLQxIqYXNiLrn8UkJdK8Z
	TSbW3ACkw+i/5fejXGCXT3lgjEM+awD5hl7nCZCxbKHIMAXI4AAdY=
X-Received: by 2002:a05:6830:4c03:b0:81d:54f9:d6a3 with SMTP id 46e09a7af769-85f1ce073bfmr525242a34.4.1793911950589;
        Thu, 05 Nov 2026 12:52:30 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 13:52:10 -0700
Subject: [PATCH v8 09/11] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner A523
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
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-9-14024d2b184b@gmail.com>
References: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
In-Reply-To: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
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

The A523 UART integration has different FIFO depths across its controllers
and reports each controller's depth in the FIFO Clock Control register.
The receive thresholds follow the standard DesignWare FIFO-relative
mapping, while the optional-register layout differs from the generic
DesignWare integration.

Add a compatible for this integration, also used by A527 and T527, with
snps,dw-apb-uart as a fallback.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index fc1289073241..ea6ce99178e3 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -61,6 +61,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun50i-h616-uart
+              - allwinner,sun55i-a523-uart
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart

-- 
2.53.0

