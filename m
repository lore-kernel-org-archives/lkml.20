Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280402;
	b=Yo4US8xknSNnQ91Q1iuUb/Q3KBKycjCFie6R6j9XySx0Tlq5nyKz0OE1vp8JT0P5gHjR
	 +o2h6gN0EgsBkBNAGPw5TjIDV3ZhmHzlT0UVb1F+wVls3Qk3lVIDLDjAw310k2XkzoN0A
	 +XHmGQ8tC8qNwXG2Rh/+oZcgZdGT3WwqUS6jswVBN4IokglNFQBFnKxd4GNtp6GpJT+Ty
	 2bM7Ku4UUnJfps91j/nkb3HjVCJoWOjqwn5Sj2ICkpEKvuiqVI2MEkaTn23WCZAXBZHpf
	 cLGka3l/hBEhxMg/1Cg+7+7GvX6HGy/X/zyootBBbor584WaN1uhPPTqlx4J3mka5MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
	b=EOfaAPyaokNXG3VnaUigNy7U9CvrqzWP8PcJ9idquEqjR8T3cmSTXdb//WXmxDOlZlDH
	 t385DS4XwZDZshS23ro0iI/wghscoVWRS63/VnSZfWC6M0CP6/TIJ6sgwMZqFw1cigHs4
	 GtaCD0KwTkKxGwHR/c98qplTCYRmmzsJXLO2aZZGT8YKAbi9rb9keJ7HsjIndlTjPlJ08
	 GOdPzvYShhjZ9T+65A57Sy5wwZ9euAE6BBX6ZBvUNkg+ySY8Hh40gAJ7i6xBgWDVmXfWn
	 PJYmhhrb/bkSp6NmYQ7EaFg+YTKNr5jrmd/jhr8PahzbNd7ep0gRgOfBNPEDlBsHHag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CIauULyg;
	arc=none smtp.remote-ip=209.85.167.182
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B20606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:13:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6B20606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CIauULyg
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-5641f26ce05so605116b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280401; x=1794885201; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=CIauULygZfljXukESwE5jALaNge3AATaYppoyOgZVuOx3CANr1AehvPGSWNFAzkYrt
         Wu493qoTV9jf4V+6gj81+dibzaE8I8XQ6BHVtA8Hq/S1nERFXQ6QemRVjXsIt3Frd3u6
         uwxscZYSnnl8LtPa4lwC5Jw2YE/S1k3HVSARy3a0Y3xE+jVNuOoF7iKWn5LgwA1MPkY6
         bCUKyDA2x3M5fdEnf0Q7oeUxsl2VkdMAgVK3hmt9aj5znY2hBC0QuOLAHmpM8xeJUAqT
         9of93ki6j2XTZLuoFc57Mx/AvnelSAkPXzvF0HhOijWwJuPjIDuITv3H+IywDz1/OjeX
         ggBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280401; x=1794885201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=gZ45pPUnpt5J8SvhQSNSX2vTHRs1A3RW6ZgZ1S6mZHMkLTVWQGsNdAo0yBv5amKyVq
         tZlHxMwHrFS6T4ZYt/dB1Z96Txb3EgGddzcBngwRkB59Jeg+PjFiYIkhWkuAOTXz0Vs4
         j41E76SF+Wh52iFmaWAiXY/ZVQIRd2SYoGzPzmw6UwocpU7Ks5zl2vr1c2yDF+dSpeZT
         Evku853w3bTvQbgM8/a66ymI6ZV9f1ySt7bhN7+ZcDf2fURAAneVjcK+qk85eAdB5+hl
         ciP4WKWImqb7H3i9AhttHpcsgh0VoKAzMMqmCYrXEjZMoxMyGgDfOsM5ietkKd89Y9fh
         Oz7w==
X-Gm-Message-State: APuU4Z/vCo0yeU+juIfyO70ZZu/SU4aLmFbuP+gc+2PbGGVUN8aSM0ED
	IpbsO6/QlsFDydKhtwa3vBJUor45vi9V15kcmAmRRujzIIvEpSGtAZAr
X-Gm-Gg: AYBFou3jpr3FhfymKWOH9tbvzVeUf+yHZW3ib5tJRaI+ad7/ANL3ptW3Zrn5NqDtfFn
	Kt1gwV2xhtfMmNEcBHHZhvsEHeTXOdGz9yApGyYLrSMkE2pxf0eRjnq+AQXs/Qr5+TZLDLJSuSm
	R0/aNxU0jC6/x2745EIizhtQtBKbhO++5mgDehxWaHmhzEprblSoCIWgM5iyig5D7lKg3Jmd98M
	c4ZiPWNWOOyWA2QYeXYqeznhZ92NVv1DJKG918lm6TeYjmqHDpd7Z9ul06CTmYoZxIrTjMYD7tI
	vkLFhTx3Mlz8Dx53khmRl7AXkhnNWubvPpOcbrEsZE7ISzSKL3aJ67qtEc1VWu0794nwIjwOZm4
	97g4mQ2iJw6TsFwUCbkIahCvuthCS7cF6MobeAsLhGkfN86bmrckJLna29RTzLGGpdIYOR15DTh
	gzY7HUfEio6RZdn7PNW+RG28qT7QHL89ug+qf9NVSNa2rlTAAY6DMel6HFsL1A4i5gO++XaVLkq
	5YBtGbyA3Uxlp28DatC0CXbmudTn9+Dcq98XR7y/IXzKV6ijP/wnxMVQ4h3q5TjgqvA22BceFSY
	HoQ3Ap3hb3bAkr+REwfBizJ9WGkGJdioUusXKMrwtON30lkOXLRGUxBx/ICdWn6xkokqYgcOmNX
	ztT/2aZQQBxtNkufdFSnOXbY494QrkCzSFtDKvjLi5a6832aU81aUiBpc4f9xE6j5KX81ThxiD6
	g7Bjj/QLWEnamwQDh/9nmgmd7vdZ9epB9o1MRBC4OyAH4Pj12GqUA8
X-Received: by 2002:a05:6808:1303:b0:55c:836:5955 with SMTP id 5614622812f47-5683ca2f716mr1299570b6e.44.1794280400815;
        Mon, 09 Nov 2026 19:13:20 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:12:56 -0700
Subject: [PATCH v9 07/11] dt-bindings: serial: snps-dw-apb-uart: add
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
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-7-3f03961dae8a@gmail.com>
References: <20261109-submit-h616-uart-fifo-v1-v9-0-3f03961dae8a@gmail.com>
In-Reply-To: <20261109-submit-h616-uart-fifo-v1-v9-0-3f03961dae8a@gmail.com>
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

